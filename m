Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48167A83EC3
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 11:33:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945092.1343355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2oH0-0001vF-Gh; Thu, 10 Apr 2025 09:32:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945092.1343355; Thu, 10 Apr 2025 09:32:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2oH0-0001sx-Ce; Thu, 10 Apr 2025 09:32:38 +0000
Received: by outflank-mailman (input) for mailman id 945092;
 Thu, 10 Apr 2025 09:32:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VA9I=W4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1u2oGy-0001sb-EW
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 09:32:36 +0000
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [2a00:1450:4864:20::542])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc2db4f5-15ee-11f0-9eac-5ba50f476ded;
 Thu, 10 Apr 2025 11:32:35 +0200 (CEST)
Received: by mail-ed1-x542.google.com with SMTP id
 4fb4d7f45d1cf-5e5e63162a0so891445a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 02:32:35 -0700 (PDT)
Received: from ?IPV6:2003:e5:873d:1a00:8e99:ce06:aa4a:2e7b?
 (p200300e5873d1a008e99ce06aa4a2e7b.dip0.t-ipconnect.de.
 [2003:e5:873d:1a00:8e99:ce06:aa4a:2e7b])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f2fbc2d575sm2036210a12.46.2025.04.10.02.32.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Apr 2025 02:32:34 -0700 (PDT)
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
X-Inumbo-ID: bc2db4f5-15ee-11f0-9eac-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744277555; x=1744882355; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7vFju+lTLYiEYd/Lod9OroZAN93KWr5vYE+hR92c82M=;
        b=T43igRVp7lMbVsWyk2OyhbqqPRfZrl6Qg5NHyCQGcVtaY1U/5ezPzBk7V9hsdvVZlR
         GDjbndTW75CR2NiYg6he8zT8ABo1GbN8CIBRmRzjTBuw4euHWT9jr3dtZFTZLEgNei6q
         jM9YjOPt8s3Jehn6BxXqdaeY7cwAAbKnw8eP8Uaw+3dc9jpdDznf8bojAkOTQ0oHviqu
         yFxnRRIGE5MgmeyJlXACff+N5odzSq1RQpps+WhuRIHh7HimPExkCqXylIkxfs/nNzvc
         koGp0qBDkqlh4scxe+shLVukJ2aEb9i3X/a/QOje4XVty8YCeEmvxQg8OJzHvXON8/NA
         KIBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744277555; x=1744882355;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7vFju+lTLYiEYd/Lod9OroZAN93KWr5vYE+hR92c82M=;
        b=pcCEkL44+Iej/sblcKhy1crRcjWPyyjm0Pq15moy7x4pc18fXKbAU0qLaZeDD1W5Jc
         GpaMXnujbMutiWckNXcdty7pJlvoyQy54nHWkLWEDfNGKBPQlvcrbI90S3skKlX20K2V
         /ppSWu8cYgiw2FzFFrajSZo2MmQQX25+m0kUgNTLaKW7dz9H/sXpiEAHOYIwob8rW08X
         iSi4BfeQWJeILYz1W96moYHmDLMEDJUlXmmC3/SOI07oj50pEWmgPO+HXIjDCa89D49C
         yyeIcKqxRUEr7KOs7/b7wfOa0sBuzkFlIpCD1wqJ77RPvAA1GfJ5p6W/nhAWXLy/JHdO
         Kjcg==
X-Forwarded-Encrypted: i=1; AJvYcCWSHLwdKWhfufK4TOaXCTV1lqmfJLQnV7oGtpnaEYVTgN4mdRhchx0q4TJ5sOzXzi5uXyf0ck1BsQM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxauAAHc/n6uyuVn8hSRvrg/vYVNsraveVjmswGmPfmbJeISYMd
	Ar8cCRN56aLQW88KsiqZwB4Uyv3UbYw46TX8rXmHs8cFao9RCKLnBDRMoFHpIoA=
