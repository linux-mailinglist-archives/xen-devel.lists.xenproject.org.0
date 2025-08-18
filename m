Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E14E1B2AC04
	for <lists+xen-devel@lfdr.de>; Mon, 18 Aug 2025 17:02:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1086156.1444374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uo1Mn-0001GE-Od; Mon, 18 Aug 2025 15:01:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1086156.1444374; Mon, 18 Aug 2025 15:01:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uo1Mn-0001Em-Lb; Mon, 18 Aug 2025 15:01:45 +0000
Received: by outflank-mailman (input) for mailman id 1086156;
 Mon, 18 Aug 2025 15:01:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h6u/=26=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1uo1Ml-0001EN-Nx
 for xen-devel@lists.xenproject.org; Mon, 18 Aug 2025 15:01:44 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3dbb82fd-7c44-11f0-b898-0df219b8e170;
 Mon, 18 Aug 2025 17:01:38 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id A0DC24EEBC45;
 Mon, 18 Aug 2025 17:01:37 +0200 (CEST)
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
X-Inumbo-ID: 3dbb82fd-7c44-11f0-b898-0df219b8e170
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1755529297;
	b=PZQXeXKOJ4bghzD4W7GFKMMLqwva2uVc40r9Z8/l8+UN2i87bKMgUJR4P4/1ZACjO99a
	 xl1n7+BpGQdfJHA9aVndhCE3/PtB1SLDYhpoVlYvCuHdvurY48NMlX2NB+uO2U91DQi37
	 nbQJC85V5Ioq1IWrbiEiC1PQpBH/6qKQIdS2hjchKmcbrH/wHm/u5Qg5IUv6brBD/ldjT
	 K3Mh56poxyUjYK4yzH7o9YKfepaSCR/eVT5szOfjtzeIPii5aw2I/NEINwSadfGNU5t5e
	 GYftO2kq6ckiQts/+TdB2CpSoYYKzIJjI9jHDwHu22qhrttv7L4iLPXIBXuNxyyX8uT8y
	 F0OgojVBDShQQ8pLD3PUjvDrjUGwO4WYZBifKdsffFidKe9kyO4Ytv9DyLNqTslfYn7i+
	 P4u4Q+1aZzpTUxMztc0UAGhKQMpBy04cQcPb9jZFy0TSKxeclzcPUTSmKAzboVHiUdMUB
	 lRSihHQ9nw0cMZ69GrW1ZcOOzuTh3Pl7+EhdtpJPe46DNmG+d1TBIBfIDPPktLjueIB9A
	 lT7RmyfiWL91OCidRnO7s55z2fC/8uJeYrz5qtcjbhkynGXo6QAsXo9LuSogRjvtJnuzc
	 76p18pVBJcoz04Ek1/Os84NOQPTMgkjg2utN0y39lxca2jL9T8Mt7xhECv/6UDA=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1755529297;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=1ZuPrBToaBkOGWnHFlIFT5yfpra2K8TrRBe3G1qCB+8=;
	b=Vdc3buTu5E1EVBiuv033mna/2zAQY56ikH9e0YZqjX0nt3CyJTexagHdr8Rrx8my9QId
	 U0+LbMQDPwoEdpO2y6C4gbpvBgDJad8zLguR1Yb3dqpNrb1VZk8qqZHbxRobRcZEIzu8w
	 lUa+AMHi/vCbFIzoOJYcgd/9ObTNadPlmKbZlZ2E3GFe+jacbi7IgPGYgM9V5JpH/BRyd
	 /Wj/XwREAHdoyPOmiGsC9XXkVo69nGvl9P8LrCm+Xkgg5K9rGpbZ6M0lK/v+L30/44HHQ
	 y1EAyWzMLJ87V9OAZkDaLwmobBNp4Vkz5WS68ZBDzphbrOZcXl1eyCSxLoreMz85Zq7x6
	 RbJF84Sqq0j+nMaIGunxmtOMHaiBchdFj7J9fD2NtibqQ161gEeJ1I6koBzHPAxS95dVl
	 bkIa3qi60emKvKse4Dzfc9GkkUE5kmFG0UeyifGRRrccM4JhO71UP6vhfUzoUGpzNy4Cu
	 otdsDzsshE+0JENGaNuLEbKJPAZ/FzTkWCi9lpGmOvVtiyyUVqWgU6n3W7FJ1BqEyxp9+
	 7Q4xF1+jI88ZW2CODEUGQpowF/b9xM50VCEyh4yrertMgBMLpvR0pOUUAto7UN5oZJ6+x
	 nsJmxUuAXUZPszcL9/OK7sE07Mfxw7k0w1ppAmIJIsw4Z/mMmIrY7FYwpaMelU4=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1755529297; bh=zz61sY2W1AxxQVKgnrNWGfR/hGljWoFkzi5m5fCJm5I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PKf4A51qCi8R4zPl5hG08oTpYyKMUssUT0N/JUMVmiqSqy/t/ENwW8bIc1ppMoswN
	 sZPDStFeZuwkah1pCwSxMTpzFLsT7OHPDBJAqOB2PBKdTL/mkKZJAbqLNu2vQysHJK
	 lr5mrQyphLUTRQjlsY3XZNWS9420iRGQvtGVqWlsoyAlTpKTpxEOS1Xygbi38nLLfM
	 s0f5Dvtss8ZVDL/Fhr0hqHlhRuTtw/gYRDe70EO92tdCWknZEGfnrZUa/dAAJfxQmb
	 lKLK3DfaM61x8yC8mApFQ90ROwA4Kj7f999Uwj4MMcu88ZMd2xSgT5518KoT/BZzSw
	 COfyz7heUSFCQ==
