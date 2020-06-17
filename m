Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E351FC877
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2020 10:22:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlTK3-00022X-Kd; Wed, 17 Jun 2020 08:21:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c7kS=76=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jlTK1-00022S-VD
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2020 08:21:26 +0000
X-Inumbo-ID: 88aaa8fa-b073-11ea-bb8b-bc764e2007e4
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 88aaa8fa-b073-11ea-bb8b-bc764e2007e4;
 Wed, 17 Jun 2020 08:21:25 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id c3so1296075wru.12
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2020 01:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=XX6vOBkl7CUdr6Wcaym4pJD64r/uqplNd2RI5rA9oSc=;
 b=EuPnKvEqo+oH61QcsQjIc0VIG3SXtkA33gZcHHY6FmJbfQ2CzOyacZXldO9tb8NO9F
 FIJuaGgfgxeFIuof6LXF+f3TJy7vjhVWW8MkLQnju+PBE50kSqP43h1G4up9zsOuxKeP
 buuYkLC9S1dPei1EXduL9VNyIll3XXFPPvEDT1vu1AeQ7qxKp5dVDaaXDhItCTMaqBsc
 DtZxFGLg54lLyG2yH+qaNS/VMkjA5JGKFxyw8w2cRBP97Aim9UJq+1UUX8J5ovBIHyAE
 h/Leebj7CATHQ1x6EAqhJ0yWmibzuNu5Y6aC47seTqy8APAXUgGpq4VKK7hPGyzb6t75
 7Mnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=XX6vOBkl7CUdr6Wcaym4pJD64r/uqplNd2RI5rA9oSc=;
 b=iClrspZRSzlHa1bAymVn14XILlQWk5Fd7XjBrrTvM/7NjFhzINf/aaJ6364CG/lnSp
 h16wp7RgQZzupC+CM7YQFxcM/XTVGUOUMYHBgqxAmn9j+Ypf/pS81QRMVcTaOZIpp08P
 INpTQVsF6BwMBNYUAtqNTVlDBlTaXJONiOQUVxrwktEI62aB61FObOrEUgECZnRzy0gC
 GwAhW90BYV/ubIJqg2eKKnliYr/49Yrj8IveQa+wVrdHABbmAo43TodgZBRDFJ+hDCPs
 t39iBU7f/0ZNnVYskiATYypq5uYMubB8gafFbP1cdRyBkOhNbxDywj8H2fWLWzRxFH+4
 12SA==
X-Gm-Message-State: AOAM531/z0v7C2BkDcYTdcMJOAk+2m4YsDkX9lOi4wmYXU8qtDCJKFiX
 kkQruKRPD0C869CZtvDSQVQ=
X-Google-Smtp-Source: ABdhPJxyB7EhBRYOrz2iKOlOGnX8miyPVZxveDRPJ2X9Fjf4UDeze5XGZHpREWRHM8YBNENtC7vrRA==
X-Received: by 2002:adf:f7ce:: with SMTP id a14mr7082462wrq.362.1592382084539; 
 Wed, 17 Jun 2020 01:21:24 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.185])
 by smtp.gmail.com with ESMTPSA id z12sm35480067wrg.9.2020.06.17.01.21.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 17 Jun 2020 01:21:23 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Christopher Clark'" <christopher.w.clark@gmail.com>,
 "'Olaf Hering'" <olaf@aepfle.de>
References: <20200608203849.18341-1-olaf@aepfle.de>
 <005001d63e3b$c85059f0$58f10dd0$@xen.org>
 <20200609121549.GA90841@deinos.phlegethon.org>
 <20200609152233.039cfc86.olaf@aepfle.de>
 <20200610191657.GA69414@deinos.phlegethon.org>
 <20200611211004.11e38f8f.olaf@aepfle.de>
 <CACMJ4Ga2oO94kXw2NVdRQb=dOZ9kqZRgDLkrE630D3RFTMoYQg@mail.gmail.com>
In-Reply-To: <CACMJ4Ga2oO94kXw2NVdRQb=dOZ9kqZRgDLkrE630D3RFTMoYQg@mail.gmail.com>
Subject: RE: [PATCH v1] kdd: remove zero-length arrays
Date: Wed, 17 Jun 2020 09:21:22 +0100
Message-ID: <005a01d64480$49ce0730$dd6a1590$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIqIZk/Qusa7Qsu5bkjM27jAUAPHgHVoA+LAfW9KPcCU2XTcQH8d5RuAcV3opsCrD1gbKfQVYCQ
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
Cc: 'xen-devel' <xen-devel@lists.xenproject.org>, 'Tim Deegan' <tim@xen.org>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>, 'Wei Liu' <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Christopher Clark <christopher.w.clark@gmail.com>
> Sent: 16 June 2020 21:50
> To: Olaf Hering <olaf@aepfle.de>
> Cc: Tim Deegan <tim@xen.org>; xen-devel <xen-devel@lists.xenproject.org>; Ian Jackson
> <ian.jackson@eu.citrix.com>; Wei Liu <wl@xen.org>; paul@xen.org
> Subject: Re: [PATCH v1] kdd: remove zero-length arrays
> 
> On Thu, Jun 11, 2020 at 12:12 PM Olaf Hering <olaf@aepfle.de> wrote:
> >
> > Am Wed, 10 Jun 2020 20:16:57 +0100
> > schrieb Tim Deegan <tim@xen.org>:
> >
> > > How tedious.
> >
> > Indeed. This compiles for me as well:
> 
> just a nudge on this; it would be nice to get a patch into the tree
> since the build failure affects master builds of Xen in OpenEmbedded
> now.
> 

I'd be happy to take a patch into 4.14 if someone can provide one with a suitable maintainer ack.

  Paul

> Christopher
> 
> >
> > --- orig/kdd.h  2020-06-08 17:40:05.000000000 +0000
> > +++ kdd.h       2020-06-11 19:00:44.234364040 +0000
> > @@ -68,7 +68,6 @@
> >      uint16_t len;     /* Payload length, excl. header and trailing byte */
> >      uint32_t id;      /* Echoed in responses */
> >      uint32_t sum;     /* Unsigned sum of all payload bytes */
> > -    uint8_t payload[0];
> >  } PACKED kdd_hdr;
> >
> >  #define KDD_PKT_CMD 0x0002      /* Debugger commands (and replies to them) */
> > @@ -323,7 +322,7 @@
> >          kdd_msg msg;
> >          kdd_reg reg;
> >          kdd_stc stc;
> > -        uint8_t payload[0];
> > +        uint8_t payload[65536];
> >      };
> >  } PACKED kdd_pkt;
> >
> > --- orig/kdd.c  2020-06-08 17:40:05.000000000 +0000
> > +++ kdd.c       2020-06-11 19:08:36.775724640 +0000
> > @@ -79,11 +79,11 @@
> >  /* State of the debugger stub */
> >  typedef struct {
> >      union {
> > -        uint8_t txb[sizeof (kdd_hdr) + 65536];   /* Marshalling area for tx */
> > +        uint8_t txb[sizeof (kdd_hdr) + 0xffff];   /* Marshalling area for tx */
> >          kdd_pkt txp;                 /* Also readable as a packet structure */
> >      };
> >      union {
> > -        uint8_t rxb[sizeof (kdd_hdr) + 65536];   /* Marshalling area for rx */
> > +        uint8_t rxb[sizeof (kdd_hdr)];   /* Marshalling area for rx */
> >          kdd_pkt rxp;                 /* Also readable as a packet structure */
> >      };
> >      unsigned int cur;       /* Offset into rx where we'll put the next byte */
> >
> > Olaf


