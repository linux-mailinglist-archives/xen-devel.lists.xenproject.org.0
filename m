Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B0816F86C
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 08:17:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6qt4-0002Vg-6T; Wed, 26 Feb 2020 07:13:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TmNR=4O=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j6qt2-0002Vb-Fr
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 07:13:40 +0000
X-Inumbo-ID: 81b52fa3-5867-11ea-93d2-12813bfff9fa
Received: from mail-ed1-f68.google.com (unknown [209.85.208.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 81b52fa3-5867-11ea-93d2-12813bfff9fa;
 Wed, 26 Feb 2020 07:13:38 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id j17so2511064edp.3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2020 23:13:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=At+5x2fcLOad61cD3FyMdhE1U0e6cex192fx+/NoT9g=;
 b=UvXGn5KDFWR9BMvNrB1oeZDu7UJn+R2StObwbhMdvwKUXwVU0o5SjOQUwjZfLqh13l
 yV4mpNDxPXcr579gkknr6yhEc2bReBfy8DyNWO+0NbwKU1H06XIalXAZBOOIYqK1xlUh
 1DLW4l4UXOqwj2weQJGxlQB6nSjgKToiRCO9XN4oHn4tj5Ef5LuJUS/0s+OQhBpzYKJc
 GF3xVqj1WqkVUx3Ojtjbe7rdAlOtsm+UZ0PRor5xWXpMVuvgkZK3hz5nNCGPQnbAy6MX
 Dh/EaX1np2584/68jSl7U5C9SW0v6KAHP/dpjw4a/KVDARikmZNK/UwKR/H4Z8I2j68T
 G/AA==
X-Gm-Message-State: APjAAAXeJr4wALEu/dTBfb+o4T0bLt6ygUAvkfz1hVi3SqABB2v1bN8t
 N3Scjsm7PQnh9InPR/yeF1THtqt2B6HIcQ==
X-Google-Smtp-Source: APXvYqz66PfxBVZQyXDvb5Qo6yDJfm19LNSZ2G8ako+w2n8j6F2zDN/KRHg2Yee9LcAuileVEbhNbg==
X-Received: by 2002:aa7:df11:: with SMTP id c17mr2961098edy.326.1582701217415; 
 Tue, 25 Feb 2020 23:13:37 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-226.amazon.com.
 [54.240.197.226])
 by smtp.gmail.com with ESMTPSA id lu4sm15161ejb.76.2020.02.25.23.13.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2020 23:13:36 -0800 (PST)
To: Jan Beulich <jbeulich@suse.com>
References: <8a95f787ca93b23ee8d8c0b55fcc63d22a75c5f3.camel@infradead.org>
 <20200201003303.2363081-7-dwmw2@infradead.org>
 <3821a29a-7d60-c18b-71dd-12ed3c5b708d@suse.com>
 <519b73bb-2db3-75e4-db81-3781c462290e@xen.org>
 <44f074ee-b47c-0c20-02d8-8bee1557e503@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <863e5864-5aef-3fde-9433-bc4f8bd19eb2@xen.org>
Date: Wed, 26 Feb 2020 07:13:33 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <44f074ee-b47c-0c20-02d8-8bee1557e503@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH 7/8] x86/setup: simplify handling of
 initrdidx when no initrd present
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Varad Gautam <vrd@amazon.de>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Hongyan Xia <hongyxia@amazon.com>,
 xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.co.uk>,
 David Woodhouse <dwmw2@infradead.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gMjUvMDIvMjAyMCAxMjozNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjQu
MDIuMjAyMCAxNDozMSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBPbiAyMS8wMi8yMDIwIDE2OjU5
LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+IE9uIDAxLjAyLjIwMjAgMDE6MzMsIERhdmlkIFdvb2Ro
b3VzZSB3cm90ZToKPj4+PiBGcm9tOiBEYXZpZCBXb29kaG91c2UgPGR3bXdAYW1hem9uLmNvLnVr
Pgo+Pj4+Cj4+Pj4gUmVtb3ZlIGEgdGVybmFyeSBvcGVyYXRvciB0aGF0IG1hZGUgbXkgYnJhaW4g
aHVydC4KPj4+Cj4+PiBQZXJzb25hbGx5IEknZCBwcmVmZXIgdGhlIGNvZGUgdG8gc3RheSBhcyBp
cywgYnV0IGlmIEFuZHJldyBhZ3JlZXMKPj4+IHdpdGggdGhpcyBiZWluZyBhbiBpbXByb3ZlbWVu
dCwgdGhlbiBJIGFsc28gd291bGRuJ3Qgd2FudCB0byBzdGFuZAo+Pj4gaW4gdGhlIHdheS4gSWYg
aXQgaXMgdG8gZ28gaW4gSSBoYXZlIGEgZmV3IHNtYWxsIGFkanVzdG1lbnQgcmVxdWVzdHM6Cj4+
Pgo+Pj4+IFJlcGxhY2UgaXQgd2l0aCBzb21ldGhpbmcgc2ltcGxlciB0aGF0IG1ha2VzIGl0IHNv
bWV3aGF0IGNsZWFyZXIgdGhhdAo+Pj4+IHRoZSBjaGVjayBmb3IgaW5pdHJkaWR4IDwgbWJpLT5t
b2RzX2NvdW50IGlzIGJlY2F1c2UgbWJpLT5tb2RzX2NvdW50Cj4+Pj4gaXMgd2hhdCBmaW5kX2Zp
cnN0X2JpdCgpIHdpbGwgcmV0dXJuIHdoZW4gaXQgZG9lc24ndCBmaW5kIGFueXRoaW5nLgo+Pj4K
Pj4+IEVzcGVjaWFsbHkgaW4gbGlnaHQgb2YgdGhlIHJlY2VudCBYU0EtMzA3IEknZCBsaWtlIHRv
IGFzayB0aGF0IHdlCj4+PiBhdm9pZCBpbXByZWNpc2Ugc3RhdGVtZW50cyBsaWtlIHRoaXM6IEFm
YWljdCBmaW5kX2ZpcnN0X2JpdCgpIG1heQo+Pj4gYWxzbyB2YWxpZGx5IHJldHVybiBhbnkgdmFs
dWUgbGFyZ2VyIHRoYW4gdGhlIHBhc3NlZCBpbiBiaXRtYXAKPj4+IGxlbmd0aC4KPj4KPj4gSXMg
aXQ/IEkgdGhvdWdoIHRoYXQgYWxsIHRoZSBjYWxsZXJzIGFyZSBub3cgcmV0dXJuaW5nICdzaXpl
JyBpbiBhbGwgdGhlCj4+IGVycm9yIGNhc2VzLgo+IAo+IFRha2luZyAocGFydCBvZikgdGhlIHg4
NiBleGFtcGxlOgo+IAo+PiAjZGVmaW5lIGZpbmRfbmV4dF9iaXQoYWRkciwgc2l6ZSwgb2ZmKSAo
eyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+PiAgICAgdW5zaWduZWQgaW50
IHJfXzsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXAo+PiAgICAgY29uc3QgdW5zaWduZWQgbG9uZyAqYV9fID0gKGFkZHIpOyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+PiAgICAgdW5zaWduZWQgaW50IHNfXyA9IChz
aXplKTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+PiAg
ICAgdW5zaWduZWQgaW50IG9fXyA9IChvZmYpOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXAo+PiAgICAgaWYgKCBvX18gPj0gc19fICkgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+PiAgICAgICAgIHJf
XyA9IHNfXzsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgXAo+IAo+IFRoaXMgaXMgd2hhdCBkaWQgZ2V0IGFkanVzdGVkLCBndWFyYW50ZWVp
bmcgInNpemUiIHRvIGJlIHJldHVybmVkIGZvcgo+IHRvbyBsYXJnZSBhbiAib2Zmc2V0Ii4KPiAK
Pj4gICAgIGVsc2UgaWYgKCBfX2J1aWx0aW5fY29uc3RhbnRfcChzaXplKSAmJiBzX18gPD0gQklU
U19QRVJfTE9ORyApICAgICAgICAgIFwKPj4gICAgICAgICByX18gPSBvX18gKyBfX3NjYW5iaXQo
Kihjb25zdCB1bnNpZ25lZCBsb25nICopKGFfXykgPj4gb19fLCBzX18pOyAgIFwKPiAKPiBZZXQg
dGhpcyB3YXMgKGRlbGliZXJhdGVseSkgbGVmdCB1bnRvdWNoZWQuIFdpdGhvdXQgc19fIGdldHRp
bmcKPiByZXBsYWNlZCBieSBzX18gLSBvX18gaXQgbWF5IHN0aWxsIHByb2R1Y2UgYSB2YWx1ZSBs
YXJnZXIgdGhhbgo+ICJzaXplIiwgdGhvdWdoLgoKQWggSSBtaXNzZWQgdGhpcyBwYXJ0LgoKPiAK
PiBGdXJ0aGVyLCBldmVuIGlmIGFsbCBjdXJyZW50IGltcGxlbWVudGF0aW9ucyBvYmV5ZWQgYnkg
dGhlIG1vcmUKPiBzdHJpY3QgcnVsZSwgdGhpcyBzdGlsbCB3b3VsZG4ndCBtZWFuIGNhbGxlcnMg
YXJlIGFjdHVhbGx5IHBlcm1pdHRlZAo+IHRvIGFzc3VtZSBzdWNoLiBUaGUgbW9yZSBzdHJpY3Qg
cnVsZSB3b3VsZCB0aGVuIGFsc28gbmVlZCB0byBiZQo+IHdyaXR0ZW4gZG93biwgc3VjaCB0aGF0
IGl0IHdvbid0IGdldCB2aW9sYXRlZCBhZ2FpbiBpbiB0aGUgZnV0dXJlCj4gKGJ5IGNoYW5nZXMg
dG8gYW4gZXhpc3RpbmcgYXJjaCdzIGltcGxlbWVudGF0aW9uLCBvciBieSBhIG5ldyBwb3J0CgpU
byBiZSBob25lc3QsIHRoZSBydWxlIHNob3VsZCBiZSB3cml0dGVuIGRvd24gaW4gYW55IGNhc2Uu
IFRoZSBjdXJyZW50IApvbmUgaXMgbm90IG5lY2Vzc2FyaWx5IGFuIG9idmlvdXMgb25lIGFuZCBh
bHNvIGRpZmZlciBmcm9tIHdoYXQgTGludXggCmZvbGtzIGNhbiBleHBlY3QuCgpSZWdhcmRpbmcg
ZnV0dXJlIHBvcnQsIHRoZSBudW1iZXIgb2YgYXJjaGl0ZWN0dXJlcyBpbiBMaW51eCB1c2luZyBj
dXN0b20gCmJpdG9wcyBhcmUgZmFpcmx5IGxpbWl0ZWQgKEFGQUlDVCBvbmx5IGFybTMyIGFuZCB1
bmljb3JlMzIpLiBBbGwgdGhlIApyZXN0IChpbmNsdWRpbmcgeDg2KSB1c2luZyBhIGdlbmVyaWMg
aW1wbGVtZW50YXRpb24uCgpPbiBYZW4sIEFybTY0IGlzIGFscmVhZHkgdXNpbmcgdGhlIGdlbmVy
aWMgaW1wbGVtZW50YXRpb24uIElzIHRoZXJlIGFueSAKcGFydGljdWxhciBjb25jZXJuIHRvIHVz
ZSBpdCBmb3IgeDg2IGFzIHdlbGw/CgpJZiBub3QsIEkgY2FuIHB1bGwgYSBwYXRjaCB0byB1c2Ug
dGhlIGdlbmVyaWMgaW1wbGVtZW50YXRpb24gb24gCng4Ni9hcm0zMi4gVGhpcyB3b3VsZCBzb2x2
ZSB0aGUgZGlzY3JlbnBhbmNpZXMgaW4gZmluZF8qX2JpdCAKaW1wbGVtZW50YXRpb25zLgoKQ2hl
ZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
