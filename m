Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD809A021F7
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2025 10:35:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865600.1276846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUjVc-0000y6-JW; Mon, 06 Jan 2025 09:34:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865600.1276846; Mon, 06 Jan 2025 09:34:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUjVc-0000wE-Gi; Mon, 06 Jan 2025 09:34:52 +0000
Received: by outflank-mailman (input) for mailman id 865600;
 Mon, 06 Jan 2025 09:34:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3b0o=T6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tUjVa-0000w8-Ta
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2025 09:34:51 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7944839e-cc11-11ef-a0df-8be0dac302b0;
 Mon, 06 Jan 2025 10:34:49 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F2E3821134;
 Mon,  6 Jan 2025 09:34:47 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 99827139AB;
 Mon,  6 Jan 2025 09:34:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id +EH3I7eje2ezcAAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 06 Jan 2025 09:34:47 +0000
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
X-Inumbo-ID: 7944839e-cc11-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1736156089; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=MG/WE0bNwqU/fq3Z02wnYCpQ3/FN4nGp5XO5g8vqcao=;
	b=TDtGtv+j2Gl+TwTFnb1wlaIqdboWaeE63PZB0v+lRhF1i8fJ3Y36gunUOhz0jv6j+3HP0K
	ya3V+6BiQhb0Xlqlf3b2/ap6M337liWNtug5yF1voH32aezjJCrUTzK2L1W3jeSCdkOLDJ
	xxiEi4GB0t1TDzwuzOYg7mtCLADypUk=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1736156088; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=MG/WE0bNwqU/fq3Z02wnYCpQ3/FN4nGp5XO5g8vqcao=;
	b=Twj8r40wubnZ4B8mJUAwNjWkxwaFExbLNIwADqo6VpLHlGjj3TUGxNH2+l43Q7bxVrm5EJ
	xAOxBboPRP2JRkMynB+VDu1qckGIHBcIoWvbnzXUB0jYvmvFqoMUQ4KLpxhb7OOR/EEjqV
	yweHeepE4Wv90gPOWCdky9Xv19xDkoE=
