Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IEpBGMq2t2mMUgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Mar 2026 08:52:42 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BF9295D95
	for <lists+xen-devel@lfdr.de>; Mon, 16 Mar 2026 08:52:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1255434.1550394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w22jf-0007GJ-1J; Mon, 16 Mar 2026 07:51:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1255434.1550394; Mon, 16 Mar 2026 07:51:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w22je-0007DZ-UF; Mon, 16 Mar 2026 07:51:34 +0000
Received: by outflank-mailman (input) for mailman id 1255434;
 Mon, 16 Mar 2026 07:51:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6b3Y=BQ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1w22jd-0007DT-Om
 for xen-devel@lists.xenproject.org; Mon, 16 Mar 2026 07:51:33 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed355c2a-210c-11f1-b164-2bf370ae4941;
 Mon, 16 Mar 2026 08:51:23 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-b93698bb57aso795262066b.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Mar 2026 00:51:22 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9796cd0f3asm371655766b.7.2026.03.16.00.51.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Mar 2026 00:51:21 -0700 (PDT)
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
X-Inumbo-ID: ed355c2a-210c-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773647482; x=1774252282; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gVf7eqXFsNSUtVS+T8qM4oUWc9TUdMrRyi21/3vzEys=;
        b=IY9ui6KOCHfzX9cH/a7mPgd0b/jFW5yVH23Xx71X3Tu4+wYgdxh8lI9hoJ+sqL3UDd
         tSnkK4a4Km1AO47zYrJNC0Y5ubEHXIC0Khx4yZZvWnFFk4PXJZy/XEsruiviWBoYtA/l
         mhfP+BMlqp+kfhNa0QAqoJ/en/sfVnH/hWPQ9hrWvjw/9CY9k11ak4oFz+yNPhfKz/f0
         ieWCgGb3iTCY0u3D3C+HrcC6gtQZXRI/+tTWrpERWDFTyiMEnqwqaOIvtbQzVEe8+Tyx
         nsT+jDl3V8rLWrqruzgA8595SEAr0S1GBEmlPgIHF5cOPDTRSm7Cjwhi1lYxhr3qEOGn
         SO+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773647482; x=1774252282;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gVf7eqXFsNSUtVS+T8qM4oUWc9TUdMrRyi21/3vzEys=;
        b=Gezz7gYh5lOETI/MOamn7phBzB4RmvBktGEsKCPrBsZafomiOjAKWZSLf5esPZLiwJ
         i86czTGiFQhbMuAtVY6/mwjdY0mAvincVYFB+zcXtZGDadLQuGjPQ03YwzO89k0ugXH2
         PePMGi/levuV6YTHj487GHlKW5xu1kA7QZLJUIakyaAVeecsFj22PLuF7jw+Wvult4WH
         /+z+7m7G3GGLfBb2zREY3/4TVHshq2Fnpnp0cfRMioF6zFpn7jpNhHh9bWW9YJ8dNSJo
         Ch2YDSUEBau2nD1TduiNglB9hh16zJWgL5KbqHZkuIIQP7dIvIIkwsyZcCXBLyXIA7g8
         g3yw==
X-Gm-Message-State: AOJu0YxfT/cHJJSyS/uJBwlFkUYFhXzn7KCl28pAKUMelZHYTNXnEpTp
	EKYIzSEXMeD0lQ1vPKqWQJTZPwVYV8XYds3FHWHAucv7vRg2dN9GOd792BciO81oteMx+CXf4Cw
	PzBLK
X-Gm-Gg: ATEYQzwE+unebjI3VE7uMsma4VbTkCVIOv13c/ZUThsEMgqxi2fSlBAOC1Ws4U+CVbp
	rzZ9C46/Rkmq7debUay4babo7GfbZoRbkYm9BNbVziV+z4IGYHNlsCrc3tctqZ10oP0ZigFSBf9
	sRggUcalrqu1H2cklnJSdUgpHNEGHYvyqUlAC8WC5qr0sTroo+JB+t98FriQbrX3bB1O1a3P7n3
	rDgiPAYU7XqkZDAYO4kd5T829Ya+lTBmE8jx4IMfc9ymgFwwULG6wEo/Wqbk3p9vckL3KB2BJSH
	+UX4z8dFfEPl2EE/4LB5PiVvMedISr+8pG+V/BEfy0DRmUnhbPwxSl1ETadrRyrEdfP4JYMxSi2
	AJQviHPsuLjkX8WWtIbjUO1gYTMSF+ue7ErtMkDeutdc4OcdLkSCj99VkJ3pa8siJeLsRS3Y28X
	vpYeDGtwRmjSH0Yu8h+G5qr8RkfXdo9fWswVyta60gQxqsE7KaYdUeMGygZSSwqMGN39OOpvbvC
	OHuu93RZK9neM6L8ozMr0rb81KCcDneHnCOuK28tBFJ4rpAi5idpg==
