Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D24B51431DB
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2020 19:56:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itcBm-0002wZ-JY; Mon, 20 Jan 2020 18:54:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aT4h=3J=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1itcBk-0002wU-W6
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 18:54:17 +0000
X-Inumbo-ID: 417184b8-3bb6-11ea-9fd7-bc764e2007e4
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 417184b8-3bb6-11ea-9fd7-bc764e2007e4;
 Mon, 20 Jan 2020 18:54:16 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id w1so192681ljh.5
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jan 2020 10:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/PR9MateGjjjlpDUYwz9V87DIXMC5n3DTRDH8HDIbHo=;
 b=es5HFIGWWjt+nv/YsC/PG469Gr82R4L4mf2lUl6oVK2YsOii1vw4YOvjSCxK5OT61i
 HA6HwyaYZWrusdAnBnNYfGlWcxfqiAIoO93J0OFFdGO3GT5PPaqxtvjDiyW0CTAxD/LI
 g4KUIkmD4VSVf8kKbmVmJ7ePnONzlPbOArouROHqKxBzDzBR54pf/o77z/YygnwNmopM
 zyaAKVLDj4duu/2T6WuLXPnJnjWOOrzPGXt8a51RXUjy2/ojrjBp1w0AAIa3wEn3gv6S
 LACouu6L4KTN0qcjbcgejTCjavamB+WBILtSfS68jWr2HkHcEnndqkEg7rHeE2O/2lvE
 OdqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/PR9MateGjjjlpDUYwz9V87DIXMC5n3DTRDH8HDIbHo=;
 b=rD6N75DVhHD0yGBLZ8aR5vS5NMH7YQPzMiLqNfRHSj59abhS3h7kPx0VfCZlq+yQsV
 YE6CrCPJzQHqC2GcIaIhLK9um5PoTL6LuCQlnLTlB3j4bZkj4zKUUhFTWxdN6d/avDh2
 dXaGh1+BF/l6aHI3rHrDBALeV8/WE55Qqiku3D41LfBQEp2WgSp6PzomrdvaF96Bp3vY
 lLcDIvGvuRXyErNTaPOeWyGUy2y/ts0bjjaMwLyFPPjbRWac2lwIuSA5Hk2H2W2dvcC1
 t1aNxU/yaOaUediaYR1S3xbKUT2/qorGsdvD+z25wvrj59XthoZGhB2PgW64VSCYaM0m
 47Ww==
X-Gm-Message-State: APjAAAU45KglN1AXn1L49Q0NkSupNX3bgGl/aHXmaQLbIApCSymLeftq
 azYHf1LqdXdq5spgnC2uQ6c+zj5Arn2Pvo9ZGnM=
X-Google-Smtp-Source: APXvYqyAyQ42OV35otZe/mfFCD+bGGdT2HnIF/oWJ17aGT5tho/kiDAI3rWdS5+c//klaa/g5D4zuFyEgXjEnF7nNJw=
X-Received: by 2002:a2e:5357:: with SMTP id t23mr14575448ljd.227.1579546455228; 
 Mon, 20 Jan 2020 10:54:15 -0800 (PST)
MIME-Version: 1.0
References: <cover.f819645cd9f5cf7a6f692f9661cfb4e670a2cd08.1579055705.git-series.marmarek@invisiblethingslab.com>
 <5f675457fe322c265b3337607bc78f07ffdb43bb.1579055705.git-series.marmarek@invisiblethingslab.com>
In-Reply-To: <5f675457fe322c265b3337607bc78f07ffdb43bb.1579055705.git-series.marmarek@invisiblethingslab.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 20 Jan 2020 13:54:04 -0500
Message-ID: <CAKf6xpt5Pjs_XWoEHaJkfgo-FnMigfgKKZ0weZ6egokcpiwwwA@mail.gmail.com>
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [Xen-devel] [PATCH v4 02/16] Document ioemu Linux stubdomain
 protocol
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKYW4gMTQsIDIwMjAgYXQgOTo0MSBQTSBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVj
a2kKPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+IHdyb3RlOgoKPHNuaXA+Cgo+ICsK
PiArTGltaXRhdGlvbnM6Cj4gKyAtIFBDSSBwYXNzdGhyb3VnaCByZXF1aXJlIHBlcm1pc3NpdmUg
bW9kZQo+ICsgLSBvbmx5IG9uZSBuaWMgaXMgc3VwcG9ydGVkCgpXaHkgaXMgb25seSAxIG5pYyBz
dXBwb3J0ZWQ/ICBNdWx0aXBsZSB3ZXJlIHN1cHBvcnRlZCBwcmV2aW91c2x5LCBidXQKcGVla2lu
ZyBhaGVhZCBpbiB0aGUgc2VyaWVzLCBzY3JpcHQ9L2V0Yy9xZW11LWlmdXAgaXMgbm8gbG9uZ2Vy
CnNwZWNpZmllZC4KClJlZ2FyZHMsCkphc29uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
