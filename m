Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB516AE9CC1
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jun 2025 13:43:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1026180.1401417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUl0x-0004ms-Gm; Thu, 26 Jun 2025 11:43:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1026180.1401417; Thu, 26 Jun 2025 11:43:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUl0x-0004kM-Cz; Thu, 26 Jun 2025 11:43:35 +0000
Received: by outflank-mailman (input) for mailman id 1026180;
 Thu, 26 Jun 2025 11:43:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zZyX=ZJ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uUl0w-0004kG-H8
 for xen-devel@lists.xenproject.org; Thu, 26 Jun 2025 11:43:34 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8fa0c34-5282-11f0-b894-0df219b8e170;
 Thu, 26 Jun 2025 13:43:32 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A78C71F441;
 Thu, 26 Jun 2025 11:43:30 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1FC2C13188;
 Thu, 26 Jun 2025 11:43:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id wsi3BWIyXWghdwAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 26 Jun 2025 11:43:30 +0000
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
X-Inumbo-ID: c8fa0c34-5282-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1750938210; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=U1PHGs6u5gXVgovDdK/sHcoSlnq8syJ5n85D6SsLAPI=;
	b=PWXFpEMw6f5dlhi6ZuUASem+C9HcQmSUfBROSn2uPQMzDgUuJ8t2SbndeoMbjD8pGrpgb3
	vSaOpBXYChq9dUVWTT5TUvDFsBlBHlGYZrve5diALL5niYKmPyt8pOMKrGycGnIqUMgtVq
	V94veLUU7VClcplI1ocY9ZFvTrMAkBQ=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=PWXFpEMw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1750938210; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=U1PHGs6u5gXVgovDdK/sHcoSlnq8syJ5n85D6SsLAPI=;
	b=PWXFpEMw6f5dlhi6ZuUASem+C9HcQmSUfBROSn2uPQMzDgUuJ8t2SbndeoMbjD8pGrpgb3
	vSaOpBXYChq9dUVWTT5TUvDFsBlBHlGYZrve5diALL5niYKmPyt8pOMKrGycGnIqUMgtVq
	V94veLUU7VClcplI1ocY9ZFvTrMAkBQ=
