Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D920D130AF0
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2020 01:40:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioGMo-0005Ah-Sw; Mon, 06 Jan 2020 00:35:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+YZ0=23=ajanse.me=aaron@srs-us1.protection.inumbo.net>)
 id 1ioGMn-0005Ac-8T
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2020 00:35:33 +0000
X-Inumbo-ID: 6d0515e0-301c-11ea-a914-bc764e2007e4
Received: from wout2-smtp.messagingengine.com (unknown [64.147.123.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6d0515e0-301c-11ea-a914-bc764e2007e4;
 Mon, 06 Jan 2020 00:35:23 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id C6B3C51B;
 Sun,  5 Jan 2020 19:35:22 -0500 (EST)
Received: from imap35 ([10.202.2.85])
 by compute7.internal (MEProxy); Sun, 05 Jan 2020 19:35:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ajanse.me; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=owauD5Zv8UhF7dmrak9aU29zkDHNAxB
 baAg+tPFBBzM=; b=PUu7Q5BUMEgnKs0OTTqmeNXr+MJtSGbQ2n/llgnI5LpGVhY
 xmpqPhZag8RtokcgQ6ta8F3hmzYPeTS/TKQEjQZ5jPVzP9AiZFs80+Z+d3FQklD5
 +jFYQ/Z0VRqmHsq0Vv/BmUhB2UzMz5EVbACPBH4f+NryaSgyYRG5rVCK4rmnErXn
 SMmVkesgIwGW9fZeUnGEldd9LL2hMkn1JAtFwco4QZdh2TjdJPDuLOX7Mp03oWfV
 LjYwywVOgDM0vs0ZvmPvA6AzVvY7Ia/LSTOBEDjfKbPCWD+8TT0BpJTMPcnDxyl6
 kH9nd0SWt2sJqv/sjp9MpGn7vc5d2GY2ecJzeGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=owauD5
 Zv8UhF7dmrak9aU29zkDHNAxBbaAg+tPFBBzM=; b=DtMqn2uuemOB2jG/5L+c7Z
 aJ0Zs5SOdYTWzVeV/4l4PgM3SDp9H1dyz1cjGLw0KMD3shGQoyxDUA693Fhkmq8Z
 EOyQOHcJyKaYkrUC13LGodI/yggpsMB+Ae99nuiogxQFD41BrsFJPSsO2+q1y9iT
 hBeaJHp/NovCiA+PNTmtQB7pL8M9amJChH8NiyyeUYaDPUFfY9fzOq6W3Xx2y5B0
 6yBxixcsha9+zwNbmExYvJZJrVuoW5ufu2oIdFniCAedfjBZmT7klUf3XtOhrZ4i
 26PYzxPJIEdg852Uw3VuIQ0nfeAwPoIv/qqcWTIiLsm/3UIGIDuZV2VlufAt8krA
 ==
X-ME-Sender: <xms:yoASXu6Nc7LW6CE8x8KOIC42NVzkf4MIapHE2WxzI1nS2OKyXjsMgw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdegledgvddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetrghr
 ohhnucflrghnshgvfdcuoegrrghrohhnsegrjhgrnhhsvgdrmhgvqeenucffohhmrghinh
 epgigvnhhprhhojhgvtghtrdhorhhgpdhnihigohhsrdhorhhgpdhrvgguughithdrtgho
 mhdpgigvnhdrohhrghenucfrrghrrghmpehmrghilhhfrhhomheprggrrhhonhesrghjrg
 hnshgvrdhmvgenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:yoASXpIjzQVOmfnn5_MgzAoclk5p9PwJChgrr5XB-zjiqG0z6jGEhw>
 <xmx:yoASXmWkCGoanMsBCcuP-YnLhxh2Rf_GtcXlLJB2erFl11BDZGfj2A>
 <xmx:yoASXiKnN_ES47PoFyVguT_E3jXu7QMH4rCdWxP_yPxdE98fC2Beyw>
 <xmx:yoASXvr7B1-x4Ay7bid4YVKvyxbfFPY2g7rT8hdCdE2l2t8k40nllg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 16F0914C007A; Sun,  5 Jan 2020 19:35:22 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-730-gb761ca3-fmstable-20200103v1
Mime-Version: 1.0
Message-Id: <6a9a3a45-5b92-46e9-8732-62e7629810a2@www.fastmail.com>
In-Reply-To: <2006e043-240d-fede-034c-7898d855f18d@suse.com>
References: <4019c78f-6546-4edc-b5c3-1ea471e129ff@www.fastmail.com>
 <2006e043-240d-fede-034c-7898d855f18d@suse.com>
Date: Sun, 05 Jan 2020 16:35:00 -0800
From: "Aaron Janse" <aaron@ajanse.me>
To: "Jan Beulich" <jbeulich@suse.com>
Subject: Re: [Xen-devel] 
 =?utf-8?q?=5BBUG=5D_panic=3A_=22IO-APIC_+_timer_does?=
 =?utf-8?q?n=27t_work=22_-_several_people_have_reproduced?=
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKYW4gMywgMjAyMCwgYXQgNDo1MSBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24g
MzEuMTIuMjAxOSAwODo1MiwgIEFhcm9uIEphbnNlICB3cm90ZToKPiA+IEknZCBsaWtlIHRvIG5v
dGUgdGhhdCBVYnVudHUsIHVubGlrZSBRdWJlcywgZG9lc24ndCBuZWVkIHRvIHRyeQo+ID4gYW55
IGBNUC1CSU9TIGJ1Z2AgZmFsbGJhY2tzLgo+IAo+ICJEb2Vzbid0IG5lZWQgdG8gdHJ5IiBpcyBz
dXBwb3NlZCB0byBtZWFuIHdoYXQ/IFRoYXQgaXQgZ2V0cyBwYXN0Cj4gdGhlIHRpbWVyIGludGVy
cnVwdCBpbml0aWFsaXphdGlvbiwgbWVhbmluZyBpZiBpdCBjcmFzaGVzIGFub3RoZXIKPiB3YXks
IGl0J3MgYSBkaWZmZXJlbnQgcHJvYmxlbT8gT3IgaW5zdGVhZCBtZWFuaW5nIGl0IHdvcmtzCj4g
KGNvbnRyYXJ5IHRvIGluZm9ybWF0aW9uIGZvdW5kIGVsc2V3aGVyZSksIHN1Z2dlc3RpbmcgdGhl
cmUncyBhCj4gUXViZXMgc2lkZSBjaGFuZ2UgaW52b2x2ZWQ/CgpJIG9yaWdpbmFsbHkgdGhvdWdo
dCB0aGF0IHRoZSBwcm9ibGVtIHdhcyB0aGUgdGltZXIgc3BlY2lmaWNhbGx5LCBidXQKYmFzZWQg
b24gd2hhdCB5b3UgYW5kIEFuZHJldyBDb29wZXIgaGF2ZSBzYWlkLCBpdCBzb3VuZHMgbGlrZSB0
aGUgcm9vdApjYXVzZSBpcyBzb21ld2hlcmUgZWxzZS4KCkFuZHJldyBDb29wZXIgd3JvdGU6Cj4g
KElycmVzcGVjdGl2ZSwgSSdtIHByZXR0eSBzdXJlIHRoaXMgaXMgYSBHcnViMitFRkkgaXNzdWUg
ZmFpbGluZyB0byBwYXNzCj4gdGhlIEFDUEkgdGFibGVzIHRvIFhlbiwgYW5kIHRoaXMgZXZlbnR1
YWwgcGFuaWMgaXMganVzdCBjYXNjYWRlIGZhbGxvdXQuKQoKSSB0cmllZCB0byBnZXQgWGVuIHdv
cmtpbmcgdmlhIGxlZ2FjeSBib290LCBidXQgSSBoYXZlbid0IGJlZW4gYWJsZSB0byBnZXQKbXkg
bGFwdG9wIHRvIGJvb3QgYW55dGhpbmcgYnV0IFVFRkkuIFRoZSBCSU9TIGV2ZW4gc3RhdGVzICJV
RUZJIG9ubHkuIgoKPiBEaWQgeW91IHRyeSBkaXNhYmxpbmcgdXNlIG9mIHRoZSBJT01NVSAoImlv
bW11PTAiIG9uIHRoZSBYZW4KPiBjb21tYW5kIGxpbmUpPwoKVW5mb3J0dW5hdGVseSwgUXViZXMg
cmVxdWlyZXMgaW9tbXUuIFNldHRpbmcgImlvbW11PTAiIHJlc3VsdHMgaW4gYSBwYW5pYzoKCmBg
YApDb3VsZG4ndCBlbmFibGUgSU9NTVUgYW5kIGlvbW11PXJlcXVpcmVkL2ZvcmNlCmBgYAoKSSBh
bHNvICh1bnN1Y2Nlc3NmdWxseSkgdHJpZWQgaW9tbXU9bm8taWdmeCBhbmQgaW9tbXU9c29mdCAo
Ym90aCByZXN1bHRlZAppbiB0aGUgdGltZXIgcGFuaWMpLgoKSSBjb3VsZG4ndCBmaW5kIGFueXdo
ZXJlIHRvIGRpc2FibGUgdGhlIGZsYWcgKGV2ZW4gdGhvdWdoIGl0IHdvdWxkIGJyZWFrClF1YmVz
LCBhdCBsZWFzdCB0aGUgZmxhZyBjb3VsZCBoZWxwIG1pbmltaXplIHRoZSBzY29wZSBvZiB0aGUg
Y2F1c2Ugb2YgdGhlCnRpbWVyIGNyYXNoKS4KCkkgaW5zdGFsbGVkIFhlbiBvbiBBcmNoIExpbnV4
IGluIG9yZGVyIHRvIHRlc3QgdGhpcyBmbGFnLCBidXQgSSdtIGhhdmluZwp0aGUgc2FtZSBwcm9i
bGVtIEkgaGFkIG9uIFVidW50dTogYm9vdGluZyB0byBYZW4gaGFuZ3Mgb24gbG9hZGluZwppbml0
cmFtZnMuIFsxXQoKPiBJZiB0aGlzIGlzIGFzIGNvbW1vbiBhIHByb2JsZW0gYXMgeW91IHNheSwg
aXQncyBoYXJkIHRvIGJlbGlldmUKPiB0aGlzIGhhcyBuZXZlciB3b3JrZWQgb24gYW55IG9mIHRo
ZXNlIHN5c3RlbXMuIEhlbmNlIGl0IHdvdWxkIGJlCj4gaGVscGZ1bCB0byBrbm93IHN0YXJ0aW5n
IGZyb20gd2hpY2ggdmVyc2lvbiB0aGlzIGhhcyBiZWVuCj4gcmVncmVzc2VkLgoKVGhhdCBtYWtl
cyBzZW5zZS4gSSd2ZSB0cmllZCB0byByZXByb2R1Y2UgdGhlIHByb2JsZW0gb24gYm90aCBBcmNo
IGFuZApVYnVudHUgKGJvdGggaGFuZywgYW5kIEknbSBub3Qgc3VyZSB3aHkgb3IgaG93IHRvIGRl
YnVnIHRoYXQpLiBCZWNhdXNlClF1YmVzIGlzIHRoZSBvbmx5IE9TIEkndmUgYmVlbiBhYmxlIHRv
IGJvb3QgdmVyYm9zZSBYZW4gZnJvbSwgSSBpbnN0YWxsZWQKYSAyMDE2IHJlbGVhc2UgdG8gdHJ5
IG91dC4gSG93ZXZlciwgSSBjb3VsZG4ndCBnZXQgcGFzdCBhIGhhbmcgc2hvd2luZwp0aGUgRGVs
bCBsb2dvLiBJIGhhZCB0aGlzIHNhbWUgaXNzdWUgb24gTml4T1MsIGRlc2NyaWJlZCBieSBzb21l
b25lIGVsc2UKd2l0aCB0aGUgc2FtZSBsYXB0b3Agb24gdGhlIE5peE9TIERpc2NvdXJzZSBbNF0u
IFRoZSBzb2x1dGlvbiBmb3IgTml4T1MKd2FzIHRvIHVzZSBhIG5ld2VyIHZlcnNpb24gb2YgdGhl
IGRpc3Ryby4KCklmIEkgY2FuIGdldCBwYXN0IHRoZSBib290IGhhbmcgb24gVWJ1bnR1IG9yIEFy
Y2gsIEknZCBiZSBoYXBweSB0byBnbyBhYm91dApiaXNlY3RpbmcgdGhlIGlzc3VlLCBjb21wYXJp
bmcgVWJ1bnR1L0FyY2ggdnMgUXViZXMsIGNvbXBpbGluZyB3aXRoIG5ldwpwcmludGYgc3RhdGVt
ZW50cywgZXRjLgoKQXMgYSBzaWRlIG5vdGUsIHRoZSBYUFMgNzM5MCAyLWluLTEgdXNlciB3YXMg
YWJsZSB0byBnZXQgWGVuIHRvIGJvb3QKdXNpbmcgdGhlIGFjcGk9bm9pcnEgZmxhZyBbMl0uIE15
IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCBuZWVkaW5nIHRoaXMgZmxhZwppbmRpY2F0ZXMgdGhhdCBz
b21ldGhpbmcncyBzdGlsbCB3cm9uZyBbM10uCgpbMV0gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi11c2Vycy8yMDE5LTEyL21zZzAwMDMxLmh0bWwKWzJdIGh0
dHBzOi8vd3d3LnJlZGRpdC5jb20vci9RdWJlcy9jb21tZW50cy9lZHFyYWIvcXViZXNfYW5kX2lj
ZV9sYWtlL2ZjcmVzbGQvClszXSBodHRwOi8veGVuYml0cy54ZW4ub3JnL2RvY3MvdW5zdGFibGUv
bWlzYy94ZW4tY29tbWFuZC1saW5lLmh0bWwjYWNwaQpbNF0gaHR0cHM6Ly9kaXNjb3Vyc2Uubml4
b3Mub3JnL3Qvbml4b3Mtc3RhYmxlLXdvbnQtYm9vdC1mcm9tLXVzYi1vbi14cHMtNzM5MC80Nzc2
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