X-Gm-Gg: ASbGnct7l4zIO/xMehQDlSK6eEyW5qneJ8gjLdgmY5WVrRgoF2DG9v5es3h2uG5P+po
	mLxFNy3Epi5CLumZnMITL89Dcnao+cd7VJutFv49EMLR4MswaMkGqddmJT1p8wmbKvsCCrkC2oj
	sAizjJ6H99cFGWPmI0+h3COzn+CbXp4FGTP4qY3nU1Uw+uGRHSrDdN1ykzxT+OccQLXNepnBdde
	KiYSEQhpzGYvVBNftQ2Fwtfq+v2/pK5k22DDNkG0qaTXng4vgLgoK3t6qD/mGIktpqWXqarWA2B
	q3/5zIDnousAmn/jVgwy+2ze5/h0WA5E13eluwqMp/c/Ao82iWkatom1tQkL3qnR6A2987e5oAA
	ej6ZC88J7AH3jKKeACsYAZecgfSroUKWxKnIRMpfSrIZvHYCVvvBt+CXaMU5VDr4gbj7slnoo09
	vY
X-Google-Smtp-Source: AGHT+IF+esQYw4dVacwUlukNlazG9yFVPmEPhoXqUa8K5c4cz67dwvRPkfIP7Qf0TZmFOa7f9QuE5A==
X-Received: by 2002:a17:907:9688:b0:ac7:81bd:60e3 with SMTP id a640c23a62f3a-acabd205870mr171409966b.27.1744277554629;
        Thu, 10 Apr 2025 02:32:34 -0700 (PDT)
Message-ID: <6c1df460-6620-4439-b072-c23ebe738e99@suse.com>
Date: Thu, 10 Apr 2025 11:32:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH TEST-ARTEFACTS 0/8] Cleanup and Linux ARM64 support
To: Jason Andryuk <jason.andryuk@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Anthony PERARD <anthony.perard@vates.tech>
References: <20250409163702.2037301-1-andrew.cooper3@citrix.com>
 <828cabc9-512f-4c2f-a7d7-b9c8963c1300@citrix.com>
 <f7b820af-b548-4dc3-9af7-9d2214a232b2@amd.com>
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
In-Reply-To: <f7b820af-b548-4dc3-9af7-9d2214a232b2@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------XmIyAUeSqRvplLG0dhTTOuaw"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------XmIyAUeSqRvplLG0dhTTOuaw
Content-Type: multipart/mixed; boundary="------------0Ud9wdh9gwKyrTP66xUU2CF8";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jason Andryuk <jason.andryuk@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Anthony PERARD <anthony.perard@vates.tech>
Message-ID: <6c1df460-6620-4439-b072-c23ebe738e99@suse.com>
Subject: Re: [PATCH TEST-ARTEFACTS 0/8] Cleanup and Linux ARM64 support
References: <20250409163702.2037301-1-andrew.cooper3@citrix.com>
 <828cabc9-512f-4c2f-a7d7-b9c8963c1300@citrix.com>
 <f7b820af-b548-4dc3-9af7-9d2214a232b2@amd.com>
In-Reply-To: <f7b820af-b548-4dc3-9af7-9d2214a232b2@amd.com>

--------------0Ud9wdh9gwKyrTP66xUU2CF8
Content-Type: multipart/mixed; boundary="------------bdxVUsolLA942dSgQhp33BEJ"

