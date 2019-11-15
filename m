Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0AFFDD1C
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 13:13:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVaR1-0005WE-JP; Fri, 15 Nov 2019 12:10:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bLue=ZH=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iVaQz-0005W9-SV
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 12:10:41 +0000
X-Inumbo-ID: f0a01f7a-07a0-11ea-984a-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f0a01f7a-07a0-11ea-984a-bc764e2007e4;
 Fri, 15 Nov 2019 12:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573819840;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=ndLLwKJnjeU134MTvjngb5dPEmsPbvHWY0RnT0jhHkw=;
 b=MAFQ5tP8RdxOFpbGYPaC4ksSkJr69yiuShQsyBd4md7jd8OCXrfbcCDd
 O4v3LsFO40CKOQitStdheqJxENq9GZlO0l/uoPCcmSgtiuzkigDCtyAjP
 yjMqfMJ9DpYIQpSjUMzkBPB6jcJVMrpbCA3la9TEr+oHznzZF2MAAqceI U=;
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
IronPort-SDR: wWNUk7lIRvHR9D1j9G2wJayop6iyUqnDutrWpIhSRGlyy+OyLe224G8u93akntbeS/QZT2hMTq
 B8dUi1h9Hp+4zH3ydb/q0iRcARde0p/d7uDpg+PU46m4xU5C4fskGT300swZnMP8z1Q2pvU5Fo
 7XvuziTW3TkwVlLBjuS/S3QwlBrWTJ/xnJM44qGeZNXL+giHkw6Cl36YysN3DbZfZsTXx+SCjG
 CpyoR3Wxjr6Wwl9zWRrQ/+WTx1TnYAYv+8vLDKYr27YNzzxwxfrcyeg7AaPdea9S7w7zw/Bxof
 5xU=
X-SBRS: 2.7
X-MesageID: 8790593
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,308,1569297600"; 
   d="scan'208";a="8790593"
To: Andreas Kinzler <hfp@posteo.de>, <xen-devel@lists.xenproject.org>, "Steven
 Haigh" <netwiz@crc.id.au>
References: <20191115105739.20333-1-george.dunlap@citrix.com>
 <50a66402-4354-cbfc-b3b9-058b4cd37498@posteo.de>
 <e428217a-06b2-637d-85ff-357b1227bf1d@citrix.com>
 <0c400301-63e6-999e-2bc5-9eccb5d19b6d@posteo.de>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <9748c5a7-a4d7-33a5-574e-8659c42d0d9e@citrix.com>
