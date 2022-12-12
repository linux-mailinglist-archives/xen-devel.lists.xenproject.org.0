Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB53F64989E
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 06:20:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459039.716708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4bEK-0004Mz-Lr; Mon, 12 Dec 2022 05:19:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459039.716708; Mon, 12 Dec 2022 05:19:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4bEK-0004LE-IG; Mon, 12 Dec 2022 05:19:56 +0000
Received: by outflank-mailman (input) for mailman id 459039;
 Mon, 12 Dec 2022 05:19:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/A98=4K=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1p4bEJ-0004L8-7Y
 for xen-devel@lists.xenproject.org; Mon, 12 Dec 2022 05:19:55 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b970a2c-79dc-11ed-91b6-6bf2151ebd3b;
 Mon, 12 Dec 2022 06:19:53 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8A0971FE19;
 Mon, 12 Dec 2022 05:19:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4E1A51376E;
 Mon, 12 Dec 2022 05:19:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id vyWiEfi5lmOZQwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 12 Dec 2022 05:19:52 +0000
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
X-Inumbo-ID: 9b970a2c-79dc-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1670822392; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xz5nnj3XD0YHenNz9nlFHXnTFZaUk+RI1pDMWcsUNJk=;
	b=NkcSmmucqKVnO7vJFzNpW5C/vdqmc7gLeuDhvM0oNqsjFMLXlG8LXJztgZe5fzv7LChWhG
	KO9xP8/UuF4NnjUQd8xRa5IXvNe0S874UlriJHidvrQOWH2ESR6D2qdgK1og/xTxxpo8v5
	WtCCJSRG8ZTyyt6EgHkZrxhJEwElur4=
Message-ID: <c250b8f5-bce5-da43-ae11-e5355141ea3c@suse.com>
Date: Mon, 12 Dec 2022 06:19:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: kfence_protect_page() writing L1TF vulnerable PTE
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>,
 Marco Elver <elver@google.com>
Cc: Alexander Potapenko <glider@google.com>,
 kasan-dev <kasan-dev@googlegroups.com>,
 Xen development discussion <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <c18bc798-f484-ad66-fbb0-15192a74f8e3@suse.com>
 <Y5ZM3HCnTcLvP2vy@itl-email>
 <CANpmjNPZwtmMvAOk7rn9U=sWTre7+o93yB_0idkVCvJky6mptA@mail.gmail.com>
 <Y5azcFUxAWuEVicY@itl-email>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <Y5azcFUxAWuEVicY@itl-email>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------TDjy6sZearJP8RKYq0xs4s9P"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------TDjy6sZearJP8RKYq0xs4s9P
Content-Type: multipart/mixed; boundary="------------jmu50pFsK3nFV6dYJ1cupCTv";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>,
 Marco Elver <elver@google.com>
Cc: Alexander Potapenko <glider@google.com>,
 kasan-dev <kasan-dev@googlegroups.com>,
 Xen development discussion <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
Message-ID: <c250b8f5-bce5-da43-ae11-e5355141ea3c@suse.com>
Subject: Re: kfence_protect_page() writing L1TF vulnerable PTE
References: <c18bc798-f484-ad66-fbb0-15192a74f8e3@suse.com>
 <Y5ZM3HCnTcLvP2vy@itl-email>
 <CANpmjNPZwtmMvAOk7rn9U=sWTre7+o93yB_0idkVCvJky6mptA@mail.gmail.com>
 <Y5azcFUxAWuEVicY@itl-email>
In-Reply-To: <Y5azcFUxAWuEVicY@itl-email>

--------------jmu50pFsK3nFV6dYJ1cupCTv
Content-Type: multipart/mixed; boundary="------------oZhaDNPkkcoxk2G0lwcWLKjd"

