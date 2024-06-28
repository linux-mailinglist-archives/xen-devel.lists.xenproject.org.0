Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B1891BA8B
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jun 2024 10:58:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.750587.1158709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sN7QP-0007vl-Gg; Fri, 28 Jun 2024 08:57:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 750587.1158709; Fri, 28 Jun 2024 08:57:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sN7QP-0007uH-D7; Fri, 28 Jun 2024 08:57:45 +0000
Received: by outflank-mailman (input) for mailman id 750587;
 Fri, 28 Jun 2024 08:57:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WIe5=N6=bounce.vates.tech=bounce-md_30504962.667e7b03.v1-b7cc5ea0d65f4521929adac485c86e7e@srs-se1.protection.inumbo.net>)
 id 1sN7QN-0007uB-TW
 for xen-devel@lists.xenproject.org; Fri, 28 Jun 2024 08:57:44 +0000
Received: from mail137-26.atl71.mandrillapp.com
 (mail137-26.atl71.mandrillapp.com [198.2.137.26])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79ae42a6-352c-11ef-90a3-e314d9c70b13;
 Fri, 28 Jun 2024 10:57:41 +0200 (CEST)
Received: from pmta07.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail137-26.atl71.mandrillapp.com (Mailchimp) with ESMTP id
 4W9Tpq6YY1zJKFJjK
 for <xen-devel@lists.xenproject.org>; Fri, 28 Jun 2024 08:57:39 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 b7cc5ea0d65f4521929adac485c86e7e; Fri, 28 Jun 2024 08:57:39 +0000
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
X-Inumbo-ID: 79ae42a6-352c-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1719565059; x=1719825559;
	bh=KiLNFTtDxLB0xantCYuVD/eUOVxGvj4f7KYb9gCvsEQ=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=qlDsNMSNpYa2qGfyAZExSwgSaB/PfWbFpQTLOwIz2LHNR1IpVNxAAN9bI95Xk7o7c
	 lecl85tQEAftFmpe4yz73m3sPGkC4FRdpC5pTRTKypuXZ2ml8/SM9uoEmEQoITYaEC
	 VDL5rt2e/2Weni4JcHp4utweuwyyVlzXp4hu3grpE7oUPb4YS1ETL74FzKJ+3YvyEI
	 i2TVUlgAqN9z4MQfyPjvMUyLfUkT5WpZ/AW4R7yJRuhupJ7F6IvJe6Bp9ivgU2rqzj
	 sWHSs5biX7NVmH5RPsPrOyiCb5i9GAbLdXpi9HPMyj3HSv93llmLQKzGjxVr2OBwst
	 YO1Id0ncMqTXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1719565059; x=1719825559; i=teddy.astie@vates.tech;
	bh=KiLNFTtDxLB0xantCYuVD/eUOVxGvj4f7KYb9gCvsEQ=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=IU8FMRWdCo+9cR6GYINicceI2aD49jO15zTeQayjMRG1v0fU+eJPdGcCTQkLzgiet
	 rB/6NamSy9TJHkfIZD9bOyq2CyJHubiFO2ikYIypat8gxjvpGvceCPS5mG06EymBdQ
	 m2+OVxMPJ1km+FIWIpTLKhyt3BrRhTIq2iuqBRG2hxhlq3RwfClM+iW6T4WLaQCoDi
	 JrgO6IRJLuh8Iy8w+ZJ2+MGF9Y2viamElsyR57UBFsXlwBP+KV3IZA+79uIkGKXtcD
	 YQM7aKh8hz5JMLEWAd8jHmtyLy0Xd+n7wag2xiz4UygNH3GOnUOg8WVByhXQLjk5aT
	 QGEUTCFqQNLcg==
From: Teddy Astie <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20Disaggregated=20(Xoar)=20Dom0=20Building?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1719565058890
Message-Id: <3a56d6f7-d19a-4aba-a876-3541d24a2f00@vates.tech>
To: Lonnie <lonnie@outstep.com>
Cc: xen-devel@lists.xenproject.org
References: <48-667d6b00-131-71122080@10350945>
In-Reply-To: <48-667d6b00-131-71122080@10350945>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.b7cc5ea0d65f4521929adac485c86e7e?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240628:md
Date: Fri, 28 Jun 2024 08:57:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Lonnie,

There are dedicated Matrix channels for chat
https://xenproject.org/help/matrix/

Teddy

