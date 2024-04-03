Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4DA896E7D
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 13:51:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700488.1093738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrz8r-0002Kn-Hp; Wed, 03 Apr 2024 11:50:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700488.1093738; Wed, 03 Apr 2024 11:50:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrz8r-0002HA-EW; Wed, 03 Apr 2024 11:50:57 +0000
Received: by outflank-mailman (input) for mailman id 700488;
 Wed, 03 Apr 2024 11:50:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9Pv4=LI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rrz8q-0002GS-0m
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2024 11:50:56 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6cc96971-f1b0-11ee-a1ef-f123f15fe8a2;
 Wed, 03 Apr 2024 13:50:53 +0200 (CEST)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 54B80352D4;
 Wed,  3 Apr 2024 11:50:53 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id F29CE1331E;
 Wed,  3 Apr 2024 11:50:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id NAZWOZxCDWYKKgAAn2gu4w
 (envelope-from <jgross@suse.com>); Wed, 03 Apr 2024 11:50:52 +0000
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
X-Inumbo-ID: 6cc96971-f1b0-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1712145053; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Rgn0d+N5FYZWHyPWjRR5FkrwjBuVzxZm2q7vnsSvHls=;
	b=EosJfvvF0jlaiV2eSqwfgQOgq6IJJOqiOtP1D7riUReMRMHqvA/d0xFJIGb16jf58G0Rsg
	j5I8ubM2WxNvLAzeaTkPurE9ysYDm9KsaR9rhmKsbZJQ6VJPRTG2qI0jWo+r6rWYNS5Oag
	TLu7uQNGVmILz6YFxr4WlMU0exQ1eds=
Authentication-Results: smtp-out1.suse.de;
	none
