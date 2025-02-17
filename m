Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C60ACA3816B
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 12:16:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890279.1299277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjz6t-0007qH-67; Mon, 17 Feb 2025 11:16:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890279.1299277; Mon, 17 Feb 2025 11:16:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjz6t-0007o5-3D; Mon, 17 Feb 2025 11:16:23 +0000
Received: by outflank-mailman (input) for mailman id 890279;
 Mon, 17 Feb 2025 11:16:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L/wo=VI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tjz6q-0007nz-Nm
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 11:16:20 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b6b2bfb-ed20-11ef-9aa6-95dc52dad729;
 Mon, 17 Feb 2025 12:16:17 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E5F36211B8;
 Mon, 17 Feb 2025 11:16:16 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8ECE51379D;
 Mon, 17 Feb 2025 11:16:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id s1/lIIAas2fCYAAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 17 Feb 2025 11:16:16 +0000
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
X-Inumbo-ID: 9b6b2bfb-ed20-11ef-9aa6-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1739790977; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=NOPPThwtCMeSj7AcjAGLfnLRDJ5gS31sImjFcJ/gwp0=;
	b=HuSCV3lXqTL6/lpugX1XgzWQ7AHxS4FlNtUmF4cS1+6RxuNUncRv2n4z+OShjsQ/JyW3CW
	Px2SrQE/Cww4lyQR5GZGsJHT3iKnL5a/nqiPFhO8wIlGWNmTDh57Rf2h0W4X/IswgA9/f2
	/z4jW4KhvqyZYp+haq4VNoVi8E4mwDc=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b="MFoxV/or"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1739790976; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=NOPPThwtCMeSj7AcjAGLfnLRDJ5gS31sImjFcJ/gwp0=;
	b=MFoxV/orD5kNrilPFb7hnFSawac4ITsPB3WQO9gzCC7McvgiG5nnBKKkjEhDVU2INEeHXG
	YU7f1t6i8pOeWSNaHu0yNNi7nxOHpGAG54Vh8QapfjPwTSFCZVN9GcAxDNvZV/5OuJVKld
	MYnm4lkQxdePwhbcfXW93FF9aCoZ/sI=
