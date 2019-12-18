Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2AF124825
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 14:25:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihZGv-0004ek-H1; Wed, 18 Dec 2019 13:21:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5UKC=2I=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1ihZGt-0004ea-C0
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 13:21:47 +0000
X-Inumbo-ID: 52445504-2199-11ea-88e7-bc764e2007e4
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 52445504-2199-11ea-88e7-bc764e2007e4;
 Wed, 18 Dec 2019 13:21:38 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1576675298; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=XkgUfVn8o6M0b8913ncRHcFhlq1m3/RThl71lG7F8+o=;
 b=oBtEBPBdLsrvs39QzFCc6zocv1bvVON1ladyzvUkZetgw5xI7ZtBt9OzuImJrVe5xtSgilHt
 IRSTmmKSSMfKBRACVRynixjQ1L3wFmV4F6VKYUvmQ0bgBlFEe/IJuLfI13Ix9yB3OgptVSih
 onr/cb1KN9NL6KK/7j7hfu1R/80=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mxa.mailgun.org with ESMTP id 5dfa27e1.7efaffa533b0-smtp-out-n01;
 Wed, 18 Dec 2019 13:21:37 -0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id d16so2254642wre.10
 for <xen-devel@lists.xenproject.org>; Wed, 18 Dec 2019 05:21:36 -0800 (PST)
X-Gm-Message-State: APjAAAWJJ+mOwC9hLT0UKMLSp1auC/8z0xmL2VlRJA8QQQE0X6rjYLDX
 dNES+1AGfikbj8ZYUlrSljrCZZCzegxr5GJClsw=
X-Google-Smtp-Source: APXvYqw6YN++yFs45U1U8L38pqGyWwb+9TGzMSMCDeMIR1Jao/FowdadekxJSRfBkyFqhnLOdxYoTEB2gWD4VUQiaE4=
X-Received: by 2002:adf:b60f:: with SMTP id f15mr2699245wre.372.1576675296153; 
 Wed, 18 Dec 2019 05:21:36 -0800 (PST)
MIME-Version: 1.0
References: <e6853b44-681a-7423-ede0-43b551b554af@list.ru>
In-Reply-To: <e6853b44-681a-7423-ede0-43b551b554af@list.ru>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 18 Dec 2019 06:20:59 -0700
X-Gmail-Original-Message-ID: <CABfawhniHPue=cQ7Ne0yQLG_+_JT=4sgi_GG7qoK0aC730Jk4g@mail.gmail.com>
Message-ID: <CABfawhniHPue=cQ7Ne0yQLG_+_JT=4sgi_GG7qoK0aC730Jk4g@mail.gmail.com>
To: Sergey Kovalev <valor@list.ru>
Subject: Re: [Xen-devel] [XEN PATCH v3] x86/vm_event: add short-circuit for
 breakpoints (aka, , "fast single step")
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvcHVibGljL3ZtX2V2ZW50LmggYi94ZW4vaW5jbHVk
ZS9wdWJsaWMvdm1fZXZlbnQuaAo+IGluZGV4IGFhNTRjODYzMjUuLmNiNTc3YTdiYTkgMTAwNjQ0
Cj4gLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL3ZtX2V2ZW50LmgKPiArKysgYi94ZW4vaW5jbHVk
ZS9wdWJsaWMvdm1fZXZlbnQuaAo+IEBAIC0xMTAsNiArMTEwLDExIEBACj4gICAqIGludGVycnVw
dCBwZW5kaW5nIGFmdGVyIHJlc3VtaW5nIHRoZSBWQ1BVLgo+ICAgKi8KPiAgI2RlZmluZSBWTV9F
VkVOVF9GTEFHX0dFVF9ORVhUX0lOVEVSUlVQVCAoMSA8PCAxMCkKPiArLyoKPiArICogRXhlY3V0
ZSBmYXN0IHNpbmdsZXN0ZXBwaW5nIG9uIHZtX2V2ZW50IHJlc3BvbnNlLgo+ICsgKiBSZXF1aXJl
cyB0aGUgdkNQVSB0byBiZSBwYXVzZWQgYWxyZWFkeSAoc3luY2hyb25vdXMgZXZlbnRzIG9ubHkp
Lgo+ICsgKi8KClBsZWFzZSBleHBhbmQgdGhpcyBkZXNjcmlwdGlvbiBoZXJlIHRoYXQgaXQgYWxz
byByZXF1aXJlcyBzZXR0aW5nIHRoZQpwMm1pZHggZmllbGQgb2YgZmFzdF9zaW5nbGVzdGVwIHRv
IHdoaWNoIFhlbiB3aWxsIHN3aXRjaCB0aGUgdkNQVSB0bwpvbiB0aGUgb2NjdXJhbmNlIG9mIHRo
ZSBmaXJzdCBzaW5nbGVzdGVwLCBhZnRlciB3aGljaCBzaW5nbGVzdGVwIGdldHMKYXV0b21hdGlj
YWxseSBkaXNhYmxlZC4KCj4gKyNkZWZpbmUgVk1fRVZFTlRfRkxBR19GQVNUX1NJTkdMRVNURVAg
ICgxIDw8IDExKQo+Cj4gIC8qCj4gICAqIFJlYXNvbnMgZm9yIHRoZSB2bSBldmVudCByZXF1ZXN0
Cj4gQEAgLTI3Niw2ICsyODEsMTAgQEAgc3RydWN0IHZtX2V2ZW50X3NpbmdsZXN0ZXAgewo+ICAg
ICAgdWludDY0X3QgZ2ZuOwo+ICB9Owo+Cj4gK3N0cnVjdCB2bV9ldmVudF9mYXN0X3NpbmdsZXN0
ZXAgewo+ICsgICAgdWludDE2X3QgcDJtaWR4Owo+ICt9Owo+ICsKPiAgc3RydWN0IHZtX2V2ZW50
X2RlYnVnIHsKPiAgICAgIHVpbnQ2NF90IGdmbjsKPiAgICAgIHVpbnQzMl90IGluc25fbGVuZ3Ro
Owo+IEBAIC0zNjMsNiArMzcyLDcgQEAgdHlwZWRlZiBzdHJ1Y3Qgdm1fZXZlbnRfc3Qgewo+ICAg
ICAgICAgIHN0cnVjdCB2bV9ldmVudF9tb3ZfdG9fbXNyICAgICAgICAgICAgbW92X3RvX21zcjsK
PiAgICAgICAgICBzdHJ1Y3Qgdm1fZXZlbnRfZGVzY19hY2Nlc3MgICAgICAgICAgIGRlc2NfYWNj
ZXNzOwo+ICAgICAgICAgIHN0cnVjdCB2bV9ldmVudF9zaW5nbGVzdGVwICAgICAgICAgICAgc2lu
Z2xlc3RlcDsKPiArICAgICAgICBzdHJ1Y3Qgdm1fZXZlbnRfZmFzdF9zaW5nbGVzdGVwICAgICAg
IGZhc3Rfc2luZ2xlc3RlcDsKPiAgICAgICAgICBzdHJ1Y3Qgdm1fZXZlbnRfZGVidWcgICAgICAg
ICAgICAgICAgIHNvZnR3YXJlX2JyZWFrcG9pbnQ7Cj4gICAgICAgICAgc3RydWN0IHZtX2V2ZW50
X2RlYnVnICAgICAgICAgICAgICAgICBkZWJ1Z19leGNlcHRpb247Cj4gICAgICAgICAgc3RydWN0
IHZtX2V2ZW50X2NwdWlkICAgICAgICAgICAgICAgICBjcHVpZDsKPiAtLQo+IDIuMjAuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
