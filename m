Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF041F1BD3
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 17:16:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiJW0-00070P-FK; Mon, 08 Jun 2020 15:16:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9p0X=7V=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jiJVz-00070G-8V
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 15:16:43 +0000
X-Inumbo-ID: 0ed74aee-a99b-11ea-96fb-bc764e2007e4
Received: from mail-wm1-x333.google.com (unknown [2a00:1450:4864:20::333])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0ed74aee-a99b-11ea-96fb-bc764e2007e4;
 Mon, 08 Jun 2020 15:16:42 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id l17so4514256wmj.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2020 08:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=slAlGXN2lNiv7lzMWzgpBJP4WjraHflYW9VTTNyCRHQ=;
 b=ueN2qYZXeyEGlQyksjTyX7/GCONr8w8wbX/ZBW9AKCkMQWOOFD6jPPkA1hLySBSzJE
 Lic5KBnpo+OsDRaKyUKhIL9BRfEYIRMy5pHlUUzaQM3SOv6AoiJ5q3nbsh6BqZulBrI/
 gSwu44wBuxdtHX1oc5UmT2CeUznjPsEhwTYrWsYi5zGuhw6gTce+WZ/1nwKrYd0OI939
 LCANy5c0n5Uv44SDUWROmzLnMShwAtaXz5GDAuiQULZ5LbdzxgMMAFU1bfzyjeEi/sMU
 Mun6AdeHGuvV//131MhMalGC5iDhAolFX5R9aGrzvN1zJOzfS9pHAkFUaID6yFU/C/Q5
 EaHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=slAlGXN2lNiv7lzMWzgpBJP4WjraHflYW9VTTNyCRHQ=;
 b=OKlsgcEuEAsayMqDDc/YuAt4raryTE8VUJqqAQx8/tiDoM/rbblrJO0Cwx1B1MfQl6
 vmzwrRw5mXzyRMowki6SEACuW4/dBi7oVJBjYZwJy6wusnrFsXeIA4C2qnogCZmSkikh
 ZvcQva+nMqVfSu6ftwBGBK5loFB8vBz9Xk/IRpNfhgZzTyTJprXUcrkVHiMPPmFBj6lI
 rv2d2OU33+WTCkI2brD3HfxJRqBokKt7tMZo5xnwtlTxpI9PD8xSJiSNGwl83U9wBwxu
 eyF9HH1ABmX//iUvEO+Tqj7/k61Gy2Q2kaIvYA7Zhg8u3TZsEEgI1o4E4IyCxELGvEwV
 8t+w==
X-Gm-Message-State: AOAM531cxmJfDNQ2Grm2C0azkqA0GXM9NTYBe8GkjVh1nbC4ftHTPrtW
 Sd0X4gZcGwdjrkS1NmP8/5c=
X-Google-Smtp-Source: ABdhPJxdsEkaCsA0kvIIMn1GJhnrJ7nbRRF7rhwQ9l/KnH3JVJ67hLZHdBTuATXtGYQCc2lGsNeHEg==
X-Received: by 2002:a1c:49c1:: with SMTP id w184mr16465394wma.46.1591629401511; 
 Mon, 08 Jun 2020 08:16:41 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.186])
 by smtp.gmail.com with ESMTPSA id a1sm22325459wmj.29.2020.06.08.08.16.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Jun 2020 08:16:40 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'George Dunlap'" <George.Dunlap@citrix.com>,
 "'Ian Jackson'" <Ian.Jackson@citrix.com>
References: <005201d635a9$2b9bbc20$82d33460$@xen.org>
 <2C4D8F6A-1498-4F13-923C-AAF2960D531F@citrix.com>
 <007401d635c2$6b14a150$413de3f0$@xen.org>
 <001201d63b5b$d8ebe7d0$8ac3b770$@xen.org>
 <DC327618-2416-47D9-832E-AE8198060A97@citrix.com>
 <002901d63d7f$2301a6a0$6904f3e0$@xen.org>
 <24286.12984.247498.799575@mariner.uk.xensource.com>
 <003001d63d93$9a4bbcf0$cee336d0$@xen.org>
 <24286.18072.880121.172973@mariner.uk.xensource.com>
 <003301d63d9e$97de3e60$c79abb20$@xen.org>
 <24286.20279.622221.291800@mariner.uk.xensource.com>
 <24286.20424.998938.535648@mariner.uk.xensource.com>
 <4DD3680F-7EE6-4C97-B070-DFFE86AE7D4A@citrix.com>
In-Reply-To: <4DD3680F-7EE6-4C97-B070-DFFE86AE7D4A@citrix.com>
Subject: RE: 4.14.0-rc1 blocked on goland build failure - decision needed
Date: Mon, 8 Jun 2020 16:16:39 +0100
Message-ID: <004601d63da7$cfb6e130$6f24a390$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIaeB+1Kz8Govl7rZttW9upK8TBlwIZlrSiAxctqLUBbsg43wDSk/u8AT2fc60C5R01eQHMeLN5Agjw9U0CAC8hYQFsnKCQAIbCGoEAzoV5uKek/GVA
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
Cc: 'Xen-devel' <xen-devel@lists.xenproject.org>,
 'Nick Rosbrook' <rosbrookn@gmail.com>, 'Wei Liu' <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of =
George Dunlap
> Sent: 08 June 2020 16:07
> To: Ian Jackson <Ian.Jackson@citrix.com>
> Cc: Xen-devel <xen-devel@lists.xenproject.org>; Nick Rosbrook =
<rosbrookn@gmail.com>; Wei Liu
> <wl@xen.org>
> Subject: Re: 4.14.0-rc1 blocked on goland build failure - decision =
needed
>=20
>=20
>=20
> > On Jun 8, 2020, at 3:48 PM, Ian Jackson <ian.jackson@citrix.com> =
wrote:
> >
> > Ian Jackson writes ("4.14.0-rc1 blocked on goland build failure - =
decision needed"):
> >> Hi, Paul.  For those on xen-devel: context is that Paul asked me to
> >> cut 4.14.0-rc1.  The checklist asks me to perform a test build.
> >>
> >> My 32-bit tools test build failed.  I think the problem is probably
> >> specific to 32-bit userland on 64-bit Linux kernel.  I will send a
> >> second followup mail not CC Paul with technical details.
> >
> > Technical details@:
> >
> > The first error looks like this:
> >
> > ./helpers.gen.go:901[/tmp/go-
> =
build643158686/_/u/iwj/work/xen.git/tools/golang/xenlight/_obj/helpers.ge=
n.cgo1.go:1172]:
> > type [268435456]_Ctype_struct_libxl_sched_params larger than address
> > space
>=20
> Actually, I don=E2=80=99t think this has anything to do with 32-bit =
userspace, but instead has to do with the
> version of go: The version in stretch is 1.7 and chokes on this for =
some reason.  I haven=E2=80=99t had time
> to track down why.  It does work for golang 1.11.
>=20
> Options are:
>=20
> 1. Document that if you have a version of golang older than 1.11, you =
need to add `=E2=80=94disable-golang`
>=20
> 2. Modify configure to check for the go version, and only enable if =
the version is > 1.11
>=20
> 3. Try to root-cause the issue.
>=20
> I=E2=80=99m inclined to say we should go with #1 for this RC, then =
either #2 or #3.
>=20

Agreed. Let's go with #1.

  Paul



