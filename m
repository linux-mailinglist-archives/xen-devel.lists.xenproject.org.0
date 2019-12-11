Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFA011AA38
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2019 12:50:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1if0Sx-0002q7-A2; Wed, 11 Dec 2019 11:47:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kfv1=2B=amazon.com=prvs=2419b2bc4=jgrall@srs-us1.protection.inumbo.net>)
 id 1if0Sv-0002pu-6i
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2019 11:47:37 +0000
X-Inumbo-ID: 06607b50-1c0c-11ea-a1e1-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 06607b50-1c0c-11ea-a1e1-bc764e2007e4;
 Wed, 11 Dec 2019 11:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576064857; x=1607600857;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=elRVb/Vze/ugHNorYUR2O/rjXi+i9jsg/GV4/s2zB5c=;
 b=ozWC0gU18Nq7jiZJ0chgPwc6RDkc1CKEqAuqFuKdepUn6a3G2gm0vw6O
 v+h3P0rod/LfSQY4i3CtKaYK24VPn8iharjyH4mEniWldS7jlS5SW65Be
 rDxyQOOqFstzVKc6Yusxi+C2hdFWgQe1pBQZmZYZAEO0q8FyMehwBVK1i c=;
IronPort-SDR: TcxP+gd8t5zJbn+X/frJxBhm+N7bDT2bFfJHvxVRYx8zDGYi+572CtXXXVsXrsmUdH7mUaImQb
 4olDFeHK7KwQ==
X-IronPort-AV: E=Sophos;i="5.69,301,1571702400"; d="scan'208";a="14261758"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-98acfc19.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 11 Dec 2019 11:47:25 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-98acfc19.us-east-1.amazon.com (Postfix) with ESMTPS
 id 628DFA05A3; Wed, 11 Dec 2019 11:47:23 +0000 (UTC)
Received: from EX13D37EUB003.ant.amazon.com (10.43.166.251) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 11 Dec 2019 11:47:22 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D37EUB003.ant.amazon.com (10.43.166.251) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 11 Dec 2019 11:47:21 +0000
Received: from a483e7b01a66.ant.amazon.com (10.95.102.159) by
 mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 11 Dec 2019 11:47:19 +0000
To: "Xia, Hongyan" <hongyxia@amazon.com>, "jbeulich@suse.com"
 <jbeulich@suse.com>
References: <cover.1575891620.git.hongyxia@amazon.com>
 <3375af1e708b4ec3205f493a17da6e0369249096.1575891620.git.hongyxia@amazon.com>
 <3ab3715f-487c-8351-726f-5155c5454d83@suse.com>
 <477a3393debd18473fd15a4ec28a31d76376d320.camel@amazon.com>
 <d365aecc-0611-dc17-d63c-850e0a3363da@amazon.com>
 <eeb762add75c87db90a3c93a35a7f2149e81c6f7.camel@amazon.com>
