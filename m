Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCB413F9B4
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2020 20:44:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isB1i-0004YX-Tl; Thu, 16 Jan 2020 19:41:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1k4+=3F=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1isB1h-0004YO-GD
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2020 19:41:57 +0000
X-Inumbo-ID: 3bfc7860-3898-11ea-a2eb-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3bfc7860-3898-11ea-a2eb-bc764e2007e4;
 Thu, 16 Jan 2020 19:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579203708;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=VwZmd091jOINLjDfFKcvc3mX0XVDfPt/Sy2FQwjn4qE=;
 b=cOUUbmHfBDBiH+LOh/CK3k/1Z0BixgLeisqlvCmddlPIzAyizzuOR/Tp
 fXYPTOMH4OmSm22UA8ZE7fIMxQKHp1uIwK2k9xqNBUzu340W+YcTkInUr
 1csULkvc9ur02qb3itGrpjL1d7+a+671dTtGuOlk3ily+O1ItDKVwZklk o=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: CyC0Jiip7k+kenHHX3TTfXnVRT3VTLpokMI3cyFYRVF8k/0t2x7sDaOcxz1lGaEcnA+e7jonGK
 u7Y5Q+nPyTQ6BH3KAY8I7ACr2DN0lBa4mW/0VdF3sVZdhAGrfTB+BxWrTAHXWRF8ZXiblp3mMo
 35FVuDaTw5bQ4GajZBTKgSoFEFIZezeQ7yPfp9uROTKaC9iKiuGGFK9+o+VoDFqAha/mmRDH8C
 AAg0/rKMEswt1WDTpDDfcJoj9zVfee52NmscYeyN+0GtOW0UQqTadTV5iI01Kvt406zFTCqm3Y
 238=
X-SBRS: 2.7
X-MesageID: 11403971
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,327,1574139600"; d="scan'208";a="11403971"
To: Jan Beulich <jbeulich@suse.com>
References: <20200113175020.32730-1-andrew.cooper3@citrix.com>
 <20200113175020.32730-5-andrew.cooper3@citrix.com>
 <91da9495-d274-ccaa-a09f-aa0650aff623@suse.com>
 <ecf2a65e-68ea-63c0-0fb3-576104d7e202@citrix.com>
 <ce1d41a1-6865-2a0d-9aa0-30fc82cad557@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <d4cf3ef3-2000-8581-652b-fdca398352d6@citrix.com>
Date: Thu, 16 Jan 2020 19:41:44 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <ce1d41a1-6865-2a0d-9aa0-30fc82cad557@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 3/4] x86/boot: Create the l2_xenmap[]
 mappings dynamically
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

