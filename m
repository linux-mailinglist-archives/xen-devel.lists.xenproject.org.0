Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B40166BEB33
	for <lists+xen-devel@lfdr.de>; Fri, 17 Mar 2023 15:29:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511125.789983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pdB4b-0005gc-OO; Fri, 17 Mar 2023 14:28:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511125.789983; Fri, 17 Mar 2023 14:28:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pdB4b-0005eu-KU; Fri, 17 Mar 2023 14:28:49 +0000
Received: by outflank-mailman (input) for mailman id 511125;
 Fri, 17 Mar 2023 14:28:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hL2n=7J=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pdB4Z-0005eo-MG
 for xen-devel@lists.xenproject.org; Fri, 17 Mar 2023 14:28:47 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 059ff75f-c4d0-11ed-b464-930f4c7d94ae;
 Fri, 17 Mar 2023 15:28:45 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B609F1FDB2;
 Fri, 17 Mar 2023 14:28:43 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8BA691346F;
 Fri, 17 Mar 2023 14:28:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MkjNIBt5FGQ2eAAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 17 Mar 2023 14:28:43 +0000
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
X-Inumbo-ID: 059ff75f-c4d0-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1679063323; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=O5Jf0xVKE+pUtHLXlGBgyhF8R2BilaEQbONAuLxM17E=;
	b=Wk841XGluEPkTv6g78YmXnc0Ka0Awn7LHF4owmlBmEuP5/kFEBQNw6tPA7+UI6yfrhOSTb
	IUqKz6eDYQNRap8O+akCfo5Vab8+TkJWlFjZEE9QH4al/GNtv9EmUW3hZ5mr8VxbQw3ldX
	dLuTV+uFAe4QSVB2rfzBwPoQ4Njvt/Y=
Message-ID: <a02a2f7d-ab76-b755-584b-f738884abd04@suse.com>
Date: Fri, 17 Mar 2023 15:28:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] x86/Xen: make use of IBPB controlling VM assist
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <06591b64-2f05-a4cc-a2f3-a74c3c4a76d6@suse.com>
 <51ae9cad-3644-02cb-9cc7-28229987487d@suse.com>
 <c4d2641f-7a99-fd8a-53c5-faa277c572a2@oracle.com>
 <4e66865b-11ce-cbd1-d115-13e3743eed7b@oracle.com>
 <f4f8c6ff-8d3a-92aa-66a0-7978c989a42f@suse.com>
 <cf55f9d9-42c2-f5e3-ed91-f75cc4ee9641@suse.com>
 <f2bd16f5-7f5b-7a0e-7cd2-e2a9dbf22102@citrix.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <f2bd16f5-7f5b-7a0e-7cd2-e2a9dbf22102@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------jMCRNha8YFcuOmnexg39V0o0"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------jMCRNha8YFcuOmnexg39V0o0
Content-Type: multipart/mixed; boundary="------------ErDrWyFUvV0tIzROYT5TvXQR";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <a02a2f7d-ab76-b755-584b-f738884abd04@suse.com>
Subject: Re: [PATCH] x86/Xen: make use of IBPB controlling VM assist
References: <06591b64-2f05-a4cc-a2f3-a74c3c4a76d6@suse.com>
 <51ae9cad-3644-02cb-9cc7-28229987487d@suse.com>
 <c4d2641f-7a99-fd8a-53c5-faa277c572a2@oracle.com>
 <4e66865b-11ce-cbd1-d115-13e3743eed7b@oracle.com>
 <f4f8c6ff-8d3a-92aa-66a0-7978c989a42f@suse.com>
 <cf55f9d9-42c2-f5e3-ed91-f75cc4ee9641@suse.com>
 <f2bd16f5-7f5b-7a0e-7cd2-e2a9dbf22102@citrix.com>
In-Reply-To: <f2bd16f5-7f5b-7a0e-7cd2-e2a9dbf22102@citrix.com>

--------------ErDrWyFUvV0tIzROYT5TvXQR
Content-Type: multipart/mixed; boundary="------------PAlJTD5ytSy2vXPGCAdibZ0Q"

