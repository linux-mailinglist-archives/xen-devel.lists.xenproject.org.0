Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EADFB150E95
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 18:25:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyfR9-0006NQ-7k; Mon, 03 Feb 2020 17:23:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HIUd=3X=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iyfR7-0006NL-JP
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 17:23:01 +0000
X-Inumbo-ID: d3d63120-46a9-11ea-ad98-bc764e2007e4
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d3d63120-46a9-11ea-ad98-bc764e2007e4;
 Mon, 03 Feb 2020 17:23:01 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id w12so8380932wrt.2
 for <xen-devel@lists.xenproject.org>; Mon, 03 Feb 2020 09:23:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jsep4aW206LZ5xOdMq6CPmwn7SG2lo/KRk5Y7e96Ijo=;
 b=I84G7ZtiwxFK9RUe3KRklA10dydGEkJnw7m4Hc0xATM6ItNzMTqf8UpEymhONFWPKr
 ck8YbONh0rCHtZXn1KyUXGk0NcGmC77sMq1xXcDObi3M2fDNk4lk46vzyixL8jlF3No7
 li4uVYiQsx2+I3PW2W8qJgQafWWvsbcUzU2Lr0RGOlzqY8Pdjg2OGv3xGF3FpWyKXf2o
 Nm+y9jwG2a3HjZQ2GS+7TDooX7FQluloEvdbzEKIaBPcy8a+sKCXGN0ep/PXJDgwK2D8
 YVT/SkQIaNciM7iudja2f/sUV7DsS0IoVKHs16l034uXh2rscNE7wsTcES7PFKX/Nocw
 0CRQ==
X-Gm-Message-State: APjAAAVJMTgw/0ZLxWu4+Bcl/CnjhbQn91WnCxPWkavrVTcL2T6SuKL9
 VrPjvKFebdCFuFeWb9+Scn4=
