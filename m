Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B58305943
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 12:10:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76012.137020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4ihn-0000Is-S4; Wed, 27 Jan 2021 11:09:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76012.137020; Wed, 27 Jan 2021 11:09:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4ihn-0000IS-Om; Wed, 27 Jan 2021 11:09:47 +0000
Received: by outflank-mailman (input) for mailman id 76012;
 Wed, 27 Jan 2021 11:09:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P+io=G6=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1l4ihm-0000IL-Kh
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 11:09:46 +0000
Received: from mail-wr1-x42f.google.com (unknown [2a00:1450:4864:20::42f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 93b5c5bd-308a-4688-a11b-df186972f1da;
 Wed, 27 Jan 2021 11:09:45 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id g10so1479960wrx.1
 for <xen-devel@lists.xenproject.org>; Wed, 27 Jan 2021 03:09:45 -0800 (PST)
Received: from CBGR90WXYV0 ([2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec])
 by smtp.gmail.com with ESMTPSA id j4sm2487477wru.20.2021.01.27.03.09.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 27 Jan 2021 03:09:44 -0800 (PST)
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
X-Inumbo-ID: 93b5c5bd-308a-4688-a11b-df186972f1da
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=TYd2bFtaI19oguKQYB2YgEjLBART3/4JhdhOtLWWdVk=;
        b=mTKZqgVsrQGsM2t8H/CppzkvI06bI5qPngQDfGn4QFi58r/gH6aFQpbtOuaDGUMZNL
         8B1aG9/ndr+pm+bTiYmEt5U+hSs5l5KfmT0dzOUBZqqwSopKt0If6gHiWIhkTF1bVucs
         2YAdPsivwlddhFvggUdeFIO6IxDuqfCNLyGEP/xlbPQ7FEWxdXqdhgS6MGXHlHLPIQqo
         osW45a4eZybJfWknyj9XPQYm31Z7Qzhx0ab85TkNInV76zfH6Ijf9mX9PNUp0K7hherv
         M/FXQvvdZ/kxLqTMSm4QiRx9Sm+G0/Weg7so3w8TbdXdELTBcxA29HilRKGjL4CExNwc
         lgjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :thread-index:content-language;
        bh=TYd2bFtaI19oguKQYB2YgEjLBART3/4JhdhOtLWWdVk=;
        b=ATrK3DO1fGxV4vq6sZWkFFtAEsniTkdDn3C5igNDaTiVSO+00uz54nL7DKT/zWFTEy
         Ae9ebHqYauIJ4xu3H41RySmMchy0Awx+l73Wyh43LI4OstUTENYPY8ZWHlnk8K/PCMsJ
         0H39y2jFyLQj469KGsWvKUHl8DsUure6bWnKc6XvyZpjTXL5xBS3RWQ2mcH6cfE5Icro
         o527Tp5PnvxkfcCP3cef7N4kSO/9toJhiWFR1o+dHLzsTtp5G3FKQt9pxZFI7a9BRfLp
         sBkkA0G+kCP4jOZCqLydZhsHxpSGpfE7flmwaBRV4yDNBQx+E5t95l/JYpGElRWX9364
         2oRA==
X-Gm-Message-State: AOAM533QONBmPyZmCUp6EQrXul2D1mREI0OLa71w40ksv5N/MWYIu5KD
	gDmHPnIU7RPVRt2ZUjr2WpE=
X-Google-Smtp-Source: ABdhPJzO1ImJR9OkOxsts1a9dI5nzf2ctrN2ObzgYu40ha+E+GH4dL85Ui26OPSjVqLc/rnPQsuGGg==
X-Received: by 2002:a5d:65cd:: with SMTP id e13mr10458485wrw.120.1611745784980;
        Wed, 27 Jan 2021 03:09:44 -0800 (PST)
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
References: <20210127103034.2559-1-paul@xen.org> <cd70ae5e-a389-7521-8caf-15650a276152@suse.com>
In-Reply-To: <cd70ae5e-a389-7521-8caf-15650a276152@suse.com>
Subject: RE: [PATCH] xen-blkback: fix compatibility bug with single page rings
Date: Wed, 27 Jan 2021 11:09:43 -0000
Message-ID: <026001d6f49c$eab982b0$c02c8810$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQH8tEXaaRm8hTZRIcgVeZub79k21gHW+9qTqeEYq8A=
Content-Language: en-gb

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 27 January 2021 10:57
> To: Paul Durrant <paul@xen.org>
> Cc: Paul Durrant <pdurrant@amazon.com>; Konrad Rzeszutek Wilk =
<konrad.wilk@oracle.com>; Roger Pau
> Monn=C3=A9 <roger.pau@citrix.com>; Jens Axboe <axboe@kernel.dk>; =
Dongli Zhang <dongli.zhang@oracle.com>;
> linux-kernel@vger.kernel.org; linux-block@vger.kernel.org; =
xen-devel@lists.xenproject.org
> Subject: Re: [PATCH] xen-blkback: fix compatibility bug with single =
page rings
>=20
> On 27.01.2021 11:30, Paul Durrant wrote:
> > From: Paul Durrant <pdurrant@amazon.com>
> >
> > Prior to commit 4a8c31a1c6f5 ("xen/blkback: rework connect_ring() to =
avoid
> > inconsistent xenstore 'ring-page-order' set by malicious blkfront"), =
the
> > behaviour of xen-blkback when connecting to a frontend was:
> >
> > - read 'ring-page-order'
> > - if not present then expect a single page ring specified by =
'ring-ref'
> > - else expect a ring specified by 'ring-refX' where X is between 0 =
and
> >   1 << ring-page-order
> >
> > This was correct behaviour, but was broken by the afforementioned =
commit to
> > become:
> >
> > - read 'ring-page-order'
> > - if not present then expect a single page ring
> > - expect a ring specified by 'ring-refX' where X is between 0 and
> >   1 << ring-page-order
> > - if that didn't work then see if there's a single page ring =
specified by
> >   'ring-ref'
> >
> > This incorrect behaviour works most of the time but fails when a =
frontend
> > that sets 'ring-page-order' is unloaded and replaced by one that =
does not
> > because, instead of reading 'ring-ref', xen-blkback will read the =
stale
> > 'ring-ref0' left around by the previous frontend will try to map the =
wrong
> > grant reference.
> >
> > This patch restores the original behaviour.
>=20
> Isn't this only the 2nd of a pair of fixes that's needed, the
> first being the drivers, upon being unloaded, to fully clean up
> after itself? Any stale key left may lead to confusion upon
> re-use of the containing directory.

In a backend we shouldn't be relying on, nor really expect IMO, a =
frontend to clean up after itself. Any backend should know *exactly* =
what xenstore nodes it=E2=80=99s looking for from a frontend.

  Paul

>=20
> Jan


