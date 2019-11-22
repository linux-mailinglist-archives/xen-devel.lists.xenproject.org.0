Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE887107260
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2019 13:46:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iY8I1-00022Q-DB; Fri, 22 Nov 2019 12:43:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cGBV=ZO=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iY8Hz-00022L-NR
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2019 12:43:55 +0000
X-Inumbo-ID: bdf34e47-0d25-11ea-a34f-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bdf34e47-0d25-11ea-a34f-12813bfff9fa;
 Fri, 22 Nov 2019 12:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574426634;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=25b4mT0ILEalZrBkbRwGiQ5fXjBohC8SntCGed0aVHo=;
 b=W3ta7GfXFbAuhSFAv36dKhtNO44M8WtGu6vWvTVMg/IgP4HT7pwtVzFs
 piM6rw296ikEEp3/xhvea3ABVlmgxvy9Z7fx/4o/ASNMIvG4NgSiEVO46
 YCys3+AN6R5hb5s8ztxwmHueOBnPR1Mz85+WWYyIlj6XuAYWiPzFJ3v7q s=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: kkhaJ62JEqf6jNijgQk3wXPoNNMpO5bTdqeu+w5CFoQDaL3sMk0hRM7lHt0Wia3NLfjB+/cc1e
 3CO1wGin/NlAK/jD45u29fMuthKjSaKNuh6VK6ras8k9stDBBNS7yMXjeNP5+B4HHg7t5r8qXB
 VmpRbP7oLKJJle8pioNDKw2wzS+Hum9mS2aqi+6GX9CqcPD0/WamMH1TSErp1pCC9BmMQDALab
 z3cngeUrztRXkZoPzs4k7MHUj1tMW6RkQmjl1sm2rHnr2N7qhDIQER763HuVy3np1NWU2PjbY3
 BvM=
X-SBRS: 2.7
X-MesageID: 9119750
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,229,1571716800"; 
   d="scan'208";a="9119750"
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20191121221551.1175-1-andrew.cooper3@citrix.com>
 <20191121221551.1175-2-andrew.cooper3@citrix.com>
 <20191122123716.GX72134@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <65c8c122-00b4-9323-6539-0275cc1e6b36@citrix.com>
Date: Fri, 22 Nov 2019 12:43:49 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191122123716.GX72134@Air-de-Roger>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 1/2] x86/vtx: Fix fault semantics for early
 task switch failures
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
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>,
 Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIvMTEvMjAxOSAxMjozNywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBUaHUsIE5v
diAyMSwgMjAxOSBhdCAxMDoxNTo1MFBNICswMDAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBU
aGUgVlQteCB0YXNrIHN3aXRjaCBoYW5kbGVyIGFkZHMgaW5zdF9sZW4gdG8gcmlwIGJlZm9yZSBj
YWxsaW5nCj4+IGh2bV90YXNrX3N3aXRjaCgpLiAgVGhpcyBjYXVzZXMgZWFybHkgZmF1bHRzIHRv
IGJlIGRlbGl2ZXJlZCB0byB0aGUgZ3Vlc3Qgd2l0aAo+IEJ5IGVhcmx5IGZhdWx0cyB5b3UgbWVh
biBmYXVsdHMgaW5qZWN0ZWQgYnkgaHZtX3Rhc2tfc3dpdGNoIGl0c2VsZiBmb3IKPiBleGFtcGxl
PwoKQSB0YXNrIHN3aXRjaCBpcyByZXN0YXJ0YWJsZSB1cCB1bnRpbCBhIHBvaW50LsKgIEJleW9u
ZCB0aGF0IHBvaW50IGFueQpjaGFvcyB3aWxsIHJlaWduIGluIHRoZSBuZXcgdGFzaywgbm90IHRo
ZSBvbGQgdGFzay4KCkJ5ICJlYXJseSIsIEkgbWVhbiBhbnkgZmF1bHQgd2hpY2ggaXMgaGFuZGxl
ZCBpbiB0aGUgY29udGV4dCBvZiB0aGUgb2xkCnRhc2suwqAgQXMgZmFyIGFzIHRlc3RpbmcgZ29l
cywgSSB0aGluayBtYXBwaW5nIHRoZSBjdXJyZW50IFRTUyBhcwpyZWFkLW9ubHkgaXMgYWJvdXQg
dGhlIG9ubHkgd2F5IEkndmUgZ290IGNhdXNpbmcgdGhpcyB0byBvY2N1ciwgYmVjYXVzZQphbGwg
b3RoZXIgZmF1bHQgY29uZGl0aW9ucyBhcmUgY2hlY2tlZCBieSB0aGUgcHJvY2Vzc29yIGJlZm9y
ZSBpc3N1aW5nIGEKVEFTS19TV0lUQ0ggVk1FeGl0LgoKPgo+PiB0cmFwIHNlbWFudGljcywgYW5k
IGJyZWFrIHJlc3RhcnRpYmlsaXR5Lgo+Pgo+PiBJbnN0ZWFkLCBwYXNzIHRoZSBpbnN0cnVjdGlv
biBsZW5ndGggaW50byBodm1fdGFza19zd2l0Y2goKSBhbmQgd3JpdGUgaXQgaW50bwo+PiB0aGUg
b3V0Z29pbmcgdHNzIG9ubHksIGxlYXZpbmcgcmlwIGluIGl0cyBvcmlnaW5hbCBsb2NhdGlvbi4K
Pj4KPj4gRm9yIG5vdywgcGFzcyAwIG9uIHRoZSBTVk0gc2lkZS4gIFRoaXMgaGlnaGxpZ2h0cyBh
IHNlcGFyYXRlIHByZWV4aXN0aW5nIGJ1Zwo+PiB3aGljaCB3aWxsIGJlIGFkZHJlc3NlZCBpbiB0
aGUgZm9sbG93aW5nIHBhdGNoLgo+Pgo+PiBXaGlsZSBhZGp1c3RpbmcgY2FsbCBzaXRlcywgZHJv
cCB0aGUgdW5uZWNlc3NhcnkgdWludDE2X3QgY2FzdC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQW5k
cmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiBDb2RlIExHVE06Cj4KPiBS
ZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpUaGFu
a3MsCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
