Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47ECFA04545
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2025 16:57:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866586.1277897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVBwx-0004xe-Bj; Tue, 07 Jan 2025 15:56:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866586.1277897; Tue, 07 Jan 2025 15:56:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVBwx-0004v6-72; Tue, 07 Jan 2025 15:56:59 +0000
Received: by outflank-mailman (input) for mailman id 866586;
 Tue, 07 Jan 2025 15:56:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qdqe=T7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tVBwv-0004v0-Lr
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2025 15:56:57 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 04cfb722-cd10-11ef-99a4-01e77a169b0f;
 Tue, 07 Jan 2025 16:56:55 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0657721114;
 Tue,  7 Jan 2025 15:56:55 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8CD2D13A6A;
 Tue,  7 Jan 2025 15:56:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id NH87IMZOfWfHUwAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 07 Jan 2025 15:56:54 +0000
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
X-Inumbo-ID: 04cfb722-cd10-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1736265415; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=6Js3pp+6Qd7TTnfkkDpa2xhZBLypmD+iK5Dr+6nsuPM=;
	b=u5nnUUffs1bf7yph7MtY4rbAR1nkyhSOOjBsF/bLjizEKm+57X7xX2geh72gjiDHCsdgLF
	bAsM0NkpptkbqJ6qGkKD3uA7NQhMU5oiVVgHSkJYUuJZhVYHqjokXbuTJlzxzQg8/25hbm
	E/FGeFpaUoLAW7YAiH5ayNZhXSBjPeo=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1736265415; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=6Js3pp+6Qd7TTnfkkDpa2xhZBLypmD+iK5Dr+6nsuPM=;
	b=u5nnUUffs1bf7yph7MtY4rbAR1nkyhSOOjBsF/bLjizEKm+57X7xX2geh72gjiDHCsdgLF
	bAsM0NkpptkbqJ6qGkKD3uA7NQhMU5oiVVgHSkJYUuJZhVYHqjokXbuTJlzxzQg8/25hbm
	E/FGeFpaUoLAW7YAiH5ayNZhXSBjPeo=
