Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A8B1E7F5A
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 15:55:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jefUD-0003lo-8n; Fri, 29 May 2020 13:55:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mY44=7L=hermes.cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1jefUB-0003li-ER
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 13:55:47 +0000
X-Inumbo-ID: 18305b6a-a1b4-11ea-a8be-12813bfff9fa
Received: from ppsw-31.csi.cam.ac.uk (unknown [131.111.8.131])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 18305b6a-a1b4-11ea-a8be-12813bfff9fa;
 Fri, 29 May 2020 13:55:46 +0000 (UTC)
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Received: from 88-109-182-220.dynamic.dsl.as9105.com ([88.109.182.220]:58992
 helo=[192.168.1.219])
 by ppsw-31.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.157]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1jefU8-000BYy-Jy (Exim 4.92.3)
 (return-path <amc96@hermes.cam.ac.uk>); Fri, 29 May 2020 14:55:44 +0100
Subject: Re: [PATCH v10 5/9] x86emul: support MOVDIR{I,64B} insns
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d2375ecb-f662-99d8-84c2-e9f9c5cf7b9e@suse.com>
 <ae7ff12a-edf9-45b5-b7c9-6c5b5d0739c0@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <15b5f062-1911-9561-58b8-78c8027f3a68@citrix.com>
Date: Fri, 29 May 2020 14:55:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <ae7ff12a-edf9-45b5-b7c9-6c5b5d0739c0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 25/05/2020 15:28, Jan Beulich wrote:
> Introduce a new blk() hook, paralleling the rmw() one in a certain way,
> but being intended for larger data sizes, and hence its HVM intermediate
> handling function doesn't fall back to splitting the operation if the
> requested virtual address can't be mapped.
>
> Note that SDM revision 071 doesn't specify exception behavior for
> ModRM.mod == 0b11; assuming #UD here.

Once again - I don't think this wants calling out.  That encoding space
will be used for a new Grp at some point in the future, and be a
different instruction.

>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Paul Durrant <paul@xen.org>

Acked-by: Andrew Cooper <andrew.cooper@citrix.com>, although with one
recommendation...

> --- a/xen/include/public/arch-x86/cpufeatureset.h
> +++ b/xen/include/public/arch-x86/cpufeatureset.h
> @@ -241,6 +241,8 @@ XEN_CPUFEATURE(AVX512_VPOPCNTDQ, 6*32+14
>  XEN_CPUFEATURE(TSXLDTRK,      6*32+16) /*a  TSX load tracking suspend/resume insns */
>  XEN_CPUFEATURE(RDPID,         6*32+22) /*A  RDPID instruction */
>  XEN_CPUFEATURE(CLDEMOTE,      6*32+25) /*A  CLDEMOTE instruction */
> +XEN_CPUFEATURE(MOVDIRI,       6*32+27) /*A  MOVDIRI instruction */
> +XEN_CPUFEATURE(MOVDIR64B,     6*32+28) /*A  MOVDIR64B instruction */

I'd be tempted to leave these as 'a' for now, seeing as we have the ability.

These instructions aren't actually of any use for domains without PCI
devices, and a "default" will be more migrateable as a consequence.

We're going to need further toolstack changes to make CXL-passthrough
viable, so instruction adjustments can be part of that work.

~Andrew

