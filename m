Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Jku6EB2WJmqgZAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 12:14:53 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B85654EC5
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 12:14:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=KZ799ucv;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1331506.1594060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWWzt-00044p-Ld; Mon, 08 Jun 2026 10:14:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1331506.1594060; Mon, 08 Jun 2026 10:14:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWWzt-00043R-Gw; Mon, 08 Jun 2026 10:14:21 +0000
Received: by outflank-mailman (input) for mailman id 1331506;
 Mon, 08 Jun 2026 10:14:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wWWzr-00043L-A7
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 10:14:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWWzq-001ohM-FQ
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 12:14:18 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a2695ec-5cb7-0a2a0a5109dd-0a2a450cb818-48
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 12:14:18 +0200
Received: from [209.85.218.49] (helo=mail-ej1-f49.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 6a2695f9-62f1-0a2a450c0019-d155da31a509-3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 12:14:18 +0200
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-bec43ee8ff0so584414766b.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 03:14:18 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bf0559f1f62sm862110466b.57.2026.06.08.03.14.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jun 2026 03:14:16 -0700 (PDT)
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
        d=suse.com; s=google; t=1780913657; x=1781518457; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ICUYmzYvi3Npp7Z3gMsJhlNCaTZ1S0P4tdLevTu8olY=;
        b=KZ799ucvf0jCvBuaZjAPT8kU5Bx7NTDxQdfK0o99soPbpGe/IBCTnqS3qohgwheGXA
         N9rmros7WRQm/UYUIfD+QjoUiHanALIAKkvnjuxMGRBCd5V4wR6xvLcTH8qK1vGyJVqx
         NpZwusWJoxgxjpjur2S7ebRInCS/Wr4ZLpCk8fFZc3+tEOPhHWAcwsFoc7nL7gvwj4gk
         RDb71MRO8pujXjtZnvQU9Mkb9JMU4CqryXKGIVCJ7Kg4DWiTGn8mLL7/CbO+QU88vIK9
         e5XgkCXLOdLLbr2sYVOLD9Ho2dBTEVN/Vki6sYwCGd7HhAd5dtcrmXb2vG4QHSmSQajU
         c+Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780913657; x=1781518457;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ICUYmzYvi3Npp7Z3gMsJhlNCaTZ1S0P4tdLevTu8olY=;
        b=qC6paUEUDicL3AgXDZBGLdUuexW7ozInY0d+YkvFL3b560XkzX2/Vm/PX2AqiTmVcn
         3i9RKKDLy7Ms9AIriGp/p7V4lQh7oDkjxNAcZbJdednMIXIYYQR85e/a4C3wd7bQ8YVK
         /6pELPwOUtlxOXBRX0QgVm33MIr21VcO6iRWezVmYOQ8Y7vtIeyQAAQpwrIU26fC1OIj
         lZg4hdsxUIlYleR81X64MAuK+U/uWxrIsNH8sa+WH9Y/6iDRZIkONNOetQ/TysT5UKT9
         Prjcora4PX49RfgaqAKuJdumNYNHg/7rWYGEFqnpYubw5Kp072yNk6tnsufW9vtipVuV
         PuWQ==
X-Forwarded-Encrypted: i=1; AFNElJ/2/pjP3ZSgnLVQqC91vEszyTFksaoaaHIgoX95+SjV2v+BdMFwMYgq7fm5vnEIly/ORLgOM9nq4Uo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw/w8qcFwJs45LCd/CVxQE9uIVECUZQI2VDWyQb2jiHi5wUPMWU
	jvPVm3T9r9ZN+sFRpM1xYEK42bZn2/eJEnY+PsVCC7e7hlOsJKIT0EiDQ7DSQCK+inc=
X-Gm-Gg: Acq92OEpnitH03838jWOYtUvtmme8bMMJYN4XNlYEBR04c4TcUuvGGk9QiIvtWEmXWt
	Bi3BpOr7owlJUmiNIxiIGOKn1rTDHN2B0xh9oQwj8/qndf8wBtSHBn1clPInwWKZ+pM4JkgL8IP
	Mfe3ooQjSxgz44Z33Cm9r07AkGmu4ULC6cazkHLgvZT0UTf8UQwlc3/HXqDynRvgWcDGT2218Zl
	uUbTNWxM1iwN8CsjQXBgpn29tlh+ABwHLwVwh8O14gUZ5mFKoISbVgGCuI0m0BRBWGOXUyFRYkn
	eWdA84R3YGk+Uvyu4KlK+8QhxUO6FgMUe6pMvdz4RBk3TORAWrfC/7v4U33MxIUT3n4vB17L20c
	V90hks7Uai2LOu5MB37My+LnorboB8XOUSRCjIM5CA31PFXA5nsmfI3xMp7E1NaWuDgRmgW1xXh
	e0YSMPj7yUMHGN9Mq1Wn1RHkdNFYB5qdXpAWjB2r33NDo4oEGA6jTMosdeEVcRZxP/s8k/tBwGz
	2m9nGrgXF8WSz39xfFX9FUCV5RYW6ofDfpD3porT7FbD2Zn80QxQPW9n7PNqzez
X-Received: by 2002:a17:907:60d1:b0:bd8:fc89:cda0 with SMTP id a640c23a62f3a-bf3a8a0cdbamr553511066b.24.1780913657464;
        Mon, 08 Jun 2026 03:14:17 -0700 (PDT)
Message-ID: <af7a7a96-c1f9-47bb-9c4c-c83fe6a9f70b@suse.com>
Date: Mon, 8 Jun 2026 12:14:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] x86/xen: Convert xen_mm_pin_all() to ptdescs
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
 <20260527140316.294621-9-vishal.moola@gmail.com>
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
In-Reply-To: <20260527140316.294621-9-vishal.moola@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------mqeEDAX0jgEctDcOkQ0EDxdK"
X-purgate-ID: tlsNG-d25034/1780913658-F487BCF5-6BAD46A2/0/0
X-purgate-type: clean
X-purgate-size: 6762
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.59 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	MAILLIST(-0.18)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,intel.com,kvack.org,vger.kernel.org,kernel.org];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:vishal.moola@gmail.com,m:dave.hansen@intel.com,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:x86@kernel.org,m:rppt@kernel.org,m:baolu.lu@linux.intel.com,m:xen-devel@lists.xenproject.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:hpa@zytor.com,m:luto@kernel.org,m:peterz@infradead.org,m:boris.ostrovsky@oracle.com,m:vishalmoola@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:from_mime,suse.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 90B85654EC5

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------mqeEDAX0jgEctDcOkQ0EDxdK
Content-Type: multipart/mixed; boundary="------------uCZRBKwpO9lYtVcfTExo30um";
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
Message-ID: <af7a7a96-c1f9-47bb-9c4c-c83fe6a9f70b@suse.com>
Subject: Re: [PATCH 8/9] x86/xen: Convert xen_mm_pin_all() to ptdescs
References: <20260527140316.294621-1-vishal.moola@gmail.com>
 <20260527140316.294621-9-vishal.moola@gmail.com>
