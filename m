Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLgnLuOKBWrGYAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2026 10:42:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E1253F6E0
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2026 10:42:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1308738.1580110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNRdg-00008R-Uv; Thu, 14 May 2026 08:41:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1308738.1580110; Thu, 14 May 2026 08:41:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNRdg-00005u-Rt; Thu, 14 May 2026 08:41:52 +0000
Received: by outflank-mailman (input) for mailman id 1308738;
 Thu, 14 May 2026 08:41:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wNRdf-00005o-7O
 for xen-devel@lists.xenproject.org; Thu, 14 May 2026 08:41:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNRde-0057nR-FC
 for xen-devel@lists.xenproject.org; Thu, 14 May 2026 10:41:50 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a058ab8-2eae-0a2a0a5409dd-0a2a4503c22e-6
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 10:41:50 +0200
Received: from [209.85.208.173] (helo=mail-lj1-f173.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a058acd-672d-0a2a45030019-d155d0adb036-3
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 10:41:50 +0200
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-39397d63804so89349241fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 01:41:50 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1778748109; cv=none;
        d=google.com; s=arc-20240605;
        b=ILG3PhRC3dABd7Sv+UOaQzZb8on6W9GHbG1v2/Y/spCxNV7lK4qRswH+/9paTNkRlr
         MyazpK6x9xfsYWB9lH3IebFdtvaYIS4P2h98UgvDIG7RJdm8d9iSFHjHbVk9eI0sr0Sz
         ojZ9Xw8/iJZKLcBFMEbFwg3NXC+4deOPmU1RnZLgjodpkEkqi4k3Sv9Dtj+q6LT7Fbyo
         symyurKwsTWqlDzPdr8H9txvdgvvHQg+EAwqFoBdtz3EWfE/jW5mBGp7+KTol9M182PP
         MkJfsmqfZFsdB9FlS8o5GADLP/llW+84isVMT/8Fs+3XFTpSfL0qdGCnoaUelvjmFEw0
         grBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cluKyGouWJtd1lIstxQNzBM7OpUssjSxRkEElOaVOGI=;
        fh=uAzoxIkY79cy0zES8IqO07ArU7DBG3jlr2bg4XRVkR0=;
        b=jFtxp2UmrAaxC5LcACWgqhEp9ZmQjiqQKM5YRZzxWQHqmiiysfIMJ0wa1zHWjoptFy
         4wcodmDZFN+ELOn8MroFvKAKElm6Fs9Fhrb5cJP5OS4cFKRuaFSOYO6kKurHHjsRqzHE
         F4Ios+duLVzrwK6k4kTmDis4OqqDanYSBzc7X+2qChgyedHu/n9rnBghoXBRY4ksKYdN
         wt2vhCjn380txTJp5Ch6pwjK+O0bp5gOV4PSDc1HkVtBTz4R6hht+XQsXfx21DM2Y8pL
         RFNBlxXhw1tXuSUlij3W4ViTTSFNyyxDs69VIH4ydLgxHK2toKar41HK/C0xEnSIs+Zv
         nb3A==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778748109; x=1779352909; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cluKyGouWJtd1lIstxQNzBM7OpUssjSxRkEElOaVOGI=;
        b=L/mHnFPGME2pWa711Ro7S0dXqQ/Ljjf9/rub+hXlBHdlMZhBYY/6C2QqrKKWn8FJdb
         31Zfr3Kj+k//6nROr6qYi/Snals+32tr4c/q4xg/CF12LTvoqv6VwMONvFP8zGQnyuPL
         v0CF6o0Lezl1J0cTiWpheOM14cjeqEtKVDKdRajC5LaW86tnb2HMiPZWu9MDrGwBaRjT
         qFt7JFF4G6OgvXstLLByghd2UiWn0tfWwNPPFJKinlidN3WQaLEIwr3225uC4aQfxl1t
         kD9uOvUPGf3Rc0ZwonNn0yegf6JsFdpaPbHvzh9FoqTAvA2U10WsIHdwLgBC9P+IaiNf
         37bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778748109; x=1779352909;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cluKyGouWJtd1lIstxQNzBM7OpUssjSxRkEElOaVOGI=;
        b=p/UFFZcwHRQiVN8Bn0OqmNXowngqKcby3RRuJ39KawFl/Y/PjL2z2G7ZlDUW8X7yZp
         R1aDT93Z2uDmKSnLTVJVinwB5nW8fqsoMHL/7IMaChVfGXrwqYgG7xi57kaJ3RQutbs0
         L3JYba5FcF/QL/plWzFKf0Kli91ARLWzFLZzDsWZByC8717Atz/WKT8c+0x3S0janlzw
         OI/2CviyJklH7zH552RcjBnNMB8MJSAVwPnR+Su0B65iopbGTTa8t/7zf9Jw+HiN/cll
         DMKwPLNjHWy6xbKrbkKParpNQKEVc7lDsQ9h0eQ8LeQbgIJkt+R0eZboyF2cytIMiFKp
         g+WA==
X-Gm-Message-State: AOJu0YzarTZnA+Zz8tlaLbUeWSBuoFMIUTf21FNWH1JcKiEyfHkZBI2B
	eHiVSt22UQaUXl/EZDSCrl7yqW3wR3EulXls9yabMvFGkNzsgLiXguqcEgfHbV/wtB69b9d/MoE
	3LkaLLhKoqvso6VWhI86hTuuzOXZIykk=
X-Gm-Gg: Acq92OFyIwXRGVCBw5e9ySuWyfCKsQXarlUj5mmT/dQCBqXluH8KGVn+GffB8yqOBhd
	EyP/MkbNiPd9AGFfl3RUC8ur8/43GX0dDklLsJBdk4MItATG1h7wGwWVgXrzlnMQgTyH277ZD6L
	4A8Y52TxsM/uh1al3a0OTGPVmo6M/6ZUsouWKR6A/X2DiYcG2KVMX8L8Hm4lxmOkSDjCp3v84YL
	54TEfheNOvZBTwSjz3ge3m7qIyUBOvintsOx3JTWW2RoxrRvmTZ1o+v8/d4JkXR8QoLa+lnpCO1
	z4tgM+sQ0gyPdCs=
X-Received: by 2002:a05:651c:546:b0:38f:f8f3:6c58 with SMTP id
 38308e7fff4ca-3944b4225abmr27236341fa.11.1778748109260; Thu, 14 May 2026
 01:41:49 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1778605274.git.mykola_kvach@epam.com> <ddf37bff562e7e2055ee049ab63111c5a2a2e611.1778605274.git.mykola_kvach@epam.com>
 <B1776A58-502C-403E-8EDD-6FF3B62E1EBE@arm.com>
In-Reply-To: <B1776A58-502C-403E-8EDD-6FF3B62E1EBE@arm.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Thu, 14 May 2026 11:41:37 +0300
X-Gm-Features: AVHnY4I0gUvzQQ-_qHdTa0hzEHhPjCzUk3TSOa0yP8AT7mJJff5njkcTSwduex8
Message-ID: <CAGeoDV_XncpoEAnKVzeGo6Hr3ry5iwT0-Pn6NfruqSbdyE+V+w@mail.gmail.com>
Subject: Re: [PATCH v9 03/13] xen/arm: gic-v3: tolerate retained redistributor
 LPI state across CPU_OFF
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-33051d/1778748110-4066C938-535ADEF6/0/0
X-purgate-type: clean
X-purgate-size: 4492
X-Rspamd-Queue-Id: 21E1253F6E0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Action: no action

Hi Luca,

Thank you for the review.

On Wed, May 13, 2026 at 5:53=E2=80=AFPM Luca Fancellu <Luca.Fancellu@arm.co=
m> wrote:
>
> Hi Mykola,
>
> > On 12 May 2026, at 18:07, Mykola Kvach <xakep.amatop@gmail.com> wrote:
> >
> > From: Mykola Kvach <mykola_kvach@epam.com>
> >
> > PSCI does not guarantee that a GICv3 redistributor is powered down acro=
ss
> > CPU_OFF -> CPU_ON.
> >
> > DEN0022F.b says CPU_OFF powers down the calling core (5.5) and CPU_ON
> > brings the core back with a defined initial CPU state (5.6, 6.4).
> > However, PSCI leaves interrupt migration and GIC re-initialization to t=
he
> > supervisory software/firmware stack: the caller must migrate interrupts
> > away before CPU_OFF (5.5.2), and the execution context that is lost in =
a
> > powerdown state must be saved and restored by software (6.8). PSCI also
> > calls out GIC management explicitly in 6.8, including retargeting SPIs,
> > preventing PPIs/SGIs from targeting a powered down CPU, and reinitializ=
ing
> > the CPU interface after CPU_ON.
> >
> > This matches the GIC architecture. IHI0069H.b Chapter 11.1 requires the=
 PE
> > and CPU interface to share a power domain, but explicitly allows the
> > associated redistributor, distributor, and ITS to remain powered while =
the
> > PE and CPU interface are off. All other GIC power-management behavior i=
s
> > IMPLEMENTATION DEFINED. DEN0050D Chapter 4.2, "Generic Interrupt
> > Controller (GIC)", says the GICv3 redistributor may live either in the =
AP
> > core power domain or in a relatively always-on parent domain. So after
> > CPU_OFF -> CPU_ON a secondary CPU can legitimately come back to a live
> > redistributor with GICR_CTLR.EnableLPIs still set.
> >
> > Handle that case in the LPI setup path instead of assuming a fully rese=
t
> > redistributor.
> >
> > The LPI path needs special care because the GIC spec makes redistributo=
r
> > LPI state sticky and partially implementation defined. IHI0069H.b 5.1.1
> > and 5.1.2 say that changing GICR_PROPBASER or GICR_PENDBASER while
> > GICR_CTLR.EnableLPIs =3D=3D 1 is UNPREDICTABLE. After clearing EnableLP=
Is,
> > software must wait for GICR_CTLR.RWP =3D=3D 0 before touching the pendi=
ng
> > table. The architecture also permits implementations where, once
> > EnableLPIs has been set, clearing it again is not guaranteed to work.
> > Where an ITS is present, the spec strongly recommends moving LPIs to
> > another redistributor before clearing EnableLPIs.
> >
> > Because of that, treat a retained EnableLPIs state as valid when the
> > redistributor still points at Xen's expected PROPBASER/PENDBASER tables=
.
> > Only try to clear EnableLPIs when the retained configuration does not
> > match Xen's state, and wait for RWP before reprogramming the tables.
> >
> > This is also consistent with platform firmware reality: PSCI and the GI=
C
> > architecture allow platform-specific redistributor power handling, and =
not
> > all platform firmware implementations force a full redistributor power-=
off
> > through implementation-defined controls during CPU_OFF. Xen therefore n=
eeds
> > to tolerate retained redistributor state on secondary CPU bring-up.
> >
> > Keep gicv3_populate_rdist() resident as well, because gicv3_cpu_init()
> > reuses it on secondary CPU bring-up after init.
> >
> > Tested using Xen's non-boot CPU disable/enable path on Arm
> > FVP_Base_RevC-2xAEMvA, both with and without:
> > -C gic_distributor.allow-LPIEN-clear=3D1
> > -C gic_distributor.GICR-clear-enable-supported=3D1
> > and on Orange Pi 5.
> >
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
>
> I understand you will send a separate patch to fix RWP.
>
> Looks ok to me, I see you=E2=80=99ve touched some printk in gicv3_populat=
e_rdist() which
> were wrongly having %d for smp_processor_id(), sometimes maintainers are =
not
> really ok with that when the changes are not related to the commit, but a=
part from that:

That change was intentional.

In the previous version of this series, you pointed out the
wrong format specifier for smp_processor_id() in one of these
printk()s.

Although it was not directly related to the functional change in
this patch, I decided to fix the other similar occurrences in
gicv3_populate_rdist() as well, for consistency.

>
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
>
> Cheers,
> Luca
>
>

Best regards,
Mykola

