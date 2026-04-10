Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GZqG27p2GnjjggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 14:13:34 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F943D68EB
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 14:13:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1278906.1563616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBAjb-0008WK-5R; Fri, 10 Apr 2026 12:13:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1278906.1563616; Fri, 10 Apr 2026 12:13:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBAjb-0008TH-2j; Fri, 10 Apr 2026 12:13:15 +0000
Received: by outflank-mailman (input) for mailman id 1278906;
 Fri, 10 Apr 2026 12:13:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wBAjZ-0008TB-03
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 12:13:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wBAjX-00ESEO-SX
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 14:13:11 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 69d8e947-e002-0a2a0a5209dd-0a2a450ccd32-46
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 14:13:11 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jgross@suse.com>)
 id 69d8e957-f40c-0a2a450c0019-d1558029c83d-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 14:13:11 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-48897fd88ebso20696625e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 05:13:11 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d63e4f16bsm7307472f8f.26.2026.04.10.05.13.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Apr 2026 05:13:10 -0700 (PDT)
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
        d=suse.com; s=google; t=1775823191; x=1776427991; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0d5KItz2ChuFB/9GspKfpdCSyWT5Ki/8pR02ulKHQHg=;
        b=dLGulLz6K5AHEiuYX0HWJP3LcqKkLMs+s6C5EOKHx2G5/VbeaM8o8sv78coFS6iG4v
         YEY8XBtWX1I2WbeCB7SPqcoKHj/o8h7wd+g60zlVPWGVYbQzVz7aMiK2ellbNI8a+CiJ
         LLcm20p9iL/U+0oIALvB40pP0rp9tijY7/oOMiAYPyH86cTQYR+oG3yEeUZZPFB9gear
         pfEoQW8EDSyqO8WKfLwq95lI3KHsIRKjqYMu4MpwECe9NsEWcjTQY3ZWoo5o1zFLHSuo
         CCJlFIweJX30vAJu37Woe9OlTRQ1zOTUQ0gSa8PzGaUPRUS/uWDuEHiGuOMH2cfTS9BN
         LtNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775823191; x=1776427991;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0d5KItz2ChuFB/9GspKfpdCSyWT5Ki/8pR02ulKHQHg=;
        b=rbvMGWdLiaGsbeOLiHegKHbNj0U6o3LNYK/PGiqqZnGGZZEizCQbMgZvxiJs/OdF2R
         s7noNCEwLjRArhsYSt92haO4NgUxWL/JHwhd8yFiQHy8HHCHZFr9HSni2sFE8PaM/lXG
         Pqzx5Z/OwjZY28wDPrMW+OIgL9ZOWcLoT2XGGrnTDtb9GS3bMscdYa4IYTDFPl/dHoEn
         o9QNI+lwSfq9ckzoDQWHtYt35sOVoCsDFy0uZ/+CpdqPKcfT/zhFtMWJzGSrLp9nRuYx
         IJRamc9gkkjaicz6YRuO88WI3IaLCBYFqtHCX8wrms9xjbaegw/4RPcQqt+JmtqFytSR
         9EmA==
X-Forwarded-Encrypted: i=1; AJvYcCUYiNXI5iVtX9J4F72IYKWXCYsQKSug9tL4Mlz8F0pWEWZNiXk0ynQBM3exEVFal/EnGcQ4uamzWso=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yww37S1EmlRiXPa5bDBOCRlehLRp5RFy7OddfYnwDL1nsWgT5tY
	SzxYvdAYlrMQmUBdVy7gD2Z/7bIzn+6/FMdmhR0e54GJweZLOGezUBQhSM+Bm2PdedM=
X-Gm-Gg: AeBDievJGwYUrP7vBOoxmd72YNraAXjwCiMYlaEaq2+DVSTTCdYWx8N4ppiP5L6PAbg
	mlxlE7jGFQEmYx/LBzmnJbyAIi/dOCjd+SdNueOsNTID14dKvLrn3m/O0rKvE5rpF28rH9V9x8C
	InsNMcV1B/Y3G3uCNVKi4CpI+voHOiz4RGyQnV819za7bSGMDIzVH3k37lnhS4TiYhxbbBIW3QA
	YWsGwA59a8Bd3h9qlqrGZHBI76SPSXpB6VxFzdjkInpvyZ57B+sBdHXR4/FUy+hosLaNYt47HKI
	lnja9BwmPGNsDk2mzPPK2ptVYNHJTklMmv+l2w8edFooMB9i80ZFV5ps7tMZVkT6Fwc0FXg29pr
	o5BBIlsm/A51cp3Z9STIKe+SbpIy3yFKxCJ9qqMjpJE8wMH0eMnwo2h2eiOx/5HAhBctnIGh5Ch
	qqmkqvDWD6G0SSsj79p5vuyg01x0NreST3n+zsSX1wFvF3WcFy9tizXH847UBsuesDeccM6VGy1
	K9xWkgs450a2EYP/nHuE1FSEQqd0INMeR/t49RQz0VIMMwvIXKrOA==