In-Reply-To: <20260527140316.294621-9-vishal.moola@gmail.com>

--------------uCZRBKwpO9lYtVcfTExo30um
Content-Type: multipart/mixed; boundary="------------moBdeYGjNrSgg2fuugMy79vf"

--------------moBdeYGjNrSgg2fuugMy79vf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjcuMDUuMjYgMTY6MDMsIFZpc2hhbCBNb29sYSB3cm90ZToNCj4gQ29udmVydCB4ZW5f
bW1fcGluX2FsbCgpIHRvIHB0ZGVzY3MgaW4gcHJlcGFyYXRpb24gZm9yIHRoZSBldmVudHVh
bA0KPiBzcGxpdHRpbmcgb2YgcHRkZXNjcyBmcm9tIHN0cnVjdCBwYWdlLiBDb250aW51ZSBj
aGVja2luZyBQYWdlUGlubmVkDQo+IHRocm91Z2ggdGhlIHVuZGVybHlpbmcgcGFnZSBhcyB3
ZSBkbyBub3QgaGF2ZSBhIHBlci1tZW1kZXNjIGFwaSBmb3INCj4gcGFnZSBmbGFncyB5ZXQu
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBWaXNoYWwgTW9vbGEgPHZpc2hhbC5tb29sYUBnbWFp
bC5jb20+DQoNClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+
DQoNCg0KSnVlcmdlbg0K
--------------moBdeYGjNrSgg2fuugMy79vf
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------moBdeYGjNrSgg2fuugMy79vf--

--------------uCZRBKwpO9lYtVcfTExo30um--

--------------mqeEDAX0jgEctDcOkQ0EDxdK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmomlfgFAwAAAAAACgkQsN6d1ii/Ey/+
BQf+MrwoMszO2YF1wyc7UFe2jjUkzG3MxLz8ZDDIfPq5GevYLm96pwvTy1Crl6gEPPPB22CGlJiY
D641+JUpZt9XtdJ23t+p885R7nOtDj6mj6F2vt1kgutnvAf5ez+b/WbzuZh7X9zoN4aSPwJdkVsJ
6b0VXBizvpnOvxGs5U6AfEpRP99o3JpTc37aT6ksuzLtrYLH/xb78OHiI28Pxffau7lZsZDNIAWn
1/SlT86cYVBxgiG4WusRDrjBpFwGKzEsJblea4zdOtmCJEWLF6Xt9+5ZdYdD2HIO6j8ZdxLVlhTO
At8V2crdTjvp9nKmf59yq5rAC7QoRfcgMUgqwT1FwQ==
=Q4h9
-----END PGP SIGNATURE-----

--------------mqeEDAX0jgEctDcOkQ0EDxdK--

