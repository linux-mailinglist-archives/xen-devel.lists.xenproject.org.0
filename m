Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CEA511E578
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 15:22:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iflmy-000394-P5; Fri, 13 Dec 2019 14:19:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=B4Jk=2D=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iflmx-00038y-0N
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 14:19:27 +0000
X-Inumbo-ID: 906e9ab9-1db3-11ea-8f15-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 906e9ab9-1db3-11ea-8f15-12813bfff9fa;
 Fri, 13 Dec 2019 14:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576246766;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Q8OYBslGCjdUsKcF8m+cNkilcyQ44GOxwsL4kA/4j/w=;
 b=KGmrvb0MhHQzauezSQEoo/G3SXqCWxTuyJICtOot45uTZNZfge9RnWli
 BL6Gnyw73ytyKPQ+wR35AZOT36rXA26QIsBMFpsRGg3ioSN85OYhW0joe
 mUj4DvRx0qAfnLh74TlgVEXLwoXDvaby003MS/8/pjZWvNzNAXM0KGwtR s=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: h0nO1P4/MKV7JmYqz2/IAuE/Nh9Qy4tcS5RDe9Eq5zmV0sk+ymE4NwK7Lq6aZV2PVmw8BE2h3L
 4Lx6RqxVgZwa9TQ0FXyVJKisSgQGNJfwd/+gK+MUGLN1tewfYbXapol9nS2gst0VFHIE/V4iWn
 w5jlk90Mgz16QzL2wZLLIhwf83QchL8/C69jp8kgJEP2C+KwtsFFEV2I6+a5eS146DStKq/Gvz
 DIJz2h/3n/slM3Y1FpqbOoF5nPdqOo27eIKj5TDvkXvWMELtSQjc61ha+PXSB/Z2ritorC/39/
 bYc=
X-SBRS: 2.7
X-MesageID: 10061148
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,309,1571716800"; d="scan'208";a="10061148"
To: Hongyan Xia <hongyxia@amazon.com>, <xen-devel@lists.xenproject.org>
References: <cover.1576154413.git.hongyxia@amazon.com>
 <77acf62cab293ae99bd1fc079e1b0853faaf1242.1576154413.git.hongyxia@amazon.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <2717096f-21d7-f184-b606-a3defffad847@citrix.com>
