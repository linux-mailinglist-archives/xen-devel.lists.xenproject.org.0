Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3EC151D65
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 16:40:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iz0GG-0001FO-6H; Tue, 04 Feb 2020 15:37:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jKxq=3Y=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iz0GE-0001F1-BP
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 15:37:10 +0000
X-Inumbo-ID: 343f5f40-4764-11ea-8f87-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 343f5f40-4764-11ea-8f87-12813bfff9fa;
 Tue, 04 Feb 2020 15:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580830630;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=kHfuRa3wCPBa++WGwQo5AP4MHW9Zxuh9GHsL/svHwAg=;
 b=Qs8cyqLwn2OLsGBQ5rLvob/Hv3HM1Xy2qL/IgrV4u4sDaI6Yzy1fMh7d
 A4jrt5Yfa6DzHjA2QMHnZb7uLVBNXSzwV5r3UaMgB0e/Xw0kcqwX5ffeB
 a66x2o6aS4LhXRKDrDkPZ/d6PwnffnzDSmcMR6MFc05uqIrH60dSddrJY E=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
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
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: NC4smseQLXRRluKuAYBntfjCEQRAtRZjoYc/+WpOyl7J1ZkGTbeuDZEku8p6QKwpDaj+wLc2P3
 wZIIItqLC5XRMfVxVSC7PE2NAuRUvP0uwckBoF094JTsPjyBw7T+aTeoek0uaDMup7FYO1xUN/
 s2oIpKZJ8RXAUGkBcgpl41iYY1gG02fajTEIo9TtPs9X3d9SUfYO4i8WttrBysLQQVtozDJ7gj
 OZZFIG0+l4mx9bY6Lp1D+TxzCvCT1tfpwOlKmMqlVWjVSly0qjblLfK1Iaa6CoU9u3Rl5/g9Jc
 Cng=
X-SBRS: 2.7
X-MesageID: 12096136
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,402,1574139600"; d="scan'208";a="12096136"
To: Jan Beulich <jbeulich@suse.com>, Stewart Hildebrand
 <stewart.hildebrand@dornerworks.com>
References: <20200204151441.10626-1-stewart.hildebrand@dornerworks.com>
 <89f9cdc5-bd93-7c15-7832-740db273aca6@suse.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 mQINBFPqG+MBEACwPYTQpHepyshcufo0dVmqxDo917iWPslB8lauFxVf4WZtGvQSsKStHJSj
 92Qkxp4CH2DwudI8qpVbnWCXsZxodDWac9c3PordLwz5/XL41LevEoM3NWRm5TNgJ3ckPA+J
 K5OfSK04QtmwSHFP3G/SXDJpGs+oDJgASta2AOl9vPV+t3xG6xyfa2NMGn9wmEvvVMD44Z7R
 W3RhZPn/NEZ5gaJhIUMgTChGwwWDOX0YPY19vcy5fT4bTIxvoZsLOkLSGoZb/jHIzkAAznug
 Q7PPeZJ1kXpbW9EHHaUHiCD9C87dMyty0N3TmWfp0VvBCaw32yFtM9jUgB7UVneoZUMUKeHA
 fgIXhJ7I7JFmw3J0PjGLxCLHf2Q5JOD8jeEXpdxugqF7B/fWYYmyIgwKutiGZeoPhl9c/7RE
 Bf6f9Qv4AtQoJwtLw6+5pDXsTD5q/GwhPjt7ohF7aQZTMMHhZuS52/izKhDzIufl6uiqUBge
 0lqG+/ViLKwCkxHDREuSUTtfjRc9/AoAt2V2HOfgKORSCjFC1eI0+8UMxlfdq2z1AAchinU0
 eSkRpX2An3CPEjgGFmu2Je4a/R/Kd6nGU8AFaE8ta0oq5BSFDRYdcKchw4TSxetkG6iUtqOO
 ZFS7VAdF00eqFJNQpi6IUQryhnrOByw+zSobqlOPUO7XC5fjnwARAQABtCRHZW9yZ2UgVy4g
 RHVubGFwIDxkdW5sYXBnQHVtaWNoLmVkdT6JAlcEEwEKAEECGwMFCwkIBwMFFQoJCAsFFgID
 AQACHgECF4ACGQEWIQTXqBy2bTNXPzpOYFimNjwxBZC0bQUCXEowWQUJDCJ7dgAKCRCmNjwx
 BZC0beKvEACJ75YlJXd7TnNHgFyiCJkm/qPeoQ3sFGSDZuZh7SKcdt9+3V2bFEb0Mii1hQaz
 3hRqZb8sYPHJrGP0ljK09k3wf8k3OuNxziLQBJyzvn7WNlE4wBEcy/Ejo9TVBdA4ph5D0YaZ
 nqdsPmxe/xlTFuSkgu4ep1v9dfVP1TQR0e+JIBa/Ss+cKC5intKm+8JxpOploAHuzaPu0L/X
 FapzsIXqgT9eIQeBEgO2hge6h9Jov3WeED/vh8kA7f8c6zQ/gs5E7VGALwsiLrhr0LZFcKcw
 kI3oCCrB/C/wyPZv789Ra8EXbeRSJmTjcnBwHRPjnjwQmetRDD1t+VyrkC6uujT5jmgOBzaj
 KCqZ8PcMAssOzdzQtKmjUQ2b3ICPs2X13xZ5M5/OVs1W3TG5gkvMh4YoHi4ilFnOk+v3/j7q
 65FG6N0JLb94Ndi80HkIOQQ1XVGTyu6bUPaBg3rWK91Csp1682kD/dNVF3FKHrRLmSVtmEQR
 5rK0+VGc/FmR6vd4haKGWIRuPxzg+pBR77avIZpU7C7+UXGuZ5CbHwIdY8LojJg2TuUdqaVj
 yxmEZLOA8rVHipCGrslRNthVbJrGN/pqtKjCClFZHIAYJQ9EGLHXLG9Pj76opfjHij3MpR3o
 pCGAh6KsCrfrsvjnpDwqSbngGyEVH030irSk4SwIqZ7FwA==
