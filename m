Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A3311460E
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 18:36:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icv0E-0002T4-88; Thu, 05 Dec 2019 17:33:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7+lP=Z3=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1icv0C-0002Sz-Rn
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 17:33:20 +0000
X-Inumbo-ID: 534bd2a8-1785-11ea-8232-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 534bd2a8-1785-11ea-8232-12813bfff9fa;
 Thu, 05 Dec 2019 17:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575567199;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Vt4IZTgZ4hm93jGso0F7dYl6Eo0ryrkm3rVyW8Qfk4k=;
 b=c9+LpEn5MmOEH2zEIJj6hfsy8tRn9vgOVEEGKmlEGcfe4H2K6UUD+AyI
 ppq8g2tgaK2iDEAchbf0cdBWbraRClpSkFma0A4cSvLuvhByRhZemBgMG
 MCyy/QblylCsWzV7tfIq8iJub9RigiH1wKDa4FFrM597IxXisAk+7F7hH w=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
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
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: uT15lL5O5rZKC5up/TAFVHN3buLQvtSfnu8Md88RYw0LCuPnkJ1dAisV8+yrAdEqbherEGQAgW
 dOCu+wGL46XjZBea5UNUNTrQ8JU1t6RUCg/jOohW1+p/Tm8Gza9HMLJi/Fj92mSy/mKnmENSuB
 O7B+wdExy8BklA4Eb3uC+lEpseTzaZn5NQCLXgauFTiLnLn7k9X2pAuYxuexgRUtjcTD+qsNcY
 CzWCz44DMgX0RpbkLk6Dxq3jYrCUAWm5MdbX4SuDD2wACtvJeqpwxotDbEkLZa9FV8hJl5YQrB
 EOY=
X-SBRS: 2.7
X-MesageID: 9817579
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,282,1571716800"; 
   d="scan'208";a="9817579"
To: Nick Rosbrook <rosbrookn@gmail.com>
References: <cover.1573840473.git.rosbrookn@ainfosec.com>
 <938dbf7c3a083ec050c16729805f4ce5f3f2891f.1573840474.git.rosbrookn@ainfosec.com>
 <cabd32fd-7c1e-ad7a-c4ce-1ae716894746@citrix.com>
 <d4061074-0825-d4ad-4ece-4da0d3c9049c@citrix.com>
 <CAEBZRScC3J6-6F79Cw3_SN=z-VguCkt3dM5YWer2pm8gfTrTww@mail.gmail.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <a6f04edb-4889-0047-31b8-663394ed2196@citrix.com>
