Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kB0FFpC2/WmAhwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 12:10:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A218B4F4CCD
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 12:10:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1303408.1576828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLI9Y-0001ck-Bl; Fri, 08 May 2026 10:09:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1303408.1576828; Fri, 08 May 2026 10:09:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLI9Y-0001bF-93; Fri, 08 May 2026 10:09:52 +0000
Received: by outflank-mailman (input) for mailman id 1303408;
 Fri, 08 May 2026 10:09:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wLI9W-0001as-BF
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 10:09:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLI9V-00Frqh-HL
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 12:09:49 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 69fdb66b-bab6-0a2a0a5309dd-0a2a4507a360-14
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 12:09:49 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 69fdb66d-229c-0a2a45070019-d155802ee0ee-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 12:09:49 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-488b0e1b870so28688905e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 03:09:49 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e65e12377sm14863435e9.36.2026.05.08.03.09.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 May 2026 03:09:48 -0700 (PDT)
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
        d=suse.com; s=google; t=1778234989; x=1778839789; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uQwSl3R4nXFNL7ClDWXNfUv0g3gRW2eDyLxi6h6ENEo=;
        b=LxsD5N/C5vqlQuIRGCX4t/3TayzBqxMS+JHjuR5mJ8veeET8KKK9guHun5Unfy8Q8h
         sisOnG/llw9SOXfUPakTE346ZZ6M4q0KuS2iNnFhN++jSAq6+0t19t4orr9XGaBrhCEB
         NdLzJoa3II7yEv/H+hv/e2ol9BxzGX9AsWSOAN737Zv54vdpYMz1wXC6VEQUdL8dlWre
         99H91jlk/q/AdmIWtF4FCih86YGkDpYZX380fOrkV4JeNHm+t/g1KrEF2PEklV4pQMt9
         NRX8KIowoiTsJFzq+fu0cOhxAv+6O9OuL3MUhUSxxagejftQfLoGmaThd42o25/QYFW0
         tmOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778234989; x=1778839789;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uQwSl3R4nXFNL7ClDWXNfUv0g3gRW2eDyLxi6h6ENEo=;
        b=lrovrgMelEXIYsR1fJX9Luk1iR62nu/Vmg9jvpiWoGw7gacILcItXBju3R7CuiN0cm
         HKTPOO4q1CEFvbJx/OKVQtIIiVMM5pRHmHe5RMG8aiz+vsUi5djwTdL1ynRLjkqz3yp4
         uub5Var+k3Ks70gGmUAAvnQc0UGRKkzTl1dJDQv71SqQBwYyCKDQrs94uPJ5v9KTeqAJ
         tISmXzekQI1FFCnyDeUFIX2maxVrC29pFSKZxrNiS4Uaga4H8g2BFU/Jv0wddYOkWq8b
         R+gKkMsgutIPJ4XDGqrAky4e4jiMnBeTG0X4E76V9BqVFwqZsQiK/0Kf5qjO3awMMc4L
         ZdJg==
X-Forwarded-Encrypted: i=1; AFNElJ+ch/cd0rQrXcDYGySFOeggAOlqBv+bD5dsolhz8WD4pj0l7ZK4G5CfcHq4TRV/FCQ2ekVFBk57FSk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxjZ/VQ4q47whKUIpBMp5tPsMKC4X2wZqVLv9DVbzYq1yvhknVz
	Aa3DgRJmE/1i0lnkz4c3+ACL8ZoZVdEFOeSqoWDU2BKIih5uf6S4Q37JwwjSYNjtjo0=
X-Gm-Gg: AeBDieseHgm+L+phNLJ6V9747Rkzr1gMpxmO356frf613XofWq+ravVJ11pX80KUBpx
	Tbyd7Pni5gU5x0YQszHYFDENUJiAVu6SGL20HbQ5W+AliXP0Nciy0bsrBq3b6dprelzp0m62YCm
	gKs2ousFmyIMu+zT3sJ71AF6d1ZuusI9ot32y/gpIsU1yAibSqOBTGawsJgN3/Gwt3pbDVzKynP
	xedYgdTUAhjg8IphHAxVq8vFdofUrusN9E5FhV92XiPgdcXsS0tLT/bRnTaYwiBKZb4dQ+BP0v2
	rY/ckqwYyKToygpukUmMSU3OIDZm/fD7z2ElL2RP51zOIUbLZT4fXYL9HsP7jK1QNp4l92gghQk
	fF/LtdU7PijPE0qhD+oFdhaPJ2fxvY5CpOlI2//8DHplP5ieyP+RjKb4BWEpIIws3p3h5WOxKIT
	r9slqHu/MnBAfph1w1KeiSQRtmqiV4mdsxytVMQhcaqhGTTjnV82vBxvBJRI4ngDcOkmD/zZ4WB
	J8U905a2RQUOjdVRAkA22CJHeeZTVP8YYXacsOEcvS2zZfADMxM9w==
