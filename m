Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55314CD22E2
	for <lists+xen-devel@lfdr.de>; Sat, 20 Dec 2025 00:20:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1191213.1511232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWjlF-0002IR-AS; Fri, 19 Dec 2025 23:19:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1191213.1511232; Fri, 19 Dec 2025 23:19:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWjlF-0002GT-7s; Fri, 19 Dec 2025 23:19:49 +0000
Received: by outflank-mailman (input) for mailman id 1191213;
 Fri, 19 Dec 2025 23:19:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lTMo=6Z=ariadne.space=ariadne@srs-se1.protection.inumbo.net>)
 id 1vWjlE-0002GN-9d
 for xen-devel@lists.xenproject.org; Fri, 19 Dec 2025 23:19:48 +0000
Received: from outbound.qs.icloud.com
 (p-east3-cluster7-host10-snip4-1.eps.apple.com [57.103.84.222])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34e704b3-dd31-11f0-b15b-2bf370ae4941;
 Sat, 20 Dec 2025 00:19:46 +0100 (CET)
Received: from outbound.qs.icloud.com (unknown [127.0.0.2])
 by p00-icloudmta-asmtp-us-east-2d-100-percent-4 (Postfix) with ESMTPS id
 1713118003FA; Fri, 19 Dec 2025 23:19:42 +0000 (UTC)
Received: from [10.0.0.250] (unknown [17.57.155.37])
 by p00-icloudmta-asmtp-us-east-2d-100-percent-4 (Postfix) with ESMTPSA id
 E271A18000B0; Fri, 19 Dec 2025 23:19:29 +0000 (UTC)
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
X-Inumbo-ID: 34e704b3-dd31-11f0-b15b-2bf370ae4941
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ariadne.space; s=sig1; bh=iy2tMr+pcOGokCditubD3qK8tyKEldr37Ursg+rfWGI=; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:x-icloud-hme; b=UZR+u9l2HxdBvSGpQV5DGeFCU9Ihv26qknN/BRL2tsorcEAbc/oINwnAeN64HO1qLkKWjlqZe2Zxw797UlXxzO+h/AYJcACNe8CTSpzD+F8QhBi6NLgST3aaGkWUfTHwHn646JmS9e/cQrJeeAC75j5vnHMYx1gYdmSRa/B9A3mfQ9Qufmzr3tr/QUr5Koh0h38WG3l0iGU2Yq3rP30vZIKrZ+r7Y7g3knD1Au3UJYLBYA9eOSwh9uTLDwRzgFiBLkkzwT8oPHBK5Uq3R0i4DfOGJZhq7wHp924kkORslsj7gHH7pcRi6o19KWsCeOj+YLtE33fsvR+9wbc5fIDVjA==
mail-alias-created-date: 1688796967087
Message-ID: <a5c4dd0b-d524-43d5-8d33-0aad02adc541@ariadne.space>
Date: Fri, 19 Dec 2025 15:19:28 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/CPU/AMD: avoid printing reset reasons on Xen domU
To: Sean Christopherson <seanjc@google.com>, Borislav Petkov <bp@alien8.de>
Cc: linux-kernel@vger.kernel.org, mario.limonciello@amd.com,
 darwi@linutronix.de, sandipan.das@amd.com, kai.huang@intel.com,
 me@mixaill.net, yazen.ghannam@amd.com, riel@surriel.com,
 peterz@infradead.org, hpa@zytor.com, x86@kernel.org, tglx@linutronix.de,
 mingo@redhat.com, dave.hansen@linux.intel.com,
 xen-devel@lists.xenproject.org, stable@vger.kernel.org
References: <20251219010131.12659-1-ariadne@ariadne.space>
 <7C6C14C2-ABF8-4A94-B110-7FFBE9D2ED79@alien8.de>
 <aUV4u0r44V5zHV5f@google.com>
Content-Language: en-US
From: Ariadne Conill <ariadne@ariadne.space>
In-Reply-To: <aUV4u0r44V5zHV5f@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Info: v=2.4 cv=Fas6BZ+6 c=1 sm=1 tr=0 ts=6945dd90 cx=c_apl:c_pps
 a=bsP7O+dXZ5uKcj+dsLqiMw==:117 a=bsP7O+dXZ5uKcj+dsLqiMw==:17
 a=IkcTkHD0fZMA:10 a=MKtGQD3n3ToA:10 a=1oJP67jkp3AA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kmYkUENqAAAA:8 a=cWRNjhkoAAAA:8 a=VwQbUJbxAAAA:8
 a=jQPEHyspVSHZgeuGXSQA:9 a=QEXdDO2ut3YA:10 a=p9kz6gysRiz6SGr9lVkz:22
 a=sVa6W5Aao32NNC1mekxh:22
X-Proofpoint-ORIG-GUID: PrgxWHdnMqmT56j-36miK5PuOTkgt8vm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDE5NiBTYWx0ZWRfX1hQobANrkcwi
 fAOYdQ6SalVAYZ50ZyICd6lmGxyNCstXgvN2h7qvEzqWepamC0HYV1qNjmQl/noKu06j9ynh5PB
 X6I8nwhJKKoUnE78HqPDq2tdd+5nEdhDQuZFOrg6vOZH5N7bW6pSlMN9qflPI73b8z0a86ftDyP
 NsTuzn14/2gDFY253bCFbEk0DNTqKgqJiwOeMN3xh1Z2CFdiAfMIHq1atBGHHl0o5NmdH+oz/MS
 mK0bYKQfff0zG3/0IRmZUdziAXbHX1CM5qcZVF7epZISJod1ri5IihY/OPirX1oGmM6ZmfoD3UL
 0HsaPtA01XwwRL9+yGf
