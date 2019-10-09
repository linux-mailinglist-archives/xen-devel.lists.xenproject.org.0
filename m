Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7964CD0977
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2019 10:18:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iI79L-0006BS-VJ; Wed, 09 Oct 2019 08:16:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xRwj=YC=gmail.com=lars.kurth.xen@srs-us1.protection.inumbo.net>)
 id 1iI79L-0006BN-5z
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2019 08:16:47 +0000
X-Inumbo-ID: 20b13e2a-ea6d-11e9-8c93-bc764e2007e4
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 20b13e2a-ea6d-11e9-8c93-bc764e2007e4;
 Wed, 09 Oct 2019 08:16:43 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 3so1425458wmi.3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2019 01:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:mime-version:subject:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=gqWrrw3AMB/+/GsXLIr498XtmGk9pgwbsmw3q/0NnR8=;
 b=YIP9DoS6djfTogAXQtXWcumaXwLA+650Y9H9Dq7Pa0ZqKI4t13eQc+FSCHXv4SakLP
 zGhHZY+9xnJkFlLvy8EOfokocgM3dEgMVyBf8K7BBcuUop/2bGbMTT2dnv4VKn+mDf+V
 jgiC4VqjumFbi5IDuj1WTCwqwZVKytcFMHaqhVQ/OSi2AuXfekHIJVg6SLrw3cGhhkow
 rXxd49UCQhCRjumJjjFdYvqKFrfwPY10UgXTlrq2tgSdIqD0ScE5NZc2yg6HQUg2Bo1F
 kQ2/dseeQl6YvZ5bn/fxSqdAA0Mvg6uw6MKr6ahO0xGQfiSssnwT8E6xHOJsiSpgJXy9
 JfhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:mime-version:subject:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=gqWrrw3AMB/+/GsXLIr498XtmGk9pgwbsmw3q/0NnR8=;
 b=QhwZ2srbeYTIwf+WWVEz/ku9KYvyh/tt7CTzwdBebQApJ92eSf9NJ7p1H2SEV7ocsH
 jiEF5LjElFEDArLsqScjCepljfaEKJ8uguHIUgUH2WufcpAnxOnwmh6PcRP7hErl7jtS
 uz/fSLrBZa3ZN77kVO+s1K/uktXEYAprFq5f8zKRMlfd62tB/KF6NGD7ilBRTUrgsudr
 uLQ7vauCHSBVbt0lBMmSeoCThXwiaye+ezAW6Qz7V4nGNyT3EboyZRjjdX8VytD4ij8z
 Y4LniDOmkudYswoZ47qE43qaHiryEchwZNI2w4x7Ax6I3q3Gt58wP2m+4mXtjilzXXdK
 P67Q==
X-Gm-Message-State: APjAAAW41fNahuDfe+6ciRytMyu2QXhqre44wbG4NeK3Qcy1Qqlm+cWq
 iOnnSpZYfkeajCRrNn8XyrvMbiq7B2k=
X-Google-Smtp-Source: APXvYqzaxizbxnZo4AEh7P9T2yCixmKtEuFEZfMuuqEMRthEWv9qrFCkVWn36ZV8wTXeOrNshtPdnQ==
X-Received: by 2002:a7b:c924:: with SMTP id h4mr1643988wml.46.1570609002147;
 Wed, 09 Oct 2019 01:16:42 -0700 (PDT)
Received: from ?IPv6:2a02:c7f:ac18:da00:84e4:cc95:a861:bf95?
 ([2a02:c7f:ac18:da00:84e4:cc95:a861:bf95])
 by smtp.gmail.com with ESMTPSA id k24sm6737939wmi.1.2019.10.09.01.16.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 09 Oct 2019 01:16:41 -0700 (PDT)
From: Lars Kurth <lars.kurth.xen@gmail.com>
X-Google-Original-From: Lars Kurth <lars.kurth@xenproject.org>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
In-Reply-To: <23963.3341.764085.220401@mariner.uk.xensource.com>
Date: Wed, 9 Oct 2019 09:16:40 +0100
Message-Id: <BD5E7846-857B-43B7-83F2-DD1AD8797217@xenproject.org>
References: <alpine.LFD.2.21.1908150030150.2807@austen3.home>
 <alpine.LFD.2.21.1908150055060.2807@austen3.home>
 <18fb961102e8da16d1ad9576742bccf2@crc.id.au>
 <alpine.LFD.2.21.1908151959060.2715@austen3.home>
 <114550b6cd3e7936e055a63ebbb2c7a6@crc.id.au>
 <0b7f33b8fd6fbbae86451b5bbdb1f6ac@crc.id.au> <1566956155.3344.0@crc.id.au>
 <23929.6485.711561.46507@mariner.uk.xensource.com>
 <alpine.LFD.2.21.1910062127110.2837@austen3.home>
 <23963.3341.764085.220401@mariner.uk.xensource.com>
