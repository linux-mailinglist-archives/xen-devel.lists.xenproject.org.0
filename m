Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zmlTAGTDH2popgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 08:02:12 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2546347AE
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 08:02:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=LTVzqaEL;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1325643.1590944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUefl-0004Zb-Na; Wed, 03 Jun 2026 06:01:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325643.1590944; Wed, 03 Jun 2026 06:01:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUefl-0004X4-Kw; Wed, 03 Jun 2026 06:01:49 +0000
Received: by outflank-mailman (input) for mailman id 1325643;
 Wed, 03 Jun 2026 06:01:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wUefk-0004Vt-Pg
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 06:01:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUefk-002LjE-5P
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 08:01:48 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a1fc33f-5cb7-0a2a0a5109dd-0a2a4502b734-32
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 08:01:48 +0200
Received: from [209.85.208.182] (helo=mail-lj1-f182.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a1fc34b-af86-0a2a45020019-d155d0b6c598-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 08:01:48 +0200
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-3967724bed1so40549691fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 23:01:48 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1780466507; cv=none;
        d=google.com; s=arc-20240605;
        b=B/5G4dpGv1qv97hfC5ep1oABfA5f81xbYtDNkQPYGpg8iK62fXjfYaMyVOmHBxhFNL
         pn5YmCmYnX/D4KennPHL3sE7NVW/AKknxLtM1xe70b1McmMxjogfMMwhEtsr6iULK805
         oWalXVslJUJiWbjzp9ljbuAm+cVwO+7d5ghiBoE8N+m0zSM6GIxaWXnyJrlgAGVVsX7D
         yoPnwjwNPM0vOVlRFkYF3uMlwIkBV1GUFWCz2u0mQ/D1EYprPS/jt2oCOnVzXIPMz2Qg
         l8WkoiyR6g9eS60e82rM2ZeMQH8m11w5KUEpHqfQJ4knPWMQ/6OjoRYYswFZi3CwpYUN
         N5dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jdWbkSpPql8cjcN0VxJhIlsFq6AEhavLmsMjNu27XlM=;
        fh=Y48x1ukbkIffKm3ALNxHiiKo9yxrWWvlvMeS1xgC45s=;
        b=VHgvEwsV/IfUJ92pFO7mFdvQapdR8RStk8aPTVpHY2xCRuq3QcMgm/x33K52rudhwu
         XSqjeXAzdFuaj63QsuOTvKgWWs88NviDfZ9KLDJXKVWXrQlf2QCbekHQE22/4ORKe+kc
         5yr5CXlD8T3Br/kC28Me/H4KysbxKGrAri0qu0YArB8ZqwM5a2UrULYy3Rw2pb6hDYT6
         9Th4ooO6CzzALkcmYoj0S6sOi6uP8Tt6Xb1N0DQNFxUss2ml7LsjsTmhs7iDorlVPVA/
         r9Jc0Mb1+16Is5NzGpooxTUIpOpG2st2O+O7cZuC52dmKcFup0JjqUlBEnD49EW3lb7u
         1z3Q==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780466507; x=1781071307; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jdWbkSpPql8cjcN0VxJhIlsFq6AEhavLmsMjNu27XlM=;
        b=LTVzqaEL3YzBQfDvDUHiOocGl/aglOsIJH6BmHczKJ5xtGteypH0g/aNZFoFsjb8Ey
         CSGEhZC5l4CXxoiJrrFNPL4yt8QozNygMMZUeMtF1Q+hlC58I+puawHWFSUex13BqC9Y
         3IxEsNRTXBRrcCUKBHoPX9atsQJzll8agqeiLPbtPJdfZZe9k6KW27Xj3wJEQiuAUwW2
         +Qizh3jJT5x8O0uN+Guj2hW9KEYJ0F4WAWSr/9CvRTOezMict7QpmTl6V+enk+k90u9P
         cYig4rcZRa4CprOCsMGL123kkYd+GWAVwWdiVbiEnyd0dxtjoLHnBZciGN0qv56coRke
         xd0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780466507; x=1781071307;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jdWbkSpPql8cjcN0VxJhIlsFq6AEhavLmsMjNu27XlM=;
        b=hR9qPlNiMJK/d5SKql9STg2YAsFsjl9SrVa0YGVgTl4EA4V4Qi4z+yF2p6RmPk7jPl
         an55g0/mDQlFD9JQqQ4uqZK73kMqtPLp7qOgjkFC1sShAANoFRzZHPrhKWFdDO9/CX8D
         RMaOHeZx2HjWxiZUOUZajjCVzmhvpnTpWldONj4e/HcffkfjgewLG7S0W+ji+L3y2ZZi
         hOPHtV+Hm1fPy7OsOMhpO7l/lEV35pvTDqyJlZ7xU5mop3ZtXK8aEsXBZMDm+/OaJgkD
         bobKjqC7Hc3T0qszj6+B3DWgMO693fzVuUXwMiVyTCYagX224W5ZWjywoApzmY6rG8v3
         vLiA==
X-Gm-Message-State: AOJu0YwPK7Fn6cCUulRSSzutUqaPigPlnMCKCN6RndUplsWg2pZJ0STo
	i3Gh/go0d1Rkr6lLNl7AFIN5PgbCpuObyQ6pwxgs275JKAVh/J53Uy73lYstYYQE01UQHIAwpiV
	Q+uwfPIMflzXlMcglbtJvLeWyAjcgnGQ=
X-Gm-Gg: Acq92OE5rhkD5+W0UOqKDenPuoc2C5C2Z5ShPRbNcUI+5Z5FZQdNbSKVhVVTwxiAwcq
	9GNKnlGZ0h4l+U6ADKRXTL6Oeci78QlFwoCg8B5JHeCgjOeoyrnAPw+gIwNeSoS9IHf68GHZ73D
	91QH6hP/YasiynbRkH1SWyjxVFpvM9MV7vGjU3RKKOlskcV2YpmZfQfgva8W8CP0aGygbnC4OLP
	n2cbZWk5eEEmon/z5oC2zKXFiqGVTWTxR9pKyWI8saU6TR9CNSLyI02RP/JVHSXUTWwcuMh5X2q
	JVzBM4Rk4+JUbo6K
X-Received: by 2002:a2e:9a11:0:b0:38e:58c7:cca with SMTP id
 38308e7fff4ca-396af40e068mr4676981fa.13.1780466507235; Tue, 02 Jun 2026
 23:01:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1779385072.git.mykola_kvach@epam.com> <279cd20f49be956fc8493aace906a1adfaf473ee.1779385072.git.mykola_kvach@epam.com>
 <349E0857-AB61-48C1-BB91-ABE1422142C9@arm.com>
In-Reply-To: <349E0857-AB61-48C1-BB91-ABE1422142C9@arm.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Wed, 3 Jun 2026 09:01:36 +0300
X-Gm-Features: AVHnY4Ie423MWRzLl_UcfIGBlJdN1IdHbeHIqCBfoTk8iWUFCLo5exi1juOHr0s
Message-ID: <CAGeoDV-sEeQSpDvX7qTmHdRNLPWPUbxJ_NWYYRKAmkk1w6ixmw@mail.gmail.com>
Subject: Re: [PATCH v10 09/13] xen/arm: smmu-v3: add suspend/resume handlers
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola Kvach <mykola_kvach@epam.com>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Rahul Singh <Rahul.Singh@arm.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-720697/1780466508-7BD67161-9DBE308B/0/0
X-purgate-type: clean
X-purgate-size: 4461
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Luca.Fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:Bertrand.Marquis@arm.com,m:Rahul.Singh@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:praan@google.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,mail.gmail.com:mid,epam.com:email];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5E2546347AE

