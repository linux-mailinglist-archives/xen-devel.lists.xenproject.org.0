Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFKjKMkoemlk3QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 16:18:33 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAB3A3A3D
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 16:18:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1215805.1525929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl7JD-0008Mc-HU; Wed, 28 Jan 2026 15:18:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1215805.1525929; Wed, 28 Jan 2026 15:18:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl7JD-0008JQ-Dw; Wed, 28 Jan 2026 15:18:19 +0000
Received: by outflank-mailman (input) for mailman id 1215805;
 Wed, 28 Jan 2026 15:18:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MrbJ=AB=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vl7JC-0007fI-98
 for xen-devel@lists.xenproject.org; Wed, 28 Jan 2026 15:18:18 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 927511d1-fc5c-11f0-b160-2bf370ae4941;
 Wed, 28 Jan 2026 16:18:17 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b8870ac4c4eso808454766b.2
 for <xen-devel@lists.xenproject.org>; Wed, 28 Jan 2026 07:18:17 -0800 (PST)
Received: from ?IPV6:2a00:12d0:af5b:2f01:4042:c03:ce4d:a5a1?
 (2a00-12d0-af5b-2f01-4042-c03-ce4d-a5a1.ip.tng.de.
 [2a00:12d0:af5b:2f01:4042:c03:ce4d:a5a1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8dbf1c0126sm143139466b.47.2026.01.28.07.18.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jan 2026 07:18:16 -0800 (PST)
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
X-Inumbo-ID: 927511d1-fc5c-11f0-b160-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769613497; x=1770218297; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LMi5ALsUyW1EGCWergb8OiiCgbqPDCjwCZ672QxStwg=;
        b=ct16FQVUAFtadf0LdyUzSxA/j5qXhEljg23pM21iDiyycqDe/nvkw1c4UiTfM1WDgc
         WLNZcz8Qg/sV7/84QlhmV80wI5jVcHVp4KriDA/Z6N3BpiZcw0JkVuvUlSp7NHeL6ScB
         q5ZI4q7nK8XfzQQehjxJA/FOidefrPLOYLwVMFkmtbPE5cPc3mVX5T63c0Nj250/Pknp
         3/x5leJ8Us0ZbBkQDqSPaNcgvY6nJaduDfRGhBG/fbJaq1OpZPAFmd00+BH1dJyTI9rw
         EscAqiOw9iJG+dNWLHkxT0qUHtJWE5g8j64otnFVvSTEQn5GL/BtDGJLqJrCEWCjxAKT
         Pgjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769613497; x=1770218297;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LMi5ALsUyW1EGCWergb8OiiCgbqPDCjwCZ672QxStwg=;
        b=r6aULrdKrgINmztbK6/wainm5UbZm4Ao6JxAbu3Pfk7gampVZ/s/f8fbHDv3NjY4oH
         LYQgnyORu2UXx2MNmi0emTXI20TiJV2tzs+KL3rwoPmvAX5sGwEkQL1kYe72KRMEL3Qr
         zlsvhC7etff9WkYNsfdPnQVEZSj8BEEtLha87XoxKETTkSEyUUEN/HjI1dYFtbZtaGpw
         9tlHkB8SuYjZ3DiWtEoFuIBZXIsfWyd3de2ozcjK3efmY5y+2Osi0F//V46KLBIUh69O
         U67Uc7bWaUNEO+v7kTHs7VB3TKSFtHR2aJuHkc6zMB8wwd+QXskG3VjvE+Jz+xSmlmn1
         0BSg==
X-Gm-Message-State: AOJu0Ywj0jWNuAumu8mUrrzbknllyEql67IQVpvHg8HzRsztw+fveMAO
	CTSVXgUBi6j+E/W9OaGQUgelJx4JDt2eZocKXcnsSijRFkshZIOziMpKnJmfwTUWpTo=
X-Gm-Gg: AZuq6aLqboRzsKEZfcNOTbwt2YCYMtz1cZjaSnsgnBRypGCDA0UVkRwhWWmzRxz+AO3
	da2tuDqKCnB/oPmFkfiDQrwQ8hH+UgbDKHLvtaZDwuhbsBF9M5A5cS/7MvdvDd8oPfjiH5TLmmu
	E0GATu/yxSDY/LZRm7ylZiPAQggA6Iwhrrzjr/Fd99wkpUBdil7FBlwR9Bt7R7J9m7D/ts2r2eM
	9MatFuuntxmzCHqXTpW0KoQXMfkUm0y2uRmYTWGL/fsiGHeQij/tvuUzPiMUt2ChnfyfcPmNhCA
	Q/GwD8yDDCleJZsbt99kwTkh/Q0q4URgEe8OYNZFsPeUrPSHofE96n+GVsToWRUXs/wWpHePA7n
	k7qhrzj9pnJ+K0GyZNOrOit+RchhEPHlDI9xId8TdJAT8SWe5keQzeHoe0tFCPRtvplBvR1l0+T
	xIzcNukFWUQgEO9MKiGErhxQ5CToRjTqGzbJFHRDkD+bM2so8bIYJ3ltILnfq7k/KKWAmgqcQTm
	EVH0ZFW+gi+xkSoPqvO5XIb5CSBPBflUO/ebA==
X-Received: by 2002:a17:907:6e8a:b0:b88:5e4c:f837 with SMTP id a640c23a62f3a-b8dab429573mr368998966b.64.1769613496767;
        Wed, 28 Jan 2026 07:18:16 -0800 (PST)
Message-ID: <da5480d3-8500-4a21-b488-53f06f74e6fa@suse.com>
Date: Wed, 28 Jan 2026 16:18:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen/balloon: improve accuracy of initial balloon
 target for dom0
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <20260128110510.46425-1-roger.pau@citrix.com>
 <20260128110510.46425-3-roger.pau@citrix.com>
 <596b08db-dc0e-4d42-ac17-570ca6e06bca@suse.com> <aXn48ZiOucpu61CY@Mac.lan>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
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
In-Reply-To: <aXn48ZiOucpu61CY@Mac.lan>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------MRnTJroy7w7wZdq10hsfw0r7"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.50 / 15.00];
	SIGNED_PGP(-2.00)[];
	R_MIXED_CHARSET(0.59)[subject];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,s:lists@lfdr.de];
	RCVD_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email]
