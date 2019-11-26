Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E9D10A560
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 21:22:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZhIL-0000s8-Qd; Tue, 26 Nov 2019 20:18:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/P3v=ZS=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iZhIK-0000s3-Oh
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 20:18:44 +0000
X-Inumbo-ID: f14ea40e-1089-11ea-a3a7-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f14ea40e-1089-11ea-a3a7-12813bfff9fa;
 Tue, 26 Nov 2019 20:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574799523;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=j4UwwaFhtENvhuRRcBbYH8nN3DZsUeniKrm3ImCCfk4=;
 b=g2siZZMEMDKN0OGHjd9nA/dW8y1+7+UNFqOft+sG1n5USnLcG7GtZhnG
 SC686viuodhudqqF0dP3CEGeucfHqPmVAPEGWgYMyAZqVKX0VgM8hzyNg
 1pwj0PWYutsHbXPRCAcSSJqXkVZxbejQAM/IRe/dmjxmv+xDBr2esmQVC U=;
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
IronPort-SDR: IRtoMuus+YHDRiaz5zHOErumUVOjsbEjGmaxz7dw9APX+beON6nyjF7tUU6Eho/nN/whhzaZjr
 F5bIzp36XucdUrpxGaSj47dZZroSm6yU318JLf1DOUoe64YNLIptOYKOklbBpxGewBwP6FLRvS
 fBsuV/Wqajb697rJmDQv4/bKoPs1PvPVB1oisuesNMpMFdE9ggplp5uv4UX9AVOdwA9UCGR2z9
 giNdFVD2aCsEOe9xXsMvXds/qOin9s572hTMsHe8xUHCGaKcdgzD/QjxeMHkpJXoPWCzUCnaF4
 8NM=
X-SBRS: 2.7
X-MesageID: 9230927
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,246,1571716800"; 
   d="scan'208";a="9230927"
To: Roman Shaposhnik <roman@zededa.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <0ba2bc19-2388-5fdc-43bd-3ac39497291c@suse.com>
 <CAMmSBy9Ti3nCt2EhT6XOcrBLWabpPqQFHA1G-Fc4N3gRg1qPUg@mail.gmail.com>
 <91d6b37f-6f83-183d-6b1e-297c0381af75@citrix.com>
 <CAMmSBy-Pr23H1U00S5rJWP205FSkx4HX-GiSkKygyopwf3FD9w@mail.gmail.com>
 <20191125004706.GB2012@mail-itl>
 <CAMmSBy9gkVR-ua9=kVn9rNSb2VnvvtzaLL=ZM-GXxCdtRGRtvA@mail.gmail.com>
 <20191126035517.GT5763@mail-itl>
 <CAMmSBy8yawo0Oc0Ba90Cox7jb+vNoQfMqA1Uqap2XGsL-x8ONw@mail.gmail.com>
 <CAMmSBy_2gQCPOJjo-VWZ3gmbER+5QPNJyQJN3u_SgKDGZQadGg@mail.gmail.com>
 <20191126183202.GV5763@mail-itl>
 <CAMmSBy8j6OzxdvJNGseLP++qstCjPajjv-N=fwbu3i3Zu-qaiw@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <a520243e-d20f-01f2-bf58-c4916dd8508a@citrix.com>
