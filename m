Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3617AA26D20
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 09:19:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881159.1291279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfE9F-0004G5-Ji; Tue, 04 Feb 2025 08:19:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881159.1291279; Tue, 04 Feb 2025 08:19:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfE9F-0004DO-Gn; Tue, 04 Feb 2025 08:19:09 +0000
Received: by outflank-mailman (input) for mailman id 881159;
 Tue, 04 Feb 2025 08:19:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ljwx=U3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tfE9D-0004DH-Vz
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 08:19:08 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b266b77b-e2d0-11ef-99a4-01e77a169b0f;
 Tue, 04 Feb 2025 09:19:04 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2B75321101;
 Tue,  4 Feb 2025 08:19:03 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 98F741393E;
 Tue,  4 Feb 2025 08:19:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 3OC3I3bNoWd1aAAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 04 Feb 2025 08:19:02 +0000
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
X-Inumbo-ID: b266b77b-e2d0-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1738657143; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=CgESi8p6kkhhHK2qpMgVM4q9X1KhrxgV3H2FWX10o18=;
	b=YFlgwmmORF841xG9P1KbLdsf4SYiCCB5KyfV330mJ3PGL3gqrH2OysZvTqrcqbB53qvO/w
	ODXmFGxQbjTmy3Ox2w9jvvmxB7mqwktXdjYET4zfQ5mFnDssBERphmpUv8p7aE8TrRIMlp
	be+sv2iRRLfz7tK75RChbGcIvHsX71w=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=YFlgwmmO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1738657143; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=CgESi8p6kkhhHK2qpMgVM4q9X1KhrxgV3H2FWX10o18=;
	b=YFlgwmmORF841xG9P1KbLdsf4SYiCCB5KyfV330mJ3PGL3gqrH2OysZvTqrcqbB53qvO/w
	ODXmFGxQbjTmy3Ox2w9jvvmxB7mqwktXdjYET4zfQ5mFnDssBERphmpUv8p7aE8TrRIMlp
	be+sv2iRRLfz7tK75RChbGcIvHsX71w=
Message-ID: <e7611136-1e90-4f3a-8f37-68244c22c4cc@suse.com>
Date: Tue, 4 Feb 2025 09:19:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/14] meson: Deprecate 32-bit host support
To: Stefano Stabellini <sstabellini@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 mark.cave-ayland@ilande.co.uk, berrange@redhat.com, philmd@linaro.org,
 thuth@redhat.com, andrew.cooper3@citrix.com, anthony.perard@vates.tech,
 michal.orzel@amd.com, jbeulich@suse.com, julien@xen.org,
 roger.pau@citrix.com, xen-devel@lists.xenproject.org,
 bertrand.marquis@arm.com
References: <20250203031821.741477-1-richard.henderson@linaro.org>
 <467a5a58-952e-4930-8e91-744eda6d87d9@redhat.com>
 <e40c39d4-425c-4566-af41-373941894045@linaro.org>
 <alpine.DEB.2.22.394.2502031438170.11632@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2502031438170.11632@ubuntu-linux-20-04-desktop>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------loOJcM18yxDkrfXSHvJ3JRsL"
