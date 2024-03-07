Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B4D874E9D
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 13:07:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689843.1075195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riCX6-0000hb-3L; Thu, 07 Mar 2024 12:07:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689843.1075195; Thu, 07 Mar 2024 12:07:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riCX6-0000eW-0D; Thu, 07 Mar 2024 12:07:32 +0000
Received: by outflank-mailman (input) for mailman id 689843;
 Thu, 07 Mar 2024 12:07:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+8gn=KN=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1riCX4-0000eQ-16
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 12:07:30 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 44338b7c-dc7b-11ee-a1ee-f123f15fe8a2;
 Thu, 07 Mar 2024 13:07:28 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D65E28CB76;
 Thu,  7 Mar 2024 11:24:07 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9883D12FC5;
 Thu,  7 Mar 2024 11:24:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 6HQyI9ej6WXTNgAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 07 Mar 2024 11:24:07 +0000
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
X-Inumbo-ID: 44338b7c-dc7b-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1709810649; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=5cqPX6N+wH9KRuiabw7On6KIb8naTRpV4GZkL3aitYg=;
	b=lOZdJF2PXSuKW392+rZRs4LrXuTEaHsQKMFQXUx1wA4WOLESogRtJH+G3Zl2kWthQD0TI5
	XIqp4TpL39knYbP5ni+jTuiqK7DFbeCtQcqq0WklUyniFpq88el4i3pWCSEUADUC3/izOv
	pNd6NB79s4SEqh/iWGWNQ2bW9xf7F5Q=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1709810647; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=5cqPX6N+wH9KRuiabw7On6KIb8naTRpV4GZkL3aitYg=;
	b=AOURSnBendg5+AmvYTPseHZmci+i7C+9T56oNoWDS5Swi8xSmVUAiiiMEtDoEyOsIvGfVl
	VaJuMa7WcxDs211UxXldrKIL1bG+0d6HSdb60uE6bkcp6lv2iWgY1gBWog4mKrV/y+mBpG
	3IX0Y8LcUSX/ZdIZEQrb+b0WKU88cp4=