Date: Thu, 5 Dec 2019 17:33:15 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAEBZRScC3J6-6F79Cw3_SN=z-VguCkt3dM5YWer2pm8gfTrTww@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 16/22] golang/xenlight: implement keyed
 union C to Go marshaling
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, kerriganb@ainfosec.com,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIvNS8xOSA0OjUzIFBNLCBOaWNrIFJvc2Jyb29rIHdyb3RlOgo+Pj4gSXQgbG9va3MgbGlr
ZSB0aGlzIGlzIGR1cGxpY2F0aW5nIChkaWZmZXJlbnRseSEpIHRoZSBmaWVsZC1jb3B5aW5nIGNv
ZGUKPj4+IGZyb20gZ29sYW5nX2RlZmluZV9mcm9tX0MuICBJcyB0aGVyZSBhbnkgcmVhc29uIHlv
dSBjb3VsZG4ndCBoYXZlIGEKPj4+IHNpbmdsZSBmdW5jdGlvbiwgYHhlbmxpZ2h0X2dvbGFuZ19m
aWVsZHNfZnJvbV9DYCwgd2hpY2ggd291bGQgYmUgdXNlZAo+Pj4gZm9yIGJvdGg/Cj4gCj4gTm8s
IEkgc2hvdWxkIGJlIGFibGUgdG8gcmUtZmFjdG9yIHRoYXQuIFRoYW5rcy4KPiAKPj4gQWN0dWFs
bHksIGl0IHR1cm5zIG91dCB3ZSBkb24ndCBzdHJpY3RseSBuZWVkIHRvIGR1cGxpY2F0ZSB0aGlz
IGF0IGFsbCwKPj4gaWYgd2UgdXNlIHRoZSBgdHlwZW9mYCBvcGVyYXRvciwgbGlrZSB0aGlzOgo+
Pgo+PiAtLS0KPj4gdHlwZWRlZiB0eXBlb2YoKChzdHJ1Y3QgbGlieGxfY2hhbm5lbGluZm8gKilO
VUxMKS0+dS5wdHkpCj4+IGxpYnhsX2NoYW5uZWxpbmZvX2Nvbm5lY3Rpb25fdW5pb25fcHR5Owo+
Pgo+PiB0eXBlZGVmIHR5cGVvZigoKHN0cnVjdCBsaWJ4bF9kb21haW5fYnVpbGRfaW5mbyAqKU5V
TEwpLT51Lmh2bSkKPj4gbGlieGxfZG9tYWluX2J1aWxkX2luZm9fdHlwZV91bmlvbl9odm07Cj4+
Cj4+IHR5cGVkZWYgdHlwZW9mKCgoc3RydWN0IGxpYnhsX2RvbWFpbl9idWlsZF9pbmZvICopTlVM
TCktPnUucHYpCj4+IGxpYnhsX2RvbWFpbl9idWlsZF9pbmZvX3R5cGVfdW5pb25fcHY7Cj4+Cj4+
IHR5cGVkZWYgdHlwZW9mKCgoc3RydWN0IGxpYnhsX2RvbWFpbl9idWlsZF9pbmZvICopTlVMTCkt
PnUucHZoKQo+PiBsaWJ4bF9kb21haW5fYnVpbGRfaW5mb190eXBlX3VuaW9uX3B2aDsKPj4KPj4g
dHlwZWRlZiB0eXBlb2YoKChzdHJ1Y3QgbGlieGxfZGV2aWNlX3VzYmRldiAqKU5VTEwpLT51Lmhv
c3RkZXYpCj4+IGxpYnhsX2RldmljZV91c2JkZXZfdHlwZV91bmlvbl9ob3N0ZGV2Owo+Pgo+PiB0
eXBlZGVmIHR5cGVvZigoKHN0cnVjdCBsaWJ4bF9kZXZpY2VfY2hhbm5lbCAqKU5VTEwpLT51LnNv
Y2tldCkKPj4gbGlieGxfZGV2aWNlX2NoYW5uZWxfY29ubmVjdGlvbl91bmlvbl9zb2NrZXQ7Cj4+
IC0tLQo+Pgo+PiBUaGlzIGd1YXJhbnRlZXMgd2UnbGwgaGF2ZSB0aGUgY29ycmVjdCBsYXlvdXQg
Zm9yIHRoZSByZXN1bHRpbmcgdHlwZS4KPiAKPiBXZWxsIHRoYXQncyBwcmV0dHkgY29vbC4KPiAK
Pj4gSSB0YWxrZWQgdG8gSWFuIEphY2tzb24sIGFuZCBoZSBhZ3JlZWQgdGhhdCBsb25nLXRlcm0g
aXQgd291bGQgYmUgZ29vZAo+PiBmb3IgdGhlIEMgZ2VuZXJhdG9yIHRvIGdlbmVyYXRlIG5hbWVk
IHR5cGVzIGZvciB0aGVzZSB1bmlvbiBlbGVtZW50cwo+PiAobGlra2UgeW91IGhhdmUgaGVyZSku
ICBJZiB5b3UgZmVsdCByZWFsbHkgbW90aXZhdGVkIHlvdSBjb3VsZCBkbyB0aGF0Cj4+IG5vdzsg
YnV0IEkgdGhpbmsgdXNpbmcgdGhlIGB0eXBlb2ZgIHRyaWNrIHdvdWxkIGJlIHN1aXRhYmxlIHRv
IGdldCB0aGlzCj4+IHBhdGNoIGluLgo+IAo+IEknbGwgdGFrZSBhIGxvb2sgYXQgbGVhc3QgYW5k
IHNlZSBpZiBJIGNhbiBnZXQgaXQgZG9uZSBmYWlybHkgZWFzaWx5Lgo+IE90aGVyd2lzZSwgSSds
bCB1c2UgdGhpcyB0cmljay4KCkl0IGFjdHVhbGx5IG9jY3VycyB0byBtZSB0aGF0IHRoZSAibmFt
ZWQgc3RydWN0IGVsZW1lbnRzIG9mIHVuaW9uIiB3b3VsZApzdGlsbCB0ZWNobmljYWxseSBvcGVu
IHVwIGEgd2luZG93IGZvciBkaXZlcmdlbmNlOiBpLmUuLCBpZiBzb21laG93IHRoZQp0eXBlIG9m
IHRoZSBuYW1lZCBzdHJ1Y3QgZGlkbid0IG1hdGNoIHVwIHdpdGggdGhlIHVuaW9uIGVsZW1lbnQu
CgpJLmUuLCB0aGUgZm9sbG93aW5nICpzaG91bGRuJ3QqIGhhcHBlbiwgYnV0IHRlY2huaWNhbGx5
IGl0ICpjb3VsZCo6CgotLS0tCnN0cnVjdCBsaWJ4bF9kb21haW5fYnVpbGRfaW5mb191bmlvbl9o
dm0gewogLi4uCn0KCnN0cnVjdCBsaWJ4bF9kb21haW5fYnVpbGRfaW5mbyB7CiAgdW5pb24gewog
ICAgbGlieGxfZG9tYWluX3N0cnVjdF9idWlsZF9pbmZvX2h2bTIgaHZtOwogIH0gdTsKfQotLS0K
ClVzaW5nIHRoZSBgdHlwZW9mYCB0cmljayBhYm92ZSBndWFyYW50ZWVzIHRoYXQgdGhlIHR5cGVz
IHRoZSBtYXJzaGFsaW5nCmZ1bmN0aW9ucyBhcmUgdXNpbmcgYXJlIGlkZW50aWNhbCB0byB0aGUg
dHlwZXMgYWN0dWFsbHkgc3BlY2lmaWVkIGluIHRoZQp1bmlvbiBpdHNlbGYuICBQYXJ0aWN1bGFy
bHkgYXMgdGhpcyBpcyBqdXN0IGdlbmVyYXRlZCBjb2RlIG5vYm9keSdzCmdvaW5nIHRvIGxvb2sg
YXQsIEknbSBpbmNsaW5lZCB0byB0aGluayB0aGUgY29zdCBpcyBuZWFyLXplcm8uICBTaW5jZQp0
aGUgYmVuZWZpdCBpcyBub24temVybywgSSdkIGJlIGluY2xpbmVkIHRvIHNheSBqdXN0IGdvIHdp
dGggdGhhdCBpbnN0ZWFkLgoKQW5kIGl0J3MgZWFzaWVyIQoKVGhvdWdodHM/CgogLUdlb3JnZQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
