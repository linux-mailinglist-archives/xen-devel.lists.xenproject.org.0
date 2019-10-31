Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A12D3EB095
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2019 13:49:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iQ9q9-0003T3-Fb; Thu, 31 Oct 2019 12:46:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TWW1=YY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iQ9q8-0003Sw-3q
 for xen-devel@lists.xen.org; Thu, 31 Oct 2019 12:46:12 +0000
X-Inumbo-ID: 696a3b0a-fbdc-11e9-9542-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 696a3b0a-fbdc-11e9-9542-12813bfff9fa;
 Thu, 31 Oct 2019 12:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572525970;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=cjegxeBXi/kkD4gCN1qputZzZXRv0oUPKXbeovAOBqQ=;
 b=cRCvGYO/sxUq7xHkTRkAFeryS6OSim5d/wievwNjNz1cMFauNwjo3gdC
 Nubd0wMbaT0+Avgosomth8DUa4s3+IBeglYJdwrSHW/IsaBiBTdua+Neh
 WUlxnMD5fg7Nox3VXV4H/iJ/m5CSW+IV4ZdQq65oRK0qQl+NKFDhui5Av g=;
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
IronPort-SDR: 0711Rc6vMBmVUWqWxe5dFE5y3EtXa1UnatV44nsLmAMRL/nTRngJ3m0h3ObeW9fEPuJkXCFODJ
 r4r9QhgkyAnAA2agIVpQX/mSn+ZFHJ9yd5x5M7Gi44VGIDi/7lx25CVKMuF+4lkQCDVeeTVMZa
 DUmEH9Ws3Gwftsy+8guHSq3TYdhLVxN7xhhtaE9uYXlh4Xu9fgy+ubEUMDQVJqOGPqB4KmTZUJ
 9OT1LX5YWSfzFf2mXoKtfq25/Cm4l3JOYbUN696lhotgrqPRctVBpOBL3DrEY3fm9ZH/9xDj9c
 XXs=
X-SBRS: 2.7
X-MesageID: 7775579
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,250,1569297600"; 
   d="scan'208";a="7775579"
To: Jan Beulich <jbeulich@suse.com>, Sergey Dyasli <sergey.dyasli@citrix.com>
References: <20191031105609.21819-1-sergey.dyasli@citrix.com>
 <932471f8-fbe3-de7b-f005-d7e036f2c936@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <e6c173a6-2357-0c69-387f-0db6ca739853@citrix.com>
