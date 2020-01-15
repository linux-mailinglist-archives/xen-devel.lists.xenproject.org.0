Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8367513BE2E
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 12:09:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irgWP-0007Ae-VK; Wed, 15 Jan 2020 11:07:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9sUE=3E=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1irgWO-0007AZ-KY
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 11:07:36 +0000
X-Inumbo-ID: 37509fb0-3787-11ea-a985-bc764e2007e4
Received: from mail-wr1-f54.google.com (unknown [209.85.221.54])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 37509fb0-3787-11ea-a985-bc764e2007e4;
 Wed, 15 Jan 2020 11:07:28 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id c14so15308091wrn.7
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jan 2020 03:07:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6PF1XTLBmJi8QNVYwVbIjmKFrcuOXJhoixiV/7nibnU=;
 b=fBo0b2euAeFuOgrqJrrwTY44fYxId8FuyZ9boNxSlGMoxyeCg4/TZHV/YEHkC908An
 mkvjTWuY/aRL5FyPF/CXyLxL8Hlum6RBo+dO7ga1McxyESDVBAAfvKyF2PBRl7GJSoQU
 oIgMGCK0sSRWt1h5cLlQjnyhTEmA61bIel5Vp4XnCasm3tFvCYSHX8d1uFV+R4khmn1d
 SK2Ri0mHhjwaSmdODDrKnpYHPZvSvqIoBlFo3kMn42Y2HO7HNp8uXC/y+Lm814RGdPSE
 u7x97EVsNmZzGDR7mn1Y8Ygqyt7HxC+uE6fb0PE8kdwVMdr6hnpvsL4+r1ctgd/Bs8T0
 5Htw==
X-Gm-Message-State: APjAAAV+/g9sYZvgbb60dTgiwBq9F/ihmmV8UjfHrauAspXcFwiO3l+8
 cqdfIOvT4BQUvUaIf91UF1U=
