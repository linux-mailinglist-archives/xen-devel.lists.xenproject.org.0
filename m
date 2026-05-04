Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yAJ9K+2x+GkdzAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 16:49:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 216C44C00CA
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 16:49:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300015.1574577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJubZ-0000sP-Vq; Mon, 04 May 2026 14:49:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300015.1574577; Mon, 04 May 2026 14:49:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJubZ-0000q6-TC; Mon, 04 May 2026 14:49:05 +0000
Received: by outflank-mailman (input) for mailman id 1300015;
 Mon, 04 May 2026 14:49:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wJubY-0000q0-Ik
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 14:49:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJubX-006OqB-NR
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 16:49:03 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 69f8b1de-2eae-0a2a0a5409dd-0a2a450bba4e-6
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 16:49:03 +0200
Received: from [209.85.208.47] (helo=mail-ed1-f47.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 69f8b1de-212f-0a2a450b0019-d155d02fb939-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 16:49:02 +0200
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-67c2d57a5ceso2730628a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 07:49:02 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-67b88473402sm3364805a12.29.2026.05.04.07.49.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2026 07:49:01 -0700 (PDT)
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
        d=suse.com; s=google; t=1777906142; x=1778510942; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IG2GDhZ+ukpgyCQshd4A7iw8w+BVwo0Y+oMP0IJ7qS8=;
        b=cDyyNRqrf1ydLDyd6msXd9mrmEI0s0tWzNDWjStKDrqdXyb4RJ5GXBDueihIR3V2V4
         Vm3BW4GGo9hQQz7TD1L5KSPBBgo/2HrfW7znnmbaIKLTtH6SzqN79zQLdkLC39tHjoyy
         0EzDJYZyXR/YmeUaI/movn+AJq9/kr+6f2d/SQNtz502OFn3mWxCig4NXb5HyAtDXSco
         V5gTUa40IyOn3/ceLbo4iYgadLKEEOvdecZFdhqZALEKDq9VnwPg+mbxhw5VL1iMgPAW
         O2wb3DmdrbB4Qr1N6a0k2O0H6NVTlK8aNdZkHM1qMZ71A5R3tdeVawygy5lEjccaxAJb
         cjYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777906142; x=1778510942;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IG2GDhZ+ukpgyCQshd4A7iw8w+BVwo0Y+oMP0IJ7qS8=;
        b=eaxep92+so+X8CdsgtcwqHBBwsdQKRsi+pwYx7i0DMurx92HoOfFHxXu8ym/zL7zBw
         blD/pwgDJJDMvrPPHSoM5UyUzk3DAZ04PZp7PIhC0+BQfVEDjzAXXo853hll/EuKHhCN
         fZCzOTaAqWWHpMoWSlMiQKM9zEf6+Ww2oNUIdGywvojzmmtLnQviiOqfuLJXqdOtCAXL
         3xS6o+qWYkSY3QTxGragIMyoHp+nMaojmPxmvnWgPoR/Dv1p7wW+Sc9uHVndo1cILv/S
         EF0gbmc+2pDcEBQcIAae6LNGBqkxmIk4F2vSOqrGhcJ/aEZ0uMl1w+FzpKjPdtSMFyNJ
         jCVQ==
X-Forwarded-Encrypted: i=1; AFNElJ9QeTtvAJZ9gziu7ipk8zUi3AeAtURVewR/QMns/GqfO/PuXb/PjUtsQAgACwAIWkphPMz3fAcHxzs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzEJ1DtguSvsCd2qHyIGzqk6oGNJqcd+7TYd0/i8KKv58OLET5n
	1DA9Rn8YeFVRW/WisupZWATeogtAyqgtyZrIId1dW+KVbGVZ/Su2w4KjeRj/6HRUQuc=
X-Gm-Gg: AeBDieu07J2yjnxiyYOilyVA2fdYDpg61plm3pW6PXaopzUbZNV+ADf0PgGBSGV4N5X
	hAZGL5AxWnbL/eKQfZzVJ/+Lo18d3bsw0ztNVzHH+zBIK8N3B0V3MBdNeKQOLSXRf0dgeHk7Z/R
	uClexC40AtKwbyIb6a/IvPCVVgdWMcq4GT6e8jiamTrNsfFcSxRg2ayDLFdY/1nvfo5fxX2RSg4
	gUHxb0QehHdlIoSbwGKkrFMmllG4wz7WN0Begxx9Rke+BQuKo9u1tlQC7eKhSl0M2opJe9CCHp9
	SEd8BtaskgLCRYWWS/bLKgz9IaeXekJAAD8xAT8NVL47mg9Q9VURzfWTsXDPHq0IwRvurOvOuUi
	eBYhVw7CdVBZCzYMnD6fw4q1V3UhliJ1yXKahpv8oxiK5vWcjaO3QWiEgUq0fGwshASuu9wiXjE
	ePuuzUrDM5V7FvMrNvgCzHEuJ1pCyfJTQPzuxVdGJLlK9QtyxvUVrlNC7TGHfc6A+JLDmiCIzOz
	LcXmxjqcIGMdmmE1WHTKTCSegjflEB6DNN7mBNj8Rzm99ibKMYvynLjQRPF7Eji
X-Received: by 2002:a05:6402:528a:b0:67c:7718:4995 with SMTP id 4fb4d7f45d1cf-67c77184d8fmr2069478a12.7.1777906142089;
        Mon, 04 May 2026 07:49:02 -0700 (PDT)
Message-ID: <a6144bf8-fc32-4a68-a6b8-11d1d6af809e@suse.com>
Date: Mon, 4 May 2026 16:49:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/sched: rtds: assert replq is empty on timer
 (re-)init
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 Meng Xu <mengxu@cis.upenn.edu>
References: <f751db3a02efa96d737235e58eb7bfb35e6218bb.1777901826.git.oleksii_moisieiev@epam.com>
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
In-Reply-To: <f751db3a02efa96d737235e58eb7bfb35e6218bb.1777901826.git.oleksii_moisieiev@epam.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------FmEsF2wU0CXSO9ss0NxYriMh"
X-purgate-ID: tlsNG-42698a/1777906142-0556BF3B-F7503A46/0/0
X-purgate-type: clean
X-purgate-size: 7401
X-Rspamd-Queue-Id: 216C44C00CA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.50 / 15.00];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	R_MIXED_CHARSET(0.59)[subject];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Oleksii_Moisieiev@epam.com,m:xen-devel@lists.xenproject.org,m:dfaggioli@suse.com,m:gwd@xenproject.org,m:mengxu@cis.upenn.edu,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,suse.com:dkim,suse.com:mid];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.775];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	HAS_ATTACHMENT(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------FmEsF2wU0CXSO9ss0NxYriMh
Content-Type: multipart/mixed; boundary="------------Gij5Y8stQiKzBLx0HIJdSjyo";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 Meng Xu <mengxu@cis.upenn.edu>
Message-ID: <a6144bf8-fc32-4a68-a6b8-11d1d6af809e@suse.com>
Subject: Re: [PATCH v3] xen/sched: rtds: assert replq is empty on timer
 (re-)init
References: <f751db3a02efa96d737235e58eb7bfb35e6218bb.1777901826.git.oleksii_moisieiev@epam.com>
In-Reply-To: <f751db3a02efa96d737235e58eb7bfb35e6218bb.1777901826.git.oleksii_moisieiev@epam.com>

--------------Gij5Y8stQiKzBLx0HIJdSjyo
Content-Type: multipart/mixed; boundary="------------gGU6UUSGt95jH4GuiFkA7RG1"

--------------gGU6UUSGt95jH4GuiFkA7RG1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDQuMDUuMjYgMTU6NDAsIE9sZWtzaWkgTW9pc2llaWV2IHdyb3RlOg0KPiBJbiBSVERT
LCByZW1vdmluZyB0aGUgbGFzdCBlbGlnaWJsZSBwQ1BVIGtpbGxzIHJlcGxfdGltZXIuIFdo
ZW4gYSBwQ1BVDQo+IGlzIGxhdGVyIHJlLWFkZGVkLCBydF9zd2l0Y2hfc2NoZWQoKSByZWlu
aXRpYWxpemVzIHRoZSB0aW1lciBvYmplY3QuDQo+IA0KPiBjcHVwb29sX3VuYXNzaWduX2Nw
dV9zdGFydCgpIHJlZnVzZXMgdG8gcmVtb3ZlIHRoZSBsYXN0IHBDUFUgZnJvbSBhDQo+IHBv
cHVsYXRlZCBjcHVwb29sOiBpZiBhbnkgZG9tYWluIGlzIHN0aWxsIGFsaXZlIHdoaWxlIHRo
ZSBzeXN0ZW0gaXMNCj4gYWN0aXZlIGl0IHJldHVybnMgLUVCVVNZLCBvdGhlcndpc2UgYWxs
IGRvbWFpbnMgYXJlIGZpcnN0IG1vdmVkIHRvDQo+IGNwdXBvb2wwLiBDb25zZXF1ZW50bHks
IGJ5IHRoZSB0aW1lIHRoZSBraWxsZWQtdGltZXIgYnJhbmNoIHJ1bnMsIG5vDQo+IHVuaXRz
IHJlbWFpbiBpbiB0aGUgcG9vbCBhbmQgcmVwbHEgaXMgZ3VhcmFudGVlZCB0byBiZSBlbXB0
eS4NCj4gDQo+IERvY3VtZW50IHRoaXMgaW52YXJpYW50IGJ5IGFzc2VydGluZyBsaXN0X2Vt
cHR5KHJlcGxxKSByaWdodCBhZnRlcg0KPiBpbml0X3RpbWVyKCkuIFRoaXMgY2F0Y2hlcyBh
bnkgZnV0dXJlIHJlZ3Jlc3Npb24gaW4gY3B1cG9vbCBzZW1hbnRpY3MNCj4gdGhhdCB3b3Vs
ZCBsZWF2ZSBwZW5kaW5nIHJlcGxlbmlzaG1lbnQgZXZlbnRzIGJlaGluZCBhY3Jvc3MgYQ0K
PiBUSU1FUl9TVEFUVVNfa2lsbGVkIC0+IGluaXRfdGltZXIoKSB0cmFuc2l0aW9uLCB3aGVy
ZSB0aGUgdGltZXIgd291bGQNCj4gb3RoZXJ3aXNlIHN0YXkgZGlzYXJtZWQgdW50aWwgYW4g
dW5yZWxhdGVkIGV2ZW50IHJlcHJvZ3JhbW1lZCBpdC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IE9sZWtzaWkgTW9pc2llaWV2IDxvbGVrc2lpX21vaXNpZWlldkBlcGFtLmNvbT4NCg0KUmV2
aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCg0KDQpKdWVyZ2Vu
DQo=
--------------gGU6UUSGt95jH4GuiFkA7RG1
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------gGU6UUSGt95jH4GuiFkA7RG1--

--------------Gij5Y8stQiKzBLx0HIJdSjyo--

--------------FmEsF2wU0CXSO9ss0NxYriMh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmn4sd0FAwAAAAAACgkQsN6d1ii/Ey/k
rwf8C0pT+EBLuLS8gUwM2Ih1kjdhAkeu7Wj5rwbZ6L+b+Jcfhzwd+OasuUhNQvUGKYCY68anVht/
b50DPeUBePwve40Q0m+Jftj4cu02nmkX8WbSRNTCEE6SQZ8U6JJjSDah7HpYNEgrJ5mcoLdBzUXv
/XJ48/XzJGKDu8x/3TZsOHGBvshGjAeF0CgEYe9JtyfCkPzYABR838k+fNVWztUzt8ytprlTGshp
hrTJP6thZJggG8ax0dyTLpfaSf95HFNFHnbkAC8WIXtMSA0Z8C2nm7cuGVy/9yMk3zA1oNd2kqRA
yTb+rkaC5ujUqrq216472UUT9m1B9glfsperS7ZqLQ==
=GOaw
-----END PGP SIGNATURE-----

--------------FmEsF2wU0CXSO9ss0NxYriMh--

