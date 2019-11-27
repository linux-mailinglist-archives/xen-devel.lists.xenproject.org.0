Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC6D10B383
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 17:36:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ia0GV-0007ha-3I; Wed, 27 Nov 2019 16:34:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LuZI=ZT=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1ia0GT-0007gz-Ek
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 16:34:05 +0000
X-Inumbo-ID: b6677e24-1133-11ea-a3b9-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b6677e24-1133-11ea-a3b9-12813bfff9fa;
 Wed, 27 Nov 2019 16:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574872440;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Nr9dYmVysKk9367UpWjGRKaqizmIHQw7fbGSsNGazYI=;
 b=Qv8aQk/tV7kII66+DLuDGFa1wwCIU9JL6Vnvbln2o5NK+1Ti/NesEWoK
 AKkmiC4gEEtX2PyBWOCli0kd2zIx6QEn1ukKUtZPrzJBtWZc0I0vmZNI2
 OkMFQTV8Khgm6GyWXCsKonBLXizglFPVF2Q4Oqdv2ALkuwPXZ+ZME+/A/ A=;
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
IronPort-SDR: xbyB+cUmsknxbUljcsy0HVRPh+rddUAAXqE0gdYFcavcpaA+N8sWAzf7Y2u7fG12yX9EqYx7vy
 mivcVZndDGpZQ0gf9DfTXUj14SbP4NTCOFPquHKZpIJhDhmY0yR6IwPnF3OMh3soJBzdkkbaEM
 fWHtGy9TDXTI/bVgm9OkVsNd9/KTxUJSmDi2D8Yb+SUvkhrZYxuYQHA7HV39A3hc3fQxiPe6Nv
 Vvc3qT7GU0VW3R9P1+Vv8wgpUMyfBRUBOJ+M3hbxDPPIse5c/Tp4jZoEjCmPj7zU5y5dEYBCYX
 eMM=
X-SBRS: 2.7
X-MesageID: 8910507
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,250,1571716800"; 
   d="scan'208";a="8910507"
