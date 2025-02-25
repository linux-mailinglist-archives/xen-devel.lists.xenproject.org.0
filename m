Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A680FA43CF2
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2025 12:10:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895628.1304300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmspN-0005ID-Bm; Tue, 25 Feb 2025 11:10:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895628.1304300; Tue, 25 Feb 2025 11:10:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmspN-0005Fn-7y; Tue, 25 Feb 2025 11:10:17 +0000
Received: by outflank-mailman (input) for mailman id 895628;
 Tue, 25 Feb 2025 11:10:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=M1ZL=VQ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tmspL-00051G-Fx
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2025 11:10:15 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 139a8b11-f369-11ef-9aae-95dc52dad729;
 Tue, 25 Feb 2025 12:10:09 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6315C1F44F;
 Tue, 25 Feb 2025 11:10:07 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0DE8913332;
 Tue, 25 Feb 2025 11:10:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Pp9+AQ+lvWeRNgAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 25 Feb 2025 11:10:07 +0000
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
X-Inumbo-ID: 139a8b11-f369-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1740481808; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=XqRMngr80m9evQOtwxO3tQKvCbHeNk1rycDY+ds7QiQ=;
	b=lAOnBE88aoepA3/qD+W/H5tU+mqkPZ9P5o4xXzbWMB7QDpwax9Jeh/vB4OJu1M08hGgHxZ
	f5l6YxoBR5Z+14xOWhdUQOyolYuShf0I5QsXxdxQZwJwTWTrcEvghehrHnax+PC7WULzqr
	B4kW1rbR+Tiaf+M5CwDQAukd/HppWYY=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1740481807; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=XqRMngr80m9evQOtwxO3tQKvCbHeNk1rycDY+ds7QiQ=;
	b=QRPuNRPCvI56RRPypTFmWWZzgg5ZnDjCZrNY5rjZrdEcimO+WkCMbnTzuncVpCmxHDyoVB
	zy+sPLaoAZWHzl/J4gBtpNQP8fX6KyTJv8LmC2LVjk3rLRTAhv5Dg83Lc/a0ykcKo40hEq
	E2j6AfqrpvyKr6WbdtXDnGRaO9L6MKY=
Message-ID: <6e63a858-9554-440b-92f1-55dc34256e0b@suse.com>
Date: Tue, 25 Feb 2025 12:10:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/9] remove libxenctrl usage from xenstored
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
References: <20250204113407.16839-1-jgross@suse.com>
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
In-Reply-To: <20250204113407.16839-1-jgross@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------WYRQGszgURZNnQOCShN5HjDH"
X-Spam-Level: 
X-Spamd-Result: default: False [-5.19 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	NEURAL_HAM_LONG(-0.99)[-0.991];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	RCVD_TLS_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	RCPT_COUNT_SEVEN(0.00)[10];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,imap1.dmz-prg2.suse.org:helo];
	HAS_ATTACHMENT(0.00)[]
X-Spam-Score: -5.19
X-Spam-Flag: NO

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------WYRQGszgURZNnQOCShN5HjDH
Content-Type: multipart/mixed; boundary="------------90q4uz6zIk3d40o1ENgBOLB6";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Message-ID: <6e63a858-9554-440b-92f1-55dc34256e0b@suse.com>
Subject: Re: [PATCH v8 0/9] remove libxenctrl usage from xenstored
References: <20250204113407.16839-1-jgross@suse.com>
In-Reply-To: <20250204113407.16839-1-jgross@suse.com>
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

--------------90q4uz6zIk3d40o1ENgBOLB6
Content-Type: multipart/mixed; boundary="------------ruBcNshBpdk0Syk4iY4wTE0V"

--------------ruBcNshBpdk0Syk4iY4wTE0V
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

