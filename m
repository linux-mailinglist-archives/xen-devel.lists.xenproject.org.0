Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2324B99A285
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2024 13:13:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.816932.1231027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szDZm-0000dw-DY; Fri, 11 Oct 2024 11:12:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 816932.1231027; Fri, 11 Oct 2024 11:12:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szDZm-0000ao-AP; Fri, 11 Oct 2024 11:12:54 +0000
Received: by outflank-mailman (input) for mailman id 816932;
 Fri, 11 Oct 2024 11:12:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5FLX=RH=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1szDZk-0000ai-5l
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2024 11:12:52 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c05b59e6-87c1-11ef-99a2-01e77a169b0f;
 Fri, 11 Oct 2024 13:12:50 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4F0AA21FC0;
 Fri, 11 Oct 2024 11:12:49 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0A5EA136E0;
 Fri, 11 Oct 2024 11:12:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id iVvjADEICWeGUQAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 11 Oct 2024 11:12:49 +0000
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
X-Inumbo-ID: c05b59e6-87c1-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1728645169; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=pwaAPCR0sw9ktHoI4XXCZhNNCuBHNpmZtr1iDobCsDo=;
	b=DBrcU/6XaJ51iokbKbLJ/DnYcRoGLtFV1QDbaq16NHAVn8hnvyNAd/04Nuj3WLNTLPggjm
	rsQ/FhwHrLp2S+sBWaPbwKezk6as+zEGFl6WihD1ocem8Wc156seXWsVpvBcesd2uMGJ0l
	c3IsZz3NwXWoauM7KWPBFoEfnd+78g8=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1728645169; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=pwaAPCR0sw9ktHoI4XXCZhNNCuBHNpmZtr1iDobCsDo=;
	b=DBrcU/6XaJ51iokbKbLJ/DnYcRoGLtFV1QDbaq16NHAVn8hnvyNAd/04Nuj3WLNTLPggjm
	rsQ/FhwHrLp2S+sBWaPbwKezk6as+zEGFl6WihD1ocem8Wc156seXWsVpvBcesd2uMGJ0l
	c3IsZz3NwXWoauM7KWPBFoEfnd+78g8=
