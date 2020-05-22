Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B931DE5B3
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 13:40:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jc62m-0002op-5h; Fri, 22 May 2020 11:40:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hXvX=7E=hermes.cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1jc62l-0002oi-0v
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 11:40:51 +0000
X-Inumbo-ID: 15aec0d6-9c21-11ea-abb5-12813bfff9fa
Received: from ppsw-31.csi.cam.ac.uk (unknown [131.111.8.131])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 15aec0d6-9c21-11ea-abb5-12813bfff9fa;
 Fri, 22 May 2020 11:40:50 +0000 (UTC)
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Received: from 88-109-182-220.dynamic.dsl.as9105.com ([88.109.182.220]:40818
 helo=[192.168.1.219])
 by ppsw-31.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.157]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1jc62g-000gMc-KU (Exim 4.92.3)
 (return-path <amc96@hermes.cam.ac.uk>); Fri, 22 May 2020 12:40:46 +0100
Subject: Re: [PATCH v3 2/5] x86/mm: honor opt_pcid also for 32-bit PV domains
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <3ce4ab2c-8cb6-1482-6ce9-3d5b019e10c1@suse.com>
 <74eb1e77-7445-92fa-25b1-ece1d6699eb9@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <a56bd0b8-0b46-7252-13e1-9acf642b7935@citrix.com>
Date: Fri, 22 May 2020 12:40:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <74eb1e77-7445-92fa-25b1-ece1d6699eb9@suse.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 25/09/2019 16:23, Jan Beulich wrote:
> I can't see any technical or performance reason why we should treat
> 32-bit PV different from 64-bit PV in this regard.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

There are technical reasons, and a very good perf reason not to...

There is no such thing as a user/kernel split for 32bit guests (as
TF_kernel_mode remains set unconditionally), and there is no such thing
as an XPTI split (32bit code can't attack Xen using meltdown).

What you would gain is the perf hit of maintaining unused PCID's worth
of mappings (seeing as INVPCID is horribly expensive even on modern CPUs).

The only way this might not hurt performance is if it was tied to a PV
ABI extension letting 32bit PV guests split their user/kernel mappings
and have Xen handle the transition automatically, at which point a
user/kernel PCID split in Xen would be better than the guest kernel
trying to do KPTI on its own.

~Andrew

