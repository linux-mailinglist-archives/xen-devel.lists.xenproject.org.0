Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3591A4F8B1
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 09:23:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901801.1309730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpk2P-0003Hg-Rl; Wed, 05 Mar 2025 08:23:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901801.1309730; Wed, 05 Mar 2025 08:23:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpk2P-0003Fw-OM; Wed, 05 Mar 2025 08:23:33 +0000
Received: by outflank-mailman (input) for mailman id 901801;
 Wed, 05 Mar 2025 08:23:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/re5=VY=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tpk2O-0003Fq-DE
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 08:23:32 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f2c6c75-f99b-11ef-9ab4-95dc52dad729;
 Wed, 05 Mar 2025 09:23:31 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 153091F393;
 Wed,  5 Mar 2025 08:23:30 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A92461366F;
 Wed,  5 Mar 2025 08:23:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id cu2lJwEKyGfNVwAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 05 Mar 2025 08:23:29 +0000
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
X-Inumbo-ID: 1f2c6c75-f99b-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1741163010; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=JM83nz5nwmNiji8EpTUpY5iT7V6GLZxHQvD8RCXhdjs=;
	b=aTzQKXd9rKVo6tcFSe8aIasmL3jGYYm0ROGR0rKMxkWFGYaqggo1Dp3XKfbmcNfP7cN/Tc
	Oy1PldjVZPtv0xosRg4hKag8Flukr/i94VJBgL3J0w3nT6XnYMucj0s4opIyEmphf2NuuA
	p2xVUIia5LtZ8tsOwOYk/vFaKSrTe2U=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1741163010; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=JM83nz5nwmNiji8EpTUpY5iT7V6GLZxHQvD8RCXhdjs=;
	b=aTzQKXd9rKVo6tcFSe8aIasmL3jGYYm0ROGR0rKMxkWFGYaqggo1Dp3XKfbmcNfP7cN/Tc
	Oy1PldjVZPtv0xosRg4hKag8Flukr/i94VJBgL3J0w3nT6XnYMucj0s4opIyEmphf2NuuA
	p2xVUIia5LtZ8tsOwOYk/vFaKSrTe2U=
