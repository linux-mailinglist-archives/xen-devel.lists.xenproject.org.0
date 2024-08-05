Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 542B894765E
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2024 09:53:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.771802.1182235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sasWI-0003ta-Jm; Mon, 05 Aug 2024 07:52:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 771802.1182235; Mon, 05 Aug 2024 07:52:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sasWI-0003qf-Gk; Mon, 05 Aug 2024 07:52:42 +0000
Received: by outflank-mailman (input) for mailman id 771802;
 Mon, 05 Aug 2024 07:52:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Dvoq=PE=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sasWH-0003qZ-5t
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2024 07:52:41 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b0181106-52ff-11ef-bc03-fd08da9f4363;
 Mon, 05 Aug 2024 09:52:39 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A3EE51FCF5;
 Mon,  5 Aug 2024 07:52:38 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 60EDC13254;
 Mon,  5 Aug 2024 07:52:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id rV7TFcaEsGaKUQAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 05 Aug 2024 07:52:38 +0000
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
X-Inumbo-ID: b0181106-52ff-11ef-bc03-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1722844358; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=q+dNz6/7N1KNq68VIPGcmOTrJw3gqbQv0bPxpvc5P2U=;
	b=loy2Z9RgdGtjIhbLVBOAWG/+z+5pdP2kDbgKj827TU4b2wR7l7P9F4mRfIimntZUhmW31q
	+zHmZp4te7wdqIPMgfsITUIeOSnK88Cki360ECZJFA9zfz22J9p9RD2oXlM3T7T29rIpW5
	OGU7ndn5n16il8dMj6mmIbo8EfToyeE=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1722844358; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=q+dNz6/7N1KNq68VIPGcmOTrJw3gqbQv0bPxpvc5P2U=;
	b=loy2Z9RgdGtjIhbLVBOAWG/+z+5pdP2kDbgKj827TU4b2wR7l7P9F4mRfIimntZUhmW31q
	+zHmZp4te7wdqIPMgfsITUIeOSnK88Cki360ECZJFA9zfz22J9p9RD2oXlM3T7T29rIpW5
	OGU7ndn5n16il8dMj6mmIbo8EfToyeE=
Message-ID: <74bac0d8-de7a-41df-87ed-b7e2d4140ade@suse.com>
Date: Mon, 5 Aug 2024 09:52:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: kexec failure with Xen 4.19-rc4 and 4.20-dev on linux host
To: Jan Beulich <jbeulich@suse.com>, A Kundu <avikalpa@yahoo.com>
Cc: kexec@lists.infradead.org, horms@verge.net.au,
 xen-devel@lists.xenproject.org, Baoquan He <bhe@redhat.com>,
 andrew.cooper3@citrix.com
