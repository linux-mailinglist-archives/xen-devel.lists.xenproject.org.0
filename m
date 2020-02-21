Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1891F1681CF
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 16:36:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j5AIg-0001kJ-Gc; Fri, 21 Feb 2020 15:33:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TYDf=4J=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j5AIf-0001k2-90
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 15:33:09 +0000
X-Inumbo-ID: 75eb12d2-54bf-11ea-aa99-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 75eb12d2-54bf-11ea-aa99-bc764e2007e4;
 Fri, 21 Feb 2020 15:33:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A4A49AE06;
 Fri, 21 Feb 2020 15:33:07 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20200220173116.88915-1-roger.pau@citrix.com>
 <83d48223-21eb-be54-985c-085449661892@xen.org>
 <20200221091005.GT4679@Air-de-Roger>
 <ac7ffe8b-06b0-655e-e842-cbc5d47ea85f@suse.com>
 <240c6e13-0b10-214f-cf8d-d1ab64eb441f@suse.com>
 <e5be3888-6252-f03c-675d-8d7dfd9330b8@xen.org>
 <21c59ebb-e396-447f-5ac1-d7e2efd76bb5@suse.com>
 <430123f5-afa9-4364-b703-f26279a7c585@xen.org>
 <21dcd066-87b0-4498-ba18-bfec718c7f1d@suse.com>
 <5005d791-7d8f-ca03-4c16-7dc9d19bc8e6@xen.org>
 <92fa042e-a880-8b56-4255-c8d19654908b@suse.com>
 <6163a60b-5a7f-90c0-1ba3-e9a96f8e88f2@xen.org>
 <db345ddc-f60a-8567-dcce-4119ef6c1611@suse.com>
 <0b7ea2b3-bb41-c85b-c75d-0fc2ff833c76@suse.com>
 <2049bdec-56a7-16bc-295c-d8cc967f4295@suse.com>
 <1d04b995-023e-da98-e0b8-d8d729c435a5@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <f210f861-a163-9704-2501-42487cc9206d@suse.com>
Date: Fri, 21 Feb 2020 16:33:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1d04b995-023e-da98-e0b8-d8d729c435a5@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] rwlock: allow recursive read locking
 when already locked in write mode
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMDIuMjAgMTY6MjcsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDIxLjAyLjIwMjAgMTY6
MjMsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+IE9uIDIxLjAyLjIwIDE2OjE3LCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+IE9uIDIxLjAyLjIwMjAgMTY6MTMsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+
Pj4gT24gMjEuMDIuMjAgMTU6NTEsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+Pj4gWW91IGFyZSBh
c3N1bWluZyB0aGF0IGF0b21pY190IHdpbGwgYWx3YXlzIGJlOgo+Pj4+Pgo+Pj4+PiBzdHJ1Y3QK
Pj4+Pj4gewo+Pj4+PiAgICDCoCBpbnQgY291bnRlcjsKPj4+Pj4gfQo+Pj4+Pgo+Pj4+PiBXaGF0
IGlmIHdlIGRlY2lkZSB0byB0dXJuIGludG8KPj4+Pj4KPj4+Pj4gc3RydWN0Cj4+Pj4+IHsKPj4+
Pj4gICAgwqAgYm9vbCBhOwo+Pj4+PiAgICDCoCBpbnQgY291bnRlcjsKPj4+Pj4gfQo+Pj4+Cj4+
Pj4gQXMgc2FpZCBiZWZvcmU6IHRoZW4gcXVldWVfd3JpdGVfbG9ja19zbG93cGF0aCgpIGlzIGFs
cmVhZHkgYnJva2VuLgo+Pj4KPj4+IFdoeT8gVGhlIGF0b21pY18qKCkgdXNlZCB3b3VsZCBzdGls
bCBvbmx5IGFjdCBvbiB0aGUgY291bnRlciBmaWVsZAo+Pj4gKGZvciB0aGVpciBhY3R1YWwgb3Bl
cmF0aW9uLCBpLmUuIHdoYXQgbWF0dGVycyB0byBjYWxsZXJzOyB0aGUKPj4+IG90aGVyIGZpZWxk
KHMpIGNvdWxkIGJlIHN0YXRpc3RpY3Mgb3Igd2hhdGV2ZXIpLgo+Pgo+PiBObzoKPj4KPj4gdTMy
IGNudHM7Cj4+IC4uLgo+PiBpZiAoICEoY250cyAmIF9RV19XTUFTSykgJiYKPj4gICAgICAgIChh
dG9taWNfY21weGNoZygmbG9jay0+Y250cywgY250cywKPj4gICAgICAgICAgICAgICAgICAgICAg
ICBjbnRzIHwgX1FXX1dBSVRJTkcpID09IGNudHMpICkKPiAKPiBJIG11c3QgYmUgYmxpbmQgdGhl
bi4gQXMgc2FpZCwgYXRvbWljX2NtcHhjaGcoKSB3b3VsZCBzdGlsbCAoZm9yIHRoZQo+IHB1cnBv
c2Ugb2YgY29uc3VtaW5nICJjbnRzIikgYWN0IG9uIG9ubHkgdGhlICJjb3VudGVyIiBmaWVsZC4g
SXQgbWF5Cj4gYWRkaXRpb25hbGx5IGUuZy4gaW5jcmVtZW50IGEgc3RhdHMgY291bnRlci4KCk9o
LCBzb3JyeSwgSSBtaXN1bmRlcnN0b29kIHlvdS4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
