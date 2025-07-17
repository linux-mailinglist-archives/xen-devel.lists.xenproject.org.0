Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74100B084D9
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 08:24:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046161.1416398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucI2j-0002PR-IT; Thu, 17 Jul 2025 06:24:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046161.1416398; Thu, 17 Jul 2025 06:24:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucI2j-0002Mm-FG; Thu, 17 Jul 2025 06:24:33 +0000
Received: by outflank-mailman (input) for mailman id 1046161;
 Thu, 17 Jul 2025 06:24:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XrhN=Z6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ucI2i-0002Mf-01
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 06:24:32 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2a70642-62d6-11f0-a319-13f23c93f187;
 Thu, 17 Jul 2025 08:24:31 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D31E91F7CF;
 Thu, 17 Jul 2025 06:24:29 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6729F1392A;
 Thu, 17 Jul 2025 06:24:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id XbcnFx2XeGgmHQAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 17 Jul 2025 06:24:29 +0000
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
X-Inumbo-ID: b2a70642-62d6-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1752733470; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=VOAgqs896WKxSDJuKj2Bu5yisWfAMjh7WILxTa3pe4c=;
	b=jDiTmQwInKSDjIks/rM2hYj7G5op1V5zZ0F6nHiC99D5p7dcFyso+57e5Ab6XRrSCeM3IH
	piVQN7bxZWZE+e6Dq4DxIuPEBQCpUS3lFc75PUMS2l1JJqJ4bHcHQQJRAWWtmlNtOxEC8d
	PKRj9J3kEAeb5deuOVV2odN+SU3BJIM=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1752733469; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=VOAgqs896WKxSDJuKj2Bu5yisWfAMjh7WILxTa3pe4c=;
	b=oxZDC7crRWgfdt3QT8YJTC+wJiLJ2Yvz3xfCtPbQXnaP6nz7gdGkmgNNiEkAzF8l5v6WuO
	5vqu11PwlgraKemm2kSgGXQlkilJpYlo6lO/5DkAxthegQsUbuH/RDVgE81G1liRQnkf/8
	L9vWXZ0iz84y9EDtzqucuHXVYqGuhcs=
