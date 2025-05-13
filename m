Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CF4AB566C
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 15:46:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.982868.1369221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEpxr-000466-CE; Tue, 13 May 2025 13:46:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 982868.1369221; Tue, 13 May 2025 13:46:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEpxr-00043g-97; Tue, 13 May 2025 13:46:35 +0000
Received: by outflank-mailman (input) for mailman id 982868;
 Tue, 13 May 2025 13:46:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lyic=X5=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uEpxp-00043a-GX
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 13:46:33 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id adbc939a-3000-11f0-9eb6-5ba50f476ded;
 Tue, 13 May 2025 15:46:32 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D3FCD211F5;
 Tue, 13 May 2025 13:46:31 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 79AF31365D;
 Tue, 13 May 2025 13:46:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id UqQkHDdNI2gqYgAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 13 May 2025 13:46:31 +0000
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
X-Inumbo-ID: adbc939a-3000-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1747143991; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=tR76EuqUQ9RmOFfMWzr/dqiKVhXSESONtLn/NfETjuY=;
	b=TiRckzaehSsnYenzrJGrLLxRUi6eACFOKXoHAtz2yKikILtwP3oN7ppJilc3nPLpfotjba
	SFff2n992tIXo5vUo6wqBON6zJoWgFoe3TISDY+RZmUdZ8EwMw/GO0lva+BXOcHr2e96XV
	ewfMObmYsZATL9Gr1uIpXrEk3ps7I/o=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1747143991; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=tR76EuqUQ9RmOFfMWzr/dqiKVhXSESONtLn/NfETjuY=;
	b=TiRckzaehSsnYenzrJGrLLxRUi6eACFOKXoHAtz2yKikILtwP3oN7ppJilc3nPLpfotjba
	SFff2n992tIXo5vUo6wqBON6zJoWgFoe3TISDY+RZmUdZ8EwMw/GO0lva+BXOcHr2e96XV
	ewfMObmYsZATL9Gr1uIpXrEk3ps7I/o=
Message-ID: <186e7924-c033-4af7-b125-9c3e9fa35b4b@suse.com>
Date: Tue, 13 May 2025 15:46:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] remove qemu-traditional
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
References: <20250429110636.30518-1-jgross@suse.com>
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
In-Reply-To: <20250429110636.30518-1-jgross@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------nycpEwHGVIJwTi0blFid2ngj"
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.70 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vates.tech,citrix.com,amd.com,suse.com,xen.org,kernel.org,invisiblethingslab.com,gmail.com,xenproject.org,ens-lyon.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.70

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------nycpEwHGVIJwTi0blFid2ngj
Content-Type: multipart/mixed; boundary="------------onNVJEpexbSHN7lqxE5rZJau";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Message-ID: <186e7924-c033-4af7-b125-9c3e9fa35b4b@suse.com>
Subject: Re: [PATCH v3 0/4] remove qemu-traditional
References: <20250429110636.30518-1-jgross@suse.com>
In-Reply-To: <20250429110636.30518-1-jgross@suse.com>
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

--------------onNVJEpexbSHN7lqxE5rZJau
Content-Type: multipart/mixed; boundary="------------NEpkplsOiJP0kHAPgjOAhjQc"

--------------NEpkplsOiJP0kHAPgjOAhjQc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

