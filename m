Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OrCN+a8t2mpUgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Mar 2026 09:18:46 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8F52960EB
	for <lists+xen-devel@lfdr.de>; Mon, 16 Mar 2026 09:18:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1255479.1550429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w239p-0003xL-2e; Mon, 16 Mar 2026 08:18:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1255479.1550429; Mon, 16 Mar 2026 08:18:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w239p-0003uJ-00; Mon, 16 Mar 2026 08:18:37 +0000
Received: by outflank-mailman (input) for mailman id 1255479;
 Mon, 16 Mar 2026 08:18:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6b3Y=BQ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1w239o-0003uB-1i
 for xen-devel@lists.xenproject.org; Mon, 16 Mar 2026 08:18:36 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b94ff07b-2110-11f1-9ccf-f158ae23cfc8;
 Mon, 16 Mar 2026 09:18:33 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-b979d16dd0cso213036566b.1
 for <xen-devel@lists.xenproject.org>; Mon, 16 Mar 2026 01:18:33 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b976cdb1d20sm518700466b.41.2026.03.16.01.18.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Mar 2026 01:18:32 -0700 (PDT)
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
X-Inumbo-ID: b94ff07b-2110-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773649113; x=1774253913; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CvDuAouVbU+9uOzuCq2awZj3v5+z7MwPRUHgf/QlgUA=;
        b=EVZLWaB7n4kg4TS7VRkMTGaGpy9S7XOSfcRLDmrDFPEOV81sADtKJLf62YIm1ZN6PP
         zNvyTW8lKBPucapSeLrwgb6UxHBokEtWWDMDklvEvibJSu1m7NiqMn+07nMw/mV2i0p4
         GtUAm7hF1q+ugEqR8CjVlofA7Pd1uzCcBTDoaqz8ger+OTZ8PVr2Uw5/7HevE/ntK0pf
         fLxjV+az/eKiNTyEtVqfW3fc2al5Pr50noVvmcDdlQX95gF3BayYvXrrtAMhcd/GXKLh
         c2Af3Ecnl9/Y+CN7tjfb2ZrFJ730F7kgenZx8Rh/4+Qlpc2tXNkRkUyvixPWG0ulvvZh
         gnqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773649113; x=1774253913;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CvDuAouVbU+9uOzuCq2awZj3v5+z7MwPRUHgf/QlgUA=;
        b=fSxK0bM2aafyZ2V5n3rnUCat0Vy8/uhiK+51ma/NTLnLIT1T10HErUOE3hvzHQq6gY
         Wub6pw5c9SQJTs6rdX277D0xGpBP0Uql+C6RN7vdGKgTbAs7w3pyCD7wIGRHKn0AfLxk
         /cDc4LgFPRN1tnpRpfsVtlm4/DxXdaziXtDiFVJYjzNOSF8viKhWKW47fwnLRBr7YuFT
         /jykiXwF9RPVV+l5CDtm/9JtV0DDZcxho0IZMbecTZvXyQIPLCpiKY7slJBHmYxt6tOZ
         ESiY0QKE+lVGPoLL44kX5PW9R/GbLLlYibLEe91g0SdueNQQwOajDlLdLKqhUP5prv6I
         A6FQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaZXq8YGYlDeQ1UmH/GVlmZPVmKBfI9/MvVrkSOhfmn16mamwPbmvDOceJWVceGcbJPvO//wPycfs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxQsRX3Rv9UnR5apCWYg1uke9yOg5pGBBEgguFeHWo8p032eu1J
	Ay1jr+9P8fqlionwrPtHBOK6eY0CbDJt6QJbyx5D8lGBC3gqIOB51VsiB0pZAhl8Jys=
