Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4648D4571CE
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 16:40:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228099.394622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo5zX-0005DS-V2; Fri, 19 Nov 2021 15:39:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228099.394622; Fri, 19 Nov 2021 15:39:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo5zX-0005B8-Rb; Fri, 19 Nov 2021 15:39:55 +0000
Received: by outflank-mailman (input) for mailman id 228099;
 Fri, 19 Nov 2021 15:39:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Hp3=QG=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mo5zW-0004yy-Ib
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 15:39:54 +0000
Received: from ppsw-42.csi.cam.ac.uk (ppsw-42.csi.cam.ac.uk [131.111.8.142])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef0fa8ad-494e-11ec-9787-a32c541c8605;
 Fri, 19 Nov 2021 16:39:53 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:60456)
 by ppsw-42.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mo5zS-000i9P-8f (Exim 4.95) (return-path <amc96@srcf.net>);
 Fri, 19 Nov 2021 15:39:50 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 71F851FB23;
 Fri, 19 Nov 2021 15:39:50 +0000 (GMT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: ef0fa8ad-494e-11ec-9787-a32c541c8605
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <099d9fdc-6ea5-d6ba-6ca9-62e724ec376f@srcf.net>
Date: Fri, 19 Nov 2021 15:39:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Content-Language: en-GB
To: Ian Jackson <iwj@xenproject.org>, xen-devel@lists.xenproject.org
Cc: committers@xenproject.org
References: <24983.49015.777430.780265@mariner.uk.xensource.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: Xen 4.16 development update - tree status
In-Reply-To: <24983.49015.777430.780265@mariner.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/11/2021 15:15, Ian Jackson wrote:
> Open issues and potential blockers
> ==================================
>
> I am aware of three issues for which I don't know the current
> disposition:
>
> * "x86/IOMMU: enabled / intremap handling"
>   3/3 "AMD/IOMMU: iommu_enable vs iommu_intremap"
>   Last I heard this was being reworked.

Some of this has been committed, and has fixed the regression I reported.

One part is quite risky, and not a regression fix (Xen has been broken
for years and years here).  I suggest deferring that part to 4.17.

I'm not aware of further actions required on this task for 4.16.

> * I have a note "HPET regression".  There have been number of patches in
>   this area.  Most recently,
>   "x86/hpet: setup HPET even when disabled due to stopping in deep C states"

This regression has been fixed too.  The bugfix got in ahead of RC1.

> * "x86/viridian: EOI MSR should always happen in affected vCPU context"
>   Jan mentioned this on IRC but I don't see any discussion of it in
>   my mailbox.
>
> The last two were mentioned in my last release update, but I don't
> seem to find any definitive conclusion.  x86 maintainers, can you
> please confirm ?

There is not consensus on whether the change is correct, although I
admit it had fallen off my radar.

All it is doing is introducing two ASSERT_UNREACHABLE()'s.  It's not
critical for 4.16 at this point.

~Andrew

