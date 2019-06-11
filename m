Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4714F3C85C
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 12:14:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hadlR-0002ry-0b; Tue, 11 Jun 2019 10:12:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7l88=UK=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hadlP-0002rt-Dx
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 10:12:23 +0000
X-Inumbo-ID: 654e34ba-8c31-11e9-9215-134665c5cdb3
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 654e34ba-8c31-11e9-9215-134665c5cdb3;
 Tue, 11 Jun 2019 10:12:19 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: RQzSZRtnPjkpdwu8PKGKIMHyM+amNJ276kDzQOWUUBoAGqDrPNzrmScPvkDNViL12L713mmSkO
 1nt3GykDatKqipIBN5Us9yJCztFGIaaZTUHdsAXzBqclcxsy+EloAOY3FH0rVtsSb727+mxqgh
 QXRtOl4FtXdU/vsQG8/WvasDCcQAAnmPl5gvUspKlFjSDz5ZpSOycoCNx9hLgjj1foOZT9ZYlh
 csV7hq2SyerO0CQJ5hJqX3jRmurafSiHUU4QknYn0x0LP8A5GZQTUoCMYrvnwJBs9AbiyDRzWY
 Qqg=
X-SBRS: 2.7
X-MesageID: 1574255
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,578,1557201600"; 
   d="scan'208";a="1574255"