T24gMTUvMDEvMjAyMCAwOToyMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTQuMDEuMjAyMCAy
MDozMSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMTQvMDEvMjAyMCAxNjo0NSwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBPbiAxMy4wMS4yMDIwIDE4OjUwLCBBbmRyZXcgQ29vcGVyIHdyb3Rl
Ogo+Pj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9ib290L2hlYWQuUwo+Pj4+ICsrKyBiL3hlbi9hcmNo
L3g4Ni9ib290L2hlYWQuUwo+Pj4+IEBAIC02NjgsNiArNjY4LDIwIEBAIHRyYW1wb2xpbmVfc2V0
dXA6Cj4+Pj4gICAgICAgICAgYWRkICAgICAlZXNpLHN5bV9mcyhfX3BhZ2VfdGFibGVzX3N0YXJ0
KS04KCwlZWN4LDgpCj4+Pj4gIDI6ICAgICAgbG9vcCAgICAxYgo+Pj4+ICAKPj4+PiArICAgICAg
ICAvKiBNYXAgWGVuIGludG8gdGhlIGhpZ2hlciBtYXBwaW5ncyB1c2luZyAyTSBzdXBlcnBhZ2Vz
LiAqLwo+Pj4+ICsgICAgICAgIGxlYSAgICAgX1BBR0VfUFNFICsgUEFHRV9IWVBFUlZJU09SX1JX
WCArIHN5bV9lc2koX3N0YXJ0KSwgJWVheAo+Pj4+ICsgICAgICAgIG1vdiAgICAgJHN5bV9vZmZz
KF9zdGFydCksICAgJWVjeCAgIC8qICVlYXggPSBQVEUgdG8gd3JpdGUgICAgICAgICovCj4+PiBU
aGUgY29tbWVudCBpcyBvbiB0aGUgd3JvbmcgbGluZSwgaXNuJ3QgaXQ/IFBlcmhhcHMKPj4+Cj4+
PiAgICAgICAgIGxlYSAgICAgX1BBR0VfUFNFICsgUEFHRV9IWVBFUlZJU09SX1JXWCArIHN5bV9l
c2koX3N0YXJ0KSwgXAo+Pj4gICAgICAgICAgICAgICAgICVlYXggICAgICAgICAgICAgICAgLyog
JWVheCA9IFBURSB0byB3cml0ZSAgICAgICAgKi8KPj4+Cj4+PiA/Cj4+IFRoYXQgaXMgd2h5IHRo
ZSBjb21tZW50IGhhZCB0aGUgcmVnaXN0ZXIgbmFtZSwgcmF0aGVyIHRoYW4gdHJ5aW5nIHRvCj4+
IGNsYWltIHRoYXQgJHN5bV9vZmZzKF9zdGFydCkgd2FzIHRoZSBQVEUgdG8gd3JpdGUuCj4+Cj4+
IEkgZGlkbid0IHJlYWxseSB0aGluayBzcGxpdHRpbmcgdGhlIGxlYSBsaWtlIHRoYXQgYWNyb3Nz
IDIgbGluZXMgd2FzCj4+IGJldHRlciB0aGFuIHRoaXMuCj4+Cj4+IEhvdyBhYm91dCAvKiAlZWF4
ID0gUFRFIHRvIHdyaXRlIF4gwqDCoMKgwqAgKi8gd2hpY2ggd2lsbCBwb2ludCBwcm9wZXJseSBh
dAo+PiAlZWF4Pwo+IEZpbmUgd2l0aCBtZTsgSSBhc3N1bWUgeW91IG1lYW4gdGhpcyB0byBnbyBv
biBhIHNlcGFyYXRlIGxpbmU/CgpZZXMuwqAgaS5lLiBleGFjdGx5IGFzIHRoZSBwYXRjaCBwcmVz
ZW50ZWQsIGJ1dCB3aXRoIGFuIGV4dHJhICIgXiIgaW4gdGhlCmNvbW1lbnQuCgo+Cj4+Pj4gLS0t
IGEveGVuL2FyY2gveDg2L2VmaS9lZmktYm9vdC5oCj4+Pj4gKysrIGIveGVuL2FyY2gveDg2L2Vm
aS9lZmktYm9vdC5oCj4+Pj4gQEAgLTU4NSw2ICs1ODUsMjAgQEAgc3RhdGljIHZvaWQgX19pbml0
IGVmaV9hcmNoX21lbW9yeV9zZXR1cCh2b2lkKQo+Pj4+ICAgICAgaWYgKCAhZWZpX2VuYWJsZWQo
RUZJX0xPQURFUikgKQo+Pj4+ICAgICAgICAgIHJldHVybjsKPj4+PiAgCj4+Pj4gKyAgICAvKgo+
Pj4+ICsgICAgICogTWFwIFhlbiBpbnRvIHRoZSBoaWdoZXIgbWFwcGluZ3MsIHVzaW5nIDJNIHN1
cGVycGFnZXMuCj4+Pj4gKyAgICAgKgo+Pj4+ICsgICAgICogTkI6IFdlIGFyZSBjdXJyZW50bHkg
aW4gcGh5c2ljYWwgbW9kZSwgc28gYSBSSVAtcmVsYXRpdmUgcmVsb2NhdGlvbgo+Pj4+ICsgICAg
ICogYWdhaW5zdCBfc3RhcnQvX2VuZCBnZXRzIHRoZWlyIHBvc2l0aW9uIGFzIHBsYWNlZCBieSB0
aGUgYm9vdGxvYWRlciwKPj4+PiArICAgICAqIG5vdCBhcyBleHBlY3RlZCBpbiB0aGUgZmluYWwg
YnVpbGQuICBUaGlzIGhhcyBhcmJpdHJhcnkgMk0gYWxpZ25tZW50LAo+Pj4+ICsgICAgICogc28g
c3VidHJhY3QgeGVuX3BoeXNfc3RhcnQgdG8gZ2V0IHRoZSBhcHByb3ByaWF0ZSBzbG90cyBpbiBs
Ml94ZW5tYXBbXS4KPj4+PiArICAgICAqLwo+Pj4gSXQgbWF5IGp1c3QgYmUgYSBsYW5ndWFnZSBp
c3N1ZSwgYnV0IEknbSBzdHJ1Z2dsaW5nIHdpdGggdGhlCj4+PiAiYXJiaXRyYXJ5IiBoZXJlLiBJ
cyB0aGlzIGluIGFueSB3YXkgcmVsYXRlZCB0byB0aGUKPj4+IC0tc2VjdGlvbi1hbGlnbm1lbnQ9
MHgyMDAwMDAgb3B0aW9uIHdlIHBhc3MgdG8gdGhlIGxpbmtlciAod2hlcmUKPj4+IHRoZSB2YWx1
ZSBpc24ndCBhcmJpdHJhcnkgYXQgYWxsKT8KPj4gU28gdGhpcyBpcyB0aGUgYnVnIEkgc3BlbnQg
YWdlcyB0cnlpbmcgdG8gZmlndXJlIG91dCBjb25zb2xlIGxvZ2dpbmcgZm9yLgo+Pgo+PiBUaGUg
bmFpdmUgdmVyc2lvbiBvZiB0aGlzIGxvb3AgKHByZSBzdWJ0cmFjdGlvbikgZW5kZWQgdXAgaW5p
dGlhbGlzaW5nCj4+IHNsb3RzIDE3My4uLjE3NyB3aGljaCwgd2hlbiBoaWdobGlnaHRlZCBsaWtl
IHRoYXQsIGlzIG9idmlvdXNseSB3aHkgWGVuCj4+IHRyaXBsZSBmYXVsdGVkIHdoZW4gc3dpdGNo
aW5nIHRvIHRoZSBoaWdoIG1hcHBpbmdzLgo+Pgo+PiBUaGUgcG9pbnQgSSdtIHRyeWluZyB0byBt
YWtlIGlzIHRoYXQgbDJfdGFibGVfb2Zmc2V0KF9zdGFydCkgZW5kcyB1cAo+PiBiZWluZyBqdW5r
IGJlY2F1c2UgaXQgaXMgYSByaXAtcmVsYXRpdmUgYWRkcmVzcyBhbmQgd2UncmUgbm90IHJ1bm5p
bmcgYXQKPj4gb3VyIGxpbmtlZCBhZGRyZXNzLsKgIChJdCBpcyBpbiBmYWN0IG91ciBwaHlzaWNh
bCBwb3NpdGlvbiBpbiBtZW1vcnkncyAyTQo+PiBzbG90LCBtb2R1bG8gNTEyKS4KPj4KPj4gU3Vi
dHJhY3RpbmcgeGVuX3BoeXNfc3RhcnQgZ2V0cyB0aGUgbnVtYmVyIGJhY2sgaW50byB0aGUgc2Ft
ZSBhbGlhcwo+PiB3aGljaCBhbGwgdGhlIDMyYml0IGhlYWQuUyBjb2RlIHJlbGllcyBvbiwgYW5k
IGdpdmVzIHVzIGEgc2Vuc2libGUKPj4gc2VxdWVuY2Ugb2Ygc2xvdHMgc3RhcnRpbmcgZnJvbSAx
Lgo+IFRoYW5rcyBmb3IgdGhlIGV4cGxhbmF0aW9uLiBXaGF0IEknbSBzdGlsbCB1bmNsZWFyIGFi
b3V0IGlzIHRoaXMgdXNlCj4gb2YgImFyYml0cmFyeSIsIHRob3VnaC4gTG9va2luZyBhdCBpdCBh
Z2FpbiBJIGd1ZXNzIEknbSBhbHNvCj4gc3RydWdnbGluZyB0byB1bmRlcnN0YW5kIHdoYXQgIlRo
aXMiIGF0IHRoZSBiZWdpbm5pbmcgb2YgdGhlIHNlbnRlbmNlCj4gcmVmZXJzIHRvLgoKSSdsbCBh
dHRlbXB0IHRvIHJld3JpdGUgdGhlIGV4cGxhbmF0aW9uIGZyb20gc2NyYXRjaCBhbmQgc2VlIGlm
IHRoYXQKY29tZXMgb3V0IGNsZWFyZXIuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
