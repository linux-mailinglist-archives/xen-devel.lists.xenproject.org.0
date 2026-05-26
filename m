Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJ53KIxtFWojVAcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 11:53:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D84AB5D3BA2
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 11:53:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1319758.1587232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRoT9-0006Qr-Dj; Tue, 26 May 2026 09:53:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1319758.1587232; Tue, 26 May 2026 09:53:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRoT9-0006Nv-BB; Tue, 26 May 2026 09:53:03 +0000
Received: by outflank-mailman (input) for mailman id 1319758;
 Tue, 26 May 2026 09:53:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wRoT7-0006Np-RJ
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 09:53:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRoT6-009xEp-W1
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 11:53:01 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a156d6b-5cb7-0a2a0a5109dd-0a2a45079332-24
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 11:53:00 +0200
Received: from [209.85.218.49] (helo=mail-ej1-f49.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 6a156d7c-229c-0a2a45070019-d155da31e0cc-3
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 11:53:00 +0200
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-bd01481e592so1432492166b.2
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 02:53:00 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bddc65dbd3bsm492049066b.54.2026.05.26.02.52.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 May 2026 02:52:59 -0700 (PDT)
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
        d=suse.com; s=google; t=1779789180; x=1780393980; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=azYsi5cAqszAW4us9NmlOoFAFK3CU+iDXBFTRZwMd/Y=;
        b=dnc9lONj+2IiZxodt5RUj030SGt/fU3DAQvVrHq9oVio9jP+te6D5zFy4VaDH8d+nz
         wEJXNMomRPcHk54laenyuhi1qKXJ6gUqB9kw7zqbqyFq7yDf/aPvNIoP4aTzl91Zr5Bh
         qKwF6+wDS4f1jmsXNtPEWlDIw+nmAI4ggCVVSpqEC8kUPk8Zmnd8M01kuoxkMqjkNamP
         9/RBOZmp2HVpNMlHWhxo5plOiK5ayW5rOFLODCCOl8ak0nQxvlSAFThSvc6oosJITuX2
         sERrwl4Qc/kXsqYnKX90UUJpeReTl+EbaMnToMj9qwiMEbvsOZt1sZbEo0B1+i7lPJS4
         KvPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779789180; x=1780393980;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=azYsi5cAqszAW4us9NmlOoFAFK3CU+iDXBFTRZwMd/Y=;
        b=UWQ7wnRGrh/Nze3o0YDZv7xKjg9NVi6hLsInOjw+AmWlczktQsVp2tp44JtHN31n4G
         xQWPCm73ueRAbDLCBDWT2MPDU0n1kTPxt6JIlaVJ1k5fHjqbMXJ9yQhMworTMm9ku9WT
         KSAvhDbgT4mj42u7oL8ChGSGikGRSwPRChwO9Ua4KHEJ5cXyVARQOwTtNOsgTfcjHSUY
         JHfyQSfbHU5DlE5mQsDBRALzDA/e2aiSWd/cY7dKTUwZyKD4wj7Kvk4MjfAnkYE2+bKc
         N2brgHb8q6C60qchu1VDs4+0JSkUnB14SYy1n5IsccrwAQ9j8JLTWlcgq6GuU4SGAP0s
         ogzQ==
X-Forwarded-Encrypted: i=1; AFNElJ879jfWG9+4C/3tIzgz7MesUq80+Pf03hV0wrc1Ez//LIC9KXoB+0jB+o2IhI9KfcrOLO9urIZdUr4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy81/P4J8mjobZ/KLY5p3n9mK48sbq/nhEjxS0VCcpkHPgEqYAJ
	VSccQG6nQ1UyWlvZg1HyOPajEpVV+leShXFgmoFy9jD+U+L5ukrDfbCJFK1pmRSY5z8=
X-Gm-Gg: Acq92OFSfSFr7TsT3T3LG0uBQT7uxB+sOMDc+CkQnWfQZn76lpzJ/fZ/eB8W1TwDKI8
	kw0JyXUo3YDiQfY1NrHt2PnSy04+ZQbgMkTV3FseEx80PnBFZzgCsl4vJmqMqsAfqNrZnV9I/Bd
	7ixbCQBR/mNu/N7Yu4LMO+3r69hOTwtrNYS4MRcHkpiEg6Ief08pGBIYBbT+sF8Sd7CdgQAOGjH
	QzN78WaDanDpt5dJNcTJlChFuCwCZiyozfPl26uD1OS3MI85OY6ayrXTqQ5tyocNG7AFjDYCxuh
	8JDjk5W+kNWVxRdybywIZbE08DIIKPj07OcjHRsPFjTGRJHP0YaP+bu5R5ZOWVvRpGpQWw05Y1b
	87lso+3kOjn51PHIpBwNd7JhhDPlOQ+lRGP2ImDBml8I+xzgdyquJ5E4vjQOxI7GZ1c0VCD9V/n
	aWx4OUhHLUVbhHJe1GHPGe9xIAqgm3q2/MaJ5fzs54g2bsdT41LR/+UOXsbFDe65EjlRzy3Qt3b
	8PcQv8sp7xemLRfr7S3qR5KNw1rTRZnaqfuoFFmDXylEYlM269O0g==
X-Received: by 2002:a17:906:9fca:b0:bb8:b593:edba with SMTP id a640c23a62f3a-bdd268c0933mr1035680666b.38.1779789180260;
        Tue, 26 May 2026 02:53:00 -0700 (PDT)
Message-ID: <3aaa12b1-042b-453d-94d2-9305afa15ff2@suse.com>
Date: Tue, 26 May 2026 11:52:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] x86/asm, x86/boot: expose inline memcmp
To: Mauricio Faria de Oliveira <mfo@igalia.com>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Alexey Dobriyan <adobriyan@gmail.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20260520-pvh-kasan-inline-v3-0-bede769c6ec7@igalia.com>
 <20260520-pvh-kasan-inline-v3-2-bede769c6ec7@igalia.com>
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
In-Reply-To: <20260520-pvh-kasan-inline-v3-2-bede769c6ec7@igalia.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------e0zVQwFgDO0B1eS5FGXsOHUm"
X-purgate-ID: tlsNG-ef75cf/1779789180-22F76C48-F17DD51E/0/0
X-purgate-type: clean
X-purgate-size: 7042
X-Spamd-Result: default: False [-2.08 / 15.00];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mfo@igalia.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:adobriyan@gmail.com,m:boris.ostrovsky@oracle.com,m:kernel-dev@igalia.com,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,igalia.com:email,suse.com:email,suse.com:mid,suse.com:dkim];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[igalia.com,kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,gmail.com,oracle.com];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	HAS_ATTACHMENT(0.00)[];
	NEURAL_HAM(-0.00)[-0.345];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D84AB5D3BA2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------e0zVQwFgDO0B1eS5FGXsOHUm
