Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A56135C03
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2020 15:58:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipZDD-0001qN-Tv; Thu, 09 Jan 2020 14:55:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zaws=26=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ipZDB-0001qI-Sw
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2020 14:55:01 +0000
X-Inumbo-ID: fdc467e0-32ef-11ea-a2eb-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fdc467e0-32ef-11ea-a2eb-bc764e2007e4;
 Thu, 09 Jan 2020 14:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578581694;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=7l5hx27YZ3kp+6Si2rGYq79VkfwWpUbt59UD7fGezao=;
 b=VgLGe+ATRh3CQYsNV/PMuyjqQxn3a+jwxGqpMnkTjX5w+VTgt8cabwv9
 uQcKrprBCWCDkdIxjrqd9hkZCwgIfM8Et72XDzY/f5CzuiPg+H/JL8G1O
 2spgWaJUf/QBdfePL9uqmI4Uq6gX3OlGzs1EPhTfN9uzCNsSDQvN/z7dZ U=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: D5PClxCfvTBQep4icjXguYfFTi3U9yMOgnvnBKePDTkxcOY6dki0P9SIxdLeqLyIRU6LM/jNjA
 kP+MxIZprvmcazmngcJoGCa1LgCSauGLoDxevTDbRr1zhAs2AaNFojZCz1QeGwBqlzhBSZV8Dq
 PTUGqSBvOFiyzu3eem3owtpy+Suv2z1tHrmelWlkffPE3f1i/dQ+6UKxXeTCf2TmfiCgeOSqZ9
 tfbdJ8Qcz9sC+QeOp/o2MyYrFZqss8nMNy1ErRIhfZvIrwX/M31mcWge2Z8AOpuojS1aEhA+m/
 Odw=
X-SBRS: 2.7
X-MesageID: 10702202
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,414,1571716800"; d="scan'208";a="10702202"
To: Jan Beulich <jbeulich@suse.com>
References: <20191224151932.6304-1-andrew.cooper3@citrix.com>
 <20191224151932.6304-7-andrew.cooper3@citrix.com>
 <f3803fa1-fc4f-8754-f654-0c93193f69e7@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <d0e7acb4-0df1-30a3-fc9f-b1f655004b0a@citrix.com>
