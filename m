Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F564875FD7
	for <lists+xen-devel@lfdr.de>; Fri,  8 Mar 2024 09:42:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690157.1075927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riVnx-0000Xk-Px; Fri, 08 Mar 2024 08:42:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690157.1075927; Fri, 08 Mar 2024 08:42:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riVnx-0000VU-Mm; Fri, 08 Mar 2024 08:42:13 +0000
Received: by outflank-mailman (input) for mailman id 690157;
 Fri, 08 Mar 2024 08:42:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iEmX=KO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1riVnv-0000VO-Cm
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2024 08:42:11 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c01f010f-dd27-11ee-afda-a90da7624cb6;
 Fri, 08 Mar 2024 09:42:09 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 447B337C29;
 Fri,  8 Mar 2024 06:34:29 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E8389133DC;
 Fri,  8 Mar 2024 06:34:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id uoIxN3Sx6mWeNQAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 08 Mar 2024 06:34:28 +0000
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
X-Inumbo-ID: c01f010f-dd27-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1709879669; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Lr7gU0MQuMochstTN77IioZPiHfUK7OyRh5d0/ZMFkg=;
	b=rZwyN3U+XmkyCbG4nZKe5921wimaSmjp1Lm0a9qs0o/zJEsn0ThvICYhzeA0/4mlscK+0s
	EtH/9cPA6awvqGlQBCSaN+uTdijosstyp/o+3rPlKkwQRXaTwvdwyCojYU5HN42zAnm2oC
	HiG5x4DzDOGcnv2643AJxN3Su9rKLPg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1709879669; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Lr7gU0MQuMochstTN77IioZPiHfUK7OyRh5d0/ZMFkg=;
	b=rZwyN3U+XmkyCbG4nZKe5921wimaSmjp1Lm0a9qs0o/zJEsn0ThvICYhzeA0/4mlscK+0s
	EtH/9cPA6awvqGlQBCSaN+uTdijosstyp/o+3rPlKkwQRXaTwvdwyCojYU5HN42zAnm2oC
	HiG5x4DzDOGcnv2643AJxN3Su9rKLPg=
