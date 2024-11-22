Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4C39D6125
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2024 16:13:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841933.1257405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEVKm-0006wY-Q6; Fri, 22 Nov 2024 15:12:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841933.1257405; Fri, 22 Nov 2024 15:12:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEVKm-0006uE-NN; Fri, 22 Nov 2024 15:12:36 +0000
Received: by outflank-mailman (input) for mailman id 841933;
 Fri, 22 Nov 2024 15:12:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CazJ=SR=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tEVKk-0006u8-UJ
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2024 15:12:35 +0000
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [2a00:1450:4864:20::242])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3024a9cc-a8e4-11ef-99a3-01e77a169b0f;
 Fri, 22 Nov 2024 16:12:28 +0100 (CET)
Received: by mail-lj1-x242.google.com with SMTP id
 38308e7fff4ca-2fb59652cb9so24860911fa.3
 for <xen-devel@lists.xenproject.org>; Fri, 22 Nov 2024 07:12:28 -0800 (PST)
Received: from ?IPV6:2003:e5:872e:b100:d3c7:e0c0:5e3b:aa1c?
 (p200300e5872eb100d3c7e0c05e3baa1c.dip0.t-ipconnect.de.
 [2003:e5:872e:b100:d3c7:e0c0:5e3b:aa1c])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d01d3a342asm1007101a12.15.2024.11.22.07.12.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Nov 2024 07:12:26 -0800 (PST)
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
X-Inumbo-ID: 3024a9cc-a8e4-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoyNDIiLCJoZWxvIjoibWFpbC1sajEteDI0Mi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjMwMjRhOWNjLWE4ZTQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMjg4MzQ4LjY5ODI0Niwic2VuZGVyIjoiamdyb3NzQHN1c2UuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732288348; x=1732893148; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=74Ph7kh+W5x7/AcL1lQiJ4oXIO7Zaf5Kz+1+y8dO/iE=;
        b=XQlpuWFuTjXamrjTl2l7NOLu3HJG2E5X6IDotCsUbLp0pOdZgQhQjEzaSu1JGUF1mX
         rTVKhf7PEhFs+yGL966kwxqYfZsTOJTC2YSElnjW1Emu4ZGciVG4sBjr7VGekYRp2qoE
         UaoPNly2rknTT389Y33s5F/v/7T8fF/AjBbaCun4jpadYa90iMleQvnrGko1e+luJ22k
         zWejuIHTv9rOqivkucOVQanWmruvNKWPDyweMb8TYD5wRCuu3ji0VMzm35JBxZg9pwPP
         X94SMLgrltBMDHHmn7L2YD8qWpyYpR9O96SvmBcLy6wk3klSf9CE0MeweCXUkhrJs9MD
         KehQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732288348; x=1732893148;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=74Ph7kh+W5x7/AcL1lQiJ4oXIO7Zaf5Kz+1+y8dO/iE=;
        b=vVferwwWUEjFa+6U9pc4GRX4A8QOhH/izsMDUEkTee6JqO69QlVWXBEotUHiIvTMot
         Y1AmjVHUAEHMcIIbL2mWS82LzvmzTEXjd9YHLUYCQbqbJV2i6VenyDKtDKuWZ8/vCsHD
         Q3ZyxakV06KU3LrfxpRTUxLi0kWpqjO4wlsV5Rpg6evOKHL0+ieeY69mXZQXj9YNe8PU
         0tgFA1078TNiYOi4f49FliOY5gRto1zT0At9YhmAdSlA1K6s4ELfXkVS8MMhtcZTvJbS
         zSTDtcRP8KML5qu+7ErrcgKV+lw6XzF4PCmwNmcSTe3sPMtlJLvRU0GU2bxLh9bj51JE
         VB6Q==
X-Gm-Message-State: AOJu0YxNBihAxQmQe/UAlnyvu+AoEXCwvcnwoPUL2znkCGcjrXkHs2Iw
	EShty8K3N0ssjjyyYghTLraNOWahaWHAytUAH6get34VPIcXQgGSxpalj3lJx8Q=