X-Rspamd-Queue-Id: 2B75321101
X-Spam-Level: 
X-Spamd-Result: default: False [-6.41 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SIGNED_PGP(-2.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,linaro.org:email]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -6.41
X-Spam-Flag: NO

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------loOJcM18yxDkrfXSHvJ3JRsL
Content-Type: multipart/mixed; boundary="------------F9tA30g03mxmchlbS6N3gAzB";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 mark.cave-ayland@ilande.co.uk, berrange@redhat.com, philmd@linaro.org,
 thuth@redhat.com, andrew.cooper3@citrix.com, anthony.perard@vates.tech,
 michal.orzel@amd.com, jbeulich@suse.com, julien@xen.org,
 roger.pau@citrix.com, xen-devel@lists.xenproject.org,
 bertrand.marquis@arm.com
Message-ID: <e7611136-1e90-4f3a-8f37-68244c22c4cc@suse.com>
Subject: Re: [PATCH v2 00/14] meson: Deprecate 32-bit host support
References: <20250203031821.741477-1-richard.henderson@linaro.org>
 <467a5a58-952e-4930-8e91-744eda6d87d9@redhat.com>
 <e40c39d4-425c-4566-af41-373941894045@linaro.org>
 <alpine.DEB.2.22.394.2502031438170.11632@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2502031438170.11632@ubuntu-linux-20-04-desktop>
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

--------------F9tA30g03mxmchlbS6N3gAzB
Content-Type: multipart/mixed; boundary="------------5VMsS6i7XB7iB6nNw0ZIOYbp"

--------------5VMsS6i7XB7iB6nNw0ZIOYbp
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDMuMDIuMjUgMjM6NDMsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4gK1hlbiBt
YWludGFpbmVycw0KPiANCj4gDQo+IE9uIE1vbiwgMyBGZWIgMjAyNSwgUmljaGFyZCBIZW5k
ZXJzb24gd3JvdGU6DQo+PiBPbiAyLzMvMjUgMDQ6NTQsIFBhb2xvIEJvbnppbmkgd3JvdGU6
DQo+Pj4gT24gMi8zLzI1IDA0OjE4LCBSaWNoYXJkIEhlbmRlcnNvbiB3cm90ZToNCj4+Pj4g
djE6IDIwMjUwMTI4MDA0MjU0LjMzNDQyLTEtcmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9y
Zw0KPj4+Pg0KPj4+PiBGb3IgdjIsIGltbWVkaWF0ZWx5IGRpc2FibGUgNjQtb24tMzIgVENH
Lg0KPj4+Pg0KPj4+PiBJICpzdXNwZWN0KiB0aGF0IHdlIHNob3VsZCBkaXNhYmxlIDY0LW9u
LTMyIGZvciAqYWxsKiBhY2NlbGVyYXRvcnMuDQo+Pj4+IFRoZSBpZGVhIHRoYXQgYW4gaTY4
NiBiaW5hcnkgb24gYW4geDg2XzY0IGhvc3QgbWF5IGJlIHVzZWQgdG8gc3Bhd24NCj4+Pj4g
YW4geDg2XzY0IGd1ZXN0IHZpYSBrdm0gaXMgc2lsbHkgYW5kIGEgYml0IG1vcmUgdGhhbiBu
aWNoZS4NCj4+Pg0KPj4+IEF0IGxlYXN0IFhlbiB1c2VkIHRvIGJlIGNvbW1vbmx5IHVzZWQg
d2l0aCAzMi1iaXQgZG9tMCwgYmVjYXVzZSBpdCBzYXZlZA0KPj4+IG1lbW9yeSBhbmQgZG9t
MCB3b3VsZCBtYXAgaW4gZ3Vlc3QgYnVmZmVycyBhcyBuZWVkZWQuwqAgSSdtIG5vdCBzdXJl
IGhvdw0KPj4+IGNvbW1vbiB0aGF0IGlzIHRoZXNlIGRheXMsIHBlcmhhcHMgU3RlZmFubyBr
bm93cy4NCj4+DQo+PiBBcyBhIGRhdGEtcG9pbnQsIGRlYmlhbiBkb2VzIG5vdCBzaGlwIGxp
Ynhlbi1kZXYgZm9yIGk2ODYuDQo+PiBXZSBjYW5ub3QgYnVpbGQtdGVzdCB0aGlzIGNvbmZp
Z3VyYXRpb24gYXQgYWxsLg0KPj4NCj4+IEkgY2FuIGJ1aWxkLXRlc3QgWGVuIGZvciBhcm1o
ZiwgYW5kIEkgZ3Vlc3MgaXQgd291bGQgdXNlIGkzODYtc29mdG1tdTsgaXQncw0KPj4gdW5j
bGVhciB3aGV0aGVyIHg4Nl82NC1zb2Z0bW11IGFuZCBhYXJjaDY0LXNvZnRtbXUgYXJlIHJl
bGV2YW50IG9yIHVzZWZ1bCBmb3INCj4+IGFuIGFybWhmIGhvc3QsIG9yIGFzIGFuIGFybWhm
IGJpbmFyeSBydW5uaW5nIG9uIGFuIGFhcmNoNjQgaG9zdC4NCj4gDQo+IA0KPiBPbiB0aGUg
WGVuIHNpZGUsIHRoZXJlIGFyZSB0d28gZGlmZmVyZW50IHVzZSBjYXNlczogeDg2IDMyLWJp
dCBhbmQgQVJNDQo+IDMyLWJpdC4NCj4gDQo+IEZvciB4ODYgMzItYml0LCB3aGlsZSBpdCB3
YXMgYSB2ZXJ5IGltcG9ydGFudCB1c2UgY2FzZSBpbiB0aGUgcGFzdCwgSQ0KPiBiZWxpZXZl
IGl0IGlzIGZhciBsZXNzIHNvIG5vdy4gSSB3aWxsIGxldCB0aGUgeDg2IG1haW50YWluZXJz
IGNvbW1lbnQgb24NCj4gaG93IGltcG9ydGFudCBpdCBpcyB0b2RheS4NCg0KQXMgZG9tMCBv
biB4ODYgaXMgYSBQViBndWVzdCBwZXIgZGVmYXVsdCBhbmQgTGludXggZG9lc24ndCBzdXBw
b3J0IHJ1bm5pbmcgYXMgYQ0KMzItYml0IFBWIGd1ZXN0IHNpbmNlIGEgZmV3IHllYXJzIG5v
dywgSSBndWVzcyB0aGVyZSBpcyBubyBuZWVkIHRvIHN1cHBvcnQgcWVtdQ0KYXMgMzItYml0
IG9uIHg4NiBmb3IgWGVuLg0KDQoNCkp1ZXJnZW4NCg==
--------------5VMsS6i7XB7iB6nNw0ZIOYbp
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------5VMsS6i7XB7iB6nNw0ZIOYbp--

--------------F9tA30g03mxmchlbS6N3gAzB--

--------------loOJcM18yxDkrfXSHvJ3JRsL
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmehzXYFAwAAAAAACgkQsN6d1ii/Ey/x
JggAiqZL4nHxVGccJtNpX+z0fvKn3lY7AiI09Cl6pf0yy+VgRiDsVM046euAGkznDludF4XZFFIb
oDDIr5XGXTlyvVP6PdTzDqba53S5MPqjc5/wmb242vHvdcsXpUPEACr77CFyvmtDqoPu6Sx64fCV
PIs5QrdKhj/lJXoYudWs2WotwZxpxmh09K3zm7uMBIJnnRUM1ggGhXUDQwKN7IKlTck7EiugrQHn
2Z8wfDg8FTixbBY0VLPB4MejmfcmMFWaQwia9HxqpWA1oGXxTZSsBUPElZBorp1W5X/qDU/o2stj
+pVf3M2hA72FETXDrZ4vDNzF+XMSshzcTDK+LAmWzA==
=qVGS
-----END PGP SIGNATURE-----

--------------loOJcM18yxDkrfXSHvJ3JRsL--