--------------bdxVUsolLA942dSgQhp33BEJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAuMDQuMjUgMDI6MDksIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IE9uIDIwMjUtMDQt
MDkgMTM6MDEsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbiAwOS8wNC8yMDI1IDU6MzYg
cG0sIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+Pj4gVmFyaW91cyBiaXRzIG9mIGNsZWFudXAs
IGFuZCBzdXBwb3J0IGZvciBhcm02NCBMaW51eCBidWlsZHMuDQo+Pj4NCj4+PiBSdW4gdXNp
bmcgdGhlIG5ldyBMaW51eCA2LjYuODYgb24gKG1vc3QpIHg4NiwgYW5kIEFSTTY0Og0KPj4+
IMKgwqAgaHR0cHM6Ly9naXRsYWIuY29tL3hlbi1wcm9qZWN0L2hhcmR3YXJlL3hlbi1zdGFn
aW5nLy0vcGlwZWxpbmVzLzE3NjA2Njc0MTENCj4+DQo+PiBMb3ZlbHksIExpbnV4IDYuNi44
NiBpcyBicm9rZW4gZm9yIHg4NiBQVkguwqAgSXQgdHJpcGxlIGZhdWx0cyB2ZXJ5IGVhcmx5
IG9uLg0KPj4NCj4+IFNhbXBsZSBsb2c6DQo+PiBodHRwczovL2dpdGxhYi5jb20veGVuLXBy
b2plY3QvaGFyZHdhcmUveGVuLXN0YWdpbmcvLS9qb2JzLzk2NzM3OTc0NTANCj4+DQo+PiBJ
IGd1ZXNzIHdlJ2xsIGhhdmUgdG8gc3RheSBvbiA2LjYuNTYgZm9yIG5vdy7CoCAoT25seSBh
ZmZlY3RzIHRoZSBmaW5hbA0KPj4gcGF0Y2guKQ0KPiANCj4gVGhpcyBpcyBhbiBBTUQgc3lz
dGVtOg0KPiANCj4gKFhFTikgW8KgwqDCoCAyLjU3NzU0OV0gZDB2MCBUcmlwbGUgZmF1bHQg
LSBpbnZva2luZyBIVk0gc2h1dGRvd24gYWN0aW9uIDENCj4gKFhFTikgW8KgwqDCoCAyLjU3
NzU1N10gUklQOsKgwqDCoCAwMDA4Ols8MDAwMDAwMDAwMWY4NTFkND5dDQo+IA0KPiBUaGUg
aW5zdHJ1Y3Rpb246DQo+IGZmZmZmZmZmODFmODUxZDQ6wqDCoMKgwqDCoMKgIDBmIDAxIGMx
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHZtY2FsbA0KPiANCj4gdm1jYWxsIGlz
IHRoZSBJbnRlbCBpbnN0cnVjdGlvbiwgYW5kIHZtbWNhbGwgaXMgdGhlIEFNRCBvbmUsIHNv
IENQVSBkZXRlY3Rpb24gaXMgDQo+IG1hbGZ1bmN0aW9uaW5nLg0KPiANCj4gKEVhcmx5IFBW
SCBpcyBydW5uaW5nIGlkZW50aXR5IG1hcHBlZCwgc28gaXQncyBvZmZzZXQgZnJvbSBmZmZm
ZmZmZjgwMDAwMDAwKQ0KPiANCj4gVGhlcmUgYXJlIG5vIGRlYnVnIHN5bWJvbHMgaW4gdGhl
IHZtbGludXggSSBleHRyYWN0ZWQgZnJvbSB0aGUgYnpJbWFnZSBmcm9tIA0KPiBnaXRsYWIs
IGJ1dCBJIGNhbiByZXBybyBsb2NhbGx5IHdpdGggb24gNi42Ljg2LsKgIEl0J3MgdW5jbGVh
ciB0byBtZSB3aHkgaXQncyANCj4gZmFpbGluZy4NCj4gDQo+IFRyeWluZzoNCj4gZGlmZiAt
LWdpdCBpL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW4uYyB3L2FyY2gveDg2L3hlbi9lbmxpZ2h0
ZW4uYw0KPiBpbmRleCAwMjE5ZjFjOTAyMDIuLmZiNGFkN2ZlM2UzNCAxMDA2NDQNCj4gLS0t
IGkvYXJjaC94ODYveGVuL2VubGlnaHRlbi5jDQo+ICsrKyB3L2FyY2gveDg2L3hlbi9lbmxp
Z2h0ZW4uYw0KPiBAQCAtMTIzLDExICsxMjMsMTAgQEAgbm9pbnN0ciB2b2lkICpfX3hlbl9o
eXBlcmNhbGxfc2V0ZnVuYyh2b2lkKQ0KPiAgwqDCoMKgwqDCoMKgwqAgaWYgKCFib290X2Nw
dV9oYXMoWDg2X0ZFQVRVUkVfQ1BVSUQpKQ0KPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHhlbl9nZXRfdmVuZG9yKCk7DQo+IA0KPiAtwqDCoMKgwqDCoMKgIGlmICgoYm9v
dF9jcHVfZGF0YS54ODZfdmVuZG9yID09IFg4Nl9WRU5ET1JfQU1EIHx8DQo+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGJvb3RfY3B1X2RhdGEueDg2X3ZlbmRvciA9PSBYODZfVkVORE9S
X0hZR09OKSkNCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZnVuYyA9IHhlbl9o
eXBlcmNhbGxfYW1kOw0KPiAtwqDCoMKgwqDCoMKgIGVsc2UNCj4gK8KgwqDCoMKgwqDCoCBp
ZiAoYm9vdF9jcHVfZGF0YS54ODZfdmVuZG9yID09IFg4Nl9WRU5ET1JfSU5URUwgKQ0KPiAg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZ1bmMgPSB4ZW5faHlwZXJjYWxsX2lu
dGVsOw0KPiArwqDCoMKgwqDCoMKgIGVsc2UNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgZnVuYyA9IHhlbl9oeXBlcmNhbGxfYW1kOw0KPiANCj4gIMKgwqDCoMKgwqDCoMKg
IHN0YXRpY19jYWxsX3VwZGF0ZV9lYXJseSh4ZW5faHlwZXJjYWxsLCBmdW5jKTsNCj4gDQo+
IEJ1dCBpdCBzdGlsbCBjYWxscyB4ZW5faHlwZXJjYWxsX2ludGVsKCkuwqAgU28gbWF5YmUg
eDg2X3ZlbmRvciBpc24ndCBnZXR0aW5nIHNldCANCj4gYW5kIGVuZHMgdXAgYXMgMCAoWDg2
X1ZFTkRPUl9JTlRFTCk/DQo+IA0KPiBUaGF0J3MgYXMgZmFyIGFzIEkgZ290IGhlcmUuDQo+
IA0KPiBEaWZmZXJlbnQgYnV0IHJlbGF0ZWQsIG9uIG1haW5saW5lIG1hc3RlciwgSSBhbHNv
IGdldCBhIGZhaWwgaW4gdm1jYWxsLiBUaGVyZSwgSSANCj4gc2VlIGluIHRoZSBkaXNhc3Nl
bWJseSB0aGF0IF9feGVuX2h5cGVyY2FsbF9zZXRmdW5jKCkncyBjYWxscyB0byANCj4geGVu
X2dldF92ZW5kb3IoKSBpcyBnb25lLsKgIHhlbl9nZXRfdmVuZG9yKCkgc2VlbXMgdG8gaGF2
ZSBiZWVuIERDRS1lZC7CoCBUaGVyZSBpcyANCj4gc29tZSBuZXcgY29kZSB0aGF0IGhhcmRj
b2RlcyBmZWF0dXJlcyAtICJ4ODYvY3B1ZmVhdHVyZXM6IEFkZCANCj4ge1JFUVVJUkVELERJ
U0FCTEVEfSBmZWF0dXJlIGNvbmZpZ3MiIC0gd2hpY2ggbWF5IGJlIHJlc3BvbnNpYmxlLg0K
DQpUaGUgdGVzdCBmb3IgIVg4Nl9GRUFUVVJFX0NQVUlEIHdpbGwgcHJvYmFibHkgbmV2ZXIg
YmUgdHJ1ZSBub3cuDQoNCkkgZ3Vlc3MgdGhlIG1vc3Qgc2ltcGxlIGZpeCB3aWxsIGJlIHRv
IGp1c3QgY2FsbCB4ZW5fZ2V0X3ZlbmRvcigpDQp1bmNvbmRpdGlvbmFsbHkuDQoNCg0KSnVl
cmdlbg0K
--------------bdxVUsolLA942dSgQhp33BEJ
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------bdxVUsolLA942dSgQhp33BEJ--

--------------0Ud9wdh9gwKyrTP66xUU2CF8--

--------------XmIyAUeSqRvplLG0dhTTOuaw
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmf3kDEFAwAAAAAACgkQsN6d1ii/Ey+r
Agf/fdjYjfeAnFpkTxTWOuxvtRVSeSvNz/fnLypA9kcZx9V+CcFnUk4XSAQFi1Ue62HVTXvY/O+Q
jtE3f3Vf1CYzShqkOkTsRZFmd2vShvEF0U/45EYOUEzB7rCJBvnoha+5/UC3E/b8M9FXls124z0Y
tHkj29O119FekR4lRb1/MKlsm8aOFqzorxt4RA8RD9rquLxZuwFy6PN/NTL8slVJgZ7Ban1esvrh
GOR0RIP0c/2i0+J2nAsiAyRFmdEjcls5LOOfAlXHD1S1ebvp6Ft0sbP9SKAy9e9aMa4413mL8eC6
NDKGv3PDL1Ip+GC+2h6nroKgxVvcaFOhx5FwlRCKkQ==
=Lhir
-----END PGP SIGNATURE-----

--------------XmIyAUeSqRvplLG0dhTTOuaw--

