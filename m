Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DDCCDFE5
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2019 13:09:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHQqf-0001tY-Nf; Mon, 07 Oct 2019 11:06:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DAgt=YA=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iHQqe-0001tP-7e
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2019 11:06:40 +0000
X-Inumbo-ID: 79c2b81c-e8f2-11e9-97ab-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 79c2b81c-e8f2-11e9-97ab-12813bfff9fa;
 Mon, 07 Oct 2019 11:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570446374;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=pACRpttyaEMry1qCX9mwEZmR24TcttkNJDPM7FeURf0=;
 b=OMb+toAloaDfL/8ass8wYmJFrBl4PSk5wUVsLUblRFG+u+Fx8oxGA/6d
 lMNhNiaNlT4PKtwNO0HiGs6PvHPELPR7IvguV1pO8JGOBS/q8yuvTYujG
 4CmIOz8kpX5V4XjSRKnxW9vjhJsNr2QqngByujreyupvCDU/X9yIqW2ZF Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 1wsURWSluC9Kg85vLyHyhUQNW6lgBqHW3iQwC3UWOF0ovMJSvQuUKXzJ/XqGfLuAa7n9B9ItWs
 E7aLk9aSBzBOy7AEya7SC6I1zSu4UJPzJveT/KsouZngk8i1zQQpg36y78MMgLIr5am5JK8t2s
 SdUTXAtf1mTN/D/VWklen1Hbg8pwInWBKGKmYddzA4BF7jpdXL9gxPU0WvtrPzp/o/a0mkCNX7
 H9h29hgE2ngddUNJewkg9sDIcYavu0nChrhw0wcD6J98ejeLBpjXMKdC+Q3QReWpFTdvfRrNBF
 jSk=
X-SBRS: 2.7
X-MesageID: 6799687
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,268,1566878400"; 
   d="scan'208";a="6799687"
To: Lars Kurth <lars.kurth@xenproject.org>, <xen-devel@lists.xenproject.org>
References: <cover.1569525222.git.lars.kurth@citrix.com>
 <00c6c80b12b1d201d7140626c7efe9d75645dee9.1569525222.git.lars.kurth@citrix.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <e8fee669-7e83-d68f-e56e-3dda4a0e0611@citrix.com>
Date: Mon, 7 Oct 2019 12:06:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <00c6c80b12b1d201d7140626c7efe9d75645dee9.1569525222.git.lars.kurth@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 1/6] Import v1.4 of Contributor Covenant
 CoC
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
Cc: Lars Kurth <lars.kurth@citrix.com>, xen-api@lists.xenproject.org,
 minios-devel@lists.xenproject.org, committers@xenproject.org,
 mirageos-devel@lists.xenproject.org, win-pv-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOS8yNi8xOSA4OjM5IFBNLCBMYXJzIEt1cnRoIHdyb3RlOgo+IEZyb206IExhcnMgS3VydGgg
PGxhcnMua3VydGhAY2l0cml4LmNvbT4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBMYXJzIEt1cnRoIDxs
YXJzLmt1cnRoQGNpdHJpeC5jb20+Cj4gLS0tCj4gQ2M6IG1pbmlvcy1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwo+IENjOiB4ZW4tYXBpQGxpc3RzLnhlbnByb2plY3Qub3JnCj4gQ2M6IHdpbi1w
di1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+IENjOiBtaXJhZ2Vvcy1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwo+IENjOiBjb21taXR0ZXJzQHhlbnByb2plY3Qub3JnCj4gLS0tCj4gIGNv
ZGUtb2YtY29uZHVjdC5tZCB8IDc2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNzYgaW5zZXJ0aW9ucygrKQo+
ICBjcmVhdGUgbW9kZSAxMDA2NDQgY29kZS1vZi1jb25kdWN0Lm1kCj4gCj4gZGlmZiAtLWdpdCBh
L2NvZGUtb2YtY29uZHVjdC5tZCBiL2NvZGUtb2YtY29uZHVjdC5tZAo+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0Cj4gaW5kZXggMDAwMDAwMC4uODFiMjE3Ywo+IC0tLSAvZGV2L251bGwKPiArKysgYi9j
b2RlLW9mLWNvbmR1Y3QubWQKPiBAQCAtMCwwICsxLDc2IEBACj4gKyMgQ29udHJpYnV0b3IgQ292
ZW5hbnQgQ29kZSBvZiBDb25kdWN0Cj4gKwo+ICsjIyBPdXIgUGxlZGdlCj4gKwo+ICtJbiB0aGUg
aW50ZXJlc3Qgb2YgZm9zdGVyaW5nIGFuIG9wZW4gYW5kIHdlbGNvbWluZyBlbnZpcm9ubWVudCwg
d2UgYXMKPiArY29udHJpYnV0b3JzIGFuZCBtYWludGFpbmVycyBwbGVkZ2UgdG8gbWFrZSBwYXJ0
aWNpcGF0aW9uIGluIG91ciBwcm9qZWN0IGFuZAo+ICtvdXIgY29tbXVuaXR5IGEgaGFyYXNzbWVu
dC1mcmVlIGV4cGVyaWVuY2UgZm9yIGV2ZXJ5b25lLCByZWdhcmRsZXNzIG9mIGFnZSwgYm9keQo+
ICtzaXplLCBkaXNhYmlsaXR5LCBldGhuaWNpdHksIHNleCBjaGFyYWN0ZXJpc3RpY3MsIGdlbmRl
ciBpZGVudGl0eSBhbmQgZXhwcmVzc2lvbiwKPiArbGV2ZWwgb2YgZXhwZXJpZW5jZSwgZWR1Y2F0
aW9uLCBzb2Npby1lY29ub21pYyBzdGF0dXMsIG5hdGlvbmFsaXR5LCBwZXJzb25hbAo+ICthcHBl
YXJhbmNlLCByYWNlLCByZWxpZ2lvbiwgb3Igc2V4dWFsIGlkZW50aXR5IGFuZCBvcmllbnRhdGlv
bi4KClRoaXMgaXMgcmVsYXRpdmVseSBtaW5vciwgYnV0IEkgZG9uJ3QgZmVlbCBxdWl0ZSBjb21m
b3J0YWJsZSB3aXRoIHRoZQp3b3JkaW5nLiAgInBsZWRnZSB0byBtYWtlIGl0IGEgaGFyYXNzbWVu
dC1mcmVlIGV4cGVyaWVuY2UiIHRvIG1lIGltcGxpZXMKdGhhdCB3ZSBwbGVkZ2UgdGhhdCAqbm9i
b2R5IHdpbGwgZXZlciBleHBlcmllbmNlIGhhcmFzc21lbnQqLiAgSSBkb24ndAp0aGluayB0aGF0
J3Mgc29tZXRoaW5nIHdlIGNhbiBkZWxpdmVyLCBhbnkgbW9yZSB0aGFuIGEgZ292ZXJubWVudCBj
YW4KcHJvbWlzZSB0aGVyZSB3aWxsIGJlIHplcm8gY3JpbWUuICBJIHRoaW5rIHdlIGNvdWxkIHBy
b21pc2UgdG8KKm1haW50YWluKiBhIGhhcmFzc21lbnQtZnJlZSBleHBlcmllbmNlLCB3aGljaCBp
bXBsaWVzIHRoaW5ncyB0byBhCnJlc3RvcmluZyBoYXJhc3NtZW50LWZyZWUgc3RhdGUgYWZ0ZXIg
aXQncyBiZWVuIGJyb2tlbi4KCkV2ZXJ5dGhpbmcgZWxzZSBsb29rcyBnb29kLgoKIC1HZW9yZ2UK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
