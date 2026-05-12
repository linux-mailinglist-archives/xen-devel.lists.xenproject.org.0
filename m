Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yA3AI/BQA2qR4QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 18:10:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD3552464B
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 18:10:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1307223.1578916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMpgU-0004Lh-U2; Tue, 12 May 2026 16:10:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1307223.1578916; Tue, 12 May 2026 16:10:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMpgU-0004Iq-QM; Tue, 12 May 2026 16:10:14 +0000
Received: by outflank-mailman (input) for mailman id 1307223;
 Tue, 12 May 2026 16:10:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wMpgS-0004HT-HE
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 16:10:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMpgR-004RH4-UH
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 18:10:11 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a0350dd-bab6-0a2a0a5309dd-0a2a4504aab6-8
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 18:10:11 +0200
Received: from [209.85.208.45] (helo=mail-ed1-f45.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 6a0350e3-1dec-0a2a45040019-d155d02dbcc0-3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 18:10:11 +0200
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-67da63ae541so10077971a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 09:10:11 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bd059f10d36sm317917466b.3.2026.05.12.09.10.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 May 2026 09:10:10 -0700 (PDT)
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
        d=suse.com; s=google; t=1778602211; x=1779207011; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9MkvQXAPfDfe0acn5x/x8Uh/+eGu9e6ihqYtWilJKD8=;
        b=foYvtMYKVIsb/ACtm8mGebtorAJDlcKmm1t1+J2iCnJrYW1a35myWLU+QhXP1I1f7U
         HVrMCgjBzluQ8kNBeYtun6nWT6rk4wgABxsOM2q0se4ct0NDM+HuVRmzuR5+o6zh7gYN
         Tl4ynROQm2Q6VdpvZW6Q+154TQ+ZbvEll3uzuEemY4gimyZbFi0Tf2ZzsysxGgfIk6pk
         r3upMEEZ4k32s5hc4g4bhFKocDshBpH8HO1gGZE60ytNHTd4nDHP4ugoXvcq3imti7n3
         Jmjchfo+VvDMphqDTa9TurwwdFJ0LYFsNKIo4eJ80KBEGSAacsyFIPTWkWD6m4iYq5qK
         TdKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778602211; x=1779207011;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9MkvQXAPfDfe0acn5x/x8Uh/+eGu9e6ihqYtWilJKD8=;
        b=iN3eaBb/Iv+Z8Tnj1xHMPiP+eQltt1TvWkgC9augTI5CzQWU1nFlvv5Xkj/6O5rdbH
         akFt4LCBedRbSXH3L7+/KqGNoxQJMnSyF+LfiFgIuegU5Mv/FJKLRwaiZnkR3YDvCqH0
         hX8Kbhimg5mkoWyB4nE3sWvM5HtxbongOI8oViSWIWS9Ir4LwLwO2W4GwBVCjuntHciS
         zu8zvHvUyulIZ0e6pR2VyJUluC1UrMFr1TLpVkcqJ+FZvi2m83TS4oUEYMrnYzc4FtSN
         /r+/XwIayWoC3LF33oHOOfEEliooVXg1Mtnx6nIrGKe4sanyBXQfxURM3JuQgc/pTBRR
         oryg==
X-Forwarded-Encrypted: i=1; AFNElJ8NqLvFIhwgvei8j9gfB0thNBUR6fAqndB/klqSfj7F6RmP+taiq4BJDywJtLJVZcTL8unc8qzTnjQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzqXfXvx0h/5ULHC/x9i77sQkedpeDawjyhnhpaseSFwiPRZpuH
	Ustkd5VpT4JMYdAmb3WTHHYhMh2dqpDb4mAAOBNyJcZ8gldCUvelF6HRmtN+xREnmaQ=
X-Gm-Gg: Acq92OFtQpLOfcMFT4VAktxCmZfPG+flC9Jip2StXaLRrekX1r3FIQmNvByJOM775sj
	fzcs4jUi4nAumcId51fXSQxmhERUm1Y5fz1SJ5qVeHFfm6JdTw/V5lDCyL5WjB098NwN8gDgQM3
	WXgK67v66xZh6ESdwpx08jtHY7Ktf2dOvKZb9EEk905+1/p3Ynf5HsjropsWvI/CZdhPZVaWRVf
	5b73WWVfeNKEIkYM50Pcx5SSZZeNjHtJ6ncVmo/UfrsuVSyXSqv7tsLJZ/1+W+YX2JjqQGWGxDt
	UKTpAsbvIl67/h4xT1v13xUeXHwG2BHMk2JEwk9MLU/Aypks30m1y0LIFimpgNVS9HaYnSivUdL
	Zk5Akj9BTORhsm3UmGlgoARSRNWfm4bcV5x9TBNYyAm6RjDJZlvl297jk6U4ToFTWqsj3cq/QvW
	WZiBGmd79wKieJzGDhuHcCHbVDYlGU+KgYbpRM2/xKEcThAa17mrabXZLN0bQ3WI7QCDnv+cDGO
	jGvR1oi6XbNMorS4LytyndZQDHulkfqFC7m0tdCms4HLq/BO7m1rg==
X-Received: by 2002:a17:907:3d88:b0:bab:d909:b89d with SMTP id a640c23a62f3a-bcc13c95c2amr879902866b.26.1778602211162;
        Tue, 12 May 2026 09:10:11 -0700 (PDT)
Message-ID: <35936020-53e2-463f-846f-f222d75e768c@suse.com>
Date: Tue, 12 May 2026 18:10:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/xen: Tolerate nested XEN_LAZY_MMU entering/leaving
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, kevin.brodsky@arm.com,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org
References: <20260508143933.493013-1-jgross@suse.com>
 <agNPrRfBnRdMCGrE@mail-itl>
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
In-Reply-To: <agNPrRfBnRdMCGrE@mail-itl>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0Tod8Lg01GRoSUt0eYLZ2069"
X-purgate-ID: tlsNG-ebf023/1778602211-2B5683FF-E788D96F/0/0
X-purgate-type: clean
X-purgate-size: 8073
X-Rspamd-Queue-Id: CDD3552464B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.25 / 15.00];
	SIGNED_PGP(-2.00)[];
	R_MIXED_CHARSET(0.83)[subject];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:linux-kernel@vger.kernel.org,m:x86@kernel.org,m:kevin.brodsky@arm.com,m:boris.ostrovsky@oracle.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[invisiblethingslab.com:email,suse.com:email,suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	DKIM_TRACE(0.00)[suse.com:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	HAS_ATTACHMENT(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0Tod8Lg01GRoSUt0eYLZ2069
Content-Type: multipart/mixed; boundary="------------Wy767085Ws1QL0FOH35jU760";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, kevin.brodsky@arm.com,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org
Message-ID: <35936020-53e2-463f-846f-f222d75e768c@suse.com>
Subject: Re: [PATCH] x86/xen: Tolerate nested XEN_LAZY_MMU entering/leaving
References: <20260508143933.493013-1-jgross@suse.com>
 <agNPrRfBnRdMCGrE@mail-itl>
In-Reply-To: <agNPrRfBnRdMCGrE@mail-itl>

--------------Wy767085Ws1QL0FOH35jU760
Content-Type: multipart/mixed; boundary="------------JjmlKxfKwtEwFxHfBuAt65Jq"

--------------JjmlKxfKwtEwFxHfBuAt65Jq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTIuMDUuMjYgMTg6MDUsIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSB3cm90ZToN
Cj4gT24gRnJpLCBNYXkgMDgsIDIwMjYgYXQgMDQ6Mzk6MzNQTSArMDIwMCwgSnVlcmdlbiBH
cm9zcyB3cm90ZToNCj4+IFdpdGggdGhlIHN1cHBvcnQgb2YgbmVzdGVkIGxhenkgbW11IHNl
Y3Rpb25zIGl0IGNhbiBoYXBwZW4gdGhhdA0KPj4gYXJjaF9lbnRlcl9sYXp5X21tdV9tb2Rl
KCkgaXMgYmVpbmcgY2FsbGVkIHR3aWNlIHdpdGhvdXQgYSBjYWxsIG9mDQo+PiBhcmNoX2xl
YXZlX2xhenlfbW11X21vZGUoKSBpbiBiZXR3ZWVuLCBhcyB0aGUgbGF6eV9tbXVfKigpIGhl
bHBlcnMNCj4+IGFyZSBub3QgZGlzYWJsaW5nIHByZWVtcHRpb24gd2hlbiBjaGVja2luZyBm
b3IgbmVzdGVkIGxhenkgbW11DQo+PiBzZWN0aW9ucy4NCj4+DQo+PiBUaGlzIGlzIGEgcHJv
YmxlbSB3aGVuIHJ1bm5pbmcgYXMgYSBYZW4gUFYgZ3Vlc3QsIGFzDQo+PiB4ZW5fZW50ZXJf
bGF6eV9tbXUoKSBhbmQgeGVuX2xlYXZlX2xhenlfbW11KCkgZG9uJ3QgdG9sZXJhdGUgdGhp
cw0KPj4gY2FzZS4NCj4+DQo+PiBGaXggdGhhdCBpbiB4ZW5fZW50ZXJfbGF6eV9tbXUoKSBh
bmQgeGVuX2xlYXZlX2xhenlfbW11KCkgaW4gb3JkZXINCj4+IG5vdCB0byBodXJ0IGFsbCBv
dGhlciBsYXp5IG1tdSBtb2RlIHVzZXJzLg0KPj4NCj4+IEZpeGVzOiAyOTFiM2FiZWQ2NTcg
KCJ4ODYveGVuOiB1c2UgbGF6eV9tbXVfc3RhdGUgd2hlbiBjb250ZXh0LXN3aXRjaGluZyIp
DQo+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+
IA0KPiBJIGhhdmUgcmFuIHNldmVyYWwgdGVzdCBpdGVyYXRpb25zIHdpdGggdGhpcyBwYXRj
aCAob24gdG9wIG9mIDcuMC40KSBhbmQNCj4gaXQgc2VlbXMgdG8gZml4IHRoZSBpc3N1ZS4g
U28sDQo+IA0KPiBUZXN0ZWQtYnk6IE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSA8bWFy
bWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNvbT4NCg0KVGhhbmtzIGZvciB0ZXN0aW5nLg0K
DQo+IA0KPiBJIGRpZCBydW4gc29tZSB0ZXN0cyBhbHNvIHdpdGggMjkxYjNhYmVkNjU3IHJl
dmVydGVkIChpbnN0ZWFkIG9mIHRoaXMNCj4gcGF0Y2gpLCBhbmQgdGhhdCBzZWVtcyB0byB3
b3JrIHRvbywgYnV0IEkgZGlkbid0IHJ1biBlbm91Z2ggb2YNCj4gaXRlcmF0aW9ucyB0byBi
ZSAxMDAlIHN1cmUuIFdvdWxkIGl0IGJlIGhlbHBmdWwgdG8gdGhhdCB0aGF0IGZ1cnRoZXIN
Cj4gdG9vPw0KDQpJIGRvIHByZWZlciBteSB2YXJpYW50LCBhcyBpdCBpcyBvbiBteSBwcmVm
ZXJyZWQgcGF0aCB0byBnZXQgcmlkIG9mIHRoZQ0KWGVuLXByaXZhdGUgbGF6eSBtb2RlIHRy
YWNraW5nLg0KDQpTbyBpbiBteSBwZXJzb25hbCBvcGluaW9uIHlvdSBkb24ndCBuZWVkIHRv
IGNvbnRpbnVlIHRoaXMgdGVzdC4NCg0KDQpKdWVyZ2VuDQo=
--------------JjmlKxfKwtEwFxHfBuAt65Jq
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------JjmlKxfKwtEwFxHfBuAt65Jq--

--------------Wy767085Ws1QL0FOH35jU760--

--------------0Tod8Lg01GRoSUt0eYLZ2069
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmoDUOIFAwAAAAAACgkQsN6d1ii/Ey+R
igf/bLkJbK/E0deKsFcXjFAm3VlBqZmmPWllGpqk1qIJmfsCfE7YkxhY9aJHeDsElcdj/xn7sHWj
b/pHVEUO/+FXaycgDzmxnAehWB7ugaFNyrR7CLprUdNQjH+j8ZODTS/JzfwrkvPbvVbt8YRbu1U2
Grck0XSF6newKzl7yoPYnIQL+CQYMUJqzFOL3neYZbPe1GUbUGkjXUFtNH+AovVR/q7LMNe8vute
ArXHCoMJ1f3Qc18JgTfLY6UPjRcRg9EzXkfVn8SeT4OXuU6gy1nRj8Znuqpk7+4tEo+0pev7EpCA
9wSS1OQVqOEGGltswvcvknsLZAqoaVKYo5MlUbX2Mg==
=dbfb
-----END PGP SIGNATURE-----

--------------0Tod8Lg01GRoSUt0eYLZ2069--

