Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0996CBDF15
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 15:36:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD7OI-0002iI-KC; Wed, 25 Sep 2019 13:31:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZcR2=XU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iD7OG-0002iD-Tj
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 13:31:32 +0000
X-Inumbo-ID: c9288232-df98-11e9-97fb-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by localhost (Halon) with ESMTPS
 id c9288232-df98-11e9-97fb-bc764e2007e4;
 Wed, 25 Sep 2019 13:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569418293;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=V+Lvrq2348MU8mz4aTOba6m3wCR/ZpX223hjlZQ3rH0=;
 b=Xom/3iSGjahjBGA8XiIKR87fkhy468GRImVVnKnsQ0s69Ev5WbeR3k7C
 nGrVfO5qv1XUfb6lRsc5UpdBP9e/LdmeQec6xxF7MPvB7km40g3CW8eqQ
 gfOjTTqh3jAbO/NhAi+S+DRtm4RbmUmOaHIPo7ZJxsPYuyfES2oCUD6/g U=;
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
IronPort-SDR: doAkHu+WZ4tKYuOz1krfHzHKZ2vKwxT48uKr/Tdu69jHK1ShCjqXf05nWusyPclPX5LocVul1Z
 Aq0bjzfCY46vx0BLQyLhIJg6yPAXcgfNb3nzZTSbz+77Np0cbmUbQrOAONia82os04z820iA4F
 GTNhFEZU6RmwsZyhjFREELFbF/hI2K6eqjZlcT28/eTKCMoZr10RruTYok6cHsSYsXyKXMQjot
 +lO5ZUBlKpnlh+Prc9bR3iqDlr0lLfpH7E1qX++Md6qdUPIKPgzQHBIgdQ5RqA9+MwjU4DFuDw
 O50=
X-SBRS: 2.7
X-MesageID: 6046976
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,548,1559534400"; 
   d="scan'208";a="6046976"
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <aa62726c-5aa4-8bcd-dc35-61eb8dfeaee3@suse.com>
 <14624609-019f-2993-261c-d4f45ce78cbe@suse.com>
 <20190923142253.dqvbg2tsfke3mmtc@Air-de-Roger>
 <db9b21f5-108b-eee4-692b-199d25c02b10@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <0069008f-596f-13ba-0e4c-841e8957a24a@citrix.com>
Date: Wed, 25 Sep 2019 14:31:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <db9b21f5-108b-eee4-692b-199d25c02b10@suse.com>
Content-Language: en-GB
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
 Wei Liu <wl@xen.org>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMvMDkvMjAxOSAxNTo0MSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjMuMDkuMjAxOSAx
NjoyMiwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4+IE9uIFRodSwgU2VwIDE5LCAyMDE5IGF0
IDAzOjIyOjU0UE0gKzAyMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4gUmF0aGVyIHRoYW4gZG9p
bmcgdGhpcyBldmVyeSB0aW1lIHdlIHNldCB1cCBpbnRlcnJ1cHRzIGZvciBhIGRldmljZQo+Pj4g
YW5ldyAoYW5kIHRoZW4gaW4gc2V2ZXJhbCBwbGFjZXMpIGZpbGwgdGhpcyBpbnZhcmlhbnQgZmll
bGQgcmlnaHQgYWZ0ZXIKPj4+IGFsbG9jYXRpbmcgc3RydWN0IHBjaV9kZXYuCj4+Pgo+Pj4gU2ln
bmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+PiBMR1RNOgo+Pgo+
PiBSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4g
VGhhbmtzLgo+Cj4+IEp1c3Qgb25lIG5pdCBiZWxvdy4KPj4KPj4+IEBAIC03MTEsNyArNzEwLDcg
QEAgc3RhdGljIGludCBtc2lfY2FwYWJpbGl0eV9pbml0KHN0cnVjdCBwYwo+Pj4gIAo+Pj4gICAg
ICAgICAgLyogQWxsIE1TSXMgYXJlIHVubWFza2VkIGJ5IGRlZmF1bHQsIE1hc2sgdGhlbSBhbGwg
Ki8KPj4+ICAgICAgICAgIG1hc2tiaXRzID0gcGNpX2NvbmZfcmVhZDMyKGRldi0+c2JkZiwgbXBv
cyk7Cj4+PiAtICAgICAgICBtYXNrYml0cyB8PSB+KHUzMikwID4+ICgzMiAtIG1heHZlYyk7Cj4+
PiArICAgICAgICBtYXNrYml0cyB8PSB+KHUzMikwID4+ICgzMiAtIGRldi0+bXNpX21heHZlYyk7
Cj4+IEdFTk1BU0sgd291bGQgYmUgc2xpZ2h0bHkgZWFzaWVyIHRvIHBhcnNlIElNTyAoaGVyZSBh
bmQgYmVsb3cpLgo+IEJlc2lkZXMgdGhpcyBiZWluZyBhbiB1bnJlbGF0ZWQgY2hhbmdlLCBJJ20g
YWZyYWlkIEknbSBnb2luZyB0bwo+IG9iamVjdCB0byB1c2Ugb2YgYSBtYWNybyB3aGVyZSBpdCdz
IHVuY2xlYXIgd2hhdCBpdHMgcGFyYW1ldGVycwo+IG1lYW46IEV2ZW4gdGhlIGV4YW1wbGUgaW4g
eGVuL2JpdG9wcy5oIGlzIHNvIGNvbmZ1c2luZyB0aGF0IEkKPiBjYW4ndCB0ZWxsIHdoZXRoZXIg
ImgiIGlzIG1lYW50IHRvIGJlIGV4Y2x1c2l2ZSBvciBpbmNsdXNpdmUKPiAobG9va3MgbGlrZSB0
aGUgbGF0dGVyIGlzIGludGVuZGVkKS4gVG8gbWUgdGhlIHR3byBwYXJhbWV0ZXJzCj4gYWxzbyBs
b29rIHJldmVyc2VkIC0gSSdkIGV4cGVjdCAibG93IiBmaXJzdCBhbmQgImhpZ2giIHNlY29uZC4K
PiAoSVNUUiBoYXZpbmcgdm9pY2VkIHJlc2VydmF0aW9ucyBhZ2FpbnN0IGl0cyBpbnRyb2R1Y3Rp
b24sIGFuZAo+IEknbSBoYXBweSB0byBzZWUgdGhhdCBpdCdzIHVzZWQgaW4gQXJtIGNvZGUgb25s
eS4pCgpGdXJ0aGVybW9yZSwgTGludXggaXMgaGF2aW5nIGVub3VnaCBwcm9ibGVtcyB3aXRoIGl0
IHRoYXQgdGhleSB3ZXJlCmNvbnNpZGVyaW5nIGFib2xpc2hpbmcgaXQgZW50aXJlbHkuCgpHZXR0
aW5nIHRoZSB0d28gbnVtYmVycyB0aGUgd3Jvbmcgd2F5IGFyb3VuZCBnZXRzIHlvdSBhIG1hc2sg
b2YgMC7CoCBJdAppcyBhIHZlcnkgdW5zYWZlIG1hY3JvLgoKLTEgdG8gYW55IHVzZSBpbiBYZW4s
IGV2ZW4gaW4gdGhlIEFSTSBjb2RlLsKgIChJIHJlYWxpc2UgdGhpcyBpcyBub3QgbXkKY2FsbCwg
YnV0IHRoaXMgY2xlYXJseSBleHByZXNzZXMgbXkgb3BpbmlvbiBhYm91dCBpdC4pCgp+QW5kcmV3
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
