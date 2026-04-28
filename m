Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCuYC5Gn8GlAWgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 14:26:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF1A484D0B
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 14:26:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1296104.1572497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHhVs-0002hr-U1; Tue, 28 Apr 2026 12:26:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1296104.1572497; Tue, 28 Apr 2026 12:26:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHhVs-0002f8-R1; Tue, 28 Apr 2026 12:26:04 +0000
Received: by outflank-mailman (input) for mailman id 1296104;
 Tue, 28 Apr 2026 12:26:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wHhVr-0002f2-Fo
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 12:26:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHhVq-004oLd-Rl
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 14:26:02 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69f0a73d-bab6-0a2a0a5309dd-0a2a4508ea6e-48
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 14:26:02 +0200
Received: from [209.85.208.179] (helo=mail-lj1-f179.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69f0a75a-63b5-0a2a45080019-d155d0b3a840-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 14:26:02 +0200
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-38dd9f0fdc6so127376281fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 05:26:02 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1777379162; cv=none;
        d=google.com; s=arc-20240605;
        b=VKOy/oml/GKOzJQXriq9pU+AfYPQAkuVWv30/DobLLRPok/TP15Ajikb4Ty+JOJPOT
         kzMh5/RW5klEToNZmLaFlMrrZKU+5yM5daE5UwIELT5ZNj83BQPik+ricwk+iDk/fUaJ
         oDPvReaatNkkKAYehE843WVUcsF1SsCIYccxcUaeUAENp0i6HROFb9/g4lXtl7UjriQe
         gr4/3ktnxtS2FwHteBZhAyJabtGKdNuDdE0GlZ4XxluW9ADDLt6auQhfuadT+e2aUhQ9
         E/cvB3vYmutNrtZ0Z2HnTDYi80R7ErGoUSg4OTk5zuwMWjKp3ZIyfH3NHDHHgTxvnKGO
         X3zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YPmfFtAGxdEn8CPGgHwoGx4Vicyf9zO1ma3sXWVd0lE=;
        fh=OwR6v8hVmBDp+s1/JF83BUlZMKn8JjzdMy/8jQiCxg0=;
        b=c788X47HpmJF2v2vRe99Z4Gghvu3cVqrL3A++Sd5HH0vJoTkku/bqPtlodb20a1fg4
         whtpA8/uo/phqlweoyn9ps+oOtYTy0+ZCD4FVj4TEGiLDD7ay1aZbrDZXYLxMNvPl1OV
         FzDd0UsIfCKkN7uZhcTuPDz95JnY+ag/3Lbb4DkiXd3+oYXPzs7aGBM8F2CpM9gF5a3Q
         NhfSJUiWJnqnHmt6QA/kMEI/2HV/TI1yo2szvA0jxcvJTTyaCTDUi25/2V3/qqroLZVF
         pJ0231AT+28/19BrVqC4jefwiS8jpR+7eExJquMZoEWxD+vvU/q6V9tBUHN4XV1npaW5
         GO6A==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777379162; x=1777983962; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YPmfFtAGxdEn8CPGgHwoGx4Vicyf9zO1ma3sXWVd0lE=;
        b=ln3nM9mJxcVlRHLUZAf+c9XVNvVUrS/kEDNjp71FK8iAbDHwW+oXMXl7av0rIKQk+0
         /boF9rKHtsxFD9i6bNDVMcYcSw4jjDHmufZ+k1VIFRcZoELBlL6F7yP77AbacqwH12Eu
         bGT382mMexHYkTf3mIi/jNuB1FoovnvrcBWezrwikcly0EzvkxwuN93D9Ma15nBJFSiF
         ZpTdA+2Nj/fQPM3lvPtq77QdomNXl+Id9rY4O+pk4aarpQnDqmJRgAmrX793/AWljh/7
         iGi7EYZLEtAkGn4UwIT+MnWZMDer2yab0y6nvwRVGdOl/SQ+sIQZ4sXdDYYgp+rmMACR
         7PVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777379162; x=1777983962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YPmfFtAGxdEn8CPGgHwoGx4Vicyf9zO1ma3sXWVd0lE=;
        b=g4Jq/k/nauCICxGDxCI3lC5bky1fuw9XXVxIPq957sencLs+gArbx1mJQ8xxyXhk+l
         FH6QrANu24Ny0mTsC5+hfNhbt3/K2nTN3PCYsLnCpyYNzZ3tDRbevv1t7j1u4YLpnoPk
         kMGtPZpQsqojC7D5B0GdaFM8w8Ws0QKH85onIMxaLlcMB0aN/hAdE4S6Or5McbL+5TPF
         0ZitzepIGX5YYzD6HgYmaNub/I50F3MroDizXReWxVOLe1PjO49Ij573kyZdnU18x0pR
         UAqBpLEYJHXq4sKk3eBMhLwsEuF10i4Q9+6LgTg7v0Oo2mMl+Hc2fCfEtQ7HZpHiO3vr
         6Uzg==
X-Gm-Message-State: AOJu0Yyi3mSBenebJI/eAHplbqE4mlTXQq36tKL9HFw0rb8D7SL+sUYU
	Aeo6dW8/AXw2JLndsi0gqDMuNEY7n3mDnjTfZFowhzVtXOv/oMBbz8iVFoi8TkL1mRsk4DRFOdd
	iPgdTNQ+zYCjp70CMP601ICnG5QcM/0yhEb85
X-Gm-Gg: AeBDietczRjHwevxe2Wx36RBWMl3JLBP4oOb219dR5mpMAEtUnFWHiZzwyK+yVUM9tD
	Cjk1cZbswrL+Ign7vDWzfUOZSUTvMBFOIV/amIOYrhO4JePGbKDKspzyjVUHicRfHEWPMQyQ+9H
	XuTcxpCf1EM6FJdpwhV0/vv0mwhhFCUCTOcXdBsjnQC+Xbii91VascKJEtZJNhVFSfC9qbK3QBy
	ksHlrekn6xxuJTRClizQGPFrfavWQwIzYyXudefUI9208+m1OKUmw/ZRcuELwZ4X58Ee2rCTXzx
	iheYsO9THI/aK1/Meq3HTbkkd7U=
X-Received: by 2002:a05:6512:110c:b0:5a4:558:33ae with SMTP id
 2adb3069b0e04-5a7471187bdmr693239e87.10.1777379161243; Tue, 28 Apr 2026
 05:26:01 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1774431310.git.mykola_kvach@epam.com>
In-Reply-To: <cover.1774431310.git.mykola_kvach@epam.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 28 Apr 2026 15:25:49 +0300
X-Gm-Features: AVHnY4JSJekSk7U9pMZyuCzg9bO-oFUh_HBpZSmNEeMJ1AyyBIAN789klYwFL5c
Message-ID: <CAGeoDV-1c1JbxD=W0tBg1ySgyzohgH_Va+5VwK34Oz9J8A7mcQ@mail.gmail.com>
Subject: Ping: Re: [PATCH 0/4] xen/arm: ITS quirk handling fixes and
 board-specific matches
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Mykola Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-c1860d/1777379162-C2577DB1-4D8D0D21/0/0
X-purgate-type: clean
X-purgate-size: 2254
X-Rspamd-Queue-Id: 8EF1A484D0B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,epam.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]

