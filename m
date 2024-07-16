Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C8D9321C3
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2024 10:22:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759406.1169115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTdS6-0000AY-4M; Tue, 16 Jul 2024 08:22:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759406.1169115; Tue, 16 Jul 2024 08:22:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTdS6-00008c-0U; Tue, 16 Jul 2024 08:22:26 +0000
Received: by outflank-mailman (input) for mailman id 759406;
 Tue, 16 Jul 2024 08:22:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kC+f=OQ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sTdS4-00008W-3h
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2024 08:22:24 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 85d2d7bc-434c-11ef-8776-851b0ebba9a2;
 Tue, 16 Jul 2024 10:22:22 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8D3B21F810;
 Tue, 16 Jul 2024 08:22:19 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4DE78136E5;
 Tue, 16 Jul 2024 08:22:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id jvgfEbstlmbVBgAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 16 Jul 2024 08:22:19 +0000
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
X-Inumbo-ID: 85d2d7bc-434c-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1721118140; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=dyVOlTRGyCc6Rfttupy/x1jX46VjHhJPf8BRiIU/J3E=;
	b=AshL12hczvxAZ9QulMO0NbhWsgBFQY7VKyt/B+Oc4WQ7GdqvJhM6eW6rbOKKDQ7npHEf5j
	U4id/ew5shWaDUdauybLgWMHbaAKiS9B2IHJM4XoTmL5OUFL0c5/11xt7/OX1wW0HbYubN
	K4NJw4FVzRvSb0Nx+TIV7KCIUANFV+M=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1721118139; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=dyVOlTRGyCc6Rfttupy/x1jX46VjHhJPf8BRiIU/J3E=;
	b=cohPQDoBLYaOKWUj5aPk7mEva6rZsP5U4r7hYyXQjaOAvZ3z6Bkjt/YOEQYYgimIuMkPeI
	4Z8HLFwUihpqu2lbUp1rgpSJmE2Ug9f/6oidgAomKzaWjKQy4mtImxepEuaUZtSBgFSOlY
	3eGLGg3nmozaMFoxadimmc1Te6dM+io=
