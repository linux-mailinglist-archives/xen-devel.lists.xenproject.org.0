Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 910F59C7C12
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 20:20:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835967.1251835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBIuR-0007Zi-2s; Wed, 13 Nov 2024 19:20:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835967.1251835; Wed, 13 Nov 2024 19:20:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBIuR-0007Xb-0M; Wed, 13 Nov 2024 19:20:11 +0000
Received: by outflank-mailman (input) for mailman id 835967;
 Wed, 13 Nov 2024 19:20:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K+ao=SI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tBIuP-0007XT-E4
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 19:20:09 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4981f0fa-a1f4-11ef-a0c7-8be0dac302b0;
 Wed, 13 Nov 2024 20:20:05 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-37d49a7207cso4912369f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 13 Nov 2024 11:20:05 -0800 (PST)
Received: from ?IPV6:2003:e5:872e:b100:d3c7:e0c0:5e3b:aa1c?
 (p200300e5872eb100d3c7e0c05e3baa1c.dip0.t-ipconnect.de.
 [2003:e5:872e:b100:d3c7:e0c0:5e3b:aa1c])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381ed97db25sm19273804f8f.41.2024.11.13.11.20.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Nov 2024 11:20:03 -0800 (PST)
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
X-Inumbo-ID: 4981f0fa-a1f4-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MmYiLCJoZWxvIjoibWFpbC13cjEteDQyZi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjQ5ODFmMGZhLWExZjQtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNTI1NjA1LjQ1MzA5Mywic2VuZGVyIjoiamdyb3NzQHN1c2UuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731525604; x=1732130404; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nmSLvxmLytBjWuqGiWZ/bkUqbzKzE7ZkPEypTc3W0t0=;
        b=NaVJCP+7OK+1wDOcpWPyOyjYtW++kNsX+RzS7/57UFGWypdnQ+vT9MREPTXIs+nJqi
         athYt+flejzAjJnCiD+1kNXie74tbU+ZVzjj2Tekf6BAez5hcsXYzreiVUOZG4TTb28O
         7odJA/k0Hi3dZXT/Rd3WN3biTrBp9YUijhYAVoJSNI/8/9A0LgBA9x4AKi+hL5RsBeQa
         aGmpDuJcExkX2lHThW3gHMvVC4lNsBTlr1QANf0ZXXbX8fLZBORKYUKThH9c4HwiZgpR
         Ei8fKaoXf1a0KgVl0qYOoP7Zo7/xRmpgRNJnPbX3Uqr/0DjrL1kP6DiSTtpI48/LaFti
         MGNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731525604; x=1732130404;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nmSLvxmLytBjWuqGiWZ/bkUqbzKzE7ZkPEypTc3W0t0=;
        b=qkcFkFhMTNoSNxEUryDkBcXTcztf2U+tm+AeqlDh0Mb04mR1ONOapUeGo5l5kzwrt+
         ClSwZ6lUDiwjd48TVXfVjwKfz0fSGeljTvQVWS9cZ34l9X3Q96ZHMEw4fSW+qzD805au
         ZbsCAv7RWXw47bfsXhWDyHdm3YnqPx98ECnzOOoIX+OHSaSDUE7dCN66ogesvQID+6U/
         twfxO9VlU/R2i5f9skaTABveHhXML1qPadMWg1K/Dw58e0nqL8XQQqH2fwgSqfKjnVLM
         +NMxG2efQPW1TDg+B20Ui3XA2j2KoXns2crzg/5bdmkYygeFkia7TOsRXxNrk+IVeTeA
         58ng==
X-Gm-Message-State: AOJu0YzmPOHi3uosqt5Ut8rfQyxDZv8IKQKLJuU7byRcUa+MZnqx4UvH
	z2sNrS9p1sUaMPfK9jfsyDXzDvHyrxa4t6DMUt/Gh1y8flP2ZzJ99+KM1f4kU98=
X-Google-Smtp-Source: AGHT+IEfR2kuP5PdnNdi0UKfGRBkhebWy0zSukb2PJQYK7lBbr+3G1axlCv9asltUzth6k2ylO91lA==
X-Received: by 2002:a05:6000:2101:b0:381:f5c2:df24 with SMTP id ffacd0b85a97d-381f5c2e053mr12817165f8f.57.1731525604298;
        Wed, 13 Nov 2024 11:20:04 -0800 (PST)
