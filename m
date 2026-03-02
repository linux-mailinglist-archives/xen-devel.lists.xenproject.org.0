Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNHoF1AwpWkZ5QUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 07:38:08 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C8A1D381D
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 07:38:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1243968.1543454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vwwte-0004hA-35; Mon, 02 Mar 2026 06:36:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1243968.1543454; Mon, 02 Mar 2026 06:36:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vwwtd-0004e6-SN; Mon, 02 Mar 2026 06:36:49 +0000
Received: by outflank-mailman (input) for mailman id 1243968;
 Mon, 02 Mar 2026 06:36:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tIQT=BC=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vwwtc-0004e0-1O
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2026 06:36:48 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b9a331f-1602-11f1-9ccf-f158ae23cfc8;
 Mon, 02 Mar 2026 07:36:40 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b936505e7a0so2541266b.1
 for <xen-devel@lists.xenproject.org>; Sun, 01 Mar 2026 22:36:40 -0800 (PST)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b935ae93357sm432523066b.48.2026.03.01.22.36.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Mar 2026 22:36:39 -0800 (PST)
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
X-Inumbo-ID: 2b9a331f-1602-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772433400; x=1773038200; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VFeJ+uog/nc+ErP+4beRmfPzDf5x5oIBCjw/2iilkvM=;
        b=gTXeXyGyTZvOJiYne9hZ078Icpmc8767kQeOwZ/E+zH7Oj3vgvpxPSISko7/qqio3L
         huOE6zdCd8Y0pMRUcIdZSI3bsr76TrKprG9FDvLhOObZHsMtV/CooV0vdaHEUAemrZwI
         g8FkfeUAqz8z4EQo8qKSt/zol2d6PMMeoufp8cflMe6cWnqvJEQRhcjYbspuJfwTe/CX
         6yYcsWadUv6bzEdGThE7u67yGWuic6m0wmIhsHB9iZlLbiH6BdZ9a8ExOit9SS3PYZIF
         KJOeoibbdM825APx+6kku+Ddom8ZmGSib9pOnQCIJIqyL8YPMjaTp+9wHnev9V40l1s5
         3V6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772433400; x=1773038200;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VFeJ+uog/nc+ErP+4beRmfPzDf5x5oIBCjw/2iilkvM=;
        b=TH6+vTk8YF+KThDDEyR5CqLho7YWznJ5GUvSWXgHK21kkXHrKynCqHi/EkIPkZjtxF
         0ujnFzKlEKTvtLZykjAYIiIlFODOpyNmT8BVB4b3eU8Diju9HXplBxILPjS3DG4JxBNI
         o9w8/qQlGXs+9SDnZzgo1A40yUSeuJcgQ2Bcb5J4E59Dw9znGmmJv2v3y6L8IaU3qp14
         IPoZRjxW/yhcEOCHRp9DnQTOF59vYAzQpA5Zwo7v1xG2yZXFltRYvwvXpgtKmA/wG4jZ
         H1/zRPqUfYPywA3G0jvTJKh4kJ6DaWwg0hvYSTLlAQsTKeQBDaWofW0ocOtJ5vms//EH
         SbJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQTnOOOPjrXl0cjXSSd0d0uAuj7IvIyadT5SPRlF3kWGUDoxEbWgRIssOgV1ctOXJUbyHYYL050AE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyjqJDG7AVaPU6OBDSZrUQ3i5XgkigtlJW3t6gzbdM3NKcKsZrc
	rZbQHu0gbWVBRpDrIZbQX1zPDdRTJmVClEu7fKyziWcVFSe8CE/YK2hBddmlnabdZlyoecnZD8+
	0gRvZ
