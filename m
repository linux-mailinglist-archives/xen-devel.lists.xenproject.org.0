Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDE2145353
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 12:00:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuDhi-0004c5-4j; Wed, 22 Jan 2020 10:57:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/bdw=3L=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iuDhg-0004c0-Do
 for xen-devel@lists.xen.org; Wed, 22 Jan 2020 10:57:44 +0000
X-Inumbo-ID: 03305495-3d06-11ea-bc1d-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 03305495-3d06-11ea-bc1d-12813bfff9fa;
 Wed, 22 Jan 2020 10:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579690662;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=DDTOCtT6jFanYQshAxVGgvWnFEXiwY+CXAHElfTFoFA=;
 b=CK3EDresxE9y4QndIRVHDkWdjckIxnL7596+Vp4qlgJuhtLyTO3X3C0d
 inKSndHwgmBkd85VhGoPdMU3iw7CSnTJf27ccdlM0MCOCIHY4ig+kOFGW
 fDAAmN109gFlIAzjBh/1Iq7HOD8l0bQH/OcUwVg5L5btSjB74PbYedyfN 8=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: aAQXfAspRMb+cXISM9WJFSCEEyLxKsTY0GCpE5j3ZypRwzekzvljRM0whcpDkN5gN79y9+Ht27
 T3hTvWd3ZUYcxjAX9bAjolF99dSy2GLUP1FC+EenJ9tlWWNNaFgaOg93xrWtkQe3kZoU9E7Ll0
 ALlHHkyWY7ZclONyxPqo9HRbGGKBsGvR7yeob5Gt7jf6yR+BAJ29EvIAT4WMm/w+L2txMlG1ae
 h6vE64rGUSXuJFgkpbFvqTms9V2VHpZ9aPrZNdIhCGSBqYd1Q2tcVRf7XRQou6VkwSgix3JYZW
 nRM=
X-SBRS: 2.7
X-MesageID: 11692486
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,349,1574139600"; d="scan'208";a="11692486"
To: Julien Grall <julien@xen.org>, Sergey Dyasli <sergey.dyasli@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
References: <20200117164432.32245-1-sergey.dyasli@citrix.com>
 <20200117164432.32245-2-sergey.dyasli@citrix.com>
 <7049fbf6-9bac-d9bf-4505-a80a8171dd40@suse.com>
 <6223c8e8-ff2a-e4fe-fea4-8661c4c44524@citrix.com>
 <e1e6c1c9-0f11-4346-965c-f1336e0adb05@xen.org>
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
Message-ID: <18e39089-80e7-07be-d2fe-409fa1dfc083@citrix.com>
Date: Wed, 22 Jan 2020 10:57:38 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <e1e6c1c9-0f11-4346-965c-f1336e0adb05@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 2/2] xsm: hide detailed Xen version from
 unprivileged guests
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Doug Goldstein <cardoe@cardoe.com>,
 xen-devel@lists.xen.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMS8yMi8yMCAxMDoxNCBBTSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IAo+IAo+IE9uIDIyLzAx
