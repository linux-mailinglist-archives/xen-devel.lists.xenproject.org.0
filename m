Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4737F1F9E1C
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 19:07:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jksa2-0000zk-W2; Mon, 15 Jun 2020 17:07:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8mLd=74=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jksa1-0000zY-CM
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 17:07:29 +0000
X-Inumbo-ID: b11ffa28-af2a-11ea-8496-bc764e2007e4
Received: from mail-ej1-x62f.google.com (unknown [2a00:1450:4864:20::62f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b11ffa28-af2a-11ea-8496-bc764e2007e4;
 Mon, 15 Jun 2020 17:07:28 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id gl26so18206499ejb.11
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2020 10:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=hqHhgaFrlcO83k4C5b2M9JPfNRM2JDDLhQ2XRBpOHtY=;
 b=LoGksC0K9WNR/Us8A+tvRA79I7Ek74p0qSFd5AgCgaTWtGOEd104GftXixeiTxsrlN
 t1KuucguMXMqKCj42OkQM2t61M9OEABVUcVJGDiQdgmLg9BTW0+CJh5KJwS94fLiFCZF
 HhcyCuIDTgayDsYeCa6R3XvTPHxKfBUuQnbK3YO/hx1lZYwr9VKVe8e+iw3zKhzcKYQi
 rlXjzEd0OG3OaKGKdhX4D5UNOz0y2PkbXxp0yJlN7HJ+8FxEdsFG4JUZ9pjj1Wmna8oF
 qMYkwzfMDeqfeoX0l9UynU9pZXrlMFF9qhicoHUPzy0DWIvFqdy+DBukJ1jEruX8GUfg
 Oh3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=hqHhgaFrlcO83k4C5b2M9JPfNRM2JDDLhQ2XRBpOHtY=;
 b=Eilsit1xJoacEdjUB2EhQhsPNjlfeccIovRjUYVTwXFgd2HwxCq40nUkPEzORNZDiN
 g7LfIZflbvEJKiAJJbQOo/4b5FgsahFh7Xb+UDwFs2bWKVKr5DaehdlwqcMcLrYYVtVl
 ubX7Dkr2cZCYjnH/b3hyQM/1PpCySCSFd5ljeURRHbkLlsIOTFl8xgb2KDMEn978wvhR
 N9QO6fOXomLV1oshfWHQtYcZ1MliMVILSOQSIbryBBWItJ2bC7Mvmn64yUOjbmWIdo7i
 Z3LnQlaRXmHlDhNF3AbRIsg+VTQv4qoPSe5FZ2tNKh+p9Z2JubVVkfQC3Q6x1jyltFQ8
 /w3A==
X-Gm-Message-State: AOAM531wcKjxz6KDMkg3LYpmHOxzfv3jyN+6IhRCdbJ4sV/iYrStZguq
 tunG/YmmnoSIXGtk0j5fo8M=
X-Google-Smtp-Source: ABdhPJz0w5KKIX4jtQJHwTc3CgYftxEl23fW/zTaMRUnhIoZR0mGobxmlElq+Qej0P+z9sve6aznZw==
X-Received: by 2002:a17:906:f1cf:: with SMTP id
 gx15mr25773015ejb.207.1592240848012; 
 Mon, 15 Jun 2020 10:07:28 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-234.amazon.com. [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id w21sm9462115ejc.11.2020.06.15.10.07.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Jun 2020 10:07:27 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
 "'Andrew Cooper'" <andrew.cooper3@citrix.com>
References: <20200610142923.9074-1-roger.pau@citrix.com>
 <20200610142923.9074-3-roger.pau@citrix.com>
 <6de3a582-d9a8-60b5-9525-c9223932e4ed@citrix.com>
 <00f901d64013$6615a860$3240f920$@xen.org>
 <73dcc93f-3d2e-e6f0-a044-83a060bddaa4@suse.com>
In-Reply-To: <73dcc93f-3d2e-e6f0-a044-83a060bddaa4@suse.com>
Subject: RE: [PATCH for-4.14 v2 2/2] x86/passthrough: introduce a flag for
 GSIs not requiring an EOI or unmask
Date: Mon, 15 Jun 2020 18:07:26 +0100
Message-ID: <003301d64337$725ba800$5712f800$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQHx2+DDRjLQssRal4XfU2f+2Pe7FQIj4hRNAekcXgMCG/MkqgGc689vqGSIHSA=
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: xen-devel@lists.xenproject.org, 'Wei Liu' <wl@xen.org>,
 'Roger Pau Monne' <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 15 June 2020 17:17
> To: paul@xen.org; 'Andrew Cooper' <andrew.cooper3@citrix.com>
> Cc: 'Roger Pau Monne' <roger.pau@citrix.com>; =
xen-devel@lists.xenproject.org; 'Wei Liu' <wl@xen.org>
> Subject: Re: [PATCH for-4.14 v2 2/2] x86/passthrough: introduce a flag =
for GSIs not requiring an EOI
> or unmask
>=20
> On 11.06.2020 19:11, Paul Durrant wrote:
> >> -----Original Message-----
> >> From: Andrew Cooper <andrew.cooper3@citrix.com>
> >> Sent: 11 June 2020 17:26
> >> To: Roger Pau Monne <roger.pau@citrix.com>; =
xen-devel@lists.xenproject.org
> >> Cc: paul@xen.org; Jan Beulich <jbeulich@suse.com>; Wei Liu =
<wl@xen.org>
> >> Subject: Re: [PATCH for-4.14 v2 2/2] x86/passthrough: introduce a =
flag for GSIs not requiring an
> EOI
> >> or unmask
> >>
> >> On 10/06/2020 15:29, Roger Pau Monne wrote:
> >>> There's no need to setup a timer for GSIs that are edge triggered,
> >>> since those don't require any EIO or unmask, and hence couldn't =
block
> >>> other interrupts.
> >>>
> >>> Note this is only used by PVH dom0, that can setup the passthrough =
of
> >>> edge triggered interrupts from the vIO-APIC. One example of such =
kind
> >>> of interrupt that can be used by a PVH dom0 would be the RTC =
timer.
> >>>
> >>> While there introduce an out label to do the unlock and reduce =
code
> >>> duplication.
> >>>
> >>> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> >>
> >> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >
> > Release-acked-by: Paul Durrant <paul@xen.org>
>=20
> Strictly speaking these tags were too little for the patch to go
> in - the change to drivers/passthrough/io.c would also have
> required Paul's (or my) R-b. I take it that this was sort of
> implied by the R-a-b.

FAOD I have added my R-b.

  Paul

>=20
> Jan