Message-ID: <9c2c4ca6-2815-4b80-bcf2-f6a530da66ea@suse.com>
Date: Fri, 8 Mar 2024 07:34:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] x86/PVH: Support relocatable dom0 kernels
Content-Language: en-US
To: Jason Andryuk <jason.andryuk@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20240306185032.103216-1-jason.andryuk@amd.com>
 <20240306185032.103216-4-jason.andryuk@amd.com> <ZemJLs0yHiSGI6nO@macbook>
 <a8e55679-0e23-44ec-9555-d126dd08be19@amd.com>
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
In-Reply-To: <a8e55679-0e23-44ec-9555-d126dd08be19@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------vRclu37ITDsKe1utYse6bxeb"
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=rZwyN3U+
X-Spamd-Result: default: False [-5.20 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 HAS_ATTACHMENT(0.00)[];
	 URIBL_BLOCKED(0.00)[suse.com:dkim];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 DKIM_TRACE(0.00)[suse.com:+];
	 MIME_BASE64_TEXT(0.10)[];
	 RCPT_COUNT_SEVEN(0.00)[9];
	 MX_GOOD(-0.01)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim];
	 SIGNED_PGP(-2.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[];
	 MIME_UNKNOWN(0.10)[application/pgp-keys]
X-Spam-Score: -5.20
X-Rspamd-Queue-Id: 447B337C29
X-Spam-Flag: NO
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------vRclu37ITDsKe1utYse6bxeb
Content-Type: multipart/mixed; boundary="------------GF0TWJhzhearXNZmSsrkc62f";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jason Andryuk <jason.andryuk@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <9c2c4ca6-2815-4b80-bcf2-f6a530da66ea@suse.com>
Subject: Re: [PATCH 3/3] x86/PVH: Support relocatable dom0 kernels
References: <20240306185032.103216-1-jason.andryuk@amd.com>
 <20240306185032.103216-4-jason.andryuk@amd.com> <ZemJLs0yHiSGI6nO@macbook>
 <a8e55679-0e23-44ec-9555-d126dd08be19@amd.com>
In-Reply-To: <a8e55679-0e23-44ec-9555-d126dd08be19@amd.com>
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

--------------GF0TWJhzhearXNZmSsrkc62f
Content-Type: multipart/mixed; boundary="------------ORq6uGNhgEWIkqKSw0dsgC2E"

--------------ORq6uGNhgEWIkqKSw0dsgC2E
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDcuMDMuMjQgMTg6MDEsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IE9uIDIwMjQtMDMt
MDcgMDQ6MzAsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+PiBPbiBXZWQsIE1hciAwNiwg
MjAyNCBhdCAwMTo1MDozMlBNIC0wNTAwLCBKYXNvbiBBbmRyeXVrIHdyb3RlOg0KPj4+IFhl
biB0cmllcyB0byBsb2FkIGEgUFZIIGRvbTAga2VybmVsIGF0IHRoZSBmaXhlZCBndWVzdCBw
aHlzaWNhbCBhZGRyZXNzDQo+Pj4gZnJvbSB0aGUgZWxmIGhlYWRlcnMuwqAgRm9yIExpbnV4
LCB0aGlzIGRlZmF1bHRzIHRvIDB4MTAwMDAwMCAoMTZNQiksIGJ1dA0KPj4+IGl0IGNhbiBi
ZSBjb25maWd1cmVkLg0KPj4+DQo+Pj4gVW5mb3J0dW5hdGVseSB0aGVyZSBleGlzdCBmaXJt
d2FyZXMgdGhhdCBoYXZlIHJlc2VydmVkIHJlZ2lvbnMgYXQgdGhpcw0KPj4+IGFkZHJlc3Ms
IHNvIFhlbiBmYWlscyB0byBsb2FkIHRoZSBkb20wIGtlcm5lbCBzaW5jZSBpdCdzIG5vdCBS
QU0uDQo+Pj4NCj4+PiBUaGUgUFZIIGVudHJ5IGNvZGUgaXMgbm90IHJlbG9jYXRhYmxlIC0g
aXQgbG9hZHMgZnJvbSBhYnNvbHV0ZQ0KPj4+IGFkZHJlc3Nlcywgd2hpY2ggZmFpbCB3aGVu
IHRoZSBrZXJuZWwgaXMgbG9hZGVkIGF0IGEgZGlmZmVyZW50IGFkZHJlc3MuDQo+Pj4gV2l0
aCBhIHN1aXRhYmx5IG1vZGlmaWVkIGtlcm5lbCwgYSByZWxvY3RhYmxlIGVudHJ5IHBvaW50
IGlzIHBvc3NpYmxlLg0KPj4+DQo+Pj4gQWRkIHRoZSBYRU5GRUFUX3B2aF9yZWxvY2F0YWJs
ZSBmbGFnIHRvIGxldCBhIGtlcm5lbCBpbmRpY2F0ZSB0aGF0IGl0DQo+Pj4gc3VwcG9ydHMg
YSByZWxvY2F0YWJsZSBlbnRyeSBwYXRoLg0KPj4+DQo+Pj4gQ2hhbmdlIHRoZSBsb2FkaW5n
IHRvIGNoZWNrIGZvciBhbiBhY2NlcHRhYmxlIGxvYWQgYWRkcmVzcy7CoCBJZiB0aGUNCj4+
PiBrZXJuZWwgaXMgcmVsb2NhdGFibGUsIHN1cHBvcnQgZmluZGluZyBhbiBhbHRlcm5hdGUg
bG9hZCBhZGRyZXNzLg0KPj4+DQo+Pj4gTGludXggY2FyZXMgYWJvdXQgaXRzIHBoeXNpY2Fs
IGFsaWdubWVudC7CoCBUaGlzIGNhbiBiZSBwdWxsZWQgb3V0IG9mIHRoZQ0KPj4+IGJ6SW1h
Z2UgaGVhZGVyLCBidXQgbm90IGZyb20gdGhlIHZtbGludXggRUxGIGZpbGUuwqAgSWYgYW4g
YWxpZ25tZW50DQo+Pj4gY2FuJ3QgYmUgZm91bmQsIHVzZSAyTUIuDQo+Pg0KPj4gV2hpbGUg
SSdtIGZpbmUgd2l0aCBoYXZpbmcgYSBMaW51eCBzcGVjaWZpYyB3YXksIHRoZXJlIG5lZWRz
IHRvIGJlIGENCj4+IGdlbmVyaWMgd2F5IG9mIHBhc3NpbmcgdGhlIGFsaWdubWVudCBmb3Ig
bm9uLWJ6SW1hZ2Uga2VybmVscy4NCj4+DQo+PiBFTEYgcHJvZ3JhbSBoZWFkZXJzIGhhdmUg
YW4gYWxpZ24gZmllbGQsIHdvdWxkIHRoYXQgYmUgc3VpdGFibGUgdG8NCj4+IHVzZT8NCj4g
DQo+IFVuZm9ydHVuYXRlbHksIGl0IGRvZXNuJ3Qgc2VlbSBjb3JyZWN0LsKgIExpbnV4IGhh
cyBDT05GSUdfUEhZU0lDQUxfQUxJR04sIGFuZCBpdCANCj4gZG9lc24ndCBzZWVtIHRvIGJl
IHVzZWQgaW4gdGhlIGVsZiBoZWFkZXJzLsKgIEFzIGEgcXVpY2sgdGVzdCwgSSBzZXQgDQo+
IENPTkZJR19QSFlTSUNBTF9BTElHTj0weDgwMDAwMCwgYnV0IHRoZSBlbGYgYWxpZ24gdmFs
dWVzIGFyZSBzdGlsbCAweDIwMDAwMC4NCg0KQW4gZXhjZXJwdCBmcm9tIHRoZSBrZXJuZWwn
cyBhcmNoL3g4Ni9NYWtlZmlsZToNCg0KIw0KIyBUaGUgNjQtYml0IGtlcm5lbCBtdXN0IGJl
IGFsaWduZWQgdG8gMk1CLiAgUGFzcyAteiBtYXgtcGFnZS1zaXplPTB4MjAwMDAwIHRvDQoj
IHRoZSBsaW5rZXIgdG8gZm9yY2UgMk1CIHBhZ2Ugc2l6ZSByZWdhcmRsZXNzIG9mIHRoZSBk
ZWZhdWx0IHBhZ2Ugc2l6ZSB1c2VkDQojIGJ5IHRoZSBsaW5rZXIuDQojDQppZmRlZiBDT05G
SUdfWDg2XzY0DQpMREZMQUdTX3ZtbGludXggKz0gLXogbWF4LXBhZ2Utc2l6ZT0weDIwMDAw
MA0KZW5kaWYNCg0KDQpKdWVyZ2VuDQo=
--------------ORq6uGNhgEWIkqKSw0dsgC2E
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------ORq6uGNhgEWIkqKSw0dsgC2E--

--------------GF0TWJhzhearXNZmSsrkc62f--

--------------vRclu37ITDsKe1utYse6bxeb
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmXqsXQFAwAAAAAACgkQsN6d1ii/Ey/w
Zgf/fOYQ5nRstsKs3VozbODlTj/DDAES7bzxTGY+p+u78GRAAD8wujjD0fcqDku8I8XbXDp0dYVn
4o9a7ippQcuSJzYVscWdvkg+omoNCoVot43VdYEcTS6fImDJO0qig3OBO8oY00kG3U7x7vmIKN4K
olT8sVziL00oM+4ywxjPbt/EgmxwNPswl034pUy91z9uGBmmSbiuFa34gVzICBv341lI04JnUpKc
5XmN6iGdvZwmTRrC3HfiOjGNovzZoSyn6o8JdMGjV/ZxuOVhabiHQGreZx5wbgafPSuwlHbNhbGH
D0ZJZlR8RUcC/X3Iv8yOiXhneWLSiZbreLkC6/IvjQ==
=aASE
-----END PGP SIGNATURE-----

--------------vRclu37ITDsKe1utYse6bxeb--