Message-ID: <7c5761b5-805c-4d56-ad8c-1746540423e4@suse.com>
Date: Thu, 26 Jun 2025 13:43:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/17] xen/riscv: introduce guest domain's VMID
 allocation and manegement
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <abbf1c30c485d4baae25d4c1fb26942f60015403.1749555949.git.oleksii.kurochko@gmail.com>
 <d747fd23-9ac3-49d2-8a5e-699290cef3f4@suse.com>
 <145f71c2-643e-4839-a2ae-0bc1f049db74@gmail.com>
 <80223fe3-7403-4026-9505-8826c318fabb@suse.com>
 <a692d449-4101-498e-a460-33e4b2fb7176@gmail.com>
 <f5c14ffa-6314-4534-a83e-4024b379755c@suse.com>
 <1a570c32-e207-47f5-9702-a752246328a9@gmail.com>
 <f4a20826-0949-4bf0-a8e8-eecd1428f739@suse.com>
 <264db0b0-43bf-4829-a5cc-ca696601349c@gmail.com>
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
In-Reply-To: <264db0b0-43bf-4829-a5cc-ca696601349c@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------K10vCUM7dVPJ1aOi9z7jRLXY"
X-Spamd-Result: default: False [-4.91 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[gmail.com,suse.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	HAS_ATTACHMENT(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:dkim,suse.com:mid]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: A78C71F441
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -4.91

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------K10vCUM7dVPJ1aOi9z7jRLXY
Content-Type: multipart/mixed; boundary="------------FzgV8efe0ptC8GC9tEE9uAEC";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-ID: <7c5761b5-805c-4d56-ad8c-1746540423e4@suse.com>
Subject: Re: [PATCH v2 03/17] xen/riscv: introduce guest domain's VMID
 allocation and manegement
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <abbf1c30c485d4baae25d4c1fb26942f60015403.1749555949.git.oleksii.kurochko@gmail.com>
 <d747fd23-9ac3-49d2-8a5e-699290cef3f4@suse.com>
 <145f71c2-643e-4839-a2ae-0bc1f049db74@gmail.com>
 <80223fe3-7403-4026-9505-8826c318fabb@suse.com>
 <a692d449-4101-498e-a460-33e4b2fb7176@gmail.com>
 <f5c14ffa-6314-4534-a83e-4024b379755c@suse.com>
 <1a570c32-e207-47f5-9702-a752246328a9@gmail.com>
 <f4a20826-0949-4bf0-a8e8-eecd1428f739@suse.com>
 <264db0b0-43bf-4829-a5cc-ca696601349c@gmail.com>
In-Reply-To: <264db0b0-43bf-4829-a5cc-ca696601349c@gmail.com>
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

--------------FzgV8efe0ptC8GC9tEE9uAEC
Content-Type: multipart/mixed; boundary="------------z0kEzZEukLClS4nK3Nm5EB00"

--------------z0kEzZEukLClS4nK3Nm5EB00
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjYuMDYuMjUgMTM6MzQsIE9sZWtzaWkgS3Vyb2Noa28gd3JvdGU6DQo+IA0KPiBPbiA2
LzI2LzI1IDEyOjQxIFBNLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+IE9uIDI2LjA2LjIwMjUg
MTI6MDUsIE9sZWtzaWkgS3Vyb2Noa28gd3JvdGU6DQo+Pj4gT24gNi8yNC8yNSA0OjAxIFBN
LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4gT24gMjQuMDYuMjAyNSAxNTo0NywgT2xla3Np
aSBLdXJvY2hrbyB3cm90ZToNCj4+Pj4+IE9uIDYvMjQvMjUgMTI6NDQgUE0sIEphbiBCZXVs
aWNoIHdyb3RlOg0KPj4+Pj4+IE9uIDI0LjA2LjIwMjUgMTE6NDYsIE9sZWtzaWkgS3Vyb2No
a28gd3JvdGU6DQo+Pj4+Pj4+IE9uIDYvMTgvMjUgNTo0NiBQTSwgSmFuIEJldWxpY2ggd3Jv
dGU6DQo+Pj4+Pj4+PiBPbiAxMC4wNi4yMDI1IDE1OjA1LCBPbGVrc2lpIEt1cm9jaGtvIHdy
b3RlOg0KPj4+Pj4+Pj4+IC0tLSAvZGV2L251bGwNCj4+Pj4+Pj4+PiArKysgYi94ZW4vYXJj
aC9yaXNjdi9wMm0uYw0KPj4+Pj4+Pj4+IEBAIC0wLDAgKzEsMTE1IEBADQo+Pj4+Pj4+Pj4g
KyNpbmNsdWRlIDx4ZW4vYml0b3BzLmg+DQo+Pj4+Pj4+Pj4gKyNpbmNsdWRlIDx4ZW4vbGli
Lmg+DQo+Pj4+Pj4+Pj4gKyNpbmNsdWRlIDx4ZW4vc2NoZWQuaD4NCj4+Pj4+Pj4+PiArI2lu
Y2x1ZGUgPHhlbi9zcGlubG9jay5oPg0KPj4+Pj4+Pj4+ICsjaW5jbHVkZSA8eGVuL3h2bWFs
bG9jLmg+DQo+Pj4+Pj4+Pj4gKw0KPj4+Pj4+Pj4+ICsjaW5jbHVkZSA8YXNtL3AybS5oPg0K
Pj4+Pj4+Pj4+ICsjaW5jbHVkZSA8YXNtL3NiaS5oPg0KPj4+Pj4+Pj4+ICsNCj4+Pj4+Pj4+
PiArc3RhdGljIHNwaW5sb2NrX3Qgdm1pZF9hbGxvY19sb2NrID0gU1BJTl9MT0NLX1VOTE9D
S0VEOw0KPj4+Pj4+Pj4+ICsNCj4+Pj4+Pj4+PiArLyoNCj4+Pj4+Pj4+PiArICogaGdhdHAn
cyBWTUlEIGZpZWxkIGlzIDcgb3IgMTQgYml0cy4gUlY2NCBtYXkgc3VwcG9ydCAxNC1iaXQg
Vk1JRC4NCj4+Pj4+Pj4+PiArICogVXNpbmcgYSBiaXRtYXAgaGVyZSBsaW1pdHMgdXMgdG8g
MTI3ICgyXjcgLSAxKSBvciAxNjM4MyAoMl4xNCAtIDEpDQo+Pj4+Pj4+Pj4gKyAqIGNvbmN1
cnJlbnQgZG9tYWlucy4NCj4+Pj4+Pj4+IFdoaWNoIGlzIHByZXR0eSBsaW1pdGluZyBlc3Bl
Y2lhbGx5IGluIHRoZSBSVjMyIGNhc2UuIEhlbmNlIHdoeSB3ZSBkb24ndA0KPj4+Pj4+Pj4g
YXNzaWduIGEgcGVybWFuZW50IElEIHRvIFZNcyBvbiB4ODYsIGJ1dCByYXRoZXIgbWFuYWdl
IElEcyBwZXItQ1BVIChub3RlOg0KPj4+Pj4+Pj4gbm90IHBlci12Q1BVKS4NCj4+Pj4+Pj4g
R29vZCBwb2ludC4NCj4+Pj4+Pj4NCj4+Pj4+Pj4gSSBkb24ndCBiZWxpZXZlIGFueW9uZSB3
aWxsIHVzZSBSVjMyLg0KPj4+Pj4+PiBGb3IgUlY2NCwgdGhlIGF2YWlsYWJsZSBJRCBzcGFj
ZSBzZWVtcyBzdWZmaWNpZW50bHkgbGFyZ2UuDQo+Pj4+Pj4+DQo+Pj4+Pj4+IEhvd2V2ZXIs
IGlmIGl0IHR1cm5zIG91dCB0aGF0IHRoZSB2YWx1ZSBpc24ndCBsYXJnZSBlbm91Z2ggZXZl
biBmb3IgUlY2NCwNCj4+Pj4+Pj4gSSBjYW4gcmV3b3JrIGl0IHRvIG1hbmFnZSBJRHMgcGVy
IHBoeXNpY2FsIENQVS4NCj4+Pj4+Pj4gV291bGRuJ3QgdGhhdCBhcHByb2FjaCByZXN1bHQg
aW4gbW9yZSBUTEIgZW50cmllcyBiZWluZyBmbHVzaGVkIGNvbXBhcmVkDQo+Pj4+Pj4+IHRv
IHBlci12Q1BVIGFsbG9jYXRpb24sIHBvdGVudGlhbGx5IGxlYWRpbmcgdG8gc2xpZ2h0bHkg
d29yc2UgcGVyZm9ybWFuY2U/DQo+Pj4+Pj4gRGVwZW5kcyBvbiB0aGUgY29uZGl0aW9uIGZv
ciB3aGVuIHRvIGZsdXNoLiBPZiBjb3Vyc2UgcGVyZm9ybWFuY2UgaXMNCj4+Pj4+PiB1bmF2
b2lkYWJseSBnb2luZyB0byBzdWZmZXIgaWYgeW91IGhhdmUgb25seSB2ZXJ5IGZldyBWTUlE
cyB0byB1c2UuDQo+Pj4+Pj4gTmV2ZXJ0aGVsZXNzLCBhcyBpbmRpY2F0ZWQgYmVmb3JlLCB0
aGUgbW9kZWwgdXNlZCBvbiB4ODYgbWF5IGJlIGENCj4+Pj4+PiBjYW5kaWRhdGUgdG8gdXNl
IGhlcmUsIHRvby4gU2VlIGh2bV9hc2lkX2hhbmRsZV92bWVudGVyKCkgZm9yIHRoZQ0KPj4+
Pj4+IGNvcmUgKGFuZCB2ZW5kb3ItaW5kZXBlbmRlbnQpIHBhcnQgb2YgaXQuDQo+Pj4+PiBJ
SVVDLCBzbyBiYXNpY2FsbHkgaXQgaXMganVzdCBhIHJvdW5kLXJvYmluIGFuZCB3aGVuIFZN
SURzIGFyZSByYW4gb3V0DQo+Pj4+PiB0aGVuIGp1c3QgZG8gZnVsbCBndWVzdCBUTEIgZmx1
c2ggYW5kIHN0YXJ0IHRvIHJlLXVzZSBWTUlEcyBmcm9tIHRoZSBzdGFydC4NCj4+Pj4+IEl0
IG1ha2VzIHNlbnNlIHRvIG1lLCBJJ2xsIGltcGxlbWVudCBzb21ldGhpbmcgc2ltaWxhci4g
KGFzIEknbSBub3QgcmVhbGx5DQo+Pj4+PiBzdXJlIHRoYXQgd2UgbmVlZGRhdGEtPmNvcmVf
YXNpZF9nZW5lcmF0aW9uLCBwcm9iYWJseSwgSSB3aWxsIHVuZGVyc3RhbmQgaXQgYmV0dGVy
IHdoZW4NCj4+Pj4+IHN0YXJ0IHRvIGltcGxlbWVudCBpdCkNCj4+Pj4gV2VsbC4gVGhlIGZl
d2VyIFZNSUQgYml0cyB5b3UgaGF2ZSB0aGUgbW9yZSBxdWlja2x5IHlvdSB3aWxsIG5lZWQg
YSBuZXcNCj4+Pj4gZ2VuZXJhdGlvbi4gQW5kIGtlZXAgdHJhY2sgb2YgdGhlIGdlbmVyYXRp
b24geW91J3JlIGF0IHlvdSBhbHNvIG5lZWQgdG8NCj4+Pj4gdHJhY2sgdGhlIHByZXNlbnQg
bnVtYmVyIHNvbWV3aGVyZS4NCj4+Pj4NCj4+Pj4+Pj4gV2hhdCBhYm91dCB0aGVuIHRvIGFs
bG9jYXRlIFZNSUQgcGVyLWRvbWFpbj8NCj4+Pj4+PiBUaGF0J3Mgd2hhdCB5b3UncmUgZG9p
bmcgcmlnaHQgbm93LCBpc24ndCBpdD8gQW5kIHRoYXQgZ2V0cyBwcm9ibGVtYXRpYyB3aGVu
DQo+Pj4+Pj4geW91IGhhdmUgb25seSB2ZXJ5IGZldyBiaXRzIGluIGhnYXRwLlZNSUQsIGFz
IG1lbnRpb25lZCBiZWxvdy4NCj4+Pj4+IFJpZ2h0LCBJIGp1c3QgcGhyYXNlZCBteSBxdWVz
dGlvbiBwb29ybHnigJRzb3JyeSBhYm91dCB0aGF0Lg0KPj4+Pj4NCj4+Pj4+IFdoYXQgSSBt
ZWFudCB0byBhc2sgaXM6IGRvZXMgdGhlIGFwcHJvYWNoIGRlc2NyaWJlZCBhYm92ZSBhY3R1
YWxseSBkZXBlbmQgb24gd2hldGhlcg0KPj4+Pj4gVk1JRHMgYXJlIGFsbG9jYXRlZCBwZXIt
ZG9tYWluIG9yIHBlci1wQ1BVPyBJdCBzZWVtcyB0aGF0IHRoZSBtYWluIGFkdmFudGFnZSBv
Zg0KPj4+Pj4gYWxsb2NhdGluZyBWTUlEcyBwZXItcENQVSBpcyBwb3RlbnRpYWxseSByZWR1
Y2luZyB0aGUgbnVtYmVyIG9mIFRMQiBmbHVzaGVzLA0KPj4+Pj4gc2luY2UgaXQncyBtb3Jl
IGxpa2VseSB0aGF0IGEgcGxhdGZvcm0gd2lsbCBoYXZlIG1vcmUgdGhhbnxWTUlEX01BWHwg
ZG9tYWlucyB0aGFuDQo+Pj4+PiB8Vk1JRF9NQVh8IHBoeXNpY2FsIENQVXPigJRhbSBJIHJp
Z2h0Pw0KPj4+PiBTZWVpbmcgdGhhdCB0aGVyZSBjYW4gYmUgc3lzdGVtcyB3aXRoIGh1bmRy
ZWRzIG9yIGV2ZW4gdGhvdXNhbmRzIG9mIENQVXMsDQo+Pj4+IEkgZG9uJ3QgdGhpbmsgSSBj
YW4gYWdyZWUgaGVyZS4gUGx1cyBwZXItcENQVSBhbGxvY2F0aW9uIHdvdWxkIHNpbWlsYXJs
eQ0KPj4+PiBnZXQgeW91IGluIHRyb3VibGUgd2hlbiB5b3UgaGF2ZSBvbmx5IHZlcnkgZmV3
IFZNSUQgYml0cy4NCj4+PiBCdXQgbm90IHNvIGZhc3QgYXMgaW4gY2FzZSBvZiBwZXItZG9t
YWluIGFsbG9jYXRpb24sIHJpZ2h0Pw0KPj4+DQo+Pj4gSSBtZWFuIHRoYXQgaWYgd2UgaGF2
ZSBvbmx5IDQgYml0cywgdGhlbiBpbiBjYXNlIG9mIHBlci1kb21haW4gYWxsb2NhdGlvbiB3
ZSB3aWxsDQo+Pj4gbmVlZCB0byBkbyBUTEIgZmx1c2ggKyBWTUlEIHJlLWFzc2lnbmluZyB3
aGVuIHdlIGhhdmUgbW9yZSB0aGVuIDE2IGRvbWFpbnMuDQo+Pj4NCj4+PiBCdXQgaW4gY2Fz
ZSBvZiBwZXItcENQVSBhbGxvY2F0aW9uIHdlIGNvdWxkIHJ1biAxNiBkb21haW5zIG9uIDEg
cENQVSBhbmQgYXQgdGhlIHNhbWUNCj4+PiB0aW1lIGluIG11bHRpcHJvY2Vzc29yIHN5c3Rl
bXMgd2UgaGF2ZSBtb3JlIHBDUFVzLCB3aGljaCB3aWxsIGFsbG93IHVzIHRvIHJ1biBtb3Jl
DQo+Pj4gZG9tYWlucyBhbmQgYXZvaWQgVExCIGZsdXNoZXMuDQo+Pj4gT24gb3RoZXIgaGFu
ZCwgaXQgaXMgbmVlZGVkIHRvIGNvbnNpZGVyIHRoYXQgaXQncyB1bmxpa2VseSB0aGF0IGEg
ZG9tYWluIHdpbGwgaGF2ZQ0KPj4+IG9ubHkgb25lIHZDUFUuIEFuZCBpdCBpcyBsaWtlbHkg
dGhhdCBhbW91bnQgb2YgdkNQVXMgd2lsbCBiZSBiaWdnZXIgdGhlbiBhbiBhbW91bnQNCj4+
PiBvZiBkb21haW5zLCBzbyB0byBoYXZlIGEgcm91bmQtcm9iaW4gYXBwcm9hY2ggKGFzIHg4
Nikgd2l0aG91dCBwZXJtYW5lbnQgSUQgYWxsb2NhdGlvbg0KPj4+IGZvciBlYWNoIGRvbWFp
biB3aWxsIHdvcmsgYmV0dGVyIHRoZW4gcGVyLXBDUFUgYWxsb2NhdGlvbi4NCj4+IEhlcmUg
eW91IChhcHBlYXIgdG8pIHNheSBvbmUgdGhpbmcsIC4uLg0KPj4NCj4+PiBJbiBvdGhlciB3
b3JkcywgSSdtIG5vdCAxMDAlIHN1cmUgdGhhdCBJIGdldCBhIHBvaW50IHdoeSB4ODYgY2hv
c2UgcGVyLXBDUFUgYWxsb2NhdGlvbg0KPj4+IGluc3RlYWQgb2YgcGVyLWRvbWFpbiBhbGxv
Y2F0aW9uIHdpdGggaGF2aW5nIHRoZSBzYW1lIFZNSUQgZm9yIGFsbCB2Q1BVcyBvZiBkb21h
aW5zLg0KPj4gLi4uIGFuZCB0aGVuIGhlcmUgdGhlIG9wcG9zaXRlLiBPdmVyYWxsIEknbSBp
biBzZXZlcmUgdHJvdWJsZSB1bmRlcnN0YW5kaW5nIHRoaXMNCj4+IHJlcGx5IG9mIHlvdXJz
IGFzIGEgd2hvbGUsIHNvIEkgZmVhciBJIGNhbid0IHJlYWxseSByZXNwb25kIHRvIGl0IChv
ciBldmVuIGp1c3QNCj4+IHBhcnRzIHRoZXJlb2YpLg0KPiANCj4gSUlVQywgeDg2IGFsbG9j
YXRlcyBWTUlEcyBwZXIgcGh5c2ljYWwgQ1BVIChwQ1BVKSAiZHluYW1pY2FsbHkiIOKAlCB0
aGVzZSBhcmUganVzdA0KPiBzZXF1ZW50aWFsIG51bWJlcnMsIGFuZCBvbmNlIFZNSURzIHJ1
biBvdXQgb24gYSBnaXZlbiBwQ1BVLCB0aGVyZSdzIG5vIGd1YXJhbnRlZQ0KPiB0aGF0IGEg
dkNQVSB3aWxsIHJlY2VpdmUgdGhlIHNhbWUgVk1JRCBhZ2Fpbi4NCj4gDQo+IE9uIHRoZSBv
dGhlciBoYW5kLCBSSVNDLVYgY3VycmVudGx5IGFsbG9jYXRlcyBhIHNpbmdsZSBWTUlEIHBl
ciBkb21haW4sIGFuZCB0aGF0DQo+IFZNSUQgaXMgY29uc2lkZXJlZCAicGVybWFuZW50IiB1
bnRpbCB0aGUgZG9tYWluIGlzIGRlc3Ryb3llZC4gVGhpcyBtZWFucyB3ZSBhcmUNCj4gbGlt
aXRlZCB0byBhdCBtb3N0IFZNSURfTUFYIGRvbWFpbnMuIFRvIGF2b2lkIHRoaXMgbGltaXRh
dGlvbiwgSSBwbGFuIHRvIGltcGxlbWVudA0KPiBhIHJvdW5kLXJvYmluIHJldXNlIGFwcHJv
YWNoOiB3aGVuIG5vIGZyZWUgVk1JRHMgcmVtYWluLCB3ZSBzdGFydCBhIG5ldyBnZW5lcmF0
aW9uDQo+IGFuZCBiZWdpbiByZXVzaW5nIG9sZCBWTUlEcy4NCj4gDQo+IFRoZSBvbmx5IHJl
bWFpbmluZyBkZXNpZ24gcXVlc3Rpb24gaXMgd2hldGhlciB3ZSB3YW50IFJJU0MtViB0byBm
b2xsb3cgYSBnbG9iYWwNCj4gVk1JRCBhbGxvY2F0aW9uIHBvbGljeSAoaS5lLiwgb25lIFZN
SUQgcGVyIGRvbWFpbiwgc2hhcmVkIGFjcm9zcyBhbGwgb2YgaXRzIHZDUFVzKSwNCj4gb3Ig
YWRvcHQgYSBwb2xpY3kgc2ltaWxhciB0byB4ODYgd2l0aCBwZXItQ1BVIFZNSUQgYWxsb2Nh
dGlvbiAoZWFjaCB2Q1BVIGdldHMgaXRzDQo+IG93biBWTUlELCBsb2NhbCB0byB0aGUgQ1BV
IGl0J3MgcnVubmluZyBvbikuDQo+IA0KPiBFYWNoIHBvbGljeSBoYXMgaXRzIG93biB0cmFk
ZS1vZmZzLiBCdXQgaW4gdGhlIGNhc2Ugd2hlcmUgdGhlIG51bWJlciBvZiBhdmFpbGFibGUN
Cj4gVk1JRHMgaXMgc21hbGwgKGkuZS4sIGxvdyBWTUlETEVOKSwgYSBnbG9iYWwgYWxsb2Nh
dGlvbiBwb2xpY3kgbWF5IGJlIG1vcmUgc3VpdGFibGUsDQo+IGFzIGl0IHJlcXVpcmVzIGZl
d2VyIFZNSURzIG92ZXJhbGwuDQo+IA0KPiBTbyBteSBtYWluIHF1ZXN0aW9uIHdhczoNCj4g
V2hhdCBhcmUgdGhlIGFkdmFudGFnZXMgb2YgcGVyLXBDUFUgVk1JRCBhbGxvY2F0aW9uIGlu
IHNjZW5hcmlvcyB3aXRoIGxpbWl0ZWQgVk1JRA0KPiBzcGFjZSwgYW5kIHdoeSBkaWQgeDg2
IGNob29zZSB0aGF0IGRlc2lnbj8NCj4gDQo+PkZyb20gd2hhdCBJIGNhbiB0ZWxsLCB0aGUg
YmVuZWZpdHMgb2YgcGVyLXBDUFUgVk1JRCBhbGxvY2F0aW9uIGluY2x1ZGU6DQo+IC0gTWlu
aW1pemVkIGludGVyLUNQVSBUTEIgZmx1c2hlcyDigJQgc2luY2UgVk1JRHMgYXJlIGxvY2Fs
LCBUTEIgZW50cmllcyBkb27igJl0IG5lZWQNCj4gICAgdG8gYmUgaW52YWxpZGF0ZWQgb24g
b3RoZXIgQ1BVcyB3aGVuIHJldXNlZC4NCj4gLSBCZXR0ZXIgc2NhbGFiaWxpdHkg4oCUIHRo
aXMgYXBwcm9hY2ggd29ya3MgYmV0dGVyIG9uIHN5c3RlbXMgd2l0aCBhIGxhcmdlIG51bWJl
cg0KPiAgICBvZiBDUFVzLg0KPiAtIEZyZXF1ZW50IFZNIHN3aXRjaGVzIGRvbuKAmXQgcmVx
dWlyZSBnbG9iYWwgVExCIGZsdXNoZXMg4oCUIHJlZHVjaW5nIHRoZSBvdmVyaGVhZA0KPiAg
ICBvZiBjb250ZXh0IHN3aXRjaGluZy4NCj4gSG93ZXZlciwgdGhlIGRvd25zaWRlIGlzIHRo
YXQgdGhpcyBtb2RlbCBjb25zdW1lcyBtb3JlIFZNSURzLiBGb3IgZXhhbXBsZSwNCj4gaWYg
YSBzaW5nbGUgZG9tYWluIHJ1bnMgb24gNCB2Q1BVcyBhY3Jvc3MgNCBDUFVzLCBpdCB3aWxs
IGNvbnN1bWUgNCBWTUlEcyBpbnN0ZWFkDQo+IG9mIGp1c3Qgb25lLg0KDQpDb25zaWRlciB5
b3UgaGF2ZSA0IGJpdHMgZm9yIFZNSURzLCByZXN1bHRpbmcgaW4gMTYgVk1JRCB2YWx1ZXMu
DQoNCklmIHlvdSBoYXZlIGEgc3lzdGVtIHdpdGggMzIgcGh5c2ljYWwgQ1BVcyBhbmQgMzIg
ZG9tYWlucyB3aXRoIDEgdmNwdSBlYWNoDQpvbiB0aGF0IHN5c3RlbSwgeW91ciBzY2hlbWUg
d291bGQgTk9UIGFsbG93IHRvIGtlZXAgZWFjaCBwaHlzaWNhbCBjcHUgYnVzeQ0KYnkgcnVu
bmluZyBhIGRvbWFpbiBvbiBpdCwgYXMgb25seSAxNiBkb21haW5zIGNvdWxkIGJlIGFjdGl2
ZSBhdCB0aGUgc2FtZQ0KdGltZS4NCg0KDQpKdWVyZ2VuDQo=
--------------z0kEzZEukLClS4nK3Nm5EB00
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------z0kEzZEukLClS4nK3Nm5EB00--

--------------FzgV8efe0ptC8GC9tEE9uAEC--

--------------K10vCUM7dVPJ1aOi9z7jRLXY
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmhdMmEFAwAAAAAACgkQsN6d1ii/Ey+c
SQgAkE5GuUHelWcA0EyLjBASNKnHFh9gvVPlvT5AKU5rorjEf2k7Fxr4SKFODV1we3pOVthrGG6O
U2A6I0Xlka/r92R3olxN8EfxrCmu6ieObOtzITenjvKMsi4y1D8ylpAYOxTeXTP26Qp3UvRjrWbf
0A+pEfUy85Y12qx/C58AfkDT2JkW9Co6HMmO6FXYAcii6EWFTwI7640HGE2adf+VQU93vkFjA/gF
djcTyp20piM9MNlhdfzHWawDGSqOKd4uHb9pfAL5aefFmpcGttFZYeSg+ewClcPmcpoY69rU6+8S
aIFbwV3REYZKdGV/lxCAt0exEfYLIOeEH7am5S92Zw==
=0cF8
-----END PGP SIGNATURE-----

--------------K10vCUM7dVPJ1aOi9z7jRLXY--

