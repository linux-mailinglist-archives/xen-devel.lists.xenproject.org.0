Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4F7A9A780
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 11:13:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.966014.1356365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7sdC-0007e3-6G; Thu, 24 Apr 2025 09:12:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 966014.1356365; Thu, 24 Apr 2025 09:12:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7sdC-0007bw-2V; Thu, 24 Apr 2025 09:12:30 +0000
Received: by outflank-mailman (input) for mailman id 966014;
 Thu, 24 Apr 2025 09:12:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RfDJ=XK=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1u7sdA-0007bp-FP
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 09:12:28 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3cf750f1-20ec-11f0-9ffb-bf95429c2676;
 Thu, 24 Apr 2025 11:12:25 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7FFB31F393;
 Thu, 24 Apr 2025 09:12:24 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 159C7139D0;
 Thu, 24 Apr 2025 09:12:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id AtloA3gACmgaFQAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 24 Apr 2025 09:12:24 +0000
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
X-Inumbo-ID: 3cf750f1-20ec-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1745485944; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=PiqNVvSSnKDcabe/2W97N/jbki5M8vigU6A372bH7xs=;
	b=Z5etMVDeHeKUCschBaZhtMSD+q9pm9+QUdWYe5d2MQLzm8/mTpjo+KJk/tP7IZTz/GPdS2
	4to0HnYoDJVdg0b7M4l1kFkANWre6rkPt/K5RonILZoAyn7NhkSdPLc3gwjX01Nc6+w6sI
	Fqedt0RD3eFyVm9tiM1LMm4UFSLvfMo=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1745485944; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=PiqNVvSSnKDcabe/2W97N/jbki5M8vigU6A372bH7xs=;
	b=Z5etMVDeHeKUCschBaZhtMSD+q9pm9+QUdWYe5d2MQLzm8/mTpjo+KJk/tP7IZTz/GPdS2
	4to0HnYoDJVdg0b7M4l1kFkANWre6rkPt/K5RonILZoAyn7NhkSdPLc3gwjX01Nc6+w6sI
	Fqedt0RD3eFyVm9tiM1LMm4UFSLvfMo=
Message-ID: <04e39f8c-4b14-4dda-b1ee-a86d5194cc8e@suse.com>
Date: Thu, 24 Apr 2025 11:12:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] remove qemu-traditional
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Nick Rosbrook <rosbrookn@gmail.com>, George Dunlap <gwd@xenproject.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
References: <20250408123526.14613-1-jgross@suse.com>
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
In-Reply-To: <20250408123526.14613-1-jgross@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------cObXPynaf7c6CsppNYBbygBN"
X-Spam-Score: -3.70
X-Spamd-Result: default: False [-3.70 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-0.998];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,xenproject.org,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org,invisiblethingslab.com,ens-lyon.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:mid]
X-Spam-Flag: NO
X-Spam-Level: 

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------cObXPynaf7c6CsppNYBbygBN
Content-Type: multipart/mixed; boundary="------------kfnT0cBgv8IVbouM5p3mxYej";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Nick Rosbrook <rosbrookn@gmail.com>, George Dunlap <gwd@xenproject.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Message-ID: <04e39f8c-4b14-4dda-b1ee-a86d5194cc8e@suse.com>
Subject: Re: [PATCH v2 0/6] remove qemu-traditional
References: <20250408123526.14613-1-jgross@suse.com>
In-Reply-To: <20250408123526.14613-1-jgross@suse.com>
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

--------------kfnT0cBgv8IVbouM5p3mxYej
Content-Type: multipart/mixed; boundary="------------yJW93t0mqm7WKVf3JWooX4ZJ"

--------------yJW93t0mqm7WKVf3JWooX4ZJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

