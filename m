Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEaUCKMlxWkU7QQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 13:25:07 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F458335263
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 13:25:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1263896.1555694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5jlP-0000gn-8u; Thu, 26 Mar 2026 12:24:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1263896.1555694; Thu, 26 Mar 2026 12:24:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5jlP-0000eA-4x; Thu, 26 Mar 2026 12:24:39 +0000
Received: by outflank-mailman (input) for mailman id 1263896;
 Thu, 26 Mar 2026 12:24:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1w5jlN-0000dy-MF
 for xen-devel@lists.xen.org; Thu, 26 Mar 2026 12:24:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5jlN-004HuI-1x
 for xen-devel@lists.xen.org; Thu, 26 Mar 2026 13:24:37 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 69c52581-2eae-0a2a0a5409dd-0a2a450cd252-30
 for <xen-devel@lists.xen.org>; Thu, 26 Mar 2026 13:24:36 +0100
Received: from [209.85.208.44] (helo=mail-ed1-f44.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jgross@suse.com>)
 id 69c52584-f93d-0a2a450c0019-d155d02cb850-3
 for <xen-devel@lists.xen.org>; Thu, 26 Mar 2026 13:24:36 +0100
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-661cfb9f3aaso1283458a12.2
 for <xen-devel@lists.xen.org>; Thu, 26 Mar 2026 05:24:36 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9b20218741sm111025866b.1.2026.03.26.05.24.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Mar 2026 05:24:35 -0700 (PDT)
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
        d=suse.com; s=google; t=1774527876; x=1775132676; darn=lists.xen.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BjiVae1OUkiC7qr8+WSQzejecCRmB09E/ef3t348aHc=;
        b=YXk7+PPw02YvvA+qLePIed3855mUaWTOyCZnw/DOPJHyTtTIJGbOybKR9o1cBAM0DE
         R7kRctvMN0HwIgInMexFwnyWAqvDJiQsD/IxEF0bnkOS0hXh5C9KoqaT/4SCpPapExJP
         Me6Uub3Xhkha30GhdYWWpwXsqqDyPwIJjcRmAXx19rjOgMIoeaeDvys6gfI1h8xmK95K
         YZAt+mmv+/yfHGWAI5peKjbvAe1S1IDQl0WYc19IGqUVL41rHPjFa1vnhaECo9qB124Y
         Tji2xRU89ezFlpx2j12f4+wh4sFjZAUM2PmlpIOW3iYAlSVhfifFdsanNs/efpgA5M88
         n80g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774527876; x=1775132676;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BjiVae1OUkiC7qr8+WSQzejecCRmB09E/ef3t348aHc=;
        b=UCZeE42UKItdmKbWnyVdTgLCgJqn9/tidpcxY7LlZAEhspgfsfnRRyNFNYBuTget2b
         hcpd10TsqUYxIx6r/uLuRKvvCrd6Epj0+bdf3kT0Wp9QavY/SFFEtNaqul0PEo7/GfDI
         tHE7jFVQijYVMtijxDWmFskXAACi7O93/FStuE+wMzregAjYyh6jBm/Xp03oj26IXhW1
         Czot2et8+W6xHdCT8X/fAGuxUb/tf/seqU1N3G3Up1XJLi0fNyeIn6MaEyogIJ44Zs6k
         9xywxIlLh0/8p9GdLAGKQjTjmxqicnZYYNjm5oSKpHKo/sL5+5fEI4t1I0akvf5U6ZUa
         VJ3A==
X-Gm-Message-State: AOJu0YxKCVRaw0ss4JwyllPnC5Z6GNF7GcErmIs99etyqPiNt8XrkBeg
	nvyzEzwJQHKt8c7yF4JVZuKdR9gU80kGE9/4EeD9cpoweAYRhjdsvxKUZqgD2+EyjSw=
X-Gm-Gg: ATEYQzypurFD5ArY9tDp77kBip3lIt7PuPTi+2SZPsqHQuOb0QkTI4p4cTbsRVBaqMG
	l9Mjf1ryOAk1BULLPLjikCt9zrhdr2UAc2WKhS0i//UVhXB2VDectGEc9lH2K4B7QvbBKkvoMnM
	w6eWV2Vy3YtlBsxYajG0ESD9yWSywp8NsRqQFMDEOCkV5kz3NxUPwniVE3bHLII6h8L7PBCgZAc
	lX87HegADECm2ZxyCQhr9YBAq9iP+SmjHjt4B78WT4EqdCNattcesxYOW1/2UfniX1hwHKw4bqd
	Ew9tMxFzwIl9ooG5sTy+mElpgNEPMj0pN6B7m8fpDBr48Gsyy0E2efmus13f2MDFnKvSK1vkDC0
	ORp2+PE9yVwZ612GLJps8d4+K/OEw0oW+jvDBqHQl/O68jkHfT1p+dwoyXoDxWAXSkF8Fknx1wC
	JjErQbgIscDBUg8PgXL0DbQ+MGUGmvbcHRGR+X/y/ppiPSY0jCmw7jRZsBu/w5Zrw3xojroVEqM
	KkBKlmrts1ampuIjdCA/LUGCLM7QBCllMBH1wZCfw/96Aq8+IN83A==
