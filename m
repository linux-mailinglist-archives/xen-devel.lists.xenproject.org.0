Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE90BB6AA
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 16:26:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCPF3-0006Lw-VI; Mon, 23 Sep 2019 14:23:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=naYO=XS=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iCPF2-0006Lq-Jr
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 14:23:04 +0000
X-Inumbo-ID: a74e2ad6-de0d-11e9-b76c-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a74e2ad6-de0d-11e9-b76c-bc764e2007e4;
 Mon, 23 Sep 2019 14:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569248583;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=yhSga7nz4L84Ah/pGhP2VqfXHfNVBW2+etK0wThddhU=;
 b=cjB2W/sfbAOWAf5qXBtlsqK0qSZkjetE5snFbjUFL7VWHMHW7iyZsulz
 gxmXCukA6VjnjtfQ7QAKvVqjzxXpMyzoFCV5V/cYRjUmYb6LJQmmMpwSU
 LVkW6gr++MMs8zFpuKfMaKRGaifPt+4wgwTjeUBl5JfP8q2XdyyP2y5aZ M=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: v6SfTub/frSsTrMPyfXLpSiymvknIz1aR42pYX568pwOnLyUpeTPpqYy/DqXlQnyDIMV1/8ayh
 /lB8ARJXyEIORMzZDAoDpwh5YtyCo5Yiat9fX8MFhV/f9ZYdUThfeA0OwAiBYDWEtIJ1wy/Hqr
 +P05OxSg5/9ppKfhiNWHrPobbj37m8ZN9/PTVb3UNXYmnuB7XQhuZvq2GYDHX7DZsHNhALK3iA
 0HNo79m+ZfBtKLuaxNF54JKq1fOoZcMgqcF17+IbuQhej1mIhs2OO0TtldPiV4bD5yUmlXIZVy
 gwU=
X-SBRS: 2.7
X-MesageID: 6147738
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,540,1559534400"; 
   d="scan'208";a="6147738"
Date: Mon, 23 Sep 2019 16:22:53 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20190923142253.dqvbg2tsfke3mmtc@Air-de-Roger>
References: <aa62726c-5aa4-8bcd-dc35-61eb8dfeaee3@suse.com>
 <14624609-019f-2993-261c-d4f45ce78cbe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <14624609-019f-2993-261c-d4f45ce78cbe@suse.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v6 3/8] x86/PCI: read maximum MSI vector
 count early
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBTZXAgMTksIDIwMTkgYXQgMDM6MjI6NTRQTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gUmF0aGVyIHRoYW4gZG9pbmcgdGhpcyBldmVyeSB0aW1lIHdlIHNldCB1cCBpbnRlcnJ1
cHRzIGZvciBhIGRldmljZQo+IGFuZXcgKGFuZCB0aGVuIGluIHNldmVyYWwgcGxhY2VzKSBmaWxs
IHRoaXMgaW52YXJpYW50IGZpZWxkIHJpZ2h0IGFmdGVyCj4gYWxsb2NhdGluZyBzdHJ1Y3QgcGNp
X2Rldi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
CgpMR1RNOgoKUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXgu
Y29tPgoKSnVzdCBvbmUgbml0IGJlbG93LgoKPiAtLS0KPiB2NjogTmV3Lgo+IAo+IC0tLQo+ICB4
ZW4vYXJjaC94ODYvbXNpLmMgICAgICAgICAgICB8ICAgMTMgKysrKystLS0tLS0tLQo+ICB4ZW4v
ZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYyB8ICAgMTAgKysrKysrKysrKwo+ICB4ZW4vZHJpdmVy
cy92cGNpL21zaS5jICAgICAgICB8ICAgIDkgKysrKy0tLS0tCj4gIHhlbi9pbmNsdWRlL3hlbi9w
Y2kuaCAgICAgICAgIHwgICAgMyArKy0KPiAgeGVuL2luY2x1ZGUveGVuL3ZwY2kuaCAgICAgICAg
fCAgICA2ICsrLS0tLQo+ICA1IGZpbGVzIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDE4IGRl
bGV0aW9ucygtKQo+IAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tc2kuYwo+ICsrKyBiL3hlbi9hcmNo
L3g4Ni9tc2kuYwo+IEBAIC02NjQsNyArNjY0LDcgQEAgc3RhdGljIGludCBtc2lfY2FwYWJpbGl0
eV9pbml0KHN0cnVjdCBwYwo+ICB7Cj4gICAgICBzdHJ1Y3QgbXNpX2Rlc2MgKmVudHJ5Owo+ICAg
ICAgaW50IHBvczsKPiAtICAgIHVuc2lnbmVkIGludCBpLCBtYXh2ZWMsIG1wb3M7Cj4gKyAgICB1
bnNpZ25lZCBpbnQgaSwgbXBvczsKPiAgICAgIHUxNiBjb250cm9sLCBzZWcgPSBkZXYtPnNlZzsK
PiAgICAgIHU4IGJ1cyA9IGRldi0+YnVzOwo+ICAgICAgdTggc2xvdCA9IFBDSV9TTE9UKGRldi0+
ZGV2Zm4pOwo+IEBAIC02NzUsOSArNjc1LDggQEAgc3RhdGljIGludCBtc2lfY2FwYWJpbGl0eV9p
bml0KHN0cnVjdCBwYwo+ICAgICAgaWYgKCAhcG9zICkKPiAgICAgICAgICByZXR1cm4gLUVOT0RF
VjsKPiAgICAgIGNvbnRyb2wgPSBwY2lfY29uZl9yZWFkMTYoZGV2LT5zYmRmLCBtc2lfY29udHJv
bF9yZWcocG9zKSk7Cj4gLSAgICBtYXh2ZWMgPSBtdWx0aV9tc2lfY2FwYWJsZShjb250cm9sKTsK
PiAtICAgIGlmICggbnZlYyA+IG1heHZlYyApCj4gLSAgICAgICAgcmV0dXJuIG1heHZlYzsKPiAr
ICAgIGlmICggbnZlYyA+IGRldi0+bXNpX21heHZlYyApCj4gKyAgICAgICAgcmV0dXJuIGRldi0+
bXNpX21heHZlYzsKPiAgICAgIGNvbnRyb2wgJj0gflBDSV9NU0lfRkxBR1NfUVNJWkU7Cj4gICAg
ICBtdWx0aV9tc2lfZW5hYmxlKGNvbnRyb2wsIG52ZWMpOwo+ICAKPiBAQCAtNzExLDcgKzcxMCw3
IEBAIHN0YXRpYyBpbnQgbXNpX2NhcGFiaWxpdHlfaW5pdChzdHJ1Y3QgcGMKPiAgCj4gICAgICAg
ICAgLyogQWxsIE1TSXMgYXJlIHVubWFza2VkIGJ5IGRlZmF1bHQsIE1hc2sgdGhlbSBhbGwgKi8K
PiAgICAgICAgICBtYXNrYml0cyA9IHBjaV9jb25mX3JlYWQzMihkZXYtPnNiZGYsIG1wb3MpOwo+
IC0gICAgICAgIG1hc2tiaXRzIHw9IH4odTMyKTAgPj4gKDMyIC0gbWF4dmVjKTsKPiArICAgICAg
ICBtYXNrYml0cyB8PSB+KHUzMikwID4+ICgzMiAtIGRldi0+bXNpX21heHZlYyk7CgpHRU5NQVNL
IHdvdWxkIGJlIHNsaWdodGx5IGVhc2llciB0byBwYXJzZSBJTU8gKGhlcmUgYW5kIGJlbG93KS4K
ClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
