Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78329B164EC
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 18:45:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1064240.1429964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh9vD-00068L-SC; Wed, 30 Jul 2025 16:44:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1064240.1429964; Wed, 30 Jul 2025 16:44:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh9vD-000665-OH; Wed, 30 Jul 2025 16:44:55 +0000
Received: by outflank-mailman (input) for mailman id 1064240;
 Wed, 30 Jul 2025 16:44:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tpBq=2L=bounce.vates.tech=bounce-md_30504962.688a4c01.v1-a2afb5fd94df49e09e55ceaf43d2061a@srs-se1.protection.inumbo.net>)
 id 1uh9vB-00065x-HQ
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 16:44:53 +0000
Received: from mail145-22.atl61.mandrillapp.com
 (mail145-22.atl61.mandrillapp.com [198.2.145.22])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 82aa041a-6d64-11f0-b895-0df219b8e170;
 Wed, 30 Jul 2025 18:44:51 +0200 (CEST)
Received: from pmta06.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail145-22.atl61.mandrillapp.com (Mailchimp) with ESMTP id
 4bsdNd2q0zzFCWb3m
 for <xen-devel@lists.xenproject.org>; Wed, 30 Jul 2025 16:44:49 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 a2afb5fd94df49e09e55ceaf43d2061a; Wed, 30 Jul 2025 16:44:49 +0000
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
X-Inumbo-ID: 82aa041a-6d64-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1753893889; x=1754163889;
	bh=g7+dEaN4eR6inkgvkL913VImLwIHEO1vMpjFLzCRDGE=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=b3slFiEF0ThhS4s4kSFvXmotkHNL+G+RSEAJMD3+GsOkbNejSMXv/4lDNzkA5o2xl
	 0zyWzorsU56kXE9F4mj/HxD89gbvLYbrD2AwHD2cmE4zwnIvGVnJlYqodzS9mJSRUx
	 JJTaE7zAmTAMJ4h+xgvAdZGXLOQls3c1ShNCwjnFInr0JevfA7fp1OEvW5jKRvO+4n
	 4Zdlx89Lab7d55CyUIVkaCCPhEJ5X+DbsXRUWWNjny0V43kwy2g4hhCBXahkY+FDAD
	 qIxcMJiqbVsa7hCqbiPUQrumC5PJjed+Nuzfa4zbajsTsJkEx48Fa/KQlUNMhZlTQ2
	 ZJdaRPymaXeSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1753893889; x=1754154389; i=teddy.astie@vates.tech;
	bh=g7+dEaN4eR6inkgvkL913VImLwIHEO1vMpjFLzCRDGE=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=pcKsOuNh8QGpkFGniF16Sqa2Oz8WrulF6/TrzrJHCb4pG4K68qF4BrJlx0Us6BfKk
	 j1lQldUTq9pMbiBCIk+fqldskNB0yw7tjh6kv6LPUX4zmG17ugbpP7cUh0MeJDfg5y
	 cwKCnzzKTVrcR9/6gLRDFIO0JY9uVWgc0n8QVJDT8D+oco1U8f93dzWbm2fhWO9kFr
	 nwIRXJ5o+K/4YOcXkuUomDYKLtDdUmSDciiFaqVKBS7JOyXIJo1wDfDbnZeBFa6J0O
	 qsQ6bvJc2zC6z9QjZKDKUEuEsGqMb92exb99wwZkOgtl2MjVzV0dAneNVyf5mmwWid
	 JuKtioUnzS+VQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20x86/vmx:=20Avoid=20pausing=20on=20HVM=5FPARAM=5FIDENT=5FPT=20in=20additional=20cases?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1753893888421
Message-Id: <62432483-bf01-4a9d-abfc-ad9ff7d2d53d@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
References: <698e46b8f986e649c661f4382c929abcc2827ec3.1753893493.git.teddy.astie@vates.tech>
In-Reply-To: <698e46b8f986e649c661f4382c929abcc2827ec3.1753893493.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.a2afb5fd94df49e09e55ceaf43d2061a?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250730:md
Date: Wed, 30 Jul 2025 16:44:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 30/07/2025 =C3=A0 18:40, Teddy Astie a =C3=A9crit=C2=A0:
> When settings HVM_PARAM_IDENT_PT, skip domain pausing when :
> - there is no vcpu
> - unrestricted guest capability is used
> 
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
>   xen/arch/x86/hvm/hvm.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index e2720daf1e..39ff1bdbe1 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -4286,11 +4286,13 @@ static int hvm_set_param(struct domain *d, uint32=
_t index, uint64_t value)
>               rc =3D -EINVAL;
>           break;
>       case HVM_PARAM_IDENT_PT:
> +        v =3D domain_vcpu(d, 0);
> +
>           /*
>            * Only actually required for VT-x lacking unrestricted_guest
>            * capabilities.  Short circuit the pause if possible.
>            */
> -        if ( !paging_mode_hap(d) || !cpu_has_vmx )
> +        if ( !paging_mode_hap(d) || !cpu_has_vmx || !v || vmx_unrestrict=
ed_guest(v) )
>           {
>               d->arch.hvm.params[index] =3D value;
>               break;

Although, I am not completely sure if the vcpu checks (including 
vmx_unrestricted_guest one) needs to be moved after the domctl_lock_acquire=
.


Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



