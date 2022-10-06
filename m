Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CFC5F62CC
	for <lists+xen-devel@lfdr.de>; Thu,  6 Oct 2022 10:35:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.416698.661356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogMK1-0008Ji-EM; Thu, 06 Oct 2022 08:33:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 416698.661356; Thu, 06 Oct 2022 08:33:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogMK1-0008He-BC; Thu, 06 Oct 2022 08:33:37 +0000
Received: by outflank-mailman (input) for mailman id 416698;
 Thu, 06 Oct 2022 08:33:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q1hL=2H=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ogMJz-0008HY-HX
 for xen-devel@lists.xenproject.org; Thu, 06 Oct 2022 08:33:35 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f965277-4551-11ed-9377-c1cf23e5d27e;
 Thu, 06 Oct 2022 10:33:32 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DE5EA211C5;
 Thu,  6 Oct 2022 08:33:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A621513AC8;
 Thu,  6 Oct 2022 08:33:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Qe6HJtuSPmMDNwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 06 Oct 2022 08:33:31 +0000
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
X-Inumbo-ID: 8f965277-4551-11ed-9377-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1665045211; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f84fUu8FF2HoufHTZF+oszZ3+hFbpHGmxBI1iSGYNac=;
	b=dv3vLSFj2uXfjANnb5Bz7Sq4ROrYR7wj1BGnTc84d0WVFXXgPKH0FJa7VE03cQksrGoyl8
	NtAh0LMnVnHlGwggHDtbuFRkWVAx5tRpNh7qxRnHC4GgDyNnTkFVs0XknBO9KzEG1eEMWp
	9V7nhstZMPTbSZAAO8U1wU5KIkAKEOo=
Message-ID: <21daa651-2a2b-6784-9702-1df6280ecfba@suse.com>
Date: Thu, 6 Oct 2022 10:33:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 1/2] xen/gntdev: Prevent leaking grants
Content-Language: en-US
To: "M. Vefa Bicakci" <m.v.b@runbox.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Demi Marie Obenour <demi@invisiblethingslab.com>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20221002222006.2077-1-m.v.b@runbox.com>
 <20221002222006.2077-2-m.v.b@runbox.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20221002222006.2077-2-m.v.b@runbox.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ObhQWZReGCG3CKnwa2Ynws2Z"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ObhQWZReGCG3CKnwa2Ynws2Z
Content-Type: multipart/mixed; boundary="------------53eJmbHYS2rLGzhhiPEmCEE2";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: "M. Vefa Bicakci" <m.v.b@runbox.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Demi Marie Obenour <demi@invisiblethingslab.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <21daa651-2a2b-6784-9702-1df6280ecfba@suse.com>
Subject: Re: [PATCH v2 1/2] xen/gntdev: Prevent leaking grants
References: <20221002222006.2077-1-m.v.b@runbox.com>
 <20221002222006.2077-2-m.v.b@runbox.com>
In-Reply-To: <20221002222006.2077-2-m.v.b@runbox.com>

--------------53eJmbHYS2rLGzhhiPEmCEE2
Content-Type: multipart/mixed; boundary="------------0V00g0GOlj0nw1uaLkxh081c"

