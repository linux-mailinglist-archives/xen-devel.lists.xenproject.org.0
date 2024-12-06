Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D279E6A92
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2024 10:40:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.849957.1264433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJUnp-00045I-RZ; Fri, 06 Dec 2024 09:39:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 849957.1264433; Fri, 06 Dec 2024 09:39:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJUnp-00042t-OS; Fri, 06 Dec 2024 09:39:13 +0000
Received: by outflank-mailman (input) for mailman id 849957;
 Fri, 06 Dec 2024 09:39:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BoLq=S7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tJUno-00042n-O5
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2024 09:39:12 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1fb8451-b3b5-11ef-a0d5-8be0dac302b0;
 Fri, 06 Dec 2024 10:39:10 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C7B591F38E;
 Fri,  6 Dec 2024 09:39:08 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 79C1213647;
 Fri,  6 Dec 2024 09:39:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id VVp3GzzGUmf2DwAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 06 Dec 2024 09:39:08 +0000
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
X-Inumbo-ID: f1fb8451-b3b5-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1733477948; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=4La1PApICUl8lH2+Xp52W5sEKTv28kQNJ79VSICGxmk=;
	b=VOqyayyhWT3BftVDujBi2ZFCCKSU4xaMa+GUcFxI05ErTD0BW6vmkDVs0AXMtBloWTHybf
	6HcG4kYWp5aAtXvNe4pYBjLRcNktxGfiHsva56+fIeJO5s62ak8zqSWzwsVzrpW+HWmUO8
	0GS3g4ArfbSerMf6CmiCJUqwl/KZLeM=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1733477948; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=4La1PApICUl8lH2+Xp52W5sEKTv28kQNJ79VSICGxmk=;
	b=VOqyayyhWT3BftVDujBi2ZFCCKSU4xaMa+GUcFxI05ErTD0BW6vmkDVs0AXMtBloWTHybf
	6HcG4kYWp5aAtXvNe4pYBjLRcNktxGfiHsva56+fIeJO5s62ak8zqSWzwsVzrpW+HWmUO8
	0GS3g4ArfbSerMf6CmiCJUqwl/KZLeM=
