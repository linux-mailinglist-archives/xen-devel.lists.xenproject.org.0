Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4914D5339C7
	for <lists+xen-devel@lfdr.de>; Wed, 25 May 2022 11:17:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337075.561572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntn9E-0001sr-7u; Wed, 25 May 2022 09:17:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337075.561572; Wed, 25 May 2022 09:17:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntn9E-0001qU-4W; Wed, 25 May 2022 09:17:44 +0000
Received: by outflank-mailman (input) for mailman id 337075;
 Wed, 25 May 2022 09:17:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LNZA=WB=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ntn9C-0001qO-6Q
 for xen-devel@lists.xenproject.org; Wed, 25 May 2022 09:17:42 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 869d4e42-dc0b-11ec-837f-e5687231ffcc;
 Wed, 25 May 2022 11:17:40 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1581F219C5;
 Wed, 25 May 2022 09:17:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B46F013487;
 Wed, 25 May 2022 09:17:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yGUQKjP0jWKyTQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 25 May 2022 09:17:39 +0000
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
X-Inumbo-ID: 869d4e42-dc0b-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1653470260; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SYs6622U9AXr3OUSE/634zqYOcUn33HnjDgHhQkQ6v4=;
	b=qkbxDJH2xCbUHXkTx/XvmY2XJ3MxXzJxWjFRI6NWqZJJfjzYPAPQfielzsaqGtKGpegLd7
	maY/RhRsVmrAh6MHRsRgwSCqoeK9UnHfD8CuDrSuk5TNUQMBvowrfsg7ztiabtVh6sT1m/
	MR1j2/pkZ7WNfpgH6D1Cw1X2q7QC0o8=
Message-ID: <36489ed0-d2ec-92bc-6a15-b423118f8af2@suse.com>
Date: Wed, 25 May 2022 11:17:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jennifer Herbert <jennifer.herbert@citrix.com>,
 David Vrabel <david.vrabel@citrix.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <Yo0LwmVUDSBZb44K@itl-email>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen/gntdev: Avoid blocking in unmap_grant_pages()
In-Reply-To: <Yo0LwmVUDSBZb44K@itl-email>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------YIISMi4lxaTHiovuYVDaIN07"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------YIISMi4lxaTHiovuYVDaIN07
Content-Type: multipart/mixed; boundary="------------aX5RY1OxQNbipAK57nTzcAk0";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jennifer Herbert <jennifer.herbert@citrix.com>,
 David Vrabel <david.vrabel@citrix.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Message-ID: <36489ed0-d2ec-92bc-6a15-b423118f8af2@suse.com>
Subject: Re: [PATCH] xen/gntdev: Avoid blocking in unmap_grant_pages()
References: <Yo0LwmVUDSBZb44K@itl-email>
In-Reply-To: <Yo0LwmVUDSBZb44K@itl-email>

--------------aX5RY1OxQNbipAK57nTzcAk0
Content-Type: multipart/mixed; boundary="------------D8xMTnyA4O1BHY5gfVG0PJz6"

