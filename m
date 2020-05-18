Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 365311D7A80
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 15:57:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jagGO-0002Zv-GX; Mon, 18 May 2020 13:57:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VSjt=7A=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jagGN-0002Zq-RF
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 13:57:04 +0000
X-Inumbo-ID: 72fb36bc-990f-11ea-ae69-bc764e2007e4
Received: from mail-ed1-x541.google.com (unknown [2a00:1450:4864:20::541])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 72fb36bc-990f-11ea-ae69-bc764e2007e4;
 Mon, 18 May 2020 13:57:02 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id s19so8487704edt.12
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2020 06:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=3SAte+cpgCwI3kheSBfJNfdqojatNOS0CydK0J3mIYE=;
 b=tqRSh/V3JWbgJEOCSomL5uJnkcsXvciTKLoh+/c4bxOhJyHiVISl2GX5Q8fiUMbcqV
 whRw0ONCNhelpfRw02JjDCBKujPnugbhEVL9Ib7g2g+TKWF2tGi8K/l5GaA10W3elVWl
 TkrwebocbUfbPRsZ3DJ9KseJTWyXZRIfRglesVDDv9hSSQxwGLqgNEEKY21pTxHIAUv5
 8N6yWPDFye6DDbSchWX0Y+CZrHmD3iHB3q3MientWoJANU0gvLJMj2aAXY9833jpdu5z
 2VnGmK8mKsatepABJ+3N/E4zG+X1RYm/oCbh7gzLJaaBxkdZ17Z/ue4znvtjkLSY4hgW
 SbgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=3SAte+cpgCwI3kheSBfJNfdqojatNOS0CydK0J3mIYE=;
 b=umn/xhXeBcuIHB4YVKVRmoHrbLJvHQdQHYAQLi/1AA7aDdrfITN8BUjYj3T4QlBQlt
 49iG7YQC0f4y5FYnhzoIng/tpQtTTXeAW5nQEFfKvpsPIlVZjt6mu8ZQqt1Pwbau+OM7
 iIQDw5lfKTUYHmSGn/fmBs4cuIQMNQwDExl6EY2X+V8v0fhiJSBXlBx5nrkUm0YovNqA
 InaHXz1Qkwf9ZICryv4SRzM18Nl9ToX6NM4SA5mtR8CgHoQHpw0zzjn//0qxMD8D4xSA
 f8pzGJSR+oBHdt4oz/Ww5dYmEwNYlNosxCLjoGc9DXPuSPS8ZQ3PjWs0zsw3o4VAqh+9
 iP4g==
X-Gm-Message-State: AOAM530xPwGMINXcH1jjenUl/KJaBL3JaWPnooNw6XXhBYMZdNCnvdOC
 pTIG4mtvlJfFmc3m4USFjrE=
X-Google-Smtp-Source: ABdhPJwpPri8GDUkkvkg00119KieLRvTPzuNGQ1kXd0eWrQ375lzIAKWrCVEXws+VvfppvO9eTEgfw==
X-Received: by 2002:a05:6402:30b2:: with SMTP id
 df18mr13247439edb.323.1589810221681; 
 Mon, 18 May 2020 06:57:01 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.186])
 by smtp.gmail.com with ESMTPSA id c16sm1063898edv.88.2020.05.18.06.57.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 May 2020 06:57:00 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Denis Kirjanov'" <kda@linux-powerpc.org>
References: <1589808344-1687-1-git-send-email-kda@linux-powerpc.org>
 <000001d62d19$b3866510$1a932f30$@xen.org>
 <CAOJe8K3RTjNZyNBZqs56GKk-yaKwB4svOmgw9xt3vjzH6r5fBg@mail.gmail.com>
