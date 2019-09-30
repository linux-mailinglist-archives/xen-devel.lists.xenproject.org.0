Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C27E2C1F77
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 12:45:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEt9N-0005JF-SB; Mon, 30 Sep 2019 10:43:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ff+y=XZ=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iEt9L-0005J0-O6
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 10:43:27 +0000
X-Inumbo-ID: 221887be-e36f-11e9-bf31-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by localhost (Halon) with ESMTPS
 id 221887be-e36f-11e9-bf31-bc764e2007e4;
 Mon, 30 Sep 2019 10:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569840207;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Kk1MhftAhXXcq4MOScMm4hDgWsbxnYeHaEaDxvkP3WU=;
 b=GKEKmDYNEMCqRHBTJZc1uCp2sYlWcRKGvRQUrbXyJKX6Hg0XlbScpghc
 ljhSaER5klM6nd6P7mfD0VIaJTuMpc3of9RdKXe/TTSdEy62yvyOPiNc3
 MXyKm9R9zlm1ocbEywWkyJUvQAJTdgXBA/fKHsbYvuT1C8GXxtLJlITD7 I=;
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
IronPort-SDR: swr1q+4kAMpRdQhDp4+RW+kRMAJWlBV/caPZuZ5y4uT23wROYrlP/5Y9zII7xUhiDm6/q14no/
 byy4W/qKFkAlsi6M/thFojVF3pE7YwOz9O5YO24z86ZPHvMgOuNNbRCyPqeCbyW1sF9lcjlpcI
 ZCUNkk/JL1ROIRf1TjkmFX4ZGXJ1RnpGea9tbb5FwvrqcA27f4QVYAd2qRC14DtTXtpvlUmLqZ
 XB+xj7vFy9egEP8uYARj9b7uaQqge5+leIfbsKSRZ6K71Xo+DUeNr43ER5GsrJaOIX93SyJXyN
 t5E=
X-SBRS: 2.7
X-MesageID: 6248803
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,565,1559534400"; 
   d="scan'208";a="6248803"
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190930052135.11257-1-jgross@suse.com>
 <20190930052135.11257-2-jgross@suse.com>
 <e8b69bec-d9e2-8803-bc0a-4c3c315f97f2@suse.com>
 <9fca36ed-4090-8e35-1aec-2273dc74ab8d@citrix.com>
 <60f98176-cfd7-460e-f5f8-05f263403bfa@suse.com>
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
Message-ID: <f6f8f098-a0bd-a2c1-3770-ea9387c3114b@citrix.com>
Date: Mon, 30 Sep 2019 11:43:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <60f98176-cfd7-460e-f5f8-05f263403bfa@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 01/19] xen/sched: add code to sync
 scheduling of all vcpus of a sched unit
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek
 Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim
 Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>,
 xen-devel@lists.xenproject.org, VolodymyrBabchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOS8zMC8xOSAxMTozOSBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMzAuMDkuMjAxOSAx
MjozOCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMzAvMDkvMjAxOSAxMTozNiwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBPbiAzMC4wOS4yMDE5IDA3OjIxLCBKdWVyZ2VuIEdyb3NzIHdyb3Rl
Ogo+Pj4+IFdoZW4gc3dpdGNoaW5nIHNjaGVkIHVuaXRzIHN5bmNocm9uaXplIGFsbCB2Y3B1cyBv
ZiB0aGUgbmV3IHVuaXQgdG8gYmUKPj4+PiBzY2hlZHVsZWQgYXQgdGhlIHNhbWUgdGltZS4KPj4+
Pgo+Pj4+IEEgdmFyaWFibGUgc2NoZWRfZ3JhbnVsYXJpdHkgaXMgYWRkZWQgd2hpY2ggaG9sZHMg
dGhlIG51bWJlciBvZiB2Y3B1cwo+Pj4+IHBlciBzY2hlZHVsZSB1bml0Lgo+Pj4+Cj4+Pj4gQXMg
dGFza2xldHMgcmVxdWlyZSB0byBzY2hlZHVsZSB0aGUgaWRsZSB1bml0IGl0IGlzIHJlcXVpcmVk
IHRvIHNldCB0aGUKPj4+PiB0YXNrbGV0X3dvcmtfc2NoZWR1bGVkIHBhcmFtZXRlciBvZiBkb19z
Y2hlZHVsZSgpIHRvIHRydWUgaWYgYW55IGNwdQo+Pj4+IGNvdmVyZWQgYnkgdGhlIGN1cnJlbnQg
c2NoZWR1bGUoKSBjYWxsIGhhcyBhbnkgcGVuZGluZyB0YXNrbGV0IHdvcmsuCj4+Pj4KPj4+PiBG
b3Igam9pbmluZyBvdGhlciB2Y3B1cyBvZiB0aGUgc2NoZWR1bGUgdW5pdCB3ZSBuZWVkIHRvIGFk
ZCBhIG5ldwo+Pj4+IHNvZnRpcnEgU0NIRURfU0xBVkVfU09GVElSUSBpbiBvcmRlciB0byBoYXZl
IGEgd2F5IHRvIGluaXRpYXRlIGEKPj4+PiBjb250ZXh0IHN3aXRjaCB3aXRob3V0IGNhbGxpbmcg
dGhlIGdlbmVyaWMgc2NoZWR1bGUoKSBmdW5jdGlvbgo+Pj4+IHNlbGVjdGluZyB0aGUgdmNwdSB0
byBzd2l0Y2ggdG8sIGFzIHdlIGFscmVhZHkga25vdyB3aGljaCB2Y3B1IHdlCj4+Pj4gd2FudCB0
byBydW4uIFRoaXMgaGFzIHRoZSBvdGhlciBhZHZhbnRhZ2Ugbm90IHRvIGxvb3NlIGFueSBvdGhl
cgo+Pj4+IGNvbmN1cnJlbnQgU0NIRURVTEVfU09GVElSUSBldmVudHMuCj4+Pj4KPj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4+Pj4gUmV2aWV3ZWQt
Ynk6IERhcmlvIEZhZ2dpb2xpIDxkZmFnZ2lvbGlAc3VzZS5jb20+Cj4+PiB4ODYgYW5kIGFwcGxp
Y2FibGUgY29tbW9uIGNvZGUgcGFydHMKPj4+IEFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+Cj4+Pgo+Pj4gSG93ZXZlciwgLi4uCj4+Pgo+Pj4+ICtzdGF0aWMgdm9pZCBz
Y2hlZF9jb250ZXh0X3N3aXRjaChzdHJ1Y3QgdmNwdSAqdnByZXYsIHN0cnVjdCB2Y3B1ICp2bmV4
dCwKPj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc190aW1lX3Qgbm93KQo+
Pj4+ICt7Cj4+Pj4gKyAgICBpZiAoIHVubGlrZWx5KHZwcmV2ID09IHZuZXh0KSApCj4+Pj4gICAg
ICB7Cj4+Pj4gLSAgICAgICAgcGNwdV9zY2hlZHVsZV91bmxvY2tfaXJxKGxvY2ssIGNwdSk7Cj4+
Pj4gICAgICAgICAgVFJBQ0VfNEQoVFJDX1NDSEVEX1NXSVRDSF9JTkZDT05ULAo+Pj4+IC0gICAg
ICAgICAgICAgICAgIG5leHQtPmRvbWFpbi0+ZG9tYWluX2lkLCBuZXh0LT51bml0X2lkLAo+Pj4+
IC0gICAgICAgICAgICAgICAgIG5vdyAtIHByZXYtPnN0YXRlX2VudHJ5X3RpbWUsCj4+Pj4gLSAg
ICAgICAgICAgICAgICAgcHJldi0+bmV4dF90aW1lKTsKPj4+PiAtICAgICAgICB0cmFjZV9jb250
aW51ZV9ydW5uaW5nKG5leHQtPnZjcHVfbGlzdCk7Cj4+Pj4gLSAgICAgICAgcmV0dXJuIGNvbnRp
bnVlX3J1bm5pbmcocHJldi0+dmNwdV9saXN0KTsKPj4+PiArICAgICAgICAgICAgICAgICB2bmV4
dC0+ZG9tYWluLT5kb21haW5faWQsIHZuZXh0LT5zY2hlZF91bml0LT51bml0X2lkLAo+Pj4+ICsg
ICAgICAgICAgICAgICAgIG5vdyAtIHZwcmV2LT5ydW5zdGF0ZS5zdGF0ZV9lbnRyeV90aW1lLAo+
Pj4+ICsgICAgICAgICAgICAgICAgIHZwcmV2LT5zY2hlZF91bml0LT5uZXh0X3RpbWUpOwo+Pj4+
ICsgICAgICAgIHNjaGVkX2NvbnRleHRfc3dpdGNoZWQodnByZXYsIHZuZXh0KTsKPj4+PiArICAg
ICAgICB0cmFjZV9jb250aW51ZV9ydW5uaW5nKHZuZXh0KTsKPj4+PiArICAgICAgICByZXR1cm4g
Y29udGludWVfcnVubmluZyh2cHJldik7Cj4+Pj4gICAgICB9Cj4+PiAuLi4gSSBkb24ndCByZWNh
bGwgaWYgdGhlcmUgd2VyZW4ndCBjb21waWxlciAoY2xhbmc/KSB2ZXJzaW9ucyBub3QKPj4+IGFs
bG93aW5nIChvciBhdCBsZWFzdCB3YXJuaW5nIGFib3V0KSB1c2Ugb2YgdGhpcyBleHRlbnNpb24u
Cj4+Cj4+IFdoaWNoIGV4dGVuc2lvbj8KPiAKPiAicmV0dXJuIiB3aXRoIGFuIGV4cHJlc3Npb24g
b2YgInZvaWQiIHR5cGUuCgpJIHRoaW5rIHRoYXQgbXVzdCBiZSBhIG1pc3Rha2UuICBJbiB0aGlz
IGluc3RhbmNlIHRoZXJlIGlzbid0IHJlYWxseQpldmVuIGEgInN5bnRhY3RpYyBzdWdhciIqIHJl
YXNvbiB0byB1c2UgaXQuCgogLUdlb3JnZQoKKiBTeW50YWN0aWMgc3VnYXIgYmVpbmcgdG8gZG8g
c29tZXRoaW5nIGxpa2U6CgppZiAoIGJsYWggKQogICByZXR1cm4gZm9vKCk7CgpyYXRoZXIgdGhh
bgoKaWYgKCBibGFoICkgewogICAgZm9vKCk7CiAgICByZXR1cm47Cn0KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
