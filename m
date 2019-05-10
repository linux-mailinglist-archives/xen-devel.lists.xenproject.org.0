Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C741A003
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2019 17:20:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hP7Gx-0007AB-MF; Fri, 10 May 2019 15:17:19 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wrlK=TK=protonmail.com=mathieu.tarral@srs-us1.protection.inumbo.net>)
 id 1hP7Gv-0007A6-Up
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 15:17:18 +0000
X-Inumbo-ID: b138208e-7336-11e9-8980-bc764e045a96
Received: from mail2.protonmail.ch (unknown [185.70.40.22])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b138208e-7336-11e9-8980-bc764e045a96;
 Fri, 10 May 2019 15:17:15 +0000 (UTC)
Date: Fri, 10 May 2019 15:17:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=default; t=1557501434;
 bh=iPMatFRTHnqwxyTWVT7fahhXH4KnLB5cBm1qQ2hparE=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=g62zBkiD8RQYjee8Jx517sFBSMUmBOqdZZ7TXc2qeeIibnR5e9n77O4kTeQNRGhTw
 s44o3ADFQwbNNcAQpDVehXmcIjicbrTWFXM6dJ+nx03a56DOHJM9v0agaDOoOyNlol
 VmUVxuxiAIoSaoI6F5irtaNqRZejPcBBz0CTzp1E=
To: Andrew Cooper <andrew.cooper3@citrix.com>
From: Mathieu Tarral <mathieu.tarral@protonmail.com>
Message-ID: <rQKAjmE5sqmoHfveLrCC3tRz7edgAIkDUG5CRgmBhF975OXX_8ZdIsCFturwHzr04jeYiq5MPE5gHG3SeltMz5ZnrIs0XcO0QO_OXeBGhTg=@protonmail.com>
In-Reply-To: <4f34ed81-8993-2e5d-9aea-89a6e2d98b44@citrix.com>
References: <f3zRvkN8JOfpv5k6jz7TbWXz-sso4q6CGB-3S05mSco8SuDy0BoN5z5_Lj_-Xnto1FPMCkhE89trkq-_f6itwRZ5F4NI9MKrcqZk8cdT45A=@protonmail.com>
 <76bd924a-34b1-eb7c-d3be-6c33aa7729fc@citrix.com>
 <WL45-Mjyf7to-l_u4XAT3M46R6YcAECvEwl6SDzOWeLE_SOQUyF26Vj2cu0mScD47fS95OaBAWDddX7DL7yujvl03YffFRDoqrpRcFDSnxA=@protonmail.com>
 <oSx3iO5YqwrWedfgCT8yEj4jGrzisHnNA6d9XQIKAJJAOhr6TPANrqVHf6s56L8_WBgLtVMJv37Cypbr2emtg0ZKb25HdHo91eM1J1fVJHo=@protonmail.com>
 <4f34ed81-8993-2e5d-9aea-89a6e2d98b44@citrix.com>
Feedback-ID: 7ARND6YmrAEqSXE0j3TLm6ZqYiFFaDDEkO_KW8fTUEW0kYwGM1KEsuPxEPVWH5YuEnR43INtqwIKH-usvnxVQQ==:Ext:ProtonMail
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM autolearn=ham
 autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.protonmail.ch
