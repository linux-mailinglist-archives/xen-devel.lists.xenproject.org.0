Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CB42E21E
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2019 18:17:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hW1Cp-0001Ri-KJ; Wed, 29 May 2019 16:13:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=WiQL=T5=kroah.com=greg@srs-us1.protection.inumbo.net>)
 id 1hW1Co-0001RZ-0g
 for xen-devel@lists.xenproject.org; Wed, 29 May 2019 16:13:34 +0000
X-Inumbo-ID: b357f1a0-822c-11e9-a629-33a3e1604f27
Received: from wnew2-smtp.messagingengine.com (unknown [64.147.123.27])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b357f1a0-822c-11e9-a629-33a3e1604f27;
 Wed, 29 May 2019 16:13:31 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id E222961E;
 Wed, 29 May 2019 12:13:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 29 May 2019 12:13:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=EiBk9WgT5jhapte0zGFwRA6Svwh
 jQL4faQV9mcE4mek=; b=s+gOKNptth2H04QNemaVWBfU+qTqjTFzEpiOpdGq7ty
 nd/PZXK1NzyBjfremVcHN2ngxyzJgPz858MKEZJ2IWWjPs9KpIbl/5yq0T/O/2rv
 ezs3vFSH6IAbZzWgjNYBllBEHVdJef3gww3l3RWS6Y8GaTBgCjzprWDPLbOdarGm
 fpZWUuONx2IG91Y1yn4pqToeMo84ZFcJ8b/naPO0KbWecUhswZitG7LuZyBJexr+
 KK49gjb93dPCmU885P5LEN0470OO5UkepqEerjdqzg1VOI6u7SBZlVdmKGz2xooi
 SVS5se94xyUrhevQGat/ZlT0yHGc2UNfRwfDPLKGa0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=EiBk9W
 gT5jhapte0zGFwRA6SvwhjQL4faQV9mcE4mek=; b=KM/Z2GBBCSzCqUuPbApAAv
 lJAb67kqcTDpwZz1RiGvY2zNUCNwZr9dCJxJo+R1tsOGyh18UAOHJY4J4qjGmY+z
 i6iga2n3xBLs5TjXqtRO3vEGepfOVY9rkUYYQtvj2GxSsxkRmbNwBP5Kn6gDLWfa
 fwWirfsSwaCIZ0gu8FW6/bRQIUnIu7CXH5BwlT3/fGrYt8GcR5q/OCXMIEhrbzB2
 qG0UOns2NyOVcRwTwJ7uSsKG51M5cOt6E1gfIYfd2Vu/rVj9OpcpTJ9VWjNuuTFQ
 EPgMj276bG/COzyiwXaXYEf2QqZl82GKo0YKpuyjDjeXq7+s2pz5hnHcKli3MAdQ
 ==
X-ME-Sender: <xms:qK_uXNuZgz46WLK6JzCxhI2Z6sOCgIk4F7hCvC1baOFnS8w2qPku0Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddruddvjedguddttdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujggfsehttdertddtredvnecuhfhrohhmpefirhgv
 ghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucffohhmrghinhepkhgvrhhnvg
 hlrdhorhhgnecukfhppedvtdejrddvvdehrdeiledrudduheenucfrrghrrghmpehmrghi
 lhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:qK_uXKs5TDtr6m1beB4ua8bo07yONvLeBRjRCBBNIIojXLniWxHvLA>
 <xmx:qK_uXLwck_CqfKQZw2ADz6MHIw1iMZdRh-NilBd7pfTkwfWuTjMeZw>
 <xmx:qK_uXIgtwy4j2yxCEB1edcNIilEo1DIUZlU-xWMnBf22l58Mbltrew>
 <xmx:qa_uXFofdbpmCBtU0Ufpc_KzWJxB6z2Qu870gOEgye3htJpQAcEIxEudC00>
Received: from localhost (unknown [207.225.69.115])
 by mail.messagingengine.com (Postfix) with ESMTPA id 60001380084;
 Wed, 29 May 2019 12:13:28 -0400 (EDT)
Date: Wed, 29 May 2019 09:13:27 -0700
From: Greg KH <greg@kroah.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190529161327.GA16496@kroah.com>
References: <E1hSRQF-0006xk-BS@osstest.test-lab.xenproject.org>
 <23778.34168.78221.110803@mariner.uk.xensource.com>
 <20190520114147.GU2798@zion.uk.xensource.com>
 <5CE2B0DA0200007800230A08@prv1-mh.provo.novell.com>
 <23790.44034.186393.25330@mariner.uk.xensource.com>
 <5CEEADE80200007800233811@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CEEADE80200007800233811@prv1-mh.provo.novell.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Subject: Re: [Xen-devel] Linux 3.18 no longer boots under Xen,
 Xen CI dropping it
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
Cc: Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, stable@vger.kernel.org,
 Paul Durrant <paul.durrant@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBNYXkgMjksIDIwMTkgYXQgMTA6MDY6MDBBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDI5LjA1LjE5IGF0IDE3OjU3LCA8aWFuLmphY2tzb25AY2l0cml4LmNvbT4g
d3JvdGU6Cj4gPiBMaW51eCAzLjE4IG5vIGxvbmdlciBib290cyB1bmRlciBYZW4uCj4gPiAKPiA+
IFRoaXMgaGFzIGJlZW4gdHJ1ZSBmb3Igb3ZlciBoYWxmIGEgeWVhci4gIFRoZSBYZW4gcHJvamVj
dCBDSSBoYXMgYmVlbgo+ID4gc2VuZGluZyBhdXRvbWF0aWMgbWFpbHMgaW5jbHVkaW5nIGJpc2Vj
dGlvbiByZXBvcnRzIChzZWUgYmVsb3cpLgo+ID4gSSBlbWFpbGVkIFhlbiBrZXJuZWwgZm9sa3Mg
YW5kIGdvdCBubyB0YWtlcnMgZm9yIGZpeGluZyB0aGlzLgo+ID4gCj4gPiBVbmxlc3MgdGhpcyBp
cyBmaXhlZCBzb29uLCBvciBhdCBsZWFzdCBzb21lb25lIHNob3dzIHNvbWUgaW5jbGluYXRpb24K
PiA+IHRvIGludmVzdGlnYXRlIHRoaXMgcmVncmVzc2lvbiwgSSBpbnRlbmQgdG8gZHJvcCBhbGwg
dGVzdGluZyBvZiB0aGlzCj4gPiAic3RhYmxlIiBicmFuY2guICBJdCBoYXMgcm90dGVkIGFuZCBu
by1vbmUgaXMgZml4aW5nIGl0Lgo+IAo+IEFmYWljcyAzLjE4IGhhcyBiZWVuIG1hcmtlZCBFT0wg
dXBzdHJlYW0uCgpZZXMsIHRoZXJlIHdpbGwgbm90IGJlIGFueSBtb3JlIDMuMTgueSByZWxlYXNl
cyBvbiBrZXJuZWwub3JnIGFueW1vcmUuCgpJIGRvbid0IHRoaW5rIEkgcmVjYWxsIGFueSBwZW9w
bGUgY29tcGxhaW5pbmcgYWJvdXQgMy4xOCBicmVha2luZyBvbgpYZW4gYXMgdGhlIG9ubHkgdXNl
cnMgdGhhdCBJIGtub3cgb2YgZm9yIHRoYXQga2VybmVsIGFyZSBzb21lIFNvQy1iYXNlZApkZXZp
Y2VzLCBhbmQgdGhleSBkbyBub3QgdXNlIFhlbi4KCnRoYW5rcywKCmdyZWcgay1oCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
