Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A9D8CE74A
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 16:41:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729607.1134813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAW6J-0002I9-Dp; Fri, 24 May 2024 14:40:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729607.1134813; Fri, 24 May 2024 14:40:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAW6J-0002Fy-BC; Fri, 24 May 2024 14:40:55 +0000
Received: by outflank-mailman (input) for mailman id 729607;
 Fri, 24 May 2024 14:40:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nTfd=M3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sAW6H-0002Fn-IO
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 14:40:53 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e30d040-19db-11ef-b4bb-af5377834399;
 Fri, 24 May 2024 16:40:51 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BFB4A33B83;
 Fri, 24 May 2024 14:40:50 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 98C3113A6B;
 Fri, 24 May 2024 14:40:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id /CMLGPCmUGbEWQAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 24 May 2024 14:40:48 +0000
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
X-Inumbo-ID: 9e30d040-19db-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1716561650; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=riUbNz8090F/aCxwRYIWhw+gpOC1R1iOokj7sIQEEUg=;
	b=CfJCGk3JIUQnKJqV9f+nnbD0aAI8XmKw9gkpmWhECrUHi4ECrAYLFunUXs/UhokS2y4XX9
	oxM0+LoS4fILWwjueS5/Tlfmz9GwhadnRc5bB0U1e9ex8HQKQGzSosHBwZNj7gQA5+iPD+
	V0GfNH4dZxM5j0Rl/fo2sS05u7i6nag=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=CfJCGk3J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1716561650; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=riUbNz8090F/aCxwRYIWhw+gpOC1R1iOokj7sIQEEUg=;
	b=CfJCGk3JIUQnKJqV9f+nnbD0aAI8XmKw9gkpmWhECrUHi4ECrAYLFunUXs/UhokS2y4XX9
	oxM0+LoS4fILWwjueS5/Tlfmz9GwhadnRc5bB0U1e9ex8HQKQGzSosHBwZNj7gQA5+iPD+
	V0GfNH4dZxM5j0Rl/fo2sS05u7i6nag=
Message-ID: <85991a0d-ba43-4701-bc1d-c63b52a05c93@suse.com>
Date: Fri, 24 May 2024 16:40:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] xen/arm: Alloc XenStore page for Dom0less DomUs
 from hypervisor
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, Henry Wang <xin.wang2@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Alec Kwapis <alec.kwapis@medtronic.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>
References: <20240517032156.1490515-1-xin.wang2@amd.com>
 <20240517032156.1490515-3-xin.wang2@amd.com>
 <cf0a096a-0fe8-4d91-a064-910bd6c43951@xen.org>
 <d3aca96b-2b6b-4bb8-99bf-7c0ede4c94fe@suse.com>
