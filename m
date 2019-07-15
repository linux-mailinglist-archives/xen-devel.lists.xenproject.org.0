Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA10C68EF6
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2019 16:11:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hn1ez-00028h-FN; Mon, 15 Jul 2019 14:08:57 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rCxz=VM=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1hn1ex-00028b-Pt
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 14:08:55 +0000
X-Inumbo-ID: 13fd9ee1-a70a-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 13fd9ee1-a70a-11e9-8980-bc764e045a96;
 Mon, 15 Jul 2019 14:08:54 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=sergey.dyasli@citrix.com;
 spf=Pass smtp.mailfrom=sergey.dyasli@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 sergey.dyasli@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 sergey.dyasli@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 4REXSf+djEcYLMc6fhbiQXVhU0gtsGe8GfWGZiDW1O59C5iTPLDq0msRaRkE9JTDVVUCq+UbIB
 MGULgUpQLECGqawuBHEUCo0Sm+uHJFd6OGrFYsvMT6ByyFLYGOeHYremce6cXxSdh3M2GTaeMe
 HDF85pupq8cR+ug+siMqi24eKncsjuChZZYYxBqQLhdcEzrLapGcvYYZCLZYbvVlDCV6sECl3Y
 fxwTSk2WvIfhifmtCEnDTD9I2A/XgmXT1pPqoR52RAY01hOjGVO5BK4lV530l/C2GpXDr0B0YM
 qds=
X-SBRS: 2.7
X-MesageID: 3032080
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,493,1557201600"; 
   d="scan'208";a="3032080"
To: Dario Faggioli <dfaggioli@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, Juergen Gross <JGross@suse.com>
References: <20190528103313.1343-1-jgross@suse.com>
 <f2f3f5f2-8b9c-ac9c-00e8-1e601ec71070@citrix.com>
 <3cb1c2b777e623a55bf87dc12a155734667ab23e.camel@suse.com>
From: Sergey Dyasli <sergey.dyasli@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=sergey.dyasli@citrix.com; keydata=
 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
Message-ID: <c8f4c719-ce7c-9ca0-7d5b-c34db3f21e38@citrix.com>
Date: Mon, 15 Jul 2019 15:08:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <3cb1c2b777e623a55bf87dc12a155734667ab23e.camel@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 00/60] xen: add core scheduling support
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
Cc: "sergey.dyasli@citrix.com >> Sergey
 Dyasli" <sergey.dyasli@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 RobertVanVossen <robert.vanvossen@dornerworks.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUvMDcvMjAxOSAxNDo1NiwgRGFyaW8gRmFnZ2lvbGkgd3JvdGU6Cj4gT24gRnJpLCAyMDE5
