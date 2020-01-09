Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCB9135752
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2020 11:46:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipVHu-0002nl-T8; Thu, 09 Jan 2020 10:43:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zaws=26=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ipVHt-0002ng-Ol
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2020 10:43:37 +0000
X-Inumbo-ID: df14daaa-32cc-11ea-b89f-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id df14daaa-32cc-11ea-b89f-bc764e2007e4;
 Thu, 09 Jan 2020 10:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578566609;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=rb9NzvWN78BEhq/wv8D43a0QrSVNFZjyNyBP4PAUT1U=;
 b=VgcNC486Y5ZFnIlIf1tfE286jgGw2GHxLXqZKyrACuc4iWPPdDZx2DSN
 gg9GuCfhXB89HQ0wvrpSz0blH/zLPS1bAVXZ3+gBW1Tx5I6gRCTena079
 puj3yb/K+h0u158Ntw+4qHWx+Zr2GuYuxUUV+qHaB1+sPLmbGr/gjxqNH I=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: LONpFESza1ivyvBzPDOAXxuJpviYnOHVREzsUIDB4SyH0IlMJNc/teTMq24P5GOgdE6+BD/BH3
 ShYTtSwHEOtHr4oiUOcksk9BEPOItO9xYWoKONmHyqNzNlhgJ6WhSfBVumpAJsPxv2e2RzafnD
 yazbzVpnodaJ6MA0uZrqqwtYhh3xXTS0RmZwOuvdkuOdkC7+Br7mAgSZExwb0oaFEyIO9RJqNb
 9+RPf4RGdrOT7uIPwRgtxNWxD5sHil7tATwGBQgwTWpquFoKVisighmjVfHMuBpi408xuH9wHS
 KSI=
X-SBRS: 2.7
X-MesageID: 10832502
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,413,1571716800"; d="scan'208";a="10832502"
To: Jan Beulich <jbeulich@suse.com>
References: <20200108170040.7728-1-andrew.cooper3@citrix.com>
 <bed20854-b537-da48-e7f5-451887ee98db@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <57de555b-c1cc-4a32-8222-ba87ecf3168c@citrix.com>
