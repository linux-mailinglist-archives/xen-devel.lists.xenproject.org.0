Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 057C817A58B
	for <lists+xen-devel@lfdr.de>; Thu,  5 Mar 2020 13:45:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9pqQ-0008Pj-Rz; Thu, 05 Mar 2020 12:43:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KIN4=4W=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j9pqP-0008Pe-MS
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2020 12:43:17 +0000
X-Inumbo-ID: e25ea46e-5ede-11ea-a5aa-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e25ea46e-5ede-11ea-a5aa-12813bfff9fa;
 Thu, 05 Mar 2020 12:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583412196;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=wATOkHyHfw1nttogMmLbBkJtCs3d5j9hHSTAkJY4KmE=;
 b=Bh85cabEjC96iOOPUxiy8sJcNmt1wYkeu3T6n2gisnXe2uEI+YB5lxPO
 qijDoiCCNjHm6jhn4GNwZex6Xghm3xv2gZu51GkU3qUV22UBUvxjMz0W/
 tCc2yZUdnPa/I1ZbIX1Z8PHg3lcschFwUAYSn7KcdTiND5LnvrnYbBWrk c=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: iR1cwtc6wIxZHy2095D3SobXiBpJi1pHjnR4cTvwIX4HwAo3C1DNnED/QdKE4qoxNmS2nAl6jV
 dbJIfWoZdXEkP183BBYzQ6TbB8GAIJFJsQHT5i05dmAWRfPp9TMq78jYy6zAhB5tY8PZ+Q7C35
 eA/Mk5kAW7Vl1HUChfFa3m08+pqPatmh5F6H00J2FJ3RrXlA6MT4yoduIrrON+HcCXhgi/Wx1X
 VozdPrV+m5W8VHG95mKIH53r6u455YK/zwGOBAEcLqVjoFxNkKJ+9EpJ1DfbZb+f6uwBMlnkjs
 NjI=