UGluZz8NCg0KT24gMDguMDQuMjUgMTQ6MzUsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+IFJl
bW92ZSB0aGUgcWVtdS10cmFkaXRpb25hbCBzdXBwb3J0LiBUaGlzIGluY2x1ZGVzIHRoZSBN
aW5pLU9TDQo+IGJhc2VkIGlvZW11LXN0dWJkb20uDQo+IA0KPiBEb24ndCByZW1vdmUgUk9N
QklPUyBmb3Igbm93LCBhcyBpdCBjYW4gYmUgdXNlZCB3aXRoIHFlbXUgKFhlblNlcnZlcg0K
PiBpcyBkb2luZyB0aGF0KS4NCj4gDQo+IEFmdGVyIGFkZGluZyB0aGUgc2VyaWVzIGEgcnVu
IG9mIGF1dG9jb25mIHNob3VsZCBiZSBkb25lLg0KPiANCj4gQ2hhbmdlcyBpbiBWMjoNCj4g
LSBhZGRyZXNzZWQgY29tbWVudHMNCj4gDQo+IEp1ZXJnZW4gR3Jvc3MgKDYpOg0KPiAgICBT
VVBQT1JULm1kOiBtYWtlIExpbnV4IGJhc2VkIHN0dWJkb20gZnVsbHkgc3VwcG9ydGVkDQo+
ICAgIGRvY3M6IHJlbW92ZSBxZW11LXRyYWRpdGlvbmFsIHN1cHBvcnQgZnJvbSBkb2N1bWVu
dGF0aW9uDQo+ICAgIHRvb2xzOiByZW1vdmUgc3VwcG9ydCBmb3IgcnVubmluZyBhIGd1ZXN0
IHdpdGggcWVtdS10cmFkaXRpb25hbA0KPiAgICB0b29sczogcmVtb3ZlIHFlbXUtdHJhZGl0
aW9uYWwNCj4gICAgc3R1YmRvbTogcmVtb3ZlIGFuY2llbnQgc3R1YmRvbS1kbSBzY3JpcHQN
Cj4gICAgYnVpbGQ6IGRvbid0IHJlcXVpcmUgZnVsbCB0b29scyBidWlsZCBmb3IgYnVpbGRp
bmcgc3R1YmRvbXMNCj4gDQo+ICAgLmdpdGlnbm9yZSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgICAzIC0NCj4gICBDSEFOR0VMT0cubWQgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgIDIgKw0KPiAgIENvbmZpZy5tayAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAyNCAtLQ0KPiAgIElOU1RBTEwgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxMiAtDQo+ICAgTUFJTlRBSU5FUlMg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA0IC0NCj4gICBNYWtlZmls
ZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0NCj4gICBS
RUFETUUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0N
Cj4gICBTVVBQT1JULm1kICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
MjEgKy0NCj4gICBjb25maWcvVG9vbHMubWsuaW4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgIDEgLQ0KPiAgIGRvY3MvbWFuL3hsLXBjaS1jb25maWd1cmF0aW9uLjUucG9kICAg
ICAgICAgICB8ICAgNCArLQ0KPiAgIGRvY3MvbWFuL3hsLmNmZy41LnBvZC5pbiAgICAgICAg
ICAgICAgICAgICAgICB8ICA0NiArLS0NCj4gICBkb2NzL21pc2Mvc3R1YmRvbS50eHQgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgNTIgLS0tDQo+ICAgZG9jcy9taXNjL3hlbnN0b3Jl
LXBhdGhzLnBhbmRvYyAgICAgICAgICAgICAgIHwgICAzICstDQo+ICAgZG9jcy9wcm9jZXNz
L2JyYW5jaGluZy1jaGVja2xpc3QudHh0ICAgICAgICAgIHwgICA0IC0NCj4gICBkb2NzL3By
b2Nlc3MvcmVsZWFzZS10ZWNobmljaWFuLWNoZWNrbGlzdC50eHQgfCAgIDMgLQ0KPiAgIGRv
Y3MvcHJvY2Vzcy94ZW4tcmVsZWFzZS1tYW5hZ2VtZW50LnBhbmRvYyAgICB8ICAgMiArLQ0K
PiAgIHN0dWJkb20vTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA4
NCArLS0tLQ0KPiAgIHN0dWJkb20vY29uZmlndXJlICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICA4OSAtLS0tLQ0KPiAgIHN0dWJkb20vY29uZmlndXJlLmFjICAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAxNSAtDQo+ICAgc3R1YmRvbS9pb2VtdS1taW5pb3MuY2ZnICAg
ICAgICAgICAgICAgICAgICAgIHwgICA2IC0NCj4gICBzdHViZG9tL3N0dWJkb20tZG0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAxODIgLS0tLS0tLS0tLQ0KPiAgIHRvb2xzL01h
a2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA1OCAtLS0tDQo+ICAg
dG9vbHMvUnVsZXMubWsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAzIC0N
Cj4gICB0b29scy9jb25maWcuaC5pbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
IDMgLQ0KPiAgIHRvb2xzL2NvbmZpZ3VyZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICA0MiArLS0NCj4gICB0b29scy9jb25maWd1cmUuYWMgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgMjEgKy0NCj4gICB0b29scy9maXJtd2FyZS9odm1sb2FkZXIvcGNpLmMg
ICAgICAgICAgICAgICAgfCAgMTkgKy0NCj4gICB0b29scy9maXJtd2FyZS9odm1sb2FkZXIv
dXRpbC5jICAgICAgICAgICAgICAgfCAgIDkgKy0NCj4gICB0b29scy9nb2xhbmcveGVubGln
aHQvdHlwZXMuZ2VuLmdvICAgICAgICAgICAgfCAgIDEgLQ0KPiAgIHRvb2xzL2xpYmFjcGkv
bWtfZHNkdC5jICAgICAgICAgICAgICAgICAgICAgICB8IDE3NyArKy0tLS0tLS0tDQo+ICAg
dG9vbHMvbGlicy9saWdodC9saWJ4bF9jcmVhdGUuYyAgICAgICAgICAgICAgIHwgIDYwICst
LS0NCj4gICB0b29scy9saWJzL2xpZ2h0L2xpYnhsX2Rpc2suYyAgICAgICAgICAgICAgICAg
fCAgIDcgLQ0KPiAgIHRvb2xzL2xpYnMvbGlnaHQvbGlieGxfZG0uYyAgICAgICAgICAgICAg
ICAgICB8IDMyMCArLS0tLS0tLS0tLS0tLS0tLS0NCj4gICB0b29scy9saWJzL2xpZ2h0L2xp
YnhsX2RvbS5jICAgICAgICAgICAgICAgICAgfCAgMTAgLQ0KPiAgIHRvb2xzL2xpYnMvbGln
aHQvbGlieGxfZG9tX3NhdmUuYyAgICAgICAgICAgICB8IDE0MCAtLS0tLS0tLQ0KPiAgIHRv
b2xzL2xpYnMvbGlnaHQvbGlieGxfZG9tX3N1c3BlbmQuYyAgICAgICAgICB8ICA2NSAtLS0t
DQo+ICAgdG9vbHMvbGlicy9saWdodC9saWJ4bF9kb21haW4uYyAgICAgICAgICAgICAgIHwg
IDE1IC0NCj4gICB0b29scy9saWJzL2xpZ2h0L2xpYnhsX2ludGVybmFsLmMgICAgICAgICAg
ICAgfCAgIDYgKy0NCj4gICB0b29scy9saWJzL2xpZ2h0L2xpYnhsX2ludGVybmFsLmggICAg
ICAgICAgICAgfCAgIDUgKy0NCj4gICB0b29scy9saWJzL2xpZ2h0L2xpYnhsX3BjaS5jICAg
ICAgICAgICAgICAgICAgfCAxODMgLS0tLS0tLS0tLQ0KPiAgIHRvb2xzL2xpYnMvbGlnaHQv
bGlieGxfc3RyZWFtX3dyaXRlLmMgICAgICAgICB8ICAgNCAtDQo+ICAgdG9vbHMvbGlicy9s
aWdodC9saWJ4bF90eXBlcy5pZGwgICAgICAgICAgICAgIHwgICAxIC0NCj4gICB0b29scy9w
eXRob24veGVuL21pZ3JhdGlvbi9saWJ4bC5weSAgICAgICAgICAgfCAgIDIgLQ0KPiAgIHRv
b2xzL3hsL3hsX3BhcnNlLmMgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgNSArLQ0K
PiAgIDQ0IGZpbGVzIGNoYW5nZWQsIDgxIGluc2VydGlvbnMoKyksIDE2MzYgZGVsZXRpb25z
KC0pDQo+ICAgZGVsZXRlIG1vZGUgMTAwNjQ0IHN0dWJkb20vaW9lbXUtbWluaW9zLmNmZw0K
PiAgIGRlbGV0ZSBtb2RlIDEwMDY0NCBzdHViZG9tL3N0dWJkb20tZG0NCj4gDQoNCg==
--------------yJW93t0mqm7WKVf3JWooX4ZJ
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------yJW93t0mqm7WKVf3JWooX4ZJ--

--------------kfnT0cBgv8IVbouM5p3mxYej--

--------------cObXPynaf7c6CsppNYBbygBN
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmgKAHcFAwAAAAAACgkQsN6d1ii/Ey8P
Xgf/ToeZb846jyfhQJ6jpcukoJIgjt/SVi+4JDD83eUmsLFrVjxpLfV/3gYOK7EPK6e2evpKWDAm
QKgHHtvncI/JJs+4ldaSUyhcxl8W2wPSqwVpkn/xwISY22+HWj8F6tC5TyAeiaiK59wFH9yjAO2g
mVb1AZd+NyL06cs+yFrYgrPHS3D6xBAdO8ZWBZq5hO8Mgzwd+iJc1STyTgfmxjajW8bVkilho4RV
Q6jAD7vDWH8j02VeWgFkGkJa/KqB/68W++qHoizxPJ4cRNqvX0XeDCCqLDFIJJq6F1gQ4oMWy3pa
WwzbGxw7WBdzljG5FDavSgjHXjvasNR9vkoocim96w==
=tAd9
-----END PGP SIGNATURE-----

--------------cObXPynaf7c6CsppNYBbygBN--