LTA3LTA1IGF0IDE0OjE3ICswMTAwLCBTZXJnZXkgRHlhc2xpIHdyb3RlOgo+PiAxKSBUaGlzIGNy
YXNoIGlzIHF1aXRlIGxpa2VseSB0byBoYXBwZW46Cj4+Cj4+IFsyMDE5LTA3LTA0IDE4OjIyOjQ2
IFVUQ10gKFhFTikgWyAzNDI1LjIyMDY2MF0gV2F0Y2hkb2cgdGltZXIgZGV0ZWN0cwo+PiB0aGF0
IENQVTIgaXMgc3R1Y2shCj4+IFsyMDE5LTA3LTA0IDE4OjIyOjQ2IFVUQ10gKFhFTikgWyAzNDI1
LjIyNjI5M10gLS0tLVsgWGVuLTQuMTMuMC0KPj4gOC4wLjYtZCAgeDg2XzY0ICBkZWJ1Zz15ICAg
Tm90IHRhaW50ZWQgXS0tLS0KPj4gWy4uLl0KPj4gWzIwMTktMDctMDQgMTg6MjI6NDcgVVRDXSAo
WEVOKSBbIDM0MjUuNTAxOTg5XSBYZW4gY2FsbCB0cmFjZToKPj4gWzIwMTktMDctMDQgMTg6MjI6
NDcgVVRDXSAoWEVOKSBbCj4+IDM0MjUuNTA1Mjc4XSAgICBbPGZmZmY4MmQwODAyM2Q1Nzg+XSB2
Y3B1X3NsZWVwX3N5bmMrMHg1MC8weDcxCj4+IFsyMDE5LTA3LTA0IDE4OjIyOjQ3IFVUQ10gKFhF
TikgWwo+PiAzNDI1LjUxMTUxOF0gICAgWzxmZmZmODJkMDgwMjA4MzcwPl0gdmNwdV9wYXVzZSsw
eDIxLzB4MjMKPj4gWzIwMTktMDctMDQgMTg6MjI6NDcgVVRDXSAoWEVOKSBbCj4+IDM0MjUuNTE3
MzI2XSAgICBbPGZmZmY4MmQwODAyM2UyNWQ+XQo+PiB2Y3B1X3NldF9wZXJpb2RpY190aW1lcisw
eDI3LzB4NzMKPj4gWzIwMTktMDctMDQgMTg6MjI6NDcgVVRDXSAoWEVOKSBbCj4+IDM0MjUuNTI0
MjU4XSAgICBbPGZmZmY4MmQwODAyMDk2ODI+XSBkb192Y3B1X29wKzB4MmM5LzB4NjY4Cj4+IFsy
MDE5LTA3LTA0IDE4OjIyOjQ3IFVUQ10gKFhFTikgWwo+PiAzNDI1LjUzMDIzOF0gICAgWzxmZmZm
ODJkMDgwMjRmOTcwPl0gY29tcGF0X3ZjcHVfb3ArMHgyNTAvMHgzOTAKPj4gWzIwMTktMDctMDQg
MTg6MjI6NDcgVVRDXSAoWEVOKSBbCj4+IDM0MjUuNTM2NTY2XSAgICBbPGZmZmY4MmQwODAzODM5
NjQ+XSBwdl9oeXBlcmNhbGwrMHgzNjQvMHg1NjQKPj4gWzIwMTktMDctMDQgMTg6MjI6NDcgVVRD
XSAoWEVOKSBbCj4+IDM0MjUuNTQyNzE5XSAgICBbPGZmZmY4MmQwODAzODU2NDQ+XSBkb19lbnRy
eV9pbnQ4MisweDI2LzB4MmQKPj4gWzIwMTktMDctMDQgMTg6MjI6NDcgVVRDXSAoWEVOKSBbCj4+
IDM0MjUuNTQ4ODc2XSAgICBbPGZmZmY4MmQwODAzODgzOWI+XSBlbnRyeV9pbnQ4MisweGJiLzB4
YzAKPj4KPiBNbW0uLi4gdmNwdV9zZXRfcGVyaW9kaWNfdGltZXI/Cj4gCj4gV2hhdCBrZXJuZWwg
aXMgdGhpcyBhbmQgd2hlbiBkb2VzIHRoaXMgY3Jhc2ggaGFwcGVuPwoKSGkgRGFyaW8sCgpJIGNh
biBlYXNpbHkgcmVwcm9kdWNlIHRoaXMgY3Jhc2ggdXNpbmcgYSBEZWJpYW4gNyBQViBWTSAoMiB2
Q1BVcywgMkdCIFJBTSkKd2hpY2ggaGFzIHRoZSBmb2xsb3dpbmcga2VybmVsOgoKIyB1bmFtZSAt
YQoKTGludXggbG9jYWxob3N0IDMuMi4wLTQtYW1kNjQgIzEgU01QIERlYmlhbiAzLjIuNzgtMSB4
ODZfNjQgR05VL0xpbnV4CgpBbGwgSSBuZWVkIHRvIGRvIGlzIHN1c3BlbmQgYW5kIHJlc3VtZSB0
aGUgVk0uCgpUaGFua3MsClNlcmdleQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
