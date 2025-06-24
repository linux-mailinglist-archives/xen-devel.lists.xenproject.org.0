Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04838AE5DFA
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 09:37:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023221.1399166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTyD9-0006mW-J7; Tue, 24 Jun 2025 07:36:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023221.1399166; Tue, 24 Jun 2025 07:36:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTyD9-0006l1-Ee; Tue, 24 Jun 2025 07:36:55 +0000
Received: by outflank-mailman (input) for mailman id 1023221;
 Tue, 24 Jun 2025 07:36:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1A0Y=ZH=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uTyD7-0006TF-7F
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 07:36:54 +0000
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch
 [109.224.244.18]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe729d3c-50cd-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 09:36:52 +0200 (CEST)
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
X-Inumbo-ID: fe729d3c-50cd-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1750750611; x=1751009811;
	bh=42siax0kogyrned8KRupFi9IYG+ihop/uG0YVs9QMik=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=PbU7jM4k/BRHywwJLwDQz3VMvTaqDwZT512bmPi7fvx4zWwIFqy2YOeJ22ROnzmYF
	 /pQsrXsY4CPpWeR7NmkYMAlH45NYm9CSDjZpg6aNHZ8RMM+z9I2cXSg8wzlDJU0Ekw
	 D0xmRSKbWrY+5a6BoQojc7m45WJ3KkNmCZ3osWL3XGoKM1zP0iLRfUBe+efvhGPpmU
	 gIm8fuqv3+oq8QfPnPJsRLD9e0UsnUhTy+l6jvUHt553o7erzveQI/rg3IEt4GaNX9
	 66cXLV5efywR4354jEZM/Ko4tG6kIqusq6O0bCunmIw/WEf0La2sFalne6JD2ypQUG
	 5hfKmcRQmBUNA==
Date: Tue, 24 Jun 2025 07:36:47 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, oleksii.kurochko@gmail.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 14/16] drivers/vuart: move simple MMIO-based UART emulator
Message-ID: <aFpViicgGigZPFNv@kraken>
In-Reply-To: <6e6c8664-2ff6-484d-bd47-7ee12c449f9e@suse.com>
References: <20250624035443.344099-1-dmukhin@ford.com> <20250624035443.344099-15-dmukhin@ford.com> <6e6c8664-2ff6-484d-bd47-7ee12c449f9e@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 6f04fe74cf678d739b6fe28d14061cfbb820540f
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 07:53:04AM +0200, Jan Beulich wrote:
> On 24.06.2025 05:57, dmkhn@proton.me wrote:
> > --- a/xen/drivers/vuart/Kconfig
> > +++ b/xen/drivers/vuart/Kconfig
> > @@ -3,6 +3,15 @@ config HAS_VUART
> >
> >  if (ARM_32 || ARM_64)
> >
> > +config HAS_VUART_MMIO
> > +=09bool "Simple MMIO-based emulated UART support"
>=20
> Perhaps in a separate change this should be renamed. HAS_* should never
> have prompts.

Oh, so HAS_ flags are non-interactive selectors by design?
I did not find explanation in the docs :-/

Can you please explain?
(and I will add a note to docs for that)

>=20
> > +=09default y
> > +=09select HAS_VUART
>=20
> This is questionable too (for still being controlled by a prompt), but
> may need to remain as is.
>=20
> Jan