Le 27/06/2024 =C3=A0 15:38, Lonnie a =C3=A9crit=C2=A0:
> Hi Teddy,
> 
> You are actually on track with what I was thinking in this area which ini=
tially gave me 2 main ideas:
> 
> 1. Take the NOVA Microhypervisor (very small TCB at only 5K LOC) and try =
to get QEMU or Bhyve integrated as the VMM which would require a huge amoun=
t of development time.  The Genode framework has a configuration/compile ap=
proach that uses NOVA with a custom VirtualBox, but I did not want to go th=
at route.
> 
> 2. Take the Alpine XEN distro as the base and then update the dated Xoar =
patches which effectively breaks Dom0 into 9 Service and Driver Mini/Nano V=
Ms for which I was thinking about further setting them up as ultra-thin Uni=
kernels (MirageOS, IncludeOS, etc.) but still researching.
> 
> My effort is to make a purely Ultra-Thin RAM-Based Xen Hypervisor that bo=
ots UEFI for modern systems. Plus a number of other features if all goes we=
ll.
> 
> Your ideas of QEMU as a Unikernel would probably really work for both XEN=
 and NOVA (with a bit of work on the NOVA side). I actually liked NOVA and =
experimented with it a while back being able to produce a very lightweight =
Microhypervisor ISO that would boot and do some simple things and even fire=
 up lightweight Linux instances but with very limited capabilities, of cour=
se, just to see if it worked. Unfortunately, that direction although very i=
nteresting, would definitely take too much development to make a viable and=
 more complete hypervisor.  I did like that you could easily start with no =
VM and easily start one or more and then use Hot-Keys to flip between conso=
les. That was pretty cool and is something that I would like to see about w=
orking into this XEN effort as well maybe some config file in the Xen.efi d=
irectory for that or something but am still thinking about it.
> 
> I think that perhaps the Alpine-XEN-Xoar approach could be benefitual but=
 XEN, plus supporting libraries is still a bit larger than I would have hop=
ed although you get more capabilities and more of a solid hypervisor as wel=
l, I think.  Maybe we can chat more about things if you like.
> 
> Best,
> Lonnie
> On Thursday, June 27, 2024 14:38 CEST, Teddy Astie <teddy.astie@vates.tec=
h> wrote:
> 
>> Hi Lonnie,
>>
>> Le 27/06/2024 =C3=A0 11:33, Lonnie Cumberland a =C3=A9crit=C2=A0:
>>> I am working towards is to have
>>> everything as a RAM-based ultra-lightweight thin hypervisor.=C2=A0=C2=
=A0 I looked
>>> over ACRN, the NOVA Microhypervisor (Headron, Beadrock Udo),
>>> Rust-Shyper, Bareflank-MicroV, and many other development efforts but i=
t
>>> seems that Xen is the most advanced for my purposes here.
>>>
>>
>> You can have a disk-less (or ramdisk based) distro supporting Xen with
>> Alpine Linux (with Xen flavour). It does still use Dom0 with all its
>> responsibilities though.
>>
>>>>> Currently, I am investigating and researching the ideas of
>>>>> "Disaggregating" Dom0 and have the Xoar Xen patches ("Breaking Up is
>>>>> Hard to Do: Security and Functionality in a Commodity Hypervisor"
>>>>> 2011) available which were developed against version 22155 of
>>>>> xen-unstable. The Linux patches are against Linux with pvops
>>>>> 2.6.31.13 and developed on a standard Ubuntu 10.04 install. My effort
>>>>> would also be up update these patches.
>>>>>
>>>>> I have been able to locate the Xen "Dom0 Disaggregation"
>>>>> (https://wiki.xenproject.org/wiki/Dom0_Disaggregation) am reading up
>>>>> on things now but wanted to ask the developers list about any
>>>>> experience you may have had in this area since the research objective
>>>>> is to integrate Xoar with the latest Xen 4.20, if possible, and to
>>>>> take it further to basically eliminate Dom0 all together with
>>>>> individual Mini-OS or Unikernel "Service and Driver VM's" instead
>>>>> that are loaded at UEFI boot time.
>>
>> The latest stuff going on I have in mind regarding this idea of moving
>> stuff out of Dom0 is QEMU as Unikernel (using Unikraft), there were some
>> discussions on this in Matrix and at Xen Summit, and it's currently work
>> in progress from Unikraft side.
>>
>> Teddy
>>
>>
>> Teddy Astie | Vates XCP-ng Intern
>>
>> XCP-ng & Xen Orchestra - Vates solutions
>>
>> web: https://vates.tech
>>
> 


Teddy Astie | Vates XCP-ng Intern

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