Message-ID: <ed1b8dd7-383e-4c83-b7d9-46d0aa8d80bc@suse.com>
Date: Fri, 6 Dec 2024 10:39:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] xen: add new domctl get_changed_domain
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20241023131005.32144-1-jgross@suse.com>
 <20241023131005.32144-4-jgross@suse.com>
 <0a7b19a0-5002-4fc5-8870-be78a2e59f3c@suse.com>
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
In-Reply-To: <0a7b19a0-5002-4fc5-8870-be78a2e59f3c@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------JaX9jTah09QbTG4VywOYpxna"
X-Spam-Score: -6.20
X-Spamd-Result: default: False [-6.20 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SIGNED_PGP(-2.00)[];
	NEURAL_HAM_LONG(-1.00)[-0.998];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	ARC_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	HAS_ATTACHMENT(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------JaX9jTah09QbTG4VywOYpxna
Content-Type: multipart/mixed; boundary="------------pee2CVzjK4MweN9X0KAHH16n";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <ed1b8dd7-383e-4c83-b7d9-46d0aa8d80bc@suse.com>
Subject: Re: [PATCH 3/6] xen: add new domctl get_changed_domain
References: <20241023131005.32144-1-jgross@suse.com>
 <20241023131005.32144-4-jgross@suse.com>
 <0a7b19a0-5002-4fc5-8870-be78a2e59f3c@suse.com>
In-Reply-To: <0a7b19a0-5002-4fc5-8870-be78a2e59f3c@suse.com>
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

--------------pee2CVzjK4MweN9X0KAHH16n
Content-Type: multipart/mixed; boundary="------------OpWzyYEwouX4LBmheDTST080"

--------------OpWzyYEwouX4LBmheDTST080
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDQuMTIuMjQgMTE6MDEsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+IE9uIDIzLjEwLjI0
IDE1OjEwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gQWRkIGEgbmV3IGRvbWN0bCBzdWIt
ZnVuY3Rpb24gdG8gZ2V0IGRhdGEgb2YgYSBkb21haW4gaGF2aW5nIGNoYW5nZWQNCj4+IHN0
YXRlICh0aGlzIGlzIG5lZWRlZCBieSBYZW5zdG9yZSkuDQo+Pg0KPj4gVGhlIHJldHVybmVk
IHN0YXRlIGp1c3QgY29udGFpbnMgdGhlIGRvbWlkLCB0aGUgZG9tYWluIHVuaXF1ZSBpZCwN
Cj4+IGFuZCBzb21lIGZsYWdzIChleGlzdGluZywgc2h1dGRvd24sIGR5aW5nKS4NCj4+DQo+
PiBJbiBvcmRlciB0byBlbmFibGUgWGVuc3RvcmUgc3R1YmRvbSBiZWluZyBidWlsdCBmb3Ig
bXVsdGlwbGUgWGVuDQo+PiB2ZXJzaW9ucywgbWFrZSB0aGlzIGRvbWN0bCBzdGFibGUuwqAg
Rm9yIHN0YWJsZSBkb21jdGxzIHRoZQ0KPj4gaW50ZXJmYWNlX3ZlcnNpb24gaXMgc3BlY2lm
aWMgdG8gdGhlIHJlc3BlY3RpdmUgZG9tY3RsIG9wIGFuZCBpdCBpcyBhbg0KPj4gaW4vb3V0
IHBhcmFtZXRlcjogT24gaW5wdXQgdGhlIGNhbGxlciBpcyBzcGVjaWZ5aW5nIHRoZSBkZXNp
cmVkIHZlcnNpb24NCj4+IG9mIHRoZSBvcCwgd2hpbGUgb24gb3V0cHV0IHRoZSBoeXBlcnZp
c29yIHdpbGwgcmV0dXJuIHRoZSB1c2VkIHZlcnNpb24NCj4+ICh0aGlzIHdpbGwgYmUgYXQg
bWF4IHRoZSBjYWxsZXIgc3VwcGxpZWQgdmVyc2lvbiwgYnV0IG1pZ2h0IGJlIGxvd2VyIGlu
DQo+PiBjYXNlIHRoZSBoeXBlcnZpc29yIGRvZXNuJ3Qgc3VwcG9ydCB0aGlzIHZlcnNpb24p
Lg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNv
bT4NCj4gDQo+IENvdWxkIEkgcGxlYXNlIGdldCBzb21lIGZlZWRiYWNrIHJlZ2FyZGluZyB0
aGUgbmV3IHN0YWJsZSAoc3ViLSloeXBlcmNhbGw/DQo+IA0KPiBJJ2QgX3JlYWxseV8gbGlr
ZSB0byBnZXQgdGhpcyBzZXJpZXMgaW50byA0LjIwLg0KPiANCj4gSW4gdGhlIFJGQyBzZXJp
ZXMgSSBzdWdnZXN0ZWQgYSBuZXcgc3RhYmxlIG1haW4gaHlwZXJjYWxsLCBidXQgdGhpcyB3
YXNuJ3QNCj4gbGlrZWQgYnkgSmFuLiBTbyBJIHVzZWQgdGhlIGN1cnJlbnQgYXBwcm9hY2gg
dG8gbWFrZSBpdCBhIHN1Yi1vcCBvZiB0aGUNCj4gZG9tY3RsIGh5cGVyY2FsbCwgd2hpY2gg
SmFuIGRpZG4ndCBsaWtlIGVpdGhlciBpbiB0aGUgY3VycmVudCBmb3JtLg0KPiANCj4gQW5k
cmV3IHRvbGQgbWUgbXVsdGlwbGUgdGltZXMsIGhlIHdhbnRlZCB0byBnaXZlIHNvbWUgZmVl
ZGJhY2ssIGJ1dCBoYXNuJ3QNCj4gZG9uZSBzbyB5ZXQuDQo+IA0KPiBJIHRoaW5rIHRoZXJl
IGFyZSBtdWx0aXBsZSBvcHRpb25zIGhvdyB0byBwcm9jZWVkLCB0aGUgZm9sbG93aW5nIGNv
bWluZyB0bw0KPiBteSBtaW5kOg0KPiANCj4gMS4gVXNlIGEgbmV3IHN0YWJsZSBhZG1pbiBo
eXBlcmNhbGwsIHNpbWlsYXIgdG8gdGhlIFJGQyBzZXJpZXMgc29tZSB0aW1lIGFnby4NCj4g
IMKgwqAgSW4gY2FzZSB0aGlzIGlzIHRoZSBwcmVmZXJyZWQgb3B0aW9uLCBJJ2Qgc3VnZ2Vz
dCB0byBtYWtlIGl0IHNpbWlsYXIgdG8NCj4gIMKgwqAgdGhlIGN1cnJlbnQgc3lzY3RsIGh5
cGVyY2FsbCwgYnV0IHdpdGhvdXQgdGhlIHZlcnNpb24gZmllbGQuIEFueSBub3QNCj4gIMKg
wqAgY29tcGF0aWJsZSBjaGFuZ2Ugb2YgYSBzdWItb3Agd291bGQgbmVlZCBhIG5ldyBzdWIt
b3AgaW5zdGVhZC4NCj4gDQo+IDIuIFVzZSBzdGFibGUgZG9tY3RsIChhbmQgcG9zc2libHkg
c3lzY3RsIGluIHRoZSBmdXR1cmUpIHN1Yi1vcHMgbGlrZSBpbiB0aGlzDQo+ICDCoMKgIHBh
dGNoLCBidXQgcG9zc2libHkgZHJvcCB0aGUgdXNlIG9mIHRoZSBpbnRlcmZhY2UgdmVyc2lv
biBmaWVsZC4gQW55IG5vdA0KPiAgwqDCoCBjb21wYXRpYmxlIGNoYW5nZSBvZiBhIHN0YWJs
ZSBzdWItb3Agd291bGQgbmVlZCBhIG5ldyBzdWItb3AgaW5zdGVhZC4NCj4gDQo+IEknbGwg
c2V0IHRoaXMgdG9waWMgb24gdGhlIGFnZW5kYSBvZiB0aGUgY29tbXVuaXR5IGNhbGwgdG9t
b3Jyb3cgaW4gY2FzZSBJDQo+IGRvbid0IGdldCBhbnkgZmVlZGJhY2sgYWxsb3dpbmcgdG8g
cHJvY2VlZC4NCg0KU28ganVzdCB0byBoYXZlIHRoZSB3aG9sZSBkaXNjdXNzaW9uIG9uIHhl
bi1kZXZlbDoNCg0KSW4gdGhlIGNvbW11bml0eSBjYWxsIEFuZHJldyBnYXZlIGhpcyBmZWVk
YmFjazogaGUgaXMgcHJlZmVycmluZyBhYm92ZQ0KdmFyaWFudCAyLCB3aXRoIHRoZSBpbnRl
cmZhY2UgdmVyc2lvbiBmaWVsZCByZXF1aXJlZCB0byBiZSAwIGZvciBzdGFibGUNCnN1Yi1v
cHMuDQoNCkknbGwgZ28gdGhpcyByb3V0ZSwgd2hpbGUgYWRkcmVzc2luZyBKYW4ncyBvdGhl
ciBjb21tZW50cy4NCg0KDQpKdWVyZ2VuDQo=
--------------OpWzyYEwouX4LBmheDTST080
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjri
oyspZKOBycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2
kaV2KL9650I1SJvedYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i
1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/B
BLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xqG7/377qptDmrk42GlSK
N4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR3Jvc3Mg
PGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsE
FgIDAQIeAQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4F
UGNQH2lvWAUy+dnyThpwdtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3Tye
vpB0CA3dbBQp0OW0fgCetToGIQrg0MbD1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u
+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbvoPHZ8SlM4KWm8rG+lIkGurq
qu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v5QL+qHI3EIP
tyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJ
CAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4
RF7HoZhPVPogNVbC4YA6lW7DrWf0teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz7
8X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC/nuAFVGy+67q2DH8As3KPu0344T
BDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0LhITTd9jLzdDad1pQ
SToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLmXBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkM
nQfvUewRz80hSnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMB
AgAjBQJTjHDXAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/
Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJnFOXgMLdBQgBlVPO3/D9R8LtF9DBAFPN
hlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1jnDkfJZr6jrbjgyoZHi
w/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0N51N5Jf
VRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwP
OoE+lotufe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK
/1xMI3/+8jbO0tsn1tqSEUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuZGU+wsB5BBMBAgAjBQJTjHDrAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgEC
F4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3g3OZUEBmDHVVbqMtzwlmNC4
k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5dM7wRqzgJpJ
wK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu
5D+jLRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzB
TNh30FVKK1EvmV2xAKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37Io
N1EblHI//x/e2AaIHpzK5h88NEawQsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6
AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpWnHIs98ndPUDpnoxWQugJ6MpMncr
0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZRwgnBC5mVM6JjQ5x
Dk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNVbVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mm
we0icXKLkpEdIXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0I
v3OOImwTEe4co3c1mwARAQABwsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMv
Q/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEwTbe8YFsw2V/Buv6Z4Mysln3nQK5ZadD
534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1vJzQ1fOU8lYFpZXTXIH
b+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8VGiwXvT
yJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqc
suylWsviuGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5B
jR/i1DG86lem3iBDXzXsZDn8R3/CwO0EGAEIACAWIQSFEmdy6PYElKXQl/ew3p3W
KL8TLwUCWt3w0AIbAgCBCRCw3p3WKL8TL3YgBBkWCAAdFiEEUy2wekH2OPMeOLge
gFxhu0/YY74FAlrd8NAACgkQgFxhu0/YY75NiwD/fQf/RXpyv9ZX4n8UJrKDq422
bcwkujisT6jix2mOOwYBAKiip9+mAD6W5NPXdhk1XraECcIspcf2ff5kCAlG0DIN
aTUH/RIwNWzXDG58yQoLdD/UPcFgi8GWtNUp0Fhc/GeBxGipXYnvuWxwS+Qs1Qay
7/Nbal/v4/eZZaWs8wl2VtrHTS96/IF6q2o0qMey0dq2AxnZbQIULiEndgR625EF
RFg+IbO4ldSkB3trsF2ypYLij4ZObm2casLIP7iB8NKmQ5PndL8Y07TtiQ+Sb/wn
g4GgV+BJoKdDWLPCAlCMilwbZ88Ijb+HF/aipc9hsqvW/hnXC2GajJSAY3Qs9Mib
4Hm91jzbAjmp7243pQ4bJMfYHemFFBRaoLC7ayqQjcsttN2ufINlqLFPZPR/i3IX
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------OpWzyYEwouX4LBmheDTST080--

--------------pee2CVzjK4MweN9X0KAHH16n--

--------------JaX9jTah09QbTG4VywOYpxna
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmdSxjsFAwAAAAAACgkQsN6d1ii/Ey9m
Lgf+NAejj1DP2+dgthE+hA3c0vKpepFsvT9mRSizotK2/nQ6NXS8GOlkYSsnwZTbSpsQ4JgNOEsC
dzR1ZpL2zwreojzWPcYsL3gVgsCXtYVPzGycT5868NgpJFQpaIZtuuOvZ4aeLAH8FphDF9SrpGWX
V5zgMMGNiLpbtid3UTCLEKVQR1scNHAR/zlI0z4NjevK/uOjyYDYoIDzPQa3SU/Qg1yiNsiSExDx
By9uYFmwyRunwXZ3PYJhYDaWggYeXV4eUfm0fJsALhvWlCkbdJjApA74vS78HOPuRhshBOafsEj/
vwtxBxJ/5Sg3l3AWXXssdBDzKikIcetvc/s2DRmFjQ==
=r2hZ
-----END PGP SIGNATURE-----

--------------JaX9jTah09QbTG4VywOYpxna--