UGluZz8NCg0KT24gMjkuMDQuMjUgMTM6MDYsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+IFJl
bW92ZSB0aGUgcWVtdS10cmFkaXRpb25hbCBzdXBwb3J0LiBUaGlzIGluY2x1ZGVzIHRoZSBN
aW5pLU9TDQo+IGJhc2VkIGlvZW11LXN0dWJkb20uDQo+IA0KPiBEb24ndCByZW1vdmUgUk9N
QklPUyBmb3Igbm93LCBhcyBpdCBjYW4gYmUgdXNlZCB3aXRoIHFlbXUgKFhlblNlcnZlcg0K
PiBpcyBkb2luZyB0aGF0KS4NCj4gDQo+IEFmdGVyIGFkZGluZyB0aGUgc2VyaWVzIGEgcnVu
IG9mIGF1dG9jb25mIHNob3VsZCBiZSBkb25lLg0KPiANCj4gQ2hhbmdlcyBpbiBWMjoNCj4g
LSBhZGRyZXNzZWQgY29tbWVudHMNCj4gDQo+IENoYW5nZXMgaW4gVjM6DQo+IC0gcGF0Y2hl
cyAxIGFuZCA1IG9mIFYyIGhhdmUgYmVlbiBhcHBsaWVkIGFscmVhZHkNCj4gLSBhZGRyZXNz
ZWQgY29tbWVudHMNCj4gDQo+IEp1ZXJnZW4gR3Jvc3MgKDQpOg0KPiAgICBkb2NzOiByZW1v
dmUgcWVtdS10cmFkaXRpb25hbCBzdXBwb3J0IGZyb20gZG9jdW1lbnRhdGlvbg0KPiAgICB0
b29sczogcmVtb3ZlIHN1cHBvcnQgZm9yIHJ1bm5pbmcgYSBndWVzdCB3aXRoIHFlbXUtdHJh
ZGl0aW9uYWwNCj4gICAgdG9vbHM6IHJlbW92ZSBxZW11LXRyYWRpdGlvbmFsDQo+ICAgIGJ1
aWxkOiBkb24ndCByZXF1aXJlIGZ1bGwgdG9vbHMgYnVpbGQgZm9yIGJ1aWxkaW5nIHN0dWJk
b21zDQo+IA0KPiAgIC5naXRpZ25vcmUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICAgMyAtDQo+ICAgQ0hBTkdFTE9HLm1kICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgICAxICsNCj4gICBDb25maWcubWsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgMzggLS0NCj4gICBJTlNUQUxMICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgMTMgLQ0KPiAgIE1BSU5UQUlORVJTICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgNCAtDQo+ICAgTWFrZWZpbGUgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAyICstDQo+ICAgUkVBRE1FICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAyICstDQo+ICAgU1VQ
UE9SVC5tZCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDE2IC0NCj4g
ICBjb25maWcvUGF0aHMubWsuaW4gICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDMg
Ky0NCj4gICBjb25maWcvVG9vbHMubWsuaW4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAgIDEgLQ0KPiAgIGRvY3MvbWFuL3hsLXBjaS1jb25maWd1cmF0aW9uLjUucG9kICAgICAg
ICAgICB8ICAgNCArLQ0KPiAgIGRvY3MvbWFuL3hsLmNmZy41LnBvZC5pbiAgICAgICAgICAg
ICAgICAgICAgICB8ICA0OSArLS0NCj4gICBkb2NzL21pc2Mvc3R1YmRvbS50eHQgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgNTIgLS0tDQo+ICAgZG9jcy9taXNjL3hlbnN0b3JlLXBh
dGhzLnBhbmRvYyAgICAgICAgICAgICAgIHwgICAzICstDQo+ICAgZG9jcy9wcm9jZXNzL2Jy
YW5jaGluZy1jaGVja2xpc3QudHh0ICAgICAgICAgIHwgICA0IC0NCj4gICBkb2NzL3Byb2Nl
c3MvcmVsZWFzZS10ZWNobmljaWFuLWNoZWNrbGlzdC50eHQgfCAgIDMgLQ0KPiAgIGRvY3Mv
cHJvY2Vzcy94ZW4tcmVsZWFzZS1tYW5hZ2VtZW50LnBhbmRvYyAgICB8ICAgMiArLQ0KPiAg
IHN0dWJkb20vLmdpdGlnbm9yZSAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMyAt
DQo+ICAgc3R1YmRvbS9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
IDk3ICstLS0tLQ0KPiAgIHN0dWJkb20vY29uZmlndXJlICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICA4OSAtLS0tLQ0KPiAgIHN0dWJkb20vY29uZmlndXJlLmFjICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAxNSAtDQo+ICAgc3R1YmRvbS9pb2VtdS1taW5pb3MuY2Zn
ICAgICAgICAgICAgICAgICAgICAgIHwgICA2IC0NCj4gICB0b29scy9NYWtlZmlsZSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNTggLS0tLQ0KPiAgIHRvb2xzL1J1bGVz
Lm1rICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMyAtDQo+ICAgdG9vbHMv
Y29uZmlnLmguaW4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAzIC0NCj4gICB0
b29scy9jb25maWd1cmUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNDIgKy0t
DQo+ICAgdG9vbHMvY29uZmlndXJlLmFjICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
IDIxICstDQo+ICAgdG9vbHMvZmlybXdhcmUvaHZtbG9hZGVyL01ha2VmaWxlICAgICAgICAg
ICAgIHwgICAzICstDQo+ICAgdG9vbHMvZmlybXdhcmUvaHZtbG9hZGVyL3BjaS5jICAgICAg
ICAgICAgICAgIHwgIDE3ICstDQo+ICAgdG9vbHMvZmlybXdhcmUvaHZtbG9hZGVyL3V0aWwu
YyAgICAgICAgICAgICAgIHwgICA5ICstDQo+ICAgdG9vbHMvbGliYWNwaS9ta19kc2R0LmMg
ICAgICAgICAgICAgICAgICAgICAgIHwgMTgzICsrKy0tLS0tLS0NCj4gICB0b29scy9saWJz
L2xpZ2h0L2xpYnhsX2NyZWF0ZS5jICAgICAgICAgICAgICAgfCAgNzggKy0tLS0NCj4gICB0
b29scy9saWJzL2xpZ2h0L2xpYnhsX2RldmljZS5jICAgICAgICAgICAgICAgfCAgMTkgLQ0K
PiAgIHRvb2xzL2xpYnMvbGlnaHQvbGlieGxfZGlzay5jICAgICAgICAgICAgICAgICB8ICAg
NyAtDQo+ICAgdG9vbHMvbGlicy9saWdodC9saWJ4bF9kbS5jICAgICAgICAgICAgICAgICAg
IHwgMzI3ICstLS0tLS0tLS0tLS0tLS0tLQ0KPiAgIHRvb2xzL2xpYnMvbGlnaHQvbGlieGxf
ZG9tLmMgICAgICAgICAgICAgICAgICB8ICAxMCAtDQo+ICAgdG9vbHMvbGlicy9saWdodC9s
aWJ4bF9kb21fc2F2ZS5jICAgICAgICAgICAgIHwgMTQwIC0tLS0tLS0tDQo+ICAgdG9vbHMv
bGlicy9saWdodC9saWJ4bF9kb21fc3VzcGVuZC5jICAgICAgICAgIHwgIDY1IC0tLS0NCj4g
ICB0b29scy9saWJzL2xpZ2h0L2xpYnhsX2RvbWFpbi5jICAgICAgICAgICAgICAgfCAgMTUg
LQ0KPiAgIHRvb2xzL2xpYnMvbGlnaHQvbGlieGxfZXhlYy5jICAgICAgICAgICAgICAgICB8
ICA3NSAtLS0tDQo+ICAgdG9vbHMvbGlicy9saWdodC9saWJ4bF9pbnRlcm5hbC5jICAgICAg
ICAgICAgIHwgICA2ICstDQo+ICAgdG9vbHMvbGlicy9saWdodC9saWJ4bF9pbnRlcm5hbC5o
ICAgICAgICAgICAgIHwgIDY4ICstLS0NCj4gICB0b29scy9saWJzL2xpZ2h0L2xpYnhsX3Bj
aS5jICAgICAgICAgICAgICAgICAgfCAxODMgLS0tLS0tLS0tLQ0KPiAgIHRvb2xzL2xpYnMv
bGlnaHQvbGlieGxfc3Jfc3RyZWFtX2Zvcm1hdC5oICAgICB8ICAgMiArLQ0KPiAgIHRvb2xz
L2xpYnMvbGlnaHQvbGlieGxfc3RyZWFtX3dyaXRlLmMgICAgICAgICB8ICAgNCAtDQo+ICAg
dG9vbHMvbGlicy9saWdodC9saWJ4bF90eXBlcy5pZGwgICAgICAgICAgICAgIHwgICAyICst
DQo+ICAgdG9vbHMvcHl0aG9uL3hlbi9taWdyYXRpb24vbGlieGwucHkgICAgICAgICAgIHwg
ICAyIC0NCj4gICB0b29scy94bC94bF9wYXJzZS5jICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgIDUgKy0NCj4gICA0OCBmaWxlcyBjaGFuZ2VkLCAxMDMgaW5zZXJ0aW9ucygrKSwg
MTY1NCBkZWxldGlvbnMoLSkNCj4gICBkZWxldGUgbW9kZSAxMDA2NDQgc3R1YmRvbS9pb2Vt
dS1taW5pb3MuY2ZnDQo+IA0KDQo=
--------------NEpkplsOiJP0kHAPgjOAhjQc
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

--------------NEpkplsOiJP0kHAPgjOAhjQc--

--------------onNVJEpexbSHN7lqxE5rZJau--

--------------nycpEwHGVIJwTi0blFid2ngj
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmgjTTcFAwAAAAAACgkQsN6d1ii/Ey9C
GAgAlFZb83p9/PANRvLNTlJtk3OpVc81ql945JcygUvBha69gJgsg5a7CAQTqwR6SpR5LwSPL3hd
tFEJ+hMsDah098XjiG00/RwvuQV/8JDHLvIOTPOaR0w0p1UPLd38fOQH+o0FbZXB0h0f+OmOAK+O
mFroM3zyTESoduhv4+/Bv5Wm7IR25AsWJveZ7dMhakTcz6lyckM4vgrbPCj/1jK8InyLO5ffTLq8
1J8HuV71Ai5RT50I05DGT/rfB84eRqA+G3x5+1XTn/RJVGHg2XdahFTv8jrSUZUoTbOya2LGdgB5
xxP/CQTh7SMfJSza6RQEmupWj7po06ChfPwXFJ4cfQ==
=mVjD
-----END PGP SIGNATURE-----

--------------nycpEwHGVIJwTi0blFid2ngj--

