Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLEuF2lC6mm1xQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 18:01:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E314549C3
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 18:01:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1292366.1570836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFwUW-0005Gh-M1; Thu, 23 Apr 2026 16:01:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1292366.1570836; Thu, 23 Apr 2026 16:01:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFwUW-0005Dm-JJ; Thu, 23 Apr 2026 16:01:24 +0000
Received: by outflank-mailman (input) for mailman id 1292366;
 Thu, 23 Apr 2026 16:01:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wFwUV-0005De-9S
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 16:01:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFwUU-004ruX-Lb
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 18:01:22 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 69ea4248-2eae-0a2a0a5409dd-0a2a450ba496-42
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 18:01:22 +0200
Received: from [209.85.208.49] (helo=mail-ed1-f49.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 69ea4252-212f-0a2a450b0019-d155d031cc9e-3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 18:01:22 +0200
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-678a1642a81so249340a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 09:01:22 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-672c480e21fsm4182272a12.8.2026.04.23.09.01.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Apr 2026 09:01:21 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776960082; x=1777564882; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yJCT8nk48ir51dkw5nhzsqXmaeGMaN+VpQRMB4O4IZI=;
        b=MMN8gWenuII2LTGaLHjAYR22zynEwfytZ+5MTD+0su2LFjCWI8Swh2OTuPuzXT7HVo
         r+MQ6sbP1JHOSRSqSy1Sg++lXBKxfb4mBdfa/avsQrBGRzVVvGTJCeSImeXQfsdVwOTY
         Hlxo0ebFDntT9JCNI1eIYUHZnEDjJ2d7bv6eVvEIAT88wu+rp6HHOf9bYFs8dP6K8Gc3
         CDV8XBJje92MOBZ54lJE4dSS0QhtSQhDA178mj3vR7SibilnFnTBimxDzjWzsXpxtkP7
         +zZ/eUkoMvLvgokYDmJCcDiLjT2K51kkELToekad96EPIZeIiHkqcFQWXCtO7XMDSS11
         LdBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776960082; x=1777564882;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yJCT8nk48ir51dkw5nhzsqXmaeGMaN+VpQRMB4O4IZI=;
        b=JHmuNDlf1Ikz7zoXMA0DCFggyNwTg67k/KbB1d+RI4dHsYBeiLrKoqFBPhAMZ3TkFP
         T2oySwZPDCDcyv0cSIzTvVJOpn8kScZjcMSRa7iu0T2qQOCWiCMeaExoVqp2Ef/EMPq5
         6i/eXGv4W8o9zM0+unSQIB4tsUR5Wqiwhv5y2px0KTNxRR8BzaHw2LC4UF6Lj+VkCf4s
         96v6PQenFHk3htxteasbHqoWY5nZtr/xg+xw7OzHzNj1v68Jl+Tm/NW/BGfMOe8WjWha
         1ZlwILflvcCTm7J4uGFmMAwzUtHkuN6bq63OTajeVW29MQRradaAcT0w1VcnMqQLuGCd
         7F7Q==
X-Forwarded-Encrypted: i=1; AFNElJ+MNttgl1DVa4uMwT6092Y4wp8JQ12T+8ij7LdpKjn11ymUMxgzx5F1Id6C7ueweNDhLki9r8a1ygc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzpPiGyqg5afJ2tyHC/NeHqRMfkiTZNqvJBCMbELY1JByg//4qC
	1UjXFKGrnStf4PvN+i/CWtN18hyTQ0p20tHG0wMWxVm1//Rrxgx8CrdQZhN4dKNMD/s=
X-Gm-Gg: AeBDiesgTSb0EYdQQ6OTrcBenfk6jMwrEk0qpo34/MyYSJYL7NNJDBrD2Gxk2L1p5ox
	s3brNvBcbHXmhjnn/uYbol8R67rI4Pcd33xrE4ZajUmkUBMON5DlPg+oBr9qg+ArvI7BLQNrPse
	TStdiw6lKqq8i0lKTXs/hyjNcvE4DnhO0q5zIpZtLdoYUSdMKo20fRUXpwkeJgZ47RnaaNDml0L
	FRWsORyqEjNfNQTNkne0iu7A7f4c0bVf0zsHV4R6BMBVMK4RIgu2PwXH/vYF8hZz7cNO5mYEyIP
	xOson5IQWzY1GQZi9zsEGf2s4i7bnv3Ymcv4o0vxhmOtfioYHwe7Cwoa4U2gFdqUJGBVVttORW5
	Uhmr0Y2YsmAAJ+N+7bcFqCVf4XFA0611o1NkQrUGC1t66ohzRqr6ZamcdovwvPojIphUnkdA8eS
	kxxUsJxyTjg3wNkyqgEupED4X4qlM5jOJafRTTomL5HcGLNZp/losJfE7zMlk/FUSRVskECe+Wc
	IQZb/5lXs6dCMlXXmTBRYdh6sDqadlxry9I9MA/c+V3I0FWmtKjTUbBbU12fumF
X-Received: by 2002:a05:6402:13d1:b0:673:b712:d414 with SMTP id 4fb4d7f45d1cf-673b712d4b0mr11918040a12.10.1776960081713;
        Thu, 23 Apr 2026 09:01:21 -0700 (PDT)
Message-ID: <b1b59238-9530-4d7e-8c1d-032700337503@suse.com>
Date: Thu, 23 Apr 2026 18:01:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] x86/cpuid: fix unbootable VMs by really inlining
 memcmp() in hypervisor_cpuid_base()
