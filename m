Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WC0aEJnE1mlDIAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 23:11:53 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7148B3C3FAA
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 23:11:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1276576.1561968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAaBB-00063C-9s; Wed, 08 Apr 2026 21:11:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1276576.1561968; Wed, 08 Apr 2026 21:11:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAaBB-00060A-6l; Wed, 08 Apr 2026 21:11:17 +0000
Received: by outflank-mailman (input) for mailman id 1276576;
 Wed, 08 Apr 2026 21:11:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wAaB9-000604-Au
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 21:11:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAaB7-00BFEo-R7
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 23:11:14 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69d6c45c-bab6-0a2a0a5309dd-0a2a4509c51c-28
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 23:11:13 +0200
Received: from [202.12.124.148] (helo=fout-b5-smtp.messagingengine.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69d6c470-bf79-0a2a45090019-ca0c7c948d75-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 23:11:13 +0200
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
 by mailfout.stl.internal (Postfix) with ESMTP id 81A201D00286;
 Wed,  8 Apr 2026 17:11:11 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-08.internal (MEProxy); Wed, 08 Apr 2026 17:11:11 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 Apr 2026 17:11:09 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm2 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm2 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1775682671;
	 x=1775769071; bh=kchf87mE9OXpEq2RDcjs4o5CRJjnCtkZ2UY0sqB8J2U=; b=
	og7oqgEf4E0OOGdxl2ze9nRfqllg/kVEhEOXuUkB3mpHn1TFoGiIgJgCInp694cH
	qQnKz9ow8udj9RrJf10/P6Xd/UKGhaHWLPNKnhihC79p2sKzxli91G+qgIRfINaN
	rSq6GvZ/slAaJDWYKOWth9eA7AqPbqZZnafkuNpCoVrVMrKA5cjdeat4HcTuckJT
	Xs4WPOsKz7vP6KnNTkWI3YDynG9QGVF8ZRU0s7mxxBQ3IlKJVkkJzrKbwhXEFhf8
	IEe50A/T4vkMnx0WRj3lc+tl4JBh771Sp20t/tMZM3SvNXPczsy3GHt4lkLhBpwd
	V/rbmUMqKC+9RUJfp+N0LQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1775682671; x=1775769071; bh=kchf87mE9OXpEq2RDcjs4o5CRJjnCtkZ2UY
	0sqB8J2U=; b=rHZrZ3UcV3zUvuUcISOSxifMtkqQfF/7m57ZLYlCktje6p26dfF
	ufmkTGYUqulTVDeZz230gTyv0EMyu4gjrj3A2FS5bM/X+J9uEhxwYPhVk25sqRPj
	97Kynoj9DT04nuq80T4vI7nKCvGrr2qJxCeyt1dilVBtymFFSCSNY/4DI7RRrIIU
	Da3GlkreWiZT3t6i4S5rJEd2KEpud4kS9egUHFssQEXfsIbnfpTfOMHkA7XDGBqw
	/jyT4VFmM0CFju6Z/KTatfcecCrKPqMP0Z4iw4x619jsj2veUW9SlqYlBwN1RHbR
	I7rzds0+x9IqRpcDgHF/jvVbMb/PRBecItw==
X-ME-Sender: <xms:bsTWaR1KKJc-OS2XVNqB5xjX8oTbi7IRXSpD-jI3eV6LFzppI5cHsA>
    <xme:bsTWae-CpiKAOWrSKhxCjPLlrgvyaTCjZXaUhwpaStspLYHcls4im284jSSRqTsXf
    cFJDjyC6Vqvg4BtOg6rUi7TNIIoN3vfVP-pCsqfiWjjEqAl>
X-ME-Received: <xmr:bsTWaaMM7_OnM583DUgCqGLLH-5Tq3h_lz2cf3NoaLMvPrQDJs5tZ2lTYslWxcvtzCwMINl9oXmav_B5fwiwsrkuHILfLZIYKuM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddvgeeivdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihcuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgkedutdffteethfeiueehffek
    ueffledvffdutdetteeltdevkeefkeelheejgfenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvght
    hhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeehpdhmohguvgepshhmthhpoh
    huthdprhgtphhtthhopehjsggvuhhlihgthhesshhushgvrdgtohhmpdhrtghpthhtohep
    gigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpth
    htoheprghnughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtthho
    pehrohhgvghrrdhprghusegtihhtrhhigidrtghomhdprhgtphhtthhopehtvgguugihrd
    grshhtihgvsehvrghtvghsrdhtvggthh
X-ME-Proxy: <xmx:bsTWaaf9Byhys9_9v7hzOk6tbrp0GIrMZK-6mbEFd01tU5TDfli5CQ>
    <xmx:bsTWaRXHVBZxqeBvsJTcNE-RDPnvf5m6tN368kVTlVS5eRFNaxemFg>
    <xmx:bsTWaaj7TW76UQBHPslzFU4YUDBRIzcR_BBO399Cr_iRVgpDgGiQlA>
    <xmx:bsTWaY9eZgzBYCOdAEgKY1zf6HsfYkKBI4ANtxQU-3nTTBQx0LOIdw>
    <xmx:b8TWaVEMxSxSRB1KzOqqwoTKFK9HePvZZXPlx4aTiVx_CCi3EO0Q85T9>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 8 Apr 2026 23:11:07 +0200
From: Marek Marczykowski <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] x86/cpuidle: split the max_cstate variable
Message-ID: <adbEawEpv8KA5ofI@mail-itl>
References: <4b89f640-046a-49c1-95f1-947d98135e5b@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QESya23L83tZWxwF"
Content-Disposition: inline
In-Reply-To: <4b89f640-046a-49c1-95f1-947d98135e5b@suse.com>
X-purgate-ID: tlsNG-bad1c0/1775682673-57543152-C54B51C6/0/0
X-purgate-type: clean
X-purgate-size: 14966
X-Spamd-Result: default: False [-2.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm2,messagingengine.com:s=fm2];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,invisiblethingslab.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 7148B3C3FAA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--QESya23L83tZWxwF
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 8 Apr 2026 23:11:07 +0200
From: Marek Marczykowski <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] x86/cpuidle: split the max_cstate variable

