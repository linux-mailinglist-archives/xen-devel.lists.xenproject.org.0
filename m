Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 744D19C368A
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 03:31:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833317.1248444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAKCo-0004jn-L6; Mon, 11 Nov 2024 02:31:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833317.1248444; Mon, 11 Nov 2024 02:31:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAKCo-0004i0-I0; Mon, 11 Nov 2024 02:31:06 +0000
Received: by outflank-mailman (input) for mailman id 833317;
 Mon, 11 Nov 2024 02:31:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zp6W=SG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tAKCm-0004hu-Ko
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 02:31:04 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fce20f8d-9fd4-11ef-99a3-01e77a169b0f;
 Mon, 11 Nov 2024 03:31:00 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A6FBD5C06DE;
 Mon, 11 Nov 2024 02:30:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA6B8C4CECD;
 Mon, 11 Nov 2024 02:30:57 +0000 (UTC)
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
X-Inumbo-ID: fce20f8d-9fd4-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzOS4xNzguODQuMjE3IiwiaGVsbyI6ImRmdy5zb3VyY2Uua2VybmVsLm9yZyJ9
X-Custom-Transaction: eyJpZCI6ImZjZTIwZjhkLTlmZDQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMjkyMjYwLjY1MzE3MSwic2VuZGVyIjoic3N0YWJlbGxpbmlAa2VybmVsLm9yZyIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731292258;
	bh=XHbzUWmxKS6KlxtaSsbzezbQy9rpyI4WqFu1NdD5i9g=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=PLFBJRzwbhJmbhtKlRhHxUUH2LWZxENs7Rbxt5Ggu4jw0H1wyu2gkJO4Q0/hEUU9c
	 7ezgcx57QlCwNokYWXxhXtzqxK/L9Jfem8NaY2JE7SyPYAEOVPhIjK9WxPi33Snkcs
	 JMp3GWqplN8/6zkwPIKVXicGuDCS8mkAleRkpOdHI7aUGRCKuxBDQYPaoUg9O1BFW4
	 TxNViwvA/wd6RV9+wxGyidybwjGdv9q0MYq2kQYVYgqsAmujm8dLTmUFCuqBkk3/ye
	 gSWWWAV3KGxxo1rtzQTKVHJ22WaEsb05AAGqmK6OmOKWgU5Byly1YKPK4rSoNjWHSa
	 /IaOBT4ECuJ3g==
Date: Sun, 10 Nov 2024 18:30:57 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Sergiy Kibrik <sergiy_kibrik@epam.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Jan Beulich <jbeulich@suse.com>
Subject: Re: [XEN PATCH v2 1/2] x86/hvm: introduce config option for ACPI PM
 timer
In-Reply-To: <09171e88-28d2-433b-a9c3-ad822e9f57c0@epam.com>
Message-ID: <alpine.DEB.2.22.394.2411101829350.14721@ubuntu-linux-20-04-desktop>
References: <cover.1730887415.git.Sergiy_Kibrik@epam.com> <da2758bba96e247027106e13129c87ae31193e97.1730887415.git.Sergiy_Kibrik@epam.com> <09171e88-28d2-433b-a9c3-ad822e9f57c0@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 6 Nov 2024, Sergiy Kibrik wrote:
> 06.11.24 12:14, Sergiy Kibrik:
> > diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> > index 78a13e6812..b340818ee2 100644
> > --- a/xen/arch/x86/domain.c
> > +++ b/xen/arch/x86/domain.c
> > @@ -742,11 +742,16 @@ int arch_sanitise_domain_config(struct
> > xen_domctl_createdomain *config)
> >     static bool emulation_flags_ok(const struct domain *d, uint32_t emflags)
> >   {
> > -#ifdef CONFIG_HVM
> > +    const uint32_t disabled_emu_mask = X86_EMU_PM;
> > +
> > +#if defined(CONFIG_X86_HVM_PMTIMER)
> >       /* This doesn't catch !CONFIG_HVM case but it is better than nothing
> > */
> >       BUILD_BUG_ON(X86_EMU_ALL != XEN_X86_EMU_ALL);
> >   #endif
> >   +    if ( emflags & disabled_emu_mask )
> > +        return false;
> > +
> 
> oops, disregard this chunk please, it should be:
> 
>   if ( (emflags & X86_EMU_ALL) != emflags ) 
>      return false;
> 
> with disabled_emu_mask completely removed.

With this change:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

