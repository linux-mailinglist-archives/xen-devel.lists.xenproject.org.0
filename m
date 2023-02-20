Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC3269CF3D
	for <lists+xen-devel@lfdr.de>; Mon, 20 Feb 2023 15:22:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498170.768994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pU72p-0004LE-Sq; Mon, 20 Feb 2023 14:21:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498170.768994; Mon, 20 Feb 2023 14:21:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pU72p-0004IS-PV; Mon, 20 Feb 2023 14:21:31 +0000
Received: by outflank-mailman (input) for mailman id 498170;
 Mon, 20 Feb 2023 14:21:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HMXb=6Q=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pU72o-0004IM-Cx
 for xen-devel@lists.xenproject.org; Mon, 20 Feb 2023 14:21:30 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dca9f428-b129-11ed-93b5-47a8fe42b414;
 Mon, 20 Feb 2023 15:21:27 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E81252262C;
 Mon, 20 Feb 2023 14:21:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C2235139DB;
 Mon, 20 Feb 2023 14:21:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id S30YLuaB82OkLwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 20 Feb 2023 14:21:26 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: dca9f428-b129-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1676902886; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7u8x3HiPTwZYBOR7Qt8Ju6d82l5CbSu67vkoya7pNEo=;
	b=YrnXdD1g0hkIsiasG/kkCuTDn3TZwI/By+WbmboEiQwjkE7CjZTEEEBoWaVtAvfkN21D17
	YvMvJ6kJCmPHTCGW4iFyxfQogr5iTaYh/hGk1GM8ALti27LBLgQqP0f4xBO4oieYzK6f2x
	+4rOJ0YLVeV45A6nwSJDp6hOvQbEX4c=
Message-ID: <32a517cf-4448-2208-4877-83c7a7531635@suse.com>
Date: Mon, 20 Feb 2023 15:21:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 01/13] tools/xenstore: don't allow creating too many
 nodes in a transaction
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230120100028.11142-1-jgross@suse.com>
 <20230120100028.11142-2-jgross@suse.com>
 <2131198f-f54b-2c38-8104-1c8b63e9990c@xen.org>
 <c203062e-fd76-3aa1-8014-bf7d13eae1aa@suse.com>
 <bd355c4c-b3a9-ac79-8522-5ff227ae26ab@xen.org>
 <adae39fe-1b72-e4ac-eb17-8bbfb28011f2@suse.com>
 <a0431ac1-4d1a-23c4-cb31-1d9d8812fc94@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <a0431ac1-4d1a-23c4-cb31-1d9d8812fc94@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------5a9l0MQz3vB00ig1qfR1tDvM"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------5a9l0MQz3vB00ig1qfR1tDvM
Content-Type: multipart/mixed; boundary="------------m3ilG02e0mcemr2SfDmh4ULC";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <32a517cf-4448-2208-4877-83c7a7531635@suse.com>
Subject: Re: [PATCH v2 01/13] tools/xenstore: don't allow creating too many
 nodes in a transaction
References: <20230120100028.11142-1-jgross@suse.com>
 <20230120100028.11142-2-jgross@suse.com>
 <2131198f-f54b-2c38-8104-1c8b63e9990c@xen.org>
 <c203062e-fd76-3aa1-8014-bf7d13eae1aa@suse.com>
 <bd355c4c-b3a9-ac79-8522-5ff227ae26ab@xen.org>
 <adae39fe-1b72-e4ac-eb17-8bbfb28011f2@suse.com>
 <a0431ac1-4d1a-23c4-cb31-1d9d8812fc94@xen.org>
In-Reply-To: <a0431ac1-4d1a-23c4-cb31-1d9d8812fc94@xen.org>

--------------m3ilG02e0mcemr2SfDmh4ULC
Content-Type: multipart/mixed; boundary="------------mPEpceee8hAd0sakgU0yjHNz"

