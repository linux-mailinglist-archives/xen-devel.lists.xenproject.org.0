Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD781C8032B
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 12:27:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1170374.1495431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNUiv-00088d-Dk; Mon, 24 Nov 2025 11:27:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1170374.1495431; Mon, 24 Nov 2025 11:27:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNUiv-00085y-Av; Mon, 24 Nov 2025 11:27:13 +0000
Received: by outflank-mailman (input) for mailman id 1170374;
 Mon, 24 Nov 2025 11:27:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fNsn=6A=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vNUit-00085q-RS
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 11:27:11 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 84204c2e-c928-11f0-9d18-b5c5bf9af7f9;
 Mon, 24 Nov 2025 12:27:10 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 682212125F;
 Mon, 24 Nov 2025 11:27:09 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1CC123EA61;
 Mon, 24 Nov 2025 11:27:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id iyPeBA1BJGk+XgAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 24 Nov 2025 11:27:09 +0000
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
X-Inumbo-ID: 84204c2e-c928-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1763983629; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=BxJrhF0qZZGaXD5JOd96CV6+FokP/qPOdSZVX/1/zeU=;
	b=JlkDbRV1GrTZqBK9zyoB6YMozaWa8Gzluy2TJ9ybHXPY1+tLSBrrPhAuMJJwkIIIwD0crs
	h77+bW6j+SfGtwtORLhwy87yudS/MGoy3V3W4Towghi6iHG0UXjnD8/qqJSpYKpJPWCqau
	I4Lka7UG3GwIuNAWFRQuBqQnN6rDdTg=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1763983629; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=BxJrhF0qZZGaXD5JOd96CV6+FokP/qPOdSZVX/1/zeU=;
	b=JlkDbRV1GrTZqBK9zyoB6YMozaWa8Gzluy2TJ9ybHXPY1+tLSBrrPhAuMJJwkIIIwD0crs
	h77+bW6j+SfGtwtORLhwy87yudS/MGoy3V3W4Towghi6iHG0UXjnD8/qqJSpYKpJPWCqau
	I4Lka7UG3GwIuNAWFRQuBqQnN6rDdTg=
