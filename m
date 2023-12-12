Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BABF580EE81
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 15:17:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653167.1019498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD3Z8-0003Uy-EL; Tue, 12 Dec 2023 14:16:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653167.1019498; Tue, 12 Dec 2023 14:16:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD3Z8-0003Rx-Ar; Tue, 12 Dec 2023 14:16:54 +0000
Received: by outflank-mailman (input) for mailman id 653167;
 Tue, 12 Dec 2023 14:16:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/k62=HX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rD3Z6-0003Qc-Fp
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 14:16:52 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1764aafe-98f9-11ee-9b0f-b553b5be7939;
 Tue, 12 Dec 2023 15:16:50 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5B4641FB45;
 Tue, 12 Dec 2023 14:16:49 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0FBB013725;
 Tue, 12 Dec 2023 14:16:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id rKn7AVFreGVCdQAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 12 Dec 2023 14:16:49 +0000
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
X-Inumbo-ID: 1764aafe-98f9-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1702390609; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=PgNtcbs50nBRDFUuIXNDNWr9Xg6eKD2SdhqZXTq40Hc=;
	b=Za2l5gATs0OeAA3XbLVAtELNHL7WhxwKIsKdSFGtnh8DKddH5olMCcbcOhD87eq+gRNIoU
	zxuF3H5VJzE7O5Fg9zZNF6AkrUNEbn1esEeyAS7Ziv+rXnSbmE11Xx2x0P4Y16CEvg/ohw
	ue5TxG5pLZXlMponCRyNCTNNsJvA6xc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1702390609; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=PgNtcbs50nBRDFUuIXNDNWr9Xg6eKD2SdhqZXTq40Hc=;
	b=Za2l5gATs0OeAA3XbLVAtELNHL7WhxwKIsKdSFGtnh8DKddH5olMCcbcOhD87eq+gRNIoU
	zxuF3H5VJzE7O5Fg9zZNF6AkrUNEbn1esEeyAS7Ziv+rXnSbmE11Xx2x0P4Y16CEvg/ohw
	ue5TxG5pLZXlMponCRyNCTNNsJvA6xc=
