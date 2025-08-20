Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5309B2D815
	for <lists+xen-devel@lfdr.de>; Wed, 20 Aug 2025 11:26:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1087272.1445368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uof4q-0003CK-G5; Wed, 20 Aug 2025 09:25:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1087272.1445368; Wed, 20 Aug 2025 09:25:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uof4q-0003Ao-Ce; Wed, 20 Aug 2025 09:25:52 +0000
Received: by outflank-mailman (input) for mailman id 1087272;
 Wed, 20 Aug 2025 09:25:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/z1b=3A=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uof4p-0003Ai-2O
 for xen-devel@lists.xenproject.org; Wed, 20 Aug 2025 09:25:51 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a8812ea9-7da7-11f0-b898-0df219b8e170;
 Wed, 20 Aug 2025 11:25:49 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 79AE51F391;
 Wed, 20 Aug 2025 09:25:48 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E916D13867;
 Wed, 20 Aug 2025 09:25:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id R61SN5uUpWjEfAAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 20 Aug 2025 09:25:47 +0000
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
X-Inumbo-ID: a8812ea9-7da7-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1755681948; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ZVsl+kO4348PLGNsi5LOc+2ouykw3LEDQYE212TJFzU=;
	b=dib1sI8ueOriCYnR11ObFcjYQX0uP6ttTNORSewn1TduYE6D+3mjNkxZMEMpjTiVNUonsA
	TL26fEFBOecy02i0dTpRcofEMODDhtvtHO2wcOfEiO0BzezuJkY7E2+gUBVuOk8m68YiAd
	hD2gYluvCUGA+3LOfoj6nwCfis7FAYo=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1755681948; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ZVsl+kO4348PLGNsi5LOc+2ouykw3LEDQYE212TJFzU=;
	b=dib1sI8ueOriCYnR11ObFcjYQX0uP6ttTNORSewn1TduYE6D+3mjNkxZMEMpjTiVNUonsA
	TL26fEFBOecy02i0dTpRcofEMODDhtvtHO2wcOfEiO0BzezuJkY7E2+gUBVuOk8m68YiAd
	hD2gYluvCUGA+3LOfoj6nwCfis7FAYo=
