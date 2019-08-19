Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 890D5925A8
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2019 15:59:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzi8z-0004kP-Qt; Mon, 19 Aug 2019 13:56:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SjD+=WP=invisiblethingslab.com=mkow@srs-us1.protection.inumbo.net>)
 id 1hzi8y-0004kK-FZ
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2019 13:56:20 +0000
X-Inumbo-ID: 1e1bae86-c289-11e9-8bed-12813bfff9fa
Received: from wout2-smtp.messagingengine.com (unknown [64.147.123.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1e1bae86-c289-11e9-8bed-12813bfff9fa;
 Mon, 19 Aug 2019 13:56:18 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 1AD2E2F7;
 Mon, 19 Aug 2019 09:56:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 19 Aug 2019 09:56:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=6iF7eulQCGWh3+lP51JR4abC0TtBJ48YZfCsBksIA
 aY=; b=iexLaZd8dNqONuIGMjRN+zHXOC+ONLgG9KZ3gjm5/EGsRPK7v1LxF9ZIl
 KKNasWu6k3Pu8aDaXFmdma+o1z0FPCEgBdMAyfH5+FRlujhzBlPO/+x+Vy/1BGbu
 dB6sQN4ZwM70WExX1p9nw5PNW2y0PDulNb9vlbAW55jxoY3rTc/kDqkoEqduQWAi
 ZNSY5w8T7dqGxj5Imss5esVoBBZZ2OB1WaKdmVpMpLvRFw9M2kM15nvE4jkRGMn2
 piNHqHcwsoQR2U5rASkTHgF69j1FqRpteVIp5gih44tYyTQbOg7SH7eqgzbJ7Squ
 4hdLs5lluZOhgMlOTfK15ta0MIz7g==
X-ME-Sender: <xms:f6paXWPvBuRQW6C3gjI0Tt4fsPlU56Vg_mUvFr1800mue_Oq6iWNBg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudefledgjeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepvfhfhffukffffgggjggtgfesthhqredttdefjeenucfhrhhomhepofhitghh
 rghlpgfmohifrghltgiihihkuceomhhkohifsehinhhvihhsihgslhgvthhhihhnghhslh
 grsgdrtghomheqnecuffhomhgrihhnpehtrhgrmhhpohhlihhnvgdrshgsnecukfhppeeh
 rddvvdeirdejtddrgeenucfrrghrrghmpehmrghilhhfrhhomhepmhhkohifsehinhhvih
 hsihgslhgvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:f6paXdxOXjLuwnsJkAjo9dNgGbttgv2-7DCrg62y1C9ijeqbLd7SPw>
 <xmx:f6paXUP2paksBCwsdNA-3frSioEEfJG_-IfPzmIrVQqWhWx_gSlGlQ>
 <xmx:f6paXQRCIUEJMy_5b8ziYXjQVJ0MyvJEIOO4c1tYEmo3HwNdMcNbMA>
 <xmx:gKpaXWaKJrSIK6m5unU4pDG2WZmqao4ZoR2N8pGYOPJYPkzs9dBT1A>
Received: from [10.137.0.17] (5-226-70-4.static.ip.netia.com.pl [5.226.70.4])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0D59080065;
 Mon, 19 Aug 2019 09:56:13 -0400 (EDT)
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <1c917278029b206317a2155fb78e63ed14b621e5.1566176127.git.mkow@invisiblethingslab.com>
 <93632bab-f393-0c9c-94a8-dc18a06d873e@citrix.com>
 <9cb4d3b4-baab-0fe0-8876-51a7633313d7@invisiblethingslab.com>
 <9d722a06-2585-82b8-9b04-18240526eaf6@citrix.com>
From: =?UTF-8?Q?Micha=c5=82_Kowalczyk?= <mkow@invisiblethingslab.com>
Openpgp: preference=signencrypt
Message-ID: <1bbeb58d-c5d8-3da1-47c0-bd54b40afda4@invisiblethingslab.com>
Date: Mon, 19 Aug 2019 15:56:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <9d722a06-2585-82b8-9b04-18240526eaf6@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v1] x86: Restore IA32_MISC_ENABLE on wakeup
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
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOC8xOS8xOSAzOjUyIFBNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IE9uIDE5LzA4LzIwMTkg
MTQ6NTAsIE1pY2hhxYIgS293YWxjenlrIHdyb3RlOgo+PiBPbiA4LzE5LzE5IDExOjA0IEFNLCBB
bmRyZXcgQ29vcGVyIHdyb3RlOgo+Pj4gT24gMTkvMDgvMjAxOSAwMzoyMywgTWljaGHFgiBLb3dh
bGN6eWsgd3JvdGU6Cj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9ib290L3RyYW1wb2xp
bmUuUyBiL3hlbi9hcmNoL3g4Ni9ib290L3RyYW1wb2xpbmUuUwo+Pj4+IGluZGV4IDdjNmEyMzI4
ZDIuLmZjYWEzZWVhZjEgMTAwNjQ0Cj4+Pj4gLS0tIGEveGVuL2FyY2gveDg2L2Jvb3QvdHJhbXBv
bGluZS5TCj4+Pj4gKysrIGIveGVuL2FyY2gveDg2L2Jvb3QvdHJhbXBvbGluZS5TCj4+Pj4gQEAg
LTg1LDcgKzg1LDcgQEAgdHJhbXBvbGluZV9nZHQ6Cj4+Pj4gICAgICAgICAgLmxvbmcgICB0cmFt
cG9saW5lX2dkdCArIEJPT1RfUFNFVURPUk1fRFMgKyAyIC0gLgo+Pj4+ICAgICAgICAgIC5wb3Bz
ZWN0aW9uCj4+Pj4gIAo+Pj4+IC1HTE9CQUwodHJhbXBvbGluZV9taXNjX2VuYWJsZV9vZmYpCj4+
Pj4gK0dMT0JBTChtaXNjX2VuYWJsZV9vZmYpCj4+PiBUaGUgb3ZlcmFsbCBjaGFuZ2UgaXMgZmlu
ZSwgYnV0IHdoeSBoYXZlIHlvdSByZW5hbWVkIHRoaXMgdmFyaWFibGU/Cj4+IFRoZSBvbGQgbmFt
ZSBoYWQgInRyYW1wb2xpbmVfIiBwcmVmaXggYmVjYXVzZSB0aGUgb25seSBwbGFjZSB3aGVyZSBp
dAo+PiB3YXMgdXNlZCB3YXMgdHJhbXBvbGluZV9wcm90bW9kZV9lbnRyeSBpbiBhcmNoL3g4Ni9i
b290L3RyYW1wb2xpbmUuUy4KPj4gTm93IGl0J3MgYWxzbyB1c2VkIGluIHRoZSB3YWtldXAgY29k
ZSwgc28gSSByZW1vdmVkIHRoZSBwcmVmaXggd2hpY2gKPj4gY291bGQgYmUgKElNTykgbWlzbGVh
ZGluZy4KPj4+IFdpdGhvdXQgdGhlIHJlbmFtZSwgdGhlIHBhdGNoIHdvdWxkIGJlIGp1c3QgdGhl
IHNpbmdsZSBodW5rIGluIHdha2V1cC5TCj4+PiBhbmQgdGhlcmVmb3JlIGVhc2llciB0byBiYWNr
cG9ydC4KPj4gVHJ1ZS4gQW55d2F5LCB0aGUgZGVjaXNpb24gaXMgb24geW91ciBzaWRlLCBJIGNh
biBsZWF2ZSB0aGUgb2xkIG5hbWUgaWYKPj4geW91IHByZWZlci4KPiBUaGUgdHJhbXBvbGluZV8g
cHJlZml4IGluZGljYXRlcyB3aGVyZSB0aGUgZGF0YSBsaXZlcywgd2hpY2ggaXMgaW4gdGhlCj4g
MTYgYml0IHRyYW1wb2xpbmUgd2hpY2ggY29udGFpbnMgYm90aCB0aGUgQVAgYm9vdCBwYXRoLCBh
bmQgd2FrZXVwIHBhdGguCkFoLCBpZiB0aGlzIGlzIHRoZSBjb252ZW50aW9uIHlvdSB1c2UgdGhl
biB3ZSBzaG91bGQgbGVhdmUgdGhlIG9sZCBuYW1lLgo+IElmIHlvdSdyZSBoYXBweSB3aXRoIHRo
aXMsIEkgY2FuIGFkanVzdCBvbiBjb21taXQgdG8gYXZvaWQgeW91IHNlbmRpbmcgYQo+IHNlY29u
ZCB0aW1lLgoKV291bGQgYmUgZ3JlYXQsIHRoYW5rcyEKCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
