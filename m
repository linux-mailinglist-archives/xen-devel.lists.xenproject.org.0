Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECD314DA16
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 12:46:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ix8Er-0001xx-IZ; Thu, 30 Jan 2020 11:44:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Tz6E=3T=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ix8Ep-0001xs-GH
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 11:43:59 +0000
X-Inumbo-ID: ccc3794e-4355-11ea-b211-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ccc3794e-4355-11ea-b211-bc764e2007e4;
 Thu, 30 Jan 2020 11:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580384637;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=CygNMW98DuQ2l+9tVPkcxXZinNjrMCVXCdtgwbK/drw=;
 b=hSlYp2wj0Ity5AIKJUS8/pjqXgqTUyMwf1ckUEOEC5s0FKq85kcXp3pE
 kBd4mTa2I1npr77oqbbIuEJDjAI5qrFnz3DetCjFzT5332G5j9uODnTw8
 v8hMJ23Cn0V4ejmALowhxCh93lYHDWdjA3RYmvhW3NHrpPkoK5Ny9JmQe w=;
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
IronPort-SDR: iPyYpoB7xkFV8y9d2hGptUti9FNlRH6DgSdaQzCa2iLqxrn6BgFuDeIvjzVPosfMGwj7YQNzqs
 GlB2dj9w+3zKRim42CBf6MW85LOszAu6uuXVIGRBIfK8aPa29CUXgd8ePXWLpjzHaPNSWHb4cF
 Eekqqlf7jmi0Z4j06aHzA3N+mBz7CylbplGnYq1ksXV+D4rCXqmUtPjuH13/BzVMvhPPcyP1O/
 ajLAlj3q6Srm+j/5E5PekRoYeP+O8aD8ncIcv+/1/8444PbQE7AL7kUhUjR5FVW/IruifUV5JZ
 erQ=
X-SBRS: 2.7
X-MesageID: 12285539
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,381,1574139600"; d="scan'208";a="12285539"
To: Jan Beulich <jbeulich@suse.com>
References: <d9fba71e-9caa-45d7-385a-b5ca7c52303c@suse.com>
 <2518e99d-5b4b-85bc-c4bc-0af909fc89e3@citrix.com>
 <e67bf1d3-6f3b-a78c-578b-43a7ef6afb2d@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <4e01f6e4-5ebc-376f-71c2-80d857c0fdb8@citrix.com>
Date: Thu, 30 Jan 2020 11:43:52 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <e67bf1d3-6f3b-a78c-578b-43a7ef6afb2d@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86: undo part of "refine link time stub
 area related assertion"
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAvMDEvMjAyMCAwODowOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjkuMDEuMjAyMCAx
ODoxNCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMjkvMDEvMjAyMCAxNzowMywgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBUaGUgb3JpZ2luYWwgY2hlY2sgd2FzIG5vdCB0b28gc3RyaWN0OiBX
aGlsZSB3ZSBkb24ndCB1c2Ugb25lIHBhZ2Ugb2YKPj4+IG1lbW9yeSBwZXIgQ1BVLCB3ZSBkbyB1
c2Ugb25zIHBhZ2Ugb2YgVkEgc3BhY2UgcGVyIENQVS4gSXQgaXMgdGhlCj4+IG9uZS4KPj4KPj4+
IGxhdHRlciB3aGljaCBtYXR0ZXJzIGhlcmUuCj4+Pgo+Pj4gVW5kbyB0aGF0IHBhcnQgb2YgdGhl
IGNoYW5nZSwgYnV0IGxlYXZlIGV2ZXJ5dGhpbmcgZWxzZSBpbiBwbGFjZS4KPj4+Cj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+IE9rLCBidXQgdGhp
cyBiZWdzIHRoZSBxdWVzdGlvbiB3aHk/wqAgSWYgdGhlIHN0dWJzIGFyZSB0aWdodGx5IHBhY2tl
ZAo+PiB0b2dldGhlciwgYnV0IHRoZSBsaW5lYXIgc3BhY2UgaXNuJ3QsIHdlIGVuZCB1cCBoYXZp
bmcgbG9hZHMgb2YgYWxpYXNlcwo+PiBvZiB0aGUgc3R1YnMuCj4+Cj4+IFRoZXJlIGlzIG5vIHNl
Y3VyaXR5IGJlbmVmaXQgZm9yIGRvaW5nIHNvLCBidXQgdGhlcmUgaXMgYSByZWFsCj4+IHBlcmZv
cm1hbmNlIGNvc3QgZnJvbSBub3QgY29tcGFjdGluZyB0aGUgbGluZWFyIHNwYWNlLsKgIE1vc3Qg
bm90YWJseSwKPj4gdHdvIHRocmVhZHMgdW5hYmxlIHRvIHNoYXJlIGEgNGsgdGxiIGVudHJ5IGZv
ciB0aGVpciBvd24gc3R1YnMsIGJ1dCBhbHNvCj4+IHJlZHVjZWQgY2FjaGUgbG9jYWxpdHkgb2Yg
cmVmZXJlbmNlIGZvciB0aGUgcGFnZXRhYmxlcyByZXF1aXJlcyB0byBtYXAKPj4gdGhlIG92ZXJs
eS1sYXJnZSBsaW5lYXIgc3BhY2UuCj4gVGhlIGlkZWEsIGlpcmMsIHdhcyB0byBtYWtlIHRoZSBh
ZGRyZXNzZXMgZXZlbiBtb3JlIGVhc2lseQo+IHJlY29nbml6YWJsZSB0aGlzIHdheSwgaW4gcGFy
dGljdWxhciBpbiB0aGUgY2FzZSBhIHN0dWIgd2FzCj4gcmVmZXJlbmNlZCBmb3IgYSBDUFUgdGhh
dCB3YXMgdGFrZW4gb2ZmbGluZS4gQnV0IHllcywgdGhpcyBpc24ndAo+IGFuIG92ZXJseSBiaWcg
d2luIGluIHRoaXMgcmVnYXJkLCBzbyBwZXJoYXBzIHRoZSBhcnJhbmdlbWVudAo+IGNvdWxkIGJl
IHJldmlzZWQgKGxvb2tpbmcgb3ZlciB0aGUgY29kZSB0aGVyZSBkb24ndCBsb29rIHRvIGJlCj4g
YW55IG90aGVyIGRlcGVuZGVuY2llcyBvbiB0aGlzIGxheW91dCkuIFVudGlsIHRoZW4gdGhvdWdo
IHRoZQo+IGFzc2VydGlvbiBzaG91bGQgYmUgZml4ZWQsIGFzIHJpZ2h0IG5vdyBpdCBpcyBjbGVh
cmx5Cj4gaW5zdWZmaWNpZW50LgoKRm9yIHRoZSBwYXRjaCwgQWNrZWQtYnk6IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpJbXByb3ZlbWVudHMgY2FuIGJlIGRvbmUg
YXQgYSBsYXRlciBwb2ludC4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