X-Rspamd-Queue-Id: DEAB3A3A3D
X-Rspamd-Action: no action

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------MRnTJroy7w7wZdq10hsfw0r7
Content-Type: multipart/mixed; boundary="------------YW4fPjHBHisnI07JsE40lX4P";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Message-ID: <da5480d3-8500-4a21-b488-53f06f74e6fa@suse.com>
Subject: Re: [PATCH 2/2] xen/balloon: improve accuracy of initial balloon
 target for dom0
References: <20260128110510.46425-1-roger.pau@citrix.com>
 <20260128110510.46425-3-roger.pau@citrix.com>
 <596b08db-dc0e-4d42-ac17-570ca6e06bca@suse.com> <aXn48ZiOucpu61CY@Mac.lan>
In-Reply-To: <aXn48ZiOucpu61CY@Mac.lan>

--------------YW4fPjHBHisnI07JsE40lX4P
Content-Type: multipart/mixed; boundary="------------IhatcEYAm5eeLfF4NTv0oIRc"

--------------IhatcEYAm5eeLfF4NTv0oIRc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjguMDEuMjYgMTI6NTQsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+IE9uIFdlZCwg
SmFuIDI4LCAyMDI2IGF0IDEyOjMxOjEzUE0gKzAxMDAsIErDvHJnZW4gR3Jvw58gd3JvdGU6
DQo+PiBPbiAyOC4wMS4yNiAxMjowNSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPj4+IFRo
ZSBkb20wIGJhbGxvb24gdGFyZ2V0IHNldCBieSB0aGUgdG9vbHN0YWNrIGlzIHRoZSB2YWx1
ZSByZXR1cm5lZCBieQ0KPj4+IFhFTk1FTV9jdXJyZW50X3Jlc2VydmF0aW9uLiAgRG8gdGhl
IHNhbWUgaW4gdGhlIGtlcm5lbCBiYWxsb29uIGRyaXZlciBhbmQNCj4+PiBzZXQgdGhlIGN1
cnJlbnQgYWxsb2NhdGlvbiB0byB0aGUgdmFsdWUgcmV0dXJuZWQgYnkNCj4+PiBYRU5NRU1f
Y3VycmVudF9yZXNlcnZhdGlvbi4gIE9uIG15IHRlc3Qgc3lzdGVtIHRoaXMgY2F1c2VzIHRo
ZSBrZXJuZWwNCj4+PiBiYWxsb29uIGRyaXZlciB0YXJnZXQgdG8gZXhhY3RseSBtYXRjaCB0
aGUgdmFsdWUgc2V0IGJ5IHRoZSB0b29sc3RhY2sgaW4NCj4+PiB4ZW5zdG9yZS4NCj4+Pg0K
Pj4+IE5vdGUgdGhpcyBhcHByb2FjaCBjYW4gYmUgdXNlZCBieSBib3RoIFBWIGFuZCBQVkgg
ZG9tMHMsIGFzIHRoZSB0b29sc3RhY2sNCj4+PiBhbHdheXMgdXNlcyBYRU5NRU1fY3VycmVu
dF9yZXNlcnZhdGlvbiB0byBzZXQgdGhlIGluaXRpYWwgdGFyZ2V0IHJlZ2FyZGxlc3MNCj4+
PiBvZiB0aGUgZG9tMCB0eXBlLg0KPj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1
IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+Pj4gLS0tDQo+Pj4gICAgZHJpdmVy
cy94ZW4vYmFsbG9vbi5jIHwgMjcgKysrKysrKysrKysrKysrKystLS0tLS0tLS0tDQo+Pj4g
ICAgMSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQ0K
Pj4+DQo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL2JhbGxvb24uYyBiL2RyaXZlcnMv
eGVuL2JhbGxvb24uYw0KPj4+IGluZGV4IDhjNDRhMjVhN2QyYi4uOWI2NTMxZWIyOGI2IDEw
MDY0NA0KPj4+IC0tLSBhL2RyaXZlcnMveGVuL2JhbGxvb24uYw0KPj4+ICsrKyBiL2RyaXZl
cnMveGVuL2JhbGxvb24uYw0KPj4+IEBAIC03MjQsNyArNzI0LDggQEAgc3RhdGljIGludCBf
X2luaXQgYmFsbG9vbl9hZGRfcmVnaW9ucyh2b2lkKQ0KPj4+ICAgIHN0YXRpYyBpbnQgX19p
bml0IGJhbGxvb25faW5pdCh2b2lkKQ0KPj4+ICAgIHsNCj4+PiAgICAJc3RydWN0IHRhc2tf
c3RydWN0ICp0YXNrOw0KPj4+IC0JdW5zaWduZWQgbG9uZyBjdXJyZW50X3BhZ2VzOw0KPj4+
ICsJbG9uZyBjdXJyZW50X3BhZ2VzID0gMDsNCj4+PiArCWRvbWlkX3QgZG9taWQgPSBET01J
RF9TRUxGOw0KPj4+ICAgIAlpbnQgcmM7DQo+Pj4gICAgCWlmICgheGVuX2RvbWFpbigpKQ0K
Pj4+IEBAIC03MzIsMTUgKzczMywyMSBAQCBzdGF0aWMgaW50IF9faW5pdCBiYWxsb29uX2lu
aXQodm9pZCkNCj4+PiAgICAJcHJfaW5mbygiSW5pdGlhbGlzaW5nIGJhbGxvb24gZHJpdmVy
XG4iKTsNCj4+PiAtCWlmICh4ZW5fcHZfZG9tYWluKCkpIHsNCj4+PiAtCQlpZiAoeGVuX3Jl
bGVhc2VkX3BhZ2VzID49IHhlbl9zdGFydF9pbmZvLT5ucl9wYWdlcykNCj4+PiAtCQkJZ290
byB1bmRlcmZsb3c7DQo+Pj4gLQkJY3VycmVudF9wYWdlcyA9IG1pbih4ZW5fc3RhcnRfaW5m
by0+bnJfcGFnZXMgLQ0KPj4+IC0JCSAgICAgICAgICAgICAgICAgICAgeGVuX3JlbGVhc2Vk
X3BhZ2VzLCBtYXhfcGZuKTsNCj4+PiAtCX0gZWxzZSB7DQo+Pj4gLQkJaWYgKHhlbl91bnBv
cHVsYXRlZF9wYWdlcyA+PSBnZXRfbnVtX3BoeXNwYWdlcygpKQ0KPj4+IC0JCQlnb3RvIHVu
ZGVyZmxvdzsNCj4+PiAtCQljdXJyZW50X3BhZ2VzID0gZ2V0X251bV9waHlzcGFnZXMoKSAt
IHhlbl91bnBvcHVsYXRlZF9wYWdlczsNCj4+PiArCWlmICh4ZW5faW5pdGlhbF9kb21haW4o
KSkNCj4+PiArCQljdXJyZW50X3BhZ2VzID0gSFlQRVJWSVNPUl9tZW1vcnlfb3AoWEVOTUVN
X2N1cnJlbnRfcmVzZXJ2YXRpb24sDQo+Pj4gKwkJICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICZkb21pZCk7DQo+Pg0KPj4gSXMgdGhlcmUgYW55IHNwZWNpZmljIHJl
YXNvbiB3aHkgdGhpcyBzaG91bGQgYmUgbGltaXRlZCB0byBkb20wPw0KPj4NCj4+IEkgX3Ro
aW5rXyB0aGlzIHNob3VsZCB3b3JrIGZvciBvdGhlciBkb21haW5zLCB0b28uDQo+IA0KPiBT
YWRseSBpdCBkb2Vzbid0LCBJJ3ZlIGFscmVhZHkgdGVzdGVkLiAgVGhlIHZhbHVlIHJldHVy
bmVkIGJ5DQo+IFhFTk1FTV9jdXJyZW50X3Jlc2VydmF0aW9uIG9uIFBWIGd1ZXN0cyBpcyBz
bGlnaHRseSBkaWZmZXJlbnQgdGhhbg0KPiB3aGF0J3MgaW4geGVuX3N0YXJ0X2luZm8tPm5y
X3BhZ2VzLCB3aGljaCBleGFjdGx5IHdoYXQgdGhlIHRvb2xzdGFjaw0KPiB3cml0ZXMgaW4g
eGVuc3RvcmUuICBJIGFzc3VtZSB0aGVyZSdzIHNvbWUgb3RoZXIgc3R1ZmYgdGhhdCdzDQo+
IGFjY291bnRlZCBmb3IgaW4gZC0+dG90X3BhZ2VzLCBidXQgZG9uJ3QgcmVhbGx5IGtub3cg
d2hhdCBJJ20gYWZyYWlkLg0KPiANCj4gQW5kIGluIHRoZSBIVk0vUFZIIGNhc2UgdXNpbmcg
WEVOTUVNX2N1cnJlbnRfcmVzZXJ2YXRpb24gZm9yIGRvbVVzDQo+IHdvdWxkIGFsc28gdGFr
ZSBpbnRvIGFjY291bnQgdGhlIFZpZGVvIG1lbW9yeSwgd2hpY2ggc2tld3MgdGhlIHRhcmdl
dC4NCj4gDQo+IFRoaXMgaXMgdGhlIGJlc3QgSSBjb3VsZCBkbyBJJ20gYWZyYWlkLCBhdCB0
aGUgZXhwZW5zZSBvZiBoYXZpbmcgc28NCj4gbWFueSBkaWZmZXJlbnQgd2F5IHRvIGZldGNo
IHRoZSBpbmZvcm1hdGlvbi4NCg0KTWVoLCB0b28gYmFkLg0KDQpGb3Igbm93IEkgdGhpbmsg
d2UgbmVlZCB0byBsaXZlIHdpdGggdGhhdC4gQnV0IGZvciB0aGUgZnV0dXJlIEknZCBsaWtl
IHRvDQpzdWdnZXN0IHRvIGFkZCBhIG5ldyBYZW5zdG9yZSBub2RlIG1lbW9yeS9yZXNlcnZh
dGlvbi1kaWZmIGNvbnRhaW5pbmcgdGhlDQpkaWZmZXJlbmNlIGJldHdlZW4gWEVOTUVNX2N1
cnJlbnRfcmVzZXJ2YXRpb24gb3V0cHV0IGFuZCB0aGUgdG9vbHMnIHZpZXcNCm9mIHRoZSBk
b21haW4ncyBtZW1vcnkgc2l6ZS4NCg0KVGhlIGJhbGxvb24gZHJpdmVyIGNvdWxkIHJlYWQg
dGhhdCBub2RlIGluIGJhbGxvb25faW5pdCgpIGFuZCB1c2UNClhFTk1FTV9jdXJyZW50X3Jl
c2VydmF0aW9uIGluIGNhc2UgdGhlIG5vZGUgaXMgZm91bmQuDQoNCg0KSnVlcmdlbg0K
--------------IhatcEYAm5eeLfF4NTv0oIRc
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------IhatcEYAm5eeLfF4NTv0oIRc--

--------------YW4fPjHBHisnI07JsE40lX4P--

--------------MRnTJroy7w7wZdq10hsfw0r7
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAml6KLgFAwAAAAAACgkQsN6d1ii/Ey+Z
4gf+MlSsIuQV3dofZFV2/Fs6dzfB5nI0PFTBYe/gfdtxeQuKbN3QpMEemhGkis15quWXBJGP+On2
B0ec7n/JLMn8il7t3fSrUyj1/QVzo/WPdMtj2gtGRDpsf7AVygRKHKVOtBvPomLWqNOIXwoo4g7G
W9/HpP90Pef5RGAEtOVhHJDPUl4pskh/uWlHV3sZr6P5ez/XKMS7w8cD8Oju1OBziJOA7xVgBH0A
q8JjEkobWXRik7cugaRzitlGptI3eirf1b3hMPIA7YpeoVJ3QzKX27q3dbm/GTUMOoguq9ptLZek
aYF2GgKJvvu292FEpzO2fN1jiGG5UrlT/f4GaBERPQ==
=evqH
-----END PGP SIGNATURE-----

--------------MRnTJroy7w7wZdq10hsfw0r7--

