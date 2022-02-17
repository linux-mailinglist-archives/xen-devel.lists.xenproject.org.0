Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A8D4B9D3E
	for <lists+xen-devel@lfdr.de>; Thu, 17 Feb 2022 11:34:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274604.470128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKe7E-00081B-O5; Thu, 17 Feb 2022 10:34:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274604.470128; Thu, 17 Feb 2022 10:34:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKe7E-0007yE-JW; Thu, 17 Feb 2022 10:34:24 +0000
Received: by outflank-mailman (input) for mailman id 274604;
 Thu, 17 Feb 2022 10:34:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9h7v=TA=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nKe7C-0007y8-TR
 for xen-devel@lists.xenproject.org; Thu, 17 Feb 2022 10:34:23 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29d8b545-8fdd-11ec-b215-9bbe72dcb22c;
 Thu, 17 Feb 2022 11:34:19 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2E2701F383;
 Thu, 17 Feb 2022 10:34:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 04B1313DD8;
 Thu, 17 Feb 2022 10:34:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id M3CaOqwkDmLrQgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 17 Feb 2022 10:34:20 +0000
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
X-Inumbo-ID: 29d8b545-8fdd-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1645094061; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tzOPpUpRF2XYpvTTZJG459hyrAZp/dMMpSBvT6SUPjY=;
	b=hNsDtZEKpoRXeOF9iXKS7SHTzBgvKDjcXoSNVhWqWwEXoGLrz0qotPJU7+nioiVTWzWp3p
	VhkQMJZO+eRvRC2MPpOisLNY2RCaJqnS6/U/3f+fiwyB6RnQ/Dc2sOHMJBGbTyQJYnYUyu
	BlRTScddI3R1YHmcHihf+L+5F79cKVM=
Message-ID: <c07cb7f8-c936-c383-a860-045e80e2f1ef@suse.com>
Date: Thu, 17 Feb 2022 11:34:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v2 04/70] x86/pv-shim: Don't modify the hypercall table
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
 <20220214125127.17985-5-andrew.cooper3@citrix.com>
 <4d8ab414-caf4-5a12-4cb7-a88c633cfd66@suse.com>
 <e18c0c5a-d00b-adf9-d4b0-28e702a18241@srcf.net>
 <6566bf52-58da-f804-f5c2-fca64c1f150c@suse.com>
 <f0889e93-aec0-443e-b3fc-081892edaf2b@citrix.com>
 <44e0ab16-e807-c8f5-deef-7094b7aecdeb@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <44e0ab16-e807-c8f5-deef-7094b7aecdeb@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------NZKW2d7QF00sRdPyh4O1WjAX"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------NZKW2d7QF00sRdPyh4O1WjAX
Content-Type: multipart/mixed; boundary="------------kPcR8pGmh0Zy8xLeFkw0PIxt";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <c07cb7f8-c936-c383-a860-045e80e2f1ef@suse.com>
Subject: Re: [PATCH v2 04/70] x86/pv-shim: Don't modify the hypercall table
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
 <20220214125127.17985-5-andrew.cooper3@citrix.com>
 <4d8ab414-caf4-5a12-4cb7-a88c633cfd66@suse.com>
 <e18c0c5a-d00b-adf9-d4b0-28e702a18241@srcf.net>
 <6566bf52-58da-f804-f5c2-fca64c1f150c@suse.com>
 <f0889e93-aec0-443e-b3fc-081892edaf2b@citrix.com>
 <44e0ab16-e807-c8f5-deef-7094b7aecdeb@suse.com>
In-Reply-To: <44e0ab16-e807-c8f5-deef-7094b7aecdeb@suse.com>

--------------kPcR8pGmh0Zy8xLeFkw0PIxt
Content-Type: multipart/mixed; boundary="------------2c7yhqEgFNzU80kJwQJpSSoC"

