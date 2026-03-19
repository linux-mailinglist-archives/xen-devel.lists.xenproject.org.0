Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BuICQL1u2nkqQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 14:07:14 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3A62CBA51
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 14:07:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1257076.1551516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3D5I-0008Az-E6; Thu, 19 Mar 2026 13:06:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257076.1551516; Thu, 19 Mar 2026 13:06:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3D5I-00088p-B4; Thu, 19 Mar 2026 13:06:44 +0000
Received: by outflank-mailman (input) for mailman id 1257076;
 Thu, 19 Mar 2026 13:06:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2tj/=BT=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1w3D5G-00088j-9A
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 13:06:42 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76c9d7dd-2394-11f1-9ccf-f158ae23cfc8;
 Thu, 19 Mar 2026 14:06:38 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-66732a99928so1056015a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 19 Mar 2026 06:06:38 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b97f173a3e3sm433226666b.61.2026.03.19.06.06.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Mar 2026 06:06:36 -0700 (PDT)
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
X-Inumbo-ID: 76c9d7dd-2394-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773925597; x=1774530397; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YZ2aVbDCO5mxgvSPBPZYmaTP3dWtkfnfuMwImdhSDiQ=;
        b=E2cgPSHbeuCSBtySrhzn2z8NyhErhaJa6Qs0m/+GR6Lx1ytdXmBVokXyhahQ3gMBhc
         v7tX+15TNF24Yw1UW2yCI086A/Vsp678oV8Tx0TzmMqtSu+8o4HIr0Xm3nlDFn1WCYee
         OzrPf3hiIS7domVvxnOeIZ4wGo9jGqp9aCxtd/hhK66xMEtFjJ+Q+Zy6QciIF5EJzXn1
         cTvHMiscq9QTqH4pJfrFXN2LynIBqLdak3h33+Q7M65xmRHchjVAAgC+Q+EW/HDmx9h6
         jUUxvXDsW3fE6gKzDY9R5FBZm6mFUk0WlCjBL6f9licW2ITSZvYqkE5IOOawd2cj+GuI
         ec5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773925597; x=1774530397;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YZ2aVbDCO5mxgvSPBPZYmaTP3dWtkfnfuMwImdhSDiQ=;
        b=je2F5+Yo1HbeanSyxdQtVp2JUS4CXeOyZR8hTTRgTnXl2iNPtvSgDI9AsmCnE5OUDx
         m+hCalKOrQiNM0/J/MfsYS1NGdfeBFTAhZhFGFSfCFyH0ThTLRToTWAtUB/pmuhrIOLC
         iuN+6QvVVPcUEXxQch0KVawJhWDcWuQwYMW6+YhehWCG4S4ufBYVB5JmN2Li5l8jRuuu
         aBWrWOGm9ZdGgRmVutY4vz6i9XAodezIKWFccukfKK1+wqWzGWn5yC3QHUqu3QTx0hKg
         F9BlhTGC/r87fMThpqEgsDnoS7HnclpBSR9dKVDnycaulaDQ4WG53dUo4ShbPAlfwQgb
         4jXg==
X-Gm-Message-State: AOJu0YxrsOoNmA6YLPpzDi69h/5nQIqx8PEV7L8MhHoyjM2SVe8Heech
	8RqNaN74gT1NhJgogK1GPghZmvVxPULHh88tPGU6cN5RB9An0mloPMZcePJDsIslOd/NV+qxKDg
	/nsDIyLQ=
X-Gm-Gg: ATEYQzwqZql1dIeBIqRvcA0B4jxV4tgacNs8Z4676Fq3kWf61pFBDFQmrSButyCKzNO
	7qS/v6Xzodgou1Ca8IwR7fw9EDsiTQ7Ey2w/4yUbdLtgxthpj//GZhJgZoj27IZucOyhqnd2wXD
	t2HiyjWNaoOtOyLUTQfqjT22yltk0AWv3WZimNFr4wSZcs8jSadJeSchCm7tFMPlyHHOmFeeEPK
	2qc/gx4aejBAmSCRvQ8SG4FVgCCFGss83ZMdczjx7uXvFtVaQKyjVDmT5JF6Lu1iwF2NNhK0VpE
	RrdfjTsB/rxn2bx/CKC1wjMM24YEDnZNSJ7oCi/4YSbS651tnxA0AU2RVD79bXo9QwqJbsyDSt1
	gw0hLH6cYJPiAKtr8iD/sEk1l1W0hMhnOeAJx5DVa+1QoDzgPpE7C+kZIiQSeVqxA2YA5bqcJqo
	aV11+g2eZiIjDaomE2SOiwDj35lLQ3Q8pyvgdS6cCwse0DL6txdDQFJwH3jGlMtj9a3iXc1tXLn
	QjxXMI+vhIIyCqybSo3v07rbo2yWVWH7lbCMZ9pup2ekBC9IUeOtw==
