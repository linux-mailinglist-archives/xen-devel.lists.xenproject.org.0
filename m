Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AIoXIo1C6mm1xQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 18:02:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA204549FA
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 18:02:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1292372.1570845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFwV5-0005cv-UG; Thu, 23 Apr 2026 16:01:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1292372.1570845; Thu, 23 Apr 2026 16:01:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFwV5-0005bB-RI; Thu, 23 Apr 2026 16:01:59 +0000
Received: by outflank-mailman (input) for mailman id 1292372;
 Thu, 23 Apr 2026 16:01:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wFwV3-0005av-Uv
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 16:01:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFwV3-004s8t-Bz
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 18:01:57 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 69ea4268-2eae-0a2a0a5409dd-0a2a4505be94-44
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 18:01:57 +0200
Received: from [209.85.208.54] (helo=mail-ed1-f54.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 69ea4274-aaa8-0a2a45050019-d155d036b9ae-3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 18:01:56 +0200
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-671c5eb7fb0so8454844a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 09:01:56 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-672c4d4590asm4166136a12.19.2026.04.23.09.01.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Apr 2026 09:01:55 -0700 (PDT)
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
        d=suse.com; s=google; t=1776960116; x=1777564916; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NgjG39TDSKA6ylzEYt8Mo9D4rrySu1X1DTlV/FlhVOI=;
        b=YqR1g37ooB2yNiHEsyYIbWl8zNGHUC5m+MqxhrLw+0BUM+64/OOzAEEsFuIr31CNHU
         Xxl65p1X7ZMQ7arObqErxBTZTtOLGo5lrKQ/JdlX2+QEXKjyGS4/Fo+pdcdI/DvOqHsk
         mDuYHPBN6WPKGt2a8Bhal6zI4ha9qbejh0+4Ce6gIsKStGwtgfGei+iFvAG/ijI6CRNT
         oiinBcCn5S15AvfpuaRKYGked0+GpcMyudutUmNZAbjvxQdNi9e2leqPaI/DNtHcJggX
         3ztpLtRwLDcnHnBznjVTvB7VS0AUTGJ5wYMvJbUzMJp+aQAIUXyVlCsoz43S4OGa1kI/
         OpAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776960116; x=1777564916;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NgjG39TDSKA6ylzEYt8Mo9D4rrySu1X1DTlV/FlhVOI=;
        b=DrNoLhCbKgdZvVIjlIwrOA4seqWBeiWF8O6iAAL1ShxoH5VlXNEqcijhiqtFiCizwX
         POGZ5u3/3jcX2+yblgpIzrrjX/Lhol0Tf63g87K6kLNbmOXw3XLaiNMBuI9dFznakQUp
         /bsW2N2twNhlgMa1OQy05JwdCpbhy0mtQHw7ovsmrxEB+5o09Up3GbF6TOkuqMD9SQM9
         TGjFZpWb1XN2G5VnclZPS0sB26hdpFA2hIZ8mbArCuXXnkHZkMbGRxenfL60kbPib37Z
         7L8EJ7B0wpr9EoRrjf5nspalBWfavYtIuru4c8iDk6T87WzQutI5k6gFN8a6OB23xf6G
         s0xg==
X-Forwarded-Encrypted: i=1; AFNElJ9pvs0BBx6M/0CYsCn2Tg+G3JKBnM2LD/CWZAURanAq82quHgsbjeJ3RtXY41iAGJswYVHiiDLrHPM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx4dHvgnuEFBEzDT8L8OTVYdNtSjPU8MHIGmmuaKHZrCk7pQDEA
	Dq7LEoqwxAO/RH+/O874SVp3WHkP7F6fab96yIRVEjvLvTmM2Tgz01IFZiTib75CnIg=
X-Gm-Gg: AeBDiev/8sEsbtupNluh2FljF58/hT2/KS2hTA+MRiVi0qrFDCe4MKS19nDUfZDaD1j
	ZuOwvXT8umkVOSJSKdJeEfM6viYSAB6cxdOQuCBaiHmqUsf7c+yxADtfw+J5cedcrQ306P9s4gY
	27KtYDG9/71EpfArWNAk28KyLxeJj9DnABPyk538/bl95dS+kww9BPbh6PpvnGhwpccNrcBGZu3
	NglklvGHUwwKdYj0h5YJm2Qb5MWDcTwHG+Ymx2EpYqs3IsjCV+muXmgHYiMqWG+R7cyaSqfLlVf
	2sL+Yf33pDNY5VY90KBK1aJxCtlwlf4DyFPmLB/oHmYLfzhVCnvsYwbyzKBZ6ZYyRD/eI5qifry
	mKQkFjXWEQPAUdBvpU081Xcroh/29b5JJv+a6yugD80NaUiCsmuzPxoPDDh9RGSXCRXlyuheB9X
	kWCfdJ+eT3PDTdE1NJeakJn9md7j/QP4fn6f3/XG3BWLERY8G0cHXttksH9eOLB6vLh0JvFDaMI
	R9JvaBhTwxL/hCXuoen8oe/J8gSAjM0RRtYDkQVh+lbJw5agXtHXR3XS9Gmn2si
X-Received: by 2002:a05:6402:2787:b0:674:e53b:f27f with SMTP id 4fb4d7f45d1cf-674e53c4150mr9292067a12.11.1776960116179;
        Thu, 23 Apr 2026 09:01:56 -0700 (PDT)
Message-ID: <cac4a724-e5a4-4aeb-8bcd-e9cb6102746d@suse.com>
Date: Thu, 23 Apr 2026 18:01:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] x86/pvh: fix unbootable VMs by really inlining
 memset() in xen_prepare_pvh()
