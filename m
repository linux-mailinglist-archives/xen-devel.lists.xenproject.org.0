Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C431496D2
	for <lists+xen-devel@lfdr.de>; Sat, 25 Jan 2020 18:13:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ivOxy-0007Zx-E2; Sat, 25 Jan 2020 17:11:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pytt=3O=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ivOxw-0007Zq-S4
 for xen-devel@lists.xenproject.org; Sat, 25 Jan 2020 17:11:24 +0000
X-Inumbo-ID: b6943d48-3f95-11ea-8254-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b6943d48-3f95-11ea-8254-12813bfff9fa;
 Sat, 25 Jan 2020 17:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579972284;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=qApoq4SJUeWyH979s0affgnGpa8ZShY592JG4W6MHE8=;
 b=B7WKH5fVyw3oXP+FLRCkUMKjHA881+I3UCqGqBfuFXKjtgsSOaPd6tX9
 mquXMNsIllgTOAW+6eqF645UjmvHpwQ5Uv7xkKfncOMVojE31s5AGC27I
 gDsUNoPAkkEQDpH3lpag/SF1lInDGRnwwUq+9HFYN0dj4JFCcO0F6DJ/f o=;
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
IronPort-SDR: OKvip7ZJ/Dmg7hhcRgxH+hBfILqWZ2Kg8UJ8hZCEQW/kbKE0Sw+aQREx8A3sV78IjZIAEcqwNw
 YL2WH1/cOUgDThK4iNnjfztYZkFVsuvuQfYIXcB3y8kZsE5koFvDLWOD+3qElILqySaUEh3B4x
 rO37OWdH3uWAzDmACZ+HDlSRG6Y7U4e8fGD9DcNt4Ft1GGbJ/fB4llwd1EW61RSU5GKKO35Cnk
 QALER78uojKvDAoJFYderwKVryPuyOdQlxGDjwUctpEITaBknglxL0naL3tLDxgX4ehvFBRyo/
 w0c=
X-SBRS: 2.7
X-MesageID: 11610360
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,362,1574139600"; d="scan'208";a="11610360"
To: Bobby Eshleman <bobbyeshleman@gmail.com>
References: <cover.1579615303.git.bobbyeshleman@gmail.com>
 <abbe5c9f-46e2-af76-a7ff-d98c55fa364f@citrix.com>
 <20200125032655.GC11702@bobbye-pc>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <2ddf3f61-91d9-2492-ff31-f78cc9b445dd@citrix.com>
Date: Sat, 25 Jan 2020 17:11:18 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200125032655.GC11702@bobbye-pc>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [RFC XEN PATCH 00/23] xen: beginning support for
 RISC-V
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Bobby Eshleman <bobby.eshleman@starlab.io>,
 Dan Robertson <dan@dlrobertson.com>,
 Alistair Francis <alistair.francis@wdc.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUvMDEvMjAyMCAwMzoyNiwgQm9iYnkgRXNobGVtYW4gd3JvdGU6Cj4gT24gRnJpLCBKYW4g