Message-ID: <2bdf382a-cbad-454f-82ce-0b0d30d2e8ef@suse.com>
Date: Tue, 16 Jul 2024 10:22:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] docs/checklist: Fix XEN_EXTRAVERSION
 inconsistency for release candidates
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240715155051.3375999-1-andrew.cooper3@citrix.com>
 <3b188f84-50f7-4e13-bcde-1d6076e5cc2d@xen.org>
 <423412a9-e969-4126-8e39-7e77e67d2fd8@suse.com>
 <884ea922-946c-4344-ab29-6f2eb4be69f7@xen.org>
 <94edb2c8-1d40-49c1-b29f-151418eb5c11@suse.com>
 <7920f364-d07d-4004-b2b8-fa43b754e9b9@xen.org>
 <94722620-dc9f-4ace-9e3e-070c362d10df@suse.com>
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
In-Reply-To: <94722620-dc9f-4ace-9e3e-070c362d10df@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------8wGiXLakFUfrRRYVcfb3jOzV"
X-Spamd-Result: default: False [-3.69 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	XM_UA_NO_VERSION(0.01)[];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,citrix.com,lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.69
X-Spam-Level: 

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------8wGiXLakFUfrRRYVcfb3jOzV
Content-Type: multipart/mixed; boundary="------------VdSlwZgqHok0nL0F3C855fzD";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <2bdf382a-cbad-454f-82ce-0b0d30d2e8ef@suse.com>
Subject: Re: [PATCH for-4.19] docs/checklist: Fix XEN_EXTRAVERSION
 inconsistency for release candidates
References: <20240715155051.3375999-1-andrew.cooper3@citrix.com>
 <3b188f84-50f7-4e13-bcde-1d6076e5cc2d@xen.org>
 <423412a9-e969-4126-8e39-7e77e67d2fd8@suse.com>
 <884ea922-946c-4344-ab29-6f2eb4be69f7@xen.org>
 <94edb2c8-1d40-49c1-b29f-151418eb5c11@suse.com>
 <7920f364-d07d-4004-b2b8-fa43b754e9b9@xen.org>
 <94722620-dc9f-4ace-9e3e-070c362d10df@suse.com>
In-Reply-To: <94722620-dc9f-4ace-9e3e-070c362d10df@suse.com>
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

--------------VdSlwZgqHok0nL0F3C855fzD
Content-Type: multipart/mixed; boundary="------------6XFLCWZCo7nNAb0DSZZyx28E"

--------------6XFLCWZCo7nNAb0DSZZyx28E
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTYuMDcuMjQgMDk6NDYsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxNi4wNy4yMDI0
IDA5OjMzLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+PiBIaSwNCj4+DQo+PiBPbiAxNi8wNy8y
MDI0IDA4OjI0LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+PiBPbiAxNi4wNy4yMDI0IDA5OjIy
LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+Pj4+IE9uIDE2LzA3LzIwMjQgMDc6NDcsIEphbiBC
ZXVsaWNoIHdyb3RlOg0KPj4+Pj4gT24gMTUuMDcuMjAyNCAxODo1NiwgSnVsaWVuIEdyYWxs
IHdyb3RlOg0KPj4+Pj4+IE9uIDE1LzA3LzIwMjQgMTY6NTAsIEFuZHJldyBDb29wZXIgd3Jv
dGU6DQo+Pj4+Pj4+IEFuIGVhcmxpZXIgcGFydCBvZiB0aGUgY2hlY2tsaXN0IHN0YXRlczoN
Cj4+Pj4+Pj4NCj4+Pj4+Pj4gICAgICAgKiBjaGFuZ2UgeGVuLXVuc3RhYmxlIFJFQURNRS4g
VGhlIGJhbm5lciAoZ2VuZXJhdGVkIHVzaW5nIGZpZ2xldCkgc2hvdWxkIHNheToNCj4+Pj4+
Pj4gICAgICAgICAgIC0gIlhlbiA0LjUiIGluIHJlbGVhc2VzIGFuZCBvbiBzdGFibGUgYnJh
bmNoZXMNCj4+Pj4+Pj4gICAgICAgICAgIC0gIlhlbiA0LjUtdW5zdGFibGUiIG9uIHVuc3Rh
YmxlDQo+Pj4+Pj4+ICAgICAgICAgICAtICJYZW4gNC41LXJjIiBmb3IgcmVsZWFzZSBjYW5k
aWRhdGUNCj4+Pj4+Pj4NCj4+Pj4+Pj4gVXBkYXRlIHRoZSBub3RlcyBhYm91dCBYRU5fRVhU
UkFWRVJTSU9OIHRvIG1hdGNoLg0KPj4+DQo+Pj4gV2hlbiB0aGlzIGlzIHRoZSBwdXJwb3Nl
IG9mIHRoZSBwYXRjaCwgLi4uDQo+Pj4NCj4+Pj4+PiBXZSBoYXZlIGJlZW4gdGFnZ2luZyB0
aGUgdHJlZSB3aXRoIDQuNS4wLXJjWC4gU28gSSB0aGluayBpdCB3b3VsZCBiZQ0KPj4+Pj4+
IGJldHRlciB0byB1cGRhdGUgdGhlIHdvcmRpbmcgc28gd2UgdXNlIGEgY29uc2lzdGVudCBu
YW1pbmcuDQo+Pj4+Pg0KPj4+Pj4gSSBmaW5kOg0KPj4+Pj4NCj4+Pj4+IDQuMTgtcmMNCj4+
Pj4+IDQuMTctcmMNCj4+Pj4+IDQuMTYtcmMNCj4+Pj4+IDQuMTUtcmMNCj4+Pj4NCj4+Pj4g
SG1tbS4uLiBJIGRvbid0IHRoaW5rIHdlIGFyZSBsb29raW5nIGF0IHRoZSBzYW1lIHRoaW5n
LiBJIHdhcw0KPj4+PiBzcGVjaWZpY2FsbHkgbG9va2luZyBhdCB0aGUgdGFnIGFuZCAqbm90
KiBYRU5fRVhUUkFWRVJTSU9OLg0KPj4+DQo+Pj4gLi4uIHdoeSB3b3VsZCB3ZSBiZSBsb29r
aW5nIGF0IHRhZ3M/DQo+Pg0KPj4gQXMgSSB3cm90ZSwgY29uc2lzdGVuY3kgYWNyb3NzIHRo
ZSBuYW1pbmcgc2NoZW1lIHdlIHVzZS4NCj4+DQo+Pj4gVGhlIHRhZ3MgKG5lY2Vzc2FyaWx5
KSBoYXZlIFJDIG51bWJlcnMsDQo+Pg0KPj4gUmlnaHQgYnV0IHRoZXkgYWxzbyAqaGF2ZSog
dGhlIC4wLg0KPj4NCj4+PiBzbyBhcmUgZ29pbmcgdG8gYmUgZGlmZmVyZW50IGZyb20gWEVO
X0VYVFJBVkVSU0lPTiBpbiBhbnkgZXZlbnQuDQo+Pg0KPj4gU3VyZSB0aGV5IGFyZSBub3Qg
Z29pbmcgdG8gYmUgMTAwJSB0aGUgc2FtZS4gSG93ZXZlciwgdGhleSBjb3VsZCBoYXZlDQo+
PiBzb21lIHNpbWlsYXJpdHkuDQo+Pg0KPj4gQXMgSSBwb2ludGVkIG91dCBtdWx0aXBsZSB0
aW1lcyBub3csIHRvIG1lIGl0IGlzIG9kZCB3ZSBhcmUgdGFnZ2luZyB0aGUNCj4+IHRyZWUg
d2l0aCA0LjE5LjAtcmNYLCBidXQgd2UgdXNlIDQuMTktcmMuDQo+Pg0KPj4gRnVydGhlcm1v
cmUsIGlmIHlvdSBsb29rIGF0IHRoZSBoaXN0b3J5IG9mIHRoZSBkb2N1bWVudC4gSXQgaXMg
cXVpdGUNCj4+IGNsZWFyIHRoYXQgdGhlIGdvYWwgd2FzIGNvbnNpc3RlbmN5ICh0aGUgY29t
bWl0IG1lbnRpb25lZCBieSBBbmRyZXcNCj4+IGhhcHBlbmVkIGFmdGVyKS4gWWVzIGl0IHdh
c24ndCByZXNwZWN0ZWQgYnV0IEkgY2FuJ3QgdGVsbCBleGFjdGx5IHdoeS4NCj4+DQo+PiBT
byBhcyB3ZSB0cnkgdG8gY29ycmVjdCB0aGUgZG9jdW1lbnRhdGlvbiwgSSB0aGluayB3ZSBz
aG91bGQgYWxzbyBsb29rDQo+PiBhdCBjb25zaXN0ZW5jeS4gSWYgeW91ICpyZWFsbHkqIHdh
bnQgdG8gZHJvcCB0aGUgLjAsIHRoZW4gSSB0aGluayBpdA0KPj4gc2hvdWxkIGhhcHBlbiBm
b3IgdGhlIHRhZyBhcyB3ZWxsIChhZ2FpbiBmb3IgY29uc2lzdGVuY3kpLg0KPiANCj4gSSBk
b24ndCBzZWUgd2h5IChidXQgSSBhbHNvIHdvdWxkbid0IG1pbmQgdGhlIGRyb3BwaW5nIGZy
b20gdGhlIHRhZykuDQo+IFRoZXkgYXJlIGdvaW5nIHRvIGJlIGRpZmZlcmVudC4gV2hldGhl
ciB0aGV5J3JlIGRpZmZlcmVudCBpbiBvbmUgb3IgdHdvDQo+IGFzcGVjdHMgaXMgc2Vjb25k
YXJ5IHRvIG1lLiBJIHJhdGhlciB2aWV3IHRoZSBjb25zaXN0ZW5jeSBnb2FsIHRvIGJlDQo+
IHdpdGggd2hhdCB3ZSd2ZSBiZWVuIGRvaW5nIGluIHRoZSBsYXN0IHNvIG1hbnkgcmVsZWFz
ZXMuDQoNCkFub3RoZXIgYXNwZWN0IHRvIGxvb2sgYXQgd291bGQgYmUgdmVyc2lvbiBzb3J0
aW5nLiBUaGlzIHdpbGwgYmUgaW50ZXJlc3RpbmcNCndoZW4gZS5nLiBoYXZpbmcgYSBYZW4g
cnBtIHBhY2thZ2UgaW5zdGFsbGVkIGFuZCB1cGdyYWRpbmcgaXQgd2l0aCBhIGxhdGVyDQp2
ZXJzaW9uLiBJIGRvbid0IHRoaW5rIHdlIHdhbnQgdG8gcmVnYXJkIHJlcGxhY2luZyBhbiAt
cmMgdmVyc2lvbiB3aXRoIHRoZQ0KLjAgdmVyc2lvbiB0byBiZSBhIGRvd25ncmFkZSwgc28g
dGhlIHRoZSB2ZXJzaW9uIG51bWJlcnMgc2hvdWxkIGJlIHNvcnRlZCBieQ0KInNvcnQgLVYi
IGluIHRoZSBjb3JyZWN0IG9yZGVyLg0KDQpUaGlzIHdvdWxkIG1lYW4gdGhhdCB3ZSdkIG5l
ZWQgdG8gdXNlOg0KDQo0LjE5LXJjDQo0LjE5LjANCjQuMTkuMQ0KDQoNCkp1ZXJnZW4NCg0K

--------------6XFLCWZCo7nNAb0DSZZyx28E
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------6XFLCWZCo7nNAb0DSZZyx28E--

--------------VdSlwZgqHok0nL0F3C855fzD--

--------------8wGiXLakFUfrRRYVcfb3jOzV
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmaWLboFAwAAAAAACgkQsN6d1ii/Ey8b
qAf9GTut/PKeB4VHjIHmRThBV86jpUyPG3pNP10uokk5JkldZVGKtvNrZFyKVLPb+rPJJnsCWXOS
/iP5T653d8NkW+jhr7jxWCAYD6mtGgoO1QEeJOx+bPY3V4G82/kzHiVamsXFij75epwxUKldr0Tg
Dtfow5UkoVr+AxDjOwM41/muBeUx9KWgMGlUgcutEZcanvnciB+KXsJnZmCBmqh4+fLT/Bv9OsLQ
YpWAfn7WpOrikd/myl+Q8R9IC5oZN4qga//r39CYkIvnwz6RrARmTOSID+xcgQx364qxLw/fODx6
QGDlQ3wY9yuIeRpGiDCsSNsj+5fOvQvGARRdKOwbRg==
=NRtb
-----END PGP SIGNATURE-----

--------------8wGiXLakFUfrRRYVcfb3jOzV--