Message-ID: <3b83e1ea-f630-4259-bc9e-16497329f5a3@suse.com>
Date: Fri, 11 Oct 2024 13:12:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen: Remove dependency between pciback and privcmd
To: Jan Beulich <jbeulich@suse.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <20241011034227.1278144-1-Jiqian.Chen@amd.com>
 <318bd8a4-a349-4e7b-8653-6995d5f9f125@suse.com>
 <BL1PR12MB5849EFA99B7F0C55D201738AE7792@BL1PR12MB5849.namprd12.prod.outlook.com>
 <BL1PR12MB584931B86739702086CDFF12E7792@BL1PR12MB5849.namprd12.prod.outlook.com>
 <d67285fc-5106-429a-9dd1-747c435282f5@suse.com>
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
In-Reply-To: <d67285fc-5106-429a-9dd1-747c435282f5@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------COs2xWgFHhO203CTrdqeSNOK"
X-Spam-Score: -5.15
X-Spamd-Result: default: False [-5.15 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	NEURAL_HAM_LONG(-0.99)[-0.990];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	NEURAL_HAM_SHORT(-0.16)[-0.782];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,imap1.dmz-prg2.suse.org:helo];
	TO_DN_SOME(0.00)[];
	HAS_ATTACHMENT(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------COs2xWgFHhO203CTrdqeSNOK
Content-Type: multipart/mixed; boundary="------------21j9CXdGhgmOlRMlnUwRz7TF";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Message-ID: <3b83e1ea-f630-4259-bc9e-16497329f5a3@suse.com>
Subject: Re: [PATCH v3] xen: Remove dependency between pciback and privcmd
References: <20241011034227.1278144-1-Jiqian.Chen@amd.com>
 <318bd8a4-a349-4e7b-8653-6995d5f9f125@suse.com>
 <BL1PR12MB5849EFA99B7F0C55D201738AE7792@BL1PR12MB5849.namprd12.prod.outlook.com>
 <BL1PR12MB584931B86739702086CDFF12E7792@BL1PR12MB5849.namprd12.prod.outlook.com>
 <d67285fc-5106-429a-9dd1-747c435282f5@suse.com>
In-Reply-To: <d67285fc-5106-429a-9dd1-747c435282f5@suse.com>
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

--------------21j9CXdGhgmOlRMlnUwRz7TF
Content-Type: multipart/mixed; boundary="------------XnQxRrZOka0Bp2XoAEgB44AZ"

--------------XnQxRrZOka0Bp2XoAEgB44AZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEuMTAuMjQgMTI6MTAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxMS4xMC4yMDI0
IDExOjMzLCBDaGVuLCBKaXFpYW4gd3JvdGU6DQo+PiBPbiAyMDI0LzEwLzExIDE3OjIwLCBD
aGVuLCBKaXFpYW4gd3JvdGU6DQo+Pj4gT24gMjAyNC8xMC8xMSAxNjo1NCwgSmFuIEJldWxp
Y2ggd3JvdGU6DQo+Pj4+IE9uIDExLjEwLjIwMjQgMDU6NDIsIEppcWlhbiBDaGVuIHdyb3Rl
Og0KPj4+Pj4gQEAgLTE3NTcsMTEgKzE3NTYsMTkgQEAgc3RhdGljIGludCBfX2luaXQgeGVu
X3BjaWJrX2luaXQodm9pZCkNCj4+Pj4+ICAgCQlidXNfcmVnaXN0ZXJfbm90aWZpZXIoJnBj
aV9idXNfdHlwZSwgJnBjaV9zdHViX25iKTsNCj4+Pj4+ICAgI2VuZGlmDQo+Pj4+PiAgIA0K
Pj4+Pj4gKyNpZmRlZiBDT05GSUdfWEVOX0FDUEkNCj4+Pj4+ICsJeGVuX2FjcGlfcmVnaXN0
ZXJfZ2V0X2dzaV9mdW5jKHBjaXN0dWJfZ2V0X2dzaV9mcm9tX3NiZGYpOw0KPj4+Pj4gKyNl
bmRpZg0KPj4+Pj4gKw0KPj4+Pj4gICAJcmV0dXJuIGVycjsNCj4+Pj4+ICAgfQ0KPj4+Pj4g
ICANCj4+Pj4+ICAgc3RhdGljIHZvaWQgX19leGl0IHhlbl9wY2lia19jbGVhbnVwKHZvaWQp
DQo+Pj4+PiAgIHsNCj4+Pj4+ICsjaWZkZWYgQ09ORklHX1hFTl9BQ1BJDQo+Pj4+PiArCXhl
bl9hY3BpX3JlZ2lzdGVyX2dldF9nc2lfZnVuYyhOVUxMKTsNCj4+Pj4+ICsjZW5kaWYNCj4+
Pj4NCj4+Pj4gSnVzdCB3b25kZXJpbmcgLSBpbnN0ZWFkIG9mIHRoZXNlIHR3byAjaWZkZWYt
cywgLi4uDQo+Pj4+DQo+Pj4+PiAtLS0gYS9pbmNsdWRlL3hlbi9hY3BpLmgNCj4+Pj4+ICsr
KyBiL2luY2x1ZGUveGVuL2FjcGkuaA0KPj4+Pj4gQEAgLTkxLDEzICs5MSw5IEBAIHN0YXRp
YyBpbmxpbmUgaW50IHhlbl9hY3BpX2dldF9nc2lfaW5mbyhzdHJ1Y3QgcGNpX2RldiAqZGV2
LA0KPj4+Pj4gICB9DQo+Pj4+PiAgICNlbmRpZg0KPj4+Pj4gICANCj4+Pj4+IC0jaWZkZWYg
Q09ORklHX1hFTl9QQ0lfU1RVQg0KPj4+Pj4gLWludCBwY2lzdHViX2dldF9nc2lfZnJvbV9z
YmRmKHVuc2lnbmVkIGludCBzYmRmKTsNCj4+Pj4+IC0jZWxzZQ0KPj4+Pj4gLXN0YXRpYyBp
bmxpbmUgaW50IHBjaXN0dWJfZ2V0X2dzaV9mcm9tX3NiZGYodW5zaWduZWQgaW50IHNiZGYp
DQo+Pj4+PiAtew0KPj4+Pj4gLQlyZXR1cm4gLTE7DQo+Pj4+PiAtfQ0KPj4+Pj4gLSNlbmRp
Zg0KPj4+Pj4gK3R5cGVkZWYgaW50ICgqZ2V0X2dzaV9mcm9tX3NiZGZfdCkodTMyIHNiZGYp
Ow0KPj4+Pj4gKw0KPj4+Pj4gK3ZvaWQgeGVuX2FjcGlfcmVnaXN0ZXJfZ2V0X2dzaV9mdW5j
KGdldF9nc2lfZnJvbV9zYmRmX3QgZnVuYyk7DQo+Pj4+PiAraW50IHhlbl9hY3BpX2dldF9n
c2lfZnJvbV9zYmRmKHUzMiBzYmRmKTsNCj4+Pj4NCj4+Pj4gLi4uIHdvdWxkbid0IGEgc3Rh
dGljIGlubGluZSBzdHViIChmb3IgdGhlICFYRU5fQUNQSSBjYXNlKSBhaWQgb3ZlcmFsbCBy
ZWFkYWJpbGl0eT8NCj4+PiBJJ20gbm90IHN1cmUgaWYgb3RoZXIgZmlsZXMgZG8gdGhpcy4g
QnV0IGZvciBtZSwgaXQgZmVlbHMgYSBsaXR0bGUgc3RyYW5nZSB0byB1c2UgIiNpZmRlZiBD
T05GSUdfWEVOX0FDUEkgI2Vsc2UiIGluIGFwY2kuaCwgbGlrZSBzZWxmLWNvbnRhaW5tZW50
Lg0KPj4+IEFuZCAiI2luY2x1ZGUgYXBjaS5oIiBpbiBwaWNfc3R1Yi5jIGlzIGFsc28gd3Jh
cGVkIHdpdGggQ09ORklHX1hFTl9BQ1BJLg0KPj4gT0ssIEkgc2F3IG90aGVyIGZpbGVzIGFs
c28gZG8gdGhpcy4NCj4+IElmIHlvdSBpbnNpc3QsIEkgd2lsbCBtYWtlIG1vZGlmaWNhdGlv
bnMgaW4gdGhlIG5leHQgdmVyc2lvbi4NCj4gDQo+IFdlbGwsIEknbSBub3QgYSBtYWludGFp
bmVyIG9mIHRoaXMgY29kZSwgc28gSSBjYW4ndCB2ZXJ5IHdlbGwgaW5zaXN0Lg0KDQpJbiB0
aGlzIGNhc2UgSSdtIGluIGZhdm9yIG9mIGhhdmluZyB0aGUgI2lmZGVmcyBhdCB0aGUgY2Fs
bGluZyBzaXRlLg0KDQpUaGUgYW1vdW50IG9mIGNvZGUgaXNuJ3QgbGFyZ2VyIHRoaXMgd2F5
LCB3aGlsZSBpdCBpcyBtb3JlIGNsZWFyIHdoZW4NCnJlYWRpbmcgdGhlIGNvZGUgdGhhdCB0
aGUgY2FsbHMgYXJlIG9ubHkgZG9uZSBpbiB0aGUgQ09ORklHX1hFTl9BQ1BJDQpjYXNlLg0K
DQoNCkp1ZXJnZW4NCg==
--------------XnQxRrZOka0Bp2XoAEgB44AZ
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------XnQxRrZOka0Bp2XoAEgB44AZ--

--------------21j9CXdGhgmOlRMlnUwRz7TF--

--------------COs2xWgFHhO203CTrdqeSNOK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmcJCDAFAwAAAAAACgkQsN6d1ii/Ey/J
0QgAi82LrXA0EdOXfR9jhU5w/ZxQGzLYiUt2ELnUPb50jelo7PZEDwK3dhnYLH3O7KlnXGUZYfTi
wIJi1EalNga08XywH8G4n9jL7vjW6AfyDendNBnroFzhEtPofKSqLQtyctrDL70c/ksAqWW0N69G
p5f6FIsoZY+tA46zZYNt/WWBv3Zlk3RM9dj0YkzLhqtXhuXG07TmLbzlf5CPdXA23+FGTRAaIVQr
pmQK3EtLF6MJjtxXUJBALmSMEQB1LMaqkXNXF58R6XqfuuXFYatXRWKiV3L3HYoTPXqLEhKcFvrK
pKnsa0/bolGv/O1GuioYsic37uqA4cbKbckymOwUJw==
=BVbl
-----END PGP SIGNATURE-----

--------------COs2xWgFHhO203CTrdqeSNOK--

