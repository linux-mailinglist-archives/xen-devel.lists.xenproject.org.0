Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7F09EE4CC
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2024 12:10:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.855782.1268599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLh4m-00009x-Az; Thu, 12 Dec 2024 11:09:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 855782.1268599; Thu, 12 Dec 2024 11:09:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLh4m-00007T-8N; Thu, 12 Dec 2024 11:09:48 +0000
Received: by outflank-mailman (input) for mailman id 855782;
 Thu, 12 Dec 2024 11:09:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N+X7=TF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tLh4k-00007N-A6
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2024 11:09:46 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97b1611a-b879-11ef-a0d5-8be0dac302b0;
 Thu, 12 Dec 2024 12:09:45 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 48C612111F;
 Thu, 12 Dec 2024 11:09:44 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0A31D13508;
 Thu, 12 Dec 2024 11:09:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id UqyLAHjEWmfRLwAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 12 Dec 2024 11:09:44 +0000
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
X-Inumbo-ID: 97b1611a-b879-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1734001784; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=fNZopUEUX3FjPq3t2iAMdKTc1ZjqXNiFVd7H4qojjy8=;
	b=OQj3CuyfQJJpx09wy+3ULckJ4ZE7a5AzvuW7dFOCC0Ci7bfpXjSBMvpi0P+vUvVdl/rz6w
	v4IXwH4z6bSBGV0ai7paAkkhfB3cH6Vt654huuIv8ANMEHUhGV+NHC2oQSSyWeX1gv26MM
	dJkKSewNlko3slVFO+P9hRz1SLGPgSA=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1734001784; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=fNZopUEUX3FjPq3t2iAMdKTc1ZjqXNiFVd7H4qojjy8=;
	b=OQj3CuyfQJJpx09wy+3ULckJ4ZE7a5AzvuW7dFOCC0Ci7bfpXjSBMvpi0P+vUvVdl/rz6w
	v4IXwH4z6bSBGV0ai7paAkkhfB3cH6Vt654huuIv8ANMEHUhGV+NHC2oQSSyWeX1gv26MM
	dJkKSewNlko3slVFO+P9hRz1SLGPgSA=
Message-ID: <8fb77778-b821-4e38-a835-54883ba14e4b@suse.com>
Date: Thu, 12 Dec 2024 12:09:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/xen/mmu: Increase MAX_CONTIG_ORDER
To: Jan Beulich <jbeulich@suse.com>,
 Thierry Escande <thierry.escande@vates.tech>
