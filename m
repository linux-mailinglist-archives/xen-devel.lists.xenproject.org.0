Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A5FA797D7
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 23:46:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.936089.1337407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u05uN-0001sm-9u; Wed, 02 Apr 2025 21:46:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 936089.1337407; Wed, 02 Apr 2025 21:46:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u05uN-0001pv-70; Wed, 02 Apr 2025 21:46:03 +0000
Received: by outflank-mailman (input) for mailman id 936089;
 Wed, 02 Apr 2025 21:46:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CoDa=WU=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u05uM-0001ph-Hy
 for xen-devel@lists.xenproject.org; Wed, 02 Apr 2025 21:46:02 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dea41218-100b-11f0-9eaa-5ba50f476ded;
 Wed, 02 Apr 2025 23:46:01 +0200 (CEST)
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
X-Inumbo-ID: dea41218-100b-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1743630360; x=1743889560;
	bh=2O1kGMLaTlLl5JHSdR5zf6l3ThcyTHn9xa2ox9FZA50=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=SkNShEUeG3iQS9fKVhudWpT2j0pY4umPzcNfyDOuWZFi9McMmLe/3qrbfP9dzF/0q
	 QuwMCkSG3WdLHEazhCMfIGFQATekCEmuvZft7AQoky7vAqUeoabNsWERwgqit7BVs3
	 fWA95QHSm2wViukilhKqQsC2T7s0mqvKToA28En6mSe1BaSD9vXOFshUOoGYiF3GLh
	 W9NQ1fehI70yhiSSL7pg+G+KaN/t8CMT/Z/fYoItAmXJwvPUU2D5gdjSdhpGw7s9iO
	 HyTrT1HVYBvmIyE2CFknBxZNdME1nhVlNn85HjXURvmiIewBu+Gzf648oCC7XAdDud
	 UVvh6ooU6Q/PA==
Date: Wed, 02 Apr 2025 21:45:56 +0000
To: xen-devel@lists.xenproject.org
From: Denis Mukhin <dmkhn@proton.me>
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: Re: [PATCH v2] x86/domain: revisit logging in arch_domain_create()
Message-ID: <qB_dfgqIHku9ojcMtx7Rv8BnT5JJG_lR8zAel48G1FTnc5NoYnW3XSYOHEnHp4zf0J_JObBDxf5czJVpuAyZ_E_PUQLmdeQrRb2TVo8Gr6Y=@proton.me>
In-Reply-To: <20250401211018.75814-1-dmukhin@ford.com>
References: <20250401211018.75814-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 7e16880c56190518ec26e337f7ad9041e2850b27
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tuesday, April 1st, 2025 at 2:10 PM, dmkhn@proton.me <dmkhn@proton.me> w=
rote:

>=20
>=20
> From: Denis Mukhin dmukhin@ford.com
>=20
>=20
> Use %pd in all logs issued from arch_domain_create().
>=20
> Also, expand error message in arch_domain_create() under
> !emulation_flags_ok() case to help debugging.
>=20
> Signed-off-by: Denis Mukhin dmukhin@ford.com
>=20
> ---
> Changes since v1:
> - dropped parentheses around "hardware" in the log message
> ---
> xen/arch/x86/domain.c | 18 ++++++++++--------
> 1 file changed, 10 insertions(+), 8 deletions(-)
>=20
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index 4989600627..bd887b4d44 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -791,13 +791,12 @@ int arch_domain_create(struct domain *d,
> {
> if ( !opt_allow_unsafe )
> {
> - printk(XENLOG_G_ERR "Xen does not allow DomU creation on this CPU"
> - " for security reasons.\n");
> + printk(XENLOG_G_ERR "%pd: Xen does not allow DomU creation on this CPU"
> + " for security reasons.\n", d);

Forgot to remove full stops in the messages.
Sent v3:
  https://lore.kernel.org/xen-devel/20250402214406.115578-1-dmukhin@ford.co=
m/

> return -EPERM;
> }
> printk(XENLOG_G_WARNING
> - "Dom%d may compromise security on this CPU.\n",
> - d->domain_id);
>=20
> + "%pd: domain may compromise security on this CPU.\n", d);
> }
>=20
> emflags =3D config->arch.emulation_flags;
>=20
> @@ -807,16 +806,19 @@ int arch_domain_create(struct domain *d,
>=20
> if ( emflags & ~XEN_X86_EMU_ALL )
> {
> - printk(XENLOG_G_ERR "d%d: Invalid emulation bitmap: %#x\n",
> - d->domain_id, emflags);
>=20
> + printk(XENLOG_G_ERR "%pd: Invalid emulation bitmap: %#x\n",
> + d, emflags);
> return -EINVAL;
> }
>=20
> if ( !emulation_flags_ok(d, emflags) )
> {
> - printk(XENLOG_G_ERR "d%d: Xen does not allow %s domain creation "
> + printk(XENLOG_G_ERR "%pd: Xen does not allow %s %sdomain creation "
> "with the current selection of emulators: %#x\n",
> - d->domain_id, is_hvm_domain(d) ? "HVM" : "PV", emflags);
>=20
> + d,
> + is_hvm_domain(d) ? "HVM" : "PV",
> + is_hardware_domain(d) ? "hardware " : "",
> + emflags);
> return -EOPNOTSUPP;
> }
> d->arch.emulation_flags =3D emflags;
>=20
> --
> 2.34.1

