Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E30601E7D4E
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 14:33:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeeCU-00031E-1h; Fri, 29 May 2020 12:33:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mY44=7L=hermes.cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1jeeCS-000318-Vq
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 12:33:25 +0000
X-Inumbo-ID: 9684c020-a1a8-11ea-9947-bc764e2007e4
Received: from ppsw-31.csi.cam.ac.uk (unknown [131.111.8.131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9684c020-a1a8-11ea-9947-bc764e2007e4;
 Fri, 29 May 2020 12:33:24 +0000 (UTC)
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Received: from 88-109-182-220.dynamic.dsl.as9105.com ([88.109.182.220]:56560
 helo=[192.168.1.219])
 by ppsw-31.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.157]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1jeeCQ-000LlT-JZ (Exim 4.92.3)
 (return-path <amc96@hermes.cam.ac.uk>); Fri, 29 May 2020 13:33:22 +0100
Subject: Re: [PATCH v10 4/9] x86emul: disable FPU/MMX/SIMD insn emulation when
 !HVM
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d2375ecb-f662-99d8-84c2-e9f9c5cf7b9e@suse.com>
 <a2c36be0-03f0-00ca-33e9-9915773ccb0f@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <bece2101-f760-8a40-a153-e4d23f352a02@citrix.com>
Date: Fri, 29 May 2020 13:33:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <a2c36be0-03f0-00ca-33e9-9915773ccb0f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
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

On 25/05/2020 15:27, Jan Beulich wrote:
> In a pure PV environment (the PV shim in particular) we don't really
> need emulation of all these. To limit #ifdef-ary utilize some of the
> CASE_*() macros we have, by providing variants expanding to
> (effectively) nothing (really a label, which in turn requires passing
> -Wno-unused-label to the compiler when build such configurations).
>
> Due to the mixture of macro and #ifdef use, the placement of some of
> the #ifdef-s is a little arbitrary.
>
> The resulting object file's .text is less than half the size of the
> original, and looks to also be compiling a little more quickly.
>
> This is meant as a first step; more parts can likely be disabled down
> the road.
>
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v7: Integrate into this series. Re-base.
> ---
> I'll be happy to take suggestions allowing to avoid -Wno-unused-label.

I really would prefer the simplified version, which doesn't need
-Wno-unused-label at all.

I specifically don't see a need for these to be selected individually,
and a consequence of that is a vastly simplified patch.

However, to avoid this stalemate, Bregrudingly-acked-by: Andrew Cooper
<andrew.cooper3@citrix.com> if you still insist on taking this route.

