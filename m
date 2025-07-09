Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75390AFEBD4
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jul 2025 16:26:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1038294.1410793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZVkl-00057G-TE; Wed, 09 Jul 2025 14:26:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1038294.1410793; Wed, 09 Jul 2025 14:26:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZVkl-000555-QL; Wed, 09 Jul 2025 14:26:31 +0000
Received: by outflank-mailman (input) for mailman id 1038294;
 Wed, 09 Jul 2025 14:26:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Cq+0=ZW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uZVkk-000533-2F
 for xen-devel@lists.xenproject.org; Wed, 09 Jul 2025 14:26:30 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b2dd1956-5cd0-11f0-b894-0df219b8e170;
 Wed, 09 Jul 2025 16:26:27 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3B6C12118A;
 Wed,  9 Jul 2025 14:26:26 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 14DCD136DC;
 Wed,  9 Jul 2025 14:26:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 4vsiAxJ8bmgkbgAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 09 Jul 2025 14:26:26 +0000
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
X-Inumbo-ID: b2dd1956-5cd0-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1752071186; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=5HihxnSeK67U1sYQP1iV7L3ftnIJFwLzJNVk6ZP0s2U=;
	b=mVDGUDVfND6OveLyZEAJd1tjX9RrgHr7WTMCs6V5u/AyRfG7lxI1BkTKOs+zlxWWhakV8l
	VcCpmFDyauHcZSOm4xn77PBIVmT321pbPb373LHayS6M7/nGZJ5OYnwFAdu6eP87Z1UOdb
	m8bfdXtOOb1HtvMJEqbbexrs3AV/Hhc=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1752071186; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=5HihxnSeK67U1sYQP1iV7L3ftnIJFwLzJNVk6ZP0s2U=;
	b=mVDGUDVfND6OveLyZEAJd1tjX9RrgHr7WTMCs6V5u/AyRfG7lxI1BkTKOs+zlxWWhakV8l
	VcCpmFDyauHcZSOm4xn77PBIVmT321pbPb373LHayS6M7/nGZJ5OYnwFAdu6eP87Z1UOdb
	m8bfdXtOOb1HtvMJEqbbexrs3AV/Hhc=
Message-ID: <de4f038f-e399-4fff-956b-9be1b8f5ef44@suse.com>
Date: Wed, 9 Jul 2025 16:26:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MINI-OS PATCH 12/19] mini-os: kexec: add support for handing
 over some memory across kexec
To: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org
References: <20250702081254.14383-1-jgross@suse.com>
 <20250702081254.14383-13-jgross@suse.com>
