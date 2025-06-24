Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 938A2AE6AA9
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 17:22:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023855.1399920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU5TG-0002AG-Nv; Tue, 24 Jun 2025 15:22:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023855.1399920; Tue, 24 Jun 2025 15:22:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU5TG-00027T-LO; Tue, 24 Jun 2025 15:22:02 +0000
Received: by outflank-mailman (input) for mailman id 1023855;
 Tue, 24 Jun 2025 15:22:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S2sc=ZH=cloud.com=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1uU5TF-00027N-93
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 15:22:01 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6d73ef3-510e-11f0-b894-0df219b8e170;
 Tue, 24 Jun 2025 17:21:56 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-450ce671a08so35953475e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jun 2025 08:21:56 -0700 (PDT)
Received: from smtpclient.apple ([46.149.103.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-453632312a3sm155541085e9.1.2025.06.24.08.21.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 24 Jun 2025 08:21:55 -0700 (PDT)
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
X-Inumbo-ID: f6d73ef3-510e-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1750778516; x=1751383316; darn=lists.xenproject.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oua7XXUpqRR6QzmdHD2dGCTwDty4n6iwCzl/A0SPc1I=;
        b=jwaUsKYO1J3bTAEuw/kzFJ21BT9zKoJ/07EyYcAUOgpGZIRcwHjl+CR02UF8wGfYs4
         9InbFTwVL84Ywvj5pJsQjQFT/1/N0vCUCTWNRbJzduD8S1vsi601W4lgt7zxpK6cIdCH
         xXPamNkzJfl44AjkNFwy8n64kkSFCs51CJl20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750778516; x=1751383316;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oua7XXUpqRR6QzmdHD2dGCTwDty4n6iwCzl/A0SPc1I=;
        b=U4KrhCCXYxNsj38xc72h1Aj46rUQl4P89pH6EJ2HDxv9bC4wsJqMlIVwPWHYFp7ppJ
         YorkiupxNRjUaI6BcgwdBT9/7f1uZxmel93jrhdh98myo9oSwIpGaE8mOAeSDVlzC6hZ
         +h/ruWIIFCsnFFPugvAJxJGbeAHNjfKutiY1pF0sCEcCXzhv+GFtUTEfi1VcSH0bELpe
         dScVqOajGfWYSNh3PZWZcHeSvkMxJ0EPqgkPIoktYm+s4DcipAztz87+xYs5Mg73KrpR
         vB9meqhIv8E6uVkB/2Qf8LN9qvVEIVmp3mHxvdrrw5KPWy/tAfDP0oUMimH1FdDTSd1+
         /zZQ==
X-Gm-Message-State: AOJu0Yy9dejNPbawTuyG5EfTj6O0N6CV8Nnt3+iJP0xDnN9Rn3IXmjiu
	CwUCnGDv4C9JDIjXzunvPFZGg/R6HoT02JXDHFA4MzTuLsmy8sPVrUzWkNtrS2jXoJX04NtFI9r
	911eb
X-Gm-Gg: ASbGnctrUgtXbRPRZgmeFqNEHd27Nya54wGlsWtygFxX7xhYH929hh4MW4jELGLNAZh
	bjbYntrMVS5LQvb7i19tRm0NX54ZOG3H5UI6cfZUi3P1pj+o05vjPsuNva/v6eSoMNINiPfKClQ
	wNw2w0FAmKtMor9LduVQzj9VLu0uFxdWzKW2VrxrRIjQByx2OlKVRt+MtGfMmffyk+wqmuAR+NQ
	iNeDU1Fi4qxqiDM1KUKMt2UBnr9b75T2d++fOV15HD3kITdEULzQ1Y9bJ+4Op+QV65rpccm/Foe
	Li0zpH8OuQkyLhVM5UMbMsYwo9RBdpBKWhz/BLjMdDyuZ11yHCQlOK2Bv3ltoHjoaiYFBFlHWt+
	Adn7StOpQPXQ=
X-Google-Smtp-Source: AGHT+IEvrg/oc2S3NIiDKwdhjw8Yf7Fp/WGqAAZ/6KmET8LI14DO1I34/FZaY1Z2zk8gDXjY6gZnyg==
X-Received: by 2002:a05:600d:114:b0:442:f482:c429 with SMTP id 5b1f17b1804b1-45365c15866mr98281035e9.8.1750778515523;
        Tue, 24 Jun 2025 08:21:55 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.500.181.1.5\))
