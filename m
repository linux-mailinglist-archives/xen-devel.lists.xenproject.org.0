Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YIu/CTgTd2lWbwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 08:09:44 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EA084AF4
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 08:09:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1213308.1523797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkGiA-0003tF-Bl; Mon, 26 Jan 2026 07:08:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1213308.1523797; Mon, 26 Jan 2026 07:08:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkGiA-0003qU-8K; Mon, 26 Jan 2026 07:08:34 +0000
Received: by outflank-mailman (input) for mailman id 1213308;
 Mon, 26 Jan 2026 07:08:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yaw/=77=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vkGi8-0003qO-Th
 for xen-devel@lists.xenproject.org; Mon, 26 Jan 2026 07:08:33 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1cab869-fa85-11f0-b15f-2bf370ae4941;
 Mon, 26 Jan 2026 08:08:30 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-b8863db032dso430723866b.0
 for <xen-devel@lists.xenproject.org>; Sun, 25 Jan 2026 23:08:30 -0800 (PST)
Received: from ?IPV6:2a00:12d0:af5b:2f01:4042:c03:ce4d:a5a1?
 (2a00-12d0-af5b-2f01-4042-c03-ce4d-a5a1.ip.tng.de.
 [2a00:12d0:af5b:2f01:4042:c03:ce4d:a5a1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b885b41801dsm602561966b.23.2026.01.25.23.08.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jan 2026 23:08:29 -0800 (PST)
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
X-Inumbo-ID: d1cab869-fa85-11f0-b15f-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769411310; x=1770016110; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:content-language:references:cc:to:from
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1cvBUL8mJ67LCy7rZqUyBxqcZLcMww9qmMfpv+ERFlA=;
        b=CqCQ/pTA15FO6fQF12YLca3K/Y+966+bN5P7sAOWDOwaip/NDjuAj4o1Uyj4u9FnyR
         cBNrfbNphIbkW/W+xn2/UyX0VIIm4S7OBkOyv+O8xrgKPtyXYDJSiEd9PysFDHeL/Sfb
         KyclRMZpgDAcHEXspD/iW6q0YC/IVo8SLRree3VmACRU7n94J8Zzg8eO2meTIxMGrN6q
         PiJpaYtn4HKjAO16qaHHUyoIbAawonhJXLxa0Hk7+rGcjfK4V8srHOIdBs8xJWTvBwn8
         GaLfOQ9O7mHNesI7bDVXCVfZnx3fcM85s6KFWa9dySLgAeYPYfiC+U+mN8+I6zAsqP00
         6oig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769411310; x=1770016110;
        h=in-reply-to:autocrypt:content-language:references:cc:to:from
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1cvBUL8mJ67LCy7rZqUyBxqcZLcMww9qmMfpv+ERFlA=;
        b=EPFbLgrg2kuoWdUBrwG0bqMDvf2+hGuy0l8v6LKrUiePwfWGk91IBmT/yqC9vW8UaP
         u4eGOJVUdct1jDGJOGa+UuzFSgYOJQmjO+wIg0dDV4qCEcNLENFHxu2uWsBrX5+V5IiR
         AtP9cmJaIgovv065s8eBThQvfZ1PIAeQqi1HSmi7Opi/1lK8AYQSbQz0gw1rp5mTm4fT
         9j7D2oocWNKcHEAKCcnbvOpeeY3KrVKEdOFGq+aRo+MryKTSRfXQmmEq9REinuGlObPH
         ADuXFcKvljZUo0wUaHGc0RtDbomafQd0jVMAyR+yMtxp488jGo46LNjJRlLsL1I6OCYY
         edNw==
X-Forwarded-Encrypted: i=1; AJvYcCV98ac5Okw14xt2pYjfAj+FlJEEJdsRaLgRHgYCm6tu/sxQuhNVWrKFDCpvK7638ZoXiAUwzwZ+UMI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw+H/0drLlzLrEhbTNb5hSFqhSv66sVLO0dBEMtN5tvg2tdqK0c
	8YppwTkWSDFCgKcmq7V1f0RrsPtBspxyBy6vw1ypBli77KDzk805HGKXTQfsxYK+qsc=
X-Gm-Gg: AZuq6aKj5SO6U40EF5eT7E6BBoklTg/hEcq8Qiy+WQHcemeQfmd9Iajs99ONHeOH7oK
	VufXdUa9zQW5ukOw3TuENaS7qSUYINemWnvN/fmwdYi7OqS3KCAcJgl/MgvLiT1H2kkBGLuIgHr
	NmYDcIUPQbdzVDorGo+YDkRJ0ZAWntp/TzTr8WgXeNix7fx9uCK2dICHASsHCEiAKrsjKvdwvha
	H82E/TV2tdnoQO/ffcP5OGpEKAfwBvb3gfhHl9uLx3N+eqvhcerP9oIisc1wHx9vzg2Q6aH5hWv
	MxChoVoJ2zou6EeffHE8an/QJCGh8fo4l/JmOHZiCHI87UCLHU7WehLQwDUwgzqdIpeMXQfVJuv
	4qlz201ZvvE1jGEGltoBmobAiwEgpHMey35PMjh1kSSThT8vm3EVnKJEy430Mgi4rPapZvXh5BH
	INiOrR0SGrhXTEsa3P1eEexlemD7fvG+itY6hBDPv1NpYBqrFH91c1sqqbpAupRWTHpPQN4hsb7
	3x2wZcZgBoMpkpa0dFCL8h8Uwfc8L/IlSpDuw==
X-Received: by 2002:a17:907:86a6:b0:b88:6e10:62c8 with SMTP id a640c23a62f3a-b8d2e8fe361mr238762466b.2.1769411309970;
        Sun, 25 Jan 2026 23:08:29 -0800 (PST)
Message-ID: <261c3ced-7f40-4c2f-93da-0e020f9bcf3a@suse.com>
Date: Mon, 26 Jan 2026 08:08:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/xenbus: better handle backend crash
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, linux-kernel@vger.kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Peng Jiang <jiang.peng9@zte.com.cn>, Qiu-ji Chen <chenqiuji666@gmail.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 "moderated list:XEN HYPERVISOR INTERFACE" <xen-devel@lists.xenproject.org>
References: <20251102032105.772670-1-marmarek@invisiblethingslab.com>
 <e6ab32d7-b1eb-428b-95e8-a90f7b3be39c@suse.com>
Content-Language: en-US
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
In-Reply-To: <e6ab32d7-b1eb-428b-95e8-a90f7b3be39c@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------BaSJAF3NX8vc2gE09eXeuGtj"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.18 / 15.00];
	SIGNED_PGP(-2.00)[];
	R_MIXED_CHARSET(0.91)[subject];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:linux-kernel@vger.kernel.org,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:jiang.peng9@zte.com.cn,m:chenqiuji666@gmail.com,m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,invisiblethingslab.com:email];
	FREEMAIL_CC(0.00)[kernel.org,epam.com,zte.com.cn,gmail.com,amd.com,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 78EA084AF4
X-Rspamd-Action: no action

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------BaSJAF3NX8vc2gE09eXeuGtj
Content-Type: multipart/mixed; boundary="------------zOdtnu6ITJ05QRU7ZV5wJ0LU";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, linux-kernel@vger.kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Peng Jiang <jiang.peng9@zte.com.cn>, Qiu-ji Chen <chenqiuji666@gmail.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 "moderated list:XEN HYPERVISOR INTERFACE" <xen-devel@lists.xenproject.org>
Message-ID: <261c3ced-7f40-4c2f-93da-0e020f9bcf3a@suse.com>
Subject: Re: [PATCH] xen/xenbus: better handle backend crash
References: <20251102032105.772670-1-marmarek@invisiblethingslab.com>
 <e6ab32d7-b1eb-428b-95e8-a90f7b3be39c@suse.com>
In-Reply-To: <e6ab32d7-b1eb-428b-95e8-a90f7b3be39c@suse.com>

--------------zOdtnu6ITJ05QRU7ZV5wJ0LU
Content-Type: multipart/mixed; boundary="------------b0M8FBGxmcq9wW7ymi9a03dK"

--------------b0M8FBGxmcq9wW7ymi9a03dK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTcuMTEuMjUgMTI6MDYsIErDvHJnZW4gR3Jvw58gd3JvdGU6DQo+IE9uIDAyLjExLjI1
IDA0OjIwLCBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgd3JvdGU6DQo+PiBXaGVuIHRo
ZSBiYWNrZW5kIGRvbWFpbiBjcmFzaGVzLCBjb29yZGluYXRlZCBkZXZpY2UgY2xlYW51cCBp
cyBub3QNCj4+IHBvc3NpYmxlIChhcyBpdCBpbnZvbHZlcyB3YWl0aW5nIGZvciB0aGUgYmFj
a2VuZCBzdGF0ZSBjaGFuZ2UpLiBJbiB0aGF0DQo+PiBjYXNlLCB0b29sc3RhY2sgZm9yY2Vm
dWxseSByZW1vdmVzIGZyb250ZW5kIHhlbnN0b3JlIGVudHJpZXMuDQo+PiB4ZW5idXNfZGV2
X2NoYW5nZWQoKSBoYW5kbGVzIHRoaXMgY2FzZSwgYW5kIHRyaWdnZXJzIGRldmljZSBjbGVh
bnVwLg0KPj4gSXQncyBwb3NzaWJsZSB0aGF0IHRvb2xzdGFjayBtYW5hZ2VzIHRvIGNvbm5l
Y3QgbmV3IGRldmljZSBpbiB0aGF0DQo+PiBwbGFjZSwgYmVmb3JlIHhlbmJ1c19kZXZfY2hh
bmdlZCgpIG5vdGljZXMgdGhlIG9sZCBvbmUgaXMgbWlzc2luZy4gSWYNCj4+IHRoYXQgaGFw
cGVucywgbmV3IG9uZSB3b24ndCBiZSBwcm9iZWQgYW5kIHdpbGwgZm9yZXZlciByZW1haW4g
aW4NCj4+IFhlbmJ1c1N0YXRlSW5pdGlhbGlzaW5nLg0KPj4NCj4+IEZpeCB0aGlzIGJ5IGNo
ZWNraW5nIGJhY2tlbmQtaWQgYW5kIGlmIGl0IGNoYW5nZXMsIGNvbnNpZGVyIGl0DQo+PiB1
bnBsdWcrcGx1ZyBvcGVyYXRpb24uIEl0J3MgaW1wb3J0YW50IHRoYXQgY2xlYW51cCBvbiBz
dWNoIHVucGx1Zw0KPj4gZG9lc24ndCBtb2RpZnkgeGVuc3RvcmUgZW50cmllcyAoZXNwZWNp
YWxseSB0aGUgInN0YXRlIiBrZXkpIGFzIGl0DQo+PiBiZWxvbmcgdG8gdGhlIG5ldyBkZXZp
Y2UgdG8gYmUgcHJvYmVkIC0gY2hhbmdpbmcgaXQgd291bGQgZGVyYWlsDQo+PiBlc3RhYmxp
c2hpbmcgY29ubmVjdGlvbiB0byB0aGUgbmV3IGJhY2tlbmQgKG1vc3QgbGlrZWx5LCBjbG9z
aW5nIHRoZQ0KPj4gZGV2aWNlIGJlZm9yZSBpdCB3YXMgZXZlbiBjb25uZWN0ZWQpLiBIYW5k
bGUgdGhpcyBjYXNlIGJ5IHNldHRpbmcgbmV3DQo+PiB4ZW5idXNfZGV2aWNlLT52YW5pc2hl
ZCBmbGFnIHRvIHRydWUsIGFuZCBjaGVjayBpdCBiZWZvcmUgY2hhbmdpbmcgc3RhdGUNCj4+
IGVudHJ5Lg0KPj4NCj4+IEFuZCBldmVuIGlmIHhlbmJ1c19kZXZfY2hhbmdlZCgpIGNvcnJl
Y3RseSBkZXRlY3RzIHRoZSBkZXZpY2Ugd2FzDQo+PiBmb3JjZWZ1bGx5IHJlbW92ZWQsIHRo
ZSBjbGVhbnVwIGhhbmRsaW5nIGlzIHN0aWxsIHJhY3kuIFNpbmNlIHRoaXMgd2hvbGUNCj4+
IGhhbmRsaW5nIGRvZXNuJ3QgaGFwcGVuZCBpbiBhIHNpbmdsZSB4ZW5zdG9yZSB0cmFuc2Fj
dGlvbiwgaXQncyBwb3NzaWJsZQ0KPj4gdGhhdCB0b29sc3RhY2sgbWlnaHQgcHV0IGEgbmV3
IGRldmljZSB0aGVyZSBhbHJlYWR5LiBBdm9pZCByZS1jcmVhdGluZw0KPj4gdGhlIHN0YXRl
IGtleSAod2hpY2ggaW4gdGhlIGNhc2Ugb2YgbG9vc2luZyB0aGUgcmFjZSB3b3VsZCBhY3R1
YWxseQ0KPj4gY2xvc2UgbmV3bHkgYXR0YWNoZWQgZGV2aWNlKS4NCj4+DQo+PiBUaGUgcHJv
YmxlbSBkb2VzIG5vdCBhcHBseSB0byBmcm9udGVuZCBkb21haW4gY3Jhc2gsIGFzIHRoaXMg
Y2FzZQ0KPj4gaW52b2x2ZXMgY29vcmRpbmF0ZWQgY2xlYW51cC4NCj4+DQo+PiBQcm9ibGVt
IG9yaWdpbmFsbHkgcmVwb3J0ZWQgYXQNCj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3hl
bi1kZXZlbC9hT1p2aXZ5WjlZaFZXRExOQG1haWwtaXRsL1QvI3QsDQo+PiBpbmNsdWRpbmcg
cmVwcm9kdWN0aW9uIHN0ZXBzLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IE1hcmVrIE1hcmN6
eWtvd3NraS1Hw7NyZWNraSA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNvbT4NCj4g
DQo+IFNvcnJ5IEkgZGlkbid0IGdldCBlYXJsaWVyIHRvIHRoaXMuDQo+IA0KPiBNeSBtYWlu
IHByb2JsZW0gd2l0aCB0aGlzIHBhdGNoIGlzIHRoYXQgaXQgaXMgYmFzaWNhbGx5IGp1c3Qg
cGFwZXJpbmcgb3Zlcg0KPiBhIG1vcmUgZ2VuZXJhbCBwcm9ibGVtLg0KPiANCj4gWW91IGFy
ZSBqdXN0IG1ha2luZyB0aGUgcHJvYmxlbSBtdWNoIG1vcmUgaW1wcm9iYWJsZSwgYnV0IG5v
dCBpbXBvc3NpYmxlIHRvDQo+IG9jY3VyIGFnYWluLiBJbiBjYXNlIHRoZSBuZXcgZHJpdmVy
IGRvbWFpbiBoYXMgdGhlIHNhbWUgZG9taWQgYXMgdGhlIG9sZCBvbmUNCj4geW91IGNhbiBz
dGlsbCBoYXZlIHRoZSBzYW1lIHJhY2UuDQo+IA0KPiBUaGUgY2xlYW4gd2F5IHRvIGhhbmRs
ZSB0aGF0IHdvdWxkIGJlIHRvIGFkZCBhIHVuaXF1ZSBJZCBpbiBYZW5zdG9yZSB0byBlYWNo
DQo+IGRldmljZSBvbiB0aGUgYmFja2VuZCBzaWRlLCB3aGljaCBjYW4gYmUgdGVzdGVkIG9u
IHRoZSBmcm9udGVuZCBzaWRlIHRvDQo+IG1hdGNoLiBJbiBjYXNlIGl0IGRvZXNuJ3QgbWF0
Y2gsIGFuIG9sZCBkZXZpY2Ugd2l0aCB0aGUgc2FtZSBraW5kIGFuZCBkZXZpZA0KPiBjYW4g
YmUgY2xlYW5lZCB1cC4NCj4gDQo+IFRoZSB1bmlxdWUgSWQgd291bGQgb2J2aW91c2x5IG5l
ZWQgdG8gYmUgc2V0IGJ5IHRoZSBYZW4gdG9vbHMgaW5zaWRlIHRoZQ0KPiB0cmFuc2FjdGlv
biB3cml0aW5nIHRoZSBpbml0aWFsIGJhY2tlbmQgWGVuc3RvcmUgbm9kZXMsIGFzIGRvaW5n
IHRoYXQgZnJvbQ0KPiB0aGUgYmFja2VuZCB3b3VsZCBhZGQgYW5vdGhlciBwb3RlbnRpYWwg
YW1iaWd1aXR5IGJ5IHRoZSBkcml2ZXIgZG9tYWluDQo+IGNob29zaW5nIHRoZSBzYW1lIHVu
aXF1ZSBpZCBhcyB0aGUgcHJldmlvdXMgb25lIGRpZC4NCj4gDQo+IFRoZSBxdWVzdGlvbiBp
cyB3aGV0aGVyIHNvbWV0aGluZyBsaWtlIHlvdXIgcGF0Y2ggc2hvdWxkIGJlIHVzZWQgYXMg
YQ0KPiBmYWxsYmFjayBpbiBjYXNlIHRoZXJlIGlzIG5vIHVuaXF1ZSBJZCBvbiB0aGUgYmFj
a2VuZCBzaWRlIG9mIHRoZSBkZXZpY2UNCj4gZHVlIHRvIGEgdG9vIG9sZCBYZW4gdmVyc2lv
bi4NCg0KSSB0aGluayBJIGhhdmUgZm91bmQgYSBzb2x1dGlvbiB3aGljaCBpcyBtdWNoIG1v
cmUgc2ltcGxlLCBhcyBpdCBkb2Vzbid0DQpuZWVkIGFueSBjaGFuZ2Ugb2YgdGhlIHByb3Rv
Y29sIG9yIGFueSBhZGRpdGlvbiBvZiBuZXcgaWRlbnRpZmllcnMuDQoNCldoZW4gY3JlYXRp
bmcgYSBuZXcgUFYgZGV2aWNlLCBYZW4gdG9vbHMgd2lsbCBhbHdheXMgd3JpdGUgYWxsIGdl
bmVyaWMNCmZyb250ZW5kLSBhbmQgYmFja2VuZC1ub2Rlcy4gVGhpcyBpbmNsdWRlcyB0aGUg
ZnJvbnRlbmQgc3RhdGUsIHdoaWNoIGlzDQppbml0aWFsaXplZCBhcyBYZW5idXNTdGF0ZUlu
aXRpYWxpc2luZy4NCg0KVGhlIExpbnV4IGtlcm5lbCdzIHhlbmJ1cyBkcml2ZXIgaXMgYWxy
ZWFkeSBzdG9yaW5nIHRoZSBsYXN0IGtub3duIHN0YXRlDQpvZiBhIHhlbmJ1cyBkZXZpY2Ug
aW4gc3RydWN0IHhlbmJ1c19kZXZpY2UuIFdoZW4gY2hhbmdpbmcgdGhlIHN0YXRlLCB0aGUN
CnhlbmJ1cyBkcml2ZXIgaXMgZXZlbiByZWFkaW5nIHRoZSBzdGF0ZSBmcm9tIFhlbnN0b3Jl
IChldmVuIGlmIG9ubHkgZm9yDQptYWtpbmcgc3VyZSB0aGUgcGF0aCBpcyBzdGlsbCBleGlz
dGluZykuIFNvIGFsbCB3aGF0IGlzIG5lZWRlZCBpcyB0byBjaGVjaywNCndoZXRoZXIgdGhl
IHJlYWQgY3VycmVudCBzdGF0ZSBpcyBtYXRjaGluZyB0aGUgbG9jYWxseSBzYXZlZCBzdGF0
ZS4gSWYgaXQNCmlzIG5vdCBtYXRjaGluZyBBTkQgdGhlIHJlYWQgc3RhdGUgaXMgWGVuYnVz
U3RhdGVJbml0aWFsaXNpbmcsIHlvdSBjYW4gYmUNCnN1cmUgdGhhdCB0aGUgYmFja2VuZCBo
YXMgYmVlbiByZXBsYWNlZC4NCg0KSGFuZGxpbmcgdGhpcyB3aWxsIG5lZWQgdG8gY2hlY2sg
dGhlIHJldHVybiB2YWx1ZSBvZiB4ZW5idXNfc3dpdGNoX3N0YXRlKCkNCmluIGFsbCByZWxh
dGVkIGRyaXZlcnMsIGJ1dCB0aGlzIGlzIGp1c3QgYSBtb3JlIG9yIGxlc3MgbWVjaGFuaWNh
bCBjaGFuZ2UuDQoNCkknbGwgcHJlcGFyZSBhIHBhdGNoIHNlcmllcyBmb3IgdGhhdC4NCg0K
DQpKdWVyZ2VuDQo=
--------------b0M8FBGxmcq9wW7ymi9a03dK
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------b0M8FBGxmcq9wW7ymi9a03dK--

--------------zOdtnu6ITJ05QRU7ZV5wJ0LU--

--------------BaSJAF3NX8vc2gE09eXeuGtj
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAml3Eu0FAwAAAAAACgkQsN6d1ii/Ey/u
IAf9FTyVT/+Kosby+4FY8mQX56pE9gwnUkqrzyJxeUlurtmxy8zE5EF1VgKeb8Mjng0fb2flVMv0
iyrdtITeDkxx8NWu6Ao3wXe9r/Hqt+bR+ZpHn313yR01fppWcKj0Wu25W2tWpBVKBg+9UMJpD229
VG/9pS572PuGJCOTEssFWnvzzrs91s1ZTwyKEa1OVRKnLK5RF2t9hQtUbHLmr/0wUHG1aIi+QFGz
zcOjzO8pJ+Bd94y1mt6D0kxdrRzqQFYbhh4Kupm7ZrixId5IEk1OTny7e1AcvivV3N8DVsBZCV5S
YMXIqSP/vjfDRt9lwj+EG8aUbAUfPVEyNRIK7kGCDw==
=jKVc
-----END PGP SIGNATURE-----

--------------BaSJAF3NX8vc2gE09eXeuGtj--

