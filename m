Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4606294C49
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2019 20:04:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzlyF-0001pi-GA; Mon, 19 Aug 2019 18:01:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SjD+=WP=invisiblethingslab.com=mkow@srs-us1.protection.inumbo.net>)
 id 1hzlyD-0001pc-BT
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2019 18:01:29 +0000
X-Inumbo-ID: 5c4229b7-c2ab-11e9-8bf0-12813bfff9fa
Received: from wout4-smtp.messagingengine.com (unknown [64.147.123.20])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5c4229b7-c2ab-11e9-8bf0-12813bfff9fa;
 Mon, 19 Aug 2019 18:01:26 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 895012D0;
 Mon, 19 Aug 2019 14:01:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 19 Aug 2019 14:01:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=wd6atkGWKBfQ+EbQ/bxiecU6vKlhXQOFNKasaABLN
 ME=; b=DHlJTYT3NX9+pCgu/36nDmD3Rd/EnytrGMBQ3+RR1utLL3R38AvDDRO9f
 L3A+HST/RBAHdM8/JEgMKz7rOdeKzin39hhLJGgAODt9RM6xVmLKcO/jBcuf+LOA
 wjTqIcDmxK3qHpyYSWqhMCGcb2fH3VhI0b57XAvI+uIcIWpkXW34Xkn11+cVYc48
 lp4msqf28SyFC1jIepuiBbFILw5QUctNoWViEXMoAejrnsNteNOxInMtrW8KPuYG
 7E3Z71g2NrDH8T5RCEYUVUuZoO4/zyLDXz5qBYc63mi8IWymDYvpakfGNAhvUFOa
 cP/ppoldws9FobSYY6TnBMwsUsdmw==
X-ME-Sender: <xms:9ONaXVaO006w-fi_OmzfOn5dHnDhAMmtlnSD-FqUxdHRBtnNUA-6xw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudefledguddvudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpefoihgt
 hhgrlhgpmfhofigrlhgtiiihkhcuoehmkhhofiesihhnvhhishhisghlvghthhhinhhgsh
 hlrggsrdgtohhmqeenucffohhmrghinhepthhrrghmphholhhinhgvrdhssgdpgigvnhdr
 ohhrghenucfkphepkeelrdeigedrudelrdegjeenucfrrghrrghmpehmrghilhhfrhhomh
 epmhhkohifsehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhenucevlhhushht
 vghrufhiiigvpedt
X-ME-Proxy: <xmx:9ONaXYNmjoHZjkpWLW3xRRz7qa4XNHbBGRcNU5U7s0LQTn2EFz7kdg>
 <xmx:9ONaXdeVBRQX8dW1rBUuJffYCqM7mk4M4kmUmCb-Ypa96rhPaqVl0A>
 <xmx:9ONaXWESMJUinNpRW3yEQZkX4Y0urGA0Ytb6pukCB_tED9IacObaWQ>
 <xmx:9eNaXf5UoL8qoG33K_28QYTIZ4Zpw0mIZ5hx_pY4EkP_l00sRvL-yg>
Received: from [10.137.0.17] (89-64-19-47.dynamic.chello.pl [89.64.19.47])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6B19A8005A;
 Mon, 19 Aug 2019 14:01:22 -0400 (EDT)
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <1c917278029b206317a2155fb78e63ed14b621e5.1566176127.git.mkow@invisiblethingslab.com>
 <93632bab-f393-0c9c-94a8-dc18a06d873e@citrix.com>
 <9cb4d3b4-baab-0fe0-8876-51a7633313d7@invisiblethingslab.com>
 <9d722a06-2585-82b8-9b04-18240526eaf6@citrix.com>
 <1bbeb58d-c5d8-3da1-47c0-bd54b40afda4@invisiblethingslab.com>
 <5e31c8e1-878a-3302-1b29-022f56f95b3d@citrix.com>
From: =?UTF-8?Q?Micha=c5=82_Kowalczyk?= <mkow@invisiblethingslab.com>
Openpgp: preference=signencrypt
Message-ID: <96d43626-64d6-8e50-ef63-0cd396a3ee40@invisiblethingslab.com>
Date: Mon, 19 Aug 2019 20:01:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5e31c8e1-878a-3302-1b29-022f56f95b3d@citrix.com>
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