Date: Fri, 15 Nov 2019 12:10:36 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <0c400301-63e6-999e-2bc5-9eccb5d19b6d@posteo.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH RFC] x86: Add hack to disable "Fake HT" mode
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEvMTUvMTkgMTE6MzkgQU0sIEFuZHJlYXMgS2luemxlciB3cm90ZToKPiBPbiAxNS4xMS4y
MDE5IDEyOjI5LCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+PiBPbiAxMS8xNS8xOSAxMToxNyBBTSwg
QW5kcmVhcyBLaW56bGVyIHdyb3RlOgo+Pj4gSSBkbyBub3QgdW5kZXJzdGFuZCBhIGNlbnRyYWwg
cG9pbnQ6IE5vIG1hdHRlciB3aHkgYW5kL29yIGhvdyBhIGZha2UKPj4+IHRvcG9sb2d5IGlzIHBy
ZXNlbnRlZCBieSBYZW4sIHdoeSBkaWQgdGhlIG9sZGVyIGdlbmVyYXRpb24gUnl6ZW4gMnh4eAo+
Pj4gd29yayBhbmQgUnl6ZW4gM3h4eCBkb2Vzbid0PyBXaGF0IGlzIHRoZSBjaGFuZ2UgaW4gQU1E
KCEpIG5vdCBYZW4gdGhhdAo+Pj4gY2F1c2VzIHRoZSBvbmUgdG8gd29yayBhbmQgdGhlIG90aGVy
IHRvIGZhaWw/Cj4+IFRoZSBDUFUgZmVhdHVyZXMgdGhhdCB0aGUgZ3Vlc3Qgc2VlcyBhcmUgYSBt
aXggb2YgdGhlIHJlYWwgdW5kZXJseWluZwo+PiBmZWF0dXJlcyBhbmQgY2hhbmdlcyBtYWRlIGJ5
IFhlbi7CoCBYZW4gYW5kL29yIHRoZSBoYXJkd2FyZSB3aWxsIGJlaGF2ZQo+IAo+IFdoeSBub3Qg
YW5hbHl6ZSB0aGUgYml0cyBpbiBkZXRhaWw/IEkgYWxyZWFkeSBwb3N0ZWQgdGhlIGNvbXBsZXRl
IENQVUlECj4gZm9yIDM3MDBYCj4gKGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2
ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOS0wOS9tc2cwMjE4OS5odG1sKS4KPiAKPiAKPiBAU3RldmVu
Ogo+PiBJZiB0aGlzIGlzIGhlbHBmdWwsIEkgY2FuIHByb2JhYmx5IHByb3ZpZGUgdGhlIHNhbWUg
ZnJvbToKPj7CoMKgwqAgKiBSeXplbiAyNzAweAo+PsKgwqDCoCAqIFJ5emVuIDM5MDB4Cj4gQ2Fu
IHlvdSBwb3N0IGZvciAyNzAwWD8KPiAKPiBUaGVuIHNvbWVvbmUgd2l0aCBkZXRhaWxlZCBrbm93
bGVkZ2UgY291bGQgY29tcGFyZSB0aGUgdHdvPwoKV2hhdCB3b3VsZCBiZSB0aGUgcHVycG9zZT8K
ClRoZSBjb2RlIGlzIGdvaW5nIHRvIGxvb2sgbGlrZSB0aGlzIC0tCgpodHRwczovL2dpdGxhYi5j
b20veGVuLXByb2plY3QveGVuL2Jsb2Ivc3RhZ2luZy94ZW4vYXJjaC94ODYvY3B1L2NvbW1vbi5j
CgotLSBhbiBpbXBlbmV0cmFibGUgbWF6ZSBvZiAic3dpdGNoIiBhbmQgImlmIiBzdGF0ZW1lbnRz
IGJhc2VkIG9uCmluZGl2aWR1YWwgYml0cyBvciBmZWF0dXJlcyBvciBtb2RlbHMuICAqU29tZXdo
ZXJlKiBpbiBXaW5kb3cncyB2ZXJzaW9uCm9mIHRoYXQgY29kZSwgdGhlcmUncyBhIHBhdGggd2hp
Y2ggaXMgdHJpZ2dlcmVkIGJ5ClJ5emVuLTN4eHgtWGVuLXdpdGgtRmFrZS1IVCBidXQgbm90IHRy
aWdnZXJlZCBieQpSeXplbi0yeHh4LXdpdGgtWGVuLUZha2UtSFQsIG9yIFJ5emVuLTN4eHgtWGVu
LXdpdGhvdXQtRmFrZS1IVC4KCkFuZCBzdXBwb3NlIHdlIGZvdW5kIGV4YWN0bHkgdGhlIGJpdHMg
d2hpY2ggdHJpZ2dlcmVkIGl0LCB3aGF0IHRoZW4/ICBXZQpjb3VsZCBmbGlwIGp1c3QgdGhhdCBi
aXQ7IGJ1dCB0aGF0IHdvdWxkIG1ha2UgdGhlIHJlc3VsdGluZyBDUFVJRCBldmVuCiptb3JlKiB3
ZWlyZCwgYW5kIGxpa2VseSB0byB0cmlnZ2VyIHNvbWV0aGluZyBlbHNlIGluIHRoZSBmdXR1cmUu
CgpUaGUgc29sdXRpb24gdGhpcyBwYXRjaCBwcm9wb3NlcyBkb2Vzbid0IG1ha2UgdGhlIENQVUlE
IHRvcG9sb2d5CiJub3JtYWwiLCBidXQgaXQgY2VydGFpbmx5IG1ha2VzIGl0IGEgbG90IGxlc3Mg
d2VpcmQsIHdoaWNoIGlzIGEgYmV0dGVyCnBsYWNlIHRvIGJlLgoKIC1HZW9yZ2UKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
