Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 867EFA044DB
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2025 16:38:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866557.1277856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVBeb-0007L4-Vf; Tue, 07 Jan 2025 15:38:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866557.1277856; Tue, 07 Jan 2025 15:38:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVBeb-0007IV-Sc; Tue, 07 Jan 2025 15:38:01 +0000
Received: by outflank-mailman (input) for mailman id 866557;
 Tue, 07 Jan 2025 15:38:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qdqe=T7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tVBea-00075f-Ff
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2025 15:38:00 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f329ced-cd0d-11ef-99a4-01e77a169b0f;
 Tue, 07 Jan 2025 16:37:58 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3D696210F6;
 Tue,  7 Jan 2025 15:37:58 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EA5E013A6A;
 Tue,  7 Jan 2025 15:37:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id iSq7N1VKfWfwTQAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 07 Jan 2025 15:37:57 +0000
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
X-Inumbo-ID: 5f329ced-cd0d-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1736264278; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=TecDtdtIaSBeCDNWcu7HrRLoZraG1eM0027MGblEYa4=;
	b=VpX33nqGDTS1iAiEGGLitKS4rXp2nLISE3CLy3JlafCZRxLghJSMBzFlRUfNefHY0KLCcl
	XQ0O6BaF+oG1u7awbv2h0R4Sc5/rpiTrQu10NUmOAeWLH6bloYkj0OYxdQoAR5G0VoFLAu
	zj86TQxc4OSu2Ygs9CPjtRoTpIJWVCA=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=VpX33nqG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1736264278; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=TecDtdtIaSBeCDNWcu7HrRLoZraG1eM0027MGblEYa4=;
	b=VpX33nqGDTS1iAiEGGLitKS4rXp2nLISE3CLy3JlafCZRxLghJSMBzFlRUfNefHY0KLCcl
	XQ0O6BaF+oG1u7awbv2h0R4Sc5/rpiTrQu10NUmOAeWLH6bloYkj0OYxdQoAR5G0VoFLAu
	zj86TQxc4OSu2Ygs9CPjtRoTpIJWVCA=