Cc: sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20241204171346.458105-1-thierry.escande@vates.tech>
 <ccb28ccc-531c-4ead-9a27-76cc430f8c35@suse.com>
 <cc61bdce-47af-45ea-8ace-173adef9ae41@vates.tech>
 <cbc389e4-3b69-4681-ad66-6102b0ed0cae@suse.com>
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
In-Reply-To: <cbc389e4-3b69-4681-ad66-6102b0ed0cae@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------FF0xBmAe6C9bSA00BHSlST3a"
X-Spam-Score: -5.19
X-Spamd-Result: default: False [-5.19 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	NEURAL_HAM_LONG(-0.99)[-0.990];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	NEURAL_HAM_SHORT(-0.20)[-0.996];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,imap1.dmz-prg2.suse.org:helo];
	HAS_ATTACHMENT(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------FF0xBmAe6C9bSA00BHSlST3a
Content-Type: multipart/mixed; boundary="------------Po2XpOKQR0YFOAIlDgThNkfr";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>,
 Thierry Escande <thierry.escande@vates.tech>
Cc: sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Message-ID: <8fb77778-b821-4e38-a835-54883ba14e4b@suse.com>
Subject: Re: [PATCH] x86/xen/mmu: Increase MAX_CONTIG_ORDER
References: <20241204171346.458105-1-thierry.escande@vates.tech>
 <ccb28ccc-531c-4ead-9a27-76cc430f8c35@suse.com>
 <cc61bdce-47af-45ea-8ace-173adef9ae41@vates.tech>
 <cbc389e4-3b69-4681-ad66-6102b0ed0cae@suse.com>
In-Reply-To: <cbc389e4-3b69-4681-ad66-6102b0ed0cae@suse.com>
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

--------------Po2XpOKQR0YFOAIlDgThNkfr
Content-Type: multipart/mixed; boundary="------------csyXRdVOfJV0c6HJdb4aU0L0"

--------------csyXRdVOfJV0c6HJdb4aU0L0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTIuMTIuMjQgMTE6MjIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxMS4xMi4yMDI0
IDE5OjIwLCBUaGllcnJ5IEVzY2FuZGUgd3JvdGU6DQo+PiBIaSBKYW4sDQo+Pg0KPj4gT24g
MDkvMTIvMjAyNCAxMTowNCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMDQuMTIuMjAy
NCAxODoxNCwgVGhpZXJyeSBFc2NhbmRlIHdyb3RlOg0KPj4+PiBXaXRoIGNoYW5nZSA5ZjQw
ZWM4NGE3OTcgKHhlbi9zd2lvdGxiOiBhZGQgYWxpZ25tZW50IGNoZWNrIGZvciBkbWENCj4+
Pj4gYnVmZmVycyksIHRoZSBkcml2ZXIgbXB0M3NhcyBmYWlscyB0byBsb2FkIGJlY2F1c2Ug
aXQgY2Fubm90IGFsbG9jYXRlDQo+Pj4+IGl0cyBETUEgcG9vbCBmb3IgYW4gYWxsb2NhdGlv
biBzaXplIG9mIH4yLDMgTUJ5dGVzLiBUaGlzIGlzIGJlY2F1c2UgdGhlDQo+Pj4+IGFsaWdu
ZW1lbnQgY2hlY2sgYWRkZWQgYnkgOWY0MGVjODRhNzk3IGZhaWxzIGFuZA0KPj4+PiB4ZW5f
c3dpb3RsYl9hbGxvY19jb2hlcmVudCgpIGVuZHMgdXAgY2FsbGluZw0KPj4+PiB4ZW5fY3Jl
YXRlX2NvbnRpZ3VvdXNfcmVnaW9uKCkgd2l0aCBhIHNpemUgb3JkZXIgb2YgMTAgd2hpY2gg
aXMgdG9vIGhpZ2gNCj4+Pj4gZm9yIHRoZSBjdXJyZW50IG1heCB2YWx1ZS4NCj4+Pj4NCj4+
Pj4gVGhpcyBwYXRjaCBpbmNyZWFzZXMgdGhlIE1BWF9DT05USUdfT1JERVIgZnJvbSA5IHRv
IDEwICg0TUIpIHRvIGFsbG93DQo+Pj4+IHN1Y2ggYWxsb2NhdGlvbnMuDQo+Pj4+DQo+Pj4+
IFNpZ25lZC1vZmYtYnk6IFRoaWVycnkgRXNjYW5kZSA8dGhpZXJyeS5lc2NhbmRlQHZhdGVz
LnRlY2g+DQo+Pj4+IC0tLQ0KPj4+PiAgIGFyY2gveDg2L3hlbi9tbXVfcHYuYyB8IDIgKy0N
Cj4+Pj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkN
Cj4+Pj4NCj4+Pj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L3hlbi9tbXVfcHYuYyBiL2FyY2gv
eDg2L3hlbi9tbXVfcHYuYw0KPj4+PiBpbmRleCA1NWE0OTk2ZDBjMDQuLjdmMTEwNzQwZTFh
MiAxMDA2NDQNCj4+Pj4gLS0tIGEvYXJjaC94ODYveGVuL21tdV9wdi5jDQo+Pj4+ICsrKyBi
L2FyY2gveDg2L3hlbi9tbXVfcHYuYw0KPj4+PiBAQCAtMjIwMCw3ICsyMjAwLDcgQEAgdm9p
ZCBfX2luaXQgeGVuX2luaXRfbW11X29wcyh2b2lkKQ0KPj4+PiAgIH0NCj4+Pj4gICANCj4+
Pj4gICAvKiBQcm90ZWN0ZWQgYnkgeGVuX3Jlc2VydmF0aW9uX2xvY2suICovDQo+Pj4+IC0j
ZGVmaW5lIE1BWF9DT05USUdfT1JERVIgOSAvKiAyTUIgKi8NCj4+Pj4gKyNkZWZpbmUgTUFY
X0NPTlRJR19PUkRFUiAxMCAvKiA0TUIgKi8NCj4+Pj4gICBzdGF0aWMgdW5zaWduZWQgbG9u
ZyBkaXNjb250aWdfZnJhbWVzWzE8PE1BWF9DT05USUdfT1JERVJdOw0KPj4+DQo+Pj4gV2hp
bGUgbGFja2luZyByZXNwZWN0aXZlIGNvbW1lbnRhcnksIGJ1bXBpbmcgdGhpcyB2YWx1ZSBp
bW8gYWxzbyBuZWVkcyB0bw0KPj4+IHRha2UgaW50byBhY2NvdW50IFhlbiBpdHNlbGYsIGF0
IGxlYXN0IGNvbW1pdC1tZXNzYWdlLXdpc2UuIFRoZSBidW1waW5nIGlzDQo+Pj4gZmluZSBm
b3IgRG9tMCBpbiBhbnkgZXZlbnQuIEl0IGlzIGFsc28gZmluZSBmb3IgRG9tVS1zIHdpdGgg
dGhlIGRlZmF1bHRzDQo+Pj4gYnVpbHQgaW50byB0aGUgaHlwZXJ2aXNvciAob3JkZXJzIDEy
IGFuZCAxMCByZXNwZWN0aXZlbHkgZm9yIHg4NiBhbmQgQXJtKSwNCj4+PiB5ZXQgZXNwZWNp
YWxseSBmb3IgQXJtIChhbmQgaW4gdGhlIGZ1dHVyZSBQUEMgYW5kIFJJU0MtVikgYW55IGZ1
cnRoZXINCj4+PiBidW1waW5nIHdvdWxkIGJlIGxlc3Mgc3RyYWlnaHRmb3J3YXJkLg0KPj4N
Cj4+IFRoYW5rcyBmb3IgcG9pbnRpbmcgdGhpcyBvdXQuIE9uIHRoZSBYZW4gc2lkZSwgQ09O
RklHX0NUTERPTV9NQVhfT1JERVINCj4+IGFuZCBDT05GSUdfSFdET01fTUFYX09SREVSIHNl
ZW0gYmlnIGVub3VnaCBvbiBhbGwgYXJjaGl0ZWN0dXJlcy4gQnV0IEkNCj4+IHNlZSBDT05G
SUdfRE9NVV9NQVhfT1JERVIgc2V0IHRvIDkgKGFsc28gYWxsIGFyY2hzKS4gV29uJ3QgdGhh
dCBiZSBhDQo+PiBwcm9ibGVtIGZvciBkcml2ZXJzIHRyeWluZyB0byBhbGxvY2F0ZSBtb3Jl
IHRoYW4gdGhhdCBmcm9tIGEgZG9tVSA/DQo+IA0KPiBBIGRyaXZlciBhc3N1bWVzIGEgKHBo
eXNpY2FsKSBkZXZpY2UgdG8gYmUgaW4gdGhlIERvbVUsIGF0IHdoaWNoIHBvaW50IGl0DQo+
IGlzIENPTkZJR19QVERPTV9NQVhfT1JERVIgd2hpY2ggYXBwbGllcyAoUFQgc3RhbmRpbmcg
Zm9yIHBhc3MtdGhyb3VnaCkuDQo+IA0KPj4+IEhvd2V2ZXIgLSBkb2VzIHRoZSBkcml2ZXIg
cmVhbGx5IG5lZWQgdGhpcyBiaWcgYSBjb250aWd1b3VzIGNodW5rPyBJdA0KPj4+IHdvdWxk
IHNlZW0gZmFyIG1vcmUgZGVzaXJhYmxlIHRvIG1lIHRvIGJyZWFrIHRoYXQgdXAgc29tZSwg
aWYgcG9zc2libGUuDQo+Pg0KPj4gU2luY2UgdGhpcyB3b3JrcyBvbiBiYXJlIG1ldGFsIEkn
bSBhZnJhaWQgdGhlIGRyaXZlciBtYWludGFpbmVyIChtcHQNCj4+IGZ1c2lvbiBkcml2ZXIp
IHdpbGwganVzdCB0ZWxsIG1lIHRvIGZpeCBYZW4uDQo+IA0KPiBXZWxsLiBUaGUgYmlnZ2Vy
IHN1Y2ggYWxsb2NhdGlvbnMsIHRoZSBsYXJnZXIgdGhlIHJpc2sgdGhhdCBvbiBzeXN0ZW1z
DQo+IHRoYXQgaGF2ZSBiZWVuIHVwIGZvciBhIHdoaWxlIHN1Y2ggYWxsb2NhdGlvbnMgY2Fu
J3QgYmUgZnVsZmlsbGVkIGFueW1vcmUNCj4gZXZlbiBpbiB0aGUgYmFyZSBtZXRhbCBjYXNl
Lg0KDQpZZXMuIEkgZG9uJ3QgdGhpbmsgd2Ugc2hvdWxkIGp1c3Qgd29yayBhcm91bmQgdGhp
cyBpc3N1ZSB3aXRob3V0IGhhdmluZw0KZXZlbiB0cmllZCB0byBnZXQgdGhlIGRyaXZlciBm
aXhlZC4gSW4gY2FzZSB0aGV5IHJlZnVzZSB0byBjaGFuZ2UgaXQsIHdlDQpjYW4gc3RpbGwg
aW5jcmVhc2UgTUFYX0NPTlRJR19PUkRFUi4NCg0KDQpKdWVyZ2VuDQo=
--------------csyXRdVOfJV0c6HJdb4aU0L0
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------csyXRdVOfJV0c6HJdb4aU0L0--

--------------Po2XpOKQR0YFOAIlDgThNkfr--

--------------FF0xBmAe6C9bSA00BHSlST3a
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmdaxHcFAwAAAAAACgkQsN6d1ii/Ey/Q
ZggAh7DLKM49C60+ARA2YJ6AK6b0WPJPuL4Xq2TumiiCZjD6Sh3YaXwHNOv7qj/0u4LxGqBGPdn3
EoGm0rgy+XJvn6XJ3flx+EFC0wgY+O3KiCmLq0GaVq+RE+HIea6hL0A0fLDJG8OoLRUQPwzHDoO1
g7trRSuCBXclz9QiKUHfp8FIKca/juwwnSsymjhQD6ho9gdEp8MCT3N8P3vZAaB2wxae1l3EliL5
PdaAh0+j2VNJs+heMAQGKcz1Zt9yRYRLiu4elzUvquAYgB1RMiklVbeEFcpYGsjUxWjFFcgBpv1W
bSKw9EGQTO+G4DfPFoU/0h5M7G8TPGg3iIv9qYdOvA==
=wllM
-----END PGP SIGNATURE-----

--------------FF0xBmAe6C9bSA00BHSlST3a--

