Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3261A36E9F
	for <lists+xen-devel@lfdr.de>; Sat, 15 Feb 2025 14:46:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.889430.1298552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjIVG-0003gy-FT; Sat, 15 Feb 2025 13:46:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 889430.1298552; Sat, 15 Feb 2025 13:46:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjIVG-0003f0-Br; Sat, 15 Feb 2025 13:46:42 +0000
Received: by outflank-mailman (input) for mailman id 889430;
 Sat, 15 Feb 2025 13:46:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KUQd=VG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tjIVE-0003eu-M6
 for xen-devel@lists.xenproject.org; Sat, 15 Feb 2025 13:46:40 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 479e797c-eba3-11ef-9896-31a8f345e629;
 Sat, 15 Feb 2025 14:46:38 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0FC622118C;
 Sat, 15 Feb 2025 13:46:38 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A01F513782;
 Sat, 15 Feb 2025 13:46:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id qycwJb2asGf5HQAAD6G6ig
 (envelope-from <jgross@suse.com>); Sat, 15 Feb 2025 13:46:37 +0000
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
X-Inumbo-ID: 479e797c-eba3-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1739627198; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=NC5+p2bEN2VolRwMZnHMPpt0qQC6fYVVHs8i43ISbQg=;
	b=JXsN+CXGqXQBioBTqEMFEACITCGvwGT4w9Sjln/9HwBqsHYQ9MoR5/b7gS6doZjVEfp1pj
	SoGU1SY5FhJZhvW+X//8noaGypUnmQmlTx94isXeS7qqu7gHuoQobd8mVRkiwszYqQFP1K
	6ipR61aI5/Jjf5vf5hJuvBAtI9g6Sf8=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1739627198; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=NC5+p2bEN2VolRwMZnHMPpt0qQC6fYVVHs8i43ISbQg=;
	b=JXsN+CXGqXQBioBTqEMFEACITCGvwGT4w9Sjln/9HwBqsHYQ9MoR5/b7gS6doZjVEfp1pj
	SoGU1SY5FhJZhvW+X//8noaGypUnmQmlTx94isXeS7qqu7gHuoQobd8mVRkiwszYqQFP1K
	6ipR61aI5/Jjf5vf5hJuvBAtI9g6Sf8=
Message-ID: <a7381518-53eb-4e1b-96ed-b5832d515eb0@suse.com>
Date: Sat, 15 Feb 2025 14:46:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ARM32 UBSAN failure in credit2
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>
References: <9c2c6099-9399-4607-9533-4d2f6aa1afc8@citrix.com>
 <9a418f50-3635-4cc6-8d62-037a270cbf40@suse.com>
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
In-Reply-To: <9a418f50-3635-4cc6-8d62-037a270cbf40@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------8NSoToqTaE9XKKO07xRsSmXt"
X-Spam-Level: 
X-Spamd-Result: default: False [-6.20 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SIGNED_PGP(-2.00)[];
	NEURAL_HAM_LONG(-1.00)[-0.999];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	NEURAL_HAM_SHORT(-0.20)[-0.995];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,imap1.dmz-prg2.suse.org:helo];
	TO_DN_ALL(0.00)[];
	HAS_ATTACHMENT(0.00)[]
X-Spam-Score: -6.20
X-Spam-Flag: NO

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------8NSoToqTaE9XKKO07xRsSmXt
Content-Type: multipart/mixed; boundary="------------P6nKLKEuFMcj8HAejUhbiekC";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>
Message-ID: <a7381518-53eb-4e1b-96ed-b5832d515eb0@suse.com>
Subject: Re: ARM32 UBSAN failure in credit2
References: <9c2c6099-9399-4607-9533-4d2f6aa1afc8@citrix.com>
 <9a418f50-3635-4cc6-8d62-037a270cbf40@suse.com>
In-Reply-To: <9a418f50-3635-4cc6-8d62-037a270cbf40@suse.com>
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

--------------P6nKLKEuFMcj8HAejUhbiekC
Content-Type: multipart/mixed; boundary="------------vUvFAMwFSrWEprB6X5NKq3ax"