Date: Thu, 31 Oct 2019 12:46:01 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <932471f8-fbe3-de7b-f005-d7e036f2c936@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v3 for 4.13] x86/e820: fix 640k - 1M region
 reservation logic
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
Cc: Juergen Gross <jgross@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xen.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzEvMTAvMjAxOSAxMTowNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMzEuMTAuMjAxOSAx
MTo1NiwgU2VyZ2V5IER5YXNsaSB3cm90ZToKPj4gLS0tIGEveGVuL2FyY2gveDg2L2NwdS9jb21t
b24uYwo+PiArKysgYi94ZW4vYXJjaC94ODYvY3B1L2NvbW1vbi5jCj4+IEBAIC0yNzQsNiArMjc0
LDE1IEBAIHN0YXRpYyBpbmxpbmUgdTMyIHBoeXNfcGtnX2lkKHUzMiBjcHVpZF9hcGljLCBpbnQg
aW5kZXhfbXNiKQo+PiAgCXJldHVybiBfcGh5c19wa2dfaWQoZ2V0X2FwaWNfaWQoKSwgaW5kZXhf
bXNiKTsKPj4gIH0KPj4gIAo+PiArLyoKPj4gKyAqIFNvbWV0aW1lcyBpdCdzIHRvbyBlYXJseSB0
byB1c2UgY3B1X2hhc19oeXBlcnZpc29yIHdoaWNoIGlzIGF2YWlsYWJsZSBvbmx5Cj4+ICsgKiBh
ZnRlciBlYXJseV9jcHVfaW5pdCgpLgo+PiArICovCj4+ICtib29sIF9faW5pdCBlYXJseV9jcHVf
aGFzX2h5cGVydmlzb3Iodm9pZCkKPj4gK3sKPj4gKwlyZXR1cm4gY3B1aWRfZWN4KDEpICYgY3B1
ZmVhdF9tYXNrKFg4Nl9GRUFUVVJFX0hZUEVSVklTT1IpOwo+PiArfQoKU3RhdGljIGlubGluZSBh
bG9uZ3NpZGUgdGhlIG90aGVyIGNwdWlkIGhlbHBlcnMgcGxlYXNlLsKgIFRoaXMgYXNzZW1ibGVz
CnRvIHNtYWxsZXIgdGhhbiB0aGUgY2FsbCByZXF1aXJlZCB0byBnZXQgdG8gYSBzZXBhcmF0ZSB0
cmFuc2xhdGlvbiB1bml0LgoKPiBPT0ksIGRpZCB5b3UgY29uc2lkZXIgaW50cm9kdWNpbmcgYSBt
b3JlIGdlbmVyYWwgZWFybHlfY3B1X2hhcygpLAo+IHdpdGggWDg2X0ZFQVRVUkVfKiBwYXNzZWQg
YXMgYW4gYXJndW1lbnQ/CgpUaGlzIGlzIGludGVyaW0gY29kZS7CoCBQZXJzb25hbGx5LCBJJ20g
c3RpbGwgZ28gd2l0aCB3aGF0IEkgc2FpZCBhdCB0aGUKdmVyeSBiZWdpbm5pbmcsIG9mIG9wZW5j
b2RpbmcgaXQganVzdCBpbiB0aGUgaHVuayBiZWxvdy4KCj4KPj4gQEAgLTMxOCw5ICszMTksMTAg
QEAgc3RhdGljIGludCBfX2luaXQgY29weV9lODIwX21hcChzdHJ1Y3QgZTgyMGVudHJ5ICogYmlv
c21hcCwgdW5zaWduZWQgaW50IG5yX21hcCkKPj4gIAo+PiAgICAgICAgICAvKgo+PiAgICAgICAg
ICAgKiBTb21lIEJJT1NlcyBjbGFpbSBSQU0gaW4gdGhlIDY0MGsgLSAxTSByZWdpb24uCj4+IC0g
ICAgICAgICAqIE5vdCByaWdodC4gRml4IGl0IHVwLgo+PiArICAgICAgICAgKiBOb3QgcmlnaHQu
IEZpeCBpdCB1cCwgYnV0IG9ubHkgd2hlbiBydW5uaW5nIG9uIGJhcmUgbWV0YWwuCj4+ICAgICAg
ICAgICAqLwo+PiAtICAgICAgICBpZiAodHlwZSA9PSBFODIwX1JBTSkgewo+PiArICAgICAgICBp
ZiAoICFlYXJseV9jcHVfaGFzX2h5cGVydmlzb3IoKSAmJiB0eXBlID09IEU4MjBfUkFNICkKPj4g
KyAgICAgICAgewo+PiAgICAgICAgICAgICAgaWYgKHN0YXJ0IDwgMHgxMDAwMDBVTEwgJiYgZW5k
ID4gMHhBMDAwMFVMTCkgewo+PiAgICAgICAgICAgICAgICAgIGlmIChzdGFydCA8IDB4QTAwMDBV
TEwpCj4+ICAgICAgICAgICAgICAgICAgICAgIGFkZF9tZW1vcnlfcmVnaW9uKHN0YXJ0LCAweEEw
MDAwVUxMLXN0YXJ0LCB0eXBlKTsKPiBTZWVpbmcgb3JpZ2luYWwgbGluZSBhbmQgbG93ZXIgY29u
dGV4dCAtIGFyZW4ndCB5b3UgY29ycnVwdGluZwo+IHByZXZpb3VzbHkgcmVhc29uYWJseSBjb25z
aXN0ZW50IChMaW51eCkgc3R5bGUgaGVyZT8gKFRoaXMgY291bGQKPiBiZSBlYXNpbHkgdGFrZW4g
Y2FyZSBvZiB3aGlsZSBjb21taXR0aW5nLCBidXQgSSdkIGZpcnN0IGxpa2UgdGhlCj4gcG9pbnQg
YmVsb3cgYmUgY2xhcmlmaWVkLikKPgo+PiAtLS0gYS94ZW4vYXJjaC94ODYvbW0uYwo+PiArKysg
Yi94ZW4vYXJjaC94ODYvbW0uYwo+PiBAQCAtNTk0Myw3ICs1OTQzLDcgQEAgY29uc3Qgc3RydWN0
IHBsYXRmb3JtX2JhZF9wYWdlICpfX2luaXQgZ2V0X3BsYXRmb3JtX2JhZHBhZ2VzKHVuc2lnbmVk
IGludCAqYXJyYXkKPj4gICAgICBjYXNlIDB4MDAwODA2ZTA6IC8qIGVycmF0dW0gS0JMPz8/ICov
Cj4+ICAgICAgY2FzZSAweDAwMDkwNmUwOiAvKiBlcnJhdGEgS0JMPz8/IC8gS0JXMTE0IC8gQ0ZX
MTAzICovCj4+ICAgICAgICAgICphcnJheV9zaXplID0gKGNwdWlkX2VheCgwKSA+PSA3ICYmCj4+
IC0gICAgICAgICAgICAgICAgICAgICAgICEoY3B1aWRfZWN4KDEpICYgY3B1ZmVhdF9tYXNrKFg4
Nl9GRUFUVVJFX0hZUEVSVklTT1IpKSAmJgo+PiArICAgICAgICAgICAgICAgICAgICAgICAhZWFy
bHlfY3B1X2hhc19oeXBlcnZpc29yKCkgJiYKPiBTdHJpY3RseSBzcGVha2luZyB0aGlzIG1ha2Vz
IGNsZWFyIHRoYXQgaW4gZWFybHlfY3B1X2hhc19oeXBlcnZpc29yKCkKPiB5b3Ugc2hvdWxkIGFs
c28gY2hlY2sgY3B1aWRfZWF4KDApID49IDEuIFdlIGRvbid0IGN1cnJlbnRseSBzZWVtIHRvCj4g
b2JqZWN0IHRvIHJ1bm5pbmcgb24gYSBzeXN0ZW0gd2l0aCBvbmx5IGJhc2ljIGxlYWYgMCBhdmFp
bGFibGUgKHdlCj4gZG8gb2JqZWN0IHRvIHRoZXJlIG5vdCBiZWluZyBleHRlbmRlZCBsZWFmIDEp
LiBBbmRyZXcsIGRvIHlvdSBoYXZlCj4gYW55IGNsZWFyIG9waW5pb24gb25lIHdheSBvciB0aGUg
b3RoZXI/CgpCeSB0aGUgdGltZSB3ZSBhcmUgcnVubmluZyBpbiBDLCB3ZSBrbm93IHRoZSBDUFUg
YWN0dWFsbHkgaGFzIGxvbmcgbW9kZQphbmQgdGhlcmVmb3JlIG1heF9sZWFmID4gNCg/KSBhbmQg
bWF4X2V4dGRfbGVhZiA+PSAweDgwMDAwMDA4CgpJIGRvbid0IHNlZSBhbnkgdmFsdWUgaW4gbm90
IHJlbHlpbmcgb24gdGhpcyBwcm9wZXJ0eSwgYW5kIGEgY29zdCAoZXh0cmEKYnJhbmNoZXMpIHRv
IG5vdCByZWx5aW5nIG9uIGl0LgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
