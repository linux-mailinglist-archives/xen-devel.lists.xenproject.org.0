Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B54A5EFF6
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 10:52:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.911753.1318157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsfEw-0000Wz-Ux; Thu, 13 Mar 2025 09:52:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911753.1318157; Thu, 13 Mar 2025 09:52:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsfEw-0000UM-R4; Thu, 13 Mar 2025 09:52:34 +0000
Received: by outflank-mailman (input) for mailman id 911753;
 Thu, 13 Mar 2025 09:52:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oZoU=WA=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tsfEu-0000UE-VE
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 09:52:32 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1c4d6e3-fff0-11ef-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 10:52:31 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5e5bc066283so1069379a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 02:52:31 -0700 (PDT)
Received: from ?IPV6:2003:e5:8714:500:2aea:6ec9:1d88:c1ef?
 (p200300e5871405002aea6ec91d88c1ef.dip0.t-ipconnect.de.
 [2003:e5:8714:500:2aea:6ec9:1d88:c1ef])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e8169bcad3sm555841a12.47.2025.03.13.02.52.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 02:52:30 -0700 (PDT)
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
X-Inumbo-ID: e1c4d6e3-fff0-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741859551; x=1742464351; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sRtxLHEGvcE+r96K+xtPonZstZvb/S6VM3ietMzVniE=;
        b=KFTlzQF4tO9pJIXlw8C8sp4t8l16M/I6U2XFTRLyJIcWblsrlhZYigqPkMt9l6SJ/z
         KkbNBnWYlnKPBLO1TZb3RSqMuZ1LfHWy4+JbNyWyH11I/hpqq6VXtijKBeOf5hLXq81y
         T7L+eumnAMj7Cei7lWtyWBj2IoR6wqQjAd40Q8esyccv9ngHaKjt241zDewQlf7fn5b0
         OtMUrh+LVRRdmB9yk2fQgHt4CQVQjML2IAIRYTggge5k84rfP80xO8qk6NcWVPJU032V
         Y20OHSuaeUKMFbr6rFoy6EzxHImdvTYMICLHMs7Tg5zYXXA8Ev4kx/oa768OHInXQG0f
         JZXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741859551; x=1742464351;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sRtxLHEGvcE+r96K+xtPonZstZvb/S6VM3ietMzVniE=;
        b=mPtOq9orCwWDGL1H2Z6Wja0JhnEcVlJOFUD6rNdZYzEQjVgh9ZhTSzJ9Xp3jeIEha9
         5pmOB3I0daC12eYvujoyYTJ7KCVgW7d2zxiiM7plXR/xwydb1La6sHgZMC/8uecOcayJ
         tYwuem14sR5vXK/GwWfYB6IWnbz8XQPMGkx/7cpYTV3aDJUTEfxz51ZSAqoKGqWWVPcM
         8YOrbxodXNsfGoqLtC3YQoZsTPdDK8WPbmVSAHGRSpQgzHFOUlgEi4mEv99LhoeInZBG
         Vj2JqE0Y1wuYY/wH6cuOtwe+ahfk0nk/VZwFI06pdZwn+zLn7zEmaZG2PC3JpxkYXsPb
         vH6w==
X-Forwarded-Encrypted: i=1; AJvYcCX04d3oyLWZUTbVk5WVU+/TI7umGZjaFdykklDFa6ub8iAtm7PSg0YMW4SJtZwSbfh6lASGvezP9N8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxjVIy1EBP3zGEKbbnPaLJPH9t9AO4qVpUk1SecHwRuz9YSu4fT
	v2jWcq0bB5RXcAN2dL5f30vMM4/A4bo1nvD7HzxhltVtgmKjyLJzl9sPg2LhE9M=
X-Gm-Gg: ASbGncstyii0q48eDjm7eElZDjrEOWF1fhRPibPW2ceDY7IC5cRsMjS/5PnLk89rl+r
	dVq6jSRWiEOeD83EUGu6MiJYAEDQhUelxmN76w+SNh3ZNwdUKL0H8ierywOCLUnbYbW9gEKuUei
	Q9Yn4/PYoovcu/EoADNtYkX0C6N4tBDB9LiZv8LJWt4qsaiKj3vQy+yc4L4RdQx4dvn38tnXs5P
	Gw8sdb9cExcq/JCv58KEl/S0T8qZQUh61X30myFo3IWjhtwmtw4zoy0KBWwg6nznkgu/Y0Rgl94
	OY3NcTEc5uSAFQzP10UPVim2+PJVzmaMcoLEqnP1Z8fFE7EMpAIE9XCdzKhCfP+8tFScAoMJXQl
	fcnKhQc8TKU68qBOspbsYSxaHg2z7gJitBb2s8PqFoYtLJRvgH1Xqxhqx+oMrZJZYgHw=
