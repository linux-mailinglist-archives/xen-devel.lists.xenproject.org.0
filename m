Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC44F33EA2
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 07:51:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hY2J1-0003e1-CZ; Tue, 04 Jun 2019 05:48:19 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=QJG0=UD=kroah.com=greg@srs-us1.protection.inumbo.net>)
 id 1hY2Iz-0003dw-GL
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 05:48:17 +0000
X-Inumbo-ID: 581d8a84-868c-11e9-8980-bc764e045a96
Received: from wout1-smtp.messagingengine.com (unknown [64.147.123.24])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 581d8a84-868c-11e9-8980-bc764e045a96;
 Tue, 04 Jun 2019 05:48:14 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 5BA42543;
 Tue,  4 Jun 2019 01:48:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 04 Jun 2019 01:48:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=T
 CaT+Fn47+ujhoKgN9BqRZfA99WODN1m/1NIm/vdRH8=; b=oaHBm6XDYjYnIR1+T
 tDP6lz3rPXXNul0GO6vfZa9L/L0jmBs0+qYGxIQnA08yiWcMtzGgEJlXssupUOWk
 IXiXTc7PRBQRY8LN2/u5T9nI1Gc58f2Y+HocDeVesocNpudlktWBKYFqrc8DWBYQ
 5T8byHPpvDvi0U/aqtts5/dEkHgnDE6uwCEI8NtaEUsa7dzTm8LdHXXccCSo5DJd
 DcpcQZug2TO0gunHcVwPYJBuXCyAEerKpju7cSNY+oK7yNc4D5DLNb/9D9OUB9Lq
 FvPKvahrP7eOBp/EexPhywS/N8HhKe1+bohaYPKCBirPf/w19szbXlsmREwh9Nik
 wyn9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=TCaT+Fn47+ujhoKgN9BqRZfA99WODN1m/1NIm/vdR
 H8=; b=GZ1FyG62s1xexwpPe4FC5Q62hK982P/nBwXKoBo/2LnNCaW3a8jrInxUP
 ARtfThVhX0ddEKj/QQTMSwRy92rmVXFTbqKE7t82LRu10VAo7CZXphwOTw+DW8Rd
 Ff6DUipkbo5YI4EQOUfzQcWI4d535crAFOp8aLrTINByquHyunwRESbSU+2uFB6k
 cgSLpRmIDnk+c5uygok/Yf8oWKKuoDv/JTrXuiKjQr4PaI9BFWtBeHsGJu3b/aWO
 UgINRDDsf1Kww2ql/jndm+FpH1YxGFGlisyuif+OBKgGDDSxBc5DuVD4lSuucuys
 kJBI0TTvpvIIHNOT32o5xgvUhsrBg==
X-ME-Sender: <xms:HAb2XMsLzrEelzR63i577txk3SZsU_gm9jfFAIzxFlhZnlgiWT3SXQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudefkedguddttdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggugfgjfgesthekredttderudenucfhrhhomhepifhr
 vghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecukfhppeekfedrkeeirdekle
 druddtjeenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
 necuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:HAb2XAXj2CYIhrQEuc_j1ZO71smNpFuZQ4e9xT5nHdm84L8BfVNDcw>
 <xmx:HAb2XEuofA8-jEtRCO9VuEgl94sirJxZOAau1IFOA77Jler4B0Hw5A>
 <xmx:HAb2XMUTPjTTGlW_7E7ii5Po8Npe5gmYXiMjtJ5BclMC_k7seX4Qnw>
 <xmx:HAb2XBl0QRT00X7fZZLlii9NBeVFVwtCGUThSxW0JzJGa7G6Zrt6Aw>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 by mail.messagingengine.com (Postfix) with ESMTPA id CEBED380083;
 Tue,  4 Jun 2019 01:48:11 -0400 (EDT)
Date: Tue, 4 Jun 2019 07:48:09 +0200
From: Greg KH <greg@kroah.com>
To: Juergen Gross <jgross@suse.com>
Message-ID: <20190604054809.GA16504@kroah.com>
References: <1559229415.24330.2.camel@codethink.co.uk>
 <0e6ebb5c-ff43-6d65-bcba-6ac5e60aa472@oracle.com>
 <20190603080036.GF7814@kroah.com>
 <1559563359.24330.8.camel@codethink.co.uk>
 <d3358f62-3e53-4468-782c-7b4466d34c0a@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d3358f62-3e53-4468-782c-7b4466d34c0a@suse.com>
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
Cc: Prarit Bhargava <prarit@redhat.com>, xen-devel@lists.xenproject.org,
 Ben Hutchings <ben.hutchings@codethink.co.uk>, stable <stable@vger.kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKdW4gMDMsIDIwMTkgYXQgMDM6MTA6NTVQTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBPbiAwMy8wNi8yMDE5IDE0OjAyLCBCZW4gSHV0Y2hpbmdzIHdyb3RlOgo+ID4gT24g