X-Received: by 2002:a05:600c:47d3:b0:48d:c0a:3813 with SMTP id 5b1f17b1804b1-48e51e0bb62mr120348625e9.3.1778234988657;
        Fri, 08 May 2026 03:09:48 -0700 (PDT)
Message-ID: <be5b5e70-a61e-4803-9f40-873ce5381328@suse.com>
Date: Fri, 8 May 2026 12:09:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: kernel BUG around vmap/vfree -
 xen_enter_lazy_mmu()/xen_leave_lazy_mmu() - Linux 7.0-rc1
To: Kevin Brodsky <kevin.brodsky@arm.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <aaBH3EAchUwKhrUA@mail-itl>
 <c2f973a0-fcb5-48ea-9638-cd73fa3e37ce@citrix.com>
 <c712c06f-7fcf-4876-b2d7-f2b7bc6f0dea@suse.com> <adIuP7-sNwuOid80@mail-itl>
 <5d068304-837d-4aef-b8a7-87c91ccf96b4@arm.com>
 <c6855bd1-5b41-470b-8942-a4ebe3b5de0b@suse.com>
 <15645d19-f19d-4955-8315-0188aa834eb6@suse.com>
 <7f123733-2ec2-436e-bb0c-67b3e9f80735@arm.com>
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
In-Reply-To: <7f123733-2ec2-436e-bb0c-67b3e9f80735@arm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------NxeXpDUtU1CVH5wQvtQoY0qb"
X-purgate-ID: tlsNG-ef75cf/1778234989-0A772C48-0C341B5A/0/0
X-purgate-type: clean
X-purgate-size: 10243
X-Rspamd-Queue-Id: A218B4F4CCD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.37 / 15.00];
	SIGNED_PGP(-2.00)[];
	R_MIXED_CHARSET(0.71)[subject];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:kevin.brodsky@arm.com,m:marmarek@invisiblethingslab.com,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:boris.ostrovsky@oracle.com,s:lists@lfdr.de];
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
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------NxeXpDUtU1CVH5wQvtQoY0qb
Content-Type: multipart/mixed; boundary="------------344B6733Ezlm0YXXLj6S7075";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <be5b5e70-a61e-4803-9f40-873ce5381328@suse.com>
Subject: Re: kernel BUG around vmap/vfree -
 xen_enter_lazy_mmu()/xen_leave_lazy_mmu() - Linux 7.0-rc1
References: <aaBH3EAchUwKhrUA@mail-itl>
 <c2f973a0-fcb5-48ea-9638-cd73fa3e37ce@citrix.com>
 <c712c06f-7fcf-4876-b2d7-f2b7bc6f0dea@suse.com> <adIuP7-sNwuOid80@mail-itl>
 <5d068304-837d-4aef-b8a7-87c91ccf96b4@arm.com>
 <c6855bd1-5b41-470b-8942-a4ebe3b5de0b@suse.com>
 <15645d19-f19d-4955-8315-0188aa834eb6@suse.com>
 <7f123733-2ec2-436e-bb0c-67b3e9f80735@arm.com>
In-Reply-To: <7f123733-2ec2-436e-bb0c-67b3e9f80735@arm.com>

--------------344B6733Ezlm0YXXLj6S7075
Content-Type: multipart/mixed; boundary="------------9gc1VbDJpspadR0eY8H0pg21"