From: Julien Grall <jgrall@amazon.com>
Message-ID: <275b6932-5f79-033a-0bb8-a3a41159b979@amazon.com>
Date: Wed, 11 Dec 2019 11:47:19 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <eeb762add75c87db90a3c93a35a7f2149e81c6f7.camel@amazon.com>
Content-Language: en-GB
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2 1/2] x86/mm: factor out the code for
 shattering an l3 PTE
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "wl@xen.org" <wl@xen.org>, "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSG9uZ3lhbiwKCk9uIDExLzEyLzIwMTkgMTE6MjgsIFhpYSwgSG9uZ3lhbiB3cm90ZToKPiBP
biBXZWQsIDIwMTktMTItMTEgYXQgMTE6MTAgKzAwMDAsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4g
SGkgSG9uZ3lhbiwKPj4gLi4uCj4+Cj4+IFdoaWxlIHRoaXMgaW52b2x2ZXMgbW9yZSBpbnN0cnVj
dGlvbnMsIGhvdyBvZnRlbiBkbyB3ZSBleHBlY3QgdGhlCj4+IGNvZGUKPj4gdG8gYmUgY2FsbGVk
Pwo+Pgo+PiBDaGVlcnMsCj4+Cj4gCj4gSSBkb24ndCBleHBlY3QgdGhpcyB0byBiZSBjYWxsZWQg
dmVyeSBvZnRlbiBpbiB0aGUgY3VycmVudCBYZW4uCj4gQWx0aG91Z2ggd2l0aCBkaXJlY3QgbWFw
IHJlbW92YWwsIGEgbG90IG9mIHRoZSBtZW1vcnkgYWxsb2NhdGlvbnMKPiAobW9zdGx5IHhlbmhl
YXAgYWxsb2NhdGlvbnMpIHdpbGwgYmUgbWFwcGVkIGFuZCB1bm1hcHBlZCBvbi1kZW1hbmQgYW5k
Cj4gdGhlcmUgaXMgYSBtdWNoIGhpZ2hlciBjaGFuZ2Ugb2YgbWVyZ2luZy9zaGF0dGVyaW5nLgoK
VGhhbmsgeW91IGZvciB0aGUgZXhwbGFuYXRpb24uIEluIG9yZGVyIHRvIG1lcmdlL3NoYXR0ZXIs
IHlvdSBuZWVkIHRoZSAKYnVkZHkgYWxsb2NhdG9yIHRvIGVuc3VyZSBhbGwgdGhlIHhlbmhlYXAg
YXJlIGFsbG9jYXRlZCBjb250aWd1b3VzbHkuIEkgCmFtIHByZXR0eSB1bmNvbnZpbmNlZCB0aGVy
ZSBhcmUgYSBsb3Qgb2YgcGFnZSBhbGxvY2F0ZWQgdmlhIHhlbmhlYXAuIFNvIAp0aGUgY2hhbmNl
IHRvIGhhdmUgY29udGlndW91cyB4ZW5oZWFwIGFsbG9jYXRpb24gaXMgdmVyeSBsaW1pdGVkLgoK
QnV0IHRoZSBtZXJnaW5nL3NoYXR0ZXJpbmcgY2FuIGJlIGNvdW50ZXJwcm9kdWN0aXZlLiBBbiBl
eGFtcGxlIHNob3J0IAptZW1vcnkgYWxsb2NhdGlvbiAod2UgaGF2ZSBhIGZldyBwbGFjZXMgbGlr
ZSB0aGF0KToKICAgIHhtYWxsb2MoLi4uKTsKICAgIGRvIHNvbWV0aGluZwogICAgeGZyZWUoLi4u
KTsKCldlIHdvdWxkIGVuZCB1cCB0byBtZXJnZSBhbmQgdGhlbiBhIGZldyBtcyBsYXRlciBzaGF0
dGVyIGFnYWluLiBTbyBpdCAKZmVlbHMgdG8gbWUsIHRoYXQgbWVyZ2luZyBpcyBwcm9iYWJseSBu
b3Qgd29ydGggaXQgKEkgYW0gcGxhbm5pbmcgdG8gCmRpc2N1c3Mgd2l0aCBBbmRyZXcgdG9kYXkg
YWJvdXQgaXQpLgoKPiAKPiBIb3dldmVyLCB0aGUgc2VyaWVzIG1vdmVkIGFsbCBQVEVzIGZyb20g
eGVuaGVhcCB0byBkb21oZWFwLCBhbmQgd2UKPiBtaWdodCBzZWUgb3RoZXIgdGhpbmdzIG1vdmVk
IHRvIGRvbWhlYXAgaW4gdGhlIGZ1dHVyZSwgc28gd2UgbWlnaHQgbm90Cj4gaGF2ZSBtYW55IHRo
aW5ncyBsZWZ0IG9uIHhlbmhlYXAgYW55d2F5LgoKVHlwZXNhZmUgaXMgYW4gaW1wb3J0YW50IHBh
cnQgb2YgbWFraW5nIG91ciBjb2RlIGJhc2UgbW9yZSBzZWN1cmUgdGhhbiAKYmFzaWMgQyAoc3Vj
aCBhcyBub3QgbWl4aW5nIHR5cGUpLgoKSW4gdGhpcyBjYXNlLCBJIHRoaW5rIGlmIHdlIHN0YXJ0
IHRvIG1lcmdlL3NoYXR0ZXIgYSBsb3QsIHRoZW4gd2UgaGF2ZSBhIApiaWdnZXIgcHJvYmxlbSBh
bmQgd2UgbWF5IHdhbnQgdG8gY29uc2lkZXIgdG8gcmVtb3ZlIGl0IChzZWUgYWJvdmUpIFNvIApp
dCBmZWVscyB0aGUgb3B0aW1pemF0aW9uIGlzIG5vdCB3b3J0aCBpdC4KCk5vdGUgdGhhdCBJIGFt
IG5vdCBtYWludGFpbmluZyB0aGlzIGNvZGUsIHNvIHRoZSBmaW5hbCBjYWxsIGlzIG9uIEFuZHJl
dyAKYW5kIEphbi4KCkNoZWVycywKCi0tIAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