X-Received: by 2002:a17:907:cb02:b0:b97:914c:2949 with SMTP id a640c23a62f3a-b97f4885628mr347086966b.9.1773925597329;
        Thu, 19 Mar 2026 06:06:37 -0700 (PDT)
Message-ID: <8d9c33a5-3bf6-4056-9e94-e039a3e39606@suse.com>
Date: Thu, 19 Mar 2026 14:06:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/11] tools/xl: add xl commands for xenstore quota
 operations
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org
References: <20260305135208.2208663-1-jgross@suse.com>
 <20260305135208.2208663-11-jgross@suse.com> <abvuAQJkihgFvSzj@l14>
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
In-Reply-To: <abvuAQJkihgFvSzj@l14>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------94opsNtYHNJdDm4yVvnH1edR"
X-Spamd-Result: default: False [-1.46 / 15.00];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	R_MIXED_CHARSET(0.63)[subject];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWO(0.00)[2];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	HAS_ATTACHMENT(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: CC3A62CBA51
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------94opsNtYHNJdDm4yVvnH1edR
Content-Type: multipart/mixed; boundary="------------K2ezLQ6R3FwJshPDF5cWi6E4";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org
Message-ID: <8d9c33a5-3bf6-4056-9e94-e039a3e39606@suse.com>
Subject: Re: [PATCH 10/11] tools/xl: add xl commands for xenstore quota
 operations
References: <20260305135208.2208663-1-jgross@suse.com>
 <20260305135208.2208663-11-jgross@suse.com> <abvuAQJkihgFvSzj@l14>
In-Reply-To: <abvuAQJkihgFvSzj@l14>

--------------K2ezLQ6R3FwJshPDF5cWi6E4
Content-Type: multipart/mixed; boundary="------------4mPx5mGd94XFGYmHvjayo00m"

--------------4mPx5mGd94XFGYmHvjayo00m
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTkuMDMuMjYgMTM6MzcsIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0KPiBPbiBUaHUsIE1h
ciAwNSwgMjAyNiBhdCAwMjo1MjowN1BNICswMTAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
Pj4gQWRkICJ4bCB4ZW5zdG9yZS1xdW90YS1nZXQiIGFuZCAieGwgeGVuc3RvcmUtcXVvdGEt
c2V0IiBjb21tYW5kcyBmb3INCj4+IHJldHJpZXZpbmcgYW5kIHNldHRpbmcgZ2xvYmFsIGFu
ZCBwZXItZG9tYWluIFhlbnN0b3JlIHF1b3RhLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEp1
ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4+IC0tLQ0KPj4gICB0b29scy94bC9N
YWtlZmlsZSAgICAgIHwgIDEgKw0KPj4gICB0b29scy94bC94bC5oICAgICAgICAgIHwgIDIg
Kw0KPj4gICB0b29scy94bC94bF9jbWR0YWJsZS5jIHwgMTAgKysrKysNCj4+ICAgdG9vbHMv
eGwveGxfcGFyc2UuYyAgICB8IDI1ICsrKysrKysrKysrKw0KPj4gICB0b29scy94bC94bF9w
YXJzZS5oICAgIHwgIDEgKw0KPj4gICB0b29scy94bC94bF94c3F1b3RhLmMgIHwgODggKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+PiAgIDYgZmlsZXMg
Y2hhbmdlZCwgMTI3IGluc2VydGlvbnMoKykNCj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRv
b2xzL3hsL3hsX3hzcXVvdGEuYw0KPj4NCj4+IGRpZmYgLS1naXQgYS90b29scy94bC9NYWtl
ZmlsZSBiL3Rvb2xzL3hsL01ha2VmaWxlDQo+PiBpbmRleCA5NzNmZjBlMWEyLi5lNGVlZDhi
ZTEzIDEwMDY0NA0KPj4gLS0tIGEvdG9vbHMveGwvTWFrZWZpbGUNCj4+ICsrKyBiL3Rvb2xz
L3hsL01ha2VmaWxlDQo+PiBAQCAtMjQsNiArMjQsNyBAQCBYTF9PQkpTICs9IHhsX3NjaGVk
Lm8geGxfcGNpLm8geGxfdmNwdS5vIHhsX2Nkcm9tLm8geGxfbWVtLm8NCj4+ICAgWExfT0JK
UyArPSB4bF9pbmZvLm8geGxfY29uc29sZS5vIHhsX21pc2Mubw0KPj4gICBYTF9PQkpTICs9
IHhsX3ZtY29udHJvbC5vIHhsX3NhdmVyZXN0b3JlLm8geGxfbWlncmF0ZS5vDQo+PiAgIFhM
X09CSlMgKz0geGxfdmRpc3BsLm8geGxfdnNuZC5vIHhsX3ZrYi5vDQo+PiArWExfT0JKUyAr
PSB4bF94c3F1b3RhLm8NCj4+ICAgDQo+PiAgICQoWExfT0JKUyk6IENGTEFHUyArPSAkKENG
TEFHU19saWJ4ZW50b29sbG9nKQ0KPj4gICAkKFhMX09CSlMpOiBDRkxBR1MgKz0gJChDRkxB
R1NfWEwpDQo+PiBkaWZmIC0tZ2l0IGEvdG9vbHMveGwveGwuaCBiL3Rvb2xzL3hsL3hsLmgN
Cj4+IGluZGV4IDkwMDBkZjAwZGUuLjBlZmMwN2E2YmEgMTAwNjQ0DQo+PiAtLS0gYS90b29s
cy94bC94bC5oDQo+PiArKysgYi90b29scy94bC94bC5oDQo+PiBAQCAtMjE3LDYgKzIxNyw4
IEBAIGludCBtYWluX3Bzcl9tYmFfc2V0KGludCBhcmdjLCBjaGFyICoqYXJndik7DQo+PiAg
IGludCBtYWluX3Bzcl9tYmFfc2hvdyhpbnQgYXJnYywgY2hhciAqKmFyZ3YpOw0KPj4gICAj
ZW5kaWYNCj4+ICAgaW50IG1haW5fcWVtdV9tb25pdG9yX2NvbW1hbmQoaW50IGFyZ2MsIGNo
YXIgKiphcmd2KTsNCj4+ICtpbnQgbWFpbl94c3F1b3RhX2dldChpbnQgYXJnYywgY2hhciAq
KmFyZ3YpOw0KPj4gK2ludCBtYWluX3hzcXVvdGFfc2V0KGludCBhcmdjLCBjaGFyICoqYXJn
dik7DQo+PiAgIA0KPj4gICB2b2lkIGhlbHAoY29uc3QgY2hhciAqY29tbWFuZCk7DQo+PiAg
IA0KPj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3hsL3hsX2NtZHRhYmxlLmMgYi90b29scy94bC94
bF9jbWR0YWJsZS5jDQo+PiBpbmRleCAwNmEwMDM5NzE4Li4zZGUxMmIxMmFlIDEwMDY0NA0K
Pj4gLS0tIGEvdG9vbHMveGwveGxfY21kdGFibGUuYw0KPj4gKysrIGIvdG9vbHMveGwveGxf
Y21kdGFibGUuYw0KPj4gQEAgLTY0OSw2ICs2NDksMTYgQEAgY29uc3Qgc3RydWN0IGNtZF9z
cGVjIGNtZF90YWJsZVtdID0gew0KPj4gICAgICAgICAiLWggcHJpbnQgdGhpcyBoZWxwXG4i
DQo+PiAgICAgICB9LA0KPj4gICAjZW5kaWYNCj4+ICsgICAgeyAieGVuc3RvcmUtcXVvdGEt
Z2V0IiwNCj4+ICsgICAgICAmbWFpbl94c3F1b3RhX2dldCwgMCwgMCwNCj4+ICsgICAgICAi
TGlzdCBnbG9iYWwgb3IgZG9tYWluIHNwZWNpZmljIFhlbnN0b3JlIHF1b3RhIGRhdGEiLA0K
PiANCj4gTWF5YmUgc2F5aW5nICJxdW90YSB2YWx1ZXMiIGluc3RlYWQgb2YgInF1b3RhIGRh
dGEiIHdvdWxkIGJlIHNsaWdodGx5DQo+IGJldHRlci4gT3IgbWF5YmUgZXZlbiAicXVvdGFz
IiB3b3VsZCBiZSBlbm91Z2guDQo+IA0KPj4gKyAgICAgICI8RG9tYWluPnwtZyIsDQo+PiAr
ICAgIH0sDQo+PiArICAgIHsgInhlbnN0b3JlLXF1b3RhLXNldCIsDQo+PiArICAgICAgJm1h
aW5feHNxdW90YV9zZXQsIDAsIDEsDQo+PiArICAgICAgIlNldCBnbG9iYWwgb3IgZG9tYWlu
IHNwZWNpZmljIFhlbnN0b3JlIHF1b3RhIGRhdGEiLA0KPj4gKyAgICAgICI8RG9tYWluPnwt
ZyA8cXVvdGE+PTx2YWw+Li4uIiwNCj4+ICsgICAgfSwNCj4+ICAgfTsNCj4+ICAgDQo+PiAg
IGNvbnN0IGludCBjbWR0YWJsZV9sZW4gPSBBUlJBWV9TSVpFKGNtZF90YWJsZSk7DQo+PiBk
aWZmIC0tZ2l0IGEvdG9vbHMveGwveGxfcGFyc2UuYyBiL3Rvb2xzL3hsL3hsX3BhcnNlLmMN
Cj4+IGluZGV4IDFhMmVhOGI1ZDUuLjkzNGFkNGVlZWYgMTAwNjQ0DQo+PiAtLS0gYS90b29s
cy94bC94bF9wYXJzZS5jDQo+PiArKysgYi90b29scy94bC94bF9wYXJzZS5jDQo+PiBAQCAt
MTMxNCw2ICsxMzE0LDMxIEBAIG91dDoNCj4+ICAgICAgIHJldHVybiByZXQ7DQo+PiAgIH0N
Cj4+ICAgDQo+PiAraW50IHBhcnNlX3hzcXVvdGFfaXRlbShjb25zdCBjaGFyICpidWYsIHN0
cnVjdCBsaWJ4bF94c19xdW90YV9pdGVtICppdGVtKQ0KPj4gK3sNCj4+ICsgICAgY29uc3Qg
Y2hhciAqZXE7DQo+PiArICAgIGNoYXIgKmVuZHB0cjsNCj4+ICsNCj4+ICsgICAgZXEgPSBz
dHJjaHIoYnVmLCAnPScpOw0KPj4gKyAgICBpZiAoIWVxKSB7DQo+PiArICAgICAgICBmcHJp
bnRmKHN0ZGVyciwgIlF1b3RhIHNwZWNpZmljYXRpb24gXCIlc1wiIGxhY2tzIFwiPVwiLlxu
IiwgYnVmKTsNCj4+ICsgICAgICAgIHJldHVybiBFUlJPUl9JTlZBTDsNCj4+ICsgICAgfQ0K
Pj4gKyAgICBlcnJubyA9IDA7DQo+PiArICAgIGl0ZW0tPm5hbWUgPSBzdHJuZHVwKGJ1Ziwg
ZXEgLSBidWYpOw0KPj4gKyAgICBpZiAoIWl0ZW0tPm5hbWUpDQo+PiArICAgICAgICByZXR1
cm4gRVJST1JfTk9NRU07DQo+PiArICAgIGl0ZW0tPnZhbCA9IHN0cnRvdWwoZXEgKyAxLCAm
ZW5kcHRyLCAwKTsNCj4+ICsgICAgaWYgKGVycm5vIHx8ICFlcVsxXSB8fCAqZW5kcHRyKSB7
DQo+IA0KPiBJIHRoaW5rIHdlIGFsc28gbmVlZCB0byBjaGVjayB0aGF0IHRoZSB2YWx1ZSBy
ZXR1cm5lZCBieSBzdHJ0b3VsKCkgY2FuDQo+IGFjdHVhbGx5IGJlIHN0b3JlZCBpbiBgaXRl
bS0+dmFsYC4gSXQgd291bGQgYmUgbWlzbGVhZGluZyB0byBhY2NlcHQgYQ0KPiBxdW90YSB2
YWx1ZSBhbmQgc3RvcmUgYSBkaWZmZXJlbnQgb25lLg0KPiANCj4+ICsgICAgICAgIGZwcmlu
dGYoc3RkZXJyLA0KPj4gKyAgICAgICAgICAgICAgICAiUXVvdGEgc3BlY2lmaWNhdGlvbiBc
IiVzXCIgdXNlcyBpbGxlZ2FsIHZhbHVlIFwiJXNcIi5cbiIsDQo+PiArICAgICAgICAgICAg
ICAgIGJ1ZiwgZXEpOw0KPj4gKyAgICAgICAgcmV0dXJuIEVSUk9SX0lOVkFMOw0KPj4gKyAg
ICB9DQo+PiArDQo+PiArICAgIHJldHVybiAwOw0KPj4gK30NCj4+ICsNCj4+ICAgdm9pZCBw
YXJzZV9jb25maWdfZGF0YShjb25zdCBjaGFyICpjb25maWdfc291cmNlLA0KPj4gICAgICAg
ICAgICAgICAgICAgICAgICAgIGNvbnN0IGNoYXIgKmNvbmZpZ19kYXRhLA0KPj4gICAgICAg
ICAgICAgICAgICAgICAgICAgIGludCBjb25maWdfbGVuLA0KPj4gZGlmZiAtLWdpdCBhL3Rv
b2xzL3hsL3hsX3BhcnNlLmggYi90b29scy94bC94bF9wYXJzZS5oDQo+PiBpbmRleCBmZTBk
NTg2Y2RkLi41N2JiNDNhMDY3IDEwMDY0NA0KPj4gLS0tIGEvdG9vbHMveGwveGxfcGFyc2Uu
aA0KPj4gKysrIGIvdG9vbHMveGwveGxfcGFyc2UuaA0KPj4gQEAgLTM2LDYgKzM2LDcgQEAg
aW50IHBhcnNlX25pY19jb25maWcobGlieGxfZGV2aWNlX25pYyAqbmljLCBYTFVfQ29uZmln
ICoqY29uZmlnLCBjaGFyICp0b2tlbik7DQo+PiAgIGludCBwYXJzZV92ZGlzcGxfY29uZmln
KGxpYnhsX2RldmljZV92ZGlzcGwgKnZkaXNwbCwgY2hhciAqdG9rZW4pOw0KPj4gICBpbnQg
cGFyc2VfdnNuZF9pdGVtKGxpYnhsX2RldmljZV92c25kICp2c25kLCBjb25zdCBjaGFyICpz
cGVjKTsNCj4+ICAgaW50IHBhcnNlX3ZrYl9jb25maWcobGlieGxfZGV2aWNlX3ZrYiAqdmti
LCBjaGFyICp0b2tlbik7DQo+PiAraW50IHBhcnNlX3hzcXVvdGFfaXRlbShjb25zdCBjaGFy
ICpidWYsIHN0cnVjdCBsaWJ4bF94c19xdW90YV9pdGVtICppdGVtKTsNCj4+ICAgDQo+PiAg
IGludCBtYXRjaF9vcHRpb25fc2l6ZShjb25zdCBjaGFyICpwcmVmaXgsIHNpemVfdCBsZW4s
DQo+PiAgICAgICAgICAgICAgICAgICAgICAgICBjaGFyICphcmcsIGNoYXIgKiphcmdvcHQp
Ow0KPj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3hsL3hsX3hzcXVvdGEuYyBiL3Rvb2xzL3hsL3hs
X3hzcXVvdGEuYw0KPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4+IGluZGV4IDAwMDAwMDAw
MDAuLmVhZjE5ZmVhYzgNCj4+IC0tLSAvZGV2L251bGwNCj4+ICsrKyBiL3Rvb2xzL3hsL3hs
X3hzcXVvdGEuYw0KPj4gQEAgLTAsMCArMSw4OCBAQA0KPj4gKy8qIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBMR1BMLTIuMS1vbmx5ICovDQo+PiArDQo+PiArI2luY2x1ZGUgPHN0ZGlv
Lmg+DQo+PiArI2luY2x1ZGUgPHN0ZGxpYi5oPg0KPj4gKyNpbmNsdWRlIDxsaWJ4bC5oPg0K
Pj4gKyNpbmNsdWRlIDxsaWJ4bHV0aWwuaD4NCj4+ICsNCj4+ICsjaW5jbHVkZSAieGwuaCIN
Cj4+ICsjaW5jbHVkZSAieGxfdXRpbHMuaCINCj4+ICsjaW5jbHVkZSAieGxfcGFyc2UuaCIN
Cj4+ICsNCj4+ICtpbnQgbWFpbl94c3F1b3RhX2dldChpbnQgYXJnYywgY2hhciAqKmFyZ3Yp
DQo+PiArew0KPj4gKyAgICBsaWJ4bF94c19xdW90YV9zZXQgcTsNCj4+ICsgICAgdW5zaWdu
ZWQgaW50IGk7DQo+PiArICAgIGludCByYzsNCj4gDQo+IFlvdSBzaG91bGQgY2FsbCBsaWJ4
bF94c19xdW90YV9zZXRfaW5pdCgmcSkuIChUaGF0IHdvdWxkIGF2b2lkIGEgc2Vndg0KPiBs
YXRlciwgd2hlbiBfZGlzcG9zZWQoKSBpcyBjYWxsZWQuKQ0KPiANCj4+ICsNCj4+ICsgICAg
aWYgKGFyZ2MgIT0gMikgew0KPj4gKyAgICAgICAgZnByaW50ZihzdGRlcnIsICJEb21haW4g
b3IgXCItZ1wiIG11c3QgYmUgc3BlY2lmaWVkLlxuIik7DQo+PiArICAgICAgICByZXR1cm4g
RVhJVF9GQUlMVVJFOw0KPj4gKyAgICB9DQo+PiArDQo+PiArICAgIGlmICghc3RyY21wKGFy
Z3ZbMV0sICItZyIpKSB7DQo+PiArICAgICAgICByYyA9IGxpYnhsX3hzcXVvdGFfZ2xvYmFs
X2dldChjdHgsICZxKTsNCj4+ICsgICAgfSBlbHNlIHsNCj4+ICsgICAgICAgIHVpbnQzMl90
IGRvbWlkID0gZmluZF9kb21haW4oYXJndlsxXSk7DQo+PiArDQo+PiArICAgICAgICByYyA9
IGxpYnhsX3hzcXVvdGFfZG9tYWluX2dldChjdHgsIGRvbWlkLCAmcSk7DQo+PiArICAgIH0N
Cj4+ICsNCj4+ICsgICAgaWYgKHJjKSB7DQo+PiArICAgICAgICBmcHJpbnRmKHN0ZGVyciwg
IlF1b3RhIGNvdWxkIG5vdCBiZSBvYnRhaW5lZC5cbiIpOw0KPj4gKyAgICAgICAgcmV0dXJu
IEVYSVRfRkFJTFVSRTsNCj4+ICsgICAgfQ0KPj4gKw0KPj4gKyAgICBwcmludGYoIlF1b3Rh
IG5hbWUgICAgICAgICAgIFF1b3RhIHZhbHVlXG4iKTsNCj4+ICsgICAgcHJpbnRmKCItLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLVxuIik7DQo+PiArICAgIGZvciAoaSA9IDA7
IGkgPCBxLm51bV9xdW90YTsgaSsrKQ0KPj4gKyAgICAgICAgcHJpbnRmKCIlLTIwcyAlOHVc
biIsIHEucXVvdGFbaV0ubmFtZSwgcS5xdW90YVtpXS52YWwpOw0KPj4gKw0KPj4gKyAgICBs
aWJ4bF94c19xdW90YV9zZXRfZGlzcG9zZSgmcSk7DQo+PiArDQo+PiArICAgIHJldHVybiBF
WElUX1NVQ0NFU1M7DQo+PiArfQ0KPj4gKw0KPj4gK2ludCBtYWluX3hzcXVvdGFfc2V0KGlu
dCBhcmdjLCBjaGFyICoqYXJndikNCj4+ICt7DQo+PiArICAgIHVuc2lnbmVkIGludCBpOw0K
Pj4gKyAgICBsaWJ4bF94c19xdW90YV9zZXQgcTsNCj4+ICsgICAgaW50IHJjID0gRVhJVF9G
QUlMVVJFOw0KPj4gKw0KPj4gKyAgICBpZiAoYXJnYyA8IDMpIHsNCj4+ICsgICAgICAgIGZw
cmludGYoc3RkZXJyLCAiTm90IGVub3VnaCBwYXJhbWV0ZXJzLlxuIik7DQo+IA0KPiBJIHRo
aW5rIHlvdSBjYW4gY2FsbCBoZWxwKCJ4ZW5zdG9yZS1xdW90YS1zZXQiKSB0byBwcm92aWRl
IHRoZSBuZWVkZWQNCj4gaW5mbyBhYm91dCB3aGF0IHRoZSBwYXJhbWV0ZXJzIGFyZS4NCj4g
DQo+PiArICAgICAgICByZXR1cm4gRVhJVF9GQUlMVVJFOw0KPj4gKyAgICB9DQo+PiArDQo+
PiArICAgIHEubnVtX3F1b3RhID0gYXJnYyAtIDI7DQo+PiArICAgIHEucXVvdGEgPSBjYWxs
b2MocS5udW1fcXVvdGEsIHNpemVvZigqcS5xdW90YSkpOw0KPj4gKyAgICBpZiAoIXEucXVv
dGEpIHsNCj4+ICsgICAgICAgIGZwcmludGYoc3RkZXJyLCAiTWVtb3J5IGFsbG9jYXRpb24g
ZmFpbHVyZSFcbiIpOw0KPj4gKyAgICAgICAgZ290byBlcnI7DQo+PiArICAgIH0NCj4gDQo+
IFRoZXJlJ3MgYHhjYWxsb2MoKSB0aGF0IGNhbiBiZSB1c2UgaW5zdGVhZC4gSXQgZG9lcyBj
aGVjayBmb3IgbWVtb3J5DQo+IGFsbG9jYXRpb24gZmFpbHVyZS4NCj4gDQo+IChBbmQgdGhh
dCB3b3VsZCBhdm9pZCBhIHNlZ3YgaW4gbGlieGxfeHNfcXVvdGFfc2V0X2Rpc3Bvc2UoKSBh
cw0KPiBudW1fcXVvdGEgaXMgc2V0IGJlZm9yZSBxdW90YSBpcyBhbGxvY2F0ZWQuKQ0KDQpJ
J20gZmluZSB3aXRoIGFsbCB5b3VyIHN1Z2dlc3Rpb25zLg0KDQpUaGFua3MsDQoNCkp1ZXJn
ZW4NCg==
--------------4mPx5mGd94XFGYmHvjayo00m
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------4mPx5mGd94XFGYmHvjayo00m--

--------------K2ezLQ6R3FwJshPDF5cWi6E4--

--------------94opsNtYHNJdDm4yVvnH1edR
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmm79NwFAwAAAAAACgkQsN6d1ii/Ey/q
8wf/XydjzDtypzv/lB9AKhQqXUW4tPT/hSk46lY86CM0gSi26yXpFfvh2s8B480bG7SYH+ZBC5z8
VShuyk+ITWIvy7VeSndvL2h8KnHnTJbnGnTnQQP7bmG0ZkXZ4bjnLfCzsrmy6C/11G8MNMjYHEfn
7T5baT4VyJF7ra9jykfFmAEhWo007gJRHDKP66GMbvJvsoTSz2d8UtK4w/itA61TpUWsOjZhq0l2
v0WqhV+h1id9dNFPBzp6k6CvVCiG1ub4wKgbkHzM0ca0jICsm5RGgGco31R2+QXk1Irq2AhJudiv
UKYNTDSe/CqSxY/on1Bz9lBPPtSwodj1OLlx8nmROg==
=aZNz
-----END PGP SIGNATURE-----

--------------94opsNtYHNJdDm4yVvnH1edR--

