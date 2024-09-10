Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E92497380F
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 14:53:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795531.1204927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so0Mg-0007GS-3h; Tue, 10 Sep 2024 12:53:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795531.1204927; Tue, 10 Sep 2024 12:53:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so0Mg-0007ES-0a; Tue, 10 Sep 2024 12:53:02 +0000
Received: by outflank-mailman (input) for mailman id 795531;
 Tue, 10 Sep 2024 12:53:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ulZE=QI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1so0Mf-0007EM-1J
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 12:53:01 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b492dd7-6f73-11ef-99a1-01e77a169b0f;
 Tue, 10 Sep 2024 14:52:59 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-42ca6ba750eso23335335e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2024 05:52:59 -0700 (PDT)
Received: from ?IPV6:2003:e5:8741:4a00:60e5:7bee:fc48:e85c?
 (p200300e587414a0060e57beefc48e85c.dip0.t-ipconnect.de.
 [2003:e5:8741:4a00:60e5:7bee:fc48:e85c])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3789564a1a0sm8813905f8f.23.2024.09.10.05.52.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 05:52:57 -0700 (PDT)
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
X-Inumbo-ID: 9b492dd7-6f73-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725972778; x=1726577578; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3CbbZnyTOUvFyitVLbwL3aFRAZ71niYdK+qa0hGRYOY=;
        b=gefkJjMkVrvtlafyXmWvZ/S0Lwq46dXyTPPbcQAnik1++tb/vsboDdvrPnp5hjsNn2
         JSp7BFtiCrcASp9KZmn1rTmKDgIg7tGOJCQV0TXxS27zenhD9T38MH1eLvjRy1JmVn/h
         6WvaIKex+bghR79CIgka7r+UY60tBR6IUAlBVlLVpy67w+TM8TdNlkmjUE7wy87kQYtf
         bKqsFYyrlARXx+z3XPZL4x9DC79KJDtb1eqWdrMIll8DNCOKzvCdpyvoKNvBDiMvLjSH
         Vb49YJpWWPAwVBR6quDGekQRQD9SyQCTMYgahO5YxJXrqxXnUqLI6yqWTInmpYSE8RK7
         zfuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725972778; x=1726577578;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3CbbZnyTOUvFyitVLbwL3aFRAZ71niYdK+qa0hGRYOY=;
        b=rryibAW2amaT1A1uEwCAGAnIXS86vv9BNx58VM+hwTYF/h4a0EG3cxkObzi2YfEd0T
         67CwAAt4/G4oczJu3ogPQk0ZmbTc7rXh6gj7T98igGXQsBjIFIC5bpvz1w+PL5zkDYWp
         BIX4pS8758MhnT1LKRNHcssNbDq/Fv/YSX0dvvuqvdU0i8WDotuvUQxKpmMW14BInDkL
         K+rsylCHbFeoUmC9SzdJCJQzL9/ntTX5gFLtHqeYo5sv1huv/Qs6TMhZntr6ARzijSHm
         3e8jMuhcyexcyUi9MXzhn6V7Nae9N4HAh8tO6ixpEElPojvd+GnzHMx6/pvXEFpd8foA
         teSA==
X-Forwarded-Encrypted: i=1; AJvYcCXXSSYG8UcHGIaws+eisWDsumpwKhrK8zQsTGnngYRjV2BGKvJbcii+4+Q7wHWjAGnz6539ipF89bM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxQvwMeo3jHfCy0/RVnMWt+nbZBEfEpzhx8bzPHJBNCRHFY6VYA
	9YgTodk/4xkh7ciE66hy5Qj7DGjVLzp4lzoI43buAWuZMj4vxAUXMMXYRHxu1M8=
X-Google-Smtp-Source: AGHT+IHLEfFeaeWFXWftsW5b4rVq/qS//c0Y0n3M2JOkNvHWBEZfU6S+rAYcy1lNuL50N/VIOiWbcA==
X-Received: by 2002:a05:600c:4e87:b0:426:6fb1:6b64 with SMTP id 5b1f17b1804b1-42cbddcefd1mr18327795e9.7.1725972777786;
        Tue, 10 Sep 2024 05:52:57 -0700 (PDT)
Message-ID: <8ca5189f-6e6b-45fb-938d-0f5e21e8bb72@suse.com>
Date: Tue, 10 Sep 2024 14:52:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] xen: allow mapping ACPI data using a different
 physical address