--------------D8xMTnyA4O1BHY5gfVG0PJz6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMDUuMjIgMTg6NDUsIERlbWkgTWFyaWUgT2Jlbm91ciB3cm90ZToNCj4gdW5tYXBf
Z3JhbnRfcGFnZXMoKSBjdXJyZW50bHkgd2FpdHMgZm9yIHRoZSBwYWdlcyB0byBubyBsb25n
ZXIgYmUgdXNlZC4NCj4gSW4gaHR0cHM6Ly9naXRodWIuY29tL1F1YmVzT1MvcXViZXMtaXNz
dWVzL2lzc3Vlcy83NDgxLCB0aGlzIGxlYWQgdG8gYQ0KPiBkZWFkbG9jayBhZ2FpbnN0IGk5
MTU6IGk5MTUgd2FzIHdhaXRpbmcgZm9yIGdudGRldidzIE1NVSBub3RpZmllciB0bw0KPiBm
aW5pc2gsIHdoaWxlIGdudGRldiB3YXMgd2FpdGluZyBmb3IgaTkxNSB0byBmcmVlIGl0cyBw
YWdlcy4gIEkgYWxzbw0KPiBiZWxpZXZlIHRoaXMgaXMgcmVzcG9uc2libGUgZm9yIHZhcmlv
dXMgZGVhZGxvY2tzIEkgaGF2ZSBleHBlcmllbmNlZCBpbg0KPiB0aGUgcGFzdC4NCj4gDQo+
IEF2b2lkIHRoZXNlIHByb2JsZW1zIGJ5IG1ha2luZyB1bm1hcF9ncmFudF9wYWdlcyBhc3lu
Yy4gIFRoaXMgcmVxdWlyZXMNCj4gbWFraW5nIGl0IHJldHVybiB2b2lkLCBhcyBhbnkgZXJy
b3JzIHdpbGwgbm90IGJlIGF2YWlsYWJsZSB3aGVuIHRoZQ0KPiBmdW5jdGlvbiByZXR1cm5z
LiAgRm9ydHVuYXRlbHksIHRoZSBvbmx5IHVzZSBvZiB0aGUgcmV0dXJuIHZhbHVlIGlzIGEN
Cj4gV0FSTl9PTigpLiAgUmVwbGFjZSB0aGlzIHdpdGggV0FSTl9PTigpcyB3aGVyZSBlcnJv
cnMgYXJlIGRldGVjdGVkLg0KDQpOb3QgYWxsIGNhbGxlcnMgb2YgdW5tYXBfZ3JhbnRfcGFn
ZXMoKSBhcmUgaXNzdWluZyBhIFdBUk5fT04oKS4gQXJlIHlvdQ0Kc3VyZSB0aGF0IHRoaXMg
Y2hhbmdlIGNhbid0IHJlc3VsdCBpbiBhIGZsb29kIG9mIFdBUk4oKXM/DQoNClBsZWFzZSBu
b3RlIHRoYXQgeW91IGFyZSBtb2RpZnlpbmcgdGhlIHNlbWFudGljcyBpbiBjYXNlIG9mIGFu
IHVubWFwDQpvcGVyYXRpb24gcmV0dXJuaW5nIGFuIGVycm9yLiBQcmV2aW91c2x5IHRoZXJl
IHdlcmUgbm8gZnVydGhlciB1bm1hcHMNCmRvbmUgaW4gdGhpcyBjYXNlLCB3aGlsZSBub3cg
eW91IGFyZSBiYXNpY2FsbHkgY29udGludWUgdW5tYXBwaW5nIGV2ZW4NCmFmdGVyIGhpdHRp
bmcgYW4gZXJyb3IuIFRoaXMgc2VlbXMgdG8gYmUgZmluZSwgYnV0IGlzIHdvcnRoIG1lbnRp
b25pbmcNCmluIHRoZSBjb21taXQgbWVzc2FnZS4NCg0KPiANCj4gRml4ZXM6IDc0NTI4MjI1
NmM3NSAoInhlbi9nbnRkZXY6IHNhZmVseSB1bm1hcCBncmFudHMgaW4gY2FzZSB0aGV5IGFy
ZSBzdGlsbCBpbiB1c2UiKQ0KPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZw0KPiBTaWdu
ZWQtb2ZmLWJ5OiBEZW1pIE1hcmllIE9iZW5vdXIgPGRlbWlAaW52aXNpYmxldGhpbmdzbGFi
LmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy94ZW4vZ250ZGV2LWNvbW1vbi5oIHwgIDQgKysN
Cj4gICBkcml2ZXJzL3hlbi9nbnRkZXYuYyAgICAgICAgfCA4MiArKysrKysrKysrKysrKysr
KystLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCA0NSBpbnNlcnRp
b25zKCspLCA0MSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3hl
bi9nbnRkZXYtY29tbW9uLmggYi9kcml2ZXJzL3hlbi9nbnRkZXYtY29tbW9uLmgNCj4gaW5k
ZXggMjBkN2QwNTlkYWRiLi5hNmUyODA1ZWEyY2UgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
eGVuL2dudGRldi1jb21tb24uaA0KPiArKysgYi9kcml2ZXJzL3hlbi9nbnRkZXYtY29tbW9u
LmgNCj4gQEAgLTE2LDYgKzE2LDcgQEANCj4gICAjaW5jbHVkZSA8bGludXgvbW11X25vdGlm
aWVyLmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+DQo+ICAgI2luY2x1ZGUgPHhl
bi9pbnRlcmZhY2UvZXZlbnRfY2hhbm5lbC5oPg0KPiArI2luY2x1ZGUgPHhlbi9ncmFudF90
YWJsZS5oPg0KPiAgIA0KPiAgIHN0cnVjdCBnbnRkZXZfZG1hYnVmX3ByaXY7DQo+ICAgDQo+
IEBAIC03Myw2ICs3NCw5IEBAIHN0cnVjdCBnbnRkZXZfZ3JhbnRfbWFwIHsNCj4gICAJLyog
TmVlZGVkIHRvIGF2b2lkIGFsbG9jYXRpb24gaW4gZ250dGFiX2RtYV9mcmVlX3BhZ2VzKCku
ICovDQo+ICAgCXhlbl9wZm5fdCAqZnJhbWVzOw0KPiAgICNlbmRpZg0KPiArDQo+ICsJLyog
TmVlZGVkIHRvIGF2b2lkIGFsbG9jYXRpb24gaW4gX191bm1hcF9ncmFudF9wYWdlcyAqLw0K
PiArCXN0cnVjdCBnbnRhYl91bm1hcF9xdWV1ZV9kYXRhIHVubWFwX2RhdGE7DQo+ICAgfTsN
Cj4gICANCj4gICBzdHJ1Y3QgZ250ZGV2X2dyYW50X21hcCAqZ250ZGV2X2FsbG9jX21hcChz
dHJ1Y3QgZ250ZGV2X3ByaXYgKnByaXYsIGludCBjb3VudCwNCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMveGVuL2dudGRldi5jIGIvZHJpdmVycy94ZW4vZ250ZGV2LmMNCj4gaW5kZXggNTlm
ZmVhODAwMDc5Li42NzBkODAwZTRhODkgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMveGVuL2du
dGRldi5jDQo+ICsrKyBiL2RyaXZlcnMveGVuL2dudGRldi5jDQo+IEBAIC02Miw4ICs2Miw4
IEBAIE1PRFVMRV9QQVJNX0RFU0MobGltaXQsDQo+ICAgDQo+ICAgc3RhdGljIGludCB1c2Vf
cHRlbW9kOw0KPiAgIA0KPiAtc3RhdGljIGludCB1bm1hcF9ncmFudF9wYWdlcyhzdHJ1Y3Qg
Z250ZGV2X2dyYW50X21hcCAqbWFwLA0KPiAtCQkJICAgICBpbnQgb2Zmc2V0LCBpbnQgcGFn
ZXMpOw0KPiArc3RhdGljIHZvaWQgdW5tYXBfZ3JhbnRfcGFnZXMoc3RydWN0IGdudGRldl9n
cmFudF9tYXAgKm1hcCwNCj4gKwkJCSAgICAgIGludCBvZmZzZXQsIGludCBwYWdlcyk7DQo+
ICAgDQo+ICAgc3RhdGljIHN0cnVjdCBtaXNjZGV2aWNlIGdudGRldl9taXNjZGV2Ow0KPiAg
IA0KPiBAQCAtMzQ5LDYxICszNDksNjUgQEAgaW50IGdudGRldl9tYXBfZ3JhbnRfcGFnZXMo
c3RydWN0IGdudGRldl9ncmFudF9tYXAgKm1hcCkNCj4gICAJcmV0dXJuIGVycjsNCj4gICB9
DQo+ICAgDQo+IC1zdGF0aWMgaW50IF9fdW5tYXBfZ3JhbnRfcGFnZXMoc3RydWN0IGdudGRl
dl9ncmFudF9tYXAgKm1hcCwgaW50IG9mZnNldCwNCj4gLQkJCSAgICAgICBpbnQgcGFnZXMp
DQo+ICtzdGF0aWMgdm9pZCBfX3VubWFwX2dyYW50X3BhZ2VzX2RvbmUoaW50IHJlc3VsdCwN
Cj4gKwkJc3RydWN0IGdudGFiX3VubWFwX3F1ZXVlX2RhdGEgKmRhdGEpDQo+ICAgew0KPiAt
CWludCBpLCBlcnIgPSAwOw0KPiAtCXN0cnVjdCBnbnRhYl91bm1hcF9xdWV1ZV9kYXRhIHVu
bWFwX2RhdGE7DQo+IC0NCj4gLQlpZiAobWFwLT5ub3RpZnkuZmxhZ3MgJiBVTk1BUF9OT1RJ
RllfQ0xFQVJfQllURSkgew0KPiAtCQlpbnQgcGdubyA9IChtYXAtPm5vdGlmeS5hZGRyID4+
IFBBR0VfU0hJRlQpOw0KPiAtCQlpZiAocGdubyA+PSBvZmZzZXQgJiYgcGdubyA8IG9mZnNl
dCArIHBhZ2VzKSB7DQo+IC0JCQkvKiBObyBuZWVkIGZvciBrbWFwLCBwYWdlcyBhcmUgaW4g
bG93bWVtICovDQo+IC0JCQl1aW50OF90ICp0bXAgPSBwZm5fdG9fa2FkZHIocGFnZV90b19w
Zm4obWFwLT5wYWdlc1twZ25vXSkpOw0KPiAtCQkJdG1wW21hcC0+bm90aWZ5LmFkZHIgJiAo
UEFHRV9TSVpFLTEpXSA9IDA7DQo+IC0JCQltYXAtPm5vdGlmeS5mbGFncyAmPSB+VU5NQVBf
Tk9USUZZX0NMRUFSX0JZVEU7DQo+IC0JCX0NCj4gLQl9DQo+IC0NCj4gLQl1bm1hcF9kYXRh
LnVubWFwX29wcyA9IG1hcC0+dW5tYXBfb3BzICsgb2Zmc2V0Ow0KPiAtCXVubWFwX2RhdGEu
a3VubWFwX29wcyA9IHVzZV9wdGVtb2QgPyBtYXAtPmt1bm1hcF9vcHMgKyBvZmZzZXQgOiBO
VUxMOw0KPiAtCXVubWFwX2RhdGEucGFnZXMgPSBtYXAtPnBhZ2VzICsgb2Zmc2V0Ow0KPiAt
CXVubWFwX2RhdGEuY291bnQgPSBwYWdlczsNCj4gLQ0KPiAtCWVyciA9IGdudHRhYl91bm1h
cF9yZWZzX3N5bmMoJnVubWFwX2RhdGEpOw0KPiAtCWlmIChlcnIpDQo+IC0JCXJldHVybiBl
cnI7DQo+ICsJaW50IGk7DQoNCk1pbmQgdXNpbmcgdW5zaWduZWQgaW50IGluc3RlYWQ/DQoN
Cj4gKwlzdHJ1Y3QgZ250ZGV2X2dyYW50X21hcCAqbWFwID0gZGF0YS0+ZGF0YTsNCj4gKwlp
bnQgb2Zmc2V0ID0gZGF0YS0+dW5tYXBfb3BzIC0gbWFwLT51bm1hcF9vcHM7DQo+ICAgDQo+
IC0JZm9yIChpID0gMDsgaSA8IHBhZ2VzOyBpKyspIHsNCj4gLQkJaWYgKG1hcC0+dW5tYXBf
b3BzW29mZnNldCtpXS5zdGF0dXMpDQo+IC0JCQllcnIgPSAtRUlOVkFMOw0KPiArCWZvciAo
aSA9IDA7IGkgPCBkYXRhLT5jb3VudDsgaSsrKSB7DQo+ICsJCVdBUk5fT04obWFwLT51bm1h
cF9vcHNbb2Zmc2V0K2ldLnN0YXR1cyk7ID4gICAJCXByX2RlYnVnKCJ1bm1hcCBoYW5kbGU9
JWQgc3Q9JWRcbiIsDQo+ICAgCQkJbWFwLT51bm1hcF9vcHNbb2Zmc2V0K2ldLmhhbmRsZSwN
Cj4gICAJCQltYXAtPnVubWFwX29wc1tvZmZzZXQraV0uc3RhdHVzKTsNCj4gICAJCW1hcC0+
dW5tYXBfb3BzW29mZnNldCtpXS5oYW5kbGUgPSBJTlZBTElEX0dSQU5UX0hBTkRMRTsNCj4g
ICAJCWlmICh1c2VfcHRlbW9kKSB7DQo+IC0JCQlpZiAobWFwLT5rdW5tYXBfb3BzW29mZnNl
dCtpXS5zdGF0dXMpDQo+IC0JCQkJZXJyID0gLUVJTlZBTDsNCj4gKwkJCVdBUk5fT04obWFw
LT5rdW5tYXBfb3BzW29mZnNldCtpXS5zdGF0dXMpOw0KPiAgIAkJCXByX2RlYnVnKCJrdW5t
YXAgaGFuZGxlPSV1IHN0PSVkXG4iLA0KPiAgIAkJCQkgbWFwLT5rdW5tYXBfb3BzW29mZnNl
dCtpXS5oYW5kbGUsDQo+ICAgCQkJCSBtYXAtPmt1bm1hcF9vcHNbb2Zmc2V0K2ldLnN0YXR1
cyk7DQo+ICAgCQkJbWFwLT5rdW5tYXBfb3BzW29mZnNldCtpXS5oYW5kbGUgPSBJTlZBTElE
X0dSQU5UX0hBTkRMRTsNCj4gICAJCX0NCj4gICAJfQ0KPiAtCXJldHVybiBlcnI7DQo+ICAg
fQ0KPiAgIA0KPiAtc3RhdGljIGludCB1bm1hcF9ncmFudF9wYWdlcyhzdHJ1Y3QgZ250ZGV2
X2dyYW50X21hcCAqbWFwLCBpbnQgb2Zmc2V0LA0KPiAtCQkJICAgICBpbnQgcGFnZXMpDQo+
ICtzdGF0aWMgdm9pZCBfX3VubWFwX2dyYW50X3BhZ2VzKHN0cnVjdCBnbnRkZXZfZ3JhbnRf
bWFwICptYXAsIGludCBvZmZzZXQsDQo+ICsJCQkgICAgICAgaW50IHBhZ2VzKQ0KPiArew0K
PiArCWlmIChtYXAtPm5vdGlmeS5mbGFncyAmIFVOTUFQX05PVElGWV9DTEVBUl9CWVRFKSB7
DQo+ICsJCWludCBwZ25vID0gKG1hcC0+bm90aWZ5LmFkZHIgPj4gUEFHRV9TSElGVCk7DQo+
ICsNCj4gKwkJaWYgKHBnbm8gPj0gb2Zmc2V0ICYmIHBnbm8gPCBvZmZzZXQgKyBwYWdlcykg
ew0KPiArCQkJLyogTm8gbmVlZCBmb3Iga21hcCwgcGFnZXMgYXJlIGluIGxvd21lbSAqLw0K
PiArCQkJdWludDhfdCAqdG1wID0gcGZuX3RvX2thZGRyKHBhZ2VfdG9fcGZuKG1hcC0+cGFn
ZXNbcGdub10pKTsNCj4gKw0KPiArCQkJdG1wW21hcC0+bm90aWZ5LmFkZHIgJiAoUEFHRV9T
SVpFLTEpXSA9IDA7DQo+ICsJCQltYXAtPm5vdGlmeS5mbGFncyAmPSB+VU5NQVBfTk9USUZZ
X0NMRUFSX0JZVEU7DQo+ICsJCX0NCj4gKwl9DQo+ICsNCj4gKwltYXAtPnVubWFwX2RhdGEu
dW5tYXBfb3BzID0gbWFwLT51bm1hcF9vcHMgKyBvZmZzZXQ7DQo+ICsJbWFwLT51bm1hcF9k
YXRhLmt1bm1hcF9vcHMgPSB1c2VfcHRlbW9kID8gbWFwLT5rdW5tYXBfb3BzICsgb2Zmc2V0
IDogTlVMTDsNCj4gKwltYXAtPnVubWFwX2RhdGEucGFnZXMgPSBtYXAtPnBhZ2VzICsgb2Zm
c2V0Ow0KPiArCW1hcC0+dW5tYXBfZGF0YS5jb3VudCA9IHBhZ2VzOw0KPiArCW1hcC0+dW5t
YXBfZGF0YS5kb25lID0gX191bm1hcF9ncmFudF9wYWdlc19kb25lOw0KPiArCW1hcC0+dW5t
YXBfZGF0YS5kYXRhID0gbWFwOw0KDQpJIHRoaW5rIHlvdSBuZWVkIHRvIGNhbGwgcmVmY291
bnRfaW5jKCZtYXAtPnVzZXJzKSBoZXJlIGFuZCBkbyB0aGUgcmVsYXRlZA0KZ250ZGV2X3B1
dF9tYXAoKSBjYWxsIGluIF9fdW5tYXBfZ3JhbnRfcGFnZXNfZG9uZSgpLiBPdGhlcndpc2Ug
eW91IGFyZSByaXNraW5nDQp0byBoYXZlIG1hcCBmcmVlZCBiZWZvcmUgdGhlIGFzeW5jIG9w
ZXJhdGlvbiBoYXMgZmluaXNoZWQuDQoNCj4gKw0KPiArCWdudHRhYl91bm1hcF9yZWZzX2Fz
eW5jKCZtYXAtPnVubWFwX2RhdGEpOw0KPiArfQ0KPiArDQo+ICtzdGF0aWMgdm9pZCB1bm1h
cF9ncmFudF9wYWdlcyhzdHJ1Y3QgZ250ZGV2X2dyYW50X21hcCAqbWFwLCBpbnQgb2Zmc2V0
LA0KPiArCQkJICAgICAgaW50IHBhZ2VzKQ0KPiAgIHsNCj4gLQlpbnQgcmFuZ2UsIGVyciA9
IDA7DQo+ICsJaW50IHJhbmdlOw0KPiAgIA0KPiAgIAlwcl9kZWJ1ZygidW5tYXAgJWQrJWQg
WyVkKyVkXVxuIiwgbWFwLT5pbmRleCwgbWFwLT5jb3VudCwgb2Zmc2V0LCBwYWdlcyk7DQo+
ICAgDQo+ICAgCS8qIEl0IGlzIHBvc3NpYmxlIHRoZSByZXF1ZXN0ZWQgcmFuZ2Ugd2lsbCBo
YXZlIGEgImhvbGUiIHdoZXJlIHdlDQo+ICAgCSAqIGFscmVhZHkgdW5tYXBwZWQgc29tZSBv
ZiB0aGUgZ3JhbnRzLiBPbmx5IHVubWFwIHZhbGlkIHJhbmdlcy4NCj4gICAJICovDQo+IC0J
d2hpbGUgKHBhZ2VzICYmICFlcnIpIHsNCj4gKwl3aGlsZSAocGFnZXMpIHsNCj4gICAJCXdo
aWxlIChwYWdlcyAmJg0KPiAgIAkJICAgICAgIG1hcC0+dW5tYXBfb3BzW29mZnNldF0uaGFu
ZGxlID09IElOVkFMSURfR1JBTlRfSEFORExFKSB7DQo+ICAgCQkJb2Zmc2V0Kys7DQo+IEBA
IC00MTYsMTIgKzQyMCwxMCBAQCBzdGF0aWMgaW50IHVubWFwX2dyYW50X3BhZ2VzKHN0cnVj
dCBnbnRkZXZfZ3JhbnRfbWFwICptYXAsIGludCBvZmZzZXQsDQo+ICAgCQkJCWJyZWFrOw0K
PiAgIAkJCXJhbmdlKys7DQo+ICAgCQl9DQo+IC0JCWVyciA9IF9fdW5tYXBfZ3JhbnRfcGFn
ZXMobWFwLCBvZmZzZXQsIHJhbmdlKTsNCj4gKwkJX191bm1hcF9ncmFudF9wYWdlcyhtYXAs
IG9mZnNldCwgcmFuZ2UpOw0KPiAgIAkJb2Zmc2V0ICs9IHJhbmdlOw0KPiAgIAkJcGFnZXMg
LT0gcmFuZ2U7DQo+ICAgCX0NCj4gLQ0KPiAtCXJldHVybiBlcnI7DQo+ICAgfQ0KPiAgIA0K
PiAgIC8qIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLSAqLw0KPiBAQCAtNDczLDcgKzQ3NSw2IEBAIHN0YXRpYyBi
b29sIGdudGRldl9pbnZhbGlkYXRlKHN0cnVjdCBtbXVfaW50ZXJ2YWxfbm90aWZpZXIgKm1u
LA0KPiAgIAlzdHJ1Y3QgZ250ZGV2X2dyYW50X21hcCAqbWFwID0NCj4gICAJCWNvbnRhaW5l
cl9vZihtbiwgc3RydWN0IGdudGRldl9ncmFudF9tYXAsIG5vdGlmaWVyKTsNCj4gICAJdW5z
aWduZWQgbG9uZyBtc3RhcnQsIG1lbmQ7DQo+IC0JaW50IGVycjsNCj4gICANCj4gICAJaWYg
KCFtbXVfbm90aWZpZXJfcmFuZ2VfYmxvY2thYmxlKHJhbmdlKSkNCj4gICAJCXJldHVybiBm
YWxzZTsNCj4gQEAgLTQ5NCwxMCArNDk1LDkgQEAgc3RhdGljIGJvb2wgZ250ZGV2X2ludmFs
aWRhdGUoc3RydWN0IG1tdV9pbnRlcnZhbF9ub3RpZmllciAqbW4sDQo+ICAgCQkJbWFwLT5p
bmRleCwgbWFwLT5jb3VudCwNCj4gICAJCQltYXAtPnZtYS0+dm1fc3RhcnQsIG1hcC0+dm1h
LT52bV9lbmQsDQo+ICAgCQkJcmFuZ2UtPnN0YXJ0LCByYW5nZS0+ZW5kLCBtc3RhcnQsIG1l
bmQpOw0KPiAtCWVyciA9IHVubWFwX2dyYW50X3BhZ2VzKG1hcCwNCj4gKwl1bm1hcF9ncmFu
dF9wYWdlcyhtYXAsDQo+ICAgCQkJCShtc3RhcnQgLSBtYXAtPnZtYS0+dm1fc3RhcnQpID4+
IFBBR0VfU0hJRlQsDQo+ICAgCQkJCShtZW5kIC0gbXN0YXJ0KSA+PiBQQUdFX1NISUZUKTsN
Cj4gLQlXQVJOX09OKGVycik7DQo+ICAgDQo+ICAgCXJldHVybiB0cnVlOw0KPiAgIH0NCg0K
SnVlcmdlbg0K
--------------D8xMTnyA4O1BHY5gfVG0PJz6
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------D8xMTnyA4O1BHY5gfVG0PJz6--

--------------aX5RY1OxQNbipAK57nTzcAk0--

--------------YIISMi4lxaTHiovuYVDaIN07
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmKN9DMFAwAAAAAACgkQsN6d1ii/Ey/r
ngf/c22JbFjlWlARUSz+fRpnuXNAJtorYX6HeUI9TWiI4AfxO+856y56HS7Ci+L8DaReAF/EkpG6
ec/VnvKKNOfT+5XK1WMDdlRG0SWZzX6PagKDh4ZUDTafcQIoDzN6NYq1Z6dMAh/QQ7/DHe2crqxf
wYITawaifnFc/HSkISMB7FLXsE+OusOA0x2eFYTU9evsRDMQROMzldC6Aul5b7hdvSl/zM2FTptv
ids4fOn+Caq7sSzcNK3CvZjyBP+L6S7ppn4p13hWNhdx34jcy5Gyej45S8amKrKGV8m+zg3UbCBc
Zy8MAnFto+advVzo/T+s+Z3+oyWt+LpVdHOLKvOqbA==
=HQNQ
-----END PGP SIGNATURE-----

--------------YIISMi4lxaTHiovuYVDaIN07--

