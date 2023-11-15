Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E67C67EBCEC
	for <lists+xen-devel@lfdr.de>; Wed, 15 Nov 2023 07:08:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633488.988296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3942-0003DO-6I; Wed, 15 Nov 2023 06:07:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633488.988296; Wed, 15 Nov 2023 06:07:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3942-0003Ad-2e; Wed, 15 Nov 2023 06:07:50 +0000
Received: by outflank-mailman (input) for mailman id 633488;
 Wed, 15 Nov 2023 06:07:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gzjc=G4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r3940-0003AW-I9
 for xen-devel@lists.xenproject.org; Wed, 15 Nov 2023 06:07:48 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 49853e31-837d-11ee-9b0e-b553b5be7939;
 Wed, 15 Nov 2023 07:07:42 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AC1EB228CC;
 Wed, 15 Nov 2023 06:07:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7D2A113587;
 Wed, 15 Nov 2023 06:07:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id fb7IHC1gVGU/TgAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 15 Nov 2023 06:07:41 +0000
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
X-Inumbo-ID: 49853e31-837d-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1700028461; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Rcjbqfau94OW5xXAgSbqgOq9roqaL9/DTlbXIFbneZ4=;
	b=ShfsqFqWC5fK5AVJsbZxz775yxohPg4QcJU+0P9uUpGeq2K0zaZkt6Mz3Ydm8zHVmdwUzR
	aoa8GA6U79hbMX4oUjJK3qQnHnFXNA3oyHonKAl+Nan8q7OlR4pgs+sSLjvhbK/xSO6I/0
	WBDCh25fNuHcNTKosXNtyeJYAe2El5Q=