T24gOC8xOS8xOSA3OjI4IFBNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IE9uIDE5LzA4LzIwMTkg
MTQ6NTYsIE1pY2hhxYIgS293YWxjenlrIHdyb3RlOgo+PiBPbiA4LzE5LzE5IDM6NTIgUE0sIEFu
ZHJldyBDb29wZXIgd3JvdGU6Cj4+PiBPbiAxOS8wOC8yMDE5IDE0OjUwLCBNaWNoYcWCIEtvd2Fs
Y3p5ayB3cm90ZToKPj4+PiBPbiA4LzE5LzE5IDExOjA0IEFNLCBBbmRyZXcgQ29vcGVyIHdyb3Rl
Ogo+Pj4+PiBPbiAxOS8wOC8yMDE5IDAzOjIzLCBNaWNoYcWCIEtvd2FsY3p5ayB3cm90ZToKPj4+
Pj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvYm9vdC90cmFtcG9saW5lLlMgYi94ZW4vYXJj
aC94ODYvYm9vdC90cmFtcG9saW5lLlMKPj4+Pj4+IGluZGV4IDdjNmEyMzI4ZDIuLmZjYWEzZWVh
ZjEgMTAwNjQ0Cj4+Pj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvYm9vdC90cmFtcG9saW5lLlMKPj4+
Pj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9ib290L3RyYW1wb2xpbmUuUwo+Pj4+Pj4gQEAgLTg1LDcg
Kzg1LDcgQEAgdHJhbXBvbGluZV9nZHQ6Cj4+Pj4+PiAgICAgICAgICAubG9uZyAgIHRyYW1wb2xp
bmVfZ2R0ICsgQk9PVF9QU0VVRE9STV9EUyArIDIgLSAuCj4+Pj4+PiAgICAgICAgICAucG9wc2Vj
dGlvbgo+Pj4+Pj4gIAo+Pj4+Pj4gLUdMT0JBTCh0cmFtcG9saW5lX21pc2NfZW5hYmxlX29mZikK
Pj4+Pj4+ICtHTE9CQUwobWlzY19lbmFibGVfb2ZmKQo+Pj4+PiBUaGUgb3ZlcmFsbCBjaGFuZ2Ug
aXMgZmluZSwgYnV0IHdoeSBoYXZlIHlvdSByZW5hbWVkIHRoaXMgdmFyaWFibGU/Cj4+Pj4gVGhl
IG9sZCBuYW1lIGhhZCAidHJhbXBvbGluZV8iIHByZWZpeCBiZWNhdXNlIHRoZSBvbmx5IHBsYWNl
IHdoZXJlIGl0Cj4+Pj4gd2FzIHVzZWQgd2FzIHRyYW1wb2xpbmVfcHJvdG1vZGVfZW50cnkgaW4g
YXJjaC94ODYvYm9vdC90cmFtcG9saW5lLlMuCj4+Pj4gTm93IGl0J3MgYWxzbyB1c2VkIGluIHRo
ZSB3YWtldXAgY29kZSwgc28gSSByZW1vdmVkIHRoZSBwcmVmaXggd2hpY2gKPj4+PiBjb3VsZCBi
ZSAoSU1PKSBtaXNsZWFkaW5nLgo+Pj4+PiBXaXRob3V0IHRoZSByZW5hbWUsIHRoZSBwYXRjaCB3
b3VsZCBiZSBqdXN0IHRoZSBzaW5nbGUgaHVuayBpbiB3YWtldXAuUwo+Pj4+PiBhbmQgdGhlcmVm
b3JlIGVhc2llciB0byBiYWNrcG9ydC4KPj4+PiBUcnVlLiBBbnl3YXksIHRoZSBkZWNpc2lvbiBp
cyBvbiB5b3VyIHNpZGUsIEkgY2FuIGxlYXZlIHRoZSBvbGQgbmFtZSBpZgo+Pj4+IHlvdSBwcmVm
ZXIuCj4+PiBUaGUgdHJhbXBvbGluZV8gcHJlZml4IGluZGljYXRlcyB3aGVyZSB0aGUgZGF0YSBs
aXZlcywgd2hpY2ggaXMgaW4gdGhlCj4+PiAxNiBiaXQgdHJhbXBvbGluZSB3aGljaCBjb250YWlu
cyBib3RoIHRoZSBBUCBib290IHBhdGgsIGFuZCB3YWtldXAgcGF0aC4KPj4gQWgsIGlmIHRoaXMg
aXMgdGhlIGNvbnZlbnRpb24geW91IHVzZSB0aGVuIHdlIHNob3VsZCBsZWF2ZSB0aGUgb2xkIG5h
bWUuCj4+PiBJZiB5b3UncmUgaGFwcHkgd2l0aCB0aGlzLCBJIGNhbiBhZGp1c3Qgb24gY29tbWl0
IHRvIGF2b2lkIHlvdSBzZW5kaW5nIGEKPj4+IHNlY29uZCB0aW1lLgo+PiBXb3VsZCBiZSBncmVh
dCwgdGhhbmtzIQo+IERvbmUuCj4KPiBodHRwczovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9
eGVuLmdpdDthPWNvbW1pdGRpZmY7aD1jM2NmYTViMzA4NGQ3MWJjY2Q4MzYwZDA0NGJlYTgxMzY4
OGI1ODdjCkxvb2tzIGdvb2QuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