Content-Language: en-US
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
In-Reply-To: <20250702081254.14383-13-jgross@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ws0MxE6bDzF8XA47iK4fV4BY"
X-Spam-Level: 
X-Spamd-Result: default: False [-5.20 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	NEURAL_HAM_SHORT(-0.20)[-0.993];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email,suse.com:mid];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	HAS_ATTACHMENT(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -5.20

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ws0MxE6bDzF8XA47iK4fV4BY
Content-Type: multipart/mixed; boundary="------------KQiv8MBP00L464vXtTUFTFX7";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org
Message-ID: <de4f038f-e399-4fff-956b-9be1b8f5ef44@suse.com>
Subject: Re: [MINI-OS PATCH 12/19] mini-os: kexec: add support for handing
 over some memory across kexec
References: <20250702081254.14383-1-jgross@suse.com>
 <20250702081254.14383-13-jgross@suse.com>
In-Reply-To: <20250702081254.14383-13-jgross@suse.com>

--------------KQiv8MBP00L464vXtTUFTFX7
Content-Type: multipart/mixed; boundary="------------9G6djNTP63TpIW0j3GWsQ5NI"

--------------9G6djNTP63TpIW0j3GWsQ5NI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDIuMDcuMjUgMTA6MTIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+IEVzcGVjaWFsbHkg
Zm9yIHN1cHBvcnQgb2YgWGVuc3RvcmUtc3R1YmRvbSBsaXZlIHVwZGF0ZSBzb21lIG1lbW9y
eSBtdXN0DQo+IGJlIGhhbmRlZCBvdmVyIHRvIHRoZSBuZXcga2VybmVsIHdpdGhvdXQgbW92
aW5nIGl0IGFyb3VuZDogYXMgdGhlDQo+IDlwZnMgZGV2aWNlIHVzZWQgZm9yIHN0b3Jpbmcg
YW5kIHJldHJpZXZpbmcgdGhlIHN0YXRlIG9mIFhlbnN0b3JlDQo+IG5lZWRzIHRvIGJlIGtl
cHQgb3BlcmF0aW9uYWwgYWNyb3NzIGtleGVjIChpdCBjYW4ndCBiZSByZW9wZW5lZCBkdWUg
dG8NCj4gWGVuc3RvcmUgbm90IGJlaW5nIGF2YWlsYWJsZSB3aXRob3V0IGFjY2VzcyB0byB0
aGUgZGV2aWNlKSwgdGhlIHJpbmcNCj4gcGFnZXMgbmVlZCB0byBiZSBhY2Nlc3NpYmxlIHZp
YSBhY3RpdmUgZ3JhbnRzIGJ5IHRoZSBiYWNrZW5kIGFsbCB0aGUNCj4gdGltZS4NCj4gDQo+
IEFkZCB0aGUgYmFzaWMgc3VwcG9ydCBmb3IgdGhhdCBieSByZXNlcnZpbmcgYSBwcmUtZGVm
aW5lZCBudW1iZXIgb2YNCj4gbWVtb3J5IHBhZ2VzIGF0IHRoZSB0b3Agb2YgdGhlIG1lbW9y
eS4gVGhpcyBtZW1vcnkgYXJlYSB3aWxsIGJlDQo+IGhhbmRlZCBvdmVyIHRvIHRoZSBuZXcg
a2VybmVsIHZpYSBzcGVjaWZ5aW5nIGl0IGFzIGEgbW9kdWxlIGluDQo+IHN0cnVjdCBodm1f
c3RhcnRfaW5mby4NCj4gDQo+IFRoZSBjb250ZW50cyBvZiB0aGUgbWVtb3J5IGFyZWEgYXJl
IGRlc2NyaWJlZCB2aWEgYSBnZW5lcmljIHRhYmxlIG9mDQo+IGNvbnRlbnRzIGluIHRoZSBs
YXN0IHBhZ2Ugb2YgdGhlIG1lbW9yeS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4g
R3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4gLS0tDQo+ICAgQ29uZmlnLm1rICAgICAgICAg
ICAgIHwgIDIgKysNCj4gICBhcmNoL3g4Ni9rZXhlYy5jICAgICAgfCA3NyArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICAgYXJjaC94ODYvbW0uYyAg
ICAgICAgIHwgMTggKysrKysrKysrKw0KPiAgIGFyY2gveDg2L3NldHVwLmMgICAgICB8IDI4
ICsrKysrKysrKysrKysrKysNCj4gICBpbmNsdWRlL2tlcm5lbC5oICAgICAgfCAgMSArDQo+
ICAgaW5jbHVkZS9rZXhlYy5oICAgICAgIHwgNDUgKysrKysrKysrKysrKysrKysrKysrKysr
Kw0KPiAgIGluY2x1ZGUveDg2L2FyY2hfbW0uaCB8ICAxICsNCj4gICBrZXhlYy5jICAgICAg
ICAgICAgICAgfCAgMyArKw0KPiAgIG1tLmMgICAgICAgICAgICAgICAgICB8ICA2ICsrKysN
Cj4gICA5IGZpbGVzIGNoYW5nZWQsIDE4MSBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvQ29uZmlnLm1rIGIvQ29uZmlnLm1rDQo+IGluZGV4IGI5Njc1ZTYxLi4wZTRlODZk
OCAxMDA2NDQNCj4gLS0tIGEvQ29uZmlnLm1rDQo+ICsrKyBiL0NvbmZpZy5taw0KPiBAQCAt
MjIwLDYgKzIyMCw4IEBAIENPTkZJRy0kKGx3aXApICs9IENPTkZJR19MV0lQDQo+ICAgJChm
b3JlYWNoIGksJChDT05GSUcteSksJChldmFsICQoaSkgPz0geSkpDQo+ICAgJChmb3JlYWNo
IGksJChDT05GSUctbiksJChldmFsICQoaSkgPz0gbikpDQo+ICAgDQo+ICtDT05GSUctdmFs
LSQoQ09ORklHX0tFWEVDKSArPSBDT05GSUdfS0VYRUNfTU9EVUxFX1BBR0VTDQo+ICsNCj4g
ICAkKGZvcmVhY2ggaSwkKENPTkZJRy12YWwteSksJChldmFsICQoaSkgPz0gMCkpDQo+ICAg
DQo+ICAgQ09ORklHLXggKz0gQ09ORklHX0xJQlhTDQo+IGRpZmYgLS1naXQgYS9hcmNoL3g4
Ni9rZXhlYy5jIGIvYXJjaC94ODYva2V4ZWMuYw0KPiBpbmRleCA4MDRlN2I2ZC4uN2ZiOTg0
NzMgMTAwNjQ0DQo+IC0tLSBhL2FyY2gveDg2L2tleGVjLmMNCj4gKysrIGIvYXJjaC94ODYv
a2V4ZWMuYw0KPiBAQCAtMjAxLDEwICsyMDEsNzMgQEAgc3RhdGljIHVuc2lnbmVkIGxvbmcg
a2V4ZWNfcGFyYW1fbG9jOw0KPiAgIHN0YXRpYyB1bnNpZ25lZCBpbnQga2V4ZWNfcGFyYW1f
c2l6ZTsNCj4gICBzdGF0aWMgdW5zaWduZWQgbG9uZyBrZXhlY19wYXJhbV9tZW07DQo+ICAg
DQo+ICtzdGF0aWMgc3RydWN0IGtleGVjX21vZHVsZSAqa2V4ZWNfY2hlY2tfbW9kdWxlKHZv
aWQpDQo+ICt7DQo+ICsgICAgdW5zaWduZWQgbG9uZyBtb2Rfc2l6ZTsNCj4gKyAgICB1bnNp
Z25lZCBsb25nIG1vZDsNCj4gKyAgICBzdHJ1Y3Qga2V4ZWNfbW9kdWxlICptb2R1bGVfcHRy
Ow0KPiArDQo+ICsgICAgbW9kID0gZ2V0X21vZHVsZSgmbW9kX3NpemUpOw0KPiArICAgIGlm
ICggIW1vZCApDQo+ICsgICAgICAgIHJldHVybiBOVUxMOw0KPiArICAgIC8qIFNpemUgbXVz
dCBiZSBhIG11bHRpcGxlIG9mIFBBR0VfU0laRS4gKi8NCj4gKyAgICBpZiAoIG1vZF9zaXpl
ICYgflBBR0VfTUFTSyApDQo+ICsgICAgICAgIHJldHVybiBOVUxMOw0KPiArDQo+ICsgICAg
LyogS3hlYyBtb2R1bGUgZGVzY3JpcHRpb24gaXMgYXQgc3RhcnQgb2YgdGhlIGxhc3QgcGFn
ZSBvZiB0aGUgbW9kdWxlLiAqLw0KPiArICAgIG1vZHVsZV9wdHIgPSAodm9pZCAqKShtb2Qg
KyBtb2Rfc2l6ZSAtICh1bnNpZ25lZCBsb25nKVBBR0VfU0laRSk7DQo+ICsNCj4gKyAgICAv
KiBDaGVjayBleWUgY2F0Y2hlci4gKi8NCj4gKyAgICBpZiAoIG1lbWNtcChtb2R1bGVfcHRy
LT5leWVfY2F0Y2hlciwgS0VYRUNNT0RfRVlFQ0FUQ0hFUiwNCj4gKyAgICAgICAgICAgICAg
ICBzaXplb2YobW9kdWxlX3B0ci0+ZXllX2NhdGNoZXIpKSApDQo+ICsgICAgICAgIHJldHVy
biBOVUxMOw0KPiArICAgIGlmICggbW9kdWxlX3B0ci0+bl9wYWdlcyAhPSAobW9kX3NpemUg
Pj4gUEFHRV9TSElGVCkgLSAxICkNCj4gKyAgICAgICAgcmV0dXJuIE5VTEw7DQoNClRoZXJl
IGlzIG1pc3Npbmc6DQoNCisgICAga2V4ZWNfbW9kX3N0YXJ0ID0gbW9kOw0KDQpPdGhlcndp
c2UgYSBzZWNvbmQgbGl2ZSB1cGRhdGUgd29uJ3Qgd29yay4NCg0KSSdsbCB3YWl0IGZvciBt
b3JlIGZlZWRiYWNrIGJlZm9yZSBzZW5kaW5nIG91dCBWMi4NCg0KDQpKdWVyZ2VuDQo=
--------------9G6djNTP63TpIW0j3GWsQ5NI
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------9G6djNTP63TpIW0j3GWsQ5NI--

--------------KQiv8MBP00L464vXtTUFTFX7--

--------------ws0MxE6bDzF8XA47iK4fV4BY
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmhufBEFAwAAAAAACgkQsN6d1ii/Ey9v
Rgf9HfVtoWfMCsCKRbLZUZl9nfKmUUXMjnlHWS/DCR4avXDVi/dtvAwoE+D8DUIorgGSXO/tXlVb
vcKXOWCY4rjMWto2Y2cKM64A2ETMVqwiTW0GPBrC/54sHJ5UyOEYdomZw/kZdyevQ7gn1JuAsbjL
Kz/GqGWu+8Q+cqO2eAVV/1kySk0sfcaBtfd4BVxbRh0cjZ6CNcYuHJ16rKuRcIrKqYv0sbg/4Q7Y
Wmw0GyLnaHV39ekNhs9hXkS/DbqcQFTqlLQ5NCL34hMMi6ZQ7uOrlCvayUx4GDD/hTmQivFNvqGe
zhZGUK44fnM9Pv8jIcKSTYy+9bhgEnu3rf+hRyF7vw==
=cQC7
-----END PGP SIGNATURE-----

--------------ws0MxE6bDzF8XA47iK4fV4BY--