--------------9gc1VbDJpspadR0eY8H0pg21
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDguMDUuMjYgMTE6NTQsIEtldmluIEJyb2Rza3kgd3JvdGU6DQo+IE9uIDA4LzA1LzIw
MjYgMTA6NTMsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBbLi4uXQ0KPj4NCj4+IEJ1dCBu
b3cgSSB0aGluayBJIGhhdmUgZm91bmQgdGhlIHJlYWwgY3VscHJpdCBpbiBsYXp5X21tdV9t
b2RlX2VuYWJsZSgpOg0KPj4NCj4+IHN0YXRpYyBpbmxpbmUgdm9pZCBsYXp5X21tdV9tb2Rl
X2VuYWJsZSh2b2lkKQ0KPj4gew0KPj4gIMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBsYXp5X21t
dV9zdGF0ZSAqc3RhdGUgPSAmY3VycmVudC0+bGF6eV9tbXVfc3RhdGU7DQo+Pg0KPj4gIMKg
wqDCoMKgwqDCoMKgIGlmIChpbl9pbnRlcnJ1cHQoKSB8fCBzdGF0ZS0+cGF1c2VfY291bnQg
PiAwKQ0KPj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm47DQo+Pg0K
Pj4gIMKgwqDCoMKgwqDCoMKgIFZNX1dBUk5fT05fT05DRShzdGF0ZS0+ZW5hYmxlX2NvdW50
ID09IFU4X01BWCk7DQo+Pg0KPj4gIMKgwqDCoMKgwqDCoMKgIGlmIChzdGF0ZS0+ZW5hYmxl
X2NvdW50KysgPT0gMCkNCj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYXJj
aF9lbnRlcl9sYXp5X21tdV9tb2RlKCk7DQo+PiB9DQo+Pg0KPj4gQ29uc2lkZXIgYSBwcmVl
bXB0aW9uIGp1c3QgYmVmb3JlIGNhbGxpbmcgYXJjaF9lbnRlcl9sYXp5X21tdV9tb2RlKCku
IFRoZQ0KPj4gZW5hYmxlX2NvdW50IHdpbGwgYmUgMSBub3csIGJ1dCB0aGVyZSB3YXMgbm8g
c3dpdGNoIHRvIGxhenkgbW9kZSB5ZXQuDQo+Pg0KPj4gV2hlbiB0aGUgdGFzayBiZWNvbWVz
IGFjdGl2ZSBhZ2FpbiwgY29udGV4dCBzd2l0Y2ggaGFuZGxpbmcgd2lsbCBzZWUgbGF6eQ0K
Pj4gbW9kZSBlbmFibGVkIChlbmFibGVfY291bnQgPiAwKSwgc28gaXQgd2lsbCBjYWxsDQo+
PiBhcmNoX2VudGVyX2xhenlfbW11X21vZGUoKS4NCj4+IEFuZCB0aGVuIHRoZSB0YXNrIHJl
c3VtZXMgYW5kIGlzIGNhbGxpbmcgYXJjaF9lbnRlcl9sYXp5X21tdV9tb2RlKCkNCj4+IGFu
b3RoZXINCj4+IHRpbWUuDQo+IA0KPiBBZ3JlZWQsIHRoaXMgbXVzdCBiZSB0aGUgcHJvYmxl
bS4gSSBkaWQgd29uZGVyIHdoZXRoZXIgdGhlIGxhY2sgb2YNCj4gYXRvbWljaXR5IHdvdWxk
IGNhdXNlIHRyb3VibGUuLi4NCj4gDQo+IGFybTY0IGlzbid0IGltcGFjdGVkIGJlY2F1c2Ug
aXQgdHJhY2tzIHJlbGF0ZWQgc3RhdGUgaW4gdGFza19zdHJ1Y3QNCj4gb25seS4gcG93ZXJw
YyBhbmQgc3BhcmMgZG8gdXNlIHBlcmNwdSB2YXJpYWJsZXMgYnV0IHRoYXQgc2hvdWxkbid0
DQo+IG1hdHRlciBhcyB0aGV5IGRpc2FibGUgcHJlZW1wdGlvbiBpbiB0aGUgZW50aXJlIGxh
enkgTU1VIHNlY3Rpb24uDQo+IA0KPj4NCj4+IFRoZSBvbmx5IGNoYW5jZSBJJ20gc2VlaW5n
IHRvIGF2b2lkIHRoYXQgd291bGQgYmUgdG8gZGlzYWJsZSBwcmVlbXB0aW9uDQo+PiBhcm91
bmQgYWxsIGluc3RhbmNlcyBvZiB0ZXN0aW5nIGEgY29uZGl0aW9uIGFuZCB0aGVuIGVuYWJs
aW5nIG9yDQo+PiBkaXNhYmxpbmcNCj4+IGxhenkgbW11IG1vZGUuDQo+IA0KPiBJIGRvbid0
IGltbWVkaWF0ZWx5IHNlZSB3aHkgd2Ugd291bGQgbmVlZCBzdWNoIGEgYmlnIGhhbW1lci4g
SWYgd2UNCj4gcmV2ZXJ0IGNvbW1pdCAyOTFiM2FiZWQ2NTcgKCJ4ODYveGVuOiB1c2UgbGF6
eV9tbXVfc3RhdGUgd2hlbg0KPiBjb250ZXh0LXN3aXRjaGluZyIpLCB0aGVuIGFyY2hfe3N0
YXJ0LGVuZH1fY29udGV4dF9zd2l0Y2goKSBzaG91bGQgb25jZQ0KPiBhZ2FpbiBkbyB0aGUg
cmlnaHQgdGhpbmcgZm9yIFhlbiBzaW5jZSB0aGUgVElGX0xBWllfTU1VX1VQREFURVMgZmxh
ZyBpcw0KPiBzZXBhcmF0ZSBmcm9tIGxhenlfbW11X3N0YXRlLiBJIHRoaW5rIGl0IGxvb2tz
IGxpa2UgdGhpczoNCj4gDQo+IGxhenlfbW11X21vZGVfZW5hYmxlKCkNCj4gIMKgIMKgIHN0
YXRlLT5lbmFibGVfY291bnQrKw0KPiAgwqAgwqAgPFBSRUVNUFQ+DQo+ICDCoCDCoCDCoCDC
oCBhcmNoX3N0YXJ0X2NvbnRleHRfc3dpdGNoKCkNCj4gIMKgIMKgIMKgIMKgIMKgIMKgIHhl
bl9sYXp5X21vZGUgPT0gWEVOX0xBWllfTk9ORSAtPiBkbyBub3RoaW5nDQo+ICAgICAgICAg
IA0KPiAgwqAgwqAgwqAgwqAgPG90aGVyIHRhc2sgcnVuczsgdGhpcyB0YXNrIGlzIHNjaGVk
dWxlZCBhZ2Fpbj4NCj4gDQo+ICDCoCDCoCDCoCDCoCBhcmNoX2VuZF9jb250ZXh0X3N3aXRj
aCgpDQo+ICDCoCDCoCDCoCDCoCDCoCDCoCBUSUZfTEFaWV9NTVVfVVBEQVRFUyBub3Qgc2V0
IC0+IGRvIG5vdGhpbmcNCj4gDQo+ICDCoCDCoCDCoCDCoCA8ZXhjZXB0aW9uIHJldHVybj4N
Cj4gIMKgIMKgIGVudGVyX2xhenkoWEVOX0xBWllfTU1VKQ0KPiANCj4gTm90aGluZyBlbHNl
IHNob3VsZCBiZSBjaGVja2luZyBsYXp5IE1NVSBzdGF0ZSBkdXJpbmcgdGhlIGNvbnRleHQg
c3dpdGNoLg0KPiANCj4gRG9lcyB0aGF0IG1ha2Ugc2Vuc2U/DQoNClRoaXMgd291bGQgd29y
aywgeWVzLg0KDQpPVE9IIEkgZG9uJ3QgbGlrZSB0aGUgbXVsdGlwbGUgY29uZGl0aW9ucyB1
c2VkIGZvciB0ZXN0aW5nIChzdGF0ZS0+ZW5hYmxlX2NvdW50LA0KVElGX0xBWllfTU1VX1VQ
REFURVMsIHhlbl9sYXp5X21vZGUpLg0KDQpBbm90aGVyIHZhcmlhbnQgd291bGQgYmUgdG8g
anVzdCBsZXQgdGhlIFhlbiBzcGVjaWZpYyBjb2RlIHRvbGVyYXRlIHRoZSBkb3VibGUNCmNh
bGxzIGJ5IGRpc2FibGluZyBwcmVlbXB0aW9uIGluIHRoZSBYZW4gY29kZSBhbmQgY2hlY2tp
bmcgdmlhDQpfX3Rhc2tfbGF6eV9tbXVfbW9kZV9hY3RpdmUoKSBpZiBhbnl0aGluZyBuZWVk
cyB0byBiZSBkb25lLg0KDQpJJ2QgcmVhbGx5IGxpa2UgdG8gZ2V0IHJpZCBvZiB4ZW5fbGF6
eV9tb2RlIGNvbXBsZXRlbHkuDQoNCg0KSnVlcmdlbg0K
--------------9gc1VbDJpspadR0eY8H0pg21
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------9gc1VbDJpspadR0eY8H0pg21--

--------------344B6733Ezlm0YXXLj6S7075--

--------------NxeXpDUtU1CVH5wQvtQoY0qb
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmn9tmsFAwAAAAAACgkQsN6d1ii/Ey/P
qgf9H8zBdSqCtTtRHMDzl02ActywwJ78jYULAg7+WwI7uGTjUqeVe4f9mlZcj5+z7F9bbP3tRjKu
lf5Zp9LLtWdgAQw961hDhJdgg7hOzYxqIFDuMaH4Bb5i0tMFBbW11AGKTBy6elvrFT+BWVLwALuj
akr7Em8rmM7KGBLsQtUywRaVyaWSQ6AbGW/6BJRs0v40xUAtFIsAyiadIJwKld0DtiP+5nrMJPrn
zVWaBcvKK2dHhRPc4jFIRWlHZSc9x+f8JFHP2V1bRzVJP/5LhVwLg5uP4wv2KLoTJd4eWZ9tambs
6nsCkSPiEi8KDg/6oneUPpRlXzpKFkrtfiOgDT4nQg==
=8Epf
-----END PGP SIGNATURE-----

--------------NxeXpDUtU1CVH5wQvtQoY0qb--

