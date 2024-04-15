Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF928A4C3A
	for <lists+xen-devel@lfdr.de>; Mon, 15 Apr 2024 12:09:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.705989.1102967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwJGn-0003af-R3; Mon, 15 Apr 2024 10:09:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 705989.1102967; Mon, 15 Apr 2024 10:09:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwJGn-0003YB-OD; Mon, 15 Apr 2024 10:09:01 +0000
Received: by outflank-mailman (input) for mailman id 705989;
 Mon, 15 Apr 2024 10:09:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rwJGm-0003Y3-VC
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2024 10:09:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rwJGj-0001Iv-9X; Mon, 15 Apr 2024 10:08:57 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rwJGj-0006Fw-2j; Mon, 15 Apr 2024 10:08:57 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=dIaWQQZs2fsTANAS4jPGCYoKnZwQYqLmbpUD8bHQ2Xs=; b=t09dDVpsU8N6+hBitCtE4Xkja3
	YjPfeYxrP7Z8kSHryk6Y6BCFOuLyQxt9c0sU9+phPu/YQBpsoYjfdOjf2WxE8LD5aTfF8B7iKq5au
	NNc3/Fm9bAnZ33Myr1hbrbDmhkoldAfrt5k8PfEvxvgEkiXVV61RUAw4fzaF7vSxxO/Y=;
Message-ID: <02401844-98d1-442c-8bd5-1e5c192ddb21@xen.org>
Date: Mon, 15 Apr 2024 11:08:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] docs: add xen_ulong_t to the documented integers
 sizes/alignments
Content-Language: en-GB
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Julien Grall <julien.grall.oss@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <alpine.DEB.2.22.394.2404101644130.976094@ubuntu-linux-20-04-desktop>
 <20240410234740.994001-1-stefano.stabellini@amd.com>
 <CAJ=z9a3zMaSLSS0mfKT8dngVwrESycSspy8LnW4FZV6hdu_AAw@mail.gmail.com>
 <alpine.DEB.2.22.394.2404111454570.997881@ubuntu-linux-20-04-desktop>
 <CAJ=z9a2gOTLy2B7y9bELQHPhFmCpU2nhyV5zy9_uQvsvx5prqw@mail.gmail.com>
 <C8D49EE7-B214-41D5-9556-4D3B98629CEA@arm.com>
 <CAJ=z9a2ENW-3vh4N59csoeMHeMPGv9XFUuC6GrMTYMKM=FpwgQ@mail.gmail.com>
 <3C913FB6-0273-476E-908F-9FE95CB3E114@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <3C913FB6-0273-476E-908F-9FE95CB3E114@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Bertrand,

On 15/04/2024 08:48, Bertrand Marquis wrote:
> Hi Julien,
> 
>> On 12 Apr 2024, at 19:01, Julien Grall <julien.grall.oss@gmail.com> wrote:
>>
>>
>>
>> On Fri, 12 Apr 2024 at 11:30, Bertrand Marquis <Bertrand.Marquis@arm.com> wrote:
>> Hi Julien,
>>
>>> On 12 Apr 2024, at 15:53, Julien Grall <julien.grall.oss@gmail.com> wrote:
>>>
>>>
>>>
>>> On Thu, 11 Apr 2024 at 18:08, Stefano Stabellini <sstabellini@kernel.org> wrote:
>>> On Wed, 10 Apr 2024, Julien Grall wrote:
>>>> On Wed, 10 Apr 2024 at 19:47, Stefano Stabellini <stefano.stabellini@amd.com> wrote:
>>>>        xen_ulong_t is widely used in public headers.
>>>>
>>>>        Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>>>>        ---
>>>>
>>>>        Given that xen_ulong_t is used in public headers there could be a better
>>>>        place for documenting it but this was the most straightforward to add.
>>>>        ---
>>>>         docs/misra/C-language-toolchain.rst | 11 +++++++++++
>>>>         1 file changed, 11 insertions(+)
>>>>
>>>>        diff --git a/docs/misra/C-language-toolchain.rst b/docs/misra/C-language-toolchain.rst
>>>>        index 5ddfe7bdbe..7a334260e6 100644
>>>>        --- a/docs/misra/C-language-toolchain.rst
>>>>        +++ b/docs/misra/C-language-toolchain.rst
>>>>        @@ -531,6 +531,17 @@ A summary table of data types, sizes and alignment is below:
>>>>              - 64 bits
>>>>              - x86_64, ARMv8-A AArch64, RV64, PPC64
>>>>
>>>>        +   * - xen_ulong_t
>>>>        +     - 32 bits
>>>>        +     - 32 bits
>>>>        +     - x86_32
>>>>        +
>>>>        +   * - xen_ulong_t
>>>>        +     - 64 bits
>>>>        +     - 64 bits
>>>>        +     - x86_64, ARMv8-A AArch64, RV64, PPC64, ARMv8-A AArch32, ARMv8-R
>>>>        +       AArch32, ARMv7-A
>>>>
>>>>
>>>> We support neither ARMv8-R nor ARMv8-A Aarch32.
>>>>
>>>> I could possibly accept the latter because it works to. But the former is so far misleading.
>>>
>>> Yes I think you are right. Moreover this document
>>> (C-language-toolchain.rst) is meant for the Xen build. While this patch
>>> is trying to document the types used in the public headers for the
>>> external-facing ABI.
>>>
>>> I'll move the information this patch is adding to a separate document,
>>> specific to the public headers. I will only add the architectures
>>> currently working: I'll add ARMv8-A Aarch32 because although it is
>>> unsupported it is interesting to know the size of xen_ulong_t for
>>> aarch32 in the public headers. I will remove ARMv8-R as it is not
>>> available upstream.
>>>
>>> Thinking a bit more. What about Armv9? Rather than listing each version, should we instead use ARMv7-A aarch32 and later, ARMv8-A aarch64 and later?
>>
>> Definitely you are right here but as for Armv8-R, Armv9 is not something that we explicitely support right now (even though it should work).
>>
>> I am confused with the comparison. I thought you can’t boot Xen at all on Armv8-R. But you can on Armv9-A as this just Armv8-A + features the software don’t need to use.
>>
>> Did you intend to draw the comparison with Armv8-A Aarch32?
> 
> Yes in my mind armv9 even if currently working it is not something officially supported so it is in the same state as armv8 aarch32.

AFAICT, Stefano said he will add ARMv8-A AArch32, so we should be 
consistent and add Armv9-A in the list.

Cheers,

-- 
Julien Grall

