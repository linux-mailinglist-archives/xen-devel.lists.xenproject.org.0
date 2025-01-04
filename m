Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 898A5A01207
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 04:12:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865064.1276342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTuZv-0005oX-MW; Sat, 04 Jan 2025 03:11:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865064.1276342; Sat, 04 Jan 2025 03:11:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTuZv-0005mJ-JI; Sat, 04 Jan 2025 03:11:55 +0000
Received: by outflank-mailman (input) for mailman id 865064;
 Sat, 04 Jan 2025 03:11:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EL/b=T4=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tTuZu-0005ks-Rw
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 03:11:54 +0000
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch
 [79.135.106.30]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a60d187e-ca49-11ef-a0de-8be0dac302b0;
 Sat, 04 Jan 2025 04:11:53 +0100 (CET)
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
X-Inumbo-ID: a60d187e-ca49-11ef-a0de-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1735960313; x=1736219513;
	bh=XhSfTK5A/gSSmG2o1IDtwcC/PT50mAZS/JpJ6dBm8GQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=UME6PSQ/KtnntOOksgHzXx5gh6azPmzVQP96edfG9xxjNg3GjCy8VmKrj2D/hORpx
	 ELL8+QU7wU3mv2m7ZlHQRt4xW8APR5EZTnXdvcVQ7fF/VVyGPcKnkdUf7Gw3tJ/mTs
	 FAWVN1njmeFBxibK3FWOdpJ6fl2FLcqWpNMvD8mSPcO+pzG9BE1RPubW7YfKhHdeSd
	 7Ksm3BooOxUQnn27bUUd1pMy5D8aLUd6MaU1//+uh3sTLs0EUcKVquc48S9QdQaVT3
	 OoqxM6IqLzCHFyPMQMCpktyXpvXbZ4NgxZNJhFd4D+0kAeJMLhlhLXcUxC0fnlxeM9
	 2c5B6TRyrTYzw==
Date: Sat, 04 Jan 2025 03:11:48 +0000
To: =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: dmukhin@ford.com, xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 08/35] x86/domain: introduce domain_has_vuart()
Message-ID: <74eWstUP8IuaVVwOsb-PJlp1VQeT060VGHyjzVvq2Ph5pT3bwt_CDD4lXgeMPzJglsZpl6WA22vAnFtQaiyJiW52NrfP4lJfkDCVhjbm7Ok=@proton.me>
In-Reply-To: <Z1msGHspF2_bi3fF@macbook.local>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com> <20241205-vuart-ns8250-v1-8-e9aa923127eb@ford.com> <Z1msGHspF2_bi3fF@macbook.local>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 175d749523fefe69caec89d7fe10101f3b9c730d
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On Wednesday, December 11th, 2024 at 7:13 AM, Roger Pau Monn=C3=A9 <roger.p=
au@citrix.com> wrote:

>
>
> On Thu, Dec 05, 2024 at 08:41:38PM -0800, Denis Mukhin via B4 Relay wrote=
:
>
> > From: Denis Mukhin dmukhin@ford.com
> >
> > Introduce domain_has_vuart() for x86 port to be used in the console dri=
ver.
> >
> > Signed-off-by: Denis Mukhin dmukhin@ford.com
> > ---
> > xen/arch/x86/include/asm/domain.h | 3 +++
> > 1 file changed, 3 insertions(+)
> >
> > diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/a=
sm/domain.h
> > index b79d6badd71c4d96279555df62fad75fe817a2b6..c1d0d1f47324e8cc678a4c7=
6c43f86820a89e7b3 100644
> > --- a/xen/arch/x86/include/asm/domain.h
> > +++ b/xen/arch/x86/include/asm/domain.h
> > @@ -506,6 +506,9 @@ struct arch_domain
> > #define has_pirq(d) (!!((d)->arch.emulation_flags & X86_EMU_USE_PIRQ))
> > #define has_vpci(d) (!!((d)->arch.emulation_flags & X86_EMU_VPCI))
> >
> > +/* NB: same symbol as in Arm port */
> > +#define domain_has_vuart(d) false
>
>
> Don't you need to consume d in the macro, ie:
>
> #define domain_has_vuart(d) ((void)(d), false)

I reworked that code and merged per-arch domain_has_vuart() patches
into one arch-independent domain_has_vuart().

>
> Thanks, Roger.



