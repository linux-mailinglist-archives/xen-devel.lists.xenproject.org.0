Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E312EA0313B
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2025 21:17:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865981.1277276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUtWp-0000ip-EW; Mon, 06 Jan 2025 20:16:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865981.1277276; Mon, 06 Jan 2025 20:16:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUtWp-0000gz-Bx; Mon, 06 Jan 2025 20:16:47 +0000
Received: by outflank-mailman (input) for mailman id 865981;
 Mon, 06 Jan 2025 20:16:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4xez=T6=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tUtWo-0000gs-MW
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2025 20:16:46 +0000
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 268ffa0d-cc6b-11ef-a0df-8be0dac302b0;
 Mon, 06 Jan 2025 21:16:45 +0100 (CET)
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
X-Inumbo-ID: 268ffa0d-cc6b-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1736194604; x=1736453804;
	bh=oSRu0GzfjzbLD2kUe3GRdGKX/GdSrGLmNvK5lP+qiwk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=N4PrNNG541SKnRVUDkjbmAkKurQ5O0ruES11PhnDBrh2x6TW4JDcGmUfRDFgzzYKp
	 +7wXD9htizzhc9vfu6yY6MUZxHUZrNta50UB92gitsGNAxE8Uvv8sTcjd0noszeP27
	 iQ3/Gii/RVZa5q4Rg1qfnTvveLSUUrxWdPoO5UH0B+lqYxrzknD1PiCuhTKkZz/nIC
	 M1xU8zbggn1buIQoGj5ynO4kWvuyDPTqilGld9iAA4Fg4rGIebP/m+M/RClRgjr5/L
	 5wRYEcbqzZhzZ3XG98bwVlxVhfBvHPXmZVpRxBxppbiDHheuVF/vZx+PkdsfQLMLOy
	 mfpB9c9fjXfxg==
Date: Mon, 06 Jan 2025 20:16:38 +0000
To: Jan Beulich <jbeulich@suse.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: Denis Mukhin <dmkhn@proton.me>, dmukhin@ford.com, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 31/35] x86/hvm: introduce NS8250 UART emulator
Message-ID: <V4pjEMTV_MhwDERhOJQksxnt1aNMN6cE5z0lRjvE-4R1cdBRizIaMikI1hNXYB0tei3ljgLOWVQkMITOEeeBYIsNQzblqB7g8jJJwalRzY0=@proton.me>
In-Reply-To: <5e4fb323-0dd1-4eb9-9e83-245ab516be06@suse.com>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com> <20241205-vuart-ns8250-v1-31-e9aa923127eb@ford.com> <3be247cc-900b-48f3-98f3-0d97532ede76@suse.com> <DJo9IkTvGXsao_hA4njnkX9OVYVR6tXdo95AeBiT8wGtbPb7UKQjLCqqIset3bJ3JbLqogcIb4wPqNXJ-2GFwyrW_UIvRg5Nt9QhpG0hfyo=@proton.me> <5e4fb323-0dd1-4eb9-9e83-245ab516be06@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: eb2c7fff70764aac835a5b8da4cdd14872e89e80
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Monday, January 6th, 2025 at 1:19 AM, Jan Beulich <jbeulich@suse.com> wr=
ote:

>=20
>=20
> On 04.01.2025 06:31, Denis Mukhin wrote:
>=20
> > On Monday, December 16th, 2024 at 7:04 AM, Jan Beulich jbeulich@suse.co=
m wrote:
> >=20
> > > On 06.12.2024 05:42, Denis Mukhin via B4 Relay wrote:
> > >=20
> > > > + depends on HVM && HAS_IOPORTS
> > >=20
> > > Why HAS_IOPORTS?
> >=20
> > It is meant to highlight the fact that MMIO-based UART is not supported=
.
> > It is not currently possible to enable the emulator for, say, Arm platf=
orms.
>=20
>=20
> That I guessed, yet you realize that HAS_IOPORTS describes a host propert=
y,
> not (so much) a guest one?

re: host property: yes; this is meant to be only a guardrail for porting of=
 the
emulator code (if any) to other architectures, since there's no MMIO-based
NS16550 emulator yet.

I will drop this superfluous dependency in the next iteration.

>=20
> Jan