--------------oZhaDNPkkcoxk2G0lwcWLKjd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTIuMTIuMjIgMDU6NTUsIERlbWkgTWFyaWUgT2Jlbm91ciB3cm90ZToNCj4gLS0tLS1C
RUdJTiBQR1AgU0lHTkVEIE1FU1NBR0UtLS0tLQ0KPiBIYXNoOiBTSEE1MTINCj4gDQo+IC0g
LS0tLS1CRUdJTiBQR1AgU0lHTkVEIE1FU1NBR0UtLS0tLQ0KPiBIYXNoOiBTSEE1MTINCj4g
DQo+IE9uIFN1biwgRGVjIDExLCAyMDIyIGF0IDExOjUwOjM5UE0gKzAxMDAsIE1hcmNvIEVs
dmVyIHdyb3RlOg0KPj4gT24gU3VuLCAxMSBEZWMgMjAyMiBhdCAyMjozNCwgRGVtaSBNYXJp
ZSBPYmVub3VyDQo+PiA8ZGVtaUBpbnZpc2libGV0aGluZ3NsYWIuY29tPiB3cm90ZToNCj4+
PiBPbiBTdW4sIERlYyAxMSwgMjAyMiBhdCAwMToxNTowNlBNICswMTAwLCBKdWVyZ2VuIEdy
b3NzIHdyb3RlOg0KPj4+PiBEdXJpbmcgdGVzdHMgd2l0aCBRdWJlc09TIGEgcHJvYmxlbSB3
YXMgZm91bmQgd2hpY2ggc2VlbWVkIHRvIGJlIHJlbGF0ZWQNCj4+Pj4gdG8ga2ZlbmNlX3By
b3RlY3RfcGFnZSgpIHdyaXRpbmcgYSBMMVRGIHZ1bG5lcmFibGUgcGFnZSB0YWJsZSBlbnRy
eSBbMV0uDQo+Pj4+DQo+Pj4+IExvb2tpbmcgaW50byB0aGUgZnVuY3Rpb24gSSdtIHNlZWlu
ZzoNCj4+Pj4NCj4+Pj4gICAgICAgIHNldF9wdGUocHRlLCBfX3B0ZShwdGVfdmFsKCpwdGUp
ICYgfl9QQUdFX1BSRVNFTlQpKTsNCj4+Pj4NCj4+Pj4gSSBkb24ndCB0aGluayB0aGlzIGNh
biBiZSBjb3JyZWN0LCBhcyBrZWVwaW5nIHRoZSBQRk4gdW5tb2RpZmllZCBhbmQNCj4+Pj4g
anVzdCByZW1vdmluZyB0aGUgX1BBR0VfUFJFU0VOVCBiaXQgaXMgd3JvbmcgcmVnYXJkaW5n
IEwxVEYuDQo+Pj4+DQo+Pj4+IFRoZXJlIHNob3VsZCBiZSBhdCBsZWFzdCB0aGUgaGlnaGVz
dCBQRk4gYml0IHNldCBpbiBvcmRlciB0byBiZSBMMVRGDQo+Pj4+IHNhZmUuDQo+IA0KPj4g
Q291bGQgeW91IGVsYWJvcmF0ZSB3aGF0IHdlIHdhbnQgdG8gYmUgc2FmZSBmcm9tPw0KPiAN
Cj4gVGhlIHByb2JsZW0gaXMgbm90IExpbnV44oCZcyBzYWZldHksIGJ1dCBYZW7igJlzLiAg
VG8gcHJldmVudCBQViBndWVzdHMgZnJvbQ0KPiBhcmJpdHJhcmlseSByZWFkaW5nIGFuZCB3
cml0aW5nIG1lbW9yeSwgYWxsIHVwZGF0ZXMgdG8gUFYgZ3Vlc3QgcGFnZQ0KPiB0YWJsZXMg
bXVzdCBiZSBkb25lIHZpYSBoeXBlcmNhbGxzLiAgVGhpcyBhbGxvd3MgWGVuIHRvIGVuc3Vy
ZSB0aGF0IGENCj4gZ3Vlc3QgY2FuIG9ubHkgcmVhZCBmcm9tIGl0cyBvd24gbWVtb3J5IGFu
ZCB0aGF0IHBhZ2VzIHVzZWQgZm9yIHBhZ2UNCj4gdGFibGVzIG9yIHNlZ21lbnQgZGVzY3Jp
cHRvcnMgYXJlIG5vdCBtYXBwZWQgd3JpdGFibGUuDQo+IA0KPj4gS0ZFTkNFIGlzIG9ubHkg
Zm9yIGtlcm5lbCBtZW1vcnksIGkuZS4gc2xhYiBhbGxvY2F0aW9ucy4gVGhlDQo+PiBwYWdl
LXByb3RlY3Rpb24gbWVjaGFuaXNtIGlzIHVzZWQgdG8gZGV0ZWN0IG1lbW9yeSBzYWZldHkg
YnVncyBpbiB0aGUNCj4+IExpbnV4IGtlcm5lbC4gVGhlIHBhZ2UgcHJvdGVjdGlvbiBkb2Vz
IG5vdCBwcmV2ZW50IG9yIG1pdGlnYXRlIGFueQ0KPj4gc3VjaCBidWdzIGJlY2F1c2UgS0ZF
TkNFIG9ubHkgc2FtcGxlcyBzbFthdV1iIGFsbG9jYXRpb25zLiBOb3JtYWwgc2xhYg0KPj4g
YWxsb2NhdGlvbnMgbmV2ZXIgY2hhbmdlIHRoZSBwYWdlIHByb3RlY3Rpb24gYml0czsgS0ZF
TkNFIG1lcmVseSB1c2VzDQo+PiB0aGVtIHRvIHJlY2VpdmUgYSBwYWdlIGZhdWx0LCB1cG9u
IHdoaWNoIHdlIGRldGVybWluZSBlaXRoZXIgYQ0KPj4gdXNlLWFmdGVyLWZyZWUgb3Igb3V0
LW9mLWJvdW5kcyBhY2Nlc3MuIEFmdGVyIGEgYnVnIGlzIGRldGVjdGVkLA0KPj4gS0ZFTkNF
IHVucHJvdGVjdHMgdGhlIHBhZ2Ugc28gdGhhdCB0aGUga2VybmVsIGNhbiBwcm9jZWVkICJh
cyBub3JtYWwiDQo+PiBnaXZlbiB0aGF0J3MgdGhlIHN0YXRlIG9mIHRoaW5ncyBpZiBpdCBo
YWQgYmVlbiBhIG5vcm1hbCBzbFthdV1iDQo+PiBhbGxvY2F0aW9uLg0KPiANCj4+IGh0dHBz
Oi8vZG9jcy5rZXJuZWwub3JnL2Rldi10b29scy9rZmVuY2UuaHRtbA0KPiANCj4+ICBGcm9t
IFsxXSBJIHNlZTogIklmIGFuIGluc3RydWN0aW9uIGFjY2Vzc2VzIGEgdmlydHVhbCBhZGRy
ZXNzIGZvcg0KPj4gd2hpY2ggdGhlIHJlbGV2YW50IHBhZ2UgdGFibGUgZW50cnkgKFBURSkg
aGFzIHRoZSBQcmVzZW50IGJpdCBjbGVhcmVkDQo+PiBvciBvdGhlciByZXNlcnZlZCBiaXRz
IHNldCwgdGhlbiBzcGVjdWxhdGl2ZSBleGVjdXRpb24gaWdub3JlcyB0aGUNCj4+IGludmFs
aWQgUFRFIGFuZCBsb2FkcyB0aGUgcmVmZXJlbmNlZCBkYXRhIGlmIGl0IGlzIHByZXNlbnQg
aW4gdGhlDQo+PiBMZXZlbCAxIERhdGEgQ2FjaGUsIGFzIGlmIHRoZSBwYWdlIHJlZmVyZW5j
ZWQgYnkgdGhlIGFkZHJlc3MgYml0cyBpbg0KPj4gdGhlIFBURSB3YXMgc3RpbGwgcHJlc2Vu
dCBhbmQgYWNjZXNzaWJsZS4iDQo+IA0KPj4gWzFdIGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcv
ZG9jL2h0bWwvbGF0ZXN0L2FkbWluLWd1aWRlL2h3LXZ1bG4vbDF0Zi5odG1sDQo+IA0KPj4g
VGhpcyBpcyBwZXJmZWN0bHkgZmluZSBpbiB0aGUgY29udGV4dCBvZiBLRkVOQ0UsIGFzIHN0
YXRlZCBhYm92ZSwgdGhlDQo+PiBwYWdlIHByb3RlY3Rpb24gaXMgbWVyZWx5IHVzZWQgdG8g
ZGV0ZWN0IG91dC1vZi1ib3VuZHMgYW5kDQo+PiB1c2UtYWZ0ZXItZnJlZSBidWdzIG9mIHNh
bXBsZWQgc2xhYiBhbGxvY2F0aW9ucy4gS0ZFTkNFIGRvZXMgbm90DQo+PiBtaXRpZ2F0ZSBu
b3IgcHJldmVudCBzdWNoIGJ1Z3MsIGJlY2F1c2UgaXQgc2FtcGxlcyBhbGxvY2F0aW9ucywg
aS5lLg0KPj4gbW9zdCBhbGxvY2F0aW9ucyBhcmUgc3RpbGwgc2VydmljZWQgYnkgc2xbYXVd
Yi4NCj4gDQo+IEl0IGlzIG5vdCBmaW5lIHdoZW4gcnVubmluZyBwYXJhdmlydHVhbGl6ZWQg
dW5kZXIgWGVuLCB0aG91Z2guICBYZW4NCj4gc3RyaWN0bHkgdmFsaWRhdGVzIHRoYXQgcHJl
c2VudCBQVEVzIHBvaW50IGludG8gYSBndWVzdOKAmXMgb3duIG1lbW9yeSwNCj4gYnV0IChp
biB0aGUgYWJzZW5jZSBvZiBMMVRGKSBhbGxvd3Mgbm90LXByZXNlbnQgUFRFcyB0byBoYXZl
IGFueSB2YWx1ZS4NCj4gSG93ZXZlciwgTDFURiBtZWFucyB0aGF0IGRvaW5nIHNvIHdvdWxk
IGFsbG93IGEgUFYgZ3Vlc3QgdG8gbGVhayBtZW1vcnkNCj4gZnJvbSBYZW4gb3Igb3RoZXIg
Z3Vlc3RzISAgVGhlcmVmb3JlLCBYZW4gcmVxdWlyZXMgdGhhdCBub3QtcHJlc2VudCBQVEVz
DQo+IGJlIEwxVEYtc2FmZSwgZW5zdXJpbmcgdGhhdCBQViBndWVzdHMgY2Fubm90IHVzZSBM
MVRGIHRvIG9idGFpbiBtZW1vcnkNCj4gZnJvbSBvdGhlciBndWVzdHMgb3IgdGhlIGh5cGVy
dmlzb3IuDQo+IA0KPiBJZiBhIGd1ZXN0IGNyZWF0ZXMgYW4gTDFURi12dWxuZXJhYmxlIFBU
RSwgWGVu4oCZcyBiZWhhdmlvciBkZXBlbmRzIG9uDQo+IHdoZXRoZXIgaXQgaGFzIGJlZW4g
Y29tcGlsZWQgd2l0aCBzaGFkb3cgcGFnaW5nIHN1cHBvcnQuICBJZiBpdCBoYXMsIFhlbg0K
PiB3aWxsIHRyYW5zaXRpb24gdGhlIGd1ZXN0IHRvIHNoYWRvdyBwYWdpbmcgbW9kZS4gIFRo
aXMgd29ya3MsIGJ1dCBjb21lcw0KPiBhdCBhIHNpZ25pZmljYW50IHBlcmZvcm1hbmNlIGhp
dCwgc28geW91IGRvbuKAmXQgd2FudCB0aGF0LiAgSWYgc2hhZG93DQo+IHBhZ2luZyBoYXMg
YmVlbiBkaXNhYmxlZCBhdCBjb21waWxlIHRpbWUsIGFzIGlzIHRoZSBjYXNlIGluIFF1YmVz
LCBYZW4NCj4gc2ltcGx5IGNyYXNoZXMgdGhlIGd1ZXN0Lg0KPiANCj4gZG9tMCBpcyBleGVt
cHRlZCBmcm9tIHRoZXNlIGNoZWNrcyBieSBkZWZhdWx0LCBiZWNhdXNlIHRoZSBkb20wIGtl
cm5lbA0KPiBpcyBjb25zaWRlcmVkIHRydXN0ZWQuICBIb3dldmVyLCB0aGlzIGNhbiBiZSBj
aGFuZ2VkIGJ5IGEgWGVuDQo+IGNvbW1hbmQtbGluZSBvcHRpb24sIHNvIGl0IGlzIG5vdCB0
byBiZSByZWxpZWQgb24uDQo+IA0KPj4gSG93IGNhbiB3ZSB0ZWFjaCB3aGF0ZXZlciBpcyBj
b21wbGFpbmluZyBhYm91dCBMMVRGIG9uIHRoYXQgS0ZFTkNFIFBURQ0KPj4gbW9kaWZpY2F0
aW9uIHRoYXQgS0ZFTkNFIGRvZXMgbm90IHVzZSBwYWdlIHByb3RlY3Rpb24gdG8gc3RvcCBh
bnlvbmUNCj4+IGZyb20gYWNjZXNzaW5nIHRoYXQgbWVtb3J5Pw0KPiANCj4gV2l0aCBjdXJy
ZW50IFhlbiwgeW91IGNhbuKAmXQuICBBbnkgbm90LXByZXNlbnQgUFRFIG11c3QgYmUgTDFU
Ri1zYWZlIG9uDQo+IEwxVEYtdnVsbmVyYWJsZSBoYXJkd2FyZSwgYW5kIEkgYW0gbm90IGF3
YXJlIG9mIGFueSB3YXkgdG8gYXNrIFhlbiBpZiBpdA0KPiBjb25zaWRlcnMgdGhlIGhhcmR3
YXJlIHZ1bG5lcmFibGUgdG8gTDFURi4gIFRoZXJlZm9yZSwgS0ZFTkNFIHdvdWxkIG5lZWQN
Cj4gdG8gZWl0aGVyIG5vdCBnZW5lcmF0ZSBMMVRGLXZ1bG5lcmFibGUgbm90LXByZXNlbnQg
UFRFcywgb3INCj4gYXV0b21hdGljYWxseSBkaXNhYmxlIGl0c2VsZiB3aGVuIHJ1bm5pbmcg
aW4gWGVuIFBWIG1vZGUuDQo+IA0KPiBJbiB0aGVvcnksIGl0IG91Z2h0IHRvIGJlIHNhZmUg
Zm9yIFhlbiB0byBpbnN0ZWFkIHRyZWF0IG5vdC1wcmVzZW50DQo+IEwxVEYtdnVsbmVyYWJs
ZSBQVEVzIGFzIGlmIHRoZXkgd2VyZSBwcmVzZW50LCBhbmQgYXBwbHkgdGhlIHNhbWUNCj4g
dmFsaWRhdGlvbiB0aGF0IGl0IGRvZXMgZm9yIHByZXNlbnQgUFRFcy4gIEhvd2V2ZXIsIHRo
ZSBQViBtZW1vcnkNCj4gbWFuYWdlbWVudCBjb2RlIGhhcyBiZWVuIGludm9sdmVkIGluIHNl
dmVyYWwgZmF0YWwsIHJlbGlhYmx5IGV4cGxvaXRhYmxlDQo+IFBWIGd1ZXN0IGVzY2FwZSB2
dWxuZXJhYmlsaXRpZXMsIGFuZCBJIHdvdWxkIHJhdGhlciBub3QgbWFrZSBpdCBhbnkgbW9y
ZQ0KPiBjb21wbGV4IHRoYW4gaXQgYWxyZWFkeSBpcy4NCg0KVHJlYXRpbmcgbm9uLXByZXNl
bnQgUFRFcyBsaWtlIHByZXNlbnQgb25lcyBoYXMgYSBtYWpvciBkcmF3YmFjazogaXQNCnJl
cXVpcmVzIHRvIGtlZXAgdHJhY2sgb2YgYWxsIHBhZ2UgZnJhbWVzIGJlaW5nIHBvdGVudGlh
bGx5IHJlZmVyZW5jZWQsDQppbmR1Y2luZyBhIG1ham9yIHBlcmZvcm1hbmNlIGhpdCBmb3Ig
dGhlICJyZWd1bGFyIiBjYXNlLiBNZW1vcnkgYmFsbG9vbmluZw0Kd291bGQgYmUgYSBsb3Qg
bW9yZSBjb21wbGljYXRlZCBkdWUgdG8gdGhhdC4NCg0KPiBBIG11Y2ggYmV0dGVyIHNvbHV0
aW9uIHdvdWxkIGJlIGZvciBLRkVOQ0UgdG8gdXNlIFBURSBpbnZlcnNpb24ganVzdA0KPiBs
aWtlIHRoZSByZXN0IG9mIHRoZSBrZXJuZWwgZG9lcy4gIFRoaXMgc29sdmVzIHRoZSBwcm9i
bGVtDQo+IHVuY29uZGl0aW9uYWxseSwgYW5kIGF2b2lkcyBuZWVkaW5nIFhlbiBQViBzcGVj
aWZpYyBjb2RlLiAgSSBoYXZlIGENCj4gcGF0Y2ggdGhhdCBkaXNhYmxlcyBLRkVOQ0Ugb24g
WGVuIFBWLCBidXQgSSB3b3VsZCBtdWNoIHJhdGhlciBzZWUgS0ZFTkNFDQo+IGZpeGVkLCB3
aGljaCBpcyB3aHkgSSBoYXZlIG5vdCBzdWJtaXR0ZWQgdGhlIHBhdGNoLg0KDQpJIGNhbiBz
dXBwbHkgYSBrZXJuZWwgcGF0Y2ggZm9yIGRvaW5nIHRoZSBQRk4gaW52ZXJzaW9uIGluIHRo
ZSBQVEUuDQoNCg0KSnVlcmdlbg0K
--------------oZhaDNPkkcoxk2G0lwcWLKjd
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjri
oyspZKOBycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2
kaV2KL9650I1SJvedYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i
1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/B
BLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xqG7/377qptDmrk42GlSK
N4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR3Jvc3Mg
PGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsE
FgIDAQIeAQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4F
UGNQH2lvWAUy+dnyThpwdtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3Tye
vpB0CA3dbBQp0OW0fgCetToGIQrg0MbD1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u
+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbvoPHZ8SlM4KWm8rG+lIkGurq
qu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v5QL+qHI3EIP
tyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJ
CAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4
RF7HoZhPVPogNVbC4YA6lW7DrWf0teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz7
8X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC/nuAFVGy+67q2DH8As3KPu0344T
BDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0LhITTd9jLzdDad1pQ
SToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLmXBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkM
nQfvUewRz80hSnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMB
AgAjBQJTjHDXAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/
Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJnFOXgMLdBQgBlVPO3/D9R8LtF9DBAFPN
hlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1jnDkfJZr6jrbjgyoZHi
w/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0N51N5Jf
VRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwP
OoE+lotufe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK
/1xMI3/+8jbO0tsn1tqSEUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuZGU+wsB5BBMBAgAjBQJTjHDrAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgEC
F4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3g3OZUEBmDHVVbqMtzwlmNC4
k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5dM7wRqzgJpJ
wK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu
5D+jLRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzB
TNh30FVKK1EvmV2xAKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37Io
N1EblHI//x/e2AaIHpzK5h88NEawQsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6
AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpWnHIs98ndPUDpnoxWQugJ6MpMncr
0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZRwgnBC5mVM6JjQ5x
Dk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNVbVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mm
we0icXKLkpEdIXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0I
v3OOImwTEe4co3c1mwARAQABwsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMv
Q/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEwTbe8YFsw2V/Buv6Z4Mysln3nQK5ZadD
534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1vJzQ1fOU8lYFpZXTXIH
b+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8VGiwXvT
yJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqc
suylWsviuGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5B
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------oZhaDNPkkcoxk2G0lwcWLKjd--

--------------jmu50pFsK3nFV6dYJ1cupCTv--

--------------TDjy6sZearJP8RKYq0xs4s9P
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmOWufcFAwAAAAAACgkQsN6d1ii/Ey+H
jQgAg7nHsWFzaEfFwDmTTypBIAuAAPfDYyBHkexDtDZtX7CdAndNjjhgKxeCRoMkPrpkK1o06Bin
ppU/wpU6cnEzadUU7Vb2HqL+Y5mk7FsjTHYm33f/1w+ceeufd9o+FRlGJSM1mKR/c3rr1VWI4Z/B
+hjWdwO8KU/AvTySTqx+BzCTVcUgyca37cJXsf/0wrUzMV82cLcmq6aPPNrw948gYjvoplxugisn
lL0gp3FdZr79m7LaRLJkUWuTEPOixY+uFcJkY2dqGCAVws6DF3rdav8gxFWJ0Onlb69ffj+Um7CY
T4jinfTPN9eBYjY9YTIPqAs+JDTFDrbs+Od51md/nw==
=2sp0
-----END PGP SIGNATURE-----

--------------TDjy6sZearJP8RKYq0xs4s9P--