X-SBRS: 2.7
X-MesageID: 13885325
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,518,1574139600"; d="scan'208";a="13885325"
Date: Thu, 5 Mar 2020 13:42:55 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Juergen Gross <jgross@suse.com>
Message-ID: <20200305124255.GW24458@Air-de-Roger.citrite.net>
References: <20200305114044.20235-1-jgross@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200305114044.20235-1-jgross@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2] xen/blkfront: fix ring info addressing
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
Cc: Jens Axboe <axboe@kernel.dk>, Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXIgMDUsIDIwMjAgYXQgMTI6NDA6NDRQTSArMDEwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBDb21taXQgMDI2NWQ2ZThkZGI4OTAgKCJ4ZW4vYmxrZnJvbnQ6IGxpbWl0IGFsbG9j
YXRlZCBtZW1vcnkgc2l6ZSB0bwo+IGFjdHVhbCB1c2UgY2FzZSIpIG1hZGUgc3RydWN0IGJsa2Zy
b250X3JpbmdfaW5mbyBzaXplIGR5bmFtaWMuIFRoaXMgaXMKPiBmaW5lIHdoZW4gcnVubmluZyB3
aXRoIG9ubHkgb25lIHF1ZXVlLCBidXQgd2l0aCBtdWx0aXBsZSBxdWV1ZXMgdGhlCj4gYWRkcmVz
c2luZyBvZiB0aGUgc2luZ2xlIHF1ZXVlcyBoYXMgdG8gYmUgYWRhcHRlZCBhcyB0aGUgc3RydWN0
cyBhcmUKPiBhbGxvY2F0ZWQgaW4gYW4gYXJyYXkuCj4gCj4gRml4ZXM6IDAyNjVkNmU4ZGRiODkw
ICgieGVuL2Jsa2Zyb250OiBsaW1pdCBhbGxvY2F0ZWQgbWVtb3J5IHNpemUgdG8gYWN0dWFsIHVz
ZSBjYXNlIikKPiBSZXBvcnRlZC1ieTogU2FuZGVyIEVpa2VsZW5ib29tIDxsaW51eEBlaWtlbGVu
Ym9vbS5pdD4KPiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+
Cj4gLS0tCj4gVjI6Cj4gLSBnZXQgcmlkIG9mIHJpbmZvX3B0cigpIGhlbHBlcgo+IC0gdXNlIHBy
b3BlciBwYXJlbnRoZXNpcyBpbiBmb3JfZWFjaF9yaW5mbygpCj4gLSByZW5hbWUgcmluZm8gcGFy
YW1ldGVyIG9mIGZvcl9lYWNoX3JpbmZvKCkKPiAtLS0KPiAgZHJpdmVycy9ibG9jay94ZW4tYmxr
ZnJvbnQuYyB8IDc5ICsrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0t
Cj4gIDEgZmlsZSBjaGFuZ2VkLCA0MiBpbnNlcnRpb25zKCspLCAzNyBkZWxldGlvbnMoLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ibG9jay94ZW4tYmxrZnJvbnQuYyBiL2RyaXZlcnMvYmxv
Y2sveGVuLWJsa2Zyb250LmMKPiBpbmRleCBlMmFkNmJiYTIyODEuLjhlODQ0ZGE4MjZkYiAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtmcm9udC5jCj4gKysrIGIvZHJpdmVycy9i
bG9jay94ZW4tYmxrZnJvbnQuYwo+IEBAIC0yMTMsNiArMjEzLDcgQEAgc3RydWN0IGJsa2Zyb250
X2luZm8KPiAgCXN0cnVjdCBibGtfbXFfdGFnX3NldCB0YWdfc2V0Owo+ICAJc3RydWN0IGJsa2Zy
b250X3JpbmdfaW5mbyAqcmluZm87Cj4gIAl1bnNpZ25lZCBpbnQgbnJfcmluZ3M7Cj4gKwl1bnNp
Z25lZCBpbnQgcmluZm9fc2l6ZTsKPiAgCS8qIFNhdmUgdW5jb21wbGV0ZSByZXFzIGFuZCBiaW9z
IGZvciBtaWdyYXRpb24uICovCj4gIAlzdHJ1Y3QgbGlzdF9oZWFkIHJlcXVlc3RzOwo+ICAJc3Ry
dWN0IGJpb19saXN0IGJpb19saXN0Owo+IEBAIC0yNTksNiArMjYwLDE4IEBAIHN0YXRpYyBpbnQg
YmxrZnJvbnRfc2V0dXBfaW5kaXJlY3Qoc3RydWN0IGJsa2Zyb250X3JpbmdfaW5mbyAqcmluZm8p
Owo+ICBzdGF0aWMgdm9pZCBibGtmcm9udF9nYXRoZXJfYmFja2VuZF9mZWF0dXJlcyhzdHJ1Y3Qg
YmxrZnJvbnRfaW5mbyAqaW5mbyk7Cj4gIHN0YXRpYyBpbnQgbmVnb3RpYXRlX21xKHN0cnVjdCBi
bGtmcm9udF9pbmZvICppbmZvKTsKPiAgCj4gKyNkZWZpbmUgZm9yX2VhY2hfcmluZm8oaW5mbywg
cHRyLCBpZHgpCQkJCVwKPiArCWZvciAoKHB0cikgPSAoaW5mbyktPnJpbmZvLCAoaWR4KSA9IDA7
CQkJXAo+ICsJICAgICAoaWR4KSA8IChpbmZvKS0+bnJfcmluZ3M7CQkJCVwKPiArCSAgICAgKGlk
eCkrKywgKHB0cikgPSAodm9pZCAqKShwdHIpICsgKGluZm8pLT5yaW5mb19zaXplKQo+ICsKPiAr
c3RhdGljIHN0cnVjdCBibGtmcm9udF9yaW5nX2luZm8gKmdldF9yaW5mbyhzdHJ1Y3QgYmxrZnJv
bnRfaW5mbyAqaW5mbywKCkkgc3RpbGwgdGhpbmsgaW5saW5lIHNob3VsZCBiZSBhZGRlZCBoZXJl
LCBidXQgSSBkb24ndCBoYXZlIHN1Y2ggYQpzdHJvbmcgb3BpbmlvbiB0byBibG9jayB0aGUgcGF0
Y2ggb24gaXQuCgpBbHNvLCBpbmZvIHNob3VsZCBiZSBjb25zdGlmaWVkIEFGQUlDVC4KCldpdGgg
YXQgbGVhc3QgaW5mbyBjb25zdGlmaWVkOgoKQWNrZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPgoKQ2FuIHlvdSBxdWV1ZSB0aGlzIHRocm91Z2ggdGhlIFhlbiB0
cmVlPwoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