To: Mauricio Faria de Oliveira <mfo@igalia.com>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Alexey Dobriyan <adobriyan@gmail.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20260422-pvh-kasan-inline-v1-0-7e6194344c92@igalia.com>
 <20260422-pvh-kasan-inline-v1-2-7e6194344c92@igalia.com>
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
In-Reply-To: <20260422-pvh-kasan-inline-v1-2-7e6194344c92@igalia.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ic78VdLEcBJ5ydvhV0E0ZuV9"
X-purgate-ID: tlsNG-42698a/1776960082-24AB5F3B-DC605153/0/0
X-purgate-type: clean
X-purgate-size: 7309
X-Spamd-Result: default: False [-1.53 / 15.00];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	R_MIXED_CHARSET(0.56)[subject];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,suse.com:dkim,suse.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mfo@igalia.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:adobriyan@gmail.com,m:boris.ostrovsky@oracle.com,m:kernel-dev@igalia.com,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	RSPAMD_URIBL_FAIL(0.00)[suse.com:query timed out];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[igalia.com,kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,gmail.com,oracle.com];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	HAS_ATTACHMENT(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MAILSPIKE_FAIL(0.00)[192.237.175.120:query timed out];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 15E314549C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ic78VdLEcBJ5ydvhV0E0ZuV9
Content-Type: multipart/mixed; boundary="------------oUcxIFxMLsDxx0Ywcue6L02I";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Mauricio Faria de Oliveira <mfo@igalia.com>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Alexey Dobriyan <adobriyan@gmail.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
Message-ID: <b1b59238-9530-4d7e-8c1d-032700337503@suse.com>
Subject: Re: [PATCH 2/3] x86/cpuid: fix unbootable VMs by really inlining
 memcmp() in hypervisor_cpuid_base()
References: <20260422-pvh-kasan-inline-v1-0-7e6194344c92@igalia.com>
 <20260422-pvh-kasan-inline-v1-2-7e6194344c92@igalia.com>
In-Reply-To: <20260422-pvh-kasan-inline-v1-2-7e6194344c92@igalia.com>

--------------oUcxIFxMLsDxx0Ywcue6L02I
Content-Type: multipart/mixed; boundary="------------c4u0C8tAi4Irszf1o7RDgbLt"

--------------c4u0C8tAi4Irszf1o7RDgbLt
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjIuMDQuMjYgMjI6MDcsIE1hdXJpY2lvIEZhcmlhIGRlIE9saXZlaXJhIHdyb3RlOg0K
PiBFdmVuIHdpdGggX19idWlsdGluIHRoZSBjb21waWxlciBtYXkgZGVjaWRlIHRvIHVzZSB0
aGUgb3V0IG9mIGxpbmUgZnVuY3Rpb24NCj4gaW5zdGVhZCBvZiB0aGUgaW5saW5lIGltcGxl
bWVudGF0aW9uLg0KPiANCj4gVGhlIGV4aXN0aW5nIGNvZGUgaXMgYnJva2VuIHdpdGggZ2Nj
LTE0LzE1IGJ1dCBub3QgZ2NjLTEyLzEzIChVYnVudHUgMjUuMTApDQo+IGFuZCB2bWxpbnV4
IG5vIGxvbmdlciBib290cyB3aXRoIENPTkZJR19QVkggaWYgQ09ORklHX0tBU0FOX0dFTkVS
SUMgaXMgc2V0Lg0KPiANCj4gRm9yIHRlc3RpbmcgcHVycG9zZXMsIGlmIHRoZSBzaXplIGFy
Z3VtZW50IGlzIHJlZHVjZWQgZnJvbSAxMiB0byA4IHRoZW4gdGhlDQo+IGNvbXBpbGVyIGRl
Y2lkZXMgdG8gdXNlIHRoZSBpbmxpbmUgaW1wbGVtZW50YXRpb247IHRoYXQgc2hvd3MgcmVz
dWx0cyB2YXJ5Lg0KPiANCj4gU3dpdGNoIHRoZSBidWlsdGluIHRvIHRoZSBpbmxpbmUgaW1w
bGVtZW50YXRpb24gdG8gYWRkcmVzcyBpdC4NCj4gDQo+IEZpeGVzOiA0MTZhMzNjOWFmY2Ug
KCJ4ODYvY3B1OiBmaXggdW5ib290YWJsZSBWTXMgYnkgaW5saW5pbmcgbWVtY21wKCkgaW4g
aHlwZXJ2aXNvcl9jcHVpZF9iYXNlKCkiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBNYXVyaWNpbyBG
YXJpYSBkZSBPbGl2ZWlyYSA8bWZvQGlnYWxpYS5jb20+DQoNClJldmlld2VkLWJ5OiBKdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQoNCg0KSnVlcmdlbg0K
--------------c4u0C8tAi4Irszf1o7RDgbLt
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------c4u0C8tAi4Irszf1o7RDgbLt--

--------------oUcxIFxMLsDxx0Ywcue6L02I--

--------------ic78VdLEcBJ5ydvhV0E0ZuV9
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmnqQlAFAwAAAAAACgkQsN6d1ii/Ey8R
gwgAgXMkjfFG+GbEYhMWBm4Tnxw3bBWf+sgWNu2MsH8fn+plM659Mn7v1ZeWqF10H27KHuICd7E4
yQci3HQnZELnh4FxT0+GDCAck6EiBY7w1vpdJRqwIFv8fNFSGAUBGMfTHvsx7b1UowKNm/OATLTb
7E6uexZbmIE/wewKtUknvmEMRHO5tn6vgBHX9zFJMoJ+9KEFIs0LCl8YSxzFVCljs/aZvyKQJKHZ
PNlxZ54NuXW7BTAcb4Fa748Sz7B16DrX5X6Tv5OA5hHN3ItgmM66dga10L75ODP9SnyLFCYW3kC8
TtyuZc8fIalMEVtI+DyY5C38gfo3glIk4khnNDwSGQ==
=UrVd
-----END PGP SIGNATURE-----

--------------ic78VdLEcBJ5ydvhV0E0ZuV9--

