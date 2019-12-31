Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A5512D88E
	for <lists+xen-devel@lfdr.de>; Tue, 31 Dec 2019 13:14:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1imGMW-00087n-4h; Tue, 31 Dec 2019 12:11:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gg/0=2V=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1imGMU-00087g-1x
 for xen-devel@lists.xenproject.org; Tue, 31 Dec 2019 12:10:58 +0000
X-Inumbo-ID: 94c48926-2bc6-11ea-88e7-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 94c48926-2bc6-11ea-88e7-bc764e2007e4;
 Tue, 31 Dec 2019 12:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1577794249;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=rXKBrtf0L/ZE4hFHjJod6VCoeQG0hcT+T+uoi5LoEYg=;
 b=IJVfD3NeT/B1xWGbZ3dBaMo/R3MEeEwnMT6VFEagw82NNBfIKDhlafum
 b2UuceTn6HPNdKC9piSjZft6cVmkd1Gpb2fS5u/fqdYoWmIW3S+frDJpt
 GDviR7rt38h2Y1pEaLQm/lsSJgKuULcrkDwJXoJJbl9ZUV7d77KxIUfkn s=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: X4BsStGvvJHZKdXpr2GwVL/ZJ4VzGWH+TvUiTNDsmklpH7+DheHh1sbYh1CGwJgSFF6UiHWIGH
 +mJwz5zy6m0dXX9Gc5I3ZxT0Gd6L0hxmnxcNbnyjNXtv0Fuw+7wm6yO7mGFa3nzaPK60PoaNOg
 Vl0gXGsnIbbtnEWWiiTXnQc8JjTxn1KbcT/qzfl0EGyoPUZT0oAqkotnncfKOmdu96T5xAmBzO
 7xAzhpmCJkK5+hL5/7RMcptWg+Z+X7M4ExjUf0KF0BGrYDHe/soVbySf4HW/05StTjDS6N9fES
 irQ=
X-SBRS: 2.7
X-MesageID: 10743258
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,379,1571716800"; d="scan'208";a="10743258"
Date: Tue, 31 Dec 2019 13:10:42 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20191231121042.GH11756@Air-de-Roger>
References: <20191224132616.47441-1-roger.pau@citrix.com>
 <20191224132616.47441-2-roger.pau@citrix.com>
 <311877a7-02ef-f3ab-7f24-9262de5431a1@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <311877a7-02ef-f3ab-7f24-9262de5431a1@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL03.citrite.net (10.69.22.127)