Message-ID: <93a37ce1-cffb-4dae-b339-7fd52a1098d8@suse.com>
Date: Mon, 17 Feb 2025 12:16:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/list: avoid UB in list iterators
To: Jan Beulich <jbeulich@suse.com>
Cc: oleksii.kurochko@gmail.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250216102356.18801-1-jgross@suse.com>
 <20250216102356.18801-2-jgross@suse.com>
 <6e429c09-7f45-4bf6-b5b9-5d4b8885620c@suse.com>
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
In-Reply-To: <6e429c09-7f45-4bf6-b5b9-5d4b8885620c@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------sN5x8auCFuk0PtZxwrOQ6I0t"
X-Rspamd-Queue-Id: E5F36211B8
X-Spam-Score: -3.91
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.91 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	HAS_ATTACHMENT(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	RCVD_COUNT_TWO(0.00)[2];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:mid,suse.com:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------sN5x8auCFuk0PtZxwrOQ6I0t
Content-Type: multipart/mixed; boundary="------------m7lkV7UHT0TRw1AbjfePaGM7";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: oleksii.kurochko@gmail.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-ID: <93a37ce1-cffb-4dae-b339-7fd52a1098d8@suse.com>
Subject: Re: [PATCH 1/2] xen/list: avoid UB in list iterators
References: <20250216102356.18801-1-jgross@suse.com>
 <20250216102356.18801-2-jgross@suse.com>
 <6e429c09-7f45-4bf6-b5b9-5d4b8885620c@suse.com>
In-Reply-To: <6e429c09-7f45-4bf6-b5b9-5d4b8885620c@suse.com>
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

--------------m7lkV7UHT0TRw1AbjfePaGM7
Content-Type: multipart/mixed; boundary="------------9CSEc8qgyEuRgRra9exPp7rU"

--------------9CSEc8qgyEuRgRra9exPp7rU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTcuMDIuMjUgMTA6NDcsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxNi4wMi4yMDI1
IDExOjIzLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gVGhlIGxpc3RfZm9yX2VhY2hfZW50
cnkqKCkgaXRlcmF0b3JzIGFyZSB0ZXN0aW5nIGZvciBoYXZpbmcgcmVhY2hlZCB0aGUNCj4+
IGVuZCBvZiB0aGUgbGlzdCBpbiBhIHdheSB3aGljaCByZWxpZXMgb24gdW5kZWZpbmVkIGJl
aGF2aW9yOiB0aGUNCj4+IGl0ZXJhdG9yIChiZWluZyBhIHBvaW50ZXIgdG8gdGhlIHN0cnVj
dCBvZiBhIGxpc3QgZWxlbWVudCkgaXMgYWR2YW5jZWQNCj4+IGFuZCBvbmx5IHRoZW4gdGVz
dGVkIHRvIGhhdmUgcmVhY2hlZCBub3QgdGhlIG5leHQgZWxlbWVudCwgYnV0IHRoZSBsaXN0
DQo+PiBoZWFkLiBUaGlzIHJlc3VsdHMgaW4gdGhlIGxpc3QgaGVhZCBiZWluZyBhZGRyZXNz
ZWQgdmlhIGEgbGlzdCBlbGVtZW50DQo+PiBwb2ludGVyLCB3aGljaCBpcyB1bmRlZmluZWQs
IGluIGNhc2UgdGhlIGxpc3QgZWxlbWVudHMgaGF2ZSBhIGhpZ2hlcg0KPj4gYWxpZ25tZW50
IHRoZW4gdGhlIGxpc3QgaGVhZC4NCj4gDQo+IE5pdDogcy90aGVuL3RoYW4vDQoNCk9oLCBv
ZiBjb3Vyc2UuDQoNCj4gDQo+PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vbGlzdC5oDQo+PiAr
KysgYi94ZW4vaW5jbHVkZS94ZW4vbGlzdC5oDQo+PiBAQCAtMjkxLDYgKzI5MSwxNyBAQCBz
dGF0aWMgaW5saW5lIHZvaWQgbGlzdF9tb3ZlX3RhaWwoc3RydWN0IGxpc3RfaGVhZCAqbGlz
dCwNCj4+ICAgICAgIGxpc3RfYWRkX3RhaWwobGlzdCwgaGVhZCk7DQo+PiAgIH0NCj4+ICAg
DQo+PiArLyoqDQo+PiArICogbGlzdF9pc19maXJzdCAtIHRlc3RzIHdoZXRoZXIgQGxpc3Qg
aXMgdGhlIGZpcnN0IGVudHJ5IGluIGxpc3QgQGhlYWQNCj4+ICsgKiBAbGlzdDogdGhlIGVu
dHJ5IHRvIHRlc3QNCj4+ICsgKiBAaGVhZDogdGhlIGhlYWQgb2YgdGhlIGxpc3QNCj4+ICsg
Ki8NCj4+ICtzdGF0aWMgaW5saW5lIGludCBsaXN0X2lzX2ZpcnN0KGNvbnN0IHN0cnVjdCBs
aXN0X2hlYWQgKmxpc3QsDQo+IA0KPiBib29sPw0KDQpGaW5lIHdpdGggbWUsIGd1ZXNzaW5n
IHRoYXQgeW91J2QgYWNjZXB0IHRoZSBkZXZpYXRpb24gZnJvbSBsaXN0X2lzX2xhc3QoKS4N
Cg0KPiANCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVj
dCBsaXN0X2hlYWQgKmhlYWQpDQo+PiArew0KPj4gKyAgICByZXR1cm4gbGlzdC0+cHJldiA9
PSBoZWFkOw0KPj4gK30NCj4gDQo+ICJsaXN0IiBpcyBhbWJpZ3VvdXMsIGFzIGl0IGNvdWxk
IGFsc28gbWVhbiB0aGUgc3RhcnQgb2YgdGhlIGxpc3QuIE1heWJlDQo+IGJldHRlciAiZW50
cnkiPyAoSSB1bmRlcnN0YW5kIHRoYXQnbGwgYmUgaW5jb25zaXN0ZW50IHdpdGggdGhlIHN1
YnNlcXVlbnQNCj4gbGlzdF9pc19sYXN0KCksIGJ1dCB3aGF0IGRvIHlvdSBkby4pDQoNCk9r
YXkuDQoNCj4gDQo+PiBAQCAtNDQwLDcgKzQ1MSwxOSBAQCBzdGF0aWMgaW5saW5lIHZvaWQg
bGlzdF9zcGxpY2VfaW5pdChzdHJ1Y3QgbGlzdF9oZWFkICpsaXN0LA0KPj4gICAgICovDQo+
PiAgICNkZWZpbmUgbGlzdF9uZXh0X2VudHJ5KHBvcywgbWVtYmVyKSBcDQo+PiAgICAgICAg
ICAgbGlzdF9lbnRyeSgocG9zKS0+bWVtYmVyLm5leHQsIHR5cGVvZigqKHBvcykpLCBtZW1i
ZXIpDQo+PiAtDQo+PiArDQo+PiArLyoqDQo+PiArICAqIGxpc3RfbmV4dF9lbnRyeV9vcl9u
dWxsIC0gZ2V0IHRoZSBuZXh0IGVsZW1lbnQgaW4gbGlzdA0KPj4gKyAgKiBAcG9zOiAgICAg
ICAgdGhlIHR5cGUgKiB0byBjdXJzb3INCj4+ICsgICogQG1lbWJlcjogICAgIHRoZSBuYW1l
IG9mIHRoZSBzdHJ1Y3QgbGlzdF9oZWFkICB3aXRoaW4gdGhlIHN0cnVjdC4NCj4gDQo+IE5p
dDogU3RyYXkgMm5kIGJsYW5rIGJlZm9yZSAid2l0aGluIg0KDQpUaGFua3MgZm9yIG5vdGlj
aW5nLg0KDQo+IA0KPj4gQEAgLTQ5MiwxMCArNTI3LDEwIEBAIHN0YXRpYyBpbmxpbmUgdm9p
ZCBsaXN0X3NwbGljZV9pbml0KHN0cnVjdCBsaXN0X2hlYWQgKmxpc3QsDQo+PiAgICAqIEBo
ZWFkOiAgIHRoZSBoZWFkIGZvciB5b3VyIGxpc3QuDQo+PiAgICAqIEBtZW1iZXI6IHRoZSBu
YW1lIG9mIHRoZSBsaXN0X3N0cnVjdCB3aXRoaW4gdGhlIHN0cnVjdC4NCj4+ICAgICovDQo+
PiAtI2RlZmluZSBsaXN0X2Zvcl9lYWNoX2VudHJ5KHBvcywgaGVhZCwgbWVtYmVyKSAgICAg
ICAgICAgICAgICAgICAgICAgICAgXA0KPj4gLSAgICBmb3IgKChwb3MpID0gbGlzdF9lbnRy
eSgoaGVhZCktPm5leHQsIHR5cGVvZigqKHBvcykpLCBtZW1iZXIpOyAgICAgIFwNCj4+IC0g
ICAgICAgICAmKHBvcyktPm1lbWJlciAhPSAoaGVhZCk7ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBcDQo+PiAtICAgICAgICAgKHBvcykgPSBsaXN0X2VudHJ5KChw
b3MpLT5tZW1iZXIubmV4dCwgdHlwZW9mKCoocG9zKSksIG1lbWJlcikpDQo+PiArI2RlZmlu
ZSBsaXN0X2Zvcl9lYWNoX2VudHJ5KHBvcywgaGVhZCwgbWVtYmVyKSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBcDQo+PiArICAgIGZvciAoIChwb3MpID0gbGlzdF9maXJzdF9lbnRy
eV9vcl9udWxsKGhlYWQsIHR5cGVvZigqKHBvcykpLCBtZW1iZXIpOyBcDQo+PiArICAgICAg
ICAgIHBvczsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBcDQo+IA0KPiBJIHN1c3BlY3QgTWlzcmEgd291bGQgZGVtYW5kIHBv
cyB0byBiZSBwYXJlbnRoZXNpemVkIGhlcmUgKGFuZCBpbiBzaW1pbGFyDQo+IHBsYWNlcyBl
bHNld2hlcmUpLCB0b28uDQoNCkkgZG9uJ3QgbWluZC4NCg0KPiANCj4+IEBAIC01NTYsMTEg
KzU5MCwxMSBAQCBzdGF0aWMgaW5saW5lIHZvaWQgbGlzdF9zcGxpY2VfaW5pdChzdHJ1Y3Qg
bGlzdF9oZWFkICpsaXN0LA0KPj4gICAgKiBAaGVhZDogICB0aGUgaGVhZCBmb3IgeW91ciBs
aXN0Lg0KPj4gICAgKiBAbWVtYmVyOiB0aGUgbmFtZSBvZiB0aGUgbGlzdF9zdHJ1Y3Qgd2l0
aGluIHRoZSBzdHJ1Y3QuDQo+PiAgICAqLw0KPj4gLSNkZWZpbmUgbGlzdF9mb3JfZWFjaF9l
bnRyeV9zYWZlKHBvcywgbiwgaGVhZCwgbWVtYmVyKSAgICAgICAgICAgICAgICAgIFwNCj4+
IC0gICAgZm9yICgocG9zKSA9IGxpc3RfZW50cnkoKGhlYWQpLT5uZXh0LCB0eXBlb2YoKihw
b3MpKSwgbWVtYmVyKSwgICAgICBcDQo+PiAtICAgICAgICAgKG4pID0gbGlzdF9lbnRyeSgo
cG9zKS0+bWVtYmVyLm5leHQsIHR5cGVvZigqKHBvcykpLCBtZW1iZXIpOyAgXA0KPj4gLSAg
ICAgICAgICYocG9zKS0+bWVtYmVyICE9IChoZWFkKTsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFwNCj4+IC0gICAgICAgICAocG9zKSA9IChuKSwgKG4pID0gbGlz
dF9lbnRyeSgobiktPm1lbWJlci5uZXh0LCB0eXBlb2YoKihuKSksIG1lbWJlcikpDQo+PiAr
I2RlZmluZSBsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUocG9zLCBuLCBoZWFkLCBtZW1iZXIp
ICAgICAgICAgICAgICAgICAgICAgXA0KPj4gKyAgICBmb3IgKCAocG9zKSA9IGxpc3RfZmly
c3RfZW50cnlfb3JfbnVsbChoZWFkLCB0eXBlb2YoKihwb3MpKSwgbWVtYmVyKSwgIFwNCj4+
ICsgICAgICAgICAgKG4pID0gKHBvcykgPyBsaXN0X25leHRfZW50cnlfb3JfbnVsbChoZWFk
LCBwb3MsIG1lbWJlcikgOiBOVUxMOyBcDQo+IA0KPiBuIGNhbiBlbmQgdXAgYmVpbmcgTlVM
TCBoZXJlIGV2ZW4gaWYgcG9zIGlzbid0LiBUaGVuIC4uLg0KPiANCj4+ICsgICAgICAgICAg
cG9zOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBcDQo+PiArICAgICAgICAgIChwb3MpID0gKG4pLCAobikgPSBsaXN0X25l
eHRfZW50cnlfb3JfbnVsbChoZWFkLCBuLCBtZW1iZXIpICkNCj4gDQo+IC4uLiB5b3UgY2Fu
J3QgdXNlIGxpc3RfbmV4dF9lbnRyeV9vcl9udWxsKCkgb24gaXQuDQoNCkFoLCBpbmRlZWQu
DQoNCldoYXQgd291bGQgeW91IHByZWZlcj8gSGFuZGxpbmcgdGhhdCBpbiB0aGUgKl9zYWZl
KCkgaXRlcmF0b3IgbWFjcm9zLCBvcg0KYWxsb3dpbmcgdGhlICpfZW50cnlfb3JfbnVsbCgp
IG1hY3JvcyB0byBiZSBjYWxsZWQgd2l0aCBhIE5VTEwgcGFyYW1ldGVyPw0KDQo+IA0KPj4g
QEAgLTY1NSwxMCArNjg5LDEwIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBsaXN0X3NwbGljZV9p
bml0KHN0cnVjdCBsaXN0X2hlYWQgKmxpc3QsDQo+PiAgICAqIHRoZSBfcmN1IGxpc3QtbXV0
YXRpb24gcHJpbWl0aXZlcyBzdWNoIGFzIGxpc3RfYWRkX3JjdSgpDQo+PiAgICAqIGFzIGxv
bmcgYXMgdGhlIHRyYXZlcnNhbCBpcyBndWFyZGVkIGJ5IHJjdV9yZWFkX2xvY2soKS4NCj4+
ICAgICovDQo+PiAtI2RlZmluZSBsaXN0X2Zvcl9lYWNoX2VudHJ5X3JjdShwb3MsIGhlYWQs
IG1lbWJlcikgICAgICAgICAgICAgICAgICAgICAgXA0KPj4gLSAgICBmb3IgKChwb3MpID0g
bGlzdF9lbnRyeSgoaGVhZCktPm5leHQsIHR5cGVvZigqKHBvcykpLCBtZW1iZXIpOyAgICAg
IFwNCj4+IC0gICAgICAgICAmcmN1X2RlcmVmZXJlbmNlKHBvcyktPm1lbWJlciAhPSAoaGVh
ZCk7ICAgICAgICAgICAgICAgICAgICAgICBcDQo+PiAtICAgICAgICAgKHBvcykgPSBsaXN0
X2VudHJ5KChwb3MpLT5tZW1iZXIubmV4dCwgdHlwZW9mKCoocG9zKSksIG1lbWJlcikpDQo+
PiArI2RlZmluZSBsaXN0X2Zvcl9lYWNoX2VudHJ5X3JjdShwb3MsIGhlYWQsIG1lbWJlcikg
ICAgICAgICAgICAgICAgICAgICAgICBcDQo+PiArICAgIGZvciAoIChwb3MpID0gbGlzdF9m
aXJzdF9lbnRyeV9vcl9udWxsKGhlYWQsIHR5cGVvZigqKHBvcykpLCBtZW1iZXIpOyBcDQo+
PiArICAgICAgICAgIHJjdV9kZXJlZmVyZW5jZShwb3MpOyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBcDQo+PiArICAgICAgICAgIChwb3MpID0gbGlzdF9u
ZXh0X2VudHJ5X29yX251bGwoaGVhZCwgcG9zLCBtZW1iZXIpICkNCj4gDQo+IERvbid0IHlv
dSBuZWVkIGEgbGlzdF9uZXh0X2VudHJ5X29yX251bGxfcmN1KCkgZmxhdm9yIGhlcmUsIHVz
aW5nDQo+IHJjdV9kZXJlZmVyZW5jZSgpIG9uIHRoZSBwYXNzZWQgaW4gcG9zIGZvciB0aGUg
KHBvcyktPm1lbWJlci5uZXh0IGRlcmVmPw0KDQpJc24ndCB0aGUgInJjdV9kZXJlZmVyZW5j
ZShwb3MpOyIgYWxsIHdoYXQgaXMgbmVlZGVkIGZvciB0aGUgY3VycmVudCBpdGVyYXRpb24/
DQpPdGhlcndpc2UgdG9kYXkncyBpbXBsZW1lbnRhdGlvbiB3b3VsZCBzdWZmZXIgZnJvbSB0
aGUgc2FtZSBwcm9ibGVtIElNSE8uDQoNCj4gUXVlc3Rpb24gb24gdGhlIHBhdGNoIGFzIGEg
d2hvbGU6IFNpbmNlIEkgaGF2ZSBhIHZhZ3VlIHJlY29sbGVjdGlvbiB0aGF0IHdlDQo+IG1h
eSBoYXZlIGEgdXNlIG9yIHR3byBvZiBvbmUgb2YgdGhlc2UgaXRlcmF0b3IgbWFjcm9zIHdo
aWNoIGFjdHVhbGx5IG1ha2UNCj4gYXNzdW1wdGlvbnMgb24gdGhlIHN0YXRlIG9mIHBvcyB1
cG9uIGxvb3AgZXhpdCwgZGlkIHlvdSBhdWRpdCBhbGwgdXNlIHNpdGVzPw0KDQpObywgSSBk
aWRuJ3QuIEknbSBkb2luZyBpdCByaWdodCBub3cuDQoNCkZvdW5kIDEgY2FzZSB1cCB0byBu
b3cuDQoNCg0KSnVlcmdlbg0K
--------------9CSEc8qgyEuRgRra9exPp7rU
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

--------------9CSEc8qgyEuRgRra9exPp7rU--

--------------m7lkV7UHT0TRw1AbjfePaGM7--

--------------sN5x8auCFuk0PtZxwrOQ6I0t
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmezGoAFAwAAAAAACgkQsN6d1ii/Ey+V
iAf/QcYYC7+FNiYz/DD8F9o3L204bBKNcGJ+GvqzEIG0RxAR7JQRTD+EwT/nhzcGZDtSdEbt5P2w
m4bM3bfEPoUQPJpmGn/x9MGCofKkibsjsyPhhXMZg4sdnsbsJN4BD/RQ3qnwv+t4R7kpS9dlrJ4i
RTZCRYQokwEo+UC6iUXH+qtvXPOij4GoNTsTHums9CzUa9lls8o2T8j0RZGR1czF5ZROGhCKU7iB
yZAcLTQuTdK4mAICU4Vx4Dpyivh7jRlrH2pNY1hbSimbl9hRHxZfTDwCIB6IdwzxJLJ5Cle4anmy
8PHEFF9HXqwYlsvI2svK7OJrJ/wozTl14KxQCGjQew==
=h/5I
-----END PGP SIGNATURE-----

--------------sN5x8auCFuk0PtZxwrOQ6I0t--

