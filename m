Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KPESGqG+/GnSTAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 18:32:33 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9EE4EC466
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 18:32:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1302904.1576573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wL1dN-0002kE-MU; Thu, 07 May 2026 16:31:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1302904.1576573; Thu, 07 May 2026 16:31:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wL1dN-0002i6-JA; Thu, 07 May 2026 16:31:33 +0000
Received: by outflank-mailman (input) for mailman id 1302904;
 Thu, 07 May 2026 16:31:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wL1dM-0002i0-S5
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 16:31:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wL1dM-000E5U-7F
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 18:31:32 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 69fcbe59-2eae-0a2a0a5409dd-0a2a45078c90-24
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 18:31:32 +0200
Received: from [209.85.218.42] (helo=mail-ej1-f42.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 69fcbe63-229c-0a2a45070019-d155da2ac501-3
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 18:31:31 +0200
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-bca0bca01b4so51671566b.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 09:31:31 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bca583dd7e4sm5246266b.58.2026.05.07.09.31.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 May 2026 09:31:30 -0700 (PDT)
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
        d=suse.com; s=google; t=1778171491; x=1778776291; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZK4UBmAlIZ0/46usuHizTFZKuqbrLwHil21ejHg6ZAc=;
        b=N2bnDoEhzbtpyp0dMl/A0yFqi/h3iBXUua7OeThRVWbZFNkE/5E5gk661OFI+38QZC
         0ye/zhY/6B6f7+VlghaH2GcNeaxlYBVUtetUaZuRtioKPJWXqbyERWsSh0div+OWTUc7
         k40fx4xF1oukDqO4nEZx0APSDijfjdBeXLOeM0f2S7FXSouCFtdXZTLe72mO0LcOY1C9
         OAArEpmOJSe8Wn3JS4hQbcB5g2ZXGlqkHI7vdLOuIUf4QqKxj4XdqTaM8WcoqV6IWVGa
         m+xmtJePvI2WGj7qMqFDkRGh57gPNtTlztDe2ewwU35sd62D+hImiF1XVymcNH2OHPFj
         wp/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778171491; x=1778776291;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZK4UBmAlIZ0/46usuHizTFZKuqbrLwHil21ejHg6ZAc=;
        b=sx6V2F0JXNn6PvGP7zs1pcMC9dtpiF4DzenSs7YhpPUrMsTMd7MoH07bvtTaLppyGv
         Cs030KvdNcwqlEVvVfJvRvoLLgDJ+R/GaSsVIqCRi+LLg9wmVH8L7e/tiO8F2c2dyZcK
         SwVdSiLbUemwVF51fsjWWqKmFG11MolfOWnXr0eu9SnpyVrDNTGTEp/jUQhyVPcrfJoj
         uHOP33yaJOY5/YccdVvelv1+E2OyR7A90NgGAMzm93plo+bKmcaoE7TA+wlZ+9ozycp4
         nUy7hjjdjL54cfCpnPH5c/LyT20K/MG+ergQXRP33JMRaLSHdOW9Km8XEkVfGHW82ci8
         Km7Q==
X-Forwarded-Encrypted: i=1; AFNElJ/P0A9kiXCx82s07qjxVFZUGOw9iVL+EaSpFsSD4yn7Al9n49urdQR9hMNKCqxOdubcZc8mXZFExFk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxISATMhKbeZiQDI3/S55LcafAu8L1W8EFOxORGFEdKT1wbW2gO
	8W+iPJdMeZmcudtg7Y22Lf2u3aWnKV6UJhSZqf1kdKFyL02T3o4xCzke/qMwJSpTi1M=
X-Gm-Gg: AeBDiety22RPJtZOOhLgC5kWA6qRgm5l47ysGkP/iSfrrTsorP3dvUrX3UAXyPs5ulf
	tppY8jskk4o5jgOaXivg1RHFRLfACVfoqfw6xTAqNhrNoD2u4pY0iHr7Fnq6yvDR1rlbiNn35Ax
	13C9CwqGIP5TaGdRNXu0h1K0rBfT/uARE4sbEW7JcUyIBLpT4PwQgPMF4hnSTkzeoZBypJJzP7+
	qOEOAbpaRwYT6VYHpGxlxoCuLlCbUWS3JxE0ukjDzcBqdHe4fj/q0l6LHkeI+9loANjIXYIzUBd
	pHjAesR4QXWjLKNOS09j4XYXD8m2vAmXfZXiJGnK/8ZVaXXJwDES+3h06V+mYlCpH44jJvwSflh
	OOsy8oqoe3YtEqhn4AVdty/h7a3DBKsHB4ld/KCOmztQnkLJTbsycgYvJ4ihkpPI8h7ue0UQj5B
	CCGwQp0CiVabtxo991nzKdlJWVJJl7DfKPv/ZeKSy4I4dei80iNqjfkXxXM9SmvuQbI7/Eh9y1z
	MToI1ymKgzar+e7DxgDPuMAMn7VYDg6KJKh205IBT96G7rYCsd3m6taHrc+eudn
X-Received: by 2002:a17:907:ea7:b0:ba7:3d21:c137 with SMTP id a640c23a62f3a-bc56cb23d09mr485048666b.17.1778171491031;
        Thu, 07 May 2026 09:31:31 -0700 (PDT)
Message-ID: <c6855bd1-5b41-470b-8942-a4ebe3b5de0b@suse.com>
Date: Thu, 7 May 2026 18:31:29 +0200
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
In-Reply-To: <5d068304-837d-4aef-b8a7-87c91ccf96b4@arm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------cgepJjfW9HBWFgx5WY0SpqIe"
X-purgate-ID: tlsNG-ef75cf/1778171491-08B60C48-4FD4B9C7/0/0
X-purgate-type: clean
X-purgate-size: 20878
X-Rspamd-Queue-Id: 8D9EE4EC466
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.37 / 15.00];
	SIGNED_PGP(-2.00)[];
	R_MIXED_CHARSET(0.71)[subject];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kevin.brodsky@arm.com,m:marmarek@invisiblethingslab.com,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:boris.ostrovsky@oracle.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	HAS_ATTACHMENT(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------cgepJjfW9HBWFgx5WY0SpqIe
Content-Type: multipart/mixed; boundary="------------iyjT3ytA0H2xpCRVpWtNa0jc";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <c6855bd1-5b41-470b-8942-a4ebe3b5de0b@suse.com>
Subject: Re: kernel BUG around vmap/vfree -
 xen_enter_lazy_mmu()/xen_leave_lazy_mmu() - Linux 7.0-rc1
References: <aaBH3EAchUwKhrUA@mail-itl>
 <c2f973a0-fcb5-48ea-9638-cd73fa3e37ce@citrix.com>
 <c712c06f-7fcf-4876-b2d7-f2b7bc6f0dea@suse.com> <adIuP7-sNwuOid80@mail-itl>
 <5d068304-837d-4aef-b8a7-87c91ccf96b4@arm.com>
In-Reply-To: <5d068304-837d-4aef-b8a7-87c91ccf96b4@arm.com>

--------------iyjT3ytA0H2xpCRVpWtNa0jc
Content-Type: multipart/mixed; boundary="------------vRt4ikbd7UcskmwRX6A7xuVX"

--------------vRt4ikbd7UcskmwRX6A7xuVX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDcuMDQuMjYgMTE6MjMsIEtldmluIEJyb2Rza3kgd3JvdGU6DQo+IE9uIDA1LzA0LzIw
MjYgMTE6NDEsIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSB3cm90ZToNCj4+IE9uIFRo
dSwgRmViIDI2LCAyMDI2IGF0IDAyOjQxOjEyUE0gKzAxMDAsIErDvHJnZW4gR3Jvw58gd3Jv
dGU6DQo+Pj4gT24gMjYuMDIuMjYgMTQ6MjcsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+Pj4+
IE9uIDI2LzAyLzIwMjYgMToxNyBwbSwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIHdy
b3RlOg0KPj4+Pj4gSGksDQo+Pj4+Pg0KPj4+Pj4gV2hlbiB0ZXN0aW5nIExpbnV4IDcuMC1y
YzEgaW4gUFYgZG9tMCwgSSBoaXQgdGhlIGZvbGxvd2luZyBwYW5pYw0KPj4+Pj4gc29tZXRp
bWVzOg0KPj4+Pj4NCj4+Pj4+IFsgIDQzNi44NDk2MTRdIC0tLS0tLS0tLS0tLVsgY3V0IGhl
cmUgXS0tLS0tLS0tLS0tLQ0KPj4+Pj4gWyAgNDM2Ljg0OTY2OV0ga2VybmVsIEJVRyBhdCBh
cmNoL3g4Ni9pbmNsdWRlL2FzbS94ZW4vaHlwZXJ2aXNvci5oOjc4IQ0KPj4+Pj4gWyAgNDM2
Ljg0OTY5M10gT29wczogaW52YWxpZCBvcGNvZGU6IDAwMDAgWyMxXSBTTVAgTk9QVEkNCj4+
Pj4+IFsgIDQzNi44NDk3MTBdIENQVTogMyBVSUQ6IDAgUElEOiA0MDIxIENvbW06IGt3b3Jr
ZXIvdTI1OjEgTm90IHRhaW50ZWQgNy4wLjAtMC5yYzEuMS5xdWJlcy4xMDAxLmZjNDEueDg2
XzY0ICMxIFBSRUVNUFQoZnVsbCkNCj4+Pj4+IFsgIDQzNi44NDk3MjldIEhhcmR3YXJlIG5h
bWU6IFN0YXIgTGFicyBTdGFyQm9vay9TdGFyQm9vaywgQklPUyA4Ljk3IDEwLzAzLzIwMjMN
Cj4+Pj4+IFsgIDQzNi44NDk3NDNdIFdvcmtxdWV1ZTogaTkxNV9mbGlwIGludGVsX2F0b21p
Y19jb21taXRfd29yayBbaTkxNV0NCj4+Pj4+IFsgIDQzNi44NTAyMjZdIFJJUDogZTAzMDp4
ZW5fZW50ZXJfbGF6eV9tbXUrMHgyNC8weDMwDQo+Pj4+PiBbICA0MzYuODUwMjQ1XSBDb2Rl
OiA5MCA5MCA5MCA5MCA5MCA5MCBmMyAwZiAxZSBmYSAwZiAxZiA0NCAwMCAwMCA2NSA4YiAw
NSBiOCBlNSAwMiAwMyA4NSBjMCA3NSAxMCA2NSBjNyAwNSBhOSBlNSAwMiAwMyAwMSAwMCAw
MCAwMCBjMyBjYyBjYyBjYyBjYyA8MGY+IDBiIDY2IDJlIDBmIDFmIDg0IDAwIDAwIDAwIDAw
IDAwIDkwIDkwIDkwIDkwIDkwIDkwIDkwIDkwIDkwIDkwDQo+Pj4+PiBbICA0MzYuODUwMjcw
XSBSU1A6IGUwMmI6ZmZmZmM5MDA0NTcyN2E2OCBFRkxBR1M6IDAwMDEwMjAyDQo+Pj4+PiBb
ICA0MzYuODUwMjgzXSBSQVg6IDAwMDAwMDAwMDAwMDAwMDEgUkJYOiBmZmZmODg4MTA0MmZh
NmQwIFJDWDogMDAwZmZmZmZmZmUwMDAwMA0KPj4+Pj4gWyAgNDM2Ljg1MDI5Nl0gUkRYOiAw
MDAwMDAwMDAwMDAwMDAxIFJTSTogZmZmZjg4ODEwYTVhMjk4MCBSREk6IDAwMDAwMDAwMDAw
MDAwMDANCj4+Pj4+IFsgIDQzNi44NTAzMDhdIFJCUDogZmZmZmM5MDA0OWVkYTAwMCBSMDg6
IGZmZmZjOTAwNDllZGMwMDAgUjA5OiBmZmZmYzkwMDQ5ZWRjMDAwDQo+Pj4+PiBbICA0MzYu
ODUwMzIwXSBSMTA6IGZmZmZjOTAwNDllZGMwMDAgUjExOiBmZmZmYzkwMDQ5ZWRiZmZmIFIx
MjogZmZmZmM5MDA0OWVkYzAwMA0KPj4+Pj4gWyAgNDM2Ljg1MDMzMl0gUjEzOiBmZmZmYzkw
MDQ1NzI3YmIwIFIxNDogZmZmZmM5MDA0NTcyN2IyOCBSMTU6IDgwMDAwMDAwMDAwMDAwNmIN
Cj4+Pj4+IFsgIDQzNi44NTAzNTZdIEZTOiAgMDAwMDAwMDAwMDAwMDAwMCgwMDAwKSBHUzpm
ZmZmODg4MjAxZTZlMDAwKDAwMDApIGtubEdTOjAwMDAwMDAwMDAwMDAwMDANCj4+Pj4+IFsg
IDQzNi44NTAzNzFdIENTOiAgZTAzMCBEUzogMDAwMCBFUzogMDAwMCBDUjA6IDAwMDAwMDAw
ODAwNTAwMzMNCj4+Pj4+IFsgIDQzNi44NTAzODNdIENSMjogMDAwMDY1NDNkYmFkZTI1MCBD
UjM6IDAwMDAwMDAxMTVlZjEwMDAgQ1I0OiAwMDAwMDAwMDAwMDUwNjYwDQo+Pj4+PiBbICA0
MzYuODUwNDAxXSBDYWxsIFRyYWNlOg0KPj4+Pj4gWyAgNDM2Ljg1MDQxMF0gIDxUQVNLPg0K
Pj4+Pj4gWyAgNDM2Ljg1MDQyMF0gIHZtYXBfcGFnZXNfcHVkX3JhbmdlKzB4NDdjLzB4NTMw
DQo+Pj4+PiBbICA0MzYuODUwNDM5XSAgdm1hcF9zbWFsbF9wYWdlc19yYW5nZV9ub2ZsdXNo
KzB4MWYxLzB4MmIwDQo+Pj4+PiBbICA0MzYuODUwNDUxXSAgPyBfX2dldF92bV9hcmVhX25v
ZGUrMHgxMGEvMHgxNzANCj4+Pj4+IFsgIDQzNi44NTA0NjVdICB2bWFwKzB4NzkvMHhkMA0K
Pj4+Pj4gWyAgNDM2Ljg1MDQ3Nl0gIGk5MTVfZ2VtX29iamVjdF9tYXBfcGFnZSsweDEzYi8w
eDIxMCBbaTkxNV0NCj4+Pj4+IFsgIDQzNi44NTA4MTJdICBpOTE1X2dlbV9vYmplY3RfcGlu
X21hcCsweDFlMi8weDIxMCBbaTkxNV0NCj4+Pj4+IFsgIDQzNi44NTExMjNdICBpOTE1X2dl
bV9vYmplY3RfcGluX21hcF91bmxvY2tlZCsweDJkLzB4YTAgW2k5MTVdDQo+Pj4+PiBbICA0
MzYuODUxNDI0XSAgaW50ZWxfZHNiX2J1ZmZlcl9jcmVhdGUrMHhlZC8weDFhMCBbaTkxNV0N
Cj4+Pj4+IFsgIDQzNi44NTE3NzhdICBpbnRlbF9kc2JfcHJlcGFyZSsweGNhLzB4MWEwIFtp
OTE1XQ0KPj4+Pj4gWyAgNDM2Ljg1MjExMF0gIGludGVsX2F0b21pY19kc2JfZmluaXNoKzB4
OTIvMHgzNTAgW2k5MTVdDQo+Pj4+PiBbICA0MzYuODUyNDU2XSAgaW50ZWxfYXRvbWljX2Nv
bW1pdF90YWlsKzB4MzI2LzB4ZDQwIFtpOTE1XQ0KPj4+Pj4gWyAgNDM2Ljg1Mjc2OV0gIHBy
b2Nlc3Nfb25lX3dvcmsrMHgxOGQvMHgzODANCj4+Pj4+IFsgIDQzNi44NTI3NzldICB3b3Jr
ZXJfdGhyZWFkKzB4MTk2LzB4MzAwDQo+Pj4+PiBbICA0MzYuODUyNzg3XSAgPyBfX3BmeF93
b3JrZXJfdGhyZWFkKzB4MTAvMHgxMA0KPj4+Pj4gWyAgNDM2Ljg1Mjc5Nl0gIGt0aHJlYWQr
MHhlMy8weDEyMA0KPj4+Pj4gWyAgNDM2Ljg1MjgwNV0gID8gX19wZnhfa3RocmVhZCsweDEw
LzB4MTANCj4+Pj4+IFsgIDQzNi44NTI4MTVdICByZXRfZnJvbV9mb3JrKzB4MTllLzB4MjYw
DQo+Pj4+PiBbICA0MzYuODUyODI0XSAgPyBfX3BmeF9rdGhyZWFkKzB4MTAvMHgxMA0KPj4+
Pj4gWyAgNDM2Ljg1MjgzMl0gIHJldF9mcm9tX2ZvcmtfYXNtKzB4MWEvMHgzMA0KPj4+Pj4g
WyAgNDM2Ljg1Mjg0Ml0gIDwvVEFTSz4NCj4+Pj4+IFsgIDQzNi44NTI4NDddIE1vZHVsZXMg
bGlua2VkIGluOiBzbmRfc2VxX2R1bW15IHNuZF9ocnRpbWVyIHNuZF9oZGFfY29kZWNfaW50
ZWxoZG1pIHNuZF9oZGFfY29kZWNfaGRtaSBzbmRfaGRhX2NvZGVjX2FsYzI2OSBzbmRfaGRh
X2NvZGVjX3JlYWx0ZWtfbGliIHNuZF9oZGFfc2NvZGVjX2NvbXBvbmVudCBzbmRfaGRhX2Nv
ZGVjX2dlbmVyaWMgc25kX2hkYV9pbnRlbCBzbmRfc29mX3BjaV9pbnRlbF90Z2wgc25kX3Nv
Zl9wY2lfaW50ZWxfY25sIHNuZF9zb2ZfaW50ZWxfaGRhX2dlbmVyaWMgc291bmR3aXJlX2lu
dGVsIHNuZF9zb2ZfaW50ZWxfaGRhX3Nkd19icHQgc25kX3NvZl9pbnRlbF9oZGFfY29tbW9u
IHNuZF9zb2NfaGRhY19oZGEgc25kX3NvZl9pbnRlbF9oZGFfbWxpbmsgc25kX3NvZl9pbnRl
bF9oZGEgc291bmR3aXJlX2NhZGVuY2Ugc25kX3NvZl9wY2kgc25kX3NvZl94dGVuc2FfZHNw
IHNuZF9zb2Ygc25kX3NvZl91dGlscyBzbmRfc29jX2FjcGlfaW50ZWxfbWF0Y2ggc25kX3Nv
Y19hY3BpX2ludGVsX3NkY2FfcXVpcmtzIHNvdW5kd2lyZV9nZW5lcmljX2FsbG9jYXRpb24g
c25kX3NvY19zZHdfdXRpbHMgc25kX3NvY19hY3BpIGNyYzggaW50ZWxfcmFwbF9tc3Igc291
bmR3aXJlX2J1cyBpbnRlbF9yYXBsX2NvbW1vbiBzbmRfc29jX3NkY2Egc25kX3NvY19hdnMg
c25kX3NvY19oZGFfY29kZWMgc25kX2hkYV9leHRfY29yZSBzbmRfaGRhX2NvZGVjIHZmYXQg
aW50ZWxfdW5jb3JlX2ZyZXF1ZW5jeV9jb21tb24gZmF0IHNuZF9oZGFfY29yZSBzbmRfaW50
ZWxfZHNwY2ZnIHNuZF9pbnRlbF9zZHdfYWNwaSBzbmRfaHdkZXAgaW50ZWxfcG93ZXJjbGFt
cCBzbmRfc29jX2NvcmUgaXdsd2lmaSBzbmRfY29tcHJlc3Mgc3BpX25vciBpVENPX3dkdCBh
Yzk3X2J1cyBpbnRlbF9wbWNfYnh0IGVlMTAwNCBtdGQgc25kX3BjbV9kbWFlbmdpbmUgc25k
X3NlcSBjZmc4MDIxMSBzbmRfc2VxX2RldmljZSBwY3Nwa3Igc3BpX2ludGVsX3BjaSBzbmRf
cGNtIHJma2lsbCBzcGlfaW50ZWwgc25kX3RpbWVyIHNuZA0KPj4+Pj4gWyAgNDM2Ljg1Mjkz
OV0gIGkyY19pODAxIHNvdW5kY29yZSBpMmNfc21idXMgaWRtYTY0IGludGVsX3BtY19jb3Jl
IHBtdF90ZWxlbWV0cnkgcG10X2Rpc2NvdmVyeSBwbXRfY2xhc3MgaW50ZWxfaGlkIGludGVs
X3BtY19zc3JhbV90ZWxlbWV0cnkgaW50ZWxfc2N1X3BsdGRydiBzcGFyc2Vfa2V5bWFwIGpv
eWRldiBsb29wIGZ1c2UgeGVuZnMgbmZuZXRsaW5rIHZzb2NrX2xvb3BiYWNrIHZtd192c29j
a192aXJ0aW9fdHJhbnNwb3J0X2NvbW1vbiB2bXdfdnNvY2tfdm1jaV90cmFuc3BvcnQgdnNv
Y2sgenJhbSB2bXdfdm1jaSBsejRoY19jb21wcmVzcyBsejRfY29tcHJlc3MgZG1fdGhpbl9w
b29sIGRtX3BlcnNpc3RlbnRfZGF0YSBkbV9iaW9fcHJpc29uIGRtX2NyeXB0IHhlIGRybV90
dG1faGVscGVyIGRybV9zdWJhbGxvY19oZWxwZXIgZ3B1X3NjaGVkIGRybV9ncHV2bSBkcm1f
ZXhlYyBkcm1fZ3B1c3ZtX2hlbHBlciBpOTE1IGkyY19hbGdvX2JpdCBkcm1fYnVkZHkgaGlk
X211bHRpdG91Y2ggaTJjX2hpZF9hY3BpIGdoYXNoX2NsbXVsbmlfaW50ZWwgdmlkZW8gbnZt
ZSB3bWkgdHRtIGkyY19oaWQgbnZtZV9jb3JlIG52bWVfa2V5cmluZyBkcm1fZGlzcGxheV9o
ZWxwZXIgbnZtZV9hdXRoIHhoY2lfcGNpIHBpbmN0cmxfdGlnZXJsYWtlIHRodW5kZXJib2x0
IGhrZGYgY2VjIHhoY2lfaGNkIGludGVsX3ZzZWMgc2VyaW9fcmF3IHhlbl9hY3BpX3Byb2Nl
c3NvciB4ZW5fcHJpdmNtZCB4ZW5fcGNpYmFjayB4ZW5fYmxrYmFjayB4ZW5fZ250YWxsb2Mg
eGVuX2dudGRldiB4ZW5fZXZ0Y2huIHNjc2lfZGhfcmRhYyBzY3NpX2RoX2VtYyBzY3NpX2Ro
X2FsdWEgdWlucHV0IGkyY19kZXYNCj4+Pj4+IFsgIDQzNi44NTMxODNdIC0tLVsgZW5kIHRy
YWNlIDAwMDAwMDAwMDAwMDAwMDAgXS0tLQ0KPj4+Pj4NCj4+Pj4+IG9yIHRoaXM6DQo+Pj4+
Pg0KPj4+Pj4gWyAgNTQ4LjczNjg4NF0gLS0tLS0tLS0tLS0tWyBjdXQgaGVyZSBdLS0tLS0t
LS0tLS0tDQo+Pj4+PiBbICA1NDguNzM2OTA3XSBrZXJuZWwgQlVHIGF0IGFyY2gveDg2L2lu
Y2x1ZGUvYXNtL3hlbi9oeXBlcnZpc29yLmg6ODUhDQo+Pj4+PiBbICA1NDguNzM2OTIzXSBP
b3BzOiBpbnZhbGlkIG9wY29kZTogMDAwMCBbIzFdIFNNUCBOT1BUSQ0KPj4+Pj4gWyAgNTQ4
LjczNjkzNV0gQ1BVOiAwIFVJRDogMCBQSUQ6IDIwNiBDb21tOiBrd29ya2VyLzA6MiBOb3Qg
dGFpbnRlZCA3LjAuMC0wLnJjMS4xLnF1YmVzLjEwMDEuZmM0MS54ODZfNjQgIzEgUFJFRU1Q
VChmdWxsKQ0KPj4+Pj4gWyAgNTQ4LjczNjk0OV0gSGFyZHdhcmUgbmFtZTogTEVOT1ZPIDIz
NDdBNDUvMjM0N0E0NSwgQklPUyBDQkVUNDAwMCBOaXRyb2tleS12MC4yLjAtMjYwOC1nYTY0
OTU5NyAwMS8wMS8xOTcwDQo+Pj4+PiBbICA1NDguNzM2OTYyXSBXb3JrcXVldWU6IGV2ZW50
cyBkZWxheWVkX3ZmcmVlX3dvcmsNCj4+Pj4+IFsgIDU0OC43MzY5NzZdIFJJUDogZTAzMDp4
ZW5fbGVhdmVfbGF6eV9tbXUrMHg0NC8weDUwDQo+Pj4+PiBbICA1NDguNzM2OTg5XSBDb2Rl
OiAwMiAwMyA4MyBmOCAwMSA3NSAyMyA2NSBjNyAwNSA2YyBlNCAwMiAwMyAwMCAwMCAwMCAw
MCA2NSBmZiAwZCA3ZCBiOCAwMiAwMyA3NCAwNSBjMyBjYyBjYyBjYyBjYyBlOCA2MSA1ZCBm
ZCBmZiBjMyBjYyBjYyBjYyBjYyA8MGY+IDBiIDY2IDJlIDBmIDFmIDg0IDAwIDAwIDAwIDAw
IDAwIDkwIDkwIDkwIDkwIDkwIDkwIDkwIDkwIDkwIDkwDQo+Pj4+PiBbICA1NDguNzM3MDEw
XSBSU1A6IGUwMmI6ZmZmZmM5MDA0MDYwN2NmMCBFRkxBR1M6IDAwMDEwMjk3DQo+Pj4+PiBb
ICA1NDguNzM3MDE4XSBSQVg6IDAwMDAwMDAwMDAwMDAwMDAgUkJYOiBmZmZmODg4MTY0YTcw
NDA4IFJDWDogMDAwMDAwMDAwMDAwMDAwMA0KPj4+Pj4gWyAgNTQ4LjczNzAyOV0gUkRYOiAw
MDAwMDAwMDAwMDAwMDAwIFJTSTogMDAwZmZmZmZmZmZmZjAwMCBSREk6IGZmZmY4ODgxMDY5
YzAwMDANCj4+Pj4+IFsgIDU0OC43MzcwMzldIFJCUDogZmZmZmM5MDA0OTY4MTAwMCBSMDg6
IGZmZmZjOTAwNDk2ODEwMDAgUjA5OiAwMDAwMDAwMDAwMDAwMDI3DQo+Pj4+PiBbICA1NDgu
NzM3MDUwXSBSMTA6IDAwMDAwMDAwMDAwMDAwMjcgUjExOiBmZWZlZmVmZWZlZmVmZWZmIFIx
MjogZmZmZmM5MDA0OTY4MTAwMA0KPj4+Pj4gWyAgNTQ4LjczNzA2MF0gUjEzOiBmZmZmODg4
MTAwMmZkMjU4IFIxNDogMDAwMDAwMDAwMDAwMDAwMCBSMTU6IGZmZmZjOTAwNDA2MDdkYWMN
Cj4+Pj4+IFsgIDU0OC43MzcwNzldIEZTOiAgMDAwMDAwMDAwMDAwMDAwMCgwMDAwKSBHUzpm
ZmZmODg4MWY4OGVlMDAwKDAwMDApIGtubEdTOjAwMDAwMDAwMDAwMDAwMDANCj4+Pj4+IFsg
IDU0OC43MzcwOTBdIENTOiAgZTAzMCBEUzogMDAwMCBFUzogMDAwMCBDUjA6IDAwMDAwMDAw
ODAwNTAwMzMNCj4+Pj4+IFsgIDU0OC43MzcwOTldIENSMjogMDAwMDU1NTc2YzJlNjA1OCBD
UjM6IDAwMDAwMDAxMGQ0N2IwMDAgQ1I0OiAwMDAwMDAwMDAwMDUwNjYwDQo+Pj4+PiBbICA1
NDguNzM3MTE1XSBDYWxsIFRyYWNlOg0KPj4+Pj4gWyAgNTQ4LjczNzEyM10gIDxUQVNLPg0K
Pj4+Pj4gWyAgNTQ4LjczNzEyOF0gIHZ1bm1hcF9wbWRfcmFuZ2UuaXNyYS4wKzB4MWYxLzB4
MmUwDQo+Pj4+PiBbICA1NDguNzM3MTQyXSAgdnVubWFwX3A0ZF9yYW5nZSsweDE3ZC8weDI5
MA0KPj4+Pj4gWyAgNTQ4LjczNzE1MV0gIF9fdnVubWFwX3JhbmdlX25vZmx1c2grMHgxODIv
MHgxZDANCj4+Pj4+IFsgIDU0OC43MzcxNjFdICA/IF9yYXdfc3Bpbl91bmxvY2srMHhlLzB4
MzANCj4+Pj4+IFsgIDU0OC43MzcxNzFdICByZW1vdmVfdm1fYXJlYSsweDQwLzB4NzANCj4+
Pj4+IFsgIDU0OC43MzcxODBdICB2ZnJlZS5wYXJ0LjArMHgxYi8weDI5MA0KPj4+Pj4gWyAg
NTQ4LjczNzE4OV0gIGRlbGF5ZWRfdmZyZWVfd29yaysweDM1LzB4NTANCj4+Pj4+IFsgIDU0
OC43MzcxOThdICBwcm9jZXNzX29uZV93b3JrKzB4MThkLzB4MzgwDQo+Pj4+PiBbICA1NDgu
NzM3MjA3XSAgd29ya2VyX3RocmVhZCsweDE5Ni8weDMwMA0KPj4+Pj4gWyAgNTQ4LjczNzIx
NV0gID8gX19wZnhfd29ya2VyX3RocmVhZCsweDEwLzB4MTANCj4+Pj4+IFsgIDU0OC43Mzcy
MjRdICBrdGhyZWFkKzB4ZTMvMHgxMjANCj4+Pj4+IFsgIDU0OC43MzcyMzNdICA/IF9fcGZ4
X2t0aHJlYWQrMHgxMC8weDEwDQo+Pj4+PiBbICA1NDguNzM3MjQyXSAgcmV0X2Zyb21fZm9y
aysweDE5ZS8weDI2MA0KPj4+Pj4gWyAgNTQ4LjczNzI1MF0gID8gX19wZnhfa3RocmVhZCsw
eDEwLzB4MTANCj4+Pj4+IFsgIDU0OC43MzcyNThdICByZXRfZnJvbV9mb3JrX2FzbSsweDFh
LzB4MzANCj4+Pj4+IFsgIDU0OC43MzcyNjldICA8L1RBU0s+DQo+Pj4+PiBbICA1NDguNzM3
Mjc0XSBNb2R1bGVzIGxpbmtlZCBpbjogdmZhdCBmYXQgc25kX3NlcV9kdW1teSBzbmRfaHJ0
aW1lciBhdGg5ayBhdGg5a19jb21tb24gc25kX2hkYV9jb2RlY19pbnRlbGhkbWkgc25kX2hk
YV9jb2RlY19oZG1pIGF0aDlrX2h3IHNuZF9oZGFfY29kZWNfYWxjMjY5IHNuZF9oZGFfY29k
ZWNfcmVhbHRla19saWIgc25kX2hkYV9zY29kZWNfY29tcG9uZW50IHNuZF9oZGFfY29kZWNf
Z2VuZXJpYyBzbmRfaGRhX2ludGVsIHNuZF9oZGFfY29kZWMgbWFjODAyMTEgc25kX2hkYV9j
b3JlIHNuZF9pbnRlbF9kc3BjZmcgc25kX2ludGVsX3Nkd19hY3BpIHNuZF9od2RlcCBhdGgg
c25kX3NlcSBzbmRfc2VxX2RldmljZSBzbmRfY3RsX2xlZCBjZmc4MDIxMSBzbmRfcGNtIGF0
MjQgdGhpbmtwYWRfYWNwaSBpbnRlbF9yYXBsX21zciBpMmNfaTgwMSBzbmRfdGltZXIgc3Bh
cnNlX2tleW1hcCBpVENPX3dkdCBpbnRlbF9yYXBsX2NvbW1vbiBwbGF0Zm9ybV9wcm9maWxl
IGludGVsX3Bvd2VyY2xhbXAgaW50ZWxfcG1jX2J4dCBwY3Nwa3IgaTJjX3NtYnVzIHJma2ls
bCBsaWJhcmM0IHNuZCBzb3VuZGNvcmUgbWVpX21lIGUxMDAwZSBtZWkgam95ZGV2IGxwY19p
Y2ggbG9vcCBmdXNlIHhlbmZzIG5mbmV0bGluayB2c29ja19sb29wYmFjayB2bXdfdnNvY2tf
dmlydGlvX3RyYW5zcG9ydF9jb21tb24gdm13X3Zzb2NrX3ZtY2lfdHJhbnNwb3J0IHZzb2Nr
IHpyYW0gdm13X3ZtY2kgbHo0aGNfY29tcHJlc3MgbHo0X2NvbXByZXNzIGRtX3RoaW5fcG9v
bCBkbV9wZXJzaXN0ZW50X2RhdGEgZG1fYmlvX3ByaXNvbiBkbV9jcnlwdCBpOTE1IGkyY19h
bGdvX2JpdCBkcm1fYnVkZHkgZ2hhc2hfY2xtdWxuaV9pbnRlbCB0dG0gc2RoY2lfcGNpIGRy
bV9kaXNwbGF5X2hlbHBlciBzZGhjaV91aHMyIHNkaGNpIHZpZGVvIHhoY2lfcGNpIGNxaGNp
IHdtaSBjZWMgeGhjaV9oY2QgZWhjaV9wY2kgbW1jX2NvcmUgZWhjaV9oY2Qgc2VyaW9fcmF3
IHhlbl9hY3BpX3Byb2Nlc3NvciB4ZW5fcHJpdmNtZCB4ZW5fcGNpYmFjaw0KPj4+Pj4gWyAg
NTQ4LjczNzM0OF0gIHhlbl9ibGtiYWNrIHhlbl9nbnRhbGxvYyB4ZW5fZ250ZGV2IHhlbl9l
dnRjaG4gc2NzaV9kaF9yZGFjIHNjc2lfZGhfZW1jIHNjc2lfZGhfYWx1YSB1aW5wdXQgaTJj
X2Rldg0KPj4+Pj4gWyAgNTQ4LjczNzQ2OV0gLS0tWyBlbmQgdHJhY2UgMDAwMDAwMDAwMDAw
MDAwMCBdLS0tDQo+Pj4+Pg0KPj4+Pj4gSSBkb24ndCBoYXZlIGNsZWFyIHBhdHRlcm4gd2hl
biB0aGlzIGhhcHBlbnMsIG9uZSB3YXMgZHVyaW5nIGhvc3QNCj4+Pj4+IHN1c3BlbmQsIGJ1
dCB0aGUgb3RoZXIgd2FzIGR1cmluZyAibm9ybWFsIiB0ZXN0IHJ1biAoc3RhcnRpbmcvc3Rv
cHBpbmcNCj4+Pj4+IGRvbVVzIGFuZCBydW5uaW5nIHN0dWZmIGFyb3VuZCB0aGVtKS4gTm90
ZSBhbHNvIG9uZSBvZiB0aG9zZSBpcyBJbnRlbA0KPj4+Pj4gYW5kIHRoZSBvdGhlciBBTUQs
IHNvIGl0IGlzbid0IHJlYWxseSBoYXJkd2FyZSBzcGVjaWZpYy4NCj4+Pj4+DQo+Pj4+PiBT
bGlnaHRseSBtb3JlIGRldGFpbHMgd2l0aCBsaW5rcyAoZXNwZWNpYWxseSBzZXJpYWwwLnR4
dCBpbiB0aGUgbG9ncw0KPj4+Pj4gdGFiKSBhdA0KPj4+Pj4gaHR0cHM6Ly9naXRodWIuY29t
L1F1YmVzT1MvcXViZXMtbGludXgta2VybmVsL3B1bGwvNjYyI2lzc3VlY29tbWVudC0zOTYz
MzI2MTg4DQo+Pj4+Pg0KPj4+Pj4gQW55IGlkZWE/DQo+Pj4+Pg0KPj4+PiBUaGF0IGxvb2tz
IGxpa2UgdGhlIGlzc3VlIEp1ZXJnZW4gZml4ZWQgd2l0aDoNCj4+Pj4NCj4+Pj4gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcveGVuLWRldmVsLzIwMjYwMjIwMTIzNzE1LjgzNDg0OC0xLWpn
cm9zc0BzdXNlLmNvbS8NCj4+PiBObywgaXQgZG9lc24ndC4gVGhlIGZpeCBpcyBhbHJlYWR5
IGluIHJjMSwgYW5kIHRoZSBjcmFzaCB3YXMgcXVpdGUgZWFybHkgZHVyaW5nDQo+Pj4gYm9v
dCAoYmVmb3JlIGFueSBzZWNvbmRhcnkgQ1BVcyB3ZXJlIGJyb3VnaHQgdXApLg0KPj4+DQo+
Pj4gSSBndWVzcyB0aGlzIHByb2JsZW0gaXMgcmVsYXRlZCB0byB0aGUgbGF6eV9tbXVfc3Rh
dGUgc2VyaWVzIFsxXS4NCj4gDQo+IFRoYXQgbWF5IHdlbGwgYmUgdGhlIGNhc2UgLSBpdCBz
ZWVtcyB0aGF0IHhlbl9lbnRlcl9sYXp5X21tdSgpIGlzIGNhbGxlZA0KPiB3aGlsZSBhbHJl
YWR5IGluIGxhenkgTU1VIG1vZGUgKGZpcnN0IHNwbGF0KSwgYW5kIHhlbl9sZWF2ZV9sYXp5
X21tdSgpDQo+IGlzIGNhbGxlZCB3aXRob3V0IGJlaW5nIGluIGxhenkgTU1VIG1vZGUgKHNl
Y29uZCBzcGxhdCkuIEkgZXhwZWN0IHRoaXMNCj4gaXMgc29tZXRoaW5nIHNwZWNpZmljIHRv
IFhlbiwgd2hpY2ggSSBkaWRuJ3QgZ2V0IHRoZSBjaGFuY2UgdG8gdGVzdC4NCg0KTG9va2lu
ZyBpbnRvIHRoaXMgYWdhaW4uDQoNCkkgdGhpbmsgdGhlIG1haW4gcHJvYmxlbSBpcyB0aGUg
Y2FsbCBvZiBhcmNoX2VuZF9jb250ZXh0X3N3aXRjaCgpIGluDQpfX3N3aXRjaF90bygpLiBG
b3IgeGVuIHRoaXMgaXMgeGVuX2VuZF9jb250ZXh0X3N3aXRjaCgpIGFuZCBpdCBpcyBkb2lu
ZzoNCg0KICAgaWYgKF9fdGFza19sYXp5X21tdV9tb2RlX2FjdGl2ZShuZXh0KSkNCiAgICAg
ICBhcmNoX2VudGVyX2xhenlfbW11X21vZGUoKQ0KDQpCdXQgdGhpcyBpcyB3cm9uZyBoZXJl
LCBhcyBjdXJyZW50IGhhc24ndCBiZWVuIHN3aXRjaGVkIHRvICJuZXh0IiB5ZXQuDQoNCkkg
ZG9uJ3QgdGhpbmsgd2UgY2FuIGp1c3QgbW92ZSB0aGUgY2FsbCBvZiBhcmNoX2VuZF9jb250
ZXh0X3N3aXRjaCgpLCBhcw0KaXQgaXMgbmVlZGVkIGZvciBpc3N1aW5nIHRoZSBjb250ZXh0
IHN3aXRjaCByZWxhdGVkIGh5cGVyY2FsbCBmb3Igc3dpdGNoaW5nDQphbGwgdGhlIG5lZWRl
ZCBub24tTU1VIHNldHRpbmdzLg0KDQpXaGF0IHdlIHByb2JhYmx5IHJlYWxseSB3YW50IGlz
IHRvIGNhbGwgbGF6eV9tbXVfbW9kZV9wYXVzZSgpIGJlZm9yZSB0aGUNCmNhbGwgb2YgYXJj
aF9zdGFydF9jb250ZXh0X3N3aXRjaCgpIGFuZCBsYXRlciBjYWxsIGxhenlfbW11X21vZGVf
cmVzdW1lKCkNCmFmdGVyIHN3aXRjaGluZyBjb250ZXh0IHRvIG5leHQuIEluIHhlbl9zdGFy
dF9jb250ZXh0X3N3aXRjaCgpIGFuZA0KeGVuX2VuZF9jb250ZXh0X3N3aXRjaCgpIHRoZSBs
YXp5IG1tdSBtb2RlIGhhbmRsaW5nIHNob3VsZCBiZSByZW1vdmVkLg0KDQpJIHdpbGwgdGVz
dCB0aGF0IHRvbW9ycm93LCB1bmxlc3Mgc29tZW9uZSB0YWxrcyBtZSBvdXQgb2YgaXQuIDot
KQ0KDQoNCkp1ZXJnZW4NCg==
--------------vRt4ikbd7UcskmwRX6A7xuVX
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------vRt4ikbd7UcskmwRX6A7xuVX--

--------------iyjT3ytA0H2xpCRVpWtNa0jc--

--------------cgepJjfW9HBWFgx5WY0SpqIe
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmn8vmEFAwAAAAAACgkQsN6d1ii/Ey+g
/ggAgNTg3875H06+7k0V58WE+GqYjgAJwt0SO6LR40lNVtwQypuvR6tttwx+lL3eJgoFV7wPtvks
ksN/pPH0DFx0LGg5K9e9sOa5evvg2WuMjGK1UEwhBC/aMPZpQqdWrcXy0/U+Uh7yVIYGC3AeHy6x
P+vdxnXbFIWWwvzDw7ahN4IOBlSWrH9AqruCd+6sBygEss5/tsQi/LSEW7Dj0NlanmOu0IShtLst
doCF3PKJ2DU8GnWKB32oJEVlcvh4rfaop20bPJ2vo0P5Uf0xV9kGhARdUBDuqAbvlmXbLZdokFX6
6YRpoBsbHNESLVXi1GOkPNU3GlfVPuoqHElEtTa/Fg==
=IgHz
-----END PGP SIGNATURE-----

--------------cgepJjfW9HBWFgx5WY0SpqIe--

