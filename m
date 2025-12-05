Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A400CA739F
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 11:45:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1178776.1502497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRTIz-0004ts-84; Fri, 05 Dec 2025 10:44:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1178776.1502497; Fri, 05 Dec 2025 10:44:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRTIz-0004ra-4P; Fri, 05 Dec 2025 10:44:53 +0000
Received: by outflank-mailman (input) for mailman id 1178776;
 Fri, 05 Dec 2025 10:44:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5iRA=6L=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vRTIx-0004rU-6P
 for xen-devel@lists.xenproject.org; Fri, 05 Dec 2025 10:44:51 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6be7ffe6-d1c7-11f0-980a-7dc792cee155;
 Fri, 05 Dec 2025 11:44:48 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8BAA9336E6;
 Fri,  5 Dec 2025 10:44:45 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4D7523EA63;
 Fri,  5 Dec 2025 10:44:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id TnJeEZ23MmmVNwAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 05 Dec 2025 10:44:45 +0000
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
X-Inumbo-ID: 6be7ffe6-d1c7-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1764931486; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Xwswb1XkY/Rqc3qfBD/nbIFZPYqLcXTHXfPjaUMTZ/A=;
	b=ud0OmcddstZE3s7du7a9mh5+uKxQBUx+JRb4Qa52uF9ex4fY4sTyRLkCaK39gIuXTzOhGW
	w1Ou/9YK+JvUOGgFcEt0OhJOwb8Wpb16QuJI13csaLiB/xusrKv3F3mxW23mPKqHRH8VA4
	WvZUB5j+PhndAR4K8Y+UlGrg1nMgcwY=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=ZWci4EFC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1764931485; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Xwswb1XkY/Rqc3qfBD/nbIFZPYqLcXTHXfPjaUMTZ/A=;
	b=ZWci4EFCMnXkXcH7se46Myw+uz3oZcGVaMhYn6ivTPDhe4nB2c4xBuNXqOK+ORvZwQ9S7D
	ex/O7DBnpasp4nDJPJTFnv+xRWKJbf90HeX+fRUiXrvOygWVLX2eXNXCrP0GcUeNNi5nDO
	i8UyHOaCmw9z3WQAptvnOG6H2aOCwlQ=