Message-ID: <a4235e7d-9a46-4001-85d5-807f33031386@suse.com>
Date: Mon, 6 Jan 2025 10:34:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] xen: add bitmap to indicate per-domain state
 changes
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241217142218.24129-1-jgross@suse.com>
 <20241217142218.24129-3-jgross@suse.com>
 <ce327545-c23b-4272-a290-ce950b4c27f5@suse.com>
 <b7738421-5802-4179-8b6b-1ec18b8abd8a@suse.com>
 <be77e290-086e-4393-ac68-13a9cddc3f98@suse.com>
 <2fa06b11-e7a0-4f57-9af0-af432d35820a@suse.com>
 <37d13114-91eb-4d0f-9404-e5fd6cfca256@suse.com>
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
In-Reply-To: <37d13114-91eb-4d0f-9404-e5fd6cfca256@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------kNY3hHPPUvlMx11L17Wimi7r"
X-Spam-Level: 
X-Spamd-Result: default: False [-6.20 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SIGNED_PGP(-2.00)[];
	NEURAL_HAM_LONG(-1.00)[-0.998];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -6.20
X-Spam-Flag: NO

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------kNY3hHPPUvlMx11L17Wimi7r
Content-Type: multipart/mixed; boundary="------------FGqVUd63xmq700LXPIz5FeaD";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-ID: <a4235e7d-9a46-4001-85d5-807f33031386@suse.com>
Subject: Re: [PATCH v5 2/5] xen: add bitmap to indicate per-domain state
 changes
References: <20241217142218.24129-1-jgross@suse.com>
 <20241217142218.24129-3-jgross@suse.com>
 <ce327545-c23b-4272-a290-ce950b4c27f5@suse.com>
 <b7738421-5802-4179-8b6b-1ec18b8abd8a@suse.com>
 <be77e290-086e-4393-ac68-13a9cddc3f98@suse.com>
 <2fa06b11-e7a0-4f57-9af0-af432d35820a@suse.com>
 <37d13114-91eb-4d0f-9404-e5fd6cfca256@suse.com>
In-Reply-To: <37d13114-91eb-4d0f-9404-e5fd6cfca256@suse.com>
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

--------------FGqVUd63xmq700LXPIz5FeaD
Content-Type: multipart/mixed; boundary="------------lwUnZmugrvvLL3V6cnFyGcjp"

--------------lwUnZmugrvvLL3V6cnFyGcjp
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTkuMTIuMjQgMDk6MDEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxOC4xMi4yMDI0
IDA4OjE1LCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0KPj4gT24gMTcuMTIuMjQgMTc6MTIsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDE3LjEyLjIwMjQgMTY6NTUsIErDvHJnZW4gR3Jv
w58gd3JvdGU6DQo+Pj4+IE9uIDE3LjEyLjI0IDE2OjE5LCBKYW4gQmV1bGljaCB3cm90ZToN
Cj4+Pj4+IE9uIDE3LjEyLjIwMjQgMTU6MjIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+Pj4+
Pj4gQWRkIGEgYml0bWFwIHdpdGggb25lIGJpdCBwZXIgcG9zc2libGUgZG9taWQgaW5kaWNh
dGluZyB0aGUgcmVzcGVjdGl2ZQ0KPj4+Pj4+IGRvbWFpbiBoYXMgY2hhbmdlZCBpdHMgc3Rh
dGUgKGNyZWF0ZWQsIGRlbGV0ZWQsIGR5aW5nLCBjcmFzaGVkLA0KPj4+Pj4+IHNodXRkb3du
KS4NCj4+Pj4+Pg0KPj4+Pj4+IFJlZ2lzdGVyaW5nIHRoZSBWSVJRX0RPTV9FWEMgZXZlbnQg
d2lsbCByZXN1bHQgaW4gc2V0dGluZyB0aGUgYml0cyBmb3INCj4+Pj4+PiBhbGwgZXhpc3Rp
bmcgZG9tYWlucyBhbmQgcmVzZXR0aW5nIGFsbCBvdGhlciBiaXRzLg0KPj4+Pj4+DQo+Pj4+
Pj4gQXMgdGhlIHVzYWdlIG9mIHRoaXMgYml0bWFwIGlzIHRpZ2h0bHkgY291cGxlZCB3aXRo
IHRoZSBWSVJRX0RPTV9FWEMNCj4+Pj4+PiBldmVudCwgaXQgaXMgbWVhbnQgdG8gYmUgdXNl
ZCBvbmx5IGJ5IGEgc2luZ2xlIGNvbnN1bWVyIGluIHRoZSBzeXN0ZW0sDQo+Pj4+Pj4ganVz
dCBsaWtlIHRoZSBWSVJRX0RPTV9FWEMgZXZlbnQuDQo+Pj4+Pg0KPj4+Pj4gSSdtIHNvcnJ5
LCBidXQgSSBuZWVkIHRvIGNvbWUgYmFjayB0byB0aGlzLiBJIHRob3VnaHQgSSBoYWQgZ290
IGNvbnZpbmNlZA0KPj4+Pj4gdGhhdCBvbmx5IGEgc2luZ2xlIGVudGl0eSBpbiB0aGUgc3lz
dGVtIGNhbiBiaW5kIHRoaXMgdklSUS4gWWV0IHVwb24NCj4+Pj4+IGNoZWNraW5nIEkgY2Fu
J3Qgc2VlbSB0byBmaW5kIHdoYXQgd291bGQgZ3VhcmFudGVlIHRoaXMuIEluIHBhcnRpY3Vs
YXINCj4+Pj4+IGJpbmRpbmcgYSB2SVJRIGRvZXNuJ3QgaW52b2x2ZSBhbnkgWFNNIGNoZWNr
LiBIZW5jZSBhbiB1bnByaXZpbGVnZWQgZW50aXR5DQo+Pj4+PiBjb3VsZCwgb24gdGhlIGFz
c3VtcHRpb24gdGhhdCB0aGUgaW50ZXJlc3RlZCBwcml2aWxlZ2VkIGVudGl0eSAoeGVuc3Rv
cmUpDQo+Pj4+PiBpcyBhbHJlYWR5IHVwIGFuZCBydW5uaW5nLCBiaW5kIGFuZCB1bmJpbmQg
dGhpcyB2SVJRLCBqdXN0IHRvIGhhdmUgdGhlDQo+Pj4+PiBnbG9iYWwgbWFwIGZyZWVkLiBX
aGF0IGFtIEkgb3Zlcmxvb2tpbmcgKHdoaWNoIHdvdWxkIGxpa2VseSB3YW50IHN0YXRpbmcN
Cj4+Pj4+IGhlcmUpPw0KPj4+Pg0KPj4+PiBJIHRoaW5rIHlvdSBhcmUgbm90IG92ZXJsb29r
aW5nIGFueXRoaW5nLg0KPj4+Pg0KPj4+PiBJIGd1ZXNzIHRoaXMgY2FuIGVhc2lseSBiZSBo
YW5kbGVkIGJ5IGNoZWNraW5nIHRoYXQgdGhlIFZJUlFfRE9NX0VYQyBoYW5kbGluZw0KPj4+
PiBkb21haW4gaXMgdGhlIGNhbGxpbmcgb25lIGluIGRvbWFpbl9bZGVdaW5pdF9zdGF0ZXMo
KS4gTm90ZSB0aGF0IGdsb2JhbCB2aXJxcw0KPj4+PiBhcmUgb25seSBldmVyIHNlbnQgdG8g
dmNwdVswXSBvZiB0aGUgaGFuZGxpbmcgZG9tYWluLCBzbyByZWJpbmRpbmcgdGhlIGV2ZW50
DQo+Pj4+IHRvIGFub3RoZXIgdmNwdSBpcyBwb3NzaWJsZSwgYnV0IGRvZXNuJ3QgbWFrZSBz
ZW5zZS4NCj4+Pg0KPj4+IE5vLCB0aGF0J3MgcHJlY2x1ZGVkIGJ5DQo+Pj4NCj4+PiAgICAg
ICBpZiAoIHZpcnFfaXNfZ2xvYmFsKHZpcnEpICYmICh2Y3B1ICE9IDApICkNCj4+PiAgICAg
ICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+Pj4NCj4+PiBhZmFpY3QuIFRoYXQgZG9lc24ndCwg
aG93ZXZlciwgcHJlY2x1ZGUgbXVsdGlwbGUgdkNQVS1zIGZyb20gdHJ5aW5nIHRvIGJpbmQN
Cj4+PiB0aGUgdklSUSB0byB2Q1BVIDAuDQo+Pg0KPj4gSSBsZXQgbXlzZWxmIGZvb2wgYnkg
dGhlIGFiaWxpdHkgdG8gdXNlIEVWVENITk9QX2JpbmRfdmNwdSBmb3IgYSBnbG9iYWwNCj4+
IHZpcnEuIFdoaWxlIGl0IGlzIHBvc3NpYmxlIHRvIHNlbmQgdGhlIGV2ZW50IHRvIGFub3Ro
ZXIgdmNwdSwgaXQgaXMgc3RpbGwNCj4+IHZjcHVbMF0gd2hpY2ggaXMgdXNlZCBmb3IgdGhl
IGJvb2trZWVwaW5nLg0KPj4NCj4+Pg0KPj4+Pj4+IFY1Og0KPj4+Pj4+IC0gZG9tYWluX2lu
aXRfc3RhdGVzKCkgbWF5IGJlIGNhbGxlZCBvbmx5IGlmIGV2dGNobl9iaW5kX3ZpcnEoKSBo
YXMgYmVlbg0KPj4+Pj4+ICAgICAgY2FsbGVkIHZhbGlkbHkgKEphbiBCZXVsaWNoKQ0KPj4+
Pj4NCj4+Pj4+IEkgbm93IHJlY2FsbCB3aHkgSSBoYWQgZmlyc3Qgc3VnZ2VzdGVkIHRoZSBw
bGFjZW1lbnQgbGF0ZXIgaW4gdGhlIGhhbmRsaW5nOg0KPj4+Pj4gWW91J3JlIG5vdyBkb2lu
ZyB0aGUgYWxsb2NhdGlvbiB3aXRoIHlldCBhbm90aGVyIGxvY2sgaGVsZC4gSXQncyBsaWtl
bHkgbm90DQo+Pj4+PiB0aGUgZW5kIG9mIHRoZSB3b3JsZCwgYnV0IC4uLg0KPj4+Pj4NCj4+
Pj4+PiBAQCAtMTM4LDYgKzEzOSw2MCBAQCBib29sIF9fcmVhZF9tb3N0bHkgdm10cmFjZV9h
dmFpbGFibGU7DQo+Pj4+Pj4gICAgIA0KPj4+Pj4+ICAgICBib29sIF9fcmVhZF9tb3N0bHkg
dnBtdV9pc19hdmFpbGFibGU7DQo+Pj4+Pj4gICAgIA0KPj4+Pj4+ICtzdGF0aWMgREVGSU5F
X1NQSU5MT0NLKGRvbV9zdGF0ZV9jaGFuZ2VkX2xvY2spOw0KPj4+Pj4+ICtzdGF0aWMgdW5z
aWduZWQgbG9uZyAqX19yZWFkX21vc3RseSBkb21fc3RhdGVfY2hhbmdlZDsNCj4+Pj4+PiAr
DQo+Pj4+Pj4gK2ludCBkb21haW5faW5pdF9zdGF0ZXModm9pZCkNCj4+Pj4+PiArew0KPj4+
Pj4+ICsgICAgY29uc3Qgc3RydWN0IGRvbWFpbiAqZDsNCj4+Pj4+PiArICAgIGludCByYyA9
IC1FTk9NRU07DQo+Pj4+Pj4gKw0KPj4+Pj4+ICsgICAgc3Bpbl9sb2NrKCZkb21fc3RhdGVf
Y2hhbmdlZF9sb2NrKTsNCj4+Pj4+PiArDQo+Pj4+Pj4gKyAgICBpZiAoIGRvbV9zdGF0ZV9j
aGFuZ2VkICkNCj4+Pj4+PiArICAgICAgICBiaXRtYXBfemVybyhkb21fc3RhdGVfY2hhbmdl
ZCwgRE9NSURfRklSU1RfUkVTRVJWRUQpOw0KPj4+Pj4+ICsgICAgZWxzZQ0KPj4+Pj4+ICsg
ICAgew0KPj4+Pj4+ICsgICAgICAgIGRvbV9zdGF0ZV9jaGFuZ2VkID0geHZ6YWxsb2NfYXJy
YXkodW5zaWduZWQgbG9uZywNCj4+Pj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIEJJVFNfVE9fTE9OR1MoRE9NSURfRklSU1RfUkVTRVJWRUQpKTsN
Cj4+Pj4+DQo+Pj4+PiAuLi4gYWxyZWFkeSB0aGlzIGFsb25lIHdhc24ndCBuaWNlLCBhbmQg
Y291bGQgYmUgYXZvaWRlZCAoYnkgZG9pbmcgdGhlDQo+Pj4+PiBhbGxvY2F0aW9uIHByaW9y
IHRvIGFjcXVpcmluZyB0aGUgbG9jaywgd2hpY2ggb2YgY291cnNlIGNvbXBsaWNhdGVzIHRo
ZQ0KPj4+Pj4gbG9naWMgc29tZSkuDQo+Pj4+Pg0KPj4+Pj4gV2hhdCdzIHBlcmhhcHMgbGVz
cyBkZXNpcmFibGUgaXMgdGhhdCAuLi4NCj4+Pj4+DQo+Pj4+Pj4gQEAgLTQ5NCw2ICs0OTUs
MTUgQEAgaW50IGV2dGNobl9iaW5kX3ZpcnEoZXZ0Y2huX2JpbmRfdmlycV90ICpiaW5kLCBl
dnRjaG5fcG9ydF90IHBvcnQpDQo+Pj4+Pj4gICAgICAgICAgICAgZ290byBvdXQ7DQo+Pj4+
Pj4gICAgICAgICB9DQo+Pj4+Pj4gICAgIA0KPj4+Pj4+ICsgICAgaWYgKCB2aXJxID09IFZJ
UlFfRE9NX0VYQyApDQo+Pj4+Pj4gKyAgICB7DQo+Pj4+Pj4gKyAgICAgICAgcmMgPSBkb21h
aW5faW5pdF9zdGF0ZXMoKTsNCj4+Pj4+PiArICAgICAgICBpZiAoIHJjICkNCj4+Pj4+PiAr
ICAgICAgICAgICAgZ290byBvdXQ7DQo+Pj4+Pj4gKw0KPj4+Pj4+ICsgICAgICAgIGRlaW5p
dF9pZl9lcnIgPSB0cnVlOw0KPj4+Pj4+ICsgICAgfQ0KPj4+Pj4+ICsNCj4+Pj4+PiAgICAg
ICAgIHBvcnQgPSByYyA9IGV2dGNobl9nZXRfcG9ydChkLCBwb3J0KTsNCj4+Pj4+PiAgICAg
ICAgIGlmICggcmMgPCAwICkNCj4+Pj4+PiAgICAgICAgIHsNCj4+Pj4+DQo+Pj4+PiAuLi4g
dGhlIHBsYWNlbWVudCBoZXJlIGFkZGl0aW9uYWxseSBpbnRyb2R1Y2VzIGxvY2sgbmVzdGlu
ZyB3aGVuIHJlYWxseQ0KPj4+Pj4gdGhlIHR3byBsb2NrcyBzaG91bGRuJ3QgaGF2ZSBhbnkg
cmVsYXRpb25zaGlwLg0KPj4+Pj4NCj4+Pj4+IEhvdyBhYm91dCBnaXZpbmcgZG9tYWluX2lu
aXRfc3RhdGVzKCkgYSBib29sZWFuIHBhcmFtZXRlciwgc3VjaCB0aGF0IGl0DQo+Pj4+PiBj
YW4gYmUgY2FsbGVkIHR3aWNlLCB3aXRoIHRoZSBmaXJzdCBpbnZvY2F0aW9uIG1vdmVkIGJh
Y2sgdXAgd2hlcmUgaXQNCj4+Pj4+IHdhcywgYW5kIHRoZSBzZWNvbmQgb25lIHB1dCAuLi4N
Cj4+Pj4+DQo+Pj4+Pj4gQEAgLTUyNyw2ICs1MzcsOSBAQCBpbnQgZXZ0Y2huX2JpbmRfdmly
cShldnRjaG5fYmluZF92aXJxX3QgKmJpbmQsIGV2dGNobl9wb3J0X3QgcG9ydCkNCj4+Pj4+
PiAgICAgIG91dDoNCj4+Pj4+PiAgICAgICAgIHdyaXRlX3VubG9jaygmZC0+ZXZlbnRfbG9j
ayk7DQo+Pj4+Pj4gICAgIA0KPj4+Pj4+ICsgICAgaWYgKCByYyAmJiBkZWluaXRfaWZfZXJy
ICkNCj4+Pj4+PiArICAgICAgICBkb21haW5fZGVpbml0X3N0YXRlcygpOw0KPj4+Pj4+ICsN
Cj4+Pj4+PiAgICAgICAgIHJldHVybiByYzsNCj4+Pj4+PiAgICAgfQ0KPj4+Pj4NCj4+Pj4+
IC4uLiBkb3duIGhlcmUsIG5vdCBkb2luZyBhbnkgYWxsb2NhdGlvbiBhdCBhbGwgKG9ubHkg
dGhlIGNsZWFyaW5nKSwgYW5kDQo+Pj4+PiBoZW5jZSBlbGltaW5hdGluZyB0aGUgbmVlZCB0
byBkZWFsIHdpdGggaXRzIGZhaWx1cmU/IChBbHRlcm5hdGl2ZWx5DQo+Pj4+PiB0aGVyZSBj
b3VsZCBvZiBjb3Vyc2UgYmUgYSBzcGxpdCBpbnRvIGFuIGluaXQgYW5kIGEgcmVzZXQgZnVu
Y3Rpb24uKQ0KPj4+Pj4NCj4+Pj4+IFRoZXJlIG9mIGNvdXJzZSBpcyB0aGUgY2hhbmNlIG9m
IHJhY2VzIHdpdGggc3VjaCBhbiBhcHByb2FjaC4gSSdkIGxpa2UNCj4+Pj4+IHRvIG5vdGUg
dGhvdWdoIHRoYXQgd2l0aCB0aGUgcGxhY2VtZW50IG9mIHRoZSBjYWxsIGluIHRoZSBodW5r
IGFib3ZlDQo+Pj4+PiB0aGVyZSdzIGEgbWlub3IgcmFjZSwgdG9vIChhZ2FpbnN0IC4uLg0K
Pj4+Pj4NCj4+Pj4+PiBAQCAtNzMwLDYgKzc0Myw5IEBAIGludCBldnRjaG5fY2xvc2Uoc3Ry
dWN0IGRvbWFpbiAqZDEsIGludCBwb3J0MSwgYm9vbCBndWVzdCkNCj4+Pj4+PiAgICAgICAg
ICAgICBzdHJ1Y3QgdmNwdSAqdjsNCj4+Pj4+PiAgICAgICAgICAgICB1bnNpZ25lZCBsb25n
IGZsYWdzOw0KPj4+Pj4+ICAgICANCj4+Pj4+PiArICAgICAgICBpZiAoIGNobjEtPnUudmly
cSA9PSBWSVJRX0RPTV9FWEMgKQ0KPj4+Pj4+ICsgICAgICAgICAgICBkb21haW5fZGVpbml0
X3N0YXRlcygpOw0KPj4+Pj4NCj4+Pj4+IC4uLiB0aGlzIGFuZCB0aGUgc2FtZSByZW1vdGUg
dkNQVSB0aGVuIGltbWVkaWF0ZWx5IGJpbmRpbmcgdGhlIHZJUlENCj4+Pj4+IGFnYWluKS4g
SGVuY2UgeWV0IGFub3RoZXIgYWx0ZXJuYXRpdmUgd291bGQgYXBwZWFyIHRvIGJlIHRvIGRy
b3AgdGhlDQo+Pj4+PiBuZXcgZ2xvYmFsIGxvY2sgYW5kIHVzZSBkLT5ldmVudF9sb2NrIGZv
ciBzeW5jaHJvbml6YXRpb24gaW5zdGVhZA0KPj4+Pj4gKHByb3ZpZGVkIC0gc2VlIGFib3Zl
IC0gdGhhdCBvbmx5IGEgc2luZ2xlIGVudGl0eSBjYW4gYWN0dWFsbHkgc2V0IHVwDQo+Pj4+
PiBhbGwgb2YgdGhpcykuIFRoYXQgd291bGQgcHJldHR5IG11Y2ggd2FudCB0byBoYXZlIHRo
ZSBhbGxvY2F0aW9uIGtlcHQNCj4+Pj4+IHdpdGggdGhlIGxvY2sgYWxyZWFkeSBoZWxkICh3
aGljaCBpc24ndCBuaWNlLCBidXQgYXMgc2FpZCBpcyBwZXJoYXBzDQo+Pj4+PiB0b2xlcmFi
bGUpLCBidXQgd291bGQgYXQgbGVhc3QgZWxpbWluYXRlIHRoZSB1bmRlc2lyYWJsZSBsb2Nr
IG5lc3RpbmcuDQo+Pj4+Pg0KPj4+Pj4gUmUtdXNlIG9mIHRoZSBkb21haW4ncyBldmVudCBs
b2NrIGlzIGF0IGxlYXN0IHNvbWV3aGF0IGp1c3RpZmllZCBieQ0KPj4+Pj4gdGhlIGJpdCBh
cnJheSBiZWluZyB0aWVkIHRvIFZJUlFfRE9NX0VYRUMuDQo+Pj4+Pg0KPj4+Pj4gVGhvdWdo
dHM/DQo+Pj4+DQo+Pj4+IFdpdGggbXkgc3VnZ2VzdGlvbiBhYm92ZSBJIHRoaW5rIHRoZXJl
IGlzIG5vIHJhY2UsIGFzIG9ubHkgdGhlIGRvbWFpbiBoYW5kbGluZw0KPj4+PiBWSVJRX0RP
TV9FWEMgY291bGQgYWxsb2MvZGVhbGxvYyBkb21fc3RhdGVfY2hhbmdlZC4NCj4+Pg0KPj4+
IFlldCBzdGlsbCBpdCBjb3VsZCBiZSBtdWx0aXBsZSB2Q1BVLXMgdGhlcmVpbiB0byB0cnkg
dG8gaW4gcGFyYWxsZWwuDQo+Pg0KPj4gQnV0IGlzbid0IHRoaXMgYWdhaW4gdGhlIG5lZWQg
Zm9yIHRydXN0aW5nIG90aGVyIHByb2Nlc3NlcyB3aXRoaW4gdGhlIGRvbWFpbg0KPj4gaGF2
aW5nIHRoZSByaWdodCB0byBjb25zdW1lIHRoZSB2aXJxPw0KPj4NCj4+IEluIHRoZSBlbmQg
aXQgZG9lc24ndCBtYXR0ZXIgd2hldGhlciB0aGVyZSBpcyBzdWNoIGEgcmFjZSBvciBub3Qu
IFNvbWUNCj4+IHByb2Nlc3MgaW4gdGhhdCBkb21haW4gaGF2aW5nIHRoZSBwb3dlciB0byBk
byBldmVudCBjaGFubmVsIG9wZXJhdGlvbnMgY291bGQNCj4+IHNpbXBseSBjbG9zZSB0aGUg
ZXZlbnQgY2hhbm5lbC4gU28gaXQgSVMgcmVhbGx5IGFib3V0IHRydXN0Lg0KPiANCj4gV2Vs
bC4gV2hhdCB3ZSBkbyBpbiBYZW4gc2hvdWxkIGJlIGNvcnJlY3Qgd2l0aG91dCByZWdhcmQg
dG8gd2hhdCBhIGd1ZXN0IG1pZ2h0DQo+IGJlIGRvaW5nLiBBbmQgaXQgc2hvdWxkIGJlIHNh
ZmUgYWdhaW5zdCBhbnkgbm90LWZ1bGx5LXByaXZpbGVnZWQgZW50aXR5IGluIHRoZQ0KPiBz
eXN0ZW0uIEhlbmNlIHdoeSBJIHRoaW5rIHN1Y2ggYSByYWNlIG5lZWRzIGRlYWxpbmcgd2l0
aCBjb3JyZWN0bHksIG5vIG1hdHRlcg0KPiB0aGF0IGl0J3Mgbm90IGEgc2FuZSB0aGluZyB0
byBkbyBmb3IgYSBndWVzdC4NCg0KSSB0aGluayBJIGhhdmUgbm93IGZvdW5kIGEgc29sdXRp
b24gY292ZXJpbmcgYWxsIHlvdXIgcmVtYXJrczoNCg0KLSBJJ3ZlIGFkZGVkIDIgcGF0Y2hl
cyBtYWtpbmcgc3VyZSB0aGF0IG9ubHkgYSBzaW5nbGUgY29uc3VtZXIgb2YgYSBnbG9iYWwN
CiAgIHZpcnEgaXMgYWJsZSB0byBiaW5kIHRvIHRoYXQgdmlycSwgd2hpbGUgZW5zdXJpbmcg
dGhhdCBpdCBpc24ndCBwb3NzaWJsZQ0KICAgdG8gc3dpdGNoIHRoZSBoYW5kbGluZyBkb21h
aW4gd2hpbGUgYSB2aXJxIGlzIGJvdW5kIGJ5IGEgZG9tYWluLiBUaGlzIHdpbGwNCiAgIGVs
aW1pbmF0ZSBhbGwgdGhlIHJhY2VzLg0KDQotIEknbGwgc3dpdGNoIHRvIHVzZSB0aGUgZC0+
ZXZlbnRfbG9jayBmb3IgcHJvdGVjdGluZyB0aGUgYml0bWFwLg0KDQotIEknbSBkcm9wcGlu
ZyB0aGUgY2FzZSB3aGVyZSB0aGUgYml0bWFwIGlzIGFscmVhZHkgYWxsb2NhdGVkIHdoZW4g
ZG9pbmcgdGhlDQogICBiaW5kLiBBZnRlciBhbGwgdGhpcyBzaG91bGRuJ3QgYmUgcG9zc2li
bGUgYW55IGxvbmdlciwgYXMgdGhlIGJpdG1hcCB3aWxsIGJlDQogICBmcmVlZCB3aGVuIGNs
b3NpbmcgdGhlIGV2ZW50IGNoYW5uZWwuIFRoaXMgYWdhaW4gd2lsbCByZW1vdmUgdGhlIGNh
c2Ugd2hlcmUNCiAgIGJpbmRpbmcgd291bGQgcG90ZW50aWFsbHkgY2hhbmdlIHRoZSBiaXRt
YXAgd2l0aG91dCBvd25pbmcgaXQuDQoNCg0KSnVlcmdlbg0K
--------------lwUnZmugrvvLL3V6cnFyGcjp
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------lwUnZmugrvvLL3V6cnFyGcjp--

--------------FGqVUd63xmq700LXPIz5FeaD--

--------------kNY3hHPPUvlMx11L17Wimi7r
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmd7o7cFAwAAAAAACgkQsN6d1ii/Ey+G
1Qf/S3rf8VxjRLBEf5a0mxetnRrXzjx7WtCa8pAuJOLTsKFct33HTAVPyaGpndbocvadLVQr3e/5
vlRILs0JXUWGsaYePqXf41c9VuYGPZ47VJ8yZE7ZEQ/RhBnmOBTSnlrRRwkP6e39ehy7CQc6QpTY
cFefyB9gvCE3Ne3Ws8u/o+na85OqJ1JMOUlCillgvkCMeIuH6aFCNqvOebBSdJnQBAQEyNowP/tg
6rE1N937bvaGha13ceb9iSthwebBH67lLUYOojukzhfc78NEpKsBKemjEz29Otd5Gc3jiRAxwcF/
GqZhUnBuDz7LENQ60vlsIFxRVNwfTymZTmQK0MK80g==
=8+JC
-----END PGP SIGNATURE-----

--------------kNY3hHPPUvlMx11L17Wimi7r--

