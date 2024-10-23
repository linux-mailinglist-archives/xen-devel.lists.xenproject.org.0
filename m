Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EF59ACC45
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2024 16:29:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824711.1238885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3cL3-0006tk-Ge; Wed, 23 Oct 2024 14:27:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824711.1238885; Wed, 23 Oct 2024 14:27:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3cL3-0006rN-Dj; Wed, 23 Oct 2024 14:27:53 +0000
Received: by outflank-mailman (input) for mailman id 824711;
 Wed, 23 Oct 2024 14:27:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W0hE=RT=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1t3cL2-0006rH-ED
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2024 14:27:52 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb2b412e-914a-11ef-99a3-01e77a169b0f;
 Wed, 23 Oct 2024 16:27:50 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 536FC21F50;
 Wed, 23 Oct 2024 14:27:48 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 13C6013AD3;
 Wed, 23 Oct 2024 14:27:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Q+YSA+QHGWe4FAAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 23 Oct 2024 14:27:48 +0000
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
X-Inumbo-ID: fb2b412e-914a-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1729693669; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=axLOhtXdxWxX47nMuDldRMHrsmVJAKlDyUGIhE+tlVc=;
	b=kXTBQZLx3xFT7K9oVkPPL8zF+aRtqtv08Te15kNuYC5Jd9S8VV73K7s8yYxlz4gIkvt8x3
	APtV43XJ6TXEgCxgV0J1RNnfatQ+0qVgPCIR/Y4qiDB7Sm8lWANTf0LpWMsVCbK1YOOjWP
	YjwUl0X+3jPwSHzHoHUESlOxBYxCHRA=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1729693668; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=axLOhtXdxWxX47nMuDldRMHrsmVJAKlDyUGIhE+tlVc=;
	b=pPHIEdmjiZf85lHFjR7zRvSD8WxjWoGwGpDHWKxwawL6JDRFsQiN8J2+f99ZG6zk1WsUyA
	9Jp18oHs1VNfGox+FSkLCCDkPHnwSzidv7m53VsF0AahARCkTxK6pLpt+LqpwhkBB9DI/o
	OJn/i5UkPSUaxxyZpTRDmUitp4/C7/s=
Message-ID: <cc607d38-1638-4f43-b0d3-b03842e8d9b9@suse.com>
Date: Wed, 23 Oct 2024 16:27:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] xen: add a domain unique id to each domain
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20241023131005.32144-1-jgross@suse.com>
 <20241023131005.32144-2-jgross@suse.com>
 <D538TV4LGFZF.J375ZVYWPIHO@cloud.com>
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
In-Reply-To: <D538TV4LGFZF.J375ZVYWPIHO@cloud.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------K4KN0K20cMAD6Istr1pO2vja"
X-Spam-Level: 
X-Spamd-Result: default: False [-5.20 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-0.999];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid];
	HAS_ATTACHMENT(0.00)[]
X-Spam-Score: -5.20
X-Spam-Flag: NO

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------K4KN0K20cMAD6Istr1pO2vja
Content-Type: multipart/mixed; boundary="------------8a00VbQvOjt1W5nLB6gLJdlU";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <cc607d38-1638-4f43-b0d3-b03842e8d9b9@suse.com>
Subject: Re: [PATCH 1/6] xen: add a domain unique id to each domain
References: <20241023131005.32144-1-jgross@suse.com>
 <20241023131005.32144-2-jgross@suse.com>
 <D538TV4LGFZF.J375ZVYWPIHO@cloud.com>
In-Reply-To: <D538TV4LGFZF.J375ZVYWPIHO@cloud.com>
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

--------------8a00VbQvOjt1W5nLB6gLJdlU
Content-Type: multipart/mixed; boundary="------------nfP0Kh0o7wUhUU80OfDo220v"

