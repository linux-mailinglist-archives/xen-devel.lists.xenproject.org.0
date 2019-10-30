Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7004EA25E
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2019 18:16:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPrXA-0007Xe-KW; Wed, 30 Oct 2019 17:13:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Sl5I=YX=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1iPrX8-0007XZ-JF
 for xen-devel@lists.xen.org; Wed, 30 Oct 2019 17:13:22 +0000
X-Inumbo-ID: 8be1a411-fb38-11e9-9532-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8be1a411-fb38-11e9-9532-12813bfff9fa;
 Wed, 30 Oct 2019 17:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572455590;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=FeYwB7OTbTg2yiGsBzWxFpe5hl9sOZU0efG2jxwiFmI=;
 b=CPL50ZuOKQyLjyWPLkr5TRFGnogsCisgbQTXRWYS0iNM32m2u41XRNqg
 Xzq1bwlT8JeFtaWPYN/J2acQ3KWkoHCe5QQ0mn0eQuMzCM2jmMgIDdw9o
 tHm72xg7pAiqC33U/zOfh1NOvYMKQ324wwLmv0eacT8n8IVJFYxBd+2Nc 4=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=sergey.dyasli@citrix.com;
 spf=Pass smtp.mailfrom=sergey.dyasli@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 sergey.dyasli@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 sergey.dyasli@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 7jSpnIa08ylpyMCiyKzOb5EnR/GWpWMHEgNcurENvenzSXGXzgGsTkFWyZnBa6Ha+HkzQlZW28
 Su+ZYPYtzHcJZdiZI/jV0RNu1+VceZXBeOO7IEQA+bO1/mhNinAXIxLtuHVM2dodLNjRV3ACba
 RutwAdbE/zg2ZMk7bOuscrhylAVV8PO5hUqEekK8RiBRkVUY3NOy2oeVXYMEgwF7+0v1dvWufP
 vpQpyYmsd07fChVDycNVqD/kYJHQQnBNe4L5euQn5BBUMgB2R8k9kZeyWLlHUx7scbxwGafeMt
 3Ek=
X-SBRS: 2.7
X-MesageID: 7960817
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,248,1569297600"; 
   d="scan'208";a="7960817"
To: Jan Beulich <jbeulich@suse.com>
References: <20191030145447.11122-1-sergey.dyasli@citrix.com>
 <6856c427-0b9a-8e77-b087-9d0751472a36@suse.com>
From: Sergey Dyasli <sergey.dyasli@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=sergey.dyasli@citrix.com; keydata=
 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
Message-ID: <1d46878e-8507-5450-ecad-ae3e7cfa9335@citrix.com>
Date: Wed, 30 Oct 2019 17:13:01 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <6856c427-0b9a-8e77-b087-9d0751472a36@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 for 4.13 1/2] x86/boot: allow early usage
 of cpu_has_hypervisor
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
Cc: Juergen Gross <jgross@suse.com>, "sergey.dyasli@citrix.com >> Sergey
 Dyasli" <sergey.dyasli@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xen.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAvMTAvMjAxOSAxNTozMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMzAuMTAuMjAxOSAx
NTo1NCwgU2VyZ2V5IER5YXNsaSB3cm90ZToKPj4gQEAgLTMxNywxMSArMzE2LDYgQEAgdm9pZCBf
X2luaXQgZWFybHlfY3B1X2luaXQodm9pZCkKPj4gIAljLT54ODZfY2FwYWJpbGl0eVtjcHVmZWF0
X3dvcmQoWDg2X0ZFQVRVUkVfRlBVKV0gPSBlZHg7Cj4+ICAJYy0+eDg2X2NhcGFiaWxpdHlbY3B1
ZmVhdF93b3JkKFg4Nl9GRUFUVVJFX1NTRTMpXSA9IGVjeDsKPj4gIAo+PiAtCXByaW50ayhYRU5M
T0dfSU5GTwo+PiAtCSAgICAgICAiQ1BVIFZlbmRvcjogJXMsIEZhbWlseSAldSAoJSN4KSwgTW9k
ZWwgJXUgKCUjeCksIFN0ZXBwaW5nICV1IChyYXcgJTA4eClcbiIsCj4+IC0JICAgICAgIHg4Nl9j
cHVpZF92ZW5kb3JfdG9fc3RyKGMtPng4Nl92ZW5kb3IpLCBjLT54ODYsIGMtPng4NiwKPj4gLQkg
ICAgICAgYy0+eDg2X21vZGVsLCBjLT54ODZfbW9kZWwsIGMtPng4Nl9tYXNrLCBlYXgpOwo+IAo+
IEknbSBzbGlnaHRseSBjb25jZXJuZWQgb2YgdGhlIGNvZGUgaW1tZWRpYXRlbHkgYWhlYWQgb2Yg
dGhpcwo+IHByaW50aygpIG5vdyBydW5uaW5nIF9tdWNoXyBlYXJsaWVyLiBEaWQgeW91IGluc3Bl
Y3QgdGhhdCB0aGVyZSdzCj4gbm8gY2hhbmdlIG9mIHRoZSByZWxldmFudCBjbGVhcmVkX2NhcHNb
XSBlbnRyaWVzIGJldHdlZW4gdGhlIG5ldwo+IGFuZCB0aGUgb2xkIGNhbGwgcG9zaXRpb24gaW4g
c2V0dXAuYz8KCllvdSBhcmUgcmlnaHQsIHRoaXMgaWRlYSByZXF1aXJlcyBhIG1vcmUgc29waGlz
dGljYXRlZCBhcHByb2FjaC4KUGxlYXNlIGRpc3JlZ2FyZCB0aGlzIHBhdGNoLiBGb3Igbm93IEkn
bGwgYWRkIHNvbWV0aGluZyBsaWtlCmVhcmx5X2NwdV9oYXNfaHlwZXJ2aXNvcigpLiBXaWxsIHNl
bmQgYSB2MyBzb29uLgoKLS0KVGhhbmtzLApTZXJnZXkKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
