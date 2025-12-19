Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8F8CD0E0F
	for <lists+xen-devel@lfdr.de>; Fri, 19 Dec 2025 17:32:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1190879.1511119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWdOm-0000sB-Qh; Fri, 19 Dec 2025 16:32:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1190879.1511119; Fri, 19 Dec 2025 16:32:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWdOm-0000qk-NB; Fri, 19 Dec 2025 16:32:12 +0000
Received: by outflank-mailman (input) for mailman id 1190879;
 Fri, 19 Dec 2025 16:32:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U6gf=6Z=bounce.vates.tech=bounce-md_30504962.69457e03.v1-d18d5be1757645a2b4114b745399e872@srs-se1.protection.inumbo.net>)
 id 1vWdOl-0000qe-7p
 for xen-devel@lists.xenproject.org; Fri, 19 Dec 2025 16:32:11 +0000
Received: from mail137-31.atl71.mandrillapp.com
 (mail137-31.atl71.mandrillapp.com [198.2.137.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4099922f-dcf8-11f0-9cce-f158ae23cfc8;
 Fri, 19 Dec 2025 17:32:05 +0100 (CET)
Received: from pmta07.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail137-31.atl71.mandrillapp.com (Mailchimp) with ESMTP id
 4dXtNM1bfCz7lmRhy
 for <xen-devel@lists.xenproject.org>; Fri, 19 Dec 2025 16:32:03 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 d18d5be1757645a2b4114b745399e872; Fri, 19 Dec 2025 16:32:03 +0000
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
X-Inumbo-ID: 4099922f-dcf8-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1766161923; x=1766431923;
	bh=OvdSDejbcaHbbKQCG9MCRtVqRVp7XVW/Zcf/5kBSYys=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=iE3glzlg8aralpjxouNL9OXTHlIYHbZe90Nra+M9a7W19kyUcsykRHt3GEvxYPCsT
	 3PekHc0Laip/AFXUmHs27rPmTRMNz7S5HfCFjOT/aIALkj+lyjBmEBzPT6EyK1DMwQ
	 G6M5Qsam4JLZypZ/AO2jmYSh5ZrN+RIDk1GQJMF9zA6Jiae8IsAa6MArC67OrVBoAG
	 OmXaKz7bFW7zsBgJUCnb2Ms86ZUFPY4MhH97CUJ0vI08zSYkda9syerlpfLgl9ZDuj
	 xDLB0V+AqvuZxJLGqeZ1u6z2kJGGwvzMDq1jiyOyrgnRP9soILUeYUmbL24MvhcxPr
	 gcVr8JpzIn57A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1766161923; x=1766422423; i=teddy.astie@vates.tech;
	bh=OvdSDejbcaHbbKQCG9MCRtVqRVp7XVW/Zcf/5kBSYys=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Nry1WVOGLRtt5qddEneSyExpvu12y+XK37JJ+bpun5safAeZVRmSfcU9/rDB4ugWe
	 yIqEfpPz397MRQgCvHlsOKQheHsBUBKGQXWcsdkdidA6eUZBSFQ10FT87RgvTmbWxf
	 rGuzVvejo1C+mYRCQfSCyZAmF17TuUlVJQ4Z6EcSVUBjqPbmxwLaf7rL6QST8uibBY
	 shPViSpWRoAem3TrmNK4TL0cdZ5OGw5GNdTDLjNOmAN+mudgWYAGK3RiViN9WPszUO
	 sHld5ldALT+vEuP9CkvjK850URpCVB+NtEL8/zYPWtc+HEO9OOyarzaogM1zqmZ5i5
	 l364CDCPSSNeA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20x86/CPU/AMD:=20avoid=20printing=20reset=20reasons=20on=20Xen=20domU?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1766161922383
Message-Id: <dbe68678-0bc4-483f-aef3-e4c7462bcaff@vates.tech>
To: "Ariadne Conill" <ariadne@ariadne.space>, linux-kernel@vger.kernel.org
Cc: mario.limonciello@amd.com, darwi@linutronix.de, sandipan.das@amd.com, kai.huang@intel.com, me@mixaill.net, yazen.ghannam@amd.com, riel@surriel.com, peterz@infradead.org, hpa@zytor.com, x86@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, xen-devel@lists.xenproject.org, stable@vger.kernel.org
References: <20251219010131.12659-1-ariadne@ariadne.space>
In-Reply-To: <20251219010131.12659-1-ariadne@ariadne.space>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.d18d5be1757645a2b4114b745399e872?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251219:md
Date: Fri, 19 Dec 2025 16:32:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 19/12/2025 =C3=A0 02:04, Ariadne Conill a =C3=A9crit=C2=A0:
> Xen domU cannot access the given MMIO address for security reasons,
> resulting in a failed hypercall in ioremap() due to permissions.
> 
> Fixes: ab8131028710 ("x86/CPU/AMD: Print the reason for the last reset")
> Signed-off-by: Ariadne Conill <ariadne@ariadne.space>
> Cc: xen-devel@lists.xenproject.org
> Cc: stable@vger.kernel.org
> ---
>   arch/x86/kernel/cpu/amd.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/arch/x86/kernel/cpu/amd.c b/arch/x86/kernel/cpu/amd.c
> index a6f88ca1a6b4..99308fba4d7d 100644
> --- a/arch/x86/kernel/cpu/amd.c
> +++ b/arch/x86/kernel/cpu/amd.c
> @@ -29,6 +29,8 @@
>   # include <asm/mmconfig.h>
>   #endif
>   
> +#include <xen/xen.h>
> +
>   #include "cpu.h"
>   
>   u16 invlpgb_count_max __ro_after_init =3D 1;
> @@ -1333,6 +1335,10 @@ static __init int print_s5_reset_status_mmio(void)
>   =09if (!cpu_feature_enabled(X86_FEATURE_ZEN))
>   =09=09return 0;
>   
> +=09/* Xen PV domU cannot access hardware directly, so bail for domU case=
 */
> +=09if (cpu_feature_enabled(X86_FEATURE_XENPV) && !xen_initial_domain())
> +=09=09return 0;
> +
>   =09addr =3D ioremap(FCH_PM_BASE + FCH_PM_S5_RESET_STATUS, sizeof(value)=
);
>   =09if (!addr)
>   =09=09return 0;

Such MMIO only has a meaning in a physical machine, but the feature 
check is bogus as being on Zen arch is not enough for ensuring this.

I think this also translates in most hypervisors with odd reset codes 
being reported; without being specific to Xen PV (Zen CPU is 
unfortunately not enough to ensuring such MMIO exists).

Aside that, attempting unexpected MMIO in a SEV-ES/SNP guest can cause 
weird problems since they may not handled MMIO-NAE and could lead the 
hypervisor to crash the guest instead (unexpected NPF).

Teddy


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



