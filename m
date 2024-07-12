Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B997892FBB8
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2024 15:48:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758059.1167296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSGc0-0007eN-N5; Fri, 12 Jul 2024 13:47:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758059.1167296; Fri, 12 Jul 2024 13:47:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSGc0-0007br-Jj; Fri, 12 Jul 2024 13:47:00 +0000
Received: by outflank-mailman (input) for mailman id 758059;
 Fri, 12 Jul 2024 13:46:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U2Du=OM=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sSGbz-0007bl-HI
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2024 13:46:59 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34f37aba-4055-11ef-bbfb-fd08da9f4363;
 Fri, 12 Jul 2024 15:46:57 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3EEA721981;
 Fri, 12 Jul 2024 13:46:57 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 116EC13686;
 Fri, 12 Jul 2024 13:46:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id NvJxAtEzkWZqbAAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 12 Jul 2024 13:46:57 +0000
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
X-Inumbo-ID: 34f37aba-4055-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1720792017; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Iy67gqxoYNK1/e5asarwYcr6DDIYf88/YjqwDl5q+ps=;
	b=H3oSbTFBANlH48ezgVcqnLsl04NRTQwvMHPLZwobNdRJY8CPDiXF1JzTcIRiD9hd4bneUy
	MzsXdtquof0Fwpby5VmQt8Kmvmon7b3PfiDgvR2oc+tlNRjXuWkr5pLZe0ONbXx4w3Uich
	L+Y61s6mK8mIcVtIAFwtHIoxyMYLAM0=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1720792017; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Iy67gqxoYNK1/e5asarwYcr6DDIYf88/YjqwDl5q+ps=;
	b=H3oSbTFBANlH48ezgVcqnLsl04NRTQwvMHPLZwobNdRJY8CPDiXF1JzTcIRiD9hd4bneUy
	MzsXdtquof0Fwpby5VmQt8Kmvmon7b3PfiDgvR2oc+tlNRjXuWkr5pLZe0ONbXx4w3Uich
	L+Y61s6mK8mIcVtIAFwtHIoxyMYLAM0=
Message-ID: <d0da7689-514e-4dc8-ae2c-3f2e5eeefbac@suse.com>
Date: Fri, 12 Jul 2024 15:46:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Problems in PV dom0 on recent x86 hardware
From: Juergen Gross <jgross@suse.com>
To: Jason Andryuk <jason.andryuk@amd.com>, Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <baade0a7-e204-4743-bda1-282df74e5f89@suse.com>
 <d379a900-fd1c-42ca-bc31-071f7fd80d0b@suse.com>
 <ZousjqOAFJgO6681@macbook.local>
 <6101999a-6f88-46cb-b850-af43b364f299@suse.com>
 <7a0a8b1c-69e0-435d-b4f4-7a9d784eab29@amd.com>
 <1f96a355-b0d2-4cc9-a2ae-6d3ab750136d@suse.com>
 <89d7b5a6-e971-4cd0-85df-0dd599d0ba1b@suse.com>
 <7d207d6c-d025-4fbb-8649-9c42224097f5@suse.com>
 <88db3cb6-2b7e-48b2-9bf4-d871067325a0@suse.com>
 <3d6d35ea-5044-4249-a277-0e5aa31ed888@amd.com>
 <a6144f89-449a-4d2f-927b-a9bbdfbed56b@suse.com>