Message-ID: <c00886ec-184c-4a82-8093-4fc9b470ea1b@suse.com>
Date: Tue, 7 Jan 2025 16:37:57 +0100
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
In-Reply-To: <c7ed9380-a4a1-4576-af56-2949d80cfd92@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------LyMlS47PQ8BhR8wSsoI5Kl7X"
X-Rspamd-Queue-Id: 3D696210F6
X-Spam-Level: 
X-Spamd-Result: default: False [-5.41 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	MX_GOOD(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DKIM_TRACE(0.00)[suse.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:dkim,suse.com:mid]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -5.41
X-Spam-Flag: NO

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------LyMlS47PQ8BhR8wSsoI5Kl7X
Content-Type: multipart/mixed; boundary="------------Cf30b5ZqoG3Mol017QA0rddf";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-ID: <c00886ec-184c-4a82-8093-4fc9b470ea1b@suse.com>
Subject: Re: [PATCH v6 1/7] xen/events: fix race with
 set_global_virq_handler()
References: <20250107101711.5980-1-jgross@suse.com>
 <20250107101711.5980-2-jgross@suse.com>
 <c7ed9380-a4a1-4576-af56-2949d80cfd92@suse.com>
In-Reply-To: <c7ed9380-a4a1-4576-af56-2949d80cfd92@suse.com>
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

--------------Cf30b5ZqoG3Mol017QA0rddf
Content-Type: multipart/mixed; boundary="------------kWRiZ995KpgSFqZ27PlsI0Qm"

--------------kWRiZ995KpgSFqZ27PlsI0Qm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDcuMDEuMjUgMTY6MjMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNy4wMS4yMDI1
IDExOjE3LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gLS0tIGEveGVuL2NvbW1vbi9ldmVu
dF9jaGFubmVsLmMNCj4+ICsrKyBiL3hlbi9jb21tb24vZXZlbnRfY2hhbm5lbC5jDQo+PiBA
QCAtOTc5LDYgKzk3OSw3IEBAIHZvaWQgc2VuZF9nbG9iYWxfdmlycSh1aW50MzJfdCB2aXJx
KQ0KPj4gICBpbnQgc2V0X2dsb2JhbF92aXJxX2hhbmRsZXIoc3RydWN0IGRvbWFpbiAqZCwg
dWludDMyX3QgdmlycSkNCj4+ICAgew0KPj4gICAgICAgc3RydWN0IGRvbWFpbiAqb2xkOw0K
Pj4gKyAgICBpbnQgcmMgPSAwOw0KPj4gICANCj4+ICAgICAgIGlmICh2aXJxID49IE5SX1ZJ
UlFTKQ0KPj4gICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPj4gQEAgLTk5MiwxNCArOTkz
LDIzIEBAIGludCBzZXRfZ2xvYmFsX3ZpcnFfaGFuZGxlcihzdHJ1Y3QgZG9tYWluICpkLCB1
aW50MzJfdCB2aXJxKQ0KPj4gICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPj4gICANCj4+
ICAgICAgIHNwaW5fbG9jaygmZ2xvYmFsX3ZpcnFfaGFuZGxlcnNfbG9jayk7DQo+PiAtICAg
IG9sZCA9IGdsb2JhbF92aXJxX2hhbmRsZXJzW3ZpcnFdOw0KPj4gLSAgICBnbG9iYWxfdmly
cV9oYW5kbGVyc1t2aXJxXSA9IGQ7DQo+PiArDQo+PiArICAgIGlmICggZC0+aXNfZHlpbmcg
IT0gRE9NRFlJTkdfYWxpdmUgKQ0KPj4gKyAgICB7DQo+PiArICAgICAgICBvbGQgPSBkOw0K
Pj4gKyAgICAgICAgcmMgPSAtRUlOVkFMOw0KPj4gKyAgICB9DQo+IA0KPiBXaGlsZSBJIGNh
biBzZWUgaG93IHRoaXMgZWxpbWluYXRlcyB0aGUgem9tYmllIGRvbWFpbiBhc3BlY3QsIHRo
aXMgZG9lc24ndA0KPiBmdWxseSBlbGltaW5hdGUgdGhlIHJhY2UuIERvaW5nIHNvIHdvdWxk
IHJlcXVpcmUgKGFsc28pIHVzaW5nIHRoZSBkb21haW4ncw0KPiBldmVudCBsb2NrLiBBc3N1
bWluZyB3ZSdyZSBva2F5IHdpdGggdGhlIHJlbWFpbmluZyByYWNlLCBpbW8gYSBjb2RlIGNv
bW1lbnQNCj4gd291bGQgYmUgbmVlZGVkIHRvIHN0YXRlIHRoaXMgKGluY2x1ZGluZyB0aGUg
ZmFjdCB0aGF0IGl0J3MgdGhlbg0KPiB1bnByZWRpY3RhYmxlIHdoZXRoZXIgdGhpcyBvcGVy
YXRpb24gbWlnaHQgc3RpbGwgc3VjY2VlZCBmb3IgYSBkb21haW4NCj4gYWxyZWFkeSBoYXZp
bmcgZC0+aXNfZHlpbmcgIT0gRE9NRFlJTkdfYWxpdmUpLg0KDQpBRkFJVSB5b3UgbWVhbiB0
aGF0IGl0IGlzIHN0aWxsIHBvc3NpYmxlIHRvIHNldCBhIGRvbWFpbiB0byBoYW5kbGUgYSB2
aXJxDQp3aGVuIGl0IGlzIGluIHRoZSBwcm9jZXNzIG9mIGdvaW5nIGRvd24sIGVzcGVjaWFs
bHkgaWYgaXNfZHlpbmcgaXMgc2V0IGp1c3QNCmFmdGVyIGl0IGhhcyBiZWVuIHRlc3RlZCB0
byBiZSBET01EWUlOR19hbGl2ZT8NCg0KSSBkb24ndCBzZWUgdGhpcyBiZWluZyBhIHByb2Js
ZW0sIGFzIHRoZSBzYW1lIHdvdWxkIGhhcHBlbiBpZiB0aGUgZG9tYWluDQp3b3VsZCBnbyBk
b3duIGp1c3QgYSBtaWxsaXNlY29uZCBsYXRlci4gVGhpcyBpcyBzb21ldGhpbmcgd2Ugd2ls
bCBuZXZlciBiZQ0KYWJsZSB0byBoYW5kbGUuDQoNCkFuZCBhZnRlciBhbGwgdGhlIGNhbGwg
b2YgY2xlYXJfZ2xvYmFsX3ZpcnFfaGFuZGxlcnMoKSB3aWxsIG5vdyByZXNldCB0aGUNCmhh
bmRsaW5nIGRvbWFpbiB0byB0aGUgaGFyZHdhcmUgZG9tYWluIGluIGFsbCBjYXNlcy4NCg0K
PiANCj4gUGx1cyB0aGUgd2F5IHlvdSBkbyBpdCB0aGUgZWFybHkgc3VjY2VzcyBwYXRoIHJl
bWFpbnM7IGlkZWFsbHkgdGhhdCBjYXNlDQo+IHdvdWxkIGFsc28gZmFpbCBmb3IgYW4gYWxy
ZWFkeSBkeWluZyBkb21haW4uDQoNClNhbWUgYWdhaW46IGNsZWFyX2dsb2JhbF92aXJxX2hh
bmRsZXJzKCkgd2lsbCByZXNldCB0aGUgaGFuZGxpbmcgZG9tYWluLg0KDQo+IA0KPj4gKyAg
ICBlbHNlDQo+PiArICAgIHsNCj4+ICsgICAgICAgIG9sZCA9IGdsb2JhbF92aXJxX2hhbmRs
ZXJzW3ZpcnFdOw0KPj4gKyAgICAgICAgZ2xvYmFsX3ZpcnFfaGFuZGxlcnNbdmlycV0gPSBk
Ow0KPj4gKyAgICB9DQo+PiAgICAgICBzcGluX3VubG9jaygmZ2xvYmFsX3ZpcnFfaGFuZGxl
cnNfbG9jayk7DQo+IA0KPiBOaXQ6IE11Y2ggbGlrZSB5b3UgZG8gYXQgdGhlIHRvcCBvZiB5
b3VyIGFkZGl0aW9uLCBhIG5ldyBibGFuayBsaW5lIGF0IHRoZQ0KPiBib3R0b20gd291bGQg
YmUgbmljZS4NCg0KV2lsbCBhZGQgdGhhdCBpZiBhIHJlc3BpbiBpcyBuZWVkZWQuDQoNCg0K
SnVlcmdlbg0KDQo=
--------------kWRiZ995KpgSFqZ27PlsI0Qm
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------kWRiZ995KpgSFqZ27PlsI0Qm--

--------------Cf30b5ZqoG3Mol017QA0rddf--

--------------LyMlS47PQ8BhR8wSsoI5Kl7X
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmd9SlUFAwAAAAAACgkQsN6d1ii/Ey8j
wQf8DqiLPX5pbpp0d9fLWz2+M/VsMdi7WTtpgiD2Q2XeVsMGf4i7s970XbuaMJhcatkAeywYRvII
7aayadlFbOR6hmfP/nyBzBGCpI2cJoR2/eF5vuAs6XAo5pDyH4nzi2nHacd9DYvoe6GK9MzTbsHy
G8Nk8fKH9vMor+9iMaSe1KqP4gPRbDd98/eidI5s8kC1EDCgXQynR6yyYNKlXINlfyokuVUg4GJa
orp7juELeNT3lmya49kItNWY0fma7RZPu4xA5AAn2za0eqbeG09mgFn9ncTRL3geljnLSgIdBp8Y
toVpoNnbcVGHvrmdLajEl/rYMN1LW1ZpaRg6Tkw6+Q==
=m+js
-----END PGP SIGNATURE-----

--------------LyMlS47PQ8BhR8wSsoI5Kl7X--

