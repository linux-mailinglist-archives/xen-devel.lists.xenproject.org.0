Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4F617665A
	for <lists+xen-devel@lfdr.de>; Mon,  2 Mar 2020 22:49:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j8ssm-0000M3-8g; Mon, 02 Mar 2020 21:45:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=McR1=4T=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1j8ssk-0000Ly-SV
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2020 21:45:46 +0000
X-Inumbo-ID: 2b6a5b9d-5ccf-11ea-a00f-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2b6a5b9d-5ccf-11ea-a00f-12813bfff9fa;
 Mon, 02 Mar 2020 21:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583185546;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=jKzb44e4NIGhph6g8BLT/m9IYUYuPtWLG6rpWfQ6U9g=;
 b=Kb0e7U7QxcW0OtmAbcmZUAovYbvXbuMb7fFZDfhmSIb6gJJgIh9VMj8i
 4WkfkxOit95CzS/ZIxNi3GcKnJwSel+Ui5irE6tkGNrNsPnBVRst8SLot
 Mdbc5lawbKaswLEokQdsPfxalA00Wn3X9t2tHSn+WDJjwiDGbfNRIt5IC w=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: MfnlTNba5f/NUsqQPm9HHmUOCUMVOSSsD0ZOxEzPOLFW6QlA6CBVl+o87zSxR886ej4/+YmCA8
 nGz3wQpSmBzEGvCTGmuOWhuuh+4xOs35v7mUrB3GsmfXz8qPtO+WAlTbRilFfWBsJXZXT+IVGf
 yoRJ5L5YilBpyEm73FrwWTGxSCGx26c/7YjloKDc01/wkcTRfK1XJsJQybcLWjHigdOD+pA4kd
 KRawybZmzcaBSzm+TkMerKtSpr8MnQhE1md1TkXLquQuzqESuPLJZu2xTIO05zF8wECl3LXzqE
 DZI=
X-SBRS: 2.7
X-MesageID: 13276587
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,508,1574139600"; d="scan'208";a="13276587"
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <c9adeb2c-b580-f3d3-fba7-dd703b1efdfa@suse.com>
 <dc3ba72b-ae33-d5ae-f0b0-ad57985ab92f@citrix.com>
 <37ca6d18-4f21-0a00-cedf-69a1b8f2114c@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <8e79104b-bf4a-8428-6024-90938a25e960@citrix.com>
Date: Mon, 2 Mar 2020 21:45:41 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <37ca6d18-4f21-0a00-cedf-69a1b8f2114c@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Core scheduling and cpu offlining
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Sergey
 Dyasli <sergey.dyasli@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIvMDMvMjAyMCAxNDowNSwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAwMi4wMy4yMCAx
