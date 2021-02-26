Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5310E3264B3
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 16:26:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90404.171127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFf0h-0000eR-HY; Fri, 26 Feb 2021 15:26:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90404.171127; Fri, 26 Feb 2021 15:26:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFf0h-0000e2-E9; Fri, 26 Feb 2021 15:26:31 +0000
Received: by outflank-mailman (input) for mailman id 90404;
 Fri, 26 Feb 2021 15:26:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=77G0=H4=amazon.de=prvs=684d0ac3b=nmanthey@srs-us1.protection.inumbo.net>)
 id 1lFf0f-0000dw-RU
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 15:26:29 +0000
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 40a5bbcd-9e6c-4d00-a56f-f5bd6c81050e;
 Fri, 26 Feb 2021 15:26:29 +0000 (UTC)
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-90c42d1d.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 26 Feb 2021 15:26:21 +0000
Received: from EX13D02EUB001.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
 by email-inbound-relay-2a-90c42d1d.us-west-2.amazon.com (Postfix) with ESMTPS
 id 58299A1772; Fri, 26 Feb 2021 15:26:19 +0000 (UTC)
Received: from u6fc700a6f3c650.ant.amazon.com (10.43.160.244) by
 EX13D02EUB001.ant.amazon.com (10.43.166.150) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 26 Feb 2021 15:26:15 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 40a5bbcd-9e6c-4d00-a56f-f5bd6c81050e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1614353190; x=1645889190;
  h=to:cc:references:from:message-id:date:mime-version:
   in-reply-to:content-transfer-encoding:subject;
  bh=/mWILN4s552lqJMkiRuRB9qtEhhfkm9EpTvr62O1Zuw=;
  b=IQQ8JdXQ6q2n6LLMMQv2q3b/B2wr5kDSTKZjnnv94D2iO+8tkomLKSFg
   TQXNqMjzOY36dMMKQTdSl61jWxGfU3H1QzIuKtakKCWbXGaYqvyarq2aN
   89H7nmUkjpLAx+OkqM1UjfN9/eF6PyaSW8hJNxbOvG+pL7VKuCP8HsC6f
   4=;
X-IronPort-AV: E=Sophos;i="5.81,208,1610409600"; 
   d="scan'208";a="88523753"
Subject: Re: [PATCH XENSTORE v1 10/10] xs: add error handling
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Juergen Gross <jgross@suse.com>, Wei Liu
	<wl@xen.org>, Julien Grall <jgrall@amazon.co.uk>, Michael Kurth
	<mku@amazon.de>
References: <20210226144144.9252-1-nmanthey@amazon.de>
 <20210226144144.9252-11-nmanthey@amazon.de>
 <78560c14-81dc-05de-26f8-15861459806d@xen.org>
From: Norbert Manthey <nmanthey@amazon.de>
Autocrypt: addr=nmanthey@amazon.de; prefer-encrypt=mutual; keydata=
 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
 pEddsOqYwOs=
Message-ID: <b035a1f0-70b5-9224-b8ac-a1dd9dff06da@amazon.de>
Date: Fri, 26 Feb 2021 16:26:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <78560c14-81dc-05de-26f8-15861459806d@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
X-Originating-IP: [10.43.160.244]
X-ClientProxiedBy: EX13D14UWC004.ant.amazon.com (10.43.162.99) To
 EX13D02EUB001.ant.amazon.com (10.43.166.150)
Precedence: Bulk
Content-Transfer-Encoding: base64

