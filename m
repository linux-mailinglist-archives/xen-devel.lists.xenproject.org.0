Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILB9IG0l8mnKoQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 17:36:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E20774970BE
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 17:36:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1297519.1573513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wI6wq-0003H7-Th; Wed, 29 Apr 2026 15:35:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1297519.1573513; Wed, 29 Apr 2026 15:35:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wI6wq-0003EY-Ql; Wed, 29 Apr 2026 15:35:36 +0000
Received: by outflank-mailman (input) for mailman id 1297519;
 Wed, 29 Apr 2026 15:35:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wI6wp-0003ES-6u
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 15:35:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wI6wo-009MDe-J5
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 17:35:34 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 69f2253e-e002-0a2a0a5209dd-0a2a45069ce4-20
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 17:35:34 +0200
Received: from [209.85.208.45] (helo=mail-ed1-f45.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 69f22546-7371-0a2a45060019-d155d02dd5d2-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 17:35:34 +0200
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-65c0891f4e9so21020107a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 08:35:34 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-67b220bb54csm886718a12.2.2026.04.29.08.35.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Apr 2026 08:35:33 -0700 (PDT)
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
        d=suse.com; s=google; t=1777476934; x=1778081734; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rhHfdQZE7ny9rQNg2FDMld30z0VMgFUh+gYPnSf3f88=;
        b=MHoEJ56eoIkiKwEuhPnZ9agjZYbrfvO4dbddPD3cjWB2DEAmtN1ZINVrLTUi7M81ym
         SzJEck7kyRIcXopqdIP4gaRBTfvZ0KSfvi9deiVfRKeTDSt3bnRxUY+21Txb62hNPZx6
         HiGmm6UlEo8LXmBNEAaIMKxI9ALzDMBpqf6CSIeNmIVJqXwbPTQyTFHTahVvUXMvQ/Fc
         00n1xSCsQSfYBieqdsP9EpSE9WuXpjlPKJLDSqYJy2eaXZ5bDKjVcKaJyYxd1g+MYGx2
         +l6+iRsAEVk/3QfJ/2Pd5CchxykHX35Bf2pg1GrbrFiQxOr7/b/T8UgdJW9p+W3EIIwj
         1YmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777476934; x=1778081734;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rhHfdQZE7ny9rQNg2FDMld30z0VMgFUh+gYPnSf3f88=;
        b=WlEym5vQWR934pANI6k7mSilRY9DXBuT4b+3e7F70t5KWy1GMQ+2MS/tc4WJ7G08gg
         BA3iIRCwCfcAD4BIKx2cnFkBZKaQ5+XLaYKvOXzIKt0S/+5tRTbSohzLFy0F/k4MdB0T
         K8Rbf7f8JKRJ4w/QYAcfxw/AzhTVPCbajRLdlsZKp3fZ+6HztuTZ1fA5n8oRdJlG24aK
         aOEBjwjkFhCPikzim3I2BW0MsBs4mTMEB+9cJafz4lHOVfR2y4cE3RiXKNcqzcD4gVHw
         CBZ6ZxLN/qz8ZyB62cKJ59apC6SoJZkvGiVidjWYr/QW/wahFo8maM0fzO64MbQSFinl
         LO4A==
X-Forwarded-Encrypted: i=1; AFNElJ/hnYpWx5VOBAaeRm9kwzOmT5VRMLYYpUeq0siS4kafbeKWmY007RbIRSdii5ij8rbW2mKJ3yLGSQo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxIbzWjGar8xCsRkThwqRJV6u7bQE4gJO3YbnL8bGpAxgUyKlBu
	FLA5NPlCoCCNXonx9z/sXhfCauuoQ8pSnp9fcnDORwcA7LONglA+WbBzOORQ8/VB5as=
X-Gm-Gg: AeBDieu67W2Bb5VsF4LAZ7C/eurOWT5/YoUOm1QtCEZsZADlRp3ZbzP5m5nkljM8XHq
	CHLVa3u++GjXHonPsx0+W09xcZaD4hB2R9ma9PVXJeU/k+WtULTFEPceZA58w+i/YoB43XokUYe
	IWS7UqEN0Xn4+2TOOI4uRVVHMH+cPJRF8+dFgOeEsxUYYO21e6nc0dAiUZxs1/W7NkPeAaBSgQ5
	RXYsHP/HbAv+mg1KnbFNervXRSMKJ3QRvfTQQFq1tORibuXjIIlj9uWgSmFnoZoaCelwgMMGii9
	WlP2iyXaxllNUvB1CDGp3evsDnzgqerXwYKIxEJc1KnMK47PrFujSghYwX0rhXaNJtWP/R6I8CJ
	NY+XGVsZH016nMR6jCz+JCfZaC1ZHx7ZjJaF1UwLQwZxceFDosohXww9YLbQIoksvw+oQrLwFrS
	IqqQrhGuLs3Mka99Jq6TbJNsuUQ488HeKVs0DEvD+TFoqePYKC1uPOTy5MIYNuj7kiUta0B4BoQ
	eu8tid/QjjkCiW8lh7QxPSknOmn5w0jPZdGTVkgelX6+of2GeqKsPCzZQSJK0w7
X-Received: by 2002:a05:6402:3897:b0:678:a507:e81e with SMTP id 4fb4d7f45d1cf-679bb0893fbmr4782609a12.22.1777476933708;
        Wed, 29 Apr 2026 08:35:33 -0700 (PDT)
Message-ID: <67632532-8421-4a10-a961-f7c4f05b177b@suse.com>
Date: Wed, 29 Apr 2026 17:35:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] virtio-mmio: add xenbus probing
To: Val Packett <val@invisiblethingslab.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Viresh Kumar <viresh.kumar@linaro.org>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux.dev
References: <20260429141339.74472-1-val@invisiblethingslab.com>
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
In-Reply-To: <20260429141339.74472-1-val@invisiblethingslab.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------g0UC1Ck4AStDbbtB0H4eW8y7"
X-purgate-ID: tlsNG-16d1c6/1777476934-CE168D75-4B82E3CD/0/0
X-purgate-type: clean
X-purgate-size: 18626
X-Rspamd-Queue-Id: E20774970BE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.18 / 15.00];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	R_MIXED_CHARSET(0.91)[subject];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	MAILLIST(-0.18)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:val@invisiblethingslab.com,m:mst@redhat.com,m:jasowang@redhat.com,m:xuanzhuo@linux.alibaba.com,m:eperezma@redhat.com,m:marmarek@invisiblethingslab.com,m:viresh.kumar@linaro.org,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,m:virtualization@lists.linux.dev,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid,invisiblethingslab.com:email];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	HAS_ATTACHMENT(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------g0UC1Ck4AStDbbtB0H4eW8y7
Content-Type: multipart/mixed; boundary="------------ue4BYSUfwU0oTBtHJ9in4V9z";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Val Packett <val@invisiblethingslab.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Viresh Kumar <viresh.kumar@linaro.org>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux.dev
Message-ID: <67632532-8421-4a10-a961-f7c4f05b177b@suse.com>
Subject: Re: [RFC PATCH] virtio-mmio: add xenbus probing
References: <20260429141339.74472-1-val@invisiblethingslab.com>
In-Reply-To: <20260429141339.74472-1-val@invisiblethingslab.com>

--------------ue4BYSUfwU0oTBtHJ9in4V9z
Content-Type: multipart/mixed; boundary="------------HCshP870xeA72w06G6OVMqA8"

--------------HCshP870xeA72w06G6OVMqA8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

U29tZSBtaW5vciBkZXRhaWxzIGZyb20gdGhlIFhlbiBzaWRlIG9mIHRoaW5nczoNCg0KT24g
MjkuMDQuMjYgMTU6NTIsIFZhbCBQYWNrZXR0IHdyb3RlOg0KPiBUaGUgZXhwZXJpbWVudGFs
IHZpcnRpby1tbWlvIHN1cHBvcnQgZm9yIFhlbiB3YXMgaW5pdGlhbGx5IGRldmVsb3BlZA0K
PiBvbiBhYXJjaDY0LCBzbyBkZXZpY2UgdHJlZXMgd2VyZSB1c2VkIHRvIGNvbmZpZ3VyZSB0
aGUgbW1pbyBkZXZpY2VzLA0KPiB3aXRoIGFyYml0cmFyeSB2R0lDIGludGVycnVwdHMgdXNl
ZCBieSB0aGUgaHlwZXJ2aXNvci4gT24geDg2XzY0DQo+IGhvd2V2ZXIsIHRoZSBvbmx5IHJl
YXNvbmFibGUgd2F5IHRvIGludGVycnVwdCB0aGUgZ3Vlc3QgaXMgb3ZlciBYZW4NCj4gZXZl
bnQgY2hhbm5lbHMsIHdoaWNoIGNhbiBvbmx5IGJlIGFjcXVpcmVkIGJ5IGNoaWxkcmVuIG9m
IHhlbmJ1cywNCg0KTW9yZSBleGFjdDogaW50ZXJkb21haW4gZXZlbnQgY2hhbm5lbHMgbmVl
ZCB0byBiZSBjb25uZWN0ZWQgdG8gYSB4ZW5idXMNCmRldmljZS4gQnV0IHlvdSBhcmUgbmVl
ZGluZyB0aG9zZSwgc28gZm9yIHlvdXIgdXNlIGNhc2UgdGhlIGFib3ZlIHN0YXRlbWVudA0K
aXMgY29ycmVjdC4NCg0KPiB0aGUgdmlydHVhbCBidXMgZHJpdmVuIGJ5IFhlbidzIGNvbmZp
Z3VyYXRpb24gZGF0YWJhc2UsIFhlblN0b3JlLg0KPiBJdCBpcyBhbHNvIGEgbW9yZSBjb252
ZW5pZW50IGFuZCAiWGVuLWlzaCIgd2F5IHRvIHByb3Zpc2lvbiBkZXZpY2VzLg0KPiANCj4g
SW1wbGVtZW50IGEgeGVuYnVzIGNsaWVudCBmb3IgdmlydGlvLW1taW8gd2hpY2ggbmVnb3Rp
YXRlcyBhbg0KPiBldmVudCBjaGFubmVsIGFuZCBwcm92aWRlcyBpdCBhcyBhIHBsYXRmb3Jt
IElSUSB0byB0aGUNCj4gdmlydGlvLW1taW8gZHJpdmVyLg0KPiANCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IFZhbCBQYWNrZXR0IDx2YWxAaW52aXNpYmxldGhpbmdzbGFiLmNvbT4NCj4gLS0t
DQo+IA0KPiBIaSwNCj4gDQo+IEkndmUgYmVlbiB3b3JraW5nIG9uIHBvcnRpbmcgdmlydGlv
LW1taW8gc3VwcG9ydCBmcm9tIEFybSB0byB4ODZfNjQsDQo+IHdpdGggdGhlIGdvYWwgb2Yg
cnVubmluZyB2aG9zdC11c2VyLWdwdSB0byBwb3dlciBXYXlsYW5kL0dQVSBpbnRlZ3JhdGlv
bg0KPiBmb3IgUXViZXMgT1MuIChJJ20gYXdhcmUgb2YgdmFyaW91cyBwcm9wb3NhbHMgZm9y
IGFsdGVybmF0aXZlIHZpcnRpbw0KPiB0cmFuc3BvcnRzIGJ1dCB2aXJ0aW8tbW1pbyBzZWVt
cyB0byBiZSB0aGUgb25seSBvbmUgdGhhdCAqaXMqIHVwc3RyZWFtDQo+IGFscmVhZHkgYW5k
IGp1c3QgV29ya3MuLikgU2V0dGluZyB1cCB2aXJ0aW8tbW1pbyB0aHJvdWdoIHhlbmJ1cywg
aW5pdGlhbGx5DQo+IG1vdGl2YXRlZCBqdXN0IGJ5IGV2ZW50IGNoYW5uZWxzIGJlaW5nIHRo
ZSBvbmx5IHJlYWwgd2F5IHRvIGdldCBpbnRlcnJ1cHRzDQo+IHdvcmtpbmcgb24gSFZNLCB0
dXJuZWQgb3V0IHRvIGdlbmVyYWxseSBiZSBxdWl0ZSBwbGVhc2FudCBhbmQgbmljZSA6KQ0K
PiANCj4gSSdkIGxpa2UgdG8gZ2V0IHNvbWUgZWFybHkgZmVlZGJhY2sgZm9yIHRoaXMgcGF0
Y2gsIHBhcnRpY3VsYXJseQ0KPiB0aGUgZ2VuZXJhbCBzdHVmZjoNCj4gDQo+ICogaXMgdGhp
cyB3aG9sZSB0aGluZyBhY2NlcHRhYmxlIGluIGdlbmVyYWw/DQo+ICogc2hvdWxkIGl0IGJl
IGV4dHJhY3RlZCBpbnRvIGEgZGlmZmVyZW50IGZpbGU/DQo+ICogKGZyb20gdGhlIFhlbiBz
aWRlKSBhbnkgaW5wdXQgb24gdGhlIHhlbnN0b3JlIGtleXMsIHdoYXQgZ29lcyB3aGVyZT8N
Cg0KWW91IHNob3VsZCBhZGQgc29tZSBkb2N1bWVudGF0aW9uIGluIHRoZSBYZW4gc291cmNl
IHRyZWUgcmVnYXJkaW5nIHRoZQ0KWGVuc3RvcmUga2V5cyAoc2VlIGRvY3MvbWlzYy94ZW5z
dG9yZS1wYXRocy5wYW5kb2MgdGhlcmUpLg0KDQo+ICogYW55dGhpbmcgZWxzZSB0byBrZWVw
IGluIG1pbmQ/DQo+IA0KPiBJdCBkb2VzIHNlZW0gc2ltcGxlIGVub3VnaCwgc28gaG9wZWZ1
bGx5IHRoaXMgY2FuIGJlIGRvbmU/DQo+IA0KPiBUaGUgY29ycmVzcG9uZGluZyB1c2Vyc3Bh
Y2Utc2lkZSBXSVAgaXMgYXZhaWxhYmxlIGF0Og0KPiBodHRwczovL2dpdGh1Yi5jb20vUXVi
ZXNPUy94ZW4tdmhvc3QtZnJvbnRlbmQNCj4gDQo+IEFuZCB0aGUgcmVxdWlyZWQgRE1PUCBm
b3IgZmlyaW5nIHRoZSBldnRjaG4gZXZlbnRzIHdpbGwgYmUgc2VudA0KPiB0byB4ZW4tZGV2
ZWwgc2hvcnRseSBhcyB3ZWxsLg0KPiANCj4gVGhhbmtzLA0KPiB+dmFsDQo+IA0KPiAtLS0N
Cj4gICBkcml2ZXJzL3ZpcnRpby9LY29uZmlnICAgICAgIHwgICA3ICsrDQo+ICAgZHJpdmVy
cy92aXJ0aW8vdmlydGlvX21taW8uYyB8IDE3NyArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrLQ0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMTgzIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpcnRpby9LY29uZmln
IGIvZHJpdmVycy92aXJ0aW8vS2NvbmZpZw0KPiBpbmRleCBjZTViYzBkOWVhMjguLjU2YmMy
YjEwNTI2YiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy92aXJ0aW8vS2NvbmZpZw0KPiArKysg
Yi9kcml2ZXJzL3ZpcnRpby9LY29uZmlnDQo+IEBAIC0xNzEsNiArMTcxLDEzIEBAIGNvbmZp
ZyBWSVJUSU9fTU1JT19DTURMSU5FX0RFVklDRVMNCj4gICANCj4gICAJIElmIHVuc3VyZSwg
c2F5ICdOJy4NCj4gICANCj4gK2NvbmZpZyBWSVJUSU9fTU1JT19YRU5CVVMNCj4gKwlib29s
ICJNZW1vcnkgbWFwcGVkIHZpcnRpbyBkZXZpY2VzIHBhcmFtZXRlciBwYXJzaW5nIg0KPiAr
CWRlcGVuZHMgb24gVklSVElPX01NSU8gJiYgWEVODQo+ICsJc2VsZWN0IFhFTl9YRU5CVVNf
RlJPTlRFTkQNCj4gKwloZWxwDQo+ICsJIEFsbG93IHZpcnRpby1tbWlvIGRldmljZXMgaW5z
dGFudGlhdGlvbiBmb3IgWGVuIGd1ZXN0cyB2aWEgeGVuYnVzLg0KPiArDQo+ICAgY29uZmln
IFZJUlRJT19ETUFfU0hBUkVEX0JVRkZFUg0KPiAgIAl0cmlzdGF0ZQ0KPiAgIAlkZXBlbmRz
IG9uIERNQV9TSEFSRURfQlVGRkVSDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpcnRpby92
aXJ0aW9fbW1pby5jIGIvZHJpdmVycy92aXJ0aW8vdmlydGlvX21taW8uYw0KPiBpbmRleCA1
OTVjMjI3NGZiYjUuLjMyMjk1Mjg0YmRiZiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy92aXJ0
aW8vdmlydGlvX21taW8uYw0KPiArKysgYi9kcml2ZXJzL3ZpcnRpby92aXJ0aW9fbW1pby5j
DQo+IEBAIC03MCw2ICs3MCwxMSBAQA0KPiAgICNpbmNsdWRlIDx1YXBpL2xpbnV4L3ZpcnRp
b19tbWlvLmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4L3ZpcnRpb19yaW5nLmg+DQo+ICAgDQo+
ICsjaWZkZWYgQ09ORklHX1ZJUlRJT19NTUlPX1hFTkJVUw0KPiArI2luY2x1ZGUgPHhlbi94
ZW4uaD4NCj4gKyNpbmNsdWRlIDx4ZW4veGVuYnVzLmg+DQo+ICsjaW5jbHVkZSA8eGVuL2V2
ZW50cy5oPg0KPiArI2VuZGlmDQo+ICAgDQo+ICAgDQo+ICAgLyogVGhlIGFsaWdubWVudCB0
byB1c2UgYmV0d2VlbiBjb25zdW1lciBhbmQgcHJvZHVjZXIgcGFydHMgb2YgdnJpbmcuDQo+
IEBAIC04MTAsMTMgKzgxNSwxODMgQEAgc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIg
dmlydGlvX21taW9fZHJpdmVyID0gew0KPiAgIAl9LA0KPiAgIH07DQo+ICAgDQo+ICsjaWZk
ZWYgQ09ORklHX1ZJUlRJT19NTUlPX1hFTkJVUw0KPiArc3RydWN0IHZpcnRpb19tbWlvX3hl
bl9pbmZvIHsNCj4gKwlzdHJ1Y3QgcmVzb3VyY2UgcmVzb3VyY2VzWzJdOw0KPiArCXVuc2ln
bmVkIGludCBldnRjaG47DQo+ICsJc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldjsNCj4g
K307DQo+ICsNCj4gK3N0YXRpYyBpbnQgdmlydGlvX21taW9feGVuX3Byb2JlKHN0cnVjdCB4
ZW5idXNfZGV2aWNlICpkZXYsDQo+ICsJCQljb25zdCBzdHJ1Y3QgeGVuYnVzX2RldmljZV9p
ZCAqaWQpDQo+ICt7DQo+ICsJaW50IGVycjsNCj4gKwlsb25nIGxvbmcgYmFzZSwgc2l6ZTsN
Cj4gKwljaGFyICptZW07DQo+ICsJc3RydWN0IHZpcnRpb19tbWlvX3hlbl9pbmZvICppbmZv
Ow0KPiArCXN0cnVjdCB4ZW5idXNfdHJhbnNhY3Rpb24geGJ0Ow0KPiArDQo+ICsJLyogVE9E
TzogYWxsb2NhdGUgYW4gdW51c2VkIGFkZHJlc3MgaGVyZSBhbmQgcGFzcyBpdCB0byB0aGUg
aG9zdCBpbnN0ZWFkICovDQoNCkluZGVlZC4NCg0KPiArCWVyciA9IHhlbmJ1c19zY2FuZihY
QlRfTklMLCBkZXYtPm90aGVyZW5kLCAiYmFzZSIsICIweCVsbHgiLA0KPiArCQkJICAgJmJh
c2UpOw0KPiArCWlmIChlcnIgPCAwKSB7DQo+ICsJCXhlbmJ1c19kZXZfZmF0YWwoZGV2LCBl
cnIsICJyZWFkaW5nIGJhc2UiKTsNCj4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ICsJfQ0KPiAr
DQo+ICsJbWVtID0geGVuYnVzX3JlYWQoWEJUX05JTCwgZGV2LT5vdGhlcmVuZCwgInNpemUi
LCBOVUxMKTsNCj4gKwlpZiAoWEVOQlVTX0lTX0VSUl9SRUFEKG1lbSkpDQo+ICsJCXJldHVy
biBQVFJfRVJSKG1lbSk7DQo+ICsJc2l6ZSA9IG1lbXBhcnNlKG1lbSwgTlVMTCk7DQo+ICsJ
a2ZyZWUobWVtKTsNCj4gKw0KPiArCWluZm8gPSBremFsbG9jX29iaigqaW5mbyk7DQo+ICsJ
aWYgKCFpbmZvKSB7DQo+ICsJCXhlbmJ1c19kZXZfZmF0YWwoZGV2LCAtRU5PTUVNLCAiYWxs
b2NhdGluZyBpbmZvIHN0cnVjdHVyZSIpOw0KPiArCQlyZXR1cm4gLUVOT01FTTsNCj4gKwl9
DQo+ICsNCj4gKwlpbmZvLT5yZXNvdXJjZXNbMF0uZmxhZ3MgPSBJT1JFU09VUkNFX01FTTsN
Cj4gKwlpbmZvLT5yZXNvdXJjZXNbMF0uc3RhcnQgPSBiYXNlOw0KPiArCWluZm8tPnJlc291
cmNlc1swXS5lbmQgPSBiYXNlICsgc2l6ZSAtIDE7DQo+ICsNCj4gKwllcnIgPSB4ZW5idXNf
YWxsb2NfZXZ0Y2huKGRldiwgJmluZm8tPmV2dGNobik7DQo+ICsJaWYgKGVycikgew0KPiAr
CQl4ZW5idXNfZGV2X2ZhdGFsKGRldiwgZXJyLCAieGVuYnVzX2FsbG9jX2V2dGNobiIpOw0K
PiArCQlnb3RvIGVycm9yX2luZm87DQo+ICsJfQ0KPiArDQo+ICsJZXJyID0gYmluZF9ldnRj
aG5fdG9faXJxKGluZm8tPmV2dGNobik7DQo+ICsJaWYgKGVyciA8PSAwKSB7DQo+ICsJCXhl
bmJ1c19kZXZfZmF0YWwoZGV2LCBlcnIsICJiaW5kX2V2dGNobl90b19pcnEiKTsNCj4gKwkJ
Z290byBlcnJvcl9ldnRjaGFuOw0KPiArCX0NCj4gKw0KPiArCWluZm8tPnJlc291cmNlc1sx
XS5mbGFncyA9IElPUkVTT1VSQ0VfSVJROw0KPiArCWluZm8tPnJlc291cmNlc1sxXS5zdGFy
dCA9IGluZm8tPnJlc291cmNlc1sxXS5lbmQgPSBlcnI7DQo+ICsNCj4gK2FnYWluOg0KPiAr
CWVyciA9IHhlbmJ1c190cmFuc2FjdGlvbl9zdGFydCgmeGJ0KTsNCg0KTm8gbmVlZCB0byB1
c2UgYSBYZW5zdG9yZSB0cmFuc2FjdGlvbiBoZXJlLiBUaGUgd3JpdHRlbiBub2RlKHMpIGFy
ZQ0KcmVnYXJkZWQgdG8gYmUgdmFsaWQgb25seSBhZnRlciBjYWxsaW5nIHhlbmJ1c19zd2l0
Y2hfc3RhdGUoKSB0byBzZXQNCnRoZSBmcm9udGVuZCBzdGF0ZSB0byBYZW5idXNTdGF0ZUlu
aXRpYWxpc2VkLg0KDQo+ICsJaWYgKGVycikgew0KPiArCQl4ZW5idXNfZGV2X2ZhdGFsKGRl
diwgZXJyLCAic3RhcnRpbmcgdHJhbnNhY3Rpb24iKTsNCj4gKwkJZ290byBlcnJvcl9pcnE7
DQo+ICsJfQ0KPiArDQo+ICsJZXJyID0geGVuYnVzX3ByaW50Zih4YnQsIGRldi0+bm9kZW5h
bWUsICJldmVudC1jaGFubmVsIiwgIiV1IiwNCj4gKwkJCSAgICBpbmZvLT5ldnRjaG4pOw0K
DQpXaXRoIGFsbG9jYXRpb24gb2YgdGhlIGJhc2UgYWRkcmVzcyB5b3UnZCB3YW50IHRvIHdy
aXRlIGl0IHRvIGFub3RoZXIgbm9kZSwNCm9mIGNvdXJzZS4NCg0KPiArCWlmIChlcnIpIHsN
Cj4gKwkJeGVuYnVzX3RyYW5zYWN0aW9uX2VuZCh4YnQsIDEpOw0KPiArCQl4ZW5idXNfZGV2
X2ZhdGFsKGRldiwgZXJyLCAiJXMiLCAid3JpdGluZyBldmVudC1jaGFubmVsIik7DQo+ICsJ
CWdvdG8gZXJyb3JfaXJxOw0KPiArCX0NCj4gKw0KPiArCWVyciA9IHhlbmJ1c190cmFuc2Fj
dGlvbl9lbmQoeGJ0LCAwKTsNCj4gKwlpZiAoZXJyKSB7DQo+ICsJCWlmIChlcnIgPT0gLUVB
R0FJTikNCj4gKwkJCWdvdG8gYWdhaW47DQo+ICsJCXhlbmJ1c19kZXZfZmF0YWwoZGV2LCBl
cnIsICJjb21wbGV0aW5nIHRyYW5zYWN0aW9uIik7DQo+ICsJCWdvdG8gZXJyb3JfaXJxOw0K
PiArCX0NCj4gKw0KPiArCWRldl9zZXRfZHJ2ZGF0YSgmZGV2LT5kZXYsIGluZm8pOw0KPiAr
CXhlbmJ1c19zd2l0Y2hfc3RhdGUoZGV2LCBYZW5idXNTdGF0ZUluaXRpYWxpc2VkKTsNCj4g
KwlyZXR1cm4gMDsNCj4gKw0KPiArZXJyb3JfaXJxOg0KPiArCXVuYmluZF9mcm9tX2lycWhh
bmRsZXIoaW5mby0+cmVzb3VyY2VzWzFdLnN0YXJ0LCBpbmZvKTsNCj4gK2Vycm9yX2V2dGNo
YW46DQo+ICsJeGVuYnVzX2ZyZWVfZXZ0Y2huKGRldiwgaW5mby0+ZXZ0Y2huKTsNCj4gK2Vy
cm9yX2luZm86DQo+ICsJa2ZyZWUoaW5mbyk7DQo+ICsNCj4gKwlyZXR1cm4gZXJyOw0KPiAr
fQ0KPiArDQo+ICtzdGF0aWMgdm9pZCB2aXJ0aW9fbW1pb194ZW5fYmFja2VuZF9jaGFuZ2Vk
KHN0cnVjdCB4ZW5idXNfZGV2aWNlICpkZXYsDQo+ICsJCQkJICAgZW51bSB4ZW5idXNfc3Rh
dGUgYmFja2VuZF9zdGF0ZSkNCj4gK3sNCj4gKwlzdHJ1Y3QgdmlydGlvX21taW9feGVuX2lu
Zm8gKmluZm8gPSBkZXZfZ2V0X2RydmRhdGEoJmRldi0+ZGV2KTsNCj4gKw0KPiArCXN3aXRj
aCAoYmFja2VuZF9zdGF0ZSkgew0KPiArCWNhc2UgWGVuYnVzU3RhdGVJbml0aWFsaXNpbmc6
DQo+ICsJY2FzZSBYZW5idXNTdGF0ZUluaXRXYWl0Og0KPiArCWNhc2UgWGVuYnVzU3RhdGVJ
bml0aWFsaXNlZDoNCj4gKwljYXNlIFhlbmJ1c1N0YXRlUmVjb25maWd1cmluZzoNCj4gKwlj
YXNlIFhlbmJ1c1N0YXRlUmVjb25maWd1cmVkOg0KPiArCWNhc2UgWGVuYnVzU3RhdGVVbmtu
b3duOg0KPiArCQlicmVhazsNCj4gKw0KPiArCWNhc2UgWGVuYnVzU3RhdGVDb25uZWN0ZWQ6
DQo+ICsJCWlmIChkZXYtPnN0YXRlICE9IFhlbmJ1c1N0YXRlSW5pdGlhbGlzZWQpIHsNCj4g
KwkJCWRldl93YXJuKCZkZXYtPmRldiwgInN0YXRlICVkIG9uIGNvbm5lY3QiLCBkZXYtPnN0
YXRlKTsNCj4gKwkJCWJyZWFrOw0KPiArCQl9DQo+ICsJCWluZm8tPnBkZXYgPSBwbGF0Zm9y
bV9kZXZpY2VfcmVnaXN0ZXJfcmVzbmRhdGEoJmRldi0+ZGV2LA0KPiArCQkJCSJ2aXJ0aW8t
bW1pbyIsIFBMQVRGT1JNX0RFVklEX0FVVE8sDQo+ICsJCQkJaW5mby0+cmVzb3VyY2VzLCBB
UlJBWV9TSVpFKGluZm8tPnJlc291cmNlcyksIE5VTEwsIDApOw0KPiArCQl4ZW5idXNfc3dp
dGNoX3N0YXRlKGRldiwgWGVuYnVzU3RhdGVDb25uZWN0ZWQpOw0KPiArCQlicmVhazsNCj4g
Kw0KPiArCWNhc2UgWGVuYnVzU3RhdGVDbG9zZWQ6DQo+ICsJCWlmIChkZXYtPnN0YXRlID09
IFhlbmJ1c1N0YXRlQ2xvc2VkKQ0KPiArCQkJYnJlYWs7DQo+ICsJCWZhbGx0aHJvdWdoOwkv
KiBNaXNzZWQgdGhlIGJhY2tlbmQncyBDbG9zaW5nIHN0YXRlLiAqLw0KPiArCWNhc2UgWGVu
YnVzU3RhdGVDbG9zaW5nOg0KPiArCQlwbGF0Zm9ybV9kZXZpY2VfdW5yZWdpc3RlcihpbmZv
LT5wZGV2KTsNCj4gKwkJeGVuYnVzX3N3aXRjaF9zdGF0ZShkZXYsIFhlbmJ1c1N0YXRlQ2xv
c2VkKTsNCj4gKwkJYnJlYWs7DQo+ICsNCj4gKwlkZWZhdWx0Og0KPiArCQl4ZW5idXNfZGV2
X2ZhdGFsKGRldiwgLUVJTlZBTCwgInNhdyBzdGF0ZSAlZCBhdCBmcm9udGVuZCIsDQo+ICsJ
CQkJIGJhY2tlbmRfc3RhdGUpOw0KPiArCQlicmVhazsNCj4gKwl9DQo+ICt9DQo+ICsNCj4g
K3N0YXRpYyB2b2lkIHZpcnRpb19tbWlvX3hlbl9yZW1vdmUoc3RydWN0IHhlbmJ1c19kZXZp
Y2UgKmRldikNCj4gK3sNCj4gKwlzdHJ1Y3QgdmlydGlvX21taW9feGVuX2luZm8gKmluZm8g
PSBkZXZfZ2V0X2RydmRhdGEoJmRldi0+ZGV2KTsNCj4gKw0KPiArCWtmcmVlKGluZm8pOw0K
PiArCWRldl9zZXRfZHJ2ZGF0YSgmZGV2LT5kZXYsIE5VTEwpOw0KPiArfQ0KPiArDQo+ICtz
dGF0aWMgY29uc3Qgc3RydWN0IHhlbmJ1c19kZXZpY2VfaWQgdmlydGlvX21taW9feGVuX2lk
c1tdID0gew0KPiArCXsgInZpcnRpbyIgfSwNCg0KUGxlYXNlIHVzZSAidmlydGlvLW1taW8i
IGhlcmUsIGFzIEkgY291bGQgaW1hZ2luZSAidmlydGlvLXBjaSIgZGV2aWNlcywgdG9vLg0K
DQoNCkp1ZXJnZW4NCg0KPiArCXsgIiIgfSwNCj4gK307DQo+ICsNCj4gK3N0YXRpYyBzdHJ1
Y3QgeGVuYnVzX2RyaXZlciB2aXJ0aW9fbW1pb194ZW5fZHJpdmVyID0gew0KPiArCS5pZHMJ
CQk9IHZpcnRpb19tbWlvX3hlbl9pZHMsDQo+ICsJLnByb2JlCQkJPSB2aXJ0aW9fbW1pb194
ZW5fcHJvYmUsDQo+ICsJLm90aGVyZW5kX2NoYW5nZWQJPSB2aXJ0aW9fbW1pb194ZW5fYmFj
a2VuZF9jaGFuZ2VkLA0KPiArCS5yZW1vdmUJCQk9IHZpcnRpb19tbWlvX3hlbl9yZW1vdmUs
DQo+ICt9Ow0KPiArI2VuZGlmDQo+ICsNCj4gICBzdGF0aWMgaW50IF9faW5pdCB2aXJ0aW9f
bW1pb19pbml0KHZvaWQpDQo+ICAgew0KPiAtCXJldHVybiBwbGF0Zm9ybV9kcml2ZXJfcmVn
aXN0ZXIoJnZpcnRpb19tbWlvX2RyaXZlcik7DQo+ICsJaW50IHJldDsNCj4gKw0KPiArCXJl
dCA9IHBsYXRmb3JtX2RyaXZlcl9yZWdpc3RlcigmdmlydGlvX21taW9fZHJpdmVyKTsNCj4g
KwlpZiAocmV0KQ0KPiArCQlyZXR1cm4gcmV0Ow0KPiArDQo+ICsjaWZkZWYgQ09ORklHX1ZJ
UlRJT19NTUlPX1hFTkJVUw0KPiArCWlmICh4ZW5fZG9tYWluKCkpDQo+ICsJCXJldCA9IHhl
bmJ1c19yZWdpc3Rlcl9mcm9udGVuZCgmdmlydGlvX21taW9feGVuX2RyaXZlcik7DQo+ICsj
ZW5kaWYNCj4gKw0KPiArCXJldHVybiByZXQ7DQo+ICAgfQ0KPiAgIA0KPiAgIHN0YXRpYyB2
b2lkIF9fZXhpdCB2aXJ0aW9fbW1pb19leGl0KHZvaWQpDQo+ICAgew0KPiArI2lmZGVmIENP
TkZJR19WSVJUSU9fTU1JT19YRU5CVVMNCj4gKwlpZiAoeGVuX2RvbWFpbigpKQ0KPiArCQl4
ZW5idXNfdW5yZWdpc3Rlcl9kcml2ZXIoJnZpcnRpb19tbWlvX3hlbl9kcml2ZXIpOw0KPiAr
I2VuZGlmDQo+ICsNCj4gICAJcGxhdGZvcm1fZHJpdmVyX3VucmVnaXN0ZXIoJnZpcnRpb19t
bWlvX2RyaXZlcik7DQo+ICAgCXZtX3VucmVnaXN0ZXJfY21kbGluZV9kZXZpY2VzKCk7DQo+
ICAgfQ0KDQo=
--------------HCshP870xeA72w06G6OVMqA8
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------HCshP870xeA72w06G6OVMqA8--

--------------ue4BYSUfwU0oTBtHJ9in4V9z--

--------------g0UC1Ck4AStDbbtB0H4eW8y7
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmnyJUQFAwAAAAAACgkQsN6d1ii/Ey8y
5wf+OSYxptSMIwRtv0BfGWnvgqRxhhz/qAXi2Xf4Ac68tm/bKDB5ENs4K31KTXygguBeDozZQWyJ
mWsTDUccG+xXwhybnJtNCC6WPdwWrCIGpB0WtLb8yknuae45Gw0iMEwdBLgrd0aFvNboHvko0Amd
vppIpkgM5a6dL9pjomVWuTdxS82PLya9DfPOOlo9SqWoQkt2tGnD8I8H8gm/UMtkqdb5Dpa0EtEl
uBAXQrz49yOak+ewHBMpbsnMsbUpajQGAIUSTRNErB++QSmvnRgbMan9k/DEFDx8mOwHhtSWTJp9
ONxSMuAo27K3cQ6RGK3mK0MFjG+SUyFACqhqSEuUSg==
=wIXT
-----END PGP SIGNATURE-----

--------------g0UC1Ck4AStDbbtB0H4eW8y7--

