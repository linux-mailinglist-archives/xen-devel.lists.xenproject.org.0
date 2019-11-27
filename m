Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 470DE10B2D3
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 16:58:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZzfo-0002je-Br; Wed, 27 Nov 2019 15:56:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vK6a=ZT=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1iZzfm-0002jS-SR
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 15:56:10 +0000
X-Inumbo-ID: 6acbb84a-112e-11ea-a3b8-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6acbb84a-112e-11ea-a3b8-12813bfff9fa;
 Wed, 27 Nov 2019 15:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574870165;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=80xVpcB2EVnzaWDZOOTqkXv8An5ipW7L/dyt7311gKU=;
 b=VukAw5sYYMpxguoHk7i2Hv555N1u06jUevTHFKDuLlAxe9+Y4GfzkA6V
 vtVUShFuKB9SqKVlty+BnzmRRMVM2kpkJCD6dK1z7+QS63J5WrnvS3ENL
 MXUZyNogAhcoaVEtWleoc6k069Sq12Y7Ptm6Q76Sj5LkQ/39SN2hpKUE3 w=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=sergey.dyasli@citrix.com;
 spf=Pass smtp.mailfrom=sergey.dyasli@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 sergey.dyasli@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 sergey.dyasli@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: hfRca5R8n+N9/PrgykF+NDGjouNgz+z6D906He2nxN5CmHRfavYy4ArXWhG/xtlOkdYS+XRYQC
 J1B0jvRRcmSHRQGJTEOKUnDzNZS8wzdPIN7BJu17grnx5Y9V2Gsmn8bdVIw0AlAm7XBgvYOB5A
 SgB1f1yPagDMex3Po6HWJtjoSERMCLERk5wu4eGEojATlaeXSDZGYK+Rtm6HCSKQ2wurY2T5tg
 CcYvYi46tnQWmpQv7ZCpGUhtm40pnaCohI8U+6KHoZCqeJMKeog/0UNe3T0qoCGsoCjtP3X0OY
 V9I=
X-SBRS: 2.7
X-MesageID: 8918429
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,250,1571716800"; 
   d="scan'208";a="8918429"
To: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
References: <5ef38d72-3a80-e2ef-68d9-ec498866d4eb@citrix.com>
 <DD847497-6517-4668-9AD6-66F11B91288A@amazon.com>
 <b686f6b2-96e4-6f41-7844-bb0ab184cc71@citrix.com>
 <D092B667-0662-4B8E-958E-02B14530C363@amazon.com>
 <d65106c4-e35d-bd69-0539-a7fb525ae776@citrix.com>
 <1A2AE077-662E-40C0-820D-13EC3B88D1F3@amazon.com>
 <69cbfa61-fae3-ee6a-b482-31cca7f05d60@citrix.com>
 <60D2D242-4806-402F-99BC-F0CE572E5925@amazon.com>
 <CF690FB1-DF59-44B3-AB3F-B2101617826E@amazon.com>
 <5efd649a-4f70-0955-a789-a7cf8ea7c377@citrix.com>
 <B621C71F-0798-4CAC-8201-484D17A93888@amazon.com>
From: Sergey Dyasli <sergey.dyasli@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=sergey.dyasli@citrix.com; keydata=
 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
Message-ID: <26495d21-1b4b-1712-e09d-9d4abc2c7a48@citrix.com>
Date: Wed, 27 Nov 2019 15:56:00 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <B621C71F-0798-4CAC-8201-484D17A93888@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] livepatch-build-tools regression
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
Cc: "sergey.dyasli@citrix.com >> Sergey
 Dyasli" <sergey.dyasli@citrix.com>, "Paraschiv,
 Andra-Irina" <andraprs@amazon.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, "Pohlack,
 Martin" <mpohlack@amazon.de>, Ross Lagerwall <ross.lagerwall@citrix.com>,
 "Manthey, Norbert" <nmanthey@amazon.de>, Martin Mazein <amazein@amazon.de>,
 Xen-devel <xen-devel@lists.xenproject.org>, "Doebel,
 Bjoern" <doebel@amazon.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcvMTEvMjAxOSAxNToyMiwgV2llY3pvcmtpZXdpY3osIFBhd2VsIHdyb3RlOgo+IAo+IAo+
