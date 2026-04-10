Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id VjgaOU/q2GkFjwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 14:17:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD483D6930
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 14:17:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1278915.1563625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBAnF-0000cG-Kl; Fri, 10 Apr 2026 12:17:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1278915.1563625; Fri, 10 Apr 2026 12:17:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBAnF-0000ao-H7; Fri, 10 Apr 2026 12:17:01 +0000
Received: by outflank-mailman (input) for mailman id 1278915;
 Fri, 10 Apr 2026 12:17:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wBAnE-0000ai-Ct
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 12:17:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wBAnD-00C7US-LW
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 14:16:59 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 69d8ea23-2eae-0a2a0a5409dd-0a2a4504dc34-20
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 14:16:59 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jgross@suse.com>)
 id 69d8ea3b-bb33-0a2a45040019-d1558035a5d2-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 14:16:59 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-488b8efed61so17452625e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 05:16:59 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d5d703c1sm20103575e9.3.2026.04.10.05.16.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Apr 2026 05:16:58 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775823419; x=1776428219; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:content-language:references:cc:to:from
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aCMFp9kJZGr5E1G1db+BUMp1vc9Tyu1uYxu2ET9lk5w=;
        b=E6aUAYWQ5i4K+snbgDkJkfcPmxUMgDKXKxXqAi/PmCpLcheTUWopM4xKNtvm+WV4Ry
         zFQ4Nwme4zpRL+0GcG1XZ1cKO+4ufwkeaA90NvoRGDFGlv7FsnSbgigT7I8vHk9bUBhx
         tL3r1+WCCOJeKkpCpeu70iCdcKlR+h63gUirYabHtelsmoRqGmXKvyhrUOqqrw1K5sq1
         vxIWDqtjCzBCUPSaY+EB9lG39HU0cx7OI5vIwZNMTCgMn37ufwpN9eQV+W53gqBJQ+Ms
         /S3SRgpz7XfedJGwjsqIMfpi90SiLdINOuYJT9xhknuHIdYBR9eRiHfjIkUndddjnDm4
         qjSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775823419; x=1776428219;
        h=in-reply-to:autocrypt:content-language:references:cc:to:from
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aCMFp9kJZGr5E1G1db+BUMp1vc9Tyu1uYxu2ET9lk5w=;
        b=EKvLnC5aLkvIkrDmz+375kTMsZroprNSmynqezr/S1GPnK2SF18uVeaWyiP5SbshW1
         oN4eT5mWHU0uHhqnfulpeOCpMUSqAQFiIoPiCLAx1/h+veZYfeVQpqMqEfxtNHvZWw6K
         MPWR55vbnU6k9O+SUEpzLpzTZR2Bz3CkmGFy/k8PzhteQ13UlTzhaDOiDzj/ARtVyjUr
         mzD/atJ2ARnh7HgHlli6CP7uDnBe276wyJM/i5SB+q3W4OeC6apihjefbpeBUg9yC6+O
         My1NShtSHmZHpjt4aaovfz8bIJJw8Gwrjxrcj6OIkcZCfe4/Zn3T0wQjTEebMmzhvUA3
         24Cg==
X-Forwarded-Encrypted: i=1; AJvYcCXBTlaPGz6zHGMKKT1kWbk1wNENt/fXNHxDWxxvHlhHtA1A0h4YKsBVY6Mmz41iBYnLmnPylo3pioU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwWfNbbqv3l3YlT+80h2r6DRSRRN/ybNG0p44T8n2eGz5dRaiQk
	775ckNzmDpS7CJ0mCe3vRk691LRZp6kjh7NnKSTpe/5oxotEEBYSjviO8jP0pQ7JQYw=
