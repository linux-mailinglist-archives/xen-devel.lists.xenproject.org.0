Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E7DB34318
	for <lists+xen-devel@lfdr.de>; Mon, 25 Aug 2025 16:18:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1093256.1448788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqY1D-0006je-LH; Mon, 25 Aug 2025 14:17:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1093256.1448788; Mon, 25 Aug 2025 14:17:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqY1D-0006iB-I1; Mon, 25 Aug 2025 14:17:55 +0000
Received: by outflank-mailman (input) for mailman id 1093256;
 Mon, 25 Aug 2025 14:17:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TV44=3F=bounce.vates.tech=bounce-md_30504962.68ac708a.v1-95060c73b2f3405eb407bfe676b0d907@srs-se1.protection.inumbo.net>)
 id 1uqY1B-0006i4-Pq
 for xen-devel@lists.xenproject.org; Mon, 25 Aug 2025 14:17:54 +0000
Received: from mail179-29.suw41.mandrillapp.com
 (mail179-29.suw41.mandrillapp.com [198.2.179.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4685835a-81be-11f0-b898-0df219b8e170;
 Mon, 25 Aug 2025 16:17:48 +0200 (CEST)
Received: from pmta12.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail179-29.suw41.mandrillapp.com (Mailchimp) with ESMTP id
 4c9Xty5tCNz7lmLbl
 for <xen-devel@lists.xenproject.org>; Mon, 25 Aug 2025 14:17:46 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 95060c73b2f3405eb407bfe676b0d907; Mon, 25 Aug 2025 14:17:46 +0000
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
X-Inumbo-ID: 4685835a-81be-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1756131466; x=1756401466;
	bh=QASk0HcGEBujikYeiePjBRzLxGvgR19KtV66TpItfyQ=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=VZokLCoyXVg1qDTo8n8W897WVsEBFRd+8oHz8tCqLuW5MHKQxSsnYK8CMSq4CRAh/
	 d/TY5u8L/y0KDiJvjULy7U4KSmfPnHC5WYZL4IcBST+ApAwMwDe61PLCTPcxA9sVEr
	 VH9/trGOijoKkeVogJlfto3OOwruSFM009OWxz9HoBMOUKhDe9lqLeMLELfGaVin3x
	 b3cs3/4yMuI1zON/CCKQ5UXvbW74+ufIjesmk9cMcYP4p2u1zloLd3S6m3islFv6B0
	 wZVJyvED2xiNXdiiEOlajMtr+10FJiGbU95DDkoW/oANhRdAWF26yiudhJ0+kaQQhp
	 s7M6gfQ33Ndsg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1756131466; x=1756391966; i=yann.sionneau@vates.tech;
	bh=QASk0HcGEBujikYeiePjBRzLxGvgR19KtV66TpItfyQ=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=hY4fpLSGRphFuxRWv1gVhRtUYQZdepDe7IaYxYnaCO5XEMqbIFRIRg5eiPP8KVa3J
	 8iMlNjuJ0iIu1OJvjce5QOLmlxARieZTmzphf7h6qd705VcBAwGiefTRD6FxTdOfID
	 kZABuy2zuS/8ee3c0lhuPkzrrTM71jKIGOxVLMUyVAkGLBLOwYTyf66ot35aNwfvUR
	 xfGFUnALzHm+VeZxjB2n6ZuhBApabEWNc3veG4JgqKM9QR9Ucp+VPN8kuLckb8HRXa
	 ynrgRUtULaE7FzjpVPo4j2AmGUI/74b6IFxYYCr6rvj5IyaQqrnaD0u0TQPXdjUp5X
	 m+QfuYi7HXeVA==
From: "Yann Sionneau" <yann.sionneau@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v2]=20xen/x86:=20fix=20xen.efi=20boot=20crash=20from=20some=20bootloaders?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1756131465594
Message-Id: <4936cb0d-0898-4171-b8e1-ed3a57bcfc0a@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250724140731.1502774-1-yann.sionneau@vates.tech> <4ceb64fa-d7cb-4c77-8a60-1526046c037c@suse.com>
In-Reply-To: <4ceb64fa-d7cb-4c77-8a60-1526046c037c@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.95060c73b2f3405eb407bfe676b0d907?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250825:md
Date: Mon, 25 Aug 2025 14:17:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 8/4/25 11:34, Jan Beulich wrote:
> On 24.07.2025 16:07, Yann Sionneau wrote:
>> xen.efi PE does not boot when loaded from shim or some patched
>> downstream grub2.
>>
>> What happens is the bootloader would honour the MEM_DISCARDABLE
>> flag of the .reloc section meaning it would not load its content
>> into memory.
>>
>> But Xen is parsing the .reloc section content twice at boot:
>> * https://elixir.bootlin.com/xen/v4.20.1/source/xen/common/efi/boot.c#L1362
>> * https://elixir.bootlin.com/xen/v4.20.1/source/xen/arch/x86/efi/efi-boot.h#L237
>>
>> Therefore it would crash with the following message:
>> "Unsupported relocation type" as reported there:
>>
>> * https://github.com/QubesOS/qubes-issues/issues/8206#issuecomment-2619048838
>> * https://lore.kernel.org/xen-devel/7e039262-1f54-46e1-8f70-ac3f03607d5a@suse.com/T/#me122b9e6c27cd98db917da2c9f67e74a2c6ad7a5
>>
>> This commit adds a small C host tool named keeprelocs
>> that is called after xen.efi is produced by the build system
>> in order to remove this bit from its .reloc section header.
>>
>> Signed-off-by: Yann Sionneau <yann.sionneau@vates.tech>
> 
> So I found a way to deal with this at the linker side, without any new command
> line options. Behavior is solely driven by the attributes of any incoming .reloc
> sections (of which there would be none by default, retaining original behavior).
> The important patch is [1], but at least the first patch of the series [2] would
> in most cases also be wanted/needed (patch 04 is obviously a mechanical prereq
> for the main patch). Need for other of the prereqs there depends on the scope
> and purpose of one's binutils build(s).
> 
> Jan
> 
> [1] https://sourceware.org/pipermail/binutils/2025-August/143153.html
> [2] https://sourceware.org/pipermail/binutils/2025-August/143141.html

That sounds great!
It's clearly better to fix the issue by changing/improving binutils.
Let's drop my patch in Xen if this gets accepted in binutils!
It would be nice if you could keep us posted in xen-devel of the 
status/progress of the binutils patches.

By the number of patches needed for binutils it seems you opened a can 
of worms/pandora box with this issue ^^

Also, in patch 12/17, you state that the logic would be that if .reloc 
is generated partly by the code itself instead of solely by the linker 
this means we want to use the section at runtime.
While I kind of understand this idea, it also feels a bit as a hack, 
doesn't it?
One could argue that even if .reloc is just generated by the linker, the
program could still want to access it at runtime.
I've looked at Xen code to see if it does put something in .reloc itself 
and it seems so: 
https://elixir.bootlin.com/xen/v4.20.1/source/xen/arch/x86/efi/relocs-dummy.S
The "code puts data in .reloc section" would just serve as a "hint" for 
the linker if I understand your patch well, just as well as a 
`--keep-reloc` command line option would.

Anyway, I won't comment much further on the binutils patchset since I'm 
not well versed in linker black magic.

Thanks for the patchset!

Yann

-- 


Yann Sionneau | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



