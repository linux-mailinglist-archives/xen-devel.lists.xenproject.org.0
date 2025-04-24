Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59AF6A9A9CC
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 12:16:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.966127.1356449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7td5-00053u-Ix; Thu, 24 Apr 2025 10:16:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 966127.1356449; Thu, 24 Apr 2025 10:16:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7td5-00052S-Ex; Thu, 24 Apr 2025 10:16:27 +0000
Received: by outflank-mailman (input) for mailman id 966127;
 Thu, 24 Apr 2025 10:16:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RfDJ=XK=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1u7td3-00052F-FA
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 10:16:25 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2cf43b58-20f5-11f0-9eb1-5ba50f476ded;
 Thu, 24 Apr 2025 12:16:24 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-acbb85ce788so174348766b.3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Apr 2025 03:16:24 -0700 (PDT)
Received: from ?IPV6:2003:e5:870f:e000:6c64:75fd:2c51:3fef?
 (p200300e5870fe0006c6475fd2c513fef.dip0.t-ipconnect.de.
 [2003:e5:870f:e000:6c64:75fd:2c51:3fef])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace59c5e9ccsm85183966b.178.2025.04.24.03.16.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Apr 2025 03:16:23 -0700 (PDT)
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
X-Inumbo-ID: 2cf43b58-20f5-11f0-9eb1-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745489784; x=1746094584; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7yeb9KlYqqGD/ZehSL+UaW5Mu1Sv69xuG2EIsa3T9HE=;
        b=T0/szGySnlAZcNMTS3BCwtNV3/HV/ZNmnadL1ujyTfBpwptujg209UnXfc5prVy8JY
         e7pXjAT5F5Q4HvpgjpEKiFlaSMqAWCTv4U1M1TqGdvtEdfJpDGYNKuDfuvMejVrI3WWi
         Qh+49Yy2NyO/g0clJOAvkr0Da+LZ6WSBisMxeZB+A89pHbHRmXzAVmZISSMIgldlqAPJ
         /6RmZWbUXZNOZrCNHpP7+k7OXgkk9Bw/3gWZPmzf0SiQCaopXHbKpFK/Ay0idze+sG2W
         7usIorbwCdxskHNkH9SRUc87by26O3vn4WfD2txtWGwmbAV4vPWpCOCwGwx4qbtCtHC0
         M4dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745489784; x=1746094584;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7yeb9KlYqqGD/ZehSL+UaW5Mu1Sv69xuG2EIsa3T9HE=;
        b=KgXWz+0lCPvPMhWIiCLQFYVt2S4VHl6DvL37SMJTBup6qDarqFo8RuT/ejLE5SSyOv
         9n/Rp/gkpVjLP3VAcaObC6IMsRkXgmJhONrd2TCiaRVgLdGe1NVEcMkUO4V43ZXYue7o
         I5k/wH36deydP5RJi9WR9G/3vsk8fVdmWX9jqxr4wuj10pTvMN1f9MXiNluKB1aj0kZF
         vsL8o84Gesif1jn5z4jotB/RcoOvT3hGti6YYhI5zBKbyzN7GsqJp1w1K5EgLmTOu+CP
         f4nE683jjpp8W/5LvehpPNFhz971T/qt/WQ94A0Zwb5Sp1T2v+Op+RFpnUTwjS/l1FMR
         vjjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVF30zPWL0OzZxx+Dd+kr+p71dVwZRutmTXBmuZd+pG7znKJvKEMfWctkNNOlgmYc194qb2JAgf5eI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyGZctKV3VHQcNemWFpvw15dd3StVh6KXOb9g2FwYi5U1xaC2ZL
	GdKMWeSjjAtsbwdYj3KIDEYT0DqRa9a8RcqOuOnVVOb420wnMQqzmzAQif1O+EY=
