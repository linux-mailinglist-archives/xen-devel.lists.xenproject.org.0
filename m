Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FD8BD6050
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 21:59:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1142489.1476630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8OhX-0007hl-MB; Mon, 13 Oct 2025 19:59:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1142489.1476630; Mon, 13 Oct 2025 19:59:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8OhX-0007eu-JI; Mon, 13 Oct 2025 19:59:23 +0000
Received: by outflank-mailman (input) for mailman id 1142489;
 Mon, 13 Oct 2025 19:59:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=89Az=4W=bounce.vates.tech=bounce-md_30504962.68ed5a13.v1-befd0142d0db4fb593fb0ee72d4ccd67@srs-se1.protection.inumbo.net>)
 id 1v8OhW-0007eo-7t
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 19:59:22 +0000
Received: from mail186-27.suw21.mandrillapp.com
 (mail186-27.suw21.mandrillapp.com [198.2.186.27])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18be1c6c-a86f-11f0-980a-7dc792cee155;
 Mon, 13 Oct 2025 21:59:16 +0200 (CEST)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-27.suw21.mandrillapp.com (Mailchimp) with ESMTP id
 4clp8M1Nzlz6CQ3pX
 for <xen-devel@lists.xenproject.org>; Mon, 13 Oct 2025 19:59:15 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 befd0142d0db4fb593fb0ee72d4ccd67; Mon, 13 Oct 2025 19:59:15 +0000
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
X-Inumbo-ID: 18be1c6c-a86f-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1760385555; x=1760655555;
	bh=TsNqhpdGcI66qgWiAarZQKHcoqZLiR3I42IBZ58Vh/k=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Q6PIwksDMVN0wo6EUoGZwKALhMlT3pioj7TQTTuCozEPMnCZfYy7428gmIhEU5QFr
	 QGBtDnBnJVJepyNxnK4wVbJyRq2WwGA11BQ3yGrZn7SxwYPirmrvVj4TQaNuPR79HV
	 n2fteNEyV3lENn0uJWPO/TWxQ0HBiV2hNH8mrAWYEoxkExmwcRRBAj4HddNtoJ+yvX
	 e76OCrf8Hy36GlG9WTq0I2zDnTshvtaluEEU2pHR984iSZPAafWjoX2FHfz/2nATTD
	 Ln4ORlbMrH4rd0oMj4rXyIJe0qj8+/xAF9FXvDnPT/r9bWfwJ0XzA0jvE2AffdI1ui
	 JhpPGVZzeHcZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1760385555; x=1760646055; i=yann.sionneau@vates.tech;
	bh=TsNqhpdGcI66qgWiAarZQKHcoqZLiR3I42IBZ58Vh/k=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ckJCFKz79G+oq61kvbkVyjz8Srq3wesn9TJpWXOqfWnUWigFqe4E2yaCW79pZvh2y
	 VlX2z2TDsO6D1DScNeHkuYrZDXfk6ZxJ1ncI58V+En9qa05QdhCEYUB0MMjyfsEWGm
	 8OZby+j7u5QPMNY/7cJ4IsP+5iqSMDlFUBoheThM/3vB9soxz0UM1sZri3KwhxQH4x
	 YKvY1YBsRhH2t1zdNrahmH6in8FCe+tVkVCQhqImjH2R+U+LTIIuQ3VxCggrYZH1Ep
	 gA2MWk3lg7B3I1maNqvC1HC4Hde+G6xDhJdv0C6OURUZXP771E4g+Fh2jfRLnqCXN3
	 Cig3QAySoZmXg==
From: "Yann Sionneau" <yann.sionneau@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v2]=20xen/x86:=20fix=20xen.efi=20boot=20crash=20from=20some=20bootloaders?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1760385553695
Message-Id: <16f9f439-0565-4e56-b932-545a60188d93@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250724140731.1502774-1-yann.sionneau@vates.tech> <4ceb64fa-d7cb-4c77-8a60-1526046c037c@suse.com> <4936cb0d-0898-4171-b8e1-ed3a57bcfc0a@vates.tech> <9b7b70e5-9b1b-446e-9dcc-310f1c1f4b47@suse.com> <ac7ccf2d-163c-447f-9c2a-951b33c0b139@suse.com>
In-Reply-To: <ac7ccf2d-163c-447f-9c2a-951b33c0b139@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.befd0142d0db4fb593fb0ee72d4ccd67?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251013:md
Date: Mon, 13 Oct 2025 19:59:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 10/13/25 13:41, Jan Beulich wrote:
> On 25.08.2025 16:29, Jan Beulich wrote:
>> On 25.08.2025 16:17, Yann Sionneau wrote:
>>> On 8/4/25 11:34, Jan Beulich wrote:
>>>> On 24.07.2025 16:07, Yann Sionneau wrote:
>>>>> xen.efi PE does not boot when loaded from shim or some patched
>>>>> downstream grub2.
>>>>>
>>>>> What happens is the bootloader would honour the MEM_DISCARDABLE
>>>>> flag of the .reloc section meaning it would not load its content
>>>>> into memory.
>>>>>
>>>>> But Xen is parsing the .reloc section content twice at boot:
>>>>> * https://elixir.bootlin.com/xen/v4.20.1/source/xen/common/efi/boot.c#L1362
>>>>> * https://elixir.bootlin.com/xen/v4.20.1/source/xen/arch/x86/efi/efi-boot.h#L237
>>>>>
>>>>> Therefore it would crash with the following message:
>>>>> "Unsupported relocation type" as reported there:
>>>>>
>>>>> * https://github.com/QubesOS/qubes-issues/issues/8206#issuecomment-2619048838
>>>>> * https://lore.kernel.org/xen-devel/7e039262-1f54-46e1-8f70-ac3f03607d5a@suse.com/T/#me122b9e6c27cd98db917da2c9f67e74a2c6ad7a5
>>>>>
>>>>> This commit adds a small C host tool named keeprelocs
>>>>> that is called after xen.efi is produced by the build system
>>>>> in order to remove this bit from its .reloc section header.
>>>>>
>>>>> Signed-off-by: Yann Sionneau <yann.sionneau@vates.tech>
>>>>
>>>> So I found a way to deal with this at the linker side, without any new command
>>>> line options. Behavior is solely driven by the attributes of any incoming .reloc
>>>> sections (of which there would be none by default, retaining original behavior).
>>>> The important patch is [1], but at least the first patch of the series [2] would
>>>> in most cases also be wanted/needed (patch 04 is obviously a mechanical prereq
>>>> for the main patch). Need for other of the prereqs there depends on the scope
>>>> and purpose of one's binutils build(s).
>>>>
>>>> [1] https://sourceware.org/pipermail/binutils/2025-August/143153.html
>>>> [2] https://sourceware.org/pipermail/binutils/2025-August/143141.html
>>>
>>> That sounds great!
>>> It's clearly better to fix the issue by changing/improving binutils.
>>> Let's drop my patch in Xen if this gets accepted in binutils!
>>
>> Luckily I'm in a position where I don't need "acceptance", but merely
>> "absence of objections". The sole reason for the present delay is with
>> a colliding MIPS patch, which I'd rather see go in first.
>>
>>> It would be nice if you could keep us posted in xen-devel of the
>>> status/progress of the binutils patches.
>>
>> I'll try to remember.
> 
> Here you go - the series went in late last week.
> 
> Jan
> 

Thanks Jan :)

-- 


--
Yann Sionneau | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