To: Jan Beulich <jbeulich@suse.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 x86@kernel.org, linux-acpi@vger.kernel.org
References: <20240910103932.7634-1-jgross@suse.com>
 <20240910103932.7634-7-jgross@suse.com>
 <6bed58f8-016f-4390-be4c-128eebff6545@suse.com>
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
In-Reply-To: <6bed58f8-016f-4390-be4c-128eebff6545@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------8d2z38ep9qL6yXBtp9SqA02e"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------8d2z38ep9qL6yXBtp9SqA02e
Content-Type: multipart/mixed; boundary="------------lqCbcLy4HypFqWSm98NDq4JI";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 x86@kernel.org, linux-acpi@vger.kernel.org
Message-ID: <8ca5189f-6e6b-45fb-938d-0f5e21e8bb72@suse.com>
Subject: Re: [PATCH v3 6/7] xen: allow mapping ACPI data using a different
 physical address
References: <20240910103932.7634-1-jgross@suse.com>
 <20240910103932.7634-7-jgross@suse.com>
 <6bed58f8-016f-4390-be4c-128eebff6545@suse.com>
In-Reply-To: <6bed58f8-016f-4390-be4c-128eebff6545@suse.com>
Autocrypt-Gossip: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJ3BBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AAIQkQoDSui/t3IH4WIQQ+pJkfkcoLMCa4X6CgNK6L+3cgfgn7AJ9DmMd0SMJE
 ePbc7/m22D2v04iu7ACffXTdZQhNl557tJuDXZSBxDmW/tLOwU0EWTecRBAIAIK5OMKMU5R2
 Lk2bbjgX7vyQuCFFyKf9rC/4itNwhYWFSlKzVj3WJBDsoi2KvPm7AI+XB6NIkNAkshL5C0kd
 pcNd5Xo0jRR5/WE/bT7LyrJ0OJWS/qUit5eNNvsO+SxGAk28KRa1ieVLeZi9D03NL0+HIAtZ
 tecfqwgl3Y72UpLUyt+r7LQhcI/XR5IUUaD4C/chB4Vq2QkDKO7Q8+2HJOrFIjiVli4lU+Sf
 OBp64m//Y1xys++Z4ODoKh7tkh5DxiO3QBHG7bHK0CSQsJ6XUvPVYubAuy1XfSDzSeSBl//C
 v78Fclb+gi9GWidSTG/4hsEzd1fY5XwCZG/XJJY9M/sAAwUH/09Ar9W2U1Qm+DwZeP2ii3Ou
 14Z9VlVVPhcEmR/AFykL9dw/OV2O/7cdi52+l00reUu6Nd4Dl8s4f5n8b1YFzmkVVIyhwjvU
 jxtPyUgDOt6DRa+RaDlXZZmxQyWcMv2anAgYWGVszeB8Myzsw8y7xhBEVV1S+1KloCzw4V8Z
 DSJrcsZlyMDoiTb7FyqxwQnM0f6qHxWbmOOnbzJmBqpNpFuDcz/4xNsymJylm6oXiucHQBAP
 Xb/cE1YNHpuaH4SRhIxwQilCYEznWowQphNAbJtEKOmcocY7EbSt8VjXTzmYENkIfkrHRyXQ
 dUm5AoL51XZljkCqNwrADGkTvkwsWSvCSQQYEQIACQUCWTecRAIbDAAKCRCgNK6L+3cgfuef
 AJ9wlZQNQUp0KwEf8Tl37RmcxCL4bQCcC5alCSMzUBJ5DBIcR4BY+CyQFAs=

--------------lqCbcLy4HypFqWSm98NDq4JI
Content-Type: multipart/mixed; boundary="------------mdFep8S97p1D7CRIqhjdabFh"

