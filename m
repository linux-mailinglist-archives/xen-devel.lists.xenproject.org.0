Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3D7B10CD0
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 16:11:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056142.1424303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uewf4-00082M-Dn; Thu, 24 Jul 2025 14:11:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056142.1424303; Thu, 24 Jul 2025 14:11:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uewf4-000803-B7; Thu, 24 Jul 2025 14:11:06 +0000
Received: by outflank-mailman (input) for mailman id 1056142;
 Thu, 24 Jul 2025 14:11:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rL48=2F=bounce.vates.tech=bounce-md_30504962.68823ef5.v1-366fb7fd91e7422a96b63da25d1935b6@srs-se1.protection.inumbo.net>)
 id 1uewf2-0007yG-Ci
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 14:11:04 +0000
Received: from mail145-22.atl61.mandrillapp.com
 (mail145-22.atl61.mandrillapp.com [198.2.145.22])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 077a8303-6898-11f0-b895-0df219b8e170;
 Thu, 24 Jul 2025 16:11:02 +0200 (CEST)
Received: from pmta06.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail145-22.atl61.mandrillapp.com (Mailchimp) with ESMTP id
 4bntFx15jXzFCWYhB
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 14:11:01 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 366fb7fd91e7422a96b63da25d1935b6; Thu, 24 Jul 2025 14:11:01 +0000
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
X-Inumbo-ID: 077a8303-6898-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1753366261; x=1753636261;
	bh=8uhiPanxsHl6eZM/s6yq5YM9EI8jVNx4WTCvnEJU3uE=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=kOQfZuqB9zxqoDMV6ry2vf46AylgU9Sg+/0t+BUP0iB81C7riYr3KPjEO4UhQ3rV8
	 hWEFz8g0znyq4ryeD5hN0WNPx9yYOPYu1I22qvWXNRjjrdSw1PmkULfsQ9jqVR+KcV
	 fKJonRdBzHwBoFlBGrQl6EAS0Aq4q9/hWJa/I1v54MrENmweB4DVkNRXdLCEyjpWZA
	 8SCu37VEgUOLNbwfq+pcENwzNA1YazOV9N6x8AMnjUp8T/rgbCyZd4CXxPCW0Gul8r
	 a9J90P7xZ1ANwFcgHOU37NIoBUbrqodAklTFb0TM73uedbdIGtf50wWikiq1TNfiZS
	 FFiYYdYxm5Mlg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1753366261; x=1753626761; i=yann.sionneau@vates.tech;
	bh=8uhiPanxsHl6eZM/s6yq5YM9EI8jVNx4WTCvnEJU3uE=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=MoFfD6vgFFHDURbE0tlfzf1ELf2Mg4/GbAPbwNmoKBvKbjc7q/LY473GzzkrrW9A/
	 knYAGAKGiPrq3Jdr88TFv8m92GmTeJm16vySXnl2tmhPZjK09YJTP/XIAZSwDNx2YC
	 HeJvExhc73dn4/iu+kVRHbZSkGAJcDn3LsXszy4aMqmXxjghmH+3dY1Ezf7r7hcsOI
	 OuJsCvFFPUPMft+EUs0lUwdH9X2YnkJSbA2HGOhxlauWk9CqxKXekPrtOIzFxCgiwZ
	 epK6WyocN5DfWhxplr7qJwQjwSfH7Hew1bJTS7jthkFSFWv7Z/9eQ22wGn+c311n0K
	 WmevKqAf5bj4g==
