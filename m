Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 735367CA0D2
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 09:38:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617307.959807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsIBE-00060F-Uv; Mon, 16 Oct 2023 07:38:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617307.959807; Mon, 16 Oct 2023 07:38:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsIBE-0005xJ-SE; Mon, 16 Oct 2023 07:38:24 +0000
Received: by outflank-mailman (input) for mailman id 617307;
 Mon, 16 Oct 2023 07:38:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4t3W=F6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qsIBD-0005xD-Aa
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 07:38:23 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fad66ddc-6bf6-11ee-9b0e-b553b5be7939;
 Mon, 16 Oct 2023 09:38:21 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 592DD1FDCC;
 Mon, 16 Oct 2023 07:38:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 268C5133B7;
 Mon, 16 Oct 2023 07:38:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YKnWB2zoLGU/agAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 16 Oct 2023 07:38:20 +0000
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
X-Inumbo-ID: fad66ddc-6bf6-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1697441900; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Xl1MpIBp+5MavD132m3PYC5mkW1ehLyyYWC9RRM1JOI=;
	b=c0mfJPkOP4bKTR3sr+DM1S2jOaMYf5sK0PhbvpkSDrROw3b2Zffc1My9/jjBMKcn33BHPr
	1xWprR3NiLB2JhE9YbmU3+isOipk/C19EcPWXSgT10A4OFxzXb3csT8A2u9N5lzMFEKBCR
	+DIybSKfMmjJFO9/cdOu1Uzbcd3W9u0=
Message-ID: <28143c17-2562-43a0-9796-644fd50a1dd6@suse.com>
Date: Mon, 16 Oct 2023 09:38:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cxenstored: wait until after reset to notify dom0less
 domains
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@cloud.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>, julien@xen.org, wl@xen.org
References: <20231013230624.1007969-1-sstabellini@kernel.org>
From: Juergen Gross <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <20231013230624.1007969-1-sstabellini@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------FMCLRZXF7N0pcGpxk9cu8m0U"
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: *
X-Spam-Score: 1.01
X-Spamd-Result: default: False [1.01 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BAYES_HAM(-0.00)[33.86%];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 HAS_ATTACHMENT(0.00)[];
	 MIME_BASE64_TEXT_BOGUS(1.00)[];
	 RCPT_COUNT_FIVE(0.00)[6];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-1.00)[-1.000];
	 MIME_BASE64_TEXT(0.10)[];
	 NEURAL_SPAM_LONG(3.00)[1.000];
	 SIGNED_PGP(-2.00)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[];
	 MIME_UNKNOWN(0.10)[application/pgp-keys]
X-Spam-Flag: NO

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------FMCLRZXF7N0pcGpxk9cu8m0U
Content-Type: multipart/mixed; boundary="------------X5Uo0mKJlHTSYf7dOokj0YWC";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@cloud.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>, julien@xen.org, wl@xen.org
Message-ID: <28143c17-2562-43a0-9796-644fd50a1dd6@suse.com>
Subject: Re: [PATCH] cxenstored: wait until after reset to notify dom0less
 domains
References: <20231013230624.1007969-1-sstabellini@kernel.org>
In-Reply-To: <20231013230624.1007969-1-sstabellini@kernel.org>

--------------X5Uo0mKJlHTSYf7dOokj0YWC
Content-Type: multipart/mixed; boundary="------------Ccu0wirB2FvSb06dLcrlUlrF"

