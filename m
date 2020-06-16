Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D64051FC041
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 22:52:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlIXO-0006Wx-Qa; Tue, 16 Jun 2020 20:50:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bp52=75=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1jlIXM-0006WR-TZ
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 20:50:28 +0000
X-Inumbo-ID: 027a768a-b013-11ea-bb8b-bc764e2007e4
Received: from mail-oo1-xc42.google.com (unknown [2607:f8b0:4864:20::c42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 027a768a-b013-11ea-bb8b-bc764e2007e4;
 Tue, 16 Jun 2020 20:50:28 +0000 (UTC)
Received: by mail-oo1-xc42.google.com with SMTP id q188so4371162ooq.4
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2020 13:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xXHB8t4A+Ri4ilG1DPgnSLVHP5CWTMD30dEOb8LHm5U=;
 b=gA5W0tze/lqfRV4puC1P1e7jLMDS/YA0jqmAv7FQpbcRf4Fk7TrMPBXZ0vY1tqRgE2
 lQyReomy9LHjmUFUR2iO2pA48Og0zLIyRvTfDDOW7ev8wf469I+AUTyPgPh1kHDhf7XI
 hlUZ7iGE/WCevNHPTB2P2QqHdVafnQKONRU1mK4iEC7EIW4bZc85qxWSu08BQ5qU0FMw
 uvCKjCw/wz5NqYkNrp8GNMPvTLa7iNuzwG0fBQZhBUZMAlBFkyE0dWQJ7smDKdpmP5KB
 3ZvZ1+Qfcc+FBpRQjmccsxGhpbwDm7KvQYeJzcuk/Ro/2jFfZsaiQ3hs9zJw+7KlXi5t
 +Sgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xXHB8t4A+Ri4ilG1DPgnSLVHP5CWTMD30dEOb8LHm5U=;
 b=fUb3WR4BcWcfh6R1v+ERbIo4h27f6KHBCdzAsZzGSPgYXnGXNCj2s/EHrLb/9m9nUD
 n4hzj/NnuMm98+IHVuTuXP5dm//33WlDQlS8O+KxGpeN9SDtT4G7HQBKmVCn9hcyGmb8
 sthghKIKHFSnVKO1ZcLAqGF85aOHMAnqGoFhCjDubnNXMp3B/0/WhnFK7V8X7jZD/aQx
 LWpI8D9kopSW5EUVIIm5YRAs1joACTXTXL4xzt/ppNb/OM3zZjqnpGephCHmAOg1MJSI
 i0yHRlb1/suQ5yy9pY/g5jXtOH/XdQ3cYd18N8aQs1JkWeV02TRAB58PhH0E1kBq27qS
 8CVA==
X-Gm-Message-State: AOAM531xv7Z2fYPbAXhpzMO9WxLkt0A/WdqbSoFPs55I+ze3uApaxpI0
 O8J2sS0c4BZ1Hz0tgs0xaVyZC5heaS4eBuS4BiE2Gg==
X-Google-Smtp-Source: ABdhPJwCa2MKVG+6cU5mikK5F0XqNYrEKqqHRukOZl8JO9yt5RiyrhV6w+1VTLTEt70odCSzsFiH/JjH6ZiMIpTaR+k=
X-Received: by 2002:a4a:5209:: with SMTP id d9mr3959114oob.28.1592340627392;
 Tue, 16 Jun 2020 13:50:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200608203849.18341-1-olaf@aepfle.de>
 <005001d63e3b$c85059f0$58f10dd0$@xen.org>
 <20200609121549.GA90841@deinos.phlegethon.org>
 <20200609152233.039cfc86.olaf@aepfle.de>
 <20200610191657.GA69414@deinos.phlegethon.org>
 <20200611211004.11e38f8f.olaf@aepfle.de>
In-Reply-To: <20200611211004.11e38f8f.olaf@aepfle.de>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Tue, 16 Jun 2020 13:50:15 -0700
Message-ID: <CACMJ4Ga2oO94kXw2NVdRQb=dOZ9kqZRgDLkrE630D3RFTMoYQg@mail.gmail.com>
Subject: Re: [PATCH v1] kdd: remove zero-length arrays
To: Olaf Hering <olaf@aepfle.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>, paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Jun 11, 2020 at 12:12 PM Olaf Hering <olaf@aepfle.de> wrote:
>
> Am Wed, 10 Jun 2020 20:16:57 +0100
> schrieb Tim Deegan <tim@xen.org>:
>
> > How tedious.
>
> Indeed. This compiles for me as well:

just a nudge on this; it would be nice to get a patch into the tree
since the build failure affects master builds of Xen in OpenEmbedded
now.

Christopher

>
> --- orig/kdd.h  2020-06-08 17:40:05.000000000 +0000
> +++ kdd.h       2020-06-11 19:00:44.234364040 +0000
> @@ -68,7 +68,6 @@
>      uint16_t len;     /* Payload length, excl. header and trailing byte */
>      uint32_t id;      /* Echoed in responses */
>      uint32_t sum;     /* Unsigned sum of all payload bytes */
> -    uint8_t payload[0];
>  } PACKED kdd_hdr;
>
>  #define KDD_PKT_CMD 0x0002      /* Debugger commands (and replies to them) */
> @@ -323,7 +322,7 @@
>          kdd_msg msg;
>          kdd_reg reg;
>          kdd_stc stc;
> -        uint8_t payload[0];
> +        uint8_t payload[65536];
>      };
>  } PACKED kdd_pkt;
>
> --- orig/kdd.c  2020-06-08 17:40:05.000000000 +0000
> +++ kdd.c       2020-06-11 19:08:36.775724640 +0000
> @@ -79,11 +79,11 @@
>  /* State of the debugger stub */
>  typedef struct {
>      union {
> -        uint8_t txb[sizeof (kdd_hdr) + 65536];   /* Marshalling area for tx */
> +        uint8_t txb[sizeof (kdd_hdr) + 0xffff];   /* Marshalling area for tx */
>          kdd_pkt txp;                 /* Also readable as a packet structure */
>      };
>      union {
> -        uint8_t rxb[sizeof (kdd_hdr) + 65536];   /* Marshalling area for rx */
> +        uint8_t rxb[sizeof (kdd_hdr)];   /* Marshalling area for rx */
>          kdd_pkt rxp;                 /* Also readable as a packet structure */
>      };
>      unsigned int cur;       /* Offset into rx where we'll put the next byte */
>
> Olaf