X-Received: by 2002:a17:907:e0d8:b0:b97:f12a:3f8c with SMTP id a640c23a62f3a-b9a3f17f152mr307406766b.20.1774527876090;
        Thu, 26 Mar 2026 05:24:36 -0700 (PDT)
Message-ID: <a8d5f53c-ad38-4439-9dc6-930519db9c0b@suse.com>
Date: Thu, 26 Mar 2026 13:24:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oss-security] Xen Security Advisory 482 v2 - Linux privcmd
 driver can circumvent kernel lockdown
To: Greg KH <greg@kroah.com>, oss-security@lists.openwall.com
Cc: xen-devel@lists.xen.org, xen-users@lists.xen.org,
 "Xen.org security team" <security-team-members@xen.org>
References: <E1w50W0-00Bwo0-1i@xenbits.xenproject.org>
 <2026032453-departed-thrash-f153@gregkh>
 <2026032405-faculty-agony-2599@gregkh>
Content-Language: en-US
From: Juergen Gross <jgross@suse.com>
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
In-Reply-To: <2026032405-faculty-agony-2599@gregkh>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------nw8gdKChhgJqVH12D0LHtpD0"
X-purgate-ID: tlsNG-d25034/1774527876-6ECAA734-CE37728C/0/0
X-purgate-type: clean
X-purgate-size: 8271
X-Spamd-Result: default: False [-2.08 / 15.00];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	MAILLIST(-0.18)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FORGED_RECIPIENTS(0.00)[m:greg@kroah.com,m:oss-security@lists.openwall.com,m:xen-devel@lists.xen.org,m:xen-users@lists.xen.org,m:security-team-members@xen.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xen.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 5F458335263
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------nw8gdKChhgJqVH12D0LHtpD0
Content-Type: multipart/mixed; boundary="------------KP00Cr08CaoLPpzGlMsnkBLb";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Greg KH <greg@kroah.com>, oss-security@lists.openwall.com
Cc: xen-devel@lists.xen.org, xen-users@lists.xen.org,
 "Xen.org security team" <security-team-members@xen.org>
Message-ID: <a8d5f53c-ad38-4439-9dc6-930519db9c0b@suse.com>
Subject: Re: [oss-security] Xen Security Advisory 482 v2 - Linux privcmd
 driver can circumvent kernel lockdown
References: <E1w50W0-00Bwo0-1i@xenbits.xenproject.org>
 <2026032453-departed-thrash-f153@gregkh>
 <2026032405-faculty-agony-2599@gregkh>
In-Reply-To: <2026032405-faculty-agony-2599@gregkh>

--------------KP00Cr08CaoLPpzGlMsnkBLb
Content-Type: multipart/mixed; boundary="------------PP8RneE0SuDwvL0vSRYinmq3"

--------------PP8RneE0SuDwvL0vSRYinmq3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgR3JlZywNCg0KT24gMjQuMDMuMjYgMTM6MzEsIEdyZWcgS0ggd3JvdGU6DQo+IE9uIFR1
ZSwgTWFyIDI0LCAyMDI2IGF0IDAxOjE2OjA4UE0gKzAxMDAsIEdyZWcgS0ggd3JvdGU6DQo+
PiBPbiBUdWUsIE1hciAyNCwgMjAyNiBhdCAxMjowNTo0NFBNICswMDAwLCBYZW4ub3JnIHNl
Y3VyaXR5IHRlYW0gd3JvdGU6DQo+Pj4gLS0tLS1CRUdJTiBQR1AgU0lHTkVEIE1FU1NBR0Ut
LS0tLQ0KPj4+IEhhc2g6IFNIQTI1Ng0KPj4+DQo+Pj4gICAgICAgICAgICAgICAgICAgICAg
WGVuIFNlY3VyaXR5IEFkdmlzb3J5IFhTQS00ODINCj4+PiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdmVyc2lvbiAyDQo+Pj4NCj4+PiAgICAgICAgICAgIExpbnV4IHByaXZj
bWQgZHJpdmVyIGNhbiBjaXJjdW12ZW50IGtlcm5lbCBsb2NrZG93bg0KPj4+DQo+Pj4gVVBE
QVRFUyBJTiBWRVJTSU9OIDINCj4+PiA9PT09PT09PT09PT09PT09PT09PQ0KPj4+DQo+Pj4g
UHVibGljIHJlbGVhc2UuDQo+Pj4NCj4+PiBJU1NVRSBERVNDUklQVElPTg0KPj4+ID09PT09
PT09PT09PT09PT09DQo+Pj4NCj4+PiBUaGUgTGludXgga2VybmVsJ3MgcHJpdmNtZCBkcml2
ZXIgY2FuIGJlIGFidXNlZCB0byBjaXJjdW12ZW50IGtlcm5lbA0KPj4+IGxvY2tkb3duIChz
ZWN1cmUgYm9vdCksIGUuZy4gYnkgbW9kaWZ5aW5nIHBhZ2UgdGFibGVzIHRvIGVuYWJsZSB1
c2VyDQo+Pj4gbW9kZSB0byBtb2RpZnkga2VybmVsIG1lbW9yeS4NCj4+Pg0KPj4+IFRoZSBD
TkEgY292ZXJpbmcgTGludXggaGFzIHJlZnVzZWQgdG8gYXNzaWduIGEgQ1ZFIGF0IHRoaXMg
anVuY3R1cmUuDQo+Pg0KPj4gVGhpcyBpcyBub3cgYXNzaWduZWQgdG8gQ1ZFLTIwMjYtMzE3
ODgNCj4gDQo+IEFuZCwgdG8gYmUgbW9yZSBjbGVhciwgdGhlIGtlcm5lbCBDTkEgc2hvdWxk
IGhhdmUgZ2l2ZW4geW91IGEgQ1ZFDQo+IGVhcmxpZXIsIHNvcnJ5IGFib3V0IHRoYXQsIHRo
YXQgd2FzIG15IGZhdWx0LiAgV2UgaGFkIGJlZW4gImJ1cm5lZCIgYnkNCj4gb3RoZXIgZ3Jv
dXBzL2NvbXBhbmllcyBhc2tpbmcgZm9yIENWRXMgImFoZWFkIG9mIHRpbWUiIGZvciBMaW51
eCBmb3INCj4gdGhpbmdzIHRoYXQgdHVybmVkIG91dCB0byBiZSB3cm9uZyBvciBub3QgbmVl
ZGluZyBhIENWRSBhdCBhbGwgYXQgdGhlDQo+IHNhbWUgdGltZSB5b3UgYWxsIGFza2VkIGZv
ciBvbmUsIHNvIEkgcmVhY3RlZCBtdWNoIGhhcnNoZXIgaGVyZSB0aGFuIHlvdQ0KPiBhbGwg
ZGVzZXJ2ZWQgYnkgc2F5aW5nIHdlIHdvdWxkIGFzc2lnbiBvbmUgb25jZSB0aGUgaXNzdWUg
d2FzIHB1YmxpYy4gIEkNCj4gc2hvdWxkIGhhdmUgdHJ1c3RlZCB5b3UgYXMgb2J2aW91c2x5
IHlvdSBrbm93IHdoYXQgeW91IGFyZSBkb2luZyBoZXJlDQo+IGFuZCBzaG91bGQgaGF2ZSBn
b3R0ZW4gYSBDVkUgZm9yIHlvdXIgYWNjb3VudGluZyBlYXJsaWVyLg0KPiANCj4gQWdhaW4s
IG15IGZhdWx0LCBzb3JyeSBhYm91dCB0aGF0LCBpZiB5b3UgYWxsIG5lZWQgb25lIGluIHRo
ZSBmdXR1cmUgZm9yDQo+IGFueSBpc3N1ZSwgd2Ugd2lsbCBhc3NpZ24gaXQgYWhlYWQgb2Yg
dGltZS4NCg0KVGhhbmtzIGZvciB0aGUgbm90aWNlLg0KDQpTdWNoIHRoaW5ncyBoYXBwZW4g
YXMgbm9ib2R5IGlzIHBlcmZlY3QuDQoNClN0YXkgdHVuZWQgZm9yIGZ1dHVyZSBDVkUgcmVx
dWVzdHMuIDotKQ0KDQoNCkp1ZXJnZW4NCg==
--------------PP8RneE0SuDwvL0vSRYinmq3
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjri
oyspZKOBycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2
kaV2KL9650I1SJvedYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i
1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/B
BLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xqG7/377qptDmrk42GlSK
N4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR3Jvc3Mg
PGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsE
FgIDAQIeAQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4F
UGNQH2lvWAUy+dnyThpwdtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3Tye
vpB0CA3dbBQp0OW0fgCetToGIQrg0MbD1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u
+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbvoPHZ8SlM4KWm8rG+lIkGurq
qu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v5QL+qHI3EIP
tyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJ
CAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4
RF7HoZhPVPogNVbC4YA6lW7DrWf0teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz7
8X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC/nuAFVGy+67q2DH8As3KPu0344T
BDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0LhITTd9jLzdDad1pQ
SToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLmXBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkM
nQfvUewRz80hSnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMB
AgAjBQJTjHDXAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/
Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJnFOXgMLdBQgBlVPO3/D9R8LtF9DBAFPN
hlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1jnDkfJZr6jrbjgyoZHi
w/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0N51N5Jf
VRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwP
OoE+lotufe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK
/1xMI3/+8jbO0tsn1tqSEUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuZGU+wsB5BBMBAgAjBQJTjHDrAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgEC
F4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3g3OZUEBmDHVVbqMtzwlmNC4
k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5dM7wRqzgJpJ
wK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu
5D+jLRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzB
TNh30FVKK1EvmV2xAKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37Io
N1EblHI//x/e2AaIHpzK5h88NEawQsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6
AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpWnHIs98ndPUDpnoxWQugJ6MpMncr
0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZRwgnBC5mVM6JjQ5x
Dk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNVbVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mm
we0icXKLkpEdIXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0I
v3OOImwTEe4co3c1mwARAQABwsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMv
Q/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEwTbe8YFsw2V/Buv6Z4Mysln3nQK5ZadD
534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1vJzQ1fOU8lYFpZXTXIH
b+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8VGiwXvT
yJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqc
suylWsviuGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5B
jR/i1DG86lem3iBDXzXsZDn8R3/CwO0EGAEIACAWIQSFEmdy6PYElKXQl/ew3p3W
KL8TLwUCWt3w0AIbAgCBCRCw3p3WKL8TL3YgBBkWCAAdFiEEUy2wekH2OPMeOLge
gFxhu0/YY74FAlrd8NAACgkQgFxhu0/YY75NiwD/fQf/RXpyv9ZX4n8UJrKDq422
bcwkujisT6jix2mOOwYBAKiip9+mAD6W5NPXdhk1XraECcIspcf2ff5kCAlG0DIN
aTUH/RIwNWzXDG58yQoLdD/UPcFgi8GWtNUp0Fhc/GeBxGipXYnvuWxwS+Qs1Qay
7/Nbal/v4/eZZaWs8wl2VtrHTS96/IF6q2o0qMey0dq2AxnZbQIULiEndgR625EF
RFg+IbO4ldSkB3trsF2ypYLij4ZObm2casLIP7iB8NKmQ5PndL8Y07TtiQ+Sb/wn
g4GgV+BJoKdDWLPCAlCMilwbZ88Ijb+HF/aipc9hsqvW/hnXC2GajJSAY3Qs9Mib
4Hm91jzbAjmp7243pQ4bJMfYHemFFBRaoLC7ayqQjcsttN2ufINlqLFPZPR/i3IX
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------PP8RneE0SuDwvL0vSRYinmq3--

--------------KP00Cr08CaoLPpzGlMsnkBLb--

--------------nw8gdKChhgJqVH12D0LHtpD0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmnFJYMFAwAAAAAACgkQsN6d1ii/Ey/D
nQf/frf7lOqSmDBJXfXZ/2DO0ZGv6qn75PPVjrd9AQfEKvdy6l6uxLXb2IPKSAvpb3aZZvb/7ZI4
2c2aYM0KHLHgiZDakcqS45/5+V28yunp0hH7anGj/VJ2c9abvo4AJ9kFxkeRBi08LSNGTIcS0Wyd
18nkgzWuUN5djvS3Ou5anij2ozbpSVLWfYCY6KfUPuux+v58VF3HbxVfwCJujdxtgMbABGvE4YWe
R1LitIOk4WZS6TAyVBrLVZlDQ6fsvxaUs7zBt5O3iTattGbM5RNx3SiM5lyt23bRGIGAGv566C43
jJUvW97uZJMX9K3fH2axA+EXm3nGMYR/UTnHFqn83Q==
=F6F6
-----END PGP SIGNATURE-----

--------------nw8gdKChhgJqVH12D0LHtpD0--