Subject: Re: [Xen-devel] [PATCH 1/2] x86/hvm: improve performance of
 HVMOP_flush_tlbs
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBEZWMgMjcsIDIwMTkgYXQgMDI6NTI6MTdQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAyNC8xMi8yMDE5IDEzOjI2LCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4gPiBU
aGVyZSdzIG5vIG5lZWQgdG8gY2FsbCBwYWdpbmdfdXBkYXRlX2NyMyB1bmxlc3MgQ1IzIHRyYXBw
aW5nIGlzCj4gPiBlbmFibGVkLCBhbmQgdGhhdCdzIG9ubHkgdGhlIGNhc2Ugd2hlbiB1c2luZyBz
aGFkb3cgcGFnaW5nIG9yIHdoZW4KPiA+IHJlcXVlc3RlZCBmb3IgaW50cm9zcGVjdGlvbiBwdXJw
b3Nlcywgb3RoZXJ3aXNlIHRoZXJlJ3Mgbm8gbmVlZCB0bwo+ID4gcGF1c2UgYWxsIHRoZSB2Q1BV
cyBvZiB0aGUgZG9tYWluIGluIG9yZGVyIHRvIHBlcmZvcm0gdGhlIGZsdXNoLgo+ID4KPiA+IENo
ZWNrIHdoZXRoZXIgQ1IzIHRyYXBwaW5nIGlzIGN1cnJlbnRseSBpbiB1c2UgaW4gb3JkZXIgdG8g
ZGVjaWRlCj4gPiB3aGV0aGVyIHRoZSB2Q1BVcyBzaG91bGQgYmUgcGF1c2VkLCBvdGhlcndpc2Ug
anVzdCBwZXJmb3JtIHRoZSBmbHVzaC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUg
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiAKPiBJIGFncmVlIHRoYXQgdGhlIGV4aXN0
aW5nIGxvZ2ljIHBvb3IsIGJ1dCB0aGlzIGRpcmVjdGlvbiBsb29rcyB0byBiZQo+IGV2ZW4gbW9y
ZSBmcmFnaWxlLgo+IAo+IEluc3RlYWQsIEkgdGhpbmsgaXQgd291bGQgYmUgYmV0dGVyIHRvIGZv
bGxvdyB0aGUgRVBUIGludmFsaWRhdGlvbgo+IGV4YW1wbGU7IG1hcmsgYWxsIHZjcHVzIGFzIG5l
ZWRpbmcgYSB0bGIgZmx1c2gsIGFuZCBJUEkgdGhlIGRvbWFpbiBkaXJ0eQo+IG1hc2ssIGhhdmlu
ZyB0aGUgcmV0dXJuLXRvLWd1ZXN0IHBhdGggZG8gdGhlIGZsdXNoaW5nLgoKQUZBSUNUIHRoZXJl
J3Mgbm8gbmVlZCB0byBjYWxsIHRoZSB0bGIgZmx1c2gsIHRoZSB2bWV4aXQvdm1lbnRyeQppdHNl
bGYgd2lsbCBwZXJmb3JtIHRoZSBuZWNlc3NhcnkgZmx1c2hlcywgc28gdGhlIG9ubHkgcmVxdWly
ZW1lbnQgaXMKdG8gSVBJIHRoZSBwQ1BVcyBpbiBvcmRlciB0byBmb3JjZSBhIHZtZXhpdC4KCj4g
VGhpcyBhdm9pZHMgYWxsIHZjcHUgcGF1c2luZy91bnBhdXNpbmcgYWN0aXZpdGllcywgYW5kIHRo
ZSBjb3N0IG9mIHRoZQo+IGZsdXNoIGlzIGluY3VycmVkIGJ5IHRoZSB0YXJnZXQgdmNwdSwgcmF0
aGVyIHRoYW4gdGhlIHZjcHUgbWFraW5nIHRoZQo+IGh5cGVyY2FsbCBhY2N1bXVsYXRlIHRoZSBj
b3N0IGZvciBldmVyeXRoaW5nLCBhcyB3ZWxsIGFzIGEgbGFyZ2UgYW1vdW50Cj4gb2YgcmVtb3Rl
IFZNQ1MgYWNjZXNzZXMuCgpIbSwgdGhlbiB3ZSB3b3VsZCBuZWVkIGEgd2F5IHRvIHBpbiB0aGUg
dkNQVXMgdG8gdGhlIHBDUFVzIHRoZXkgYXJlCnJ1bm5pbmcgb24sIG9yIGVsc2UgaW4gdGhlIGlu
dHJvc3BlY3Rpb24tZW5hYmxlZCBjYXNlIHlvdSBjb3VsZCBlbmQgdXAKY2FsbGluZyBwYWdpbmdf
dXBkYXRlX2NyMyBvbiB2Q1BVcyBvZiBvdGhlciBkb21haW5zIChtYXliZSB0aGF0J3MKZmluZSwg
YnV0IGl0IGNvdWxkIG1lc3MgdXAgd2l0aCBpbnRyb3NwZWN0aW9uIEkgZ3Vlc3MpLgoKQUZBSUNU
IHRoZSBjYWxsIHRvIHBhZ2luZ191cGRhdGVfY3IzIG5lZWRzIHRvIGJlIGRvbmUgZnJvbQpodm1f
Zmx1c2hfdmNwdV90bGIgb3IgZWxzZSB3ZSB3b3VsZCBoYXZlIHRvIGZyZWV6ZSB0aGUgc2NoZWR1
bGVyIHNvCnRoYXQgdkNQVXMgZG9uJ3QgbW92ZSBhcm91bmQgcENQVXMgKG9yIGdldCBkZS1zY2hl
ZHVsZWQpLCBJIHRoaW5rCndlIHN0aWxsIG5lZWQgdGhlIHBhdXNlIGluIHRoZSBpbnRyb3NwZWN0
aW9uIGNhc2UsIGJ1dCB0aGUgb3BlbiBjb2RlZApwYXVzZSBsb29wIGNvdWxkIGJlIHJlcGxhY2Vk
IHdpdGggZG9tYWluX3BhdXNlX2V4Y2VwdF9zZWxmLgoKPiBJdCBjYW4gcHJvYmFibHkgYWxzbyBy
ZW1vdmUgdGhlIG5lZWQgZm9yIHRoZSBmbHVzaF92Y3B1KCkgY2FsbGJhY2sgd2hpY2gKPiBpcyBn
b2luZyB0byBiZSBleHBlbnNpdmUgZHVlIHRvIHJldHBvbGluZSwgYW5kIHdob3NlIGNvbnRlbnRz
IGFyZSB0cml2aWFsLgoKSSB3YXMgcGxhbm5pbmcgdG8gbG9vayBpbnRvIHRoaXMsIGJ1dCB3YW50
ZWQgdG8gc2VuZCB0aGlzIHZlcnNpb24KZmlyc3Qgc2luY2UgaXQncyBhbHJlYWR5IGEgYmlnIGlt
cHJvdmVtZW50IGluIHRlcm1zIG9mIHBlcmZvcm1hbmNlLgoKVGhhbmtzLCBSb2dlci4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