--------------nfP0Kh0o7wUhUU80OfDo220v
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjMuMTAuMjQgMTY6MDgsIEFsZWphbmRybyBWYWxsZWpvIHdyb3RlOg0KPiBPbiBXZWQg
T2N0IDIzLCAyMDI0IGF0IDI6MTAgUE0gQlNULCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4g
WGVuc3RvcmUgaXMgcmVmZXJlbmNpbmcgZG9tYWlucyBieSB0aGVpciBkb21pZCwgYnV0IHJl
dXNlIG9mIGEgZG9taWQNCj4+IGNhbiBsZWFkIHRvIHRoZSBzaXR1YXRpb24gdGhhdCBYZW5z
dG9yZSBjYW4ndCB0ZWxsIHdoZXRoZXIgYSBkb21haW4NCj4+IHdpdGggdGhhdCBkb21pZCBo
YXMgYmVlbiBkZWxldGVkIGFuZCBjcmVhdGVkIGFnYWluIHdpdGhvdXQgWGVuc3RvcmUNCj4+
IG5vdGljaW5nIHRoZSBkb21haW4gaXMgYSBuZXcgb25lIG5vdy4NCj4+DQo+PiBBZGQgYSBn
bG9iYWwgZG9tYWluIGNyZWF0aW9uIHVuaXF1ZSBpZCB3aGljaCBpcyB1cGRhdGVkIHdoZW4g
Y3JlYXRpbmcNCj4+IGEgbmV3IGRvbWFpbiwgYW5kIHN0b3JlIHRoYXQgdmFsdWUgaW4gc3Ry
dWN0IGRvbWFpbiBvZiB0aGUgbmV3IGRvbWFpbi4NCj4+IFRoZSBnbG9iYWwgdW5pcXVlIGlk
IGlzIGluaXRpYWxpemVkIHdpdGggdGhlIHN5c3RlbSB0aW1lIGFuZCB1cGRhdGVzDQo+PiBh
cmUgZG9uZSB2aWEgdGhlIHhvcnNoaWZ0IGFsZ29yaXRobSB3aGljaCBpcyB1c2VkIGZvciBw
c2V1ZG8gcmFuZG9tDQo+PiBudW1iZXIgZ2VuZXJhdGlvbiwgdG9vIChzZWUgaHR0cHM6Ly9l
bi53aWtpcGVkaWEub3JnL3dpa2kvWG9yc2hpZnQpLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6
IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4+IFJldmlld2VkLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+PiAtLS0NCj4+IFYxOg0KPj4gLSBtYWtl
IHVuaXF1ZV9pZCBsb2NhbCB0byBmdW5jdGlvbiAoSmFuIEJldWxpY2gpDQo+PiAtIGFkZCBs
b2NrIChKdWxpZW4gR3JhbGwpDQo+PiAtIGFkZCBjb21tZW50IChKdWxpZW4gR3JhbGwpDQo+
PiAtLS0NCj4+ICAgeGVuL2NvbW1vbi9kb21haW4uYyAgICAgfCAyMCArKysrKysrKysrKysr
KysrKysrKw0KPj4gICB4ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaCB8ICAzICsrKw0KPj4gICAy
IGZpbGVzIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKykNCj4+DQo+PiBkaWZmIC0tZ2l0IGEv
eGVuL2NvbW1vbi9kb21haW4uYyBiL3hlbi9jb21tb24vZG9tYWluLmMNCj4+IGluZGV4IDky
MjYzYTRmYmQuLjM5NDg2NDBmYjAgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vY29tbW9uL2RvbWFp
bi5jDQo+PiArKysgYi94ZW4vY29tbW9uL2RvbWFpbi5jDQo+PiBAQCAtNTYyLDYgKzU2Miwy
NSBAQCBzdGF0aWMgdm9pZCBfZG9tYWluX2Rlc3Ryb3koc3RydWN0IGRvbWFpbiAqZCkNCj4+
ICAgICAgIGZyZWVfZG9tYWluX3N0cnVjdChkKTsNCj4+ICAgfQ0KPj4gICANCj4+ICtzdGF0
aWMgdWludDY0X3QgZ2V0X3VuaXF1ZV9pZCh2b2lkKQ0KPj4gK3sNCj4+ICsgICAgc3RhdGlj
IHVpbnQ2NF90IHVuaXF1ZV9pZDsNCj4+ICsgICAgc3RhdGljIERFRklORV9TUElOTE9DSyhs
b2NrKTsNCj4+ICsgICAgdWludDY0X3QgeCA9IHVuaXF1ZV9pZCA/IDogTk9XKCk7DQo+PiAr
DQo+PiArICAgIHNwaW5fbG9jaygmbG9jayk7DQo+PiArDQo+PiArICAgIC8qIFBzZXVkby1y
YW5kb21pemUgaWQgaW4gb3JkZXIgdG8gYXZvaWQgY29uc3VtZXJzIHJlbHlpbmcgb24gc2Vx
dWVuY2UuICovDQo+PiArICAgIHggXj0geCA8PCAxMzsNCj4+ICsgICAgeCBePSB4ID4+IDc7
DQo+PiArICAgIHggXj0geCA8PCAxNzsNCj4+ICsgICAgdW5pcXVlX2lkID0geDsNCj4+ICsN
Cj4+ICsgICAgc3Bpbl91bmxvY2soJmxvY2spOw0KPj4gKw0KPj4gKyAgICByZXR1cm4geDsN
Cj4+ICt9DQo+PiArDQo+PiAgIHN0YXRpYyBpbnQgc2FuaXRpc2VfZG9tYWluX2NvbmZpZyhz
dHJ1Y3QgeGVuX2RvbWN0bF9jcmVhdGVkb21haW4gKmNvbmZpZykNCj4+ICAgew0KPj4gICAg
ICAgYm9vbCBodm0gPSBjb25maWctPmZsYWdzICYgWEVOX0RPTUNUTF9DREZfaHZtOw0KPj4g
QEAgLTY1NCw2ICs2NzMsNyBAQCBzdHJ1Y3QgZG9tYWluICpkb21haW5fY3JlYXRlKGRvbWlk
X3QgZG9taWQsDQo+PiAgIA0KPj4gICAgICAgLyogU29ydCBvdXQgb3VyIGlkZWEgb2YgaXNf
c3lzdGVtX2RvbWFpbigpLiAqLw0KPj4gICAgICAgZC0+ZG9tYWluX2lkID0gZG9taWQ7DQo+
PiArICAgIGQtPnVuaXF1ZV9pZCA9IGdldF91bmlxdWVfaWQoKTsNCj4+ICAgDQo+PiAgICAg
ICAvKiBIb2xkaW5nIENERl8qIGludGVybmFsIGZsYWdzLiAqLw0KPj4gICAgICAgZC0+Y2Rm
ID0gZmxhZ3M7DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3NjaGVkLmggYi94
ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaA0KPj4gaW5kZXggOTA2NjY1NzZjMi4uMWRkOGE0MjVm
OSAxMDA2NDQNCj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oDQo+PiArKysgYi94
ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaA0KPj4gQEAgLTM3MCw2ICszNzAsOSBAQCBzdHJ1Y3Qg
ZG9tYWluDQo+PiAgICAgICBkb21pZF90ICAgICAgICAgIGRvbWFpbl9pZDsNCj4+ICAgDQo+
PiAgICAgICB1bnNpZ25lZCBpbnQgICAgIG1heF92Y3B1czsNCj4+ICsNCj4+ICsgICAgdWlu
dDY0X3QgICAgICAgICB1bmlxdWVfaWQ7ICAgICAgIC8qIFVuaXF1ZSBkb21haW4gaWRlbnRp
ZmllciAqLw0KPj4gKw0KPiANCj4gV2h5IG5vdCB4ZW5fZG9tYWluX2hhbmRsZV90IGhhbmRs
ZSwgZGVmaW5lZCBsYXRlciBvbj8gVGhhdCdzIG1lYW50IHRvIGJlIGENCj4gVVVJRCwgc28g
dGhpcyBmZWVscyBsaWtlIGEgZHVwbGljYXRlIGZpZWxkLg0KDQpJdCBpcyBhbiBpbnB1dCB2
YWx1ZSBmb3IgY3JlYXRlIGRvbWFpbi4gU28gdGhlcmUgaXMgYWJzb2x1dGVseSBubw0KZ3Vh
cmFudGVlIHRoYXQgaXQgaXMgdW5pcXVlLg0KDQpJdCBjYW4gZXNwZWNpYWxseSBiZSBzcGVj
aWZpZWQgaW4gdGhlIHhsIGNvbmZpZyBmaWxlLCBzbyB5b3UgY291bGQgaGF2ZQ0KYSBob3N0
IHJ1bm5pbmcgbXVsdGlwbGUgZ3Vlc3RzIGFsbCB3aXRoIHRoZSBzYW1lIFVVSUQgKGV2ZW4g
aWYgdGhpcyBtaWdodA0KYmUgcmVqZWN0ZWQgYnkgbGlieGwsIGRlc3Ryb3lpbmcgYSBndWVz
dCBhbmQgdGhlbiByZWNyZWF0aW5nIGl0IHdpdGggdGhlDQpzYW1lIFVVSUQgaXMgcG9zc2li
bGUsIGJ1dCBYZW5zdG9yZSB3b3VsZCBuZWVkIHRvIHNlZSBkaWZmZXJlbnQgdW5pcXVlIElk
cw0KZm9yIHRob3NlIDIgZ3Vlc3RzKS4NCg0KDQpKdWVyZ2VuDQo=
--------------nfP0Kh0o7wUhUU80OfDo220v
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------nfP0Kh0o7wUhUU80OfDo220v--

--------------8a00VbQvOjt1W5nLB6gLJdlU--

--------------K4KN0K20cMAD6Istr1pO2vja
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmcZB+MFAwAAAAAACgkQsN6d1ii/Ey8e
PAf/TSKDDoqu5eZLqWWkDOuSZ2NqEiBRj7TkKGthPU0MMsRtbFTHXn7rROoD3gNFQbdhKbY4tHyQ
UOYj18BI9Sz3YFilDrOmil/JcZYn3ZMbHRE3brGzspOKEVoQh6gQL3fXrVNwLXDW3BEjHaTGKSNR
1yYzMbgWWY14wnpkZHuVvZEJVeujetUeZbwX2asyX7nq9Iw5BRsDbJBXNdKIQP4U1EoRgqD8/AGi
AwC/yF91V5d/SOjyOKF/rXhVQUYefnrXWkXvGr08RhNJ54HF7zD88FCS6e0XP9X41uOGN6hJZ7JH
hy0QgZWXwAW2W0YtqPBiMHen1bJO/RPDs0Sx0PTr+Q==
=ItcT
-----END PGP SIGNATURE-----

--------------K4KN0K20cMAD6Istr1pO2vja--