X-Gm-Gg: ASbGnctvMp9S971mei/sB88Dh4kyFRPNBYP485wOvkJ4BH+y9EM9nyPRrUtk41Gemvv
	EnuTtAnX6bxblWM7y72uyPpa1PnbuLV+wtu/G0iydp2XPVOM+VQFnSUrgwtPrfeOg3cGrE5LaCX
	FtEGEX1rYOEu9Hmca9wBwH87TELd1VcQp5gAp1PuccFHpVmbtzknzGLx4LgFLgGXEvKw3ltm3E+
	qCz17el/wfTEXpR9A6GFHcw1u/ptEZrGhfhxzN3dceNtniCYqC2y9eLs44giIETZqA7PE+m3tuE
	SInnGCqr3lkCiLKUMc84a1s+tl+Vfb7sVZb3bq4mg7uvJv8RXmcQ3qJdNgMF9GF+aS19SidooBW
	Vu1ISM/RGi5bhK7Zcdy7dnKUJCe8SaCeZs2Nw0yuObQ7/c3PhEQRrYfy9jv5AHPJ1aQ==
X-Google-Smtp-Source: AGHT+IEm0tqe1Y6NrZYwZAPw8mP7gfJu/rS857Ou/Nw00s8avdEvZrPp9A2s5JSOi+lWLJhyNrhoNw==
X-Received: by 2002:a17:907:3f9e:b0:aca:d4f6:440d with SMTP id a640c23a62f3a-ace5723afaemr234662066b.17.1745489783619;
        Thu, 24 Apr 2025 03:16:23 -0700 (PDT)
Message-ID: <054eec5c-1f36-454b-9220-b7f975d2717b@suse.com>
Date: Thu, 24 Apr 2025 12:16:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 14/34] x86/msr: refactor
 pv_cpu_ops.write_msr{_safe}()
To: "Xin Li (Intel)" <xin@zytor.com>, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev,
 linux-pm@vger.kernel.org, linux-edac@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
 linux-hwmon@vger.kernel.org, netdev@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, acme@kernel.org,
 andrew.cooper3@citrix.com, peterz@infradead.org, namhyung@kernel.org,
 mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org,
 irogers@google.com, adrian.hunter@intel.com, kan.liang@linux.intel.com,
 wei.liu@kernel.org, ajay.kaher@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, tony.luck@intel.com,
 pbonzini@redhat.com, vkuznets@redhat.com, seanjc@google.com,
 luto@kernel.org, boris.ostrovsky@oracle.com, kys@microsoft.com,
 haiyangz@microsoft.com, decui@microsoft.com
References: <20250422082216.1954310-1-xin@zytor.com>
 <20250422082216.1954310-15-xin@zytor.com>
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
In-Reply-To: <20250422082216.1954310-15-xin@zytor.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------pWVoNv7WLwVBgb4mHgM007fn"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------pWVoNv7WLwVBgb4mHgM007fn
Content-Type: multipart/mixed; boundary="------------b3S9hpqWlrcvhJkKaKAw7Czp";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: "Xin Li (Intel)" <xin@zytor.com>, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev,
 linux-pm@vger.kernel.org, linux-edac@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
 linux-hwmon@vger.kernel.org, netdev@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, acme@kernel.org,
 andrew.cooper3@citrix.com, peterz@infradead.org, namhyung@kernel.org,
 mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org,
 irogers@google.com, adrian.hunter@intel.com, kan.liang@linux.intel.com,
 wei.liu@kernel.org, ajay.kaher@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, tony.luck@intel.com,
 pbonzini@redhat.com, vkuznets@redhat.com, seanjc@google.com,
 luto@kernel.org, boris.ostrovsky@oracle.com, kys@microsoft.com,
 haiyangz@microsoft.com, decui@microsoft.com
Message-ID: <054eec5c-1f36-454b-9220-b7f975d2717b@suse.com>
Subject: Re: [RFC PATCH v2 14/34] x86/msr: refactor
 pv_cpu_ops.write_msr{_safe}()