Content-Language: en-US
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
In-Reply-To: <d3aca96b-2b6b-4bb8-99bf-7c0ede4c94fe@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0JS4HoVF0CdaNsppIN81Phlu"
X-Spam-Level: 
X-Spamd-Result: default: False [-8.40 / 50.00];
	BAYES_HAM(-3.00)[99.98%];
	SIGNED_PGP(-2.00)[];
	DWL_DNSWL_MED(-2.00)[suse.com:dkim];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	MX_GOOD(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	HAS_ATTACHMENT(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: BFB4A33B83
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -8.40

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0JS4HoVF0CdaNsppIN81Phlu
Content-Type: multipart/mixed; boundary="------------g4fXSKxlImaQsBgaeHNovRnH";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, Henry Wang <xin.wang2@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Alec Kwapis <alec.kwapis@medtronic.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>
Message-ID: <85991a0d-ba43-4701-bc1d-c63b52a05c93@suse.com>
Subject: Re: [PATCH v3 2/4] xen/arm: Alloc XenStore page for Dom0less DomUs
 from hypervisor
References: <20240517032156.1490515-1-xin.wang2@amd.com>
 <20240517032156.1490515-3-xin.wang2@amd.com>
 <cf0a096a-0fe8-4d91-a064-910bd6c43951@xen.org>
 <d3aca96b-2b6b-4bb8-99bf-7c0ede4c94fe@suse.com>
In-Reply-To: <d3aca96b-2b6b-4bb8-99bf-7c0ede4c94fe@suse.com>

--------------g4fXSKxlImaQsBgaeHNovRnH
Content-Type: multipart/mixed; boundary="------------ayNag0yu1eLYaC2E0XRDMQ0x"

--------------ayNag0yu1eLYaC2E0XRDMQ0x
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMDUuMjQgMTY6MzAsIErDvHJnZW4gR3Jvw58gd3JvdGU6DQo+IE9uIDI0LjA1LjI0
IDE1OjU4LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+PiBIaSBIZW5yeSwNCj4+DQo+PiArIEp1
ZXJnZW4gYXMgdGhlIFhlbnN0b3JlIG1haW50YWluZXJzLiBJJ2QgbGlrZSBoaXMgb3Bpbmlv
biBvbiB0aGUgYXBwcm9hY2guIA0KPj4gVGhlIGRvY3VtZW50YXRpb24gb2YgdGhlIG5ldyBs
b2dpYyBpcyBpbjoNCj4+DQo+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy94ZW4tZGV2ZWwv
MjAyNDA1MTcwMzIxNTYuMTQ5MDUxNS01LXhpbi53YW5nMkBhbWQuY29tLw0KPj4NCj4+IEZX
SVcgSSBhbSBoYXBweSBpbiBwcmluY2lwbGUgd2l0aCB0aGUgbG9naWMgKHRoaXMgaXMgd2hh
dCB3ZSBkaXNjdXNzZWQgb24gdGhlIA0KPj4gY2FsbCBsYXN0IHdlZWspLiBTb21lIGNvbW1l
bnRzIGJlbG93Lg0KPiANCj4gSSdtIG5vdCBhZ2FpbnN0IHRoaXMgbG9naWMsIGJ1dCBJJ20g
d29uZGVyaW5nIHdoeSBpdCBuZWVkcyB0byBiZSBzbw0KPiBjb21wbGljYXRlZC4NCj4gDQo+
IENhbid0IHRoZSBkb21VIGl0c2VsZiBhbGxvY2F0ZSB0aGUgWGVuc3RvcmUgcGFnZSBmcm9t
IGl0cyBSQU0gcGFnZXMsDQo+IHdyaXRlIHRoZSBQRk4gaW50byB0aGUgWGVuc3RvcmUgZ3Jh
bnQgdGFiIGVudHJ5LCBhbmQgdGhlbiBtYWtlIGl0DQo+IHB1YmxpYyB2aWEgc2V0dGluZyBI
Vk1fUEFSQU1fU1RPUkVfUEZOPw0KPiANCj4gVGhlIGluaXQtZG9tMGxlc3MgYXBwbGljYXRp
b24gY291bGQgdGhlbiBjaGVjayBIVk1fUEFSQU1fU1RPUkVfUEZODQo+IGJlaW5nIHNldCBh
bmQgY2FsbCBYU19pbnRyb2R1Y2VfZG9tYWluLg0KPiANCj4gTm90ZSB0aGF0IGF0IGxlYXN0
IEMteGVuc3RvcmVkIGRvZXMgbm90IG5lZWQgdGhlIFBGTiBvZiB0aGUgWGVuc3RvcmUNCj4g
cGFnZSwgYXMgaXQgaXMganVzdCB1c2luZyBHTlRUQUJfUkVTRVJWRURfWEVOU1RPUkUgZm9y
IG1hcHBpbmcgdGhlDQo+IHBhZ2UuDQoNCkhtbSwgc2VlbXMgYXMgaWYgTy14ZW5zdG9yZWQg
aXMgdXNpbmcgdGhlIG1hcF9mb3JlaWduX3BhZ2UgbWVjaGFuaXNtIHdpdGgNCnRoZSBQRk4g
dG8gbWFwIHRoZSBYZW5zdG9yZSByaW5nIHBhZ2UuIE1heWJlIHRoaXMgc2hvdWxkIGJlIGNo
YW5nZWQgdG8gdXNlDQp0aGUgZ3JhbnQgZW50cnksIHRvbz8NCg0KDQpKdWVyZ2VuDQoNCg==

--------------ayNag0yu1eLYaC2E0XRDMQ0x
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------ayNag0yu1eLYaC2E0XRDMQ0x--

--------------g4fXSKxlImaQsBgaeHNovRnH--

--------------0JS4HoVF0CdaNsppIN81Phlu
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmZQpu4FAwAAAAAACgkQsN6d1ii/Ey9j
+QgAnFXDi3Iz9s9w15kGC/dSJWQEAaYvil0h0OnM2eiHUdhtuM3etZOEtOypo7SJqMOAGmo05OOc
uDaAiVZfZfzwT2SE3H2hjlQWGbN6ktduUwdhquF5CQISKpNkFGpgkVjj+g1ONuQzSLHz60Axi++c
FBZRQvEmK/6h7WpmpphVs2EuYUrcNFsqyIwwus68M/4TW+zhUWHf1koPjaBzvD93ZVQYAvmm/bHk
yzVs9WIxmfq/BrihKuo4FP59Fnr67sJr+ibpka+YHdtMH5PLy6pmsRciN+2A67MkvAL+5HX6Jylg
QGZ3OvNGmp5JUfGn1XZIfvGFU1cYTebdzo1iRLaT1A==
=efVD
-----END PGP SIGNATURE-----

--------------0JS4HoVF0CdaNsppIN81Phlu--