On Wed, Apr 08, 2026 at 01:34:43PM +0200, Jan Beulich wrote:
> The admin can control the upper bound wanted not only via command line
> option, but also via XEN_SYSCTL_pm_op_set_max_cstate. While decisions how
> to set up the system are okay this way as long as we deem the command line
> option a strict upper bound, what to do during S3 resume should not be
> based on that potentially varying value. Decisions there need to use
> solely the strict upper bound we may have enforced ourselves (or which was
> forced onto us via command line option).
>=20
> Rather than altering pit_broadcast_is_available(), drop the function
> altogether. It's pretty odd for acpi/cpu_idle.c to call into time.c, just
> for that to call into acpi/cpu_idle.c again.
>=20
> Fixes: 8d24303023ec ("x86: don't write_tsc() non-zero values on CPUs upda=
ting only the lower 32 bits")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

What should be observable effect, in absence of max_cstate option and
"xenpm set-max-cstate" calls? The "slow after S3" issue still happens. I
tested this on top of the two other patches:
- [PATCH] x86/HPET: channel handling in hpet_broadcast_resume()
- [PATCH] x86/cpu-policy: set up host policy earlier


> ---
> cpuidle_disable_deep_cstate(), when called from handle_rtc_once(), is
> still somewhat of a problem: Boot time and resume time runs of
> _disable_pit_irq() may still behave differently because of that.

In the above test, both on boot and resume I got:
(XEN) [    9.916522] _disable_pit_irq:2649: using_pit: 0, cpu_has_apic: 1
(XEN) [    9.921198] _disable_pit_irq:2659: cpuidle_usable_deep_cstate: 1, =
boot_cpu_has(X86_FEATURE_XEN_ARAT): 1


> If we wanted the sysctl to possibly move the maximum C-state beyond what
> was given on the command line, things would get yet more complicated, as
> we'd then need to re-configure the driver that's in use.
>=20
> I wonder how useful the ACPI_STATE_C<n> #define-s really are. Plain 1 is
> used in e.g. probe_c3_errata(), and the plain 7 doesn't even have a
> respective constant (nor would that be suitable, as that's not really an
> ACPI state).
>=20
> --- a/xen/arch/x86/acpi/cpu_idle.c
> +++ b/xen/arch/x86/acpi/cpu_idle.c
> @@ -119,7 +119,7 @@ bool lapic_timer_init(void)
>          lapic_timer_off =3D hpet_broadcast_enter;
>          lapic_timer_on =3D hpet_broadcast_exit;
>      }
> -    else if ( pit_broadcast_is_available() )
> +    else if ( cpuidle_usable_deep_cstate() )
>      {
>          lapic_timer_off =3D pit_broadcast_enter;
>          lapic_timer_on =3D pit_broadcast_exit;
> @@ -131,12 +131,15 @@ bool lapic_timer_init(void)
>  }
> =20
>  void (*__read_mostly pm_idle_save)(void);
> -unsigned int max_cstate __read_mostly =3D UINT_MAX;
> +
> +unsigned int max_usable_cstate __read_mostly =3D UINT_MAX;
> +unsigned int max_allowed_cstate __read_mostly =3D UINT_MAX;
>  unsigned int max_csubstate __read_mostly =3D UINT_MAX;
> =20
>  static int __init cf_check parse_cstate(const char *s)
>  {
> -    max_cstate =3D simple_strtoul(s, &s, 0);
> +    max_allowed_cstate =3D simple_strtoul(s, &s, 0);
> +    max_usable_cstate =3D max_allowed_cstate;
>      if ( *s =3D=3D ',' )
>          max_csubstate =3D simple_strtoul(s + 1, NULL, 0);
>      return 0;
> @@ -413,10 +416,11 @@ static void cf_check dump_cx(unsigned ch
>      unsigned int cpu;
> =20
>      printk("'%c' pressed -> printing ACPI Cx structures\n", key);
> -    if ( max_cstate < UINT_MAX )
> +    if ( max_cstate() < UINT_MAX )
>      {
> -        printk("max state: C%u\n", max_cstate);
> -        if ( max_csubstate < UINT_MAX )
> +        printk("max state: C%u\n", max_cstate());
> +        if ( max_allowed_cstate <=3D max_usable_cstate &&
> +             max_csubstate < UINT_MAX )
>              printk("max sub-state: %u\n", max_csubstate);
>          else
>              printk("max sub-state: unlimited\n");
> @@ -690,18 +694,18 @@ static void cf_check acpi_processor_idle
>      u32 exp =3D 0, pred =3D 0;
>      u32 irq_traced[4] =3D { 0 };
> =20
> -    if ( max_cstate > 0 && power &&
> +    if ( max_cstate() > 0 && power &&
>           (next_state =3D cpuidle_current_governor->select(power)) > 0 )
>      {
>          unsigned int max_state =3D sched_has_urgent_vcpu() ? ACPI_STATE_=
C1
> -                                                         : max_cstate;
> +                                                         : max_cstate();
> =20
>          do {
>              cx =3D &power->states[next_state];
>          } while ( (cx->type > max_state ||
>                     cx->entry_method =3D=3D ACPI_CSTATE_EM_NONE ||
>                     (cx->entry_method =3D=3D ACPI_CSTATE_EM_FFH &&
> -                    cx->type =3D=3D max_cstate &&
> +                    cx->type =3D=3D max_allowed_cstate &&
>                      (cx->address & MWAIT_SUBSTATE_MASK) > max_csubstate)=
) &&
>                    --next_state );
>          if ( next_state )
> @@ -1448,7 +1452,7 @@ static void amd_cpuidle_init(struct acpi
> =20
>      for ( i =3D 0; i < nr; ++i )
>      {
> -        if ( cx[i].type > max_cstate )
> +        if ( cx[i].type > max_cstate() )
>              break;
>          power->states[i + 1] =3D cx[i];
>          power->states[i + 1].idx =3D i + 1;
> @@ -1611,21 +1615,22 @@ int pmstat_reset_cx_stat(unsigned int cp
> =20
>  void cpuidle_disable_deep_cstate(void)
>  {
> -    if ( max_cstate > ACPI_STATE_C1 )
> +    if ( max_usable_cstate > ACPI_STATE_C1 )
>      {
>          if ( local_apic_timer_c2_ok )
> -            max_cstate =3D ACPI_STATE_C2;
> +            max_usable_cstate =3D ACPI_STATE_C2;
>          else
> -            max_cstate =3D ACPI_STATE_C1;
> +            max_usable_cstate =3D ACPI_STATE_C1;
>      }
> =20
>      hpet_disable_legacy_broadcast();
>  }
> =20
> -bool cpuidle_using_deep_cstate(void)
> +bool cpuidle_usable_deep_cstate(void)
>  {
> -    return xen_cpuidle && max_cstate > (local_apic_timer_c2_ok ? ACPI_ST=
ATE_C2
> -                                                               : ACPI_ST=
ATE_C1);
> +    return xen_cpuidle &&
> +           max_usable_cstate > (local_apic_timer_c2_ok ? ACPI_STATE_C2
> +                                                       : ACPI_STATE_C1);
>  }
> =20
>  static int cf_check cpu_callback(
> --- a/xen/arch/x86/cpu/intel.c
> +++ b/xen/arch/x86/cpu/intel.c
> @@ -384,12 +384,12 @@ static void probe_c3_errata(const struct
>      };
> =20
>      /* Serialized by the AP bringup code. */
> -    if ( max_cstate > 1 && (c->apicid & (c->x86_num_siblings - 1)) &&
> +    if ( max_usable_cstate > 1 && (c->apicid & (c->x86_num_siblings - 1)=
) &&
>           x86_match_cpu(models) )
>      {
>          printk(XENLOG_WARNING
>  	       "Disabling C-states C3 and C6 due to CPU errata\n");
> -        max_cstate =3D 1;
> +        max_usable_cstate =3D 1;
>      }
>  }
> =20
> --- a/xen/arch/x86/cpu/mwait-idle.c
> +++ b/xen/arch/x86/cpu/mwait-idle.c
> @@ -1045,15 +1045,16 @@ static void cf_check mwait_idle(void)
>  	u64 before, after;
>  	u32 exp =3D 0, pred =3D 0, irq_traced[4] =3D { 0 };
> =20
> -	if (max_cstate > 0 && power &&
> +	if (max_cstate() > 0 && power &&
>  	    (next_state =3D cpuidle_current_governor->select(power)) > 0) {
>  		unsigned int max_state =3D sched_has_urgent_vcpu() ? ACPI_STATE_C1
> -								 : max_cstate;
> +								 : max_cstate();
> =20
>  		do {
>  			cx =3D &power->states[next_state];
> -		} while ((cx->type > max_state || (cx->type =3D=3D max_cstate &&
> -			  MWAIT_HINT2SUBSTATE(cx->address) > max_csubstate)) &&
> +		} while ((cx->type > max_state ||
> +                          (cx->type =3D=3D max_allowed_cstate &&
> +			   MWAIT_HINT2SUBSTATE(cx->address) > max_csubstate)) &&
>  			 --next_state);
>  		if (!next_state)
>  			cx =3D NULL;
> @@ -1458,7 +1459,7 @@ static void __init sklh_idle_state_table
>  	u64 msr;
> =20
>  	/* if PC10 disabled via cmdline max_cstate=3D7 or shallower */
> -	if (max_cstate <=3D 7)
> +	if (max_cstate() <=3D 7)
>  		return;
> =20
>  	/* if PC10 not present in CPUID.MWAIT.EDX */
> @@ -1623,7 +1624,7 @@ static int __init mwait_idle_probe(void)
>  	    !mwait_substates)
>  		return -ENODEV;
> =20
> -	if (!max_cstate || !opt_mwait_idle) {
> +	if (!max_cstate() || !opt_mwait_idle) {
>  		pr_debug(PREFIX "disabled\n");
>  		return -EPERM;
>  	}
> @@ -1714,8 +1715,8 @@ static int cf_check mwait_idle_cpu_init(
>  		hint =3D flg2MWAIT(cpuidle_state_table[cstate].flags);
>  		state =3D MWAIT_HINT2CSTATE(hint) + 1;
> =20
> -		if (state > max_cstate) {
> -			printk(PREFIX "max C-state %u reached\n", max_cstate);
> +		if (state > max_cstate()) {
> +			printk(PREFIX "max C-state %u reached\n", max_cstate());
>  			break;
>  		}
> =20
> --- a/xen/arch/x86/include/asm/time.h
> +++ b/xen/arch/x86/include/asm/time.h
> @@ -31,7 +31,6 @@ int cpu_frequency_change(u64 freq);
> =20
>  void cf_check pit_broadcast_enter(void);
>  void cf_check pit_broadcast_exit(void);
> -int pit_broadcast_is_available(void);
> =20
>  uint64_t cf_check acpi_pm_tick_to_ns(uint64_t ticks);
> =20
> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -517,7 +517,7 @@ static int64_t __init cf_check init_hpet
>      bool disable_hpet =3D false;
> =20
>      if ( hpet_address && strcmp(opt_clocksource, pts->id) &&
> -         cpuidle_using_deep_cstate() )
> +         cpuidle_usable_deep_cstate() )
>      {
>          if ( pci_conf_read16(PCI_SBDF(0, 0, 0x1f, 0),
>                               PCI_VENDOR_ID) =3D=3D PCI_VENDOR_ID_INTEL )
> @@ -2655,7 +2655,7 @@ static int _disable_pit_irq(bool init)
>       * XXX dom0 may rely on RTC interrupt delivery, so only enable
>       * hpet_broadcast if FSB mode available or if force_hpet_broadcast.
>       */
> -    if ( cpuidle_using_deep_cstate() && !boot_cpu_has(X86_FEATURE_XEN_AR=
AT) )
> +    if ( cpuidle_usable_deep_cstate() && !boot_cpu_has(X86_FEATURE_XEN_A=
RAT) )
>      {
>          init ? hpet_broadcast_init() : hpet_broadcast_resume();
>          if ( !hpet_broadcast_is_available() )
> @@ -2707,11 +2707,6 @@ void cf_check pit_broadcast_exit(void)
>          reprogram_timer(this_cpu(timer_deadline));
>  }
> =20
> -int pit_broadcast_is_available(void)
> -{
> -    return cpuidle_using_deep_cstate();
> -}
> -
>  void send_timer_event(struct vcpu *v)
>  {
>      send_guest_vcpu_virq(v, VIRQ_TIMER);
> @@ -2999,7 +2994,7 @@ static void cf_check dump_softtsc(unsign
>      else if ( boot_cpu_has(X86_FEATURE_CONSTANT_TSC ) )
>      {
>          printk("TSC has constant rate, ");
> -        if ( max_cstate <=3D ACPI_STATE_C2 && tsc_max_warp =3D=3D 0 )
> +        if ( max_usable_cstate <=3D ACPI_STATE_C2 && tsc_max_warp =3D=3D=
 0 )
>              printk("no deep Cstates, passed warp test, deemed reliable, =
");
>          else
>              printk("deep Cstates possible, so not reliable, ");
> --- a/xen/include/xen/acpi.h
> +++ b/xen/include/xen/acpi.h
> @@ -142,30 +142,33 @@ int acpi_gsi_to_irq (u32 gsi, unsigned i
> =20
>  #ifdef	CONFIG_ACPI_CSTATE
>  /*
> - * max_cstate sets the highest legal C-state.
> - * max_cstate =3D 0: C0 okay, but not C1
> - * max_cstate =3D 1: C1 okay, but not C2
> - * max_cstate =3D 2: C2 okay, but not C3 etc.
> -
> - * max_csubstate sets the highest legal C-state sub-state. Only applies =
to the
> - * highest legal C-state.
> - * max_cstate =3D 1, max_csubstate =3D 0 =3D=3D> C0, C1 okay, but not C1E
> - * max_cstate =3D 1, max_csubstate =3D 1 =3D=3D> C0, C1 and C1E okay, bu=
t not C2
> - * max_cstate =3D 2, max_csubstate =3D 0 =3D=3D> C0, C1, C1E, C2 okay, b=
ut not C3
> - * max_cstate =3D 2, max_csubstate =3D 1 =3D=3D> C0, C1, C1E, C2 okay, b=
ut not C3
> + * max_{allowed,usable}_cstate sets the highest allowed / usable C-state=
, where
> + * "allowed" is command line / sysctl based.
> + * max_*_cstate =3D 0: C0 okay, but not C1
> + * max_*_cstate =3D 1: C1 okay, but not C2
> + * max_*_cstate =3D 2: C2 okay, but not C3 etc.
> + *
> + * max_csubstate sets the highest allowed C-state sub-state. Only applie=
s to
> + * the highest allowed C-state.
> + * max_allowed_cstate =3D 1, max_csubstate =3D 0 =3D=3D> C0, C1 okay, bu=
t not C1E
> + * max_allowed_cstate =3D 1, max_csubstate =3D 1 =3D=3D> C0, C1 and C1E =
okay, but not C2
> + * max_allowed_cstate =3D 2, max_csubstate =3D 0 =3D=3D> C0, C1, C1E, C2=
 okay, but not C3
> + * max_allowed_cstate =3D 2, max_csubstate =3D 1 =3D=3D> C0, C1, C1E, C2=
 okay, but not C3
>   */
> =20
> -extern unsigned int max_cstate;
> +extern unsigned int max_usable_cstate;
> +extern unsigned int max_allowed_cstate;
>  extern unsigned int max_csubstate;
> =20
> +#define max_cstate() min(max_usable_cstate, max_allowed_cstate)
> +
>  static inline unsigned int acpi_get_cstate_limit(void)
>  {
> -	return max_cstate;
> +	return max_allowed_cstate;
>  }
>  static inline void acpi_set_cstate_limit(unsigned int new_limit)
>  {
> -	max_cstate =3D new_limit;
> -	return;
> +	max_allowed_cstate =3D new_limit;
>  }
> =20
>  static inline unsigned int acpi_get_csubstate_limit(void)
> --- a/xen/include/xen/cpuidle.h
> +++ b/xen/include/xen/cpuidle.h
> @@ -89,7 +89,7 @@ struct cpuidle_governor
>  extern int8_t xen_cpuidle;
>  extern struct cpuidle_governor *cpuidle_current_governor;
> =20
> -bool cpuidle_using_deep_cstate(void);
> +bool cpuidle_usable_deep_cstate(void);
>  void cpuidle_disable_deep_cstate(void);
> =20
>  #define CPUIDLE_DRIVER_STATE_START  1

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--QESya23L83tZWxwF
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmnWxGsACgkQ24/THMrX
1yyduAf/WsNYO6OcTfuk9TEpSOc9H1MgPkYS1TY3m5ZyQc60KwjvMlnUkFwlR2j8
hxKT/1htjFHuvBcY0efO5TSM9kbnfqZC+wjqc1L7D1UNVZJs7NJDQWtYp0UeBBGx
9TBE+s97exUrcQttVqLi8mhTHoDZV/CoUauU3ZNvUsV7s0QMAojxCQObLz+uEecm
5T8CtHL70esiVx/I1d8t0du+dW78xwOPV3UHZdtI7fVZxySiBinZ3qEb3dThonym
Qkf+8O+aFe4OFnlLZCBamt2a4CpZMWq5Mpnu5bsk7Xmh2jNY5IbDE1dbEa8SuX6C
p6s+g01iokPL+jEWWflQveku2IHTtA==
=Kngx
-----END PGP SIGNATURE-----

--QESya23L83tZWxwF--

