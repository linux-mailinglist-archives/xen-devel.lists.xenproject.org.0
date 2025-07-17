Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 760CBB08860
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 10:50:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046415.1416739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucKK4-0007j3-AY; Thu, 17 Jul 2025 08:50:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046415.1416739; Thu, 17 Jul 2025 08:50:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucKK4-0007ga-7k; Thu, 17 Jul 2025 08:50:36 +0000
Received: by outflank-mailman (input) for mailman id 1046415;
 Thu, 17 Jul 2025 08:50:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XrhN=Z6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ucKK3-0007gU-Et
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 08:50:35 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 195f46eb-62eb-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 10:50:33 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9BD2B216D8;
 Thu, 17 Jul 2025 08:50:31 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 664B71392A;
 Thu, 17 Jul 2025 08:50:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id t9kvF1e5eGjZSwAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 17 Jul 2025 08:50:31 +0000
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
X-Inumbo-ID: 195f46eb-62eb-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1752742231; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=+VC905bNPaJ1geqvbDMZTVVWoAHjexZrFq2zeDLayDM=;
	b=gXKFgOgepHRSnE7lB0lLRMad6HAV8b9LZjYSRuA9nK9hMOuOfegwyLWIs1GcwAXoBU5a7X
	Y1gU7ARR0TCYQ2kT1kHgVOUImH8WWLXnrHTxGKQn+xXKLjnn3BTjQwf3yc6SUB7vhoEzwh
	C+rNabU21wHIJ2h1T0asX+X1Q8RFky4=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=gXKFgOge
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1752742231; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=+VC905bNPaJ1geqvbDMZTVVWoAHjexZrFq2zeDLayDM=;
	b=gXKFgOgepHRSnE7lB0lLRMad6HAV8b9LZjYSRuA9nK9hMOuOfegwyLWIs1GcwAXoBU5a7X
	Y1gU7ARR0TCYQ2kT1kHgVOUImH8WWLXnrHTxGKQn+xXKLjnn3BTjQwf3yc6SUB7vhoEzwh
	C+rNabU21wHIJ2h1T0asX+X1Q8RFky4=
Message-ID: <5c6cfc84-e1e0-427b-92ec-f01ebda1f4c8@suse.com>
Date: Thu, 17 Jul 2025 10:50:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/17] tools/xenstored: Auto-introduce domains
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <20250716211504.291104-1-jason.andryuk@amd.com>
 <20250716211504.291104-15-jason.andryuk@amd.com>
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
In-Reply-To: <20250716211504.291104-15-jason.andryuk@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0TFfI8kRG6zwqSH8tIAYAL0X"
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 9BD2B216D8
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-5.41 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:dkim,suse.com:mid]
X-Spam-Score: -5.41

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0TFfI8kRG6zwqSH8tIAYAL0X
Content-Type: multipart/mixed; boundary="------------YM2UqF0H0uliKP75Jlpsugoi";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
Message-ID: <5c6cfc84-e1e0-427b-92ec-f01ebda1f4c8@suse.com>
Subject: Re: [PATCH v2 14/17] tools/xenstored: Auto-introduce domains
References: <20250716211504.291104-1-jason.andryuk@amd.com>
 <20250716211504.291104-15-jason.andryuk@amd.com>
In-Reply-To: <20250716211504.291104-15-jason.andryuk@amd.com>

--------------YM2UqF0H0uliKP75Jlpsugoi
Content-Type: multipart/mixed; boundary="------------ehFpsPLZ03GFsvbCIYpovq3C"

