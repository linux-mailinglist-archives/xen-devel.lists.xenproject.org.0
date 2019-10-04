Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E24B0CC04E
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2019 18:12:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGQ8j-0007r7-9W; Fri, 04 Oct 2019 16:09:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T2rb=X5=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iGQ8i-0007r0-63
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 16:09:08 +0000
X-Inumbo-ID: 4a945bd2-e6c1-11e9-9bee-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4a945bd2-e6c1-11e9-9bee-bc764e2007e4;
 Fri, 04 Oct 2019 16:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570205347;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=WbXwsVi44IJ8563Bq/9l51q4yL1eqNRGzbuTWRJzVJU=;
 b=fQZpAmpTAA6toOajk3LFtdlB6JoMJe8gk3aS+q2HyFr9cBE6uJYIiEJz
 XSoV3TutEgklofv7ADiu52KvWuGO5xsqq/Qq/DNb9dmr1mf9hf/awk/Fo
 NVzzUzeoy+RS/rKGmAlyZvWcr9hj9kzwyuG2YG7ZPiw9waZud/fLBOAfn Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: rjqCcWyRwBAVzcs47QDQ7Cqaamgkvnt8u0nePmaWSH/EZhjc5yBN1kZJPWodJvaMgW8DXWhF1U
 0SYO1nd2pXKDxwlF3JUxON5h53+GVqPzN1hSpvqxW1phlG8sb5nJLMXz5LreTlb20+EFYx5sLf
 N5mgiN3lxAoohymZ+hECdBKd6S5pXWzGmCobfnsiCv4lUV7wsKADPsYRHhnk5jCIp4aWHK+lzJ
 yJRABlN+doSDY3gNdxY2i+6yVtxYMNaeMguQsTbQZbAylyuiIzcTir1ueQj4M8k/r6nT49rjhg
 WTo=
X-SBRS: 2.7
X-MesageID: 6483445
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,256,1566878400"; 
   d="scan'208";a="6483445"
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 <xen-devel@lists.xenproject.org>
References: <20191004064010.25646-1-jgross@suse.com>
 <a2e23594-04ae-a87d-5512-f8775a21552b@citrix.com>
 <e8364443-4f7f-62b7-f00d-4687ae07628b@suse.com>
 <2965839e-6be2-720f-ad1a-8e725f0bffaa@citrix.com>
 <36630890-ec4b-1404-7fbe-f8d924613c8e@suse.com>
 <25238153-6769-19d7-fa17-4fc9cf8652a1@citrix.com>
 <e41bfe1e-6b63-2508-f941-fc5ef22a7671@suse.com>
 <7a90d9d6-9af2-47ed-eaed-480dfb2e72f6@citrix.com>
 <17e45c30-9d62-94f0-c77e-26e2532b3f69@suse.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <cb8ae861-7898-cf0d-a3c1-cadcf35251f0@citrix.com>