Message-ID: <870b2cb9-3b0e-4ffc-8850-3e72fcf72856@suse.com>
Date: Wed, 3 Apr 2024 13:50:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 02/19] xen/riscv: disable unnecessary configs
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Oleksii <oleksii.kurochko@gmail.com>
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1712137031.git.oleksii.kurochko@gmail.com>
 <c2ba247adce76c69ecd6400d791db36495b85b75.1712137031.git.oleksii.kurochko@gmail.com>
 <e3da3546-f2a7-4eab-b157-51b6570dcbf9@suse.com>
 <77d63eccd4906ebbb3a5add624490cc25b2cba0c.camel@gmail.com>
 <34407204-b661-4cde-b88f-461808711a08@suse.com>
 <07971008-b961-49d7-8337-df9e1d2794ba@suse.com>
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
In-Reply-To: <07971008-b961-49d7-8337-df9e1d2794ba@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------x8tDw7h6Lb4P4aQPbvgAlUbF"
X-Spam-Score: -4.69
X-Spamd-Result: default: False [-4.69 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 TO_DN_SOME(0.00)[];
	 HAS_ATTACHMENT(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 NEURAL_HAM_SHORT(-0.20)[-0.978];
	 MIME_BASE64_TEXT(0.10)[];
	 RCPT_COUNT_SEVEN(0.00)[8];
	 SIGNED_PGP(-2.00)[];
	 FREEMAIL_TO(0.00)[suse.com,gmail.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 BAYES_HAM(-3.00)[100.00%];
	 MID_RHS_MATCH_FROM(0.00)[];
	 MIME_UNKNOWN(0.10)[application/pgp-keys];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FREEMAIL_CC(0.00)[cardoe.com,kernel.org,wdc.com,gmail.com,lists.xenproject.org];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[]
X-Spam-Level: 
X-Spam-Flag: NO

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------x8tDw7h6Lb4P4aQPbvgAlUbF
Content-Type: multipart/mixed; boundary="------------bu1dSKvGBXNqltPdzSIPy0UD";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>, Oleksii <oleksii.kurochko@gmail.com>
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Message-ID: <870b2cb9-3b0e-4ffc-8850-3e72fcf72856@suse.com>
Subject: Re: [PATCH v7 02/19] xen/riscv: disable unnecessary configs
References: <cover.1712137031.git.oleksii.kurochko@gmail.com>
 <c2ba247adce76c69ecd6400d791db36495b85b75.1712137031.git.oleksii.kurochko@gmail.com>
 <e3da3546-f2a7-4eab-b157-51b6570dcbf9@suse.com>
 <77d63eccd4906ebbb3a5add624490cc25b2cba0c.camel@gmail.com>
 <34407204-b661-4cde-b88f-461808711a08@suse.com>
 <07971008-b961-49d7-8337-df9e1d2794ba@suse.com>
In-Reply-To: <07971008-b961-49d7-8337-df9e1d2794ba@suse.com>
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

--------------bu1dSKvGBXNqltPdzSIPy0UD
Content-Type: multipart/mixed; boundary="------------o3UqOIuXIlTRaD6ywvU9kBau"

--------------o3UqOIuXIlTRaD6ywvU9kBau
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDMuMDQuMjQgMTM6NDcsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwMy4wNC4yMDI0
IDEzOjE4LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMDMuMDQuMjQgMTI6NTQsIE9s
ZWtzaWkgd3JvdGU6DQo+Pj4gT24gV2VkLCAyMDI0LTA0LTAzIGF0IDEyOjI4ICswMjAwLCBK
YW4gQmV1bGljaCB3cm90ZToNCj4+Pj4gT24gMDMuMDQuMjAyNCAxMjoxOSwgT2xla3NpaSBL
dXJvY2hrbyB3cm90ZToNCj4+Pj4+IFRoaXMgcGF0Y2ggZGlzYWJsZXMgdW5uZWNlc3Nhcnkg
Y29uZmlncyBmb3IgdHdvIGNhc2VzOg0KPj4+Pj4gMS4gQnkgdXRpbGl6aW5nIEVYVFJBX0ZJ
WEVEX1JBTkRDT05GSUcgZm9yIHJhbmRjb25maWcgYnVpbGRzDQo+Pj4+PiAoR2l0TGFiIENJ
IGpvYnMpLg0KPj4+Pj4gMi4gQnkgdXNpbmcgdGlueTY0X2RlZmNvbmZpZyBmb3Igbm9uLXJh
bmRjb25maWcgYnVpbGRzLg0KPj4+Pj4NCj4+Pj4+IE9ubHkgY29uZmlncyB3aGljaCBsZWFk
IHRvIGNvbXBpbGF0aW9uIGlzc3VlcyB3ZXJlIGRpc2FibGVkLg0KPj4+Pj4NCj4+Pj4+IFNp
Z25lZC1vZmYtYnk6IE9sZWtzaWkgS3Vyb2Noa28gPG9sZWtzaWkua3Vyb2Noa29AZ21haWwu
Y29tPg0KPj4+Pj4gLS0tDQo+Pj4+PiBDaGFuZ2VzIGluIFY3Og0KPj4+Pj4gICDCoC0gRGlz
YWJsZSBvbmx5IGNvbmZpZ3Mgd2hpY2ggY2F1c2UgY29tcGlsYXRpb24gaXNzdWVzLg0KPj4+
Pg0KPj4+PiBTaW5jZSB0aGUgZGVzY3JpcHRpb24gZG9lc24ndCBnbyBpbnRvIGRldGFpbHM6
IFdoaWxlIEkgY2FuIHNlZSB0aGF0DQo+Pj4+IFBFUkZfQ09VTlRFUlMgYW5kIExJVkVQQVRD
SCBtYXkgcmVxdWlyZSAoYSBsaXR0bGUgLyBzb21lIG1vcmUpIGV4dHJhDQo+Pj4+IHdvcmss
IGFyZSBIWVBGUywgQVJHTywgYW5kIFhTTSByZWFsbHkgY2F1c2luZyBpc3N1ZXM/DQo+Pj4g
Rm9yIEFyZ28sIEkgcmVjaWV2ZWQgdGhlIGZvbGxvd2luZyBjb21waWxhdGlvbiBlcnJvcnM6
DQo+Pj4gICAgICBjb21tb24vYXJnby5jOjE0MTY6NTogZXJyb3I6IHVua25vd24gdHlwZSBu
YW1lICdwMm1fdHlwZV90JzsgZGlkIHlvdQ0KPj4+ICAgICAgbWVhbiAnaHZtbWVtX3R5cGVf
dCc/DQo+Pj4gICAgICAgMTQxNiB8ICAgICBwMm1fdHlwZV90IHAybXQ7DQo+Pj4gICAgICAg
ICAgICB8ICAgICBefn5+fn5+fn5+DQo+Pj4gICAgICAgICAgICB8ICAgICBodm1tZW1fdHlw
ZV90DQo+Pj4gICAgICBjb21tb24vYXJnby5jOjE0MTk6MTE6IGVycm9yOiBpbXBsaWNpdCBk
ZWNsYXJhdGlvbiBvZiBmdW5jdGlvbg0KPj4+ICAgICAgJ2NoZWNrX2dldF9wYWdlX2Zyb21f
Z2ZuJyBbLVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0NCj4+PiAgICAg
ICAxNDE5IHwgICAgIHJldCA9IGNoZWNrX2dldF9wYWdlX2Zyb21fZ2ZuKGQsIGdmbiwgZmFs
c2UsICZwMm10LCAmcGFnZSk7DQo+Pj4gICAgICAgICAgICB8ICAgICAgICAgICBefn5+fn5+
fn5+fn5+fn5+fn5+fn5+fg0KPj4+ICAgICAgY29tbW9uL2FyZ28uYzoxNDI3OjEwOiBlcnJv
cjogJ3AybV9yYW1fcncnIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbg0KPj4+ICAgICAgdGhp
cyBmdW5jdGlvbikNCj4+PiAgICAgICAxNDI3IHwgICAgIGNhc2UgcDJtX3JhbV9ydzoNCj4+
PiAgICAgIA0KPj4+IEl0IHNlZW1zIGl0IHNob3VsZCBiZSBpbmNsdWRlZCB4ZW4vcDJtLWNv
bW1vbi5oIGFuZCBhc20vcDJtLmggaW4NCj4+PiBjb21tb24vYXJnby5jLg0KPj4+DQo+Pj4g
Rm9yIENPTkZJR19IWVBGU19DT05GSUcgKCB0aGVyZSBpcyBubyBpc3N1ZSB3aXRoIENPTkZJ
R19IWVBGUywNCj4+PiBvdmVybG9va2VkIHRoYXQgKToNCj4+PiAgICAgIGNvbW1vbi9jb25m
aWdfZGF0YS5TOjE6MTA6IGZhdGFsIGVycm9yOiBhc20vYXNtX2RlZm5zLmg6IE5vIHN1Y2gg
ZmlsZQ0KPj4+ICAgICAgb3IgZGlyZWN0b3J5DQo+Pj4gICAgICAgICAgMSB8ICNpbmNsdWRl
IDxhc20vYXNtX2RlZm5zLmg+DQo+Pg0KPj4gSG1tLCB0aGlzIHNlZW1zIHRvIGJlIG5lZWRl
ZCBmb3IgQVNNX0lOVCgpLCB3aGljaCBpcyBjdXJyZW50bHkgZGVmaW5lZCB0aGUgc2FtZQ0K
Pj4gd2F5IGZvciBhcm0gYW5kIHg4Ni4gTWF5YmUgd2Ugc2hvdWxkIG1vdmUgdGhhdCBtYWNy
byB0byB4ZW4vbGlua2FnZS5oIGFuZA0KPj4gaW5jbHVkZSB0aGF0IG9uZSBpbnN0ZWFkIG9m
IGFzbV9kZWZucy5oPw0KPiANCj4gSW5kZWVkIHdoaWxlIGRvaW5nIHRoZSBlbnRyeSBhbm5v
dGF0aW9uIHdvcmsgKGFsc28gdG91Y2hpbmcgdGhlIGJ1aWxkIGxvZ2ljDQo+IGhlcmUgaWly
YykgSSB3YXMgdGhpbmtpbmcgb2YgZG9pbmcgc28uDQoNCk9rYXksIEknbSBwcmVwYXJpbmcg
YSBwYXRjaC4NCg0KDQpKdWVyZ2VuDQoNCg==
--------------o3UqOIuXIlTRaD6ywvU9kBau
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------o3UqOIuXIlTRaD6ywvU9kBau--

--------------bu1dSKvGBXNqltPdzSIPy0UD--

--------------x8tDw7h6Lb4P4aQPbvgAlUbF
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmYNQpwFAwAAAAAACgkQsN6d1ii/Ey/K
Ugf/ad0Vde/zzxQ/+hfSAj0SEFN66cpcVzL328qnKIxD6xOg95a7Jrx0FYoFJto/BYSsPArDSvZg
MOjY3v5NKbRZBqYcSWWwyo5VvGcbpGmff9ewXK9pR77EtLJcqHcofjjSMLWvACs3yqX+AC8VpqRl
GsSbxBbuQBj1sfAseiPRVyfwuQSe+8pyIlZIZ42RmLxLYm8Zw34vnGAmlA++m+3CZ1xqyJVLTyvi
sPy1/UI2vHZxYqkge65rlwAnxB8nMgjB3WWoJhPowFNUE4dtbQjRhTBQXrPxUzg9nwRBMS3+agpE
/Ty+2aXwAls+GzLwSEUkreitK89J+0mAmolbddj3uQ==
=BCQQ
-----END PGP SIGNATURE-----

--------------x8tDw7h6Lb4P4aQPbvgAlUbF--