Date: Thu, 9 Jan 2020 10:43:25 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <bed20854-b537-da48-e7f5-451887ee98db@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86/boot: Rationalise stack handling during
 early boot
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkvMDEvMjAyMCAxMDoyOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDguMDEuMjAyMCAx
ODowMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gLS0tIGEveGVuL2FyY2gveDg2L2VmaS9lZmkt
Ym9vdC5oCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9lZmkvZWZpLWJvb3QuaAo+PiBAQCAtMjQ5LDIz
ICsyNDksMjQgQEAgc3RhdGljIHZvaWQgX19pbml0IG5vcmV0dXJuIGVmaV9hcmNoX3Bvc3RfZXhp
dF9ib290KHZvaWQpCj4+ICAgICAgICAgICAgICAgICAgICAgIm9yICAgICAkIl9fc3RyaW5naWZ5
KFg4Nl9DUjRfUEdFKSIsICVbY3I0XVxuXHQiCj4+ICAgICAgICAgICAgICAgICAgICAgIm1vdiAg
ICAlW2NyNF0sICUlY3I0XG5cdCIKPj4gICNlbmRpZgo+PiAtICAgICAgICAgICAgICAgICAgICJt
b3ZhYnMgJF9fc3RhcnRfeGVuLCAlW3JpcF1cblx0Igo+PiAgICAgICAgICAgICAgICAgICAgICJs
Z2R0ICAgYm9vdF9nZHRyKCUlcmlwKVxuXHQiCj4+IC0gICAgICAgICAgICAgICAgICAgIm1vdiAg
ICBzdGFja19zdGFydCglJXJpcCksICUlcnNwXG5cdCIKPj4gICAgICAgICAgICAgICAgICAgICAi
bW92ICAgICVbZHNdLCAlJXNzXG5cdCIKPj4gICAgICAgICAgICAgICAgICAgICAibW92ICAgICVb
ZHNdLCAlJWRzXG5cdCIKPj4gICAgICAgICAgICAgICAgICAgICAibW92ICAgICVbZHNdLCAlJWVz
XG5cdCIKPj4gICAgICAgICAgICAgICAgICAgICAibW92ICAgICVbZHNdLCAlJWZzXG5cdCIKPj4g
ICAgICAgICAgICAgICAgICAgICAibW92ICAgICVbZHNdLCAlJWdzXG5cdCIKPj4gLSAgICAgICAg
ICAgICAgICAgICAibW92bCAgICVbY3NdLCA4KCUlcnNwKVxuXHQiCj4+IC0gICAgICAgICAgICAg
ICAgICAgIm1vdiAgICAlW3JpcF0sICglJXJzcClcblx0Igo+PiAtICAgICAgICAgICAgICAgICAg
ICJscmV0cSAgJVtzdGtvZmZdLTE2Igo+PiArCj4+ICsgICAgICAgICAgICAgICAgICAgLyogSnVt
cCB0byBoaWdoZXIgbWFwcGluZ3MuICovCj4+ICsgICAgICAgICAgICAgICAgICAgIm1vdiAgICBz
dGFja19zdGFydCglJXJpcCksICUlcnNwXG5cdCIKPj4gKyAgICAgICAgICAgICAgICAgICAibW92
YWJzICRfX3N0YXJ0X3hlbiwgJVtyaXBdXG5cdCIKPj4gKyAgICAgICAgICAgICAgICAgICAicHVz
aCAgICVbY3NdXG5cdCIKPiBFaXRoZXIgeW91IG5lZWQgJXFbY3NdIGhlcmUgKGFzc3VtaW5nIHEg
Z2V0cyBpZ25vcmVkIGZvcgo+IGltbWVkaWF0ZSBvcGVyYW5kcywgd2hpY2ggSSBkaWRuJ3QgY2hl
Y2spIG9yIC4uLgo+Cj4+ICsgICAgICAgICAgICAgICAgICAgInB1c2ggICAlW3JpcF1cblx0Igo+
PiArICAgICAgICAgICAgICAgICAgICJscmV0cSIKPj4gICAgICAgICAgICAgICAgICAgICA6IFty
aXBdICI9JnIiIChlZmVyLyogYW55IGRlYWQgNjQtYml0IHZhcmlhYmxlICovKSwKPj4gICAgICAg
ICAgICAgICAgICAgICAgIFtjcjRdICIrJnIiIChjcjQpCj4+ICAgICAgICAgICAgICAgICAgICAg
OiBbY3IzXSAiciIgKGlkbGVfcGdfdGFibGUpLAo+PiAgICAgICAgICAgICAgICAgICAgICAgW2Nz
XSAiaXIiIChfX0hZUEVSVklTT1JfQ1MpLAo+IC4uLiB5b3UgbmVlZCB0byB1c2UganVzdCAiaSIg
aGVyZSwgZm9yIHRoZXJlIG5vdCBiZWluZyAzMi1iaXQKPiBQVVNIIGZvcm1zLgoKTGV0cyBqdXN0
IGdvIHdpdGggaS4KCiJtIiBpcyBhbHNvIGFuIG9wdGlvbiwgYW5kIGNsYW5nIHdpbGwgcHJvYmFi
bHkgZmluZCBzb21lIHdheSBvZiBwdWxsaW5nCml0IG91dCBvZiB0aGUgc3RyaW5ndGFibGUsIGJ1
dCBhbnl0aGluZyBvdGhlciB0aGFuIGFuIGltbWVkaWF0ZSBlbmNvZGluZwpoZXJlIGlzIGdvaW5n
IHRvIGJlIHNpbGx5LgoKPgo+PiAtLS0gYS94ZW4vYXJjaC94ODYvc21wYm9vdC5jCj4+ICsrKyBi
L3hlbi9hcmNoL3g4Ni9zbXBib290LmMKPj4gQEAgLTU1NCw3ICs1NTQsNyBAQCBzdGF0aWMgaW50
IGRvX2Jvb3RfY3B1KGludCBhcGljaWQsIGludCBjcHUpCj4+ICAgICAgICAgIHByaW50aygiQm9v
dGluZyBwcm9jZXNzb3IgJWQvJWQgZWlwICVseFxuIiwKPj4gICAgICAgICAgICAgICAgIGNwdSwg
YXBpY2lkLCBzdGFydF9laXApOwo+PiAgCj4+IC0gICAgc3RhY2tfc3RhcnQgPSBzdGFja19iYXNl
W2NwdV07Cj4+ICsgICAgc3RhY2tfc3RhcnQgPSBzdGFja19iYXNlW2NwdV0gKyBTVEFDS19TSVpF
IC0gc2l6ZW9mKHN0cnVjdCBjcHVfaW5mbyk7Cj4+ICAKPj4gICAgICAvKiBUaGlzIGdydW5nZSBy
dW5zIHRoZSBzdGFydHVwIHByb2Nlc3MgZm9yIHRoZSB0YXJnZXRlZCBwcm9jZXNzb3IuICovCj4g
RnVydGhlciBkb3duIHNtcF9wcmVwYXJlX2NwdXMoKSBoYXMKPgo+ICAgICBzdGFja19iYXNlWzBd
ID0gc3RhY2tfc3RhcnQ7Cj4KPiB3aGljaCBJIHRoaW5rIHlvdSBuZWVkIHRvIGFsc28gYWRqdXN0
IChvciByZXBsYWNlLCBlLmcuIGJ5IGdpdmluZwo+IHN0YWNrX2Jhc2VbXSBhbiBpbml0aWFsaXpl
cikuCgpJbiBwcmFjdGljZSwgdGhpcyB2YXJpYWJsZSBpcyBuZXZlciB1c2VkIGJlY2F1c2Ugd2Ug
bmV2ZXIgb2ZmbGluZSB0aGUgQlNQLgoKSG93ZXZlciwgdGhlIGNvZGUgYXMtaXMgaXMgY29ycmVj
dC7CoCBUaGUgdmFsdWUgaW4gc3RhY2tfc3RhcnQgaGFzCmNoYW5nZWQgaW4gdGhpcyBwYXRjaCwg
YnV0IGlzIHN0aWxsIHRoZSBjb3JyZWN0IHZhbHVlIGZvciB0aGUgQlNQLgoKSXQgY291bGQgYWxz
byBiZSBtYWRlIGludG8gYW4gaW5pdGlhbGlzZXIsIGJ1dCB0aGF0IHdvdWxkIGNhdXNlCnN0YWNr
X2Jhc2VbXSB0byBtb3ZlIGZyb20gQlNTIGludG8gZGF0YSwgYW5kIGl0IGlzIGEgTlJfQ1BVUyBz
aXplZApkYXRhc3RydWN0dXJlLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