UGluZz8gRXNwZWNpYWxseSAuLi4NCg0KT24gMDQuMDIuMjUgMTI6MzMsIEp1ZXJnZW4gR3Jv
c3Mgd3JvdGU6DQo+IFhlbnN0b3JlZCBpcyB1c2luZyBsaWJ4ZW5jdHJsIGZvciBvbmx5IG9u
ZSBwdXJwb3NlOiB0byBnZXQgaW5mb3JtYXRpb24NCj4gYWJvdXQgc3RhdGUgb2YgZG9tYWlu
cy4NCj4gDQo+IFRoaXMgcGF0Y2ggc2VyaWVzIGlzIHJlbW92aW5nIHRoYXQgZGVwZW5kZW5j
eSBieSBpbnRyb2R1Y2luZyBhIG5ldw0KPiBzdGFibGUgaW50ZXJmYWNlIHdoaWNoIGNhbiBi
ZSB1c2VkIGJ5IHhlbnN0b3JlZCBpbnN0ZWFkLg0KPiANCj4gVGhlcmUgd2FzIGEgUkZDIHNl
cmllcyBzZW50IG91dCAzIHllYXJzIGFnbywgd2hpY2ggSSBoYXZlIHRha2VuIGFzIGENCj4g
YmFzZSBhbmQgYnkgYWRkcmVzc2luZyBhbGwgY29tbWVudHMgZnJvbSBiYWNrIHRoZW4uDQo+
IA0KPiBUaGUgbWFpbiBkaWZmZXJlbmNlcyBzaW5jZSB0aGF0IFJGQyBzZXJpZXMgYXJlOg0K
PiANCj4gLSBJbnN0ZWFkIG9mIGludHJvZHVjaW5nIGFuIG5ldyBtYWluIGh5cGVyY2FsbCBm
b3IgYSBzdGFibGUgbWFuYWdlbWVudA0KPiAgICBpbnRlcmZhY2UgSSBoYXZlIGp1c3QgYWRk
ZWQgYSBuZXcgZG9tY3RsIHN1Yi1vcCwgYXMgcmVxdWVzdGVkIGluIDIwMjEuDQo+IA0KPiAt
IEkgaGF2ZSBhZGRlZCBhIG5ldyBsaWJyYXJ5IGxpYnhlbm1hbmFnZSBmb3IgZWFzeSB1c2Ug
b2YgdGhlIG5ldw0KPiAgICBzdGFibGUgaHlwZXJ2aXNvciBpbnRlcmZhY2UuIE1haW4gbW90
aXZhdGlvbiBmb3IgYWRkaW5nIHRoZSBsaWJyYXJ5DQo+ICAgIHdhcyB0aGUgcmVjZW50IGF0
dGVtcHQgdG8gZGVjb3VwbGUgb3hlbnN0b3JlZCBmcm9tIHRoZSBYZW4gZ2l0IHRyZWUuDQo+
ICAgIEJ5IHVzaW5nIHRoZSBuZXcgbGlicmFyeSwgb3hlbnN0b3JlZCBjb3VsZCBiZW5lZml0
IGluIHRoZSBzYW1lIHdheSBhcw0KPiAgICB4ZW5zdG9yZWQgZnJvbSB0aGUgbmV3IGludGVy
ZmFjZTogaXQgd291bGQgYmUgcG9zc2libGUgdG8gcmVseSBvbg0KPiAgICBzdGFibGUgbGli
cmFyaWVzIG9ubHkuDQo+IA0KPiAtIE1pbmktT1MgaGFzIGdhaW5lZCBzb21lIG1vcmUgY29u
ZmlnIG9wdGlvbnMgcmVjZW50bHksIHNvIGl0IHdhcyByYXRoZXINCj4gICAgZWFzeSB0byBt
YWtlIHhlbnN0b3JlW3B2aF0tc3R1YmRvbSBpbmRlcGVuZGVudCBmcm9tIGxpYnhlbmN0cmws
IHRvby4NCj4gDQo+IFBsZWFzZSBub3RlIHRoYXQgdGhlIGxhc3QgNCBwYXRjaGVzIGNhbiBi
ZSBjb21taXR0ZWQgb25seSBhZnRlciB0aGUNCj4gcmVsYXRlZCBNaW5pLU9TIHBhdGNoICJj
b25maWc6IGFkZCBzdXBwb3J0IGZvciBsaWJ4ZW5tYW5hZ2UiIGhhcyBnb25lIGluDQo+IEFO
RCB0aGUgTWluaS1PUyBjb21taXQtaWQgaGFzIGJlZW4gdXBkYXRlZCBpbiBDb25maWcubWsg
YWNjb3JkaW5nbHkhIFRoZQ0KPiBNaW5pLU9TIHBhdGNoIGhhcyBiZWVuIEFja2VkIGFscmVh
ZHksIHNvIGl0IGNhbiBnbyBpbiBhcyBzb29uIGFzIHBhdGNoDQo+IDUgb2YgdGhpcyBzZXJp
ZXMgKHRoZSBvbmUgaW50cm9kdWNpbmcgbGlieGVubWFuYWdlKSBoYXMgYmVlbiBjb21taXR0
ZWQuDQo+IA0KPiBBcyBwYXRjaGVzIDEgYW5kIDIgY2hhbmdlIGN1cnJlbnQgYmVoYXZpb3Is
IEphbiBkaWRuJ3Qgd2FudCB0byBnaXZlIGhpcw0KPiBBY2sgKGhlIGRpZG4ndCByZWplY3Qg
dGhlIHBhdGNoIGVpdGhlcikuIFNvIEknbSBhc2tpbmcgb3RoZXIgIlJlc3QiDQo+IG1haW50
YWluZXJzIHRvIGxvb2sgYXQgdGhvc2UgcGF0Y2hlcyBzcGVjaWZpY2FsbHkuDQoNCi4uLiBw
YXRjaGVzIDEgYW5kIDIgY291bGQgbmVlZCBhbiBhZGRpdGlvbmFsIG9waW5pb24uDQoNCg0K
SnVlcmdlbg0K
--------------ruBcNshBpdk0Syk4iY4wTE0V
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------ruBcNshBpdk0Syk4iY4wTE0V--

--------------90q4uz6zIk3d40o1ENgBOLB6--

--------------WYRQGszgURZNnQOCShN5HjDH
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAme9pQ4FAwAAAAAACgkQsN6d1ii/Ey/g
Wwf8CaDOFyRkiumqCau1IUaFnHU423Cp/KIGBrrB00WYjfX+n5AB/SNaJcd9PowGNT6kasMtAmF6
nYdyeKMdnv2MupF0ImJIXmRNLJ3l5yOuDL6A3gfdXgID/JpycEK7zMkauTympKjMXOsTlOU/1pvm
eJzCEo9NYq1Dv4JowL9DljTFsPHu9M5Gwgkbr3G/8KzlbacO4PrRo5Vq6BxPNa9HUTf456DqmOWH
RoVRwS0lYinidTnkYBoi0CytDWkHNkuono52O6phSQaq+H1Euu7W8aiv5FQfAnUun5wgpc1hf6cb
kEYlg4j35nhK7To+Lz+r08W82eszRWXn1e2y20i5hg==
=4lKx
-----END PGP SIGNATURE-----

--------------WYRQGszgURZNnQOCShN5HjDH--

