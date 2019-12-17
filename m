Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8DF122FE9
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 16:16:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihEXk-0008Tt-PC; Tue, 17 Dec 2019 15:13:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UMsG=2H=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ihEXj-0008Te-FX
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 15:13:47 +0000
X-Inumbo-ID: d1ddf758-20df-11ea-8ef0-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d1ddf758-20df-11ea-8ef0-12813bfff9fa;
 Tue, 17 Dec 2019 15:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576595626;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=zn9pf6neH2nACV7JdDAy4hKkxsERuYFN0KznUCxodiM=;
 b=TZUA75+UhkN0C100tERfMnjNZf3Q2+utVHEk9lrV59ofwjhklH/Kj5mg
 SKVtddTreobu5SqGIt9qIR7jsRi1BxggxTOqcVoCaJbWFZGmJQyqFCjEK
 O3qUnuVu/q4nUIxCwCawXJduNIzGWdVsCVRjyBatLDbythnZ48tVfjchl w=;
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
IronPort-SDR: XTEY6WoY7XivIvRgWAmA5rSt8AJRIOr8TABeoSreLV8oS2jmKPj2f/ABz2pls9ov+USvL5GqmE
 v2Cp6DKW13brct6yHYxjVkr+tKxvSodC9X7iTMWGO0cRsjuX4WJtI7nixlTqjdgR8q8stNUXvg
 opToLzyaBmMB/nAzV817h1l3JcOBieQzSb+CHgCEKK1JDR1Iri/+e9xi5vM5yb7md1KcuTYWHY
 Ddck8Vox5Ut3rfX0u0Cjob9o2bcWR0V2Bbl3Q90Y9PbhxpF6ZaaBCT6s8uMDxj2I6cfnvJMOJs
 kjg=
X-SBRS: 2.7
X-MesageID: 10174930
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,325,1571716800"; d="scan'208";a="10174930"
To: Tamas K Lengyel <tamas@tklengyel.com>
References: <96a1376e-9464-f797-30fd-f6923efbf6c7@list.ru>
 <faaf6d0a-1ad4-63fd-f1c6-e6649f887e4d@citrix.com>
 <CABfawh=c6tEAZX4PzAO_fMWeGvKE=UFw2dkWjRkTiRQ28AJRbA@mail.gmail.com>
 <CABfawhmFdgHua-ociayg8BE2NF90UrQ1naywdaVHRrqtMR9v=w@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <67147d02-c214-6a59-086d-94067ac00ff4@citrix.com>
Date: Tue, 17 Dec 2019 15:13:42 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CABfawhmFdgHua-ociayg8BE2NF90UrQ1naywdaVHRrqtMR9v=w@mail.gmail.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [XEN PATCH v1 1/1] x86/vm_event: add fast single
 step
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
 Sergey Kovalev <valor@list.ru>, Jan Beulich <jbeulich@suse.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcvMTIvMjAxOSAxNToxMCwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IE9uIFR1ZSwgRGVj