Message-ID: <b508c054-5706-4fcc-b8f8-738775530022@suse.com>
Date: Tue, 7 Jan 2025 16:56:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/7] xen/events: fix race with
 set_global_virq_handler()
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250107101711.5980-1-jgross@suse.com>
 <20250107101711.5980-2-jgross@suse.com>
 <c7ed9380-a4a1-4576-af56-2949d80cfd92@suse.com>
 <c00886ec-184c-4a82-8093-4fc9b470ea1b@suse.com>
 <270984e8-2296-48b9-b45c-92ab28b4e6dd@suse.com>
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
In-Reply-To: <270984e8-2296-48b9-b45c-92ab28b4e6dd@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------PjYgUMBIqRFr7o8WkLYEGF5M"
X-Spam-Score: -5.19
X-Spamd-Result: default: False [-5.19 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	NEURAL_HAM_LONG(-0.99)[-0.991];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	NEURAL_HAM_SHORT(-0.20)[-0.977];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	RCVD_TLS_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	RCPT_COUNT_SEVEN(0.00)[8];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid];
	HAS_ATTACHMENT(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------PjYgUMBIqRFr7o8WkLYEGF5M
Content-Type: multipart/mixed; boundary="------------A09bGMHrSfoT0uS5G90NMND3";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-ID: <b508c054-5706-4fcc-b8f8-738775530022@suse.com>
Subject: Re: [PATCH v6 1/7] xen/events: fix race with
 set_global_virq_handler()
References: <20250107101711.5980-1-jgross@suse.com>
 <20250107101711.5980-2-jgross@suse.com>
 <c7ed9380-a4a1-4576-af56-2949d80cfd92@suse.com>
 <c00886ec-184c-4a82-8093-4fc9b470ea1b@suse.com>
 <270984e8-2296-48b9-b45c-92ab28b4e6dd@suse.com>
In-Reply-To: <270984e8-2296-48b9-b45c-92ab28b4e6dd@suse.com>
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

--------------A09bGMHrSfoT0uS5G90NMND3
Content-Type: multipart/mixed; boundary="------------vnLD0vG1EgF5CVTCqB936Kgl"

--------------vnLD0vG1EgF5CVTCqB936Kgl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDcuMDEuMjUgMTY6NDksIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNy4wMS4yMDI1
IDE2OjM3LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMDcuMDEuMjUgMTY6MjMsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDA3LjAxLjIwMjUgMTE6MTcsIEp1ZXJnZW4gR3Jv
c3Mgd3JvdGU6DQo+Pj4+IC0tLSBhL3hlbi9jb21tb24vZXZlbnRfY2hhbm5lbC5jDQo+Pj4+
ICsrKyBiL3hlbi9jb21tb24vZXZlbnRfY2hhbm5lbC5jDQo+Pj4+IEBAIC05NzksNiArOTc5
LDcgQEAgdm9pZCBzZW5kX2dsb2JhbF92aXJxKHVpbnQzMl90IHZpcnEpDQo+Pj4+ICAgIGlu
dCBzZXRfZ2xvYmFsX3ZpcnFfaGFuZGxlcihzdHJ1Y3QgZG9tYWluICpkLCB1aW50MzJfdCB2
aXJxKQ0KPj4+PiAgICB7DQo+Pj4+ICAgICAgICBzdHJ1Y3QgZG9tYWluICpvbGQ7DQo+Pj4+
ICsgICAgaW50IHJjID0gMDsNCj4+Pj4gICAgDQo+Pj4+ICAgICAgICBpZiAodmlycSA+PSBO
Ul9WSVJRUykNCj4+Pj4gICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4+Pj4gQEAgLTk5
MiwxNCArOTkzLDIzIEBAIGludCBzZXRfZ2xvYmFsX3ZpcnFfaGFuZGxlcihzdHJ1Y3QgZG9t
YWluICpkLCB1aW50MzJfdCB2aXJxKQ0KPj4+PiAgICAgICAgICAgIHJldHVybiAtRUlOVkFM
Ow0KPj4+PiAgICANCj4+Pj4gICAgICAgIHNwaW5fbG9jaygmZ2xvYmFsX3ZpcnFfaGFuZGxl
cnNfbG9jayk7DQo+Pj4+IC0gICAgb2xkID0gZ2xvYmFsX3ZpcnFfaGFuZGxlcnNbdmlycV07
DQo+Pj4+IC0gICAgZ2xvYmFsX3ZpcnFfaGFuZGxlcnNbdmlycV0gPSBkOw0KPj4+PiArDQo+
Pj4+ICsgICAgaWYgKCBkLT5pc19keWluZyAhPSBET01EWUlOR19hbGl2ZSApDQo+Pj4+ICsg
ICAgew0KPj4+PiArICAgICAgICBvbGQgPSBkOw0KPj4+PiArICAgICAgICByYyA9IC1FSU5W
QUw7DQo+Pj4+ICsgICAgfQ0KPj4+DQo+Pj4gV2hpbGUgSSBjYW4gc2VlIGhvdyB0aGlzIGVs
aW1pbmF0ZXMgdGhlIHpvbWJpZSBkb21haW4gYXNwZWN0LCB0aGlzIGRvZXNuJ3QNCj4+PiBm
dWxseSBlbGltaW5hdGUgdGhlIHJhY2UuIERvaW5nIHNvIHdvdWxkIHJlcXVpcmUgKGFsc28p
IHVzaW5nIHRoZSBkb21haW4ncw0KPj4+IGV2ZW50IGxvY2suIEFzc3VtaW5nIHdlJ3JlIG9r
YXkgd2l0aCB0aGUgcmVtYWluaW5nIHJhY2UsIGltbyBhIGNvZGUgY29tbWVudA0KPj4+IHdv
dWxkIGJlIG5lZWRlZCB0byBzdGF0ZSB0aGlzIChpbmNsdWRpbmcgdGhlIGZhY3QgdGhhdCBp
dCdzIHRoZW4NCj4+PiB1bnByZWRpY3RhYmxlIHdoZXRoZXIgdGhpcyBvcGVyYXRpb24gbWln
aHQgc3RpbGwgc3VjY2VlZCBmb3IgYSBkb21haW4NCj4+PiBhbHJlYWR5IGhhdmluZyBkLT5p
c19keWluZyAhPSBET01EWUlOR19hbGl2ZSkuDQo+Pg0KPj4gQUZBSVUgeW91IG1lYW4gdGhh
dCBpdCBpcyBzdGlsbCBwb3NzaWJsZSB0byBzZXQgYSBkb21haW4gdG8gaGFuZGxlIGEgdmly
cQ0KPj4gd2hlbiBpdCBpcyBpbiB0aGUgcHJvY2VzcyBvZiBnb2luZyBkb3duLCBlc3BlY2lh
bGx5IGlmIGlzX2R5aW5nIGlzIHNldCBqdXN0DQo+PiBhZnRlciBpdCBoYXMgYmVlbiB0ZXN0
ZWQgdG8gYmUgRE9NRFlJTkdfYWxpdmU/DQo+Pg0KPj4gSSBkb24ndCBzZWUgdGhpcyBiZWlu
ZyBhIHByb2JsZW0sIGFzIHRoZSBzYW1lIHdvdWxkIGhhcHBlbiBpZiB0aGUgZG9tYWluDQo+
PiB3b3VsZCBnbyBkb3duIGp1c3QgYSBtaWxsaXNlY29uZCBsYXRlci4gVGhpcyBpcyBzb21l
dGhpbmcgd2Ugd2lsbCBuZXZlciBiZQ0KPj4gYWJsZSB0byBoYW5kbGUuDQo+IA0KPiBSaWdo
dCwgYnV0IHRoZSBzZXF1ZW5jZSBvZiBldmVudHMgaW4gdGhlIGNhc2UgeW91IG1lbnRpb24g
aXMgZGlmZmVyZW50OiBUaGUNCj4gaW5zZXJ0aW9uIGludG8gdGhlIGFycmF5IHdvdWxkIHN0
aWxsIGhhcHBlbiB3aGlsZSB0aGUgZG9tYWluIGlzbid0IG1hcmtlZA0KPiBkeWluZy4NCj4g
DQo+PiBBbmQgYWZ0ZXIgYWxsIHRoZSBjYWxsIG9mIGNsZWFyX2dsb2JhbF92aXJxX2hhbmRs
ZXJzKCkgd2lsbCBub3cgcmVzZXQgdGhlDQo+PiBoYW5kbGluZyBkb21haW4gdG8gdGhlIGhh
cmR3YXJlIGRvbWFpbiBpbiBhbGwgY2FzZXMuDQo+IA0KPiBPZiBjb3Vyc2UsIGJ1dCBpbiB0
aGUgbWVhbnRpbWUgYW4gZXZlbnQgbWF5IGJlIHNlbnQgdG8gc3VjaCBhIGRvbWFpbiBhbHJl
YWR5DQo+IG1hcmtlZCBkeWluZy4gVGhhdCBsaWtlbHkgaXNuJ3QgZ29pbmcgdG8gY2F1c2Ug
cHJvYmxlbXMsIGJ1dCBpcyB1bmV4cGVjdGVkDQo+IHdpdGggd2hhdCBkZXNjcmlwdGlvbiBo
ZXJlIHNheXMgaXMgYmVpbmcgYWRkcmVzc2VkLg0KPiANCj4+PiBQbHVzIHRoZSB3YXkgeW91
IGRvIGl0IHRoZSBlYXJseSBzdWNjZXNzIHBhdGggcmVtYWluczsgaWRlYWxseSB0aGF0IGNh
c2UNCj4+PiB3b3VsZCBhbHNvIGZhaWwgZm9yIGFuIGFscmVhZHkgZHlpbmcgZG9tYWluLg0K
Pj4NCj4+IFNhbWUgYWdhaW46IGNsZWFyX2dsb2JhbF92aXJxX2hhbmRsZXJzKCkgd2lsbCBy
ZXNldCB0aGUgaGFuZGxpbmcgZG9tYWluLg0KPiANCj4gUmlnaHQuDQo+IA0KPiBJbiBzdW1t
YXJ5OiBBcyBpbmRpY2F0ZWQsIHdlIG1heSBiZSBva2F5IHdpdGggdGhlIHJlbWFpbmluZyBy
YWNlLCBidXQgdGhlbg0KPiB3ZSBhbHNvIHNob3VsZCBiZSBtYWtpbmcgY2xlYXIgdGhhdCB3
ZSd2ZSBkZWNpZGVkIHRvIGxlYXZlIGl0IGF0IHRoYXQuDQo+IEhlbmNlIG15IGVhcmxpZXIg
cmVxdWVzdDogSWYgd2UgYWNjZXB0IHRoaXMsIHNheSAoYW5kIGJyaWVmbHkganVzdGlmeSkg
dGhpcw0KPiBpbiBhIGNvZGUgY29tbWVudC4NCg0KT2theSwgd291bGQgeW91IGJlIGZpbmUg
d2l0aDoNCg0KICAgTm90ZSB0aGF0IHRoaXMgY2hlY2sgd29uJ3QgZ3VhcmFudGVlIHRoYXQg
YSBkb21haW4ganVzdCBnb2luZyBkb3duIGNhbid0IGJlDQogICBzZXQgYXMgdGhlIGhhbmRs
aW5nIGRvbWFpbiBvZiBhIHZpcnEsIGFzIHRoZSBpc19keWluZyBpbmRpY2F0b3IgbWlnaHQg
Y2hhbmdlDQogICBqdXN0IGFmdGVyIHRlc3RpbmcgaXQuDQogICBUaGlzIGlzbid0IGdvaW5n
IHRvIGJlIGEgbWFqb3IgcHJvYmxlbSwgYXMgY2xlYXJfZ2xvYmFsX3ZpcnFfaGFuZGxlcnMo
KSBpcw0KICAgZ3VhcmFudGVlZCB0byBydW4gYWZ0ZXJ3YXJkcyBhbmQgaXQgd2lsbCByZXNl
dCB0aGUgaGFuZGxpbmcgZG9tYWluIGZvciB0aGUNCiAgIHZpcnEgdG8gdGhlIGhhcmR3YXJl
IGRvbWFpbi4NCg0KDQpKdWVyZ2VuDQo=
--------------vnLD0vG1EgF5CVTCqB936Kgl
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------vnLD0vG1EgF5CVTCqB936Kgl--

--------------A09bGMHrSfoT0uS5G90NMND3--

--------------PjYgUMBIqRFr7o8WkLYEGF5M
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmd9TsYFAwAAAAAACgkQsN6d1ii/Ey9v
qgf+LNXtZ7K/ikllfzcU+az50yus+nrYwyiNRrGPOQSVE22IUSxfVBBPMHcnLc/HOiXUQKQN8IXz
yUMn1qaszRegM7yXQOCXbcDwAUkm0n1bIEgmg1J2CaAvnFFD5/xyBROwahiNO8n/rV/l3IvtqV6F
jzYO+dR4ePByDmkFHAOQ85i9CcHIp+CSTPqMiV0+1LVwsK8tmfy7UwotDBqYjTx28BmUUEi8+eZg
y+SVsttZTnmFzq2zWdDT/neUyvRIdXDUJLXwaGUN5MDHu6XAqZ6mxhHCH2RWcHTpH3fag5hBhoeE
Q8ZStf88KbY0kuoduXzUtXZz88OR1Laf04J3nBNOfA==
=GGrU
-----END PGP SIGNATURE-----

--------------PjYgUMBIqRFr7o8WkLYEGF5M--

