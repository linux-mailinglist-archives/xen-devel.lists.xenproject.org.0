Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD5386F2F
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 03:14:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvtS6-00033U-DU; Fri, 09 Aug 2019 01:12:18 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ljbi=WF=gmail.com=hslester96@srs-us1.protection.inumbo.net>)
 id 1hvtS4-00033P-U1
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 01:12:16 +0000
X-Inumbo-ID: b914513c-ba42-11e9-8980-bc764e045a96
Received: from mail-ed1-x544.google.com (unknown [2a00:1450:4864:20::544])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b914513c-ba42-11e9-8980-bc764e045a96;
 Fri, 09 Aug 2019 01:12:15 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id z51so5618729edz.13
 for <xen-devel@lists.xenproject.org>; Thu, 08 Aug 2019 18:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=q1VDmvy5H5V/lcQDElMHgpagqDBHRV5q2PlN+0yp058=;
 b=ap3AA5Q7qTtE00hxn3S74U63HIxZRuOIEAkqJtskyVa1jNpnNvhKUvDrT3dAGsl5SF
 h2/RDfNHPRr5jvA8f6B8NXM6HB02DfY+BP/8ghY3TDNi1E4A+9px3gb2AWH8EVgw6UWR
 5dKfp34zFQ2H1rLuXMNlFRuIVPEVt1gWvaRQdkB+rmgNXZPrMxnMrkunvkhKFoqjPcCv
 Dwrzw1Kt5tlCv0D2XXpTb9ueZanzUxnqkS1xdp9MK3eHxRebHwIBUF6xH07LUxddrU32
 95wwhu60FOS1kgOLv3zM+npKW+J94/3fxc84boCfaA3Y2puUH5U6GxfSjl1rwe5Hrjq4
 iBEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=q1VDmvy5H5V/lcQDElMHgpagqDBHRV5q2PlN+0yp058=;
 b=QGUHQusY5QgsJysz+/O//DXlSBoqGt5FRVJ9QgTIqrrNSgNbaLYFAhErmflQkQT4Vr
 Mh0g8u8XkNRxLWVlZu2yXbov1di6xHSbiVzTkvbigjh9xSiIIdxUQhu1ilZC38qKeEcg
 9B55fE/7h0ZjNnzth0UHMUx1lMBR3dol0/61IYQ+TleG1FgBMPlGEDiI2RUK/RGjcnGJ
 DSnzmp4b9sffqZyR9sfI2IH2IHN5Hw8iwoH5mDEdpnjuXnxNN9aV5MH/rZf3WRC2PCNe
 2+IMvovCmzACNt0ITPZAeYFqrHBLgkUZCkRnzYzJE4PEVsNLW6PggKJg26NZ+xOpmwaP
 zVgg==
X-Gm-Message-State: APjAAAU3fm8396Rbovi8iELCZVuWGERkrUqHhqrp7ywrngSmFqL3nspC
 nMtAFHJ0y08CuEgr7AIzfeeww2PCkFjGsRx6YgmXkskqFF8=
X-Google-Smtp-Source: APXvYqw72mDmwWU01nhdnAQXUm1rWO+j4MknD7wIqU6RymBJZboowbBNIAROGI7j1bBlzLXNIgbxAtgfJJR0skLrINI=
X-Received: by 2002:a17:906:7cd6:: with SMTP id
 h22mr16154601ejp.254.1565313134395; 
 Thu, 08 Aug 2019 18:12:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190808131100.24751-1-hslester96@gmail.com>
 <20190808133510.tre6twn764pv3e7m@Air-de-Roger>
In-Reply-To: <20190808133510.tre6twn764pv3e7m@Air-de-Roger>
From: Chuhong Yuan <hslester96@gmail.com>
Date: Fri, 9 Aug 2019 09:12:04 +0800
Message-ID: <CANhBUQ1rSUPsg+XddCQ4B=JiSA8VV+YkdC-pmgY25hFnvwdFcw@mail.gmail.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [Xen-devel] [PATCH 3/3] xen/blkback: Use refcount_t for refcount
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
Cc: Jens Axboe <axboe@kernel.dk>, xen-devel@lists.xenproject.org,
 linux-block@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBBdWcgOCwgMjAxOSBhdCA5OjM1IFBNIFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPiB3cm90ZToKPgo+IE9uIFRodSwgQXVnIDA4LCAyMDE5IGF0IDA5OjExOjAw
UE0gKzA4MDAsIENodWhvbmcgWXVhbiB3cm90ZToKPiA+IFJlZmVyZW5jZSBjb3VudGVycyBhcmUg
cHJlZmVycmVkIHRvIHVzZSByZWZjb3VudF90IGluc3RlYWQgb2YKPiA+IGF0b21pY190Lgo+ID4g
VGhpcyBpcyBiZWNhdXNlIHRoZSBpbXBsZW1lbnRhdGlvbiBvZiByZWZjb3VudF90IGNhbiBwcmV2
ZW50Cj4gPiBvdmVyZmxvd3MgYW5kIGRldGVjdCBwb3NzaWJsZSB1c2UtYWZ0ZXItZnJlZS4KPiA+
IFNvIGNvbnZlcnQgYXRvbWljX3QgcmVmIGNvdW50ZXJzIHRvIHJlZmNvdW50X3QuCj4KPiBUaGFu
a3MhCj4KPiBJIHRoaW5rIHRoZXJlIGFyZSBtb3JlIHJlZmVyZW5jZSBjb3VudGVycyBpbiBibGti
YWNrIHRoYW4KPiB0aGUgb25lIHlvdSBmaXhlZC4gVGhlcmUncyBhbHNvIGFuIGluZmxpZ2h0IGZp
ZWxkIGluIHhlbl9ibGtpZl9yaW5nLAo+IGFuZCBhIHBlbmRjbnQgaW4gcGVuZGluZ19yZXEgd2hp
Y2ggbG9vayBsaWtlIHBvc3NpYmxlIGNhbmRpZGF0ZXMgdG8KPiBzd2l0Y2ggdG8gdXNlIHJlZmNv
dW50X3QsIGhhdmUgeW91IGxvb2tlZCBpbnRvIHN3aXRjaGluZyB0aG9zZSB0d28KPiBhbHNvPwo+
CgpJIHdpbGwgc3dpdGNoIHRob3NlIHR3byBpbiBuZXh0IHZlcnNpb24uCgo+IFJvZ2VyLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