X-Proofpoint-GUID: PrgxWHdnMqmT56j-36miK5PuOTkgt8vm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_08,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1030
 mlxlogscore=999 bulkscore=0 malwarescore=0 mlxscore=0 spamscore=0
 phishscore=0 adultscore=0 suspectscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512190196
X-JNJ: AAAAAAABCeDZeZABUl1JBQZUFV5IHr6VVYAh9hTgMK6DZMe7v9k9M5CZQCnXlaMiG2N5UpfcrLgKZJJrQoSKX2mJqV1pPPecVXEiW+S0H4n+gHaK0zTzj6Winp6wvqXLScyHgtvQ1K7MzL+Gktqfc7PBGbCsHKCSK6GLnqX9aTleGPFku21OKp49OQGlMVZlTFGFnPnVIhRibRG5zVWPUbV38vqZD1b12pzR9D1mvk6wNFDR8yZF1JcjSORncY5j0k8LDwSS5SviG59MsRhSSAjvhR03IiFPfevkdzoRyDde3geX8m8UV0KXP3EndWv9BFLPkj6D0ht4H+fXq2SaFf6KFEOG7GtK2+yYHBEnc1UBz2ZotTFfFLNQW/E8Cme0DshfAT0xIVHEWWTFjobZvtL8psRlam0SDNi6oktfi7nGCoD6u+ybqdUWDTF0ob1eSQDsIAiDXZqAIHH7ed1ZkcKhxDYWc18t0IcAwMpPOAOks+0X6fHn/Yc52HluCLS4Mr0MHAMsOh1REPSkahqeePtML95elCEZKpG5QGCshkrpLjnDwWrbq1I0pnr523aKP7fDsEZ5ldO1dKwSWJwFsjUuu8NlXPzRT8irDivscY7FVY26tiM/ntPHJJwBijs7JF8V3bXdP9DR6BoX4dGRte5qPzqYY7W2ij1UmblqIYpoEwhoYYBrHOv/BT29g61raMcLMlRQOXj6Rb4sAVEXoP9dFiEwnfBvx3Wt1TH3k2Pb3f0tjSl8eO9jxaCsidx++26dX98H7097CpjwjDdkvSrOpSKa23zAKTLBR8OnL5k14kVmLNYe9fCVe0bhO3ExpBAyad20d1veTQk3NebdxBuYEKkYqXndk55NkEZluk4f7u5HOtr80eDwmU/k08ZQLTw=

Hi,

On 12/19/25 08:09, Sean Christopherson wrote:
> On Fri, Dec 19, 2025, Borislav Petkov wrote:
>> On December 19, 2025 1:01:31 AM UTC, Ariadne Conill <ariadne@ariadne.space> wrote:
>>> Xen domU cannot access the given MMIO address for security reasons,
>>> resulting in a failed hypercall in ioremap() due to permissions.
> Why does that matter though?  Ah, because set_pte() assumes success, and so
> presumably the failed hypercall goes unnoticed and trying to access the MMIO
> #PFs due to !PRESENT mapping.

Yes, which results in the guest panicing on Zen platforms.

>>> Fixes: ab8131028710 ("x86/CPU/AMD: Print the reason for the last reset")
>>> Signed-off-by: Ariadne Conill <ariadne@ariadne.space>
>>> Cc: xen-devel@lists.xenproject.org
>>> Cc: stable@vger.kernel.org
>>> ---
>>> arch/x86/kernel/cpu/amd.c | 6 ++++++
>>> 1 file changed, 6 insertions(+)
>>>
>>> diff --git a/arch/x86/kernel/cpu/amd.c b/arch/x86/kernel/cpu/amd.c
>>> index a6f88ca1a6b4..99308fba4d7d 100644
>>> --- a/arch/x86/kernel/cpu/amd.c
>>> +++ b/arch/x86/kernel/cpu/amd.c
>>> @@ -29,6 +29,8 @@
>>> # include <asm/mmconfig.h>
>>> #endif
>>>
>>> +#include <xen/xen.h>
>>> +
>>> #include "cpu.h"
>>>
>>> u16 invlpgb_count_max __ro_after_init = 1;
>>> @@ -1333,6 +1335,10 @@ static __init int print_s5_reset_status_mmio(void)
>>> 	if (!cpu_feature_enabled(X86_FEATURE_ZEN))
>>> 		return 0;
>>>
>>> +	/* Xen PV domU cannot access hardware directly, so bail for domU case */
> Heh, Xen on Zen crime.
>
>>> +	if (cpu_feature_enabled(X86_FEATURE_XENPV) && !xen_initial_domain())
>>> +		return 0;
>>> +
>>> 	addr = ioremap(FCH_PM_BASE + FCH_PM_S5_RESET_STATUS, sizeof(value));
>>> 	if (!addr)
>>> 		return 0;
>> Sean, looka here. The other hypervisor wants other checks.
>>
>> Time to whip out the X86_FEATURE_HYPERVISOR check.
> LOL, Ariadne, be honest, how much did Boris pay you?  :-D

Nothing :)

At Edera we have been running with this patch for a few months, I just 
forgot to upstream it.

I was reminded of this patch when an Alpine user opened a bug[0] 
demonstrating the same behavior on 6.18.

[0]: https://gitlab.alpinelinux.org/alpine/aports/-/issues/17789

> Jokes aside, I suppose I'm fine adding a HYPERVISOR check, but at the same time,
> how is this not a Xen bug?  Refusing to create a mapping because the VM doesn't
> have a device defined at a given GPA is pretty hostile behavior for a hypervisor.

I think it would be better to fix this in a more generic way if we can.

Ariadne