To: Jan Beulich <jbeulich@suse.com>, "Durrant, Paul" <pdurrant@amazon.com>
References: <20191127143711.4377-1-pdurrant@amazon.com>
 <31090dd0-a8e5-7716-40a6-0e72de7f7934@suse.com>
 <a644007e77374b90b5abf11a76b2331d@EX13D32EUC003.ant.amazon.com>
 <d581a826-0959-1e8e-f78f-65a0f10b4b65@suse.com>
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
Message-ID: <bfdfac8d-8f80-7d79-ba8b-b781de1b310a@citrix.com>
Date: Wed, 27 Nov 2019 16:33:54 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <d581a826-0959-1e8e-f78f-65a0f10b4b65@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] Rationalize max_grant_frames and
 max_maptrack_frames handling
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 AndrewCooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEvMjcvMTkgNDoyMCBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjcuMTEuMjAxOSAx
NzoxNCwgIER1cnJhbnQsIFBhdWwgIHdyb3RlOgo+Pj4gRnJvbTogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPgo+Pj4gU2VudDogMjcgTm92ZW1iZXIgMjAxOSAxNTo1Ngo+Pj4KPj4+IE9u
IDI3LjExLjIwMTkgMTU6MzcsIFBhdWwgRHVycmFudCB3cm90ZToKPj4+PiAtLS0gYS94ZW4vYXJj
aC9hcm0vc2V0dXAuYwo+Pj4+ICsrKyBiL3hlbi9hcmNoL2FybS9zZXR1cC5jCj4+Pj4gQEAgLTc4
OSw3ICs3ODksNyBAQCB2b2lkIF9faW5pdCBzdGFydF94ZW4odW5zaWduZWQgbG9uZwo+Pj4gYm9v
dF9waHlzX29mZnNldCwKPj4+PiAgICAgICAgICAuZmxhZ3MgPSBYRU5fRE9NQ1RMX0NERl9odm0g
fCBYRU5fRE9NQ1RMX0NERl9oYXAsCj4+Pj4gICAgICAgICAgLm1heF9ldnRjaG5fcG9ydCA9IC0x
LAo+Pj4+ICAgICAgICAgIC5tYXhfZ3JhbnRfZnJhbWVzID0gZ250dGFiX2RvbTBfZnJhbWVzKCks
Cj4+Pj4gLSAgICAgICAgLm1heF9tYXB0cmFja19mcmFtZXMgPSBvcHRfbWF4X21hcHRyYWNrX2Zy
YW1lcywKPj4+PiArICAgICAgICAubWF4X21hcHRyYWNrX2ZyYW1lcyA9IC0xLAo+Pj4+ICAgICAg
fTsKPj4+PiAgICAgIGludCByYzsKPj4+Pgo+Pj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9zZXR1cC5j
Cj4+Pj4gKysrIGIveGVuL2FyY2gveDg2L3NldHVwLmMKPj4+PiBAQCAtNjk3LDggKzY5Nyw4IEBA
IHZvaWQgX19pbml0IG5vcmV0dXJuIF9fc3RhcnRfeGVuKHVuc2lnbmVkIGxvbmcKPj4+IG1iaV9w
KQo+Pj4+ICAgICAgc3RydWN0IHhlbl9kb21jdGxfY3JlYXRlZG9tYWluIGRvbTBfY2ZnID0gewo+
Pj4+ICAgICAgICAgIC5mbGFncyA9IElTX0VOQUJMRUQoQ09ORklHX1RCT09UKSA/IFhFTl9ET01D
VExfQ0RGX3MzX2ludGVncml0eQo+Pj4gOiAwLAo+Pj4+ICAgICAgICAgIC5tYXhfZXZ0Y2huX3Bv
cnQgPSAtMSwKPj4+PiAtICAgICAgICAubWF4X2dyYW50X2ZyYW1lcyA9IG9wdF9tYXhfZ3JhbnRf
ZnJhbWVzLAo+Pj4+IC0gICAgICAgIC5tYXhfbWFwdHJhY2tfZnJhbWVzID0gb3B0X21heF9tYXB0
cmFja19mcmFtZXMsCj4+Pj4gKyAgICAgICAgLm1heF9ncmFudF9mcmFtZXMgPSAtMSwKPj4+PiAr
ICAgICAgICAubWF4X21hcHRyYWNrX2ZyYW1lcyA9IC0xLAo+Pj4+ICAgICAgfTsKPj4+Cj4+PiBX
aXRoIHRoZXNlIHRoZXJlJ3Mgbm8gbmVlZCBhbnltb3JlIGZvciBvcHRfbWF4X21hcHRyYWNrX2Zy
YW1lcyB0bwo+Pj4gYmUgbm9uLXN0YXRpYy4gU2FkbHkgQXJtIHN0aWxsIHdhbnRzIG9wdF9tYXhf
Z3JhbnRfZnJhbWVzCj4+PiBhY2Nlc3NpYmxlIGluIGdudHRhYl9kb20wX2ZyYW1lcygpLgo+Pgo+
PiBZZXMsIEkgd2FzIGFib3V0IHRvIG1ha2UgdGhlbSBzdGF0aWMgdW50aWwgSSBzYXcgd2hhdCB0
aGUgQVJNIGNvZGUgZGlkLgo+IAo+IEJ1dCB0aGUgb25lIHRoYXQgQXJtIGRvZXNuJ3QgbmVlZCBz
aG91bGQgYmVjb21lIHN0YXRpYyBub3cuCj4gCj4+Pj4gLS0tIGEveGVuL2NvbW1vbi9ncmFudF90
YWJsZS5jCj4+Pj4gKysrIGIveGVuL2NvbW1vbi9ncmFudF90YWJsZS5jCj4+Pj4gQEAgLTE4Mzcs
MTIgKzE4MzcsMTggQEAgYWN0aXZlX2FsbG9jX2ZhaWxlZDoKPj4+PiAgICAgIHJldHVybiAtRU5P
TUVNOwo+Pj4+ICB9Cj4+Pj4KPj4+PiAtaW50IGdyYW50X3RhYmxlX2luaXQoc3RydWN0IGRvbWFp
biAqZCwgdW5zaWduZWQgaW50IG1heF9ncmFudF9mcmFtZXMsCj4+Pj4gLSAgICAgICAgICAgICAg
ICAgICAgIHVuc2lnbmVkIGludCBtYXhfbWFwdHJhY2tfZnJhbWVzKQo+Pj4+ICtpbnQgZ3JhbnRf
dGFibGVfaW5pdChzdHJ1Y3QgZG9tYWluICpkLCBpbnQgbWF4X2dyYW50X2ZyYW1lcywKPj4+PiAr
ICAgICAgICAgICAgICAgICAgICAgaW50IG1heF9tYXB0cmFja19mcmFtZXMpCj4+Pj4gIHsKPj4+
PiAgICAgIHN0cnVjdCBncmFudF90YWJsZSAqZ3Q7Cj4+Pj4gICAgICBpbnQgcmV0ID0gLUVOT01F
TTsKPj4+Pgo+Pj4+ICsgICAgLyogRGVmYXVsdCB0byBtYXhpbXVtIHZhbHVlIGlmIG5vIHZhbHVl
IHdhcyBzcGVjaWZpZWQgKi8KPj4+PiArICAgIGlmICggbWF4X2dyYW50X2ZyYW1lcyA8IDAgKQo+
Pj4+ICsgICAgICAgIG1heF9ncmFudF9mcmFtZXMgPSBvcHRfbWF4X2dyYW50X2ZyYW1lczsKPj4+
PiArICAgIGlmICggbWF4X21hcHRyYWNrX2ZyYW1lcyA8IDAgKQo+Pj4+ICsgICAgICAgIG1heF9t
YXB0cmFja19mcmFtZXMgPSBvcHRfbWF4X21hcHRyYWNrX2ZyYW1lczsKPj4+PiArCj4+Pj4gICAg
ICBpZiAoIG1heF9ncmFudF9mcmFtZXMgPCBJTklUSUFMX05SX0dSQU5UX0ZSQU1FUyB8fAo+Pj4K
Pj4+IEkgdGFrZSBpdCB3ZSBkb24ndCBleHBlY3QgcGVvcGxlIHRvIHNwZWNpZnkgMl5eMzEgb3Ig
bW9yZQo+Pj4gZnJhbWVzIGZvciBlaXRoZXIgb3B0aW9uLiBJdCBsb29rcyBsaWtlIGFsbW9zdCBl
dmVyeXRoaW5nCj4+PiBoZXJlIHdvdWxkIGNvcGUsIGV4Y2VwdCBmb3IgdGhpcyB2ZXJ5IGNvbXBh
cmlzb24uIE5ldmVydGhlbGVzcwo+Pj4gSSB3b25kZXIgd2hldGhlciB5b3Ugd291bGRuJ3QgYmV0
dGVyIGNvbmZpbmUgYm90aCB2YWx1ZXMgdG8KPj4+IFswLCBJTlRfTUFYXSBub3csIGluY2x1ZGlu
ZyB3aGVuIGFkanVzdGVkIGF0IHJ1bnRpbWUuCj4+Cj4+IEkgY2FuIGNlcnRhaW5seSByZW1vdmUg
dGhlICdVJyBmcm9tIHRoZSBkZWZpbml0aW9uIG9mCj4+IElOSVRJQUxfTlJfR1JBTlRfRlJBTUVT
LAo+IAo+IE9oLCBJIGRpZG4ndCBwYXkgYXR0ZW50aW9uIHRoYXQgaXMgaGFzIGEgVSBvbiBpdCAt
IGluIHRoaXMgY2FzZQo+IHRoZSBjb21wYXJpc29uIGFib3ZlIGlzIGZpbmUuCj4gCj4+IGJ1dCBk
byB5b3Ugd2FudCBtZSB0byBtYWtlIG9wdF9tYXhfZ3JhbnRfZnJhbWVzIGFuZAo+PiBvcHRfbWF4
X21hcHRyYWNrX2ZyYW1lcyBpbnRvIHNpZ25lZCBpbnRzIGFuZCBhZGQgc2lnbmVkIHBhcnNlcgo+
PiBjb2RlIHRvbz8KPiAKPiBEZWZpbml0ZWx5IG5vdC4gVGhleSBzaG91bGQgcmVtYWluIHVuc2ln
bmVkIHF1YW50aXRpZXMsIGJ1dCB0aGVpcgo+IHZhbHVlcyBtYXkgbmVlZCBzYW5pdHkgY2hlY2tp
bmcgbm93Lgo+IAo+PiBJIGFsc28gZG9uJ3QgdW5kZXJzdGFuZCB0aGUgJ2FkanVzdGVkIGF0IHJ1
bnRpbWUnIHBhcnQuCj4gCj4gV2VsbCwgZm9yIGEgY29tbWFuZCBsaW5lIGRyaXZlIHZhbHVlIHlv
dSBjb3VsZCBhZGp1c3QgYW4gb3V0IG9mCj4gYm91bmRzIHZhbHVlIGluIHNvbWUgX19pbml0IGZ1
bmN0aW9uLiBCdXQgZm9yIHJ1bnRpbWUgbW9kaWZpYWJsZQo+IHNldHRpbmdzIHlvdSB3b24ndCBn
ZXQgYXdheSB0aGlzIGVhc2lseS4KClRCSCBJJ2QgYmUgdGVtcHRlZCB0byBkZWZpbmUgWEVOU09N
RVRISU5HX01BWF9ERUZBVUxUIGFzICh1bnNpZ25lZApsb25nKSgtMSkgb3Igc29tZXRoaW5nLCBh
bmQgZXhwbGljaXRseSBjb21wYXJlIHRvIHRoYXQuICBUaGF0IGxlYXZlcwpvcGVuIHRoZSBwb3Nz
aWJpbGl0eSBvZiBoYXZpbmcgbW9yZSBzZW50aW5lbCB2YWx1ZXMgaWYgd2UgZGVjaWRlZCB3ZQp3
YW50ZWQgdGhlbS4KCiAtR2VvcmdlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
