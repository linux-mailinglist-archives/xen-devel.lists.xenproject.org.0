Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B364117265
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 18:04:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieMQX-0006yW-7p; Mon, 09 Dec 2019 17:02:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qJK3=Z7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ieMQV-0006yR-Du
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 17:02:27 +0000
X-Inumbo-ID: ac972a04-1aa5-11ea-b6f1-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ac972a04-1aa5-11ea-b6f1-bc764e2007e4;
 Mon, 09 Dec 2019 17:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575910946;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=pqsFSuN3c9QwevYd3Kyv2SNUj1RYOtaPTygdm+kzKak=;
 b=HKbfiL79OY7B4HkJCG9Qhb49dJwaxFHPn++yKNqhXeRSz2MkYriq1+/o
 GP5NS2RPnrmTl7lOgp9R0OwswRnIhqhaPWjBQg4d94oStc7PoYMTp4/Th
 MZ9Oc3DVitVoG2BfiS1mSkKf3AQe7cKBUtnDTw6ZnNtL7Druiiopsu6tn Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: J6/qJBka3IdoafOHZLvN87mbzNROioSB2kltaACxnTulNi28PV4aO07BpSVUJkrnPIhSaBtHvG
 iCyvQ/+eI162jWQqfKMgxEWHcyJD+KTTIpvFyIUKPaon+h+Pf/2edauQoiN0QDCivvcIsBBTsR
 TmiPoQS3c+9GRXxAlEphg6go7XvbuLLjkBmSTCY1kQqSkAAPbfHxZ2TuaVpLOTTE1BKBJRDDUl
 cwXVjS7caE15Ra8H5cJW3lr+e+Cu8Sa5IliTptYDuQ7FBjqXAF9U7sYlJJXuMu+7ZI8pc/42DV
 GYI=
X-SBRS: 2.7
X-MesageID: 9534201
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,296,1571716800"; 
   d="scan'208";a="9534201"
To: Jan Beulich <jbeulich@suse.com>
References: <20191207211634.9958-1-andrew.cooper3@citrix.com>
 <20191207211634.9958-2-andrew.cooper3@citrix.com>
 <57b4ce90-7756-6073-0985-0310f8709f25@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <f37194ce-bd20-0286-e4a7-c6e6b38eaee9@citrix.com>