X-Received: by 2002:a17:907:6ea4:b0:b97:b149:4e72 with SMTP id a640c23a62f3a-b97b14977d6mr204643966b.28.1773647482139;
        Mon, 16 Mar 2026 00:51:22 -0700 (PDT)
Message-ID: <c7870ce3-fc52-4bda-997f-4791fe3020a1@suse.com>
Date: Mon, 16 Mar 2026 08:51:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] tools/libs/store: add get- and set-quota related
 functions
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>
References: <20260305135208.2208663-1-jgross@suse.com>
 <20260305135208.2208663-2-jgross@suse.com> <abQd82Z8x3_9CY2Q@l14>
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
In-Reply-To: <abQd82Z8x3_9CY2Q@l14>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------wX2RZAj9dCG09f7FRF200Hqc"
X-Spamd-Result: default: False [-1.50 / 15.00];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	R_MIXED_CHARSET(0.59)[subject];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,m:julien@xen.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	HAS_ATTACHMENT(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: B8BF9295D95
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------wX2RZAj9dCG09f7FRF200Hqc
Content-Type: multipart/mixed; boundary="------------ItyVOjejs0x0CYt0HSY5Bsr1";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>
Message-ID: <c7870ce3-fc52-4bda-997f-4791fe3020a1@suse.com>
Subject: Re: [PATCH 01/11] tools/libs/store: add get- and set-quota related
 functions
References: <20260305135208.2208663-1-jgross@suse.com>
 <20260305135208.2208663-2-jgross@suse.com> <abQd82Z8x3_9CY2Q@l14>
In-Reply-To: <abQd82Z8x3_9CY2Q@l14>

--------------ItyVOjejs0x0CYt0HSY5Bsr1
Content-Type: multipart/mixed; boundary="------------RJfLw1K0oAtZZfZT0NOujJJO"

--------------RJfLw1K0oAtZZfZT0NOujJJO
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTMuMDMuMjYgMTU6MjMsIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0KPiBPbiBUaHUsIE1h
ciAwNSwgMjAyNiBhdCAwMjo1MTo1OFBNICswMTAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
Pj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2luY2x1ZGUveGVuc3RvcmUuaCBiL3Rvb2xzL2luY2x1
ZGUveGVuc3RvcmUuaA0KPj4gaW5kZXggNDIzNDIyZGM1MC4uNmI2NjFlNTg5NSAxMDA2NDQN
Cj4+IC0tLSBhL3Rvb2xzL2luY2x1ZGUveGVuc3RvcmUuaA0KPj4gKysrIGIvdG9vbHMvaW5j
bHVkZS94ZW5zdG9yZS5oDQo+PiBAQCAtMjc3LDYgKzI3NywyNSBAQCBib29sIHhzX2dldF9m
ZWF0dXJlc19kb21haW4oc3RydWN0IHhzX2hhbmRsZSAqaCwgdW5zaWduZWQgaW50IGRvbWlk
LA0KPj4gICBib29sIHhzX3NldF9mZWF0dXJlc19kb21haW4oc3RydWN0IHhzX2hhbmRsZSAq
aCwgdW5zaWduZWQgaW50IGRvbWlkLA0KPj4gICAJCQkgICAgdW5zaWduZWQgaW50IGZlYXR1
cmVzKTsNCj4+ICAgDQo+PiArLyogR2V0IG5hbWVzIG9mIHN1cHBvcnRlZCBxdW90YS4gKi8N
Cj4+ICtjaGFyICoqeHNfZ2V0X3F1b3RhX25hbWVzKHN0cnVjdCB4c19oYW5kbGUgKmgsIHVu
c2lnbmVkIGludCAqbnVtKTsNCj4+ICsNCj4+ICsvKiBHZXQgdGhlIHZhbHVlIG9mIG9uZSBn
bG9iYWwgcXVvdGEuICovDQo+PiArYm9vbCB4c19nZXRfZ2xvYmFsX3F1b3RhKHN0cnVjdCB4
c19oYW5kbGUgKmgsIGNoYXIgKnF1b3RhLA0KPj4gKwkJCSB1bnNpZ25lZCBpbnQgKnZhbHVl
KTsNCj4+ICsNCj4+ICsvKiBTZXQgdGhlIHZhbHVlIG9mIG9uZSBnbG9iYWwgcXVvdGEuICov
DQo+PiArYm9vbCB4c19zZXRfZ2xvYmFsX3F1b3RhKHN0cnVjdCB4c19oYW5kbGUgKmgsIGNo
YXIgKnF1b3RhLA0KPj4gKwkJCSB1bnNpZ25lZCBpbnQgdmFsdWUpOw0KPj4gKw0KPj4gKy8q
IEdldCB0aGUgdmFsdWUgb2Ygb25lIGRvbWFpbiBxdW90YS4gKi8NCj4+ICtib29sIHhzX2dl
dF9kb21haW5fcXVvdGEoc3RydWN0IHhzX2hhbmRsZSAqaCwgdW5zaWduZWQgaW50IGRvbWlk
LA0KPj4gKwkJCSBjaGFyICpxdW90YSwgdW5zaWduZWQgaW50ICp2YWx1ZSk7DQo+PiArDQo+
PiArLyogU2V0IHRoZSB2YWx1ZSBvZiBvbmUgZG9tYWluIHF1b3RhLiAqLw0KPj4gK2Jvb2wg
eHNfc2V0X2RvbWFpbl9xdW90YShzdHJ1Y3QgeHNfaGFuZGxlICpoLCB1bnNpZ25lZCBpbnQg
ZG9taWQsDQo+PiArCQkJIGNoYXIgKnF1b3RhLCB1bnNpZ25lZCBpbnQgdmFsdWUpOw0KPj4g
Kw0KPiANCj4gRG8geW91IHRoaW5rIGFsbCB0aG9zZSBuZXcgcHJvdG90eXBlIGNvdWxkIGdl
dCBhIGJpdCBtb3JlIGRlc2NyaXB0aW9ucz8NCj4gV2hpY2ggcGFyYW1ldGVyIGFyZSBhY3R1
YWxseSBvdXRwdXQgKGFuZCBub3QgaW5wdXQpLCB3aGF0IGRvZXMgaXQgbWVhbg0KPiB0byBy
ZXR1cm4gZmFsc2UsIGRvIHRoZXkgc2V0IGVycm5vLCBpcyB0aGVyZSBzb21ldGhpbmcgdG8g
ZG8gd2l0aCB0aGUNCj4gcmV0dXJuIHZhbHVlIG9mIHhzX2dldF9xdW90YV9uYW1lcz8NCg0K
T2ggeWVzLCBvZiBjb3Vyc2UuDQoNCj4gRm9yIG91dHB1dCBhcmd1bWVudHMsIGxpYnhsIGhh
dmUgYSBjb252ZW50aW9uICh3ZWxsIGF0IGxlYXN0IGEgbWVudGlvbg0KPiBpbiB0aGUgY29k
aW5nIHN0eWxlKSB0byBzdWZmaXggYXJndW1lbnQgbmFtZXMgd2l0aCBgX3JgIG9yIGBfb3V0
YC4NCg0KSG1tLCBJIGRvbid0IHRoaW5rIEknZCBsaWtlIHRvIGNoYW5nZSBzdHlsZSBub3cu
IFRoaXMgaXMgbm90IGxpYnhsIGFmdGVyDQphbGwuDQoNCj4gRm9yIHRoZSBzdHJpbmdzLCBj
b3VsZCB3ZSB1c2UgYGNvbnN0IGNoYXIgKmAgaW5zdGVhZCBvZiBub24tY29uc3Qgb25lPw0K
DQpZZXMuDQoNCj4gDQo+PiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGlicy9zdG9yZS94cy5jIGIv
dG9vbHMvbGlicy9zdG9yZS94cy5jDQo+PiBpbmRleCA4ZjRiOTBhM2NmLi5kZGEzN2Y3NTI2
IDEwMDY0NA0KPj4gLS0tIGEvdG9vbHMvbGlicy9zdG9yZS94cy5jDQo+PiArKysgYi90b29s
cy9saWJzL3N0b3JlL3hzLmMNCj4+IEBAIC0xNDU2LDYgKzE0NTYsMTE3IEBAIGJvb2wgeHNf
c2V0X2ZlYXR1cmVzX2RvbWFpbihzdHJ1Y3QgeHNfaGFuZGxlICpoLCB1bnNpZ25lZCBpbnQg
ZG9taWQsDQo+PiAgIAlyZXR1cm4geHNfYm9vbCh4c190YWxrdihoLCBpb3YsIEFSUkFZX1NJ
WkUoaW92KSwgTlVMTCkpOw0KPj4gICB9DQo+PiAgIA0KPj4gK2NoYXIgKip4c19nZXRfcXVv
dGFfbmFtZXMoc3RydWN0IHhzX2hhbmRsZSAqaCwgdW5zaWduZWQgaW50ICpudW0pDQo+PiAr
ew0KPj4gKwlzdHJ1Y3QgeHNkX3NvY2ttc2cgbXNnID0geyAudHlwZSA9IFhTX0dFVF9RVU9U
QSB9Ow0KPj4gKwlzdHJ1Y3QgaW92ZWMgaW92WzFdOw0KPj4gKwljaGFyICoqcXVvdGE7DQo+
PiArCWNoYXIgKnJlcGx5Ow0KPj4gKwljaGFyICpjOw0KPj4gKwl1bnNpZ25lZCBpbnQgaTsN
Cj4+ICsNCj4+ICsJaW92WzBdLmlvdl9iYXNlID0gJm1zZzsNCj4+ICsJaW92WzBdLmlvdl9s
ZW4gID0gc2l6ZW9mKG1zZyk7DQo+PiArDQo+PiArCXJlcGx5ID0geHNfdGFsa3YoaCwgaW92
LCBBUlJBWV9TSVpFKGlvdiksIE5VTEwpOw0KPj4gKwlpZiAoIXJlcGx5KQ0KPj4gKwkJcmV0
dXJuIE5VTEw7DQo+PiArDQo+PiArCSpudW0gPSAxOw0KPj4gKwlmb3IgKGMgPSByZXBseTsg
KmM7IGMrKykNCj4+ICsJCWlmICgqYyA9PSAnICcpDQo+PiArCQkJKCpudW0pKys7DQo+PiAr
DQo+PiArCXF1b3RhID0gbWFsbG9jKCpudW0gKiBzaXplb2YoY2hhciAqKSArIHN0cmxlbihy
ZXBseSkgKyAxKTsNCj4+ICsJYyA9IChjaGFyICopKHF1b3RhICsgKm51bSk7DQo+PiArCXN0
cmNweShjLCByZXBseSk7DQo+PiArCWZvciAoaSA9IDA7IGkgPCAqbnVtOyBpKyspIHsNCj4+
ICsJCXF1b3RhW2ldID0gYzsNCj4+ICsJCWMgPSBzdHJjaHIoYywgJyAnKTsNCj4+ICsJCWlm
IChjKSB7DQo+IA0KPiBJZiBgY2AgaXMgTlVMTCwgaXQncyBsaWtlbHkgdGhhdCB0aGlzIGlz
IHRoZSBsYXN0IGl0ZXJhdGlvbiBvZiB0aGUgYGZvcmANCj4gbG9vcC4gQnV0IGp1c3QgaW4g
Y2FzZSwgc2hvdWxkIHdlIHByZXZlbnQgdGhlIGNvZGUgZnJvbSBkb2luZyBhbm90aGVyDQo+
IHJvdW5kIGFuZCBwcmV2ZW50IGBzdHJjaHIoTlVMTCwgJyAnKWA/IChPciBqdXN0IGNoZWNr
IHRoYXQgYGNgIGlzICFOVUxMLA0KPiBhbmQgbGV0IHRoZSBsb29wIGZpbmlzaCBzZXQgTlVM
TCBmb3IgdGhlIHJlbWFpbmluZyBzbG90IGluIGBxdW90YWApDQoNCk5vdCBzdXJlIHRoaXMg
aXMgcmVhbGx5IG5lZWRlZC4gKm51bSBpcyBzZXQganVzdCBhIGZldyBsaW5lcyBmdXJ0aGVy
IHVwDQp1c2luZyB0aGUgc2FtZSB3YXkgdG8gY291bnQgdGhlIG51bWJlciBvZiBzdHJpbmdz
LiBEbyB3ZSByZWFsbHkgbmVlZCB0byBkbw0KY29uc2lzdGVuY3kgY2hlY2tzIG9mIGludGVy
bWVkaWF0ZSByZXN1bHRzIGluIHN1Y2ggYSBzaG9ydCBmdW5jdGlvbj8NCg0KPiANCj4+ICsJ
CQkqYyA9IDA7DQo+PiArCQkJYysrOw0KPj4gKwkJfQ0KPj4gKwl9DQo+PiArDQo+PiArCXJl
dHVybiBxdW90YTsNCj4+ICt9DQo+PiArDQo+PiArYm9vbCB4c19nZXRfZ2xvYmFsX3F1b3Rh
KHN0cnVjdCB4c19oYW5kbGUgKmgsIGNoYXIgKnF1b3RhLA0KPj4gKwkJCSB1bnNpZ25lZCBp
bnQgKnZhbHVlKQ0KPj4gK3sNCj4+ICsJc3RydWN0IHhzZF9zb2NrbXNnIG1zZyA9IHsgLnR5
cGUgPSBYU19HRVRfUVVPVEEgfTsNCj4+ICsJc3RydWN0IGlvdmVjIGlvdlsyXTsNCj4+ICsN
Cj4+ICsJaW92WzBdLmlvdl9iYXNlID0gJm1zZzsNCj4+ICsJaW92WzBdLmlvdl9sZW4gID0g
c2l6ZW9mKG1zZyk7DQo+PiArCWlvdlsxXS5pb3ZfYmFzZSA9IHF1b3RhOw0KPj4gKwlpb3Zb
MV0uaW92X2xlbiAgPSBzdHJsZW4ocXVvdGEpICsgMTsNCj4+ICsNCj4+ICsJcmV0dXJuIHhz
X3VpbnQoeHNfdGFsa3YoaCwgaW92LCBBUlJBWV9TSVpFKGlvdiksIE5VTEwpLCB2YWx1ZSk7
DQo+PiArfQ0KPj4gKw0KPj4gK2Jvb2wgeHNfc2V0X2dsb2JhbF9xdW90YShzdHJ1Y3QgeHNf
aGFuZGxlICpoLCBjaGFyICpxdW90YSwNCj4+ICsJCQkgdW5zaWduZWQgaW50IHZhbHVlKQ0K
Pj4gK3sNCj4+ICsJc3RydWN0IHhzZF9zb2NrbXNnIG1zZyA9IHsgLnR5cGUgPSBYU19TRVRf
UVVPVEEgfTsNCj4+ICsJY2hhciB2YWxfc3RyW01BWF9TVFJMRU4odmFsdWUpXTsNCj4gDQo+
IE1BWF9TVFJMRU4gZG9lc24ndCBoYXZlIGEgZ3JlYXQgbmFtZSwgSSB3b3VuZGVyIHdoYXQg
aXMgd2FzIDotKS4gQW5kDQo+IGl0J3Mgbm90IGFib3V0IGEgbWF4aW11bSBzaXplIG9mIHBh
eWxvYWQgdGhhdCBjb3VsZCBnbyBvbiB4cyB3aXJlIG9yDQo+IHNvbWV0aGluZywgaXQncyBh
Y3R1YWxseSB0aGUgbWF4aW11bSBzdHJpbmcgc2l6ZSB0aGF0IGNhbiB0YWtlIGENCj4gbnVt
ZXJpY2FsIHZhbHVlLCB3aGVuIGNvbnZlcnRlZCB0byBjaGFyYXRlcnMuDQoNClVuZm9ydHVu
YXRlbHkgdGhlIE1BWF9TVFJMRU4oKSBtYWNybyBpcyBkZWZpbmVkIGluIGEgcHVibGljIGhl
YWRlciBmaWxlLg0KSSBjb3VsZCBkZWZpbmUgYW5vdGhlciBtYWNybyB3aXRoIGEgZGlmZmVy
ZW50IG5hbWUgZG9pbmcgdGhlIHNhbWUgYW5kDQp1c2UgdGhhdCBoZXJlLCBidXQgTUFYX1NU
UkxFTigpIHdvdWxkIHN0aWxsIGJlIHRoZXJlLg0KDQpXaGF0IGlzIHlvdXIgcHJlZmVyZW5j
ZT8NCg0KDQpKdWVyZ2VuDQo=
--------------RJfLw1K0oAtZZfZT0NOujJJO
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------RJfLw1K0oAtZZfZT0NOujJJO--

--------------ItyVOjejs0x0CYt0HSY5Bsr1--

--------------wX2RZAj9dCG09f7FRF200Hqc
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmm3tnkFAwAAAAAACgkQsN6d1ii/Ey/f
tQf+OwXYZ8rIrIOR5AW+wRe30/jKhwFhADxFB0c0lP9tFz33rC/b26480zmtfUkB2Hekm/IckbXY
6baLv9GhNCPazXlWhTcDzOL/qaBcLgSERyQVCCniDTr0FKG3EYUXpBWI5iQW36ek8wkgC+op3viA
Qslz1V1evAfeqqCtSnIj6Y3C06VH19xwBzWJfmREDlGBpdK34mAkX+iSODPoGtX02Im5OfQEBue7
P5foZUoWSJZwnkcaw/yFaiObhh7yLbE+ncDQq/5Kktyk11fKqhio9fTli385jKy4QhGotR75gAUW
oqDAT3HWVY9WHdGiAyVelUnji0lY5YRCy4YlCwf4SQ==
=Q3Fg
-----END PGP SIGNATURE-----

--------------wX2RZAj9dCG09f7FRF200Hqc--

