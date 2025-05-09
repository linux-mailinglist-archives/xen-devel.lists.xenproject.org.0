Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9454BAB1FD5
	for <lists+xen-devel@lfdr.de>; Sat, 10 May 2025 00:16:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.980445.1366904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDW1A-00019t-Sd; Fri, 09 May 2025 22:16:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 980445.1366904; Fri, 09 May 2025 22:16:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDW1A-00018R-Po; Fri, 09 May 2025 22:16:32 +0000
Received: by outflank-mailman (input) for mailman id 980445;
 Fri, 09 May 2025 22:16:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bQVm=XZ=bounce.vates.tech=bounce-md_30504962.681e7eb9.v1-3226c0e946ab49dfb8d82f95890561d3@srs-se1.protection.inumbo.net>)
 id 1uDW1A-0000We-6A
 for xen-devel@lists.xenproject.org; Fri, 09 May 2025 22:16:32 +0000
Received: from mail187-10.suw11.mandrillapp.com
 (mail187-10.suw11.mandrillapp.com [198.2.187.10])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f8c0a6a-2d23-11f0-9ffb-bf95429c2676;
 Sat, 10 May 2025 00:16:27 +0200 (CEST)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-10.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4ZvNd54FJ6z5QkLg3
 for <xen-devel@lists.xenproject.org>; Fri,  9 May 2025 22:16:25 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 3226c0e946ab49dfb8d82f95890561d3; Fri, 09 May 2025 22:16:25 +0000
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
X-Inumbo-ID: 3f8c0a6a-2d23-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1746828985; x=1747098985;
	bh=OXsoqPwyut9I+YFQikpK6g6RfD5Cgj76YWmrM/Yc3gI=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=pgIEIgMBZIa7uQEilLYAxhZY6YFl9aW1MyUZGJb1rfsyNzRfLK/DIsyRlRWwaiYfe
	 XMQnZBrjCMSjw3aD74p5EUYytDmy323/0+SohfAMeujnV7nA8QDgRqtTb02hok4qN0
	 /zxbq5RNYFQnE+btpUuWk/fmMlzrL6CQjeEQbxtWMDfKwj6y2rKUI0RsMVWgNve4O3
	 ezboqig7TKV6uh1jS7mk1L2MJtea3+v49yrW3YS4SbokR1RSJGTtoD4VelycZAj5MW
	 DQozc6oSHjc4iY5z71S+y6GbRi3uIfy/QiGu9qyoJpZXZzJs3A3LuysRJ5ThgvEoMO
	 QY/lOxqXUonVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1746828985; x=1747089485; i=teddy.astie@vates.tech;
	bh=OXsoqPwyut9I+YFQikpK6g6RfD5Cgj76YWmrM/Yc3gI=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=bvEMRYf3riY++iA5uqnoEp74RlAMv7L5w9Ekk7Klkg8EmQFblSSwZ1pbcImskLaPj
	 NTN8g9iHX1T8Y7+qVMf9CupZ/d9J9Hv0U3la+3FPVsYj+ZET/zJ+SAGik8prk/awbE
	 ZriEuFR8wcM5Ml3UspTGSpzG4+YFACBKmgbTeye90izqU3U7jL+Nbcwucur/rsi+Ga
	 dsvqDBeRlJ+jJmn2pZEOoKfDbhxgrVFPE+x3vhdI20CNn7cxtu/lOi4yl7byj4LORT
	 gzir7P/kxEQXgN0FdbOKyQLx/8hinzqoYnfWgCHni3bro6qzMFsw/Wht3gay386jOF
	 7RZW1DgbjCQpg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20xen/x86:=20allow=20Dom0=20PVH=20to=20call=20XENMEM=5Fexchange?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1746828983691