X-Gm-Gg: ATEYQzxAWCt5iebCQV5epe2Klgj3xZQF6ZXQab54FVNbQHKsi0xochjS8z2kj718BYN
	RADGlfzwmgcqBiS9cGz6K3eu3MMD/jjSxGEbFpcqsJvn7VprilLm52nVohhy0CCRs8GqjW1dn38
	fWUkN+djTujReVyLLhnMd6BHNgqyfHPfT0CwS4w2nItR5phR4AufLrbjs9X4dCsVv/IHw2rn9rd
	vtm1N8nvao8FwoScFDNLo/F0FaDijdGeAeVNCAm6Od9T+Yk+Hf7fhZqUHDTYgezJqIfvuDiOu0D
	TBQdnvTXOK0otLl+LGnibmKkRjZDGRrWhxbofWznnBKizJsaZU9m8OrlJan8JVmGFS3VTDVlADy
	rrmJ9uerNuOixOJWYKgopskrH7UdxoRq/Y3B6rcNrzGeqa0w7ulUq9NCzNwUOBCZNdijrbvDdkG
	WwLRgkyhpIi64JqeohoR3LYO6ZOW4NSc6BmK1Xr/edH35gmnvphEdbCB2I74MBSPN7OKndjN5Y1
	JiFyOG1CwrzzrxV2XBMNHQMIpIe56W4JeSqfgw1C/MJCmv0jxa/Pg==
X-Received: by 2002:a17:906:abc7:b0:b93:6360:9072 with SMTP id a640c23a62f3a-b936360a883mr727897966b.6.1772433399602;
        Sun, 01 Mar 2026 22:36:39 -0800 (PST)
Message-ID: <513e624f-35c1-4d43-ba3f-c96af613d400@suse.com>
Date: Mon, 2 Mar 2026 07:36:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Excluding init_on_free for pages for initial balloon down (Xen)
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>
References: <aaRVcVmtv2UBD-GF@mail-itl>
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
In-Reply-To: <aaRVcVmtv2UBD-GF@mail-itl>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------qOpJCOcuQxIXdDyr1Z4W58Du"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.32 / 15.00];
	SIGNED_PGP(-2.00)[];
	R_MIXED_CHARSET(0.77)[subject];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,m:boris.ostrovsky@oracle.com,m:akpm@linux-foundation.org,m:david@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: B7C8A1D381D
X-Rspamd-Action: no action

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------qOpJCOcuQxIXdDyr1Z4W58Du
Content-Type: multipart/mixed; boundary="------------K1a5M0y8ZSsiDXJ2z5xwGIzT";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>
Message-ID: <513e624f-35c1-4d43-ba3f-c96af613d400@suse.com>
Subject: Re: Excluding init_on_free for pages for initial balloon down (Xen)
References: <aaRVcVmtv2UBD-GF@mail-itl>
In-Reply-To: <aaRVcVmtv2UBD-GF@mail-itl>

--------------K1a5M0y8ZSsiDXJ2z5xwGIzT
Content-Type: multipart/mixed; boundary="------------VJ240JE505tAHMm1IzpxKJeu"

