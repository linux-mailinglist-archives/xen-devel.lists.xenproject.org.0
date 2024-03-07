Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B3D874E88
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 13:04:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689834.1075185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riCTf-0008BK-KL; Thu, 07 Mar 2024 12:03:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689834.1075185; Thu, 07 Mar 2024 12:03:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riCTf-00088c-Gw; Thu, 07 Mar 2024 12:03:59 +0000
Received: by outflank-mailman (input) for mailman id 689834;
 Thu, 07 Mar 2024 12:03:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+8gn=KN=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1riCTd-00088N-EQ
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 12:03:57 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c60a19c0-dc7a-11ee-afda-a90da7624cb6;
 Thu, 07 Mar 2024 13:03:56 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 182798BF31;
 Thu,  7 Mar 2024 10:51:34 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D8A7D136BA;
 Thu,  7 Mar 2024 10:51:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id soIxMzWc6WXQLgAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 07 Mar 2024 10:51:33 +0000
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
X-Inumbo-ID: c60a19c0-dc7a-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1709808694; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=tuHwPybvE5hMjpcpcZlE8QFw92PG+ODqE3BCZxcVPZ8=;
	b=uK7g144909ntXCZe4DHTvzk1PG0eWIVbb8MjdAdo1M1vWsVHVosHEzTt/2OBiRksAgKSvz
	J6mCJxXmziCe3sSwcvM3nWBNyHvMxvTYSSJllSnoWu3zRkQbojbNa7I0B3JO4GMTPIGLdl
	K/pn6aRNAU6AGwNjo/TNRu1rYEwkGiM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1709808694; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=tuHwPybvE5hMjpcpcZlE8QFw92PG+ODqE3BCZxcVPZ8=;
	b=uK7g144909ntXCZe4DHTvzk1PG0eWIVbb8MjdAdo1M1vWsVHVosHEzTt/2OBiRksAgKSvz
	J6mCJxXmziCe3sSwcvM3nWBNyHvMxvTYSSJllSnoWu3zRkQbojbNa7I0B3JO4GMTPIGLdl
	K/pn6aRNAU6AGwNjo/TNRu1rYEwkGiM=
