Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QP/HJV7gpmkPYQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Mar 2026 14:21:34 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 025D11F01AE
	for <lists+xen-devel@lfdr.de>; Tue, 03 Mar 2026 14:21:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1244729.1544105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxPfx-0007JT-BK; Tue, 03 Mar 2026 13:20:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244729.1544105; Tue, 03 Mar 2026 13:20:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxPfx-0007GY-7i; Tue, 03 Mar 2026 13:20:37 +0000
Received: by outflank-mailman (input) for mailman id 1244729;
 Tue, 03 Mar 2026 13:20:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SHXM=BD=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vxPfv-0007GS-QU
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2026 13:20:35 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c21ca7d7-1703-11f1-9ccf-f158ae23cfc8;
 Tue, 03 Mar 2026 14:20:33 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-65f812e0d93so8807671a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 03 Mar 2026 05:20:33 -0800 (PST)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65fac06e3fasm4361347a12.25.2026.03.03.05.20.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Mar 2026 05:20:32 -0800 (PST)
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
X-Inumbo-ID: c21ca7d7-1703-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772544033; x=1773148833; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IyHTfy4ChAtQUQKNdGEJw0gkZCQ6Cw6CCEdl2hNEQNA=;
        b=AkE0enH2jpCGAiIezcAWlmjP1muo09Fj1gwoPaIw1o7OOGeWvbhkFFZuv7aiZGGS+H
         pRTkgz6ISQeGgc9VTH0Try/SZc1yo5BQZNYDIcdlgsstCGd1KA++mCox2Nar3Xe0u+px
         YrRk1HA31l3b0MO5ggFEBDPixO+9QUe637eAAAxAQk17c86PA5HGvFZWYFv7f+ORTked
         SDLzFKjuMVQx9vjQ8PphioWq3sOWGw+HRntnSIOPwUm73JuM4pI46KuObqVY6MZW/aiy
         CEeAN3kGrvugOs2uYCD0hZzyiJWlBT96fE6UFQ54wU51QhTJCEbp1+0bxod9s7ntbygo
         Wcug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772544033; x=1773148833;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IyHTfy4ChAtQUQKNdGEJw0gkZCQ6Cw6CCEdl2hNEQNA=;
        b=pXJxAGzPiDNFGj3xpZ4SM1DmtC1xTQlHfDrSzlBdaQZTiwEpGuYoU+RKZVySN+onfb
         fspYbfhhotsPjDVIMjNjb1LUYYsm5+hdMBb71vGBcmS7hxNov7bY01e//6kDv1PFQSyb
         Q5PF3Loh6jgGVVwaZUn8budU+QXDzoioD7r7tqOWonBE6xU8LWHaOC/0zu3JyJLAKlCE
         Y847QqChPcdKrNqg4RqGZnghVznMrm1yg1Vzn5my3zG4YWD/dW2OSvRjqyjEVUsix1j3
         M5klPzoVvwQdfuLHQ4qT5HO1YD8d4OmAnVCB4UvwHZ2hTnsUGWwi8pS8/01bTN7SisUN
         /A/A==
X-Forwarded-Encrypted: i=1; AJvYcCUTi1/D0+4HXDuLn9qDIeWKq1lRUTWzj+xCZI8dHvbRqpRYaNjfcTetnbxwYZx8SrR+4QXzV+dNiho=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx5xl3+gEe4GcZHy91FZmQidDPGhCeqpLj0ON20ei+kznrVsrSR
	GBLAmUX7qhyMnvPRKsDp4bY1L7hujWF6VYrWs1v38HoyTzgtH8D8+h0iueWBlCg11KI=
X-Gm-Gg: ATEYQzzsCjaIPMLBcBUuq1rge5L5HdLGpmHMX/FutALzRvpRnyZjYiXd4GRGRExBirO
	3mZXa3qpbsSSZP+mf+GMgN8Qc7j79GNx7lhKfiSoZE38uE65rj245GOmmonNOKHZQ62l6ckyUt1
	r0jT2d+9+5ReBJstje9g06ySgTrN1YDpieQz84JH4pEF1PqcVXvaRmmwAytI/ofE9hvlNVknYM7
	UioPlRaNCHreFUhq2QlWlO5DagNcEvHQoz8hY57/d9437Sb+sksA9wBeIcRwb0AYIt1tf1uh5fC
	BlJI7Ovlsy/BA1cLhh8PEVndcEugpWoN4JOONunhSbaGtMC94UQSg7I6m3RswOCH6L6gxpCmval
	GnrNEwq1T6yY2mify31W4Gwo0yIl+hsi3/Sx6YzPJlNUPtwLSY06tPdCFZ+qiLNOKRuDP32GgO0
	usLuAouCSGC12iZv95xVPU/NtXhq8yNrpstG96Qt69knl852i8iUETSs1rTQHZtaqdiYRCOvAmD
	7w34U1AAFIh2VCTRaee7GPgM7+WDcSi+lnxpjtJu5GVxieV3SH/VdWcfwwthuRx
X-Received: by 2002:a05:6402:1441:b0:65b:93ec:597a with SMTP id 4fb4d7f45d1cf-65fddaf6c63mr10019002a12.19.1772544032837;
        Tue, 03 Mar 2026 05:20:32 -0800 (PST)
Message-ID: <f4b8dcee-3bad-4390-baed-05893c8cb01b@suse.com>
Date: Tue, 3 Mar 2026 14:20:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/xen: Build identity mapping page tables dynamically
 for XENPV
To: Hou Wenlong <houwenlong.hwl@antgroup.com>, linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Ard Biesheuvel <ardb@kernel.org>, Thomas Huth <thuth@redhat.com>,
 Kiryl Shutsemau <kas@kernel.org>, Uros Bizjak <ubizjak@gmail.com>,
 Brian Gerst <brgerst@gmail.com>, xen-devel@lists.xenproject.org