From: "Yann Sionneau" <yann.sionneau@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20xen/x86:=20fix=20xen.efi=20boot=20crash=20from=20some=20bootloaders?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1753366259567
Message-Id: <0d6286ac-994e-407d-be41-51e187aff6ae@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250723135620.1327914-1-yann.sionneau@vates.tech> <8071bf13-0661-4809-b5f9-ff101d9828b5@suse.com> <16d9bf13-d76b-40a9-8f39-d2476ecdf49e@vates.tech> <2478643b-40f4-488c-a5dd-feace902ce30@suse.com>
In-Reply-To: <2478643b-40f4-488c-a5dd-feace902ce30@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.366fb7fd91e7422a96b63da25d1935b6?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250724:md
Date: Thu, 24 Jul 2025 14:11:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 7/23/25 17:54, Jan Beulich wrote:
> On 23.07.2025 17:39, Yann Sionneau wrote:
>> On 7/23/25 16:18, Jan Beulich wrote:
>>> On 23.07.2025 15:56, Yann Sionneau wrote:
>>>> xen.efi PE does not boot when loaded from shim or some patched
>>>> downstream grub2.
>>>>
>>>> What happens is the bootloader would honour the MEM_DISCARDABLE
>>>> flag of the .reloc section meaning it would not load its content
>>>> into memory.
>>>>
>>>> But Xen is parsing the .reloc section content twice at boot:
>>>> * https://elixir.bootlin.com/xen/v4.20.1/source/xen/common/efi/boot.c#L1362
>>>> * https://elixir.bootlin.com/xen/v4.20.1/source/xen/arch/x86/efi/efi-boot.h#L237
>>>>
>>>> Therefore it would crash with the following message:
>>>> "Unsupported relocation type" as reported there:
>>>>
>>>> * https://github.com/QubesOS/qubes-issues/issues/8206#issuecomment-2619048838
>>>> * https://lore.kernel.org/xen-devel/7e039262-1f54-46e1-8f70-ac3f03607d5a@suse.com/T/#me122b9e6c27cd98db917da2c9f67e74a2c6ad7a5
>>>>
>>>> This commit adds a small C host tool named keeprelocs
>>>> that is called after xen.efi is produced by the build system
>>>> in order to remove this bit from its .reloc section header.
>>>
>>> As indicated on Matrix, giving this tool such a specific name doesn't
>>> lend it to use for further editing later on.
>>
>> What would you like to call it?
> 
> peedit or editpe or some such? And then of course have it have a command
> line option indicating to remove the one flag from the one section.

Honestly, I don't think peedit is a nice name, also, both peedit and 
editpe already exist.

> 
> Thinking of it, binutils having elfedit, it may be an option to actually
> have peedit there, in sufficiently generalized form.

yes why not, but I don't have it in my todo list to make a generalized 
PE header editor. I think this carries me too far away from the original 
bugfix.

> 
>>> Also such an entirely new tool imo wants to use Xen style, not Linux(?)
>>> one. Unless of course it is taken from somewhere, but nothing is being
>>> said along these line.
>>
>> Ah, sorry I didn't know about the coding style, I'll reformat it then.
>> Is there a correct .clang-format file somewhere or a checkpatch.pl
>> equivalent?
> 
> Sadly not. All we have is ./CODING_STYLE and a lot of unwritten rules.
> 
>>>> +		case 'q':
>>>> +			quiet = 1;
>>>> +			break;
>>>> +		case 'h':
>>>> +			print_usage(prog_name);
>>>> +			return 0;
>>>> +			break;
>>>
>>> "break" after "return"?
>> This needs to go.
>>>
>>>> +		case '?':
>>>
>>> Why is this not the same as 'h'?
>> One returns 0 because help is asked for so it's not an error.
>> The other one is when using non-existing argument which is an error.
> 
> But a user passing -? deserves to be shown help output, just like you
> do for -h?
> 
>>>> +	if (pe->opt_hdr_size == 0) {
>>>> +		printf("file has empty OptionalHeader\n");
>>>> +		return -1;
>>>> +	}
>>>
>>> Code further down doesn't really require this check, as it looks. IOW
>>> either this check wants dropping, or it wants to be more strict than
>>> just checking for zero.
>>
>> Based on
>> https://learn.microsoft.com/en-us/windows/win32/debug/pe-format#coff-file-header-object-and-image
>> My understanding is that SizeOfOptionalHeader member can be 0, for
>> object files.
>> But we don't want an object file here, we want an image file.
>> However, the optional header is required for image files (thus the != 0
>> check):
>>
>> "Every image file has an optional header that provides information to
>> the loader."
>>
>> But, we really don't know its size, moreover it's even different for
>> PE32 vs PE32+.
> 
> Yet surely we know 1 is still too little, for example?
> 
> Jan
> 


-- 


Yann Sionneau | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