Date: Mon, 9 Dec 2019 17:01:41 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <57b4ce90-7756-6073-0985-0310f8709f25@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v3 1/3] xen/flask: Drop the gen-policy.py
 script
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
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkvMTIvMjAxOSAxMzozOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDcuMTIuMjAxOSAy
MjoxNiwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gLS0tIC9kZXYvbnVsbAo+PiArKysgYi94ZW4v
eHNtL2ZsYXNrL2ZsYXNrLXBvbGljeS5TCj4+IEBAIC0wLDAgKzEsMjAgQEAKPj4gKyAgICAgICAg
LnNlY3Rpb24gLmluaXQucm9kYXRhLCAiYSIsICVwcm9nYml0cwo+PiArCj4+ICsvKiBjb25zdCB1
bnNpZ25lZCBjaGFyIHhzbV9mbGFza19pbml0X3BvbGljeVtdIF9faW5pdGNvbnN0ICovCj4+ICsg
ICAgICAgIC5hbGlnbiA0Cj4gSSdtIGFmcmFpZCAuYWxpZ24gaXMgbm90IHVuaXZlcnNhbCBlbm91
Z2ggdG8gYmUgdXNlZCBoZXJlIC0gaWlyYwo+IHNvbWUgYXJjaGl0ZWN0dXJlcyBoYXZlIGl0IGFs
aWFzIC5wMmFsaWduIHJhdGhlciB0aGFuIChob3cgZS5nLgo+IHg4NiBiZWhhdmVzKSAuYmFsaWdu
LiBMb29rcyBsaWtlIC5wMmFsaWduIGlzIGF2YWlsYWJsZSBpbiBhbGwKPiBiaW51dGlscyB2ZXJz
aW9ucyB3ZSBjbGFpbSB0byBiZSBhYmxlIHRvIGJlIGJ1aWx0IHdpdGguIChJJ20KPiBub3Qgc3Vy
ZSB0aGUgb25lIGhlcmUgaXMgbmVlZGVkIGFueXdheSwgYnV0IHRoZSBvbmUgYmVsb3cgd2UKPiBz
dXJlbHkgd2FudC4pCgpJIGNhbiBzd2l0Y2ggdG8gcDJhbGlnbiwgYnV0Li4uCgo+Cj4+ICsgICAg
ICAgIC5nbG9iYWwgeHNtX2ZsYXNrX2luaXRfcG9saWN5Cj4+ICt4c21fZmxhc2tfaW5pdF9wb2xp
Y3k6Cj4+ICsgICAgICAgIC5pbmNiaW4gInBvbGljeS5iaW4iCj4+ICsuTGVuZDoKPj4gKwo+PiAr
ICAgICAgICAudHlwZSB4c21fZmxhc2tfaW5pdF9wb2xpY3ksICVvYmplY3QKPj4gKyAgICAgICAg
LnNpemUgeHNtX2ZsYXNrX2luaXRfcG9saWN5LCAuIC0geHNtX2ZsYXNrX2luaXRfcG9saWN5Cj4+
ICsKPj4gKy8qIGNvbnN0IHVuc2lnbmVkIGludCBfX2luaXRjb25zdCB4c21fZmxhc2tfaW5pdF9w
b2xpY3lfc2l6ZSAqLwo+PiArICAgICAgICAuYWxpZ24gNAo+PiArICAgICAgICAuZ2xvYmFsIHhz
bV9mbGFza19pbml0X3BvbGljeV9zaXplCj4+ICt4c21fZmxhc2tfaW5pdF9wb2xpY3lfc2l6ZToK
Pj4gKyAgICAgICAgLmxvbmcgLkxlbmQgLSB4c21fZmxhc2tfaW5pdF9wb2xpY3kKPiBTaW1pbGFy
bHkgLmxvbmcgaXNuJ3QgcmVhbGx5IHVuaXZlcnNhbCAodmFyaW91cyBhcmNoZXMgb3ZlcnJpZGUK
PiBpdCBpbiBnYXMpLiBBaXVpIC5kYy5sIGlzIGludGVuZGVkIHRvIGJlIHBvcnRhYmxlIChkZXNw
aXRlIHN0aWxsCj4gY2FycnlpbmcgdGhlICdsJyBpbiBpdHMgbmFtZSwgYW5kIGRlc3BpdGUgZXZl
biB0aGlzIG9uZSBnZXR0aW5nCj4gb3ZlcnJpZGRlbiBieSB0d28gYXJjaGVzKS4gQnV0IHBlcmhh
cHMgYmVzdCB0byBhc2sgb24gdGhlCj4gYmludXRpbHMgbGlzdC4KCi4uLiB0aGlzIGlzIG5vdCBh
IGNsZWFyIG9yIG9idmlvdXMgd2F5IHRvIGdvLCBub3QgbGVhc3QgYmVjYXVzZSBpdCBtYWtlcwph
IGRpZmZlcmVudCBleHBlY3RhdGlvbiB0aGF0IGludCB3aWxsIG5ldmVyIGNoYW5nZSBmcm9tIGJl
aW5nIDMyIGJpdHMuwqAKQXQgbGVhc3QgLmxvbmcgd2lsbCB3b3JrIGV2ZW4gaWYgaXQgYmVjb21l
cyBsb25nZXIgaW4gYSBmdXR1cmUgdG9vbGNoYWluLgoKV2hhdCBpcyB1c2VkIGhlcmUgZG9lc24n
dCBuZWVkIHRvIGJlIHVuaXZlcnNhbCAtIGl0IG9ubHkgbmVlZHMgdG8gd29yawpmb3IgdGhlIGFy
Y2hpdGVjdHVyZXMgd2Ugc3VwcG9ydC4KCklmIGhhbmQgd3JpdGluZyBhbiBhc20gZmlsZSBpc24n
dCBjb25zaWRlcmVkIGdvb2QgZW5vdWdoLCB0aGVuIHRoZSBvdGhlcgpvcHRpb25zIGFyZSBhIEMg
ZmlsZSB3aXRoIGlubGluZSBhc20gaW5jYmluLCBvciBgb2JqZHVtcAotLXJlbmFtZS1zZWN0aW9u
YC7CoCBUaGUgbGF0dGVyIG9uZSB3b3VsZCByZXF1aXJlIGEgZmV3IGNoYW5nZXMgZWxzZXdoZXJl
CmluIHRoZSBjb2RlLCBidXQgb25seSBmb3IgbGlua2FnZSBwdXJwb3Nlcy4KCn5BbmRyZXcKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