X-Google-Smtp-Source: APXvYqzuBl605xtbQ8irjfJvsux4TfDmy0BIAsslz2wi9QF22Eapl8yj+tbgFC3yH0kDSna2rTr9xw==
X-Received: by 2002:adf:ef92:: with SMTP id d18mr29828872wro.234.1579086447242; 
 Wed, 15 Jan 2020 03:07:27 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-233.amazon.com.
 [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id r68sm22746107wmr.43.2020.01.15.03.07.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jan 2020 03:07:26 -0800 (PST)
To: Jorge Pereira <jorge.pereira@nxp.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrei Cherechesu <andrei.cherechesu@nxp.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <AM6PR04MB5094DE81655072BDA67F7922F0340@AM6PR04MB5094.eurprd04.prod.outlook.com>
From: Julien Grall <julien@xen.org>
Message-ID: <358f2e6e-d4ff-7e4a-08c7-5be1c9c20ab6@xen.org>
Date: Wed, 15 Jan 2020 11:07:25 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <AM6PR04MB5094DE81655072BDA67F7922F0340@AM6PR04MB5094.eurprd04.prod.outlook.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] Having a DOM-U guest with 1:1 mapping in the second
 stage MMU.
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxNC8wMS8yMDIwIDIxOjM5LCBKb3JnZSBQZXJlaXJhIHdyb3RlOgo+IEhpIEd1eXMsCgpI
ZWxsbywKCj4gCj4gSeKAmW0gY3VycmVudGx5IHVzaW5nIFhFTiBpbiBvcmRlciB0byBydW4gc2lk
ZS1ieS1zaWRlIGEgRE9NLTAgd2l0aCBhIAo+IERPTS1VIGd1ZXN0LiBNeSB1c2UtY2FzZSBzY2Vu
YXJpbyByZXF1aXJlcyBpbiB0aGUgRE9NLVUgZGlyZWN0IGFjY2VzcyB0byAKPiBzb21lIGRtYS1j
YXBhYmxlIGRldmljZXMgc3VjaCBldGhlcm5ldCBhbmQgc29tZSBHUFVzLgo+IAo+IFNpbmNlIG91
ciB0YXJnZXQgcGxhdGZvcm0gKGkuTVg4TU0pIGRvZXMgbm90IHN1cHBvcnQgSU9NTVUsIHdlIGNh
buKAmXQgCj4gYXNzaWduIGRtYS1jYXBhYmxlIGRldmljZXMgdG8gdGhlIERPTS1VIGd1ZXN0IGJl
Y2F1c2UgWEVOIGRvZXMgbm90IAo+IGNyZWF0ZSAxOjEgbWFwcGluZyBmb3IgdGhhdCBndWVzdCBp
biB0aGUgMl5uZCBzdGFnZSBNTVUuIFNvLCAKPiBndWVzdC12aXJ0dWFsIGFkZHJlc3NlcyBhcmUg
ZGlmZmVyZW50IHRoYW4gdGhlIHBoeXNpY2FsIG9uZXMuCgpCZWFyIGluIG1pbmQgdGhpcyBzZXR1
cCBpcyBnb2luZyB0byBiZSBpbnNlY3VyZSB1bmxlc3MgeW91IGhhdmUgYW5vdGhlciAKd2F5IHRv
IHByZXZlbnQgeW91ciBwYXNzdGhyb3VnaC1lZCBkZXZpY2UgdG8gYWNjZXNzIG1lbW9yeSBpdCBz
aG91bGQgbm90IAooZS5nIGFuIE1QVSkuCgo+IElzIGl0IHBvc3NpYmxlIHRvIGhhdmUgMToxIG1h
cHBpbmcgZm9yIERPTS1VIGd1ZXN0cz8KCkl0IGlzIG5vdCBwb3NzaWJsZSBhdCB0aGUgbW9tZW50
LiBUaGVyZSBhcmUgYmVlbiB2YXJpb3VzIGVmZm9ydCB0byB0cnkgCnRvIGRvIGl0LCBidXQgSSBo
YXZlIGFsd2F5cyBwdXNoIGJhY2sgYXMgdGhpcyBpcyBhY3RpdmVseSBkZWZlYXRpbmcgdGhlIApw
dXJwb3Npbmcgb2YgYW4gaHlwZXJ2aXNvci4KClRoaXMgd291bGQgYmUgYSBkaWZmZXJlbnQgc3Rv
cnkgaWYgd2UgaGFkIHN1cHBvcnQgZm9yIE1QVSBpbiBYZW4uCgo+IElmIG5vdCwgSeKAmW0gCj4g
aW50ZXJlc3RlZCB0byBrbm93IHdoYXQgd291bGQgYmUgdGhlIGVzdGltYXRlZCBlZmZvcnQgdG8g
c3VwcG9ydCB0aGlzIAo+IGZlYXR1cmU/CgpJIHRoaW5rIHlvdSBoYXZlIHNvbWVvbmUgZWxzZSBp
biBOWFAgbG9va2luZyBhdCAxOjEgbWFwcGluZyBmb3IgWGVuIChpbiAKQ0MpLiBJIHByb3ZpZGVk
IHRvIEFuZHJlaSBzb21lIHRpcHMgaG93IHRvIGdldCAxOjEgbWFwcGluZyBmb3IgRG9tVSAKdXNp
bmcgZG9tMGxlc3MgaW4gRGVjZW1iZXIgKHNlZSBbMV0pLiBTbyB5b3UgbWF5IHdhbnQgdG8gc3lu
Yy11cCB3aXRoIApoaW0gaGVyZS4KCklmIHlvdSBhcmUgbG9va2luZyBhdCAxOjEgRG9tVSB1c2lu
ZyB4bCwgdGhlbiBpdCBpcyBnb2luZyB0byByZXF1aXJlIAptb3JlIHdvcmsgYXMgdGhlIGh5cGVy
Y2FsbCBhbGxvY2F0aW5nIG1lbW9yeSBpcyBiYXNlZCBvbiBndWVzdCBmcmFtZSAKbnVtYmVyLiBU
aGVyZSB3YXMgYSB0aHJlYWQgb24gdGhlIE1MIGEgZmV3IHllYXJzIGFnbywgSSBjYW4gdHJ5IHRv
IGRpZyAKaXQgZG93biBpZiB5b3UgYXJlIGludGVyZXN0ZWQuCgpDaGVlcnMsCgpbMV0gCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOS0xMi9t
c2cwMTM2NC5odG1sCgo+IAo+IFRoYW5rcyBpbiBhZHZhbmNlLAo+IAo+IENoZWVycywKPiAKPiBK
b3JnZQo+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gWGVuLWRldmVsIG1haWxpbmcgbGlzdAo+IFhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwo+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWwKPiAKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