PiBPbiAyNy4gTm92IDIwMTksIGF0IDEyOjE2LCBTZXJnZXkgRHlhc2xpIDxzZXJnZXkuZHlhc2xp
QGNpdHJpeC5jb20+IHdyb3RlOgo+Pgo+PiBPbiAyNi8xMS8yMDE5IDE4OjM3LCBXaWVjem9ya2ll
d2ljeiwgUGF3ZWwgd3JvdGU6Cj4+PiBJdCBsb29rcyBsaWtlIGdjYyBwbGF5cyB0aGUgdXN1YWwg
ZGlydHkgdHJpY2tzIHdpdGggbG9jYWwgdmFyaWFibGVzIHJlbmFtaW5nOgo+Pj4KPj4+IC0geGVu
LXN5bXMKPj4+ICA3NTI5OiBmZmZmODJkMDgwNWZlZDUwICAgICA4IE9CSkVDVCAgTE9DQUwgIERF
RkFVTFQgNDIzMCBsYXN0cGFnZS4yMjg1Nwo+Pj4gLSBsaXZlcGF0Y2gKPj4+ICAgMjg5OiAwMDAw
MDAwMDAwMDAwMDAwICAgICA4IE9CSkVDVCAgR0xPQkFMIERFRkFVTFQgIFVORCBodm0uYyNsYXN0
cGFnZS4yMjg1Ngo+Pj4KPj4+IFRoZW4sIHN5bWJvbHMgcmVzb2x1dGlvbiBieSBuYW1lIGZhaWxz
Li4KPj4+Cj4+PiBDYW4geW91IHBsZWFzZSB0cnkgdG8gYnVpbGQgdGhlIGxpdmVwYXRjaCBtb2R1
bGUgd2l0aCBhZGRpdGlvbmFsIG9wdGlvbiAn4oCUcHJlbGluaycgYW5kIGdpdmUgaXQgYSB0cnkg
Pwo+Pgo+PiBNeSBMUCBsb2FkaW5nIGVycm9yIGlzOgo+Pgo+PiAgICAoWEVOKSBsaXZlcGF0Y2g6
IGxwOiBVbmtub3duIHN5bWJvbDogLkxDNwo+Pgo+PiBXaGVuIEkgcGFzcyAtLXByZWxpbmsgdG8g
bGl2ZXBhdGNoLWJ1aWxkLCBpdCBjb21wbGFpbnMgaW4gYSBzaW1pbGFyIHdheToKPj4KPj4gICAg
bGl2ZXBhdGNoLWJ1aWxkLXRvb2xzL3ByZWxpbms6IEVSUk9SOiBvdXRwdXQubzogbGl2ZXBhdGNo
X3Jlc29sdmVfc3ltYm9sczogODA6IGxvb2t1cF9sb2NhbF9zeW1ib2wgLkxDNyAocDJtLmMpCj4+
Cj4gCj4gQ291bGQgeW91IGdpdmUgdGhpcyB0ZXN0aW5nIHBhdGNoIGEgdHJ5Pwo+IAo+IGRpZmYg
LS1naXQgYS9jcmVhdGUtZGlmZi1vYmplY3QuYyBiL2NyZWF0ZS1kaWZmLW9iamVjdC5jCj4gaW5k
ZXggOGQ2Mzk0MC4uMTA4MDdkMiAxMDA2NDQKPiAtLS0gYS9jcmVhdGUtZGlmZi1vYmplY3QuYwo+
ICsrKyBiL2NyZWF0ZS1kaWZmLW9iamVjdC5jCj4gQEAgLTgzOSw4ICs4MzksMTAgQEAgc3RhdGlj
IHZvaWQga3BhdGNoX2NvbXBhcmVfc3ltYm9scyhzdHJ1Y3QgbGlzdF9oZWFkICpzeW1saXN0KQo+
ICAgICAgICAgbGlzdF9mb3JfZWFjaF9lbnRyeShzeW0sIHN5bWxpc3QsIGxpc3QpIHsKPiAgICAg
ICAgICAgICAgICAgaWYgKHN5bS0+dHdpbikKPiAgICAgICAgICAgICAgICAgICAgICAgICBrcGF0
Y2hfY29tcGFyZV9jb3JyZWxhdGVkX3N5bWJvbChzeW0pOwo+IC0gICAgICAgICAgICAgICBlbHNl
Cj4gKyAgICAgICAgICAgICAgIGVsc2Ugewo+ICAgICAgICAgICAgICAgICAgICAgICAgIHN5bS0+
c3RhdHVzID0gTkVXOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIHN5bS0+aW5jbHVkZSA9IDE7
Cj4gKyAgICAgICAgICAgICAgIH0KPiAKPiAgICAgICAgICAgICAgICAgbG9nX2RlYnVnKCJzeW1i
b2wgJXMgaXMgJXNcbiIsIHN5bS0+bmFtZSwgc3RhdHVzX3N0cihzeW0tPnN0YXR1cykpOwo+ICAg
ICAgICAgfQo+IAoKTG9va3MgbGlrZSB0aGlzIGNoYW5nZSBmaXhlZCB0aGUgaXNzdWUgZm9yIG1l
IQpPbmUgdGhpbmcgdG8gbm90aWNlIGlzIHRoYXQgdGhlIHNpemUgb2YgYSBzdHJpcHBlZCBMUCBi
aW5hcnkgaW5jcmVhc2VkCmZyb20gNDVLIHRvIDYwSy4KCi0tClRoYW5rcywKU2VyZ2V5CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