X-Gm-Gg: ATEYQzw9hcBJZ4zDtv3y4f2f9dvMGJLHbtTTtflX6uNuEpEPMe1CIPLTFi6Z0yIXEq+
	/6GEf+fZNM4s7ZmFkYz4I6rRAeR0xecyWyKTgVXXI0zdldRGeBmVYMZyXgkOMidL5GmmKIibHCF
	S8Ay+5nrAZu31McwM/aoMLTGzyGBou2ygfIWgF7lJX2diGjo6gxfn3LGE83a1I8f9+/9EAHciHy
	qrWkjn04PnQfrcYZ9R5IYr45pMdKKxv0nDFyh9mNVkFreQsab7Ns72L9LwOwfYE2YZ6DiMLj9dj
	FjSzEePqEaU6q6AxD11P1Pwhy+smUESM8nRQC43IL49KaY9boBu8FSy2gu4BGSW4Ortx+p0Z/oW
	LtgD7ppi/q9Zh2ZQjy+rcxlqxiKhZwmeklzJW8fEiBAXuGD1nLha5SGuTTH224WnkiLZob2j60n
	ZLUAt1yEdfRXyYfLVzH/b/8lc0demqKkuHBaMYwbhqOUurLf5HKlHQn0+JVj0JkRVHyvk+15XQG
	EDAJdI5L0oYRzd4JCGdaLKKoGlc81Y+wrkPYi8APTdso4K3Tg7WTQ==
X-Received: by 2002:a17:907:934b:b0:b83:1433:78de with SMTP id a640c23a62f3a-b9764f4b53emr687528866b.12.1773649112987;
        Mon, 16 Mar 2026 01:18:32 -0700 (PDT)
Message-ID: <d39a245d-695e-4011-aabc-75faca955a97@suse.com>
Date: Mon, 16 Mar 2026 09:18:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] tools/xenstored: add central quota check functions
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <20260305135208.2208663-1-jgross@suse.com>
 <20260305135208.2208663-3-jgross@suse.com>
 <735cfce6-28db-4fb9-9e0d-d3f3f18403a2@amd.com>
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
In-Reply-To: <735cfce6-28db-4fb9-9e0d-d3f3f18403a2@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------poJWC87c8uR5WDB2ZmAqBq6i"
X-Spamd-Result: default: False [-2.37 / 15.00];
	SIGNED_PGP(-2.00)[];
	R_MIXED_CHARSET(0.71)[subject];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,m:julien@xen.org,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 4F8F52960EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------poJWC87c8uR5WDB2ZmAqBq6i
Content-Type: multipart/mixed; boundary="------------DComwpie8X70GXGm78gsFI8o";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
Message-ID: <d39a245d-695e-4011-aabc-75faca955a97@suse.com>
Subject: Re: [PATCH 02/11] tools/xenstored: add central quota check functions
References: <20260305135208.2208663-1-jgross@suse.com>
 <20260305135208.2208663-3-jgross@suse.com>
 <735cfce6-28db-4fb9-9e0d-d3f3f18403a2@amd.com>
In-Reply-To: <735cfce6-28db-4fb9-9e0d-d3f3f18403a2@amd.com>

--------------DComwpie8X70GXGm78gsFI8o
Content-Type: multipart/mixed; boundary="------------6Hi0Ced0vbUZxngCR0nlQQZ0"