Message-ID: <86f363fb-80f4-45cd-aa1f-58b504546422@suse.com>
Date: Thu, 7 Mar 2024 11:51:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tools/9pfsd: Fix build error caused by strerror_r()
Content-Language: en-US
To: Henry Wang <xin.wang2@amd.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
References: <20240307103847.3710737-1-xin.wang2@amd.com>
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
In-Reply-To: <20240307103847.3710737-1-xin.wang2@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------wA8tX3hB8D6JIW2l19BzxTUy"
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -1.97
X-Spamd-Result: default: False [-1.97 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BAYES_HAM(-0.00)[19.31%];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 HAS_ATTACHMENT(0.00)[];
	 NEURAL_HAM_LONG(-0.79)[-0.788];
	 MIME_BASE64_TEXT_BOGUS(1.00)[];
	 RCPT_COUNT_FIVE(0.00)[5];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.19)[-0.969];
	 MIME_BASE64_TEXT(0.10)[];
	 SIGNED_PGP(-2.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[];
	 MIME_UNKNOWN(0.10)[application/pgp-keys]
X-Spam-Flag: NO

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------wA8tX3hB8D6JIW2l19BzxTUy
Content-Type: multipart/mixed; boundary="------------d40fObzGrHuDArI6nykm1dbX";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Henry Wang <xin.wang2@amd.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Message-ID: <86f363fb-80f4-45cd-aa1f-58b504546422@suse.com>
Subject: Re: [PATCH v2] tools/9pfsd: Fix build error caused by strerror_r()
References: <20240307103847.3710737-1-xin.wang2@amd.com>
In-Reply-To: <20240307103847.3710737-1-xin.wang2@amd.com>
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

--------------d40fObzGrHuDArI6nykm1dbX
Content-Type: multipart/mixed; boundary="------------wjN1uD6UfRUCE5TjQkRJqiak"

--------------wjN1uD6UfRUCE5TjQkRJqiak
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDcuMDMuMjQgMTE6MzgsIEhlbnJ5IFdhbmcgd3JvdGU6DQo+IEJlbG93IGVycm9yIGNh
biBiZSBzZWVuIHdoZW4gZG9pbmcgWW9jdG8gYnVpbGQgb2YgdGhlIHRvb2xzdGFjazoNCj4g
DQo+IHwgaW8uYzogSW4gZnVuY3Rpb24gJ3A5X2Vycm9yJzoNCj4gfCBpby5jOjY4NDo1OiBl
cnJvcjogaWdub3JpbmcgcmV0dXJuIHZhbHVlIG9mICdzdHJlcnJvcl9yJyBkZWNsYXJlZA0K
PiAgICB3aXRoIGF0dHJpYnV0ZSAnd2Fybl91bnVzZWRfcmVzdWx0JyBbLVdlcnJvcj11bnVz
ZWQtcmVzdWx0XQ0KPiB8ICAgNjg0IHwgICAgIHN0cmVycm9yX3IoZXJyLCByaW5nLT5idWZm
ZXIsIHJpbmctPnJpbmdfc2l6ZSk7DQo+IHwgICAgICAgfCAgICAgXn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fg0KPiB8IGNjMTogYWxsIHdhcm5pbmdz
IGJlaW5nIHRyZWF0ZWQgYXMgZXJyb3JzDQo+IA0KPiBGaXggdGhlIGJ1aWxkIGJ5IHVzaW5n
IHN0cmVycm9yKCkgdG8gcmVwbGFjZSBzdHJlcnJvcl9yKCkuIFNpbmNlDQo+IHN0cmVycm9y
KCkgaXMgdGhyZWFkLXVuc2FmZSwgdXNlIGEgc2VwYXJhdGUgbG9jYWwgbXV0ZXggdG8gcHJv
dGVjdA0KPiB0aGUgYWN0aW9uLiBUaGUgc3RlcHMgd291bGQgdGhlbiBiZWNvbWU6IEFjcXVp
cmUgdGhlIG11dGV4IGZpcnN0LA0KPiBpbnZva2Ugc3RyZXJyb3IoKSwgY29weSB0aGUgc3Ry
aW5nIGZyb20gc3RyZXJyb3IoKSB0byB0aGUgZGVzaWduYXRlZA0KPiBidWZmZXIgYW5kIHRo
ZW4gZHJvcCB0aGUgbXV0ZXguDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBIZW5yeSBXYW5nIDx4
aW4ud2FuZzJAYW1kLmNvbT4NCg0KTWF5YmUgYWRkIGEgIkZpeGVzOiIgdGFnIHJlZmVyZW5j
aW5nIEphbidzIHBhdGNoPw0KDQpBbmQgSSB3b3VsZCBleHBhbmQgb24gdGhlIHJlYXNvbiB3
aHkgeW91IGFyZSB1c2luZyBzdHJlcnJvcigpIGluc3RlYWQgb2YganVzdA0KY2hlY2tpbmcg
dGhlIHN0cmVycm9yX3IoKSByZXN1bHQuIFNvbWV0aGluZyBsaWtlOg0KDQogICBVc2luZyBz
dHJlcnJvcl9yKCkgd2l0aG91dCBzcGVjaWFsIGNhc2luZyBkaWZmZXJlbnQgYnVpbGQNCiAg
IGVudmlyb25tZW50cyBpcyBpbXBvc3NpYmxlIGR1ZSB0byB0aGUgZGlmZmVyZW50IHJldHVy
biB0eXBlcw0KICAgKGludCB2cyBjaGFyICopIGRlcGVuZGluZyBvbiB0aGUgZW52aXJvbm1l
bnQuIEFzIHA5X2Vycm9yKCkNCiAgIGlzIG5vdCBvbiBhIHBlcmZvcm1hbmNlIGNyaXRpY2Fs
IHBhdGgsIHVzaW5nIHN0cmVycm9yKCkgd2l0aCBhDQogICBtdXRleCBvdWdodCB0byBiZSBm
aW5lLg0KDQo+IC0tLQ0KPiAgIHRvb2xzLzlwZnNkL2lvLmMgfCAxMiArKysrKysrKysrKy0N
Cj4gICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL3Rvb2xzLzlwZnNkL2lvLmMgYi90b29scy85cGZzZC9pby5j
DQo+IGluZGV4IGFkYjg4N2M3ZDkuLjJiODBjOTUyOGQgMTAwNjQ0DQo+IC0tLSBhL3Rvb2xz
LzlwZnNkL2lvLmMNCj4gKysrIGIvdG9vbHMvOXBmc2QvaW8uYw0KPiBAQCAtNjgwLDggKzY4
MCwxOCBAQCBzdGF0aWMgYm9vbCBuYW1lX29rKGNvbnN0IGNoYXIgKnN0cikNCj4gICBzdGF0
aWMgdm9pZCBwOV9lcnJvcihzdHJ1Y3QgcmluZyAqcmluZywgdWludDE2X3QgdGFnLCB1aW50
MzJfdCBlcnIpDQo+ICAgew0KPiAgICAgICB1bnNpZ25lZCBpbnQgZXJyb2ZmOw0KPiArICAg
IHN0YXRpYyBwdGhyZWFkX211dGV4X3QgbXV0ZXggPSBQVEhSRUFEX01VVEVYX0lOSVRJQUxJ
WkVSOw0KPiArICAgIGNoYXIgKnN0cmVycm9yX3N0cjsNCj4gKyAgICBSSU5HX0lEWCBzdHJl
cnJvcl9sZW4gPSAwLCBjb3B5X2xlbiA9IDA7DQoNCkkgd291bGRuJ3QgdXNlIFJJTkdfSURY
IGZvciB0aGUgdHlwZSwgYnV0IHVuc2lnbmVkIGludC4NCg0KPiArDQo+ICsgICAgcHRocmVh
ZF9tdXRleF9sb2NrKCZtdXRleCk7DQo+ICsgICAgc3RyZXJyb3Jfc3RyID0gc3RyZXJyb3Io
ZXJyKTsNCj4gKyAgICBzdHJlcnJvcl9sZW4gPSBzdHJsZW4oc3RyZXJyb3Jfc3RyKSArIDE7
DQo+ICsgICAgY29weV9sZW4gPSBtaW4oc3RyZXJyb3JfbGVuLCByaW5nLT5yaW5nX3NpemUp
Ow0KPiArICAgIG1lbWNweShyaW5nLT5idWZmZXIsIHN0cmVycm9yX3N0ciwgY29weV9sZW4p
Ow0KPiArICAgICgoY2hhciAqKShyaW5nLT5idWZmZXIpKVtjb3B5X2xlbiAtIDFdID0gJ1ww
JzsNCj4gKyAgICBwdGhyZWFkX211dGV4X3VubG9jaygmbXV0ZXgpOw0KPiAgIA0KPiAtICAg
IHN0cmVycm9yX3IoZXJyLCByaW5nLT5idWZmZXIsIHJpbmctPnJpbmdfc2l6ZSk7DQo+ICAg
ICAgIGVycm9mZiA9IGFkZF9zdHJpbmcocmluZywgcmluZy0+YnVmZmVyLCBzdHJsZW4ocmlu
Zy0+YnVmZmVyKSk7DQo+ICAgICAgIGZpbGxfYnVmZmVyKHJpbmcsIFA5X0NNRF9FUlJPUiwg
dGFnLCAiU1UiLA0KPiAgICAgICAgICAgICAgICAgICBlcnJvZmYgIT0gfjAgPyByaW5nLT5z
dHIgKyBlcnJvZmYgOiAiY2Fubm90IGFsbG9jYXRlIG1lbW9yeSIsDQoNCg0KSnVlcmdlbg0K

--------------wjN1uD6UfRUCE5TjQkRJqiak
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------wjN1uD6UfRUCE5TjQkRJqiak--

--------------d40fObzGrHuDArI6nykm1dbX--

--------------wA8tX3hB8D6JIW2l19BzxTUy
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmXpnDUFAwAAAAAACgkQsN6d1ii/Ey9M
swf/QFHHnG1cUUY7PuOYtKPuYw4fF0gZeJ8C3HRys916f2kl0itopGkPGBIRm2zqXG4lSZ97nJPP
GnR4rEsrO/+vHKhdQqcOnFK6TxSbcPrEWYQYGc2AsRnY/yYnohJnuOiubPWcbH55a2dxUCBT3mmT
/o976Ao4ya2QrrMk5UHkeRlV3rMpgHtCp7GO/IMp/LBpDc+P2Um1gOfp59j6nqO+l0xRqLDzCKEt
YGQum7HNwsCjIfkfjRWFTvyUUtSBFU85kEl67eP1CeyID5WpDuOgjJlEKmpDSH826tEqb7Ww4egJ
tSoc7oaZ6XbqvwksSmcdpexVIuo3+Mj8TFv1NjBSvQ==
=Wl0M
-----END PGP SIGNATURE-----

--------------wA8tX3hB8D6JIW2l19BzxTUy--

