Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7C9C5330B
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 16:53:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160200.1488403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJD9P-0007hK-2C; Wed, 12 Nov 2025 15:52:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160200.1488403; Wed, 12 Nov 2025 15:52:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJD9O-0007eD-VZ; Wed, 12 Nov 2025 15:52:50 +0000
Received: by outflank-mailman (input) for mailman id 1160200;
 Wed, 12 Nov 2025 15:52:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fKgU=5U=bounce.vates.tech=bounce-md_30504962.6914ad4f.v1-a088325c52bd4b45ab4dbc8a8e7ebfca@srs-se1.protection.inumbo.net>)
 id 1vJD9N-0006dK-N4
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 15:52:49 +0000
Received: from mail179-26.suw41.mandrillapp.com
 (mail179-26.suw41.mandrillapp.com [198.2.179.26])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a30b2673-bfdf-11f0-9d18-b5c5bf9af7f9;
 Wed, 12 Nov 2025 16:52:49 +0100 (CET)
Received: from pmta12.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail179-26.suw41.mandrillapp.com (Mailchimp) with ESMTP id
 4d67G71xl9zKsbmYF
 for <xen-devel@lists.xenproject.org>; Wed, 12 Nov 2025 15:52:47 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 a088325c52bd4b45ab4dbc8a8e7ebfca; Wed, 12 Nov 2025 15:52:47 +0000
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
X-Inumbo-ID: a30b2673-bfdf-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1762962767; x=1763232767;
	bh=ruW9iBncENpG8nrkxDa8tPpqRo7R4vCtqNBQqHtYGDk=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=h+y8S0eY9fcYR2UpY9SODWdZTpfjO9XKJ7gdumTZW+tPloGG6bWod21FWe0JnH4GG
	 yIIK4sZ4PMMdoeia2hH12oAKp/ERnq8fXN4diwGMOsonIDIaP5y8sdMZfZeKdCOyvI
	 0LnTr1WvftLdZ7EZGBP217II7KxXMACcvvSj3T+e6L/h+417IdAOZI+frbtC+Zur7R
	 3gX7XniBimGsAsyIiccgPcJjorV80CPxuBog9zhuo+ZMcSgHfjOrYqDBhE4B9cTObB
	 Bz758rJ3I4yFDjA2FsfW6pN43BCzQXVL88O1CzgsKamotAqcW9h8P/qoBiu1T7b8Qw
	 p+Vk6KH/rUKCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1762962767; x=1763223267; i=teddy.astie@vates.tech;
	bh=ruW9iBncENpG8nrkxDa8tPpqRo7R4vCtqNBQqHtYGDk=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=sKyvEWYyZlzAJ0DaJQnxblF6KqT0He/82B4nSMILEEyDwmXmklqD/wEtyzd25afq5
	 GChf4HkJm1RAwgJmvy4Ao8+3CWopOrotf5GSPHY1bJ9LkTeWqmuLPh6DR2+rj5Cy6f
	 G4cD0vN+j7neBfdGWSWX/RrD0kiu0W7OXc0J2cl3e++7Brjch5jJLEn3OJqjqye/wZ
	 ajEFme61rojB45nfSTYV4ZJnytOQj3lAIJ3UiTP70lJq4Y42BqBVGVNwefvc3tzBBE
	 6X8ZkZxBPn7PH/KgtFYU7PSUNmREf9BAPZ4H5jvU5bdaDA/nYTsvO3aXqxiBaHU/Qc
	 iISBHjvM6pweA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=201/2]=20x86:=20Conditionalise=20PV-only=20fallback=20branches=20on=20CONFIG=5FPV?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1762962766178
Message-Id: <de2b8cfa-d9b3-405a-af51-cc2b5b22271a@vates.tech>
To: "Alejandro Vallejo" <alejandro.garciavallejo@amd.com>, xen-devel@lists.xenproject.org
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
References: <20251112152235.224001-1-alejandro.garciavallejo@amd.com> <20251112152235.224001-2-alejandro.garciavallejo@amd.com>
In-Reply-To: <20251112152235.224001-2-alejandro.garciavallejo@amd.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.a088325c52bd4b45ab4dbc8a8e7ebfca?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251112:md
Date: Wed, 12 Nov 2025 15:52:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 12/11/2025 =C3=A0 16:25, Alejandro Vallejo a =C3=A9crit=C2=A0:
> A couple of branches rely on PV being the "else" branch, making it
> be compiled even when PV support is not itself compiled-in.
> 
> Add a explicit conditional on CONFIG_PV in those cases to remove the
> code in !CONFIG_PV builds.
> 
> Not a functional change.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> ---
>   xen/arch/x86/cpuid.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
> index b63a82dd38..2e24c84708 100644
> --- a/xen/arch/x86/cpuid.c
> +++ b/xen/arch/x86/cpuid.c
> @@ -297,7 +297,7 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
>               if ( v->arch.hvm.guest_cr[4] & X86_CR4_OSXSAVE )
>                   res->c |=3D cpufeat_mask(X86_FEATURE_OSXSAVE);
>           }
> -        else /* PV domain */
> +        else if ( IS_ENABLED(CONFIG_PV) )
>           {
>               regs =3D guest_cpu_user_regs();
>   
> @@ -509,7 +509,7 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
>               if ( !hap_enabled(d) && !hvm_pae_enabled(v) )
>                   res->d &=3D ~cpufeat_mask(X86_FEATURE_PSE36);
>           }
> -        else /* PV domain */
> +        else if ( IS_ENABLED(CONFIG_PV) )
>           {
>               /*
>                * MTRR used to unconditionally leak into PV guests.  They =
cannot

I don't like having IS_ENABLED(CONFIG_PV) here, but I don't think of a 
better solution as using e.g is_pv_domain isn't really better as it 
would make us evaluate d->options twice.

That said,
Reviewed-by: Teddy Astie <teddy.astie@vates.tech>

Teddy


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



