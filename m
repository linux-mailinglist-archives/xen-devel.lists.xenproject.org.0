Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0936A5F5715
	for <lists+xen-devel@lfdr.de>; Wed,  5 Oct 2022 17:05:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.416282.660938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1og5wn-0000Fo-OY; Wed, 05 Oct 2022 15:04:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 416282.660938; Wed, 05 Oct 2022 15:04:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1og5wn-0000Cd-LT; Wed, 05 Oct 2022 15:04:33 +0000
Received: by outflank-mailman (input) for mailman id 416282;
 Wed, 05 Oct 2022 15:04:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ugva=2G=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1og5wl-0000CX-W3
 for xen-devel@lists.xenproject.org; Wed, 05 Oct 2022 15:04:31 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0353cd54-44bf-11ed-9377-c1cf23e5d27e;
 Wed, 05 Oct 2022 17:04:30 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 194631F7AB;
 Wed,  5 Oct 2022 15:04:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 026D313ABD;
 Wed,  5 Oct 2022 15:04:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WjHHOv2cPWOSNQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 05 Oct 2022 15:04:29 +0000
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
X-Inumbo-ID: 0353cd54-44bf-11ed-9377-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1664982270; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=orayW6DC0+1L5z3MTedZf9i3NlZmmFYcFa1Za3O/A/w=;
	b=fgtX/m0PjMydPNd0x/XyAsUjY6xjpMhY8Ee/2YrtqGIs4ib7TG2I6NLis3l8Upd+kxm1Qv
	8cU7l0nrhojsSMvBRaghKjH7YKUPRIVieL86yYxQ/0HMaP5PnoxK6mAiNRy3upjmNUOusb
	P5ToT64fajFQJZMn482I8x8/Mp9TH14=
Message-ID: <e306ac5f-2ce8-944d-ed5d-5aae566c8a80@suse.com>
Date: Wed, 5 Oct 2022 17:04:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: CONFIG_XEN_VIRTIO{_FORCE_GRANT} interferes with nested virt
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
References: <Yz17cLIb1V0zjEjK@mail-itl>
 <4bd95b8b-dbdb-b5ce-fe18-ce6bbcf715fe@suse.com> <Yz2Fvp9Q9aeYKnDY@mail-itl>
 <ecdc11dc-6090-e050-bcba-aafbd8aaf3b6@suse.com> <Yz2L9eTdbA3vS43g@mail-itl>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <Yz2L9eTdbA3vS43g@mail-itl>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------jXOYyrPS0JxKApJ0juxhNY0I"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------jXOYyrPS0JxKApJ0juxhNY0I
Content-Type: multipart/mixed; boundary="------------wCWm6l6XonyWJt5XkP5zz5Yq";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <e306ac5f-2ce8-944d-ed5d-5aae566c8a80@suse.com>
Subject: Re: CONFIG_XEN_VIRTIO{_FORCE_GRANT} interferes with nested virt
References: <Yz17cLIb1V0zjEjK@mail-itl>
 <4bd95b8b-dbdb-b5ce-fe18-ce6bbcf715fe@suse.com> <Yz2Fvp9Q9aeYKnDY@mail-itl>
 <ecdc11dc-6090-e050-bcba-aafbd8aaf3b6@suse.com> <Yz2L9eTdbA3vS43g@mail-itl>
In-Reply-To: <Yz2L9eTdbA3vS43g@mail-itl>

--------------wCWm6l6XonyWJt5XkP5zz5Yq
Content-Type: multipart/mixed; boundary="------------fjSUt0fe7kaG94bxGExAt5A0"