Message-ID: <9c8f50d4-9139-4541-8acb-ff407b61ef97@suse.com>
Date: Wed, 5 Mar 2025 09:23:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/9] remove libxenctrl usage from xenstored
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
References: <20250204113407.16839-1-jgross@suse.com>
 <6e63a858-9554-440b-92f1-55dc34256e0b@suse.com>
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
In-Reply-To: <6e63a858-9554-440b-92f1-55dc34256e0b@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------dbhhULSmcNlyvL7gRyeoUzc7"
X-Spam-Score: -6.20
X-Spamd-Result: default: False [-6.20 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SIGNED_PGP(-2.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------dbhhULSmcNlyvL7gRyeoUzc7
Content-Type: multipart/mixed; boundary="------------P1Ubysw3RIrM03LiGmHTT42X";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Message-ID: <9c8f50d4-9139-4541-8acb-ff407b61ef97@suse.com>
Subject: Re: [PATCH v8 0/9] remove libxenctrl usage from xenstored
References: <20250204113407.16839-1-jgross@suse.com>
 <6e63a858-9554-440b-92f1-55dc34256e0b@suse.com>
In-Reply-To: <6e63a858-9554-440b-92f1-55dc34256e0b@suse.com>
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

--------------P1Ubysw3RIrM03LiGmHTT42X
Content-Type: multipart/mixed; boundary="------------1Hx7lp2CHpzz4gtDZrakH1zq"

--------------1Hx7lp2CHpzz4gtDZrakH1zq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjUuMDIuMjUgMTI6MTAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+IFBpbmc/IEVzcGVj
aWFsbHkgLi4uDQo+IA0KPiBPbiAwNC4wMi4yNSAxMjozMywgSnVlcmdlbiBHcm9zcyB3cm90
ZToNCj4+IFhlbnN0b3JlZCBpcyB1c2luZyBsaWJ4ZW5jdHJsIGZvciBvbmx5IG9uZSBwdXJw
b3NlOiB0byBnZXQgaW5mb3JtYXRpb24NCj4+IGFib3V0IHN0YXRlIG9mIGRvbWFpbnMuDQo+
Pg0KPj4gVGhpcyBwYXRjaCBzZXJpZXMgaXMgcmVtb3ZpbmcgdGhhdCBkZXBlbmRlbmN5IGJ5
IGludHJvZHVjaW5nIGEgbmV3DQo+PiBzdGFibGUgaW50ZXJmYWNlIHdoaWNoIGNhbiBiZSB1
c2VkIGJ5IHhlbnN0b3JlZCBpbnN0ZWFkLg0KPj4NCj4+IFRoZXJlIHdhcyBhIFJGQyBzZXJp
ZXMgc2VudCBvdXQgMyB5ZWFycyBhZ28sIHdoaWNoIEkgaGF2ZSB0YWtlbiBhcyBhDQo+PiBi
YXNlIGFuZCBieSBhZGRyZXNzaW5nIGFsbCBjb21tZW50cyBmcm9tIGJhY2sgdGhlbi4NCj4+
DQo+PiBUaGUgbWFpbiBkaWZmZXJlbmNlcyBzaW5jZSB0aGF0IFJGQyBzZXJpZXMgYXJlOg0K
Pj4NCj4+IC0gSW5zdGVhZCBvZiBpbnRyb2R1Y2luZyBhbiBuZXcgbWFpbiBoeXBlcmNhbGwg
Zm9yIGEgc3RhYmxlIG1hbmFnZW1lbnQNCj4+IMKgwqAgaW50ZXJmYWNlIEkgaGF2ZSBqdXN0
IGFkZGVkIGEgbmV3IGRvbWN0bCBzdWItb3AsIGFzIHJlcXVlc3RlZCBpbiAyMDIxLg0KPj4N
Cj4+IC0gSSBoYXZlIGFkZGVkIGEgbmV3IGxpYnJhcnkgbGlieGVubWFuYWdlIGZvciBlYXN5
IHVzZSBvZiB0aGUgbmV3DQo+PiDCoMKgIHN0YWJsZSBoeXBlcnZpc29yIGludGVyZmFjZS4g
TWFpbiBtb3RpdmF0aW9uIGZvciBhZGRpbmcgdGhlIGxpYnJhcnkNCj4+IMKgwqAgd2FzIHRo
ZSByZWNlbnQgYXR0ZW1wdCB0byBkZWNvdXBsZSBveGVuc3RvcmVkIGZyb20gdGhlIFhlbiBn
aXQgdHJlZS4NCj4+IMKgwqAgQnkgdXNpbmcgdGhlIG5ldyBsaWJyYXJ5LCBveGVuc3RvcmVk
IGNvdWxkIGJlbmVmaXQgaW4gdGhlIHNhbWUgd2F5IGFzDQo+PiDCoMKgIHhlbnN0b3JlZCBm
cm9tIHRoZSBuZXcgaW50ZXJmYWNlOiBpdCB3b3VsZCBiZSBwb3NzaWJsZSB0byByZWx5IG9u
DQo+PiDCoMKgIHN0YWJsZSBsaWJyYXJpZXMgb25seS4NCj4+DQo+PiAtIE1pbmktT1MgaGFz
IGdhaW5lZCBzb21lIG1vcmUgY29uZmlnIG9wdGlvbnMgcmVjZW50bHksIHNvIGl0IHdhcyBy
YXRoZXINCj4+IMKgwqAgZWFzeSB0byBtYWtlIHhlbnN0b3JlW3B2aF0tc3R1YmRvbSBpbmRl
cGVuZGVudCBmcm9tIGxpYnhlbmN0cmwsIHRvby4NCj4+DQo+PiBQbGVhc2Ugbm90ZSB0aGF0
IHRoZSBsYXN0IDQgcGF0Y2hlcyBjYW4gYmUgY29tbWl0dGVkIG9ubHkgYWZ0ZXIgdGhlDQo+
PiByZWxhdGVkIE1pbmktT1MgcGF0Y2ggImNvbmZpZzogYWRkIHN1cHBvcnQgZm9yIGxpYnhl
bm1hbmFnZSIgaGFzIGdvbmUgaW4NCj4+IEFORCB0aGUgTWluaS1PUyBjb21taXQtaWQgaGFz
IGJlZW4gdXBkYXRlZCBpbiBDb25maWcubWsgYWNjb3JkaW5nbHkhIFRoZQ0KPj4gTWluaS1P
UyBwYXRjaCBoYXMgYmVlbiBBY2tlZCBhbHJlYWR5LCBzbyBpdCBjYW4gZ28gaW4gYXMgc29v
biBhcyBwYXRjaA0KPj4gNSBvZiB0aGlzIHNlcmllcyAodGhlIG9uZSBpbnRyb2R1Y2luZyBs
aWJ4ZW5tYW5hZ2UpIGhhcyBiZWVuIGNvbW1pdHRlZC4NCj4+DQo+PiBBcyBwYXRjaGVzIDEg
YW5kIDIgY2hhbmdlIGN1cnJlbnQgYmVoYXZpb3IsIEphbiBkaWRuJ3Qgd2FudCB0byBnaXZl
IGhpcw0KPj4gQWNrIChoZSBkaWRuJ3QgcmVqZWN0IHRoZSBwYXRjaCBlaXRoZXIpLiBTbyBJ
J20gYXNraW5nIG90aGVyICJSZXN0Ig0KPj4gbWFpbnRhaW5lcnMgdG8gbG9vayBhdCB0aG9z
ZSBwYXRjaGVzIHNwZWNpZmljYWxseS4NCj4gDQo+IC4uLiBwYXRjaGVzIDEgYW5kIDIgY291
bGQgbmVlZCBhbiBhZGRpdGlvbmFsIG9waW5pb24uDQoNCkFuZCBhbm90aGVyIHBpbmcuDQoN
Ck9uZSBvZiBBbmRyZXcsIFN0ZWZhbm8sIEp1bGllbiwgUm9nZXIsIEFudGhvbnksIE1pY2Fs
OiBQbGVhc2UgaGF2ZSBhIGxvb2suDQoNClRoZSByZWxhdGVkIGRpc2N1c3Npb24gYmV0d2Vl
biBKYW4gYW5kIG1lIGNhbiBiZSBmb3VuZCBoZXJlIChwYXRjaGVzIDIgYW5kIDMpOg0KDQpo
dHRwczovL2xvcmUua2VybmVsLm9yZy94ZW4tZGV2ZWwvMjAyNTAxMDcxMDE3MTEuNTk4MC0x
LWpncm9zc0BzdXNlLmNvbS8NCg0KDQpKdWVyZ2VuDQo=
--------------1Hx7lp2CHpzz4gtDZrakH1zq
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------1Hx7lp2CHpzz4gtDZrakH1zq--

--------------P1Ubysw3RIrM03LiGmHTT42X--

--------------dbhhULSmcNlyvL7gRyeoUzc7
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmfICgEFAwAAAAAACgkQsN6d1ii/Ey+M
GAf/Z7WJGpqP/vYK6JFgFuuhdZYgHUBgn303EGyT2+VLqOC51W6lp4bkzNQJgICT5k6vWVToVOgu
DTsW8fM0Bzy89EvpUNWb1k9kS3gTp1LNzTNM1xe4mJANrUT9JlxCWu6qtwRmqBRI7gucyAM59PFL
936cLd65eTnaqh4fIBfa7JroL7IDI+WFT0epAZdPSWgf1W+K6uJ58SlKebKAp5el9rkHXLJQgi8J
thR2ALy7CmgdMO1V/pvaohDYMkMv3Ixyk69Jr7aX1zQRxak2K3l0yjsc+AbKfHjmt3Nsp6LyTTu6
HPrY0lG0gTdSVmgQUqACjSEOzwWe3CEo8D3rlIbK0w==
=j+EH
-----END PGP SIGNATURE-----

--------------dbhhULSmcNlyvL7gRyeoUzc7--