Content-Language: en-US
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
In-Reply-To: <a6144f89-449a-4d2f-927b-a9bbdfbed56b@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------wIFdkbNoRQ6pKUrKwYJEMDUT"
X-Spamd-Result: default: False [-6.15 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SIGNED_PGP(-2.00)[];
	NEURAL_HAM_LONG(-0.96)[-0.956];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	XM_UA_NO_VERSION(0.01)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[opensuse.org:url];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	HAS_ATTACHMENT(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -6.15
X-Spam-Level: 

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------wIFdkbNoRQ6pKUrKwYJEMDUT
Content-Type: multipart/mixed; boundary="------------HgeDwwvxjhJyZNj0egN0uozM";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jason Andryuk <jason.andryuk@amd.com>, Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Message-ID: <d0da7689-514e-4dc8-ae2c-3f2e5eeefbac@suse.com>
Subject: Re: Problems in PV dom0 on recent x86 hardware
References: <baade0a7-e204-4743-bda1-282df74e5f89@suse.com>
 <d379a900-fd1c-42ca-bc31-071f7fd80d0b@suse.com>
 <ZousjqOAFJgO6681@macbook.local>
 <6101999a-6f88-46cb-b850-af43b364f299@suse.com>
 <7a0a8b1c-69e0-435d-b4f4-7a9d784eab29@amd.com>
 <1f96a355-b0d2-4cc9-a2ae-6d3ab750136d@suse.com>
 <89d7b5a6-e971-4cd0-85df-0dd599d0ba1b@suse.com>
 <7d207d6c-d025-4fbb-8649-9c42224097f5@suse.com>
 <88db3cb6-2b7e-48b2-9bf4-d871067325a0@suse.com>
 <3d6d35ea-5044-4249-a277-0e5aa31ed888@amd.com>
 <a6144f89-449a-4d2f-927b-a9bbdfbed56b@suse.com>
In-Reply-To: <a6144f89-449a-4d2f-927b-a9bbdfbed56b@suse.com>
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

--------------HgeDwwvxjhJyZNj0egN0uozM
Content-Type: multipart/mixed; boundary="------------NTbrZFOxK9wOmQTG0mEdbA1C"

--------------NTbrZFOxK9wOmQTG0mEdbA1C
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTIuMDcuMjQgMTI6MzUsIErDvHJnZW4gR3Jvw58gd3JvdGU6DQo+IE9uIDA5LjA3LjI0
IDE1OjA4LCBKYXNvbiBBbmRyeXVrIHdyb3RlOg0KPj4gT24gMjAyNC0wNy0wOSAwNjo1Niwg
SsO8cmdlbiBHcm/DnyB3cm90ZToNCj4+PiBPbiAwOS4wNy4yNCAwOTowMSwgSmFuIEJldWxp
Y2ggd3JvdGU6DQo+Pj4+IE9uIDA5LjA3LjIwMjQgMDg6MzYsIErDvHJnZW4gR3Jvw58gd3Jv
dGU6DQo+Pj4+PiBPbiAwOS4wNy4yNCAwODoyNCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+
Pj4gT24gMDguMDcuMjAyNCAyMzozMCwgSmFzb24gQW5kcnl1ayB3cm90ZToNCj4+Pj4+Pj4g
wqDCoCBGcm9tIHRoZSBiYWNrdHJhY2UsIGl0IGxvb2tzIGxpa2UgdGhlIGltbWVkaWF0ZSBj
YXNlIGlzIGp1c3QgdHJ5aW5nIHRvDQo+Pj4+Pj4+IHJlYWQgYSA0LWJ5dGUgdmVyc2lvbjoN
Cj4+Pj4+Pj4NCj4+Pj4+Pj4gwqDCoCA+Pj4+IFvCoMKgIDQ0LjU3NTU0MV3CoCB1Y3NpX2Fj
cGlfZHNtKzB4NTMvMHg4MA0KPj4+Pj4+PiDCoMKgID4+Pj4gW8KgwqAgNDQuNTc1NTQ2XcKg
IHVjc2lfYWNwaV9yZWFkKzB4MmUvMHg2MA0KPj4+Pj4+PiDCoMKgID4+Pj4gW8KgwqAgNDQu
NTc1NTUwXcKgIHVjc2lfcmVnaXN0ZXIrMHgyNC8weGEwDQo+Pj4+Pj4+IMKgwqAgPj4+PiBb
wqDCoCA0NC41NzU1NTVdwqAgdWNzaV9hY3BpX3Byb2JlKzB4MTYyLzB4MWUzDQo+Pj4+Pj4+
DQo+Pj4+Pj4+IGludCB1Y3NpX3JlZ2lzdGVyKHN0cnVjdCB1Y3NpICp1Y3NpKQ0KPj4+Pj4+
PiB7DQo+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIGludCByZXQ7DQo+Pj4+Pj4+DQo+
Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldCA9IHVjc2ktPm9wcy0+cmVhZCh1Y3Np
LCBVQ1NJX1ZFUlNJT04sICZ1Y3NpLT52ZXJzaW9uLA0KPj4+Pj4+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNp
emVvZih1Y3NpLT52ZXJzaW9uKSk7DQo+Pj4+Pj4+DQo+Pj4+Pj4+IC0+cmVhZCBiZWluZyB1
Y3NpX2FjcGlfcmVhZCgpDQo+Pj4+Pj4+DQo+Pj4+Pj4+IEhvd2V2ZXIsIHRoZSBkcml2ZXIg
YWxzbyBhcHBlYXJzIHdyaXRlIHRvIGFkamFjZW50IGFkZHJlc3Nlcy4NCj4+Pj4+Pg0KPj4+
Pj4+IFRoZXJlIGFyZSBhbHNvIGNvcnJlc3BvbmRpbmcgd3JpdGUgZnVuY3Rpb25zIGluIHRo
ZSBkcml2ZXIsIHllcywgYnV0DQo+Pj4+Pj4gdWNzaV9hY3BpX2FzeW5jX3dyaXRlKCkgKHVz
ZWQgZGlyZWN0bHkgb3IgaW5kaXJlY3RseSkgc2ltaWxhcmx5IGNhbGxzDQo+Pj4+Pj4gdWNz
aV9hY3BpX2RzbSgpLCB3aGljaCB3aXJlcyB0aHJvdWdoIHRvIGFjcGlfZXZhbHVhdGVfZHNt
KCkuIFRoYXQncw0KPj4+Pj4+IEFDUEkgb2JqZWN0IGV2YWx1YXRpb24sIHdoaWNoIGlzbid0
IG9idmlvdXMgd2l0aG91dCBzZWVpbmcgdGhlDQo+Pj4+Pj4gaW52b2x2ZWQgQU1MIHdoZXRo
ZXIgaXQgbWlnaHQgd3JpdGUgc2FpZCBtZW1vcnkgcmVnaW9uLg0KPj4+Pj4NCj4+Pj4+IEkg
Z3Vlc3MgYW4gQUNQSSBkdW1wIHdvdWxkIGhlbHAgaGVyZT8NCj4+Pj4NCj4+Pj4gUGVyaGFw
cywgeWVzLg0KPj4+DQo+Pj4gSXQgaXMgYXZhaWxhYmxlIGluIHRoZSBidWcgcmVwb3J0Og0K
Pj4+DQo+Pj4gaHR0cHM6Ly9idWd6aWxsYS5vcGVuc3VzZS5vcmcvc2hvd19idWcuY2dpP2lk
PTEyMjczMDENCj4+DQo+PiBBZnRlciBhY3BpeHRyYWN0ICYgaWFzbDoNCj4+DQo+PiAkIGdy
ZXAgLWlyIEZFRUMgKg0KPj4gZHNkdC5kc2w6wqDCoCBPcGVyYXRpb25SZWdpb24gKEVDTU0s
IFN5c3RlbU1lbW9yeSwgMHhGRUVDMjAwMCwgMHgwMTAwKQ0KPj4gc3NkdDE2LmRzbDogT3Bl
cmF0aW9uUmVnaW9uIChTVVNDLCBTeXN0ZW1NZW1vcnksIDB4RkVFQzIxMDAsIDB4MzApDQo+
Pg0KPj4NCj4+IGZyb20gdGhlIERTRFQ6DQo+PiDCoMKgwqDCoCBTY29wZSAoXF9TQi5QQ0kw
LkxQQzAuRUMwKQ0KPj4gwqDCoMKgwqAgew0KPj4gwqDCoMKgwqDCoMKgwqDCoCBPcGVyYXRp
b25SZWdpb24gKEVDTU0sIFN5c3RlbU1lbW9yeSwgMHhGRUVDMjAwMCwgMHgwMTAwKQ0KPj4g
wqDCoMKgwqDCoMKgwqDCoCBGaWVsZCAoRUNNTSwgQW55QWNjLCBMb2NrLCBQcmVzZXJ2ZSkN
Cj4+IMKgwqDCoMKgwqDCoMKgwqAgew0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFRX
QlQswqDCoCAyMDQ4DQo+PiDCoMKgwqDCoMKgwqDCoMKgIH0NCj4+DQo+PiDCoMKgwqDCoMKg
wqDCoMKgIE5hbWUgKEJUQkYsIEJ1ZmZlciAoMHgwMTAwKQ0KPj4gwqDCoMKgwqDCoMKgwqDC
oCB7DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweDAwwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAvLyAuDQo+PiDCoMKgwqDCoMKgwqDCoMKgIH0pDQo+PiDC
oMKgwqDCoMKgwqDCoMKgIE1ldGhvZCAoQlRJRiwgMCwgTm90U2VyaWFsaXplZCkNCj4+IMKg
wqDCoMKgwqDCoMKgwqAgew0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEJUQkYgPSBU
V0JUIC8qIFxfU0JfLlBDSTAuTFBDMC5FQzBfLlRXQlQgKi8NCj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBSZXR1cm4gKEJUQkYpIC8qIFxfU0JfLlBDSTAuTFBDMC5FQzBfLkJUQkYg
Ki8NCj4+IMKgwqDCoMKgwqDCoMKgwqAgfQ0KPj4gwqDCoMKgwqAgfQ0KPj4NCj4+IMKgRnJv
bSBTU0RUMTY6DQo+PiBEZWZpbml0aW9uQmxvY2sgKCIiLCAiU1NEVCIsIDIsICJMRU5PVk8i
LCAiVXNiQ1RhYmwiLCAweDAwMDAwMDAxKQ0KPj4gew0KPj4gwqDCoMKgwqAgRXh0ZXJuYWwg
KF9TQl8uUENJMC5MUEMwLkVDMF8sIERldmljZU9iaikNCj4+DQo+PiDCoMKgwqDCoCBTY29w
ZSAoXF9TQikNCj4+IMKgwqDCoMKgIHsNCj4+IMKgwqDCoMKgwqDCoMKgwqAgT3BlcmF0aW9u
UmVnaW9uIChTVVNDLCBTeXN0ZW1NZW1vcnksIDB4RkVFQzIxMDAsIDB4MzApDQo+PiDCoMKg
wqDCoMKgwqDCoMKgIEZpZWxkIChTVVNDLCBCeXRlQWNjLCBMb2NrLCBQcmVzZXJ2ZSkNCj4+
IMKgwqDCoMKgwqDCoMKgwqAgew0KPj4NCj4+DQo+PiBUaGlzIGVtYmVkZGVkIGNvbnRyb2xs
ZXIgKD8pIHNlZW1zIHRvIGxpdmUgYXQgMHhmZWVjMnh4eC4NCj4gDQo+IFdoYXQgaXMgdGhl
IHRha2Vhd2F5IGZyb20gdGhhdD8NCj4gDQo+IElzIHRoaXMgYSBmaXJtd2FyZSBidWcgKGlm
IHllcywgcG9pbnRlcnMgdG8gYSBzcGVjaWZpY2F0aW9uIHNheWluZyB0aGF0DQo+IHRoaXMg
aXMgYW4gaWxsZWdhbCBjb25maWd1cmF0aW9uIHdvdWxkIGJlIG5pY2UpLCBvciBkbyB3ZSBu
ZWVkIGEgd2F5IHRvDQo+IG1hcCB0aGlzIHBhZ2UgZnJvbSBkb20wPw0KDQpJJ3ZlIGZvdW5k
IHRoZSBmb2xsb3dpbmcgaW4gdGhlIEFNRCBJT01NVSBzcGVjIFsxXToNCg0KICAgUmVjZWl2
ZWQgRE1BIHJlcXVlc3RzIHdpdGhvdXQgUEFTSUQgaW4gdGhlIDB4RkVFeF94eHh4IGFkZHJl
c3MgcmFuZ2UgYXJlDQogICB0cmVhdGVkIGFzIE1TSSBpbnRlcnJ1cHRzIGFuZCBhcmUgcHJv
Y2Vzc2VkIHVzaW5nIGludGVycnVwdCByZW1hcHBpbmcgcmF0aGVyDQogICB0aGFuIGFkZHJl
c3MgdHJhbnNsYXRpb24uDQoNClRvIG1lIHRoaXMgc291bmRzIGFzIGlmIHRoZXJlIHdvdWxk
bid0IGJlIGEgbWFqb3IgcmlzayBsZXR0aW5nIGRvbTAgbWFwDQpwaHlzaWNhbCBhZGRyZXNz
ZXMgaW4gdGhpcyBhcmVhLCBhcyBsb25nIGFzICJub3JtYWwiIEkvT3MgdG8gdGhpcyBhcmVh
IHdvdWxkDQpyZXN1bHQgaW4gRE1BIHJlcXVlc3RzIHdpdGggYSBQQVNJRC4gT1RPSCBJJ20g
bm90IGZhbWlsaWFyIHdpdGggWGVuIElPTU1VDQpoYW5kbGluZywgc28gSSBtaWdodCBiZSBj
b21wbGV0ZWx5IHdyb25nLg0KDQpBbm90aGVyIHF1ZXN0aW9uIHdvdWxkIGJlIHdoZXRoZXIg
YSBkZXZpY2UgaGF2aW5nIHJlc291cmNlcyBpbiB0aGlzIGFyZWEgY2FuDQpldmVuIHdvcmsg
dGhyb3VnaCBhbiBJT01NVS4NCg0KDQpKdWVyZ2VuDQoNClsxXTogDQpodHRwczovL3d3dy5h
bWQuY29tL2NvbnRlbnQvZGFtL2FtZC9lbi9kb2N1bWVudHMvcHJvY2Vzc29yLXRlY2gtZG9j
cy9zcGVjaWZpY2F0aW9ucy80ODg4Ml9JT01NVS5wZGYNCg==
--------------NTbrZFOxK9wOmQTG0mEdbA1C
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------NTbrZFOxK9wOmQTG0mEdbA1C--

--------------HgeDwwvxjhJyZNj0egN0uozM--

--------------wIFdkbNoRQ6pKUrKwYJEMDUT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmaRM9AFAwAAAAAACgkQsN6d1ii/Ey9e
Cwf/YDPR4vSxAWg3VCOaK3Nu5FYdRzM66436+lH2h+0JSIaxI5XichGgGguiR8t9/Ir2OWF7fLoc
NZQKFn96JfZop3jlDGz+Q1wog+MjQtv1p7ZrrorIogr7TUa4ap9QE0wWjXrQPJh3e0Sqf5Rq6AB3
w9KnA3V2PiAa7PBb0FPKLC5vV4ONkJn2kDYpuSjF2ZEdWYfIM2kEwOgaOblITpJxvAb5Nn07fApJ
Ab/NQqt+mBFTq64ALtmEuuTQNGp8BjtJIFiMGyOoaRQFsa0SRofIF1HC24q/4VtqiUKC7jaL2KMH
tQF1jcURGLZcQrqtvVvM1YWX9OGasmFrOCn/k+TkVA==
=QVWV
-----END PGP SIGNATURE-----

--------------wIFdkbNoRQ6pKUrKwYJEMDUT--