Date: Thu, 9 Jan 2020 14:54:46 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <f3803fa1-fc4f-8754-f654-0c93193f69e7@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 06/12] docs/migration Specify migration v3
 and STATIC_DATA_END
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
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMvMDEvMjAyMCAxNDo0NCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjQuMTIuMjAxOSAx
NjoxOSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gTWlncmF0aW9uIGRhdGEgY2FuIGJlIHNwbGl0
IGludG8gdHdvIHBhcnRzIC0gdGhhdCB3aGljaCBpcyBpbnZhcmlhbnQgb2YKPj4gZ3Vlc3QgZXhl
Y3V0aW9uLCBhbmQgdGhhdCB3aGljaCBpcyBub3QuICBTZXBhcmF0ZSB0aGVzZSB0d28gd2l0aCB0
aGUKPj4gU1RBVElDX0RBVEFfRU5EIHJlY29yZC4KPj4KPj4gVGhlIHNob3J0IHRlcm0sIHdlIHdh
bnQgdG8gbW92ZSB0aGUgeDg2IENQVSBQb2xpY3kgZGF0YSBpbnRvIHRoZSBzdHJlYW0uCj4+IElu
IHRoZSBsb25nZXIgdGVybSwgd2Ugd2FudCB0byBwcm92aXNpb25hbGx5IHNlbmQgdGhlIHN0YXRp
YyBkYXRhIG9ubHkKPj4gdG8gdGhlIGRlc3RpbmF0aW9uIGFzIGEgbW9yZSByb2J1c3QgY29tcGF0
aWJpbGl0eSBjaGVjay4gIEluIGJvdGggY2FzZXMsCj4+IHdlIHdpbGwgd2FudCBhIGNhbGxiYWNr
IGludG8gdGhlIGhpZ2hlciBsZXZlbCB0b29sc3RhY2suCj4+Cj4+IE1hbmRhdGUgdGhlIHByZXNl
bmNlIG9mIHRoZSBTVEFUSUNfREFUQV9FTkQgcmVjb3JkLCBhbmQgZGVjbGFyZSB0aGlzIHYzLAo+
PiBhbG9uZyB3aXRoIGluc3RydWN0aW9ucyBmb3IgaG93IHRvIGNvbXBhdGlibHkgaW50ZXJwcmV0
IGEgdjIgc3RyZWFtLgo+IFdoYXQgZG9lc24ndCBiZWNvbWUgY2xlYXIgKHRvIG1lKSBmcm9tIGFs
bCBvZiB0aGUgYWJvdmUgaXMgd2h5IHRoaXMKPiByZWNvcmQgaXMgbmVlZGVkICh3YW50ZWQpLCBh
bmQgaGVuY2Ugd2h5IGl0IGlzIHRvIGJlIG1hbmRhdG9yeS4KPiBBZnRlciBhbGwgLi4uCj4KPj4g
QEAgLTY3NSw5ICs2OTQsMjMgQEAgQSB0eXBpY2FsIHNhdmUgcmVjb3JkIGZvciBhbiB4ODYgSFZN
IGd1ZXN0IGltYWdlIHdvdWxkIGxvb2sgbGlrZToKPj4gIEhWTV9QQVJBTVMgbXVzdCBwcmVjZWRl
IEhWTV9DT05URVhULCBhcyBjZXJ0YWluIHBhcmFtZXRlcnMgY2FuIGFmZmVjdAo+PiAgdGhlIHZh
bGlkaXR5IG9mIGFyY2hpdGVjdHVyYWwgc3RhdGUgaW4gdGhlIGNvbnRleHQuCj4+ICAKPj4gK0Nv
bXBhdGliaWxpdHkgd2l0aCBvbGRlciB2ZXJzaW9ucwo+PiArPT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09Cj4+ICsKPj4gK3YzIGNvbXBhdCB3aXRoIHYyCj4+ICstLS0tLS0tLS0tLS0t
LS0tLQo+PiArCj4+ICtBIHYzIHN0cmVhbSBpcyBjb21wYXRpYmxlIHdpdGggYSB2MiBzdHJlYW0s
IGJ1dCBtYW5kYXRlcyB0aGUgcHJlc2Vuc2Ugb2YgYQo+PiArU1RBVElDX0RBVEFfRU5EIHJlY29y
ZCBhaGVhZCBvZiBhbnkgbWVtb3J5L3JlZ2lzdGVyIGNvbnRlbnQuICBUaGlzIGlzIHRvIGVhc2UK
Pj4gK3RoZSBpbnRyb2R1Y3Rpb24gb2YgbmV3IHN0YXRpYyBjb25maWd1cmF0aW9uIHJlY29yZHMg
b3ZlciB0aW1lLgo+PiArCj4+ICtBIHYzLWNvbXBhdGlibGUgcmVjaWV2ZXIgaW50ZXJwcmV0aW5n
IGEgdjIgc3RyZWFtIHNob3VsZCBpbmZlciB0aGUgcG9zaXRpb24gb2YKPj4gK1NUQVRJQ19EQVRB
X0VORCBiYXNlZCBvbiBmaW5kaW5nIHRoZSBmaXJzdCBYODZfUFZfUDJNX0ZSQU1FUyByZWNvcmQg
KGZvciBQVgo+PiArZ3Vlc3RzKSwgb3IgUEFHRV9EQVRBIHJlY29yZCAoZm9yIEhWTSBndWVzdHMp
IGFuZCBiZWhhdmUgYXMgaWYgU1RBVElDX0RBVEFfRU5ECj4+ICtoYWQgYmVlbiBzZW50Lgo+IC4u
LiB5b3UgYWxyZWFkeSBpbXBseSBhIHYzIHJlY2VpdmVyIGNhbiBkZWFsIHdpdGggaXRzIGFic2Vu
Y2UuCgpJdCBwcm92aWRlcyBhbiBlYXNpZXIgd2F5IHRvIHJlYXNvbiBhYm91dCB0aGUgc3RyZWFt
LCBhcyBuZXcgZmVhdHVyZXMKZ2V0IGFkZGVkLCBhbmQgdGhpcyBpcyBoZWxwZnVsIHdoZW4gZGVi
dWdnaW5nLgoKTW9zdCBpbXBvcnRhbnRseSBob3dldmVyLCBpdCBvZmZlcnMgYSBjbGVhbiB3YXkg
dG8gZGVwcmVjYXRlL3JlbW92ZQpzdXBwb3J0IGZvciBvYnNvbGV0ZSBzZW5kZXJzLgoKfkFuZHJl
dwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