Message-ID: <706acf95-4871-4ce7-897e-397672f6738b@suse.com>
Date: Wed, 20 Aug 2025 11:25:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misra: address MISRA C Rule 18.3 compliance
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich
 <jbeulich@suse.com>, Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Dario Faggioli <dfaggioli@suse.com>,
 George Dunlap <gwd@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c9fb095c43edfedfd6174284bac404ec9ae5523d.1753263957.git.dmytro_prokopchuk1@epam.com>
 <6c7341a2-fd49-40de-8ad3-e7980d4e9e42@suse.com>
 <36042f23-7795-4717-be4a-cd22e52b3145@epam.com>
 <alpine.DEB.2.22.394.2507291507580.468590@ubuntu-linux-20-04-desktop>
 <e7b30994-3c36-44f8-9d14-4a4a5c0df7f8@epam.com>
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
In-Reply-To: <e7b30994-3c36-44f8-9d14-4a4a5c0df7f8@epam.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------sMM7EpCYQZflXcaOGyFKBWo6"
X-Spam-Level: 
X-Spamd-Result: default: False [-5.20 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	NEURAL_HAM_SHORT(-0.20)[-0.992];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,imap1.dmz-prg2.suse.org:helo];
	HAS_ATTACHMENT(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -5.20

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------sMM7EpCYQZflXcaOGyFKBWo6
Content-Type: multipart/mixed; boundary="------------hiF00SHuw7fUcJXZlXN0d2TZ";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich
 <jbeulich@suse.com>, Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Dario Faggioli <dfaggioli@suse.com>,
 George Dunlap <gwd@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <706acf95-4871-4ce7-897e-397672f6738b@suse.com>
Subject: Re: [PATCH] misra: address MISRA C Rule 18.3 compliance
References: <c9fb095c43edfedfd6174284bac404ec9ae5523d.1753263957.git.dmytro_prokopchuk1@epam.com>
 <6c7341a2-fd49-40de-8ad3-e7980d4e9e42@suse.com>
 <36042f23-7795-4717-be4a-cd22e52b3145@epam.com>
 <alpine.DEB.2.22.394.2507291507580.468590@ubuntu-linux-20-04-desktop>
 <e7b30994-3c36-44f8-9d14-4a4a5c0df7f8@epam.com>
In-Reply-To: <e7b30994-3c36-44f8-9d14-4a4a5c0df7f8@epam.com>
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

--------------hiF00SHuw7fUcJXZlXN0d2TZ
Content-Type: multipart/mixed; boundary="------------7MFePeqXEsoUE0gKXSXxsr8n"

--------------7MFePeqXEsoUE0gKXSXxsr8n
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjAuMDguMjUgMTE6MTgsIERteXRybyBQcm9rb3BjaHVrMSB3cm90ZToNCj4gDQo+IA0K
PiBPbiA3LzMwLzI1IDAxOjA5LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+PiBPbiBG
cmksIDI1IEp1bCAyMDI1LCBEbXl0cm8gUHJva29wY2h1azEgd3JvdGU6DQo+Pj4gT24gNy8y
My8yNSAxNjo1OCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+IE9uIDIzLjA3LjIwMjUgMTI6
MTIsIERteXRybyBQcm9rb3BjaHVrMSB3cm90ZToNCj4+Pj4+IC0tLSBhL2F1dG9tYXRpb24v
ZWNsYWlyX2FuYWx5c2lzL0VDTEFJUi9kZXZpYXRpb25zLmVjbA0KPj4+Pj4gKysrIGIvYXV0
b21hdGlvbi9lY2xhaXJfYW5hbHlzaXMvRUNMQUlSL2RldmlhdGlvbnMuZWNsDQo+Pj4+PiBA
QCAtNTY4LDYgKzU2OCwxNCBAQCBDOTkgVW5kZWZpbmVkIEJlaGF2aW91ciA0NTogUG9pbnRl
cnMgdGhhdCBkbyBub3QgcG9pbnQgaW50bywgb3IganVzdCBiZXlvbmQsIHRoZQ0KPj4+Pj4g
ICAgIC1jb25maWc9TUMzQTIuUjE4LjIscmVwb3J0cys9e3NhZmUsICJhbnlfYXJlYShhbnlf
bG9jKGFueV9leHAobWFjcm8oXnBhZ2VfdG9fbWZuJCkpKSkifQ0KPj4+Pj4gICAgIC1kb2Nf
ZW5kDQo+Pj4+PiAgICAgDQo+Pj4+PiArLWRvY19iZWdpbj0iQ29uc2lkZXIgcmVsYXRpb25h
bCBwb2ludGVyIGNvbXBhcmlzb25zIGluIGtlcm5lbC1yZWxhdGVkIHNlY3Rpb25zIGFzIHNh
ZmUgYW5kIGNvbXBsaWFudC4iDQo+Pj4+PiArLWNvbmZpZz1NQzNSMS5SMTguMyxyZXBvcnRz
Kz17c2FmZSwgImFueV9hcmVhKGFueV9sb2MoYW55X2V4cChtYWNybyhuYW1lKGlzX2tlcm5l
bHx8aXNfa2VybmVsX3RleHR8fGlzX2tlcm5lbF9yb2RhdGF8fGlzX2tlcm5lbF9pbml0dGV4
dCkpKSkpIn0NCj4+Pj4+ICstZG9jX2VuZA0KPj4+Pj4gKw0KPj4+Pj4gKy1kb2NfYmVnaW49
IkFsbG93IGRldmlhdGlvbnMgZm9yIHBvaW50ZXIgY29tcGFyaXNvbnMgaW4gQlVHX09OIGFu
ZCBBU1NFUlQgbWFjcm9zLCB0cmVhdGluZyB0aGVtIGFzIHNhZmUgZm9yIGRlYnVnZ2luZyBh
bmQgdmFsaWRhdGlvbi4iDQo+Pj4+PiArLWNvbmZpZz1NQzNSMS5SMTguMyxyZXBvcnRzKz17
c2FmZSwgImFueV9hcmVhKGFueV9sb2MoYW55X2V4cChtYWNybyhuYW1lKEJVR19PTnx8QVNT
RVJUKSkpKSkifQ0KPj4+Pj4gKy1kb2NfZW5kDQo+Pj4+DQo+Pj4+IE5pdDogRHJvcCAiZGV2
aWF0aW9ucyBmb3IiIGZyb20gdGhlIHZlcmJhbCBkZXNjcmlwdGlvbj8NCj4+PiBPay4NCj4+
Pg0KPj4+Pg0KPj4+Pj4gLS0tIGEveGVuL2FyY2gveDg2L2VmaS9lZmktYm9vdC5oDQo+Pj4+
PiArKysgYi94ZW4vYXJjaC94ODYvZWZpL2VmaS1ib290LmgNCj4+Pj4+IEBAIC00NjEsNyAr
NDYxLDggQEAgc3RhdGljIHZvaWQgX19pbml0IGVmaV9hcmNoX2VkZCh2b2lkKQ0KPj4+Pj4g
ICAgICAgICAgICAgICAgICAgICBwYXJhbXMtPmRldmljZV9wYXRoX2luZm9fbGVuZ3RoID0N
Cj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgIHNpemVvZihzdHJ1Y3QgZWRkX2Rldmlj
ZV9wYXJhbXMpIC0NCj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgIG9mZnNldG9mKHN0
cnVjdCBlZGRfZGV2aWNlX3BhcmFtcywga2V5KTsNCj4+Pj4+IC0gICAgICAgICAgICAgICAg
Zm9yICggcCA9IChjb25zdCB1OCAqKSZwYXJhbXMtPmtleTsgcCA8ICZwYXJhbXMtPmNoZWNr
c3VtOyArK3AgKQ0KPj4+Pj4gKyAgICAgICAgICAgICAgICBmb3IgKCBwID0gKGNvbnN0IHU4
ICopJnBhcmFtcy0+a2V5Ow0KPj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAodWludHB0
cl90KXAgPCAodWludHB0cl90KSZwYXJhbXMtPmNoZWNrc3VtOyArK3AgKQ0KPj4+Pg0KPj4+
PiBUaGVyZSBtZXJlIGFkZGl0aW9uIG9mIHN1Y2ggY2FzdHMgbWFrZXMgY29kZSBtb3JlIGZy
YWdpbGUgaW1vLiBXaGF0IGFib3V0IHRoZQ0KPj4+PiBhbHRlcm5hdGl2ZSBvZiB1c2luZyAh
PSBpbnN0ZWFkIG9mIDwgaGVyZT8gSSBjZXJ0YWlubHkgcHJlZmVyIDwgaW4gc3VjaCBzaXR1
YXRpb25zLA0KPj4+PiBidXQgZnVuY3Rpb25hbGx5ICE9IG91Z2h0IHRvIGJlIGVxdWl2YWxl
bnQgKGFuZCBsZXNzIGNvbnN0cmFpbmVkIGJ5IEMgYW5kIE1pc3JhKS4NCj4+Pj4NCj4+Pj4g
QXMgbWVudGlvbmVkIHNldmVyYWwgdGltZXMgd2hlbiBkaXNjdXNzaW5nIHRoZXNlIHJ1bGVz
LCBpdCdzIGFsc28gbm90IGVhc3kgdG8gc2VlDQo+Pj4+IGhvdyAicG9pbnRlcnMgb2YgZGlm
ZmVyZW50IG9iamVjdHMiIGNvdWxkIGJlIGludm9sdmVkIGhlcmU6IEl0J3MgYWxsIHdpdGhp
bg0KPj4+PiAqcGFyYW1zLCBpc24ndCBpdD8NCj4+PiBIYXJkIHRvIHNheSBzb21ldGhpbmcu
IExldCdzIGhvbGQgdGhpcyBzbyBmYXIuDQo+Pj4NCj4+Pj4NCj4+Pj4gRmluYWxseSwgd2hl
biB0b3VjaGluZyBzdWNoIGNvZGUgaXQgd291bGQgYmUgbmljZSBpZiB1PE4+IHdhcyBjb252
ZXJ0ZWQgdG8NCj4+Pj4gdWludDxOPl90Lg0KPj4+Pg0KPj4+Pj4gLS0tIGEveGVuL2NvbW1v
bi9zY2hlZC9jb3JlLmMNCj4+Pj4+ICsrKyBiL3hlbi9jb21tb24vc2NoZWQvY29yZS5jDQo+
Pj4+PiBAQCAtMzYwLDcgKzM2MCw3IEBAIHN0YXRpYyBhbHdheXNfaW5saW5lIHZvaWQgc2No
ZWRfc3Bpbl9sb2NrX2RvdWJsZSgNCj4+Pj4+ICAgICAgICAgew0KPj4+Pj4gICAgICAgICAg
ICAgKmZsYWdzID0gX3NwaW5fbG9ja19pcnFzYXZlKGxvY2sxKTsNCj4+Pj4+ICAgICAgICAg
fQ0KPj4+Pj4gLSAgICBlbHNlIGlmICggbG9jazEgPCBsb2NrMiApDQo+Pj4+PiArICAgIGVs
c2UgaWYgKCAodWludHB0cl90KWxvY2sxIDwgKHVpbnRwdHJfdClsb2NrMiApDQo+IA0KPiBD
b3VsZCB3ZSBhc3N1bWUgdGhhdCB0aGVzZSAnbG9jazEnIGFuZCAnbG9jazInIHBvaW50ZXJz
IGJlbG9uZyB0byB0aGUNCj4gc2FtZSBhbGxvY2F0aW9uIHJlZ2lvbiAtICdzY2hlZF9yZXNv
dXJjZScgPw0KDQpObywgdGhleSBjYW4gYmUgZWl0aGVyIGluIHNjaGVkX3Jlc291cmNlLCBp
biBhIHBlci1zY2hlZHVsZXIgcHJpdmF0ZSBtZW1vcnkNCmFyZWEsIG9yIGV2ZW4gaW4gdGhl
IC5kYXRhIHNlY3Rpb24gb2YgdGhlIGh5cGVydmlzb3IuDQoNCg0KSnVlcmdlbg0K
--------------7MFePeqXEsoUE0gKXSXxsr8n
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------7MFePeqXEsoUE0gKXSXxsr8n--

--------------hiF00SHuw7fUcJXZlXN0d2TZ--

--------------sMM7EpCYQZflXcaOGyFKBWo6
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmillJsFAwAAAAAACgkQsN6d1ii/Ey+W
xQf9F34VQdX8xt2lQvs5WEpa75+x1TY1/kFsvR0Lkg2HWWul3FL7IspP3u4Jw9sAhTPmE/1qmGDf
wGaqoil9OaJ2MtN+UdPfbU4fPcP1xMIqH3AaH5XAi2IIgOgIBZo+C+NyWp+y0tDD9jXzWsH4sI9C
tJUvcF4/U0/O7DcsG1im3baIQz30gSwF5CBwcOP/Lul4YyPwvDeKjbjmI0Nqj6b8QfiooTCbv3lb
VnHopj+w93eN3UZiwkXnvVF+Z8d/uGp7jaaGbrXoBl8b611uVwFiKWw3yTk1MHz9g6EURXh4uBJS
yTCH0VAXU14ymE9qMAD40OloekA34QNZoI51Swo9yg==
=0z4G
-----END PGP SIGNATURE-----

--------------sMM7EpCYQZflXcaOGyFKBWo6--

