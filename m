Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF07484D2
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2019 16:03:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hcsAP-0007Wf-Bk; Mon, 17 Jun 2019 13:59:25 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ct8y=UQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hcsAO-0007Wa-BR
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2019 13:59:24 +0000
X-Inumbo-ID: 1c37ae7e-9108-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1c37ae7e-9108-11e9-8980-bc764e045a96;
 Mon, 17 Jun 2019 13:59:23 +0000 (UTC)
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: bXcOplHAI53mklPSD4a+9Dsvy38WbWb02KMQ34EAYMnWRVy7cSoXGemcigzwxE9uVXNju8Pg0/
 Itovb/zg9GZQgi+YWPmA6GMP5gG+BGLWw9lK0mJBH1TqbCCRH97daP0BO13odbZShf7bpVjvMo
 bz0ZsfDnfKzS48Bkb1UeMq0f8HMngARq1VqtOCYqmvva6vOHm9XRU3hiXxjTAYIFOh5O87hOWn
 7kXvmFlkyM2iPQddHGMMJOBD3GeXFcY/5MHqwYwLtXHmlAi/KH45Kvf0dlgjiOcoh4rO36rp6A
 gas=
X-SBRS: 2.7
X-MesageID: 1809427
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,385,1557201600"; 
   d="scan'208";a="1809427"
To: Jan Beulich <JBeulich@suse.com>
References: <1560776079-9866-1-git-send-email-andrew.cooper3@citrix.com>
 <5D079BB50200007800238D2B@prv1-mh.provo.novell.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <905e57ed-4f26-f446-e04e-9f680bdedbb7@citrix.com>
Date: Mon, 17 Jun 2019 14:59:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <5D079BB50200007800238D2B@prv1-mh.provo.novell.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] x86/svm: Fix svm_vmcb_dump() when used in
 current context
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
Cc: WeiLiu <wl@xen.org>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcvMDYvMjAxOSAxNDo1NSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTcuMDYuMTkg
YXQgMTQ6NTQsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gVk1FeGl0IGRv
ZXNuJ3Qgc3dpdGNoIGFsbCBzdGF0ZS4gIFRoZSBGUy9HUy9UUy9MRFRSL0dTQkFTRSBzZWdtZW50
Cj4+IGluZm9ybWF0aW9uLCBhbmQgU1lTQ0FMTC9TWVNFTlRFUiBNU1JzIG1heSBzdGlsbCBiZSBj
YWNoZWQgaW4gaGFyZHdhcmUsIHJhdGhlcgo+PiB0aGFuIHVwLXRvLWRhdGUgaW4gdGhlIFZNQ0Iu
Cj4+Cj4+IEV4cG9ydCBzdm1fc3luY192bWNiKCkgdmlhIHN2bWRlYnVnLmggc28gc3ZtX3ZtY2Jf
ZHVtcCgpIGNhbiB1c2UgaXQsIGFuZCBicmluZwo+PiB0aGUgVk1DQiBpbnRvIHN5bmMgaW4gY3Vy
cmVudCBjb250ZXh0Lgo+Pgo+PiBBcyBhIG1pbm9yIG9wdGltaXNhdGlvbiwgc3dpdGNoIHN2bV9z
eW5jX3ZtY2IoKSB0byB1c2Ugc3ZtX3Zte2xvYWQsc2F2ZX1fcGEoKSwKPj4gYXMgc3ZtLT52bWNi
X3BhIGlzIGFsd2F5cyBpbiBjb3JyZWN0LCBhbmQgdGhpcyBhdm9pZHMgYSByZWR1bmRhbnQgX19w
YSgpCj4gSXMgdGhlICJpbiIgaGVyZSBhIGxlZnRvdmVyIGZyb20gc29tZSBlYXJsaWVyLCBkaWZm
ZXJlbnQgd29yZGluZz8KClllcy7CoCBJdCBjYW4gYmUgZHJvcHBlZC4KCj4KPj4gdHJhbnNsYXRp
b24gYmVoaW5kIHRoZSBzY2VuZXMuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIg
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KPgo+IE9ubHkgYXMgYSByZW1hcms6IFRoaXMgcmVtb3ZlcyB0aGUg
bGFzdCB1c2Ugb2Ygc3ZtX3ZtbG9hZCgpLCBidXQKPiBwZXJoYXBzIGl0IGFuZCBzdm1fdm1zYXZl
KCkgd291bGQgYmV0dGVyIGJlIGRyb3BwZWQgdG9nZXRoZXIsCj4gb25jZSB0aGUgb25lIHJlbWFp
bmluZyB1c2Ugb2YgdGhlIGxhdHRlciBoYXMgYWxzbyBkaXNhcHBlYXJlZAo+IChhc3N1bWluZyB0
aGF0J3MgZG9hYmxlKS4KCkkgbm90aWNlZCBhbmQgdHJpZWQgdG8gZG8ganVzdCB0aGF0LCBidXQg
cmVtb3ZpbmcgdGhlIGZpbmFsIHN2bV92bXNhdmUoKQppc24ndCB0cml2aWFsLsKgIEl0IGlzIGNv
bmZpbmVkIHRvIHRoZSBuZXN0ZWQgdmlydCBjb2RlLCBidXQgSSB0aGluayBpdAppcyBjYWxsaW5n
IHZpcnRfdG9fbWFkZHIoKSBvbiBhIGRvbWhlYXAgbWFwcGluZywgd2hpY2ggbmVlZHMgYWRqdXN0
aW5nCm5vdCB0byBleHBsb2RlIG9uIGEgc3lzdGVtIHdpdGggbW9yZSB0aGFuIDVUIG9mIFJBTS4K
Ckl0cyBpbiBteSB0b2RvIGxpc3QsIGJ1dCBJIGRvbid0IGhhdmUgdGltZSB0byBhZGRyZXNzIHRo
YXQgcmlnaHQgbm93LgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
