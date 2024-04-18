Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 774288A9B48
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 15:30:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708379.1107259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxRpz-0000ae-D8; Thu, 18 Apr 2024 13:30:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708379.1107259; Thu, 18 Apr 2024 13:30:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxRpz-0000YG-A7; Thu, 18 Apr 2024 13:30:03 +0000
Received: by outflank-mailman (input) for mailman id 708379;
 Thu, 18 Apr 2024 13:30:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wd5e=LX=bounce.vates.tech=bounce-md_30504962.66212056.v1-655cacc3846a450a9b5dbe6873ae8bd8@srs-se1.protection.inumbo.net>)
 id 1rxRpx-0000Ko-Qj
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 13:30:01 +0000
Received: from mail145-32.atl61.mandrillapp.com
 (mail145-32.atl61.mandrillapp.com [198.2.145.32])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c105e356-fd87-11ee-b909-491648fe20b8;
 Thu, 18 Apr 2024 15:30:00 +0200 (CEST)
Received: from pmta06.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail145-32.atl61.mandrillapp.com (Mailchimp) with ESMTP id
 4VKzCp2bVTzP0JwVJ
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2024 13:29:58 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 655cacc3846a450a9b5dbe6873ae8bd8; Thu, 18 Apr 2024 13:29:58 +0000
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
X-Inumbo-ID: c105e356-fd87-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1713446998; x=1713707498;
	bh=wICY7ny2ZCfxEeyzkcNCEqo9+fMURVyeSoPb1nSdA9s=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=m6TsG6AmjiaLFuSAKSNw1MP+pSI7Xe4luoOnoEteXCTLiRiHPo1NuDexEZuhkb5BG
	 pq81TugBqevhx7FPElyKbfc0ZOPY/nW9rvFjgYU1BzqCe5N/+IVBdzJ2J34qJUfvlI
	 B1itDN6tY7Ov3N+40A65hFSZi72RR3RCwx44IpVBhphRRlOtMOiCgeCyhiKr1jIp9h
	 xkrjzIdWjWVZyz0gdtrb5U07LV+DsvBk1430q+Q2jeh0gbln5yYSQRowGPVmHr7Zuy
	 ztlD9mVz1g2bbShchFbNncIUMaKwiwCn6aRB3immrJst7XRZg/zdXxF1TPqiuX22xU
	 j0ZKMQB+tPNrQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1713446998; x=1713707498; i=andrei.semenov@vates.tech;
	bh=wICY7ny2ZCfxEeyzkcNCEqo9+fMURVyeSoPb1nSdA9s=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ARVmbN9aL4B7j7KxpWzEGE5hptrL+JxVfZpqSFx1nVni9S+/DXJ8v4gsinXcbd4wZ
	 zHos9gHqBwnJlzKuuMwtYW+Im5pkr//dFzhz3xTVAekjuHaWhdARorzvIEiXgRHj+r
	 Qs+DTeriXXO3LOzggP+CLYS87nxsrUpL0YrMkGlf4DoOc38+PFhIzs1fm6daM2VmPB
	 GWPzYJmBev3IWlTDhwwJ2xyXdTxdVvaRKB0Cc/WNx2QxsNrkrPvo+I40QZPfVGDu5Q
	 waCHcq5nVawnubLvRe28cTHyMbuudlvzrxiLH9AXf1yPZFgXEQnuNDY259n8fUEBmu
	 RIMsA/dTsFZsw==
From: Andrei Semenov <andrei.semenov@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v1=201/2]=20Implemented=20AMD=20SEV=20discovery=20and=20enabling.?=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1713446997313
Message-Id: <f21507af-22e1-40d0-ab35-654789d268b0@vates.tech>
To: Jan Beulich <jbeulich@suse.com>, Andrei Semenov <andrei.semenov@vates.fr>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1712759753.git.andrei.semenov@vates.fr> <27fce67472c97b2b2b7cc0412bf0edcaa67cc63f.1712759753.git.andrei.semenov@vates.fr> <b66ea826-f670-4a9d-89cb-4de6cb3ec9fc@suse.com>
In-Reply-To: <b66ea826-f670-4a9d-89cb-4de6cb3ec9fc@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.655cacc3846a450a9b5dbe6873ae8bd8?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240418:md
Date: Thu, 18 Apr 2024 13:29:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Thank you Jan for your feedback.

 From what I understood, Andrew is planning some "ground" changes

on CPUID leaf discovery, so it probably will move here.=C2=A0 I'll wait for=
 his

changes to apply your and Andrew's remarks and to re-post the patches.

Andrei.

On 4/18/24 10:13, Jan Beulich wrote:
> On 10.04.2024 17:36, Andrei Semenov wrote:
>> Signed-off-by: Andrei Semenov <andrei.semenov@vates.fr>
> A couple more nits on top of what Andrew said. First: Please no patches
> (which aren't blindingly trivial) without description.
>
>> @@ -1030,6 +1031,54 @@ static void amd_check_erratum_1485(void)
>>   =09wrmsrl(MSR_AMD64_BP_CFG, val | chickenbit);
>>   }
>>   
>> +#ifdef CONFIG_HVM
>> +static void amd_enable_mem_encrypt(const struct cpuinfo_x86 *c)
>> +{
>> +=09unsigned int  eax, ebx, ecx, edx;
>> +=09uint64_t syscfg;
>> +
>> +=09if (!smp_processor_id()) {
>> +
>> +=09=09cpuid_count(0x80000000,0,&eax, &ebx, &ecx, &edx);
> No blank line above here please.
>
>> +=09=09if (eax <  0x8000001f)
>> +=09=09=09return;
>> +
>> +=09=09cpuid_count(0x8000001f,0,&eax, &ebx, &ecx, &edx);
>> +
>> +=09=09if (eax & 0x1)
>> +=09=09=09setup_force_cpu_cap(X86_FEATURE_SME);
>> +
>> +=09=09if (eax & 0x2) {
>> +=09=09=09setup_force_cpu_cap(X86_FEATURE_SEV);
> I guess this goes along with what Andrew said: Using synthetic features h=
ere
> looks suspicious. These want to be recorded as an ordinary leaf.
>
>> +=09=09=09max_sev_asid =3D ecx;
>> +=09=09=09min_sev_asid =3D edx;
>> +=09=09}
>> +
>> +=09=09if (eax & 0x3)
>> +=09=09=09pte_c_bit_mask =3D 1UL << (ebx & 0x3f);
>> +=09}
>> +
>> +=09if (!(cpu_has_sme || cpu_has_sev))
>> +=09=09return;
>> +
>> +=09if (!smp_processor_id()) {
>> +=09=09if (cpu_has_sev)
> Two if()-s like these want folding, unless it is made clear that very
> soon (see above as to the missing description) further content is going
> to appear inside the outer one.
>
>> +=09=09=09printk(XENLOG_INFO "SEV: ASID range [0x%x - 0x%x]\n",
> %#x is preferred over 0x%x.
>
>> +=09=09=09min_sev_asid, max_sev_asid);
>> +=09}
>> +
>> +=09rdmsrl(MSR_K8_SYSCFG, syscfg);
>> +
>> +=09if (syscfg & SYSCFG_MEM_ENCRYPT) {
>> +=09=09return;
>> +=09}
> No need for braces in cases like this one.
>
> Jan