Message-ID: <13f6ce53-fdb9-469c-a2fd-a93280d55c97@suse.com>
Date: Thu, 17 Jul 2025 08:24:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/17] xen: Add capabilities to get_domain_state
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250716211504.291104-1-jason.andryuk@amd.com>
 <20250716211504.291104-12-jason.andryuk@amd.com>
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
In-Reply-To: <20250716211504.291104-12-jason.andryuk@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0RoaQ6P0LsUKj6gSic2eOKMM"
X-Spamd-Result: default: False [-5.20 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	NEURAL_HAM_SHORT(-0.20)[-0.992];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email,amd.com:email,imap1.dmz-prg2.suse.org:helo];
	URIBL_BLOCKED(0.00)[amd.com:email,imap1.dmz-prg2.suse.org:helo,suse.com:mid,suse.com:email];
	HAS_ATTACHMENT(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -5.20

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0RoaQ6P0LsUKj6gSic2eOKMM
Content-Type: multipart/mixed; boundary="------------SDmaiJvjjM1N1jzUKp0iIdCS";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <13f6ce53-fdb9-469c-a2fd-a93280d55c97@suse.com>
Subject: Re: [PATCH v2 11/17] xen: Add capabilities to get_domain_state
References: <20250716211504.291104-1-jason.andryuk@amd.com>
 <20250716211504.291104-12-jason.andryuk@amd.com>
In-Reply-To: <20250716211504.291104-12-jason.andryuk@amd.com>
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

--------------SDmaiJvjjM1N1jzUKp0iIdCS
Content-Type: multipart/mixed; boundary="------------x08ot79ydE3NjWZ1GiemUt81"

--------------x08ot79ydE3NjWZ1GiemUt81
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTYuMDcuMjUgMjM6MTQsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IEV4cG9zZSBhIGRv
bWFpbidzIGNhcGFiaWxpdGllcyAtIGNvbnRyb2wsIGhhcmR3YXJlIG9yIHhlbnN0b3JlIC0g
dGhyb3VnaA0KPiBzdGFibGUgZ2V0IGRvbWFpbiBzdGF0ZSBoeXBlcmNhbGwuDQo+IA0KPiBU
aGUgeGVuc3RvcmUgZG9tYWluIGNhbiB1c2UgdGhpcyBpbmZvcm1hdGlvbiB0byBhc3NpZ24g
YXBwcm9wcmlhdGUNCj4gcGVybWlzc2lvbnMgb24gY29ubmVjdGlvbnMuDQo+IA0KPiBSZXB1
cnBvc2UgdGhlIDE2Yml0IHBhZCBmaWVsZCBmb3IgdGhpcyBwdXJwb3NlLg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogSmFzb24gQW5kcnl1ayA8amFzb24uYW5kcnl1a0BhbWQuY29tPg0KPiAt
LS0NCj4gICB4ZW4vY29tbW9uL2RvbWFpbi5jICAgICAgICAgfCA4ICsrKysrKystDQo+ICAg
eGVuL2luY2x1ZGUvcHVibGljL2RvbWN0bC5oIHwgNyArKysrKy0tDQo+ICAgMiBmaWxlcyBj
aGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL3hlbi9jb21tb24vZG9tYWluLmMgYi94ZW4vY29tbW9uL2RvbWFpbi5jDQo+IGlu
ZGV4IGMzNDdkZTQzMzUuLjhiMDE1MWE4ZjcgMTAwNjQ0DQo+IC0tLSBhL3hlbi9jb21tb24v
ZG9tYWluLmMNCj4gKysrIGIveGVuL2NvbW1vbi9kb21haW4uYw0KPiBAQCAtMTk1LDYgKzE5
NSwxMiBAQCBzdGF0aWMgdm9pZCBzZXRfZG9tYWluX3N0YXRlX2luZm8oc3RydWN0IHhlbl9k
b21jdGxfZ2V0X2RvbWFpbl9zdGF0ZSAqaW5mbywNCj4gICAgICAgICAgIGluZm8tPnN0YXRl
IHw9IFhFTl9ET01DVExfR0VURE9NU1RBVEVfU1RBVEVfRFlJTkc7DQo+ICAgICAgIGlmICgg
ZC0+aXNfZHlpbmcgPT0gRE9NRFlJTkdfZGVhZCApDQo+ICAgICAgICAgICBpbmZvLT5zdGF0
ZSB8PSBYRU5fRE9NQ1RMX0dFVERPTVNUQVRFX1NUQVRFX0RFQUQ7DQo+ICsgICAgaWYgKCBp
c19jb250cm9sX2RvbWFpbihkKSApDQo+ICsgICAgICAgIGluZm8tPmNhcHMgfD0gWEVOX0RP
TUNUTF9HRVRET01TVEFURV9DQVBfQ09OVFJPTDsNCj4gKyAgICBpZiAoIGlzX2hhcmR3YXJl
X2RvbWFpbihkKSApDQo+ICsgICAgICAgIGluZm8tPmNhcHMgfD0gWEVOX0RPTUNUTF9HRVRE
T01TVEFURV9DQVBfSEFSRFdBUkU7DQo+ICsgICAgaWYgKCBpc194ZW5zdG9yZV9kb21haW4o
ZCkgKQ0KPiArICAgICAgICBpbmZvLT5jYXBzIHw9IFhFTl9ET01DVExfR0VURE9NU1RBVEVf
Q0FQX1hFTlNUT1JFOw0KPiAgICAgICBpbmZvLT51bmlxdWVfaWQgPSBkLT51bmlxdWVfaWQ7
DQo+ICAgfQ0KPiAgIA0KPiBAQCAtMjA1LDcgKzIxMSw3IEBAIGludCBnZXRfZG9tYWluX3N0
YXRlKHN0cnVjdCB4ZW5fZG9tY3RsX2dldF9kb21haW5fc3RhdGUgKmluZm8sIHN0cnVjdCBk
b21haW4gKmQsDQo+ICAgICAgIGludCByYyA9IC1FTk9FTlQ7DQo+ICAgICAgIHN0cnVjdCBk
b21haW4gKmhkbDsNCj4gICANCj4gLSAgICBpZiAoIGluZm8tPnBhZDAgfHwgaW5mby0+cGFk
MSApDQo+ICsgICAgaWYgKCBpbmZvLT5wYWQwICkNCj4gICAgICAgICAgIHJldHVybiAtRUlO
VkFMOw0KPiAgIA0KPiAgICAgICBpZiAoIGQgKQ0KPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1
ZGUvcHVibGljL2RvbWN0bC5oIGIveGVuL2luY2x1ZGUvcHVibGljL2RvbWN0bC5oDQo+IGlu
ZGV4IGYxZjZmOTZiYzIuLjg3OTM0M2IyMWQgMTAwNjQ0DQo+IC0tLSBhL3hlbi9pbmNsdWRl
L3B1YmxpYy9kb21jdGwuaA0KPiArKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvZG9tY3RsLmgN
Cj4gQEAgLTEyNjksOCArMTI2OSwxMSBAQCBzdHJ1Y3QgeGVuX2RvbWN0bF9nZXRfZG9tYWlu
X3N0YXRlIHsNCj4gICAjZGVmaW5lIFhFTl9ET01DVExfR0VURE9NU1RBVEVfU1RBVEVfU0hV
VERPV04gIDB4MDAwMiAgLyogU2h1dGRvd24gZmluaXNoZWQuICovDQo+ICAgI2RlZmluZSBY
RU5fRE9NQ1RMX0dFVERPTVNUQVRFX1NUQVRFX0RZSU5HICAgICAweDAwMDQgIC8qIERvbWFp
biBkeWluZy4gKi8NCj4gICAjZGVmaW5lIFhFTl9ET01DVExfR0VURE9NU1RBVEVfU1RBVEVf
REVBRCAgICAgIDB4MDAwOCAgLyogRG9tYWluIGRlYWQuICovDQo+IC0gICAgdWludDE2X3Qg
cGFkMDsgICAgICAgICAgIC8qIE11c3QgYmUgMCBvbiBpbnB1dCwgcmV0dXJuZWQgYXMgMC4g
Ki8NCj4gLSAgICB1aW50MzJfdCBwYWQxOyAgICAgICAgICAgLyogTXVzdCBiZSAwIG9uIGlu
cHV0LCByZXR1cm5lZCBhcyAwLiAqLw0KPiArICAgIHVpbnQxNl90IGNhcHM7ICAgICAgICAg
ICAvKiBNdXN0IGJlIDAgb24gaW5wdXQsIHJldHVybmVkIGFzIDAuICovDQoNCkknZCBkcm9w
IHRoZSAicmV0dXJuZWQgYXMgMCIgaW4gdGhlIGNvbW1lbnQuIDotKQ0KDQpXaXRoIHRoYXQg
Zml4ZWQ6DQoNClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+
DQoNCg0KSnVlcmdlbg0K
--------------x08ot79ydE3NjWZ1GiemUt81
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------x08ot79ydE3NjWZ1GiemUt81--

--------------SDmaiJvjjM1N1jzUKp0iIdCS--

--------------0RoaQ6P0LsUKj6gSic2eOKMM
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmh4lxwFAwAAAAAACgkQsN6d1ii/Ey+7
uAf/ePrMa0X10+trDoZ3MJ1J6e8v/D4TjlrZgCgIMLKcjEC+GTdjSsRHHc7JIT36cc3MFnldt+Yt
Mvh6nOdDwAqsUzSFAN6FRQG6e3TPsEVESNppwIfY2+mvBOxMUWmx/5PM0MJumiRgRD4G/Tub8ZPj
2xdW2JkwEg6D2NjCE8mS4HKb4c5DSdbLNfL3WkWAQgFLWi7r0U6R1LdpWlaTbBnnWdvkq2VSN6nc
XmCTnaqm9qMpmwGlrsiYmFSxW1dahCuf5wTM/E9DvcT/VHqkBvkcZdMB/alByjnl+BEdoY8Bak7p
y4E1vHpU423w8VkKNPPwuY4nZq7PyCACyTQV1SFrRg==
=vi+y
-----END PGP SIGNATURE-----

--------------0RoaQ6P0LsUKj6gSic2eOKMM--