--------------mdFep8S97p1D7CRIqhjdabFh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAuMDkuMjQgMTQ6MzQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxMC4wOS4yMDI0
IDEyOjM5LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gV2hlbiBydW5uaW5nIGFzIGEgWGVu
IFBWIGRvbTAgdGhlIHN5c3RlbSBuZWVkcyB0byBtYXAgQUNQSSBkYXRhIG9mIHRoZQ0KPj4g
aG9zdCB1c2luZyBob3N0IHBoeXNpY2FsIGFkZHJlc3Nlcywgd2hpbGUgdGhvc2UgYWRkcmVz
c2VzIGNhbiBjb25mbGljdA0KPj4gd2l0aCB0aGUgZ3Vlc3QgcGh5c2ljYWwgYWRkcmVzc2Vz
IG9mIHRoZSBsb2FkZWQgbGludXgga2VybmVsLiBUaGUgc2FtZQ0KPj4gcHJvYmxlbSBtaWdo
dCBhcHBseSBpbiBjYXNlIGEgUFYgZ3Vlc3QgaXMgY29uZmlndXJlZCB0byB1c2UgdGhlIGhv
c3QNCj4+IG1lbW9yeSBtYXAuDQo+Pg0KPj4gVGhpcyBjb25mbGljdCBjYW4gYmUgc29sdmVk
IGJ5IG1hcHBpbmcgdGhlIEFDUEkgZGF0YSB0byBhIGRpZmZlcmVudA0KPj4gZ3Vlc3QgcGh5
c2ljYWwgYWRkcmVzcywgYnV0IG1hcHBpbmcgdGhlIGRhdGEgdmlhIGFjcGlfb3NfaW9yZW1h
cCgpDQo+PiBtdXN0IHN0aWxsIGJlIHBvc3NpYmxlIHVzaW5nIHRoZSBob3N0IHBoeXNpY2Fs
IGFkZHJlc3MsIGFzIHRoaXMNCj4+IGFkZHJlc3MgbWlnaHQgYmUgZ2VuZXJhdGVkIGJ5IEFN
TCB3aGVuIHJlZmVyZW5jaW5nIHNvbWUgb2YgdGhlIEFDUEkNCj4+IGRhdGEuDQo+Pg0KPj4g
V2hlbiBjb25maWd1cmVkIHRvIHN1cHBvcnQgcnVubmluZyBhcyBhIFhlbiBQViBkb21haW4s
IGhhdmUgYW4NCj4+IGltcGxlbWVudGF0aW9uIG9mIGFjcGlfb3NfaW9yZW1hcCgpIGJlaW5n
IGF3YXJlIG9mIHRoZSBwb3NzaWJpbGl0eSB0bw0KPj4gbmVlZCBhYm92ZSBtZW50aW9uZWQg
dHJhbnNsYXRpb24gb2YgYSBob3N0IHBoeXNpY2FsIGFkZHJlc3MgdG8gdGhlDQo+PiBndWVz
dCBwaHlzaWNhbCBhZGRyZXNzLg0KPj4NCj4+IFRoaXMgbW9kaWZpY2F0aW9uIHJlcXVpcmVz
IHRvIGZpeCBzb21lICNpbmNsdWRlIG9mIGFzbS9hY3BpLmggaW4geDg2DQo+PiBjb2RlIHRv
IHVzZSBsaW51eC9hY3BpLmggaW5zdGVhZC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+IA0KPiBSZXZpZXdlZC1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiB3aXRoIGEgcmVxdWVzdCB0byBjb21tZW50
IGEgdGlueSBiaXQgbW9yZToNCj4gDQo+PiBAQCAtODM2LDYgKzgzNywzMyBAQCB2b2lkIF9f
aW5pdCB4ZW5fZG9fcmVtYXBfbm9ucmFtKHZvaWQpDQo+PiAgIAlwcl9pbmZvKCJSZW1hcHBl
ZCAldSBub24tUkFNIHBhZ2UocylcbiIsIHJlbWFwcGVkKTsNCj4+ICAgfQ0KPj4gICANCj4+
ICsjaWZkZWYgQ09ORklHX0FDUEkNCj4+ICsvKg0KPj4gKyAqIFhlbiB2YXJpYW50IG9mIGFj
cGlfb3NfaW9yZW1hcCgpIHRha2luZyBwb3RlbnRpYWxseSByZW1hcHBlZCBub24tUkFNDQo+
PiArICogcmVnaW9ucyBpbnRvIGFjb3VudC4NCj4gDQo+IChOaXQ6IGFjY291bnQpDQoNCklu
ZGVlZC4NCg0KPiANCj4+ICsgKiBBbnkgYXR0ZW1wdCB0byBtYXAgYW4gYXJlYSBjcm9zc2lu
ZyBhIHJlbWFwIGJvdW5kYXJ5IHdpbGwgcHJvZHVjZSBhDQo+PiArICogV0FSTigpIHNwbGF0
Lg0KPj4gKyAqLw0KPj4gK3N0YXRpYyB2b2lkIF9faW9tZW0gKnhlbl9hY3BpX29zX2lvcmVt
YXAoYWNwaV9waHlzaWNhbF9hZGRyZXNzIHBoeXMsDQo+PiArCQkJCQkgYWNwaV9zaXplIHNp
emUpDQo+PiArew0KPj4gKwl1bnNpZ25lZCBpbnQgaTsNCj4+ICsJY29uc3Qgc3RydWN0IG5v
bnJhbV9yZW1hcCAqcmVtYXAgPSB4ZW5fbm9ucmFtX3JlbWFwOw0KPj4gKw0KPj4gKwlmb3Ig
KGkgPSAwOyBpIDwgbnJfbm9ucmFtX3JlbWFwOyBpKyspIHsNCj4+ICsJCWlmIChwaHlzICsg
c2l6ZSA+IHJlbWFwLT5tYWRkciAmJg0KPj4gKwkJICAgIHBoeXMgPCByZW1hcC0+bWFkZHIg
KyByZW1hcC0+c2l6ZSkgew0KPj4gKwkJCVdBUk5fT04ocGh5cyA8IHJlbWFwLT5tYWRkciB8
fA0KPj4gKwkJCQlwaHlzICsgc2l6ZSA+IHJlbWFwLT5tYWRkciArIHJlbWFwLT5zaXplKTsN
Cj4+ICsJCQlwaHlzID0gcmVtYXAtPnBhZGRyICsgcGh5cyAtIHJlbWFwLT5tYWRkcjsNCj4g
DQo+IFRoaXMgbWlnaHQgYmUgc2xpZ2h0bHkgZWFzaWVyIC8gbW9yZSBsb2dpY2FsIHRvIHJl
YWQgYXMNCj4gDQo+IAkJCXBoeXMgKz0gcmVtYXAtPnBhZGRyIC0gcmVtYXAtPm1hZGRyOw0K
PiANCj4gQWxzbyBiZWNhdXNlIG9mICJwaHlzIiBub3QgY29uc2lzdGVudGx5IGV4cHJlc3Np
bmcgYSBwaHlzaWNhbCBhZGRyZXNzDQo+ICh3aGVuIHlvdSBuZWVkIGNvbnZlcnQgaXQsIHRo
ZSBpbmNvbWluZyB2YWx1ZSBpcyBhIG1hY2hpbmUgYWRkcmVzcykgYQ0KPiBjb21tZW50IG1h
eSBoZWxwIGhlcmUuIEluIGZhY3QgYXQgdGhlIGZpcnN0IGdsYW5jZSAoYW5kIGRlc3BpdGUg
aGF2aW5nDQo+IHNlZW4gdGhlIGNvZGUgYmVmb3JlKSBJIHRob3VnaHQgdGhlIHRyYW5zbGF0
aW9uIHdhcyBkb25lIHRoZSB3cm9uZyB3YXkNCj4gcm91bmQsIHNpbXBseSBiZWNhdXNlIG9m
IHRoZSBuYW1lIG9mIHRoZSB2YXJpYWJsZS4NCg0KV2lsbCBhZGQgYSBjb21tZW50IGFuZCBj
aGFuZ2UgdGhlIGxpbmUgYXMgeW91IHN1Z2dlc3QuDQoNCg0KSnVlcmdlbg0K
--------------mdFep8S97p1D7CRIqhjdabFh
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------mdFep8S97p1D7CRIqhjdabFh--

--------------lqCbcLy4HypFqWSm98NDq4JI--

--------------8d2z38ep9qL6yXBtp9SqA02e
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmbgQSgFAwAAAAAACgkQsN6d1ii/Ey/2
QQgAj71p3wRPU/DJzfwDIYkHTyPNP/Jt4FdfwnF/McTC7llWTqMoujTzLPnepmn1WF5Kc8Fr2+Fc
RmMFCeZYsETJJi/0b3CpAbw0kPFg6jXwFONhCJ0h2Di4wWyIkzlfynxP0e2gbXa/7FpekOprSyIM
wS2dXM/hhO6DnTShCai6nEN02l4b+bvbMz1Ho0mx9s8el3Gzc0933dh5QZXidPVWNf6E+zRa1kPT
bBBzrz2moXFPX0AQAmf+sZVz1O8JhCJnCFng7YDaUQhc3GbkKnMedToBAAcurMwpQoDa3q23LmJZ
xzS6+Lfovs2WIOvZJ4q5WqEi4rxj5pOXphHIN3iZZg==
=zM0I
-----END PGP SIGNATURE-----

--------------8d2z38ep9qL6yXBtp9SqA02e--