Subject: Re: xenstore - Suggestion of batching watch events
From: Christian Lindig <christian.lindig@cloud.com>
In-Reply-To: <47b7f870-e1d9-44c9-b8ea-5b9028843963@gmail.com>
Date: Tue, 24 Jun 2025 16:21:44 +0100
Cc: xen-devel@lists.xenproject.org,
 =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 =?utf-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>,
 ngoc-tu.dinh@vates.tech,
 Christian Lindig <christian.lindig@citrix.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <955F5D37-20D3-4B33-867E-78A0B83A4FB2@cloud.com>
References: <47b7f870-e1d9-44c9-b8ea-5b9028843963@gmail.com>
To: Andriy Sultanov <sultanovandriy@gmail.com>
X-Mailer: Apple Mail (2.3826.500.181.1.5)

I believe what you observe is a major source of inefficiency for the =
reason you describe: changes are acted upon too early because there is =
no way to observe that they are part of a transaction. So now heuristics =
come in like waiting for more changes before acting on the ones =
observed. I wonder how the tree structure plays into this. Clients watch =
different sub trees and we don=E2=80=99t exploit this knowledge. I do =
agree that some protocol or syntax to batch updates would be useful.

=E2=80=94 C


> On 24 Jun 2025, at 15:51, Andriy Sultanov <sultanovandriy@gmail.com> =
wrote:
>=20
> Currently, as far as I am aware, the ability of xenstore clients to =
properly
> handle and detect batch updates is somewhat lacking. Transactions are =
not
> directly visible to the clients watching a particular directory - they =
will
> receive a lot of individual watch_event's once the transaction is =
committed,
> without any indication when such updates are going to end.
>=20
> Clients such as xenopsd from the xapi toolstack are reliant on =
xenstore to
> track their managed domains, and a flood of individual updates most =
often
> results in a flood of events raised from xenopsd to xapi (There are
> consolidation mechanisms implemented there, with updates getting =
merged
> together, but if xapi picks up update events from the queue quickly =
enough, it
> will only get more update events later)
>=20
> The need for batching is fairly evident from the fact that XenServer's =
Windows
> PV drivers, for example, adopted an ad-hoc "batch" optimization (not =
documented
> anywhere, of course), where some sequence of writes is followed by a =
write of
> the value "1" to "data/updated". This used to be honoured by xapi, =
which would
> not consider the guest agent update done until it received notice of =
such a
> "batch ended" update, but it caused xapi to miss updates that were not =
followed
> by such a write, so xapi now ignores this ad-hoc batching. One could =
imagine
> many workarounds here (for example, some sort of a mechanism where =
xenopsd
> stalls an update for a second to see if any more related updates show =
up and
> only then notifies xapi of it, with obvious trade-offs), but IMO it =
could be
> worth considering making this easier on the xenstore side for =
different
> use-cases.
>=20
> Suggestion:
> WATCH_EVENT's req_id and tx_id are currently 0. Could it be possible, =
for
> example, to modify this such that watch events coming as a result of a
> transaction commit (a "batch") have tx_id of the corresponding =
transaction
> and req_id of, say, 2 if it's the last such watch event of a batch and =
1
> otherwise? Old clients would still ignore these values, but it would =
allow
> some others to detect if an update is part of a logical batch that =
doesn't end
> until its last event.
>=20
> Is this beyond the scope of what xenstored wants to do? =46rom a first =
glance,
> this does not seem to introduce obvious unwanted information leaks =
either, but
> I could be wrong. I would love to hear if this is something that could =
be
> interesting to others and if this could be considered at all.
>=20
> Thank you!
>=20
>=20


