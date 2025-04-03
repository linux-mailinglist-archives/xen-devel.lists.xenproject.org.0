Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18273A7A21B
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 13:45:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.936700.1337892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0J0r-00016x-8q; Thu, 03 Apr 2025 11:45:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 936700.1337892; Thu, 03 Apr 2025 11:45:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0J0r-00014n-5w; Thu, 03 Apr 2025 11:45:37 +0000
Received: by outflank-mailman (input) for mailman id 936700;
 Thu, 03 Apr 2025 11:45:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qNKJ=WV=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1u0J0q-00014Z-1e
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 11:45:36 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27106b64-1081-11f0-9ffb-bf95429c2676;
 Thu, 03 Apr 2025 13:45:34 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 97AA82118C;
 Thu,  3 Apr 2025 11:45:33 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3CC3613A2C;
 Thu,  3 Apr 2025 11:45:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id g6dQDd107meSHwAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 03 Apr 2025 11:45:33 +0000
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
X-Inumbo-ID: 27106b64-1081-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1743680733; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=huW5P+sO427yMCFgCir947LLkhzoOx5DdpPVIcqojs4=;
	b=gJuMUTZXX2LpX+TRVUE+OauZ4VLozJqBtJ6MJVm9uJfSGDTTIeSV/aNhrqWG5tL4mrFibj
	fNt+70T45p/YAiGS6SDPuRn1Uf6YSEENcu56AJ49tEbKngtNdigsRe5VX2BBZimsq7WM+p
	xQR+wsBuxA5QgY6n5RKQMP7JvjqKSp8=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=gJuMUTZX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1743680733; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=huW5P+sO427yMCFgCir947LLkhzoOx5DdpPVIcqojs4=;
	b=gJuMUTZXX2LpX+TRVUE+OauZ4VLozJqBtJ6MJVm9uJfSGDTTIeSV/aNhrqWG5tL4mrFibj
	fNt+70T45p/YAiGS6SDPuRn1Uf6YSEENcu56AJ49tEbKngtNdigsRe5VX2BBZimsq7WM+p
	xQR+wsBuxA5QgY6n5RKQMP7JvjqKSp8=
Message-ID: <fcfe6ea3-6951-4892-accb-13dac0268068@suse.com>
Date: Thu, 3 Apr 2025 13:45:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/3] docs: update xenstore migration stream definition
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250314121835.1879-1-jgross@suse.com>
 <20250314121835.1879-2-jgross@suse.com>
 <85aa1047-b045-4004-9306-b40e8c5fa6d9@suse.com>
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
In-Reply-To: <85aa1047-b045-4004-9306-b40e8c5fa6d9@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------cl6kC0jq2bdYm3uyaXj5pKAw"
X-Rspamd-Queue-Id: 97AA82118C
X-Spam-Score: -6.41
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-6.41 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SIGNED_PGP(-2.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:dkim,suse.com:mid,suse.com:email]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------cl6kC0jq2bdYm3uyaXj5pKAw
Content-Type: multipart/mixed; boundary="------------IRID20eYKf0SCuMtDB0racen";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <fcfe6ea3-6951-4892-accb-13dac0268068@suse.com>
Subject: Re: [PATCH v9 1/3] docs: update xenstore migration stream definition
References: <20250314121835.1879-1-jgross@suse.com>
 <20250314121835.1879-2-jgross@suse.com>
 <85aa1047-b045-4004-9306-b40e8c5fa6d9@suse.com>
In-Reply-To: <85aa1047-b045-4004-9306-b40e8c5fa6d9@suse.com>
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

--------------IRID20eYKf0SCuMtDB0racen
Content-Type: multipart/mixed; boundary="------------xWbYh2129DsqGWMoqd3SqJwr"