Date: Tue, 26 Nov 2019 20:18:39 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAMmSBy8j6OzxdvJNGseLP++qstCjPajjv-N=fwbu3i3Zu-qaiw@mail.gmail.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] UEFI support on Dell boxes (was: Re: Status of 4.13)
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYvMTEvMjAxOSAyMDoxMiwgUm9tYW4gU2hhcG9zaG5payB3cm90ZToKPiBPbiBUdWUsIE5v
diAyNiwgMjAxOSBhdCAxMDozMiBBTSBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kKPiA8bWFy
bWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNvbT4gd3JvdGU6Cj4+IE9uIFR1ZSwgTm92IDI2LCAy
MDE5IGF0IDA5OjU2OjI1QU0gLTA4MDAsIFJvbWFuIFNoYXBvc2huaWsgd3JvdGU6Cj4+PiBIaSBN
YXJlaywgYWZ0ZXIgYXBwbHlpbmcgSmFuJ3MgcGF0Y2ggSSdtIG1ha2luZyBtdWNoIGZ1cnRoZXIg
cHJvZ3Jlc3MuCj4+PiBYZW4gYm9vdHMgZmluZSBhbmQgRG9tMCBzZWVtcyB0byBiZSBPSyAobW9y
ZSB0ZXN0cyBhcmUgbmVlZGVkIHRobyBvbgo+Pj4gbXkgZW5kKS4KPj4+Cj4+PiBJJ20gYXR0YWNo
aW5nIHRoZSBsb2dzIGZyb20gWGVuIGFuZCBEb20wLgo+Pj4KPj4+IEF0IHRoaXMgcG9pbnQgaXQg
c2VlbXMgdGhhdCBhZGRpbmcgZWZpPWF0dHI9dWMgaXMgYSBiZXR0ZXIgb3B0aW9uIGZvcgo+Pj4g
dGhlc2UgYm94ZXMgdGhhbiBhIHdob2xlc2FsZSBlZmk9bm8tcnMKPj4+Cj4+PiBRdWVzdGlvbiAj
MTogaXMgdGhpcyBzb21ldGhpbmcgdGhhdCBFRklfU0VUX1ZJUlRVQUxfQUREUkVTU19NQVAgd2Fz
Cj4+PiBzdXBwb3NlZCB0byBjb3ZlciBieSBkZWZhdWx0IChzbyBJIGRvbid0IGhhdmUgdG8gYWRk
IGVmaT1hdHRyPXVjKT8KPj4gTm8sIHRoaXMgbG9va3MgbGlrZSBzb21lIGRpZmZlcmVudCBmaXJt
d2FyZSAoPykgaXNzdWUuCj4+Cj4+PiBRdWVzdGlvbiAjMjogaXMgdGhlcmUgYW55IGRvd25zaWRl
IHRvICphbHdheXMqIHNwZWNpZnlpbmcgZWZpPWF0dHI9dWM/Cj4+PiBFdmVuIGZvciBzZXJ2ZXJz
IHRoYXQsIHN0cmljdGx5IHNwZWFraW5nLCBkb24ndCBuZWVkIGl0Pwo+PiBUTDtEUjogSXQgc2hv
dWxkIGJlIGZpbmUuIEl0IGlzIHdoYXQgTGludXggZG9lcyB0b28uCj4+Cj4+IERldGFpbHM6Cj4+
Cj4+IExldHMgdGFrZSBhIGxvb2sgd2h5ICdlZmk9YXR0cj11YycgaGVscHMsIGFuZCBob3cgY2Fu
IHdlIG1ha2UgaXQgd29yawo+PiBvdXQgb2YgdGhlIGJveDoKPj4KPj4gVGhlIGlzc3VlIGlzIGFi
b3V0IG1lbW9yeSBtYXJrZWQgYXMgdHlwZT0xMSAoRWZpTWVtb3J5TWFwcGVkSU8pIHdpdGgKPj4g
YXR0cj04MDAwMDAwMDAwMDAwMDAwIChFRklfTUVNT1JZX1JVTlRJTUUpLiBJbmRlZWQgbm9uZSBv
ZiBjYWNoYWJpbGl0eQo+PiBhdHRyaWJ1dGUgaXMgZGVmaW5lZC4gRm9yIHRoZSByZWNvcmQsIGRl
ZmluZWQgYXR0cmlidXRlcyBhcmUgKFVFRkkgc3BlYwo+PiAuNik6Cj4+Cj4+ICAgICBFRklfTUVN
T1JZX1VDIE1lbW9yeSBjYWNoZWFiaWxpdHkgYXR0cmlidXRlOiBUaGUgbWVtb3J5IHJlZ2lvbiBz
dXBwb3J0cwo+PiAgICAgYmVpbmcgY29uZmlndXJlZCBhcyBub3QgY2FjaGVhYmxlLgo+Pgo+PiAg
ICAgRUZJX01FTU9SWV9XQyBNZW1vcnkgY2FjaGVhYmlsaXR5IGF0dHJpYnV0ZTogVGhlIG1lbW9y
eSByZWdpb24gc3VwcG9ydHMKPj4gICAgIGJlaW5nIGNvbmZpZ3VyZWQgYXMgd3JpdGUgY29tYmlu
aW5nLgo+Pgo+PiAgICAgRUZJX01FTU9SWV9XVCBNZW1vcnkgY2FjaGVhYmlsaXR5IGF0dHJpYnV0
ZTogVGhlIG1lbW9yeSByZWdpb24gc3VwcG9ydHMKPj4gICAgIGJlaW5nIGNvbmZpZ3VyZWQgYXMg
Y2FjaGVhYmxlIHdpdGggYSDigJx3cml0ZSB0aHJvdWdo4oCdIHBvbGljeS4KPj4gICAgIFdyaXRl
cyB0aGF0IGhpdCBpbiB0aGUgY2FjaGUgd2lsbCBhbHNvIGJlIHdyaXR0ZW4gdG8gbWFpbiBtZW1v
cnkuCj4+Cj4+ICAgICBFRklfTUVNT1JZX1dCIE1lbW9yeSBjYWNoZWFiaWxpdHkgYXR0cmlidXRl
OiBUaGUgbWVtb3J5IHJlZ2lvbiBzdXBwb3J0cwo+PiAgICAgYmVpbmcgY29uZmlndXJlZCBhcyBj
YWNoZWFibGUgd2l0aCBhIOKAnHdyaXRlIGJhY2vigJ0gcG9saWN5LiBSZWFkcwo+PiAgICAgYW5k
IHdyaXRlcyB0aGF0IGhpdCBpbiB0aGUgY2FjaGUgZG8gbm90IHByb3BhZ2F0ZSB0byBtYWluIG1l
bW9yeS4KPj4gICAgIERpcnR5IGRhdGEgaXMgd3JpdHRlbiBiYWNrIHRvIG1haW4gbWVtb3J5IHdo
ZW4gYSBuZXcgY2FjaGUgbGluZQo+PiAgICAgaXMgYWxsb2NhdGVkLgo+Pgo+PiAgICAgRUZJX01F
TU9SWV9VQ0UgTWVtb3J5IGNhY2hlYWJpbGl0eSBhdHRyaWJ1dGU6IFRoZSBtZW1vcnkgcmVnaW9u
IHN1cHBvcnRzCj4+ICAgICBiZWluZyBjb25maWd1cmVkIGFzIG5vdCBjYWNoZWFibGUsIGV4cG9y
dGVkLCBhbmQgc3VwcG9ydHMgdGhlCj4+ICAgICDigJxmZXRjaCBhbmQgYWRk4oCdIHNlbWFwaG9y
ZSBtZWNoYW5pc20uCj4+Cj4+IE15IHJlYWRpbmcgb2YgVUVGSSBzcGVjIGRvZXNuJ3QgZ2l2ZSBt
dWNoIGhpbnRzIHdoYXQgdG8gZG8gd2l0aCBtZW1vcnkKPj4gbWFwcGluZ3Mgd2l0aG91dCBhbnkg
Y2FjaGFiaWxpdHkgYXR0cmlidXRlLiBUaGUgb25seSByZWxhdGVkIGluZm8gSSd2ZQo+PiBmb3Vu
ZCBpcyBhYm91dCBFZmlNZW1vcnlNYXBwZWRJTzoKPj4KPj4gICAgIFRoaXMgbWVtb3J5IGlzIG5v
dCB1c2VkIGJ5IHRoZSBPUy4gQWxsIHN5c3RlbSBtZW1vcnktbWFwcGVkIElPCj4+ICAgICBpbmZv
cm1hdGlvbiBzaG91bGQgY29tZSBmcm9tIEFDUEkgdGFibGVzLgo+Pgo+PiBTbywgbWF5YmUgdGhl
cmUgaXMgc29tZSBtb3JlIGluZm8/Cj4+Cj4+IEFueXdheSwgaWYgSSB1bmRlcnN0YW5kIGNvcnJl
Y3RseSwgTU1JTyByZWdpb24gc2hvdWxkIGJlIG1hcHBlZCBhcyBVQywKPj4gcmlnaHQ/Cj4+Cj4+
IEkndmUgYWxzbyB0YWtlbiBsb29rIGF0IHdoYXQgTGludXggZG9lcy4gQW5kIGJhc2ljYWxseSwg
dGhlIG9ubHkgYml0Cj4+IExpbnV4IGNhcmUgYWJvdXQgaXMgRUZJX01FTU9SWV9XQiAtIGlmIGl0
J3MgYWJzZW50LCB0aGVuIHNldCB0aGUgcmVnaW9uCj4+IGFzIHVuY2FjaGFibGUgKHBhZ2UgY2Fj
aGUgZGlzYWJsZWQgYml0IGluIHBhZ2UgdGFibGUgZW50cnkpLiBTbywKPj4gYmFzaWNhbGx5IExp
bnV4IGJ5IGRlZmF1bHQgZG9lcyB3aGF0IFhlbidzIGVmaT1hdHRyPXVjIGRvZXMuCj4gVmVyeSBp
bnRlcmVzdGluZyEgVGhhbmtzIGZvciBkb2luZyB0aGUgcmVzZWFyY2guCj4KPj4gU28sIHRvIGlt
cHJvdmUgWGVuJ3MgaGFyZHdhcmUvZmlybXdhcmUgY29tcGF0aWJpbGl0eSwgSSBoYXZlIHR3byBp
ZGVhczoKPj4KPj4gMS4gTWFrZSBlZmk9YXR0cj11YyB0aGUgZGVmYXVsdCAoaXQncyBzdGlsbCBw
b3NzaWJsZSB0byBkaXNhYmxlIGl0IHdpdGgKPj4gZWZpPWF0dHI9bm8pLgo+IEknZCBiZSB2ZXJ5
IG11Y2ggaW4gZmF2b3Igb2YgdGhhdCB0b28gKGVzcGVjaWFsbHkgc2luY2UgaXQgc2VlbXMgdG8g
bWF0Y2gKPiBMaW51eCBiZWhhdmlvdXIpIFdoYXQgZG8gb3RoZXJzIHRoaW5rPwoKSXRzIG1vcmUg
dGhhbiBqdXN0IHRoaXMuwqAgTGludXggYWxzbyBkb2Vzbid0IHVzZSBFRkkgcmVib290IGJlY2F1
c2UgaXQKaXMgYnJva2VuIGFsbW9zdCBldmVyeXdoZXJlIChiZWNhdXNlIFdpbmRvd3MgZG9lc24n
dCB1c2UgaXQgYmVjYXVzZSBpdHMKYnJva2VuIGFsbW9zdCBldmVyeXdoZXJlLCBzbyBpdCBuZXZl
ciBnZXRzIGZpeGVkKS4KClhlbiBzaG91bGQgYmUgZm9sbG93aW5nIExpbnV4LCBidXQgSSdtIGV4
aGF1c3RlZCBhcmd1aW5nIHRoaXMgcG9pbnQuCgpBIGNvbnNlcXVlbmNlIGlzIHRoYXQgZG93bnN0
cmVhbSB0ZW5kIHRvIHNoYXJlIGEgcGlsZSBvZiAidW5icmVhayBYZW4gb24KVUVGSSIgcGF0Y2hl
cyB3aGljaCBoYXZlIGJlZW4gcmVqZWN0ZWQgdXBzdHJlYW0gb24gcGhpbG9zb3BoaWNhbCByYXRo
ZXIKdGhhbiB0ZWNobmljYWwgZ3JvdW5kcywgZGVzcGl0ZSB0aGlzIGJlaW5nIGEgdG94aWMgZW52
aXJvbm1lbnQgdG8gd29yayBpbi4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