X-Gm-Gg: ASbGnctPuBRAhmX5JIogxgSD3V2KicaeRETfVRcPYMGNeSXSb/9/sj3HR8v7whQfAC8
	bPLol63SdzP78uekQewDN00CKhWkSJ7NiF3oaL2KyEyQItFSMpe0kZZZUVHeZFjWQ3lBluVkN4s
	iDzktjQozcS9mpzeL0sn4MbQ/PMiD4HRXuYuUOx0WFLNbRuR/5F+NpmQqr2yedlZOIAwPGfKhRf
	pmqzbsTpKtCEMWtGZW+u+UNuiKQm1XxmUIlF7dGi3d9JgsDZpsxXQemi3364MqfKNpNykAEcqpG
	6lv8OB3tEetKM+P3fgsPMOMEERNdsBrl/rjSTl1pV2/T2xMtCOc1obrc/hFVQu8LFj5bY1LLAk0
	=
X-Google-Smtp-Source: AGHT+IGX3uEqVA5Bn8+el9xIKhxlOcf4TbH0RVjzwSN3sSvPAB9Nr6b47LT2V7aDVCxQGUg1BbRz0Q==
X-Received: by 2002:a2e:bccd:0:b0:2fb:593c:2bf2 with SMTP id 38308e7fff4ca-2ffa70f6ab8mr17490101fa.3.1732288346426;
        Fri, 22 Nov 2024 07:12:26 -0800 (PST)
Message-ID: <1846da14-f942-4414-8776-d76019fba37f@suse.com>
Date: Fri, 22 Nov 2024 16:12:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] tools/libs: add a new libxenmanage library
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org
References: <20241023131005.32144-1-jgross@suse.com>
 <20241023131005.32144-5-jgross@suse.com> <Z0CNNdezcIbUelrk@l14>
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
In-Reply-To: <Z0CNNdezcIbUelrk@l14>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------7vZZ8Ma8IvEewoJjirfu16xp"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------7vZZ8Ma8IvEewoJjirfu16xp
Content-Type: multipart/mixed; boundary="------------cMmNDwkHVjn9UBzf50Zt0uHz";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org
Message-ID: <1846da14-f942-4414-8776-d76019fba37f@suse.com>
Subject: Re: [PATCH 4/6] tools/libs: add a new libxenmanage library
References: <20241023131005.32144-1-jgross@suse.com>
 <20241023131005.32144-5-jgross@suse.com> <Z0CNNdezcIbUelrk@l14>
In-Reply-To: <Z0CNNdezcIbUelrk@l14>

--------------cMmNDwkHVjn9UBzf50Zt0uHz
Content-Type: multipart/mixed; boundary="------------tY0GMx6V2FOO044swXVOa1i5"