X-Google-Smtp-Source: AGHT+IGx5HpgyZ7//Lz+/FSXyQEkfsgiE3u7j9LcxJeY3pXNZmV+kMQRs68TZW7s64JPXyGfJT5vcw==
X-Received: by 2002:a05:6402:3785:b0:5e6:180b:557d with SMTP id 4fb4d7f45d1cf-5e6180b5925mr26434581a12.11.1741859551202;
        Thu, 13 Mar 2025 02:52:31 -0700 (PDT)
Message-ID: <5f154436-2e05-4495-82ca-c58c5c7f33a3@suse.com>
Date: Thu, 13 Mar 2025 10:52:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 8/9] tools/xenstored: use unique_id to identify new
 domain with same domid
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <20250204113407.16839-1-jgross@suse.com>
 <20250204113407.16839-9-jgross@suse.com>
 <d1a8cc18-83ce-430f-9a5e-93fa0d1d655e@amd.com>
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
In-Reply-To: <d1a8cc18-83ce-430f-9a5e-93fa0d1d655e@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------uSXxECBD8yo7tCgKJ8juhi62"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------uSXxECBD8yo7tCgKJ8juhi62
Content-Type: multipart/mixed; boundary="------------OuR96bnSz4yQ49enGS0J8c0M";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
Message-ID: <5f154436-2e05-4495-82ca-c58c5c7f33a3@suse.com>
Subject: Re: [PATCH v8 8/9] tools/xenstored: use unique_id to identify new
 domain with same domid
References: <20250204113407.16839-1-jgross@suse.com>
 <20250204113407.16839-9-jgross@suse.com>
 <d1a8cc18-83ce-430f-9a5e-93fa0d1d655e@amd.com>
In-Reply-To: <d1a8cc18-83ce-430f-9a5e-93fa0d1d655e@amd.com>

--------------OuR96bnSz4yQ49enGS0J8c0M
Content-Type: multipart/mixed; boundary="------------WXNLX7hUGteVMReH76btghD5"