Subject: Re: [Xen-devel] [VMI] Possible race-condition in altp2m APIs
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
Reply-To: Mathieu Tarral <mathieu.tarral@protonmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Tamas K Lengyel <tamas@tklengyel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TGUgamV1ZGksIG1haSA5LCAyMDE5IDY6NDIgUE0sIEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+IGEgw6ljcml0wqA6Cj4gVGhlcmVmb3JlLCB0aGUgY29uY2x1c2lvbiB0
byBkcmF3IGlzIHRoYXQgaXQgaXMgYSBsb2dpY2FsIGJ1ZyBzb21ld2hlcmUuCj4KPiBGaXJzdCBv
ZiBhbGwgLSBlbnN1cmUgeW91IGFyZSB1c2luZyB1cC10by1kYXRlIG1pY3JvY29kZS7CoCBUaGUg
bnVtYmVyIG9mCj4gZXJyYXRhIHdoaWNoIGhhdmUgYmVlbiBkaXNjb3ZlcmVkIGJ5IHBlb3BsZSBh
c3NvY2lhdGVkIHdpdGggdGhlIFhlbgo+IGNvbW11bml0eSBpcyBsYXJnZS4KPgo+IFRoZSBtaWNy
b2NvZGUgaXMgYXZhaWxhYmxlIGZyb20KPiBodHRwczovL2dpdGh1Yi5jb20vaW50ZWwvSW50ZWwt
TGludXgtUHJvY2Vzc29yLU1pY3JvY29kZS1EYXRhLUZpbGVzLyBhbmQKPiBodHRwczovL2FuZHJl
d2Nvb3AteGVuLnJlYWR0aGVkb2NzLmlvL2VuL2xhdGVzdC9hZG1pbi1ndWlkZS9taWNyb2NvZGUt
bG9hZGluZy5odG1sCj4gaXMgc29tZSBkb2N1bWVudGF0aW9uIEkgcHJlcGFyZWQgZWFybGllci4K
SSB1cGRhdGVkIG15IG1pY3JvY29kZSBmb2xsb3dpbmcgeW91ciBpbnN0cnVjdGlvbnMuCkkgaW5z
dGFsbGVkIHRoZSBpbnRlbC1taWNyb2NvZGUgcGFja2FnZSBvbiBEZWJpYW4gc3RyZXRjaCwgYW5k
IGFkZGVkIHVjb2RlPXNjYW4gdG8gbXkgWGVuIGJvb3QgY29tbWFuZCBsaW5lLgoKTG9va2luZyBh
dCB4bCBkbWVzZyBiZWZvcmUgdGhlIHVwZGF0ZSwgSSBub3RpY2VkIEkgaGFkIGEgYnVnIHRoYXQg
c2hvdWxkIGJlIGZpeCBieSBhIG1pY3JvY29kZSB1cGRhdGU6CiJ0c2NfZGVhZGxpbmUgZGlzYWJs
ZWQgZHVlIHRvIGVycmF0YS4uLiIKVGhpcyBtZXNzYWdlIGRpc2FwcGVhcmVkIHdpdGggdGhlIG1p
Y3JvY29kZSBjb2RlIHVwZGF0ZSwgd2hpY2ggaXMgYXBwbGllZCBhdCBib290IGFuZCBjYW4gYmUK
c2VlbiBpbiB4bCBkbWVzZy4KVGhlIG1pY3JvY29kZSB2ZXJzaW9uIGlzIG5vdyAweDI1ICgyMDE4
LTA0LTAyKQoKQW5kIGlmIEkgdXNlIGl1Y29kZS10b29sIG9uIHRoZSBpbnRlbC11Y29kZSBkaXJl
Y3RvcnksIGZyb20gdGhlIHJlcG8geW91ciBwcm92aWRlZCwgdGhlIG9ubHkKbWljcm9jb2RlIHRo
YXQgbWF0Y2hlcyBoYXMgdGhlIHNhbWUgcmVsZWFzZSBkYXRlOgoKJCBpdWNvZGUtdG9vbCAtUyBJ
bnRlbC1MaW51eC1Qcm9jZXNzb3ItTWljcm9jb2RlLURhdGEtRmlsZXMvaW50ZWwtdWNvZGUvIC1s
CnNlbGVjdGVkIG1pY3JvY29kZXM6CiAgMDUzLzAwMTogc2lnIDB4MDAwMzA2YzMsIHBmX21hc2sg
MHgzMiwgMjAxOC0wNC0wMiwgcmV2IDB4MDAyNSwgc2l6ZSAyMzU1MgoKClRoZSBidWcgaXMgc3Rp
bGwgaGVyZSwgc28gd2UgY2FuIGV4Y2x1ZGUgYSBtaWNyb2NvZGUgaXNzdWUuCgpNYXRoaWV1CgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
