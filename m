Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEqQGznczGmEXAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 10:50:01 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B20F737714F
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 10:50:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1270015.1558849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7rGX-0008El-GD; Wed, 01 Apr 2026 08:49:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1270015.1558849; Wed, 01 Apr 2026 08:49:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7rGX-0008DJ-DP; Wed, 01 Apr 2026 08:49:33 +0000
Received: by outflank-mailman (input) for mailman id 1270015;
 Wed, 01 Apr 2026 08:49:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1w7rGW-0008DD-AT
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 08:49:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7rGU-000gCP-4L
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 10:49:31 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69ccdc11-5cb7-0a2a0a5109dd-0a2a4506e6dc-46
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 10:49:31 +0200
Received: from [209.85.167.48] (helo=mail-lf1-f48.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69ccdc1b-0df0-0a2a45060019-d155a730f020-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 10:49:31 +0200
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-5a2a58b0cbdso5818586e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 01:49:31 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1775033371; cv=none;
        d=google.com; s=arc-20240605;
        b=W2Cbfu+nxaDaG+DPnen6M3inS9SDug0YpKE7O1uhs8rnVaPqBhhagaM3E2jTB6aH7e
         AC4J/96g4q+lfsxnYoD5v5XcpaJ4SAgIPoE1rRSflBtM2LWv5Pwtf0BNVrhY0ZOacUhh
         r/racb/VHahlT2yVsyCQHhfPtphN1/sA9C6kWbn3g6nnkjUdB7LhvGBe89n+X1FxG9dS
         5Oufyn2UUcKb3ngzE8QapNF1QmFNB85uA42HiQgRNVfrz156jrfoWSah/4bCfjVqpLjH
         C5MWxjs3xMxyq0nY1Uh1eFtPvQwVhl1Wr6+I5kzPT/GdKkqzWjH4lHeSnCuL09/xt5j8
         fiZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vVK0QStF2GdKVLmaGgjkhNe8NUIJ8vpEmv3PLMPy05k=;
        fh=E1tx1CTO87TVP+rJvI0fR5+M2AY+4nOLumwAR6+VAi0=;
        b=kXUK9SG7sdBzzxrgZIp9B+2bcv/K5w05EGIWmMCaxrqm45Vg4N3MehnOpQxLYUjla/
         FILZOTYGxoEW15F0zdYujPwXdXcyJB2nmzwoFK94a4AEr+qcMf8ti5tD+Rd7VPnVSQUZ
         pTxyIBNr0Vk/hABAbblnVS1fdZGpheTOncgGvIIIS8kh81n8Qyr9t8oLy/YjgeoJUSXt
         HhfVipeuuyhwTy6tThkzEFuSO0pAuzLHCSJCkJwn8NFyaCqD92ZJrFqaSAv7vmvMt8gG
         1AhJRqNYuO7wAlo+i9e+c6nkYSlFDGtsYUE5H2ofPbyWNqszA8ILX0eevOu5lFU99g4w
         P20g==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775033371; x=1775638171; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vVK0QStF2GdKVLmaGgjkhNe8NUIJ8vpEmv3PLMPy05k=;
        b=U7cVPadvQOY6L98OAU8ZH5WkN4UKuQfXdB8gHyawjyu3MyBqEdPGJyYmnHCybplff8
         xnBbWhKIhR0doHP1EpHNDUXKTV+6VwBI2kVngMwAR8W2GvOpbqwAeOa4oXpbontZncg0
         BjC/YJ9XhVPbjvZb+ZeASSWsQm4FlGYKjQd/B+nfqM8Gp7mpmpZohXyU9ODGMwGH9WCh
         Qrf3WOQzAifPZqsgZ0XWM/VBeglAUqi8W3OZZ/JEHHmFz3CfGyJrhPNNhHWP3aedsdY3
         YTMsWYSAkza9V37p8ThePBxI/UcDxDo2lQWomO9PkUdeHXkljzqRIr0jXU61yFUt41PE
         qgbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775033371; x=1775638171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vVK0QStF2GdKVLmaGgjkhNe8NUIJ8vpEmv3PLMPy05k=;
        b=NsBm6ld0f94v6LaUgjcbpMSN2026GDooV+61ySdyA1IsqdJioge6ZwFgKB2XLpj9/X
         VVyZNw5Qwbts32gTd5c4hfsWtuiT4qsxQnQDD6kyi9GOPS15VFDP5ppB7MYIAeGpmFNS
         wjI6V+enEciRZ+ocDEx7GUyqzTpQ0IjnPQNS/jHG9+9WrxHUH36ggYFLm6QHfsiJ6/oB
         9vIU3zAXq2dLU8mlk1rccCrfWR3X1XN35yaxFFFvsIQLwxpbcLhZXIvivASlbQHd8WOJ
         u2/iLF44rqFmYyaCnIToNfj1eGx9wE2Y5qWaw1SjRMh4ki47WCMMlcFbN9dBHuO/uiBr
         i25A==
X-Forwarded-Encrypted: i=1; AJvYcCVrKJEphbdlGtDTSYnujoh2zcRbEkMwPV7jnPbMAYMlUK+crzQml2d33NGBJVyXMtItXvQX5AaXJeU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwoBu9bnyVslSLsy8viWHwGMx4RpSh+cys9yGL6Pw8j1ZERjNNf
	+OYRRoN6xyq2vr5NaBFR/UPE3YgkraxlbBZ3SM4eFIshNqc3k3SmwfW0YS76IKGPHnJilxPos3S
	RAj66qoU1p3O117cNFUXPLhjwlC/jUPw=
X-Gm-Gg: ATEYQzyl4FV/6jOtz9Vi4e+sbLftxdlDFVxUrwgfTeflGYkT2WLp0WyATRsj/iaOCq/
	9/lpSegwXnNGJt1jiRRY82xwTwRbejyDDQhfgdeHwLMd328mGrI+exgT9yNNDso9kwrRE9cdeCw
	Rkd/khG8D3LreaI0arytweZTjr68zdmHSnhmaZwCXaOJ7XzVvOexL+7wB7+E0rX0dgKui4dNf5Y
	Rgjk3fd4TH5ftcHCJBidR7vfJnUlLajH1mkU1Rzh1mq3FyME1ToSoIBeTrvyQfSFAZ6tN3J5tNR
	hOFq
X-Received: by 2002:ac2:5fcc:0:b0:5a2:c433:a82 with SMTP id
 2adb3069b0e04-5a2c4330ad9mr361667e87.2.1775033370462; Wed, 01 Apr 2026
 01:49:30 -0700 (PDT)
MIME-Version: 1.0
References: <e1d18d55557ebe232fd62174f186b1cf228e48e5.1774981189.git.mykola_kvach@epam.com>
 <dc5550d7-5a2d-4ca1-85de-5a17c24aeac4@suse.com> <CAGeoDV-ffZsOW+Cu0-oPA1obBOv_1nWU8_PAdaqaoy6=YUHGig@mail.gmail.com>
 <5b16e00e-9a4d-4a18-8a5e-dde10b42a043@suse.com>
In-Reply-To: <5b16e00e-9a4d-4a18-8a5e-dde10b42a043@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Wed, 1 Apr 2026 11:49:19 +0300
X-Gm-Features: AQROBzCpNjKvUG3SbuecfJwM4JlrHWgyfWLx9uPuD5FWJ92wv9TITUcMGszK-04
Message-ID: <CAGeoDV_Cdpa6beFemKaVcCguwmo95x0g0rsRYbS1x5dAUxFPLQ@mail.gmail.com>
Subject: Re: [PATCH v3] xen/arm: vpsci: ignore upper 32 bits for SMC32 PSCI arguments
To: Jan Beulich <jbeulich@suse.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-16d1c6/1775033371-5D92A3D8-9BBE9142/0/0
X-purgate-type: clean
X-purgate-size: 4968
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:email,mail.gmail.com:mid,suse.com:email,epam.com:email];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: B20F737714F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 1, 2026 at 11:14=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 01.04.2026 09:13, Mykola Kvach wrote:
> > Hi Jan,
> >
> > On Wed, Apr 1, 2026 at 9:29=E2=80=AFAM Jan Beulich <jbeulich@suse.com> =
wrote:
> >>
> >> On 31.03.2026 20:31, Mykola Kvach wrote:
> >>> From: Mykola Kvach <mykola_kvach@epam.com>
> >>>
> >>> SMCCC DEN0028G, section 3.1, states that for AArch64 SMC/HVC calls
> >>> using Wn, only the least significant 32 bits are significant and the
> >>> upper 32 bits must be ignored by the implementation.
> >>>
> >>> So for SMC32 PSCI calls, Xen must not treat non-zero upper bits in th=
e
> >>> argument registers as an error. Instead, they should be discarded whe=
n
> >>> decoding the arguments.
> >>>
> >>> Arm ARM DDI 0487J.a (D1-5406) also notes that the upper 32 bits may b=
e
> >>> implementation defined when entering from AArch32. Xen zeros them on
> >>> entry, but that guarantee is only relevant for 32-bit domains.
> >>>
> >>> Update PSCI v0.2+ CPU_ON, CPU_SUSPEND, AFFINITY_INFO and SYSTEM_SUSPE=
ND
> >>> to read SMC32 arguments via PSCI_ARG32(), while keeping the SMC64
> >>> handling unchanged.
> >>>
> >>> No functional change is intended for PSCI 0.1.
> >>>
> >>> Suggested-by: Julien Grall <julien@xen.org>
> >>> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> >>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> >>
> >> I thought I might as well include this in my next commit sweep, but is=
n't
> >> this R-b being invalidated by ...
> >>
> >>> ---
> >>> v3:
> >>>  - use PSCI_ARG_CONV for SYSTEM_SUSPEND
> >>
> >> ... this change. That's ...
> >>
> >>> @@ -422,14 +427,8 @@ bool do_vpsci_0_2_call(struct cpu_user_regs *reg=
s, uint32_t fid)
> >>>      case PSCI_1_0_FN32_SYSTEM_SUSPEND:
> >>>      case PSCI_1_0_FN64_SYSTEM_SUSPEND:
> >>>      {
> >>> -        register_t epoint =3D PSCI_ARG(regs, 1);
> >>> -        register_t cid =3D PSCI_ARG(regs, 2);
> >>> -
> >>> -        if ( fid =3D=3D PSCI_1_0_FN32_SYSTEM_SUSPEND )
> >>> -        {
> >>> -            epoint &=3D GENMASK(31, 0);
> >>> -            cid &=3D GENMASK(31, 0);
> >>> -        }
> >>> +        register_t epoint =3D PSCI_ARG_CONV(regs, 1, is_conv_64);
> >>> +        register_t cid =3D PSCI_ARG_CONV(regs, 2, is_conv_64);
> >>>
> >>>          perfc_incr(vpsci_system_suspend);
> >>>          PSCI_SET_RESULT(regs, do_psci_1_0_system_suspend(epoint, cid=
));
> >>
> >> ... this hunk aiui, which is far from merely cosmetic imo. While
> >
> > Nobody said that the change had to be purely cosmetic in order to keep
> > the tag. I understood it differently from the official Xen
> > documentation pages.
> >
> >> behavior looks to remain the same for PSCI_1_0_FN32_SYSTEM_SUSPEND, it
> >
> > Exactly. If the changes are not substantial, I do not see a reason to
> > drop the tag ...
> >
> >> clearly changes for PSCI_1_0_FN64_SYSTEM_SUSPEND. That may be intended
> >> and for the better, but the change clearly wasn't reviewed by Bertrand=
,
> >> nor - when offering the R-b - did he ask for this extra change.
> >
> > ... and this is also how I understood the Xen patch submission
> > guidelines [1], which say:
> >
> > "Note that if there are several revisions of a patch, you ought to
> > copy tags that have accumulated during the review. For example, if
> > person A and person B added a Reviewed-by: tag to v1 of your patch,
> > include it into v2 of your patch. If you make substantial changes
> > after certain tags were already applied, you will want to consider
> > which ones are no longer applicable (and may require re-providing)."
> >
> > So my understanding was that tags should normally be kept across
> > revisions, unless the changes are substantial enough to make them no
> > longer applicable.
>
> Maybe our understanding of "substantial" differs. To me that's anything
> changing functionality. Style adjustments, typo corrections, and alike
> generally aren't substantial (albeit even then there may be exceptions).

Thanks for clarifying what you consider substantial.

Even under that interpretation, I do not see a functionality change
here. "Refactoring" seems like the more accurate term in this case:
the internal form changes, but the intended external behavior does
not.

It may be that we are using "functional change" in slightly different
senses here.

For v3, the switch to PSCI_ARG_CONV() in SYSTEM_SUSPEND was meant to
make this case consistent with the helper-based argument decoding used
elsewhere, not to change behavior.

In particular, I do not see a functional change for
PSCI_1_0_FN64_SYSTEM_SUSPEND: v2 used PSCI_ARG(regs, 1/2), and in v3
PSCI_ARG_CONV(regs, 1/2, is_conv_64) should resolve to the same thing
when is_conv_64 is true.

If I am missing a behavioral difference in the FN64 case, please point
out which one.


Best regards,
Mykola

>
> Jan

