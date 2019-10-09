Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3DDD0CBF
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2019 12:25:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iI96F-0001Yk-SX; Wed, 09 Oct 2019 10:21:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4ly3=YC=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iI96E-0001Yc-JN
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2019 10:21:42 +0000
X-Inumbo-ID: 95ef3b72-ea7e-11e9-80e3-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 95ef3b72-ea7e-11e9-80e3-bc764e2007e4;
 Wed, 09 Oct 2019 10:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570616502;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=LwlBP2grImDBTa+/xdr7Juf7EaveuV9QSO00MAAbdC8=;
 b=X991Sow9tjo2Yy+M47R5Igm3dF3rtTDvkOnjtIiqy+El0n/cvrLxCmeL
 6EYt0eyTlCpRq2b8Danjj7Vq5u702e0rpyeynDQdOHFrjfFHfFLM0y00w
 3RbpaRyYCA1+JGcEvw1ncfv0/ZUoh1YOdHfE2o+Rv3GVhY/DOEXjIzF9z 4=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: EhE7SC3ZxxPIAQKi9QstvclEx5HsWV2SXsrVj18nalcwbtvMh1vGA4fBAx4HZbMgG5cSxEmHVL
 QZ08g3v6qBhyseI+UOH/vkL33SaHm9gKycraYcnLMEqoMEtWNADmfj054tjlFZwwmAhUQNO8yw
 i/aIZt3ujCKjJNtbbEqZ6s2KbgcyxNMoJ0baD9OBXH7OgQGGd7H8l/juG8+jNUQkAhkkELB6GJ
 FTjzxl8+YGFYaXs3QrjuR142X9H35C6WylDUXk8DJCCMjk0yUJ/tn0A5Stp6o8oyYz1g5VmeD5
 IKk=
X-SBRS: 2.7
X-MesageID: 6652030
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,273,1566878400"; 
   d="scan'208";a="6652030"
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <d1ca6ac5-0ed4-200f-c4e0-7a657b8d8fa8@suse.com>
 <0945a089-6fdb-89aa-f5a8-b8cc35f83f17@citrix.com>
 <8a7e1532-36cd-0b68-3655-c9ce990087ce@suse.com>
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
Message-ID: <921fcf16-66bc-c053-e4e4-823a38b7a4da@citrix.com>
Date: Wed, 9 Oct 2019 11:21:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <8a7e1532-36cd-0b68-3655-c9ce990087ce@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3] x86/mm: don't needlessly veto migration
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, George Dunlap <George.Dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAvOS8xOSAxMToxNiBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDguMTAuMjAxOSAx
ODozOCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMDgvMTAvMjAxOSAxNzoxMCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBGcm9tOiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXgu
Y29tPgo+Pj4KPj4+IE5vdyB0aGF0IHhsLmNmZyBoYXMgYW4gb3B0aW9uIHRvIGV4cGxpY2l0bHkg
ZW5hYmxlIElPTU1VIG1hcHBpbmdzIGZvciBhCj4+PiBkb21haW4sIG1pZ3JhdGlvbiBtYXkgYmUg
bmVlZGxlc3NseSB2ZXRvZWQgZHVlIHRvIHRoZSBjaGVjayBvZgo+Pj4gaXNfaW9tbXVfZW5hYmxl
ZCgpIGluIHBhZ2luZ19sb2dfZGlydHlfZW5hYmxlKCkuCj4+PiBUaGVyZSBpcyBhY3R1YWxseSBu
byBuZWVkIHRvIHByZXZlbnQgbG9nZGlydHkgZnJvbSBiZWluZyBlbmFibGVkIHVubGVzcwo+Pj4g
ZGV2aWNlcyBhcmUgYXNzaWduZWQgdG8gYSBkb21haW4uCj4+Pgo+Pj4gTk9URTogV2hpbGUgaW4g
dGhlIG5laWdoYm91cmhvb2QsIHRoZSBib29sX3QgcGFyYW1ldGVyIHR5cGUgaW4KPj4+ICAgICAg
IHBhZ2luZ19sb2dfZGlydHlfZW5hYmxlKCkgaXMgcmVwbGFjZWQgd2l0aCBhIGJvb2wgYW5kIHRo
ZSBmb3JtYXQKPj4+ICAgICAgIG9mIHRoZSBjb21tZW50IGluIGFzc2lnbl9kZXZpY2UoKSBpcyBm
aXhlZC4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBj
aXRyaXguY29tPgo+Pj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgo+Pj4gUmVsZWFzZS1hY2tlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29t
Pgo+Pgo+PiBTZXJpb3VzbHkgRkZTLsKgIFdoeSBhbSBJIGhhdmluZyB0byByZXBlYXQgbXlzZWxm
P8KgIFdoYXQgaWYgYW55IHdheQo+PiB1bmNsZWFyIG9uIHRoZSBwcmV2aW91cyB0aHJlYWRzPwo+
Pgo+PiBOQUNLIE5BQ0sgTkFDSy4KPiAKPiBXaXRoIEdlb3JnZSBoYXZpbmcgZ2l2ZW4gaGlzIFIt
YiBJJ20gbm93IGluIGFuIGF3a3dhcmQgcG9zaXRpb246Cj4gSSBzaG91bGRuJ3QgaWdub3JlIHRo
aXMgdHJpcGxlIE5BQ0sgYW5kIGNvbW1pdCB0aGUgcGF0Y2gsIGJ1dAo+IHRoZXJlJ3MgYWxzbyBu
byBzZW5zaWJsZSB3YXkgZm9yd2FyZCBoZXJlIHdoaWNoIHdvdWxkIGFsbG93IHRoZQo+IHJlZ3Jl
c3Npb24gdG8gYmUgdGFrZW4gY2FyZSBvZiB3aXRob3V0IGNvbW1pdHRpbmcgdGhlIHBhdGNoIGlu
Cj4gaXRzIGN1cnJlbnQgc2hhcGUuIEFyZSB5b3Ugd2lsbGluZyB0byB0YWtlIGJhY2sgYWxsIHRo
cmVlIG9mIHRoZQo+IE5BQ0tzLCBhbGxvd2luZyB1cyB0byBjb250aW51ZSBkaXNjdXNzaW9uIG9u
IHRoZSBjb250cm92ZXJzaWFsCj4gcGFydCBvZiBQYXVsJ3MgcGF0Y2ggd2hpbGUgYWxzbyBhbGxv
d2luZyB0aGUgbm9uLWNvbnRyb3ZlcnNpYWwKPiBwYXJ0IHRvIGdvIGluIHJpZ2h0IGF3YXk/CgpS
ZWdhcmRsZXNzIG9mIHRoZSBtZXJpdHMgb2YgdGhlIGNoYW5nZSBBbmR5IHdhbnRzIHRvIHNlZSwg
aXQncyBub3QgYSBvbmUKdGhhdCBzaG91bGQgYmUgbWFkZSBkdXJpbmcgYSBmZWF0dXJlIGZyZWV6
ZS4KCiAtR2VvcmdlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