Message-ID: <428eb589-ec3d-1527-02ce-92e2d4367a1a@citrix.com>
Date: Tue, 4 Feb 2020 15:37:04 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <89f9cdc5-bd93-7c15-7832-740db273aca6@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH v2 1/2] Check zone before merging
 adjacent blocks in heap
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek
 Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Jeff Kubascik <jeff.kubascik@dornerworks.com>, xen-devel@lists.xenproject.org,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMi80LzIwIDM6MjIgUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA0LjAyLjIwMjAgMTY6
MTQsIFN0ZXdhcnQgSGlsZGVicmFuZCB3cm90ZToKPj4gRnJvbTogSmVmZiBLdWJhc2NpayA8amVm
Zi5rdWJhc2Npa0Bkb3JuZXJ3b3Jrcy5jb20+Cj4+Cj4+IFRoZSBYZW4gaGVhcCBpcyBzcGxpdCB1
cCBpbnRvIG5vZGVzIGFuZCB6b25lcy4gRWFjaCBub2RlICsgem9uZSBpcwo+PiBtYW5hZ2VkIGFz
IGEgc2VwYXJhdGUgcG9vbCBvZiBtZW1vcnkuCj4+Cj4+IFdoZW4gcmV0dXJuaW5nIHBhZ2VzIHRv
IHRoZSBoZWFwLCBmcmVlX2hlYXBfcGFnZXMgd2lsbCBjaGVjayBhZGphY2VudAo+PiBibG9ja3Mg
dG8gc2VlIGlmIHRoZXkgY2FuIGJlIGNvbWJpbmVkIGludG8gYSBsYXJnZXIgYmxvY2suIEhvd2V2
ZXIsIHRoZQo+PiB6b25lIG9mIHRoZSBhZGphY2VudCBibG9jayBpcyBub3QgY2hlY2tlZC4gVGhp
cyByZXN1bHRzIGluIGJsb2NrcyB0aGF0Cj4+IG1pZ3JhdGUgZnJvbSBvbmUgem9uZSB0byBhbm90
aGVyLgo+Pgo+PiBXaGVuIGEgYmxvY2sgbWlncmF0ZXMgdG8gdGhlIGFkamFjZW50IHpvbmUsIHRo
ZSBhdmFpbCBjb3VudGVycyBmb3IgdGhlCj4+IG9sZCBhbmQgbmV3IG5vZGUgKyB6b25lIGlzIG5v
dCB1cGRhdGVkIGFjY29yZGluZ2x5LiBUaGUgYXZhaWwgY291bnRlcgo+PiBpcyB1c2VkIHdoZW4g
YWxsb2NhdGluZyBwYWdlcyB0byBkZXRlcm1pbmUgd2hldGhlciB0byBza2lwIG92ZXIgYSB6b25l
Lgo+PiBXaXRoIHRoaXMgYmVoYXZpb3IsIGl0IGlzIHBvc3NpYmxlIGZvciBmcmVlIHBhZ2VzIHRv
IGNvbGxlY3QgaW4gYSB6b25lCj4+IHdpdGggdGhlIGF2YWlsIGNvdW50ZXIgc21hbGxlciB0aGFu
IHRoZSBhY3R1YWwgcGFnZSBjb3VudCwgcmVzdWx0aW5nCj4+IGluIGZyZWUgcGFnZXMgdGhhdCBh
cmUgbm90IGFsbG9jYWJsZS4KPiAKPiAiV2hlbiBhIGJsb2NrIG1pZ3JhdGVzIiAtIGZpbmUuIEJ1
dCBpcyB0aGlzIHNpdHVhdGlvbiBwb3NzaWJsZSB0bwo+IG9jY3VyLCB3aXRob3V0ICJ4ZW4vcGFn
ZV9hbGxvYzogS2VlcCBhd2F5IE1GTiAwIGZyb20gdGhlIGJ1ZGR5Cj4gYWxsb2NhdG9yIiByZXZl
cnRlZD8gSWYgbm90LCB0aGVyZSdzIG5vIGJ1Zywgbm8gbmVlZCBmb3IgYSBjaGFuZ2UsCj4gYW5k
IGV2ZW4gbGVzcyBzbyAuLi4KPiAKPj4gLS0tIGEveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMKPj4g
KysrIGIveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMKPj4gQEAgLTE0NjIsNiArMTQ2Miw3IEBAIHN0
YXRpYyB2b2lkIGZyZWVfaGVhcF9wYWdlcygKPj4gICAgICAgICAgICAgIGlmICggIW1mbl92YWxp
ZChwYWdlX3RvX21mbihwcmVkZWNlc3NvcikpIHx8Cj4+ICAgICAgICAgICAgICAgICAgICFwYWdl
X3N0YXRlX2lzKHByZWRlY2Vzc29yLCBmcmVlKSB8fAo+PiAgICAgICAgICAgICAgICAgICAoUEZO
X09SREVSKHByZWRlY2Vzc29yKSAhPSBvcmRlcikgfHwKPj4gKyAgICAgICAgICAgICAgICAgKHBh
Z2VfdG9fem9uZShwcmVkZWNlc3NvcikgIT0gem9uZSkgfHwKPj4gICAgICAgICAgICAgICAgICAg
KHBoeXNfdG9fbmlkKHBhZ2VfdG9fbWFkZHIocHJlZGVjZXNzb3IpKSAhPSBub2RlKSApCj4+ICAg
ICAgICAgICAgICAgICAgYnJlYWs7Cj4+ICAKPj4gQEAgLTE0ODUsNiArMTQ4Niw3IEBAIHN0YXRp
YyB2b2lkIGZyZWVfaGVhcF9wYWdlcygKPj4gICAgICAgICAgICAgIGlmICggIW1mbl92YWxpZChw
YWdlX3RvX21mbihzdWNjZXNzb3IpKSB8fAo+PiAgICAgICAgICAgICAgICAgICAhcGFnZV9zdGF0
ZV9pcyhzdWNjZXNzb3IsIGZyZWUpIHx8Cj4+ICAgICAgICAgICAgICAgICAgIChQRk5fT1JERVIo
c3VjY2Vzc29yKSAhPSBvcmRlcikgfHwKPj4gKyAgICAgICAgICAgICAgICAgKHBhZ2VfdG9fem9u
ZShzdWNjZXNzb3IpICE9IHpvbmUpIHx8Cj4+ICAgICAgICAgICAgICAgICAgIChwaHlzX3RvX25p
ZChwYWdlX3RvX21hZGRyKHN1Y2Nlc3NvcikpICE9IG5vZGUpICkKPj4gICAgICAgICAgICAgICAg
ICBicmVhazsKPiAKPiAuLi4gZm9yIG9uZSB0aGF0IHNsb3dzIGRvd24gbWFueSBmcmVlIG9wZXJh
dGlvbnMsIGV2ZW4gaWYganVzdAo+IHNsaWdodGx5LiBJT1cgYWZhaWN0IGVpdGhlciB0aGUgY2hh
bmdlIGlzIG5vdCBuZWVkZWQsIG9yIGl0cwo+IGRlc2NyaXB0aW9uIG5lZWRzIHVwZGF0aW5nLgoK
QXQgdmVyeSBsZWFzdCBpdCdzIG1vcmUgcm9idXN0IHRoaXMgd2F5OyB0aGUgYWxnb3JpdGhtIGlz
IGFsc28gbGVzcwoibWFnaWMiLiAgV2UganVzdCBoYWQgYSBsb25nIGRpc2N1c3Npb24gdGhpcyBt
b3JuaW5nIHRyeWluZyB0byByZS1jcmVhdGUKdGhlIGxvZ2ljIGZvciB3aHkgIlJlbW92ZSBNRk4g
MCIgd2FzIHN1ZmZpY2llbnQgdG8gcHJldmVudCB0aGlzIGlzc3VlLAphbmQgZXZlbiB0aGVuIERh
dmlkIHdhc24ndCBzdXJlIGl0IHdhcyBjb3JyZWN0IGF0IGZpcnN0LgoKIC1HZW9yZ2UKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