--------------fjSUt0fe7kaG94bxGExAt5A0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDUuMTAuMjIgMTU6NTEsIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSB3cm90ZToN
Cj4gT24gV2VkLCBPY3QgMDUsIDIwMjIgYXQgMDM6MzQ6NTZQTSArMDIwMCwgSnVlcmdlbiBH
cm9zcyB3cm90ZToNCj4+IE9uIDA1LjEwLjIyIDE1OjI1LCBNYXJlayBNYXJjenlrb3dza2kt
R8OzcmVja2kgd3JvdGU6DQo+Pj4gT24gV2VkLCBPY3QgMDUsIDIwMjIgYXQgMDI6NTc6MDFQ
TSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+Pj4gT24gMDUuMTAuMjIgMTQ6NDEs
IE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSB3cm90ZToNCj4+Pj4+IEhpLA0KPj4+Pj4N
Cj4+Pj4+IFdoZW4gYm9vdGluZyBYZW4gd2l0aCBMaW51eCBkb20wIG5lc3RlZCB1bmRlciBL
Vk0sDQo+Pj4+PiBDT05GSUdfWEVOX1ZJUlRJT19GT1JDRV9HUkFOVD15IG1ha2VzIGl0IHVu
YWJsZSB0byB1c2UgdmlydGlvIGRldmljZXMNCj4+Pj4+IHByb3ZpZGVkIGJ5IEwwIGh5cGVy
dmlzb3IgKEtWTSB3aXRoIHFlbXUpLiBXaXRoIFBWIGRvbTAsIGdyYW50cyBhcmUNCj4+Pj4+
IHJlcXVpcmVkIGZvciB2aXJ0aW8gZXZlbiBpZiBqdXN0IENPTkZJR19YRU5fVklSVElPIGlz
IGVuYWJsZWQuDQo+Pj4+Pg0KPj4+Pj4gVGhpcyBpcyBwcm9iYWJseSB1bmNvbW1vbiBjb3Ju
ZXIgY2FzZSwgYnV0IG9uZSB0aGF0IGhhcyBiaXR0ZW4gbWUgaW4gbXkNCj4+Pj4+IENJIHNl
dHVwLi4uIEkgdGhpbmsgWGVuIHNob3VsZCBzZXQgc21hcnRlcg0KPj4+Pj4gdmlydGlvX3Jl
cXVpcmVfcmVzdHJpY3RlZF9tZW1fYWNjKCksIHRoYXQgZW5mb3JjZXMgaXQgb25seSBmb3Ig
ZGV2aWNlcw0KPj4+Pj4gcmVhbGx5IHByb3ZpZGVkIGJ5IGFub3RoZXIgWGVuIFZNIChub3Qg
YnkgdGhlICJvdXRlciBob3N0IiksIGJ1dCBJJ20gbm90DQo+Pj4+PiBzdXJlIGhvdyB0aGF0
IGNvdWxkIGJlIGRvbmUuIEFueSBpZGVhcz8NCj4+Pj4+DQo+Pj4+DQo+Pj4+IEl0IHNob3Vs
ZCBiZSBwb3NzaWJsZSB0byBhZGQgYSBib290IHBhcmFtZXRlciBmb3IgdGhhdCBwdXJwb3Nl
LiBVc2luZyBpdA0KPj4+PiB3b3VsZCBvcGVuIGEgc2VjdXJpdHkgaG9sZSwgdGhvdWdoIChi
YXNpY2FsbHkgbGlrZSBhbGwgUENJIHBhc3N0aHJvdWdoIHRvDQo+Pj4+IFBWIGd1ZXN0cyku
DQo+Pj4NCj4+PiBXaGF0IGFib3V0IGV4Y2x1ZGluZyBqdXN0IGRvbTA/IEF0IGxlYXN0IGN1
cnJlbnRseSwgdGhlcmUgaXMgbm8gd2F5IGZvcg0KPj4+IGRvbTAgdG8gc2VlIHZpcnRpbyBk
ZXZpY2VzIHByb3ZpZGVkIGJ5IGFub3RoZXIgWGVuIGRvbVUuDQo+Pg0KPj4gRXZlbiBub3Qg
dmlhIGhvdHBsdWc/DQo+IA0KPiBUaGF0J3Mgd2h5IEkgc2FpZCAiY3VycmVudGx5IiwgSUlV
QyBob3RwbHVnIG9mIHZpcnRpbyBkZXZpY2VzIHVuZGVyIFhlbg0KPiBkb2Vzbid0IHdvcmsg
eWV0LCBubz8NCj4gV2l0aCBob3RwbHVnIHdvcmtpbmcsIGl0IHdvdWxkIG5lZWQgdG8gYmUg
YSBwcm9wZXIgZGV0ZWN0aW9uIHdoZXJlIHRoZQ0KPiBiYWNrZW5kIGxpdmVzLCBhbmQgcHJv
YmFibHkgd2l0aCBzb21lIGV4dHJhIGNvbnNpZGVyYXRpb25zIHJlIFhlbiBvbg0KPiBYZW4g
KGJhc2VkIG9uIGJlbG93LCBwdi1zaGltIGNvdWxkIHVzZSBncmFudHMpLg0KDQpBcyBzdGF0
ZWQgYmVmb3JlLCB0aGlzIGlzbid0IGEgcHJvYmxlbSBzcGVjaWZpYyB0byB2aXJ0aW8gZGV2
aWNlcy4gVGhlIHNhbWUNCmFwcGxpZXMgdG8gWGVuIFBWIGRldmljZXMuDQoNCj4gDQo+IEZv
ciBtZSBzcGVjaWZpY2FsbHksIGEgY29tbWFuZCBsaW5lIG9wdGlvbiB3b3VsZCB3b3JrIChi
ZWNhdXNlIEkgZG9uJ3QNCj4gdXNlIFhlbi1iYXNlZCB2aXJ0aW8gZGV2aWNlcyB3aGVuIG5l
c3RlZCB1bmRlciBLVk0sIG9yIGFueXdoZXJlIGF0IGFsbCwNCj4gYXQgbGVhc3Qgbm90IHll
dCksIGJ1dCBJIGNhbiBzZWUgZnV0dXJlIGNhc2VzIHdoZXJlIHlvdSBoYXZlIHZpcnRpbw0K
PiBkZXZpY2VzIGZyb20gYm90aCBMMCBhbmQgTDEgaW4gdGhlIHNhbWUgZ3Vlc3QsIGFuZCB0
aGVuIGl0IHdvdWxkbid0IGJlDQo+IHRoYXQgc2ltcGxlLg0KDQpMZXRzIHRoaW5rIG9mIGEg
Z2VuZXJhbCBzb2x1dGlvbiBjb3ZlcmluZyBhbGwgUFYgZGV2aWNlcyAoWGVuIGFuZCB2aXJ0
aW8pLg0KDQo+IA0KPj4+IFNvbWV0aGluZyBsaWtlIHRoaXM6DQo+Pj4gLS0tODwtLS0NCj4+
PiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYveGVuL2VubGlnaHRlbl9wdi5jIGIvYXJjaC94ODYv
eGVuL2VubGlnaHRlbl9wdi5jDQo+Pj4gaW5kZXggOWIxYTU4ZGRhOTM1Li42YWMzMmIwYjM3
MjAgMTAwNjQ0DQo+Pj4gLS0tIGEvYXJjaC94ODYveGVuL2VubGlnaHRlbl9wdi5jDQo+Pj4g
KysrIGIvYXJjaC94ODYveGVuL2VubGlnaHRlbl9wdi5jDQo+Pj4gQEAgLTExMSw3ICsxMTEs
NyBAQCBzdGF0aWMgREVGSU5FX1BFUl9DUFUoc3RydWN0IHRsc19kZXNjcywgc2hhZG93X3Rs
c19kZXNjKTsNCj4+PiAgICBzdGF0aWMgdm9pZCBfX2luaXQgeGVuX3B2X2luaXRfcGxhdGZv
cm0odm9pZCkNCj4+PiAgICB7DQo+Pj4gICAgICAgICAgIC8qIFBWIGd1ZXN0cyBjYW4ndCBv
cGVyYXRlIHZpcnRpbyBkZXZpY2VzIHdpdGhvdXQgZ3JhbnRzLiAqLw0KPj4+IC0gICAgICAg
aWYgKElTX0VOQUJMRUQoQ09ORklHX1hFTl9WSVJUSU8pKQ0KPj4+ICsgICAgICAgaWYgKElT
X0VOQUJMRUQoQ09ORklHX1hFTl9WSVJUSU8pICYmICF4ZW5faW5pdGlhbF9kb21haW4oKSkN
Cj4+PiAgICAgICAgICAgICAgICAgICB2aXJ0aW9fc2V0X21lbV9hY2NfY2IodmlydGlvX3Jl
cXVpcmVfcmVzdHJpY3RlZF9tZW1fYWNjKTsNCj4+PiAgICAgICAgICAgcG9wdWxhdGVfZXh0
cmFfcHRlKGZpeF90b192aXJ0KEZJWF9QQVJBVklSVF9CT09UTUFQKSk7DQo+Pj4gLS0tODwt
LS0NCj4+Pg0KPj4+IFRoaXMgQlRXIHJhaXNlcyBhbHNvIGEgcXVlc3Rpb24gd2hhdCB3aWxs
IGhhcHBlbiBvbiBYZW4gbmVzdGVkIGluc2lkZQ0KPj4+IFhlbiwgd2hlbiBMMCB3aWxsIHBy
b3ZpZGUgdmlydGlvIGRldmljZXMgdG8gTDEuIEdyYW50cyBzZXQgYnkgTDEgZG9tMA0KPj4+
IHdvdWxkbid0IHdvcmsgb24gTDAsIG5vPyBPciBtYXliZSB0aGlzIGlzIHNvbHZlZCBhbHJl
YWR5IGZvciBwdi1zaGltDQo+Pj4gY2FzZT8NCj4+DQo+PiBUaGlzIGlzIGEgc2ltaWxhciBw
cm9ibGVtIGFzIHdpdGggbm9ybWFsIFhlbiBQViBkZXZpY2VzLg0KPj4NCj4+IFlvdSB3aWxs
IG5lZWQgZWl0aGVyIGEgc2ltcGxlIGdyYW50IHBhc3N0aHJvdWdoIGxpa2Ugd2l0aCBwdi1z
aGltIChlbmFibGluZw0KPj4gc3VjaCBkZXZpY2VzIGZvciBvbmUgZ3Vlc3QgaW4gTDEgb25s
eSksIG9yIHlvdSBuZWVkIGEgZ3JhbnQgbXVsdGlwbGV4ZXIgaW4NCj4+IEwxIFhlbiBpbiBj
YXNlIHlvdSB3YW50IHRvIGJlIGFibGUgdG8gaGF2ZSBtdWx0aXBsZSBndWVzdHMgaW4gTDEg
YmVpbmcgYWJsZQ0KPj4gdG8NCj4+IHVzZSBMMCBQViBkZXZpY2VzLg0KPiANCj4gVGhpcyB3
aWxsIGJlIHRyaWNreSwgYXQgbGVhc3Qgd2l0aCB0aGUgY3VycmVudCBmcm9udGVuZCBkcml2
ZXJzLg0KPiBGcm9udGVuZCBrZXJuZWwgaXMgaW4gY2hhcmdlIG9mIGFzc2lnbmluZyBncmFu
dCByZWZzLCBfYW5kXw0KPiBjb21tdW5pY2F0aW5nIHRoZW0gdG8gdGhlIGJhY2tlbmQuIFN1
Y2ggbXVsdGlwbGV4ZXIgd291bGQgbmVlZCB0bw0KPiBpbnRlcmNlcHQgb25lIG9yIHRoZSBv
dGhlciAoZWl0aGVyIHRyYW5zbGF0ZSwgb3IgZW5zdXJlIHRoZXkgYXJlDQo+IGFsbG9jYXRl
ZCBmcm9tIGRpc3RpbmN0IHJhbmdlcyB0byBiZWdpbiB3aXRoKS4gSSBkb24ndCBzZWUgaG93
IHRoYXQNCj4gY291bGQgYmUgZG9uZSB3aXRoIHRoZSBjdXJyZW50IGRvbVUga2VybmVscy4g
VGhhdCBtaWdodCBiZSBiZXR0ZXIgd2l0aA0KPiB5b3VyIGlkZWEgb2YgbXVsdGlwbGUgZ3Jh
bnQgdjMgdHJlZXMsIHdoZXJlIHRoZSBoeXBlcnZpc29yIG1pZ2h0IGRpY3RhdGUNCj4gZ3Jh
bnQgcmFuZ2VzLg0KDQpZZXMsIHRoaXMgaXMgYW5vdGhlciBhZHZhbnRhZ2Ugb2YgdGhlIFYz
IGFwcHJvYWNoIEkgaGF2ZW4ndCB0aG91Z2h0IG9mDQpiZWZvcmUuDQoNCg0KSnVlcmdlbg0K