To: Ian Jackson <Ian.Jackson@citrix.com>
X-Mailer: Apple Mail (2.3445.104.11)
Subject: Re: [Xen-devel] [PATCH] read grubenv and set default from
 saved_entry or next_entry [and 1 more messages]
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Steven Haigh <netwiz@crc.id.au>,
 xen-devel <xen-devel@lists.xenproject.org>, "YOUNG,
 MICHAEL A." <m.a.young@durham.ac.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cgo+IE9uIDcgT2N0IDIwMTksIGF0IDExOjAxLCBJYW4gSmFja3NvbiA8SWFuLkphY2tzb25AY2l0
cml4LmNvbT4gd3JvdGU6Cj4gCj4gSGkuICBUaGFua3MgZm9yIHRoZSBtZXNzYWdlLgo+IAo+IEp1
c3Qgb25lIHRoaW5nIEkgd2FudGVkIHRvIHJlcGx5IHRvIGluIHlvdXIgbWFpbDoKPiAKPiBZT1VO
RywgTUlDSEFFTCBBLiB3cml0ZXMgKCJSZTogW1hlbi1kZXZlbF0gW1BBVENIXSByZWFkIGdydWJl
bnYgYW5kIHNldCBkZWZhdWx0IGZyb20gc2F2ZWRfZW50cnkgb3IgbmV4dF9lbnRyeSBbYW5kIDEg
bW9yZSBtZXNzYWdlc10iKToKPj4gT24gV2VkLCAxMSBTZXAgMjAxOSwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4+PiBJIGZpbmQgdGhpcyBmaWxlbmFtZSBoYWNrZXJ5IHJhdGhlciB1bnByaW5jaXBsZWQu
ICBJJ20gbm90IGVudGlyZWx5Cj4+PiBzdXJlIEkgY2FuIHNlZSBhIGJldHRlciB3YXksIGdpdmVu
IHRoZSB3YXkgY2ZnX2xpc3QgaXMgY29uc3RydWN0ZWQuCj4+PiBDYW4geW91IHRoaW5rIG9mIGEg
bGVzcyBoYWNreSBhcHByb2FjaCA/Cj4gLi4uCj4+IE9uZSBvcHRpb24gd291bGQgYmUgdG8gZG8g
YSBmcmVzaCBzZWFyY2ggZm9yIGdydWJlbnYgaW4gdGhlIHNhbWUgcGxhY2VzCj4+IHdlIGxvb2tl
ZCBmb3IgZ3J1Yi5jZmcuCj4+IAo+PiBBbHRlcm5hdGl2ZWx5LCBpdCBzaG91bGQgYmUgcG9zc2li
bGUgdG8gZG8gYSBtb3JlIHByZWNpc2UgZWRpdCB1c2luZwo+PiBmLnJwYXJ0aXRpb24oIi8iKS4K
PiAKPiBJIGRvbid0IGZlZWwgSSBmdWxseSB1bmRlcnN0YW5kIHRoZSBpbXBsaWNhdGlvbnMsIGJ1
dCBlaXRoZXIgb2YgdGhlc2UKPiBzZWVtcyBsaWtlIHRoZXkgbWlnaHQgYmUgZ29vZCBzdHJhdGVn
aWVzIHRvIG1lLiAgSSBndWVzcyB0aGUgZm9ybWVyCj4gcmlza3MgZmluZGluZyBhbiB1bnJlbGF0
ZWQgbGVmdG92ZXIgZ3J1YmVudiBzb21ld2hlcmUgd2hpY2ggaXMKPiBwcm9iYWJseSBub3QgZGVz
aXJhYmxlLgo+IAo+IEFueXdheSwgSSB3aWxsIGxlYXZlIHRoaXMgdG8geW91ciBqdWRnZW1lbnQu
Cj4gCj4gVGhhbmtzIGZvciB0aGUgcmVzdCBvZiB5b3VyIGNvbW1lbnRzLiAgSSdsbCBsb29rIGZv
cndhcmQgdG8gYSByZXZpc2VkCj4gc2V0IG9mIHBhdGNoZXMgLSB0aGFua3MuCgpIaSBhbGwsCgpJ
IGFtIGFzc3VtaW5nIHRoZXJlIGlzIG5vIGNoYW5jZSB0aGF0IHRoaXMgd2lsbCBtYWtlIDQuMTMg
d2l0aCB0aGUgZnJlZXplIGhhdmluZyBwYXNzZWQuCgpCdXQgaW4gYW55IGNhc2UsIEkgd2Fzbid0
IHN1cmUgd2hldGhlciBNaWNoYWVsIHN0cmljdGx5IHdpbGwgbmVlZCBpdCBhcyB0aGUgY2hhbmdl
IGNhbiBwcmVzdW1hYmx5IGJlIGNhcnJpZWQgaW4gYSBmZWRvcmEgcGF0Y2ggcSBmb3IgWGVuIHBh
Y2thZ2VzIHVudGlsIGl0IGVuZHMgdXAgdXBzdHJlYW0KCkxhcnMKCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