Date: Fri, 13 Dec 2019 14:19:19 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <77acf62cab293ae99bd1fc079e1b0853faaf1242.1576154413.git.hongyxia@amazon.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v4 1/2] x86/mm: factor out the code for
 shattering an l3 PTE
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
Cc: jgrall@amazon.com, Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIvMTIvMjAxOSAxMjo0NiwgSG9uZ3lhbiBYaWEgd3JvdGU6Cj4gZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL3g4Ni9tbS5jIGIveGVuL2FyY2gveDg2L21tLmMKPiBpbmRleCA3ZDRkZDgwYTg1Li44
ZGVmNGZiOGQ4IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS5jCj4gKysrIGIveGVuL2Fy
Y2gveDg2L21tLmMKPiBAQCAtNTE1MSw2ICs1MTUxLDUyIEBAIGwxX3BnZW50cnlfdCAqdmlydF90
b194ZW5fbDFlKHVuc2lnbmVkIGxvbmcgdikKPiAgICAgICAgICAgICAgICAgICAgICAgICAgIGZs
dXNoX2FyZWFfbG9jYWwoKGNvbnN0IHZvaWQgKil2LCBmKSA6IFwKPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGZsdXNoX2FyZWFfYWxsKChjb25zdCB2b2lkICopdiwgZikpCj4gIAo+ICsvKiBT
aGF0dGVyIGFuIGwzIGVudHJ5IGFuZCBwb3B1bGF0ZSBsMi4gSWYgdmlydCBpcyBwYXNzZWQgaW4s
IGFsc28gZG8gZmx1c2guICovCj4gK3N0YXRpYyBib29sIHNoYXR0ZXJfbDNlKGwzX3BnZW50cnlf
dCAqcGwzZSwgdW5zaWduZWQgbG9uZyB2aXJ0LCBib29sIGxvY2tpbmcpCj4gK3sKPiArICAgIHVu
c2lnbmVkIGludCBpOwo+ICsgICAgbDNfcGdlbnRyeV90IG9sM2UgPSAqcGwzZTsKPiArICAgIGwy
X3BnZW50cnlfdCBsMmUgPSBsMmVfZnJvbV9pbnRwdGUobDNlX2dldF9pbnRwdGUob2wzZSkpOwo+
ICsgICAgbDJfcGdlbnRyeV90ICpsMnQgPSBhbGxvY194ZW5fcGFnZXRhYmxlKCk7Cj4gKwo+ICsg
ICAgaWYgKCAhbDJ0ICkKPiArICAgICAgICByZXR1cm4gZmFsc2U7Cj4gKwo+ICsgICAgZm9yICgg
aSA9IDA7IGkgPCBMMl9QQUdFVEFCTEVfRU5UUklFUzsgaSsrICkKPiArICAgIHsKPiArICAgICAg
ICBsMmVfd3JpdGUobDJ0ICsgaSwgbDJlKTsKPiArICAgICAgICBsMmUgPSBsMmVfZnJvbV9pbnRw
dGUoCj4gKyAgICAgICAgICAgICAgICAgIGwyZV9nZXRfaW50cHRlKGwyZSkgKyAoUEFHRV9TSVpF
IDw8IFBBR0VUQUJMRV9PUkRFUikpOwo+ICsgICAgfQo+ICsKPiArICAgIGlmICggbG9ja2luZyAp
Cj4gKyAgICAgICAgc3Bpbl9sb2NrKCZtYXBfcGdkaXJfbG9jayk7Cj4gKyAgICBpZiAoIChsM2Vf
Z2V0X2ZsYWdzKCpwbDNlKSAmIF9QQUdFX1BSRVNFTlQpICYmCj4gKyAgICAgICAgIChsM2VfZ2V0
X2ZsYWdzKCpwbDNlKSAmIF9QQUdFX1BTRSkgKQo+ICsgICAgewo+ICsgICAgICAgIGwzZV93cml0
ZV9hdG9taWMocGwzZSwKPiArICAgICAgICAgICAgbDNlX2Zyb21fcGFkZHIodmlydF90b19tYWRk
cihsMnQpLCBfX1BBR0VfSFlQRVJWSVNPUikpOwo+ICsgICAgICAgIGwydCA9IE5VTEw7Cj4gKyAg
ICB9Cj4gKyAgICBpZiAoIGxvY2tpbmcgKQo+ICsgICAgICAgIHNwaW5fdW5sb2NrKCZtYXBfcGdk
aXJfbG9jayk7Cj4gKwo+ICsgICAgaWYgKCB2aXJ0ICkKPiArICAgIHsKPiArICAgICAgICB1bnNp
Z25lZCBpbnQgZmx1c2hfZmxhZ3MgPQo+ICsgICAgICAgICAgICBGTFVTSF9UTEIgfCBGTFVTSF9P
UkRFUigyICogUEFHRVRBQkxFX09SREVSKTsKPiArCj4gKyAgICAgICAgaWYgKCBsM2VfZ2V0X2Zs
YWdzKG9sM2UpICYgX1BBR0VfR0xPQkFMICkKPiArICAgICAgICAgICAgZmx1c2hfZmxhZ3MgfD0g
RkxVU0hfVExCX0dMT0JBTDsKCkFub3RoZXIgcHJvYmxlbWF0aWMgdXNlIG9mIG9sM2Ugd2hpY2gg
aXMgcmFjeSBvbiBjb25mbGljdC7CoCBZb3UgbmVlZCB0bwpzdHJpY3RseSB1c2UgdGhlIGNvbnRl
bnQgb2YgKnBsM2UgZnJvbSB3aXRoaW4gdGhlIGxvY2tlZCByZWdpb24uCgpIb3dldmVyLCB3aHkg
aGF2ZSB5b3UgbW92ZWQgdGhlIGZsdXNoaW5nIGluIGhlcmU/wqAgT25seSBvbmUgb2YgdGhlIHR3
bwpjYWxsZXJzIGFjdHVhbGx5IHdhbnRlZCBpdCwgYW5kIGV2ZW4gdGhlbiBJJ20gbm90IHRvdGFs
bHkgc3VyZSBpdCBpcwpuZWNlc3NhcnkuCgpCb3RoIGNhbGxlcnMgb3BlcmF0ZSBvbiBhbiBhcmJp
dHJhcnkgcmFuZ2Ugb2YgYWRkcmVzc2VzLCBhbmQgZm9yCmFueXRoaW5nIG90aGVyIHRoYW4gYSBz
aW5nbGV0b24gdXBkYXRlLCB3aWxsIHdhbnQgdG8gaXNzdWUgYSBzaW5nbGUKZmx1c2ggYXQgdGhl
IGVuZCwgcmF0aGVyIHRoYW4gYSBzcGF0ZSBvZiBmbHVzaGVzIGZvciBzdWItYXJlYXMuCgooQWx0
aG91Z2ggc29tZW9uZSByZWFsbHkgcGxlYXNlIGNoZWNrIG15IHJlYXNvbmluZyBoZXJlIGZvciB0
aGUKbWFwX3BhZ2VzX3RvX3hlbigpIGNhc2Ugd2hpY2ggY3VycmVudGx5IGRvZXMgaGF2ZSBzdWIt
YXJlYSBmbHVzaGluZy4pCgpFaXRoZXIgdGhlIGZsdXNoIHdhbnRzIGRyb3BwaW5nIChhbmQgYmVz
dCB2aWEgYSBwcmVyZXEgcGF0Y2ggYWx0ZXJpbmcKbWFwX3BhZ2VzX3RvX3hlbigpKSwgb3IgeW91
IG5lZWQgdG8gY2FjaGUgb2wzZSBpbiB0aGUgbG9ja2VkIHJlZ2lvbiB3aXRoCkFDQ0VTU19PTkNF
KCkgb3IgZXF1aXZhbGVudC4KCj4gKyAgICAgICAgZmx1c2hfYXJlYSh2aXJ0LCBmbHVzaF9mbGFn
cyk7Cj4gKyAgICB9Cj4gKwo+ICsgICAgaWYgKCBsMnQgKQo+ICsgICAgICAgIGZyZWVfeGVuX3Bh
Z2V0YWJsZShsMnQpOwoKTWluZCBhbm5vdGF0aW5nIHRoaXMgYXM6CgrCoMKgwqAgaWYgKCBsMnQg
KSAvKiBSYWNlZCBvbiB0cnlpbmcgdG8gc2hhdHRlcj/CoCBUaHJvdyBhd2F5IG91ciB3b3JrLiAq
LwoKdG8gaGlnaGxpZ2h0IHRoYXQgdGhpcyBpcyBhbiBlcnJvciBwYXRoLCBhbmQgdGhlcmUgaXMg
bm8gY29ubmVjdGlvbgpiZXR3ZWVuIHRoZSBUTEIgZmx1c2hpbmcgYW5kIHBhZ2V0YWJsZSBmcmVl
aW5nLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