Message-ID: <bf7e1a66-1696-477a-bdef-79b08df0b57c@suse.com>
Date: Mon, 24 Nov 2025 12:27:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] build: add make macro for making file from file.in
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20251121132332.23514-1-jgross@suse.com>
 <20251121132332.23514-2-jgross@suse.com>
 <d34e3e86-c51a-49b3-8b46-140526755f0f@suse.com>
 <826037a5-dacf-434f-90d9-8f12e61bdd6e@suse.com>
 <0ece9df6-8a04-4ffa-bcf4-d7a3fd4bbef4@suse.com>
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
In-Reply-To: <0ece9df6-8a04-4ffa-bcf4-d7a3fd4bbef4@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------sTysG7EEywjnoecedBYkpKjr"
X-Spam-Level: 
X-Spamd-Result: default: False [-6.20 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SIGNED_PGP(-2.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid];
	HAS_ATTACHMENT(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -6.20

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------sTysG7EEywjnoecedBYkpKjr
Content-Type: multipart/mixed; boundary="------------sT0dDdY8TeXlYCGHJ0YQhR97";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-ID: <bf7e1a66-1696-477a-bdef-79b08df0b57c@suse.com>
Subject: Re: [PATCH v3 1/4] build: add make macro for making file from file.in
References: <20251121132332.23514-1-jgross@suse.com>
 <20251121132332.23514-2-jgross@suse.com>
 <d34e3e86-c51a-49b3-8b46-140526755f0f@suse.com>
 <826037a5-dacf-434f-90d9-8f12e61bdd6e@suse.com>
 <0ece9df6-8a04-4ffa-bcf4-d7a3fd4bbef4@suse.com>
In-Reply-To: <0ece9df6-8a04-4ffa-bcf4-d7a3fd4bbef4@suse.com>
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

--------------sT0dDdY8TeXlYCGHJ0YQhR97
Content-Type: multipart/mixed; boundary="------------50a3LfQMdvEmf5ZefgcCHYOK"

--------------50a3LfQMdvEmf5ZefgcCHYOK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMTEuMjUgMTI6MTUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyNC4xMS4yMDI1
IDEyOjA1LCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0KPj4gT24gMjQuMTEuMjUgMTE6NDEsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDIxLjExLjIwMjUgMTQ6MjMsIEp1ZXJnZW4gR3Jv
c3Mgd3JvdGU6DQo+Pj4+IC0tLSBhL0NvbmZpZy5taw0KPj4+PiArKysgYi9Db25maWcubWsN
Cj4+Pj4gQEAgLTE1OSw2ICsxNTksMTkgQEAgZGVmaW5lIG1vdmUtaWYtY2hhbmdlZA0KPj4+
PiAgICAJaWYgISBjbXAgLXMgJCgxKSAkKDIpOyB0aGVuIG12IC1mICQoMSkgJCgyKTsgZWxz
ZSBybSAtZiAkKDEpOyBmaQ0KPj4+PiAgICBlbmRlZg0KPj4+PiAgICANCj4+Pj4gK1BBVEhf
RklMRVMgOj0gUGF0aHMNCj4+Pj4gK0lOQ19GSUxFUyA9ICQoZm9yZWFjaCBmLCAkKFBBVEhf
RklMRVMpLCAkKFhFTl9ST09UKS9jb25maWcvJChmKS5taykNCj4+Pj4gKw0KPj4+PiAraW5j
bHVkZSAkKElOQ19GSUxFUykNCj4+Pj4gKw0KPj4+PiArQlVJTERfTUFLRV9WQVJTID0gJChm
b3JlYWNoIGYsICQoUEFUSF9GSUxFUyksICQoc2hlbGwgYXdrICckJDIgPT0gIjo9IiB7IHBy
aW50ICQkMTsgfScgJChYRU5fUk9PVCkvY29uZmlnLyQoZikubWsuaW4pKQ0KPj4+DQo+Pj4g
RmVlbHMgbGlrZSBteSBwcmlvciBjb21tZW50cyB3ZXJlbid0IHJlYWxseSBhZGRyZXNzZWQu
IEkgY29udGludWUgdG8gdGhpbmsgdGhhdA0KPj4+IG5vbmUgb2YgdGhlIGFib3ZlIGlzIHBh
cnQgb2Ygd2hhdCB0aGUgc3ViamVjdCBzYXlzLg0KPj4NCj4+IEkgcmVhbGx5IGRvbid0IHVu
ZGVyc3RhbmQgeW91ciBjb25jZXJuIGhlcmUuDQo+Pg0KPj4gRm9yIHJlcGxhY2luZyB0aGUg
QG1hcmtlcnNAIG1ha2UgbmVlZHMgdG8ga25vdyB3aGF0IHNob3VsZCBiZSByZXBsYWNlZC4N
Cj4+IFNvIGl0IG5lZWRzIHRvIHNjYW4gdGhlIGZpbGVzIGNvbnRhaW5pbmcgdGhlIG1hcmtl
cnMgYW5kIGdhdGhlciB0aGVtLg0KPj4gVGhpcyBpcyB3aGF0IGlzIGRvbmUgYWJvdmUuDQo+
Pg0KPj4gSW4gdGhlIGZpbmFsIG1hY3JvIGJlbG93IHRoZSByZXBsYWNlbWVudHMgYXJlIGRv
bmUgdGhlbi4gSG93IHdvdWxkIHlvdQ0KPj4gaGFuZGxlIHRoYXQ/DQo+IA0KPiBCeSBwYXNz
aW5nIChhbm90aGVyKSBhcmd1bWVudCB0byB0aGUgbWFjcm8sIGZvciBleGFtcGxlLiBBcyBp
bmRpY2F0ZWQNCj4gZWFybGllciwgZGlmZmVyZW50IHN1Yi10cmVlcyBtYXkgaGF2ZSBkaWZm
ZXJlbnQgcGxhY2VzIHdoZXJlIHRoZXNlDQo+IGRlZmluaXRpb25zIGxpdmUsIGFuZCB0aGV5
IHdvdWxkIHdhbnQgdG8gYmUgYWJsZSB0byBwYXNzIHRoYXQgaW4NCj4gKGlkZWFsbHkgd2l0
aG91dCBuZWVkaW5nIHRvIHB1dCB0aGlzIGluIGEgY29tbW9uIHBhcnQgb2YgdGhlIHRyZWUp
Lg0KDQpJIGRvbid0IGdldCB3aGF0IHlvdSB3YW50IHRvIHBhc3MgaW4gYWRkaXRpb25hbGx5
Lg0KDQpJJ3ZlIGFscmVhZHkgY2hhbmdlZCB0aGUgbWFjcm8gYW5kIHRoZSBNYWtlZmlsZXMg
dG8gYmUgYWJsZSB0byBhZGQgYW5vdGhlcg0KbWFya2VyIGZpbGUgdG8gdGhlIFBBVEhfRklM
RVMgdmFyaWFibGUuIFdoYXQgZWxzZSBkbyB5b3UgbmVlZD8NCg0KU2VlIHBhdGNoIDQgaW4g
dG9vbHMvUnVsZXMubWsgYWRkaW5nIHRoZSBhZGRpdGlvbmFsIHJlZmVyZW5jZSB0bw0KVG9v
bHMtcGF0aHMubWsgYnkgZG9pbmc6DQoNClBBVEhfRklMRVMgKz0gVG9vbHMtcGF0aHMubWsN
Cg0KDQpKdWVyZ2VuDQo=
--------------50a3LfQMdvEmf5ZefgcCHYOK
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------50a3LfQMdvEmf5ZefgcCHYOK--

--------------sT0dDdY8TeXlYCGHJ0YQhR97--

--------------sTysG7EEywjnoecedBYkpKjr
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmkkQQwFAwAAAAAACgkQsN6d1ii/Ey/T
vAf9FGBX6t2YtTYr/z7p+j67uVvoI4M+xK7wI2OOnGEbAufmJLEYtKIzMpJbFv1YtU3IQE3+8Dxu
h8s8fMGhYd1PnOSG3AyrF64BZBNOSTevPVqDPklcyGT9X6sSDU23D9j0/yJGGaG4vSzqLI7l3Mqh
uQlH6+Z0f6+yn1i4jmZ3X5NfT6F7zpeHKdzvlAuyXlrIY3gAtt/k/SMuR667RsR3rPba0mGobd5b
OH1O3dobhRqjMEuA2FGYRovjEH5WQBOkzArdnRIgvL6Bvq5CVlR8BW1CO2cYE5hK/yAJoNQcLWv0
kRY/ROIus8fFRjTSeg/N+3yMrUfC6DGscddN+LXcVg==
=znFe
-----END PGP SIGNATURE-----

--------------sTysG7EEywjnoecedBYkpKjr--