X-Received: by 2002:a05:600c:4ecf:b0:486:fd5c:2b35 with SMTP id 5b1f17b1804b1-488d68685aemr37433695e9.13.1775823191098;
        Fri, 10 Apr 2026 05:13:11 -0700 (PDT)
Message-ID: <fd394d84-4d8c-4fe2-9e51-58041dc09c69@suse.com>
Date: Fri, 10 Apr 2026 14:13:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/sched: rtds: re-arm repl_timer after timer
 re-initialization
To: Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 Meng Xu <mengxu@cis.upenn.edu>
References: <548ea03cc3c3287b1f5dcd101b3c2990ebc08089.1775208527.git.oleksii_moisieiev@epam.com>
 <775bc23d-7cd4-43b4-9e5f-0c70204b4262@suse.com>
 <66b7eaff-f7b9-4737-b32b-ca9ff7b661c1@epam.com>
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
In-Reply-To: <66b7eaff-f7b9-4737-b32b-ca9ff7b661c1@epam.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------oOBVY0dnOumlxyRICmN3vfQ0"
X-purgate-ID: tlsNG-d25034/1775823191-A4640A3D-4D2CCA4E/0/0
X-purgate-type: clean
X-purgate-size: 8048
X-Spamd-Result: default: False [-3.08 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	MAILLIST(-0.18)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii_moisieiev@epam.com,m:xen-devel@lists.xenproject.org,m:dfaggioli@suse.com,m:gwd@xenproject.org,m:mengxu@cis.upenn.edu,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	HAS_ATTACHMENT(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B9F943D68EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------oOBVY0dnOumlxyRICmN3vfQ0
Content-Type: multipart/mixed; boundary="------------qFia0Z1GqqoxE2WDrzl2PEa3";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 Meng Xu <mengxu@cis.upenn.edu>
Message-ID: <fd394d84-4d8c-4fe2-9e51-58041dc09c69@suse.com>
Subject: Re: [PATCH v2] xen/sched: rtds: re-arm repl_timer after timer
 re-initialization
References: <548ea03cc3c3287b1f5dcd101b3c2990ebc08089.1775208527.git.oleksii_moisieiev@epam.com>
 <775bc23d-7cd4-43b4-9e5f-0c70204b4262@suse.com>
 <66b7eaff-f7b9-4737-b32b-ca9ff7b661c1@epam.com>
In-Reply-To: <66b7eaff-f7b9-4737-b32b-ca9ff7b661c1@epam.com>

--------------qFia0Z1GqqoxE2WDrzl2PEa3
Content-Type: multipart/mixed; boundary="------------YauiT380SO0Jc2HEyVml0zTU"

--------------YauiT380SO0Jc2HEyVml0zTU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAuMDQuMjYgMTQ6MDQsIE9sZWtzaWkgTW9pc2llaWV2IHdyb3RlOg0KPiBIaSBKdWVy
Z2VuLA0KPiANCj4gRHVyaW5nIG91ciBzYWZldHkgY2VydGlmaWNhdGlvbiBhbmFseXNpcyB3
b3JrLCB3ZSBpZGVudGlmaWVkIHRoaXMgYXMgYSBwb3RlbnRpYWwNCj4gaXNzdWUuIFdoaWxl
IHdlIGhhdmVuJ3QgZW5jb3VudGVyZWQgdGhpcyBwcm9ibGVtIGluIHByYWN0aWNlIHlldCwg
aXQgY291bGQgb2NjdXINCj4gaW4gdGhlIGZ1dHVyZSwgc28gSSBiZWxpZXZlIGl0IHNob3Vs
ZCBiZSBhZGRyZXNzZWQgcHJvYWN0aXZlbHkuDQoNCkZvciBiZWluZyBhYmxlIHRvIG9jY3Vy
IGluIGZ1dHVyZSwgdGhlIGhhbmRsaW5nIG9mIHJlbW92aW5nIGEgY3B1IGZyb20gYQ0KY3B1
cG9vbCB3b3VsZCBuZWVkIHRvIGJlIGNoYW5nZWQuIENvbnNpZGVyaW5nIHRoZSByZWZ1c2Fs
IHRvIHJlbW92ZSB0aGUNCmxhc3QgY3B1IGZyb20gYSBwb3B1bGF0ZWQgY3B1cG9vbCBpcyBv
biBwdXJwb3NlICh0aGlzIGF2b2lkcyBsZWF2aW5nIGENCmRvbWFpbiB3aXRob3V0IGFueSBj
cHUgdG8gcnVuIG9uKSwgYWRkaW5nIHRoZSBjb2RlIGFzIHlvdSBzdWdnZXN0IHdvdWxkDQpq
dXN0IGJlIGFuIGFkZGl0aW9uIHdpdGhvdXQgYW55IGJlbmVmaXQuDQoNCkl0IGlzbid0IGRv
aW5nIGFueSBoYXJtIChvdGhlciB0aGFuIGFkZGluZyBjb2RlIHdpdGhvdXQgcHVycG9zZSks
IHNvIEkNCndvbid0IGV4cGxpY2l0bHkgTkFLIHRoZSBwYXRjaCwgYnV0IEkgd29uJ3QgQWNr
IGl0IGVpdGhlci4NCg0KDQpKdWVyZ2VuDQoNCj4gLS0gDQo+IE9sZWtzaWkuDQo+IA0KPiAN
Cj4gT24gMTAvMDQvMjAyNiAxMzoxNCwgSsO8cmdlbiBHcm/DnyB3cm90ZToNCj4+IE9uIDAz
LjA0LjI2IDExOjI5LCBPbGVrc2lpIE1vaXNpZWlldiB3cm90ZToNCj4+PiBJbiBSVERTLCBy
ZW1vdmluZyB0aGUgbGFzdCBlbGlnaWJsZSBwQ1BVIGNhbiBraWxsIHJlcGxfdGltZXIuDQo+
Pj4gV2hlbiBhIHBDUFUgaXMgbGF0ZXIgcmUtYWRkZWQsIHJ0X3N3aXRjaF9zY2hlZCgpIHJl
aW5pdGlhbGl6ZXMgdGhlDQo+Pj4gdGltZXIgb2JqZWN0LCBidXQgcGVuZGluZyBlbnRyaWVz
IG1heSBhbHJlYWR5IGV4aXN0IGluIHJlcGxxLg0KPj4NCj4+IERpZCB5b3UgZXhwZXJpZW5j
ZSB0aGlzIGJlaGF2aW9yPw0KPj4NCj4+IEknbSBhc2tpbmcgYmVjYXVzZSBJIGRvbid0IHNl
ZSBob3cgdGhpcyBjb3VsZCBoYXBwZW4uIEEgQ1BVIGNhbid0IGJlDQo+PiByZW1vdmVkIGZy
b20gYSBjcHVwb29sIGFzIGxvbmcgYXMgdGhlcmUgYXJlIGRvbWFpbnMgaW4gdGhhdCBjcHVw
b29sLg0KPj4gU28gaG93IHdvdWxkIHJlcGxxIGNvbnRhaW4gZW50cmllcyBhZnRlciB0aGUg
bGFzdCBDUFUgb2YgdGhlIGNwdXBvb2wNCj4+IGhhcyBiZWVuIHJlbW92ZWQ/DQo+Pg0KPj4g
QnV0IG1heWJlIEknbSBtaXNzaW5nIHNvbWV0aGluZy4NCj4+DQo+Pg0KPj4gSnVlcmdlbg0K
PiANCg0K
--------------YauiT380SO0Jc2HEyVml0zTU
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------YauiT380SO0Jc2HEyVml0zTU--

--------------qFia0Z1GqqoxE2WDrzl2PEa3--

--------------oOBVY0dnOumlxyRICmN3vfQ0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmnY6VUFAwAAAAAACgkQsN6d1ii/Ey8C
Fwf+L0suD6CkYxthgsj8KkkncnRuNlZ0ZmpoH0d3wNXsuzK3ntE/QeNQHdCVoKWYdRnFlGA0Rpft
KsTAzgq/257JEklcCptwQHqELdUnKKwY3CluwUhVGDpUfd/MPITW8Wxp4rqlw8UJ4EyaVITusUKJ
9j9iSHaRpvdixkmV5PyhqgggiYslLteRwraCp/MIAVZPMJyRv+x5IrrygqOO+mTb+u2Kidw/tpIE
CgladuFzhC3joDGjF3ejnGKdUZhVw45W4uAm+dJ9wfsIAqlBlvpiJS4Yvj1RgJqlL+6nBmJ2/ZEz
mS22q7iC5ezWdZ1w8mC/iCdiLj8giwxOjue4FlsBcA==
=3lB/
-----END PGP SIGNATURE-----

--------------oOBVY0dnOumlxyRICmN3vfQ0--

