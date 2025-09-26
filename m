Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F11BA28E7
	for <lists+xen-devel@lfdr.de>; Fri, 26 Sep 2025 08:43:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1131069.1470291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v22Ae-0006dJ-5I; Fri, 26 Sep 2025 06:43:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1131069.1470291; Fri, 26 Sep 2025 06:43:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v22Ae-0006ai-1h; Fri, 26 Sep 2025 06:43:08 +0000
Received: by outflank-mailman (input) for mailman id 1131069;
 Fri, 26 Sep 2025 06:43:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ywWV=4F=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1v22Ac-0006ac-Lg
 for xen-devel@lists.xenproject.org; Fri, 26 Sep 2025 06:43:06 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e471162-9aa4-11f0-9d14-b5c5bf9af7f9;
 Fri, 26 Sep 2025 08:43:05 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8BA523780B;
 Fri, 26 Sep 2025 06:43:03 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0024F1386E;
 Fri, 26 Sep 2025 06:43:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id xMyoN/Y11mheVgAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 26 Sep 2025 06:43:02 +0000
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
X-Inumbo-ID: 0e471162-9aa4-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1758868984; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=s95gG8P6E+JOosFV8j1P+CDQDaWDLCmy7Zvv46XlY4Q=;
	b=At2l4p9rPjjCQDlPa3InSeYZ2kcNp+ZZmR89kF58IbpSITAe5CacHUVhfryr7ktZgwI3Ma
	mf3e1qm4GIFLXD7npbyOLw2SAHukBW6RGjV9ww4UBS28Yqmo+nFznLWl0YpEgVMQh9yKVa
	KOryntfR5whUSJVq9xCzw8iE8QP0+hs=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=lMhdDjyi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1758868983; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=s95gG8P6E+JOosFV8j1P+CDQDaWDLCmy7Zvv46XlY4Q=;
	b=lMhdDjyindCEZ6OkEcXv4OX4VcYCDQoIITv0qcN7wR4pVJzOYa70wBJwoZNuYcJ8ja6Rz2
	/v4WHVX4zMDmvw2VnILRTEDLvShqCKuyQ1/ZL8x8MkgC0Mj9w99E4+4jfBYwRDl6pyX174
	l2xVXlsnscF/o7a7FsKGDSbHQT0ZbNw=
Message-ID: <f0f05356-997b-411c-a557-9df20bb3e91f@suse.com>
Date: Fri, 26 Sep 2025 08:43:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] CHANGELOG.md: Update for 4.21 release cycle
To: Jan Beulich <jbeulich@suse.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: committers@xenproject.org,
 Community Manager <community.manager@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <20250924093604.17110-1-oleksii.kurochko@gmail.com>
 <814501c8-94e3-4930-87ed-88e7506456ed@suse.com>
 <97488f35-3f94-42b0-8443-4feacf3d587d@gmail.com>
 <68350569-4e53-4845-b3df-22ec15e4ee30@suse.com>
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
In-Reply-To: <68350569-4e53-4845-b3df-22ec15e4ee30@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Wqa2F5vdNx0iwsQO7dYkyecv"
X-Spamd-Result: default: False [-3.91 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[suse.com,gmail.com];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:mid,suse.com:dkim]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 8BA523780B
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.91

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Wqa2F5vdNx0iwsQO7dYkyecv
Content-Type: multipart/mixed; boundary="------------WR8t6nSfrv6VcY6eAP63Wzdc";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: committers@xenproject.org,
 Community Manager <community.manager@xenproject.org>,
 xen-devel@lists.xenproject.org
Message-ID: <f0f05356-997b-411c-a557-9df20bb3e91f@suse.com>
Subject: Re: [PATCH] CHANGELOG.md: Update for 4.21 release cycle
References: <20250924093604.17110-1-oleksii.kurochko@gmail.com>
 <814501c8-94e3-4930-87ed-88e7506456ed@suse.com>
 <97488f35-3f94-42b0-8443-4feacf3d587d@gmail.com>
 <68350569-4e53-4845-b3df-22ec15e4ee30@suse.com>
In-Reply-To: <68350569-4e53-4845-b3df-22ec15e4ee30@suse.com>
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

--------------WR8t6nSfrv6VcY6eAP63Wzdc
Content-Type: multipart/mixed; boundary="------------lA3Ugdz2eb0EE437sc6RV1yr"

