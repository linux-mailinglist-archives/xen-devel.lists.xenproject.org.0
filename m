Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC5AA6ACA7
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 19:03:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.923079.1326789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvKE7-0000uR-Jq; Thu, 20 Mar 2025 18:02:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 923079.1326789; Thu, 20 Mar 2025 18:02:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvKE7-0000t0-H9; Thu, 20 Mar 2025 18:02:43 +0000
Received: by outflank-mailman (input) for mailman id 923079;
 Thu, 20 Mar 2025 18:02:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AcMq=WH=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tvKE4-0000sj-Sa
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 18:02:42 +0000
Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch
 [79.135.106.29]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 82cc1c87-05b5-11f0-9ea0-5ba50f476ded;
 Thu, 20 Mar 2025 19:02:39 +0100 (CET)
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
X-Inumbo-ID: 82cc1c87-05b5-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=izrj3prut5c5vom3rjm773saoi.protonmail; t=1742493755; x=1742752955;
	bh=NbFD9PJaWap5Bf1zw+L3nkdnmOxwy9Pda8VfCzHaMVs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=ds56Gh6qSq3wvUYmXOUhHfZkI/wR/9xiDosmRYbL5ujlOjOkysfgyEuTshogc1Oyh
	 YxSKDAmDVfQ+rzYRq1Gp/rtPWnINPaQpfycZkT9gLoC4DSBNVvAfrE32P3Ww4pH8n3
	 Oi6C8i69mey2l5d1gFYyAKIHSryrDj7QWo98ekcPexDkqc9tGzyZUB8Dz3cDZt/ocO
	 HghCC0Gk0A9p5XG4oDT/FrGpFNb91pm7AaDVHETdY5owRSJrgzQkc8eGXJGeT6SLTA
	 ewuWmNOer+Komp47qd9aLiBItcX0Yp1ADICh/beqxywwpXcbmNuPTZwtaPlXUT2Yoz
	 qB1ixkN+2fXKQ==
Date: Thu, 20 Mar 2025 18:02:29 +0000
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH v1 4/4] x86:hvm: make nestedhvm support optional
Message-ID: <311wkeHyQ8rJRAw1aALCMKlxFw_NbyQSIojdillPXi0x8QxP9MY83WnGyuGTQocLa61GozGCQN5br4M__74m1oMmGSM_xkp3hjMaKZ6bWR8=@proton.me>
In-Reply-To: <e4f77564313d20ad4f3b94bde0672250f7d99bb4.1742465624.git.Sergiy_Kibrik@epam.com>
References: <cover.1742465624.git.Sergiy_Kibrik@epam.com> <e4f77564313d20ad4f3b94bde0672250f7d99bb4.1742465624.git.Sergiy_Kibrik@epam.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 72d3aa12187fc2c98f4dc14e3a2b0b59bab7f41a
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

On Thursday, March 20th, 2025 at 3:40 AM, Sergiy Kibrik <Sergiy_Kibrik@epam=
.com> wrote:

>=20
>=20
> Introduce NESTEDHVM config option that controls nested virtualization in =
both
> SVM & VMX code. The option is for reduction of dead code on systems that
> aren't intended to run in nested mode.
>=20
> Signed-off-by: Sergiy Kibrik Sergiy_Kibrik@epam.com
>=20
> ---
> xen/arch/x86/Kconfig | 5 +++++
> xen/arch/x86/hvm/Makefile | 2 +-
> xen/arch/x86/hvm/svm/Makefile | 2 +-
> xen/arch/x86/hvm/svm/entry.S | 2 ++
> xen/arch/x86/hvm/svm/svm.c | 4 ++++
> xen/arch/x86/hvm/vmx/Makefile | 2 +-
> xen/arch/x86/hvm/vmx/entry.S | 2 ++
> xen/arch/x86/hvm/vmx/vmcs.c | 8 +++++---
> xen/arch/x86/hvm/vmx/vmx.c | 10 +++++++++-
> xen/arch/x86/include/asm/hvm/nestedhvm.h | 10 +++++++++-
> 10 files changed, 39 insertions(+), 8 deletions(-)
>=20
> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
> index 6e41bc0fb4..bc140d8b77 100644
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -144,6 +144,11 @@ config INTEL_VMX
> If your system includes a processor with Intel VT-x support, say Y.
> If in doubt, say Y.
>=20
> +config NESTEDHVM
> + bool "Support nested virtualization" if EXPERT
> + depends on HVM
> + default y

There's dedicated Kconfig for HVM build-time configuration on staging at:

  arch/x86/hvm/Kconfig

Suggest plumbing new knob there.

Thanks,
Denis


