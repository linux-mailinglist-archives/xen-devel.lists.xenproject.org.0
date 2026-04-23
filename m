Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIo3DtWm6WmzgQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 06:57:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 847B744D1DA
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 06:57:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1291541.1570422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFm7Q-00023x-0K; Thu, 23 Apr 2026 04:56:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1291541.1570422; Thu, 23 Apr 2026 04:56:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFm7P-00020x-PM; Thu, 23 Apr 2026 04:56:51 +0000
Received: by outflank-mailman (input) for mailman id 1291541;
 Thu, 23 Apr 2026 04:56:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wFm7O-000206-8R
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 04:56:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFm7M-009Cya-KX
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 06:56:48 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69e9a689-2eae-0a2a0a5409dd-0a2a450ccf8c-6
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 06:56:48 +0200
Received: from [209.85.208.170] (helo=mail-lj1-f170.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69e9a690-62f1-0a2a450c0019-d155d0aad008-3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 06:56:48 +0200
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-38e7c3a2deaso40081661fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 21:56:48 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1776920208; cv=none;
        d=google.com; s=arc-20240605;
        b=dWOFG4uy9fQ/SwOdmUqnDoX8mPPhy/656U/I2TUHwNwAzXkEfUfaChMw7prsRFg3hr
         B6aNsm++jFezjDmd6YpK4TO+Y1jLLZlTtnU6vteGqHlAFypGamr5ECHmSDoGqhgUIIEH
         vE6wJcWQksd24rlqi51wE6mbeqr7mLAOKIPkvVt3ei60DU+JwWXr5ieNA3rC6KQDANEx
         ZkisEON1Tucu7/eteD2AK9te9eiwyDUvAfK0460/6LaoqcZRiTLilEmnJ96J3R3B6TFg
         7TSmk4q1y0zQBamI92RbkncNCoew6X3HPS5/I6YaTPt3YIFn+OF8CJsz/hAblEWP2TCi
         IyMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5KwT/fUkg/49QeXPZ+rNcQAo69ZuuG32yU8uuats7eQ=;
        fh=uAzoxIkY79cy0zES8IqO07ArU7DBG3jlr2bg4XRVkR0=;
        b=EVX5+wCfPx5blnRV/+HMruGweTJpKbFBSvPL9Y9+KddOHVyepbObfi7wrGfwUKwdmD
         h5pXRY4e0SQrR6C225cfGGUS48C5tuqtRl50IzPuIem45OL24KxOjA50b/Yt5eK7NxU/
         52bInPKQj9ZL3HTuLSzK+GHiYD9aqVm4nb+uLGY4NVXnEUI6DDbwfWh0eDjmM5sX3PLd
         yrpXFvyuXuwNeQoMh2qJP6XLoFF40C2dnhJI7yQDi79GG0f7tm19G2sadsLT1kDAFxKA
         s7AjYwI+7bNhqratPTeBHOnkCJowynoh7NYz7Sa14nzitjjfNvZsPDek60iXKCyhsMlS
         CbsA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776920208; x=1777525008; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5KwT/fUkg/49QeXPZ+rNcQAo69ZuuG32yU8uuats7eQ=;
        b=oopAz4UjlWY13JyrxM0ZLRVUgdX0J8mChqxZHbT3xuO1UGuQkQtc+vLcMhoHtC7MOF
         kbD/l9kDz3xKONeJiQe7ORkOTXr3T2k2OejYfbFvxhDTouXmlnxDime+3djBjil0zF1a
         Y84n7fOMhujY09c868bG9CMtWIqAJqjXGl1ZDwbV3aD0JEE/vqbdcpOk/WICiT4i807e
         MhMZrgcLU/dynDeOcxJ6Q42opMW5Cn8VGUOnytbnu0WsieTKYu0pP6IoSPcS8jE15mqd
         A32BQhbUN+ZCsO7ovssArK+rXdath5jzCYeMoEc2RZtYqg/AhpLbe5jOp5pPyQ0DndQE
         tq2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776920208; x=1777525008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5KwT/fUkg/49QeXPZ+rNcQAo69ZuuG32yU8uuats7eQ=;
        b=BHom9gP2fzDOmhAUaKs+0ZqCw9a6+R0oer+YdXeuhcFxEkSnmt/Hk48j6Uk1Fbc4si
         oJ+VyGT+N03WT/tegqNBfW9Eb2DSMaoXSgwutK+2kKq5b6i08Lb4YM+0ixZOcrXDwxgU
         +rbysgqcvbid91tNXv473mzIZhwXsiMHmRkQI9vs1WZ81HpOeRmfAIXLTySp/eTCcuCx
         G2B/m0iuHhxqqimyQywWdaz51hITCPidr89aKk4AZdazYbAsQBzHF3PNJ53rg3XnVZP9
         WcDR//FOco9w/MMRWKE9bZAw3pW4btW97eKHWAkBosN2nvx8oM/zSQWea+3Y5o3z9gjc
         Yfrw==
X-Gm-Message-State: AOJu0Yz2dZdy1UFq8amouKeB1SkChJlpqe/nfouNtUZ7sN+a2jlkAcSG
	Qy2CMRRkXx88u72FVVzi7q+oAzOdpmd9fGYjDE5XSHF8FS+ev0L31P3Cpeq36QdAymORV5EhC8K
	AUiW2/QBbT84O7QnIhRYWDnJIck7oVTI=
X-Gm-Gg: AeBDieuchA6mMK3sR5leqJafX8nSNs836PbM0hSVu68fSVUv2In2MQpXkwnufcYLqwJ
	JvTOqKI9z+ritOEZYqECnQc0tH5mJog+y5VANt6Pi7y7Di1bW+fe0DV1HgOivqBuMKK+xEMe7+C
	XN83nA9M8XgwMwrwmThZs5OqZ3Uq0i9F5wcpaUSqF4rwIvhIMuF8icW5VJgrXF0Wa02YFhwe35R
	x+UQuPhsopa/WB4SKEICY5rgP/UfO5lc2R9FmY3U4NvkLo2EEx4I4jUm3WnSDEH5Y6sWFO+uQIu
	AxiEcpXehacuAl0T
X-Received: by 2002:a05:6512:3b8d:b0:5a2:9bd8:838d with SMTP id
 2adb3069b0e04-5a4172b7afcmr7322763e87.6.1776920207443; Wed, 22 Apr 2026
 21:56:47 -0700 (PDT)
MIME-Version: 1.0
References: <459cf46204e86ed3a2ffd79ae649b1a2051f5204.1775812563.git.mykola_kvach@epam.com>
 <1E7985CB-EE4C-4769-B23C-EDEF2E75EF08@arm.com>
In-Reply-To: <1E7985CB-EE4C-4769-B23C-EDEF2E75EF08@arm.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Thu, 23 Apr 2026 07:56:36 +0300
X-Gm-Features: AQROBzA_6YhCxBiY5UFhFwOcd474jGOjYElGn8qjtn5rBjcCecKWeG4-BJWo4LQ
Message-ID: <CAGeoDV92in0kypsU8K_qR+amfo6iMi7VzGT=YxatcU68yffZSg@mail.gmail.com>
Subject: Re: [PATCH] xen/arm: gic-v2: disable interrupt bypass on CPU shutdown
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-d25034/1776920208-F40FDCF5-12E222B6/0/0
X-purgate-type: clean
X-purgate-size: 2793
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,arm.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 847B744D1DA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Luca,

Thank you for the review.


On Mon, Apr 20, 2026 at 2:42=E2=80=AFPM Luca Fancellu <Luca.Fancellu@arm.co=
m> wrote:
>
> Hi Mykola,
>
> > On 10 Apr 2026, at 10:36, Mykola Kvach <xakep.amatop@gmail.com> wrote:
> >
> > From: Mykola Kvach <mykola_kvach@epam.com>
> >
> > The GICv2 CPU shutdown path currently writes 0 to GICC_CTLR.
> >
> > Per IHI0048B.b section 2.3.1, clearing IRQBypDisGrp{0,1} and
> > FIQBypDisGrp{0,1} selects bypass rather than deasserted interrupt
> > outputs when the CPU interface stops driving them. Tables 2-2 and 2-3
> > show that a zeroed GICC_CTLR can fall back to the legacy IRQ/FIQ inputs
> > instead of fully disabling the interface.
> >
> > Fix this by reading GICC_CTLR, setting the bypass-disable bits, and
> > clearing both group-enable bits before writing the value back. Keep the
> > existing GICC_CTL_ENABLE definition for the init path and use a separat=
e
> > mask for the shutdown-side group-enable handling.
> >
> > Section 2.3.2 also states that wakeup event signals remain available
> > even when both GIC interrupt signaling and interrupt bypass are
> > disabled, so disabling bypass does not break the power-management use
> > case, i.e. suspend modes.
> >
> > Fixes: 5e40a1b4351e ("arm: SMP CPU shutdown")
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> > xen/arch/arm/gic-v2.c          |  7 ++++++-
> > xen/arch/arm/include/asm/gic.h | 21 +++++++++++++++++++--
> > 2 files changed, 25 insertions(+), 3 deletions(-)
> >
> > diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
> > index b23e72a3d0..22aa25bad0 100644
> > --- a/xen/arch/arm/gic-v2.c
> > +++ b/xen/arch/arm/gic-v2.c
> > @@ -408,7 +408,12 @@ static void gicv2_cpu_init(void)
> >
> > static void gicv2_cpu_disable(void)
> > {
> > -    writel_gicc(0x0, GICC_CTLR);
> > +    uint32_t ctlr =3D readl_gicc(GICC_CTLR);
> > +
> > +    ctlr |=3D GICC_CTL_BYP_DIS_MASK;
>
> If the GIC v2 implementation includes the Security Extensions, the bit 7-=
8
> are reserved, but now we are unconditionally writing on them.

You are right.

I had assumed that, since these bits are reserved in that view, writing
them would be harmless. However, the specification does not say that
they are WI, so this is not something the patch should rely on.

Looking at it again, there may be a similar layout-dependent issue in
cpu_init() as well, since the current write there also forces all other
bits to zero apart from the ones explicitly set.

I will rework this patch accordingly so that cpu_disable() only updates
the bits that are architecturally defined for the current GICC_CTLR
layout, and I will take another look at the init path separately.


Best regards,
Mykola

>
> Cheers,
> Luca
>