References: <20250422082216.1954310-1-xin@zytor.com>
 <20250422082216.1954310-15-xin@zytor.com>
In-Reply-To: <20250422082216.1954310-15-xin@zytor.com>

--------------b3S9hpqWlrcvhJkKaKAw7Czp
Content-Type: multipart/mixed; boundary="------------BppMQx0iku6Wc7Pk9I10DjXt"

--------------BppMQx0iku6Wc7Pk9I10DjXt
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjIuMDQuMjUgMTA6MjEsIFhpbiBMaSAoSW50ZWwpIHdyb3RlOg0KPiBBbiBNU1IgdmFs
dWUgaXMgcmVwcmVzZW50ZWQgYXMgYSA2NC1iaXQgdW5zaWduZWQgaW50ZWdlciwgd2l0aCBl
eGlzdGluZw0KPiBNU1IgaW5zdHJ1Y3Rpb25zIHN0b3JpbmcgaXQgaW4gRURYOkVBWCBhcyB0
d28gMzItYml0IHNlZ21lbnRzLg0KPiANCj4gVGhlIG5ldyBpbW1lZGlhdGUgZm9ybSBNU1Ig
aW5zdHJ1Y3Rpb25zLCBob3dldmVyLCB1dGlsaXplIGEgNjQtYml0DQo+IGdlbmVyYWwtcHVy
cG9zZSByZWdpc3RlciB0byBzdG9yZSB0aGUgTVNSIHZhbHVlLiAgVG8gdW5pZnkgdGhlIHVz
YWdlIG9mDQo+IGFsbCBNU1IgaW5zdHJ1Y3Rpb25zLCBsZXQgdGhlIGRlZmF1bHQgTVNSIGFj
Y2VzcyBBUElzIGFjY2VwdCBhbiBNU1INCj4gdmFsdWUgYXMgYSBzaW5nbGUgNjQtYml0IGFy
Z3VtZW50IGluc3RlYWQgb2YgdHdvIDMyLWJpdCBzZWdtZW50cy4NCj4gDQo+IFRoZSBkdWFs
IDMyLWJpdCBBUElzIGFyZSBzdGlsbCBhdmFpbGFibGUgYXMgY29udmVuaWVudCB3cmFwcGVy
cyBvdmVyIHRoZQ0KPiBBUElzIHRoYXQgaGFuZGxlIGFuIE1TUiB2YWx1ZSBhcyBhIHNpbmds
ZSA2NC1iaXQgYXJndW1lbnQuDQo+IA0KPiBUaGUgZm9sbG93aW5nIGlsbHVzdHJhdGVzIHRo
ZSB1cGRhdGVkIGRlcml2YXRpb24gb2YgdGhlIE1TUiB3cml0ZSBBUElzOg0KPiANCj4gICAg
ICAgICAgICAgICAgICAgX193cm1zcnEodTMyIG1zciwgdTY0IHZhbCkNCj4gICAgICAgICAg
ICAgICAgICAgICAvICAgICAgICAgICAgICAgICAgXA0KPiAgICAgICAgICAgICAgICAgICAg
LyAgICAgICAgICAgICAgICAgICAgXA0KPiAgICAgICAgICAgICBuYXRpdmVfd3Jtc3JxKG1z
ciwgdmFsKSAgICBuYXRpdmVfd3Jtc3IobXNyLCBsb3csIGhpZ2gpDQo+ICAgICAgICAgICAg
ICAgICAgIHwNCj4gICAgICAgICAgICAgICAgICAgfA0KPiAgICAgICAgICAgICBuYXRpdmVf
d3JpdGVfbXNyKG1zciwgdmFsKQ0KPiAgICAgICAgICAgICAgICAgIC8gICAgICAgICAgXA0K
PiAgICAgICAgICAgICAgICAgLyAgICAgICAgICAgIFwNCj4gICAgICAgICB3cm1zcnEobXNy
LCB2YWwpICAgIHdybXNyKG1zciwgbG93LCBoaWdoKQ0KPiANCj4gV2hlbiBDT05GSUdfUEFS
QVZJUlQgaXMgZW5hYmxlZCwgd3Jtc3JxKCkgYW5kIHdybXNyKCkgYXJlIGRlZmluZWQgb24g
dG9wDQo+IG9mIHBhcmF2aXJ0X3dyaXRlX21zcigpOg0KPiANCj4gICAgICAgICAgICAgIHBh
cmF2aXJ0X3dyaXRlX21zcih1MzIgbXNyLCB1NjQgdmFsKQ0KPiAgICAgICAgICAgICAgICAg
LyAgICAgICAgICAgICBcDQo+ICAgICAgICAgICAgICAgIC8gICAgICAgICAgICAgICBcDQo+
ICAgICAgICAgICAgd3Jtc3JxKG1zciwgdmFsKSAgICB3cm1zcihtc3IsIGxvdywgaGlnaCkN
Cj4gDQo+IHBhcmF2aXJ0X3dyaXRlX21zcigpIGludm9rZXMgY3B1LndyaXRlX21zcihtc3Is
IHZhbCksIGFuIGluZGlyZWN0IGxheWVyDQo+IG9mIHB2X29wcyBNU1Igd3JpdGUgY2FsbDoN
Cj4gDQo+ICAgICAgSWYgb24gbmF0aXZlOg0KPiANCj4gICAgICAgICAgICAgIGNwdS53cml0
ZV9tc3IgPSBuYXRpdmVfd3JpdGVfbXNyDQo+IA0KPiAgICAgIElmIG9uIFhlbjoNCj4gDQo+
ICAgICAgICAgICAgICBjcHUud3JpdGVfbXNyID0geGVuX3dyaXRlX21zcg0KPiANCj4gVGhl
cmVmb3JlLCByZWZhY3RvciBwdl9jcHVfb3BzLndyaXRlX21zcntfc2FmZX0oKSB0byBhY2Nl
cHQgYW4gTVNSIHZhbHVlDQo+IGluIGEgc2luZ2xlIHU2NCBhcmd1bWVudCwgcmVwbGFjaW5n
IHRoZSBjdXJyZW50IGR1YWwgdTMyIGFyZ3VtZW50cy4NCj4gDQo+IE5vIGZ1bmN0aW9uYWwg
Y2hhbmdlIGludGVuZGVkLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogWGluIExpIChJbnRlbCkg
PHhpbkB6eXRvci5jb20+DQoNClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NA
c3VzZS5jb20+DQoNCg0KSnVlcmdlbg0K
--------------BppMQx0iku6Wc7Pk9I10DjXt
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

--------------BppMQx0iku6Wc7Pk9I10DjXt--

--------------b3S9hpqWlrcvhJkKaKAw7Czp--

--------------pWVoNv7WLwVBgb4mHgM007fn
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmgKD3UFAwAAAAAACgkQsN6d1ii/Ey8e
hQf+IyaGfaANfYLf1gQb5JWLRkUgyz/njZG+UwVqy+rsaIYD+pEhdKw5SCCnD0k0rYwGX+humDna
09S/SBtqSMJ6op9sp+0UMcix59tVByTG+d8H/RBLf2IWAPI0XKU6b3m310+4u3nyopkvf/rjeJWt
SfFxXPA+0soMqiPgLiqLfQOcImvL7By/Ic4k7iCcQ8r2tUX4e49qE7Ceu6m2OhnWo7gegbiK3g3a
o5e9jvL464VbQ0jA76OH8KY4kcOV8y0TQXP2dC3WWvN7O1iNoEL9KIIg3/K4iTHOY10ayy/UVXOd
NK1TCl85M2LuLTmu8q4pp9E3JwXRobXErwdZe+JYvQ==
=xegw
-----END PGP SIGNATURE-----

--------------pWVoNv7WLwVBgb4mHgM007fn--