References: <05395ed2-3bf3-4926-8e24-c2e7ff37ed26@yahoo.com>
 <cebc7800-df78-4f90-9f8e-82e3f9120b6e@yahoo.com>
 <ZqxUMgcEHakeFPaU@MiWiFi-R3L-srv>
 <abaceb99-4b80-49d7-ab7f-b190f73e858d@yahoo.com>
 <ac57dec1-68a3-471d-8f4c-c87fd9dca619@suse.com>
 <dc5c9dff-6bee-493a-8315-b2eee48bd802@yahoo.com>
 <18032298-e535-4405-890e-6ab9d54cf7e3@suse.com>
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
In-Reply-To: <18032298-e535-4405-890e-6ab9d54cf7e3@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------MauQ67W1CiCmNyumbihs2Qec"
X-Spam-Level: 
X-Spamd-Result: default: False [-5.18 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-0.998];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	NEURAL_HAM_SHORT(-0.19)[-0.962];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	XM_UA_NO_VERSION(0.01)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FREEMAIL_ENVRCPT(0.00)[yahoo.com];
	FREEMAIL_TO(0.00)[suse.com,yahoo.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -5.18

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------MauQ67W1CiCmNyumbihs2Qec
Content-Type: multipart/mixed; boundary="------------DN8FSuVoJn0UraqDFj85p3Ja";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>, A Kundu <avikalpa@yahoo.com>
Cc: kexec@lists.infradead.org, horms@verge.net.au,
 xen-devel@lists.xenproject.org, Baoquan He <bhe@redhat.com>,
 andrew.cooper3@citrix.com
Message-ID: <74bac0d8-de7a-41df-87ed-b7e2d4140ade@suse.com>
Subject: Re: kexec failure with Xen 4.19-rc4 and 4.20-dev on linux host
References: <05395ed2-3bf3-4926-8e24-c2e7ff37ed26@yahoo.com>
 <cebc7800-df78-4f90-9f8e-82e3f9120b6e@yahoo.com>
 <ZqxUMgcEHakeFPaU@MiWiFi-R3L-srv>
 <abaceb99-4b80-49d7-ab7f-b190f73e858d@yahoo.com>
 <ac57dec1-68a3-471d-8f4c-c87fd9dca619@suse.com>
 <dc5c9dff-6bee-493a-8315-b2eee48bd802@yahoo.com>
 <18032298-e535-4405-890e-6ab9d54cf7e3@suse.com>
In-Reply-To: <18032298-e535-4405-890e-6ab9d54cf7e3@suse.com>
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

--------------DN8FSuVoJn0UraqDFj85p3Ja
Content-Type: multipart/mixed; boundary="------------LHsUp8Nk0UKDkSsiuvmY99VN"

--------------LHsUp8Nk0UKDkSsiuvmY99VN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDUuMDguMjQgMDg6MDEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNC4wOC4yMDI0
IDE1OjE3LCBBIEt1bmR1IHdyb3RlOg0KPj4gT24gOC8yLzI0IDEzOjI1LCBKYW4gQmV1bGlj
aCB3cm90ZToNCj4+ICAgPiBPbiAwMi4wOC4yMDI0IDA5OjI4LCBBIEt1bmR1IHdyb3RlOg0K
Pj4gICA+PiBPbiA4LzIvMjQgMDk6MDYsIEJhb3F1YW4gSGUgd3JvdGU6DQo+PiAgID4+PiBP
biAwNy8zMS8yNCBhdCAwNjozNHBtLCBBIEt1bmR1IHdyb3RlOg0KPj4gICA+Pj4+IEkgYW0g
ZXhwZXJpZW5jaW5nIGlzc3VlcyB1c2luZyBrZXhlYyB0byBsb2FkIFhlbiA0LjE3KGRlYmlh
bidzIGFwdA0KPj4gdmVyc2lvbiksDQo+PiAgID4+Pj4gWGVuIDQuMTktcmM0IChjb21waWxl
ZCBmcm9tIHNvdXJjZSkgYW5kIDQuMjAtZGV2IChjb21waWxlZCBmcm9tDQo+PiBzb3VyY2Up
IG9uIGENCj4+ICAgPj4+PiBkZWJpYW4gaG9zdC4NCj4+ICAgPj4+IFlvdSBzaG91bGQgQ0Mg
dGhpcyB0byBYRU4gZGV2IGxpc3Qgc28gdGhhdCBYRU4gZGV2IGtub3dzIHRoaXMgYW5kIG1h
eQ0KPj4gICA+Pj4gcHJvdmlkZSBoZWxwLiBOb3QgZXZlcnlvbmUgaXMgaW50ZXJlc3RlZCBp
biBhbmQga25vd3MgWEVOLg0KPj4gICA+Pj4NCj4+ICAgPj4+PiBTeXN0ZW0gaW5mb3JtYXRp
b246DQo+PiAgID4+Pj4gJCB1bmFtZSAtYQ0KPj4gICA+Pj4+IExpbnV4IGhvc3QgNi45LjEw
LWFtZDY0ICMxIFNNUCBQUkVFTVBUX0RZTkFNSUMgRGViaWFuIDYuOS4xMC0xDQo+PiAoMjAy
NC0wNy0xOSkNCj4+ICAgPj4+PiB4ODZfNjQgR05VL0xpbnV4DQo+PiAgID4+Pj4NCj4+ICAg
Pj4+PiAkIGtleGVjIC0tdmVyc2lvbiAjIGNvbXBpbGVkIGZyb20gc291cmNlIHRhcmJhbGwg
d2l0aCAuL2NvbmZpZ3VyZQ0KPj4gLS13aXRoLXhlbg0KPj4gICA+Pj4+IGtleGVjLXRvb2xz
IDIuMC4yOQ0KPj4gICA+Pj4+DQo+PiAgID4+Pj4gU3RlcHMgdG8gcmVwcm9kdWNlOg0KPj4g
ICA+Pj4+DQo+PiAgID4+Pj4gMS4gU2V0IHZhcmlhYmxlczoNCj4+ICAgPj4+Pg0KPj4gICA+
Pj4+IFhFTl9IWVBFUlZJU09SPSIvYm9vdC94ZW4uZ3oiDQo+PiAgID4+Pj4gWEVOX0NNRD0i
ZG9tMF9tZW09NkcgZG9tMF9tYXhfdmNwdXM9NiBkb20wX3ZjcHVzX3BpbiBjcHVmcmVxPXhl
biINCj4+ICAgPj4+Pg0KPj4gICA+Pj4+IDIuIEF0dGVtcHQgdG8gbG9hZCBYZW4gNC4xOS1y
YzQ6DQo+PiAgID4+Pj4NCj4+ICAgPj4+PiAjIGtleGVjIC1sICIkWEVOX0hZUEVSVklTT1Ii
IC0tY29tbWFuZC1saW5lPSIkWEVOX0NNRCINCj4+ICAgPj4+PiBDb3VsZCBub3QgZmluZCBh
IGZyZWUgYXJlYSBvZiBtZW1vcnkgb2YgMHgzYjYwMDEgYnl0ZXMuLi4NCj4+ICAgPj4+PiBl
bGZfZXhlY19idWlsZF9sb2FkX3JlbG9jYXRhYmxlOiBFTEYgZXhlYyBsb2FkIGZhaWxlZA0K
Pj4gICA+Pj4+DQo+PiAgID4+Pj4gMy4gQXR0ZW1wdCB0byBsb2FkIFhlbiA0LjIwLWRldjoN
Cj4+ICAgPj4+Pg0KPj4gICA+Pj4+ICMga2V4ZWMgLWwgIiRYRU5fSFlQRVJWSVNPUiIgLS1j
b21tYW5kLWxpbmU9IiRYRU5fQ01EIg0KPj4gICA+Pj4+IENvdWxkIG5vdCBmaW5kIGEgZnJl
ZSBhcmVhIG9mIG1lbW9yeSBvZiAweDNmODAwMSBieXRlcy4uLg0KPj4gICA+Pj4+IGVsZl9l
eGVjX2J1aWxkX2xvYWRfcmVsb2NhdGFibGU6IEVMRiBleGVjIGxvYWQgZmFpbGVkDQo+PiAg
ID4+Pj4NCj4+ICAgPj4+PiA0LiBBdHRlbXB0IHRvIGxvYWQgWGVuIDQuMTcgKGZyb20gZGVi
aWFuIHJyZXBvc2l0b3JpZXMpOg0KPj4gICA+Pj4+ICMga2V4ZWMgLWwgL2Jvb3QveGVuLTQu
MTctYW1kNjQuZ3ogLS1jb21tYW5kLWxpbmU9IiRYRU5fQ01EIg0KPj4gICA+Pj4+IENvdWxk
IG5vdCBmaW5kIGEgZnJlZSBhcmVhIG9mIG1lbW9yeSBvZiAweDNiNDAwMSBieXRlcy4uLg0K
Pj4gICA+Pj4+IGVsZl9leGVjX2J1aWxkX2xvYWRfcmVsb2NhdGFibGU6IEVMRiBleGVjIGxv
YWQgZmFpbGVkDQo+PiAgID4NCj4+ICAgPiBBbmQgd2l0aCBhbGwgb2YgdGhlbSBzYXlpbmcg
ZWZmZWN0aXZlbHkgdGhlIHNhbWUsIGRpZCB5b3UgdmVyaWZ5IHlvdQ0KPj4gICA+IGFjdHVh
bGx5IGhhdmUgYSBzdWZmaWNpZW50bHkgbGFyZ2UgYXJlYSByZXNlcnZlZD8gVGhlIG9idmlv
dXMNCj4+ICAgPiBwbGFjZSBmb3IgeW91IHRvIGxvb2sgYXQgaXMgWGVuJ3MgYm9vdCBsb2cg
KG9idGFpbmVkIHZpYSBzZXJpYWwNCj4+ICAgPiBjb25zb2xlIG9yICJ4bCBkbWVzZyIgaW1t
ZWRpYXRlbHkgYWZ0ZXIgYm9vdGluZyB0aGUgc3lzdGVtKS4gSWYgeW91DQo+PiAgID4gZmlu
ZCBldmVyeXRoaW5nIGFzIGV4cGVjdGVkIHRoZXJlLCAuLi4NCj4+ICAgPg0KPj4gICA+Pj4+
IElmIHlvdSBuZWVkIGFueSBmdXJ0aGVyIGluZm9ybWF0aW9uIHRvIGludmVzdGlnYXRlIHRo
aXMgcHJvYmxlbSwNCj4+ICAgPj4+PiBwbGVhc2UgbGV0IG1lIGtub3cuDQo+PiAgID4NCj4+
ICAgPiAuLi4gcGxlYXNlIHByb3ZpZGUgdGhhdCBib290IGxvZy4NCj4+DQo+PiBJIGhhdmUg
YWxzbyBmb2xsb3dlZCB1cCBvbiB5b3VyIHN1Z2dlc3Rpb24gdG8gY2hlY2sgdGhlIFhlbiBi
b290IGxvZw0KPj4gdXNpbmcgInhsIGRtZXNnIiwgYnV0IHVuZm9ydHVuYXRlbHksIEkgcmVj
ZWl2ZWQgdGhlIGZvbGxvd2luZyBlcnJvcjoNCj4+DQo+PiB4ZW5jYWxsOiBlcnJvcjogQ291
bGQgbm90IG9idGFpbiBoYW5kbGUgb24gcHJpdmlsZWdlZCBjb21tYW5kIGludGVyZmFjZToN
Cj4+IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkNCj4+IGxpYnhsOiBlcnJvcjogbGlieGwu
YzoxMDI6bGlieGxfY3R4X2FsbG9jOiBjYW5ub3Qgb3BlbiBsaWJ4YyBoYW5kbGU6IE5vDQo+
PiBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5DQo+PiBjYW5ub3QgaW5pdCB4bCBjb250ZXh0DQo+
Pg0KPj4gVGhpcyBpbmRpY2F0ZXMgdGhhdCBYZW4gZGlkIG5vdCBib290IHN1Y2Nlc3NmdWxs
eSwgc28gdGhlcmUgYXJlIG5vIGxvZ3MNCj4+IGF2YWlsYWJsZS4NCj4gDQo+IFRoZSBmYWN0
IHRoYXQgeW91IGhhdmUgRG9tMCB1cCBtYWtlcyBjbGVhciB0aGF0IFhlbiBib290ZWQgb2th
eShpc2gpLiBUaGUNCj4gZmFjdCB0aGF0IHlvdSBnZXQgIk5vIHN1Y2ggZmlsZSBvciBkaXJl
Y3RvcnkiIGZyb20geGVuY2FsbCBzdWdnZXN0cyB5b3UNCj4gZWl0aGVyIGRpZG4ndCBsb2Fk
IHRoZSB4ZW4tcHJpdmNtZCBkcml2ZXIgKG5vcm1hbGx5IGFycmFuZ2VtZW50cyBhcmUgbWFk
ZQ0KPiBieSBkaXN0cm9zIGZvciB0aGlzIHRvIGhhcHBlbiBhdXRvbWF0aWNhbGx5KSwgb3Ig
eW91IGRpZG4ndCBldmVuIGJ1aWxkIGl0Lg0KDQpUaGUgbWVzc2FnZXMgc2VlbiBkb24ndCBp
bmRpY2F0ZSB0aGF0IFhlbiBib290ZWQgb2theShpc2gpLiBJIGdldCB0aGUgc2FtZQ0KbWVz
c2FnZXMgd2hlbiBoYXZpbmcgYm9vdGVkIHRoZSBMaW51eCBrZXJuZWwgb24gYmFyZSBtZXRh
bCB3aXRob3V0IFhlbi4NCg0KPiANCj4+ICAgPiBBbmQgd2l0aCBhbGwgb2YgdGhlbSBzYXlp
bmcgZWZmZWN0aXZlbHkgdGhlIHNhbWUsIGRpZCB5b3UgdmVyaWZ5IHlvdQ0KPj4gICA+IGFj
dHVhbGx5IGhhdmUgYSBzdWZmaWNpZW50bHkgbGFyZ2UgYXJlYSByZXNlcnZlZD8gVGhlIG9i
dmlvdXMNCj4+ICAgPiBwbGFjZSBmb3IgeW91IHRvIGxvb2sgYXQgaXMgWGVuJ3MgYm9vdCBs
b2cgKG9idGFpbmVkIHZpYSBzZXJpYWwNCj4+ICAgPiBjb25zb2xlIG9yICJ4bCBkbWVzZyIg
aW1tZWRpYXRlbHkgYWZ0ZXIgYm9vdGluZyB0aGUgc3lzdGVtKS4gSWYgeW91DQo+PiAgID4g
ZmluZCBldmVyeXRoaW5nIGFzIGV4cGVjdGVkIHRoZXJlLCAuLi4NCj4+ICAgPg0KPj4NCj4+
IEluIGFuIGF0dGVtcHQgdG8gcmVzb2x2ZSB0aGUgbWVtb3J5IGFsbG9jYXRpb24gaXNzdWUs
IEkgaGF2ZSB0cmllZCB0aGUNCj4+IGZvbGxvd2luZzoNCj4+DQo+PiBBZGRlZCBhIGNyYXNo
a2VybmVsPTxzaXplPkA8b2Zmc2V0PiBwYXJhbWV0ZXIgdG8gdGhlIGhvc3Qga2VybmVsIGNv
bW1hbmQNCj4+IGxpbmUgdG8gcmVzZXJ2ZSBhIGRlZGljYXRlZCBtZW1vcnkgcmVnaW9uIGZv
ciBrZXhlYywgYW5kIGF0dGVtcHRlZCB0bw0KPj4gbG9hZCBYZW4gaW50byB0aGF0IGFyZWEu
DQo+IA0KPiBUaGF0IHdhcyBhIHJlbW90ZSBndWVzcyBvZiBtaW5lLiBUaGlzIGNvbW1hbmQg
bGluZSBvcHRpb24gaXMgbWVhbmluZ2xlc3MNCj4gd2hlbiBydW5uaW5nIHVuZGVyIFhlbi4g
VGhlIHJlc2VydmF0aW9uIG5lZWRzIHRvIGJlIGRvbmUgaW4gWGVuLg0KDQpKdXN0IG9uZSB0
aGluZyB0byBhZGQgaGVyZTogd2hhdCBkbyB5b3Ugd2FudCB0byBhY2NvbXBsaXNoIGJ5IGtl
eGVjLWluZyBpbnRvDQpYZW4/IFlvdSBuZWVkIHRvIHNwZWNpZnkgYSBkb20wIGtlcm5lbCBh
bmQgcHJvYmFibHkgdGhlIGRvbTAncyBpbml0cmQsIHRvby4NCg0KT3IgZG8geW91IGhhdmUg
Y29uZmlndXJlZCB5b3VyIGRvbTAgdG8gd29yayB3aXRob3V0IGFuIGluaXRyZD8gRXZlbiBp
biB0aGlzDQpjYXNlIHlvdSdkIG5lZWQgdG8gcGFzcyBvbiB0aGUgZG9tMCB0byBYZW4gdmlh
IHRoZSBrZXhlYyBjb21tYW5kLg0KDQoNCkp1ZXJnZW4NCg==
--------------LHsUp8Nk0UKDkSsiuvmY99VN
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------LHsUp8Nk0UKDkSsiuvmY99VN--

--------------DN8FSuVoJn0UraqDFj85p3Ja--

--------------MauQ67W1CiCmNyumbihs2Qec
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmawhMUFAwAAAAAACgkQsN6d1ii/Ey/9
gAf/SZegv69LmeqHP2DNggDDH7lqmngG29cLY2rICRpWNhm33cI83L98CW6n4t/wkFDxTO8AwCX8
EQ0zKDIdi6yy5vZlJHmbQx68ov0T7sA2iMx2agkoi5rNxl++CMlz/kBO5iBqjajOmmz7xMr8xTQ0
0DN8KKGMdx4V0X/ukYNKMapwO9/eiwQ+XZArry47tvZFhHMuWsfIO6VatUjz/M5Ya4VxW3CCTDgz
JEhjNtLS2FrYwzSCON3bB2MrP8dXV5mZqugi4zA3n4/il4y3zvoGfxDTV17wcFLdLtfz5txNLH4j
FuQVAduTA63qt/MnewRk1TNzsPMTQcf4BjqpSGDqcg==
=XDjq
-----END PGP SIGNATURE-----

--------------MauQ67W1CiCmNyumbihs2Qec--