--------------PAlJTD5ytSy2vXPGCAdibZ0Q
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTcuMDMuMjMgMTU6MjEsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDE3LzAzLzIw
MjMgMTo1NiBwbSwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+IE9uIDE1LjAyLjIzIDA5OjMx
LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+PiBPbiAxNS4wMi4yMDIzIDAxOjA3LCBCb3JpcyBP
c3Ryb3Zza3kgd3JvdGU6DQo+Pj4+DQo+Pj4+IE9uIDIvMTQvMjMgNjo1MyBQTSwgQm9yaXMg
T3N0cm92c2t5IHdyb3RlOg0KPj4+Pj4NCj4+Pj4+IE9uIDIvMTQvMjMgMTE6MTMgQU0sIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+Pj4NCj4+Pj4+PiAtLS0gYS9hcmNoL3g4Ni9rZXJuZWwv
Y3B1L2J1Z3MuYw0KPj4+Pj4+ICsrKyBiL2FyY2gveDg2L2tlcm5lbC9jcHUvYnVncy5jDQo+
Pj4+Pj4gQEAgLTE4LDYgKzE4LDggQEANCj4+Pj4+PiAgwqDCoCAjaW5jbHVkZSA8bGludXgv
cGd0YWJsZS5oPg0KPj4+Pj4+ICDCoMKgICNpbmNsdWRlIDxsaW51eC9icGYuaD4NCj4+Pj4+
PiAgwqDCoCArI2luY2x1ZGUgPHhlbi94ZW4uaD4NCj4+Pj4+PiArDQo+Pj4+Pj4gIMKgwqAg
I2luY2x1ZGUgPGFzbS9zcGVjLWN0cmwuaD4NCj4+Pj4+PiAgwqDCoCAjaW5jbHVkZSA8YXNt
L2NtZGxpbmUuaD4NCj4+Pj4+PiAgwqDCoCAjaW5jbHVkZSA8YXNtL2J1Z3MuaD4NCj4+Pj4+
PiBAQCAtMzIsNiArMzQsNyBAQA0KPj4+Pj4+ICDCoMKgICNpbmNsdWRlIDxhc20vaW50ZWwt
ZmFtaWx5Lmg+DQo+Pj4+Pj4gIMKgwqAgI2luY2x1ZGUgPGFzbS9lODIwL2FwaS5oPg0KPj4+
Pj4+ICDCoMKgICNpbmNsdWRlIDxhc20vaHlwZXJ2aXNvci5oPg0KPj4+Pj4+ICsjaW5jbHVk
ZSA8YXNtL3hlbi9oeXBlcnZpc29yLmg+DQo+Pj4+Pj4gIMKgwqAgI2luY2x1ZGUgPGFzbS90
bGJmbHVzaC5oPg0KPj4+Pj4+ICDCoMKgIMKgICNpbmNsdWRlICJjcHUuaCINCj4+Pj4+PiBA
QCAtOTM0LDcgKzkzNyw4IEBAIGRvX2NtZF9hdXRvOg0KPj4+Pj4+ICDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBicmVhazsNCj4+Pj4+PiAgwqDCoCDCoMKgwqDCoMKgIGNhc2UgUkVUQkxFRURf
TUlUSUdBVElPTl9JQlBCOg0KPj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCBzZXR1cF9mb3JjZV9j
cHVfY2FwKFg4Nl9GRUFUVVJFX0VOVFJZX0lCUEIpOw0KPj4+Pj4+ICvCoMKgwqDCoMKgwqDC
oCBpZiAoIXhlbl9wdl9kb21haW4oKSB8fCB4ZW5fdm1fYXNzaXN0X2licGIodHJ1ZSkpDQo+
Pj4+Pg0KPj4+Pj4NCj4+Pj4+IElzIHRoaXMgZ29pbmcgdG8gY29tcGlsZSB3aXRob3V0IENP
TkZJR19YRU4/DQo+Pj4NCj4+PiBZZXMuIFRoZSBkZWNsYXJhdGlvbiBvZiB4ZW5fdm1fYXNz
aXN0X2licGIoKSBpcyB2aXNpYmxlIChzYXRpc2Z5aW5nDQo+Pj4gdGhlIGNvbXBpbGVyKSBh
bmQgRENFIHdpbGwgZWxpbWluYXRlIHRoZSBjYWxsIHRvIHRoZSBmdW5jdGlvbiBkdWUgdG8N
Cj4+PiB4ZW5fcHZfZG9tYWluKCkgYmVpbmcgY29uc3RhbnQgImZhbHNlIiBpbiB0aGF0IGNh
c2UsIGF2b2lkaW5nIGFueQ0KPj4+IGxpbmtpbmcgaXNzdWVzLiBUaGUgaW50ZXJlc3Rpbmcg
Y2FzZSBoZXJlIHJlYWxseSBpcyBidWlsZGluZyB3aXRoDQo+Pj4gWEVOIGJ1dCB3aXRob3V0
IFhFTl9QVjogVGhhdCdzIHdoeSBJIG5lZWRlZCB0byBwdXQgdGhlIGZ1bmN0aW9uIGluDQo+
Pj4gZW5saWdodGVuLmMuIFRoaXMgd291bGRuJ3QgYmUgbmVlZGVkIGlmIHhlbl9wdl9kb21h
aW4oKSB3YXMgYWxzbw0KPj4+IGNvbnN0YW50ICJmYWxzZSIgaW4gdGhhdCBjYXNlIChqdXN0
IGxpa2UgeGVuX3B2aF9kb21haW4oKSBpcyB3aGVuDQo+Pj4gIVhFTl9QVkgpLg0KPj4+DQo+
Pj4+PiBJIGFsc28gdGhpbmsgdGhlc2UgdHdvIGNvbmRpdGlvbnMgc2hvdWxkIGJlIHdyYXBw
ZWQgaW50byBzb21ldGhpbmcNCj4+Pj4+IHRvIGxpbWl0IGV4cG9zdXJlIG9mIG5vbi1YZW4g
Y29kZSB0byBYZW4tc3BlY2lmaWMgcHJpbWl0aXZlcy4NCj4+Pg0KPj4+IEkgd291bGQgaGF2
ZSBkb25lIHNvLCBpZiBJIGhhZCBhbnkgaGFsZndheSBzZW5zaWJsZSBpZGVhIG9uIGhvdyB0
bw0KPj4+IGdvIGFib3V0IGRvaW5nIHNvIGluIHRoaXMgcGFydGljdWxhciBjYXNlLiBJbiB0
aGUgYWJzZW5jZSBvZiB0aGF0IGl0DQo+Pj4gbG9va2VkIG9rYXktaXNoIHRvIG1lIHRvIHJl
ZmVyZW5jZSBYZW4gZnVuY3Rpb25zIGRpcmVjdGx5IGhlcmUuDQo+Pj4NCj4+Pj4gT2gsIGFu
ZCB0aGlzIG5lZWRzIHg4NiBtYWludGFpbmVycy4NCj4+Pg0KPj4+IEV2ZW50dWFsbHkgeWVz
LiBCdXQgSSB3b3VsZCBwcmVmZXIgdG8gc29ydCB0aGUgYWJvdmUgcXVlc3Rpb24gZmlyc3QN
Cj4+PiAod2hpY2ggSSdtIHN1cmUgd291bGQgaGF2ZSBiZWVuIHJhaXNlZCBieSB0aGVtLCBp
biBwZXJoYXBzIG1vcmUNCj4+PiBoYXJzaCBhIHdheSksIGhlbmNlIHRoZSBpbml0aWFsbHkg
bGltaXRlZCBleHBvc3VyZS4NCj4+DQo+PiBJJ2QgcmF0aGVyIGFkZCBfb25lXyBob29rIGZv
ciBYZW4tUFYgaW4gY2hlY2tfYnVncygpIGp1c3QgYmVmb3JlIHRoZSBjYWxsDQo+PiBvZiBh
cmNoX3NtdF91cGRhdGUoKS4gVGhpcyBjYW4gdGhlbiBjb3JyZWN0IGFueSBuZWVkZWQgbWl0
aWdhdGlvbg0KPj4gc2V0dGluZ3MuDQo+Pg0KPj4gU28gc29tZXRoaW5nIGxpa2UgKG5vdGUg
dGhhdCBkdWUgdG8gdXNpbmcNCj4+IGNwdV9mZWF0dXJlX2VuYWJsZWQoWDg2X0ZFQVRVUkVf
WEVOUFYpDQo+PiBEQ0UgaXMgaGFwcGVuaW5nIGluIGNhc2UgQ09ORklHX1hFTl9QViBpc24n
dCBkZWZpbmVkKSI6DQo+Pg0KPj4gLS0tIGEvYXJjaC94ODYvaW5jbHVkZS9hc20veGVuL2h5
cGVydmlzb3IuaA0KPj4gKysrIGIvYXJjaC94ODYvaW5jbHVkZS9hc20veGVuL2h5cGVydmlz
b3IuaA0KPj4gQEAgLTYzLDQgKzYzLDcgQEAgdm9pZCBfX2luaXQgeGVuX3B2aF9pbml0KHN0
cnVjdCBib290X3BhcmFtcw0KPj4gKmJvb3RfcGFyYW1zKTsNCj4+ICDCoHZvaWQgX19pbml0
IG1lbV9tYXBfdmlhX2hjYWxsKHN0cnVjdCBib290X3BhcmFtcyAqYm9vdF9wYXJhbXNfcCk7
DQo+PiAgwqAjZW5kaWYNCj4+DQo+PiAraW50IF9faW5pdCB4ZW5fdm1fYXNzaXN0X2licGIo
Ym9vbCBlbmFibGUpOw0KPj4gK3ZvaWQgX19pbml0IHhlbl9wdl9maXhfbWl0aWdhdGlvbnMo
dm9pZCk7DQo+IA0KPiBJJ2Qgc3VnZ2VzdCAnYWRqdXN0JyBpbiBwcmVmZXJlbmNlIHRvICdm
aXgnLCBidXQgdGhpcyBjb3VsZCBlcXVhbGx5IGJlDQo+IHhlbl9wdl9taXRpZ2F0aW9ucygp
Lg0KPiANCj4gWGVuUFYgaGFzIHZlcnkgbGVnaXRpbWF0ZSByZWFzb25zIHRvIGFkanVzdCB0
aGluZ3Mgb3dpbmcgdG8gaXQgcnVubmluZw0KPiBpbiBSaW5nMywgYnV0ICJmaXgiIGNvbWVz
IHdpdGggb3RoZXIgaW1wbGljYXRpb25zIHRvby4NCj4gDQo+PiAtLS0gYS9hcmNoL3g4Ni94
ZW4vZW5saWdodGVuX3B2LmMNCj4+ICsrKyBiL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHYu
Yw0KPj4gQEAgLTE0NzYsNiArMTQ3NiwyMyBAQCBzdGF0aWMgdWludDMyX3QgX19pbml0IHhl
bl9wbGF0Zm9ybV9wdih2b2lkKQ0KPj4gIMKgwqDCoMKgwqDCoMKgIHJldHVybiAwOw0KPj4g
IMKgfQ0KPj4NCj4+ICtpbnQgX19pbml0IHhlbl92bV9hc3Npc3RfaWJwYihib29sIGVuYWJs
ZSkNCj4+ICt7DQo+PiArwqDCoMKgwqDCoMKgIC8qDQo+PiArwqDCoMKgwqDCoMKgwqAgKiBO
b3RlIHRoYXQgdGhlIFZNLWFzc2lzdCBpcyBhIGRpc2FibGUsIHNvIGEgcmVxdWVzdCB0bw0K
Pj4gZW5hYmxlIElCUEINCj4+ICvCoMKgwqDCoMKgwqDCoCAqIG9uIG91ciBiZWhhbGYgbmVl
ZHMgdG8gdHVybiB0aGUgZnVuY3Rpb25hbGl0eSBvZmYgKGFuZCB2aWNlDQo+PiB2ZXJzYSku
DQo+PiArwqDCoMKgwqDCoMKgwqAgKi8NCj4+ICvCoMKgwqDCoMKgwqAgcmV0dXJuIEhZUEVS
VklTT1Jfdm1fYXNzaXN0KGVuYWJsZSA/IFZNQVNTVF9DTURfZGlzYWJsZQ0KPj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgOiBWTUFTU1RfQ01EX2VuYWJsZSwNCj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBWTUFTU1RfVFlQRV9tb2RlX3N3aXRjaF9ub19pYnBiKTsNCj4+ICt9DQo+
PiArDQo+PiArdm9pZCBfX2luaXQgeGVuX3B2X2ZpeF9taXRpZ2F0aW9ucyh2b2lkKQ0KPj4g
K3sNCj4+ICvCoMKgwqDCoMKgwqAgaWYgKCF4ZW5fdm1fYXNzaXN0X2licGIodHJ1ZSkpDQo+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzZXR1cF9jbGVhcl9jcHVfY2FwKFg4
Nl9GRUFUVVJFX0VOVFJZX0lCUEIpOw0KPiANCj4gSWYgbm90aGluZyBlbHNlLCB0aGlzIG5l
ZWRzIGEgY29tbWVudCBleHBsYWluaW5nIHdoYXQncyBnb2luZyBvbi4NCj4gDQo+ICJYZW4g
UFYgZ3Vlc3Qga2VybmVscyBydW4gaW4gcmluZzMsIHNvIHNoYXJlIHRoZSBzYW1lIHByZWRp
Y3Rpb24gZG9tYWluDQo+IGFzIHVzZXJzcGFjZS7CoCBYZW4gKHNpbmNlIHZlcnNpb24gJFgp
IGRlZmF1bHQgdG8gaXNzdWluZyBhbiBJQlBCIG9uDQo+IGd1ZXN0IHVzZXIgLT4gZ3Vlc3Qg
a2VybmVsIHRyYW5zaXRpb25zIG9uIGJlaGFsZiBvZiB0aGUgZ3Vlc3Qga2VybmVsLg0KPiBJ
ZiBMaW51eCBpc24ndCBkZXBlbmRpbmcgb24gbW9kZSBiYXNlZCBwcmVkaWN0aW9uIHNlcGFy
YXRpb24sIHR1cm4gdGhpcw0KPiBiZWhhdmlvdXIgb2ZmIi4NCj4gDQo+IEJ1dCB0aGlzIGRv
ZXMgb3BlbiB0aGUgbmV4dCBxdWVzdGlvbi7CoCBZZXMsIHVuaWxhdGVyYWxseSB0dXJuaW5n
IHR1cm5pbmcNCj4gdGhpcyBvZmYgcmVzdG9yZXMgdGhlIHByaW9yIGJlaGF2aW91ciwgYnV0
IGlzIHRoaXMgcmVhbGx5IHRoZSBiZXN0IHRoaW5nDQo+IHRvIGRvID8NCg0KSSBiZWxpZXZl
IHRoaXMgcXVlc3Rpb24gaXMgcHJpbWFyaWx5IGZvciBKYW4sIGFzIGhlIGlzIHRoZSBpbml0
aWFsIGF1dGhvciBvZg0KdGhlIHBhdGNoLg0KDQpJIHdhcyBqdXN0IHN1Z2dlc3RpbmcgYSB2
YXJpYW50IHdoaWNoIGlzIElNSE8gbW9yZSBwcm9iYWJsZSB0byBiZSBhY2NlcHRlZCBieQ0K
dGhlIHg4NiBtYWludGFpbmVycy4gOi0pDQoNCg0KSnVlcmdlbg0K
--------------PAlJTD5ytSy2vXPGCAdibZ0Q
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------PAlJTD5ytSy2vXPGCAdibZ0Q--

--------------ErDrWyFUvV0tIzROYT5TvXQR--

--------------jMCRNha8YFcuOmnexg39V0o0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmQUeRsFAwAAAAAACgkQsN6d1ii/Ey8M
twf/e4B60jazDuJR4Xx/NxF8XYx2wbMYce2ISaH+OodJqJ/blogYkMFD1clRlINiKzIQ3GYrlKui
jALFsJttxPKrTyHV/l7DFwRMbvJyJW5Ctm2oSivwqK3PRiCXu7O9kXbhb0e613bLdnoJFoACA33q
c8R2Uz5hc7+aQdJCwd0xfjBEu9mAIngTMwXtMYQ8gulRESbHB+x8+hwMnEq2JtWdwIXAYzNF+JY7
fvtGBfiKN9wNjT1gO92GTJCFzxO3utB/1/7DKMxbUh4BBwTo1R4G4tDvFzdMduXQVzWBFilrfaOC
6Q7BYx6pG1jMGIpms7cYiUvmDfa3ABTHAoF/KDzN5w==
=kLl2
-----END PGP SIGNATURE-----

--------------jMCRNha8YFcuOmnexg39V0o0--

