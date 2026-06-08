Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OkScFR+WJmqhZAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 12:14:55 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CB9654EC8
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 12:14:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=Yjb5f6Dh;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1331509.1594068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWX0J-0004Wt-1M; Mon, 08 Jun 2026 10:14:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1331509.1594068; Mon, 08 Jun 2026 10:14:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWX0I-0004Tt-UK; Mon, 08 Jun 2026 10:14:46 +0000
Received: by outflank-mailman (input) for mailman id 1331509;
 Mon, 08 Jun 2026 10:14:46 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wWX0I-0004Tc-4Q
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 10:14:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWX0H-003Vey-H7
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 12:14:45 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a269601-2eae-0a2a0a5409dd-0a2a45048706-42
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 12:14:45 +0200
Received: from [209.85.218.46] (helo=mail-ej1-f46.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 6a269615-1dec-0a2a45040019-d155da2ed501-3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 12:14:45 +0200
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-becfa735b9aso567374766b.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 03:14:45 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bf0517721c2sm820999866b.3.2026.06.08.03.14.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jun 2026 03:14:44 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780913685; x=1781518485; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nxBQAWC7FUeGTJNBfhWbQ+ZfQbJdlJJx+tZ9LegFXV0=;
        b=Yjb5f6DhqlAYqjEbQLzf0qO4uO/4aPeBB90YCh0SJMlv6mhXChY79XW/8/Vt9xfqNl
         iRIx/9zZWv00FCVTq3WT9XS1PA7vojuAig+QHZ1UXThgER3CmB9tEAXccRH45RFHSt3i
         ndcG6gsTv80ck/1HO4KTtA9NI0c4rYv21cC+EdogY0B33MfOr3dQ7FNNlW7nxlj1byhJ
         lh4Qu5POgBfj8WJhpQu8q4MXG0GoycvMyudAWBeyNhRbu2YOxqq7bTixdyWDQFhzK3+U
         aLX29q5Gjwpem55tDZ0AzCRwDh0DeCy8B9nu5LyeIBQNZpfmGv9MMLoGk9iq3pwK0Ab1
         dqTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780913685; x=1781518485;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nxBQAWC7FUeGTJNBfhWbQ+ZfQbJdlJJx+tZ9LegFXV0=;
        b=cD3MTpCowLhFujBw0zVjyXyWJx+chKIlagd9iFiOYj2t5K1KsJqePPZwTes4RAy7TO
         AWmm275By4nqInuACt9KBUqMyFYlGeel9kLwOaJN3PcnAYmVBHn5ltyAbk6oCMaBcMsI
         niYrUN+P3djC0V5LkSEw+Q5+Z3EMw6KAs1x9f4kUkCY27YnzV5uDDNJbP6IgTuF1iWet
         9dWYwrcyUWOx+OGLnzWqbxLEWwB52CcF/EPD0Y3m7qhvMhqFVci7fdo9M9241INQJQU4
         479HLgZld/ZLzVM1TWIdgQe024OV9K34W984Co60IH9JqI9qUhsqiAgyq+qVci2QJkat
         HqbA==
X-Forwarded-Encrypted: i=1; AFNElJ9eSF0A3vfVjVHTifqTik5q1+O8fPR0Y++z2cF3zBwOjvLmD/gbLucpmY+e4Ig9UX970SeKddRJ13o=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzfAjfJ6mJB+j1LcK7a1rxFsqpW5t/O4YHythtq0tu+W969vKiT
	Bi1TqanDw0za3G5ppcsAUpEFDqzdXzW6LkSORfg6gliREyrzm0Gj/nPKnpY958YwcDc=
X-Gm-Gg: Acq92OEh+tL8aFRweh+o2r29SbL9P+8STLj1RFBVFWTSY0FSJiPAnoVlewJhU7/8lSL
	itRKJ5M+7H5VJb2LtjIERGtoqGYgaYMF4vU2ZotW0A/ADXq8hnhWxqP7Yuh3CtSZuf8nZ3jjgSh
	Q+6mMzaKQ5eK/w9Y4Q7xBU2XYMs2tWBVLnHiCA3P+TU5H4rI3ACo+cAfZPu8uy0qVgUkR9FHUlA
	CDkoEd6NOvN04vLRkSdIuPijT12hiFFiMZuk55SrLRRToxrNykRfKdOce3qwl1ESydRO9dwdvrP
	h3lMLxExnnAAQ3e5rGFAA/JHOVi2uNXQdzaHkJ3VwhBr+QMBGq76Y4zSj0f/kdjZTOAg18kqVhq
	C91oWa2aGLjGoUajbTLXxVk8KQ4k8RkXkd7q+qp55f0zwOsnqjPGO736C3u2iyvkydsHi3Is9KG
	HrEGPNfSyI6ylayR2a3OSyiDUBTikckgo79CnJaN7cK7lmMvE41zy3DH9NQzPqkM8PrrLcjtqg2
	YNoFMxMLFXmm9zeJG9P4lteHEK9gVdTALQC+Mi9gCcL+EYZJ31P9ET5lOBGbegX
X-Received: by 2002:a17:907:2803:b0:bec:228e:26e5 with SMTP id a640c23a62f3a-bf36fba1ed3mr502078366b.7.1780913684833;
        Mon, 08 Jun 2026 03:14:44 -0700 (PDT)
Message-ID: <0c1b9be8-258a-4f2f-bcdd-e8594ddc1aec@suse.com>
Date: Mon, 8 Jun 2026 12:14:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] x86/xen: Convert xen_mm_unpin_all() to ptdescs
To: Vishal Moola <vishal.moola@gmail.com>, Dave Hansen
 <dave.hansen@intel.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 x86@kernel.org
