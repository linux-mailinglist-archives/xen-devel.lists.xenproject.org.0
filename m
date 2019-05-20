Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F40C5231D7
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2019 12:57:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSfwl-0003id-8P; Mon, 20 May 2019 10:55:11 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EBqs=TU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hSfwk-0003iY-Gh
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 10:55:10 +0000
X-Inumbo-ID: bbe18337-7aed-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id bbe18337-7aed-11e9-8980-bc764e045a96;
 Mon, 20 May 2019 10:55:09 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=SoftFail smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: SoftFail (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: kngocqD78fDzGn6sK3JX/W8w4L0pCoH7k/k/Tq7/2238f9mrwPxuHe1ifO2VO3gtJbh1TcWqGh
 Tqi63Crs+bpnD1p5SVIu2Mic6NVmapVOUfAVV7I125LnKJ0/7ag/TvMRAxPl+sMD4Lgp4lqJIe
 B+xxwCkTtnyPeenXqyV3oRQ74p8hzMu0D/ifk3+WajKhZ9f26Hcp6jzGbCz/x+1bcCknBqHQDI
 6S76sOJO0BAXWSFav5JaZNGlvIPNThOZTLOPlqYFFSgrzOmRVkoiCNHCEYoQ9V2oP2zFviPYZh
 w8w=
X-SBRS: 2.7
X-MesageID: 642338
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,491,1549947600"; 
   d="scan'208";a="642338"
To: <e.kaplan@columbia.edu>, <xen-devel@lists.xenproject.org>
References: <CAMctL7UVJm-5fhkX8oHvkUXUK5LsF0BPY44Y3HmuMx6MJXqVMA@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <0a458ae4-ea41-772b-68c1-ab76286ef4bd@citrix.com>
Date: Mon, 20 May 2019 11:55:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAMctL7UVJm-5fhkX8oHvkUXUK5LsF0BPY44Y3HmuMx6MJXqVMA@mail.gmail.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] Registering interrupt handler for performance
 counter overflow
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkvMDUvMjAxOSAxOTo0NiwgRWl0YW4gS2FwbGFuIHdyb3RlOgo+IEhpIGFsbCwKPgo+IEkg
YW0gYSBjb21wdXRlciBlbmdpbmVlcmluZyBzdHVkZW50IGF0IENvbHVtYmlhIFVuaXZlcnNpdHku
IFRoaXMgaXMgbXkKPiBmaXJzdCB0aW1lIHdyaXRpbmcgdG8gdGhpcyBsaXN0IChwbGVhc2UgbGV0
IG1lIGtub3cgaWYgdGhpcyBpc24ndCB0aGUKPiBwbGFjZSBmb3IgdGhpcyB0eXBlIG9mIHF1ZXN0
aW9uISkuCgooQXBvbG9naWVzIGZvciB0aGUgcmVwb3N0IC0gSSBhY2NpZGVudGFsbHkgZHJvcHBl
ZCB0aGUgQ0MgbGlzdCB0aGUgZmlyc3QKdGltZSBhcm91bmQuKQoKVGhpcyBpcyBpbmRlZWQgdGhl
IGNvcnJlY3QgcGxhY2UgZm9yIHRoaXMga2luZCBvZiBxdWVzdGlvbi4KCj4KPiBJIGFtIHdvcmtp
bmcgd2l0aCBhIHByb2Zlc3NvciBvbiBhIHByb2plY3QgdG8gbWl0aWdhdGUgU3BlY3RyZSBhbmQK
PiBNZWx0ZG93biAoYW5kIG90aGVyIHNpbWlsYXIgY2FjaGUgdGltaW5nIHNpZGUtY2hhbm5lbCBh
dHRhY2tzKS7CoCBXZQo+IGFyZSB1c2luZyBYZW4gYW5kIG1vZGlmeWluZyBpdHMgc291cmNlIGFz
IGEgd2F5IG9mIG1vZGVsaW5nIHRoZSBhZmZlY3QKPiBjZXJ0YWluIHBvdGVudGlhbCBoYXJkd2Fy
ZSBjaGFuZ2VzLiBBcyBwYXJ0IG9mIHRoYXQgcHJvamVjdCwgd2UgbmVlZAo+IHRvIHVzZSB0aGUg
cGVyZm9ybWFuY2UgY291bnRlcnMgdG8gZ2VuZXJhdGUgaW50ZXJydXB0cyBhdCBjZXJ0YWluCj4g
bWljcm9hcmNoaXRlY3R1cmFsIGV2ZW50cy7CoCBJIGhhdmUgc3VjY2Vzc2Z1bGx5IGFkZGVkIGlu
dG8KPiB4ZW4vYXJjaC94ODYvc2V0dXAuYyBhIGZldyBsaW5lcyB0byBzZXR1cCB0aGUgKEludGVs
IFNhbmR5IEJyaWRnZSkKPiBwZXJmb3JtYW5jZSBjb3VudGVyIGNvbnRyb2wgTVNScyBhbmQgc2V0
IHRoZSBjb3VudGVyIGl0c2VsZiB0byBhIGZldwo+IGJlbG93IG92ZXJmbG93LsKgIEFsbCB0aGF0
J3MgbWlzc2luZyBpcyBhIHNpbXBsZSBpbnRlcnJ1cHQgaGFuZGxlciB0aGF0Cj4gd2lsbCByZXNl
dCB0aGUgY291bnRlciB0byBhIGZldyBiZWxvdyBvdmVyZmxvdyAoYW5kIHBlcmhhcHMgZG8gc29t
ZQo+IGxvZ2dpbmcpLgo+Cj4gSSBhbSBoYXZpbmcgdHJvdWJsZSBmaWd1cmluZyBvdXQgaG93IHRv
IHJlZ2lzdGVyIG15IGhhbmRsZXIgaW4gWGVuLsKgIEkKPiBhc3N1bWUgdGhhdCBJIGhhdmUgdG8g
Y2FsbCByZXF1ZXN0X2lycSgpLCBidXQgSSBhbSBub3Qgc3VyZSBob3cgdG8gc2V0Cj4gYWxsIHRo
ZSBhcmd1bWVudHMgZm9yIHRoYXQgY2FsbC7CoCBXb3VsZCBhbnlvbmUgYmUgYWJsZSB0byBnaXZl
IG1lIGFueQo+IHBvaW50ZXJzP8KgIFN1Z2dlc3Rpb25zIG9yIHBvaW50ZXJzIHRvIHJlc291cmNl
cy9leGFtcGxlcyBmb3IKPiByZWdpc3RlcmluZyBpbnRlcnJ1cHQgaGFuZGxlcnMgaW4gWGVuIHdv
dWxkIGJlIHJlYWxseSBoZWxwZnVsIQo+Cj4gQWx0ZXJuYXRpdmVseSwgaXMgdGhlcmUgYW4gZXhp
c3RpbmcgaW50ZXJydXB0IGhhbmRsZXIgdGhhdCBpcyBhbHJlYWR5Cj4gc2V0dXAgZm9yIFBNQyBv
dmVyZmxvdyBpbnRlcnJ1cHRzIHRoYXQgSSBtaWdodCBiZSBhYmxlIHRvIHR3ZWFrPwoKSW4gdGhl
IFhlbiBjb2RlLCB0aGVyZSBhcmUgdHdvIHVzZXMgcGVyZm9ybWFuY2UgY291bnRlcnMuCgpPbmUg
aXMgdGhlIHdhdGNoZG9nIChjbWRsaW5lICJ3YXRjaGRvZyIsIHhlbi9hcmNoL3g4Ni9ubWkuYykg
d2hpY2ggdXNlcwp0aGUgdW5oYWx0ZWQgY3ljbGVzIGNvdW50ZXIgdG8gZ2VuZXJhdGVkIGFuIE5N
SSBvbiBhIHBlcmlvZGljIGJhc2lzLsKgClNlZSBzZXR1cF9hcGljX25taV93YXRjaGRvZygpIGZv
ciB0aGUgc2V0dXAgZGV0YWlscy4KClRoZSBzZWNvbmQgaXMgdGhlIHZwbXUgaW5mcmFzdHJ1Y3R1
cmUgKGNtZGxpbmUgInZwbXUiCnhlbi9hcmNoL3g4Ni9jcHUvdnBtdSopIHdoaWNoIGlzIGZvciB2
aXJ0dWFsaXNpbmcgdGhlIHBlcmZvcm1hbmNlCmNvdW50ZXJzIGZvciBndWVzdCB1c2UsIGFuZCBp
cyBwcm9iYWJseSBjbG9zZXIgdG8gd2hhdCB5b3UncmUgd2FudGluZy7CoApJbiBwYXJ0aWN1bGFy
LCBzZWUgaG93IFBNVV9BUElDX1ZFQ1RPUiBpcyBjb25maWd1cmVkLCB3aGljaCBpbmNsdWRlcyB0
aGUKaW50ZXJydXB0IHJlZ2lzdHJhdGlvbiBhbmQgTEFQSUMgcHJvZ3JhbW1pbmcuCgp+QW5kcmV3
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