X-Google-Smtp-Source: APXvYqwTO36XLXO52U6iidbLyv5yxq/mMaVzVyZxO1042RxaIplN0dkXcCOoTx6h0WzH1t1p5UPRUQ==
X-Received: by 2002:adf:f484:: with SMTP id l4mr17748363wro.207.1580750580219; 
 Mon, 03 Feb 2020 09:23:00 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-233.amazon.com.
 [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id c141sm31694wme.41.2020.02.03.09.22.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2020 09:22:59 -0800 (PST)
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <20200203165812.21089-1-julien@xen.org>
 <c39dd542-1748-066e-399f-dc110ac11e19@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <53769c85-cc65-55ad-3538-339f51243079@xen.org>
Date: Mon, 3 Feb 2020 17:22:58 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <c39dd542-1748-066e-399f-dc110ac11e19@citrix.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH] xen/x86: p2m: Don't initialize slot 0 of
 the P2M
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
Cc: Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Tim Deegan <tim@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAwMy8wMi8yMDIwIDE3OjEwLCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+IE9uIDIvMy8y
MCA0OjU4IFBNLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEZyb206IEp1bGllbiBHcmFsbCA8amdy
YWxsQGFtYXpvbi5jb20+Cj4+Cj4+IEl0IGlzIG5vdCBlbnRpcmVseSBjbGVhciB3aHkgdGhlIHNs
b3QgMCBvZiBlYWNoIHAybSBzaG91bGQgYmUgcG9wdWxhdGVkCj4+IHdpdGggZW1wdHkgcGFnZS10
YWJsZXMuIFRoZSBjb21taXQgaW50cm9kdWNpbmcgaXQgNzU5YWY4ZTM4MDAgIltIVk1dCj4+IEZp
eCA2NC1iaXQgSFZNIGRvbWFpbiBjcmVhdGlvbi4iIGRvZXMgbm90IGNvbnRhaW4gbWVhbmluZ2Z1
bAo+PiBleHBsYW5hdGlvbiBleGNlcHQgdGhhdCBpdCB3YXMgbmVjZXNzYXJ5IGZvciBzaGFkb3cu
Cj4gCj4gVGltLCBhbnkgaWRlYXMgaGVyZT8KPiAKPj4gQXMgd2UgZG9uJ3Qgc2VlbSB0byBoYXZl
IGEgZ29vZCBleHBsYW5hdGlvbiB3aHkgdGhpcyBpcyB0aGVyZSwgZHJvcCB0aGUKPj4gY29kZSBj
b21wbGV0ZWx5Lgo+Pgo+PiBUaGlzIHdhcyB0ZXN0ZWQgYnkgc3VjY2Vzc2Z1bGx5IGJvb3Rpbmcg
YSBIVk0gd2l0aCBzaGFkb3cgZW5hYmxlZC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdy
YWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4KPj4KPj4gLS0tCj4+Cj4+IEkgZG9uJ3Qga25vdyBmb3Ig
c3VyZSBpZiB0aGlzIGlzIGdvaW5nIHRvIGJyZWFrIGEgc2V0dXAuIEkgaGF2ZSB0cmllZAo+PiBI
Vk0gZ3Vlc3Qgd2l0aCBoYXA9ezAsIDF9IHdpdGhvdXQgYW55IHRyb3VibGUuIEkgYW0gaGFwcHkg
dG8gdHJ5IG1vcmUKPj4gc2V0dXAgaWYgeW91IGhhdmUgYW55IGluIG1pbmQuCj4+Cj4+IElmIHRo
aXMgYnJlYWsgYSBzZXR1cCwgdGhlbiBwbGVhc2UgZGVzY3JpYmUgdGhlIHNldHVwIGFuZCBJIHdp
bGwgc2VuZCBhCj4+IGRvY3VtZW50YXRpb24gcGF0Y2ggaW5zdGVhZC4KPiAKPiBUaGlzIGlzIGEg
c29tZXdoYXQgcmlza3kgc3RyYXRlZ3kuICBPdGhlciB0aGFuIGNvZGUgY2xlYW4tdXAsIGlzIHRo
ZXJlCj4gYW55IGFkdmFudGFnZSB0byByZW1vdmluZyB0aGlzIGNvZGUgYXQgdGhlIG1vbWVudD8K
CklmIFRpbSBkb2Vzbid0IGhhdmUgYW4gZXhwbGFuYXRpb24sIHRoZW4gd2UgaGF2ZSB0d28gc29s
dXRpb25zOgogICAgMSkgQ2hlY2tpbiB0aGUgY29kZSBhbmQgc2VlIGlmIHRoYXQgYnJlYWtzCiAg
ICAyKSBLZWVwIGNvZGUgd2UgaGF2ZSBubyBjbHVlIHdoeSBpdCBpcyB0aGVyZQoKSSB1bmRlcnN0
YW5kIHRoYXQgdGhlIGZvcm1lciBpcyByaXNreSwgYnV0IHRoZSBsYXR0ZXIgaXMgbm90IHZlcnkg
aWRlYWwgCmVpdGhlciBiZWNhdXNlIGlmIHdlIGNhbid0IGV4cGxhaW4gdGhlIHJlYXNvbiBub3cs
IHRoZW4gaXQgaXMgdW5saWtlbHkgCnRoYXQgd2Ugd291bGQgaW4gdGhlIGZ1dHVyZS4KClJlZ2Fy
ZGluZyB0aGUgYWR2YW50YWdlIG9mIHJlbW92aW5nIGl0LCBJIGFtIGxvb2tpbmcgYXQgbGl2ZXVw
ZGF0ZSBhbmQgCmhvdyB0byBrZWVwIHRoZSBQMk0gYXJvdW5kLiBJIGFtIHRyeWluZyB0byBsaW1p
dCB0aGUgbnVtYmVyIG9mICJpZiAKKGxpdmV1cGRhdGUpIiB3aXRoaW4gdGhlIGNvZGUuIFNvIGFu
eSBjbGVhbnVwIHdvdWxkIGJlIGJlbmVmaWNpYWwuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