--------------2c7yhqEgFNzU80kJwQJpSSoC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTcuMDIuMjIgMTE6MjAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxNi4wMi4yMDIy
IDIzOjE3LCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPj4gT24gMTQvMDIvMjAyMiAxMzo1Niwg
SmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMTQuMDIuMjAyMiAxNDo1MCwgQW5kcmV3IENv
b3BlciB3cm90ZToNCj4+Pj4gT24gMTQvMDIvMjAyMiAxMzozMywgSmFuIEJldWxpY2ggd3Jv
dGU6DQo+Pj4+PiBPbiAxNC4wMi4yMDIyIDEzOjUwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0K
Pj4+Pj4+IEZyb206IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4+Pj4+Pg0K
Pj4+Pj4+IFdoZW4gcnVubmluZyBhcyBwdi1zaGltIHRoZSBoeXBlcmNhbGwgaXMgbW9kaWZp
ZWQgdG9kYXkgaW4gb3JkZXIgdG8NCj4+Pj4+PiByZXBsYWNlIHRoZSBmdW5jdGlvbnMgZm9y
IF9fSFlQRVJWSVNPUl9ldmVudF9jaGFubmVsX29wIGFuZA0KPj4+Pj4+IF9fSFlQRVJWSVNP
Ul9ncmFudF90YWJsZV9vcCBoeXBlcmNhbGxzLg0KPj4+Pj4+DQo+Pj4+Pj4gQ2hhbmdlIHRo
aXMgdG8gY2FsbCB0aGUgcmVsYXRlZCBmdW5jdGlvbnMgZnJvbSB0aGUgbm9ybWFsIGhhbmRs
ZXJzDQo+Pj4+Pj4gaW5zdGVhZCB3aGVuIHJ1bm5pbmcgYXMgc2hpbS4gVGhlIHBlcmZvcm1h
bmNlIGltcGxpY2F0aW9ucyBhcmUgbm90DQo+Pj4+Pj4gcmVhbGx5IHJlbGV2YW50LCBhcyBh
IG5vcm1hbCBwcm9kdWN0aW9uIGh5cGVydmlzb3Igd2lsbCBub3QgYmUNCj4+Pj4+PiBjb25m
aWd1cmVkIHRvIHN1cHBvcnQgc2hpbSBtb2RlLCBzbyB0aGUgcmVsYXRlZCBjYWxscyB3aWxs
IGJlIGRyb3BwZWQNCj4+Pj4+PiBkdWUgdG8gb3B0aW1pemF0aW9uIG9mIHRoZSBjb21waWxl
ci4NCj4+Pj4+Pg0KPj4+Pj4+IE5vdGUgdGhhdCBmb3IgdGhlIENPTkZJR19QVl9TSElNX0VY
Q0xVU0lWRSBjYXNlIHRoZXJlIGlzIGEgZHVtbXkNCj4+Pj4+PiB3cmFwcGVyIGRvX2dyYW50
X3RhYmxlX29wKCkgbmVlZGVkLCBhcyBpbiB0aGlzIGNhc2UgZ3JhbnRfdGFibGUuYw0KPj4+
Pj4+IGlzbid0IGJlaW5nIGJ1aWx0Lg0KPj4+Pj4+DQo+Pj4+Pj4gU2lnbmVkLW9mZi1ieTog
SnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+Pj4+PiBJIGRv
bid0IHRoaW5rIHlvdSBzeW5jLWVkIHRoaXMgd2l0aCBKw7xyZ2VuJ3MgdjMuIFRoZXJlIHdl
cmUgb25seSBtaW5vcg0KPj4+Pj4gY2hhbmdlcyBidXQgaGF2aW5nIGEgc3RhbGUgdmVyc2lv
biBzZW50IHR3byBtb250aHMgbGF0ZXIgaXNuJ3QgdmVyeQ0KPj4+Pj4gbmljZS4NCj4+Pj4g
SSBkaWQgcmVzeW5jLsKgIFdoYXQgZG8geW91IHRoaW5rIGlzIG1pc3Npbmc/DQo+Pj4gQSBm
ZXcgbGlrZWx5KCkgLyB1bmxpa2VseSgpIGFzIGZhciBhcyBJIGNvdWxkIHNlZS4NCj4+DQo+
PiBPaCB0aG9zZSB0d28uwqAgSSBhcHBlYXIgdG8gaGF2ZSBmb3Jnb3QgdG8gZW1haWwuDQo+
Pg0KPj4gVGhleSdyZSB3cm9uZyAtIG9ic2VydmUgdGhleSdyZSBpbiBhbiBpZm5kZWYgYmxv
Y2ssIG5vdCBhbiBpZmRlZiBibG9jay4NCj4gDQo+IEkgZG9uJ3Qgc2VlIGhvdyB0aGUgKHVu
cmVsYXRlZCkgI2lmbmRlZiBtYXR0ZXJzIGhlcmU6IFRoZSAjaWZuZGVmDQo+IGlzIGFib3V0
IGdyYW50IHRhYmxlIGF2YWlsYWJpbGl0eS4gVGhlIHR3byBsaWtlbHkoKSBhcmUgYWJvdXQN
Cj4gcnVubmluZyBhcyBzaGltLiBJJ20gb2YgdGhlIGZpcm0gb3BpbmlvbiB0aGF0IGEgYmlu
YXJ5IGJ1aWx0DQo+IHdpdGhvdXQgUFZfU0hJTV9FWENMVVNJVkUgaXMgZmFyIG1vcmUgbGlr
ZWx5IHRvIGJlIHVzZWQgYXMgYSBiYXJlDQo+IG1ldGFsIGh5cGVydmlzb3IuIEFuZCBmb3Ig
YSBQVl9TSElNX0VYQ0xVU0lWRSBoeXBlcnZpc29yIHRoZQ0KPiBjb25kaXRpb25zIGFyZSBj
b25zdGFudCBhbnl3YXksIGFuZCBoZW5jZSB0aGUgdW5saWtlbHkoKSBoYXMgbm8NCj4gZWZm
ZWN0Lg0KPiANCj4gQW5kIGlmIHlvdXIgd2F5IHNob3VsZCByZWFsbHkgYmUgZm9sbG93ZWQs
IHdoeSBkaWQgeW91IGRlZW0gdGhlIHR3bw0KPiB1bmxpa2VseSgpIGluIGRvX2V2ZW50X2No
YW5uZWxfb3AoKSBhbmQgZG9fZ3JhbnRfdGFibGVfb3AoKSBva2F5Pw0KPiANCj4+Pj4+PiAt
LS0gYS94ZW4vY29tbW9uL2NvbXBhdC9tdWx0aWNhbGwuYw0KPj4+Pj4+ICsrKyBiL3hlbi9j
b21tb24vY29tcGF0L211bHRpY2FsbC5jDQo+Pj4+Pj4gQEAgLTUsNyArNSw3IEBADQo+Pj4+
Pj4gICBFTUlUX0ZJTEU7DQo+Pj4+Pj4gICANCj4+Pj4+PiAgICNpbmNsdWRlIDx4ZW4vdHlw
ZXMuaD4NCj4+Pj4+PiAtI2luY2x1ZGUgPHhlbi9tdWx0aWNhbGwuaD4NCj4+Pj4+PiArI2lu
Y2x1ZGUgPHhlbi9oeXBlcmNhbGwuaD4NCj4+Pj4+PiAgICNpbmNsdWRlIDx4ZW4vdHJhY2Uu
aD4NCj4+Pj4+PiAgIA0KPj4+Pj4+ICAgI2RlZmluZSBDT01QQVQNCj4+Pj4+PiBAQCAtMTks
NyArMTksNiBAQCBzdGF0aWMgaW5saW5lIHZvaWQgeGxhdF9tdWx0aWNhbGxfZW50cnkoc3Ry
dWN0IG1jX3N0YXRlICptY3MpDQo+Pj4+Pj4gICAgICAgICAgIG1jcy0+Y29tcGF0X2NhbGwu
YXJnc1tpXSA9IG1jcy0+Y2FsbC5hcmdzW2ldOw0KPj4+Pj4+ICAgfQ0KPj4+Pj4+ICAgDQo+
Pj4+Pj4gLURFRklORV9YRU5fR1VFU1RfSEFORExFKG11bHRpY2FsbF9lbnRyeV9jb21wYXRf
dCk7DQo+Pj4+Pj4gICAjZGVmaW5lIG11bHRpY2FsbF9lbnRyeSAgICAgIGNvbXBhdF9tdWx0
aWNhbGxfZW50cnkNCj4+Pj4+PiAgICNkZWZpbmUgbXVsdGljYWxsX2VudHJ5X3QgICAgbXVs
dGljYWxsX2VudHJ5X2NvbXBhdF90DQo+Pj4+Pj4gICAjZGVmaW5lIGRvX211bHRpY2FsbF9j
YWxsICAgIGNvbXBhdF9tdWx0aWNhbGxfY2FsbA0KPj4+Pj4gSsO8cmdlbidzIHBhdGNoIGRv
ZXNuJ3QgaGF2ZSBhbnkgY2hhbmdlIHRvIHRoaXMgZmlsZSwgYW5kIEknbSBhZnJhaWQgSQ0K
Pj4+Pj4gYWxzbyBkb24ndCBzZWUgaG93IHRoZXNlIGFkanVzdG1lbnRzIGFyZSByZWxhdGVk
IGhlcmUuIFRoZSBjb21taXQNCj4+Pj4+IG1lc3NhZ2Ugc2FkbHkgYWxzbyBkb2Vzbid0IGhl
bHAgLi4uDQo+Pj4+IFRoZSBjaGFuZ2VzIGFyZSB2ZXJ5IG5lY2Vzc2FyeSB0byBzcGxpdCBp
dCBvdXQgb2YgSnVlcmdlbidzIHNlcmllcy4NCj4+Pj4NCj4+Pj4gV2l0aG91dCB0aGUgYWRq
dXN0bWVudCwgdGhlIGNvcnJlY3Rpb24gb2YgY29tcGF0X3BsYXRmb3JtX29wKCkncyBndWVz
dA0KPj4+PiBoYW5kbGUgdHlwZSBmcm9tIHZvaWQgdG8gY29tcGF0X3BsYXRmb3JtX29wX3Qg
ZG9lc24ndCBjb21waWxlLg0KPj4+IEludGVyZXN0aW5nLiBUaGF0J3MgcXVpdGUgZmFyIGZy
b20gb2J2aW91cyBpbiB0aGlzIGNvbnRleHQsIHNvIGNsYXJpZnlpbmcNCj4+PiB0aGUgcHVy
cG9zZSBpbiB0aGUgZGVzY3JpcHRpb24gd291bGQgc2VlbSBoZWxwZnVsLg0KPj4+DQo+Pj4g
Q29taW5nIGJhY2sgdG8gdGhlIHN5bmNpbmcgd2l0aCB2MzogV2FzIHRoaXMgY2hhbmdlIHRo
ZSByZWFzb24gdGhlbiB3aHkNCj4+PiB5b3UgZGlkIGRyb3AgbXkgUi1iPw0KPj4NCj4+IE15
IHBvcnRpbmcgb2YgdGhpcyBwYXRjaCBpcyBhIG5vbi10cml2aWFsIG1vZGlmaWNhdGlvbiBm
cm9tIEp1ZXJnZW4ncw0KPj4gdmVyc2lvbiwgYW5kIG5vdCBlbGlnaWJsZSB0byByZXRhaW4g
YW55IHRhZ3MuDQo+Pg0KPj4gSSB0aG91Z2h0IEknZCBkaXNjdXNzZWQgdGhpcywgYnV0IEkg
YXBwZWFyIHRvIGhhdmUgbWlzc2VkIGl0IGZyb20gYm90aA0KPj4gdmVyc2lvbnMgb2YgdGhl
IHNlcmllcy7CoCBTb3JyeS4NCj4+DQo+PiBFaXRoZXIgd2F5LsKgIEl0J3MgZXhhY3RseSB0
aGUgc2FtZSBwdXJwb3NlIGFzIGJlZm9yZSwgYnV0IG1vZGlmaWVkIHRvDQo+PiBjb21waWxl
IGluIGlzb2xhdGlvbi4NCj4gDQo+IEkgc2VlLiBJJ20gdW5kZXIgdGhlIGltcHJlc3Npb24g
dGhvdWdoIHRoYXQgcGFydHMgd2VyZSBlZmZlY3RpdmVseQ0KPiBwcmVzZW50IGVsc2V3aGVy
ZSBpbiBKw7xyZ2VuJ3Mgc2VyaWVzLiBQZXJoYXBzIGl0IHdvdWxkIGhhdmUgYmVlbiBlYXNp
ZXINCj4gaWYgaGlzIHNlcmllcyAoYXQgbGVhc3QgdXAgdG8gdGhlIHBvaW50IHRvIHdoaWNo
IHlvdSBuZWVkIGl0IGhlcmUpDQo+IHdvdWxkIChsb25nKSBoYXZlIGdvbmUgaW4gYWxyZWFk
eS4gV2hhdCBpdCBsb29rcyB0byBiZSBibG9ja2VkIG9uIGFyZQ0KPiB0d28gb3IgdGhyZWUg
QXJtIGFja3MgYW5kIGFuIHg4NiBhY2sgb24gcGF0Y2ggMSAod2hpY2ggSSd2ZSBleHByZXNz
ZWQNCj4gSSdtIG5vdCBlbnRpcmVseSBoYXBweSBhYm91dCwgYW5kIGhlbmNlIEknbSBub3Qg
Z29pbmcgdG8gZWl0aGVyIGFjayBvcg0KPiBuYWNrIGl0KS4NCg0KVGhlIG1haW4gYmxvY2tp
bmcgcG9pbnQgY3VycmVudGx5IGlzIHRoYXQgSnVsaWVuIHdvdWxkIGxpa2UgbWUgdG8gbGV0
DQphbGwgaHlwZXJjYWxscyByZXR1cm4gYW4gaW50IChhcGFydCBmcm9tIHRoZSBvbmVzIHdo
aWNoIHJlYWxseSBuZWVkDQphIGxvbmcpLiBUaGlzIHdpbGwgYWZmZWN0IGxvdCBvZiBjb21t
b24gY29kZSBhbmQgSSBuZWVkIHRvIGhhdmUgbW9yZQ0KdGltZSBmb3IgdGhhdCBlbmRlYXZv
ci4NCg0KQW4gYWx0ZXJuYXRpdmUgdG8gdGhhdCB3b3VsZCBiZSB0byBub3QgcmV3b3JrIHRo
ZSBBcm0gc2lkZSBvZiB0aGUNCmh5cGVyY2FsbCBsb2dpYy4NCg0KDQpKdWVyZ2VuDQoNCg==

