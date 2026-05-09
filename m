Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFqPBjjV/mmcwwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 09 May 2026 08:33:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB3C4FE423
	for <lists+xen-devel@lfdr.de>; Sat, 09 May 2026 08:33:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1304467.1577481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLbEm-0000wP-QB; Sat, 09 May 2026 06:32:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1304467.1577481; Sat, 09 May 2026 06:32:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLbEm-0000uu-Mi; Sat, 09 May 2026 06:32:32 +0000
Received: by outflank-mailman (input) for mailman id 1304467;
 Sat, 09 May 2026 06:32:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wLbEl-0000uo-1i
 for xen-devel@lists.xenproject.org; Sat, 09 May 2026 06:32:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLbEk-007LIm-Av
 for xen-devel@lists.xenproject.org; Sat, 09 May 2026 08:32:30 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 69fed4e3-bab6-0a2a0a5309dd-0a2a4505ca8a-26
 for <xen-devel@lists.xenproject.org>; Sat, 09 May 2026 08:32:30 +0200
Received: from [209.85.218.43] (helo=mail-ej1-f43.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 69fed4fd-aaa8-0a2a45050019-d155da2bd87b-3
 for <xen-devel@lists.xenproject.org>; Sat, 09 May 2026 08:32:30 +0200
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-bcc9fdc959cso4099166b.2
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 23:32:30 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bcac02c834dsm189935566b.8.2026.05.08.23.32.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 May 2026 23:32:28 -0700 (PDT)
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
        d=suse.com; s=google; t=1778308349; x=1778913149; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Dx8/AKdgRRMuoOUwfUi6WK37kQ1YEVHdNdU+rtdAlP8=;
        b=UxvZWGGfWCq4tyPvniOxAWyJhKpdGbM2DOoeDKp81OsQSyLx6M04hzmJx4FGaqUxIL
         kWdA/0p0NixvXwckRnEuaI3dhVxMM7k0JazOn/h3OATV6jHfW30uCw++2AK8Iof8D5wB
         LAcbAVw1q9iyweAhIUT538f4ryBSt2kQugd8LABFx/uDufBMqWLhwaBwMuOrrDbS0Mns
         trVkCXRjBNwwTzJfZT1o+d7/JEwljrkSZpw/RyE2d/ojhfKY3eRqanQ8+IVymNELmBNs
         rOkvZSLu2iqVSjILJSsAOD4ojBG5ok1a0zpO4OWrGQLm/cL/bXSXprvG2u8IvHI94727
         dAjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778308349; x=1778913149;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dx8/AKdgRRMuoOUwfUi6WK37kQ1YEVHdNdU+rtdAlP8=;
        b=Y7sLt3bY+pewHinLgHyzVqiLGMiZc+IfKeMXUZEu7BtY63eDbwJBVlfU7//QVQNows
         EnKAqUTLhYUiDKnNqcldeLhciqFe+PQapN6RD159OX9mrT/4k5SoL2y3wA0VjAZ8iPAV
         x3vvNVACu83M7STOTGBUCDvM6mZyNyBYZZ+kju2hq9uxbPECqzLKjE8lC1XfbumJJZlB
         flx7Bi6MW+J0ZVs56ly7Ao3aAIJIV7Gdd3zPxHTeBqHzT0v37qWzmcL50iEwBSUPYCYN
         XISHLT3XoOZsh+eyKpS3yNBVvrWBjfGvqLTZRW2sVn0Dj7E5NHYLCdjRvau2x1RCPjmK
         lBGg==
X-Forwarded-Encrypted: i=1; AFNElJ/l4x23gDCenncTKFtOKWLjD8kG2bFNwa69G7JffGyKXrUII8nihqLEZAujeub5T6gPjMiCGxtOOVg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxNoDQj7ixYlJJfNvfJ6sLpPFiEz/1046t8Flvmch8iNlupGim/
	9sudokabsA6NCJg2rfpAutV5vpYmGugKZ4HxxSXQN+MDtzKqdw1WrSnsh6XUkWchmSc=
X-Gm-Gg: Acq92OG5bk0SY+J4CAkC00cr4JAz44yf8/KTI48142TJCBfbxqAVwDOITxT9bXjnRjG
	eubFebvIDGfgL7LHR08wVdrq18l3EvaB//XPOVktv0E8dI5wVVzFl4xGSaiT3AMwxvHv+SQN531
	yLCMXIuMicqpY4KzY381sJ/EFNrzTdsp++6nnpDNZdezNwwMf2SoIuTkByktL6zku1GNuAFJnBz
	/0b1VvoknVG0qorKwE3hiQfnolfP63vTfbf6sZPLPYtaYNeL6hSw0SipDNhli3ooh5twsC+x5CV
	hdSY4HGVh9htgL63nNlWHGHn2TMO2bsr/mKk/GwvAOQePpxZDkF7Q629LGxSHDnCdwVhOQ7pFM1
	7740EY7RBKpgSbj8PegzSjEc8rlEcN2elA/KOqf2HTBMlTUZelxW6bxuD6j0seOMKsYkP62QmJD
	PhxnxupkOeg43CxrPUgz003e5mNlfbP6Qv5uvNQSsL+2T0km4RF6TPkzcjiynF2iuwgx4LTpxRx
	etvnkEJ2aBwnt4e4PbtCw6PTc8mQbTHzLPi3zvEBGKwOvx2VZafyg==
X-Received: by 2002:a17:906:ee84:b0:bb2:71a9:37d7 with SMTP id a640c23a62f3a-bc56dd1a539mr944804666b.39.1778308349353;
        Fri, 08 May 2026 23:32:29 -0700 (PDT)
Message-ID: <36fc4317-d7a0-410c-9d95-28858018053c@suse.com>
Date: Sat, 9 May 2026 08:32:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/xen: Tolerate nested XEN_LAZY_MMU entering/leaving
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org
Cc: marmarek@invisiblethingslab.com,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org
References: <20260508143933.493013-1-jgross@suse.com>
 <362bc938-18ea-4f6a-938a-893dfb1c956d@arm.com>
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
In-Reply-To: <362bc938-18ea-4f6a-938a-893dfb1c956d@arm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------yQe00ZL7pHPDBzCDdn2c0s4x"
X-purgate-ID: tlsNG-c201ff/1778308350-E3B8E443-69F41CA8/0/0
X-purgate-type: clean
X-purgate-size: 7999
X-Rspamd-Queue-Id: 4CB3C4FE423
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.25 / 15.00];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	R_MIXED_CHARSET(0.83)[subject];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kevin.brodsky@arm.com,m:linux-kernel@vger.kernel.org,m:x86@kernel.org,m:marmarek@invisiblethingslab.com,m:boris.ostrovsky@oracle.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	HAS_ATTACHMENT(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------yQe00ZL7pHPDBzCDdn2c0s4x
Content-Type: multipart/mixed; boundary="------------ep6tsSF0uwnyPXMR3gMS8gVC";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org
Cc: marmarek@invisiblethingslab.com,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org
Message-ID: <36fc4317-d7a0-410c-9d95-28858018053c@suse.com>
Subject: Re: [PATCH] x86/xen: Tolerate nested XEN_LAZY_MMU entering/leaving
References: <20260508143933.493013-1-jgross@suse.com>
 <362bc938-18ea-4f6a-938a-893dfb1c956d@arm.com>
In-Reply-To: <362bc938-18ea-4f6a-938a-893dfb1c956d@arm.com>

--------------ep6tsSF0uwnyPXMR3gMS8gVC
Content-Type: multipart/mixed; boundary="------------m4M3UMd5trYCjNeUTP33zbJF"

--------------m4M3UMd5trYCjNeUTP33zbJF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDguMDUuMjYgMjI6NTQsIEtldmluIEJyb2Rza3kgd3JvdGU6DQo+IE9uIDA4LzA1LzIw
MjYgMTY6MzksIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBXaXRoIHRoZSBzdXBwb3J0IG9m
IG5lc3RlZCBsYXp5IG1tdSBzZWN0aW9ucyBpdCBjYW4gaGFwcGVuIHRoYXQNCj4+IGFyY2hf
ZW50ZXJfbGF6eV9tbXVfbW9kZSgpIGlzIGJlaW5nIGNhbGxlZCB0d2ljZSB3aXRob3V0IGEg
Y2FsbCBvZg0KPj4gYXJjaF9sZWF2ZV9sYXp5X21tdV9tb2RlKCkgaW4gYmV0d2VlbiwgYXMg
dGhlIGxhenlfbW11XyooKSBoZWxwZXJzDQo+PiBhcmUgbm90IGRpc2FibGluZyBwcmVlbXB0
aW9uIHdoZW4gY2hlY2tpbmcgZm9yIG5lc3RlZCBsYXp5IG1tdQ0KPj4gc2VjdGlvbnMuDQo+
IA0KPiBJIHRoaW5rIHRoaXMgaXMgYSBjb3JyZWN0IGRlc2NyaXB0aW9uIG9mIHRoZSBpc3N1
ZSwgaS5lLiBwb3RlbnRpYWxseSB3ZQ0KPiBoYXZlIGFyY2hfZW50ZXJfbGF6eV9tbXVfbW9k
ZSgpIGNhbGxlZCB0d2ljZSAqc2VxdWVudGlhbGx5Ki4gVGhlcmVmb3JlIEkNCj4gZG9uJ3Qg
dGhpbmsgdGhhdCBkaXNhYmxpbmcgcHJlZW1wdGlvbiBpbnNpZGUgYXJjaF9lbnRlcl9sYXp5
X21tdV9tb2RlKCkNCj4gaXMgZW5vdWdoIC0gd2UgaGF2ZSBhIHByb2JsZW0gd2l0aCBwcmVl
bXB0aW9uIG9jY3VycmluZyBpbnNpZGUNCj4gbGF6eV9tbXVfbW9kZV9lbmFibGUoKSBnZW5l
cmFsbHksIG5vdCBuZWNlc3NhcmlseSBpbnNpZGUNCj4gYXJjaF9lbnRlcl9sYXp5X21tdV9t
b2RlKCkuDQo+IA0KPiBQcmVlbXB0aW9uIHNob3VsZG4ndCBtYXR0ZXIgaWYgY29tbWl0IDI5
MWIzYWJlZDY1NyBpcyByZXZlcnRlZC4gQUZBSUNUDQo+IHRoaXMgaXMgdGhlIG9ubHkgZWFz
eSBmaXguDQpUaGUgZGVzY3JpcHRpb24gd2Fzbid0IHJlYWxseSBjb21wbGV0ZSwgSSB0aGlu
ay4NCg0KVGhlIGRvdWJsZSBjYWxsIHdpbGwgb25seSBiZSBwb3NzaWJsZSBpZiBhcmNoX2Vu
ZF9jb250ZXh0X3N3aXRjaCgpIGlzDQpjYWxsaW5nIGFyY2hfZW50ZXJfbGF6eV9tbXVfbW9k
ZSgpLCBhbmQgdGhpcyBpcyBoYXBwZW5pbmcgZm9yIFhlbiBQViBvbmx5Lg0KYXJjaF9lbmRf
Y29udGV4dF9zd2l0Y2goKSBpcyBhIG5vcCBmb3IgYWxsIG90aGVyIGNhc2VzLg0KDQpTbyB0
aGlzIGNhbiBiZSBoYW5kbGVkIGNvbXBsZXRlbHkgaW50ZXJuYWwgb2YgWGVuIChvdGhlcndp
c2UgYSByZXZlcnQgb2YNCjI5MWIzYWJlZDY1NyB3b3VsZG4ndCBoZWxwKSwgYW5kIGl0IGlz
IGVhc3kgdG8gZG8gc28gYXMgbXkgcGF0Y2ggaXMNCnNob3dpbmcuDQoNCkFzIHNhaWQsIEkn
ZCBsaWtlIHRvIGdldCByaWQgb2YgdGhlIGV4dHJhIHRyYWNraW5nIGJ5IFhlbiByZWdhcmRp
bmcgbGF6eSBtb2RlLg0KDQoNCkp1ZXJnZW4NCg==
--------------m4M3UMd5trYCjNeUTP33zbJF
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------m4M3UMd5trYCjNeUTP33zbJF--

--------------ep6tsSF0uwnyPXMR3gMS8gVC--

--------------yQe00ZL7pHPDBzCDdn2c0s4x
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmn+1PwFAwAAAAAACgkQsN6d1ii/Ey/p
eAgAmT5Sdo76MTzgwv4f7jjkBKC1GgDHVZxmoCAdy6dHTVCw42kN6mGpOD50J26LyVsoLJZuv4TQ
AVtfEDHAQa1aeQFDUntBqMHRVy50IsRvDLujI+Mgnb8LOoqlxLR+8pfF/FmQ2iK0143BOtrpO6St
pCDHh9EYZi7voawyisb1U1gPenvgfRV+LVDDSBm4QikXgoPYPZ8g6kHQhi0uhzj6XpWGd7SfcIid
QsOSqOhKE9AqFGDuM6AQzjcf8AK88DBGzFBHvEjvuz4YOc+gJqTIwjnUEo5Ss6KVOqDlWGMUUvFs
tWEwI/2KKZepFBlimv7qvL847PzYUD4p6j77FbjrSQ==
=HeqP
-----END PGP SIGNATURE-----

--------------yQe00ZL7pHPDBzCDdn2c0s4x--