T24gMi8yNi8yMSAzOjUzIFBNLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgTm9yYmVydCwKPgo+
IE9uIDI2LzAyLzIwMjEgMTQ6NDEsIE5vcmJlcnQgTWFudGhleSB3cm90ZToKPj4gSW4gY2FzZSBv
ZiBhIGZhaWx1cmUgZGVlcCBpbiB0aGUgY2FsbCB0cmVlLCB3ZSBtaWdodCByZXR1cm4gTlVMTCBh
cyB0aGUKPj4gdmFsdWUgb2YgdGhlIGRvbWFpbi4gSW4gdGhhdCBjYXNlLCBlcnJvciBvdXQgaW5z
dGVhZCBvZiBkZXJlZmVyZW5jaW5nCj4+IHRoZSBOVUxMIHBvaW50ZXIuCj4+Cj4+IFRoaXMgYnVn
IHdhcyBkaXNjb3ZlcmVkIGFuZCByZXNvbHZlZCB1c2luZyBDb3Zlcml0eSBTdGF0aWMgQW5hbHlz
aXMKPj4gU2VjdXJpdHkgVGVzdGluZyAoU0FTVCkgYnkgU3lub3BzeXMsIEluYy4KPgo+IFRoaXMg
Y29tbWl0IG1lc3NhZ2UgaXMgbm90IHZlcnkgZGVzY3JpcHRpdmUuIEludGVybmFsbHksIEkgc3Vn
Z2VzdGVkOgo+Cj4gIgo+IHRvb2xzL3hlbnN0b3JlOiBIYXJkZW4geHNfZG9tYWluX2lzX2ludHJv
ZHVjZWQoKQo+Cj4gVGhlIGZ1bmN0aW9uIHNpbmdsZV93aXRoX2RvbWlkKCkgbWF5IHJldHVybiBO
VUxMIGlmIHNvbWV0aGluZwo+IHdlbnQgd3JvbmcgKGUuZy4gWGVuU3RvcmVkIHJldHVybnMgYW4g
ZXJyb3Igb3IgdGhlIGNvbm5lY3Rpb24gaXMKPiBpbiBiYWQgc3RhdGUpLgo+Cj4gVGhleSBhcmUg
dW5saWtlbHkgYnV0IG5vdCBpbXBvc3NpYmxlLCBzbyBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8KPiBy
ZXR1cm4gYW4gZXJyb3IgYW5kIGFsbG93IHRoZSBjYWxsZXIgdG8gaGFuZGxlIGl0IGdyYWNlZnVs
bHkgcmF0aGVyCj4gdGhhbiBjcmFzaGluZy4KPgo+IEluIHRoaXMgY2FzZSB3ZSBzaG91bGQgdHJl
YXQgaXQgYXMgdGhlIGRvbWFpbiBoYXMgZGlzYXBwZWFyZWQgKGkuZS4KPiByZXR1cm4gZmFsc2Up
IGFzIHRoZSBjYWxsZXIgd2lsbCBub3QgbGlrZWx5IGdvaW5nIHRvIGJlIGFibGUgdG8KPiBjb21t
dW5pY2F0ZSB3aXRoIFhlblN0b3JlZCBhZ2Fpbi4KPgo+IFRoaXMgYnVnIHdhcyBkaXNjb3ZlcmVk
IGFuZCByZXNvbHZlZCB1c2luZyBDb3Zlcml0eSBTdGF0aWMgQW5hbHlzaXMKPiBTZWN1cml0eSBU
ZXN0aW5nIChTQVNUKSBieSBTeW5vcHN5cywgSW5jLgo+ICIKPgo+IEkgd291bGQgaGF2ZSBleHBl
Y3RlZCB0aGlzIHRvIGJlIGFkZHJlc3NlZCBnaXZlbiB0aGF0Li4uCgpVbmRlcnN0b29kLiBJIHdp
bGwgaXRlcmF0ZS4KCk5vcmJlcnQKCj4KPj4KPj4gU2lnbmVkLW9mZi1ieTogTm9yYmVydCBNYW50
aGV5IDxubWFudGhleUBhbWF6b24uZGU+Cj4+IFJldmlld2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGpn
cmFsbEBhbWF6b24uY28udWsKPiAuLi4geW91IGNhcnJpZWQgb3ZlciBteSByZXZpZXdlZC1ieSB0
YWcuCj4KPgo+IENoZWVycywKPgo+IC0tIAo+IEp1bGllbiBHcmFsbAoKCgpBbWF6b24gRGV2ZWxv
cG1lbnQgQ2VudGVyIEdlcm1hbnkgR21iSApLcmF1c2Vuc3RyLiAzOAoxMDExNyBCZXJsaW4KR2Vz
Y2hhZWZ0c2Z1ZWhydW5nOiBDaHJpc3RpYW4gU2NobGFlZ2VyLCBKb25hdGhhbiBXZWlzcwpFaW5n
ZXRyYWdlbiBhbSBBbXRzZ2VyaWNodCBDaGFybG90dGVuYnVyZyB1bnRlciBIUkIgMTQ5MTczIEIK
U2l0ejogQmVybGluClVzdC1JRDogREUgMjg5IDIzNyA4NzkKCgo=