--------------2c7yhqEgFNzU80kJwQJpSSoC
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------2c7yhqEgFNzU80kJwQJpSSoC--

--------------kPcR8pGmh0Zy8xLeFkw0PIxt--

--------------NZKW2d7QF00sRdPyh4O1WjAX
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmIOJKwFAwAAAAAACgkQsN6d1ii/Ey8c
tQf/bjQZ7MXx1JP1V14FeQuhOKIr53q5CLj/dxsPqUGV+C6HndnV/zqDYEgqWm63WXk10OsIKTlM
c7DRKoaaaysV1wGtBbWh3evhhnFGflUaIN4r3NQn138OkKRrGCxEkDJe3X+aSlGixuZ1ZrLfmnVm
Nrjf5b14WOJFrVbQK1ejQ+JzTeW06kH3Fi9NFzFRnI+SVBTWv8km7g2MsiGcDnTWJz4l/5fScYe3
dVVOyF09xhfQOkHz89CCDXg3kCORapZHkPbfJUuF03H8T0bO5aIckHdjXgcF6UHdnM7M9Elz+zNG
7bY4ReDOr+CdsDXBg5YeQeOAPBjKfBPzdSKoEHt4Qw==
=MjBf
-----END PGP SIGNATURE-----

--------------NZKW2d7QF00sRdPyh4O1WjAX--