To: Mauricio Faria de Oliveira <mfo@igalia.com>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Alexey Dobriyan <adobriyan@gmail.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20260422-pvh-kasan-inline-v1-0-7e6194344c92@igalia.com>
 <20260422-pvh-kasan-inline-v1-3-7e6194344c92@igalia.com>
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
In-Reply-To: <20260422-pvh-kasan-inline-v1-3-7e6194344c92@igalia.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Kv9C1D7bZKvIbKJ9eg5VEh4P"
X-purgate-ID: tlsNG-c201ff/1776960116-2B961443-E36E6B2B/0/0
X-purgate-type: clean
X-purgate-size: 7157
X-Spamd-Result: default: False [-1.53 / 15.00];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	R_MIXED_CHARSET(0.56)[subject];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mfo@igalia.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:adobriyan@gmail.com,m:boris.ostrovsky@oracle.com,m:kernel-dev@igalia.com,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[igalia.com,kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,gmail.com,oracle.com];
	RCVD_COUNT_SEVEN(0.00)[10];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	ARC_NA(0.00)[];
	ASN_FAIL(0.00)[120.175.237.192.asn.rspamd.com:query timed out];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,igalia.com:email,suse.com:email,suse.com:dkim,suse.com:mid]
X-Rspamd-Queue-Id: 5AA204549FA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Kv9C1D7bZKvIbKJ9eg5VEh4P
Content-Type: multipart/mixed; boundary="------------DZ3PNP0k2SgWR8Urff2c36wG";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Mauricio Faria de Oliveira <mfo@igalia.com>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Alexey Dobriyan <adobriyan@gmail.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
Message-ID: <cac4a724-e5a4-4aeb-8bcd-e9cb6102746d@suse.com>
Subject: Re: [PATCH 3/3] x86/pvh: fix unbootable VMs by really inlining
 memset() in xen_prepare_pvh()
References: <20260422-pvh-kasan-inline-v1-0-7e6194344c92@igalia.com>
 <20260422-pvh-kasan-inline-v1-3-7e6194344c92@igalia.com>
