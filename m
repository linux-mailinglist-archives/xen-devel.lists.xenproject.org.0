Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C7510B40E
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 18:04:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ia0i0-0002fd-Kg; Wed, 27 Nov 2019 17:02:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eB6N=ZT=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ia0hz-0002f7-2X
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 17:02:31 +0000
X-Inumbo-ID: b14c41b5-1137-11ea-a3ba-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b14c41b5-1137-11ea-a3ba-12813bfff9fa;
 Wed, 27 Nov 2019 17:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574874151;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ky17RVyOB5tOzGhpAKS3GoYw32jGBYPUKWXwE1C2jgE=;
 b=iW2t6mMecs8+v9Yk4VF8IZZ3NpmxmYiESp4kZ288KLk2hOhPbM9ZmTck
 MiihKIlfDIwU4sQwmdzkpEkHBErSFOE4YnpbGpNM/r+Z61iYsqd3zoKqC
 cvE4hhIFXxxsbp2XI1GkqT87a46/L+szcf9zw6OynCbag+0LdsIiW6aH6 w=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: GpJfoE41TdRN1Qysv8H4VIVV/+xJkvQNqbkOscSkpuWUF1oKKasU0VGMFFo2/kogvLHTrjaPkC
 vO+oph8sPb9ehaCvTUKac/BkYQHvkcZa7gQl4xQyLeHyPYALQFlUSu71yhCOUX3ztVPN3pn2yi
 DDyM1xCnoC+kobxIQwCp+G0uZYkC0Hoiinm2LJ+bxpVkmNfPLVEZakzaRYYtz1hcF6+JU6YUxP
 I0J1AohdYT6kHSEUYHxBymioRqCF9KjwYzFZf/NS4ENifLgZP0LNIe1WLy143/rbBAkufhQ0bu
 xag=
X-SBRS: 2.7
X-MesageID: 8911991
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,250,1571716800"; 
   d="scan'208";a="8911991"
Date: Wed, 27 Nov 2019 18:02:22 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191127170222.GT980@Air-de-Roger>
References: <7e28eb9e-f15a-af61-aad5-1ea80876fbe3@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7e28eb9e-f15a-af61-aad5-1ea80876fbe3@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2] build: provide option to disambiguate
 symbol names
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
Cc: Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien
 Grall <julien.grall@arm.com>, Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBOb3YgMDgsIDIwMTkgYXQgMTI6MTg6NDBQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gVGhlIC5maWxlIGFzc2VtYmxlciBkaXJlY3RpdmVzIGdlbmVyYXRlZCBieSB0aGUgY29t
cGlsZXIgZG8gbm90IGluY2x1ZGUKPiBhbnkgcGF0aCBjb21wb25lbnRzIChnY2MpIG9yIGp1c3Qg
dGhlIG9uZXMgc3BlY2lmaWVkIG9uIHRoZSBjb21tYW5kIGxpbmUKPiAoY2xhbmcsIGF0IGxlYXN0
IHZlcnNpb24gNSksIGFuZCBoZW5jZSBtdWx0aXBsZSBpZGVudGljYWxseSBuYW1lZCBzb3VyY2UK
PiBmaWxlcyAoaW4gZGlmZmVyZW50IGRpcmVjdG9yaWVzKSBtYXkgcHJvZHVjZSBpZGVudGljYWxs
eSBuYW1lZCBzdGF0aWMKPiBzeW1ib2xzIChpbiB0aGVpciBrYWxsc3ltcyByZXByZXNlbnRhdGlv
bikuIFRoZSBiaW5hcnkgZGlmZmluZyBhbGdvcml0aG0KPiB1c2VkIGJ5IHhlbi1saXZlcGF0Y2gs
IGhvd2V2ZXIsIGRlcGVuZHMgb24gaGF2aW5nIHVuaXF1ZSBzeW1ib2xzLgo+IAo+IE1ha2UgdGhl
IEVORk9SQ0VfVU5JUVVFX1NZTUJPTFMgS2NvbmZpZyBvcHRpb24gY29udHJvbCB0aGUgKGJ1aWxk
KQo+IGJlaGF2aW9yLCBhbmQgaWYgZW5hYmxlZCB1c2Ugb2JqY29weSB0byBwcmVwZW5kIHRoZSAo
cmVsYXRpdmUgdG8gdGhlCj4geGVuLyBzdWJkaXJlY3RvcnkpIHBhdGggdG8gdGhlIGNvbXBpbGVy
IGludm9rZWQgU1RUX0ZJTEUgc3ltYm9scy4gTm90ZQo+IHRoYXQgdGhpcyBidWlsZCBvcHRpb24g
aXMgbWFkZSBubyBsb25nZXIgZGVwZW5kIG9uIExJVkVQQVRDSCwgYnV0IG1lcmVseQo+IGRlZmF1
bHRzIHRvIGl0cyBzZXR0aW5nIG5vdy4KPiAKPiBDb25kaXRpb25hbGl6ZSBleHBsaWNpdCAuZmls
ZSBkaXJlY3RpdmUgaW5zZXJ0aW9uIGluIEMgZmlsZXMgd2hlcmUgaXQKPiBleGlzdHMganVzdCB0
byBkaXNhbWJpZ3VhdGUgbmFtZXMgaW4gYSBsZXNzIGdlbmVyaWMgbWFubmVyOyBub3RlIHRoYXQK
PiBhdCB0aGUgc2FtZSB0aW1lIHRoZSByZWR1bmRhbnQgZW1pc3Npb24gb2YgU1RUX0ZJTEUgc3lt
Ym9scyBnZXRzCj4gc3VwcHJlc3NlZCBmb3IgY2xhbmcuIEFzc2VtYmxlciBmaWxlcyBhcyB3ZWxs
IGFzIG11bHRpcGx5IGNvbXBpbGVkIEMKPiBvbmVzIHVzaW5nIF9fT0JKRUNUX0ZJTEVfXyBhcmUg
bGVmdCBhbG9uZSBmb3IgdGhlIHRpbWUgYmVpbmcuCj4gCj4gU2luY2Ugd2Ugbm93IGV4cGVjdCB0
aGVyZSBub3QgdG8gYmUgYW55IGR1cGxpY2F0ZXMgYW55bW9yZSwgYWxzbyBkb24ndAo+IGZvcmNl
IHRoZSBzZWxlY3Rpb24gb2YgdGhlIG9wdGlvbiB0byAnbicgYW55bW9yZSBpbiBhbGxyYW5kb20u
Y29uZmlnLgo+IFNpbWlsYXJseSBDT1ZFUkFHRSBubyBsb25nZXIgc3VwcHJlc3NlcyBkdXBsaWNh
dGUgc3ltYm9sIHdhcm5pbmdzIGlmCj4gZW5mb3JjZW1lbnQgaXMgaW4gZWZmZWN0LCB3aGljaCBp
biB0dXJuIGFsbG93cwo+IFNVUFBSRVNTX0RVUExJQ0FURV9TWU1CT0xfV0FSTklOR1MgdG8gc2lt
cGx5IGRlcGVuZCBvbgo+ICFFTkZPUkNFX1VOSVFVRV9TWU1CT0xTLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KClJldmlld2VkLWJ5OiBSb2dlciBQ
YXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KCkFuZCB0ZXN0ZWQgb24gRnJlZUJTRCB3
aXRoIGNsYW5nIDggYW5kIGVsZnRvb2xjaGFpbiBvYmpjb3B5LgoKVGhhbmtzLCBSb2dlci4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
