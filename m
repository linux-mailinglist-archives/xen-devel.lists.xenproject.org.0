Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E13F87B96
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 15:44:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw59w-0001BH-1T; Fri, 09 Aug 2019 13:42:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7cgI=WF=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hw59v-0001BB-2v
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 13:42:19 +0000
X-Inumbo-ID: 802ead52-baab-11e9-8c92-67c979104ce8
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 802ead52-baab-11e9-8c92-67c979104ce8;
 Fri, 09 Aug 2019 13:42:17 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: LMouQfQzsJ5UxGcABZqpvY/Nlem3oVEYohS2rPpOeE3qY9M1DVDYzGNNTEBR90atCqqgE5HHjB
 E4MIUqcji8eyA0es5ILWJdbjwGycjCKZF1Jyji44VovwxSuS0hATh8W5x+wof+bU97ym/x24Mz
 bImDBJPQWGJuFglufs69nTU0fficIhGAPL++p4ll47sk0egpetQdckbSjIyg+dSb8OfRPuEDQC
 /q9YqyNKp0+EgjgGv1kxgslWEpv2JUUzJ1XoQHSVRFR8h8Pn/aUI0HMY/jqSEpu9VRk6OVNzqG
 Z08=
X-SBRS: 2.7
X-MesageID: 4090343
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,364,1559534400"; 
   d="scan'208";a="4090343"
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <d1ae0cb5-2dfb-7984-62ec-19f7f5a5abaf@suse.com>
 <2796108d-26af-2520-feb7-2f091ad82ec3@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <835d449c-6c7e-5315-cb36-d34ac932812f@citrix.com>
Date: Fri, 9 Aug 2019 14:42:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2796108d-26af-2520-feb7-2f091ad82ec3@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v4 1/2] xen/link: Introduce
 .bss.percpu.page_aligned
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
 Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim
 Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkvMDgvMjAxOSAxMzozMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gSW5zZXJ0IGV4cGxpY2l0
IGFsaWdubWVudCBzdWNoIHRoYXQgdGhlIHJlc3VsdCBpcyBzYWZlIGV2ZW4gd2l0aCBvYmplY3Rz
Cj4gc2hvcnRlciB0aGFuIGEgcGFnZSBpbiBsZW5ndGguwqAgVGhlIFBPSU5URVJfQUxJR04gZm9y
IF9fYnNzX2VuZCBpcyB0bwo+IGNvdmVyCj4gdGhlIGxhY2sgb2YgU01QX0NBQ0hFX0JZVEVTIGFs
aWdubWVudCwgYXMgdGhlIGxvb3BzIHdoaWNoIHplcm8gdGhlIEJTUwo+IHVzZQo+IHBvaW50ZXIt
c2l6ZWQgc3RvcmVzIG9uIGFsbCBhcmNoaXRlY3R1cmVzLgoKLi4uCgo+IHY0Ogo+IMKgKiBEcm9w
IHN0cmF5IHRyYWlsaW5nIEFMSUdOKCkuIE1ha2UgREVGSU5FX1BFUl9DUFVfUEFHRV9BTElHTkVE
KCkgdmVyaWZ5Cj4gwqDCoCB0aGUgYWxpZ25tZW50IHJhdGhlciB0aGFuIHNwZWNpZnlpbmcgaXQu
CgpNeSBmZWVsaW5ncyBhYm91dCB0aGUgc3RyYXktbmVzcyBvZiBBTElHTigpIG5vdHdpdGhzdGFu
ZGluZywgdGhlIGNvbW1pdAptZXNzYWdlIG5vdyB3cm9uZyBhbmQgbmVlZHMgY29ycmVjdGluZy4K
Cj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL3BlcmNwdS5oCj4gKysrIGIveGVuL2luY2x1ZGUveGVu
L3BlcmNwdS5oCj4gQEAgLTksOSArOSwxNyBAQAo+IMKgICogVGhlIF8jI25hbWUgY29uY2F0ZW5h
dGlvbiBpcyBiZWluZyB1c2VkIGhlcmUgdG8gcHJldmVudCAnbmFtZScKPiBmcm9tIGdldHRpbmcK
PiDCoCAqIG1hY3JvIGV4cGFuZGVkLCB3aGlsZSBzdGlsbCBhbGxvd2luZyBhIHBlci1hcmNoaXRl
Y3R1cmUgc3ltYm9sCj4gbmFtZSBwcmVmaXguCj4gwqAgKi8KPiAtI2RlZmluZSBERUZJTkVfUEVS
X0NQVSh0eXBlLCBuYW1lKSBfX0RFRklORV9QRVJfQ1BVKHR5cGUsIF8jI25hbWUsICkKPiArI2Rl
ZmluZSBERUZJTkVfUEVSX0NQVSh0eXBlLCBuYW1lKSBcCj4gK8KgwqDCoCBfX0RFRklORV9QRVJf
Q1BVKF9fc2VjdGlvbigiLmJzcy5wZXJjcHUiKSwgdHlwZSwgXyAjIyBuYW1lKQo+ICsKPiArI2Rl
ZmluZSBERUZJTkVfUEVSX0NQVV9QQUdFX0FMSUdORUQodHlwZSwgbmFtZSkgXAo+ICvCoMKgwqAg
dHlwZWRlZiBjaGFyIG5hbWUgIyMgX2Noa190W0JVSUxEX0JVR19PTl9aRVJPKF9fYWxpZ25vZih0
eXBlKSAmIFwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKFBB
R0VfU0laRSAtIDEpKV07IFwKPiArwqDCoMKgIF9fREVGSU5FX1BFUl9DUFUoX19zZWN0aW9uKCIu
YnNzLnBlcmNwdS5wYWdlX2FsaWduZWQiKSwgXAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHR5cGUsIF8gIyMgbmFtZSkKCkkgdGhpbmsgdGhpcyB3b3VsZCBiZSBl
YXNpZXIgdG8gcmVhZCBhczoKCiNkZWZpbmUgREVGSU5FX1BFUl9DUFVfUEFHRV9BTElHTkVEKHR5
cGUsIG5hbWUpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKwqDCoMKgIHR5cGVkZWYg
Y2hhciBuYW1lICMjIF9jaGtfdFvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXArCoMKgwqDCoMKgwqDCoCBCVUlMRF9CVUdfT05fWkVS
TyhfX2FsaWdub2YodHlwZSkgJiAoUEFHRV9TSVpFIC0gMSkpXTsgXArCoMKgwqAgX19ERUZJTkVf
UEVSX0NQVShfX3NlY3Rpb24oIi5ic3MucGVyY3B1LnBhZ2VfYWxpZ25lZCIpLMKgwqDCoCBcCsKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdHlwZSwgXyAjIyBuYW1lKQoK
CkJ5IG5vdCBicmVha2luZyBpbXBvcnRhbnQgYml0IG9mIGxvZ2ljIGFjcm9zcyBhIG5ld2xpbmUu
CgpQcmVmZXJhYmx5IHdpdGggdGhpcyBjaGFuZ2VkLCBidXQgZGVmaW5pdGVseSB3aXRoIHRoZSBj
b21taXQgbWVzc2FnZQpmaXhlZCwgQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