In-Reply-To: <20260422-pvh-kasan-inline-v1-3-7e6194344c92@igalia.com>

--------------DZ3PNP0k2SgWR8Urff2c36wG
Content-Type: multipart/mixed; boundary="------------bnklDiIPpARtSbRuln9wFmlx"

--------------bnklDiIPpARtSbRuln9wFmlx
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjIuMDQuMjYgMjI6MDcsIE1hdXJpY2lvIEZhcmlhIGRlIE9saXZlaXJhIHdyb3RlOg0K
PiBFdmVuIHdpdGggX19idWlsdGluIHRoZSBjb21waWxlciBtYXkgZGVjaWRlIHRvIHVzZSB0
aGUgb3V0IG9mIGxpbmUgZnVuY3Rpb24NCj4gaW5zdGVhZCBvZiB0aGUgaW5saW5lIGltcGxl
bWVudGF0aW9uLg0KPiANCj4gVGhpcyBwYXJ0aWN1bGFyIG9uZSAoc3RpbGwpIGdlbmVyYXRl
ZCB0aGUgaW5saW5lIGltcGxlbWVudGF0aW9uIGFzIGV4cGVjdGVkDQo+IChhdCBsZWFzdCBp
biB0aGVzZSBjb21waWxlciB2ZXJzaW9ucyksIGJ1dCB0aGlzIGlzIG5vdCBndWFyYW50ZWVk
IHRvIHJlbWFpbg0KPiB0aGUgY2FzZSwgYXMgc2VlbiB3aXRoIHRoZSBwcmV2aW91cyBjb21t
aXQuDQo+IA0KPiBTd2l0Y2ggdGhlIGJ1aWx0aW4gdG8gdGhlIGlubGluZSBpbXBsZW1lbnRh
dGlvbiB0byBwcmV2ZW50IGEgc2ltaWxhciBpc3N1ZS4NCj4gDQo+IEZpeGVzOiBmYmU1YTZk
ZmU0OTIgKCJ4ZW4sIHB2aDogZml4IHVuYm9vdGFibGUgVk1zIGJ5IGlubGluaW5nIG1lbXNl
dCgpIGluIHhlbl9wcmVwYXJlX3B2aCgpIikNCj4gU2lnbmVkLW9mZi1ieTogTWF1cmljaW8g
RmFyaWEgZGUgT2xpdmVpcmEgPG1mb0BpZ2FsaWEuY29tPg0KDQpSZXZpZXdlZC1ieTogSnVl
cmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KDQoNCkp1ZXJnZW4NCg==
--------------bnklDiIPpARtSbRuln9wFmlx
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------bnklDiIPpARtSbRuln9wFmlx--

--------------DZ3PNP0k2SgWR8Urff2c36wG--

--------------Kv9C1D7bZKvIbKJ9eg5VEh4P
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmnqQnMFAwAAAAAACgkQsN6d1ii/Ey8W
cQgAmeUmRp13i5PdhuhbRG/JSw11tzZ1fb0W4EaVNfJg7al95qk6tR30vAAERxxPp+Wb5VXxO4Hl
eqcpTCrd71F8HhyCL/EkmBPLqVhv/F9kHfMMBWkKTgCnblicabPm78g/J4cpAGogxLP1ySIhhlzD
bkIF+werXTNfnU3QfDmtggIYwJSUe7R8FUiZQewTzDD4t+qkalrUymd8VWmbamT8PLaGxMsbNJLm
ZYya4Bgt+khwK9JJNnCY/sNqahg0UWI0zuTrJsQiTf2nVM/6824aNAmjABgOVhv8ulacwso97/bf
yCobzkA7oCswynl+8u6a+n+wi7th+2JewlnXrIGiKQ==
=QGQY
-----END PGP SIGNATURE-----

--------------Kv9C1D7bZKvIbKJ9eg5VEh4P--

