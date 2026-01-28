Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kOEJAiQqeml/3gEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 16:24:20 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3EB4A3B94
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 16:24:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1215820.1525938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl7OC-0001Vy-28; Wed, 28 Jan 2026 15:23:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1215820.1525938; Wed, 28 Jan 2026 15:23:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl7OB-0001UA-Vk; Wed, 28 Jan 2026 15:23:27 +0000
Received: by outflank-mailman (input) for mailman id 1215820;
 Wed, 28 Jan 2026 15:23:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MrbJ=AB=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vl7OA-0001U4-Jk
 for xen-devel@lists.xenproject.org; Wed, 28 Jan 2026 15:23:26 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 49d55a91-fc5d-11f0-b160-2bf370ae4941;
 Wed, 28 Jan 2026 16:23:25 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b8863db032dso899511466b.0
 for <xen-devel@lists.xenproject.org>; Wed, 28 Jan 2026 07:23:25 -0800 (PST)
Received: from ?IPV6:2a00:12d0:af5b:2f01:4042:c03:ce4d:a5a1?
 (2a00-12d0-af5b-2f01-4042-c03-ce4d-a5a1.ip.tng.de.
 [2a00:12d0:af5b:2f01:4042:c03:ce4d:a5a1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8dbf2ed584sm138381266b.61.2026.01.28.07.23.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jan 2026 07:23:24 -0800 (PST)
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
X-Inumbo-ID: 49d55a91-fc5d-11f0-b160-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769613804; x=1770218604; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xw8n1cO3pRZlLCxZTMCxZCBc8pIvFNjgqUOhrVncBHA=;
        b=GTKJ0GyVFE4wPeq3EbssfQnq01Tja/etQqrKswrAeTEpZAJiIlH9txJM3WwJq8VUIn
         DJRHSI1+oSluTsqLvZHEQwiOSvgVtMBwHjAmOlzTjZme+NuqnJr8bYhxks3JaFVaMNot
         /5acOwCMVOc6CqY7FtfDaV4KQZXQDiINTpxHJU2t9eSqmIGsCxtwh8L5+mKhY5iAO9dO
         c/l0m/+vZiaAYEJyI9R6W+oHshlv6CRvHomhBqQUbXzvh5Usa/KxB/vwmxskQptn6RC2
         J9WLgNVVJTl4OM2ZPwQz7ZOV7v7RNCzPmMxzSoH8xsTa/4rawXS2kJJIRW7YTfG8Cssp
         ooiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769613804; x=1770218604;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xw8n1cO3pRZlLCxZTMCxZCBc8pIvFNjgqUOhrVncBHA=;
        b=rtbNi52Ej7LrovisUQyeuAn8YchnOWMyttjq+08x6To+/iosZUGqtmNo9ufyXycJ1n
         ik0SlDejNg5woTYqyZ/JKdLAB0d/UdsRiZKEVTlbEN3p/O1AsSv95TCjyfW0UkH0I+JW
         ax3q5WbhWhO5ZoA73VWMnZrb2nDkWM3mw5oVMXzw6Dyf8TPqH2EPyMllMqrfIHQUkVAl
         4tRYuefLRIUq96ZH+jNqpcFU2kUEOXjFX9/XFy5ELimYG8boTUGdc61gYVjwq9G9MmtM
         EwYGkZxedrTLcLTnbcvqd5GM1wykyBjuW3IIaKq7NbcUi0rUy+mg3ylKog0VuU4oMMX5
         PO5g==
X-Forwarded-Encrypted: i=1; AJvYcCW95bf6rBXAp/QtCRPMK3wvzNGqFtx+1eyQwDKL8plY/eyA8LELiCTHPAo3KW3Wi/qC2b6sWIM5O4w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxS4pvyPlKKRckmyJKqd0HDiuNrlK7FvoKHo+zGYfA+WdN/WvX+
	DT2UWmD1I1WJg7PpuA/pX0FiKDclBBGhT5DL7gFyJjj+pnXAP2hd+3dywS6xw+6+TaM=
X-Gm-Gg: AZuq6aITIhdMAE9UR6zOAPs99Ewt2aIkEnLXGkf3Ytse8aWAEH4hqX+APwGqEK8ylcK
	yFzzXm9StHlZQA0ZVIQ5wU3c1OKOLFdPv3uajpLK1szhBqGMIvnzS35JDKIJDcRdJlOV54p5snt
	UEzkgr9YbUMHNaTqMeLdLJ1lsrEpwCnqXgtFr6IL4NK1n4b+N05KNW64U0l48Cf4utzHFvFOm/Q
	1Jid5YyZRwKxeBQXyt3w7V+8ZQCGH0hKWuPcB2PNFTzSTXz3YsfB2nURNvxJ9tb9c10NRVXTsUI
	67ogW8O11jUBtLY5Ybrww7L78veVCG7kOBjjaxnX7lb8CZF1sQCeDCCyRzcvx+5V6DEwxR9+E6b
	UZkjb1xPiLUr+45kVmC/cv6anGPWyNQzlyMhRD2HndPK0MpUmwe3pX0kIlMBN2yiH1okcI9D4rj
	wh90IlDbQ58LQ5wS9dMVbjNmnbtM/MbiRVzC2GI60ltpWRmiCROu1SPAQJKJThB1ql4Gav4uFuG
	F1zVXIrim3k/5aiCHs8u1V6mftA8M0pF44PLg==
X-Received: by 2002:a17:907:1c27:b0:b88:6542:86a0 with SMTP id a640c23a62f3a-b8dab39a855mr445835466b.54.1769613804398;
        Wed, 28 Jan 2026 07:23:24 -0800 (PST)
Message-ID: <4b519e14-57fb-45be-a8b1-2c69c80cdcc4@suse.com>
Date: Wed, 28 Jan 2026 16:23:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] Partial revert "x86/xen: fix balloon target
 initialization for PVH dom0"
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
Cc: James Dingwall <james@dingwall.me.uk>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <20260128110510.46425-1-roger.pau@citrix.com>
 <20260128110510.46425-2-roger.pau@citrix.com>
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
In-Reply-To: <20260128110510.46425-2-roger.pau@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------49EsFbi001iLCSUqolznmAQH"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.53 / 15.00];
	SIGNED_PGP(-2.00)[];
	R_MIXED_CHARSET(0.56)[subject];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,m:james@dingwall.me.uk,m:boris.ostrovsky@oracle.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	ARC_NA(0.00)[];
	ASN_FAIL(0.00)[120.175.237.192.asn.rspamd.com:query timed out];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: C3EB4A3B94
X-Rspamd-Action: no action

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------49EsFbi001iLCSUqolznmAQH
Content-Type: multipart/mixed; boundary="------------wMWfCqCxuKJMZMNt5UteTRd7";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
Cc: James Dingwall <james@dingwall.me.uk>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Message-ID: <4b519e14-57fb-45be-a8b1-2c69c80cdcc4@suse.com>
Subject: Re: [PATCH 1/2] Partial revert "x86/xen: fix balloon target
 initialization for PVH dom0"
References: <20260128110510.46425-1-roger.pau@citrix.com>
 <20260128110510.46425-2-roger.pau@citrix.com>
In-Reply-To: <20260128110510.46425-2-roger.pau@citrix.com>

--------------wMWfCqCxuKJMZMNt5UteTRd7
Content-Type: multipart/mixed; boundary="------------bMoZR76GhMUM0C60DiwAmRzr"

--------------bMoZR76GhMUM0C60DiwAmRzr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjguMDEuMjYgMTI6MDUsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToNCj4gVGhpcyBwYXJ0
aWFsbHkgcmV2ZXJ0cyBjb21taXQgODdhZjYzMzY4OWNlMTZkZGIxNjZjODBmMzJiMTIwZTUw
YjEyOTVkZSBzbw0KPiB0aGUgY3VycmVudCBtZW1vcnkgdGFyZ2V0IGZvciBQViBndWVzdHMg
aXMgc3RpbGwgZmV0Y2hlZCBmcm9tDQo+IHN0YXJ0X2luZm8tPm5yX3BhZ2VzLCB3aGljaCBt
YXRjaGVzIGV4YWN0bHkgd2hhdCB0aGUgdG9vbHN0YWNrIHNldHMgdGhlDQo+IGluaXRpYWwg
bWVtb3J5IHRhcmdldCB0by4NCj4gDQo+IFVzaW5nIGdldF9udW1fcGh5c3BhZ2VzKCkgaXMg
cG9zc2libGUgb24gUFYgYWxzbywgYnV0IG5lZWRzIGFkanVzdGluZyB0bw0KPiB0YWtlIGlu
dG8gYWNjb3VudCB0aGUgSVNBIGhvbGUgYW5kIHRoZSBQRk4gYXQgMCBub3QgY29uc2lkZXJl
ZCB1c2FibGUNCj4gbWVtb3J5IGRlc3BpdGUgYmVpbmcgcG9wdWxhdGVkLCBhbmQgaGVuY2Ug
d291bGQgbmVlZCBleHRyYSBhZGp1c3RtZW50cy4NCj4gSW5zdGVhZCBvZiBjYXJyeWluZyB0
aG9zZSBleHRyYSBhZGp1c3RtZW50cyBzd2l0Y2ggYmFjayB0byB0aGUgcHJldmlvdXMNCj4g
Y29kZS4gIFRoYXQgbGVhdmVzIExpbnV4IHdpdGggYSBkaWZmZXJlbmNlIGluIGhvdyBjdXJy
ZW50IG1lbW9yeSB0YXJnZXQgaXMNCj4gb2J0YWluZWQgZm9yIEhWTSB2cyBQViwgYnV0IHRo
YXQncyBiZXR0ZXIgdGhhbiBhZGRpbmcgZXh0cmEgbG9naWMganVzdCBmb3INCj4gUFYuDQo+
IA0KPiBIb3dldmVyIGlmIHN3aXRjaGluZyB0byBzdGFydF9pbmZvLT5ucl9wYWdlcyBmb3Ig
UFYgZG9tYWlucyB3ZSBuZWVkIHRvDQo+IGRpZmZlcmVudGlhdGUgYmV0d2VlbiByZWxlYXNl
ZCBwYWdlcyAoZnJlZWQgYmFjayB0byB0aGUgaHlwZXJ2aXNvcikgYXMNCj4gb3Bwb3NlZCB0
byBwYWdlcyBpbiB0aGUgcGh5c21hcCB3aGljaCBhcmUgbm90IHBvcHVsYXRlZCB0byBzdGFy
dCB3aXRoLg0KPiBJbnRyb2R1Y2UgYSBuZXcgeGVuX3VucG9wdWxhdGVkX3BhZ2VzIHRvIGFj
Y291bnQgZm9yIHBhcGdlcyB0aGF0IGhhdmUNCj4gbmV2ZXIgYmVlbiBwb3B1bGF0ZWQsIGFu
ZCBoZW5jZSBpbiB0aGUgUFYgY2FzZSBkb24ndCBuZWVkIHN1YnRyYWN0aW5nLg0KPiANCj4g
Rml4ZXM6IDg3YWY2MzM2ODljZSAoIng4Ni94ZW46IGZpeCBiYWxsb29uIHRhcmdldCBpbml0
aWFsaXphdGlvbiBmb3IgUFZIIGRvbTAiKQ0KPiBSZXBvcnRlZC1ieTogSmFtZXMgRGluZ3dh
bGwgPGphbWVzQGRpbmd3YWxsLm1lLnVrPg0KPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUg
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEp1ZXJnZW4g
R3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCg0KDQpKdWVyZ2VuDQo=
--------------bMoZR76GhMUM0C60DiwAmRzr
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------bMoZR76GhMUM0C60DiwAmRzr--

--------------wMWfCqCxuKJMZMNt5UteTRd7--

--------------49EsFbi001iLCSUqolznmAQH
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAml6KesFAwAAAAAACgkQsN6d1ii/Ey8J
RQgAnrk+e6Iq8ZPvE5im5BGkF2relqURxqoRgQCq+/OKE1wJ9mYYDRke/CDH9mSy3jZs2hS4vb+y
ewBfYcYrlRN0O2zcewZD5Ul0pKugWNS51PT3ITwbRV2QiJzFW6eLPhPxod3MUtNpBG3vST2STqoy
s43BDJ6T8erz8EP6DprvRnYP71T6vLaoJd/Kx+wxT4pxG7w9NasoowYMYgC+PkUa/lYgRvjguFJ6
cDQ8www8lG2J+b8w2XY+0w7oMzbOwI3Ajyuw9UuGH8huyZk1WwZzLXllVFzLeqpAOWDYm/aPZ4kY
grytGYG8n5K8PzI2cgYIqXFfKtBBFYvIG6uIwWXLDg==
=ZJhN
-----END PGP SIGNATURE-----

--------------49EsFbi001iLCSUqolznmAQH--

