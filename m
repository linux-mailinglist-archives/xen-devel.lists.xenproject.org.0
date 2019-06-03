Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAFD932A5E
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 10:04:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXhtm-0002L3-Cv; Mon, 03 Jun 2019 08:00:54 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=FX4o=UC=kroah.com=greg@srs-us1.protection.inumbo.net>)
 id 1hXhtj-0002Ky-RZ
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 08:00:52 +0000
X-Inumbo-ID: b380c3b4-85d5-11e9-8980-bc764e045a96
Received: from out5-smtp.messagingengine.com (unknown [66.111.4.29])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b380c3b4-85d5-11e9-8980-bc764e045a96;
 Mon, 03 Jun 2019 08:00:50 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 993CB2208C;
 Mon,  3 Jun 2019 04:00:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 03 Jun 2019 04:00:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=q
 daAgJ9fNvUmysHIjCTXJpXixNuqYmRyjOfd7GNfc2M=; b=nuudXgCxTteabkqM+
 /LHWKDbcH5m6Fv3KtkTb5JEVaDomOO04Mq2xrKd5dAwOLgxNczmDXepPPSkMZP9W
 Es0HyGTMQyjvaJksZbhv4iR3BrOGjslkg26VQaoyLpMmFXRVy6rCzQKozKDWXZ3+
 RVwiMBFksD3Oy+tSDLmx4UqbyXxvbsdNcCDS1Brfqx2acW/91vwGOGd/VqiEiCYW
 q7Yk+dYc8F5lTrTsm1yB4L/4s0atBxfNyd+r5P5pTd6MOlKAzqFq5mlNsbXcmfJz
 KaCQEqI5e2iIQhr3PS3U0ujDXWwA3DrETjLqUQaP4ZjpIymBSqEUIFG2XniUYgBt
 RK16w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=qdaAgJ9fNvUmysHIjCTXJpXixNuqYmRyjOfd7GNfc
 2M=; b=JH4MFZXfU0MVLUrYvbtHtpW/GGWXHQCNiNnngg3wSSEdsd+AvHIP01/nz
 Y9DOyBKnwKIx/1S5p1UMYZ0lfc3uLEkF6+q2N/lE7Wsa4TJ3h9XTWn1i8tcvcQ4c
 MOyZWwzAXIFswvCuPd9Q/UUHWfGDUi5RKxQ43FKNkU+uTIj4vmauir4Px1t9VyLh
 1rTu+ZBI3Wzj9xip9hxusJlD9jvoiQ2+gQx4s5I15K0Mkjg6Hpi3umzk9sCpZlHS
 i96QeilpTyrY8ntuD/kQKXM9360jn9gnLmElHDsg+RuHvVZseNij84iyCy5gcazQ
 0VCm838oOSmf75ra7qJ3uLzT2p16g==
X-ME-Sender: <xms:sdP0XOH3f0iliZfCjhYddenAqprOGjQjiotneKRfiP9kYvZfvnv9kw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudefiedguddvjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggugfgjfgesthekredttderudenucfhrhhomhepifhr
 vghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecukfhppeekfedrkeeirdekle
 druddtjeenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
 necuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:sdP0XAklciS6gRNVUtDytsc93_KVsgPJfHqRgRE-z9mrQqwB8WiOYw>
 <xmx:sdP0XFM4Pp9Rq87Po4vvR9pHecf-6DG7BD-a2tejMTO6aPbl_y1ejg>
 <xmx:sdP0XLGPwG0ljHLDc0KIVI1z0ol96v9yLxY7ejRXxEssB7v818BRPg>
 <xmx:sdP0XJaNdTck15kubQyXLB61LvpWyjkUT4WyU4rl-1kxy5AY5rXDxA>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 by mail.messagingengine.com (Postfix) with ESMTPA id A017D380086;
 Mon,  3 Jun 2019 04:00:48 -0400 (EDT)
Date: Mon, 3 Jun 2019 10:00:36 +0200
From: Greg KH <greg@kroah.com>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Message-ID: <20190603080036.GF7814@kroah.com>
References: <1559229415.24330.2.camel@codethink.co.uk>
 <0e6ebb5c-ff43-6d65-bcba-6ac5e60aa472@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0e6ebb5c-ff43-6d65-bcba-6ac5e60aa472@oracle.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Subject: Re: [Xen-devel] [stable] xen/pciback: Don't disable PCI_COMMAND on
 PCI device reset.
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
Cc: Prarit Bhargava <prarit@redhat.com>, Juergen Gross <jgross@suse.com>,
 Ben Hutchings <ben.hutchings@codethink.co.uk>, stable <stable@vger.kernel.org>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXkgMzAsIDIwMTkgYXQgMDc6MDI6MzRQTSAtMDcwMCwgS29ucmFkIFJ6ZXN6dXRl
ayBXaWxrIHdyb3RlOgo+IE9uIDUvMzAvMTkgODoxNiBBTSwgQmVuIEh1dGNoaW5ncyB3cm90ZToK
PiA+IEknbSBsb29raW5nIGF0IENWRS0yMDE1LTg1NTMgd2hpY2ggaXMgZml4ZWQgYnk6Cj4gPiAK
PiA+IGNvbW1pdCA3NjgxZjMxZWM5Y2RhY2FiNGZkMTA1NzBiZTkyNGYyY2VmNjY2OWJhCj4gPiBB
dXRob3I6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KPiA+
IERhdGU6wqDCoMKgV2VkIEZlYiAxMyAxODoyMTozMSAyMDE5IC0wNTAwCj4gPiAKPiA+ICDCoMKg
wqDCoHhlbi9wY2liYWNrOiBEb24ndCBkaXNhYmxlIFBDSV9DT01NQU5EIG9uIFBDSSBkZXZpY2Ug
cmVzZXQuCj4gPiAKPiA+IEknbSBhd2FyZSB0aGF0IHRoaXMgY2hhbmdlIGlzIGluY29tcGF0aWJs
ZSB3aXRoIHFlbXUgPCAyLjUsIGJ1dCB0aGF0J3MKPiA+IG5vdyBxdWl0ZSBvbGQuICBEbyB5b3Ug
dGhpbmsgaXQgbWFrZXMgc2Vuc2UgdG8gYXBwbHkgdGhpcyBjaGFuZ2UgdG8KPiA+IHNvbWUgc3Rh
YmxlIGJyYW5jaGVzPwo+ID4gCj4gPiBCZW4uCj4gPiAKPiAKPiBIZXkgQmVuLAo+IAo+IDxzaHJ1
Z3M+IE15IG9waW5pb24gaXMgdG8gZHJvcCBpdCwgYnV0IGlmIEp1ZXJnZW4gdGhpbmtzIGl0IG1h
a2VzIHNlbnNlIHRvCj4gYmFja3BvcnQgSSBhbSBub3QgZ29pbmcgdG8gYXJndWUuCgpPaywgSSd2
ZSBxdWV1ZWQgdGhpcyB1cCBub3csIHRoYW5rcy4KCmdyZWcgay1oCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