LzIwMjAgMTA6MDEsIFNlcmdleSBEeWFzbGkgd3JvdGU6Cj4+IE9uIDIwLzAxLzIwMjAgMTA6MDEs
IEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4gT24gMTcuMDEuMjAyMCAxNzo0NCwgU2VyZ2V5IER5YXNs
aSB3cm90ZToKPj4+PiB2MiAtLT4gdjM6Cj4+Pj4gLSBSZW1vdmUgaHZtbG9hZGVyIGZpbHRlcmlu
Zwo+Pj4KPj4+IFdoeT8gU2VlaW5nIHRoZSBwcmlvciBkaXNjdXNzaW9uLCBob3cgYWJvdXQgYWRk
aW5nIFhFTlZFUl9kZW5pZWQgdG8KPj4+IHJldHVybiB0aGUgImRlbmllZCIgc3RyaW5nLCBhbGxv
d2luZyBjb21wb25lbnRzIHdoaWNoIHdhbnQgdG8gZmlsdGVyCj4+PiB0byBrbm93IGV4YWN0bHkg
d2hhdCB0byBsb29rIGZvcj8gQW5kIHRoZW4gcmUtYWRkIHRoZSBmaWx0ZXJpbmcgeW91Cj4+PiBo
YWQ/IChUaGUgaGVscCB0ZXh0IG9mIHRoZSBjb25maWcgb3B0aW9uIHNob3VsZCB0aGVuIHBlcmhh
cHMgYmUKPj4+IGV4dGVuZGVkIHRvIG1ha2UgdmVyeSBjbGVhciB0aGF0IHRoZSBjaG9zZW4gc3Ry
aW5nIHNob3VsZCBub3QgbWF0Y2gKPj4+IGFueXRoaW5nIHRoYXQgY291bGQgcG90ZW50aWFsbHkg
YmUgcmV0dXJuZWQgYnkgYW55IG9mIHRoZSBYRU5WRVJfCj4+PiBzdWItb3BzLikKPj4KPj4gSSBo
YWQgdGhlIGZvbGxvd2luZyByZWFzb25pbmc6Cj4+Cj4+IDEuIE1vc3QgcmVhbC13b3JsZCB1c2Vy
cyB3b3VsZCBzZXQgQ09ORklHX1hTTV9ERU5JRURfU1RSSU5HPSIiIGFueXdheS4KPj4KPj4gMi4g
RmlsdGVyaW5nIGluIERNSSB0YWJsZXMgaXMgbm90IGEgY29tcGxldGUgc29sdXRpb24sIHNpbmNl
IGRlbmllZAo+PiBzdHJpbmcgbGVha3MgZWxzZXdoZXJlIHRocm91Z2ggdGhlIGh5cGVyY2FsbCAo
UFYgZ3Vlc3RzLCBzeXNmcywgZHJpdmVyCj4+IGxvZ3MpIGFzIEFuZHJldyBoYXMgcG9pbnRlZCBv
dXQgaW4gdGhlIHByZXZpb3VzIGRpc2N1c3Npb24uCj4+Cj4+IE9uIHRoZSBvdGhlciBoYW5kLCBT
TUJpb3MgZmlsdGVyaW5nIHNsaWdodGx5IGltcHJvdmVzIHRoZSBzaXR1YXRpb24gZm9yCj4+IEhW
TSBkb21haW5zLCBzbyBJIGNhbiByZXR1cm4gaXQgaWYgbWFpbnRhaW5lcnMgZmluZCBpdCB3b3J0
aHkuCj4gCj4gV2hpbGUgSSBhbSBub3QgYSBtYWludGFpbmVyIG9mIHRoaXMgY29kZSwgbXkgY29u
Y2VybiBpcyB5b3UgaW1wb3NlIHRoZQo+IGNvbnZlcnNpb24gZnJvbSAiZGVuaWVkIiB0byAiIiB0
byBhbGwgdGhlIHVzZXJzIChpbmNsdWRlIHRob3NlIHdobyB3YW50cwo+IHRvIGtlZXAgImRlbmll
ZCIpLgo+IAo+IElmIHlvdSB3ZXJlIGRvaW5nIGFueSBmaWx0ZXJpbmcgaW4gaHZtbG9hZGVyLCB0
aGVuIGl0IHdvdWxkIGJlIGJlc3QgaWYKPiB0aGlzIGlzIGNvbmZpZ3VyYWJsZS4gQnV0IHRoaXMg
aXMgYSBiaXQgcG9pbnRsZXNzIGlmIHlvdSBhbHJlYWR5IGFsbG93Cj4gdGhlIHVzZXIgdG8gY29u
ZmlndXJlIHRoZSBzdHJpbmcgYXQgdGhlIGh5cGVydmlzb3IgbGV2ZWwgOikuCgpTbyB0aGVyZSBh
cmUgdHdvIHRoaW5ncyB3ZSdyZSBjb25jZXJuZWQgYWJvdXQ6Ci0gU29tZSBwZW9wbGUgZG9uJ3Qg
d2FudCB0byBzY2FyZSB1c2VycyB3aXRoIGEgIjxkZW5pZWQ+IiBzdHJpbmcKLSBTb21lIHBlb3Bs
ZSBkb24ndCB3YW50IHRvICJzaWxlbnRseSBmYWlsIiB3aXRoIGEgIiIgc3RyaW5nCgpUaGUgZmFj
dCBpcywgaW4gKmJvdGggY2FzZXMqLCB0aGlzIGlzIGEgVUkgcHJvYmxlbS4gIEVWRVJZIGNhbGxl
ciBvZgp0aGlzIGludGVyZmFjZSBzaG91bGQgZmlndXJlIG91dCBpbmRlcGVuZGVudGx5IHdoYXQg
YSBncmFjZWZ1bCB3YXkgb2YKaGFuZGxpbmcgZmFpbHVyZSBpcyBmb3IgdGhlaXIgdGFyZ2V0IFVJ
LiAgQW55IGNhbGxlciB3aG8gZG9lcyBub3QgdGhpbmsKY2FyZWZ1bGx5IGFib3V0IHdoYXQgdG8g
ZG8gaW4gdGhlIGZhaWx1cmUgY2FzZSBpcyBidWdneSAtLSB3aGljaAppbmNsdWRlcyBldmVyeSBz
aW5nbGUgY2FsbGVyIHRvZGF5LiAgVGhlIENPTkZJR19YU01fREVOSUVEX1NUUklORyBpcyBhCmdy
b3NzIGhhY2sgZmFsbGJhY2sgZm9yIGJ1Z2d5IFVJcy4KCk5vdywgSSBkb24ndCBsaWtlIHRvIHRl
bGwgb3RoZXIgcGVvcGxlIHRvIGRvIHdvcmssIGFuZCBJIGNlcnRhaW5seSBkb24ndApwbGFuIG9u
IGZpeGluZyBodm1sb2FkZXIgYXQgdGhlIG1vbWVudCwgYmVjYXVzZSBpdCdzIGxvdy1wcmlvcml0
eSBmb3IKbWUuICBCdXQgSSBkbyB0aGluayB0aGF0IGhhdmluZyBodm1sb2FkZXIgZGV0ZWN0IGZh
aWx1cmUgYW5kIGV4cGxpY2l0bHkKbWFrZSBhIHNlbnNpYmxlIGRlY2lzaW9uIGlzIHRoZSByaWdo
dCB0aGluZyB0byBkbywgcmVnYXJkbGVzcyBvZiB0aGUKYXZhaWxhYmlsaXR5IG9mIENPTkZJR19Y
U01fREVOSUVEX1NUUklORyB0byB3b3JrIGFyb3VuZCBidWdneSBjYWxsZXJzLgoKIC1HZW9yZ2UK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
