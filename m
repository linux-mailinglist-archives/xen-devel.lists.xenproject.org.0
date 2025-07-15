Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 336DAB054AE
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 10:21:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043752.1413777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubav7-0002s3-Tv; Tue, 15 Jul 2025 08:21:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043752.1413777; Tue, 15 Jul 2025 08:21:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubav7-0002qV-RA; Tue, 15 Jul 2025 08:21:49 +0000
Received: by outflank-mailman (input) for mailman id 1043752;
 Tue, 15 Jul 2025 08:21:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FccZ=Z4=bounce.vates.tech=bounce-md_30504962.68760f94.v1-3c978895f98640c38ccddc76db2f2c91@srs-se1.protection.inumbo.net>)
 id 1ubav5-00023a-Ss
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 08:21:47 +0000
Received: from mail179-35.suw41.mandrillapp.com
 (mail179-35.suw41.mandrillapp.com [198.2.179.35])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc79b5ac-6154-11f0-b894-0df219b8e170;
 Tue, 15 Jul 2025 10:21:42 +0200 (CEST)
Received: from pmta12.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail179-35.suw41.mandrillapp.com (Mailchimp) with ESMTP id
 4bhBx05r7LzDRN1rs
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jul 2025 08:21:40 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 3c978895f98640c38ccddc76db2f2c91; Tue, 15 Jul 2025 08:21:40 +0000
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
X-Inumbo-ID: bc79b5ac-6154-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1752567700; x=1752837700;
	bh=WgWNpOczpRYUm8deR/+2vi7nmeNnsXauipQ/wIXSE7Y=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=DVdZCwc4PSCVMkGmL963chmKwsOP5JvcNGsUtUrRUxF5pSRk93Q8ZAPhqWelKkFgW
	 as1q/tMNuSjaPGahoWHsbBsqGPO46w0L950wtgcHHZ75kkfSi4u1rziRXxnAuFVkyX
	 By/C8O6KZHgSuigIp8p5fMUfoBWB//VaL0bBzA30CgA/paM9XQM7PM6IAfTjblzmC1
	 Xwgflgoyax2tfst+J2YYky4LmZyOW+2xsQ0ArLm5bPFAOP2+bu1yePkpG07W/hq3nx
	 u0a+pN6Bz++/N0TtSCUNcPhpD+rt8wxfhFh+K+W9ujkr3hcaydxDIsFtEaPs78IrZi
	 xji/cxzx+XmkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1752567700; x=1752828200; i=anthoine.bourgeois@vates.tech;
	bh=WgWNpOczpRYUm8deR/+2vi7nmeNnsXauipQ/wIXSE7Y=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=mU6qDYv6NXSuXUQyhxzgCD/CMg/BWxuY+DRj5Hi6bMRRFOEh/mRKgutlYo5LzzmOk
	 rgViTnHGqAhyjc1ARGZm8cICuQhIVdZDewTkwEf4nxnUQPBRw4VZXcdgjDSnxCjV1O
	 p6IYr4OxMMNrmhpFyWUu/oBxKdBsLbAPOMvbsoLLbv3OPuaSOthTGklB3fCNucxXzF
	 5CZd7WBwAAr7tC0BJn0z6AA8LpQM9YGgCRVXzEE+dugi7OpsiBrMBqadrIzzJq2tu5
	 JKgtFHA3Oxj5yn+a/b+ov/FQHZWuOghGfpUCiEGFnVzCP6Lt0OmvRjmpOxp+n5CXP8
	 9P0+el6y7LgAA==
From: "Anthoine Bourgeois" <anthoine.bourgeois@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20xen/netfront:=20Fix=20TX=20response=20spurious=20interrupts?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1752567699788
To: "Elliott Mitchell" <ehem+xen@m5p.com>
Cc: "Juergen Gross" <jgross@suse.com>, xen-devel@lists.xenproject.org, "Stefano Stabellini" <sstabellini@kernel.org>, "Oleksandr Tyshchenko" <oleksandr_tyshchenko@epam.com>
Message-Id: <aHYPktKlOyFJ49bb@mail.vates.tech>
References: <20250710161029.3773630-1-anthoine.bourgeois@vates.tech> <d2c05c2b-ee50-4121-bedd-17ec6bcfa75f@suse.com> <aHSth3FOCpiRRfwv@mail.vates.tech> <aHWi3ncNrVBO6jrh@mattapan.m5p.com>
In-Reply-To: <aHWi3ncNrVBO6jrh@mattapan.m5p.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.3c978895f98640c38ccddc76db2f2c91?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250715:md
Date: Tue, 15 Jul 2025 08:21:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Mon, Jul 14, 2025 at 05:37:51PM -0700, Elliott Mitchell wrote:
>On Mon, Jul 14, 2025 at 07:11:06AM +0000, Anthoine Bourgeois wrote:
>> On Fri, Jul 11, 2025 at 05:33:43PM +0200, Juergen Gross wrote:
>> >On 10.07.25 18:11, Anthoine Bourgeois wrote:
>
>Tested on a VM which this could be tried on.
>
>Booting was successful, network appeared to function as it had been.
>Spurious events continued to occur at roughly the same interval they had
>been.
>
>I can well believe this increases Xen network performance and may
>reduce the occurrence of spurious interrupts, but it certainly doesn't
>fully fix the problem(s).  Appears you're going to need to keep digging.
>
>I believe this does count as Tested-by since I observed no new ill
>effects.  Just the existing ill effects aren't fully solved.
>

Thank you for the test!
Could you send me the domU/dom0 kernel version and xen version ?

Regards,
Anthoine


Anthoine Bourgeois | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


