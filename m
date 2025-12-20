Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FC4CD2543
	for <lists+xen-devel@lfdr.de>; Sat, 20 Dec 2025 02:45:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1191260.1511242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWm1F-0002nU-JA; Sat, 20 Dec 2025 01:44:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1191260.1511242; Sat, 20 Dec 2025 01:44:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWm1F-0002m0-CV; Sat, 20 Dec 2025 01:44:29 +0000
Received: by outflank-mailman (input) for mailman id 1191260;
 Sat, 20 Dec 2025 01:44:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YNMa=62=bounce.vates.tech=bounce-md_30504962.6945ff76.v1-510f0dcf5b1a48d2b7a03f03a4a8e883@srs-se1.protection.inumbo.net>)
 id 1vWm1E-0002lu-II
 for xen-devel@lists.xenproject.org; Sat, 20 Dec 2025 01:44:28 +0000
Received: from mail137-31.atl71.mandrillapp.com
 (mail137-31.atl71.mandrillapp.com [198.2.137.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 695fa3df-dd45-11f0-b15b-2bf370ae4941;
 Sat, 20 Dec 2025 02:44:26 +0100 (CET)
Received: from pmta07.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail137-31.atl71.mandrillapp.com (Mailchimp) with ESMTP id
 4dY6df4rg6z7lmM0s
 for <xen-devel@lists.xenproject.org>; Sat, 20 Dec 2025 01:44:22 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 510f0dcf5b1a48d2b7a03f03a4a8e883; Sat, 20 Dec 2025 01:44:22 +0000
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
X-Inumbo-ID: 695fa3df-dd45-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1766195062; x=1766465062;
	bh=LZATy/epkYlb1ti/O9p96Bjn8vhz+ABv2T1O/KGgVBI=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=daaW6ApRC3hgCdlRpg3BEIxXzaTAEilcF7w8gIu4nJTgADsl9LMME1u0D8i/0tJGz
	 2sY6sz49SRtS9upDKigCZ+xPb/JQ9yUN7NcNz0/IjYpqEdjhaXLtgqM/WwPpntuBs4
	 F9+fcrM5B0zZNugrS1yanjCyAhsKswdmJFlEGgTgmEIlrKlr+EAqQ120YXP6YvIX75
	 bcS9k1SRTlnqa1OnHHrzX1fzTaBhfCYk5ARFHcQR31C+QhOXXGcC3N/sNzC417q214
	 wO+Oe1K33SKsYGAscRuvD3IjP40Snewi/qkD7iRMRjnpcxqCiN4ih6F2PKAC1vm+6H
	 bi14onHggzAFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1766195062; x=1766455562; i=teddy.astie@vates.tech;
	bh=LZATy/epkYlb1ti/O9p96Bjn8vhz+ABv2T1O/KGgVBI=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=WbrnoCC+1o1Qo01yxukZM75q5P/Xv865o8MePtFCK1phOjY0S1YixRoMa5O6ADLIw
	 TJ3Q4uTSQ1APGTNA3xG3Mu9cwwvZbq6uBk+rlGJ11ZwVae5XKM26lerZ8+hK8sKgtF
	 4H8wadf02WA0KTPllNljCiKE0Fo4Uemt8c/wLTdN3qaCCfLAsFh/fJlqK7ayVsKZhI
	 DhqUcWOlduD/pktSzUmBiu0v+Gytd2Fb/StESqnlEMrnEMiVVSalgKFN925eoBDbaK
	 UoDASv7LM9JQpvcsdXgr+Djue/bJTnAzM/VBfKBC3NeYDBCATEjUI29CwT4fBHvCgF
	 uUJyfyslZzNWg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20x86/CPU/AMD:=20avoid=20printing=20reset=20reasons=20on=20Xen=20domU?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1766195061283
Message-Id: <190f226a-a92f-4dab-ad7a-f7ea22e6a976@vates.tech>
To: "Sean Christopherson" <seanjc@google.com>
Cc: "Ariadne Conill" <ariadne@ariadne.space>, linux-kernel@vger.kernel.org, mario.limonciello@amd.com, darwi@linutronix.de, sandipan.das@amd.com, kai.huang@intel.com, me@mixaill.net, yazen.ghannam@amd.com, riel@surriel.com, peterz@infradead.org, hpa@zytor.com, x86@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, xen-devel@lists.xenproject.org, stable@vger.kernel.org
References: <20251219010131.12659-1-ariadne@ariadne.space> <dbe68678-0bc4-483f-aef3-e4c7462bcaff@vates.tech> <aUWNlTAmbSTXsBDE@google.com>
In-Reply-To: <aUWNlTAmbSTXsBDE@google.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.510f0dcf5b1a48d2b7a03f03a4a8e883?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251220:md
Date: Sat, 20 Dec 2025 01:44:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 19/12/2025 =C3=A0 18:40, Sean Christopherson a =C3=A9crit=C2=A0:
> On Fri, Dec 19, 2025, Teddy Astie wrote:
>> Le 19/12/2025 =C3=A0 02:04, Ariadne Conill a =C3=A9crit=C2=A0:
>>> Xen domU cannot access the given MMIO address for security reasons,
>>> resulting in a failed hypercall in ioremap() due to permissions.
>>>
>>> Fixes: ab8131028710 ("x86/CPU/AMD: Print the reason for the last reset"=
)
>>> Signed-off-by: Ariadne Conill <ariadne@ariadne.space>
>>> Cc: xen-devel@lists.xenproject.org
>>> Cc: stable@vger.kernel.org
>>> ---
>>>    arch/x86/kernel/cpu/amd.c | 6 ++++++
>>>    1 file changed, 6 insertions(+)
>>>
>>> diff --git a/arch/x86/kernel/cpu/amd.c b/arch/x86/kernel/cpu/amd.c
>>> index a6f88ca1a6b4..99308fba4d7d 100644
>>> --- a/arch/x86/kernel/cpu/amd.c
>>> +++ b/arch/x86/kernel/cpu/amd.c
>>> @@ -29,6 +29,8 @@
>>>    # include <asm/mmconfig.h>
>>>    #endif
>>>
>>> +#include <xen/xen.h>
>>> +
>>>    #include "cpu.h"
>>>
>>>    u16 invlpgb_count_max __ro_after_init =3D 1;
>>> @@ -1333,6 +1335,10 @@ static __init int print_s5_reset_status_mmio(voi=
d)
>>>    =09if (!cpu_feature_enabled(X86_FEATURE_ZEN))
>>>    =09=09return 0;
>>>
>>> +=09/* Xen PV domU cannot access hardware directly, so bail for domU ca=
se */
>>> +=09if (cpu_feature_enabled(X86_FEATURE_XENPV) && !xen_initial_domain()=
)
>>> +=09=09return 0;
>>> +
>>>    =09addr =3D ioremap(FCH_PM_BASE + FCH_PM_S5_RESET_STATUS, sizeof(val=
ue));
>>>    =09if (!addr)
>>>    =09=09return 0;
>>
>> Such MMIO only has a meaning in a physical machine, but the feature
>> check is bogus as being on Zen arch is not enough for ensuring this.
>>
>> I think this also translates in most hypervisors with odd reset codes
>> being reported; without being specific to Xen PV (Zen CPU is
>> unfortunately not enough to ensuring such MMIO exists).
>>
>> Aside that, attempting unexpected MMIO in a SEV-ES/SNP guest can cause
>> weird problems since they may not handled MMIO-NAE and could lead the
>> hypervisor to crash the guest instead (unexpected NPF).
> 
> IMO, terminating an SEV-ES+ guest because it accesses an unknown MMIO ran=
ge is
> unequivocally a hypervisor bug. 

Terminating may be a bit excessive, but the hypervisor can respond #GP 
to either unexpected MMIO-NAE and NPF-AE if it doesn't know how to deal 
with this MMIO/NPF (xAPIC has a similar behavior when it is disabled).

> The right behavior there is to configure a reserved NPT entry
> to reflect the access into the guest as a #VC.

I'm not sure this is the best approach, that would allow the guest to 
trick the hypervisor into making a unbounded amount of reserved entries.

Teddy


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