--------------fjSUt0fe7kaG94bxGExAt5A0
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

--------------fjSUt0fe7kaG94bxGExAt5A0--

--------------wCWm6l6XonyWJt5XkP5zz5Yq--

--------------jXOYyrPS0JxKApJ0juxhNY0I
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmM9nP0FAwAAAAAACgkQsN6d1ii/Ey/W
uQf7Bb1uwVE6RkAMdWx0uqHvKFf+EF+9qasbcDBZaDhEnxeVygWvXqgtIMArwrpntmF7G3o5/3un
gmywTj1+3t4RLb0lUHYCTVfW4fTYTndEu5H1E1TeyAfAXis/D5Y6ZazIN1dwEOVNXc7D31uaeE3p
JLRZVYB9QMnPPEfPs7Whz435B/coG/SykkP+uBCbaIeUyNKFt+8sFWN8RWri1KGiGomwoLhWr8b7
VHH+c1ZnXy5wW6ZKWX5sU9bjEZ/O6LFsbpHCeNVTTPkaMsYZwYyUaKHrfS6K+9qMnsFaEI0tpKJL
+1u2eJHpjBjw8yIJWBT/mwaiDSAGuxPWO+awx1uK8w==
=HR6U
-----END PGP SIGNATURE-----

--------------jXOYyrPS0JxKApJ0juxhNY0I--

