Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E5FAD7020
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 14:21:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1013015.1391549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPgw8-0004cu-28; Thu, 12 Jun 2025 12:21:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1013015.1391549; Thu, 12 Jun 2025 12:21:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPgw7-0004aE-VU; Thu, 12 Jun 2025 12:21:39 +0000
Received: by outflank-mailman (input) for mailman id 1013015;
 Thu, 12 Jun 2025 12:21:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1+JJ=Y3=bounce.vates.tech=bounce-md_30504962.684ac64f.v1-4e83af7ff17e4e6db7624276829d52af@srs-se1.protection.inumbo.net>)
 id 1uPgw6-0004a8-At
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 12:21:38 +0000
Received: from mail132-4.atl131.mandrillapp.com
 (mail132-4.atl131.mandrillapp.com [198.2.132.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c8be276b-4787-11f0-a309-13f23c93f187;
 Thu, 12 Jun 2025 14:21:37 +0200 (CEST)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-4.atl131.mandrillapp.com (Mailchimp) with ESMTP id 4bJ1q34ljhzlfkpx
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jun 2025 12:21:35 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 4e83af7ff17e4e6db7624276829d52af; Thu, 12 Jun 2025 12:21:35 +0000
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
X-Inumbo-ID: c8be276b-4787-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1749730895; x=1750000895;
	bh=HwexYdTNS3S6mzkG6V9I7/VYYo1D50L4FigEzg1yUPU=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=M6LJK8UvjW8H4woLlThva69Ir++uxIqPiQJG106oUVBO+yJg7kp4cNbffH86oFJs7
	 eLyhnEotiuYGXT0UkFP2y7TIA9lzOsNT8qf6xQ+iX5PulmCp2cmh6PrW55adWBDpTq
	 meP6507aY7fRuyw7J3pA1H6lNsijqIBPTKzShwpTKCctj7itbkHqjeimpTvHLlNIr6
	 OKa13zdqRsBzBxjRJhqPD2IWf6/VU3OBkeNQO8t2nCrOAUC9be99V+yrkqzOHIpJx9
	 DcslkWIrT1p4oxnpe9dMg60oiCN7VsGgCQTcEa9jHB7WCaDHuzG0VOwXqw1+vxEhFt
	 pwYiKf4XxsOIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1749730895; x=1749991395; i=teddy.astie@vates.tech;
	bh=HwexYdTNS3S6mzkG6V9I7/VYYo1D50L4FigEzg1yUPU=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=EoH3f19nhFg/QcLsBsc+4Tu5PC+pGWFx53n+czMa18qi24jqhhP96/GV+8ybUi7Vs
	 jCkD5YiIiQ2mi3TdjCIaTDCAQs8dY0JGgfoYYI3RImPFJwaXESg3sSeb2WWHDpMgLn
	 dKRtGkl+u+3p4QupXGsbPEzeyKQKBW1ilTM3tY6AuzR80mi6BbWMjYS2KJvETpc0TT
	 hlSoDxHJO3mVIvS9ZYtgubkU4UvubGmHk0phtKp3wl86zo5RVPgElBJKUjUfl+mMOP
	 bABIpOVZJah4dvGfECsr4Pm+oAhy3bC0p9L+SMyV2u/YRvf02F45HIhf7cegVXYnuK
	 3qez5g+Jls+Hw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20docs:=20UEFI=20Secure=20Boot=20security=20policy?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1749730893647
Message-Id: <d29861f0-2ea8-4519-8c39-3643bc027578@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>
Cc: "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Juergen Gross" <jgross@suse.com>, "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>, "Trammell Hudson" <hudson@trmm.net>, "Ross Lagerwall" <ross.lagerwall@cloud.com>, "Frediano Ziglio" <frediano.ziglio@cloud.com>, "Gerald Elder-Vass" <gerald.elder-vass@cloud.com>, "Kevin Lampis" <kevin.lampis@cloud.com>, Xen-devel <xen-devel@lists.xenproject.org>, "Samuel Verschelde" <samuel.verschelde@vates.tech>
References: <20250611235851.167385-1-andrew.cooper3@citrix.com> <5aad2d39-31e1-44c6-b167-a3275dc6b747@suse.com>
In-Reply-To: <5aad2d39-31e1-44c6-b167-a3275dc6b747@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.4e83af7ff17e4e6db7624276829d52af?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250612:md
Date: Thu, 12 Jun 2025 12:21:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 12/06/2025 =C3=A0 12:08, Jan Beulich a =C3=A9crit=C2=A0:
> On 12.06.2025 01:58, Andrew Cooper wrote:
>> +
>> +Lockdown Mode
>> +^^^^^^^^^^^^^
>> +
>> +A mode which causes the enforcement of the properties necessary to conf=
orm to
>> +the Secure Boot specification.  Lockdown Mode is forced active when Sec=
ure
>> +Boot is active in the platform, but may be activated independently too =
for
>> +development purposes with the ``lockdown`` command line option.
>> +
>> +TODO
>> +^^^^
>> +
>> + * Command Line
>> + * Livepatching
>> + * Kexec
>> + * Userspace hypercalls
> 
> What about Dom0 being able to access almost(?) all memory, including all =
MMIO?
> In this context, isn't iommu=3Ddom0-strict a requirement for SB (while th=
at's
> still not the default mode of operation for PV Dom0, despite me keeping t=
o
> suggest that we ought to change that default)?
> 

Unless I missed something, the kernel is not a part of the TCB in this 
Secure Boot model. But at some point, we definitely want to reduce the 
TCB to just Xen, and put a more limited trust on the control domains.

Yet, the current plan of hardening the privcmd device is going to be 
very hard for sure.

dom0-iommu=3Dstrict is a good mitigations in case untrusted parties of the 
dom0 get direct access to a devices. However, as it is now, it implies a 
IOTLB flush for each grant mapping done, which severely impede PV 
performance (PV-IOMMU patches can help solving this performance problem 
though).

Teddy


Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