Date: Fri, 4 Oct 2019 17:09:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <17e45c30-9d62-94f0-c77e-26e2532b3f69@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/sched: fix locking in
 sched_tick_[suspend|resume]()
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAvNC8xOSA0OjQwIFBNLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+IE9uIDA0LjEwLjE5IDE3
OjM3LCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+PiBPbiAxMC80LzE5IDQ6MDMgUE0sIErDvHJnZW4g
R3Jvw58gd3JvdGU6Cj4+PiBPbiAwNC4xMC4xOSAxNjo1NiwgR2VvcmdlIER1bmxhcCB3cm90ZToK
Pj4+PiBPbiAxMC80LzE5IDM6NDMgUE0sIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+Pj4+IE9uIDA0
LjEwLjE5IDE2OjM0LCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+Pj4+Pj4gT24gMTAvNC8xOSAzOjI0
IFBNLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+Pj4+Pj4+IE9uIDA0LjEwLjE5IDE2OjA4LCBHZW9y
Z2UgRHVubGFwIHdyb3RlOgo+Pj4+Pj4+PiBPbiAxMC80LzE5IDc6NDAgQU0sIEp1ZXJnZW4gR3Jv
c3Mgd3JvdGU6Cj4+Pj4+Pj4+PiBzY2hlZF90aWNrX3N1c3BlbmQoKSBhbmQgc2NoZWRfdGlja19y
ZXN1bWUoKSBzaG91bGQgbm90IGNhbGwgdGhlCj4+Pj4+Pj4+PiBzY2hlZHVsZXIgc3BlY2lmaWMg
dGltZXIgaGFuZGxlcnMgaW4gY2FzZSB0aGUgY3B1IHRoZXkgYXJlCj4+Pj4+Pj4+PiBydW5uaW5n
IG9uCj4+Pj4+Pj4+PiBpcyBqdXN0IGJlaW5nIG1vdmVkIHRvIG9yIGZyb20gYSBjcHVwb29sLgo+
Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IFVzZSBhIG5ldyBwZXJjcHUgbG9jayBmb3IgdGhhdCBwdXJwb3Nl
Lgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBJcyB0aGVyZSBhIHJlYXNvbiB3ZSBjYW4ndCB1c2UgdGhlIHBj
cHVfc2NoZWR1bGVfbG9jaygpIGluc3RlYWQgb2YKPj4+Pj4+Pj4gaW50cm9kdWNpbmcgYSBuZXcg
b25lP8KgIFNvcnJ5IGlmIHRoaXMgaXMgb2J2aW91cywgYnV0IGl0J3MgYmVlbiBhCj4+Pj4+Pj4+
IHdoaWxlCj4+Pj4+Pj4+IHNpbmNlIEkgcG9rZWQgYXJvdW5kIHRoaXMgY29kZS4KPj4+Pj4+Pgo+
Pj4+Pj4+IExvY2sgY29udGVudGlvbiB3b3VsZCBiZSBoaWdoZXIgZXNwZWNpYWxseSB3aXRoIGNy
ZWRpdDIgd2hpY2ggaXMKPj4+Pj4+PiB1c2luZyBhCj4+Pj4+Pj4gcGVyLWNvcmUgb3IgZXZlbiBw
ZXItc29ja2V0IGxvY2suIFdlIGRvbid0IGNhcmUgYWJvdXQgb3RoZXIKPj4+Pj4+PiBzY2hlZHVs
aW5nCj4+Pj4+Pj4gYWN0aXZpdHkgaGVyZSwgYWxsIHdlIG5lZWQgaXMgYSBndWFyZCBhZ2FpbnN0
IG91ciBwZXItY3B1IHNjaGVkdWxlcgo+Pj4+Pj4+IGRhdGEgYmVpbmcgY2hhbmdlZCBiZW5lYXRo
IG91ciBmZWV0Lgo+Pj4+Pj4KPj4+Pj4+IElzIHRoaXMgY29kZSByZWFsbHkgYmVpbmcgY2FsbGVk
IHNvIG9mdGVuIHRoYXQgd2UgbmVlZCB0byB3b3JyeSBhYm91dAo+Pj4+Pj4gdGhpcyBsZXZlbCBv
ZiBjb250ZW50aW9uPwo+Pj4+Pgo+Pj4+PiBJdHMgY2FsbGVkIGVhY2ggdGltZSBpZGxlIGlzIGVu
dGVyZWQgYW5kIGxlZnQgYWdhaW4uCj4+Pj4+Cj4+Pj4+IEVzcGVjaWFsbHkgd2l0aCBjb3JlIHNj
aGVkdWxpbmcgdGhlcmUgaXMgYSBoaWdoIHByb2JhYmlsaXR5IG9mCj4+Pj4+IG11bHRpcGxlCj4+
Pj4+IGNwdXMgbGVhdmluZyBpZGxlIGF0IHRoZSBzYW1lIHRpbWUgYW5kIHRoZSBwZXItc2NoZWR1
bGVyIGxvY2sgYmVpbmcKPj4+Pj4gdXNlZAo+Pj4+PiBpbiBwYXJhbGxlbCBhbHJlYWR5Lgo+Pj4+
Cj4+Pj4gSHJtLCB0aGF0IGRvZXMgc291bmQgcHJldHR5IGJhZC4KPj4+Pgo+Pj4+Pj4gV2UgYWxy
ZWFkeSBoYXZlIGEgKmxvdCogb2YgbG9ja3M7IGFuZCBpbiB0aGlzIGNhc2UgeW91J3JlIGFkZGlu
ZyBhCj4+Pj4+PiBzZWNvbmQgbG9jayB3aGljaCBpbnRlcmFjdHMgd2l0aCB0aGUgcGVyLXNjaGVk
dWxlciBjcHUgbG9jay7CoCBUaGlzCj4+Pj4+PiBqdXN0Cj4+Pj4+PiBzZWVtcyBsaWtlIGFza2lu
ZyBmb3IgdHJvdWJsZS4KPj4+Pj4KPj4+Pj4gSW4gd2hpY2ggd2F5IGRvZXMgaXQgaW50ZXJhY3Qg
d2l0aCB0aGUgcGVyLXNjaGVkdWxlciBjcHUgbG9jaz8KPj4+Pj4KPj4+Pj4+IEkgd29uJ3QgTmFj
ayB0aGUgcGF0Y2gsIGJ1dCBJIGRvbid0IHRoaW5rIEkgd291bGQgYWNrIGl0IHdpdGhvdXQKPj4+
Pj4+IGNsZWFyCj4+Pj4+PiBldmlkZW5jZSB0aGF0IHRoZSBleHRyYSBsb2NrIGhhcyBhIHBlcmZv
cm1hbmNlIGltcHJvdmVtZW50IHRoYXQncwo+Pj4+Pj4gd29ydGgKPj4+Pj4+IHRoZSBjb3N0IG9m
IHRoZSBleHRyYSBjb21wbGV4aXR5Lgo+Pj4+Pgo+Pj4+PiBJIHRoaW5rIGNvbXBsZXhpdHkgaXMg
bG93ZXIgdGhpcyB3YXkuIEVzcGVjaWFsbHkgY29uc2lkZXJpbmcgdGhlIHBlci0KPj4+Pj4gc2No
ZWR1bGVyIGxvY2sgY2hhbmdpbmcgd2l0aCBtb3ZpbmcgYSBjcHUgdG8gb3IgZnJvbSBhIGNwdXBv
b2wuCj4+Pj4KPj4+PiBUaGUga2V5IGFzcGVjdCBvZiB0aGUgcGVyLXNjaGVkdWxlciBsb2NrIGlz
IHRoYXQgb25jZSB5b3UgaG9sZCBpdCwgdGhlCj4+Pj4gcG9pbnRlciB0byB0aGUgbG9jayBjYW4n
dCBjaGFuZ2UuCj4+Pj4KPj4+PiBBZnRlciB0aGlzIHBhdGNoLCB0aGUgZmFjdCByZW1haW5zIHRo
YXQgc29tZXRpbWVzIHlvdSBuZWVkIHRvIGdyYWIgb25lCj4+Pj4gbG9jaywgc29tZXRpbWVzIHRo
ZSBvdGhlciwgYW5kIHNvbWV0aW1lcyBib3RoLgo+Pj4+Cj4+Pj4gQW5kLCB0aWNrX3N1c3BlbmQo
KSBsaXZlcyBpbiB0aGUgcGVyLXNjaGVkdWxlciBjb2RlLsKgIEVhY2ggc2NoZWR1bGVyCj4+Pj4g
aGFzCj4+Pj4gdG8gcmVtZW1iZXIgdGhhdCB0aWNrX3N1c3BlbmQgYW5kIHRpY2tfcmVzdW1lIGhv
bGQgYSBjb21wbGV0ZWx5Cj4+Pj4gZGlmZmVyZW50IGxvY2sgdG8gdGhlIHJlc3Qgb2YgdGhlIHNj
aGVkdWxpbmcgZnVuY3Rpb25zLgo+Pj4KPj4+IElzIHRoYXQgcmVhbGx5IHNvIGNyaXRpY2FsPyBU
b2RheSBvbmx5IGNyZWRpdDEgaGFzIHRpY2tfc3VzcGVuZCBhbmQKPj4+IHRpY2tfcmVzdW1lIGhv
b2tzLCBhbmQgYm90aCBhcmUgcmVhbGx5IHZlcnkgc2ltcGxlLiBJIGNhbiBhZGQgYQo+Pj4gY29t
bWVudCBpbiBzY2hlZC1pZi5oIGlmIHlvdSBsaWtlLgo+Pj4KPj4+IEFuZCB1cCB0byBub3cgdGhl
cmUgd2FzIG5vIGxvY2sgYXQgYWxsIGludm9sdmVkIHdoZW4gY2FsbGluZyB0aGVtLi4uCj4+Pgo+
Pj4gSWYgeW91IHRoaW5rIHVzaW5nIHRoZSBub3JtYWwgc2NoZWR1bGVyIGxvY2sgaXMgdG8gYmUg
cHJlZmVycmVkIEknZAo+Pj4gYmUgaGFwcHkgdG8gY2hhbmdlIHRoZSBwYXRjaC4gQnV0IEkgc2hv
dWxkIG1lbnRpb24gSSB3YXMgYWxyZWFkeQo+Pj4gcGxhbm5pbmcgdG8gcmV2aXNpdCB1c2FnZSBv
ZiB0aGUgc2NoZWR1bGVyIGxvY2sgYW5kIHJlcGxhY2UgaXQgYnkgdGhlCj4+PiBuZXcgcGVyLWNw
dSBsb2NrIHdoZXJlIGFwcHJvcHJpYXRlIChub3Qgc3VyZSBJJ2QgZmluZCBhbnkgYXBwcm9wcmlh
dGUKPj4+IHBhdGggZm9yIHJlcGxhY2VtZW50KS4KPj4KPj4gV2VsbCB0aGUgcmVhbGx5IGFubm95
aW5nIHRoaW5nIGhlcmUgaXMgdGhhdCBhbGwgdGhlIG90aGVyIHNjaGVkdWxlcnMgLS0KPj4gaW4g
cGFydGljdWxhciwgY3JlZGl0Miwgd2hpY2ggYXMgeW91IHNheSwgaXMgZGVzaWduZWQgdG8gaGF2
ZSBtdWx0aXBsZQo+PiBydW5xdWV1ZXMgc2hhcmUgdGhlIHNhbWUgbG9jayAtLSBoYXZlIHRvIGdy
YWIgJiByZWxlYXNlIHRoZSBsb2NrIGp1c3QgdG8KPj4gZmluZCBvdXQgdGhhdCB0aGVyZSdzIG5v
dGhpbmcgdG8gZG8uCj4+Cj4+IEFuZCBldmVuIGNyZWRpdDEgZG9lc24ndCBkbyBhbnl0aGluZyBw
YXJ0aWN1bGFybHkgY2xldmVyIC0tIGFsbCBpdCBkb2VzCj4+IGlzIHN0b3AgYW5kIHN0YXJ0IGEg
dGltZXIgYmFzZWQgb24gYSBzY2hlZHVsZXItZ2xvYmFsIGNvbmZpZ3VyYXRpb24uIEFuZAo+PiB0
aGUgc2NoZWR1bGluZyBsb2NrIGlzIGdyYWJiZWQgdG8gc3dpdGNoIHRvIGlkbGUgYW55d2F5LsKg
IEl0IHNlZW1zIGxpa2UKPj4gd2Ugc2hvdWxkIGJlIGFibGUgdG8gZG8gc29tZXRoaW5nIG1vcmUg
c2Vuc2libGUuCj4gCj4gWWVhaCwgSSB0aG91Z2h0IHRoZSBzYW1lLgoKSSBjYW4gdGhpbmsgb2Yg
YSBjb3VwbGUgb2Ygb3B0aW9uczoKCjEuIEhhdmUgc2NoZWR1bGUuYyBjYWxsIHMtPnRpY2tfKiB3
aGVuIHN3aXRjaGluZyB0byAvIGZyb20gaWRsZQoKMi4gR2V0IHJpZCBvZiBzLT50aWNrXyosIGFu
ZCBoYXZlIHNjaGVkX2NyZWRpdC5jIHN1c3BlbmQgLyByZXN1bWUgdGlja3MKd2hlbiBzd2l0Y2hp
bmcgdG8gLyBmcm9tIGlkbGUgaW4gY3NjaGVkX3NjaGVkdWxlKCkKCjMuIEhhdmUgc2NoZWR1bGUu
YyBzdXNwZW5kIC8gcmVzdW1lIHRpY2tzLCBhbmQgaGF2ZSBhbiBpbnRlcmZhY2UgdGhhdAphbGxv
d3Mgc2NoZWR1bGVycyB0byBlbmFibGUgLyBkaXNhYmxlIHRoZW0uCgo0LiBSZXdvcmsgc2NoZWRf
Y3JlZGl0IHRvIGJlIHRpY2tsZXNzLgoKIC1HZW9yZ2UKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