TW9uLCAyMDE5LTA2LTAzIGF0IDEwOjAwICswMjAwLCBHcmVnIEtIIHdyb3RlOgo+ID4+IE9uIFRo
dSwgTWF5IDMwLCAyMDE5IGF0IDA3OjAyOjM0UE0gLTA3MDAsIEtvbnJhZCBSemVzenV0ZWsgV2ls
ayB3cm90ZToKPiA+Pj4gT24gNS8zMC8xOSA4OjE2IEFNLCBCZW4gSHV0Y2hpbmdzIHdyb3RlOgo+
ID4+Pj4gSSdtIGxvb2tpbmcgYXQgQ1ZFLTIwMTUtODU1MyB3aGljaCBpcyBmaXhlZCBieToKPiA+
Pj4+Cj4gPj4+PiBjb21taXQgNzY4MWYzMWVjOWNkYWNhYjRmZDEwNTcwYmU5MjRmMmNlZjY2Njli
YQo+ID4+Pj4gQXV0aG9yOiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNs
ZS5jb20+Cj4gPj4+PiBEYXRlOsKgwqDCoFdlZCBGZWIgMTMgMTg6MjE6MzEgMjAxOSAtMDUwMAo+
ID4+Pj4KPiA+Pj4+IMKgwqDCoMKgwqB4ZW4vcGNpYmFjazogRG9uJ3QgZGlzYWJsZSBQQ0lfQ09N
TUFORCBvbiBQQ0kgZGV2aWNlIHJlc2V0Lgo+ID4+Pj4KPiA+Pj4+IEknbSBhd2FyZSB0aGF0IHRo
aXMgY2hhbmdlIGlzIGluY29tcGF0aWJsZSB3aXRoIHFlbXUgPCAyLjUsIGJ1dCB0aGF0J3MKPiA+
Pj4+IG5vdyBxdWl0ZSBvbGQuwqDCoERvIHlvdSB0aGluayBpdCBtYWtlcyBzZW5zZSB0byBhcHBs
eSB0aGlzIGNoYW5nZSB0bwo+ID4+Pj4gc29tZSBzdGFibGUgYnJhbmNoZXM/Cj4gPj4+Pgo+ID4+
Pj4gQmVuLgo+ID4+Pj4KPiA+Pj4KPiA+Pj4gSGV5IEJlbiwKPiA+Pj4KPiA+Pj4gPHNocnVncz4g
TXkgb3BpbmlvbiBpcyB0byBkcm9wIGl0LCBidXQgaWYgSnVlcmdlbiB0aGlua3MgaXQgbWFrZXMg
c2Vuc2UgdG8KPiA+Pj4gYmFja3BvcnQgSSBhbSBub3QgZ29pbmcgdG8gYXJndWUuCj4gPj4KPiA+
PiBPaywgSSd2ZSBxdWV1ZWQgdGhpcyB1cCBub3csIHRoYW5rcy4KPiA+IAo+ID4gSnVlcmdlbiBz
YWlkOgo+ID4gCj4gPj4gSSdtIHdpdGggS29ucmFkIGhlcmUuCj4gPiAKPiA+IHNvIHVubGVzcyBJ
J20gdmVyeSBjb25mdXNlZCB0aGlzIHNob3VsZCAqbm90KiBiZSBhcHBsaWVkIHRvIHN0YWJsZQo+
ID4gYnJhbmNoZXMuCj4gCj4gInNob3VsZCBub3QiIGlzIGEgbGl0dGxlIGJpdCBoYXJkLiBJIGRp
ZG4ndCBvcHQgZm9yIGFkZGluZyBpdCwgYnV0IEkKPiBkb24ndCBvYmplY3QgdG8gYWRkIGl0IGVp
dGhlciAobGlrZSBLb25yYWQgOi0pICkuCgpPaywgSSd2ZSBhZGRlZCBpdCBhcyBpdCBkb2VzIGZp
eCBhIENWRSwgYW5kIGlmIEkgZG9uJ3QsIEknbGwgZ2V0IG9kZAplbWFpbHMgNiBtb250aHMgZnJv
bSBub3cgYXNraW5nIHdoeSBJIGRpZG4ndCBpbmNsdWRlIGl0Li4uCgp0aGFua3MsCgpncmVnIGst
aAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