--------------mPEpceee8hAd0sakgU0yjHNz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjAuMDIuMjMgMTU6MTUsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gT24gMjAvMDIvMjAy
MyAxMzo0OSwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+IE9uIDIwLjAyLjIzIDEzOjA3LCBK
dWxpZW4gR3JhbGwgd3JvdGU6DQo+Pj4gSGkgSnVlcmdlbiwNCj4+Pg0KPj4+IE9uIDIwLzAy
LzIwMjMgMTE6MDQsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+Pj4+IE9uIDIwLjAyLjIzIDEw
OjQ2LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+Pj4+PiBIaSBKdWVyZ2VuLA0KPj4+Pj4NCj4+
Pj4+IE9uIDIwLzAxLzIwMjMgMTA6MDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+Pj4+Pj4g
VGhlIGFjY291bnRpbmcgZm9yIHRoZSBudW1iZXIgb2Ygbm9kZXMgb2YgYSBkb21haW4gaW4g
YW4gYWN0aXZlDQo+Pj4+Pj4gdHJhbnNhY3Rpb24gaXMgbm90IHdvcmtpbmcgY29ycmVjdGx5
LCBhcyBpdCBhbGxvd3MgdG8gY3JlYXRlIGFyYml0cmFyeQ0KPj4+Pj4+IG51bWJlciBvZiBu
b2Rlcy4gVGhlIHRyYW5zYWN0aW9uIHdpbGwgZmluYWxseSBmYWlsIGR1ZSB0byBleGNlZWRp
bmcNCj4+Pj4+PiB0aGUgbnVtYmVyIG9mIG5vZGVzIHF1b3RhLCBidXQgYmVmb3JlIGNsb3Np
bmcgdGhlIHRyYW5zYWN0aW9uIGFuDQo+Pj4+Pj4gdW5wcml2aWxlZ2VkIGd1ZXN0IGNvdWxk
IGNhdXNlIFhlbnN0b3JlIHRvIHVzZSBhIGxvdCBvZiBtZW1vcnkuDQo+Pj4+Pg0KPj4+Pj4g
SSBrbm93IEkgc2FpZCBJIHdvdWxkIGRlbGF5IG15IGRlY2lzaW9uIG9uIHRoaXMgcGF0Y2gu
IEhvd2V2ZXIsIEkgd2FzIHN0aWxsIA0KPj4+Pj4gZXhwZWN0aW5nIHRoZSBjb21taXQgbWVz
c2FnZSB0byBiZSB1cGRhdGVkIGJhc2VkIG9uIG91ciBwcmV2aW91cyBkaXNjdXNzaW9uLg0K
Pj4+Pg0KPj4+PiBBcyBzYWlkIGJlZm9yZSwgSSB3YXMgd2FpdGluZyBvbiB0aGUgc2V0dGxl
bWVudCBvZiBvdXIgZGlzY3Vzc2lvbiBiZWZvcmUNCj4+Pj4gZG9pbmcgdGhlIHVwZGF0ZS4N
Cj4+Pg0KPj4+IFRoaXMgaXMgbm90IGEgdmVyeSBnb29kIHByYWN0aWNlIHRvIHJlc2VuZCBh
IHBhdGNoIHdpdGhvdXQgcmVjb3JkaW5nIHRoZSANCj4+PiBkaXNhZ3JlZW1lbnQgYmVjYXVz
ZSBuZXcgcmV2aWV3ZXJzIG1heSBub3QgYmUgYXdhcmUgb2YgdGhlIGRpc2FncmVlbWVudCBh
bmQgDQo+Pj4gdGhpcyBjb3VsZCBlbmQgdXAgdG8gYmUgY29tbWl0dGVkIGJ5IG1pc3Rha2Uu
Li4NCj4+DQo+PiBZb3Ugc2FpZCB5b3Ugd2FudGVkIHRvIGxvb2sgaW50byB0aGlzIHBhdGNo
IGluIGRldGFpbCBhZnRlciB0aGUgcHJldmlvdXMNCj4+IHNlcmllcywgc28gSSBtb3ZlIGl0
IGludG8gdGhpcyBzZXJpZXMuIFRoZSB3b3JkaW5nIHVwZGF0ZSB3b3VsZCBzdHJvbmdseQ0K
Pj4gZGVwZW5kIG9uIHRoZSBvdXRjb21lIG9mIHRoZSBkaXNjdXNzaW9uIElNTywgc28gSSBk
aWRuJ3QgZG8gaXQgeWV0Lg0KPiBUaGlzIGNvdWxkIGhhdmUgYmVlbiBtZW50aW9uZWQgYWZ0
ZXIgLS0tLiBUaGlzIGNvdWxkIGFsbG93IHBlb3BsZSB0byB1bmRlcnN0YW5kIA0KPiB0aGUg
Y29uY2VybiBhbmQgdGhlbiBwYXJ0aWNpcGF0ZS4NCg0KV2lsbCBkbyBzbyBpbiBmdXR1cmUu
DQoNCj4gDQo+Pg0KPj4+Pj4gQWxzbyB0aGlua2luZyBtb3JlIGFib3V0IGl0LCAiVGhlIHRy
YW5zYWN0aW9uIHdpbGwgZmluYWxseSBmYWlsIGR1ZSB0byANCj4+Pj4+IGV4Y2VlZGluZyB0
aGUgbnVtYmVyIG9mIG5vZGVzIHF1b3RhIiBtYXkgbm90IGJlIHRydWUgZm9yIGEgY291cGxl
IG9mIHJlYXNvbnM6DQo+Pj4+PiDCoMKgIDEpIFRoZSB0cmFuc2FjdGlvbiBtYXkgcmVtb3Zl
ZCBhIG5vZGUgYWZ0ZXJ3YXJkcy4NCj4+Pj4NCj4+Pj4gWWVzLCBhbmQ/IEp1c3QgYmVjYXVz
ZSBpdCBpcyBhIHRyYW5zYWN0aW9uLCB0aGlzIGlzIHN0aWxsIGEgdmlvbGF0aW9uIG9mDQo+
Pj4+IHRoZSBxdW90YS4gRXZlbiBvdXRzaWRlIGEgdHJhbnNhY3Rpb24geW91IGNvdWxkIHVz
ZSB0aGUgc2FtZSByZWFzb25pbmcsDQo+Pj4+IGJ1dCB5b3UgZG9uJ3QgKHdoaWNoIGlzIGNv
cnJlY3QsIG9mIGNvdXJzZSkuDQo+Pj4NCj4+PiBJIGNhbiB1bmRlcnN0YW5kIHlvdXIgcG9p
bnQuIEhvd2V2ZXIsIHRvIG1lLCB0aGUgZ29hbCBvZiB0aGUgdHJhbnNhY3Rpb24gaXMgDQo+
Pj4gdG8gY29tbWl0IGV2ZXJ5dGhpbmcgaW4gb25lIGdvIGF0IHRoZSBlbmQuIFNvIHRoZSB2
aW9sYXRpb25zIGluIHRoZSBtaWRkbGUgDQo+Pj4gc2hvdWxkIG5vdCBtYXR0ZXIuDQo+Pg0K
Pj4gT2YgY291cnNlIHRoZXkgc2hvdWxkLg0KPj4NCj4+IFdlIHdvdWxkbid0IGFsbG93IHRv
IHdyaXRlIG92ZXItc2l6ZWQgbm9kZXMsIGV2ZW4gaWYgdGhleSBjb3VsZCBiZSByZXdyaXR0
ZW4gaW4NCj4+IHRoZSBzYW1lIHRyYW5zYWN0aW9uIHdpdGggYSBzbWFsbGVyIHNpemUuDQo+
IA0KPiBJIHZpZXcgdGhlIHR3byBkaWZmZXJlbnQuDQo+IA0KPj4gV2Ugd291bGRuJ3QgYWxs
b3cgdG8gY3JlYXRlIG5vZGVzIHdoaWNoIHdvdWxkIHZpb2xhdGUgb3ZlcmFsbCBtZW1vcnkN
Cj4+IGNvbnN1bXB0aW9uLg0KPj4NCj4+IFdlIHdvdWxkbid0IGFsbG93IG5vZGVzIHdpdGgg
bW9yZSBwZXJtaXNzaW9uIGVudHJpZXMgdGhhbiBhbGxvd2VkLCBldmVuIGlmIHRoZXkNCj4+
IGNvdWxkIGJlIHJlZHVjZWQgaW4gdGhlIHNhbWUgdHJhbnNhY3Rpb24gYWdhaW4uDQo+Pg0K
Pj4gSSBkb24ndCBzZWUgd2h5IHRoZSBudW1iZXIgb2Ygbm9kZXMgc2hvdWxkbid0IGJlIHRh
a2VuIGludG8gYWNjb3VudC4NCj4+DQo+Pj4gRnVydGhlcm1vcmUsIEkgd291bGQgZXhwZWN0
IGEgdHJhbnNhY3Rpb24gdG8gd29yayBvbiBhIHNuYXBzaG90IG9mIHRoZSANCj4+PiBzeXN0
ZW0uIFNvIGl0IGZlZWxzIHJlYWxseSBzdHJhbmdlIHRvIG1lIHRoYXQgd2UgYXJlIGNvbnN0
YW50bHkgY2hlY2tpbmcgdGhlIA0KPj4+IHF1b3RhIHdpdGggdGhlIHVwZGF0ZWQgdmFsdWVz
IHJhdGhlciB0aGFuIHRoZSBpbml0aWFsIG9uZS4NCj4+DQo+PiBZb3UgYXJlIGF3YXJlIHRo
YXQgdGhlIGNvZGUgd2l0aG91dCB0aGlzIHBhdGNoIGlzIGp1c3QgbmVnbGVjdGluZyB0aGUg
bm9kZXMNCj4+IGNyZWF0ZWQgaW4gdGhlIHRyYW5zYWN0aW9uPyBJdCBqdXN0IGlzIHVzaW5n
IHRoZSBjdXJyZW50IG51bWJlciBvZiBub2Rlcw0KPj4gb3V0c2lkZSBhbnkgdHJhbnNhY3Rp
b24gZm9yIHF1b3RhIGNoZWNrLg0KPiANCj4gQXJlIHlvdSByZWZlcnJpbmcgdG8gdGhlIHF1
b3RhIGNoZWNrIHdpdGhpbiB0aGUgdHJhbnNhY3Rpb24/DQoNCkknbSByZWZlcnJpbmcgdG8g
dGhlIHF1b3RhIGNoZWNrIGluIGNyZWF0ZV9ub2RlKCkuDQoNCj4gDQo+PiBTbyBJIGNvdWxk
IGVhc2lseSBjcmVhdGUgYSBzY2VuYXJpbw0KPj4gd2hlcmUgbXkgbmV3IGNvZGUgd2lsbCBz
dWNjZWVkLCBidXQgdGhlIGN1cnJlbnQgb25lIGlzIGZhaWxpbmc6DQo+PiBBc3N1bWUgbm9k
ZSBxdW90YSBpcyAxMDAwLCBhbmQgYXQgc3RhcnQgb2YgdGhlIHRyYW5zYWN0aW9uIHRoZSBn
dWVzdCBpcyBvd25pbmcNCj4+IDk5OSBub2Rlcy4gSW4gdGhlIHRyYW5zYWN0aW9uIHRoZSBn
dWVzdCBpcyBkZWxldGluZyAxMCBub2RlcywgdGhlbiBkb20wIGlzDQo+PiBjcmVhdGluZyA1
IGFkZGl0aW9uYWwgbm9kZXMgb3duZWQgYnkgdGhlIGd1ZXN0LiBUaGUgY2VudHJhbCBub2Rl
IGNvdW50ZXIgaXMgbm93DQo+PiAxMDA0IChvdmVyIHF1b3RhKSwgd2hpbGUgdGhlIGluLXRy
YW5zYWN0aW9uIGNvdW50IGlzIDk5NC4NCj4+IEluIHRoZSB0cmFuc2FjdGlvbiB0aGUNCj4+
IGd1ZXN0IGNhbiBub3cgaGFwcGlseSBjcmVhdGUgYSBuZXcgbm9kZSAoIzk5NSkgd2l0aCBt
eSBwYXRjaCwgYnV0IHdpbGwgZmFpbCB0bw0KPj4gZG8gc28gd2l0aG91dCAoaXQgc2VlcyB0
aGUgMTAwNCBkdWUgdG8gdGhlIHRyYW5zYWN0aW9uIGNvdW50IGJlaW5nIGlnbm9yZWQpLg0K
PiANCj4gVGhpcyBkb2Vzbid0IHNvdW5kIGNvcnJlY3QuIFRvIGRvIHlvdSBoYXZlIGFueSB0
ZXN0IEkgY291bGQgdXNlIHRvIGNoZWNrIHRoZSANCj4gYmVoYXZpb3I/DQoNClRyeSBpdDoN
Cg0KLSBjcmVhdGUgbm9kZXMgaW4gYSBndWVzdCB1bnRpbCB5b3UgaGl0IHRoZSBFTk9TUEMg
cmV0dXJuIGNvZGUgZHVlIHRvIHRvbyBtYW55DQogICBub2Rlcw0KLSBzdGFydCBhIHRyYW5z
YWN0aW9uIGRlbGV0aW5nIHNvbWUgbm9kZXMgYW5kIHRoZW4gdHJ5aW5nIHRvIGNyZWF0ZSBh
bm90aGVyDQogICBvbmUsIHdoaWNoIGZhaWwgZmFpbCB3aXRoIEVOT1NQQy4NCg0KDQpKdWVy
Z2VuDQo=
--------------mPEpceee8hAd0sakgU0yjHNz
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------mPEpceee8hAd0sakgU0yjHNz--

--------------m3ilG02e0mcemr2SfDmh4ULC--

--------------5a9l0MQz3vB00ig1qfR1tDvM
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmPzgeYFAwAAAAAACgkQsN6d1ii/Ey8D
lwf/XhHvC2Kk/jVLDWM8T3mIQyZj6+E0p7IeXHiLDElzOjytcsF8VUbqJcuN0OqD5hdfICikNWO7
vDWBh28X5pRQ3KMqQn6UheZCx1n0OQMWPKDdO0ntUgXhW/Ur0VDyHLWWZD/lEd7gEXQ3dxmbRj86
nLht1zfhLyAL2quUyhtGF6P1cJHgMKHamQzskW0OfUZtZCM1dwHUdIwLSvZhFKi2ycTwEQ3tMKKB
3e55QMr+18ubSmaC4iB5nkTDYJir0cSI0GWC4MluiLe86MI7gCyGfL0s9vBJTCDgAtgd42L1QjYy
BAf4FnzHwf98iowCnnMPc30LQw6raylKtLYSLb8h3w==
=rPiS
-----END PGP SIGNATURE-----

--------------5a9l0MQz3vB00ig1qfR1tDvM--

