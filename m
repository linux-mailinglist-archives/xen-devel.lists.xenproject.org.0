Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8A9110427
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2019 19:21:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icCkZ-0002vP-Ed; Tue, 03 Dec 2019 18:18:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nD+/=ZZ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1icCkX-0002vK-R7
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2019 18:18:13 +0000
X-Inumbo-ID: 43d93789-15f9-11ea-81e8-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 43d93789-15f9-11ea-81e8-12813bfff9fa;
 Tue, 03 Dec 2019 18:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575397092;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=maWj69ztdic5DvzsPmfDpu4GpouFoLGqFTpinLz6Ayo=;
 b=OLr1BJzKy9MUC6dLvyBWqUJOrTlqNVCmqBnByFIhLJHEq2UNditK2DlK
 efEwdKJLkE0gAdpSkOc2GVXs6o2Jk6WWj2Eq/sovp+JUw9YnA5C0EfYci
 ziBbQtCcc7xyi8D20H9Tggt8yecPCKF1ePDxxSG7AxDCXUOWmcdU9ZFUL g=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: X9Yt/m27+SZUuXJMvgHegCS1qc+WftPY/GqorNfFZCconQ1HGPmEDu5Nkf6WpFe4W7T9705N+g
 dnagx1yDtRyU/EliQTMC66zNa1aMkNB25SRwG47RArkfPe5CBhz9KI70xXx6sI6qiZrqJ+wduZ
 xodzka1wycGOICpuItBeMGoWsnrCAEqJo0zUeu2UcZjqE0Qd85ARLpprCN3MF4eONZirFZxkjQ
 dEFA2U+QhNbqJ/SkdgNC8fFeWA9nMv1DnDtiF+vjXZ5FmaCI5qGwogSpym030RDNIJz2UB/vqx
 ZOM=
X-SBRS: 2.7
X-MesageID: 9690685
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,274,1571716800"; 
   d="scan'208";a="9690685"
To: Tamas K Lengyel <tamas@tklengyel.com>
References: <20191203171030.11680-1-andrew.cooper3@citrix.com>
 <CABfawhmfefUGEaL4vNd8AG=_H4vBZROv9SywuZORDrFBoDCcgg@mail.gmail.com>
 <CABfawh=TP7oB5VLadnD1iC=k9sX1s1zJJQKxHR=HopzvNZns+g@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <10135f1d-2247-f6de-a46b-24eba40e44a7@citrix.com>
Date: Tue, 3 Dec 2019 18:18:08 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CABfawh=TP7oB5VLadnD1iC=k9sX1s1zJJQKxHR=HopzvNZns+g@mail.gmail.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] x86/debug: Plumb pending_dbg through the
 monitor and devicemodel interfaces
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>, Wei Liu <wl@xen.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>, Jan Beulich <JBeulich@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMvMTIvMjAxOSAxODowOSwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IE9uIFR1ZSwgRGVj
IDMsIDIwMTkgYXQgMTowNSBQTSBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+
IHdyb3RlOgo+Pj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3B1YmxpYy92bV9ldmVudC5oIGIv
eGVuL2luY2x1ZGUvcHVibGljL3ZtX2V2ZW50LmgKPj4+IGluZGV4IDk1OTA4M2Q4YzQuLjc2Njc2
ZmY0YzAgMTAwNjQ0Cj4+PiAtLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMvdm1fZXZlbnQuaAo+Pj4g
KysrIGIveGVuL2luY2x1ZGUvcHVibGljL3ZtX2V2ZW50LmgKPj4+IEBAIC0yODEsNiArMjgxLDcg
QEAgc3RydWN0IHZtX2V2ZW50X2RlYnVnIHsKPj4+ICAgICAgdWludDMyX3QgaW5zbl9sZW5ndGg7
Cj4+PiAgICAgIHVpbnQ4X3QgdHlwZTsgICAgICAgIC8qIEhWTU9QX1RSQVBfKiAqLwo+Pj4gICAg
ICB1aW50OF90IF9wYWRbM107Cj4+PiArICAgIHVpbnQ2NF90IHBlbmRpbmdfZGJnOwo+PiBUaGlz
IGlzIGp1c3QgYSBuaXRwaWNrIGJ1dCBJIHdvdWxkIHByZWZlciBpZiB3ZSBoYWQgdGhlIF9wYWQg
ZmllbGQgYXMKPj4gdGhlIGxhc3QgZWxlbWVudCBpbiB0aGUgc3RydWN0IGFuZCBrZWVwIGFsbCA2
NC1iaXQgbWVtYmVycyB1cCBpbiB0aGUKPj4gZnJvbnQuCj4gQWxzbywgc2luY2UgcGVuZGluZ19k
YmcgdXNlcyB1bnNpZ25lZCBpbnQgaW4gWGVuLCBkbyB3ZSBuZWVkIHVpbnQ2NF90Cj4gZm9yIGl0
IGhlcmU/IFNlZW1zIHRvIG1lIGEgdWludDMyX3Qgd291bGQgc3VmZmljZS4KCkl0cyAlZHI2IChi
dXQgbm90IHF1aXRlLCBkdWUgdG8gY29tcGxleGl0eSB3aXRoIGV4Y2VwdGlvbiBwcmlvcml0aWVz
LAppbnRlcnJ1cHQgc2hhZG93cywgYW5kIGJhY2t3YXJkcyBjb21wYXRpYmlsaXR5IG9mIHRoZSBS
VE0gYml0IHdpdGgKaW52ZXJ0ZWQgcG9sYXJpdHkpLsKgIEFsbCBvdGhlciByZWdpc3RlcnMgaGF2
ZSA2NCBiaXQgZmllbGRzIGluIHRoZQppbnRlcmZhY2UuCgpUaGUgb25seSBpbnRlcmVzdGluZyBi
aXRzIGluIGl0IGZhbGwgd2l0aGluIHRoZSBmaXJzdCAzMiB3aGljaCBpcyB3aHkgaXQKaXMgaGFu
ZGxlZCBpbiBhIHNob3J0ZXIgd2F5IHdpdGhpbiBYZW4uwqAgTGlrZSAlY3IwLCBJIGRvbid0IGV4
cGVjdAphbnl0aGluZyBpbnRlcmVzdGluZyB0byBhcHBlYXIgaW4gdGhlIHVwcGVyIDMyIGJpdHMu
Cgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