--------------VJ240JE505tAHMm1IzpxKJeu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDEuMDMuMjYgMTY6MDQsIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSB3cm90ZToN
Cj4gSGksDQo+IA0KPiBTb21lIHRpbWUgYWdvIEkgbWFkZSBhIGNoYW5nZSB0byBkaXNhYmxl
IHNjcnViYmluZyBwYWdlcyB0aGF0IGFyZQ0KPiBiYWxsb29uZWQgb3V0IGR1cmluZyBzeXN0
ZW0gYm9vdC4gSSdsbCBwYXN0ZSB0aGUgd2hvbGUgY29tbWl0IG1lc3NhZ2UgYXMNCj4gaXQn
cyByZWxldmFudCBoZXJlOg0KPiANCj4gICAgICAxOTdlY2IzODAyYzAgeGVuL2JhbGxvb246
IGFkZCBydW50aW1lIGNvbnRyb2wgZm9yIHNjcnViYmluZyBiYWxsb29uZWQgb3V0IHBhZ2Vz
DQo+IA0KPiAgICAgIFNjcnViYmluZyBwYWdlcyBvbiBpbml0aWFsIGJhbGxvb24gZG93biBj
YW4gdGFrZSBzb21lIHRpbWUsIGVzcGVjaWFsbHkNCj4gICAgICBpbiBuZXN0ZWQgdmlydHVh
bGl6YXRpb24gY2FzZSAobmVzdGVkIEVQVCBpcyBzbG93KS4gV2hlbiBIVk0vUFZIIGd1ZXN0
IGlzDQo+ICAgICAgc3RhcnRlZCB3aXRoIG1lbW9yeT0gc2lnbmlmaWNhbnRseSBsb3dlciB0
aGFuIG1heG1lbT0sIGFsbCB0aGUgZXh0cmENCj4gICAgICBwYWdlcyB3aWxsIGJlIHNjcnVi
YmVkIGJlZm9yZSByZXR1cm5pbmcgdG8gWGVuLiBCdXQgc2luY2UgbW9zdCBvZiB0aGVtDQo+
ICAgICAgd2VyZW4ndCB1c2VkIGF0IGFsbCBhdCB0aGF0IHBvaW50LCBYZW4gbmVlZHMgdG8g
cG9wdWxhdGUgdGhlbSBmaXJzdA0KPiAgICAgIChmcm9tIHBvcHVsYXRlLW9uLWRlbWFuZCBw
b29sKS4gSW4gbmVzdGVkIHZpcnQgY2FzZSAoWGVuIGluc2lkZSBLVk0pDQo+ICAgICAgdGhp
cyBzbG93cyBkb3duIHRoZSBndWVzdCBib290IGJ5IDE1LTMwcyB3aXRoIGp1c3QgMS41R0Ig
bmVlZGVkIHRvIGJlDQo+ICAgICAgcmV0dXJuZWQgdG8gWGVuLg0KPiAgICAgIA0KPiAgICAg
IEFkZCBydW50aW1lIHBhcmFtZXRlciB0byBlbmFibGUvZGlzYWJsZSBpdCwgdG8gYWxsb3cg
aW5pdGlhbGx5IGRpc2FibGluZw0KPiAgICAgIHNjcnViYmluZywgdGhlbiBlbmFibGUgaXQg
YmFjayBkdXJpbmcgYm9vdCAoZm9yIGV4YW1wbGUgaW4gaW5pdHJhbWZzKS4NCj4gICAgICBT
dWNoIHVzYWdlIHJlbGllcyBvbiBhc3N1bXB0aW9uIHRoYXQgYSkgbW9zdCBwYWdlcyBiYWxs
b29uZWQgb3V0IGR1cmluZw0KPiAgICAgIGluaXRpYWwgYm9vdCB3ZXJlbid0IHVzZWQgYXQg
YWxsLCBhbmQgYikgZXZlbiBpZiB0aGV5IHdlcmUsIHZlcnkgZmV3DQo+ICAgICAgc2VjcmV0
cyBhcmUgaW4gdGhlIGd1ZXN0IGF0IHRoYXQgdGltZSAoYmVmb3JlIGFueSBzZXJpb3VzIHVz
ZXJzcGFjZQ0KPiAgICAgIGtpY2tzIGluKS4NCj4gICAgICBDb252ZXJ0IENPTkZJR19YRU5f
U0NSVUJfUEFHRVMgdG8gQ09ORklHX1hFTl9TQ1JVQl9QQUdFU19ERUZBVUxUIChhbHNvDQo+
ICAgICAgZW5hYmxlZCBieSBkZWZhdWx0KSwgY29udHJvbGxpbmcgZGVmYXVsdCB2YWx1ZSBm
b3IgdGhlIG5ldyBydW50aW1lDQo+ICAgICAgc3dpdGNoLg0KPiANCj4gTm93LCBJIGZhY2Ug
dGhlIHNhbWUgaXNzdWUgd2l0aCBpbml0X29uX2ZyZWUvaW5pdF9vbl9hbGxvYyAobm90IHN1
cmUNCj4gd2hpY2ggb25lIGFwcGxpZXMgaGVyZSwgcHJvYmFibHkgdGhlIGxhdHRlciBvbmUp
LCB3aGljaCBzZXZlcmFsDQo+IGRpc3RyaWJ1dGlvbnMgZW5hYmxlIGJ5IGRlZmF1bHQuIFRo
ZSByZXN1bHQgaXMgKHNlZSB0aW1lc3RhbXBzKToNCj4gDQo+ICAgICAgWzIwMjYtMDItMjQg
MDE6MTI6NTVdIFsgICAgNy40ODUxNTFdIHhlbjpiYWxsb29uOiBXYWl0aW5nIGZvciBpbml0
aWFsIGJhbGxvb25pbmcgZG93biBoYXZpbmcgZmluaXNoZWQuDQo+ICAgICAgWzIwMjYtMDIt
MjQgMDE6MTQ6MTRdIFsgICA4Ni41ODE1MTBdIHhlbjpiYWxsb29uOiBJbml0aWFsIGJhbGxv
b25pbmcgZG93biBmaW5pc2hlZC4NCj4gDQo+IEJ1dCBoZXJlIHRoZSBzaXR1YXRpb24gaXMg
YSBiaXQgbW9yZSBjb21wbGljYXRlZDoNCj4gaW5pdF9vbl9mcmVlL2luaXRfb25fYWxsb2Mg
YXBwbGllcyB0byBhbnkgcGFnZXMsIG5vdCBqdXN0IHRob3NlIGZvcg0KPiBiYWxsb29uIGRy
aXZlci4gSSBzZWUgdHdvIGFwcHJvYWNoZXMgdG8gc29sdmUgdGhlIGlzc3VlOg0KPiAxLiBT
aW1pbGFyIHRvIHhlbl9zY3J1Yl9wYWdlcz0sIGFkZCBhIHJ1bnRpbWUgc3dpdGNoIGZvcg0K
PiAgICAgaW5pdF9vbl9mcmVlL2luaXRfb25fYWxsb2MsIHRoZW4gZm9yY2UgdGhlbSBvZmYg
ZHVyaW5nIGJvb3QsIGFuZA0KPiAgICAgcmUtZW5hYmxlIGVhcmx5IGluIGluaXRyYW1mcy4N
Cj4gMi4gU29tZWhvdyBhZGp1c3QgYmFsbG9vbiBkcml2ZXIgdG8gYnlwYXNzIGluaXRfb25f
YWxsb2Mgd2hlbiBiYWxsb29uaW5nDQo+ICAgICBhIHBhZ2Ugb3V0Lg0KPiANCj4gVGhlIGZp
cnN0IGFwcHJvYWNoIGlzIGxpa2VseSBlYXNpZXIgdG8gaW1wbGVtZW50LCBidXQgYWxzbyBo
YXMgc29tZQ0KPiBkcmF3YmFja3M6IGl0IG1heSByZXN1bHQgaW4gc29tZSBrZXJuZWwgc3Ry
dWN0dXJlcyB0aGF0IGFyZSBhbGxvY2F0ZWQNCj4gZWFybHkgdG8gcmVtYWluIHdpdGggZ2Fy
YmFnZSBkYXRhIGluIHVuaW5pdGlhbGl6ZWQgcGxhY2VzLiBXaGlsZSBpdCBtYXkNCj4gbm90
IG1hdHRlciBkdXJpbmcgZWFybHkgYm9vdCwgc3VjaCBzdHJ1Y3R1cmVzIG1heSBzdXJ2aXZl
IGZvciBxdWl0ZSBzb21lDQo+IHRpbWUsIGFuZCBtYXliZSBhdHRhY2tlciBjYW4gdXNlIHRo
ZW0gbGF0ZXIgb24gdG8gZXhwbG9pdCBzb21lIG90aGVyDQo+IGJ1Zy4gVGhpcyB3YXNuJ3Qg
cmVhbGx5IGEgY29uY2VybiB3aXRoIHhlbl9zY3J1Yl9wYWdlcywgYXMgdGhvc2UgcGFnZXMN
Cj4gd2VyZSBpbW1lZGlhdGVseSBiYWxsb29uZWQgb3V0Lg0KPiANCj4gVGhlIHNlY29uZCBh
cHByb2FjaCBzb3VuZHMgYXJjaGl0ZWN0dXJhbGx5IGJldHRlciwgYW5kIG1heWJlDQo+IGlu
aXRfb25fYWxsb2MgY291bGQgYmUgYWx3YXlzIGJ5cGFzc2VkIGR1cmluZyBiYWxsb29uIG91
dD8gVGhlIGJhbGxvb24NCj4gZHJpdmVyIGNhbiBzY3J1YiB0aGUgcGFnZSBvbiBpdHMgb3du
IGFscmVhZHkgKHdoaWNoIGlzIGVuYWJsZWQgYnkNCj4gZGVmYXVsdCkuIFRoYXQgb2YgY291
cnNlIGFzc3VtZXMgdGhlIGlzc3VlIGlzIG9ubHkgYWJvdXQgaW5pdF9vbl9hbGxvYywNCj4g
bm90IGluaXRfb25fZnJlZSAob3IgYm90aCkgLSB3aGljaCBJIGhhdmVuJ3QgcmVhbGx5IGNv
bmZpcm1lZCB5ZXQuLi4NCj4gSWYgZ29pbmcgdGhpcyB3YXksIEkgc2VlIHRoZSBiYWxsb29u
IGRyaXZlciBkb2VzIGJhc2ljYWxseQ0KPiBhbGxvY19wYWdlKEdGUF9CQUxMT09OKSwgd2hl
cmUgR0ZQX0JBTExPT04gaXM6DQo+IA0KPiAgICAgIC8qIFdoZW4gYmFsbG9vbmluZyBvdXQg
KGFsbG9jYXRpbmcgbWVtb3J5IHRvIHJldHVybiB0byBYZW4pIHdlIGRvbid0IHJlYWxseQ0K
PiAgICAgICAgIHdhbnQgdGhlIGtlcm5lbCB0byB0cnkgdG9vIGhhcmQgc2luY2UgdGhhdCBj
YW4gdHJpZ2dlciB0aGUgb29tIGtpbGxlci4gKi8NCj4gICAgICAjZGVmaW5lIEdGUF9CQUxM
T09OIFwNCj4gICAgICAgICAgKEdGUF9ISUdIVVNFUiB8IF9fR0ZQX05PV0FSTiB8IF9fR0ZQ
X05PUkVUUlkgfCBfX0dGUF9OT01FTUFMTE9DKQ0KPiANCj4gV291bGQgdGhhdCBiZSBhYm91
dCBhZGRpbmcgc29tZSBuZXcgZmxhZyBoZXJlPyBPciBtYXliZSB0aGVyZSBpcyBhbHJlYWR5
DQo+IG9uZSBmb3IgdGhpcyBwdXJwb3NlPw0KDQpUaGVyZSBkb2Vzbid0IHNlZW0gdG8gYmUg
YSBmbGFnIGZvciB0aGF0Lg0KDQpCdXQgSSB0aGluayBhZGRpbmcgYSBuZXcgZmxhZyBfX0dG
UF9OT19JTklUIGFuZCB0ZXN0aW5nIHRoYXQgaW4NCndhbnRfaW5pdF9vbl9hbGxvYygpIF9i
ZWZvcmVfIGNoZWNraW5nIENPTkZJR19JTklUX09OX0FMTE9DX0RFRkFVTFRfT04NCndvdWxk
IGJlIGEgc2Vuc2libGUgYXBwcm9hY2guDQoNCj4gQW55IG9waW5pb25zPw0KDQpZb3UgYXJl
IGF3YXJlIG9mIHRoZSAiaW5pdF9vbl9hbGxvYyIgYm9vdCBwYXJhbWV0ZXI/IFNvIGlmIHRo
aXMgaXMgZmluZQ0KZm9yIHlvdSwgeW91IGNvdWxkIGp1c3QgdXNlIGFwcHJvYWNoIDEgYWJv
dmUgd2l0aG91dCBhbnkga2VybmVsIHBhdGNoZXMNCm5lZWRlZC4NCg0KDQpKdWVyZ2VuDQo=

