Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4AF972B51
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 09:59:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795056.1204159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snvmd-0004bP-1j; Tue, 10 Sep 2024 07:59:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795056.1204159; Tue, 10 Sep 2024 07:59:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snvmc-0004YH-UZ; Tue, 10 Sep 2024 07:59:30 +0000
Received: by outflank-mailman (input) for mailman id 795056;
 Tue, 10 Sep 2024 07:59:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ulZE=QI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1snvmb-0004YB-T3
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 07:59:30 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9aba47db-6f4a-11ef-a0b5-8be0dac302b0;
 Tue, 10 Sep 2024 09:59:28 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-374b5f27cf2so3033216f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2024 00:59:28 -0700 (PDT)
Received: from ?IPV6:2003:e5:8741:4a00:60e5:7bee:fc48:e85c?
 (p200300e587414a0060e57beefc48e85c.dip0.t-ipconnect.de.
 [2003:e5:8741:4a00:60e5:7bee:fc48:e85c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42cb2ca95a6sm83689285e9.21.2024.09.10.00.59.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 00:59:27 -0700 (PDT)
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
X-Inumbo-ID: 9aba47db-6f4a-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725955168; x=1726559968; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fB9Haerf1N/Jx1YpYb9JEiRoY4g9FwACtfrtRSSQX6U=;
        b=DERJ+cci0MDlvMHs8Oj/L8ZIgdvLwxdL8mj18q+7MwT4Xl9yjuyY2HomouUri47wF0
         bLotq99O9areXFeKSEoeTfokb6RQcxF+onhFzLbSlaaT2erIEMBJvxxRdB2KIyDGwO0B
         V27fHx4M7a3avZd/pUdgAh0iPr1Z1Y9pHtbgWoBGnd5qI53kpy2VRSvu4bicNO95MrYb
         6r6fYKeEI2L/BUGiOB6rUY1WzObSuHgH8QxIFPvMnkCRBfiHvdfdyydGEQX0LkVVVpDU
         2jkxTBqMeXZLLUAvk3+PpYNr/voOWfAHvZsKQfz7B+sL3m/SvcowDDiSO2iV3iBqXB30
         WJmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725955168; x=1726559968;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fB9Haerf1N/Jx1YpYb9JEiRoY4g9FwACtfrtRSSQX6U=;
        b=bm3lpDM2B1n7xzILy0KqqwPFOQoqKwR9ftqcKa6k2twVnppUPnCa1szMOfempvP4VS
         9t3D4J0XGe3D3H6r3BD1OrbMAYyLYMd3+p2Vs7rycuc8R0qxofHYe096ct2Xe6XEDYoO
         12a8jBwYQRqWZs8SFxGvleH3IzxyPUY0eqO8Op7ajqHT4blmqdmRdSFq5ljLd6DVekhn
         mSxDXDsPfzcsvd85A9VB1qgYMS/ITcloAGbx1/PvjcWVnuNNhR7UZCUigJikl/PU3alw
         ZWaIowQIUI1wDayij3+D/mg9D1gUd/JaSSKuzKtI1yl0E8AZyPVzCxN8QJUeN5Ibg5Kl
         nsnw==
X-Forwarded-Encrypted: i=1; AJvYcCWcEuyDPweNphpZKLh15lRJH2defo/ts40fwSNQfiEFyg0+zYBVI4Kijv5SCFtf5blL9+cfThuF3mE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwF5NOXc0unu0aiAjJovmbPqhVAl5KN0SEo8+2ut2099mUKiKFu
	enMxF7j8EK8swQgruk3bjfaWmzbgHWIgGKt0Dkv/EpwuWbEgAnS9VSMa1LP1nYo=
X-Google-Smtp-Source: AGHT+IHGiTzUm6jOw2T8/tbiuwW2ypmKGL9Ju7t1ZK6BG46nt1Wfrc6j6HMQBGy6Ktpj15hkBgYSAQ==
X-Received: by 2002:a5d:59a6:0:b0:374:c8a0:5d05 with SMTP id ffacd0b85a97d-37892703fffmr7403260f8f.50.1725955167448;
        Tue, 10 Sep 2024 00:59:27 -0700 (PDT)
Message-ID: <699e3cfe-6682-4234-abd8-c3c460ab7fd2@suse.com>
Date: Tue, 10 Sep 2024 09:59:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] xen: add capability to remap non-RAM pages to
 different PFNs
To: Jan Beulich <jbeulich@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, x86@kernel.org
References: <20240820082012.31316-1-jgross@suse.com>
 <20240820082012.31316-6-jgross@suse.com>
 <d32735a1-79a9-43c1-b4a6-15ddbc203646@suse.com>
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
In-Reply-To: <d32735a1-79a9-43c1-b4a6-15ddbc203646@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------DBjQPk8I7JYi5GoxK9aIZK1J"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------DBjQPk8I7JYi5GoxK9aIZK1J
Content-Type: multipart/mixed; boundary="------------43lR0VB8xcUBvLGymqMmz67b";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, x86@kernel.org
Message-ID: <699e3cfe-6682-4234-abd8-c3c460ab7fd2@suse.com>
Subject: Re: [PATCH v2 5/7] xen: add capability to remap non-RAM pages to
 different PFNs
References: <20240820082012.31316-1-jgross@suse.com>
 <20240820082012.31316-6-jgross@suse.com>
 <d32735a1-79a9-43c1-b4a6-15ddbc203646@suse.com>
In-Reply-To: <d32735a1-79a9-43c1-b4a6-15ddbc203646@suse.com>
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

--------------43lR0VB8xcUBvLGymqMmz67b
Content-Type: multipart/mixed; boundary="------------IxE8cUq9oC9qf4c05JK3d6Aq"

--------------IxE8cUq9oC9qf4c05JK3d6Aq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjAuMDguMjQgMTE6MzgsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyMC4wOC4yMDI0
IDEwOjIwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gV2hlbiBydW5uaW5nIGFzIGEgWGVu
IFBWIGRvbTAgaXQgY2FuIGhhcHBlbiB0aGF0IHRoZSBrZXJuZWwgaXMgYmVpbmcNCj4+IGxv
YWRlZCB0byBhIGd1ZXN0IHBoeXNpY2FsIGFkZHJlc3MgY29uZmxpY3Rpbmcgd2l0aCB0aGUg
aG9zdCBtZW1vcnkNCj4+IG1hcC4NCj4+DQo+PiBJbiBvcmRlciB0byBiZSBhYmxlIHRvIHJl
c29sdmUgdGhpcyBjb25mbGljdCwgYWRkIHRoZSBjYXBhYmlsaXR5IHRvDQo+PiByZW1hcCBu
b24tUkFNIGFyZWFzIHRvIGRpZmZlcmVudCBndWVzdCBQRk5zLiBBIGZ1bmN0aW9uIHRvIHVz
ZSB0aGlzDQo+PiByZW1hcHBpbmcgaW5mb3JtYXRpb24gZm9yIG90aGVyIHB1cnBvc2VzIHRo
YW4gZG9pbmcgdGhlIHJlbWFwIHdpbGwgYmUNCj4+IGFkZGVkIHdoZW4gbmVlZGVkLg0KPj4N
Cj4+IEFzIHRoZSBudW1iZXIgb2YgY29uZmxpY3RzIHNob3VsZCBiZSByYXRoZXIgbG93IChj
dXJyZW50bHkgb25seQ0KPj4gbWFjaGluZXMgd2l0aCBtYXguIDEgY29uZmxpY3QgYXJlIGtu
b3duKSwgc2F2ZSB0aGUgcmVtYXAgZGF0YSBpbiBhDQo+PiBzbWFsbCBzdGF0aWNhbGx5IGFs
bG9jYXRlZCBhcnJheS4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxq
Z3Jvc3NAc3VzZS5jb20+DQo+PiAtLS0NCj4+IFYyOg0KPj4gLSBzcGxpdCBvZmYgZnJvbSBw
YXRjaCA1IG9mIFYxIG9mIHRoZSBzZXJpZXMNCj4+IC0gbW92ZWQgdG8gcDJtLmMNCj4+IC0t
LQ0KPj4gICBhcmNoL3g4Ni94ZW4vcDJtLmMgICAgIHwgNjUgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrDQo+PiAgIGFyY2gveDg2L3hlbi94ZW4tb3BzLmgg
fCAgMyArKw0KPj4gICAyIGZpbGVzIGNoYW5nZWQsIDY4IGluc2VydGlvbnMoKykNCj4+DQo+
PiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYveGVuL3AybS5jIGIvYXJjaC94ODYveGVuL3AybS5j
DQo+PiBpbmRleCA3YzczNWI3MzBhY2QuLmJiNTVlMGZlMWEwNCAxMDA2NDQNCj4+IC0tLSBh
L2FyY2gveDg2L3hlbi9wMm0uYw0KPj4gKysrIGIvYXJjaC94ODYveGVuL3AybS5jDQo+PiBA
QCAtODAsNiArODAsNyBAQA0KPj4gICAjaW5jbHVkZSA8YXNtL3hlbi9oeXBlcnZpc29yLmg+
DQo+PiAgICNpbmNsdWRlIDx4ZW4vYmFsbG9vbi5oPg0KPj4gICAjaW5jbHVkZSA8eGVuL2dy
YW50X3RhYmxlLmg+DQo+PiArI2luY2x1ZGUgPHhlbi9odmMtY29uc29sZS5oPg0KPj4gICAN
Cj4+ICAgI2luY2x1ZGUgInhlbi1vcHMuaCINCj4+ICAgDQo+PiBAQCAtNzkyLDYgKzc5Myw3
MCBAQCBpbnQgY2xlYXJfZm9yZWlnbl9wMm1fbWFwcGluZyhzdHJ1Y3QgZ250dGFiX3VubWFw
X2dyYW50X3JlZiAqdW5tYXBfb3BzLA0KPj4gICAJcmV0dXJuIHJldDsNCj4+ICAgfQ0KPj4g
ICANCj4+ICsvKiBSZW1hcHBlZCBub24tUkFNIGFyZWFzICovDQo+PiArI2RlZmluZSBOUl9O
T05SQU1fUkVNQVAgNA0KPj4gK3N0YXRpYyBzdHJ1Y3Qgbm9ucmFtX3JlbWFwIHsNCj4+ICsJ
cGh5c19hZGRyX3QgbWFkZHI7DQo+PiArCXBoeXNfYWRkcl90IHBhZGRyOw0KPj4gKwl1bnNp
Z25lZCBsb25nIHNpemU7DQo+IA0KPiBzaXplX3Q/DQoNCkZpbmUgd2l0aCBtZS4NCg0KPiAN
Cj4+ICt9IHhlbl9ub25yYW1fcmVtYXBbTlJfTk9OUkFNX1JFTUFQXTsNCj4+ICtzdGF0aWMg
dW5zaWduZWQgaW50IG5yX25vbnJhbV9yZW1hcDsNCj4gDQo+IEJvdGggX19pbml0ZGF0YT8g
T3IsIGNvbnNpZGVyaW5nIHBhdGNoIDYsIGF0IGxlYXN0IF9fcm9fYWZ0ZXJfaW5pdD8NCg0K
X19yb19hZnRlcl9pbml0IHNob3VsZCBiZSBmaW5lLg0KDQo+IA0KPj4gKy8qDQo+PiArICog
RG8gdGhlIHJlYWwgcmVtYXBwaW5nIG9mIG5vbi1SQU0gcmVnaW9ucyBhcyBzcGVjaWZpZWQg
aW4gdGhlDQo+PiArICogeGVuX25vbnJhbV9yZW1hcFtdIGFycmF5Lg0KPj4gKyAqIEluIGNh
c2Ugb2YgYW4gZXJyb3IganVzdCBjcmFzaCB0aGUgc3lzdGVtLg0KPj4gKyAqLw0KPj4gK3Zv
aWQgX19pbml0IHhlbl9kb19yZW1hcF9ub25yYW0odm9pZCkNCj4+ICt7DQo+PiArCXVuc2ln
bmVkIGludCBpOw0KPj4gKwl1bnNpZ25lZCBpbnQgcmVtYXBwZWQgPSAwOw0KPj4gKwlzdHJ1
Y3Qgbm9ucmFtX3JlbWFwICpyZW1hcCA9IHhlbl9ub25yYW1fcmVtYXA7DQo+PiArCXVuc2ln
bmVkIGxvbmcgcGZuLCBtZm4sIGxlbjsNCj4+ICsNCj4+ICsJaWYgKCFucl9ub25yYW1fcmVt
YXApDQo+PiArCQlyZXR1cm47DQo+PiArDQo+PiArCWZvciAoaSA9IDA7IGkgPCBucl9ub25y
YW1fcmVtYXA7IGkrKykgew0KPj4gKwkJcGZuID0gUEZOX0RPV04ocmVtYXAtPnBhZGRyKTsN
Cj4+ICsJCW1mbiA9IFBGTl9ET1dOKHJlbWFwLT5tYWRkcik7DQo+PiArCQlmb3IgKGxlbiA9
IDA7IGxlbiA8IHJlbWFwLT5zaXplOyBsZW4gKz0gUEFHRV9TSVpFKSB7DQo+PiArCQkJaWYg
KCFzZXRfcGh5c190b19tYWNoaW5lKHBmbiwgbWZuKSkgew0KPj4gKwkJCQlwcl9lcnIoIkZh
aWxlZCB0byBzZXQgcDJtIG1hcHBpbmcgZm9yIHBmbj0lbGQgbWZuPSVsZFxuIiwNCj4gDQo+
IEknbSBub3QgY29udmluY2VkIHRoYXQgZnJhbWUgbnVtYmVycyBsb2dnZWQgaW4gZGVjaW1h
bCBhcmUgb3Zlcmx5IHVzZWZ1bC4NCg0KSSBhZ3JlZS4gV2lsbCBzd2l0Y2ggdG8gaGV4Lg0K
DQo+IA0KPj4gKwkJCQkgICAgICAgcGZuLCBtZm4pOw0KPj4gKwkJCQlCVUcoKTsNCj4+ICsJ
CQl9DQo+PiArDQo+PiArCQkJcGZuKys7DQo+PiArCQkJbWZuKys7DQo+PiArCQkJcmVtYXBw
ZWQrKzsNCj4+ICsJCX0NCj4+ICsNCj4+ICsJCXJlbWFwKys7DQo+PiArCX0NCj4+ICsNCj4+
ICsJcHJfaW5mbygiUmVtYXBwZWQgJXUgbm9uLVJBTSBwYWdlKHMpXG4iLCByZW1hcHBlZCk7
DQo+IA0KPiBUaGlzIG1lc3NhZ2UgbWF5IGJlIHVzZWZ1bCBpbiBhIGxvZyBhbHNvIHdoZW4g
bm90aGluZyB3YXMgcmVtYXBwZWQgLSBtYXliZQ0KPiBkcm9wIHRoZSBpbml0aWFsIGlmKCk/
DQoNCkZpbmUgd2l0aCBtZS4NCg0KPiANCj4+ICt9DQo+PiArDQo+PiArLyoNCj4+ICsgKiBB
ZGQgYSBuZXcgbm9uLVJBTSByZW1hcCBlbnRyeS4NCj4+ICsgKiBJbiBjYXNlIG9mIG5vIGZy
ZWUgZW50cnkgZm91bmQsIGp1c3QgY3Jhc2ggdGhlIHN5c3RlbS4NCj4+ICsgKi8NCj4+ICt2
b2lkIF9faW5pdCB4ZW5fYWRkX3JlbWFwX25vbnJhbShwaHlzX2FkZHJfdCBtYWRkciwgcGh5
c19hZGRyX3QgcGFkZHIsDQo+PiArCQkJCSB1bnNpZ25lZCBsb25nIHNpemUpDQo+PiArew0K
Pj4gKwlpZiAobnJfbm9ucmFtX3JlbWFwID09IE5SX05PTlJBTV9SRU1BUCkgew0KPj4gKwkJ
eGVuX3Jhd19jb25zb2xlX3dyaXRlKCJOdW1iZXIgb2YgcmVxdWlyZWQgRTgyMCBlbnRyeSBy
ZW1hcHBpbmcgYWN0aW9ucyBleGNlZWQgbWF4aW11bSB2YWx1ZVxuIik7DQo+PiArCQlCVUco
KTsNCj4+ICsJfQ0KPj4gKw0KPj4gKwl4ZW5fbm9ucmFtX3JlbWFwW25yX25vbnJhbV9yZW1h
cF0ubWFkZHIgPSBtYWRkcjsNCj4+ICsJeGVuX25vbnJhbV9yZW1hcFtucl9ub25yYW1fcmVt
YXBdLnBhZGRyID0gcGFkZHI7DQo+PiArCXhlbl9ub25yYW1fcmVtYXBbbnJfbm9ucmFtX3Jl
bWFwXS5zaXplID0gc2l6ZTsNCj4+ICsNCj4+ICsJbnJfbm9ucmFtX3JlbWFwKys7DQo+PiAr
fQ0KPiANCj4gWW91IGRvbid0IGVuZm9yY2UgYW55IGNvbnN0cmFpbnRzIG9uIHRoZSBhZGRy
ZXNzZXMgLyBzaXplIGhlcmUuIFdpdGgNCj4gdGhpcyB0aGUgbG9vcCBpbiB4ZW5fZG9fcmVt
YXBfbm9ucmFtKCkgbWF5IHRlcm1pbmF0ZSB0b28gZWFybHkgaWYgbm9uLQ0KPiBwYWdlLWFs
aWduZWQgdmFsdWVzIHdlcmUgcGFzc2VkIGludG8gaGVyZS4gQm90aCBhZGRyZXNzZXMgbm90
IGhhdmluZw0KPiB0aGUgc2FtZSBvZmZzZXQtaW50by1wYWdlIG1heSBhbHNvIGVuZCB1cCBh
bm9tYWxvdXMuIE1pZ2h0IGJlIHdvcnRoDQo+IHN3aXRjaGluZyB0byBmcmFtZSBudW1iZXJz
IC8gbnVtYmVyLW9mLXBhZ2VzIGZvciB0aGUgdHJhY2tpbmcgc3RydWN0Lg0KDQpIbW0sIEkn
ZCBsaWtlIHRvIGF0IGxlYXN0IFdBUk4oKSBpbiBjYXNlIHNvbWVvbmUgdHJpZXMgdG8gYWNj
ZXNzIGEgcmVtYXBwZWQNCmFyZWEgb3V0IG9mIGJvdW5kcywgd2hpY2ggcmVxdWlyZXMgdG8g
a2VlcCB0aGUgb3JpZ2luYWwgbm9uLXBhZ2UtYWxpZ25lZA0KdmFsdWVzLg0KDQpJJ2xsIGZp
eCB0aGUgeGVuX2RvX3JlbWFwX25vbnJhbSgpIGxvb3AuDQoNCg0KSnVlcmdlbg0K
--------------IxE8cUq9oC9qf4c05JK3d6Aq
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------IxE8cUq9oC9qf4c05JK3d6Aq--

--------------43lR0VB8xcUBvLGymqMmz67b--

--------------DBjQPk8I7JYi5GoxK9aIZK1J
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmbf/F4FAwAAAAAACgkQsN6d1ii/Ey+D
bwf/VgmqY3LZ5SMkMwel15c+nKHcRX+IUvXKlW05gvhgzblyBMMyFqC9jfJJ5zVyPnjlJMQzoFZD
i892bjdajJgj9NQN5JXg49U26H174q+NMBxkjnfj8yOARPRuUErrc8AelNm0H5KAgCs16fILCNTm
W0qQd++JbnnJY+cu+wdvTSRb+2gbGrYB/tPrV+OqZBbkdTJJcJXGSnMwYiICBcShVzGGuN0PJs73
StiC34472w9yWS0NxfgixGFGHQ0kUOzAsDK/hM1Si/VEucMAWzUjFHm2pRtZzqA+OEc7hUaaQTOW
d6z96G7WyYdWZvcNNQuvLcnJ/5pX+BfD9YEJbmHTbg==
=31aY
-----END PGP SIGNATURE-----

--------------DBjQPk8I7JYi5GoxK9aIZK1J--