To: Jan Beulich <JBeulich@suse.com>, Julien Grall <julien.grall@arm.com>
References: <20190516133735.18883-1-volodymyr_babchuk@epam.com>
 <20190516133735.18883-2-volodymyr_babchuk@epam.com>
 <5CF7E6930200007800235A1B@prv1-mh.provo.novell.com>
 <675a4182-74c7-24c6-3a5f-c7359eb6899f@arm.com>
 <1b21850b-29a0-37da-2765-54ce51783a7b@arm.com>
 <5CFF4DA60200007800236D45@prv1-mh.provo.novell.com>
 <0fab9902-a644-7aaf-d61c-bad37616b51c@arm.com>
 <5CFF774D0200007800236E83@prv1-mh.provo.novell.com>
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
 pCGAh6KsCrfrsvjnpDwqSbngGyEVH030irSk4SwIqZ7FwLkBDQRUWmc6AQgAzpc8Ng5Opbrh
 iZrn69Xr3js28p+b4a+0BOvC48NfrNovZw4eFeKIzmI/t6EkJkSqBIxobWRpBkwGweENsqnd
 0qigmsDw4N7J9Xx0h9ARDqiWxX4jr7u9xauI+CRJ1rBNO3VV30QdACwQ4LqhR/WA+IjdhyMH
 wj3EJGE61NdP/h0zfaLYAbvEg47/TPThFsm4m8Rd6bX7RkrrOgBbL/AOnYOMEivyfZZKX1vv
 iEemAvLfdk2lZt7Vm6X/fbKbV8tPUuZELzNedJvTTBS3/l1FVz9OUcLDeWhGEdlxqXH0sYWh
 E9+PXTAfz5JxKH+LMetwEM8DbuOoDIpmIGZKrZ+2fQARAQABiQNbBBgBCgAmAhsCFiEE16gc
 tm0zVz86TmBYpjY8MQWQtG0FAlxKMJ4FCQnQ/OQBKcBdIAQZAQoABgUCVFpnOgAKCRCyFcen
 x4Qb7cXrCAC0qQeEWmLa9oEAPa+5U6wvG1t/mi22gZN6uzQXH1faIOoDehr7PPESE6tuR/vI
 CTTnaSrd4UDPNeqOqVF07YexWD1LDcQG6PnRqC5DIX1RGE3BaSaMl2pFJP8y+chews11yP8G
 DBbxaIsTcHZI1iVIC9XLhoeegWi84vYc8F4ziADVfowbmbvcVw11gE8tmALCwTeBeZVteXjh
 0OELHwrc1/4j4yvENjIXRO+QLIgk43kB57Upr4tP2MEcs0odgPM+Q+oETOJ00xzLgkTnLPim
 C1FIW2bOZdTj+Uq6ezRS2LKsNmW+PRRvNyA5ojEbA/faxmAjMZtLdSSSeFK8y4SoCRCmNjwx
 BZC0bevWEACRu+GyQgrdGmorUptniIeO1jQlpTiP5WpVnk9Oe8SiLoXUhXXNj6EtzyLGpYmf
 kEAbki+S6WAKnzZd3shL58AuMyDxtFNNjNeKJOcl6FL7JPBIIgIp3wR401Ep+/s5pl3Nw8Ii
 157f0T7o8CPb54w6S1WsMkU78WzTxIs/1lLblSMcvyz1Jq64g4OqiWI85JfkzPLlloVf1rzy
 ebIBLrrmjhCE2tL1RONpE/KRVb+Q+PIs5+YcZ+Q1e0vXWA7NhTWFbWx3+N6WW6gaGpbFbopo
 FkYRpj+2TA5cX5zW148/xU5/ATEb5vdUkFLUFVy5YNUSyeBHuaf6fGmBrDc47rQjAOt1rmyD
 56MUBHpLUbvA6NkPezb7T6bQpupyzGRkMUmSwHiLyQNJQhVe+9NiJJvtEE3jol0JVJoQ9WVn
 FAzPNCgHQyvbsIF3gYkCYKI0w8EhEoH5FHYLoKS6Jg880IY5rXzoAEfPvLXegy6mhYl+mNVN
 QUBD4h9XtOvcdzR559lZuC0Ksy7Xqw3BMolmKsRO3gWKhXSna3zKl4UuheyZtubVWoNWP/bn
 vbyiYnLwuiKDfNAinEWERC8nPKlv3PkZw5d3t46F1Dx0TMf16NmP+azsRpnMZyzpY8BL2eur
 feSGAOB9qjZNyzbo5nEKHldKWCKE7Ye0EPEjECS1gjKDwbkBDQRUWrq9AQgA7aJ0i1pQSmUR
 6ZXZD2YEDxia2ByR0uZoTS7N0NYv1OjU8v6p017u0Fco5+Qoju/fZ97ScHhp5xGVAk5kxZBF
 DT4ovJd0nIeSr3bbWwfNzGx1waztfdzXt6n3MBKr7AhioB1m+vuk31redUdnhbtvN7O40MC+
 fgSk5/+jRGxY3IOVPooQKzUO7M51GoOg4wl9ia3H2EzOoGhN2vpTbT8qCcL92ZZZwkBRldoA
 Wn7c1hEKSTuT3f1VpSmhjnX0J4uvKZ1V2R7rooKJYFBcySC0wa8aTmAtAvLgfcpe+legOtgq
 DKzLuN45xzEjyjCiI521t8zxNMPJY9FiCPNv0sCkDwARAQABiQI8BBgBCgAmAhsMFiEE16gc
 tm0zVz86TmBYpjY8MQWQtG0FAlxKNJYFCQnQrVkACgkQpjY8MQWQtG2Xxg//RrRP+PFYuNXt
 9C5hec/JoY24TkGPPd2tMC9usWZVImIk7VlHlAeqHeE0lWU0LRGIvOBITbS9izw6fOVQBvCA
 Fni56S12fKLusWgWhgu03toT9ZGxZ9W22yfw5uThSHQ4y09wRWAIYvhJsKnPGGC2KDxFvtz5
 4pYYNe8Icy4bwsxcgbaSFaRh+mYtts6wE9VzyJvyfTqbe8VrvE+3InG5rrlNn51AO6M4Wv20
 iFEgYanJXfhicl0WCQrHyTLfdB5p1w+072CL8uryHQVfD0FcDe+J/wl3bmYze+aD1SlPzFoI
 MaSIXKejC6oh6DAT4rvU8kMAbX90T834Mvbc3jplaWorNJEwjAH/r+v877AI9Vsmptis+rni
 JwUissjRbcdlkKBisoUZRPmxQeUifxUpqgulZcYwbEC/a49+WvbaYUriaDLHzg9xisijHwD2
 yWV8igBeg+cmwnk0mPz8tIVvwi4lICAgXob7HZiaqKnwaDXs4LiS4vdG5s/ElnE3rIc87yru
 24n3ypeDZ6f5LkdqL1UNp5/0Aqbr3EiN7/ina4YVyscy9754l944kyHnnMRLVykg0v+kakj0
 h0RJ5LbfLAMM8M52KIA3y14g0Fb7kHLcOUMVcgfQ3PrN6chtC+5l6ouDIlSLR3toxH8Aam7E
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <f87bbb29-fffd-dee0-8b76-857bb52eb1bb@citrix.com>
Date: Tue, 11 Jun 2019 11:12:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <5CFF774D0200007800236E83@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 2/2] arm: rename tiny64.conf to
 tiny64_defconfig
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNi8xMS8xOSAxMDo0MSBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTEuMDYuMTkg
YXQgMTE6MjcsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+IEhpIEphbiwKPj4KPj4g
T24gNi8xMS8xOSA3OjQzIEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+IE9uIDEwLjA2LjE5
IGF0IDIyOjAzLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+Pj4+IEhpLAo+Pj4+Cj4+
Pj4gT24gNi81LzE5IDU6MDEgUE0sIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+PiAgICA+IE9uIDA1
LzA2LzIwMTkgMTY6NTgsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gSnVsaWVuLAo+Pj4+Pj4K
Pj4+Pj4+Pj4+IE9uIDE2LjA1LjE5IGF0IDE1OjM3LCA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5j
b20+IHdyb3RlOgo+Pj4+Pj4+IEFzIGJ1aWxkIHN5c3RlbSBub3cgc3VwcG9ydHMgKl9kZWZjb25m
aWcgcnVsZXMgaXQgaXMgZ29vZCB0byBiZSBhYmxlCj4+Pj4+Pj4gdG8gY29uZmlndXJlIG1pbmlt
YWwgWEVOIGltYWdlIHdpdGgKPj4+Pj4+Pgo+Pj4+Pj4+ICAgIG1ha2UgdGlueTY0X2RlZmNvbmZp
Zwo+Pj4+Pj4+Cj4+Pj4+Pj4gY29tbWFuZC4KPj4+Pj4+Pgo+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6
IFZvbG9keW15ciBCYWJjaHVrIDx2b2xvZHlteXJfYmFiY2h1a0BlcGFtLmNvbT4KPj4+Pj4+Cj4+
Pj4+PiB5b3UgaGFkIG9iamVjdGlvbnMgaGVyZSwgYW5kIHRoZSBmaXJzdCBwYXRjaCBtYWtlcyBs
aXR0bGUgc2Vuc2UKPj4+Pj4+IHdpdGhvdXQgdGhlIDJuZC4gTWF5IEkgYXNrIHdoYXQgdGhlIHZl
cmRpY3QgaXMsIGkuZS4gd2hldGhlciBJIHNob3VsZAo+Pj4+Pj4gZHJvcCB0aGVzZSB0d28gZnJv
bSBteSBsaXN0IG9mIHBlbmRpbmcgcGF0Y2hlcz8KPj4+Pj4KPj4+Pj4gVm9sb2R5bXlyIHdhcyBn
b2luZyB0byByZXNlbmQgdGhlIHNlcmllcyB3aXRoIGRvY3VtZW50YXRpb24gKGFzIGEKPj4+Pj4g
c2VwYXJhdGUgcGF0Y2gpLiBCdXQgSSB3b3VsZCBiZSBoYXBweSB0byB0YWtlICMxIGFuZCAjMiBh
c3N1bWluZyB0aGF0Cj4+Pj4+IGRvY3VtZW50YXRpb24gcGF0Y2ggaXMgZ29pbmcgdG8gYmUgc2Vu
dC4KPj4+Pj4KPj4+Pj4gWW91IGNhbiBjb25zaWRlciB0aGlzIGFzIGFuIGFja2VkOgo+Pj4+Pgo+
Pj4+PiBBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gZm9yIHRo
ZSB0d28gcGF0Y2hlcy4KPj4+Pgo+Pj4+IEkgd2FzIGFib3V0IHRvIGFwcGx5IHRoZSB0d28gcGF0
Y2hlcywgYnV0IEkgZG9uJ3Qgc2VlbSB0byBiZSBhYmxlIHRvCj4+Pj4gYXBwbHkgaXQgYmVjYXVz
ZSBzb21lIGxpbmVzIGNvbnRhaW5zID0yMC4gQUZBSUNULCBpdCBpcyBpbiByZXBsYWNlbWVudAo+
Pj4+IG9mICJzcGFjZSIgaW4gY2VydGFpbiBjYXNlLgo+Pj4KPj4+IFdlbGwsIGluZGVwZW5kZW50
IG9mIGFueSBmb3JtYXR0aW5nIGlzc3VlcyB5b3Ugb3VnaHQgdG8gaGF2ZSB0cm91YmxlCj4+PiBh
cHBseWluZyB0aGVtIHNpbmNlIEkgZGlkIHNvIGFscmVhZHkuCj4+Cj4+IEhtbSwgSSBtaXNzZWQg
dGhhdC4gU29ycnkgZm9yIG5vaXNlLgo+Pgo+PiBPdXQgb2YgaW50ZXJlc3QsIGhvdyBkaWQgeW91
IG1hbmFnZSB0byBhcHBseSBpdCB3aXRoIHRoZSA9MjAgaW4gdGhlIHBhdGNoPwo+IAo+IFRoZXJl
IGFyZSBubyA9MjAgaW4gdGhlIG1haWwgdGhhdCBJIGRpZCByZWNlaXZlLgoKSSB0aGluayBgZ2l0
IGFtYCBrbm93cyBob3cgdG8gZGVhbCB3aXRoIHRob3NlIGFjdHVhbGx5LgoKIC1HZW9yZ2UKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