MIME-Version: 1.0
Date: Mon, 18 Aug 2025 17:01:37 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Jan Beulich <jbeulich@suse.com>, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
Subject: Re: [RFC PATCH] misra: allow conversion from unsigned long to
 function pointer
In-Reply-To: <c9ac9466-5f22-450b-9def-f79d2d4a6233@epam.com>
References: <8cbc9e6d881661d0d7a1055cbcef5a65e20522be.1755109168.git.dmytro_prokopchuk1@epam.com>
 <06120b08-7ce8-4d03-b3cd-cbb22547eca3@suse.com>
 <6990512dab007bfa51e4281dda3cc2f0@bugseng.com>
 <c9ac9466-5f22-450b-9def-f79d2d4a6233@epam.com>
Message-ID: <a8b9ed4cf80885355a4d29ae4936a8c0@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-08-18 12:16, Dmytro Prokopchuk1 wrote:
> On 8/14/25 23:43, Nicola Vetrini wrote:
>> On 2025-08-14 10:36, Jan Beulich wrote:
>>> On 13.08.2025 20:27, Dmytro Prokopchuk1 wrote:
>>>> ...
>>>> 
>>>> from `vaddr_t' (that is `unsigned long') to `switch_ttbr_fn*' (that
>>>> is `void(*)(unsigned long)')
>>>> 
>>>> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
>>>> ---
>>>> This is just a RFC patch.
>>>> The commit message is not important at this stage.
>>>> 
>>>> I am seeking comments regarding this case.
>>>> 
>>>> Thanks.
>>>> ---
>>>>  automation/eclair_analysis/ECLAIR/deviations.ecl |  8 ++++++++
>>>>  docs/misra/deviations.rst                        | 10 ++++++++++
>>>>  docs/misra/rules.rst                             |  8 +++++++-
>>>>  xen/arch/arm/arm64/mmu/mm.c                      |  2 ++
>>>>  4 files changed, 27 insertions(+), 1 deletion(-)
>>>> 
>>>> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/
>>>> automation/eclair_analysis/ECLAIR/deviations.ecl
>>>> index ebce1ceab9..f9fd6076b7 100644
>>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>> @@ -365,6 +365,14 @@ constant expressions are required.\""
>>>>  }
>>>>  -doc_end
>>>> 
>>>> +-doc_begin="The conversion from unsigned long to a function pointer
>>>> does not lose any information, provided that the source type has
>>>> enough bits to restore it."
>>>> +-config=MC3A2.R11.1,casts+={safe,
>>>> +  "from(type(canonical(builtin(unsigned long))))
>>>> +   &&to(type(canonical(__function_pointer_types)))
>>>> +   &&relation(definitely_preserves_value)"
>>>> +}
>>>> +-doc_end
>>>> +
>> 
>> This check is not quite targeted at this situation, as the behaviour 
>> of
>> different compilers is a bit of a grey area (even GCC, though that 
>> works
>> in practice). The relation is mostly aimed at testing whether the
>> pointer are represented using the same number of bits as unsigned long
>> (which happens to be the case fortunately).
> 
> Hi Nicola.
> 
> Well, we're telling Eclair the conversion types from() and to(), but 
> can
> Eclair determine their sizes (in bits) for particular architecture?
> I mean, is it possible to avoid this "sizeof(unsigned long) ==
> sizeof(void (*)())" in source code using only Eclair configs?
> 
> Dmytro.
> 

Unfortunately no. ECLAIR knowns the number of bytes used to represent 
pointer and unsigned long, but what it cannot tell is whether the bits 
are preserved after being converted. What we can do, as it was done 
here, is provide a written justification that this is indeed the case 
for the toolchain we care about (GCC in the specific case). I suggest 
having both the config and the assertion to be extra sure that the 
assumption is never broken (despite being very unlikely).

>> 
>>>>  -doc_begin="The conversion from a function pointer to a boolean has
>>>> a well-known semantics that do not lead to unexpected behaviour."
>>>>  -config=MC3A2.R11.1,casts+={safe,
>>>>    "from(type(canonical(__function_pointer_types)))
>>>> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
>>>> index 3c46a1e47a..27848602f6 100644
>>>> --- a/docs/misra/deviations.rst
>>>> +++ b/docs/misra/deviations.rst
>>>> @@ -348,6 +348,16 @@ Deviations related to MISRA C:2012 Rules:
>>>>         to store it.
>>>>       - Tagged as `safe` for ECLAIR.
>>>> 
>>>> +   * - R11.1
>>>> +     - The conversion from unsigned long to a function pointer does
>>>> not lose any
>>>> +       information or violate type safety assumptions if the
>>>> unsigned long type
>>>> +       is guaranteed to be at least as large as a function pointer.
>>>> This ensures
>>>> +       that the function pointer address can be fully represented
>>>> without
>>>> +       truncation or corruption. Macro BUILD_BUG_ON can be
>>>> integrated into the
>>>> +       build system to confirm that 'sizeof(unsigned long) >=
>>>> sizeof(void (*)())'
>>>> +       on all target platforms.
>>> 
>>> If sizeof(unsigned long) > sizeof(void (*)()), there is loss of
>>> information.
>>> Unless (not said here) the unsigned long value itself is the result 
>>> of
>>> converting a function pointer to unsigned long. Whether all of that
>>> together
>>> can be properly expressed to Eclair I don't know. Hence, as Teddy 
>>> already
>>> suggested, == may want specifying instead.
>>> 
>> 
>> +1; it might be worth to add both the eclair config and the
>> BUILD_BUG_ON, noting that neither is sufficient on its own: unless the
>> compiler guarantees not to fiddle with the value is unaltered when 
>> cast
>> back and forth all checks on the number of bits are moot.
>> 
>>>> --- a/xen/arch/arm/arm64/mmu/mm.c
>>>> +++ b/xen/arch/arm/arm64/mmu/mm.c
>>>> @@ -150,6 +150,7 @@ void __init relocate_and_switch_ttbr(uint64_t 
>>>> ttbr)
>>>>      vaddr_t id_addr = virt_to_maddr(relocate_xen);
>>>>      relocate_xen_fn *fn = (relocate_xen_fn *)id_addr;
>>>>      lpae_t pte;
>>>> +    BUILD_BUG_ON(sizeof(unsigned long) < sizeof(fn));
>>>> 
>>>>      /* Enable the identity mapping in the boot page tables */
>>>>      update_identity_mapping(true);
>>>> @@ -178,6 +179,7 @@ void __init switch_ttbr(uint64_t ttbr)
>>>>      vaddr_t id_addr = virt_to_maddr(switch_ttbr_id);
>>>>      switch_ttbr_fn *fn = (switch_ttbr_fn *)id_addr;
>>>>      lpae_t pte;
>>>> +    BUILD_BUG_ON(sizeof(unsigned long) < sizeof(fn));
>>>> 
>>>>      /* Enable the identity mapping in the boot page tables */
>>>>      update_identity_mapping(true);
>>> 
>>> BUILD_BUG_ON() is a statement, not a declaration, and hence wants
>>> grouping
>>> as such. Question is whether we indeed want to sprinkle such checks 
>>> all
>>> over the code base. (I expect the two cases here aren't all we have.)
>>> 
>> 
>> +1 as well. I would expect such check to live e.g. in compiler.h or 
>> any
>> similarly general header, since this is a widespread and largely arch-
>> neutral property that Xen wants to be always true I believe.
>> 

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