--------------0V00g0GOlj0nw1uaLkxh081c
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDMuMTAuMjIgMDA6MjAsIE0uIFZlZmEgQmljYWtjaSB3cm90ZToNCj4gUHJpb3IgdG8g
dGhpcyBjb21taXQsIGlmIGEgZ3JhbnQgbWFwcGluZyBvcGVyYXRpb24gZmFpbGVkIHBhcnRp
YWxseSwNCj4gc29tZSBvZiB0aGUgZW50cmllcyBpbiB0aGUgbWFwX29wcyBhcnJheSB3b3Vs
ZCBiZSBpbnZhbGlkLCB3aGVyZWFzIGFsbA0KPiBvZiB0aGUgZW50cmllcyBpbiB0aGUga21h
cF9vcHMgYXJyYXkgd291bGQgYmUgdmFsaWQuIFRoaXMgaW4gdHVybiB3b3VsZA0KPiBjYXVz
ZSB0aGUgZm9sbG93aW5nIGxvZ2ljIGluIGdudGRldl9tYXBfZ3JhbnRfcGFnZXMgdG8gYmVj
b21lIGludmFsaWQ6DQo+IA0KPiAgICBmb3IgKGkgPSAwOyBpIDwgbWFwLT5jb3VudDsgaSsr
KSB7DQo+ICAgICAgaWYgKG1hcC0+bWFwX29wc1tpXS5zdGF0dXMgPT0gR05UU1Rfb2theSkg
ew0KPiAgICAgICAgbWFwLT51bm1hcF9vcHNbaV0uaGFuZGxlID0gbWFwLT5tYXBfb3BzW2ld
LmhhbmRsZTsNCj4gICAgICAgIGlmICghdXNlX3B0ZW1vZCkNCj4gICAgICAgICAgYWxsb2Nl
ZCsrOw0KPiAgICAgIH0NCj4gICAgICBpZiAodXNlX3B0ZW1vZCkgew0KPiAgICAgICAgaWYg
KG1hcC0+a21hcF9vcHNbaV0uc3RhdHVzID09IEdOVFNUX29rYXkpIHsNCj4gICAgICAgICAg
aWYgKG1hcC0+bWFwX29wc1tpXS5zdGF0dXMgPT0gR05UU1Rfb2theSkNCj4gICAgICAgICAg
ICBhbGxvY2VkKys7DQo+ICAgICAgICAgIG1hcC0+a3VubWFwX29wc1tpXS5oYW5kbGUgPSBt
YXAtPmttYXBfb3BzW2ldLmhhbmRsZTsNCj4gICAgICAgIH0NCj4gICAgICB9DQo+ICAgIH0N
Cj4gICAgLi4uDQo+ICAgIGF0b21pY19hZGQoYWxsb2NlZCwgJm1hcC0+bGl2ZV9ncmFudHMp
Ow0KPiANCj4gQXNzdW1lIHRoYXQgdXNlX3B0ZW1vZCBpcyB0cnVlIChpLmUuLCB0aGUgZG9t
YWluIG1hcHBpbmcgdGhlIGdyYW50ZWQNCj4gcGFnZXMgaXMgYSBwYXJhdmlydHVhbGl6ZWQg
ZG9tYWluKS4gSW4gdGhlIGNvZGUgZXhjZXJwdCBhYm92ZSwgbm90ZSB0aGF0DQo+IHRoZSAi
YWxsb2NlZCIgdmFyaWFibGUgaXMgb25seSBpbmNyZW1lbnRlZCB3aGVuIGJvdGgga21hcF9v
cHNbaV0uc3RhdHVzDQo+IGFuZCBtYXBfb3BzW2ldLnN0YXR1cyBhcmUgc2V0IHRvIEdOVFNU
X29rYXkgKGkuZS4sIGJvdGggbWFwcGluZw0KPiBvcGVyYXRpb25zIGFyZSBzdWNjZXNzZnVs
KS4gIEhvd2V2ZXIsIGFzIGFsc28gbm90ZWQgYWJvdmUsIHRoZXJlIGFyZQ0KPiBjYXNlcyB3
aGVyZSBhIGdyYW50IG1hcHBpbmcgb3BlcmF0aW9uIGZhaWxzIHBhcnRpYWxseSwgYnJlYWtp
bmcgdGhlDQo+IGFzc3VtcHRpb24gb2YgdGhlIGNvZGUgZXhjZXJwdCBhYm92ZS4NCj4gDQo+
IFRoZSBhZm9yZW1lbnRpb25lZCBjYXVzZXMgbWFwLT5saXZlX2dyYW50cyB0byBiZSBpbmNv
cnJlY3RseSBzZXQuIEluDQo+IHNvbWUgY2FzZXMsIGFsbCBvZiB0aGUgbWFwX29wcyBtYXBw
aW5ncyBmYWlsLCBidXQgYWxsIG9mIHRoZSBrbWFwX29wcw0KPiBtYXBwaW5ncyBzdWNjZWVk
LCBtZWFuaW5nIHRoYXQgbGl2ZV9ncmFudHMgbWF5IHJlbWFpbiB6ZXJvLiBUaGlzIGluIHR1
cm4NCj4gbWFrZXMgaXQgaW1wb3NzaWJsZSB0byB1bm1hcCB0aGUgc3VjY2Vzc2Z1bGx5IGdy
YW50LW1hcHBlZCBwYWdlcyBwb2ludGVkDQo+IHRvIGJ5IGttYXBfb3BzLCBiZWNhdXNlIHVu
bWFwX2dyYW50X3BhZ2VzIGhhcyB0aGUgZm9sbG93aW5nIHNuaXBwZXQgb2YNCj4gY29kZSBh
dCBpdHMgYmVnaW5uaW5nOg0KPiANCj4gICAgaWYgKGF0b21pY19yZWFkKCZtYXAtPmxpdmVf
Z3JhbnRzKSA9PSAwKQ0KPiAgICAgIHJldHVybjsgLyogTm90aGluZyB0byBkbyAqLw0KPiAN
Cj4gSW4gb3RoZXIgY2FzZXMgd2hlcmUgb25seSBzb21lIG9mIHRoZSBtYXBfb3BzIG1hcHBp
bmdzIGZhaWwgYnV0IGFsbA0KPiBrbWFwX29wcyBtYXBwaW5ncyBzdWNjZWVkLCBsaXZlX2dy
YW50cyBpcyBtYWRlIHBvc2l0aXZlLCBidXQgd2hlbiB0aGUNCj4gdXNlciByZXF1ZXN0cyB1
bm1hcHBpbmcgdGhlIGdyYW50LW1hcHBlZCBwYWdlcywgX191bm1hcF9ncmFudF9wYWdlc19k
b25lDQo+IHdpbGwgdGhlbiBtYWtlIG1hcC0+bGl2ZV9ncmFudHMgbmVnYXRpdmUsIGJlY2F1
c2UgdGhlIGxhdHRlciBmdW5jdGlvbg0KPiBkb2VzIG5vdCBjaGVjayBpZiBhbGwgb2YgdGhl
IHBhZ2VzIHRoYXQgd2VyZSByZXF1ZXN0ZWQgdG8gYmUgdW5tYXBwZWQNCj4gd2VyZSBhY3R1
YWxseSB1bm1hcHBlZCwgYW5kIHRoZSBzYW1lIGZ1bmN0aW9uIHVuY29uZGl0aW9uYWxseSBz
dWJ0cmFjdHMNCj4gImRhdGEtPmNvdW50IiAoaS5lLiwgYSB2YWx1ZSB0aGF0IGNhbiBiZSBn
cmVhdGVyIHRoYW4gbWFwLT5saXZlX2dyYW50cykNCj4gZnJvbSBtYXAtPmxpdmVfZ3JhbnRz
LiBUaGUgc2lkZSBlZmZlY3RzIG9mIGEgbmVnYXRpdmUgbGl2ZV9ncmFudHMgdmFsdWUNCj4g
aGF2ZSBub3QgYmVlbiBzdHVkaWVkLg0KPiANCj4gVGhlIG5ldCBlZmZlY3Qgb2YgYWxsIG9m
IHRoaXMgaXMgdGhhdCBncmFudCByZWZlcmVuY2VzIGFyZSBsZWFrZWQgaW4gb25lDQo+IG9m
IHRoZSBhYm92ZSBjb25kaXRpb25zLiBJbiBRdWJlcyBPUyB2NC4xICh3aGljaCB1c2VzIFhl
bidzIGdyYW50DQo+IG1lY2hhbmlzbSBleHRlbnNpdmVseSBmb3IgWDExIEdVSSBpc29sYXRp
b24pLCB0aGlzIGlzc3VlIG1hbmlmZXN0cw0KPiBpdHNlbGYgd2l0aCB3YXJuaW5nIG1lc3Nh
Z2VzIGxpa2UgdGhlIGZvbGxvd2luZyB0byBiZSBwcmludGVkIG91dCBieSB0aGUNCj4gTGlu
dXgga2VybmVsIGluIHRoZSBWTSB0aGF0IGhhZCBncmFudGVkIHBhZ2VzICh0aGF0IGNvbnRh
aW4gWDExIEdVSQ0KPiB3aW5kb3cgZGF0YSkgdG8gZG9tMDogImcuZS4gMHgxMjM0IHN0aWxs
IHBlbmRpbmciLCBlc3BlY2lhbGx5IGFmdGVyIHRoZQ0KPiB1c2VyIHJhcGlkbHkgcmVzaXpl
cyBHVUkgVk0gd2luZG93cyAoY2F1c2luZyBzb21lIGdyYW50LW1hcHBpbmcNCj4gb3BlcmF0
aW9ucyB0byBwYXJ0aWFsbHkgb3IgY29tcGxldGVseSBmYWlsLCBkdWUgdG8gdGhlIGZhY3Qg
dGhhdCB0aGUgVk0NCj4gdW5zaGFyZXMgc29tZSBvZiB0aGUgcGFnZXMgYXMgcGFydCBvZiB0
aGUgd2luZG93IHJlc2l6aW5nLCBtYWtpbmcgdGhlDQo+IHBhZ2VzIGltcG9zc2libGUgdG8g
Z3JhbnQtbWFwIGZyb20gZG9tMCkuDQo+IA0KPiBUaGUgZml4IGZvciB0aGlzIGlzc3VlIGlu
dm9sdmVzIGNvdW50aW5nIGFsbCBzdWNjZXNzZnVsIG1hcF9vcHMgYW5kDQo+IGttYXBfb3Bz
IG1hcHBpbmdzIHNlcGFyYXRlbHksIGFuZCB0aGVuIGFkZGluZyB0aGUgc3VtIHRvIGxpdmVf
Z3JhbnRzLg0KPiBEdXJpbmcgdW5tYXBwaW5nLCBvbmx5IHRoZSBudW1iZXIgb2Ygc3VjY2Vz
c2Z1bGx5IHVubWFwcGVkIGdyYW50cyBpcw0KPiBzdWJ0cmFjdGVkIGZyb20gbGl2ZV9ncmFu
dHMuIFRoZSBjb2RlIGlzIGFsc28gbW9kaWZpZWQgdG8gY2hlY2sgZm9yDQo+IG5lZ2F0aXZl
IGxpdmVfZ3JhbnRzIHZhbHVlcyBhZnRlciB0aGUgc3VidHJhY3Rpb24gYW5kIHdhcm4gdGhl
IHVzZXIuDQo+IA0KPiBMaW5rOiBodHRwczovL2dpdGh1Yi5jb20vUXViZXNPUy9xdWJlcy1p
c3N1ZXMvaXNzdWVzLzc2MzENCj4gRml4ZXM6IGRiZTk3Y2ZmN2RkOSAoInhlbi9nbnRkZXY6
IEF2b2lkIGJsb2NraW5nIGluIHVubWFwX2dyYW50X3BhZ2VzKCkiKQ0KPiBDYzogc3RhYmxl
QHZnZXIua2VybmVsLm9yZw0KPiBTaWduZWQtb2ZmLWJ5OiBNLiBWZWZhIEJpY2FrY2kgPG0u
di5iQHJ1bmJveC5jb20+DQoNClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NA
c3VzZS5jb20+DQoNCg0KSnVlcmdlbg0KDQo=
--------------0V00g0GOlj0nw1uaLkxh081c
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

--------------0V00g0GOlj0nw1uaLkxh081c--

--------------53eJmbHYS2rLGzhhiPEmCEE2--

--------------ObhQWZReGCG3CKnwa2Ynws2Z
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmM+ktsFAwAAAAAACgkQsN6d1ii/Ey+o
sQgAhJiP7E3c9gOBneKlaQ6JE/Cj1XwZmds5Q9ZPeZMwuX79oBh+/dYSFjkJss2tji+dkDT/hqgz
c6OUYvDC2DNUB6eYX358dstqyv0d9I9KZmTCSKM6ZbflLGlwijCYJL3BHZcb/W40RWSpsneygSv8
hnCPThgXKjSlx75n5Ke9VQHvEhMuXZecRV3TIQtKqtcHaIcJMygf1clj/G9NVdTqN0WYAH4G1dPT
vI1l9FDddAs7F3k+ZZ2lgdYwAq3BCFRJoi6FHDn3PLgeYyoDQjUxeBUDXi/yuqeJ1dsP/1Ykx8HT
LCrywnJlfzwPFV0TwrPoHT3i9QH1v3c06746drocwA==
=zAam
-----END PGP SIGNATURE-----

--------------ObhQWZReGCG3CKnwa2Ynws2Z--

