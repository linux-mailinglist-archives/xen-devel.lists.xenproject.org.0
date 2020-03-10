Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA47C17FE7A
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 14:35:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBf03-0003z8-EP; Tue, 10 Mar 2020 13:32:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HhRS=43=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jBf02-0003z2-Pw
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 13:32:46 +0000
X-Inumbo-ID: a06c04d6-62d3-11ea-a6c1-bc764e2007e4
Received: from mail-ed1-x529.google.com (unknown [2a00:1450:4864:20::529])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a06c04d6-62d3-11ea-a6c1-bc764e2007e4;
 Tue, 10 Mar 2020 13:32:46 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id h5so5997678edn.5
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2020 06:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=rkdESdLNgmf+zqdaH0lzMhMMzdi9U6uadmgVrvcF2As=;
 b=hDbyrJ3XrL3cBZsqHZ/y9s06Elh2J0/P9mRf1VXVza6nf4Tm0bSrPPcNgVh7Z4tpKD
 tQpzNrYbxz3EUvyuC98MM/GGDbeARF3mKVW8dEHg8EvLDNRKJFMOMeNSN9v2siV7V2Ys
 feOqDbgJRjIcJeBMUnox+Dv2z+/aBf1FlPsgmQG+bmOK5E6M8fb9TyhibwNZmElTD0tG
 sGx0WGvGIAFRSZKL7pq9CptvnrS/bncReghJdne9WOx0l1+/Y9G3f2lz2WEpwGB/kG4f
 7Ua1ZUPRBA2X92PHuHqmzvtVYeIkI+1CZ+8D3s2YmoaK8OK4gergoSfnqxelabuuHWac
 +TeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=rkdESdLNgmf+zqdaH0lzMhMMzdi9U6uadmgVrvcF2As=;
 b=XRDourimNTCNRnnBU7DqpMrFk2IW+ekRes6qNqE6zDwqZlxb3NGWQm+zTm9hv0G/FR
 cPOGCvbspham1UNNUXkHZlDAKpwn1uquzhWs1NPl0+aX+7T0UN+ilTeUhpWpJb9cxbcV
 i2IHyaZHYIPN6t3wQsC8T/BLqh5RjLbaObtnuFNxstiNoyO6WA0uySxpOD3MLgQV3QJ5
 CJStiV9qybcMFyp+zPlt9FddAjaihHq2TeQqQ63O/GXbV2x7rXVaBvwlQKFLOiUlFsXj
 hl1RIKvFpu13LuXpHFjQ0jxcaRepRyiEGnuo3UEoXesN2PT2U2LrA2QlSpcbSIfMkfW8
 JPcQ==
X-Gm-Message-State: ANhLgQ2ZRxq6lwNhVBL37P7E/dSaVZYB6nECARrIAVVK8ahP/GLF/T4j
 4e6VAttlvmr0nWMXrsTXKsI=