--------------lA3Ugdz2eb0EE437sc6RV1yr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjYuMDkuMjUgMDc6NDksIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyNS4wOS4yMDI1
IDIyOjIyLCBPbGVrc2lpIEt1cm9jaGtvIHdyb3RlOg0KPj4gT24gOS8yNS8yNSA4OjI2IEFN
LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+PiBPbiAyNC4wOS4yMDI1IDExOjM2LCBPbGVrc2lp
IEt1cm9jaGtvIHdyb3RlOg0KPj4+PiAtLS0gYS9DSEFOR0VMT0cubWQNCj4+Pj4gKysrIGIv
Q0hBTkdFTE9HLm1kDQo+Pj4+IEBAIC0xNCw2ICsxNCw3IEBAIFRoZSBmb3JtYXQgaXMgYmFz
ZWQgb24gW0tlZXAgYSBDaGFuZ2Vsb2ddKGh0dHBzOi8va2VlcGFjaGFuZ2Vsb2cuY29tL2Vu
LzEuMC4wLykNCj4+Pj4gICAgIC0gRGViaWFuIFRyaXhpZSBhZGRlZCB0byBDSS4gIERlYmlh
biBCdWxsc2V5ZSByZXRpcmVkIGZyb20gQ0kgZm9yIFJJU0MtViBkdWUNCj4+Pj4gICAgICAg
dG8gdGhlIGJhc2VsaW5lIGNoYW5nZS4NCj4+Pj4gICAgIC0gTGludXggYmFzZWQgZGV2aWNl
IG1vZGVsIHN0dWJkb21haW5zIGFyZSBub3cgZnVsbHkgc3VwcG9ydGVkLg0KPj4+PiArIC0g
UmVtb3ZlIGxpYnhlbmN0cmwgdXNhZ2UgZnJvbSB4ZW5zdG9yZWQuDQo+Pj4+ICAgIA0KPj4+
PiAgICAgLSBPbiB4ODY6DQo+Pj4+ICAgICAgIC0gUmVzdHJpY3QgdGhlIGNhY2hlIGZsdXNo
aW5nIGRvbmUgYXMgYSByZXN1bHQgb2YgZ3Vlc3QgcGh5c2ljYWwgbWVtb3J5IG1hcA0KPj4+
PiBAQCAtMjEsNiArMjIsNyBAQCBUaGUgZm9ybWF0IGlzIGJhc2VkIG9uIFtLZWVwIGEgQ2hh
bmdlbG9nXShodHRwczovL2tlZXBhY2hhbmdlbG9nLmNvbS9lbi8xLjAuMC8pDQo+Pj4+ICAg
ICAgIC0gQWxsb3cgY29udHJvbGxpbmcgdGhlIE1UUlIgY2FjaGUgYXR0cmlidXRlIG9mIHRo
ZSBYZW4gcGxhdGZvcm0gUENJIGRldmljZQ0KPj4+PiAgICAgICAgIEJBUiBmb3IgSFZNIGd1
ZXN0cywgdG8gaW1wcm92ZSBwZXJmb3JtYW5jZSBvZiBndWVzdHMgdXNpbmcgaXQgdG8gbWFw
IHRoZQ0KPj4+PiAgICAgICAgIGdyYW50IHRhYmxlIG9yIGZvcmVpZ24gbWVtb3J5Lg0KPj4+
PiArICAgLSBBbGxvdyB0byB1bmZsYXR0ZW4gRFRzLg0KPj4+IFdoYXQgaXMgdGhpcyBhYm91
dD8gVGhlcmUgY29udGludWVzIHRvIGJlIG5vIHVzZSBvZiBEVCBvbiB4ODYsIHNvIHdpdGhv
dXQgY29udGV4dA0KPj4+IHRoaXMgZmVlbHMgcHJldHR5IG11Y2ggbWVhbmluZ2xlc3MgdG8g
bWUuDQo+Pg0KPj4gSSBhbSByZWZlcnJpbmcgdG9odHRwczovL2xvcmUua2VybmVsLm9yZy94
ZW4tZGV2ZWwvMjAyNTA3MjIwMDA1MjUuNzI0Ny0xLWFsZWphbmRyby5nYXJjaWF2YWxsZWpv
QGFtZC5jb20vLg0KPiANCj4gU3VyZSwgYnV0IHdoYXQgcHJhY3RpY2FsIHVzZSBkb2VzIHRo
aXMgaGF2ZSBmb3IgYW55b25lIHVzaW5nIFhlbj8NCj4gDQo+Pj4+IEBAIC0zNiwxMSArMzgs
MjAgQEAgVGhlIGZvcm1hdCBpcyBiYXNlZCBvbiBbS2VlcCBhIENoYW5nZWxvZ10oaHR0cHM6
Ly9rZWVwYWNoYW5nZWxvZy5jb20vZW4vMS4wLjAvKQ0KPj4+PiAgICAgICAtIFN1cHBvcnQg
aW4gaHZtbG9hZGVyIGZvciBuZXcgU01CSU9TIHRhYmxlczogNyAoQ2FjaGUgSW5mbyksIDgg
KFBvcnQNCj4+Pj4gICAgICAgICBDb25uZWN0b3IpLCA5IChTeXN0ZW0gU2xvdHMpLCAyNiAo
Vm9sdGFnZSBQcm9iZSksIDI3IChDb29saW5nIERldmljZSksDQo+Pj4+ICAgICAgICAgYW5k
IDI4IChUZW1wZXJhdHVyZSBQcm9iZSkuDQo+Pj4+ICsgICAtIEJhc2ljIGtleGVjIHN1cHBv
cnQgdG8gTWluaS1PUyBmb3IgcnVubmluZyBpbiBQVkggbW9kZS4NCj4+PiBIbW0sIE1pbmlP
UyBpc24ndCBhbiBpbnRlZ3JhbCBwYXJ0IG9mIGEgWGVuIHJlbGVhc2UsIHNvIEkgd29uZGVy
IGlmIHN1Y2ggcmVhbGx5DQo+Pj4gYmVsb25ncyBoZXJlLiBZZXMsIEkgYWxzbyB1bmRlcnN0
YW5kIHRoYXQgdGhlcmUncyBub3QgcmVhbGx5IGFueXdoZXJlIGVsc2UgdG8NCj4+PiBwdXQg
c3VjaC4NCj4+DQo+PiBJIGRlY2lkZWQgdG8gcHV0IGl0IGhlcmUgc2luY2Ugd2UgaW5jbHVk
ZSBpbmZvcm1hdGlvbiBhYm91dCBzdHViZG9tcyBpbnxDSEFOR0VMT0cubWR8LA0KPj4gYW5k
IE1pbmlPUyBpcyByZWxhdGVkIHRvIHRoYXQuDQo+IA0KPiBTdHViZG9tIGNvZGUgaXMgcGFy
dCBvZiB0aGUgZ2l0IHJlcG8gYW5kIGhlbmNlIHRoZSB0YXJiYWxsLiBNaW5pT1MgaXNuJ3Qu
DQoNClJpZ2h0LiBUaGUga2V4ZWMgc3VwcG9ydCBpbiBNaW5pLU9TIHdhcyBwcmltYXJpbHkg
YWRkZWQgaW4gb3JkZXIgdG8gc3VwcG9ydA0KUFZIIHhlbnN0b3JlLXN0dWJkb20gbGl2ZSB1
cGRhdGUuIFRoaXMgaGFzIGFscmVhZHkgYmVlbiBhZGRlZCB0byB0aGUgY2hhbmdlbG9nLA0K
c28gdGhlcmUgaXMgbm8gcmVhbCByZWFzb24gdG8gbWVudGlvbiB0aGUgTWluaS1PUyBjaGFu
Z2UgaGVyZSBhcyB3ZWxsLg0KDQoNCkp1ZXJnZW4NCg==
--------------lA3Ugdz2eb0EE437sc6RV1yr
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------lA3Ugdz2eb0EE437sc6RV1yr--

--------------WR8t6nSfrv6VcY6eAP63Wzdc--

--------------Wqa2F5vdNx0iwsQO7dYkyecv
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmjWNfYFAwAAAAAACgkQsN6d1ii/Ey+w
jwf+IFnnvyqZkZsnchbRiNzXP58VuBQhgB0S2WmEsXXD0CGEDabs1lFxRoa1MZVNNC1z/bix2AZy
swEnJVo5o8gGpPyoEW44Dv3M2mGuybCB/tpQvQdfqRJPOFu/jlMYb0AgMknLx5BfV4Fv7ClsQnTy
zXUNgFJBlVTOVQVrZcGCfIHwj+zFbb4/hju4EIEMmzkOAVc5PD0ZsHrvyhyDlWodf8QVDAr6jPbH
UDmNEZtnFX8OeL4qQ5/cph5oPN3DL7pMmLmo3Ap/eloaCMTCO53WidAX5azg519pV4YyATKmTdOk
sZx8w2lbgPGGnTvqjFKye9surb8nkxBR3agQPU6ClA==
=4+Vu
-----END PGP SIGNATURE-----

--------------Wqa2F5vdNx0iwsQO7dYkyecv--

