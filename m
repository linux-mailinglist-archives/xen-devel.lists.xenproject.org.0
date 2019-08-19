Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C9992591
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2019 15:53:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzi3e-0004Hm-BK; Mon, 19 Aug 2019 13:50:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SjD+=WP=invisiblethingslab.com=mkow@srs-us1.protection.inumbo.net>)
 id 1hzi3c-0004Hh-AH
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2019 13:50:48 +0000
X-Inumbo-ID: 585d4c36-c288-11e9-8bed-12813bfff9fa
Received: from wout2-smtp.messagingengine.com (unknown [64.147.123.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 585d4c36-c288-11e9-8bed-12813bfff9fa;
 Mon, 19 Aug 2019 13:50:47 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id A0ED945B;
 Mon, 19 Aug 2019 09:50:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 19 Aug 2019 09:50:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=frR5AyfH3gX84KwTDGiAZZLWUyJH0i/1a5uJx3bHD
 GI=; b=XPeEX06Z7reCN6fPU9dKM2Zklv9lDwywAJhHJfH+XblmOl0kbxkriMPvc
 viP1tepZ8AAdOLDHLMKJxpUmOYmHt9iVKXE7lV1YXw3OOVS+rX4sII5GXA4SDf+X
 f4RyYxsgZI1UMuJ/qHGOT5mYwCwWVpRqHnU58tIx+3pirpSyRjao/PllvdMT4NxT
 N0NbwiZ8w7eEgnt20y2Jl24tkQaqtlUgblet/MPOix4CD+QtnhfzxQUHE7RREL2p
 3K8oORZ3XtNbHuHGE5QcQheZlchQZflLzEckXhTV3MoEtKRxMWe0Fhgi5Xk3UYLC
 ZIiKbFvHqcgbzpP9w5a4FZXyyEHPQ==
X-ME-Sender: <xms:NKlaXYk1cMgF1gKzQaSaVn5r37b0Y3TLPRx7ymqPenHNSmXqXA7sjQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudefledgjedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepvfhfhffukffffgggjggtgfesthhqredttdefjeenucfhrhhomhepofhitghh
 rghlpgfmohifrghltgiihihkuceomhhkohifsehinhhvihhsihgslhgvthhhihhnghhslh
 grsgdrtghomheqnecuffhomhgrihhnpehtrhgrmhhpohhlihhnvgdrshgsnecukfhppeeh
 rddvvdeirdejtddrgeenucfrrghrrghmpehmrghilhhfrhhomhepmhhkohifsehinhhvih
 hsihgslhgvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:NKlaXe9K0fhNhB_rrDyOGeMAxeZeUlnNUydLQ9jDi7wNwUOu7CnTFQ>
 <xmx:NKlaXRUibh9N6G9QKfzuRE4ir7F7bfTAKC7OuXODulwONYS3PB36fw>
 <xmx:NKlaXaEictPu3q8OuZi5TpO032ZmPXiFDDbKK0kbPFEnxdWvWGDNeQ>
 <xmx:NalaXcGPBAlfksKS64pqvzjpuAp-i5F4GqsIIYo_7G9lPuK7ID0_0w>
Received: from [10.137.0.17] (5-226-70-4.static.ip.netia.com.pl [5.226.70.4])
 by mail.messagingengine.com (Postfix) with ESMTPA id CD51D80064;
 Mon, 19 Aug 2019 09:50:42 -0400 (EDT)
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <1c917278029b206317a2155fb78e63ed14b621e5.1566176127.git.mkow@invisiblethingslab.com>
 <93632bab-f393-0c9c-94a8-dc18a06d873e@citrix.com>
From: =?UTF-8?Q?Micha=c5=82_Kowalczyk?= <mkow@invisiblethingslab.com>
Openpgp: preference=signencrypt
Message-ID: <9cb4d3b4-baab-0fe0-8876-51a7633313d7@invisiblethingslab.com>
Date: Mon, 19 Aug 2019 15:50:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <93632bab-f393-0c9c-94a8-dc18a06d873e@citrix.com>
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

T24gOC8xOS8xOSAxMTowNCBBTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxOS8wOC8yMDE5
IDAzOjIzLCBNaWNoYcWCIEtvd2FsY3p5ayB3cm90ZToKPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L3g4Ni9ib290L3RyYW1wb2xpbmUuUyBiL3hlbi9hcmNoL3g4Ni9ib290L3RyYW1wb2xpbmUuUwo+
PiBpbmRleCA3YzZhMjMyOGQyLi5mY2FhM2VlYWYxIDEwMDY0NAo+PiAtLS0gYS94ZW4vYXJjaC94
ODYvYm9vdC90cmFtcG9saW5lLlMKPj4gKysrIGIveGVuL2FyY2gveDg2L2Jvb3QvdHJhbXBvbGlu
ZS5TCj4+IEBAIC04NSw3ICs4NSw3IEBAIHRyYW1wb2xpbmVfZ2R0Ogo+PiAgICAgICAgICAubG9u
ZyAgIHRyYW1wb2xpbmVfZ2R0ICsgQk9PVF9QU0VVRE9STV9EUyArIDIgLSAuCj4+ICAgICAgICAg
IC5wb3BzZWN0aW9uCj4+ICAKPj4gLUdMT0JBTCh0cmFtcG9saW5lX21pc2NfZW5hYmxlX29mZikK
Pj4gK0dMT0JBTChtaXNjX2VuYWJsZV9vZmYpCj4gVGhlIG92ZXJhbGwgY2hhbmdlIGlzIGZpbmUs
IGJ1dCB3aHkgaGF2ZSB5b3UgcmVuYW1lZCB0aGlzIHZhcmlhYmxlPwpUaGUgb2xkIG5hbWUgaGFk
ICJ0cmFtcG9saW5lXyIgcHJlZml4IGJlY2F1c2UgdGhlIG9ubHkgcGxhY2Ugd2hlcmUgaXQKd2Fz
IHVzZWQgd2FzIHRyYW1wb2xpbmVfcHJvdG1vZGVfZW50cnkgaW4gYXJjaC94ODYvYm9vdC90cmFt
cG9saW5lLlMuCk5vdyBpdCdzIGFsc28gdXNlZCBpbiB0aGUgd2FrZXVwIGNvZGUsIHNvIEkgcmVt
b3ZlZCB0aGUgcHJlZml4IHdoaWNoCmNvdWxkIGJlIChJTU8pIG1pc2xlYWRpbmcuCj4gV2l0aG91
dCB0aGUgcmVuYW1lLCB0aGUgcGF0Y2ggd291bGQgYmUganVzdCB0aGUgc2luZ2xlIGh1bmsgaW4g
d2FrZXVwLlMKPiBhbmQgdGhlcmVmb3JlIGVhc2llciB0byBiYWNrcG9ydC4KClRydWUuIEFueXdh
eSwgdGhlIGRlY2lzaW9uIGlzIG9uIHlvdXIgc2lkZSwgSSBjYW4gbGVhdmUgdGhlIG9sZCBuYW1l
IGlmCnlvdSBwcmVmZXIuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
