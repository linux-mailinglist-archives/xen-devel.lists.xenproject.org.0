Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKa2KcYX+mlYJQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 18:16:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 157834D1144
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 18:16:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300869.1575323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKIR8-0005FI-Co; Tue, 05 May 2026 16:15:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300869.1575323; Tue, 05 May 2026 16:15:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKIR8-0005CI-9G; Tue, 05 May 2026 16:15:54 +0000
Received: by outflank-mailman (input) for mailman id 1300869;
 Tue, 05 May 2026 16:15:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wKIR6-0005CC-Bd
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 16:15:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKIR5-006d4c-Ah
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 18:15:51 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69fa17b5-2eae-0a2a0a5409dd-0a2a45059956-6
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 18:15:51 +0200
Received: from [209.85.208.174] (helo=mail-lj1-f174.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69fa17b6-aaa8-0a2a45050019-d155d0aef085-3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 18:15:51 +0200
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-38dd9f11a09so45908921fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 09:15:51 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1777997750; cv=none;
        d=google.com; s=arc-20240605;
        b=lBr9Nm+cgphtYFiU0qUqEiw5GJnJ73QVftaKHJp1ytXra2l6+KFYCyjw9vrVoMz2Wi
         fuWdK2FTFL7LqHb4hefUSuv6iVrDNEqse1kxPjtKXAPYv2EriN+L/o1nvsqbAbXuSq4y
         D29KzEvC+3xx+HOAFvbPV9lj9sIQ2AFFDRZRiIsb13153YfAGObgqrhS3RldYc6mURfJ
         55veYjOSadvw3ukryQHBXZI7WtU7oLB39JYPgG7PKo2fg8mGauixwwdBUBo9kPGVrWjh
         zEyAr/jRKYuP9LqbHGKRF1Yr614iYtoQqLL8YoRRr8qVJ00LU/MP1BUk2dscN7I3mowB
         vWRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5PkHi5Y9M0pcOvWBUIGdRTYScNdEJkRkygTPYP2eGdE=;
        fh=uAzoxIkY79cy0zES8IqO07ArU7DBG3jlr2bg4XRVkR0=;
        b=IH8tPlzF54kJmNi/3RNp9OrpWhdVwf9SIVCnSgzsrr3zS9ChfaLqPsaX7unJbA2QKf
         KKcfC6o05Y1aJ2hgaEbHbcfpKl03rGxwiuugmOp0hGcoPRlHQSSSgee7kzx5soHbB0eS
         GS9OPKGcDcxgEiIRCYp9EcpSdYHPRlGvXXIMS5FpRcL1QI+CkiF0fV6OmfI5yZKvSFWY
         uiDSFZ2Lf5SYGKwKSCf8Xx6OmJc9g5RPtcI9LdSb+4xxRnAJZIlf+YqjJM3qISV9eYhe
         9ET4XnPheUrJU95Sj18I22rHKp0y1fjsgt+AB41yK1nqlZiLpygspPjCZgJABu+i6tK1
         TN2w==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777997750; x=1778602550; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5PkHi5Y9M0pcOvWBUIGdRTYScNdEJkRkygTPYP2eGdE=;
        b=pTJl5CVA9uaOJHccseAZNayrbrkKDPoSi41KuX4dNEzHtUlvEtpVcibq/ZPpQjZgj8
         S6ZWnGr7ncSDkZqsLi/uRzRhX4pl+VnV236Z07zxIftDdOUiY/DQMB8cTOuIiitLluh6
         dWKzmU9zqelg1Q/ZQk28tZGtP3nOstFpDcYxXlJGChkB/39UTJOBsOgymzvzFHop6TRz
         aePmSQXCUrNVYJGWkfdqIDaiJj8opoHIBRSfbPI7lGTqOoTBl8NRSpcOXtlWI29JZR3E
         QOBpT4Gqcpsdaf74HaHqEcJuz+Q0miD0C6jt4tnKWz5VNUj+AjEIV5Fe06LCQOqMpOKi
         hFZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777997750; x=1778602550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5PkHi5Y9M0pcOvWBUIGdRTYScNdEJkRkygTPYP2eGdE=;
        b=AURU3zIjhFwwPhAgXEvdWuwNiDjgEfWI9YGvVZxV3ld4f3l2x0Iqy7hPk6QAdZu1iC
         qs9BVJfKWONtzMyLLic6d8vky+UznExutOjl8eBUT9c2Re6ip36HOz1VBkuDDfr6qhb9
         JyeoiAUbuqk9oERSgoLq/7cQyENgC7Yzvgtf8sqAA2cQunm7Fme+4ncUan048DwxPboi
         1sM0hbGoEUzqBEqZ6Vj/MWidvy/X36gNJmhoA4wqaKvbSEetq1ljQ8eugpmQEfUuU+lV
         IkMrm08uXlwyMHbgmj+fduLuzB+0W8FOpbcw54ibQOsL5NoUOhpI8jijPyhRx76t2Jvm
         DdEQ==
X-Gm-Message-State: AOJu0Yz5InizgJ+SxeBBA1MUFtAW/Zbyqp+krL0Bsqonx70pap5Em6Qd
	mM3JTzE6gHQBfSyXf6gKBZ/gyJK9Y6NUZslNp9JSwfNhXlL0nomPdfTogf01TIXi/4gokeD/YW+
	jRa7IiJe2JIGA4DmCh+fmVmLtDMzzPoA=
X-Gm-Gg: AeBDieuGAWB2KMCmOiOFAzsJNugPt0esc7eIB55pqUEqIwbziJ9SltFS9uiVAjs2yJG
	hfG4sve7oojb0vlZt7hZqyb+jV84JfIUfuYsCndyF4eC31hvM8sSmhQAGMao24JfRl46wJ9tA9u
	W1Iw0YcREHHHs1+jFUMs5/IZ1txXKgnH4UNvnyTBMKwzcTMO7ICfHXec4PZDnlU3YPzjGP03PHk
	/xatZGd4BfOy4wDPLCZ+02tYUbrJNvkeoMtvr0oqaYgbs9XMPss+CHO5HniskoniinGA/OYiEWk
	Pbjhxj3FKEhzF1ZeZoVmVk5JGpc=
X-Received: by 2002:a05:651c:3253:b0:38e:85a3:fdf5 with SMTP id
 38308e7fff4ca-393c3b9ef75mr245281fa.18.1777997750127; Tue, 05 May 2026
 09:15:50 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1775125380.git.mykola_kvach@epam.com> <8767d4129cd5bc56086172e58320539be7da4059.1775125380.git.mykola_kvach@epam.com>
 <A0DD6517-9EFB-4DA3-85E6-91771BC23553@arm.com>
In-Reply-To: <A0DD6517-9EFB-4DA3-85E6-91771BC23553@arm.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 5 May 2026 19:15:37 +0300
X-Gm-Features: AVHnY4IrysOt3S6uyhp6FbQHVX_-258ZZw4hlASPj3k8tlvTgm7ehqX6AKde12E
Message-ID: <CAGeoDV-6bSzCkENgP+W5Fuy5bjoJzDw235pxDw5eQzgE3WXPuw@mail.gmail.com>
Subject: Re: [PATCH v8 12/13] xen/arm: Implement PSCI SYSTEM_SUSPEND call
 (host interface)
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-c201ff/1777997751-E3961443-578406B7/0/0
X-purgate-type: clean
X-purgate-size: 3885
X-Rspamd-Queue-Id: 157834D1144
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,mail.gmail.com:mid,arm.com:email,epam.com:email];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:Luca.Fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]