X-Google-Smtp-Source: ADFU+vuMN8a6qev5LYXtJYLihqjIVLuc4PKYNhbOQR1tQ0X18tzpJILCrm8LsGUcCsQ2jUxuD5gMOA==
X-Received: by 2002:a05:6402:1d1b:: with SMTP id
 dg27mr22445169edb.43.1583847165422; 
 Tue, 10 Mar 2020 06:32:45 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-235.amazon.com. [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id k27sm2777066eja.20.2020.03.10.06.32.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 10 Mar 2020 06:32:44 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
References: <20200309102304.1251-1-paul@xen.org>
 <20200309102304.1251-4-paul@xen.org>
 <ae9cc4a6-0378-571c-9d46-0561e536884f@suse.com>
In-Reply-To: <ae9cc4a6-0378-571c-9d46-0561e536884f@suse.com>
Date: Tue, 10 Mar 2020 13:32:44 -0000
Message-ID: <001301d5f6e0$61aa5e00$24ff1a00$@xen.org>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQH8MQiuRQX2aixYfaKKXR3nYohrUgMqvTqhAWAuss6n0QHGAA==
Content-Language: en-gb
Subject: Re: [Xen-devel] [PATCH v5 3/6] x86 / pv: do not treat PGC_extra
 pages as RAM
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
Reply-To: paul@xen.org
Cc: xen-devel@lists.xenproject.org, 'Paul Durrant' <pdurrant@amazon.com>,
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
 'Wei Liu' <wl@xen.org>, 'Andrew Cooper' <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KPiBTZW50OiAwOSBNYXJjaCAyMDIwIDEzOjA0Cj4gVG86IHBhdWxAeGVuLm9y
Zwo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IFBhdWwgRHVycmFudCA8cGR1
cnJhbnRAYW1hem9uLmNvbT47IEFuZHJldyBDb29wZXIKPiA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT4KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY1IDMvNl0geDg2IC8gcHY6IGRvIG5v
dCB0cmVhdCBQR0NfZXh0cmEgcGFnZXMgYXMgUkFNCj4gCj4gT24gMDkuMDMuMjAyMCAxMToyMywg
cGF1bEB4ZW4ub3JnIHdyb3RlOgo+ID4gRnJvbTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6
b24uY29tPgo+ID4KPiA+IFRoaXMgcGF0Y2ggbW9kaWZpZXMgc2V2ZXJhbCBwbGFjZXMgd2Fsa2lu
ZyB0aGUgZG9tYWluJ3MgcGFnZV9saXN0IHRvIG1ha2UKPiA+IHRoZW0gaWdub3JlIFBHQ19leHRy
YSBwYWdlczoKPiA+Cj4gPiAtIGR1bXBfcGFnZWZyYW1lX2luZm8oKSBzaG91bGQgaWdub3JlIFBH
Q19leHRyYSBwYWdlcyBpbiBpdHMgZHVtcCBhcyBpdAo+ID4gICBkZXRlcm1pbmVzIHdoZXRoZXIg
dG8gZHVtcCB1c2luZyBkb21haW5fdG90X3BhZ2VzKCkgd2hpY2ggYWxzbyBpZ25vcmVzCj4gPiAg
IFBHQ19leHRyYSBwYWdlcy4KPiAKPiBUaGlzIGFyZ3VtZW50IGxvb2tzIHdyb25nIHRvIG1lOiBM
ZXQncyB0YWtlIGFuIGV4YW1wbGUgLSBhIGRvbWFpbgo+IGFsbW9zdCBmdWxseSBjbGVhbmVkIHVw
LCB3aXRoIDggIm5vcm1hbCIgYW5kIDMgImV4dHJhIiBwYWdlcyBsZWZ0Lgo+IGRvbWFpbl90b3Rf
cGFnZXMoKSByZXR1cm5zIDggaW4gdGhpcyBjYXNlLCBpLmUuICJub3JtYWwiIHBhZ2UKPiBkdW1w
aW5nIGRvZXNuJ3QgZ2V0IHNraXBwZWQuIEhvd2V2ZXIsIHRoZXJlIG5vdyB3b24ndCBiZSBhbnkg
dHJhY2UKPiBvZiB0aGUgImV4dHJhIiBwYWdlcywgYmVjYXVzZSB0aGV5J3JlIGFsc28gbm90IG9u
IHhlbnBhZ2VfbGlzdCwKPiB3aGljaCBnZXRzIGFsbCBpdHMgcGFnZXMgZHVtcGVkIGluIGFsbCBj
YXNlcy4gQ29ycmVjdCByZXN0b3JhdGlvbgo+IG9mIG9yaWdpbmFsIGJlaGF2aW9yIHdvdWxkIGJl
IHRvIGR1bXAgIm5vcm1hbCIgcGFnZXMgd2hlbiB0aGVyZQo+IGFyZSBsZXNzIHRoYW4gMTAsIGFu
ZCB0byBkdW1wIGFsbCAiZXh0cmEiIHBhZ2VzLiAoU2FtZSBvZiBjb3Vyc2UKPiBnb2VzIGZvciBs
aXZlIGRvbWFpbnMsIHdoZXJlICJub3JtYWwiIHBhZ2UgZHVtcGluZyB3b3VsZCBiZQo+IHNraXBw
ZWQgaW4gdGhlIGNvbW1vbiBjYXNlLCBidXQgeGVuaGVhcCBwYWdlcyB3b3VsZCBiZSBkdW1wZWQs
IGFuZAo+IGhlbmNlIHNvIHNob3VsZCBiZSAiZXh0cmEiIG9uZXMuKSBBcyBpbmRpY2F0ZWQgYmVm
b3JlLCB0aGUgcmVtb3ZhbAo+IG9mIHRoZSBBUElDIGFzc2lzdCBwYWdlIGZyb20geGVucGFnZV9s
aXN0IHdhcyBhbHJlYWR5IHNsaWdodGx5Cj4gcmVncmVzc2luZyBpbiB0aGlzIHJlZ2FyZCAoYXMg
d2VsbCBhcyBpbiBhdCBsZWFzdCBvbmUgb3RoZXIgd2F5LAo+IEknbSBhZnJhaWQpLCBhbmQgeW91
J3JlIG5vdyBkZWxpYmVyYXRlbHkgbWFraW5nIHRoZSByZWdyZXNzaW9uCj4gZXZlbiBiaWdnZXIu
CgpJIHRob3VnaHQgdGhlIGlkZWEgaGVyZSB3YXMgdGhhdCB0aGUgZG9taGVhcCBkdW1wIGxvb3Ag
c2hvdWxkIGJlIGR1bXBpbmcgJ25vcm1hbCcgcGFnZXMgc28gaXQgc2VlbXMgcmVhc29uYWJsZSB0
byBtZSB0aGF0IHRoZSBudW1iZXIgb2YgcGFnZXMgZHVtcGVkIHRvIG1hdGNoIHRoZSB2YWx1ZSBy
ZXR1cm5lZCBieSBkb21haW5fdG90X3BhZ2VzKCkuCldvdWxkIHlvdSBwZXJoYXBzIGJlIGhhcHBp
ZXIgaWYgd2UgcHV0ICdleHRyYScgcGFnZXMgb24gc2VwYXJhdGUgcGFnZSBsaXN0LCB3aGljaCBj
YW4gYmUgdW5jb25kaXRpb25hbGx5IGR1bXBlZCBzbyBhcyBJIHRyYW5zaXRpb24geGVuaGVhcCBw
YWdlcyB0byAnZXh0cmEnIHBhZ2VzIHRoZXkgZG9uJ3QgZ2V0IG1pc3NlZD8gSXQgd291bGQgYWxz
byBnZXQgcmlkIG9mIHNvbWUgb2YgdGhlIG90aGVyIGNoZWNrcyBmb3IgUEdDX2V4dHJhIHRoYXQg
SSBoYXZlIHRvIGludHJvZHVjZSBiZWNhdXNlIHRoZXkgY3VycmVudGx5IGVuZCB1cCBvbiB0aGUg
ZG9tYWluJ3MgcGFnZSBsaXN0LgoKICBQYXVsCgo+IAo+IEphbgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