Message-Id: <f49f95ed-81f2-45f5-a5e6-26df1c32ee57@vates.tech>
To: "Stefano Stabellini" <sstabellini@kernel.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Cc: "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>, "Jan Beulich" <jbeulich@suse.com>, "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, jason.andryuk@amd.com, agarciav@amd.com, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2504251314050.785180@ubuntu-linux-20-04-desktop> <19d9aec4-c21a-47a9-9c58-6bfcadbd22e0@suse.com> <alpine.DEB.2.22.394.2504281242240.785180@ubuntu-linux-20-04-desktop> <aBiVkw2SXJHxpieh@mail-itl> <aBjLoM_ttxqftzlp@macbook.lan> <alpine.DEB.2.22.394.2505051100050.3879245@ubuntu-linux-20-04-desktop> <aBnOQyXSz-j33Wux@macbook.lan> <alpine.DEB.2.22.394.2505061658330.3879245@ubuntu-linux-20-04-desktop> <aBx1gv6BXhZ0pSYt@macbook.lan> <alpine.DEB.2.22.394.2505081617080.3879245@ubuntu-linux-20-04-desktop> <aB29o70zT_jUjdQv@macbook.lan> <alpine.DEB.2.22.394.2505091401330.3879245@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2505091401330.3879245@ubuntu-linux-20-04-desktop>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.3226c0e946ab49dfb8d82f95890561d3?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250509:md
Date: Fri, 09 May 2025 22:16:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 09/05/2025 =C3=A0 23:13, Stefano Stabellini a =C3=A9crit=C2=A0:
> On Fri, 9 May 2025, Roger Pau Monn=C3=A9 wrote:
>> On Thu, May 08, 2025 at 04:25:28PM -0700, Stefano Stabellini wrote:
>>> On Thu, 8 May 2025, Roger Pau Monn=C3=A9 wrote:
>>>> On Wed, May 07, 2025 at 04:02:11PM -0700, Stefano Stabellini wrote:
>>>>> On Tue, 6 May 2025, Roger Pau Monn=C3=A9 wrote:
>>>>>> On Mon, May 05, 2025 at 11:11:10AM -0700, Stefano Stabellini wrote:
>>>>>>> On Mon, 5 May 2025, Roger Pau Monn=C3=A9 wrote:
>>>>>>>> On Mon, May 05, 2025 at 12:40:18PM +0200, Marek Marczykowski-G=C3=
=B3recki wrote:
>>>>>>>>> On Mon, Apr 28, 2025 at 01:00:01PM -0700, Stefano Stabellini wrot=
e:
>>>>>>>>>> On Mon, 28 Apr 2025, Jan Beulich wrote:
>>>>>>>>>>> On 25.04.2025 22:19, Stefano Stabellini wrote:
>>>>>>>>>>>> From: Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>
>>>>>>>>>>>>
>>>>>>>>>>>> Dom0 PVH might need XENMEM_exchange when passing contiguous me=
mory
>>>>>>>>>>>> addresses to firmware or co-processors not behind an IOMMU.
>>>>>>>>>>>
>>>>>>>>>>> I definitely don't understand the firmware part: It's subject t=
o the
>>>>>>>>>>> same transparent P2M translations as the rest of the VM; it's j=
ust
>>>>>>>>>>> another piece of software running there.
>>>>>>>>>>>
>>>>>>>>>>> "Co-processors not behind an IOMMU" is also interesting; a more
>>>>>>>>>>> concrete scenario might be nice, yet I realize you may be limit=
ed in
>>>>>>>>>>> what you're allowed to say.
>>>>>>>>>>
>>>>>>>>>> Sure. On AMD x86 platforms there is a co-processor called PSP ru=
nning
>>>>>>>>>> TEE firmware. The PSP is not behind an IOMMU. Dom0 needs occasio=
nally to
>>>>>>>>>> pass addresses to it.  See drivers/tee/amdtee/ and
>>>>>>>>>> include/linux/psp-tee.h in Linux.
>>>>>>>>>
>>>>>>>>> We had (have?) similar issue with amdgpu (for integrated graphics=
) - it
>>>>>>>>> uses PSP for loading its firmware. With PV dom0 there is a workar=
ound as
>>>>>>>>> dom0 kinda knows MFN. I haven't tried PVH dom0 on such system yet=
, but I
>>>>>>>>> expect troubles (BTW, hw1 aka zen2 gitlab runner has amdgpu, and =
it's
>>>>>>>>> the one I used for debugging this issue).
>>>>>>>>
>>>>>>>> That's ugly, and problematic when used in conjunction with AMD-SEV=
.
>>>>>>>>
>>>>>>>> I wonder if Xen could emulate/mediate some parts of the PSP for do=
m0
>>>>>>>> to use, while allowing Xen to be the sole owner of the device.  Ha=
ving
>>>>>>>> both Xen and dom0 use it (for different purposes) seems like askin=
g
>>>>>>>> for trouble.  But I also have no idea how complex the PSP interfac=
e
>>>>>>>> is, neither whether it would be feasible to emulate the
>>>>>>>> interfaces/registers needed for firmware loading.
>>>>>>>
>>>>>>> Let me take a step back from the PSP for a moment. I am not opposed=
 to a