Message-ID: <833782ae-9699-492a-9d18-2644873c97c7@suse.com>
Date: Thu, 7 Mar 2024 12:24:06 +0100
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
 boundary="------------GzcNd0SKpWreGVsULyqzyjZh"
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-1.06 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BAYES_HAM(-0.07)[62.34%];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 HAS_ATTACHMENT(0.00)[];
	 MIME_BASE64_TEXT_BOGUS(1.00)[];
	 RCPT_COUNT_FIVE(0.00)[5];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 MIME_BASE64_TEXT(0.10)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email];
	 SIGNED_PGP(-2.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[];
	 MIME_UNKNOWN(0.10)[application/pgp-keys]
X-Spam-Score: -1.06
X-Spam-Flag: NO

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------GzcNd0SKpWreGVsULyqzyjZh
Content-Type: multipart/mixed; boundary="------------FSFWKrraijj73rt1GB8oAUQR";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Henry Wang <xin.wang2@amd.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Message-ID: <833782ae-9699-492a-9d18-2644873c97c7@suse.com>
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

--------------FSFWKrraijj73rt1GB8oAUQR
Content-Type: multipart/mixed; boundary="------------0pZQSts9OenJZFun8DJNO4JD"

--------------0pZQSts9OenJZFun8DJNO4JD
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
aW4ud2FuZzJAYW1kLmNvbT4NCj4gLS0tDQo+ICAgdG9vbHMvOXBmc2QvaW8uYyB8IDEyICsr
KysrKysrKysrLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvOXBmc2QvaW8uYyBiL3Rvb2xz
LzlwZnNkL2lvLmMNCj4gaW5kZXggYWRiODg3YzdkOS4uMmI4MGM5NTI4ZCAxMDA2NDQNCj4g
LS0tIGEvdG9vbHMvOXBmc2QvaW8uYw0KPiArKysgYi90b29scy85cGZzZC9pby5jDQo+IEBA
IC02ODAsOCArNjgwLDE4IEBAIHN0YXRpYyBib29sIG5hbWVfb2soY29uc3QgY2hhciAqc3Ry
KQ0KPiAgIHN0YXRpYyB2b2lkIHA5X2Vycm9yKHN0cnVjdCByaW5nICpyaW5nLCB1aW50MTZf
dCB0YWcsIHVpbnQzMl90IGVycikNCj4gICB7DQo+ICAgICAgIHVuc2lnbmVkIGludCBlcnJv
ZmY7DQo+ICsgICAgc3RhdGljIHB0aHJlYWRfbXV0ZXhfdCBtdXRleCA9IFBUSFJFQURfTVVU
RVhfSU5JVElBTElaRVI7DQo+ICsgICAgY2hhciAqc3RyZXJyb3Jfc3RyOw0KPiArICAgIFJJ
TkdfSURYIHN0cmVycm9yX2xlbiA9IDAsIGNvcHlfbGVuID0gMDsNCj4gKw0KPiArICAgIHB0
aHJlYWRfbXV0ZXhfbG9jaygmbXV0ZXgpOw0KPiArICAgIHN0cmVycm9yX3N0ciA9IHN0cmVy
cm9yKGVycik7DQo+ICsgICAgc3RyZXJyb3JfbGVuID0gc3RybGVuKHN0cmVycm9yX3N0cikg
KyAxOw0KPiArICAgIGNvcHlfbGVuID0gbWluKHN0cmVycm9yX2xlbiwgcmluZy0+cmluZ19z
aXplKTsNCg0KSG1tLCBJIHRoaW5rIHdlIGV2ZW4gX25lZWRfIHRvIGNhcCB0aGUgc3RyaW5n
IGVhcmxpZXIuDQoNCkEgc3RyaW5nIGluIHRoZSA5cGZzIHByb3RvY29sIGlzIGEgMiBieXRl
IGxlbmd0aCBmaWVsZCBwbHVzIHRoZSBzdHJpbmcuDQpJbiBjYXNlIG9mIGEgcmluZyBsYXJn
ZXIgdGhhbiA2NTUzNSBieXRlcyB0aGlzIHdvdWxkIG1lYW4gdGhlIHJlc3VsdCBvZg0Kc3Ry
ZXJyb3IoKSBjb3VsZCAoaW4gdGhlb3J5KSBvdmVyZmxvdyB0aGUgc3RyaW5nIGZvcm1hdCBv
ZiA5cGZzLg0KDQpBZGRpdGlvbmFsbHkgdGhlIHN0cmluZyBzaG91bGQgYmUgYSBfc2hvcnRf
IGRlc2NyaXB0aW9uIG9mIHRoZSBlcnJvciwgc28NCkknZCBsaWtlIHRvIHN1Z2dlc3QgdG8g
bm90IHVzZSByaW5nX3NpemUgYXMgdGhlIHVwcGVyIGJvdW5kIGZvciB0aGUgc3RyaW5nDQps
ZW5ndGgsIGJ1dCBhIGZpeGVkIHZhbHVlIGRlZmluZWQgYXMgYSBtYWNybywgZS5nLjoNCg0K
I2RlZmluZSBNQVhfRVJSU1RSX0xFTiA4MA0KDQoNCkp1ZXJnZW4NCg==
--------------0pZQSts9OenJZFun8DJNO4JD
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------0pZQSts9OenJZFun8DJNO4JD--

--------------FSFWKrraijj73rt1GB8oAUQR--

--------------GzcNd0SKpWreGVsULyqzyjZh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmXpo9cFAwAAAAAACgkQsN6d1ii/Ey91
Cgf9FnPKd6RXvkNEMfSIgi8vMgYxA5pjzh3zvHk2UB3N0sET7R4P5ehZiCaBBB4eXXozj+J4qKyw
ucLVJYS0CnXvQ0aDys5oto62oKnHdUJcIZHcZNpYD8/qRyH51gFGUy1MQARqWLRsr7jGrW99O2xG
j4MW8Mk030ZsA4u1CiI4O6JJD9pORfJ8xPsB03q46eay5pTRSCckHdnXx4BmQOjr8flTZUxgZfDF
mm7Ok9sllGD2AdC4vJVwrXtJbqU5Y9plpAdeWaD3bupb4u5vBEEYIWFlUEh2FDBNe1ESLM3t2k58
seCuPxDKTZlhxUsICETvwxI2SRbw6YgivUYJfCYM6A==
=zZBy
-----END PGP SIGNATURE-----

--------------GzcNd0SKpWreGVsULyqzyjZh--