--------------tY0GMx6V2FOO044swXVOa1i5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjIuMTEuMjQgMTQ6NTUsIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0KPiBIaSBKdWVyZ2Vu
LA0KPiANCj4gT24gV2VkLCBPY3QgMjMsIDIwMjQgYXQgMDM6MTA6MDNQTSArMDIwMCwgSnVl
cmdlbiBHcm9zcyB3cm90ZToNCj4+IEluIG9yZGVyIHRvIGhhdmUgYSBzdGFibGUgaW50ZXJm
YWNlIGluIHVzZXIgbGFuZCBmb3IgdXNpbmcgc3RhYmxlDQo+PiBkb21jdGwgYW5kIHBvc3Np
Ymx5IGxhdGVyIHN5c2N0bCBpbnRlcmZhY2VzLCBhZGQgYSBuZXcgbGlicmFyeQ0KPj4gbGli
eGVubWFuYWdlLg0KPiANCj4gV2hhdCB0aGlzIG5ldyBsaWJyYXJ5IGNvdWxkIGRvPyBXaGF0
IHNvcnQgb2Ygb3BlcmF0aW9uIGNvdWxkIGJlIGFkZGVkIGluDQo+IHRoZSBmdXR1cmU/IERv
bWFpbiBjcmVhdGlvbj8gSSdtIHRyeWluZyB0byBnZXQgY29udmluY2UgdGhhdCAibWFuYWdl
IiBpcw0KPiB0aGUgcmlnaHQgbmFtZSBmb3IgaXQuDQoNCkl0IGlzIHRob3VnaHQgdG8gZW5j
YXBzdWxhdGUgYWxsIChmdXR1cmUpIHN0YWJsZSBoeXBlcmNhbGxzIHJlcGxhY2luZw0KY3Vy
cmVudCBzeXNjdGwgYW5kIGRvbWN0bCBvcGVyYXRpb25zLg0KDQo+IFRvIG1lLCAibWFuYWdl
IiBjb3VsZCBiZSBzb21ldGhpbmcgaGlnaGVyIGxldmVsIHRvIHRha2UgY2FyZSBvZiBhIGRv
bWFpbg0KPiBmcm9tIGl0J3MgY3JlYXRpb24gdG8gaXRzIGRlbWlzZS4NCg0KWWVzLCBhbmQg
dG8gbWFuYWdlIHRoZSBob3N0Lg0KDQo+IFNvIGZvciB0aGlzIGxpYiBoYXZlIGdldF9kb21h
aW5faW5mbygpIHRvIHF1ZXJ5IGFib3V0IGEgc2luZ2xlIGRvbWFpbiwNCj4gYW5kIGdldF9j
aGFuZ2VkX2RvbWFpbigpIHdoaWNoIHNlZW1zIHRvIGJlIGEgc3RhdGUgc3luY2hyb25pc2F0
aW9uDQo+IG9wZXJhdGlvbi4gKEZvciB0aGF0IHNlY29uZCBmdW5jdGlvbiwgaXQgcmVzZW1i
bGUgYW4gb3BlcmF0aW9uIG9mIHRoZQ0KPiBNYXRyaXggQVBJIGNhbGxpbmcgImh0dHBzOi8v
Li4uL3N5bmMiIHdoaWNoIHJldHVybiBhbGwgdGhlIG5ldyBldmVudA0KPiBzaW5jZSB0aGUg
bGFzdCB0aW1lIGl0IHdhcyBjYWxsZWQuIEJ1dCBiYWNrIHRvIHRoZSBuZXcgZnVuY3Rpb24g
bmFtZSwgYQ0KPiBnZXQqIGZ1bmN0aW9uIHdoaWNoIHJldHVybnMgYSBkaWZmZXJlbnQgdmFs
dWUgZXZlcnkgdGltZSB5b3UgY2FsbCBpdA0KPiBtaWdodCBub3QgYWN0dWFsbHkgYmUgdGhl
IHJpZ2h0IG5hbWUgZm9yIGl0LCBtYXliZSBvdGhlciBmdW5jdGlvbnMgdGhhdA0KPiBkbyBz
b21ldGhpbmcgc2ltaWxhciwgb3IgYXQgbGVhc3QgdGVsbCB3aGVuIHRoZXJlJ3MgYSBuZXcg
ZXZlbnQsIHdvdWxkDQo+IGJlIHBvbGwoKSBhbmQgc2VsZWN0KCksIHNvIG1heWJlIHBvbGxf
Y2hhbmdlZF9kb21haW4oKSB3b3VsZCBiZSBzbGlnaHRseQ0KPiBiZXR0ZXIgYXQgZGVzY3Jp
YmluZyB0aGUga2luZCBvZiBmdW5jdGlvbiB0aGF0IGl0IGlzPykNCg0KRmluZSB3aXRoIG1l
LiBJJ20gYWx3YXlzIGluIGZhdm9yIG9mIGRlc2NyaXB0aXZlIG5hbWVzLg0KDQo+IFNvLCB0
aG9zZSB0d28gZnVuY3Rpb25zIG9ubHkgcXVlcnkgYWJvdXQgdGhlIHN0YXRlcyBvZiBkb21h
aW5zLCB3aXRob3V0DQo+IG1ha2luZyBhbnkgbW9kaWZpY2F0aW9uIGlzIHNlZW1zLCBzbyBp
cyAibWFuYWdlIiBzdGlsbCB0aGUgcmlnaHQgbmFtZT8NCj4gQXQgbGVhc3QsIGl0IGJvdGgg
ZnVuY3Rpb24gZG9lc24ndCBzZWVtcyB0byBmaXQgaW4gZXhpc3Rpbmcgc3RhYmxlDQo+IGxp
YnJhcmllcyBzbyBoYXZpbmcgYSBuZXcgb25lIHNlZW1zIHRoZSByaWdodCBjYWxsLiBTbyB0
aGUgbmFtZQ0KPiBkZXBlbmRzIG9mIHdoYXQgb3RoZXIgb3BlcmF0aW9uIGNvdWxkIGJlIGFk
ZGVkIHRvIHRoZSBsaWJyYXJ5LCBhcyBzdWNoLA0KPiBhIGRlc2NyaXB0aW9uIG9mIHRoZSBs
aWJyYXJ5IHdvdWxkIGJlIG5pY2UsIGJ1dCBhdCBsZWFzdCB0aGFua3MgZm9yDQo+IGRvY3Vt
ZW50aW5nIGV2ZXJ5IGZ1bmN0aW9ucyENCg0KSSBjYW4gYWRkIG1vcmUgY29tbWVudHMsIG9m
IGNvdXJzZS4gVGhpcyB3YXMganVzdCBhIGZpcnN0IGl0ZXJhdGlvbiB0bw0KZ2V0IHNvbWUg
ZmVlZGJhY2sgd2hldGhlciB0aGUgZ2VuZXJhbCBhcHByb2FjaCBpcyBva2F5Lg0KDQo+IA0K
Pj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2luY2x1ZGUveGVubWFuYWdlLmggYi90b29scy9pbmNs
dWRlL3hlbm1hbmFnZS5oDQo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPj4gaW5kZXggMDAw
MDAwMDAwMC4uMmU2YzNkZWRhYQ0KPj4gLS0tIC9kZXYvbnVsbA0KPj4gKysrIGIvdG9vbHMv
aW5jbHVkZS94ZW5tYW5hZ2UuaA0KPj4gQEAgLTAsMCArMSw5OCBAQA0KPj4gKy8qDQo+PiAr
ICogQ29weXJpZ2h0IChjKSAyMDI0IFNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkg
R21iSA0KPj4gKyAqDQo+PiArICogVGhpcyBsaWJyYXJ5IGlzIGZyZWUgc29mdHdhcmU7IHlv
dSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vcg0KPj4gKyAqIG1vZGlmeSBpdCB1bmRlciB0
aGUgdGVybXMgb2YgdGhlIEdOVSBMZXNzZXIgR2VuZXJhbCBQdWJsaWMNCj4+ICsgKiBMaWNl
bnNlIGFzIHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOw0KPj4g
KyAqIHZlcnNpb24gMi4xIG9mIHRoZSBMaWNlbnNlLg0KPj4gKyAqDQo+PiArICogVGhpcyBs
aWJyYXJ5IGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRoYXQgaXQgd2lsbCBiZSB1c2Vm
dWwsDQo+PiArICogYnV0IFdJVEhPVVQgQU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhl
IGltcGxpZWQgd2FycmFudHkgb2YNCj4+ICsgKiBNRVJDSEFOVEFCSUxJVFkgb3IgRklUTkVT
UyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UuICBTZWUgdGhlIEdOVQ0KPj4gKyAqIExlc3Nl
ciBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMuDQo+PiArICoNCj4+
ICsgKiBZb3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgTGVzc2Vy
IEdlbmVyYWwgUHVibGljDQo+PiArICogTGljZW5zZSBhbG9uZyB3aXRoIHRoaXMgbGlicmFy
eTsgSWYgbm90LCBzZWUgPGh0dHA6Ly93d3cuZ251Lm9yZy9saWNlbnNlcy8+Lg0KPiANCj4g
U2hhbGwgd2UgdXNlIFNQRFggdGFncyBpbnN0ZWFkIG9mIHRoaXMgYm9pbGVycGxhdGU/DQoN
Ck15IHRoaW5raW5nIHdhcyB0byBhdm9pZCB0aGF0IGZvciAib2ZmaWNpYWwiIGhlYWRlciBm
aWxlcywgYXMgdGhvc2UgbWlnaHQNCmJlIGNvcGllZCB2ZXJiYXRpbSB0byBvdGhlciBwcm9q
ZWN0cywgd2hpY2ggbWlnaHQgbm90IHVzZSBTUERYLiBTbyBoYXZpbmcNCnRoZSBsaWNlbnNl
IHRleHQgdmVyYmF0aW0gYXZvaWRzIGFueSBwcm9ibGVtcyBpbiB0aGlzIHJlZ2FyZC4NCg0K
PiANCj4+ICsgKi8NCj4+ICsjaWZuZGVmIFhFTk1BTkFHRV9IDQo+PiArI2RlZmluZSBYRU5N
QU5BR0VfSA0KPj4gKw0KPj4gKyNpbmNsdWRlIDxzdGRpbnQuaD4NCj4+ICsNCj4+ICsvKiBD
YWxsZXJzIHdobyBkb24ndCBjYXJlIGRvbid0IG5lZWQgdG8gI2luY2x1ZGUgPHhlbnRvb2xs
b2cuaD4gKi8NCj4+ICtzdHJ1Y3QgeGVudG9vbGxvZ19sb2dnZXI7DQo+IA0KPiBNb3JlIGxp
a2UsIGNhbGxlcnMgd2hvIGNhcmUgd2lsbCBuZWVkIHRvIGluY2x1ZGUgeGVudG9vbGxvZy5o
LiBIZXJlLCB3ZQ0KPiBqdXN0IGF2b2lkIHRoZSBuZWVkIHRvIGluY2x1ZGUgeGVudG9vbGxv
Zy5oIGluIHhlbm1hbmFnZS5oIGJ5IGRlY2xhcmluZw0KPiB0aGUgbWluaW11bS4NCj4gDQo+
IElmIGV2ZXJ5IHRpbWUgSSB3YW50ZWQgdG8gaW5jbHVkZSBhbiBoZWFkZXIsIEkgbmVlZGVk
IHRvIGZpZ3VyZSB3aGljaA0KPiBoZWFkZXIgbmVlZGVkIHRvIGJlIGluY2x1ZGUgYmVmb3Jl
LCB0aGF0IHdvdWxkIGJlIHZlcnkgYW5ub3lpbmcuIE9mdGVuLA0KPiBoZWFkZXJzIGluY2x1
ZGUgdGhlIG5lZWRlZCBoZWFkZXJzLg0KPiANCj4gSWYgeW91IHdhbnQgdG8gaGF2ZSBhIGNv
bW1lbnQsIGhvdyBhYm91dCAiQXZvaWQgdGhlIG5lZWQgdG8gaW5jbHVkZQ0KPiA8eGVudG9v
bGxvZy5oPiIsIHRoYXQgd2F5IHRoZSBjb21tZW50IHRlbGwgd2h5ICJzdHJ1Y3QNCj4geGVu
dG9vbGxvZ19sb2dnZXIiIGlzIGhlcmUsIHdoZXJlIGl0IGNhbWUgZnJvbSwgYW5kIGlzIG1v
cmUgZXhwbGljaXQuDQoNCk9rYXkuDQoNCj4+IGRpZmYgLS1naXQgYS90b29scy9saWJzL21h
bmFnZS9jb3JlLmMgYi90b29scy9saWJzL21hbmFnZS9jb3JlLmMNCj4+IG5ldyBmaWxlIG1v
ZGUgMTAwNjQ0DQo+PiBpbmRleCAwMDAwMDAwMDAwLi4wYzkxOTlmODI5DQo+PiAtLS0gL2Rl
di9udWxsDQo+PiArKysgYi90b29scy9saWJzL21hbmFnZS9jb3JlLmMNCj4+IEBAIC0wLDAg
KzEsMTcwIEBADQo+IC4uLg0KPj4gKw0KPj4gKyNkZWZpbmUgX19YRU5fVE9PTFNfXyAxDQo+
IA0KPiBUaGlzIGRlZmluZSBtaWdodCBiZSBiZXR0ZXIgaW4gdGhlIE1ha2VmaWxlKC5jb21t
b24pLCBvciBldmVuIGluIGxpYnMubWs/IFNvIGZhciwNCj4gb25seSBsaWJ4ZW5oeXBmcyBk
b2VzIGRlZmluZSB0aGlzIGluIHNvdXJjZSBjb2RlLCBhbGwgdGhlIG90aGVyIGRlZmluZXMN
Cj4gYXJlIGluIENGTEFHUyBvciB0aGVyZSBiZWNhdXNlIHhlbmN0cmwuaCBpcyBpbmNsdWRl
ZC4NCg0KWWVzLCB0aGF0J3MgYmV0dGVyLg0KDQo+PiArc3RhdGljIGludCB4ZW5tYW5hZ2Vf
ZG9fZG9tY3RsX2dldF9kb21haW5fc3RhdGUoeGVubWFuYWdlX2hhbmRsZSAqaGRsLA0KPj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2ln
bmVkIGludCBkb21pZF9pbiwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgKmRvbWlkX291dCwNCj4+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQg
KnN0YXRlLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHVpbnQ2NF90ICp1bmlxdWVfaWQpDQo+PiArew0KPj4gKyAgICBzdHJ1Y3QgeGVu
X2RvbWN0bCAqYnVmOw0KPj4gKyAgICBzdHJ1Y3QgeGVuX2RvbWN0bF9nZXRfZG9tYWluX3N0
YXRlICpzdDsNCj4+ICsgICAgaW50IHNhdmVkX2Vycm5vOw0KPj4gKyAgICBpbnQgcmV0Ow0K
Pj4gKw0KPiAuLi4NCj4+ICsNCj4+ICsgICAgcmV0ID0geGVuY2FsbDEoaGRsLT54Y2FsbCwg
X19IWVBFUlZJU09SX2RvbWN0bCwgKHVuc2lnbmVkIGxvbmcpYnVmKTsNCj4+ICsgICAgc2F2
ZWRfZXJybm8gPSBlcnJubzsNCj4+ICsgICAgaWYgKCAhcmV0ICkNCj4+ICsgICAgew0KPj4g
KyAgICAgICAgc3QgPSAmYnVmLT51LmdldF9kb21haW5fc3RhdGU7DQo+IA0KPiBZb3UgY291
bGQgZGVmaW5lICpzdCBoZXJlLg0KPiBzdHJ1Y3QgeGVuX2RvbWN0bF9nZXRfZG9tYWluX3N0
YXRlICpzdCA9ICYuLi47DQo+IA0KPiBPciBldmVuIHdpdGggIi4uICpjb25zdCBzdCIgYnV0
IG1heWJlIHRoYXQncyBub3QgY29tbW9uIGVub3VnaCBpbiBDDQo+IGNvZGUuDQoNCk9rYXks
IEknbGwgbW92ZSB0aGUgZGVmaW5pdGlvbiBkb3duLg0KDQoNCkp1ZXJnZW4NCg==
--------------tY0GMx6V2FOO044swXVOa1i5
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------tY0GMx6V2FOO044swXVOa1i5--

--------------cMmNDwkHVjn9UBzf50Zt0uHz--

--------------7vZZ8Ma8IvEewoJjirfu16xp
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmdAn1kFAwAAAAAACgkQsN6d1ii/Ey/K
zAf/cQyrrcV/l1J/m8ALw3xRMjG1+BUANyfL9NaqPQsP9SlvSUGTdSDLIcuaD61i0bfWSV+wEllU
yZ+PIsmKNodYEXXtIK6AT4ut/9b6GImxI3z1YaH7dXQto8l/G28T0f8L6sfh3iJtIr0Wyd/xsmYe
eoeEJuOsKhVk3+9IwbOK9hhQOr+gxTJWI6M+bBbRxynPRE11qAR6g371C+wlz1NrulR2Nc5U44hL
F9kFX552aTNJr8He/e/0D0sjfTHJC0amh1/Pmf6TVas3FbQivigBOVIF4SiFA+ugjy8TfmRzEA7x
nEHLztxU5byh2ZxsEToaZjlpeum7R1WLSa0dO6Bwuw==
=UL8T
-----END PGP SIGNATURE-----

--------------7vZZ8Ma8IvEewoJjirfu16xp--