--------------VJ240JE505tAHMm1IzpxKJeu
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------VJ240JE505tAHMm1IzpxKJeu--

--------------K1a5M0y8ZSsiDXJ2z5xwGIzT--

--------------qOpJCOcuQxIXdDyr1Z4W58Du
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmmlL/YFAwAAAAAACgkQsN6d1ii/Ey81
qQf+PTMsI7Hq7JSUHhpmr/vwbm8btfqjtmwua2OO13bo7WqKkmuLDhXULaUgxZK+XYeFSKD+AcDM
COd+7jWlsXc2qAIZVI5G/T2eKS0ffRDeAogYTHIa4DtCkiNophXREE/vzVq1/BP+66StkE9FBC9U
JL0T/rjZtlsIgR1VmoGwp3BaRDnw/7/nNeth/LO1v42SrYZZqgusREzUpnrdS8qHM/84aAPc4cmI
Qe7KY0q50wjAufDu5UyolUsnIarLDtg6OExXUpMPGyyg8fLV8bXmHueaDgyomGwpz86PE2THkXDM
ldb/CetwNror1xjYQdVWQBc5zQGcKBqvcNFjqUyVyQ==
=4j19
-----END PGP SIGNATURE-----

--------------qOpJCOcuQxIXdDyr1Z4W58Du--