References: <453981eae7e8158307f971d1632d5023adbe03c3.1769074722.git.houwenlong.hwl@antgroup.com>
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
In-Reply-To: <453981eae7e8158307f971d1632d5023adbe03c3.1769074722.git.houwenlong.hwl@antgroup.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------dFm50epvwnn00HLquSsmw60X"
X-Rspamd-Queue-Id: 025D11F01AE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,antgroup.com:email];
	FREEMAIL_CC(0.00)[kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,oracle.com,gmail.com,lists.xenproject.org];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:houwenlong.hwl@antgroup.com,m:linux-kernel@vger.kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:boris.ostrovsky@oracle.com,m:ardb@kernel.org,m:thuth@redhat.com,m:kas@kernel.org,m:ubizjak@gmail.com,m:brgerst@gmail.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
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
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------dFm50epvwnn00HLquSsmw60X
Content-Type: multipart/mixed; boundary="------------SGsrkd5BzX8g0Fguu5dFgezN";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Hou Wenlong <houwenlong.hwl@antgroup.com>, linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Ard Biesheuvel <ardb@kernel.org>, Thomas Huth <thuth@redhat.com>,
 Kiryl Shutsemau <kas@kernel.org>, Uros Bizjak <ubizjak@gmail.com>,
 Brian Gerst <brgerst@gmail.com>, xen-devel@lists.xenproject.org
Message-ID: <f4b8dcee-3bad-4390-baed-05893c8cb01b@suse.com>
Subject: Re: [PATCH] x86/xen: Build identity mapping page tables dynamically
 for XENPV
References: <453981eae7e8158307f971d1632d5023adbe03c3.1769074722.git.houwenlong.hwl@antgroup.com>
In-Reply-To: <453981eae7e8158307f971d1632d5023adbe03c3.1769074722.git.houwenlong.hwl@antgroup.com>

--------------SGsrkd5BzX8g0Fguu5dFgezN
Content-Type: multipart/mixed; boundary="------------iStjZp5Q40kns7twP9sTAhHN"

--------------iStjZp5Q40kns7twP9sTAhHN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjIuMDEuMjYgMTE6MDYsIEhvdSBXZW5sb25nIHdyb3RlOg0KPiBBZnRlciBjb21taXQg
NDdmZmUwNTc4YWVlICgieDg2L3B2aDogQWRkIDY0Yml0IHJlbG9jYXRpb24gcGFnZSB0YWJs
ZXMiKSwNCj4gdGhlIFBWSCBlbnRyeSB1c2VzIGEgbmV3IHNldCBvZiBwYWdlIHRhYmxlcyBp
bnN0ZWFkIG9mIHRoZQ0KPiBwcmVjb25zdHJ1Y3RlZCBwYWdlIHRhYmxlcyBpbiBoZWFkNjQu
Uy4gU2luY2UgdGhvc2UgcHJlY29uc3RydWN0ZWQgcGFnZQ0KPiB0YWJsZXMgYXJlIG9ubHkg
dXNlZCBpbiBYRU5QViBub3cgYW5kIFhFTlBWIGRvZXMgbm90IGFjdHVhbGx5IG5lZWQgdGhl
DQo+IHByZWNvbnN0cnVjdGVkIGlkZW50aXR5IHBhZ2UgdGFibGVzIGRpcmVjdGx5LCB0aGV5
IGNhbiBiZSBmaWxsZWQgaW4NCj4geGVuX3NldHVwX2tlcm5lbF9wYWdldGFibGUoKS4gVGhl
cmVmb3JlLCBidWlsZCB0aGUgaWRlbnRpdHkgbWFwcGluZyBwYWdlDQo+IHRhYmxlIGR5bmFt
aWNhbGx5IHRvIHJlbW92ZSB0aGUgcHJlY29uc3RydWN0ZWQgcGFnZSB0YWJsZXMgYW5kIG1h
a2UgdGhlDQo+IGNvZGUgY2xlYW5lci4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEhvdSBXZW5s
b25nIDxob3V3ZW5sb25nLmh3bEBhbnRncm91cC5jb20+DQoNClJldmlld2VkLWJ5OiBKdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQoNCkknbGwgdGFrZSB0aGlzIG9uZSB2aWEg
dGhlIFhlbiB0cmVlLg0KDQoNCkp1ZXJnZW4NCg==
--------------iStjZp5Q40kns7twP9sTAhHN
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------iStjZp5Q40kns7twP9sTAhHN--

--------------SGsrkd5BzX8g0Fguu5dFgezN--

--------------dFm50epvwnn00HLquSsmw60X
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmmm4B8FAwAAAAAACgkQsN6d1ii/Ey9u
Fgf/Yiro9lkd7nF1IFHHgUphBmzAbgER5ArgkRnzF55OSXKc+z0T/Su7v1wlNDF3GGyMCti0FXl9
7UmNTXtUi7SBEfvtGDHVpzblInfXbTs4iluL2azKmMEwq3OlBhEGLvH3bX7+sEtDfgb700BfeWYQ
1bBcTs4r2+pDtWJnkQOZtUMQ2w8ennd3NPUjeBZb3qaUgBdCXRgt96J1XosvzhAgvhlw249RmbdN
dGJ49ebpe1YgOD8oJwnTe7v1IS+Q+V6yBEcsJxGwW9fTo4xYgf6nJSGy1kNtnZ7rSqUq50i1ahpC
twMnMLZpymY4PVZSRJ9Q5+MCR4nxzm8jAo0rfFJLRg==
=r39c
-----END PGP SIGNATURE-----

--------------dFm50epvwnn00HLquSsmw60X--