In-Reply-To: <CAOJe8K3RTjNZyNBZqs56GKk-yaKwB4svOmgw9xt3vjzH6r5fBg@mail.gmail.com>
Subject: RE: [PATCH v3] public/io/netif.h: add a new extra type for XDP
Date: Mon, 18 May 2020 14:56:59 +0100
Message-ID: <000101d62d1c$33f5a880$9be0f980$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQFrOVL0IY3PjX3dJoEC4QuxiCQecgFN2F+HAduvI1epaniuwA==
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
Cc: jgross@suse.com, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Denis Kirjanov <kda@linux-powerpc.org>
> Sent: 18 May 2020 14:49
> To: paul@xen.org
> Cc: xen-devel@lists.xenproject.org; jgross@suse.com
> Subject: Re: [PATCH v3] public/io/netif.h: add a new extra type for =
XDP
>=20
> On 5/18/20, Paul Durrant <xadimgnik@gmail.com> wrote:
> >> -----Original Message-----
> >> From: Denis Kirjanov <kda@linux-powerpc.org>
> >> Sent: 18 May 2020 14:26
> >> To: xen-devel@lists.xenproject.org
> >> Cc: paul@xen.org; jgross@suse.com
> >> Subject: [PATCH v3] public/io/netif.h: add a new extra type for XDP
> >>
> >> The patch adds a new extra type to be able to diffirentiate
> >> between RX responses on xen-netfront side with the adjusted offset
> >> required for XDP processing.
> >>
> >> The offset value from a guest is passed via xenstore.
> >>
> >> Signed-off-by: Denis Kirjanov <denis.kirjanov@suse.com>
> >> ---
> >> v3:
> >> - updated the commit message
> >>
> >> v2:
> >> - added documentation
> >> - fixed padding for netif_extra_info
> >> ---
> >>  xen/include/public/io/netif.h | 14 +++++++++++++-
> >>  1 file changed, 13 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/xen/include/public/io/netif.h
> >> b/xen/include/public/io/netif.h
> >> index 9fcf91a..ec56a15 100644
> >> --- a/xen/include/public/io/netif.h
> >> +++ b/xen/include/public/io/netif.h
> >> @@ -161,6 +161,13 @@
> >>   */
> >>
> >>  /*
> >> + * "netfront-xdp-headroom" is used to add an extra space before =
packet
> >> data
> >> + * for XDP processing. The value is passed by the frontend to be
> >> consistent
> >> + * between both ends. If the value is greater than zero that means =
that
> >> + * an RX response is going to be passed to an XDP program for
> >> processing.
> >> + */
> >
> > I think 'used to add extra space' is probably the wrong phrase. How =
about
> > 'is used to request that extra space is added'
> > It also does not state what unit the value is specified in so you =
need
> > something to clarify that.
> Ok.
>=20
> I also don't understand what "The
> > value is passed by the frontend to be consistent between both ends" =
means.
> > What happens if the backend is older and does not know
> > what this key means?
>=20
> Looks like it has also be stated here since I've added another value
> "feature-xdp-headroom" which is set by  the netback side.
>=20

Yeah, that needs to be mentioned. I also think you should drop the =
'netfront' out of the name. I think simply 'xdp-headroom' would be fine.

  Paul

> >
> >   Paul
> >
> >> +
> >> +/*
> >>   * Control ring
> >>   * =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>   *
> >> @@ -985,7 +992,8 @@ typedef struct netif_tx_request =
netif_tx_request_t;
> >>  #define XEN_NETIF_EXTRA_TYPE_MCAST_ADD (2)  /* u.mcast */
> >>  #define XEN_NETIF_EXTRA_TYPE_MCAST_DEL (3)  /* u.mcast */
> >>  #define XEN_NETIF_EXTRA_TYPE_HASH      (4)  /* u.hash */
> >> -#define XEN_NETIF_EXTRA_TYPE_MAX       (5)
> >> +#define XEN_NETIF_EXTRA_TYPE_XDP       (5)  /* u.xdp */
> >> +#define XEN_NETIF_EXTRA_TYPE_MAX       (6)
> >>
> >>  /* netif_extra_info_t flags. */
> >>  #define _XEN_NETIF_EXTRA_FLAG_MORE (0)
> >> @@ -1018,6 +1026,10 @@ struct netif_extra_info {
> >>              uint8_t algorithm;
> >>              uint8_t value[4];
> >>          } hash;
> >> +        struct {
> >> +            uint16_t headroom;
> >> +            uint16_t pad[2]
> >> +        } xdp;
> >>          uint16_t pad[3];
> >>      } u;
> >>  };
> >> --
> >> 1.8.3.1
> >
> >
> >