Hi Luca,

Thank you for the review.

On Mon, Apr 27, 2026 at 7:23=E2=80=AFPM Luca Fancellu <Luca.Fancellu@arm.co=
m> wrote:
>
> Hi Mykola,
>
> > On 2 Apr 2026, at 11:45, Mykola Kvach <xakep.amatop@gmail.com> wrote:
> >
> > From: Mirela Simonovic <mirela.simonovic@aggios.com>
> >
> > Invoke PSCI SYSTEM_SUSPEND to finalize Xen's suspend sequence on ARM64 =
platforms.
> > Pass the resume entry point (hyp_resume) as the first argument to EL3. =
The resume
> > handler is currently a stub and will be implemented later in assembly. =
Ignore the
> > context ID argument, as is done in Linux.
> >
> > Only enable this path when CONFIG_SYSTEM_SUSPEND is set and
> > PSCI version is >=3D 1.0.
> >
> > Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
> > Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
> > Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> > Changes in v7:
> > - no changes
> > ---
> > xen/arch/arm/include/asm/psci.h |  1 +
> > xen/arch/arm/psci.c             | 23 ++++++++++++++++++++++-
> > 2 files changed, 23 insertions(+), 1 deletion(-)
> >
> > diff --git a/xen/arch/arm/include/asm/psci.h b/xen/arch/arm/include/asm=
/psci.h
> > index 48a93e6b79..bb3c73496e 100644
> > --- a/xen/arch/arm/include/asm/psci.h
> > +++ b/xen/arch/arm/include/asm/psci.h
> > @@ -23,6 +23,7 @@ int call_psci_cpu_on(int cpu);
> > void call_psci_cpu_off(void);
> > void call_psci_system_off(void);
> > void call_psci_system_reset(void);
> > +int call_psci_system_suspend(void);
> >
> > /* Range of allocated PSCI function numbers */
> > #define PSCI_FNUM_MIN_VALUE                 _AC(0,U)
> > diff --git a/xen/arch/arm/psci.c b/xen/arch/arm/psci.c
> > index b6860a7760..c9d126b195 100644
> > --- a/xen/arch/arm/psci.c
> > +++ b/xen/arch/arm/psci.c
> > @@ -17,17 +17,20 @@
> > #include <asm/cpufeature.h>
> > #include <asm/psci.h>
> > #include <asm/acpi.h>
> > +#include <asm/suspend.h>
> >
> > /*
> >  * While a 64-bit OS can make calls with SMC32 calling conventions, for
> >  * some calls it is necessary to use SMC64 to pass or return 64-bit val=
ues.
> > - * For such calls PSCI_0_2_FN_NATIVE(x) will choose the appropriate
> > + * For such calls PSCI_*_FN_NATIVE(x) will choose the appropriate
> >  * (native-width) function ID.
> >  */
> > #ifdef CONFIG_ARM_64
> > #define PSCI_0_2_FN_NATIVE(name)    PSCI_0_2_FN64_##name
> > +#define PSCI_1_0_FN_NATIVE(name)    PSCI_1_0_FN64_##name
> > #else
> > #define PSCI_0_2_FN_NATIVE(name)    PSCI_0_2_FN32_##name
> > +#define PSCI_1_0_FN_NATIVE(name)    PSCI_1_0_FN32_##name
> > #endif
> >
> > uint32_t psci_ver;
> > @@ -60,6 +63,24 @@ void call_psci_cpu_off(void)
> >     }
> > }
> >
> > +int call_psci_system_suspend(void)
> > +{
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +    struct arm_smccc_res res;
> > +
> > +    if ( psci_ver < PSCI_VERSION(1, 0) )
> > +        return PSCI_NOT_SUPPORTED;
> > +
> > +    /* 2nd argument (context ID) is not used */
> > +    arm_smccc_smc(PSCI_1_0_FN_NATIVE(SYSTEM_SUSPEND), __pa(hyp_resume)=
, &res);
>
> I think Linux is passing 0 as context ID, probably to mark that it=E2=80=
=99s not used, I think we should do the
> same

Yes, agreed.

SYSTEM_SUSPEND takes context_id as the second PSCI argument, and Xen does
not use it. I will pass it explicitly as 0 instead of relying on the SMCCC
wrapper/default register state.

Best regards,
Mykola

>
> > +    return PSCI_RET(res);
> > +#else
> > +    dprintk(XENLOG_WARNING,
> > +            "SYSTEM_SUSPEND not supported (CONFIG_SYSTEM_SUSPEND disab=
led)\n");
> > +    return PSCI_NOT_SUPPORTED;
> > +#endif
> > +}
> > +
> > void call_psci_system_off(void)
> > {
> >     if ( psci_ver > PSCI_VERSION(0, 1) )
> >
>
> Cheers,
> Luca
>
>
>