X-Gm-Gg: AeBDievkUn7SFsPEEnadRronfqjWUOSjQv9uzdOPHivLSno6mWfYMkgSXtLUWFT9afS
	u9RCI7JNCBBLVAPsWaGgpyWTjF7jt+clfCEENtfEZCXYG02unLhJXbGeTeNiH2gzE/PESjeltAa
	7K5vYFiGPU+TuO2jtGmDt2z7Ai032ZpNjFHJVt2WKVvQ894Y/v+Wo6U0jNt+yTMoCS09yNu/Yup
	WlOkKVNAYid1cCEbofeoV4c3Zroa/XhcHMJ4mvElIRr32Wk9DWnaGQqQ5ff+8jy95AYntsN7HC+
	H7+Rwn+aFemPKz5NQ0uuyfMsbqG8aDViEIsmflhege55ncjcqAUUaVT1rrl42U3qCZA6u4VCqUg
	HKTU+J6bUexM/SmHHWsblFwqdqAMaKf92jmBUw9a/YjqXKes/HvvM1kQoXfy6z4NyMPdXIgM+xZ
	h94wrd8VJ/YAaVIXJLjuaAMQWtmD++JlOmwLFPiO2WRqFg1x2G7RBisM+yh8dx/rX6b/do3Zb/2
	HJkxSFKw9fZUDAVy8OckbB2arzLqRYX4QIQScq43QUdZ29QZAepkqnmEHXcrqzz
X-Received: by 2002:a05:600c:3ba4:b0:488:c6e9:1e0c with SMTP id 5b1f17b1804b1-488d6847de9mr33908025e9.5.1775823418870;
        Fri, 10 Apr 2026 05:16:58 -0700 (PDT)
Message-ID: <ff983469-db32-46fb-a18a-aed3cda06209@suse.com>
Date: Fri, 10 Apr 2026 14:16:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/sched: rtds: re-arm repl_timer after timer
 re-initialization
