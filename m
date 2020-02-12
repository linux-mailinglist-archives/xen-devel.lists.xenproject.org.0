Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BDF15AE8D
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2020 18:16:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1vZg-0001u0-Av; Wed, 12 Feb 2020 17:13:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=B5jc=4A=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1j1vZe-0001tq-Da
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2020 17:13:19 +0000
X-Inumbo-ID: f5ce2a5e-4dba-11ea-bc8e-bc764e2007e4
Received: from server.eikelenboom.it (unknown [91.121.65.215])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f5ce2a5e-4dba-11ea-bc8e-bc764e2007e4;
 Wed, 12 Feb 2020 17:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=eikelenboom.it; s=20180706; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3g85uG/RhuPS3aTDnHjY/zl0LMidkoNR/RrNQJeglFA=; b=MFl4qkTmAdxgfQvnRvp9QBN7gs
 QHTSE3zJVGruCEeGb5v0DG22gPBk4d6bkDCPhXk7uF+H+Y7W54xff/OqHiMl0ACeIXjYupzFu0Ol+
 BRbVIlFaRCPWVqN0h4aK1SBbumpxCeYEAn7gUHvJ3PB9T2hVmHe/wZLjtTKw7YbNig9k=;
Received: from ip4da85049.direct-adsl.nl ([77.168.80.73]:40376
 helo=[172.16.1.50]) by server.eikelenboom.it with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <linux@eikelenboom.it>)
 id 1j1vbG-0001be-WA; Wed, 12 Feb 2020 18:14:59 +0100
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200212164949.56434-1-roger.pau@citrix.com>
 <1d26308a-cbe9-8a6c-a4a9-9211c0b165c5@eikelenboom.it>
 <20200212170150.GS4679@Air-de-Roger>
From: Sander Eikelenboom <linux@eikelenboom.it>
Message-ID: <287b5277-c6fc-3444-5c6a-6099cd754c2b@eikelenboom.it>
Date: Wed, 12 Feb 2020 18:13:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200212170150.GS4679@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 0/3] x86: fixes/improvements for scratch
 cpumask
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIvMDIvMjAyMCAxODowMSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBXZWQsIEZl
YiAxMiwgMjAyMCBhdCAwNTo1MzozOVBNICswMTAwLCBTYW5kZXIgRWlrZWxlbmJvb20gd3JvdGU6
Cj4+IE9uIDEyLzAyLzIwMjAgMTc6NDksIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPj4+IEhlbGxv
LAo+Pj4KPj4+IENvbW1pdDoKPj4+Cj4+PiA1NTAwZDI2NWEyYThmYTYzZDYwYzA4YmViNTQ5ZGU4
ZWM4MmZmN2E1Cj4+PiB4ODYvc21wOiB1c2UgQVBJQyBBTExCVVQgZGVzdGluYXRpb24gc2hvcnRo
YW5kIHdoZW4gcG9zc2libGUKPj4+Cj4+PiBJbnRyb2R1Y2VkIGEgYm9ndXMgdXNhZ2Ugb2YgdGhl
IHNjcmF0Y2ggY3B1bWFzazogaXQgd2FzIHVzZWQgaW4gYQo+Pj4gZnVuY3Rpb24gdGhhdCBjb3Vs
ZCBiZSBjYWxsZWQgZnJvbSBpbnRlcnJ1cHQgY29udGV4dCwgYW5kIGhlbmNlIHVzaW5nCj4+PiB0
aGUgc2NyYXRjaCBjcHVtYXNrIHRoZXJlIGlzIG5vdCBzYWZlLiBQYXRjaCAjMiBpcyBhIGZpeCBm
b3IgdGhhdCB1c2FnZS4KPj4+Cj4+PiBQYXRjaCAjMyBhZGRzIHNvbWUgZGVidWcgaW5mcmFzdHJ1
Y3R1cmUgdG8gbWFrZSBzdXJlIHRoZSBzY3JhdGNoIGNwdW1hc2sKPj4+IGlzIHVzZWQgaW4gdGhl
IHJpZ2h0IGNvbnRleHQsIGFuZCBoZW5jZSBzaG91bGQgcHJldmVudCBmdXJ0aGVyIG1pc3N1c2Vz
Lgo+Pj4KPj4+IFRoYW5rcywgUm9nZXIuCj4+Cj4+IEhpIFJvZ2VyLAo+Pgo+PiBEbyB5b3Ugc3Rp
bGwgd2FudCBtZSB0byB0ZXN0IHRoZSAicGFuaWMiIHBhdGNoID8KPj4gT3IgdGVzdCB0aGlzIHNl
cmllcyBpbnN0ZWFkID8KPiAKPiBJJ3ZlIGJlZW4gYWJsZSB0byB0cmlnZ2VyIHRoaXMgbXlzZWxm
LCBzbyBpZiB5b3UgY2FuIGdpdmUgYSB0cnkgdG8gdGhlCj4gc2VyaWVzIGluIG9yZGVyIHRvIGFz
c2VydCBpdCBmaXhlcyB5b3VyIGlzc3VlIHRoYXQgd291bGQgYmUgZ3JlYXQuCj4gCj4gVGhhbmtz
Lgo+IAoKU3VyZSwgY29tcGlsaW5nIG5vdywgd2lsbCByZXBvcnQgYmFjayB0b21vcnJvdyBtb3Ju
aW5nLgotLQpTYW5kZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