MjQsIDIwMjAgYXQgMDE6NDE6MzhQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24g
MjIvMDEvMjAyMCAwMTo1OCwgQm9iYnkgRXNobGVtYW4gd3JvdGU6Cj4+PiBDdXJyZW50bHksIHRo
aXMgcGF0Y2hzZXQgcmVhbGx5IG9ubHkgc2V0cyB1cCB2aXJ0dWFsIG1lbW9yeSBmb3IgWGVuIGFu
ZAo+Pj4gaW5pdGlhbGl6ZXMgVUFSVCB0byBlbmFibGUgcHJpbnQgb3V0cHV0LiAgTm9uZSBvZiBS
SVNDLVYncwo+Pj4gdmlydHVhbGl6YXRpb24gc3VwcG9ydCBoYXMgYmVlbiBpbXBsZW1lbnRlZCB5
ZXQsIGFsdGhvdWdoIHRoYXQgaXMgdGhlCj4+PiBuZXh0IHJvYWQgdG8gc3RhcnQgZ29pbmcgZG93
bi4gIE1hbnkgZnVuY3Rpb25zIG9ubHkgY29udGFpbiBkdW1teQo+Pj4gaW1wbGVtZW50YXRpb25z
LiAgTWFueSBzaG9ydGN1dHMgaGF2ZSBiZWVuIHRha2VuIGFuZCBUT0RPJ3MgaGF2ZSBiZWVuCj4+
PiBsZWZ0IGFjY29yZGluZ2x5LiAgSXQgaXMgdmVyeSwgdmVyeSByb3VnaC4gIEJlIGZvcmV3YXJu
ZWQ6IHlvdSBhcmUgcXVpdGUKPj4+IGxpa2VseSB0byBzZWUgc29tZSB1bmdhaW5seSBjb2RlIGhl
cmUgKGRlc3BpdGUgbXkgZWZmb3J0cyB0byBjbGVhbiBpdCB1cAo+Pj4gYmVmb3JlIHNlbmRpbmcg
dGhpcyBwYXRjaHNldCBvdXQpLiAgTXkgaW50ZW50IHdpdGggdGhpcyBSRkMgaXMgdG8gYWxpZ24K
Pj4+IGVhcmx5IGFuZCBnYXVnZSBpbnRlcmVzdCwgYXMgb3Bwb3NlZCB0byBwcmVzZW50aW5nIGEg
dG90YWxseSBjb21wbGV0ZQo+Pj4gcGF0Y2hzZXQuCj4+IEkndmUgdGFrZW4gYSB2ZXJ5IHF1aWNr
IGxvb2sgb3ZlciB0aGUgc2VyaWVzLgo+Pgo+PiBOb3JtYWxseSwgd2UgcmVxdWlyZSB0aGF0IGFs
bCBwYXRjaGVzIGJlIGJpc2VjdGFibGUsIGFuZCB0aGlzIHNlcmllcyBpcwo+PiBub3QgYmVjYXVz
ZSBvZiB0aGUgTWFrZWZpbGUgY2hhbmdlcyBpbiBwYXRjaCAzIHNwZWNpZnlpbmcgb2JqZWN0IGZp
bGVzCj4+IHdoaWNoIGFyZSBpbnRyb2R1Y2VkIGluIHRoZSBmb2xsb3dpbmcgMjAgcGF0Y2hlcy7C
oCBPZiBjb3Vyc2UsCj4+IGludHJvZHVjaW5nIGEgYnJhbmQgbmV3IGFyY2hpdGVjdHVyZSBpcyBh
IHNwZWNpYWwgY2FzZSwgYnV0IHRoZQo+PiBzdWdnZXN0ZWQgcGxhbiBvZiBnZXR0aW5nIGEgIm1p
bmltYWwgYnVpbGQiIHRvZ2V0aGVyIHdpbGwgaGVscCBrZWVwIHRoZQo+PiBzZWNvbmQgcGhhc2Ug
b2YgIm1ha2luZyBpdCBib290Ii4KPiBUaGF0IHRvdGFsbHkgbWFrZXMgc2Vuc2UuCgpJIHNlZSBJ
IHRyYWlsZWQgb2ZmIGluIHRoZSBtaWRkbGUgb2YgdGhhdCBmaW5hbCBzZW50ZW5jZSwgYnV0IGl0
IHNlZW1zIEkKZGlkIGdldCBteSBwb2ludCBhY3Jvc3MuCgo+PiBXaXRoaW4gdGhhdCBmaXJzdCBw
aGFzZSBob3dldmVyLCB0aGVyZSBhcmUgc29tZSBvYnZpb3VzIHR3ZWFrcyB3ZSBzaG91bGQKPj4g
bWFrZSB0byBjb21tb24gY29kZS7CoCBGb3Igb25lLCB0aGUgZGVidWdnZXJfdHJhcCgpIGluZnJh
c3RydWN0dXJlIHJlYWxseQo+PiBpcyB4ODYtc3BlY2lmaWMgKGFuZCBJIGhhdmVuJ3Qgc2VlbiBp
dCB1c2VkIGluIGEgZGVjYWRlKSBzbyBzaG91bGQgaGF2ZQo+PiBpdHMgQVJNIHN0dWJzIGRyb3Bw
ZWQgc28gYXMgbm90IHRvIGJlIGEgYnVyZGVuIG9uIG90aGVyIGFyY2hpdGVjdHVyZXMuCj4+Cj4+
IFRoZXJlIGFyZSBvdGhlciBhc3BlY3RzICh0aGUgYXRvbWljX3QgaW5mcmFzdHJ1Y3R1cmUpIHdo
ZXJlIHg4NiBhbmQgQVJNCj4+IGFscmVhZHkgaGF2ZSBiYXNpY2FsbHkgaWRlbnRpY2FsIGNvcGll
cyBvZiB0aGUgaGVhZGVyIGZpbGUsIGFuZCB5b3UndmUKPj4gdGFrZW4gYSAzcmQgY29weS4KPj4K
Pj4gT3RoZXIgYXJlYXMgd2hlcmUgeW91IGNhbiByZWR1Y2UgdGhlIG1pbmltdW0gYnVpbGQgd291
bGQgYmUgdG8gcHV0IHNvbWUKPj4gZGVmYXVsdHMgaW50byB0aGUgZGVmY29uZmlnLCBzdWNoIGFz
IGRpc2FibGluZyBncmFudCB0YWJsZXMgYW5kIG1lbQo+PiBhY2Nlc3MuwqAgVGhlcmUgYXJlIGFs
bW9zdCBjZXJ0YWlubHkgb3RoZXJzIHdoaWNoIHdpbGwgaGVscCwgc28gaGF2ZSBhCj4+IHNlYXJj
aCBhcm91bmQgbWVudWNvbmZpZy4KPiBUYWtpbmcgbm90ZSBvZiB0aGVzZSwgSSBjYW4gZGVmaW5p
dGVseSBkbyB0aGF0LgoKVG8gZm9yZS13YXJuIHlvdSwgdGhlcmUgcHJvYmFibHkgd2lsbCBiZSBt
b3JlIHRoaW5ncyBsaWtlIHRoaXMgd2hpY2gKYmVjb21lIGFwcGFyZW50IG9uIGZ1cnRoZXIgcmV2
aWV3LgoKV2hpbGUgSSBkb24ndCBleHBlY3QgeW91IHRvIGRvIGFsbCB0aGUgY2xlYW51cCAoc29t
ZSB3aWxsIGFsbW9zdApjZXJ0YWlubHkgYmUgcXVpY2tlciBmb3Igb3RoZXJzIHRvIGRvKSwgSSB3
b3VsZCBsaWtlIHRvIHRha2UgdGhlCm9wcG9ydHVuaXR5IHRvIGRvIHRoZSBvYnZpb3VzIGJpdHMg
b2YgY2xlYW51cCwgZ2l2ZW4gdGhlIHJhcmUKb3Bwb3J0dW5pdHkgb2Ygc2VlaW5nIHRoZSBtaW5p
bXVtIHZpYWJsZSBzZXQgb2YgdGhpbmdzIHRvIG1ha2UgYSBuZXcKYXJjaCBjb21waWxlLgoKPj4g
U29tZSBBUk0taXNtcyB5b3UndmUgaW5oZXJpdGVkIHdvdWxkIGJlIG11Y2ggYmV0dGVyIGlmIHlv
dSBkaWRuJ3QuwqAgSW4KPj4gcGFydGljdWxhciwgSSAqcmVhbGx5KiBob3BlIFJJU0MtViBoYXNu
J3QgbWFkZSB0aGUgc2FtZSBiYWNrd2FyZHMgbmFtaW5nCj4+IGJ1ZyBpbiB0aGVpciBwYWdldGFi
bGUgbGV2ZWxzIHdoaWNoIHJlc3VsdHMgaW4ge3NlY29uZCxmaXJzdCx6ZXJvdGh9XyoKPj4gZXQg
YWwuwqAgSW4geDg2LCB3ZSBwdXJwb3NlZnVsbHkgY2hvc2Ugbm90IHRvIGZvbGxvdyBJbnRlbCdz
IG5hbWluZywgYW5kCj4+IGluc3RlYWQgd2VudCB3aXRoIEwxLCBMMiwgTDMsIGFuZCBmb3IgNjRi
aXQgTDQuCj4gVGhlIFJJU0MtViBzcGVjIGRvZXMgaW5kZWVkIGRlc2NyaWJlIHRoZSB0YWJsZSBs
ZXZlbCBudW1iZXJzIGluIHJldmVyc2UKPiBvcmRlcjogTDIgcG9pbnRzIHRvIEwxIHBvaW50cyB0
byBMMCAoZm9yIDM5Yml0IGFkZHJlc3NlcykuCj4KPiBGb3IgU1Y0OCA0OGJpdCBhZGRyZXNzZXMs
IGl0J3MgTDMsIEwyLCBMMSwgdG8gTDAuCj4KPiBUaGF0IHNhaWQsIGluIHRoZSBzcGVjIHRoZXJl
IGlzIG5vIGRpcmVjdCBtZW50aW9uIG9mIExYIGZvciBsZXZlbHMsIGFuZAo+IGluc3RlYWQgdGhl
c2UgYXJlIHJlZmVycmVkIHRvIGJ5IHRoZSBzZWN0aW9uIGZyb20gdGhlICJ2aXJ0dWFsIHBhZ2UK
PiBudW1iZXIiIHRoYXQgdGhleSBhcmUgcmVmZXJyZWQgYnksIChpZSBWUE5bM10sIFZQTlsyXSwg
ZXRjLi4uKS4KPgo+IEkgZGVmaW5pdGVseSB3b3VsZCBub3QgYmUgc3Ryb25nbHkgb3Bwb3NlZCB0
byB0aGlzIGNoYW5nZSBmb3IgYSBmb3JtCj4gdGhhdCByZWFkcyBiZXR0ZXIuCgpUaGlzIGxvb2tz
IHRvIGJlIHRoZSBzYW1lIGFzIHdoYXQgd2UndmUgY2hvc2VuIHRvIGRvIGluIHg4NiwgZ2l2ZSBv
cgp0YWtlIGEgZmVuY2Vwb3N0LgoKSSdkIHJlY29tbWVuZCB1c2luZyBMezMuLjB9IGZvciBzaW1p
bGFyaXR5IHdpdGggdGhlIHNwZWMgKHlvdSBzdXJlbHkKZG9uJ3Qgd2FudCBhbiBvZmYtYnktb25l
IGRpZmZlcmVuY2UgYmV0d2VlbiBjb2RlIGluIFhlbiBhbmQgdGhlIHNwZWMpLsKgCldoYXRldmVy
IHlvdSBlbmQgdXAgY2hvb3NpbmcsIHB1dCBhIGRlc2NyaXB0aW9uIGF0IHRoZSB0b3Agb2YgbW0u
aCAob3IKd2hlcmV2ZXIgYXBwcm9wcmlhdGUpIHdoaWNoIGJyaWVmbHkgaW50cm9kdWNlcyB0aGUg
dGVybWlub2xvZ3kgaW4gWGVuLAphbmQgY3Jvc3MgcmVmZXJlbmNlcyBhbnkgZGlmZmVyZW5jZXMg
d2l0aCB0aGUgc3BlYy4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