Hi all,

Gentle ping on this series.

There are a few review comments that I can address in a v2, but one
point seems to need maintainer guidance before I rework the series.

In particular, there was a discussion around whether dma-noncoherent
should remain an additive property handled separately from the ITS quirk
table, or whether it should be modelled as part of the quirk matching
machinery, which would likely require accumulating flags from all
matching entries rather than keeping the current first-match semantics.

Could maintainers please share their preference here? I am happy to
prepare a v2 once the expected direction is clear.

Thanks,
Mykola

On Wed, Mar 25, 2026 at 12:41=E2=80=AFPM Mykola Kvach <xakep.amatop@gmail.c=
om> wrote:
>
> From: Mykola Kvach <mykola_kvach@epam.com>
>
> This series cleans up ARM GICv3 ITS quirk handling and fixes the point at
> which quirk-derived memory attributes become visible to the LPI setup pat=
h.
>
> The first patch switches the quirk handling from per-entry init callbacks=
 to
> declarative flags and folds in the DT dma-noncoherent property when deriv=
ing
> the effective ITS attributes.
>
> The second patch extends quirk matching with an optional platform callbac=
k so
> that boards sharing the same IIDR can still be distinguished reliably. Th=
is
> is then used by the third patch to add the Orange Pi 5 ITS quirk for
> RK3588/RK3588S boards.
>
> Finally, the last patch moves ITS quirk discovery and validation earlier =
in
> the boot flow, before host LPI tables are initialized, so the boot CPU do=
es
> not allocate and program LPI data structures with default attributes when=
 the
> platform requires different ones.
>
> Mykola Kvach (4):
>   xen/arm: its: collect quirk flags and honor dma-noncoherent
>   xen/arm: its: add platform match callback for ITS quirks
>   xen/arm: its: add Orange Pi 5 ITS quirk
>   xen/arm: its: pre-initialize ITS quirks before LPI setup
>
>  xen/arch/arm/gic-v3-its.c             | 129 +++++++++++++++++++-------
>  xen/arch/arm/gic-v3.c                 |   7 ++
>  xen/arch/arm/include/asm/gic_v3_its.h |   5 +
>  3 files changed, 107 insertions(+), 34 deletions(-)
>
> --
> 2.43.0
>