IDE3LCAyMDE5IGF0IDg6MDggQU0gVGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29t
PiB3cm90ZToKPj4gT24gVHVlLCBEZWMgMTcsIDIwMTkgYXQgNzo0OCBBTSBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4+IE9uIDE3LzEyLzIwMTkgMTQ6
NDAsIFNlcmdleSBLb3ZhbGV2IHdyb3RlOgo+Pj4+IE9uIGJyZWFrIHBvaW50IGV2ZW50IGVpZ2h0
IGNvbnRleHQgc3dpdGNoZXMgb2NjdXJlcy4KPj4+Pgo+Pj4+IFdpdGggZmFzdCBzaW5nbGUgc3Rl
cCBpdCBpcyBwb3NzaWJsZSB0byBzaG9ydGVuIHBhdGggZm9yIHR3byBjb250ZXh0Cj4+Pj4gc3dp
dGNoZXMKPj4+PiBhbmQgZ2FpbiAzNSUgc3BlYWQtdXAuCj4+Pj4KPj4+PiBXYXMgdGVzdGVkIG9u
IERlYmlhbiBicmFuY2ggb2YgWGVuIDQuMTIuIFNlZSBhdDoKPj4+PiBodHRwczovL2dpdGh1Yi5j
b20vc2t2bC94ZW4vdHJlZS9kZWJpYW4va25vcnJpZS80LjEyL2Zhc3Qtc2luZ2xlc3RlcAo+Pj4+
Cj4+Pj4gUmViYXNlZCBvbiBtYXN0ZXI6Cj4+Pj4gaHR0cHM6Ly9naXRodWIuY29tL3NrdmwveGVu
L3RyZWUvZmFzdC1zaW5nbGVzdGVwCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBTZXJnZXkgS292
YWxldiA8dmFsb3JAbGlzdC5ydT4KPj4+IDM1JSBsb29rcyBsaWtlIGEgZ29vZCBudW1iZXIsIGJ1
dCB3aGF0IGlzICJmYXN0IHNpbmdsZSBzdGVwIj8gIEFsbCB0aGlzCj4+PiBhcHBlYXJzIHRvIGJl
IGlzIHBsdW1iaW5nIGZvciB0byBjYXVzZSBhbiBhbHRwMm0gc3dpdGNoIG9uIHNpbmdsZSBzdGVw
Lgo+PiBZZXMsIGEgYmV0dGVyIGV4cGxhbmF0aW9uIHdvdWxkIGJlIG11Y2ggbmVlZGVkIGhlcmUg
YW5kIEknbSBub3QgMTAwJQo+PiBzdXJlIGl0IGNvcnJlY3RseSBpbXBsZW1lbnRzIHdoYXQgSSB0
aGluayBpdCB0cmllcyB0by4KPj4KPj4gVGhpcyBpcyBteSBpbnRlcnByZXRhdGlvbiBvZiB3aGF0
IHRoZSBpZGVhIGlzOiB3aGVuIHVzaW5nIERSQUtWVUYgKG9yCj4+IGFub3RoZXIgc3lzdGVtIHVz
aW5nIGFsdHAybSB3aXRoIHNoYWRvdyBwYWdlcyBzaW1pbGFyIHRvIHdoYXQgSQo+PiBkZXNjcmli
ZSBpbiBodHRwczovL3hlbnByb2plY3Qub3JnLzIwMTYvMDQvMTMvc3RlYWx0aHktbW9uaXRvcmlu
Zy13aXRoLXhlbi1hbHRwMm0pLAo+PiBhZnRlciBhIGJyZWFrcG9pbnQgaXMgaGl0IHRoZSBzeXN0
ZW0gc3dpdGNoZXMgdG8gdGhlIGRlZmF1bHQKPj4gdW5yZXN0cmljdGVkIGFsdHAybSB2aWV3IHdp
dGggc2luZ2xlc3RlcCBlbmFibGVkLiBXaGVuIHRoZSBzaW5nbGVzdGVwCj4+IHRyYXBzIHRvIFhl
biBhbm90aGVyIHZtX2V2ZW50IGlzIHNlbnQgdG8gdGhlIG1vbml0b3IgYWdlbnQsIHdoaWNoIHRo
ZW4KPj4gbm9ybWFsbHkgZGlzYWJsZXMgc2luZ2xlc3RlcHBpbmcgYW5kIHN3aXRjaGVzIHRoZSBh
bHRwMm0gdmlldyBiYWNrIHRvCj4+IHRoZSByZXN0cmljdGVkIHZpZXcuIFRoaXMgcGF0Y2ggbG9v
a3MgbGlrZSBpdHMgc2hvcnQtY2lyY3VpdGluZyB0aGF0Cj4+IGxhc3QgcGFydCBzbyB0aGF0IGl0
IGRvZXNuJ3QgbmVlZCB0byBzZW5kIHRoZSB2bV9ldmVudCBvdXQgZm9yIHRoZQo+PiBzaW5nbGVz
dGVwIGV2ZW50IGFuZCBzaG91bGQgc3dpdGNoIGJhY2sgdG8gdGhlIHJlc3RyaWN0ZWQgdmlldyBp
biBYZW4KPj4gYXV0b21hdGljYWxseS4gSXQncyBhIG5pY2Ugb3B0aW1pemF0aW9uLiBCdXQgd2hh
dCBzZWVtcyB0byBiZSBtaXNzaW5nCj4+IGlzIHRoZSBhbHRwMm0gc3dpdGNoIGl0c2VsZi4KPiBO
ZXZlciBtaW5kLCBwMm1fYWx0cDJtX2NoZWNrIGRvZXMgdGhlIGFsdHAybSBzd2l0Y2ggYXMgd2Vs
bCwgc28gdGhpcwo+IHBhdGNoIGltcGxlbWVudHMgd2hhdCBJIGRlc2NyaWJlZCBhYm92ZS4gUGxl
YXNlIHVwZGF0ZSB0aGUgcGF0Y2gKPiBtZXNzYWdlIHRvIGJlIG1vcmUgZGVzY3JpcHRpdmUgKHlv
dSBjYW4gY29weSBteSBkZXNjcmlwdGlvbiBmcm9tCj4gYWJvdmUpLgoKQWxzbyBwbGVhc2UgcmVh
ZCBDT0RJTkdfU1RZTEUgaW4gdGhlIHJvb3Qgb2YgdGhlIHhlbiByZXBvc2l0b3J5LsKgIFRoZQpp
bXBvcnRhbnQgb25lcyB5b3UgbmVlZCB0byBmaXggYXJlIHNwYWNlcyBpbiAiaWYgKCAuLi4gKSIg
c3RhdGVtZW50cywKYW5kIGJpbmFyeSBvcGVyYXRvcnMgb24gdGhlIGVuZCBvZiB0aGUgZmlyc3Qg
bGluZSByYXRoZXIgdGhhbiB0aGUKYmVnaW5uaW5nIG9mIHRoZSBjb250aW51YXRpb24uCgp+QW5k
cmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