--------------xWbYh2129DsqGWMoqd3SqJwr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjUuMDMuMjUgMTA6MTcsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+IE9uIDE0LjAzLjI1
IDEzOjE4LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gSW4gb3JkZXIgdG8gY2xvc2UgYSBy
YWNlIHdpbmRvdyBmb3IgWGVuc3RvcmUgbGl2ZSB1cGRhdGUgd2hlbiB1c2luZw0KPj4gdGhl
IG5ldyB1bmlxdWVfaWQgb2YgZG9tYWlucywgdGhlIG1pZ3JhdGlvbiBzdHJlYW0gbmVlZHMg
dG8gY29udGFpbg0KPj4gdGhpcyB1bmlxdWVfaWQgZm9yIGVhY2ggZG9tYWluIGtub3duIGJ5
IFhlbnN0b3JlLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9z
c0BzdXNlLmNvbT4NCj4gDQo+IFRoaXMgcGF0Y2ggaXMgc3RpbGwgbWlzc2luZyBhbiBBY2su
DQoNClBJTkc/DQoNCj4gDQo+IEp1bGllbj8NCj4gDQo+IA0KPiBKdWVyZ2VuDQo+IA0KPj4g
LS0tDQo+PiBWODoNCj4+IC0gbmV3IHBhdGNoDQo+PiBWOToNCj4+IC0gaW5zdGVhZCBvZiB1
c2luZyBhbiBvZmZzZXQsIHVzZSBhIGZsYWcgZm9yIHVuaXF1ZV9pZCBwcmVzZW5jZQ0KPj4g
wqDCoCAoSnVsaWVuIEdyYWxsKQ0KPj4gLS0tDQo+PiDCoCBkb2NzL2Rlc2lnbnMveGVuc3Rv
cmUtbWlncmF0aW9uLm1kIHwgMTggKysrKysrKysrKysrKysrKystDQo+PiDCoCAxIGZpbGUg
Y2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPj4NCj4+IGRpZmYg
LS1naXQgYS9kb2NzL2Rlc2lnbnMveGVuc3RvcmUtbWlncmF0aW9uLm1kIGIvZG9jcy9kZXNp
Z25zL3hlbnN0b3JlLSANCj4+IG1pZ3JhdGlvbi5tZA0KPj4gaW5kZXggMDgyMzE0YmY3Mi4u
YTBhY2Q3NmNlMSAxMDA2NDQNCj4+IC0tLSBhL2RvY3MvZGVzaWducy94ZW5zdG9yZS1taWdy
YXRpb24ubWQNCj4+ICsrKyBiL2RvY3MvZGVzaWducy94ZW5zdG9yZS1taWdyYXRpb24ubWQN
Cj4+IEBAIC0xNTYsNyArMTU2LDcgQEAgdGhlIGRvbWFpbiBiZWluZyBtaWdyYXRlZC4NCj4+
IMKgIGBgYA0KPj4gwqDCoMKgwqDCoCAwwqDCoMKgwqDCoMKgIDHCoMKgwqDCoMKgwqAgMsKg
wqDCoMKgwqDCoCAzwqDCoMKgwqDCoMKgIDTCoMKgwqDCoMKgwqAgNcKgwqDCoMKgwqDCoCA2
wqDCoMKgwqDCoMKgIDfCoMKgwqAgb2N0ZXQNCj4+IMKgICstLS0tLS0tKy0tLS0tLS0rLS0t
LS0tLSstLS0tLS0tKy0tLS0tLS0rLS0tLS0tLSstLS0tLS0tKy0tLS0tLS0rDQo+PiAtfCBj
b25uLWlkwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCBj
b25uLXR5cGXCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8DQo+PiAr
fCBjb25uLWlkwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fCBjb25uLXR5cGXCoMKgwqDCoCB8IGZpZWxkc8KgwqDCoMKgwqDCoMKgIHwNCj4+IMKgICst
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLSstLS0tLS0t
LS0tLS0tLS0rDQo+PiDCoCB8IGNvbm4tc3BlYw0KPj4gwqAgLi4uDQo+PiBAQCAtMTY1LDYg
KzE2NSw5IEBAIHRoZSBkb21haW4gYmVpbmcgbWlncmF0ZWQuDQo+PiDCoCArLS0tLS0tLS0t
LS0tLS0tKy0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
Kw0KPj4gwqAgfCBkYXRhDQo+PiDCoCAuLi4NCj4+ICsrLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKw0KPj4gK3wgdW5p
cXVlLWlkwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfA0KPj4gKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0rDQo+PiDCoCBgYGANCj4+IEBAIC0xNzgsNiArMTgxLDE2
IEBAIHRoZSBkb21haW4gYmVpbmcgbWlncmF0ZWQuDQo+PiDCoCB8wqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHwgMHgwMDAxOiBzb2NrZXTCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfA0KPj4gwqAgfMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDB4MDAwMiAtIDB4RkZGRjogcmVzZXJ2ZWQg
Zm9yIGZ1dHVyZSB1c2XCoMKgwqDCoCB8DQo+PiDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfA0KPj4g
K3wgYGZpZWxkc2DCoMKgwqDCoMKgwqAgfCBBIGNvbGxlY3Rpb24gb2YgZmxhZ3MgaW5kaWNh
dGluZyBwcmVzZW5jZcKgwqDCoCB8DQo+PiArfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB8IG9mIGFkZGl0aW9uYWwgZmllbGRzIGFmdGVyIHRoZSB2YXJpYWJsZcKgwqDCoMKg
wqAgfA0KPj4gK3zCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCBsZW5ndGggYGRh
dGFgIHBhcnQuIFRoZSBhZGRpdGlvbmFsIGZpZWxkc8KgwqDCoCB8DQo+PiArfMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IHdpbGwgc3RhcnQgYWZ0ZXIgYSBwb3NzaWJsZSBw
YWRkaW5nIGZvcsKgwqDCoMKgwqAgfA0KPj4gK3zCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfCBhbGlnbmluZyB0byBhIDggb2N0ZXQgYm91bmRhcnkuwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfA0KPj4gK3zCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCBE
ZWZpbmVkIGZsYWcgdmFsdWVzICh0byBiZSBvci1lZCk6wqDCoMKgwqDCoMKgwqDCoMKgwqAg
fA0KPj4gK3zCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAweDAwMDE6IGB1bmlx
dWVfaWRgIHByZXNlbnQgKG9ubHkgbmVlZGVkIGZvciB8DQo+PiArfMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoCBgc2hhcmVkIHJpbmdgIGNvbm5l
Y3Rpb24gaW4gbGl2ZcKgwqDCoMKgIHwNCj4+ICt8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKgIHVwZGF0ZSBzdHJlYW1zKS7CoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwNCj4+ICt8wqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfA0K
Pj4gwqAgfCBgY29ubi1zcGVjYMKgwqDCoCB8IFNlZSBiZWxvd8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fA0KPj4gwqAgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwNCj4+IMKgIHwgYGluLWRhdGEtbGVuYMKgIHwg
VGhlIGxlbmd0aCAoaW4gb2N0ZXRzKSBvZiBhbnkgZGF0YSByZWFkwqDCoMKgwqDCoCB8DQo+
PiBAQCAtMTkzLDYgKzIwNiw5IEBAIHRoZSBkb21haW4gYmVpbmcgbWlncmF0ZWQuDQo+PiDC
oCB8IGBkYXRhYMKgwqDCoMKgwqDCoMKgwqAgfCBQZW5kaW5nIGRhdGE6IGZpcnN0IGluLWRh
dGEtbGVuIG9jdGV0cyBvZsKgwqDCoCB8DQo+PiDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHwgcmVhZCBkYXRhLCB0aGVuIG91dC1kYXRhLWxlbiBvY3RldHMgb2bCoMKg
wqDCoMKgwqAgfA0KPj4gwqAgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IHdy
aXR0ZW4gZGF0YSAoYW55IG9mIGJvdGggbWF5IGJlIGVtcHR5KcKgwqDCoMKgwqAgfA0KPj4g
K3zCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB8DQo+PiArfCBgdW5pcXVlLWlkYMKgwqDCoCB8IFVuaXF1ZSBp
ZGVudGlmaWVyIG9mIGEgZG9tYWluwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwN
Cj4+ICt8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfA0KPj4gwqAgSW4gY2FzZSBvZiBsaXZlIHVwZGF0ZSB0
aGUgY29ubmVjdGlvbiByZWNvcmQgZm9yIHRoZSBjb25uZWN0aW9uIHZpYSB3aGljaA0KPj4g
wqAgdGhlIGxpdmUgdXBkYXRlIGNvbW1hbmQgd2FzIGlzc3VlZCB3aWxsIGNvbnRhaW4gdGhl
IHJlc3BvbnNlIGZvciB0aGUgbGl2ZQ0KPiANCg0K
--------------xWbYh2129DsqGWMoqd3SqJwr
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
jR/i1DG86lem3iBDXzXsZDn8R3/CwO0EGAEIACAWIQSFEmdy6PYElKXQl/ew3p3W
KL8TLwUCWt3w0AIbAgCBCRCw3p3WKL8TL3YgBBkWCAAdFiEEUy2wekH2OPMeOLge
gFxhu0/YY74FAlrd8NAACgkQgFxhu0/YY75NiwD/fQf/RXpyv9ZX4n8UJrKDq422
bcwkujisT6jix2mOOwYBAKiip9+mAD6W5NPXdhk1XraECcIspcf2ff5kCAlG0DIN
aTUH/RIwNWzXDG58yQoLdD/UPcFgi8GWtNUp0Fhc/GeBxGipXYnvuWxwS+Qs1Qay
7/Nbal/v4/eZZaWs8wl2VtrHTS96/IF6q2o0qMey0dq2AxnZbQIULiEndgR625EF
RFg+IbO4ldSkB3trsF2ypYLij4ZObm2casLIP7iB8NKmQ5PndL8Y07TtiQ+Sb/wn
g4GgV+BJoKdDWLPCAlCMilwbZ88Ijb+HF/aipc9hsqvW/hnXC2GajJSAY3Qs9Mib
4Hm91jzbAjmp7243pQ4bJMfYHemFFBRaoLC7ayqQjcsttN2ufINlqLFPZPR/i3IX
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------xWbYh2129DsqGWMoqd3SqJwr--

--------------IRID20eYKf0SCuMtDB0racen--

--------------cl6kC0jq2bdYm3uyaXj5pKAw
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmfudNwFAwAAAAAACgkQsN6d1ii/Ey8i
GQf/XjFfIgFRiFKeUgtQnMtSMgcAOAVH9zlhP/TX3h/c7+nVXWlbtTOyHLOjO1+3b45Xc+1yyr9K
aa26Pn2BD7f5EI84LrCfEUiOLzxVng0dTxpa63wGgHRmYvCZzcHAKWIYzy8914CE7eKMMNAl+ITw
qlCkeqsm0eJJRyOCsx12H+nR6ta58/CecYDbElT8wXOoJmy/kscN4zWSgu4LtA1niOQm5BuYZvBs
LiYzaU7BlOPxwc3d+JQRLY5kiLV2ZsGTxZcM4mrE0+byadpz7UZzVG9tbOpgp4Rn2Gv7nYJVvT1y
gHO+W9DNslybxuKqNQAv/UoU9HOm8kylueAHSc9s0w==
=NacV
-----END PGP SIGNATURE-----

--------------cl6kC0jq2bdYm3uyaXj5pKAw--