--------------6Hi0Ced0vbUZxngCR0nlQQZ0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTMuMDMuMjYgMjI6MjIsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IE9uIDIwMjYtMDMt
MDUgMDg6NTEsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBBZGQgY2VudHJhbCBmdW5jdGlv
bnMgZm9yIGNoZWNraW5nIGEgdmFsdWUgKGVpdGhlciBhbiBhYnNvbHV0ZSBvbmUgb3INCj4+
IHRoZSBjdXJyZW50IGRvbWFpbiB2YWx1ZSBwbHVzIGFuIG9mZnNldCkgYWdhaW5zdCBhIHNw
ZWNpZmljIHF1b3RhLg0KPj4NCj4+IFRoaXMgaXMgaW4gcHJlcGFyYXRpb24gb2YgaW50cm9k
dWNpbmcgcGVyLWRvbWFpbiBxdW90YS4NCj4+DQo+PiBUaGUgcmVxdWlyZWQgY2hhbmdlcyBh
bGxvdyB0byBkcm9wIHRoZSAidXBkYXRlIiBwYXJhbWV0ZXIgZnJvbQ0KPj4gZG9tYWluX25i
ZW50cnlfZml4KCkuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdy
b3NzQHN1c2UuY29tPg0KPiANCj4+IGRpZmYgLS1naXQgYS90b29scy94ZW5zdG9yZWQvZG9t
YWluLmMgYi90b29scy94ZW5zdG9yZWQvZG9tYWluLmMNCj4+IGluZGV4IGU0NTNiMzA2MWYu
LjFkZjkyNjVhZDUgMTAwNjQ0DQo+PiAtLS0gYS90b29scy94ZW5zdG9yZWQvZG9tYWluLmMN
Cj4+ICsrKyBiL3Rvb2xzL3hlbnN0b3JlZC9kb21haW4uYw0KPj4gQEAgLTM4OSw2ICszODks
MjUgQEAgdm9pZCB3cmxfYXBwbHlfZGViaXRfdHJhbnNfY29tbWl0KHN0cnVjdCBjb25uZWN0
aW9uICpjb25uKQ0KPj4gwqDCoMKgwqDCoCB3cmxfYXBwbHlfZGViaXRfYWN0dWFsKGNvbm4t
PmRvbWFpbik7DQo+PiDCoCB9DQo+PiArc3RhdGljIGJvb2wgZG9tYWluX2NoZWNrX3F1b3Rh
X3ZhbChzdHJ1Y3QgZG9tYWluICpkLCBlbnVtIGFjY2l0ZW0gd2hhdCwNCj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgaW50IHZhbCkNCj4+ICt7
DQo+PiArwqDCoMKgIHVuc2lnbmVkIGludCBxdW90YSA9IGhhcmRfcXVvdGFzW3doYXRdLnZh
bDsNCj4+ICsNCj4+ICvCoMKgwqAgaWYgKCFxdW90YSB8fCAhZG9taWRfaXNfdW5wcml2aWxl
Z2VkKGQtPmRvbWlkKSkNCj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gZmFsc2U7DQo+PiAr
DQo+PiArwqDCoMKgIHJldHVybiB2YWwgPj0gcXVvdGE7DQo+IA0KPiBQZXJzb25hbGx5LCBJ
IGRvbid0IGxpa2UgdGhlIG5hbWluZyBvZiAqY2hlY2sqIHdoZXJlIHRoZSAiZ29vZCIgcmV0
dXJuIGlzIA0KPiBmYWxzZS7CoCBUaGF0IHNlZW1zIGJhY2t3YXJkcyBmcm9tIHdoYXQgSSBl
eHBlY3QuwqAgU28gSSdkIHN1Z2dlc3QgZWl0aGVyIGZsaXBwaW5nIA0KPiB0aGUgcmV0dXJu
IHZhbHVlIG9yIHJlbmFtaW5nLsKgIGRvbWFpbl9xdW90YV9mYWlsKCkgb3Igc29tZXRoaW5n
Pw0KDQpJJ2xsIGdvIHdpdGggZG9tYWluX3F1b3RhX2V4Y2VlZGVkKCkuDQoNClRoYW5rcywN
Cg0KDQpKdWVyZ2VuDQo=
--------------6Hi0Ced0vbUZxngCR0nlQQZ0
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------6Hi0Ced0vbUZxngCR0nlQQZ0--

--------------DComwpie8X70GXGm78gsFI8o--

--------------poJWC87c8uR5WDB2ZmAqBq6i
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB3BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmm3vNgFAwAAAAAACgkQsN6d1ii/Ey83
5QfwmSWuOABUfgfOM8bR+GiN2RyafjIFbeUNMyz2qKL1RWXAVvHDrmfZfzHgtjtE1VJmbtKhwR42
CAUzvuHTesuqujITUm1Kw2NmgbMJWnKAuipljKHcE7IhLzl11JO2xl+gJjJaMVWmAqVY9lT8emgk
HjCHXPLxeucMn5KMiwVWRfzySVzd2BjPUW/+NPKGN95io32faTTgAhrRgGDs9GtCNm1v7m+JWBPg
kbU4+SfFA+Wzy5zwcInpJadI9KgMZxmkXWGXHg0rhZgCPMYzqAU74FNGKOyk9iUxnO1EA3eaf4hK
+MUChgBoH2XIDzO4SokoZ4TRLupRS537TNDBrOo=
=hnYW
-----END PGP SIGNATURE-----

--------------poJWC87c8uR5WDB2ZmAqBq6i--

