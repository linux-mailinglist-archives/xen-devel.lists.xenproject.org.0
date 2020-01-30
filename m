Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBFC14DAEF
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 13:47:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ix9BW-00080T-Hf; Thu, 30 Jan 2020 12:44:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Q1Hx=3T=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1ix9BV-00080O-9v
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 12:44:37 +0000
X-Inumbo-ID: 4568af43-435e-11ea-8a47-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4568af43-435e-11ea-8a47-12813bfff9fa;
 Thu, 30 Jan 2020 12:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580388276;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=TdJQiEIT7f81rOy+en2NUwGPnY837+PTewxXMY2sNe8=;
 b=HTP6/7As2ZnqBq3YuPokverEwU7QMKDBuvvVKryAxnMrwbyyHvOsdRNw
 jA6O33poWLkLwI45xtfxGFyG89X3tMsOTlgNcKoAPQRHCxiYp2Cc6AUAk
 KmuHgD5hq2C0+Ox7Co7azmmJFxGWViKC05wRPA03s9syXkb2yEtVzwfOk s=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: kVyJx2F1lEctrHVWptclmBBBGKe0TkuOkTlao5t+Op5rH493fXaedTUI6YhGK2u8zFemNYXhpW
 +oW8eBSnWIXsLOS7H33YR2UTD7qell+c072QNZ+8ufRaBtYjzLbeRw+3zu/Zw8hAN/dnICoV1T
 Mba3ARMlUF7oNObRXnbEpAylbRBbb9KHQqBZ5Mqj0ygZiA7rviuwi+2WFx+fw3ebRkT1I4nlcp
 BB76n0SXYNVKl7nv82shN+udMifmIJxKEhPJV1/ccZ7YV7SIc7bppOzVxHeOc4F7JVtXORp0iO
 tGk=
X-SBRS: 2.7
X-MesageID: 12288024
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,382,1574139600"; d="scan'208";a="12288024"
Date: Thu, 30 Jan 2020 12:44:31 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Message-ID: <20200130124431.GO1288@perard.uk.xensource.com>
References: <20200129121235.1814563-1-anthony.perard@citrix.com>
 <20200129121235.1814563-5-anthony.perard@citrix.com>
 <20200130091251.GB4679@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200130091251.GB4679@Air-de-Roger>
Subject: Re: [Xen-devel] [PATCH 4/5] OvmfPkg/XenPlatformPei: Calibrate APIC
 timer frequency
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
Cc: Julien Grall <julien@xen.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>, devel@edk2.groups.io,
 Liming Gao <liming.gao@intel.com>,
 Michael D Kinney <michael.d.kinney@intel.com>, xen-devel@lists.xenproject.org,
 Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKYW4gMzAsIDIwMjAgYXQgMTA6MTI6NTFBTSArMDEwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBXZWQsIEphbiAyOSwgMjAyMCBhdCAxMjoxMjozNFBNICswMDAwLCBBbnRo
b255IFBFUkFSRCB3cm90ZToKPiA+ICsgIFBhcmFtZXRlcnMuZG9taWQgPSBET01JRF9TRUxGOwo+
ID4gKyAgUGFyYW1ldGVycy5ncGZuID0gKFVJTlROKSBQYWdlUHRyID4+IEVGSV9QQUdFX1NISUZU
Owo+ID4gKyAgUmV0dXJuQ29kZSA9IFhlbkh5cGVyY2FsbE1lbW9yeU9wIChYRU5NRU1fcmVtb3Zl
X2Zyb21fcGh5c21hcCwgJlBhcmFtZXRlcnMpOwo+IAo+IEknbSBhZnJhaWQgdGhpcyB3aWxsIGxl
YXZlIGEgaG9sZSBpbiB0aGUgcDJtLCBhbmQgaGVuY2UgZnJlZWluZyB0aGUKPiBwYWdlIGJhY2sg
dG8gT1ZNRiBpcyB3cm9uZyAoSSBhc3N1bWUgdGhpcyBpcyB3aGF0IEZyZWVQYWdlcyBkb2VzIGlu
Cj4gQ2FsaWJyYXRlTGFwaWNUaW1lciksIGFzIHRoZSBwaHlzaWNhbCBhZGRyZXNzIHdvdWxkIGJl
IHVucG9wdWxhdGVkCj4gYWZ0ZXIgdGhlIGNhbGwgdG8gWEVOTUVNX3JlbW92ZV9mcm9tX3BoeXNt
YXAuCgpJIGd1ZXNzIHRoZXJlJ3MgbW9yZSByZWZhY3RvcmluZyB0byBkbyBpbiBPVk1GLCB0aGVy
ZSBhcmUgb3RoZXIncyBvZgp0aGlzIGtpbmQgb2YgY2FsbCwgbW9zdGx5IGluIHRoZSBQViBkcml2
ZXJzLCBYZW5CdXNEeGUuCgo+ID4gKwo+ID4gKyAgU2hhcmVkSW5mbyA9IEFsbG9jYXRlUGFnZXMg
KDEpOwo+IAo+IEhtLCBpdCdzIG5vdCB0aGUgYmVzdCBhcHByb2FjaCB0byB1c2UgYSByZWd1bGFy
IG1lbW9yeSBwYWdlIHRvIG1hcCB0aGUKPiBzaGFyZWQgaW5mbzogbWFwcGluZyBpdCBpcyB2ZXJ5
IGxpa2VseSB0byBjYXVzZSBzdXBlcnBhZ2Ugc2hhdHRlcmluZywKPiBhbmQgb25jZSB1bm1hcHBl
ZCBpdCBsZWF2ZXMgYSBob2xlIGluIHRoZSBwMm0uCgo6LSgKCj4gQXMgYSByZWZlcmVuY2UgeW91
IGNvdWxkIG1hcCB0aGUgc2hhcmVkIGluZm8gcGFnZSBhdCBtYXhpbXVtIHBoeXNpY2FsCj4gYWRk
cmVzcyBhbGxvd2VkIChhZnRlciBjaGVja2luZyBpdCdzIG5vdCBwb3B1bGF0ZWQpIGxpa2UgV2Vp
IGlzIGRvaW5nCj4gZm9yIHRoZSBYZW4gb24gSHlwZXJWIHdvcmsuCgpJJ2xsIGxvb2sgYXQgd2hh
dCBjYW4gYmUgZG9uZSB3aXRoIE9WTUYuCgpJcyB0aGVyZSBzb21lIGtpbmQgb2YgaW5mb3JtYXRp
b24gdGhhdCBYZW4gY291bGQgZ2l2ZT8gT3IgaXMgaXQgYWxsCmluZm9ybWF0aW9uIHRoYXQgT1ZN
RiBzaG91bGQga2VlcCB0cmFjayBvZj8gT3IgaWYgWGVuIG9ubHkgaGF2ZQpYRU5NRU1fbWVtb3J5
X21hcCwgdGhlbiBPVk1GIGFscmVhZHkgaGF2ZSB0aGlzIGluZm9ybWF0aW9uLgoKVGhhbmtzLAoK
LS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