Hi Luca,

Thank you for the feedback.

On Mon, Jun 1, 2026 at 8:12=E2=80=AFPM Luca Fancellu <Luca.Fancellu@arm.com=
> wrote:
>
> Hi Mykola,
>
> > On 21 May 2026, at 18:45, Mykola Kvach <xakep.amatop@gmail.com> wrote:
> >
> > From: Mykola Kvach <mykola_kvach@epam.com>
> >
> > Add system suspend/resume callbacks for the Arm SMMUv3 driver.
> >
> > During suspend, configure GBPA to abort incoming transactions, disable =
the
> > translation interface while keeping CMDQ enabled, issue CMD_SYNC to ens=
ure
> > all previously issued commands have completed, then disable the SMMU IR=
Qs
> > and SMMU.
> >
> > Resume uses arm_smmu_device_reset() to reprogram the SMMU and re-enable
> > translation and interrupt generation.
> >
> > The IRQ setup split follows the approach from Pranjal Shrivastava's Lin=
ux
> > arm-smmu-v3 runtime/system sleep series: IRQ handlers are requested onc=
e
> > during probe, while reset/resume only restores SMMU hardware state and
> > re-enables IRQ_CTRL.
> >
> > Only the pieces relevant to Xen's currently supported SMMUv3 path are
> > ported here. Xen documents SMMUv3 MSI and PCI ATS as unsupported and no=
t
> > compiled/tested, so this patch does not restore SMMU MSI IRQ_CFGn regis=
ters
> > nor reinitialize ATS/PRI endpoints. If those paths become usable,
> > suspend/resume will need corresponding MSI restore and ATS/PRI
> > quiesce/reinit steps.
> >
> > Link: https://lore.kernel.org/r/20260414194702.1229094-1-praan@google.c=
om/
> > Based-on-patch-by: Pranjal Shrivastava <praan@google.com>
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> > Changes in V10:
> > - Disable SMMU interrupt generation during suspend before disabling the
> >  SMMU interface, matching the resume/reset path which re-enables IRQ_CT=
RL.
> >
> > Changes in V9:
> > - Use CMD_SYNC in suspend instead of polling CMDQ_CONS, so the suspend
> >  path waits for command completion rather than only command consumption=
.
> > - Document that arm_smmu_setup_irqs() is probe-only and that future Xen
> >  SMMUv3 MSI support will need to restore SMMU IRQ_CFGn registers on
> >  resume.
> > - Restore the reference to Pranjal's Linux runtime/system sleep series =
and
> >  clarify that MSI/ATS/PRI resume handling is outside the supported Xen
> >  path.
> > - Prefix the subject with xen/arm for consistency with the rest of the
> >  Arm suspend/resume series.
> >
> > Changes in V8:
> > - Honor ARM_SMMU_FEAT_SEV when draining the CMDQ during suspend, matchi=
ng
> >  the existing runtime CMD_SYNC path.
> > - Fold the suspend rollback reset path into a helper and rename the err=
or
> >  reporting to describe suspend rollback rather than resume.
> > - Treat SMMU reset failure during resume as fatal instead of logging an=
d
> >  continuing with a potentially unusable IOMMU.
> > - cosmetic changes
> > ---
> > xen/drivers/passthrough/arm/smmu-v3.c | 186 +++++++++++++++++++++-----
> > 1 file changed, 150 insertions(+), 36 deletions(-)
> >
> > diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passth=
rough/arm/smmu-v3.c
> > index bf153227db..be8028c036 100644
> > --- a/xen/drivers/passthrough/arm/smmu-v3.c
> > +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> > @@ -1814,8 +1814,7 @@ static int arm_smmu_write_reg_sync(struct arm_smm=
u_device *smmu, u32 val,
> > }
> >
> > /* GBPA is "special" */
> > -static int __init arm_smmu_update_gbpa(struct arm_smmu_device *smmu,
> > -                                       u32 set, u32 clr)
> > +static int arm_smmu_update_gbpa(struct arm_smmu_device *smmu, u32 set,=
 u32 clr)
>
> Now this one and arm_smmu_device_reset loose __init also for !CONFIG_SYST=
EM_SUSPEND,
> but I=E2=80=99m not sure if in the codebase we are dealing with these kin=
d of cases already or if it=E2=80=99s still ok
> to let it be without __init anyway.

Good point. I will avoid keeping these helpers in runtime text for
!CONFIG_SYSTEM_SUSPEND.

I think a small local annotation in the SMMUv3 driver would work well here,
something like:

#ifdef CONFIG_SYSTEM_SUSPEND
#define __init_or_smmu_suspend
#else
#define __init_or_smmu_suspend __init
#endif

and then use it for arm_smmu_update_gbpa() and arm_smmu_device_reset().

This keeps the suspend-enabled case unchanged while preserving the existing
init-only placement otherwise.

What do you think?

Best regards,
Mykola