Message-ID: <bc236e16-cbc5-4303-a8e8-cdd8e2efd0d6@suse.com>
Date: Tue, 12 Dec 2023 15:16:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/12] xen/spinlock: add
 rspin_[un]lock_irq[save|restore]()
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20231212094725.22184-1-jgross@suse.com>
 <20231212094725.22184-6-jgross@suse.com>
 <319c928c-500c-4f41-8a65-3ffdeb888d63@xen.org>
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
In-Reply-To: <319c928c-500c-4f41-8a65-3ffdeb888d63@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------p4lMFVoq5Uhj0mhRryFnJsEv"
X-Spam-Flag: NO
X-Spam-Score: 3.11
X-Spam-Level: ***
X-Spam-Flag: NO
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [3.11 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 HAS_ATTACHMENT(0.00)[];
	 BAYES_SPAM(5.10)[100.00%];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 MIME_BASE64_TEXT(0.10)[];
	 RCPT_COUNT_SEVEN(0.00)[8];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 SIGNED_PGP(-2.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[];
	 MIME_UNKNOWN(0.10)[application/pgp-keys]
X-Spam-Score: 3.11

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------p4lMFVoq5Uhj0mhRryFnJsEv
Content-Type: multipart/mixed; boundary="------------5561XOhLCVmcVW5pzsZi1Wua";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <bc236e16-cbc5-4303-a8e8-cdd8e2efd0d6@suse.com>
Subject: Re: [PATCH v4 05/12] xen/spinlock: add
 rspin_[un]lock_irq[save|restore]()
References: <20231212094725.22184-1-jgross@suse.com>
 <20231212094725.22184-6-jgross@suse.com>
 <319c928c-500c-4f41-8a65-3ffdeb888d63@xen.org>
In-Reply-To: <319c928c-500c-4f41-8a65-3ffdeb888d63@xen.org>

--------------5561XOhLCVmcVW5pzsZi1Wua
Content-Type: multipart/mixed; boundary="------------R5bQB0BxqjpYCEMs0I9wj6BF"

--------------R5bQB0BxqjpYCEMs0I9wj6BF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTIuMTIuMjMgMTQ6MDMsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDEyLzEyLzIwMjMgMDk6NDcsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBJ
bnN0ZWFkIG9mIHNwZWNpYWwgY2FzaW5nIHJzcGluX2xvY2tfaXJxc2F2ZSgpIGFuZA0KPj4g
cnNwaW5fdW5sb2NrX2lycXJlc3RvcmUoKSBmb3IgdGhlIGNvbnNvbGUgbG9jaywgYWRkIHRo
b3NlIGZ1bmN0aW9ucw0KPj4gdG8gc3BpbmxvY2sgaGFuZGxpbmcgYW5kIHVzZSB0aGVtIHdo
ZXJlIG5lZWRlZC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jv
c3NAc3VzZS5jb20+DQo+PiAtLS0NCj4+IFYyOg0KPj4gLSBuZXcgcGF0Y2gNCj4+IC0tLQ0K
Pj4gwqAgeGVuL2FyY2gveDg2L3RyYXBzLmPCoMKgwqDCoMKgwqAgfCAxNCArKysrKysrKy0t
LS0tLQ0KPj4gwqAgeGVuL2NvbW1vbi9zcGlubG9jay5jwqDCoMKgwqDCoCB8IDE2ICsrKysr
KysrKysrKysrKysNCj4+IMKgIHhlbi9kcml2ZXJzL2NoYXIvY29uc29sZS5jIHwgMTggKy0t
LS0tLS0tLS0tLS0tLS0tDQo+PiDCoCB4ZW4vaW5jbHVkZS94ZW4vY29uc29sZS5owqAgfMKg
IDUgKysrLS0NCj4+IMKgIHhlbi9pbmNsdWRlL3hlbi9zcGlubG9jay5oIHzCoCA3ICsrKysr
KysNCj4+IMKgIDUgZmlsZXMgY2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKSwgMjUgZGVsZXRp
b25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni90cmFwcy5jIGIveGVu
L2FyY2gveDg2L3RyYXBzLmMNCj4+IGluZGV4IDc3MjQzMDYxMTYuLjIxMjI3ODc3YjMgMTAw
NjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC94ODYvdHJhcHMuYw0KPj4gKysrIGIveGVuL2FyY2gv
eDg2L3RyYXBzLmMNCj4+IEBAIC02NDcsMTMgKzY0NywxNSBAQCB2b2lkIHNob3dfc3RhY2tf
b3ZlcmZsb3codW5zaWduZWQgaW50IGNwdSwgY29uc3Qgc3RydWN0IA0KPj4gY3B1X3VzZXJf
cmVncyAqcmVncykNCj4+IMKgIHZvaWQgc2hvd19leGVjdXRpb25fc3RhdGUoY29uc3Qgc3Ry
dWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpDQo+PiDCoCB7DQo+PiDCoMKgwqDCoMKgIC8qIFBy
ZXZlbnQgaW50ZXJsZWF2aW5nIG9mIG91dHB1dC4gKi8NCj4+IC3CoMKgwqAgdW5zaWduZWQg
bG9uZyBmbGFncyA9IGNvbnNvbGVfbG9ja19yZWN1cnNpdmVfaXJxc2F2ZSgpOw0KPj4gK8Kg
wqDCoCB1bnNpZ25lZCBsb25nIGZsYWdzOw0KPj4gKw0KPj4gK8KgwqDCoCByc3Bpbl9sb2Nr
X2lycXNhdmUoJmNvbnNvbGVfbG9jaywgZmxhZ3MpOw0KPj4gwqDCoMKgwqDCoCBzaG93X3Jl
Z2lzdGVycyhyZWdzKTsNCj4+IMKgwqDCoMKgwqAgc2hvd19jb2RlKHJlZ3MpOw0KPj4gwqDC
oMKgwqDCoCBzaG93X3N0YWNrKHJlZ3MpOw0KPj4gLcKgwqDCoCBjb25zb2xlX3VubG9ja19y
ZWN1cnNpdmVfaXJxcmVzdG9yZShmbGFncyk7DQo+PiArwqDCoMKgIHJzcGluX3VubG9ja19p
cnFyZXN0b3JlKCZjb25zb2xlX2xvY2ssIGZsYWdzKTsNCj4+IMKgIH0NCj4+IMKgIHZvaWQg
Y2ZfY2hlY2sgc2hvd19leGVjdXRpb25fc3RhdGVfbm9uY29uc3Qoc3RydWN0IGNwdV91c2Vy
X3JlZ3MgKnJlZ3MpDQo+PiBAQCAtNjYzLDcgKzY2NSw3IEBAIHZvaWQgY2ZfY2hlY2sgc2hv
d19leGVjdXRpb25fc3RhdGVfbm9uY29uc3Qoc3RydWN0IA0KPj4gY3B1X3VzZXJfcmVncyAq
cmVncykNCj4+IMKgIHZvaWQgdmNwdV9zaG93X2V4ZWN1dGlvbl9zdGF0ZShzdHJ1Y3QgdmNw
dSAqdikNCj4+IMKgIHsNCj4+IC3CoMKgwqAgdW5zaWduZWQgbG9uZyBmbGFncyA9IDA7DQo+
PiArwqDCoMKgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7DQo+PiDCoMKgwqDCoMKgIGlmICggdGVz
dF9iaXQoX1ZQRl9kb3duLCAmdi0+cGF1c2VfZmxhZ3MpICkNCj4+IMKgwqDCoMKgwqAgew0K
Pj4gQEAgLTY5OCw3ICs3MDAsNyBAQCB2b2lkIHZjcHVfc2hvd19leGVjdXRpb25fc3RhdGUo
c3RydWN0IHZjcHUgKnYpDQo+PiDCoCAjZW5kaWYNCj4+IMKgwqDCoMKgwqAgLyogUHJldmVu
dCBpbnRlcmxlYXZpbmcgb2Ygb3V0cHV0LiAqLw0KPj4gLcKgwqDCoCBmbGFncyA9IGNvbnNv
bGVfbG9ja19yZWN1cnNpdmVfaXJxc2F2ZSgpOw0KPj4gK8KgwqDCoCByc3Bpbl9sb2NrX2ly
cXNhdmUoJmNvbnNvbGVfbG9jaywgZmxhZ3MpOw0KPj4gwqDCoMKgwqDCoCB2Y3B1X3Nob3df
cmVnaXN0ZXJzKHYpOw0KPj4gQEAgLTcwOCw3ICs3MTAsNyBAQCB2b2lkIHZjcHVfc2hvd19l
eGVjdXRpb25fc3RhdGUoc3RydWN0IHZjcHUgKnYpDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAqIFN0b3AgaW50ZXJsZWF2aW5nIHByZXZlbnRpb246IFRoZSBuZWNlc3NhcnkgUDJNIGxv
b2t1cHMgaW52b2x2ZQ0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBsb2NraW5nLCB3aGlj
aCBoYXMgdG8gb2NjdXIgd2l0aCBJUlFzIGVuYWJsZWQuDQo+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAqLw0KPj4gLcKgwqDCoMKgwqDCoMKgIGNvbnNvbGVfdW5sb2NrX3JlY3Vyc2l2ZV9p
cnFyZXN0b3JlKGZsYWdzKTsNCj4+ICvCoMKgwqDCoMKgwqDCoCByc3Bpbl91bmxvY2tfaXJx
cmVzdG9yZSgmY29uc29sZV9sb2NrLCBmbGFncyk7DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAg
c2hvd19odm1fc3RhY2sodiwgJnYtPmFyY2gudXNlcl9yZWdzKTsNCj4+IMKgwqDCoMKgwqAg
fQ0KPj4gQEAgLTcxNyw3ICs3MTksNyBAQCB2b2lkIHZjcHVfc2hvd19leGVjdXRpb25fc3Rh
dGUoc3RydWN0IHZjcHUgKnYpDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCBndWVzdF9r
ZXJuZWxfbW9kZSh2LCAmdi0+YXJjaC51c2VyX3JlZ3MpICkNCj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHNob3dfZ3Vlc3Rfc3RhY2sodiwgJnYtPmFyY2gudXNlcl9yZWdzKTsN
Cj4+IC3CoMKgwqDCoMKgwqDCoCBjb25zb2xlX3VubG9ja19yZWN1cnNpdmVfaXJxcmVzdG9y
ZShmbGFncyk7DQo+PiArwqDCoMKgwqDCoMKgwqAgcnNwaW5fdW5sb2NrX2lycXJlc3RvcmUo
JmNvbnNvbGVfbG9jaywgZmxhZ3MpOw0KPj4gwqDCoMKgwqDCoCB9DQo+PiDCoCAjaWZkZWYg
Q09ORklHX0hWTQ0KPj4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vc3BpbmxvY2suYyBiL3hl
bi9jb21tb24vc3BpbmxvY2suYw0KPj4gaW5kZXggNDIyYTdmYjFkYi4uYzFhOWJhMTMwNCAx
MDA2NDQNCj4+IC0tLSBhL3hlbi9jb21tb24vc3BpbmxvY2suYw0KPj4gKysrIGIveGVuL2Nv
bW1vbi9zcGlubG9jay5jDQo+PiBAQCAtNDc1LDYgKzQ3NSwxNiBAQCB2b2lkIHJzcGluX2xv
Y2socnNwaW5sb2NrX3QgKmxvY2spDQo+PiDCoMKgwqDCoMKgIGxvY2stPnJlY3Vyc2VfY250
Kys7DQo+PiDCoCB9DQo+PiArdW5zaWduZWQgbG9uZyBfX3JzcGluX2xvY2tfaXJxc2F2ZShy
c3BpbmxvY2tfdCAqbG9jaykNCj4gDQo+IFRoaXMgaXMgZ29pbmcgdG8gYmUgYSBwcm9ibGVt
IHdpdGggTUlTUkEgKHNlZSBSdWxlIDIxLjEpLiBDYW4geW91IG1vdmUgdGhlIA0KPiBkb3Vi
bGUgdW5kZXJzY29yZSB0byB0aGUgZW5kPyBBbHRlcm5hdGl2ZWx5LCBJIGFtIG5vdCBzdXJl
IEkgc2VlIHRoZSBiZW5lZml0cyBvZiANCj4gdGhlIGZ1bmN0aW9uIGhlcmUuIFNvIG1heWJl
IHdlIGNhbiBmb2xkIHRoZSBjb2RlIGluIHRoZSBtYWNybyBiZWxvdz8NCg0KSSB0aGluayBJ
J2xsIGZvbGxvdyB0aGUgY29tbW9uIHBhdHRlcm4gYW5kIGp1c3QgcmVuYW1lIHRoZSBmdW5j
dGlvbiBhcyB5b3UNCnN1Z2dlc3QuDQoNCg0KSnVlcmdlbg0K
--------------R5bQB0BxqjpYCEMs0I9wj6BF
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------R5bQB0BxqjpYCEMs0I9wj6BF--

--------------5561XOhLCVmcVW5pzsZi1Wua--

--------------p4lMFVoq5Uhj0mhRryFnJsEv
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmV4a1AFAwAAAAAACgkQsN6d1ii/Ey8K
kAf6AtObs21GOtX2D8uV2dJRj08bzx6WS3P/mxCaA8GxtBDZmRPqC2KCctVsUZ1sNxil4rO+jn5I
v+VAdE8gYirUsXh/8hkB6WGrMcujgzXMJ1UDNhgOBETArPKQccwMAJvPKywYKRR0Osi/w/YqBUDL
/GKJRpqpqGtE6dYezfaMcljtqyg6qxu86EifBhZmkUZWd9oqqtXP0CgoIgoM6E4DDx5+ZY+vIhny
aIo6fot30Jqjwy5WVLZwz0hrQBJ9R/bDZZ6GvXsxd7nn2dJEabn3ZzITaRbifhfjttBFQK2RgLCJ
nwhbukdVSL+gyVAB8yAgYBPE43k8V41wLpsLj9o9sQ==
=tVbB
-----END PGP SIGNATURE-----

--------------p4lMFVoq5Uhj0mhRryFnJsEv--

