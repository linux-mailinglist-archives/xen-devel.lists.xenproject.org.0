Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59657A1533
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2019 11:55:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3H6S-0001dT-42; Thu, 29 Aug 2019 09:52:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=C/xl=WZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i3H6Q-0001dN-GE
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 09:52:26 +0000
X-Inumbo-ID: b45b43b4-ca42-11e9-ae63-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b45b43b4-ca42-11e9-ae63-12813bfff9fa;
 Thu, 29 Aug 2019 09:52:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 19D72B0B3;
 Thu, 29 Aug 2019 09:52:25 +0000 (UTC)
To: Paul Durrant <Paul.Durrant@citrix.com>
References: <20190730134419.2739-1-paul.durrant@citrix.com>
 <20190730134419.2739-4-paul.durrant@citrix.com>
 <1383f85e-bc08-c0be-bb02-f68b76ac1be5@suse.com>
 <0134b70d04b942b4b3ce65fd2340ff0c@AMSPEX02CL03.citrite.net>
 <b7ed5929dd864aefa93bb8572a7b5193@AMSPEX02CL03.citrite.net>
 <0854e0578b7445dbb7ac2e65ed81153b@AMSPEX02CL03.citrite.net>
 <b1036f3e-a2a4-306b-d37b-190936978ce5@suse.com>
 <4fe23438a0bf4248accdf0367c754662@AMSPEX02CL03.citrite.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <355e06d7-06dc-14c2-7a4c-8310ea108492@suse.com>
Date: Thu, 29 Aug 2019 11:52:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <4fe23438a0bf4248accdf0367c754662@AMSPEX02CL03.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 3/6] remove late (on-demand) construction of
 IOMMU page tables
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
Cc: 'Petre Pircalabu' <ppircalabu@bitdefender.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>, 'Wei Liu' <wl@xen.org>,
 'Razvan Cojocaru' <rcojocaru@bitdefender.com>,
 'Konrad Rzeszutek Wilk' <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim\(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, 'JulienGrall' <julien.grall@arm.com>,
 'Tamas K Lengyel' <tamas@tklengyel.com>,
 "'xen-devel@lists.xenproject.org'" <xen-devel@lists.xenproject.org>,
 'Alexandru Isaila' <aisaila@bitdefender.com>,
 IanJackson <Ian.Jackson@citrix.com>,
 'VolodymyrBabchuk' <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDguMjAxOSAxMTozMywgUGF1bCBEdXJyYW50IHdyb3RlOgo+IFRCSCBJJ3ZlIHNlZW4g
c3VmZmljaWVudCBudW1iZXJzIG9mIGRvbWFpbiBjcmVhdGUgZmFpbHVyZXMgd2hlbiB1c2luZwo+
IGF1dG8tYmFsbG9vbmluZyB0aGF0IEkgc3RvcHBlZCB1c2luZyBpdCBzb21lIHRpbWUgYWdvIChi
ZXNpZGVzIHRoZSBmYWN0Cj4gdGhhdCBpdCdzIHNsb3cpLiBJZiB5b3UncmUgaGFwcHkgd2l0aCB0
aGUgc2ltcGxpc3RpYwo+IGRvdWJsZS10aGUtcGFnZS10YWJsZS1yZXNlcnZhdGlvbiBjYWxjdWxh
dGlvbiB0aGVuIEkgY2FuIGFkZCB0aGF0IGJ1dAo+IElNTyBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8g
YWRkIGFub3RoZXIgcGF0Y2ggdG8ganVzdCByZW1vdmUgYXV0by1iYWxsb29uaW5nLgoKSSdkIG5v
dCBiZSBvdmVybHkgaGFwcHksIGJ1dCBJIGNvdWxkIGxpdmUgd2l0aCB0aGlzLiBCdXQgdGhpcyBu
ZWVkcwpjb25zZW50IGJ5IG90aGVycywgbm90IHRoZSBsZWFzdCB0aGUgdG9vbCBzdGFjayBtYWlu
dGFpbmVycy4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