Message-ID: <467e46ad-d0d0-4217-9b70-b48e3c7a1fb5@suse.com>
Date: Wed, 13 Nov 2024 20:20:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: AMD EPYC virtual network performances
To: Elliott Mitchell <ehem+xen@m5p.com>,
 Andrei Semenov <andrei.semenov@vates.tech>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <959bbf84-24da-4da3-a059-dc1aa32b27ef@vates.tech>
 <ZzTg_p-8E0_jrkii@mattapan.m5p.com>
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
In-Reply-To: <ZzTg_p-8E0_jrkii@mattapan.m5p.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------45bLG0jRJSS1Wr0O7Djthukn"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------45bLG0jRJSS1Wr0O7Djthukn
Content-Type: multipart/mixed; boundary="------------MkHn5e0KFWkzcdtAAxVrSGga";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Elliott Mitchell <ehem+xen@m5p.com>,
 Andrei Semenov <andrei.semenov@vates.tech>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Message-ID: <467e46ad-d0d0-4217-9b70-b48e3c7a1fb5@suse.com>
Subject: Re: AMD EPYC virtual network performances
References: <959bbf84-24da-4da3-a059-dc1aa32b27ef@vates.tech>
 <ZzTg_p-8E0_jrkii@mattapan.m5p.com>
In-Reply-To: <ZzTg_p-8E0_jrkii@mattapan.m5p.com>

--------------MkHn5e0KFWkzcdtAAxVrSGga
Content-Type: multipart/mixed; boundary="------------exRa9szFtKEZHQvSh26YNrsP"

