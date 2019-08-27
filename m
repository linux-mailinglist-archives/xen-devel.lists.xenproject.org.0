Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A18F9EB81
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2019 16:50:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2ckf-0002Js-3F; Tue, 27 Aug 2019 14:47:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ssFz=WX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i2ckd-0002Jn-Cm
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2019 14:47:15 +0000
X-Inumbo-ID: 8ebb367e-c8d9-11e9-ae35-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8ebb367e-c8d9-11e9-ae35-12813bfff9fa;
 Tue, 27 Aug 2019 14:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566917234;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=4pK/pGvKvSZRlg8LShCGFPkwAJhUylcrwZSeLuUhIfA=;
 b=MmB9MO1u0CLr5FGsPoTAKm+jbtqJfW5pPSLXxpsTNM3yH8m5N3OdlZSt
 lNJmjCBYQAbc7GQVzao5/3y0YYCDushVPOAIEE8j2/nsZoVCpZhDYVxx4
 YXMeRu/UiplJBx30t0Z0u4LajzS5U3Bio24Rz17e9YQW7bx9J+TJxKW5+ I=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Sq7MbSODRgI7ME0GnhFq/IeswxK3ceeyWuWP1d/90f3uq2U1KO7ybB0hIMj9D3DAoCLPgUUxnP
 i6xJBL49j3IFrUM4jgjSkJrBkuO+/3eQcnuKlutX3Z45JFiw1BhNPeFgllRF8dsW/7LgdzdMkL
 gDNOCLD8Hx4uMX+khwV9O/GEAaZFuBXTKA4llJnTcy6dpjVO9+dUoC/9CLbwHHUp8G32SyYzKM
 w/eFv3zHbTf1o8QpNXsbu1HHGLrpBUaEp0YVThHqiUyUQblAelTtEd+7bM69oScIXV6ORd7ck5
 FVg=
X-SBRS: 2.7
X-MesageID: 4764127
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,437,1559534400"; 
   d="scan'208";a="4764127"
To: Jan Beulich <JBeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <2d69ac51-9c4a-96f9-fd37-578658076571@suse.com>
 <3008be8e-a5ee-7e90-6ab0-daf44ee71d44@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <06684b85-6500-6066-d282-97ef4c0d1923@citrix.com>
Date: Tue, 27 Aug 2019 15:47:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3008be8e-a5ee-7e90-6ab0-daf44ee71d44@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 2/6] x86emul: support WBNOINVD
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
Cc: Paul Durrant <Paul.Durrant@citrix.com>, Wei Liu <wl@xen.org>,
 RogerPau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEvMDcvMjAxOSAxMjo1NiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gUmV2IDAzNSBvZiBJbnRl
