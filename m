Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C090A0128B
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 06:26:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865367.1276671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTwfo-0001uq-C3; Sat, 04 Jan 2025 05:26:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865367.1276671; Sat, 04 Jan 2025 05:26:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTwfo-0001su-97; Sat, 04 Jan 2025 05:26:08 +0000
Received: by outflank-mailman (input) for mailman id 865367;
 Sat, 04 Jan 2025 05:26:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EL/b=T4=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tTwfm-0001so-9J
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 05:26:06 +0000
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64e2f647-ca5c-11ef-a0de-8be0dac302b0;
 Sat, 04 Jan 2025 06:26:05 +0100 (CET)
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
X-Inumbo-ID: 64e2f647-ca5c-11ef-a0de-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1735968364; x=1736227564;
	bh=6O2TyodfIn+2B+Sx2boWvlNccNa0ciWTQzitCKF/U4E=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=GrqeVho4mVruNVlEcr/EM3T9yoVb8QmGwoz1wELYhnt/ewIRNfSJSxQgv7Ce0qK2T
	 Szy/lHO7oKS/qj0nwrDF2xAmflJzCatgWHuaaKk0TZ7FQEFr3kQPLLqF8scGYEBA/a
	 I+YTggRRbRQMbCBp5qNFP7djiM2t5p5EGQxNsg9nAmLr5AQd1mMyo7pM07693IzYTo
	 0/UD4epfyBgHze5SF6fI/VFI4QY7PhtcwuyuWn3HpDyn+/3phl8itL0IaUkDJCyVf1
	 YVA3f+sww51dbwhSs7ob0zObg8Mi38+akJRf4CBB/1LjAM8YGfllrInhRaehW577Ts
	 F/1VnUogw5TFA==
Date: Sat, 04 Jan 2025 05:26:01 +0000
To: Jan Beulich <jbeulich@suse.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: dmukhin@ford.com, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 33/35] x86/domain: implement domain_has_vuart()
Message-ID: <naBtNUtu9na6gqKutYIswJRWPfnix56y6duz-hNxtz1R3od6xMldtUGGrhRDi43js60XIEjV7H7g1v8E-qDBPACT5ISccOaJz2jYuylB8Pk=@proton.me>
In-Reply-To: <e344d00e-4cd5-4a11-9d6a-046fa135fd80@suse.com>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com> <20241205-vuart-ns8250-v1-33-e9aa923127eb@ford.com> <e344d00e-4cd5-4a11-9d6a-046fa135fd80@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 03e756ec86211a1376ee33933b5c4b05e042c7f5
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Monday, December 16th, 2024 at 7:11 AM, Jan Beulich <jbeulich@suse.com> =
wrote:

>
>
> On 06.12.2024 05:42, Denis Mukhin via B4 Relay wrote:
>
> > --- a/tools/libs/light/libxl_x86.c
> > +++ b/tools/libs/light/libxl_x86.c
> > @@ -8,7 +8,11 @@ int libxl__arch_domain_prepare_config(libxl__gc gc,
> > {
> > switch(d_config->c_info.type) {
> > case LIBXL_DOMAIN_TYPE_HVM:
> > - config->arch.emulation_flags =3D (XEN_X86_EMU_ALL & ~XEN_X86_EMU_VPCI=
);
> > + config->arch.emulation_flags =3D XEN_X86_EMU_ALL;
> > + config->arch.emulation_flags &=3D ~XEN_X86_EMU_VPCI;
> > + / Virtual UART is selected at Xen build time */
> > + config->arch.emulation_flags &=3D ~XEN_X86_EMU_VUART;
>
>
> That is all domains, even post-boot created ones, only ever get the same
> setting?

Toolstack cannot control vUART configuration yet. vUART can be enabled for
HVM domains only at this point and only globally, which seemed enough for t=
he
initial implementation.
PVH needs some more work because PVH does not have vPIC.

I did not plan to enable per-domain configuration in this patch series (pla=
n
to address in the follow on series). The emulator is disabled in default Xe=
n
configuration, so it should not affect the existing default behavior.

>
> Jan