NDo1MSwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4+IE9uIDAyLzAzLzIwMjAgMDg6MzksIErDvHJn
ZW4gR3Jvw58gd3JvdGU6Cj4+PiBIaSBJZ29yLAo+Pj4KPj4+IGNvdWxkIHlvdSBwbGVhc2UgdGVz
dCB0aGUgYXR0YWNoZWQgcGF0Y2ggd2hldGhlciBpdCBmaXhlcyB5b3VyIHByb2JsZW0KPj4+IHdp
dGggY3B1IG9mZmxpbmluZz8KPj4KPj4gSXQncyBjZXJ0YWlubHkgYmV0dGVyIGFuZCBkb2Vzbid0
IGNhdXNlIHdhdGNoZG9nIGhpdCBhcyBiZWZvcmUgYnV0IEkgcmFuCj4+IHRoZSBmb2xsb3dpbmcg
c2NyaXB0IHRvIHZlcmlmeToKPj4KPj4gd2hpbGUgdHJ1ZQo+PiBkbwo+PiDCoMKgwqDCoCBmb3Ig
aSBpbiBgc2VxIDEgNjNgOyBkbyB4ZW4taHB0b29sIGNwdS1vZmZsaW5lICRpOyBkb25lCj4+IMKg
wqDCoMKgIGZvciBpIGluIGBzZXEgMSA2M2A7IGRvIHhlbi1ocHRvb2wgY3B1LW9ubGluZSAkaTsg
ZG9uZQo+PiBkb25lCj4+Cj4+IC4uLiBhbmQgZ290IHRoaXMgYSBsaXR0bGUgYml0IGxhdGVyIChu
b3RlIHRoZSBzYW1lIHNjcmlwdCB3b3JrcyBmaW5lIGluIHRocmVhZCBtb2RlKToKPj4KPj4gKFhF
TikgW8KgIDI4Mi4xOTkxMzRdIEFzc2VydGlvbiAnIXByZWVtcHRfY291bnQoKScgZmFpbGVkIGF0
IHByZWVtcHQuYzozNgo+PiAoWEVOKSBbwqAgMjgyLjE5OTE0Ml0gLS0tLVsgWGVuLTQuMTMuMMKg
IHg4Nl82NMKgIGRlYnVnPXnCoMKgIE5vdCB0YWludGVkIF0tLS0tCj4+IChYRU4pIFvCoCAyODIu
MTk5MTQ3XSBDUFU6wqDCoMKgIDAKPj4gKFhFTikgW8KgIDI4Mi4xOTkxNTBdIFJJUDrCoMKgwqAg
ZTAwODpbPGZmZmY4MmQwODAyMjg4MTc+XSBBU1NFUlRfTk9UX0lOX0FUT01JQysweDFmLzB4NTgK
Pj4gKFhFTikgW8KgIDI4Mi4xOTkxNTldIFJGTEFHUzogMDAwMDAwMDAwMDAxMDIwMsKgwqAgQ09O
VEVYVDogaHlwZXJ2aXNvcgo+PiAoWEVOKSBbwqAgMjgyLjE5OTE2NV0gcmF4OiBmZmZmODJkMDgw
NWM3MDI0wqDCoCByYng6IDAwMDAwMDAwMDAwMDAwMDDCoMKgIHJjeDogMDAwMDAwMDAwMDAwMDAw
MAo+PiAoWEVOKSBbwqAgMjgyLjE5OTE3MF0gcmR4OiAwMDAwMDAwMDAwMDAwMDAwwqDCoCByc2k6
IDAwMDAwMDAwMDAwMDI2Y2TCoMKgIHJkaTogZmZmZjgyZDA4MDRiM2FhYwo+PiAoWEVOKSBbwqAg
MjgyLjE5OTE3NV0gcmJwOiBmZmZmODMwMDkyMGJmZTkwwqDCoCByc3A6IGZmZmY4MzAwOTIwYmZl
OTDCoMKgIHI4OsKgIGZmZmY4MzA0MmYyMWZmZTAKPj4gKFhFTikgW8KgIDI4Mi4xOTkxODBdIHI5
OsKgIDAwMDAwMDAwMDAwMDAwMDHCoMKgIHIxMDogMzMzMzMzMzMzMzMzMzMzM8KgwqAgcjExOiAw
MDAwMDAwMDAwMDAwMDAxCj4+IChYRU4pIFvCoCAyODIuMTk5MTg1XSByMTI6IGZmZmY4MmQwODA1
Y2RiMDDCoMKgIHIxMzogMDAwMDAwMDAwMDAwMDAwMMKgwqAgcjE0OiBmZmZmODJkMDgwNWM3MjUw
Cj4+IChYRU4pIFvCoCAyODIuMTk5MTkyXSByMTU6IDAwMDAwMDAwMDAwMDAwMDDCoMKgIGNyMDog
MDAwMDAwMDA4MDA1MDAzYsKgwqAgY3I0OiAwMDAwMDAwMDAwMzUwNmUwCj4+IChYRU4pIFvCoCAy
ODIuMTk5MjUyXSBjcjM6IDAwMDAwMDAwOTIwYjAwMDDCoMKgIGNyMjogMDAwMDdmMGZmZjk2NzAw
MAo+PiAoWEVOKSBbwqAgMjgyLjE5OTI1Nl0gZnNiOiAwMDAwN2YwZmZmOTU3NzQwwqDCoCBnc2I6
IGZmZmY4ODgyMWUwMDAwMDDCoMKgIGdzczogMDAwMDAwMDAwMDAwMDAwMAo+PiAoWEVOKSBbwqAg
MjgyLjE5OTI2MV0gZHM6IDAwMDDCoMKgIGVzOiAwMDAwwqDCoCBmczogMDAwMMKgwqAgZ3M6IDAw
MDDCoMKgIHNzOiBlMDEwwqDCoCBjczogZTAwOAo+PiAoWEVOKSBbwqAgMjgyLjE5OTI2OF0gWGVu
IGNvZGUgYXJvdW5kIDxmZmZmODJkMDgwMjI4ODE3PiAoQVNTRVJUX05PVF9JTl9BVE9NSUMrMHgx
Zi8weDU4KToKPj4gKFhFTikgW8KgIDI4Mi4xOTkyNzJdwqAgNTIgZDEgODMgM2MgMTAgMDAgNzQg
MDIgPDBmPiAwYiA0OCA4OSBlMCA0OCAwZCBmZiA3ZiAwMCAwMCA4YiA0MCBjMSA0OCBjMQo+PiAo
WEVOKSBbwqAgMjgyLjE5OTI4N10gWGVuIHN0YWNrIHRyYWNlIGZyb20gcnNwPWZmZmY4MzAwOTIw
YmZlOTA6Cj4+IChYRU4pIFvCoCAyODIuMTk5MjkwXcKgwqDCoCBmZmZmODMwMDkyMGJmZWEwIGZm
ZmY4MmQwODAyNDI2ODAgZmZmZjgzMDA5MjBiZmVmMCBmZmZmODJkMDgwMjdhMTcxCj4+IChYRU4p
IFvCoCAyODIuMTk5Mjk3XcKgwqDCoCBmZmZmODJkMDgwMjQyNjM1IDAwMDAwMDAwMmIzYmYwMDAg
ZmZmZjgzMDQyYmIxZjAwMCBmZmZmODMwNDJiYjFmMDAwCj4+IChYRU4pIFvCoCAyODIuMTk5MzA0
XcKgwqDCoCBmZmZmODMwNDJiYjFmMDAwIDAwMDAwMDAwMDAwMDAwMDAgZmZmZjgyZDA4MDVlYzYy
MCAwMDAwMDAwMDAwMDAwMDAwCj4+IChYRU4pIFvCoCAyODIuMTk5MzExXcKgwqDCoCBmZmZmODMw
MDkyMGJmZDYwIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDdmZmM2MzMwMDFiMCAwMDAwMDAwMDAwMzA1
MDAwCj4+IChYRU4pIFvCoCAyODIuMTk5MzE3XcKgwqDCoCBmZmZmODg4MjEyYmQyOGE4IDAwMDA3
ZmZjNjMzMDAxYjAgZmZmZmZmZmZmZmZmZmZmMiAwMDAwMDAwMDAwMDAwMjg2Cj4+IChYRU4pIFvC
oCAyODIuMTk5MzI0XcKgwqDCoCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAgMDAw
MDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwCj4+IChYRU4pIFvCoCAyODIuMTk5MzI5XcKg
wqDCoCBmZmZmZmZmZjgxMDAxNDZhIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMCBk
ZWFkYmVlZmRlYWRmMDBkCj4+IChYRU4pIFvCoCAyODIuMTk5MzM1XcKgwqDCoCAwMDAwMDEwMDAw
MDAwMDAwIGZmZmZmZmZmODEwMDE0NmEgMDAwMDAwMDAwMDAwZTAzMyAwMDAwMDAwMDAwMDAwMjg2
Cj4+IChYRU4pIFvCoCAyODIuMTk5MzQyXcKgwqDCoCBmZmZmYzkwMDQyOTc3ZDcwIDAwMDAwMDAw
MDAwMGUwMmIgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwCj4+IChYRU4pIFvCoCAy
ODIuMTk5MzQ3XcKgwqDCoCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAgMDAwMGUw
MTAwMDAwMDAwMCBmZmZmODMwNDJiYjFmMDAwCj4+IChYRU4pIFvCoCAyODIuMTk5MzUzXcKgwqDC
oCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAzNTA2ZTAgMDAwMDAwMDAwMDAwMDAwMCAwMDAw
MDAwMDAwMDAwMDAwCj4+IChYRU4pIFvCoCAyODIuMTk5MzU5XcKgwqDCoCAwMDAwMDQwMDAwMDAw
MDAwIDAwMDAwMDAwMDAwMDAwMDAKPj4gKFhFTikgW8KgIDI4Mi4xOTkzNjRdIFhlbiBjYWxsIHRy
YWNlOgo+PiAoWEVOKSBbwqAgMjgyLjE5OTM2OF3CoMKgwqAgWzxmZmZmODJkMDgwMjI4ODE3Pl0g
UiBBU1NFUlRfTk9UX0lOX0FUT01JQysweDFmLzB4NTgKPj4gKFhFTikgW8KgIDI4Mi4xOTkzNzVd
wqDCoMKgIFs8ZmZmZjgyZDA4MDI0MjY4MD5dIEYgZG9fc29mdGlycSsweDkvMHgxNQo+PiAoWEVO
KSBbwqAgMjgyLjE5OTM4MV3CoMKgwqAgWzxmZmZmODJkMDgwMjdhMTcxPl0gRiBhcmNoL3g4Ni9k
b21haW4uYyNpZGxlX2xvb3ArMHhiNC8weGNiCj4+IChYRU4pIFvCoCAyODIuMTk5Mzg0XQo+PiAo
WEVOKSBbwqAgMjgyLjQzODk5OF0KPj4gKFhFTikgW8KgIDI4Mi40NDA5OTFdICoqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioKPj4gKFhFTikgW8KgIDI4Mi40NDY0NTldIFBh
bmljIG9uIENQVSAwOgo+PiAoWEVOKSBbwqAgMjgyLjQ0OTc0NV0gQXNzZXJ0aW9uICchcHJlZW1w
dF9jb3VudCgpJyBmYWlsZWQgYXQgcHJlZW1wdC5jOjM2Cj4+IChYRU4pIFvCoCAyODIuNDU2MTU2
XSAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqCj4+IChYRU4pIFvCoCAy
ODIuNDYxNjIxXQo+IAo+IE9oLCBpbmRlZWQsIHRoZXJlIGFyZSByY3VfcmVhZF91bmxvY2soKSBj
YWxscyBtaXNzaW5nICh1cCB0byBub3cKPiBmb3IgQVJNIHJlbGV2YW50IG9ubHkpLgo+IAo+IElz
IHRoaXMgb25lIGJldHRlcj8KCkkgdGhpbmsgd2UncmUgYmFjayBhdCB0aGUgc3F1YXJlIG9uZS4g
Rm9yIHNvbWUgcmVhc29uIGl0IG5vdyB0aHJvd3Mgd2F0Y2hkb2cgdGltZW91dHMKYWdhaW4uIE5v
dGU6IEknbSB0ZXN0aW5nIHdpdGhvdXQgYW55IHJjdV9iYXJyaWVyIHJlbGF0ZWQgcGF0Y2hlcyBh
cHBsaWVkLiBEbyB5b3Ugc2VlCnRoZSBzYW1lIGlzc3VlcyBydW5uaW5nIHRoZSBzY3JpcHQgYWJv
dmUgb24geW91ciBtYWNoaW5lPwoKSWdvcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