From: Juergen Gross <jgross@suse.com>
To: Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 Meng Xu <mengxu@cis.upenn.edu>
References: <548ea03cc3c3287b1f5dcd101b3c2990ebc08089.1775208527.git.oleksii_moisieiev@epam.com>
 <775bc23d-7cd4-43b4-9e5f-0c70204b4262@suse.com>
 <66b7eaff-f7b9-4737-b32b-ca9ff7b661c1@epam.com>
 <fd394d84-4d8c-4fe2-9e51-58041dc09c69@suse.com>
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
In-Reply-To: <fd394d84-4d8c-4fe2-9e51-58041dc09c69@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------BJDxGHZT2PMW2qJEFLxj80q0"
X-purgate-ID: tlsNG-ebf023/1775823419-B373251B-3DD85F4B/0/0
X-purgate-type: clean
X-purgate-size: 7428
X-Spamd-Result: default: False [-2.08 / 15.00];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	MAILLIST(-0.18)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FORGED_RECIPIENTS(0.00)[m:oleksii_moisieiev@epam.com,m:xen-devel@lists.xenproject.org,m:dfaggioli@suse.com,m:gwd@xenproject.org,m:mengxu@cis.upenn.edu,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
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
X-Rspamd-Queue-Id: 4CD483D6930
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------BJDxGHZT2PMW2qJEFLxj80q0
Content-Type: multipart/mixed; boundary="------------AdfA8aaavdJNlhEHAj0xcyaI";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 Meng Xu <mengxu@cis.upenn.edu>
Message-ID: <ff983469-db32-46fb-a18a-aed3cda06209@suse.com>
Subject: Re: [PATCH v2] xen/sched: rtds: re-arm repl_timer after timer
 re-initialization
References: <548ea03cc3c3287b1f5dcd101b3c2990ebc08089.1775208527.git.oleksii_moisieiev@epam.com>
 <775bc23d-7cd4-43b4-9e5f-0c70204b4262@suse.com>
 <66b7eaff-f7b9-4737-b32b-ca9ff7b661c1@epam.com>
 <fd394d84-4d8c-4fe2-9e51-58041dc09c69@suse.com>
In-Reply-To: <fd394d84-4d8c-4fe2-9e51-58041dc09c69@suse.com>

--------------AdfA8aaavdJNlhEHAj0xcyaI
Content-Type: multipart/mixed; boundary="------------0kXZVz591Gx1MQ82njcgoWpa"

--------------0kXZVz591Gx1MQ82njcgoWpa
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAuMDQuMjYgMTQ6MTMsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+IE9uIDEwLjA0LjI2
IDE0OjA0LCBPbGVrc2lpIE1vaXNpZWlldiB3cm90ZToNCj4+IEhpIEp1ZXJnZW4sDQo+Pg0K
Pj4gRHVyaW5nIG91ciBzYWZldHkgY2VydGlmaWNhdGlvbiBhbmFseXNpcyB3b3JrLCB3ZSBp
ZGVudGlmaWVkIHRoaXMgYXMgYSBwb3RlbnRpYWwNCj4+IGlzc3VlLiBXaGlsZSB3ZSBoYXZl
bid0IGVuY291bnRlcmVkIHRoaXMgcHJvYmxlbSBpbiBwcmFjdGljZSB5ZXQsIGl0IGNvdWxk
IG9jY3VyDQo+PiBpbiB0aGUgZnV0dXJlLCBzbyBJIGJlbGlldmUgaXQgc2hvdWxkIGJlIGFk
ZHJlc3NlZCBwcm9hY3RpdmVseS4NCj4gDQo+IEZvciBiZWluZyBhYmxlIHRvIG9jY3VyIGlu
IGZ1dHVyZSwgdGhlIGhhbmRsaW5nIG9mIHJlbW92aW5nIGEgY3B1IGZyb20gYQ0KPiBjcHVw
b29sIHdvdWxkIG5lZWQgdG8gYmUgY2hhbmdlZC4gQ29uc2lkZXJpbmcgdGhlIHJlZnVzYWwg
dG8gcmVtb3ZlIHRoZQ0KPiBsYXN0IGNwdSBmcm9tIGEgcG9wdWxhdGVkIGNwdXBvb2wgaXMg
b24gcHVycG9zZSAodGhpcyBhdm9pZHMgbGVhdmluZyBhDQo+IGRvbWFpbiB3aXRob3V0IGFu
eSBjcHUgdG8gcnVuIG9uKSwgYWRkaW5nIHRoZSBjb2RlIGFzIHlvdSBzdWdnZXN0IHdvdWxk
DQo+IGp1c3QgYmUgYW4gYWRkaXRpb24gd2l0aG91dCBhbnkgYmVuZWZpdC4NCj4gDQo+IEl0
IGlzbid0IGRvaW5nIGFueSBoYXJtIChvdGhlciB0aGFuIGFkZGluZyBjb2RlIHdpdGhvdXQg
cHVycG9zZSksIHNvIEkNCj4gd29uJ3QgZXhwbGljaXRseSBOQUsgdGhlIHBhdGNoLCBidXQg
SSB3b24ndCBBY2sgaXQgZWl0aGVyLg0KDQpPbmUgZnVydGhlciByZW1hcms6IEkgd291bGQg
YWNrIHRoZSBhZGRpdGlvbiBvZiBhbiBBU1NFUlQobGlzdF9lbXB0eShyZXBscSkpDQppbnN0
ZWFkIG9mIHRoZSBjb25kaXRpb25hbCBzZXRfdGltZXIoKSBjYWxsLg0KDQoNCkp1ZXJnZW4N
Cg==
--------------0kXZVz591Gx1MQ82njcgoWpa
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------0kXZVz591Gx1MQ82njcgoWpa--

--------------AdfA8aaavdJNlhEHAj0xcyaI--

--------------BJDxGHZT2PMW2qJEFLxj80q0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmnY6jkFAwAAAAAACgkQsN6d1ii/Ey9P
vQf+L2bYXcwgJSikO52xn2DLzB8iqwWVBbPb7dmRJbQxXma+WqNQHl2YJ0XhzilHkeEgszCDzI3t
e/jgaIEApfaIeKWWjc+DcDj+AS6dorKr+hW7XpSUzZrpiZyUoeX7yEOklVMPEEHQjndd5WF8PGCR
vWJyCl5WMDdCSyO3Bsigq9p1VDQ5QYabpDz4oqFU2IH1lODZFwXu7FNjXNI17MnO62XrTH6XLzLZ
1HPF58WLJc7SvqP+Bu8fzrBDNoHDntsYp+2JBgPqThfPiUJIJhQAav8RcTv/Z4ozhZJ+8whffsK7
S+w58i4tXzjLzuAvQPL5S1KO/kyyhrXtTd4r1OMyDw==
=dbVg
-----END PGP SIGNATURE-----

--------------BJDxGHZT2PMW2qJEFLxj80q0--