Content-Type: multipart/mixed; boundary="------------eTOsP77i9qv2Y2J0nooRQzYX";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Mauricio Faria de Oliveira <mfo@igalia.com>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Alexey Dobriyan <adobriyan@gmail.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
Message-ID: <3aaa12b1-042b-453d-94d2-9305afa15ff2@suse.com>
Subject: Re: [PATCH v3 2/4] x86/asm, x86/boot: expose inline memcmp
References: <20260520-pvh-kasan-inline-v3-0-bede769c6ec7@igalia.com>
 <20260520-pvh-kasan-inline-v3-2-bede769c6ec7@igalia.com>
In-Reply-To: <20260520-pvh-kasan-inline-v3-2-bede769c6ec7@igalia.com>

--------------eTOsP77i9qv2Y2J0nooRQzYX
Content-Type: multipart/mixed; boundary="------------BXbf0LBiH8UsRo4K4do9SRvx"

--------------BXbf0LBiH8UsRo4K4do9SRvx
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjAuMDUuMjYgMjM6MTIsIE1hdXJpY2lvIEZhcmlhIGRlIE9saXZlaXJhIHdyb3RlOg0K
PiBNb3ZlIHRoZSBpbmxpbmUgbWVtY21wIGZ1bmN0aW9uIGN1cnJlbnRseSBvbmx5IGF2YWls
YWJsZSBpbiAnYm9vdC9zdHJpbmcuYycNCj4gYW5kIGl0cyB1c2VycyAoZWcsICdib290L2Nv
bXByZXNzZWQvc3RyaW5nLmMnIGFuZCAncHVyZ2F0b3J5L3B1cmdhdG9yeS5ybycpDQo+IGlu
dG8gdGhlIGlubGluZSBzdHJpbmcgZnVuY3Rpb25zIGhlYWRlciA8YXNtL3N0cmluZ19pbmxp
bmUuaD4gdG8gYmUgcmV1c2VkLg0KPiANCj4gTm90ZSB0aGF0IHRoZSBpbmxpbmUgbWVtY21w
KCkgcmV0dXJucyAwLzEsIG5vdCAtMS8wLzEgYXMgcmVndWxhciBtZW1jbXAoKQ0KPiAocmVw
b3J0ZWQgYnkgRGF2aWQgTGFpZ2h0IDxkYXZpZC5sYWlnaHQubGludXhAZ21haWwuY29tPiks
IHdoaWNoIGlzIG5vdA0KPiBjYXVzZWQgb3IgY2hhbmdlZCBieSB0aGlzIGNvbW1pdDsgdGhp
cyB3aWxsIGJlIGFkZHJlc3NlZCBzZXBhcmF0ZWx5Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTog
TWF1cmljaW8gRmFyaWEgZGUgT2xpdmVpcmEgPG1mb0BpZ2FsaWEuY29tPg0KDQpSZXZpZXdl
ZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KDQoNCkp1ZXJnZW4NCg==

--------------BXbf0LBiH8UsRo4K4do9SRvx
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------BXbf0LBiH8UsRo4K4do9SRvx--

--------------eTOsP77i9qv2Y2J0nooRQzYX--

--------------e0zVQwFgDO0B1eS5FGXsOHUm
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmoVbXsFAwAAAAAACgkQsN6d1ii/Ey+y
Lwf+Ph/SEvGokyW06pJamBC5EBcOFOQAi9Dpb9jQcnP4qMgJzvkKh+E3PlYd+VKN7YJkgdaMpszl
QX9ytMs54ADAR05gdNt9uyMmfm6XE8SIHGLCG8qC/YEykD+XzRwbC0i8c519NCmBOwOOymH8gkAa
5wL30LDpIepaUJd9Hn+BBCtW5ccIw90G3306XaXCTaKJauectXjp2UMuLut/AR2RqG1FfurLgoAS
l85xS+nZt6VlNQiUmpnClnyQtkZCOnCqP6RwpgcoC9Fuzwc8+vf/VSdZ7oJLqOo/uLQ+SeUr44JH
+iCNLtiQTR0yl+V3/Tf4VTKBdgGyJ/G10GMyiyOe7w==
=o3oP
-----END PGP SIGNATURE-----

--------------e0zVQwFgDO0B1eS5FGXsOHUm--