Message-ID: <a79ee5b8-96bb-4d00-847f-48ca6c2ca03e@suse.com>
Date: Wed, 15 Nov 2023 07:07:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 25/29] tools/xenstored: map stubdom interface
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20231110160804.29021-1-jgross@suse.com>
 <20231110160804.29021-26-jgross@suse.com>
 <3df5d15e-c42d-4e95-bbea-41969a0b2b5e@xen.org>
 <3aacfaf1-5331-4e9c-99b3-b9c84af0de28@suse.com>
 <6062375b-ed94-46ba-a405-e3e7148ddc6f@xen.org>
 <e5d9e34c-da64-4386-b04c-d8bf2c171e07@suse.com>
 <27ec5caf-78ce-4685-97ae-f2e150323f32@xen.org>
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
In-Reply-To: <27ec5caf-78ce-4685-97ae-f2e150323f32@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------hVuRoAxyL39926EDCqqYtnoT"
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -8.98
X-Spamd-Result: default: False [-8.98 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 HAS_ATTACHMENT(0.00)[];
	 NEURAL_HAM_LONG(-2.99)[-0.995];
	 BAYES_HAM(-3.00)[100.00%];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-1.00)[-1.000];
	 MIME_BASE64_TEXT(0.10)[];
	 SIGNED_PGP(-2.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[];
	 MIME_UNKNOWN(0.10)[application/pgp-keys]
X-Spam-Flag: NO

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------hVuRoAxyL39926EDCqqYtnoT
Content-Type: multipart/mixed; boundary="------------PPaT7vZ3ZMslDAOZN7Falj9D";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <a79ee5b8-96bb-4d00-847f-48ca6c2ca03e@suse.com>
Subject: Re: [PATCH v2 25/29] tools/xenstored: map stubdom interface
References: <20231110160804.29021-1-jgross@suse.com>
 <20231110160804.29021-26-jgross@suse.com>
 <3df5d15e-c42d-4e95-bbea-41969a0b2b5e@xen.org>
 <3aacfaf1-5331-4e9c-99b3-b9c84af0de28@suse.com>
 <6062375b-ed94-46ba-a405-e3e7148ddc6f@xen.org>
 <e5d9e34c-da64-4386-b04c-d8bf2c171e07@suse.com>
 <27ec5caf-78ce-4685-97ae-f2e150323f32@xen.org>
In-Reply-To: <27ec5caf-78ce-4685-97ae-f2e150323f32@xen.org>

--------------PPaT7vZ3ZMslDAOZN7Falj9D
Content-Type: multipart/mixed; boundary="------------CimUMNH0mFltKdcJQsO06iws"

--------------CimUMNH0mFltKdcJQsO06iws
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTQuMTEuMjMgMjE6NDgsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGksDQo+IA0KPiBP
biAxNC8xMS8yMDIzIDA5OjEyLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMTQuMTEu
MjMgMDk6NTYsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+PiBIaSwNCj4+Pg0KPj4+IE9uIDE0
LzExLzIwMjMgMDY6MzMsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+Pj4+IE9uIDEzLjExLjIz
IDIzOjA0LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+Pj4+PiBIaSBKdWVyZ2VuLA0KPj4+Pj4N
Cj4+Pj4+IE9uIDEwLzExLzIwMjMgMTY6MDgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+Pj4+
Pj4gV2hlbiBydW5uaW5nIGFzIHN0dWJkb20sIG1hcCB0aGUgc3R1YmRvbSdzIFhlbnN0b3Jl
IHJpbmcgcGFnZSBpbiBvcmRlcg0KPj4+Pj4+IHRvIHN1cHBvcnQgdXNpbmcgdGhlIDlwZnMg
ZnJvbnRlbmQuDQo+Pj4+Pj4NCj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3Nz
IDxqZ3Jvc3NAc3VzZS5jb20+DQo+Pj4+Pj4gLS0tDQo+Pj4+Pj4gwqAgdG9vbHMveGVuc3Rv
cmVkL2NvcmUuY8KgwqAgfMKgIDIgKysNCj4+Pj4+PiDCoCB0b29scy94ZW5zdG9yZWQvZG9t
YWluLmMgfCAyNyArKysrKysrKysrKysrKysrKysrKysrKysrKy0NCj4+Pj4+PiDCoCB0b29s
cy94ZW5zdG9yZWQvZG9tYWluLmggfMKgIDEgKw0KPj4+Pj4+IMKgIDMgZmlsZXMgY2hhbmdl
ZCwgMjkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPj4+Pj4+DQo+Pj4+Pj4gZGlm
ZiAtLWdpdCBhL3Rvb2xzL3hlbnN0b3JlZC9jb3JlLmMgYi90b29scy94ZW5zdG9yZWQvY29y
ZS5jDQo+Pj4+Pj4gaW5kZXggYjllYzUwYjM0Yy4uNGE5ZDg3NGYxNyAxMDA2NDQNCj4+Pj4+
PiAtLS0gYS90b29scy94ZW5zdG9yZWQvY29yZS5jDQo+Pj4+Pj4gKysrIGIvdG9vbHMveGVu
c3RvcmVkL2NvcmUuYw0KPj4+Pj4+IEBAIC0yOTkxLDYgKzI5OTEsOCBAQCBpbnQgbWFpbihp
bnQgYXJnYywgY2hhciAqYXJndltdKQ0KPj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBsdV9y
ZWFkX3N0YXRlKCk7DQo+Pj4+Pj4gwqAgI2VuZGlmDQo+Pj4+Pj4gK8KgwqDCoCBzdHViZG9t
X2luaXQoKTsNCj4+Pj4+PiArDQo+Pj4+Pj4gwqDCoMKgwqDCoCBjaGVja19zdG9yZSgpOw0K
Pj4+Pj4+IMKgwqDCoMKgwqAgLyogR2V0IHJlYWR5IHRvIGxpc3RlbiB0byB0aGUgdG9vbHMu
ICovDQo+Pj4+Pj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3hlbnN0b3JlZC9kb21haW4uYyBiL3Rv
b2xzL3hlbnN0b3JlZC9kb21haW4uYw0KPj4+Pj4+IGluZGV4IGZhMTdmNjg2MTguLjE2MmI4
N2I0NjAgMTAwNjQ0DQo+Pj4+Pj4gLS0tIGEvdG9vbHMveGVuc3RvcmVkL2RvbWFpbi5jDQo+
Pj4+Pj4gKysrIGIvdG9vbHMveGVuc3RvcmVkL2RvbWFpbi5jDQo+Pj4+Pj4gQEAgLTM3LDYg
KzM3LDEwIEBADQo+Pj4+Pj4gwqAgI2luY2x1ZGUgPHhlbmN0cmwuaD4NCj4+Pj4+PiDCoCAj
aW5jbHVkZSA8eGVuL2dyYW50X3RhYmxlLmg+DQo+Pj4+Pj4gKyNpZmRlZiBfX01JTklPU19f
DQo+Pj4+Pj4gKyNpbmNsdWRlIDxtaW5pLW9zL3hlbmJ1cy5oPg0KPj4+Pj4+ICsjZW5kaWYN
Cj4+Pj4+PiArDQo+Pj4+Pj4gwqAgc3RhdGljIHhjX2ludGVyZmFjZSAqKnhjX2hhbmRsZTsN
Cj4+Pj4+PiDCoCB4ZW5nbnR0YWJfaGFuZGxlICoqeGd0X2hhbmRsZTsNCj4+Pj4+PiDCoCBz
dGF0aWMgZXZ0Y2huX3BvcnRfdCB2aXJxX3BvcnQ7DQo+Pj4+Pj4gQEAgLTUwMCw2ICs1MDQs
MTEgQEAgc3RhdGljIHZvaWQgKm1hcF9pbnRlcmZhY2UoZG9taWRfdCBkb21pZCkNCj4+Pj4+
PiDCoMKgwqDCoMKgIGlmIChkb21pZCA9PSB4ZW5idXNfbWFzdGVyX2RvbWlkKCkpDQo+Pj4+
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiB4ZW5idXNfbWFwKCk7DQo+Pj4+Pj4gKyNp
ZmRlZiBfX01JTklPU19fDQo+Pj4+Pj4gK8KgwqDCoCBpZiAoZG9taWQgPT0gc3R1Yl9kb21p
ZCkNCj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHhlbnN0b3JlX2J1ZjsNCj4+Pj4+
PiArI2VuZGlmDQo+Pj4+Pj4gKw0KPj4+Pj4+IMKgwqDCoMKgwqAgcmV0dXJuIHhlbmdudHRh
Yl9tYXBfZ3JhbnRfcmVmKCp4Z3RfaGFuZGxlLCBkb21pZCwNCj4+Pj4+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgR05UVEFCX1JFU0VSVkVE
X1hFTlNUT1JFLA0KPj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBQUk9UX1JFQUR8UFJPVF9XUklURSk7DQo+Pj4+Pj4gQEAgLTUwOSw3
ICs1MTgsNyBAQCBzdGF0aWMgdm9pZCB1bm1hcF9pbnRlcmZhY2UoZG9taWRfdCBkb21pZCwg
dm9pZCANCj4+Pj4+PiAqaW50ZXJmYWNlKQ0KPj4+Pj4+IMKgIHsNCj4+Pj4+PiDCoMKgwqDC
oMKgIGlmIChkb21pZCA9PSB4ZW5idXNfbWFzdGVyX2RvbWlkKCkpDQo+Pj4+Pj4gwqDCoMKg
wqDCoMKgwqDCoMKgIHVubWFwX3hlbmJ1cyhpbnRlcmZhY2UpOw0KPj4+Pj4+IC3CoMKgwqAg
ZWxzZQ0KPj4+Pj4+ICvCoMKgwqAgZWxzZSBpZiAoZG9taWQgIT0gc3R1Yl9kb21pZCkNCj4+
Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgeGVuZ250dGFiX3VubWFwKCp4Z3RfaGFuZGxlLCBp
bnRlcmZhY2UsIDEpOw0KPj4+Pj4+IMKgIH0NCj4+Pj4+PiBAQCAtMTIxNCw2ICsxMjIzLDIy
IEBAIHZvaWQgZG9tMF9pbml0KHZvaWQpDQo+Pj4+Pj4gwqDCoMKgwqDCoCB4ZW5ldnRjaG5f
bm90aWZ5KHhjZV9oYW5kbGUsIGRvbTAtPnBvcnQpOw0KPj4+Pj4+IMKgIH0NCj4+Pj4+PiAr
dm9pZCBzdHViZG9tX2luaXQodm9pZCkNCj4+Pj4+PiArew0KPj4+Pj4+ICsjaWZkZWYgX19N
SU5JT1NfXw0KPj4+Pj4+ICvCoMKgwqAgc3RydWN0IGRvbWFpbiAqc3R1YmRvbTsNCj4+Pj4+
PiArDQo+Pj4+Pj4gK8KgwqDCoCBpZiAoc3R1Yl9kb21pZCA8IDApDQo+Pj4+Pj4gK8KgwqDC
oMKgwqDCoMKgIHJldHVybjsNCj4+Pj4+PiArDQo+Pj4+Pj4gK8KgwqDCoCBzdHViZG9tID0g
aW50cm9kdWNlX2RvbWFpbihOVUxMLCBzdHViX2RvbWlkLCB4ZW5idXNfZXZ0Y2huLCBmYWxz
ZSk7DQo+Pj4+Pj4gK8KgwqDCoCBpZiAoIXN0dWJkb20pDQo+Pj4+Pj4gK8KgwqDCoMKgwqDC
oMKgIGJhcmZfcGVycm9yKCJGYWlsZWQgdG8gaW5pdGlhbGl6ZSBzdHViZG9tIik7DQo+Pj4+
Pj4gKw0KPj4+Pj4+ICvCoMKgwqAgeGVuZXZ0Y2huX25vdGlmeSh4Y2VfaGFuZGxlLCBzdHVi
ZG9tLT5wb3J0KTsNCj4+Pj4+DQo+Pj4+PiBJZiBJIGNvbXBhcmUgdG8gaW50cm9kdWNlX2Rv
bWFpbigpLCBpdCBpcyBub3QgZW50aXJlbHkgY2xlYXIgdG8gbWUgd2h5IHRoZSANCj4+Pj4+
IG5vdGlmaWNhdGlvbiBpcyBkb25lIHVuY29uZGl0aW9uYWxseSBoZXJlLiBDYW4geW91IGNs
YXJpZnk/DQo+Pj4+DQo+Pj4+IFRoZXJlIGlzIG5vIHJlYXNvbiB0byBkbyBpdCBjb25kaXRp
b25hbGx5LCBhcyB3ZSBjYW4gYmUgc3VyZSB0aGUgZXZlbnQgY2hhbm5lbA0KPj4+PiBpcyBl
eGlzdGluZyBhbmQgdGhlIHJpbmcgcGFnZSBpcyBhY2Nlc3NpYmxlLg0KPj4+DQo+Pj4gSG1t
bS4uLiBCdXQgdGhlcmUgaXMgYSBzZWNvbmQgcGFydCBpbiB0aGUgY29uZGl0aW9uOg0KPj4+
DQo+Pj4gZG9tYWluLT5pbnRlcmZhY2UtPmNvbm5lY3Rpb24gPT0gWEVOU1RPUkVfUkVDT05O
RUNUDQo+Pj4NCj4+PiBXaHkgaXNuJ3QgaXQgbmVjZXNzYXJ5IGhlcmU/IFdoYXQgSSBhbSBs
b29raW5nIGZvciBwYXJ0aWN1bGFybHkgaXMgc29tZSANCj4+PiBpbi1jb2RlIGNvbW1lbnQg
KG9yIGF0IGxlYXN0IGluIHRoZSBjb21taXQgbWVzc2FnZSkgYmVjYXVzZSB0aGlzIGlzIG5v
dCAxMDAlIA0KPj4+IGNsZWFyIHdoeSB3ZSBhcmUgZGl2ZXJnaW5nLg0KPj4NCj4+IFRoZSB0
ZXN0IG9mIFhFTlNUT1JFX1JFQ09OTkVDVCBpcyBkb25lIGZvciBkb21VcyBzdGFydGVkIGJl
Zm9yZSBvciB0b2dldGhlciB3aXRoDQo+PiBkb20wIGluIG9yZGVyIHRvIGdpdmUgdGhlbSBh
IHNpZ25hbCB0aGF0IHRoZXkgY2FuIHN0YXJ0IHRvIHVzZSBYZW5zdG9yZS4NCj4+DQo+PiBI
ZXJlIHdlIGFyZSBpbml0aWFsaXppbmcgb3VyIG93biBjb25uZWN0aW9uLCBzbyB0aGVyZSBp
cyBubyBuZWVkIHRvIHRlc3Qgd2hldGhlcg0KPj4gdGhlIG90aGVyIGVuZCBpcyB3YWl0aW5n
IGZvciB1cy4gV2Uga25vdyB0aGVyZSBpcyBubyBwb3NzaWJsZSBwcm9ibGVtIHNlbmRpbmcN
Cj4+IHRoZSBldmVudCwgc28gd2UgY2FuIGp1c3QgZG8gaXQuIFRoZSBtYWluIGluc3RydWN0
aW9uIGd1YXJkZWQgYnkgdGhlIHRlc3Qgb2YNCj4+IFhFTlNUT1JFX1JFQ09OTkVDVCBpcyB0
aGUgc2V0dGluZyBvZiBYRU5TVE9SRV9DT05ORUNURUQsIHdoaWNoIHRoZW4gbmVlZHMgdGhl
DQo+PiBldmVudCB0byBiZSBzZW50IHRvIHNpZ25hbCB0aGF0IGNoYW5nZSBpbiB0aGUgY29u
bmVjdGlvbiBzdGF0ZS4NCj4+DQo+PiBJbiB0aGUgZW5kIHdlIGFyZSBfbm90XyBkaXZlcmdp
bmcuIFlvdSBzaG91bGQganVzdCBjb21wYXJlIHRoZSBjb2RlIHRvIHRoZSBtb3JlDQo+PiBj
b21wYXJhYmxlIGRvbTBfaW5pdCgpIGNvZGUuIFRoZXJlIHRoZSBldmVudCBpcyBiZWluZyBz
ZW50IHVuY29uZGl0aW9uYWxseSwgdG9vLg0KPiANCj4gT2suIENhbiB0aGlzIGJlIGRvY3Vt
ZW50ZWQgc29tZXdoZXJlPw0KDQpJJ2xsIGFkZCBzb21ldGhpbmcgdG8gdGhlIGNvbW1pdCBt
ZXNzYWdlLg0KDQoNCkp1ZXJnZW4NCg0K
--------------CimUMNH0mFltKdcJQsO06iws
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------CimUMNH0mFltKdcJQsO06iws--

--------------PPaT7vZ3ZMslDAOZN7Falj9D--

--------------hVuRoAxyL39926EDCqqYtnoT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVUYC0FAwAAAAAACgkQsN6d1ii/Ey8F
YAf/dQiipK+N6ksefG17ijudRD2eiKhLjMcQOC3OMVq0L2K9q0CZFPjLK/EgeKR9lDt2TIXLUaXj
cP/YVdeNWPF/zcsTDCgE9Fx5vOguC/HOU6p7RCZXfw7ztDqRpcRh4UXkSrDs/fk3IWhKNJUbL3Fx
XcXpobqVExpzLz72irpb8e4DKP02A/K4GgizV5dmMbzzPsPu9+kQXVp7AKm5v8bMvNgZ1CMCkBDW
idb1S3hOlEtqXdwFs0f8pIUz5smWDUsqx2okUitDTA8AHZPFJGVc4EVKaXvJR/j9SRyKSWZ/aLT4
ia5SVA1L0iLQ6eE/s1GPRxJo+bveY8z6CNbLKjbtGA==
=Y5Z8
-----END PGP SIGNATURE-----

--------------hVuRoAxyL39926EDCqqYtnoT--