Message-ID: <6b3544b2-dc62-4577-81f1-8069669d5b3a@suse.com>
Date: Fri, 5 Dec 2025 11:44:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/12] Changes for several CI improvements
To: Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.fb9bd2be49ef9017f3552508f8c59849b8c0086f.1764866136.git-series.marmarek@invisiblethingslab.com>
 <16830f7a-1bc9-472a-adfc-1d959b6fa58e@suse.com> <aTKrCwCNwtT9ysIz@mail-itl>
 <54cad03d-5530-4d6a-b3c3-956906daac1c@suse.com>
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
In-Reply-To: <54cad03d-5530-4d6a-b3c3-956906daac1c@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------GKHYNN3tRrOJEZeFDqxZ5LAV"
X-Spamd-Result: default: False [-6.41 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SIGNED_PGP(-2.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:dkim,suse.com:mid,gitlab.com:url]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Queue-Id: 8BAA9336E6
X-Spam-Flag: NO
X-Spam-Score: -6.41

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------GKHYNN3tRrOJEZeFDqxZ5LAV
Content-Type: multipart/mixed; boundary="------------3ppZT0uFoK5HOtCOwBYMK2RE";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
Message-ID: <6b3544b2-dc62-4577-81f1-8069669d5b3a@suse.com>
Subject: Re: [PATCH v2 00/12] Changes for several CI improvements
References: <cover.fb9bd2be49ef9017f3552508f8c59849b8c0086f.1764866136.git-series.marmarek@invisiblethingslab.com>
 <16830f7a-1bc9-472a-adfc-1d959b6fa58e@suse.com> <aTKrCwCNwtT9ysIz@mail-itl>
 <54cad03d-5530-4d6a-b3c3-956906daac1c@suse.com>
In-Reply-To: <54cad03d-5530-4d6a-b3c3-956906daac1c@suse.com>
Autocrypt-Gossip: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJ3BBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AAIQkQoDSui/t3IH4WIQQ+pJkfkcoLMCa4X6CgNK6L+3cgfgn7AJ9DmMd0SMJE
 ePbc7/m22D2v04iu7ACffXTdZQhNl557tJuDXZSBxDmW/tLOwU0EWTecRBAIAIK5OMKMU5R2
 Lk2bbjgX7vyQuCFFyKf9rC/4itNwhYWFSlKzVj3WJBDsoi2KvPm7AI+XB6NIkNAkshL5C0kd
 pcNd5Xo0jRR5/WE/bT7LyrJ0OJWS/qUit5eNNvsO+SxGAk28KRa1ieVLeZi9D03NL0+HIAtZ
 tecfqwgl3Y72UpLUyt+r7LQhcI/XR5IUUaD4C/chB4Vq2QkDKO7Q8+2HJOrFIjiVli4lU+Sf
 OBp64m//Y1xys++Z4ODoKh7tkh5DxiO3QBHG7bHK0CSQsJ6XUvPVYubAuy1XfSDzSeSBl//C
 v78Fclb+gi9GWidSTG/4hsEzd1fY5XwCZG/XJJY9M/sAAwUH/09Ar9W2U1Qm+DwZeP2ii3Ou
 14Z9VlVVPhcEmR/AFykL9dw/OV2O/7cdi52+l00reUu6Nd4Dl8s4f5n8b1YFzmkVVIyhwjvU
 jxtPyUgDOt6DRa+RaDlXZZmxQyWcMv2anAgYWGVszeB8Myzsw8y7xhBEVV1S+1KloCzw4V8Z
 DSJrcsZlyMDoiTb7FyqxwQnM0f6qHxWbmOOnbzJmBqpNpFuDcz/4xNsymJylm6oXiucHQBAP
 Xb/cE1YNHpuaH4SRhIxwQilCYEznWowQphNAbJtEKOmcocY7EbSt8VjXTzmYENkIfkrHRyXQ
 dUm5AoL51XZljkCqNwrADGkTvkwsWSvCSQQYEQIACQUCWTecRAIbDAAKCRCgNK6L+3cgfuef
 AJ9wlZQNQUp0KwEf8Tl37RmcxCL4bQCcC5alCSMzUBJ5DBIcR4BY+CyQFAs=

--------------3ppZT0uFoK5HOtCOwBYMK2RE
Content-Type: multipart/mixed; boundary="------------BXke29YBNnHh0RuEFJ0TWbkr"

--------------BXke29YBNnHh0RuEFJ0TWbkr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDUuMTIuMjUgMTA6NTksIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNS4xMi4yMDI1
IDEwOjUxLCBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgd3JvdGU6DQo+PiBPbiBGcmks
IERlYyAwNSwgMjAyNSBhdCAwODozNDoxMEFNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToN
Cj4+PiBPbiAwNC4xMi4yMDI1IDE3OjM3LCBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kg
d3JvdGU6DQo+Pj4+IC0gQWxwaW5lIHVwZGF0ZQ0KPj4+PiAtIERlYmlhbiB0cml4aWUNCj4+
Pj4gLSBMaW51eCBzdHViZG9tDQo+Pj4+IC0gdGVzdCBhcmJpdHJhcnkgbGludXggYnJhbmNo
DQo+Pj4+DQo+Pj4+IFRlY2huaWNhbGx5LCB0aGUgbGFzdCBwYXRjaCBpc24ndCBzdHJpY3Rs
eSByZXF1aXJlZCwgYnV0IGl0IGVhc2VzIGRlYnVnZ2luZy4NCj4+Pj4NCj4+Pj4gR3JlZW4g
cGlwZWxpbmU6IGh0dHBzOi8vZ2l0bGFiLmNvbS94ZW4tcHJvamVjdC9wZW9wbGUvbWFybWFy
ZWsvdGVzdC1hcnRpZmFjdHMvLS9waXBlbGluZXMvMjE5NjYzMDYzNw0KPj4+Pg0KPj4+PiBN
YXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgKDEyKToNCj4+Pj4gICAgQWRkIEFscGluZSAz
LjIyIGNvbnRhaW5lcnMNCj4+Pj4gICAgU3dpdGNoIExpbnV4IGJ1aWxkcyB0byB1c2UgQWxw
aW5lIDMuMjIgY29udGFpbmVyDQo+Pj4+ICAgIEFkZCBkZWJpYW4gcm9vdGZzIGFydGlmYWN0
DQo+Pj4+ICAgIEFkZCBsaW51eC02LjEyLjYwLXg4Nl82NA0KPj4+PiAgICBFbmFibGUgQ09O
RklHX1VTQl9SVEw4MTUyIGluIGtlcm5lbCBmb3IgaHcxMiBydW5uZXINCj4+Pj4gICAgSW5j
bHVkZSBnaXQgaW4gdGhlIEFSTTY0IGJ1aWxkIGNvbnRhaW5lciB0b28NCj4+Pj4gICAgU3Vw
cG9ydCBidWlsZGluZyBhcmJpdHJhcnkgTGludXggYnJhbmNoL3RhZy9jb21taXQNCj4+Pj4g
ICAgU2F2ZSBMaW51eCBjb25maWcgdG8gYXJ0aWZhY3RzIHRvbw0KPj4+PiAgICBBZGQgbGlu
dXgtc3R1YmRvbSBkZXBlbmRlbmNpZXMNCj4+Pj4gICAgUHJlcGFyZSBncnViIGZvciBib290
aW5nIHg4Nl82NCBIVk0gZG9tVSBmcm9tIGEgZGlzaw0KPj4+PiAgICBQcmVwYXJlIGdydWIg
Zm9yIGJvb3RpbmcgeDg2XzY0IEhWTSBkb21VIGZyb20gYSBjZHJvbQ0KPj4+PiAgICBTZXR1
cCBzc2ggYWNjZXNzIHRvIHRlc3Qgc3lzdGVtcw0KPj4+DQo+Pj4gTGlrZSBmb3IgdGhlIG90
aGVyIHNlcmllcywgd2hlcmUgb25lIHBhdGNoIGlzIG1pc3NpbmcsIEknZCBsaWtlIHRvIG1l
bnRpb24NCj4+PiB0aGF0IGhlcmUgcGF0Y2hlcyAwMSBhbmQgMDMgZGlkbid0IG1ha2UgaXQu
DQo+Pg0KPj4gWWVzLi4uDQo+PiBJIGRvbid0IGtub3cgd2hhdCB0byBkbyBhYm91dCBpdC4u
LiB4ZW4tZGV2ZWwgbGlzdCByZWplY3QgZW1haWxzIHdpdGgNCj4+IGRvY2tlcmZpbGUgY2hh
bmdlcyBhcyAic3BhbSIuIFBlb3BsZSBDQ2VkIGRpcmVjdGx5IGdvdCBpdC4gU2hvdWxkIEkN
Cj4+IGluY2x1ZGUgbW9yZSBwZW9wbGUgaW4gZG9ja2VyZmlsZSBwYXRjaGVzLCBqdXN0IGlu
IGNhc2U/DQo+IA0KPiBQZXJzb25hbGx5IEknZCBzYXkgbm8sIGJ1dCBtYXliZSBvdGhlcnMg
ZGlmZmVyLiBJbW8gdGhpcyBuZWVkcyBzb2x2aW5nIHNvbWUNCj4gb3RoZXIgd2F5LCBhcyBs
ZWdpdGltYXRlIGNvbnRlbnQgcmVhbGx5IHNob3VsZG4ndCBiZSBibG9ja2VkIGZyb20gaGl0
dGluZyB0aGUNCj4gbGlzdC4NCg0KSSBhZ3JlZS4gV2h5IGlzIHRoZXJlIGEgc3BhbSBmaWx0
ZXIgYXQgYWxsPyB4ZW4tZGV2ZWwgaXMgbW9kZXJhdGVkIGZvcg0Kbm9uLXN1YnNjcmliZXJz
LCBzbyB0aGVyZSBzaG91bGRuJ3QgYmUgdGhhdCBtdWNoIHNwYW0gd2hpY2ggbWFrZXMgaXQg
dG8NCnRoZSBsaXN0LiBBbmQgaW4gY2FzZSB0aGVyZSBpcywgd2Ugc2hvdWxkIGFkZCB0aGUg
c2VuZGVyIHRvIHRoZSBtYWlsbWFuDQpmaWx0ZXIuDQoNCg0KSnVlcmdlbg0KDQo=
--------------BXke29YBNnHh0RuEFJ0TWbkr
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------BXke29YBNnHh0RuEFJ0TWbkr--

--------------3ppZT0uFoK5HOtCOwBYMK2RE--

--------------GKHYNN3tRrOJEZeFDqxZ5LAV
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmkyt5wFAwAAAAAACgkQsN6d1ii/Ey8p
agf+ORKCS1kkG2FhpQvLOzUG+dwpVX+8n372h7Nyk8d/X0lOiTHjsg0M//AluxdTeXBHJ1Em13Cx
RVjJiMGIP/L6lx0UdZW0kSVw2LDLjgRuxHNpE5B41CBtU05NnG7voZaRQYTEoocBgohW5DFUV5Mi
4ij6W3aHRzKwZ3laQaB0xeBvBVvmIozSRufxX6IAH1lwkn2LH/h0MvCc9cpk1BbtjcWb/m5+HQ2C
Ny4MRDtYufElw/FUT9dVhX2M9VAUU8bA2cidMajzvxvD0Bm6s7jAbgwvF2wC6HhPEybwwgy0uORX
uLYDWy7vUGF1txpDXPhwqTVFl0xGjERcUptqVXxBCw==
=G06x
-----END PGP SIGNATURE-----

--------------GKHYNN3tRrOJEZeFDqxZ5LAV--