--------------WXNLX7hUGteVMReH76btghD5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTIuMDMuMjUgMTg6NDAsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IE9uIDIwMjUtMDIt
MDQgMDY6MzQsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBVc2UgdGhlIG5ldyB1bmlxdWVf
aWQgb2YgYSBkb21haW4gaW4gb3JkZXIgdG8gZGV0ZWN0IHRoYXQgYSBkb21haW4NCj4+IGhh
cyBiZWVuIHJlcGxhY2VkIHdpdGggYW5vdGhlciBvbmUgcmV1c2luZyB0aGUgZG9hbWluLWlk
IG9mIHRoZSBvbGQNCj4gDQo+IHMvZG9hbWluL2RvbWFpbi8NCj4gDQo+PiBkb21haW4uDQo+
Pg0KPj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0K
Pj4gLS0tDQo+IA0KPj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3hlbnN0b3JlZC9kb21haW4uYyBi
L3Rvb2xzL3hlbnN0b3JlZC9kb21haW4uYw0KPj4gaW5kZXggYTY1MDZhNWJiMi4uNjNkZjI0
MDMwZSAxMDA2NDQNCj4+IC0tLSBhL3Rvb2xzL3hlbnN0b3JlZC9kb21haW4uYw0KPj4gKysr
IGIvdG9vbHMveGVuc3RvcmVkL2RvbWFpbi5jDQo+IA0KPj4gQEAgLTYyNyw5ICs2MjgsMTcg
QEAgc3RhdGljIGludCBjaGVja19kb21haW4oY29uc3Qgdm9pZCAqaywgdm9pZCAqdiwgdm9p
ZCAqYXJnKQ0KPj4gwqDCoMKgwqDCoCBpbnQgZG9tX2ludmFsaWQ7DQo+PiDCoMKgwqDCoMKg
IHN0cnVjdCBkb21haW4gKmRvbWFpbiA9IHY7DQo+PiDCoMKgwqDCoMKgIGJvb2wgKm5vdGlm
eSA9IGFyZzsNCj4+ICvCoMKgwqAgdWludDY0X3QgdW5pcXVlX2lkOw0KPj4gwqDCoMKgwqDC
oCBkb21faW52YWxpZCA9IHhlbm1hbmFnZV9nZXRfZG9tYWluX2luZm8oeG1faGFuZGxlLCBk
b21haW4tPmRvbWlkLA0KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgJnN0YXRlLCBOVUxMKTsNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICZzdGF0ZSwgJnVuaXF1ZV9pZCk7DQo+PiArwqDC
oMKgIGlmICghZG9tX2ludmFsaWQpIHsNCj4gDQo+IFdoYXQgZG8geW91IHRoaW5rIGFib3V0
wqAgYGlmIChkb21fdmFsaWQpYCB0byBhdm9pZCB0aGUgZG91YmxlIG5lZ2F0aXZlPw0KDQpZ
ZXMsIHByb2JhYmx5IGJldHRlci4NCg0KPiBJZiB5b3UgZG9uJ3Qgd2FudCB0byBjaGFuZ2Ug
aXQsIHRoZSBjb2RlIGhlcmUgYW5kIGVsc2V3aGVyZSBsb29rcyBmaW5lIHRvIG1lIGFzLWlz
Lg0KPiANCj4gWW91J2xsIHJlLXNwaW4gd2l0aCB1cGRhdGVkIGR1bXAgY29kZSwgY29ycmVj
dD8NCg0KWWVzLg0KDQoNCkp1ZXJnZW4NCg==
--------------WXNLX7hUGteVMReH76btghD5
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjri
oyspZKOBycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2
kaV2KL9650I1SJvedYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i
1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/B
BLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xqG7/377qptDmrk42GlSK
N4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR3Jvc3Mg
PGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsE
FgIDAQIeAQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4F
UGNQH2lvWAUy+dnyThpwdtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3Tye
vpB0CA3dbBQp0OW0fgCetToGIQrg0MbD1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u
+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbvoPHZ8SlM4KWm8rG+lIkGurq
qu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v5QL+qHI3EIP
tyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJ
CAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4
RF7HoZhPVPogNVbC4YA6lW7DrWf0teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz7
8X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC/nuAFVGy+67q2DH8As3KPu0344T
BDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0LhITTd9jLzdDad1pQ
SToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLmXBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkM
nQfvUewRz80hSnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMB
AgAjBQJTjHDXAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/
Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJnFOXgMLdBQgBlVPO3/D9R8LtF9DBAFPN
hlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1jnDkfJZr6jrbjgyoZHi
w/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0N51N5Jf
VRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwP
OoE+lotufe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK
/1xMI3/+8jbO0tsn1tqSEUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuZGU+wsB5BBMBAgAjBQJTjHDrAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgEC
F4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3g3OZUEBmDHVVbqMtzwlmNC4
k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5dM7wRqzgJpJ
wK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu
5D+jLRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzB
TNh30FVKK1EvmV2xAKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37Io
N1EblHI//x/e2AaIHpzK5h88NEawQsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6
AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpWnHIs98ndPUDpnoxWQugJ6MpMncr
0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZRwgnBC5mVM6JjQ5x
Dk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNVbVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mm
we0icXKLkpEdIXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0I
v3OOImwTEe4co3c1mwARAQABwsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMv
Q/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEwTbe8YFsw2V/Buv6Z4Mysln3nQK5ZadD
534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1vJzQ1fOU8lYFpZXTXIH
b+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8VGiwXvT
yJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqc
suylWsviuGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5B
jR/i1DG86lem3iBDXzXsZDn8R3/CwO0EGAEIACAWIQSFEmdy6PYElKXQl/ew3p3W
KL8TLwUCWt3w0AIbAgCBCRCw3p3WKL8TL3YgBBkWCAAdFiEEUy2wekH2OPMeOLge
gFxhu0/YY74FAlrd8NAACgkQgFxhu0/YY75NiwD/fQf/RXpyv9ZX4n8UJrKDq422
bcwkujisT6jix2mOOwYBAKiip9+mAD6W5NPXdhk1XraECcIspcf2ff5kCAlG0DIN
aTUH/RIwNWzXDG58yQoLdD/UPcFgi8GWtNUp0Fhc/GeBxGipXYnvuWxwS+Qs1Qay
7/Nbal/v4/eZZaWs8wl2VtrHTS96/IF6q2o0qMey0dq2AxnZbQIULiEndgR625EF
RFg+IbO4ldSkB3trsF2ypYLij4ZObm2casLIP7iB8NKmQ5PndL8Y07TtiQ+Sb/wn
g4GgV+BJoKdDWLPCAlCMilwbZ88Ijb+HF/aipc9hsqvW/hnXC2GajJSAY3Qs9Mib
4Hm91jzbAjmp7243pQ4bJMfYHemFFBRaoLC7ayqQjcsttN2ufINlqLFPZPR/i3IX
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------WXNLX7hUGteVMReH76btghD5--

--------------OuR96bnSz4yQ49enGS0J8c0M--

--------------uSXxECBD8yo7tCgKJ8juhi62
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmfSqt4FAwAAAAAACgkQsN6d1ii/Ey8F
zAf+JfmnDu+4yMJwqAQ7V11b8gk1Trdtfe2X/AMCpsGnhqGrgsVq3cznFm6G4IWc1jYu0EBinSDK
pV9TrvKXKXY3adQsIAeUHwIXR+HO+qb3TilIh/VDlYVDhk9kbYIrher8Z1GYNFG1G199Ql5BSuwe
uhdJBS6TB+4VnpjvK6tOMapAeu8TAi8lHmWDHdd0848hmnJUjsyf9SBYC5uvnvNgXu5+bQy7zEDc
s+xRm0hKq2y8spwxeSznHnQoahNujEqdxc/WDBzrlqLKWQ00zfTZQHsBZjuoBF2s2pTHYt83ki0T
Nru2edvL/5w10cD2rxyJIqcndqkthq2QLzgcqOO/rA==
=ExQ0
-----END PGP SIGNATURE-----

--------------uSXxECBD8yo7tCgKJ8juhi62--

