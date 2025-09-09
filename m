Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5945CB4A990
	for <lists+xen-devel@lfdr.de>; Tue,  9 Sep 2025 12:08:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1116129.1462534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvvH8-00010e-7k; Tue, 09 Sep 2025 10:08:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1116129.1462534; Tue, 09 Sep 2025 10:08:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvvH8-0000yM-4W; Tue, 09 Sep 2025 10:08:34 +0000
Received: by outflank-mailman (input) for mailman id 1116129;
 Tue, 09 Sep 2025 10:08:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dp7M=3U=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uvvH6-0000yD-KW
 for xen-devel@lists.xenproject.org; Tue, 09 Sep 2025 10:08:32 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id efa2f1c6-8d64-11f0-9809-7dc792cee155;
 Tue, 09 Sep 2025 12:08:30 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3c6abcfd142so2672928f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 09 Sep 2025 03:08:30 -0700 (PDT)
Received: from ?IPV6:2003:e5:873d:be00:c26:b971:1ba7:9d8b?
 (p200300e5873dbe000c26b9711ba79d8b.dip0.t-ipconnect.de.
 [2003:e5:873d:be00:c26:b971:1ba7:9d8b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b9bcda91dsm317709275e9.6.2025.09.09.03.08.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Sep 2025 03:08:29 -0700 (PDT)
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
X-Inumbo-ID: efa2f1c6-8d64-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757412510; x=1758017310; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DiDplQj9hx3PvXah5112bj2kShJJIkIE7dUW74ox+yg=;
        b=JcDvh2KQB5WFOadc0t4uZNCWVYya4R8+pvaJHq/tBCp7d05Tns2gX966h3pnSVsGzm
         kSFS3kM/K7jijj490DDTP7zweR84ZCyDwdGL28HNP2gG0ajkFTBAPt5k42npnWurRLbs
         +E0G4g1NyenCO/9RCiK6DJGanKH9vmnjk+Kw3B/FvLULmNQepeS9rCn/6K9aETFHpG6S
         Yvu70LfOe1zQUFvdf+fnXRTStqteL6A7G5/FH+GnIFU1OclxkGbhq3DGQz5JGu2ro2dw
         FQgmsCtziBZ2Du4H+nKRVST+LQZmjpUWKHa1uQss78+/ItM+Rv3Th6T8r/3A0hr3PMlH
         mpfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757412510; x=1758017310;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DiDplQj9hx3PvXah5112bj2kShJJIkIE7dUW74ox+yg=;
        b=gCntyGGImkyWqqxc+X7dNOZPz8Ta0KLNAeTMux7RZGtb1RwCpHrsUkv4IcIblduI6c
         lKVn8iz4zqER3je0ryXU5+qQgsqT9kfN9qLqw47P+aI8kSQjmlioq9bfVLUeLFCwm2vR
         GkuU8vlBwL9eLJf7RLeP2siI76X3szRBlxMzq+vURXS75oZfHfJ8j67m056XH76+pm+E
         TyITCXsXR2YZhz2NpkGTtyVkJhjapoSnI9JoDkGTw5zWoiMe73rUhzN2KsP9emxjlnd7
         9blyhUQPYWYNMUT/dOzxaYahThLGpN9VT85mEkRWQGgaVUeY2MP1OUwa2Cfx11qLOGp3
         a1jg==
X-Forwarded-Encrypted: i=1; AJvYcCWAGPuMEdHFLW4MmQbtbGO4kDm1f68IBb0udOcQxjtGB4vM3A3lpZ6RIUXD6iqv55msHXGoPOfxs7c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwNBkE3xGhf2t+bn0SPCKTSv9GcZhzfVZ1U9iCdr6nMoFdDk7Z3
	uVI41H7wRqqRKOIqcsS43C3tsDOK550iFvcgIWeoKBVnt5PevYM0znmAow1AGLojQJc=
X-Gm-Gg: ASbGnct5iUum8QfJIQJb+JAOAq0/slx0FGZSBshYAwbhe8i8XQPZxLCTniHiNe0BSWt
	H7Os+0X6/1P0ecq2qQJlWW82NxO3rm8P7ffXZZRq1Oq4Q31VcXnvJTmiEWm9EL/Ox/H4uekDq75
	INHnFrKg94oaTyTlYWkwWwUry8dw1/jiBdiZmsRSwCcX5guJsZ96kNPlEzdIDaLO1zUdhBYyxaI
	ECC+ze38ThseKwryRtOjAOkI2Sd/wuqt85wxpHiPn9mtTrtdB5PPbvkANZ6UX+lzc9S1yxD1Tht
	+e5lsMlk4WFRjETZcVhNiFQXoUyYbOpyXnZnCL09RHnpi0bDJhjwEOSuDKq3XTwcHcaacXT2Tnq
	Rcw5t1cWphAhRzeMP6etbztP7+VXFL5e6nBOw5006ugDVkQRUXqHFeVN4EkdLSX53UR9pf0Ej4O
	Vcck4MVGXXmbx4zBRC4x6tlqE66iScCn2w6c5RL+vUKiS2NiP6g1hEZfs=
X-Google-Smtp-Source: AGHT+IEbIOzIcWCGsxFeJqTqswoKzFZU8h5ca9ioFsTGk0plA7q521H22LxnzLsjlklRQdzf2ZNlhQ==
X-Received: by 2002:a05:6000:2385:b0:3e4:64b0:a787 with SMTP id ffacd0b85a97d-3e64392d4b3mr7866480f8f.33.1757412509825;
        Tue, 09 Sep 2025 03:08:29 -0700 (PDT)
Message-ID: <5b42a1bf-d46f-42e1-90ef-f20d698828f5@suse.com>
Date: Tue, 9 Sep 2025 12:08:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] mm: introduce local state for lazy_mmu sections
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, "David S. Miller"
 <davem@davemloft.net>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org
References: <20250908073931.4159362-1-kevin.brodsky@arm.com>
 <20250908073931.4159362-3-kevin.brodsky@arm.com>
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
In-Reply-To: <20250908073931.4159362-3-kevin.brodsky@arm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------dpEbV9t2uYfrqqebO0e2knsF"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------dpEbV9t2uYfrqqebO0e2knsF
Content-Type: multipart/mixed; boundary="------------5pXmA0RBOYXCBdtoZQDsU4Hn";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, "David S. Miller"
 <davem@davemloft.net>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org
Message-ID: <5b42a1bf-d46f-42e1-90ef-f20d698828f5@suse.com>
Subject: Re: [PATCH v2 2/7] mm: introduce local state for lazy_mmu sections
References: <20250908073931.4159362-1-kevin.brodsky@arm.com>
 <20250908073931.4159362-3-kevin.brodsky@arm.com>
In-Reply-To: <20250908073931.4159362-3-kevin.brodsky@arm.com>

--------------5pXmA0RBOYXCBdtoZQDsU4Hn
Content-Type: multipart/mixed; boundary="------------l0nheg3mWWAbvEJzY7GAPskH"

--------------l0nheg3mWWAbvEJzY7GAPskH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDguMDkuMjUgMDk6MzksIEtldmluIEJyb2Rza3kgd3JvdGU6DQo+IGFyY2hfe2VudGVy
LGxlYXZlfV9sYXp5X21tdV9tb2RlKCkgY3VycmVudGx5IGhhdmUgYSBzdGF0ZWxlc3MgQVBJ
DQo+ICh0YWtpbmcgYW5kIHJldHVybmluZyBubyB2YWx1ZSkuIFRoaXMgaXMgcHJvdmluZyBw
cm9ibGVtYXRpYyBpbg0KPiBzaXR1YXRpb25zIHdoZXJlIGxlYXZlKCkgbmVlZHMgdG8gcmVz
dG9yZSBzb21lIGNvbnRleHQgYmFjayB0byBpdHMNCj4gb3JpZ2luYWwgc3RhdGUgKGJlZm9y
ZSBlbnRlcigpIHdhcyBjYWxsZWQpLiBJbiBwYXJ0aWN1bGFyLCB0aGlzDQo+IG1ha2VzIGl0
IGRpZmZpY3VsdCB0byBzdXBwb3J0IHRoZSBuZXN0aW5nIG9mIGxhenlfbW11IHNlY3Rpb25z
IC0NCj4gbGVhdmUoKSBkb2VzIG5vdCBrbm93IHdoZXRoZXIgdGhlIG1hdGNoaW5nIGVudGVy
KCkgY2FsbCBvY2N1cnJlZA0KPiB3aGlsZSBsYXp5X21tdSB3YXMgYWxyZWFkeSBlbmFibGVk
LCBhbmQgd2hldGhlciB0byBkaXNhYmxlIGl0IG9yDQo+IG5vdC4NCj4gDQo+IFRoaXMgcGF0
Y2ggZ2l2ZXMgYWxsIGFyY2hpdGVjdHVyZXMgdGhlIGNoYW5jZSB0byBzdG9yZSBsb2NhbCBz
dGF0ZQ0KPiB3aGlsZSBpbnNpZGUgYSBsYXp5X21tdSBzZWN0aW9uIGJ5IG1ha2luZyBlbnRl
cigpIHJldHVybiBzb21lIHZhbHVlLA0KPiBzdG9yaW5nIGl0IGluIGEgbG9jYWwgdmFyaWFi
bGUsIGFuZCBoYXZpbmcgbGVhdmUoKSB0YWtlIHRoYXQgdmFsdWUuDQo+IFRoYXQgdmFsdWUg
aXMgdHlwZWQgbGF6eV9tbXVfc3RhdGVfdCAtIGVhY2ggYXJjaGl0ZWN0dXJlIGRlZmluaW5n
DQo+IF9fSEFWRV9BUkNIX0VOVEVSX0xBWllfTU1VX01PREUgaXMgZnJlZSB0byBkZWZpbmUg
aXQgYXMgaXQgc2VlcyBmaXQuDQo+IEZvciBub3cgd2UgZGVmaW5lIGl0IGFzIGludCBldmVy
eXdoZXJlLCB3aGljaCBpcyBzdWZmaWNpZW50IHRvDQo+IHN1cHBvcnQgbmVzdGluZy4NCj4g
DQo+IFRoZSBkaWZmIGlzIHVuZm9ydHVuYXRlbHkgcmF0aGVyIGxhcmdlIGFzIGFsbCB0aGUg
QVBJIGNoYW5nZXMgbmVlZA0KPiB0byBiZSBkb25lIGF0b21pY2FsbHkuIE1haW4gcGFydHM6
DQo+IA0KPiAqIENoYW5naW5nIHRoZSBwcm90b3R5cGVzIG9mIGFyY2hfe2VudGVyLGxlYXZl
fV9sYXp5X21tdV9tb2RlKCkNCj4gICAgaW4gZ2VuZXJpYyBhbmQgYXJjaCBjb2RlLCBhbmQg
aW50cm9kdWNpbmcgbGF6eV9tbXVfc3RhdGVfdC4NCj4gDQo+ICogSW50cm9kdWNpbmcgTEFa
WV9NTVVfe0RFRkFVTFQsTkVTVEVEfSBmb3IgZnV0dXJlIHN1cHBvcnQgb2YNCj4gICAgbmVz
dGluZy4gZW50ZXIoKSBhbHdheXMgcmV0dXJucyBMQVpZX01NVV9ERUZBVUxUIGZvciBub3cu
DQo+ICAgIChsaW51eC9tbV90eXBlcy5oIGlzIG5vdCB0aGUgbW9zdCBuYXR1cmFsIGxvY2F0
aW9uIGZvciBkZWZpbmluZw0KPiAgICB0aG9zZSBjb25zdGFudHMsIGJ1dCB0aGVyZSBpcyBu
byBvdGhlciBvYnZpb3VzIGhlYWRlciB0aGF0IGlzDQo+ICAgIGFjY2Vzc2libGUgd2hlcmUg
YXJjaCdzIGltcGxlbWVudCB0aGUgaGVscGVycy4pDQo+IA0KPiAqIENoYW5naW5nIGFsbCBs
YXp5X21tdSBzZWN0aW9ucyB0byBpbnRyb2R1Y2UgYSBsYXp5X21tdV9zdGF0ZQ0KPiAgICBs
b2NhbCB2YXJpYWJsZSwgaGF2aW5nIGVudGVyKCkgc2V0IGl0IGFuZCBsZWF2ZSgpIHRha2Ug
aXQuIE1vc3Qgb2YNCj4gICAgdGhlc2UgY2hhbmdlcyB3ZXJlIGdlbmVyYXRlZCB1c2luZyB0
aGUgZm9sbG93aW5nIENvY2NpbmVsbGUgc2NyaXB0Og0KPiANCj4gQEANCj4gQEANCj4gew0K
PiArIGxhenlfbW11X3N0YXRlX3QgbGF6eV9tbXVfc3RhdGU7DQo+IC4uLg0KPiAtIGFyY2hf
ZW50ZXJfbGF6eV9tbXVfbW9kZSgpOw0KPiArIGxhenlfbW11X3N0YXRlID0gYXJjaF9lbnRl
cl9sYXp5X21tdV9tb2RlKCk7DQo+IC4uLg0KPiAtIGFyY2hfbGVhdmVfbGF6eV9tbXVfbW9k
ZSgpOw0KPiArIGFyY2hfbGVhdmVfbGF6eV9tbXVfbW9kZShsYXp5X21tdV9zdGF0ZSk7DQo+
IC4uLg0KPiB9DQo+IA0KPiAqIEluIGEgZmV3IGNhc2VzIChlLmcuIHhlbl9mbHVzaF9sYXp5
X21tdSgpKSwgYSBmdW5jdGlvbiBrbm93cyB0aGF0DQo+ICAgIGxhenlfbW11IGlzIGFscmVh
ZHkgZW5hYmxlZCwgYW5kIGl0IHRlbXBvcmFyaWx5IGRpc2FibGVzIGl0IGJ5DQo+ICAgIGNh
bGxpbmcgbGVhdmUoKSBhbmQgdGhlbiBlbnRlcigpIGFnYWluLiBIZXJlIHdlIHdhbnQgdG8g
ZW5zdXJlDQo+ICAgIHRoYXQgYW55IG9wZXJhdGlvbiBiZXR3ZWVuIHRoZSBsZWF2ZSgpIGFu
ZCBlbnRlcigpIGNhbGxzIGlzDQo+ICAgIGNvbXBsZXRlZCBpbW1lZGlhdGVseTsgZm9yIHRo
YXQgcmVhc29uIHdlIHBhc3MgTEFaWV9NTVVfREVGQVVMVCB0bw0KPiAgICBsZWF2ZSgpIHRv
IGZ1bGx5IGRpc2FibGUgbGF6eV9tbXUuIGVudGVyKCkgd2lsbCB0aGVuIHJlLWVuYWJsZSBp
dA0KPiAgICAtIHRoaXMgYWNoaWV2ZXMgdGhlIGV4cGVjdGVkIGJlaGF2aW91ciwgd2hldGhl
ciBuZXN0aW5nIG9jY3VycmVkDQo+ICAgIGJlZm9yZSB0aGF0IGZ1bmN0aW9uIHdhcyBjYWxs
ZWQgb3Igbm90Lg0KPiANCj4gTm90ZTogaXQgaXMgZGlmZmljdWx0IHRvIHByb3ZpZGUgYSBk
ZWZhdWx0IGRlZmluaXRpb24gb2YNCj4gbGF6eV9tbXVfc3RhdGVfdCBmb3IgYXJjaGl0ZWN0
dXJlcyBpbXBsZW1lbnRpbmcgbGF6eV9tbXUsIGJlY2F1c2UNCj4gdGhhdCBkZWZpbml0aW9u
IHdvdWxkIG5lZWQgdG8gYmUgYXZhaWxhYmxlIGluDQo+IGFyY2gveDg2L2luY2x1ZGUvYXNt
L3BhcmF2aXJ0X3R5cGVzLmggYW5kIGFkZGluZyBhIG5ldyBnZW5lcmljDQo+ICAgI2luY2x1
ZGUgdGhlcmUgaXMgdmVyeSB0cmlja3kgZHVlIHRvIHRoZSBleGlzdGluZyBoZWFkZXIgc291
cC4NCj4gDQo+IEFja2VkLWJ5OiBNaWtlIFJhcG9wb3J0IChNaWNyb3NvZnQpIDxycHB0QGtl
cm5lbC5vcmc+DQo+IFNpZ25lZC1vZmYtYnk6IEtldmluIEJyb2Rza3kgPGtldmluLmJyb2Rz
a3lAYXJtLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNl
LmNvbT4gIyBhcmNoL3g4Ng0KDQoNCkp1ZXJnZW4NCg==
--------------l0nheg3mWWAbvEJzY7GAPskH
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------l0nheg3mWWAbvEJzY7GAPskH--

--------------5pXmA0RBOYXCBdtoZQDsU4Hn--

--------------dpEbV9t2uYfrqqebO0e2knsF
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmi//JsFAwAAAAAACgkQsN6d1ii/Ey/C
1wf/cnsOcbouTosXpOkMhBjr243f1nECaiPmx1oWx83zmSC4SlVt0VJFI2hpjqlZZn3kk+T+f/BY
riH1vti+7aji2EwTeUjuL+sruFDv5+lCOefk6+b46OZl2eNVp8VbrcgJzJ6kv6KhdqWIaK9xQg5E
y78GsOvALgfkC9dMGlo3V0JpBT/NhIqVX0CkLTytEiz6z4/WyGI49id3c1cDHnLo4umVXEElO7Rb
LFId0sWhskdjaRvSWuUHTzL9F8u0j0NAwfiI4CZUIhTmeuOnhk9p6MM3dso8MBODi0QhzlxCbFUn
PT0KWq6tyl6iW7RcH025OPh/I+hvKsP+LkQeTxcTXA==
=nAef
-----END PGP SIGNATURE-----

--------------dpEbV9t2uYfrqqebO0e2knsF--

