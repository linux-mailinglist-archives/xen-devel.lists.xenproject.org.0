Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wI52Jp0S+mkWJAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 17:54:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C694D0AB7
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 17:54:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300840.1575296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKI5Z-0000DO-51; Tue, 05 May 2026 15:53:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300840.1575296; Tue, 05 May 2026 15:53:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKI5Z-0000B8-1V; Tue, 05 May 2026 15:53:37 +0000
Received: by outflank-mailman (input) for mailman id 1300840;
 Tue, 05 May 2026 15:53:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wKI5W-0000B2-MK
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 15:53:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKI5V-005haT-06
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 17:53:33 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 69fa125d-2eae-0a2a0a5409dd-0a2a4501988a-34
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 17:53:32 +0200
Received: from [209.85.208.54] (helo=mail-ed1-f54.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 69fa127c-c1f2-0a2a45010019-d155d036c13f-3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 17:53:32 +0200
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-66b2d49ffb0so7366310a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 08:53:32 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bc28c4ea2casm200362066b.53.2026.05.05.08.53.31
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 May 2026 08:53:31 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Autocrypt:Subject:From:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777996412; x=1778601212; darn=lists.xenproject.org;
        h=autocrypt:subject:from:to:content-language:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CUpsrxOvj9UJtsQYvciiuv8hh+g4t0hhK8mxnpPXyKo=;
        b=JtxpS6X2dZxEvIE4GbsDXgcYrioTCNE4+o3TkDvV8SwvVQu53WTmUecq5ZDZh63uS6
         7FfZ8MMC10NvBn7VSU//YAJcIa8Q5H7o04sKW2eRD3Q8NEpQaxeGKL38Rb6JqdvmVn36
         DqB+D636yJpEUjPCbx9J1Z2C9D255k9ePqKj/uCL9/MwxGeSQM0h3g/h49QHVxwV8/dC
         4bt5rm88vbpjS9iis/LEyHkP2ENgp2YDNR7HtL9mRDX6zH/emsgPnmuGzvAW0Yfzn5eg
         V5WZt+OXzPcMa1OuOrXxzAcccZymHX2vCWrZ7HuOqYKj82VvaY4m2AvrWGs4bnfISHte
         Ceow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777996412; x=1778601212;
        h=autocrypt:subject:from:to:content-language:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CUpsrxOvj9UJtsQYvciiuv8hh+g4t0hhK8mxnpPXyKo=;
        b=KFx1b+9eYdvW9Ms4NkoTswj3+h+tQtEZ520kz7ggrsZaNaGRsS0SvCsCaMJW7sMkBq
         62IvpyGBDw5R4SgXrK1gTcEMC3JSOIh4m/NSPuKXWWEGTvTVqYkciAVW2uDHQoz5zfg/
         n7rTnR0XxNkqCXYnf6SQREQG4hi6uFjIufgs7ZXoO5L6Ye+7K2JwQ8Rh0UvUs1tWSB9O
         1l0Q9/FeHL7rKy5GX85cvX2q8RHt2Nlyr6zTrFlLzTmsQ/vhZF6M7p+G3nLoJ/0AEdBR
         3/Xi7DRRkhG7Z97PWKU+fznBHgUkPidLDZNPhrO2ONnWGi4vn+W+i35UTd6GD15MhB7j
         q6pw==
X-Gm-Message-State: AOJu0YzlKZ3WCm/gKaat775byaBpYEInz7OprGNjNmjjab28lKd2/cBi
	mw047i4ptAN0RSdT9CF6Sp6c8fWN6MaY/c0pswlr4XViATGejlK6j/0DjILSXWVSISSSlN/U5EO
	eYOD4T24=
X-Gm-Gg: AeBDieuhWLZsVASBEfw6yJmserTXz0A0NuM0WT2Cdcp0uP62TVRsQ7D2iQ72VOgKFRT
	6lciccJchjHkyPMAkbvNI4PzV/gRAngLVXSMU+w2wNhYeq+bmYshwoBj83SLXmFFUhN/F+ZHAy2
	QV9tctZqjsbNoAyr08PtuBZOhq3KFuRq/ONn4r9jAbIdu5RC99jHJjkQ5A4W0Nku/VbuQcgTPlq
	MpmXXFWSRxkS03G8BmtIhvvBBorCrlscTDnr2UIltKkCjAD4cng9yRAkExyqjD2/PPK6rgluY0m
	rWKgYnmBHtMdYkMVEFxGT08pwmY+YSjNG5VPhAdSH2zM+DLcbrloV/4QlDf4mT7Myeux1K3/9/6
	ml2zgcUyaj9zIe8f1c2JbbqcIFHmJZvXfXYBIYPrSIVDTYlZBaG6yzrmq++/DZEEYOTcnW4ss2+
	dQ2n1KBK+NMyd6yhN+JAiVqj9OqfYXrhp7ZrhMC/jLsjDV9NCXOvKdlaB+R78HZdfanawqZOpfu
	Scy2iMrWXHbrTeIF1KBs/DyrFBBelP+hK55pGbLNcwNI/dpYZgCP2124btkhSpv
X-Received: by 2002:a17:907:ea5:b0:ba7:3578:f627 with SMTP id a640c23a62f3a-bbffbf77a93mr839479166b.37.1777996412065;
        Tue, 05 May 2026 08:53:32 -0700 (PDT)
Message-ID: <04c8ed4e-4e99-46ae-b83d-af9031f5b622@suse.com>
Date: Tue, 5 May 2026 17:53:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Problem with PCI-passthrough to PV guest
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
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ZzburDCEZJo4FwrKYKk3kUVf"
X-purgate-ID: tlsNG-d62444/1777996412-B586AFF4-F932EB67/0/0
X-purgate-type: clean
X-purgate-size: 9787
X-Rspamd-Queue-Id: E3C694D0AB7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	SIGNED_PGP(-2.00)[];
	R_MIXED_CHARSET(1.00)[subject];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	HAS_ATTACHMENT(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.919];
	FORGED_SENDER_FORWARDING(0.00)[];
	ARC_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ZzburDCEZJo4FwrKYKk3kUVf
Content-Type: multipart/mixed; boundary="------------pamF0kLiXXfK6t3bU3sVo5Re";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <04c8ed4e-4e99-46ae-b83d-af9031f5b622@suse.com>
Subject: Problem with PCI-passthrough to PV guest

--------------pamF0kLiXXfK6t3bU3sVo5Re
Content-Type: multipart/mixed; boundary="------------q0O7MTI7ClbhQziXu4IbD3Rx"

--------------q0O7MTI7ClbhQziXu4IbD3Rx
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

U1VTRSBRQSBpcyBzZWVpbmcgYSBwcm9ibGVtIHdpdGggUENJLXBhc3N0aHJvdWdoIG9mIGEg
U1ItSU9WIHRvIGEgUFYgZ3Vlc3QNCnJ1bm5pbmcgYSA2LjQgYmFzZWQga2VybmVsLCBidXQg
SSBjYW4gcmVwcm9kdWNlIHRoZSBwcm9ibGVtIHdpdGggdXBzdHJlYW0NCmtlcm5lbCwgdG9v
Lg0KDQpUaGUgZ3Vlc3QgaXMgY29uZmlndXJlZCB3aXRoICJlODIwX2hvc3Q9MSIsIGJ1dCB0
aGUgUENJIHJlZ2lvbiBvbiB0aGUgaG9zdA0KaXNuJ3QgbWFya2VkIGFzICJyZXNlcnZlZCIg
aW4gdGhlIG1lbW9yeSBtYXAsIHNvIGl0IHdvbid0IGJlIHJlc2VydmVkIGluDQp0aGUgZWl0
aGVyLg0KDQpBcyB0aGUgZ3Vlc3QgZG9lc24ndCBoYXZlIHRoZSBBQ1BJIHRhYmxlIGF2YWls
YWJsZSBkZXNjcmliaW5nIHRoZSBQQ0kgcmVnaW9ucywNCi9wcm9jL2lvbWVtIGluIHRoZSBn
dWVzdCB3b24ndCBpbmNsdWRlIHRob3NlIHJlZ2lvbnMgYXMgdXNlZCwgcmVzdWx0aW5nIGlu
DQp0aGUga2VybmVsJ3MgcmVzb3VyY2UgbWFuYWdlbWVudCB0byB1c2UgdGhvc2UgYXJlYXMg
Zm9yIHBvdGVudGlhbCBtZW1vcnk6DQoNCiAgcmVzb3VyY2U6IGF2b2lkaW5nIGFsbG9jYXRp
b24gZnJvbSBlODIwIGVudHJ5IFttZW0gMHg3OGVkYzAwMC0weDc5ODY4ZmZmXQ0KICByZXNv
dXJjZTogYXZvaWRpbmcgYWxsb2NhdGlvbiBmcm9tIGU4MjAgZW50cnkgW21lbSAweDc5ZDJh
MDAwLTB4OGZmZmZmZmZdDQogIHJlc291cmNlOiByZW1haW5pbmcgW21lbSAweDAwMDAwMDAw
OTAwMDAwMDAtMHgwMDAwMDAwMGZmZGZmZmZmXSBhdmFpbGFibGUNCiAgcmVzb3VyY2U6IGF2
b2lkaW5nIGFsbG9jYXRpb24gZnJvbSBlODIwIGVudHJ5IFttZW0gMHhjN2ZmYzAwMC0weGM3
ZmZjZmZmXQ0KICByZXNvdXJjZTogcmVtYWluaW5nIFttZW0gMHgwMDAwMDAwMDkwMDAwMDAw
LTB4MDAwMDAwMDBjN2ZmYmZmZl0gYXZhaWxhYmxlDQoNCmRvbTAgL3Byb2MvaW9tZW06DQog
IC4uLg0KICA4MDAwMDAwMC04ZmZmZmZmZiA6IFBDSSBNTUNPTkZJRyAwMDAwIFtidXMgMDAt
ZmZdDQogIDkwMDAwMDAwLWM3ZmZiZmZmIDogUENJIEJ1cyAwMDAwOjAwICAgIOKGkCBQQ0kg
TU1JTyB3aW5kb3cgYmVnaW5zIGhlcmUNCiAgICA5MDAwMDAwMC05MDBmZmZmZiA6IFBDSSBC
dXMgMDAwMDowMSAg4oaQIEkzNTAgVkZzIGFzc2lnbmVkIGluIHRoaXMgcmFuZ2UNCiAgICBj
NjAwMDAwMC1jNzBmZmZmZiA6IFBDSSBCdXMgMDAwMDowNA0KDQpkb20wIGU4MjAgbWFwOg0K
ICAuLi4NCiAgWGVuOiBbbWVtIDB4MDAwMDAwMDA3OTg2OTAwMC0weDAwMDAwMDAwNzlkMjlm
ZmZdIEFDUEkgTlZTDQogIFhlbjogW21lbSAweDAwMDAwMDAwNzlkMmEwMDAtMHgwMDAwMDAw
MDhmZmZmZmZmXSByZXNlcnZlZA0KICBYZW46IFttZW0gMHgwMDAwMDAwMGM3ZmZjMDAwLTB4
MDAwMDAwMDBjN2ZmY2ZmZl0gcmVzZXJ2ZWQNCiAgWGVuOiBbbWVtIDB4MDAwMDAwMDBmYmZm
YzAwMC0weDAwMDAwMDAwZmJmZmNmZmZdIHJlc2VydmVkDQogIC4uLg0KDQpkb21VIC9wcm9j
L2lvbWVtOg0KICAuLi4NCiAgMDAxMDAwMDAtNzhmMDZmZmYgOiBTeXN0ZW0gUkFNDQogICAg
MDEwMDAwMDAtMDFmZmZmZmYgOiBLZXJuZWwgY29kZQ0KICAgIC4uLg0KICA5MDAwMDAwMC05
N2ZmZmZmZiA6IFN5c3RlbSBSQU0NCiAgZmVlMDAwMDAtZmVlMDBmZmYgOiBMb2NhbCBBUElD
DQoNCmRvbVUgZTgyMCBtYXA6DQogIC4uLg0KICBYZW46IFttZW0gMHgwMDAwMDAwMDc5ODY5
MDAwLTB4MDAwMDAwMDA3OWQyOWZmZl0gQUNQSSBOVlMNCiAgWGVuOiBbbWVtIDB4MDAwMDAw
MDA3OWQyYTAwMC0weDAwMDAwMDAwOGZmZmZmZmZdIHJlc2VydmVkDQogIFhlbjogW21lbSAw
eDAwMDAwMDAwYzdmZmMwMDAtMHgwMDAwMDAwMGM3ZmZjZmZmXSByZXNlcnZlZA0KICBYZW46
IFttZW0gMHgwMDAwMDAwMGZiZmZjMDAwLTB4MDAwMDAwMDBmYmZmY2ZmZl0gcmVzZXJ2ZWQN
CiAgLi4uDQoNClRoZSBWRiBpcyBzaG93aW5nIHVwIG5lYXIgMHg5MDAwMA0KICBwY2kgMDAw
MDowMDowMC40OiBbODA4NjoxNTIwXSB0eXBlIDAwIGNsYXNzIDB4MDIwMDAwDQogIHBjaSAw
MDAwOjAwOjAwLjQ6IHJlZyAweDEwOiBbbWVtIDB4OTAwMDQwMDAtMHg5MDAwN2ZmZiA2NGJp
dCBwcmVmXQ0KICBwY2kgMDAwMDowMDowMC40OiByZWcgMHgxYzogW21lbSAweDkwMDI0MDAw
LTB4OTAwMjdmZmYgNjRiaXQgcHJlZl0NCiAgcGNpZnJvbnQgcGNpLTA6IE5ldyBkZXZpY2Ug
b24gMDAwMDowMDowMC40IGZvdW5kLg0KICBwY2lmcm9udCBwY2ktMDogY2xhaW1pbmcgcmVz
b3VyY2UgMDAwMDowMDowMC40LzANCiAgcGNpIDAwMDA6MDA6MDAuNDogY2FuJ3QgY2xhaW0g
QkFSIDAgW21lbSAweDkwMDA0MDAwLTB4OTAwMDdmZmYgNjRiaXQgcHJlZl06IA0KYWRkcmVz
cyBjb25mbGljdCB3aXRoIFN5c3RlbSBSQU0gW21lbSAweDkwMDAwMDAwLTB4OTdmZmZmZmZd
DQogIHBjaWZyb250IHBjaS0wOiBDb3VsZCBub3QgY2xhaW0gcmVzb3VyY2UgMDAwMDowMDow
MC40LzAhIERldmljZSBvZmZsaW5lLiBUcnkgDQp1c2luZyBlODIwX2hvc3Q9MSBpbiB0aGUg
Z3Vlc3QgY29uZmlnLg0KICBwY2lmcm9udCBwY2ktMDogY2xhaW1pbmcgcmVzb3VyY2UgMDAw
MDowMDowMC40LzMNCiAgcGNpIDAwMDA6MDA6MDAuNDogY2FuJ3QgY2xhaW0gQkFSIDMgW21l
bSAweDkwMDI0MDAwLTB4OTAwMjdmZmYgNjRiaXQgcHJlZl06IA0KYWRkcmVzcyBjb25mbGlj
dCB3aXRoIFN5c3RlbSBSQU0gW21lbSAweDkwMDAwMDAwLTB4OTdmZmZmZmZdDQogIHBjaWZy
b250IHBjaS0wOiBDb3VsZCBub3QgY2xhaW0gcmVzb3VyY2UgMDAwMDowMDowMC40LzMhIERl
dmljZSBvZmZsaW5lLiBUcnkgDQp1c2luZyBlODIwX2hvc3Q9MSBpbiB0aGUgZ3Vlc3QgY29u
ZmlnLg0KDQpNeSBmaXJzdCBpZGVhIGZvciBzb2x2aW5nIHRoaXMgd2FzIHRvIGFkZCB0aGUg
UENJIHJlZ2lvbnMgZnJvbSBkb20wJ3MNCi9wcm9jL2lvbWVtIHRvIHRoZSBlODIwIG1hcCBv
ZiB0aGUgZ3Vlc3QsIGJ1dCB0aGlzIGlzIG1vcmUgYSBoYWNrIHRoYW4gYSBzYW5lDQpzb2x1
dGlvbi4NCg0KVGhvdWdodHM/DQoNCg0KSnVlcmdlbg0K
--------------q0O7MTI7ClbhQziXu4IbD3Rx
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------q0O7MTI7ClbhQziXu4IbD3Rx--

--------------pamF0kLiXXfK6t3bU3sVo5Re--

--------------ZzburDCEZJo4FwrKYKk3kUVf
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmn6EnsFAwAAAAAACgkQsN6d1ii/Ey8T
dwf+LuOc81l6uqOBAx5iHB0PMG9VARr+ezrm7fnAiZI9bkGBI/anar5vPZVnraAebJawxKg+Lv7k
DysJkkg/qKXBF2zI/WuNt1q/sv0wVSx9DLNeEIJLliaq/qvO58eFdbQtKzHFMhg4TiggRon7JgAB
sO9LiYlIL22ZaZLreRye0fT1PTI6eQoU5bH1VZ+3OJeizzdKQZO6Uqlh4yrO4TwcPor0L+o0OL82
e0AR9nmDxBnJmGkXeFm6qgBLlS6vneLxxj0LgRukNXyKoWBSpULZGnNUANNDBDix3TF84ftBs6Ub
ULGR/v8WTRnyFqyX8SGciXHooH4tD5Qp3/cDj/iDcg==
=PoZc
-----END PGP SIGNATURE-----

--------------ZzburDCEZJo4FwrKYKk3kUVf--