--------------exRa9szFtKEZHQvSh26YNrsP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTMuMTEuMjQgMTg6MjUsIEVsbGlvdHQgTWl0Y2hlbGwgd3JvdGU6DQo+IE9uIFR1ZSwg
SnVsIDA5LCAyMDI0IGF0IDA4OjM2OjE4QU0gKzAwMDAsIEFuZHJlaSBTZW1lbm92IHdyb3Rl
Og0KPj4NCj4+IEFmdGVyIHNvbWUgaW52ZXN0aWdhdGlvbnMgd2Ugbm90aWNlcyBhIGh1Z2Ug
cGVyZm9ybWFuY2VzIGRyb3AgKHBlcmZzIGRpdmlkZWQNCj4+IGJ5DQo+PiBmYWN0b3Igb2Yg
NSkgc3RhcnRpbmcgZnJvbSA1LjEwLjg4IExpbnV4IGtlcm5lbCB2ZXJzaW9uIG9uIHRoZSBB
TUQgRVBZQw0KPj4gcGxhdGZvcm1zLiBUaGUgcGF0Y2ggaW50cm9kdWNlZCBpbiB0aGlzIGtl
cm5lbCB2ZXJzaW9uIHRoYXQgYWxsb3dzIHRvDQo+PiBwaW5wb2ludA0KPj4gdGhlIGJ1Z2d5
IGJlaGF2aW9yIGlzIDoNCj4+DQo+PiAgwqDigJx4ZW4vbmV0ZnJvbnQ6IGhhcmRlbiBuZXRm
cm9udCBhZ2FpbnN0IGV2ZW50IGNoYW5uZWwgc3Rvcm1z4oCdDQo+PiBkMzFiMzM3OTE3OWQ2
NDcyNGQzYmJmYTg3YmQ0YWRhOTRlMzIzN2RlDQo+Pg0KPj4gVGhlIHBhdGNoIGJhc2ljYWxs
eSBiaW5kcyB0aGUgbmV0d29yayBmcm9udGVuZCB0byB0aGUgYHhlbl9sYXRlZW9pX2NoaXBg
DQo+PiBpcnFfY2hpcCAoaW5zZWFkIG9mIGB4ZW5fZHluYW1pY19jaGlwYCkgd2hpY2ggYWxs
b3dzIHRvIGl0cyBjbGllbnRzIHRvDQo+PiBpbmZvcm0NCj4+IHRoZSBjaGlwIGlmIHNwdXJp
b3VzIGludGVycnVwdHMgYXJlIGRldGVjdGVkIGFuZCBzbyB0aGUgZGVsYXkgaW4gaW50ZXJy
dXB0DQo+PiB0cmVhdG1lbnQgaXMgaW50cm9kdWNlZCBieSB0aGUgY2hpcC4NCj4gDQo+IEkg
d29ycnkgSSdtIGJlaW5nIGtuYXZlIGhlcmUuDQo+IA0KPiBGb3IgdGhlIGhlY2sgb2YgaXQs
IEkgdG9vayBhIGdsYW5jZSBhdCBiMjdkNDc5NTBlNDguICBJZiBteSB1bmRlcnN0YW5kaW5n
DQo+IGlzIGNvcnJlY3QsIGIyN2Q0Nzk1MGU0OCBpcyBtYWtpbmcgYSB2ZXJ5IGJhc2ljIChh
bmQgd3JvbmcpIGFzc3VtcHRpb24NCj4gYWJvdXQgdGltaW5nL2xhdGVuY3kuDQo+IA0KPiBJ
biBwYXJ0aWN1bGFyIGFueSB0aW1lIGVpdGhlciBzaWRlIHJlY2VpdmUgYW4gZXZlbnQsIGl0
IHdpbGwgaGFuZGxlDQo+IFggIyBvZiBpbmNvbWluZyBwYXlsb2FkcyBhbmQgWSAjIG9mIGFj
a25vd2xlZGdlZCBvdXRnb2luZyBwYXlsb2Fkcy4gIEFzDQo+IHN1Y2ggaWYgWCArIFkgPiAx
LCB0aGVuIHVwIHRvIFggKyBZIC0gMSBzcHVyaW91cyBldmVudHMgbWF5IGJlIGRldGVjdGVk
Lg0KPiBUaGUgaXNzdWUgaXMgdGhlcmUgaXMgbm8gc3luY2hyb25pemF0aW9uIGJldHdlZW4g
dGhlIGV2ZW50IGNoYW5uZWwgYW5kDQo+IHRoZSB3b3JrIHF1ZXVlcy4NCj4gDQo+IEluIHBh
cnRpY3VsYXIgdGhlIG5ldHdvcmsgYmFjayBlbmQgY291bGQgbGVnaXRpbWF0ZWx5IGdlbmVy
YXRlOg0KPiANCj4gd29yazAJc2lnbmFsMAl3b3JrMQlzaWduYWwxCXdvcmsyCXNpZ25hbDIJ
d29yazMJc2lnbmFsMw0KPiANCj4gV2hlcmVhcyB0aGUgbmV0d29yayBmcm9udCBlbmQgbWF5
IGhhbmRsZSB0aGlzIGFzOg0KPiANCj4gZXZlbnQwCXdvcmswCXdvcmsxCXdvcmsyCXdvcmsz
CWV2ZW50MQlldmVudDIJZXZlbnQzDQo+IA0KPiBXaGVyZSBiMjdkNDc5NTBlNDggd291bGQg
aW50ZXJwcmV0IGV2ZW50cyAxLTMgYXMgc3B1cmlvdXMsIGV2ZW4gdGhvdWdoDQo+IHRoZXkn
cmUgcGVyZmVjdGx5IGxlZ2l0aW1hdGUuICBUaGUgc2FtZSBwaGVub21lbm9uIGNvdWxkIG9j
Y3VyIGluIGJvdGgNCj4gZGlyZWN0aW9ucyBhbmQgYWxzbyB3aXRoIHRoZSBYZW4gYmxvY2sg
ZGV2aWNlcy4NCg0KTm8uDQoNCkZvciBvbmUsIGFzIGxvbmcgYXMgZXZlbnQwIGlzbid0IEVP
SSdkLCB0aGUgb3RoZXIgZXZlbnRzIHdvdWxkIGp1c3QgYmUNCm1lcmdlZCBpbnRvIGEgc2lu
Z2xlIG9uZS4NCg0KQWRkaXRpb25hbGx5LCBhcyBsb25nIGFzIHdvcmswIGlzbid0IGFja25v
d2xlZGdlZCBieSBpbmNyZW1lbnRpbmcgdGhlDQpjb25zdW1lciBpbmRleCwgYWRkaXRpb25h
bCBxdWV1ZWQgd29yayBpdGVtcyBzaG91bGQgTk9UIHJlc3VsdCBpbg0KYWRkaXRpb25hbCBl
dmVudHMgYmVpbmcgc2VudC4gQW4gZXZlbnQgaXMgb25seSBzZW50IGlmIGEgd29yayBpdGVt
IGlzDQpxdWV1ZWQgdG8gYSByaW5nIGJ1ZmZlciB3aXRoIGNvbnN1bWVyID09IHByb2R1Y2Vy
Lg0KDQo+IFVsdGltYXRlbHkgaG93IGlzIHRoZSBuZXR3b3JrIHBvcnRpb24gb2YgWFNBLTM5
MSBhbnkgZGlmZmVyZW50IGZyb20gYW55DQo+IG90aGVyIG5ldHdvcmsgRG9TPyAgSWYgYW4g
aW50ZXJydXB0IGlzIGdlbmVyYXRlZCBmb3IgZXZlcnkgc2luZ2xlIHBhY2tldA0KPiBvZiBh
IHNlcmllcyBvZiBydW50IGZyYW1lcywgdGhlcmUgd2lsbCBiZSBoZWF2eSBwcm9jZXNzb3Ig
dXNlIGZvciBsaXR0bGUNCj4gbmV0d29yayB0cmFmZmljLg0KDQpUaGUgcHJvYmxlbSBpcyB0
aGF0IGEgc3RlYWR5IHN0cmVhbSBvZiBldmVudHMgY291bGQga2VlcCB0aGUgb3RoZXIgc2lk
ZQ0KaW4gSVJRIGhhbmRsaW5nIGZvciBhcmJpdHJhcnkgYW1vdW50IG9mIHRpbWVzLCBsZWFk
aW5nIHRvIGhhbmd1cHMuDQoNCj4gQU1EIHN5c3RlbXMgbWF5IGZhaXIgd29yc2UgdGhhbiBJ
bnRlbCBzeXN0ZW1zIGR1ZSB0byBkaWZmZXJpbmcgY2FjaGUNCj4gY29oZXJlbmNlIGJlaGF2
aW9yL2xhdGVuY3kuICBQZXJoYXBzIEFNRCdzIE5VTUEgaW1wbGVtZW50YXRpb24gYWRkcw0K
PiBzb21lIGxhdGVuY3kuICAoaHVoLCBzdWRkZW5seSB0aGUgUkFJRDEgaXNzdWUgY29tZXMg
dG8gbWluZCkNCj4gDQo+IA0KPiBIb3BlZnVsbHkgSSdtIG5vdCBtYWtpbmcga25hdmUgc3Bl
Y3VsYXRpb24gaGVyZS4gIE1pZ2h0IHRoaXMgYmUgdGhlDQo+IHNpbXBsZXN0IG9mIGlzc3Vl
cywganVzdCBpdCB3YXMgbWlzc2VkIGR1ZSB0byBiZWluZyB0b28gb2J2aW91cz8NCg0KSSBk
b24ndCBhZ3JlZSB3aXRoIHlvdXIgYW5hbHlzaXMsIHNlZSBhYm92ZS4NCg0KDQpKdWVyZ2Vu
DQo=
--------------exRa9szFtKEZHQvSh26YNrsP
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------exRa9szFtKEZHQvSh26YNrsP--

--------------MkHn5e0KFWkzcdtAAxVrSGga--

--------------45bLG0jRJSS1Wr0O7Djthukn
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmc0++MFAwAAAAAACgkQsN6d1ii/Ey9p
OAf+NSZX4ihdQeLq2114hYJpjKankg/SWQN5YKaVkeDPNlyWFLRKStCstbsUF4JT1No17eR45tEz
sbEUP2IbwxiGZnLhDRxrWTF3i+GgHqqYwXb/ZSvCDmYIITmr3lI/CU7hvmMyamYLUZPZFdjy+NO9
VzL8Kq7gUQXZgXMjpJebcZrBFflrWw/+n34jxZEj5PznTRbxAYjCLeWhqTmslpNcqEIQ3GHjQ8zW
FvTkfgBsv2t4ec3jIS/pGH26xBZA2vAig0QTc4dDsRwjoq7wshJTsJNTX5pOn0ZKEX1ATen3/lFv
QNvhq8eF6WlS+IShHA9in8Llglrq31oDPn2etqAiuQ==
=WTQU
-----END PGP SIGNATURE-----

--------------45bLG0jRJSS1Wr0O7Djthukn--

