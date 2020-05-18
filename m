Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD44B1D7573
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 12:45:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jadGb-0001S1-DV; Mon, 18 May 2020 10:45:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VSjt=7A=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jadGa-0001Rw-Gf
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 10:45:04 +0000
X-Inumbo-ID: a128c8c6-98f4-11ea-b9cf-bc764e2007e4
Received: from mail-ed1-x52d.google.com (unknown [2a00:1450:4864:20::52d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a128c8c6-98f4-11ea-b9cf-bc764e2007e4;
 Mon, 18 May 2020 10:45:03 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id k19so8026493edv.9
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2020 03:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=pZnkQa7IsGVBBiwRyiPvUnDrBchyPX6Z8G16FQ+le9c=;
 b=p7u1cTs+UdUa/9G/pRZSw6S4WzbZ/0zGeEjiUm3AQTheHHwMeFBuE6jWhUazWkPVi5
 81mvIVdZZFT+MJrxBpX3nXd+DusfQTDhVB2NZwDyF5UuUD6iQG79EM+4fLNVTarrNyAY
 ZBK67/Ci89l6/LXpda3tn670e3SSwJBGOi5wRPFluazTKUHrLKRO4rx+UWioKx0+eGaE
 v0OIyoxg36sBOQypoalhXBdNgi/1SAZWy0ihZUP3JLblQb6rlqxaP+oh1H2cjPritqBb
 bjrRI2siJPevd5F4swQJV+gVu2bTUtw441ue3AEArhg8+ldSq27YH7Crb+tCkd5FOeeV
 5gRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=pZnkQa7IsGVBBiwRyiPvUnDrBchyPX6Z8G16FQ+le9c=;
 b=bWhCsYoeeHG9CNjmLpW9GKXYPrwZwjP9hqGhgNpIf0BC8D9QwRYpBvxLYwrkgch3Yp
 IeRaR6HzlubKlmWr7xCac6nKsmMDmV3hQIZVvdCzGpr0zQwbkhWhv8JF2ok1wz8ELZLT
 gBHSuQMtlgzle6aQ9Js0wLK4TSnLmDeKMeYXtCZRARJdejfAF1z14nbovpvg7afvxRxR
 atlyrGrGUuyo+1ajICBMMFz1Cm7PgeE3g2xzxAzqeMzYDSKdpIEVDCAwNYDdDtZjA7tF
 bOT0WtIQGbhEkHdPMvHvkt4wjb6MkvblPAjVDOUXpfgCK1YnHirczYXTZB0eCufo1xO0
 /qXA==
X-Gm-Message-State: AOAM532q/eOmFPJMkXqiZ0XyKtTExVqQPhd63Oiob0tOW0OstGdzFzFH
 9ZQrq7Mjp7TYslyQOBq/g3g=
X-Google-Smtp-Source: ABdhPJzHl9CpZn7kB4k3fa7tgocXn1NyxoJcQu6vyujToBsINSK+f3TrvmZ92V0o3h7WWbcJmvxkiQ==
X-Received: by 2002:a50:ec8e:: with SMTP id e14mr2482850edr.105.1589798702648; 
 Mon, 18 May 2020 03:45:02 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.187])
 by smtp.gmail.com with ESMTPSA id c9sm840993edl.21.2020.05.18.03.45.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 May 2020 03:45:02 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: =?utf-8?Q?'J=C3=BCrgen_Gro=C3=9F'?= <jgross@suse.com>,
 "'Denis Kirjanov'" <kda@linux-powerpc.org>
References: <1589790285-1250-1-git-send-email-kda@linux-powerpc.org>
 <bbd8a83a-a676-9fa1-b03b-526e5122966f@suse.com>
 <CAOJe8K2pUv4Upvxya3LFPj0CxZ1-_hDZcrv-r6Q2EaxC8Ym6Ow@mail.gmail.com>
 <2615d770-c17b-26e0-4686-852ca122eeb4@suse.com>
In-Reply-To: <2615d770-c17b-26e0-4686-852ca122eeb4@suse.com>
Subject: RE: [PATCH] public/io/netif.h: add a new extra type for XDP
Date: Mon, 18 May 2020 11:45:00 +0100
Message-ID: <001101d62d01$6241b960$26c52c20$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQDg4gzfI0WgzPcwHONQbDlUkwh/TAGQBCHrAx2kla0CPnXkHqpg3NKQ
Content-Language: en-gb
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
Cc: xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: J=C3=BCrgen Gro=C3=9F <jgross@suse.com>
> Sent: 18 May 2020 11:28
> To: Denis Kirjanov <kda@linux-powerpc.org>
> Cc: xen-devel@lists.xenproject.org; paul@xen.org
> Subject: Re: [PATCH] public/io/netif.h: add a new extra type for XDP
>=20
> On 18.05.20 11:52, Denis Kirjanov wrote:
> > On 5/18/20, J=C3=BCrgen Gro=C3=9F <jgross@suse.com> wrote:
> >> On 18.05.20 10:24, Denis Kirjanov wrote:
> >>> The patch adds a new extra type to be able to diffirentiate
> >>> between RX responses on xen-netfront side with the adjusted offset
> >>> required for XDP processing.
> >>>
> >>> For Linux the offset value is going to be passed via xenstore.
> >>
> >> Why? I can only see disadvantages by using a different =
communication
> >> mechanism.
> > I see it like other features passed through xenstore and it requires
> > less changes to
> > other structures with the same final result.
>=20
> This is okay as long there is no Xenstore interaction required when =
the
> interface has been setup completely (i.e. only defining the needed
> offset for XDP is fine, enabling/disabling XDP at runtime should not =
be
> done via Xenstore IMO).

FWIW it is for this kind of thing that I introduced the control ring, =
but that may be overkill for this.

  Paul

>=20
> And please, no guest type special casing. Please replace "Linux" by =
e.g.
> "The guest" (with additional tweaking of the following sentence).
>=20
>=20
> Juergen