>>>>>>> PSP mediator in Xen, but I want to emphasize that the issue is more
>>>>>>> general and extends well beyond the PSP.
>>>>>>>
>>>>>>> In my years working in embedded systems, I have consistently seen c=
ases
>>>>>>> where Dom0 needs to communicate with something that does not go thr=
ough
>>>>>>> the IOMMU. This could be due to special firmware on a co-processor,=
 a
>>>>>>> hardware erratum that prevents proper IOMMU usage, or a high-bandwi=
dth
>>>>>>> device that technically supports the IOMMU but performs poorly unle=
ss
>>>>>>> the IOMMU is disabled. All of these are real-world examples that I =
have
>>>>>>> seen personally.
>>>>>>
>>>>>> I wouldn't be surprised, classic PV dom0 avoided those issues becaus=
e
>>>>>> it was dealing directly with host addresses (mfns), but that's not t=
he
>>>>>> case with PVH dom0.
>>>>>
>>>>> Yeah
>>>>>
>>>>>
>>>>>>> In my opinion, we definitely need a solution like this patch for Do=
m0
>>>>>>> PVH to function correctly in all scenarios.
>>>>>>
>>>>>> I'm not opposed to having such interface available for PVH hardware
>>>>>> domains.  I find it ugly, but I don't see much other way to deal wit=
h
>>>>>> those kind of "devices".  Xen mediating accesses for each one of the=
m
>>>>>> is unlikely to be doable.
>>>>>>
>>>>>> How do you hook this exchange interface into Linux to differentiate
>>>>>> which drivers need to use mfns when interacting with the hardware?
>>>>>
>>>>> In the specific case we have at hands the driver is in Linux userspac=
e
>>>>> and is specially-written for our use case. It is not generic, so we
>>>>> don't have this problem. But your question is valid.
>>>>
>>>> Oh, so you then have some kind of ioctl interface that does the memory
>>>> exchange and bouncing inside of the kernel on behalf of the user-space
>>>> side I would think?
>>>
>>> I am not sure... Xenia might know more than me here.
>>
>> One further question I have regarding this approach: have you
>> considered just populating an empty p2m space with contiguous physical
>> memory instead of exchanging an existing area?  That would increase
>> dom0 memory usage, but would prevent super page shattering in the p2m.
>> You could use a dom0_mem=3DX,max:X+Y command line option, where Y
>> would be your extra room for swiotlb-xen bouncing usage.
>>
>> XENMEM_increase_reservation documentation notes such hypercall already
>> returns the base MFN of the allocated page (see comment in
>> xen_memory_reservation struct declaration).
>   
> XENMEM_exchange is the way it has been implemented traditionally in
> Linux swiotlb-xen (it has been years). But your idea is good.
> 
> Another, more drastic, idea would be to attempt to map Dom0 PVH memory
> 1:1 at domain creation time like we do on ARM. If not all of it, as much
> as possible. That would resolve the problem very efficiently. We could
> communicate to Dom0 PVH the range that is 1:1 in one of the initial data
> structures, and that would be the end of it.
> 

Could that be done by introducing a "fake" reserved region in advance 
(IVMD?) ? Such region are usually mapped to the domain 1:1 in addition 
to be coherent on the IOMMU side (so it doesn't break in case the PSP 
gets IOMMU-aware).

Teddy


 | Vates

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