--------------ehFpsPLZ03GFsvbCIYpovq3C
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTYuMDcuMjUgMjM6MTUsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IFJlcGxhY2UgZG9t
MF9pbml0KCkgd2l0aCBpbml0X2RvbWFpbnMoKSB3aGljaCB1c2VzIGxpYnhlbm1hbmFnZSB0
bw0KPiBpdGVyYXRlIHRocm91Z2ggYWxsIGV4aXN0aW5nIGRvbWFpbnMgYW5kIGludHJvZHVj
ZSB0aGVtLg0KPiANCj4gZG9tMF9kb21pZCBpcyB1cGRhdGVkIHdpdGggdGhlIHhlbnN0b3Jl
IGRvbWFpbiwgc2luY2UgaXQgcmVhbGx5DQo+IGluZGljYXRlcyB0aGUgbG9jYWwgZG9tYWlu
Lg0KDQpJIGFncmVlIHdpdGggdGhhdCBleHBsYW5hdGlvbiwgYnV0IEkgd29uZGVyIHdoZXRo
ZXIgdGhpcyBleHBsYW5hdGlvbg0KZG9lc24ndCBpbmRpY2F0ZSB0aGF0IGEgcmVuYW1lIG9m
IHRoZSBkb20wX2RvbWlkIHZhcmlhYmxlIGlzIHdhbnRlZCwNCmUuZy4gdG8gInN0b3JlX2Rv
bWlkIi4NCg0KPiBwcml2X2RvbWlkIGlzIHNldCB0byB0aGUgY29udHJvbCBkb21haW4uICBU
aGlzIG1ha2VzIGl0IGxpbWl0ZWQgdG8gYQ0KPiBzaW5nbGUgZG9tYWluLg0KDQpNYXliZSBh
bm90aGVyIGNhbmRpZGF0ZSBmb3IgcmVuYW1pbmcgKGN0cmxfZG9taWQ/KS4NCg0KPiBUaGVz
ZSBmZWF0dXJlcyBsZXQgeGVuc3RvcmUgYXV0b21hdGljYWxseSBjb25uZWN0IGFueSBleGlz
dGluZyBkb21haW5zLA0KPiB3aGljaCBtZWFucyBpdCBkb2Vzbid0IG5lZWQgdG8gYmUgZG9u
ZSBtYW51YWxseSBmcm9tIGluaXQtZG9tMGxlc3MuDQo+IA0KPiBGb3IgYSBsZWdhY3kgZG9t
MCwgdGhlIHJlc3VsdCBzaG91bGQgYmUgdW5jaGFuZ2VkLg0KPiANCj4gRm9yIGEgbGF0ZSB4
ZW5zdG9yZSBzdHViZG9tIGl0IHNob3VsZCBhbHNvIGJlIHRoZSBzYW1lLCBidXQgcHJpdl9k
b21pZA0KPiB3b3VsZCBiZSBzZXQgYXV0b21hdGljYWxseSB0byBjb250cm9sIGRvbWFpbiAo
d2hpY2ggZGVmYXVsdCB0byAwDQo+IG5vcm1hbGx5KS4NCj4gDQo+IEFsd2F5cyBzaWduYWwg
dGhlIGV2ZW50IGNoYW5uZWwgZm9yIGluaXRpYWwgZG9tYWlucy4gIFRoaXMgZ2V0cyBkb20w
IChhDQo+IGxvY2FsIHhlbnN0b3JlZCBkb21haW4pIHRvIGNvbm5lY3QuDQo+IA0KPiBBbHNv
IGFsd2F5cyB3cml0ZSBYRU5TVE9SRV9DT05ORUNURUQgc2luY2Ugd2Uga25vdyB3ZSBhcmUg
Y29ubmVjdGVkIGF0DQo+IHRoaXMgcG9pbnQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKYXNv
biBBbmRyeXVrIDxqYXNvbi5hbmRyeXVrQGFtZC5jb20+DQo+IC0tLQ0KPiAgIHRvb2xzL3hl
bnN0b3JlZC9jb3JlLmMgICB8ICAyICstDQo+ICAgdG9vbHMveGVuc3RvcmVkL2RvbWFpbi5j
IHwgNDUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLQ0KPiAgIHRv
b2xzL3hlbnN0b3JlZC9kb21haW4uaCB8ICAyICstDQo+ICAgMyBmaWxlcyBjaGFuZ2VkLCAz
NyBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS90
b29scy94ZW5zdG9yZWQvY29yZS5jIGIvdG9vbHMveGVuc3RvcmVkL2NvcmUuYw0KPiBpbmRl
eCA1NTBlODc5YTAwLi44MzU0MDJhZjgxIDEwMDY0NA0KPiAtLS0gYS90b29scy94ZW5zdG9y
ZWQvY29yZS5jDQo+ICsrKyBiL3Rvb2xzL3hlbnN0b3JlZC9jb3JlLmMNCj4gQEAgLTI3NjIs
NyArMjc2Miw3IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICphcmd2W10pDQo+ICAgCS8q
IExpc3RlbiB0byBoeXBlcnZpc29yLiAqLw0KPiAgIAlpZiAoIWxpdmVfdXBkYXRlKSB7DQo+
ICAgCQlkb21haW5faW5pdCgtMSk7DQo+IC0JCWRvbTBfaW5pdCgpOw0KPiArCQlpbml0X2Rv
bWFpbnMoKTsNCj4gICAJfQ0KPiAgIA0KPiAgIAkvKiByZWRpcmVjdCB0byAvZGV2L251bGwg
bm93IHdlJ3JlIHJlYWR5IHRvIGFjY2VwdCBjb25uZWN0aW9ucyAqLw0KPiBkaWZmIC0tZ2l0
IGEvdG9vbHMveGVuc3RvcmVkL2RvbWFpbi5jIGIvdG9vbHMveGVuc3RvcmVkL2RvbWFpbi5j
DQo+IGluZGV4IDU0NDNiNGU2MDguLjQ0ZTk5N2NlZTQgMTAwNjQ0DQo+IC0tLSBhL3Rvb2xz
L3hlbnN0b3JlZC9kb21haW4uYw0KPiArKysgYi90b29scy94ZW5zdG9yZWQvZG9tYWluLmMN
Cj4gQEAgLTEyNTcsMjAgKzEyNTcsNDUgQEAgY29uc3QgY2hhciAqZ2V0X2ltcGxpY2l0X3Bh
dGgoY29uc3Qgc3RydWN0IGNvbm5lY3Rpb24gKmNvbm4pDQo+ICAgCXJldHVybiBjb25uLT5k
b21haW4tPnBhdGg7DQo+ICAgfQ0KPiAgIA0KPiAtdm9pZCBkb20wX2luaXQodm9pZCkNCj4g
K3ZvaWQgaW5pdF9kb21haW5zKHZvaWQpDQo+ICAgew0KPiAtCWV2dGNobl9wb3J0X3QgcG9y
dDsNCj4gLQlzdHJ1Y3QgZG9tYWluICpkb20wOw0KPiArCXVuc2lnbmVkIGludCBkb21pZDsN
Cj4gKwl1bnNpZ25lZCBpbnQgc3RhdGU7DQo+ICsJdW5zaWduZWQgaW50IGNhcHM7DQo+ICsJ
dWludDY0X3QgdW5pcXVlX2lkOw0KPiArDQo+ICsJd2hpbGUgKCF4ZW5tYW5hZ2VfcG9sbF9j
aGFuZ2VkX2RvbWFpbih4bV9oYW5kbGUsICZkb21pZCwgJnN0YXRlLCAmY2FwcywNCj4gKwkJ
CQkJICAgICAgJnVuaXF1ZV9pZCkpIHsNCj4gKwkJZXZ0Y2huX3BvcnRfdCBwb3J0ID0gMDsN
Cj4gKwkJc3RydWN0IGRvbWFpbiAqZG9tYWluOw0KPiArDQo+ICsJCWlmIChjYXBzICYgWEVO
TUFOQUdFX0dFVERPTVNUQVRFX0NBUF9YRU5TVE9SRSkNCj4gKwkJCWRvbTBfZG9taWQgPSBk
b21pZDsNCj4gKw0KPiArCQlpZiAoY2FwcyAmIFhFTk1BTkFHRV9HRVRET01TVEFURV9DQVBf
Q09OVFJPTCkNCj4gKwkJCXByaXZfZG9taWQgPSBkb21pZDsNCj4gICANCj4gLQlwb3J0ID0g
Z2V0X3hlbmJ1c19ldnRjaG4oKTsNCj4gLQlpZiAocG9ydCA9PSAtMSkNCj4gLQkJYmFyZl9w
ZXJyb3IoIkZhaWxlZCB0byBpbml0aWFsaXplIGRvbTAgcG9ydCIpOw0KPiArCQlpZiAoZG9t
aWQgPT0gZG9tMF9kb21pZCkgew0KPiArCQkJcG9ydCA9IGdldF94ZW5idXNfZXZ0Y2huKCk7
DQo+ICsJCQlpZiAocG9ydCA9PSAtMSkNCj4gKwkJCQliYXJmX3BlcnJvcigiRmFpbGVkIHRv
IGluaXRpYWxpemUgZG9tJXUgcG9ydCIsDQo+ICsJCQkJCSAgICBkb21pZCk7DQo+ICsJCX0N
Cg0KSSBkb24ndCB0aGluayB0aGlzIGlzIGNvcnJlY3QgZm9yIGEgeGVuc3RvcmUtc3R1YmRv
bS4gU2VlIHN0dWJkb21faW5pdCgpLg0KDQo+ICsNCj4gKwkJZG9tYWluID0gaW50cm9kdWNl
X2RvbWFpbihOVUxMLCBkb21pZCwgcG9ydCwgZmFsc2UpOw0KPiArCQlpZiAoIWRvbWFpbikg
ew0KPiArCQkJeHByaW50ZigiQ291bGQgbm90IGluaXRpYWxpemUgZG9tJXUiLCBkb21pZCk7
DQo+ICsJCQljb250aW51ZTsNCj4gKwkJfQ0KPiAgIA0KPiAtCWRvbTAgPSBpbnRyb2R1Y2Vf
ZG9tYWluKE5VTEwsIHhlbmJ1c19tYXN0ZXJfZG9taWQoKSwgcG9ydCwgZmFsc2UpOw0KPiAt
CWlmICghZG9tMCkNCj4gLQkJYmFyZl9wZXJyb3IoIkZhaWxlZCB0byBpbml0aWFsaXplIGRv
bTAiKTsNCj4gKwkJZG9tYWluX2Nvbm5fcmVzZXQoZG9tYWluKTsNCj4gICANCj4gLQl4ZW5l
dnRjaG5fbm90aWZ5KHhjZV9oYW5kbGUsIGRvbTAtPnBvcnQpOw0KPiArCQlpZiAoZG9tYWlu
LT5pbnRlcmZhY2UpDQo+ICsJCQlkb21haW4tPmludGVyZmFjZS0+Y29ubmVjdGlvbiA9IFhF
TlNUT1JFX0NPTk5FQ1RFRDsNCj4gKw0KPiArCQkvKiBOb3RpZnkgdGhlIGRvbWFpbiB0aGF0
IHhlbnN0b3JlIGlzIGF2YWlsYWJsZSAqLw0KPiArCQl4ZW5ldnRjaG5fbm90aWZ5KHhjZV9o
YW5kbGUsIGRvbWFpbi0+cG9ydCk7DQo+ICsJfQ0KPiAgIH0NCj4gICANCj4gICB2b2lkIHN0
dWJkb21faW5pdCh2b2lkKQ0KPiBkaWZmIC0tZ2l0IGEvdG9vbHMveGVuc3RvcmVkL2RvbWFp
bi5oIGIvdG9vbHMveGVuc3RvcmVkL2RvbWFpbi5oDQo+IGluZGV4IDg0NGFjMTE1MTAuLjZh
NzhmMDY5MzUgMTAwNjQ0DQo+IC0tLSBhL3Rvb2xzL3hlbnN0b3JlZC9kb21haW4uaA0KPiAr
KysgYi90b29scy94ZW5zdG9yZWQvZG9tYWluLmgNCj4gQEAgLTg0LDcgKzg0LDcgQEAgaW50
IGRvX3Jlc2V0X3dhdGNoZXMoY29uc3Qgdm9pZCAqY3R4LCBzdHJ1Y3QgY29ubmVjdGlvbiAq
Y29ubiwNCj4gICANCj4gICB2b2lkIGRvbWFpbl9lYXJseV9pbml0KHZvaWQpOw0KPiAgIHZv
aWQgZG9tYWluX2luaXQoaW50IGV2dGZkKTsNCj4gLXZvaWQgZG9tMF9pbml0KHZvaWQpOw0K
PiArdm9pZCBpbml0X2RvbWFpbnModm9pZCk7DQo+ICAgdm9pZCBzdHViZG9tX2luaXQodm9p
ZCk7DQo+ICAgdm9pZCBkb21haW5fZGVpbml0KHZvaWQpOw0KPiAgIHZvaWQgaWdub3JlX2Nv
bm5lY3Rpb24oc3RydWN0IGNvbm5lY3Rpb24gKmNvbm4sIHVuc2lnbmVkIGludCBlcnIpOw0K
DQoNCkp1ZXJnZW4NCg==
--------------ehFpsPLZ03GFsvbCIYpovq3C
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------ehFpsPLZ03GFsvbCIYpovq3C--

--------------YM2UqF0H0uliKP75Jlpsugoi--

--------------0TFfI8kRG6zwqSH8tIAYAL0X
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmh4uVYFAwAAAAAACgkQsN6d1ii/Ey89
ggf+LsLXiA2BYJqAqeD1X4xpJWewrpgmx8noFK70TWxXWE1yn/nhO/DSgygEStAkz2VeFKzQvLVF
3s94tri7jsaIc1rRdIK1rs5lTkH5bMmhvhZK/9zL4ebictoxUX3cL1erzFoJCsF7vKuDXYA3yBT/
C+oMCwCDFHUmuDqf/iTlP5o11GrjN1HS8MbFdKZIxRBOO6WQPt9ii24LiD4p7zHv7gTubX0P63MB
W43L9zf/PbzsXvpiBp1noSbmgSvNKjkXj6to4a+MIXB405XZiGsHNPbNGHgEtqyBRBj6cWTreDxT
o0JMqJ1+6yCdwAK8IBc0TBiUgPlOjWPJBhd11vY5kw==
=hYZw
-----END PGP SIGNATURE-----

--------------0TFfI8kRG6zwqSH8tIAYAL0X--

