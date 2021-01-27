Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C963059DB
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 12:33:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76045.137093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4j4Q-0003U2-3n; Wed, 27 Jan 2021 11:33:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76045.137093; Wed, 27 Jan 2021 11:33:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4j4Q-0003Td-0k; Wed, 27 Jan 2021 11:33:10 +0000
Received: by outflank-mailman (input) for mailman id 76045;
 Wed, 27 Jan 2021 11:33:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P+io=G6=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1l4j4O-0003TY-IL
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 11:33:08 +0000
Received: from mail-wr1-x42b.google.com (unknown [2a00:1450:4864:20::42b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d48fb514-fa9d-4d75-85ee-a50036bf285d;
 Wed, 27 Jan 2021 11:33:07 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id m13so1507308wro.12
 for <xen-devel@lists.xenproject.org>; Wed, 27 Jan 2021 03:33:07 -0800 (PST)
Received: from CBGR90WXYV0 ([2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec])
 by smtp.gmail.com with ESMTPSA id w7sm2480436wru.56.2021.01.27.03.33.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 27 Jan 2021 03:33:06 -0800 (PST)
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
X-Inumbo-ID: d48fb514-fa9d-4d75-85ee-a50036bf285d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=h84pFDoLCjfau/PGG6U/duVJD99Ziish/tcHcC6ql6g=;
        b=gZf7MNLVPYE1Df8fyBEYhn/T3vdUO6+ahRc1RJ4ZhmJ3VW2PqGshchOk1M3djdIRVB
         gASwt1JBTtjHEgewSzqFq7bUhG5ED0Od5xPjwMQf0nanF/ulKoY8cJhEIYZdVFbKatVa
         6PTtu8Vkq/mcX+GDOt90ArvJb6+FnSzAd2BGUvZAyMtaLqhpkCj4NZia+kBhs7CnGrmT
         9p+kSFhfM+i3FD08lJg22wBRb1pOdZUcNoCNUrrKgwalrLJAqu99j/XyiXdseSYmNmNP
         0DWqnnqYebOkIw8L1l84y1FldQQEj8qOjCx6AkTw4SKU4H0ps1f8gId6U8M2tjzphGeO
         iyuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :thread-index:content-language;
        bh=h84pFDoLCjfau/PGG6U/duVJD99Ziish/tcHcC6ql6g=;
        b=rs1AdtSIj1ZISC2QK8FwZplBjfA3xSHPcZNtzMUiKsHRgxizr/0xi79RvZhVJtV6+m
         bV/zGEijsje5f9EZn4Zt/UqIlMmO1IVQDrj08s9rpdGCcd6dUadXyMgabCCMbgKSOcot
         OwgHaEM2V4YDxGIZwSZRO0TLyh+0lsHtKmPF9qBR1KZ1A/bIjU20u50s7z88TqS78BMq
         8ub65Rt8mOlTu0nd7Ex5VfosxhYD4hd8pJvrG8CQhzbsu6sZQTObr3nsvV4vCy5AI9pk
         W7m21CMahBK9z7aGO8qyzpLQY6XFGoWFDAp50dzmFPy5PkaJrg5yhnOQASa8QXlzrYyh
         3uXg==
X-Gm-Message-State: AOAM531eReTDSpqvo8YPQl93vSrm1157uaWAZ07xM+cNDyDXnRcyCAUM
	GHmmbywCz/WtGImSGSHzZr8=
X-Google-Smtp-Source: ABdhPJwzeMIDQ017+Opjc21Kts9L12GnI+Be206OBitFuBrWwKbV1HJyBaRBDrkebcU/BPO1xqrWjw==
X-Received: by 2002:adf:d20c:: with SMTP id j12mr10719501wrh.407.1611747186716;
        Wed, 27 Jan 2021 03:33:06 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
Cc: "'Paul Durrant'" <pdurrant@amazon.com>,
	"'Konrad Rzeszutek Wilk'" <konrad.wilk@oracle.com>,
	=?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
	"'Jens Axboe'" <axboe@kernel.dk>,
	"'Dongli Zhang'" <dongli.zhang@oracle.com>,
	<linux-kernel@vger.kernel.org>,
	<linux-block@vger.kernel.org>,
	<xen-devel@lists.xenproject.org>
References: <20210127103034.2559-1-paul@xen.org> <cd70ae5e-a389-7521-8caf-15650a276152@suse.com> <026001d6f49c$eab982b0$c02c8810$@xen.org> <ed1988d9-131a-daf1-787f-3f49269b91aa@suse.com>
In-Reply-To: <ed1988d9-131a-daf1-787f-3f49269b91aa@suse.com>
Subject: RE: [PATCH] xen-blkback: fix compatibility bug with single page rings
Date: Wed, 27 Jan 2021 11:33:05 -0000
Message-ID: <026101d6f4a0$2e3de000$8ab9a000$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQH8tEXaaRm8hTZRIcgVeZub79k21gHW+9qTAdEPDm8C4a9si6m7hw/A
Content-Language: en-gb

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 27 January 2021 11:21
> To: paul@xen.org
> Cc: 'Paul Durrant' <pdurrant@amazon.com>; 'Konrad Rzeszutek Wilk' =
<konrad.wilk@oracle.com>; 'Roger Pau
> Monn=C3=A9' <roger.pau@citrix.com>; 'Jens Axboe' <axboe@kernel.dk>; =
'Dongli Zhang'
> <dongli.zhang@oracle.com>; linux-kernel@vger.kernel.org; =
linux-block@vger.kernel.org; xen-
> devel@lists.xenproject.org
> Subject: Re: [PATCH] xen-blkback: fix compatibility bug with single =
page rings
>=20
> On 27.01.2021 12:09, Paul Durrant wrote:
> >> -----Original Message-----
> >> From: Jan Beulich <jbeulich@suse.com>
> >> Sent: 27 January 2021 10:57
> >> To: Paul Durrant <paul@xen.org>
> >> Cc: Paul Durrant <pdurrant@amazon.com>; Konrad Rzeszutek Wilk =
<konrad.wilk@oracle.com>; Roger Pau
> >> Monn=C3=A9 <roger.pau@citrix.com>; Jens Axboe <axboe@kernel.dk>; =
Dongli Zhang <dongli.zhang@oracle.com>;
> >> linux-kernel@vger.kernel.org; linux-block@vger.kernel.org; =
xen-devel@lists.xenproject.org
> >> Subject: Re: [PATCH] xen-blkback: fix compatibility bug with single =
page rings
> >>
> >> On 27.01.2021 11:30, Paul Durrant wrote:
> >>> From: Paul Durrant <pdurrant@amazon.com>
> >>>
> >>> Prior to commit 4a8c31a1c6f5 ("xen/blkback: rework connect_ring() =
to avoid
> >>> inconsistent xenstore 'ring-page-order' set by malicious =
blkfront"), the
> >>> behaviour of xen-blkback when connecting to a frontend was:
> >>>
> >>> - read 'ring-page-order'
> >>> - if not present then expect a single page ring specified by =
'ring-ref'
> >>> - else expect a ring specified by 'ring-refX' where X is between 0 =
and
> >>>   1 << ring-page-order
> >>>
> >>> This was correct behaviour, but was broken by the afforementioned =
commit to
> >>> become:
> >>>
> >>> - read 'ring-page-order'
> >>> - if not present then expect a single page ring
> >>> - expect a ring specified by 'ring-refX' where X is between 0 and
> >>>   1 << ring-page-order
> >>> - if that didn't work then see if there's a single page ring =
specified by
> >>>   'ring-ref'
> >>>
> >>> This incorrect behaviour works most of the time but fails when a =
frontend
> >>> that sets 'ring-page-order' is unloaded and replaced by one that =
does not
> >>> because, instead of reading 'ring-ref', xen-blkback will read the =
stale
> >>> 'ring-ref0' left around by the previous frontend will try to map =
the wrong
> >>> grant reference.
> >>>
> >>> This patch restores the original behaviour.
> >>
> >> Isn't this only the 2nd of a pair of fixes that's needed, the
> >> first being the drivers, upon being unloaded, to fully clean up
> >> after itself? Any stale key left may lead to confusion upon
> >> re-use of the containing directory.
> >
> > In a backend we shouldn't be relying on, nor really expect IMO, a =
frontend to clean up after itself.
> Any backend should know *exactly* what xenstore nodes it=E2=80=99s =
looking for from a frontend.
>=20
> But the backend can't know whether a node exists because the present
> frontend has written it, or because an earlier instance forgot to
> delete it. It can only honor what's there. (In fact the other day I
> was wondering whether some of the writes of boolean "false" nodes
> wouldn't better be xenbus_rm() instead.)

In the particular case this patch is fixing for me, the frontends are =
the Windows XENVBD driver and the Windows crash version of the same =
driver (actually built from different code). The 'normal' instance is =
multi-page aware and the crash instance is not quite, i.e. it uses the =
old ring-ref but knows to clean up 'ring-page-order'.
Clearly, in a crash situation, we cannot rely on frontend to clean up so =
what you say does highlight that there indeed needs to be a second patch =
to xen-blkback to make sure it removes 'ring-page-order' itself as =
'state' cycles through Closed and back to InitWait. I think this patch =
does still stand on its own though.

  Paul

>=20
> Jan