Cc: Mike Rapoport <rppt@kernel.org>, Lu Baolu <baolu.lu@linux.intel.com>,
 xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <20260527140316.294621-1-vishal.moola@gmail.com>
 <20260527140316.294621-10-vishal.moola@gmail.com>
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
In-Reply-To: <20260527140316.294621-10-vishal.moola@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------15uZ9BCclmHdokGRSdMRESv0"
X-purgate-ID: tlsNG-ebf023/1780913685-2BB6B3FF-FCB31C79/0/0
X-purgate-type: clean
X-purgate-size: 6746
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.59 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	MAILLIST(-0.18)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,intel.com,kvack.org,vger.kernel.org,kernel.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:vishal.moola@gmail.com,m:dave.hansen@intel.com,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:x86@kernel.org,m:rppt@kernel.org,m:baolu.lu@linux.intel.com,m:xen-devel@lists.xenproject.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:hpa@zytor.com,m:luto@kernel.org,m:peterz@infradead.org,m:boris.ostrovsky@oracle.com,m:vishalmoola@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:from_mime,suse.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	HAS_ATTACHMENT(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 06CB9654EC8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------15uZ9BCclmHdokGRSdMRESv0
Content-Type: multipart/mixed; boundary="------------0PH114zVSoGpQ4tBm8RXhOwi";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Vishal Moola <vishal.moola@gmail.com>, Dave Hansen
 <dave.hansen@intel.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 x86@kernel.org
Cc: Mike Rapoport <rppt@kernel.org>, Lu Baolu <baolu.lu@linux.intel.com>,
 xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <0c1b9be8-258a-4f2f-bcdd-e8594ddc1aec@suse.com>
Subject: Re: [PATCH 9/9] x86/xen: Convert xen_mm_unpin_all() to ptdescs
References: <20260527140316.294621-1-vishal.moola@gmail.com>
 <20260527140316.294621-10-vishal.moola@gmail.com>
In-Reply-To: <20260527140316.294621-10-vishal.moola@gmail.com>

--------------0PH114zVSoGpQ4tBm8RXhOwi
Content-Type: multipart/mixed; boundary="------------cXBNXfou8d7pbxhXUj79ph7U"

--------------cXBNXfou8d7pbxhXUj79ph7U
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjcuMDUuMjYgMTY6MDMsIFZpc2hhbCBNb29sYSB3cm90ZToNCj4gQ29udmVydCB4ZW5f
bW1fdW5waW5fYWxsKCkgdG8gcHRkZXNjcyBpbiBwcmVwYXJhdGlvbiBmb3IgdGhlIGV2ZW50
dWFsDQo+IHNwbGl0dGluZyBvZiBwdGRlc2NzIGZyb20gc3RydWN0IHBhZ2UuIENvbnRpbnVl
IGNoZWNraW5nIFBhZ2VQaW5uZWQNCj4gdGhyb3VnaCB0aGUgdW5kZXJseWluZyBwYWdlIGFz
IHdlIGRvIG5vdCBoYXZlIGEgcGVyLW1lbWRlc2MgYXBpIHlldC4NCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IFZpc2hhbCBNb29sYSA8dmlzaGFsLm1vb2xhQGdtYWlsLmNvbT4NCg0KUmV2aWV3
ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCg0KDQpKdWVyZ2VuDQo=

--------------cXBNXfou8d7pbxhXUj79ph7U
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------cXBNXfou8d7pbxhXUj79ph7U--

--------------0PH114zVSoGpQ4tBm8RXhOwi--

--------------15uZ9BCclmHdokGRSdMRESv0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmomlhQFAwAAAAAACgkQsN6d1ii/Ey+c
nggAiU7PaHe2GWgjkyU+bQ5XYfd8d3Vprzu2LSpdmXgf4mmpk8UqYrmnLF0AFoEDjbaWslVHE1g+
xDBDEVsmCV/vGoUc+3sGJTHTRq7VsAsLz/Gd4DxgZ2e2NeZpyqCAf9IhKimVZotTrYsP40ddDcAd
9YAxZkuc4oXiIvI0zqF76HzMExAMOkgfw3Vwsm9jT8fJDm/8DjvqFzFdR6aPjZidujNczaNrI611
6dpvLXmptPUhx5DlMh5ivijpquwYyBYmnGMPbccba7WuVAiCRyvVIO0Sj5k1tYcP+IEiHTvEu98X
6U7WslxT3SgqOowiWGAe9Jf8+QZLJ/+kGjnju8ODag==
=r6p4
-----END PGP SIGNATURE-----

--------------15uZ9BCclmHdokGRSdMRESv0--