--------------Ccu0wirB2FvSb06dLcrlUlrF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTQuMTAuMjMgMDE6MDYsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4gRnJvbTog
R2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjbG91ZC5jb20+DQo+IA0KPiBDb21taXQg
ZmMyYjU3YzlhICgieGVuc3RvcmVkOiBzZW5kIGFuIGV2dGNobiBub3RpZmljYXRpb24gb24N
Cj4gaW50cm9kdWNlX2RvbWFpbiIpIGludHJvZHVjZWQgdGhlIHNlbmRpbmcgb2YgYW4gZXZl
bnQgY2hhbm5lbCB0byB0aGUNCj4gZ3Vlc3Qgd2hlbiBmaXJzdCBpbnRyb2R1Y2VkLCBzbyB0
aGF0IGRvbTBsZXNzIGRvbWFpbnMgd2FpdGluZyBmb3IgdGhlDQo+IGNvbm5lY3Rpb24gd291
bGQga25vdyB0aGF0IHhlbnN0b3JlIHdhcyByZWFkeSB0byB1c2UuDQo+IA0KPiBVbmZvcnR1
bmF0ZWx5LCBpdCB3YXMgaW50cm9kdWNlZCBpbiBpbnRyb2R1Y2VfZG9tYWluKCksIHdoaWNo
IDEpIGlzDQo+IGNhbGxlZCBieSBvdGhlciBmdW5jdGlvbnMsIHdoZXJlIHN1Y2ggZnVuY3Rp
b25hbGl0eSBpcyB1bm5lZWRlZCwgYW5kDQo+IDIpIGFmdGVyIHRoZSBtYWluIFhTX0lOVFJP
RFVDRSBjYWxsLCBjYWxscyBkb21haW5fY29ubl9yZXNldCgpLiAgVGhpcw0KPiBpbnRyb2R1
Y2VzIGEgcmFjZSBjb25kaXRpb24sIHdoZXJlYnkgaWYgeGVuc3RvcmVkIGlzIGRlbGF5ZWQs
IGEgZG9tYWluDQo+IGNhbiB3YWtlIHVwLCBzZW5kIG1lc3NhZ2VzIHRvIHRoZSBidWZmZXIs
IG9ubHkgdG8gaGF2ZSB0aGVtIGRlbGV0ZWQgYnkNCj4geGVuc3RvcmUgYmVmb3JlIGZpbmlz
aGluZyBpdHMgcHJvY2Vzc2luZyBvZiB0aGUgWFNfSU5UUk9EVUNFIG1lc3NhZ2UuDQo+IA0K
PiBNb3ZlIHRoZSBjb25uZWN0LWFuZC1ub3RmeSBjYWxsIGludG8gZG9faW50cm9kdWNlKCkg
aW5zdGVhZCwgYWZ0ZXIgdGhlDQo+IGRvbWFpbl9jb25uX3Jlc3QoKTsgcHJlZGljYXRlZCBv
biB0aGUgc3RhdGUgYmVpbmcgaW4gdGhlDQo+IFhFTlNUT1JFX1JFQ09OTkVDVCBzdGF0ZS4N
Cj4gDQo+IChXZSBkb24ndCBuZWVkIHRvIGNoZWNrIGZvciAicmVzdG9yaW5nIiwgc2luY2Ug
dGhhdCB2YWx1ZSBpcyBhbHdheXMNCj4gcGFzc2VkIGFzICJmYWxzZSIgZnJvbSBkb19kb21h
aW5faW50cm9kdWNlKCkpLg0KPiANCj4gQWxzbyB0YWtlIHRoZSBvcHBvcnR1bml0eSB0byBh
ZGQgYSBtaXNzaW5nIHdtYiBiYXJyaWVyIGFmdGVyIHJlc2V0dGluZw0KPiB0aGUgaW5kZXhl
cyBvZiB0aGUgcmluZyBpbiBkb21haW5fY29ubl9yZXNldC4NCj4gDQo+IFRoaXMgY2hhbmdl
IHdpbGwgYWxzbyByZW1vdmUgYW4gZXh0cmEgZXZlbnQgY2hhbm5lbCBub3RpZmljYXRpb24g
Zm9yDQo+IGRvbTAgKGJlY2F1c2UgdGhlIG5vdGlmaWNhdGlvbiBpcyBub3cgZG9uZSBieSBk
b19pbnRyb2R1Y2Ugd2hpY2ggaXMgbm90DQo+IGNhbGxlZCBmb3IgZG9tMC4pIFRoZSBleHRy
YSBkb20wIGV2ZW50IGNoYW5uZWwgbm90aWZpY2F0aW9uIHdhcyBvbmx5DQo+IGludHJvZHVj
ZWQgYnkgZmMyYjU3YzlhIGFuZCB3YXMgbmV2ZXIgcHJlc2VudCBiZWZvcmUuIEl0IGlzIG5v
dCBuZWVkZWQNCj4gYmVjYXVzZSBkb20wIGlzIHRoZSBvbmUgdG8gdGVsbCB4ZW5zdG9yZWQg
dGhlIGNvbm5lY3Rpb24gcGFyYW1ldGVycywgc28NCj4gZG9tMCBoYXMgdG8ga25vdyB0aGF0
IHRoZSByaW5nIHBhZ2UgaXMgc2V0dXAgY29ycmVjdGx5IGJ5IHRoZSB0aW1lDQo+IHhlbnN0
b3JlZCBzdGFydHMgbG9va2luZyBhdCBpdC4gSXQgaXMgZG9tMCB0aGF0IHBlcmZvcm1zIHRo
ZSByaW5nIHBhZ2UNCj4gaW5pdC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEdlb3JnZSBEdW5s
YXAgPGdlb3JnZS5kdW5sYXBAY2xvdWQuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW5v
IFN0YWJlbGxpbmkgPHN0ZWZhbm8uc3RhYmVsbGluaUBhbWQuY29tPg0KPiBDQzogamdyb3Nz
QHN1c2UuY29tDQo+IENDOiBqdWxpZW5AeGVuLm9yZw0KPiBDQzogd2xAeGVuLm9yZw0KDQpU
d28gbml0cyBiZWxvdywgd2l0aCB0aG9zZSBmaXhlZDoNCg0KUmV2aWV3ZWQtYnk6IEp1ZXJn
ZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCg0KPiAtLS0NCj4gICB0b29scy94ZW5zdG9y
ZWQvZG9tYWluLmMgfCAxNCArKysrKysrKy0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA4
IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdG9v
bHMveGVuc3RvcmVkL2RvbWFpbi5jIGIvdG9vbHMveGVuc3RvcmVkL2RvbWFpbi5jDQo+IGlu
ZGV4IGE2Y2QxOTlmZGMuLmY2ZWYzNzg1NmMgMTAwNjQ0DQo+IC0tLSBhL3Rvb2xzL3hlbnN0
b3JlZC9kb21haW4uYw0KPiArKysgYi90b29scy94ZW5zdG9yZWQvZG9tYWluLmMNCj4gQEAg
LTkyMyw2ICs5MjMsNyBAQCBzdGF0aWMgdm9pZCBkb21haW5fY29ubl9yZXNldChzdHJ1Y3Qg
ZG9tYWluICpkb21haW4pDQo+ICAgDQo+ICAgCWRvbWFpbi0+aW50ZXJmYWNlLT5yZXFfY29u
cyA9IGRvbWFpbi0+aW50ZXJmYWNlLT5yZXFfcHJvZCA9IDA7DQo+ICAgCWRvbWFpbi0+aW50
ZXJmYWNlLT5yc3BfY29ucyA9IGRvbWFpbi0+aW50ZXJmYWNlLT5yc3BfcHJvZCA9IDA7DQo+
ICsJeGVuX3dtYigpOw0KPiAgIH0NCj4gICANCj4gICAvKg0KPiBAQCAtOTg4LDEyICs5ODks
NiBAQCBzdGF0aWMgc3RydWN0IGRvbWFpbiAqaW50cm9kdWNlX2RvbWFpbihjb25zdCB2b2lk
ICpjdHgsDQo+ICAgCQkvKiBOb3cgZG9tYWluIGJlbG9uZ3MgdG8gaXRzIGNvbm5lY3Rpb24u
ICovDQo+ICAgCQl0YWxsb2Nfc3RlYWwoZG9tYWluLT5jb25uLCBkb21haW4pOw0KPiAgIA0K
PiAtCQlpZiAoIXJlc3RvcmUpIHsNCj4gLQkJCS8qIE5vdGlmeSB0aGUgZG9tYWluIHRoYXQg
eGVuc3RvcmUgaXMgYXZhaWxhYmxlICovDQo+IC0JCQlpbnRlcmZhY2UtPmNvbm5lY3Rpb24g
PSBYRU5TVE9SRV9DT05ORUNURUQ7DQo+IC0JCQl4ZW5ldnRjaG5fbm90aWZ5KHhjZV9oYW5k
bGUsIGRvbWFpbi0+cG9ydCk7DQo+IC0JCX0NCj4gLQ0KPiAgIAkJaWYgKCFpc19tYXN0ZXJf
ZG9tYWluICYmICFyZXN0b3JlKQ0KPiAgIAkJCWZpcmVfc3BlY2lhbF93YXRjaGVzKCJAaW50
cm9kdWNlRG9tYWluIik7DQo+ICAgCX0gZWxzZSB7DQo+IEBAIC0xMDMzLDYgKzEwMjgsMTMg
QEAgaW50IGRvX2ludHJvZHVjZShjb25zdCB2b2lkICpjdHgsIHN0cnVjdCBjb25uZWN0aW9u
ICpjb25uLA0KPiAgIA0KPiAgIAlkb21haW5fY29ubl9yZXNldChkb21haW4pOw0KPiAgIA0K
PiArCWlmIChkb21haW4tPmludGVyZmFjZSAhPSBOVUxMICYmDQo+ICsJCWRvbWFpbi0+aW50
ZXJmYWNlLT5jb25uZWN0aW9uID09IFhFTlNUT1JFX1JFQ09OTkVDVCkgew0KDQpJZGVudGF0
aW9uIHNob3VsZCBiZSBmaXhlZCAoYm90aCB0ZXN0ZWQgY29uZGl0aW9ucyBhdCB0aGUgc2Ft
ZSBwb3NpdGlvbikuDQoNCj4gKwkJLyogTm90aWZ5IHRoZSBkb21haW4gdGhhdCB4ZW5zdG9y
ZSBpcyBhdmFpbGFibGUgKi8NCg0KUGxlYXNlIGFkZCBhICIuIiBhdCB0aGUgZW5kIG9mIHRo
ZSBzZW50ZW5jZSB3aGlsZSB5b3UgYXJlIG1vdmluZyB0aGlzIGxpbmUuDQoNCj4gKwkJZG9t
YWluLT5pbnRlcmZhY2UtPmNvbm5lY3Rpb24gPSBYRU5TVE9SRV9DT05ORUNURUQ7DQo+ICsJ
CXhlbmV2dGNobl9ub3RpZnkoeGNlX2hhbmRsZSwgZG9tYWluLT5wb3J0KTsNCj4gKwl9DQo+
ICsNCj4gICAJc2VuZF9hY2soY29ubiwgWFNfSU5UUk9EVUNFKTsNCj4gICANCj4gICAJcmV0
dXJuIDA7DQoNCg0KSnVlcmdlbg0K
--------------Ccu0wirB2FvSb06dLcrlUlrF
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------Ccu0wirB2FvSb06dLcrlUlrF--

--------------X5Uo0mKJlHTSYf7dOokj0YWC--

--------------FMCLRZXF7N0pcGpxk9cu8m0U
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmUs6GsFAwAAAAAACgkQsN6d1ii/Ey+P
Bgf/dqGODuYBv/sbsVfsBJDfxFbrVlD5s1t8hnEgtoaxjcdtwqIx3jrsgiQgsrMrjXozq1J3YyLi
UJIAVnB7Y9HrkfxRobkEAoom7s3dZiPo8XOSShNQSxu5BuhqXSrdIZfdp8HT4Ec4JcKuRAbThGxL
RZgnJfbj322untY4vLvnW7eRpqeZy/C9m3nVanzHXtA5t6fA1Ho0NPOnZ2chT6trAbksdlaH5TiT
BkdoVMOE8gwDM+itdUURma3TytF59q/CLRAXwY+LBPW1AZ9eLXsuFG1u9WLM/5Io6n7E9BREinyl
qsucwuouJ1ar0piR6lUrQhVWkIgfKHWtsqztguGLgQ==
=hnEs
-----END PGP SIGNATURE-----

--------------FMCLRZXF7N0pcGpxk9cu8m0U--