bCdzIElTQSBleHRlbnNpb25zIGRvY3VtZW50IGRvZXMgbm90IHN0YXRlIGludGVyY2VwdAo+IGJl
aGF2aW9yIGZvciB0aGUgaW5zbiAoSSd2ZSBiZWVuIGluLW9mZmljaWFsbHkgdG9sZCB0aGF0IHRo
ZSBkaXN0aW5jdGlvbgoKdW5vZmZpY2lhbGx5LgoKPiBpcyBnb2luZyB0byBiZSBieSBleGl0IHF1
YWxpZmljYXRpb24sIGFzIEkgd291bGQgaGF2ZSBhc3N1bWVkCj4gY29uc2lkZXJpbmcgdGhhdCB0
aGlzIHdheSBpdCdzIHN1ZmZpY2llbnRseSB0cmFuc3BhcmVudCB0byB1bmF3YXJlCj4gc29mdHdh
cmUsIGFuZCB1c2luZyBXQklOVkQgaW4gcGxhY2Ugb2YgV0JOT0lOVkQgaXMgYWx3YXlzIGNvcnJl
Y3QsIGp1c3QKPiBsZXNzIGVmZmljaWVudCksIHNvIGluIHRoZSBIVk0gY2FzZSBmb3Igbm93IGl0
J2xsIGJlIGJhY2tlZCBieSB0aGUgc2FtZQo+IC0+d2JpbnZkX2ludGVyY2VwdCgpIGhhbmRsZXJz
LgoKSXQgdHVybnMgb3V0IHRoYXQgQU1EIHJldXNlcyB0aGUgV0JJTlZEIHZtZXhpdCBjb2RlIGZv
ciBXQk5PSU5WRCwgYW5kCnByb3ZpZGUgbm8gZGlzdGluZ3Vpc2hpbmcgaW5mb3JtYXRpb24uwqAg
VGhlcmUgbWF5IG9yIG1heSBub3QgYmUgYW4KaW5zdHJ1Y3Rpb24gc3RyZWFtIHRvIGluc3BlY3Qs
IGRlcGVuZGluZyBvbiBvdGhlciBlcnJhdGEuCgpJIGhhdmUgYSBxdWVzdGlvbiBvdXQgd2l0aCBB
TUQgYXMgdG8gd2hhdCB0byBkbyBoZXJlLCBidXQgaW4gdGhlCm1lYW50aW1lIHdlIGhhdmUgbm8g
b3B0aW9uIGJ1dCB0byBhc3N1bWUgV0JJTlZELgoKPiAtLS0gYS94ZW4vYXJjaC94ODYvcHYvZW11
bC1wcml2LW9wLmMKPiArKysgYi94ZW4vYXJjaC94ODYvcHYvZW11bC1wcml2LW9wLmMKPiBAQCAt
MTEyMSw3ICsxMTIxLDcgQEAgc3RhdGljIGludCB3cml0ZV9tc3IodW5zaWduZWQgaW50IHJlZywg
dQo+IEBAIC0xMTMwLDYgKzExMzAsOCBAQCBzdGF0aWMgaW50IGNhY2hlX29wKGVudW0geDg2ZW11
bF9jYWNoZV9vCj4gICAgICAgICAgICAqIG5ld2VyIGxpbnV4IHVzZXMgdGhpcyBpbiBzb21lIHN0
YXJ0LW9mLWRheSB0aW1pbmcgbG9vcHMuCj4gICAgICAgICAgICAqLwo+ICAgICAgICAgICA7Cj4g
KyAgICBlbHNlIGlmICggb3AgPT0geDg2ZW11bF93Ym5vaW52ZCAmJiBjcHVfaGFzX3dibm9pbnZk
ICkKPiArICAgICAgICB3Ym5vaW52ZCgpOwo+ICAgICAgIGVsc2UKPiAgICAgICAgICAgd2JpbnZk
KCk7CgpUaGUgY3B1X2hhc193Ym5vaW52ZCBjaGVjayBpc24ndCBuZWNlc3NhcnkuwqAgVGhlIGVu
Y29kaW5nIHdhcyBjaG9zZW4KYmVjYXVzZSBpdCBkb2VzIGdldCBpbnRlcnByZXRlZCBhcyB3Ymlu
dmQgb24gb2xkZXIgcHJvY2Vzc29ycy4KCkdpdmVuIHRoaXMgcHJvcGVydHksIEkgZXhwZWN0IGtl
cm5lbHMgdG8gcGVyZm9ybSBhIGJsYW5rZWQKcy93YmludmQvd2Jub2ludmQvIHRyYW5zZm9ybWF0
aW9uIGluIGFwcHJvcHJpYXRlIGxvY2F0aW9ucywgYmVjYXVzZSBpdAppcyB0aGUgbG93ZXN0IG92
ZXJoZWFkIG9wdGlvbiB0byBzdGFydCB1c2luZyB0aGlzIG5ldyBmZWF0dXJlLgoKPiAtLS0gYS94
ZW4vaW5jbHVkZS9hc20teDg2L3N5c3RlbS5oCj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9z
eXN0ZW0uaAo+IEBAIC0xNiw2ICsxNiwxMSBAQCBzdGF0aWMgaW5saW5lIHZvaWQgd2JpbnZkKHZv
aWQpCj4gICAgICAgYXNtIHZvbGF0aWxlICggIndiaW52ZCIgOjo6ICJtZW1vcnkiICk7Cj4gICB9
Cj4gICAKPiArc3RhdGljIGlubGluZSB2b2lkIHdibm9pbnZkKHZvaWQpCj4gK3sKPiArICAgIGFz
bSB2b2xhdGlsZSAoICJyZXBlOyB3YmludmQiIDogOiA6ICJtZW1vcnkiICk7CgpTZW1pY29sb24u
Cgo+ICt9Cj4gKwo+ICAgc3RhdGljIGlubGluZSB2b2lkIGNsZmx1c2goY29uc3Qgdm9pZCAqcCkK
PiAgIHsKPiAgICAgICBhc20gdm9sYXRpbGUgKCAiY2xmbHVzaCAlMCIgOjogIm0iICgqKGNvbnN0
IGNoYXIgKilwKSApOwo+IC0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9hcmNoLXg4Ni9jcHVmZWF0
dXJlc2V0LmgKPiArKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC14ODYvY3B1ZmVhdHVyZXNl
dC5oCj4gQEAgLTI0Myw2ICsyNDQsNyBAQCBYRU5fQ1BVRkVBVFVSRShFRlJPLCAgICAgICAgICA3
KjMyKzEwKSAvCj4gICAKPiAgIC8qIEFNRC1kZWZpbmVkIENQVSBmZWF0dXJlcywgQ1BVSUQgbGV2
ZWwgMHg4MDAwMDAwOC5lYngsIHdvcmQgOCAqLwo+ICAgWEVOX0NQVUZFQVRVUkUoQ0xaRVJPLCAg
ICAgICAgOCozMisgMCkgLypBICBDTFpFUk8gaW5zdHJ1Y3Rpb24gKi8KPiArWEVOX0NQVUZFQVRV
UkUoV0JOT0lOVkQsICAgICAgOCozMisgOSkgLypBICBXQk5PSU5WRCBpbnN0cnVjdGlvbiAqLwoK
VGhpcyBpcyBpbXBsaWNpdGx5IGxpbmtlZCB3aXRoIENQVUlELjgwMDAwMDFkIHdoaWNoIHdlIGRv
bid0IGV4cG9zZSB5ZXQuCgpUbyBnZXQgdGhlIGVtdWxhdGlvbiBzaWRlIG9mIHRoaW5ncyBzb3J0
ZWQsIEknZCBiZSBoYXBweSB3aXRoIHRoaXMgZ29pbmcKaW4gd2l0aG91dCB0aGUgQSBmb3Igbm93
LCBhbmQgImV4cG9zaW5nIFdCTk9JTlZEIHRvIGd1ZXN0cyIgY2FuIGJlIGEKZm9sbG93dXAgdGFz
ay4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
