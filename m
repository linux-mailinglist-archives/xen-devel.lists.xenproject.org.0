Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC24AA0966B
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 16:51:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869824.1281278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWHIX-0002uW-CF; Fri, 10 Jan 2025 15:51:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869824.1281278; Fri, 10 Jan 2025 15:51:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWHIX-0002t3-9f; Fri, 10 Jan 2025 15:51:45 +0000
Received: by outflank-mailman (input) for mailman id 869824;
 Fri, 10 Jan 2025 15:51:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mmVM=UC=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tWHIW-0002sx-7i
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 15:51:44 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c99f8644-cf6a-11ef-a0df-8be0dac302b0;
 Fri, 10 Jan 2025 16:51:43 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4361fe642ddso23740125e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jan 2025 07:51:43 -0800 (PST)
Received: from localhost ([66.81.170.107]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2ddd013sm91688465e9.24.2025.01.10.07.51.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jan 2025 07:51:41 -0800 (PST)
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
X-Inumbo-ID: c99f8644-cf6a-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1736524302; x=1737129102; darn=lists.xenproject.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iwZXzZRO2IyjqibXEh9atU1QSD30JAVCPU+qoFD9bTA=;
        b=dxhaSwB18l4Ml5GoAr71VouL/GxT7ESj+J6EIVirmhwSBCScYyzm0f4CU2jEx9gpzr
         j+i0VDD5V2gjgIN7kPwnOIVx7wDub2noG5rRbbK0P2yImfiKRofWy4jc+f2HaFmG+hHk
         VPQWm1xnVtG4t2AvDuBZ7v8lbv9OKwZN6B2gE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736524302; x=1737129102;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iwZXzZRO2IyjqibXEh9atU1QSD30JAVCPU+qoFD9bTA=;
        b=SQd+E7zWt35N5AuGrRYUc0byHqUJYSoXf+yLl/m4Z4cFERBpM8yJwiPS4YGXI33eE8
         uK33w1cmtcbveOYQnoiiB4fmc6EpLRjzF49QnbZ7B04DI07OwIwCjBv3/nrObkPS5rOq
         ixTftgxXE1j7zWJIEbRASvR8b1/H9NTtetarncnZ4aQshNfMoRHM1Cfd+z0LUz7hVRGV
         QFUaWF2NtukOpG6zVc2/Hv4GOZ7wFe6AByOXHoY4gALkdzdh/h89hsStrjU8k8D7ewQT
         N3ZzJpKzZx7lluzndkqzZRTwEvCOUS8nV069j8nacmpXVl4UZ7QAufd7HTc8u935eEhY
         ucIw==
X-Gm-Message-State: AOJu0YwjceTNCzGZzleRcz4T1D2pBuYnrtaEkVNdrZddjICJ1o1qz92F
	li3yUU5PXtXZhR2RzHX25rhOjHElHisRsqTDoJVw1tpBOHCf2Ij7qnkggJqURJI=
X-Gm-Gg: ASbGnculyFY4HNK14NLAqj0P4zAtvBgBuKd8dQW9IvLqw2NfNDh/dKQWsWq/xxCGoc1
	OW3FltOwOO+tzAu2o9Yna3FUF/RO6wyU5yQB2U/t99OlhWaKvAaz9vWOm+zrjOnhegFPrSMKdiI
	rZBF99FCGK4MrDWPj1AEP6M60mdvS6Vydhvc8Hq+IOlPhWjPn1cTEayBd087MiW0Jx5wu+saIEy
	mvHj5Kbo+5HVPMU5JjzAfl/cSq7Q3NJR//9L5vD7zeQIsc0F9q4ZNjGdFkK/QE=
X-Google-Smtp-Source: AGHT+IHToGuxDjdFJHa5XBo7mCodPJYVNtgYHm3DQgaPGMIV7J8TQGsup6Hb9IX5HyKoSamt9Oo+xQ==
X-Received: by 2002:a05:600c:444d:b0:434:f739:7ce2 with SMTP id 5b1f17b1804b1-436eedef4e5mr32807065e9.8.1736524302357;
        Fri, 10 Jan 2025 07:51:42 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Jan 2025 15:51:38 +0000
Message-Id: <D6YIHLM1RTKR.3QLY96ZGZD6AG@cloud.com>
Subject: Re: [PATCH v2 13/18] x86/spec-ctrl: introduce Address Space
 Isolation command line option
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: <xen-devel@lists.xenproject.org>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>,
 "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>,
 "Julien Grall" <julien@xen.org>, "Stefano Stabellini"
 <sstabellini@kernel.org>
X-Mailer: aerc 0.18.2
References: <20250108142659.99490-1-roger.pau@citrix.com>
 <20250108142659.99490-14-roger.pau@citrix.com>
 <D6XMQD34DXRE.24L7RC2WUI298@cloud.com> <Z4E0-5KUWh2AJu50@macbook.local>
In-Reply-To: <Z4E0-5KUWh2AJu50@macbook.local>

On Fri Jan 10, 2025 at 2:55 PM GMT, Roger Pau Monn=C3=A9 wrote:
> On Thu, Jan 09, 2025 at 02:58:29PM +0000, Alejandro Vallejo wrote:
> > On Wed Jan 8, 2025 at 2:26 PM GMT, Roger Pau Monne wrote:
> > > No functional change, as the option is not used.
> > >
> > > Introduced new so newly added functionality is keyed on the option be=
ing
> > > enabled, even if the feature is non-functional.
> > >
> > > When ASI is enabled for PV domains, printing the usage of XPTI might =
be
> > > omitted if it must be uniformly disabled given the usage of ASI.
> > >
> > > Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> > > ---
> > > Changes since v1:
> > >  - Improve comments and documentation about what ASI provides.
> > >  - Do not print the XPTI information if ASI is used for pv domUs and =
dom0 is
> > >    PVH, or if ASI is used for both domU and dom0.
> > >
> > > FWIW, I would print the state of XPTI uniformly, as otherwise I find =
the output
> > > might be confusing for user expecting to assert the state of XPTI.
> > > ---
> > >  docs/misc/xen-command-line.pandoc    |  19 +++++
> > >  xen/arch/x86/include/asm/domain.h    |   3 +
> > >  xen/arch/x86/include/asm/spec_ctrl.h |   2 +
> > >  xen/arch/x86/spec_ctrl.c             | 115 +++++++++++++++++++++++++=
--
> > >  4 files changed, 133 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-comman=
d-line.pandoc
> > > index 08b0053f9ced..3c1ad7b5fe7d 100644
> > > --- a/docs/misc/xen-command-line.pandoc
> > > +++ b/docs/misc/xen-command-line.pandoc
> > > @@ -202,6 +202,25 @@ to appropriate auditing by Xen.  Argo is disable=
d by default.
> > >      This option is disabled by default, to protect domains from a Do=
S by a
> > >      buggy or malicious other domain spamming the ring.
> > > =20
> > > +### asi (x86)
> > > +> `=3D List of [ <bool>, {pv,hvm}=3D<bool>,
> > > +               {vcpu-pt}=3D<bool>|{pv,hvm}=3D<bool> ]`
> >=20
> > nit: While this grows later, the braces around vcpu-pt aren't strictly =
needed here.
>
> Since I have to modify the whole line I can indeed add the braces
> later.
>
> > > +
> > > +Offers control over whether the hypervisor will engage in Address Sp=
ace
> > > +Isolation, by not having potentially sensitive information permanent=
ly mapped
> > > +in the VMM page-tables.  Using this option might avoid the need to a=
pply
> > > +mitigations for certain speculative related attacks, at the cost of =
mapping
> > > +sensitive information on-demand.
> >=20
> > Might be worth mentioning that this provides some defense in depth agai=
nst
> > unmitigated attacks too.
>
> It's IMO a bit too vague to make such promises, but I can add:
>
> Offers control over whether the hypervisor will engage in Address Space
> Isolation, by not having potentially sensitive information permanently ma=
pped
> in the VMM page-tables.  Using this option might avoid the need to apply
> mitigations for certain speculative related attacks, at the cost of mappi=
ng
> sensitive information on-demand.  It might also offer some protection
> against unmitigated speculation-related attacks.

SGTM

Cheers,
Alejandro