--------------vUvFAMwFSrWEprB6X5NKq3ax
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTUuMDIuMjUgMTI6MTQsIErDvHJnZW4gR3Jvw58gd3JvdGU6DQo+IE9uIDE1LjAyLjI1
IDAwOjM2LCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPj4gVGhpcyBpcyBuYXN0eS4NCj4+DQo+
PiBodHRwczovL2dpdGxhYi5jb20veGVuLXByb2plY3QvcGVvcGxlL2FuZHloaHAveGVuLy0v
am9icy85MTM3MDA4MjE1DQo+Pg0KPj4gV2hlbiBwcmVwcm9jZXNzZWQsIHdlIGdldDoNCj4+
DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zY2hlZC9jcmVkaXQyLmMgYi94ZW4vY29t
bW9uL3NjaGVkL2NyZWRpdDIuYw0KPj4gaW5kZXggMGE4M2YyMzcyNTlmLi42YjhkMzY2MDI0
MGEgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vY29tbW9uL3NjaGVkL2NyZWRpdDIuYw0KPj4gKysr
IGIveGVuL2NvbW1vbi9zY2hlZC9jcmVkaXQyLmMNCj4+IEBAIC05NTgsNyArOTU4LDI4IEBA
IGNwdV9hZGRfdG9fcnVucXVldWUoY29uc3Qgc3RydWN0IHNjaGVkdWxlciAqb3BzLA0KPj4g
dW5zaWduZWQgaW50IGNwdSkNCj4+IMKgwqDCoMKgwqAgd3JpdGVfbG9ja19pcnFzYXZlKCZw
cnYtPmxvY2ssIGZsYWdzKTsNCj4+IMKgwqDCoMKgwqAgcnFkX2lucyA9ICZwcnYtPnJxbDsN
Cj4+ICsNCj4+ICsjaWYgMA0KPj4gwqDCoMKgwqDCoCBsaXN0X2Zvcl9lYWNoX2VudHJ5ICgg
cnFkLCAmcHJ2LT5ycWwsIHJxbCApDQo+PiArI2Vsc2UNCj4+ICvCoMKgwqAgZm9yICggKHJx
ZCkgPSAoew0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0eXBlb2YoKCh0
eXBlb2YoKihycWQpKSAqKSgodm9pZCopMCkpLT5ycWwpICpfX21wdHIgPQ0KPj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICgoJnBydi0+cnFsKS0+bmV4dCk7
DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICh0eXBlb2YoKihycWQpKSAq
KQ0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICgoY2hhciAq
KV9fbXB0ciAtDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBfX2J1aWx0aW5fb2Zmc2V0b2YodHlwZW9mKCoocnFkKSkscnFsKSApOw0KPj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfSk7DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgICYocnFkKS0+
cnFsICE9IC8vIDwtLSBwcm9ibGVtIGV4cHJlc3Npb24NCj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAoJnBydi0+cnFsKTsNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqAgKHJxZCkg
PSAoew0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdHlwZW9mKCgo
dHlwZW9mKCoocnFkKSkgKikoKHZvaWQqKTApKS0+cnFsKSAqX19tcHRyID0NCj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKChycWQpLT5ycWwubmV4
dCk7DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAodHlwZW9mKCoo
cnFkKSkgKikNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgKChjaGFyICopX19tcHRyIC0NCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBfX2J1aWx0aW5fb2Zmc2V0b2YodHlwZW9mKCoocnFkKSkscnFs
KSApOw0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0pDQo+PiArwqDCoMKgwqDC
oMKgwqAgKQ0KPj4gKyNlbmRpZg0KPj4gwqDCoMKgwqDCoCB7DQo+PiDCoMKgwqDCoMKgwqDC
oMKgwqAgLyogUmVtZW1iZXIgZmlyc3QgdW51c2VkIHF1ZXVlIGluZGV4LiAqLw0KPj4gwqDC
oMKgwqDCoMKgwqDCoMKgIGlmICggIXJxaV91bnVzZWQgJiYgcnFkLT5pZCA+IHJxaSApDQo+
Pg0KPj4NCj4+IFRoZSBhbGlnbm1lbnQgb2YgY3NjaGVkMl9ydW5xdWV1ZV9kYXRhIGlzIDgs
IHdoaWxlIGNzY2hlZDJfcHJpdmF0ZSBpcyA0Lg0KPj4NCj4+IHByaXYncyBsaXN0X2hlYWQg
Zm9yIHJxbCBpcyBhdCArMjggKCsweDFjKSwgYW5kIGxpc3RfZm9yX2VhY2hfZW50cnkoKQ0K
Pj4gcGVyZm9ybXMgYSBidWdnaWx5LXR5cGVkIGNvbnRhaW5lcl9vZigpLCB0cmVhdGluZyBh
IGNzY2hlZDJfcHJpdmF0ZSBhcw0KPj4gaWYgaXQgd2VyZSBjc2NoZWQyX3J1bnF1ZXVlX2Rh
dGEuDQo+IA0KPiBObywgSSBkb24ndCB0aGluayBzby4gSXQganVzdCBjb21wYXJlcyB0aGUg
YWRkcmVzc2VzIG9mIDIgc3RydWN0IGxpc3RfaGVhZC4NCj4gMSBpbiBjc2NoZWQyX3J1bnF1
ZXVlX2RhdGEgYW5kIDEgaW4gY3NjaGVkMl9wcml2YXRlLg0KPiANCj4+IEl0IGZ1bmN0aW9u
cyBiZWNhdXNlIGl0J3Mgb25seSBhbiBhZGRyZXNzIGVxdWFsaXR5IGNoZWNrLCBidXQgaXQn
cyBhbHNvDQo+PiB3aHkgVUJTQU4gb2JqZWN0cy4NCj4gDQo+IHN0cnVjdCBsaXN0X2hlYWQg
c2hvdWxkIHJlcXVpcmUgb25seSA0IGJ5dGUgYWxpZ25tZW50LCBzbyBJIGRvbid0IHNlZSB3
aHkNCj4gdGhpcyB3b3VsZCB0cmlnZ2VyIFVCU0FOLiBDb3VsZCBpdCBiZSB0aGF0IFVCU0FO
IGhhcyBhIGJ1ZyBoZXJlPw0KDQpBaCwgbWVhbndoaWxlIEkndmUgZ290IGl0Lg0KDQpJIHRo
aW5rIHdlIHdhbnQgc29tZXRoaW5nIGxpa2U6DQoNCiNkZWZpbmUgbGlzdF9mb3JfZWFjaF9l
bnRyeShwb3MsIGhlYWQsIG1lbWJlcikgICAgICAgICAgICAgICAgICAgICAgICAgIFwNCiAg
ICAgZm9yICgocG9zKSA9IGxpc3RfZW1wdHkoaGVhZCkgPyBOVUxMIDogbGlzdF9lbnRyeSgo
aGVhZCktPm5leHQsICAgICBcDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB0eXBlb2YoKihwb3MpKSwgbWVtYmVyKTsgXA0KICAgICAgICAgIHBv
czsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFwNCiAgICAgICAgICAocG9zKSA9IGxpc3RfaXNfbGFzdCgocG9zKS0+bWVtYmVy
KSA/IE5VTEwgOiAgICAgICAgICAgICAgICAgICBcDQogICAgICAgICAgICAgICAgICBsaXN0
X2VudHJ5KChwb3MpLT5tZW1iZXIubmV4dCwgdHlwZW9mKCoocG9zKSksIG1lbWJlcikpDQoN
Cg0KSnVlcmdlbg0K
--------------vUvFAMwFSrWEprB6X5NKq3ax
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------vUvFAMwFSrWEprB6X5NKq3ax--

--------------P6nKLKEuFMcj8HAejUhbiekC--

--------------8NSoToqTaE9XKKO07xRsSmXt
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmewmr0FAwAAAAAACgkQsN6d1ii/Ey/4
Rwf+LlAuwWQ2B4YQ7PxDy+f2BJXaywDV+8kHsp/Bemw4GRY3AmZ5XY4FH27+B393oRBAxA4Y9cC7
u6PGBT7WOMXPe0JvrGVWBIvhUdzeuPGD/zTehRc0TgG7LIJbZ8RC8NQZRmCoh5ByD+ZDPOHBsM4X
leCtQH9GpwkuZxJoBMbuKSBZaHKXNMyMrAeItlz+qJHiTDpT1qlIvVPr5UaCf2UGbrBa5CJJmDyN
bH3/EVgVFDBQOuh1MVQ43Zx3rUbsSqQO8V5CX2kHr2IeAQY6SqOuq8UZzIeUZVh6vDNqzh0vv+0i
m+yWG1bWRJXY5OetfeR5ARbt544QfWaRmqlrYJ1dKQ==
=OeZ3
-----END PGP SIGNATURE-----

--------------8NSoToqTaE9XKKO07xRsSmXt--

