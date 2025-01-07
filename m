Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13377A04569
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2025 17:08:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866618.1277937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVC7Q-0001HX-5G; Tue, 07 Jan 2025 16:07:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866618.1277937; Tue, 07 Jan 2025 16:07:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVC7Q-0001En-2Z; Tue, 07 Jan 2025 16:07:48 +0000
Received: by outflank-mailman (input) for mailman id 866618;
 Tue, 07 Jan 2025 16:07:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qdqe=T7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tVC7O-0001Eh-7Y
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2025 16:07:46 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8740dbe5-cd11-11ef-a0df-8be0dac302b0;
 Tue, 07 Jan 2025 17:07:45 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-aa696d3901bso2116110666b.1
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2025 08:07:44 -0800 (PST)
Received: from ?IPV6:2003:e5:8731:2800:842d:42a0:5992:3595?
 (p200300e587312800842d42a059923595.dip0.t-ipconnect.de.
 [2003:e5:8731:2800:842d:42a0:5992:3595])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0eae4338sm2370432666b.86.2025.01.07.08.07.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2025 08:07:42 -0800 (PST)
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
X-Inumbo-ID: 8740dbe5-cd11-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736266063; x=1736870863; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=faoAWuGZisMdWRHtzZIvW/ueHzLPZWYcN2m9rB3uDbY=;
        b=TkRQYC5Y94sL4J2hyt6NHGR3WoBt7suH87HnKuH5ucpa5+ryZltl4vLpysPdskbSn8
         Kus/GnTG1F/zzNy61Jotc39mBZNTFp/5PGsEu79P3arIWr3zfPKBc6zU0yaF3XsCLYNz
         3HFyipz43kQBKRAY0kfCD0z0IKTTZv/yi0NEw4DbU+JHArRiskRMXAnRiNtaLPY12spD
         lvisKFht7Qrbfzs4Ge9OOo7I/UCsB4DkY7XMt3SgktBiEDMxJmP2BXGrMUe2ThWjrzCC
         yO7ds3nH+bf5F8Ny3G2Aro/PB35+N9EadqUK0M+8J68bRcyMqnzSgdQrIL6mWAxlxB16
         3Buw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736266063; x=1736870863;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=faoAWuGZisMdWRHtzZIvW/ueHzLPZWYcN2m9rB3uDbY=;
        b=J9XRbqOmAMHG5YlW18+e42QPdQFz7Ou7fcpjMAEVUlq3BlnXoNLCyM6XPCZgSNRYf5
         NMHIvIeF5n+Fh4ffm5iHKmB+vuSnLLcU0pHv2Lsxrc18LlU5EbnMRlMmR6ufGTxR0JYH
         vwwkGWNE7zPIUY8Dk1zTsBrecd6AzrKx7G8VaEcEALavCrOsI+kZ8McMK9TlIuN5u+5P
         RoruCQwJ46p8FZ1Rrfm740TbTvkdjGKVbe3c08LZcphttg4Cf+XaOOIiS1KG5i0caLf/
         PlKGt91obm//oH+rYMx16lSAozyIsNZudKScQy/yFZ+Hv+bWZF275oTaFPfDr35H6TGZ
         AVCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzxDSpEiiSD64zaEBN0aZoQuC9H8soz/WI43Mm+uQfE85oQRL9MJ9k8pJIVO4drbzwxgzcxDN8FqE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yydf/y0M/1AIuE0xHGycloQBEc3Fl6eDWHVtOLh5d2JaX3r7e/s
	JnuSX8yv91JovIbJShwRSROodNxm6aosHAJmMHKDR+N7Zj4i0NDzprEID8tP3oU=
X-Gm-Gg: ASbGnctYPMpAliOPysI+abl6TaB5dV0XMi1R1UAgMaNQwkvGE9cIQ0moy3o05LY7Wwj
	MIfTfcDWvqu77Esc1/CWK0ORF5IqY1BjvyIdqEAQClAm6xjppS9oAlDwApRZTOYM5BaRqNihPqB
	2WDbPO7sr2JOMh1wtPbAscvZNfJ9iO690aHF3xxVhrfQaqfAL3DxuBCCcyY5yW+fuHn6u3U1jZm
	QfL8lll126wkZm+dQGH6bSPmmP3HNUCHkjLlAn/56D5XMAaUTgGBr29Er8ZPkgyFcLicBw2N2S/
	9obZYoYhEHp7p7gZeLLIwoeD+X8NIaqK0JxFKhUW+UY/BihVngvLql6vB0S+oUpXfyXqNOnWoA+
	/zMdtfQ==
X-Google-Smtp-Source: AGHT+IHaI+XL1aa6Z36PHVwPaX8gEUK4eYYmQ59xnpHKmUhXDGTsr1aQROmxYVjri4VcQcUrYfgUgg==
X-Received: by 2002:a17:907:2d1f:b0:aa6:966d:3f93 with SMTP id a640c23a62f3a-aac2b0a5b51mr5115401066b.23.1736266063241;
        Tue, 07 Jan 2025 08:07:43 -0800 (PST)
Message-ID: <5261716e-a2f4-4423-bb8d-17e36bf34538@suse.com>
Date: Tue, 7 Jan 2025 17:07:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/7] xen/events: don't allow binding a global virq from
 any domain
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250107101711.5980-1-jgross@suse.com>
 <20250107101711.5980-3-jgross@suse.com>
 <577427ff-61e2-4fc9-8853-a7eec3f69bb6@suse.com>
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
In-Reply-To: <577427ff-61e2-4fc9-8853-a7eec3f69bb6@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------nFyGG4zqLmpyQ60y39at8RT9"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------nFyGG4zqLmpyQ60y39at8RT9
Content-Type: multipart/mixed; boundary="------------uNQq90XzzdXj68dOCyYUnEEB";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-ID: <5261716e-a2f4-4423-bb8d-17e36bf34538@suse.com>
Subject: Re: [PATCH v6 2/7] xen/events: don't allow binding a global virq from
 any domain
References: <20250107101711.5980-1-jgross@suse.com>
 <20250107101711.5980-3-jgross@suse.com>
 <577427ff-61e2-4fc9-8853-a7eec3f69bb6@suse.com>
In-Reply-To: <577427ff-61e2-4fc9-8853-a7eec3f69bb6@suse.com>
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

--------------uNQq90XzzdXj68dOCyYUnEEB
Content-Type: multipart/mixed; boundary="------------65jcAYjlhy4M0090fYmFXt9I"

--------------65jcAYjlhy4M0090fYmFXt9I
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDcuMDEuMjUgMTY6MzQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNy4wMS4yMDI1
IDExOjE3LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gLS0tIGEveGVuL2NvbW1vbi9ldmVu
dF9jaGFubmVsLmMNCj4+ICsrKyBiL3hlbi9jb21tb24vZXZlbnRfY2hhbm5lbC5jDQo+PiBA
QCAtMTIwLDYgKzEyMCwxMyBAQCBzdGF0aWMgdWludDhfdCBnZXRfeGVuX2NvbnN1bWVyKHhl
bl9ldmVudF9jaGFubmVsX25vdGlmaWNhdGlvbl90IGZuKQ0KPj4gICAvKiBHZXQgdGhlIG5v
dGlmaWNhdGlvbiBmdW5jdGlvbiBmb3IgYSBnaXZlbiBYZW4tYm91bmQgZXZlbnQgY2hhbm5l
bC4gKi8NCj4+ICAgI2RlZmluZSB4ZW5fbm90aWZpY2F0aW9uX2ZuKGUpICh4ZW5fY29uc3Vt
ZXJzWyhlKS0+eGVuX2NvbnN1bWVyLTFdKQ0KPj4gICANCj4+ICtzdGF0aWMgc3RydWN0IGRv
bWFpbiAqZ2xvYmFsX3ZpcnFfaGFuZGxlcnNbTlJfVklSUVNdIF9fcmVhZF9tb3N0bHk7DQo+
IA0KPiBOaXQ6IFdoaWxlIHlvdSBtb3ZlIHRoaXMgbGluZSBhcm91bmQsIGl0IHdvdWxkIGJl
IG5pY2UgaWYgdGhlIGF0dHJpYnV0ZQ0KPiBjb3VsZCB0aGVuIGFsc28gbW92ZSB0byBpdHMg
Y2Fub25pY2FsIHBsYWNlIChiZXR3ZWVuIHR5cGUgYW5kIGlkZW50aWZpZXIpLg0KPiANCj4+
ICtzdGF0aWMgc3RydWN0IGRvbWFpbiAqZ2V0X2dsb2JhbF92aXJxX2hhbmRsZXIodW5zaWdu
ZWQgaW50IHZpcnEpDQo+PiArew0KPj4gKyAgICByZXR1cm4gZ2xvYmFsX3ZpcnFfaGFuZGxl
cnNbdmlycV0gPzogaGFyZHdhcmVfZG9tYWluOw0KPj4gK30NCj4+ICsNCj4+ICAgc3RhdGlj
IGJvb2wgdmlycV9pc19nbG9iYWwodW5zaWduZWQgaW50IHZpcnEpDQo+PiAgIHsNCj4+ICAg
ICAgIHN3aXRjaCAoIHZpcnEgKQ0KPj4gQEAgLTQ3OSw4ICs0ODYsMTMgQEAgaW50IGV2dGNo
bl9iaW5kX3ZpcnEoZXZ0Y2huX2JpbmRfdmlycV90ICpiaW5kLCBldnRjaG5fcG9ydF90IHBv
cnQpDQo+PiAgICAgICAqLw0KPj4gICAgICAgdmlycSA9IGFycmF5X2luZGV4X25vc3BlYyh2
aXJxLCBBUlJBWV9TSVpFKHYtPnZpcnFfdG9fZXZ0Y2huKSk7DQo+PiAgIA0KPj4gLSAgICBp
ZiAoIHZpcnFfaXNfZ2xvYmFsKHZpcnEpICYmICh2Y3B1ICE9IDApICkNCj4+IC0gICAgICAg
IHJldHVybiAtRUlOVkFMOw0KPj4gKyAgICBpZiAoIHZpcnFfaXNfZ2xvYmFsKHZpcnEpICkN
Cj4+ICsgICAgew0KPj4gKyAgICAgICAgaWYgKCBnZXRfZ2xvYmFsX3ZpcnFfaGFuZGxlcih2
aXJxKSAhPSBkICkNCj4+ICsgICAgICAgICAgICByZXR1cm4gLUVCVVNZOw0KPiANCj4gSG1t
LiBXaGlsZSB0aGlzIGVsaW1pbmF0ZXMgdGhlIHByb2JsZW0gZm9yIHRoZSBjb21tb24sIHJh
Y2UgZnJlZSBjYXNlLA0KPiB0aGUgaGFuZGxlciBjaGFuZ2luZyByaWdodCBhZnRlciB0aGUg
Y2hlY2sgd291bGQgc3RpbGwgbWVhbiB0aGUgYmluZA0KPiB3b3VsZCBzdWNjZWVkLg0KDQpB
cmUgeW91IGZpbmUgd2l0aCBtZSBhZGRpbmcgYSBwYXJhZ3JhcGggdG8gdGhlIGNvbW1pdCBt
ZXNzYWdlIHNheWluZw0KdGhhdCBhIGZ1dHVyZSBwYXRjaCB3aWxsIGhhbmRsZSB0aGlzIGNh
c2U/DQoNClRoaXMgZnV0dXJlIHBhdGNoIGlzIHBhdGNoIDQgb2YgdGhlIHNlcmllcywgd2hp
Y2ggd2lsbCBuZWVkIHRvIGJlDQptb2RpZmllZCB0byBjaGVjayB0aGUgaGFuZGxpbmcgZG9t
YWluIGluc2lkZSB0aGUgZXZlbnRfbG9jay4NCg0KPiBQbHVzIHRoaXMgd2F5IHlvdSdyZSBi
cmVha2luZyBhIGNhc2UgdGhhdCBhZmFpY3QgaGFzIGJlZW4gd29ya2luZyBzbw0KPiBmYXI6
IFRoZSBiaW5kIGhhcHBlbmluZyBiZWZvcmUgdGhlIHNldHRpbmcgb2YgdGhlIGhhbmRsZXIu
IFdpdGggYSBsb3QNCj4gb2YgdW5yZWxhdGVkIGlmLXMgYW5kIHdoZW4tcyB0aGlzIGNvdWxk
IGUuZy4gYmUgb2YgaW50ZXJlc3Qgd2hlbg0KPiBjb25zaWRlcmluZyBhIHJlLXN0YXJ0YWJs
ZSBYZW5zdG9yZSBkb21haW4uIFRoZSBvbmUgdG8gdGFrZSBvdmVyIGNvdWxkDQo+IHN0YXJ0
IGZpcnN0LCBvYnRhaW4gc3RhdGUgZnJvbSB0aGUgb3JpZ2luYWwgb25lIHdoaWxlIHRoYXQn
cyBzdGlsbA0KPiBhY3RpdmUsIGFuZCBiZSBub21pbmF0ZWQgdGhlIGhhbmRsZXIgb2YgdGhl
IGdsb2JhbCB2SVJRIG9ubHkgaW4gdGhlDQo+IGxhc3QgbW9tZW50Lg0KDQpUaGlzIGlzIGEg
cmFjeSBzaXR1YXRpb24sIHRvby4gSWYgdGhlIG9sZCBkb21haW4gcmVjZWl2ZXMgdGhlIHZp
cnEgYWZ0ZXINCnNlbmRpbmcgdGhlIHN0YXRlLCB0aGlzIHdvdWxkIG5lZWQgdG8gYmUgaGFu
ZGxlZCBieSB0cmFuc2ZlcnJpbmcgdGhlIHZpcnENCmluZm9ybWF0aW9uIHRvIHRoZSBuZXcg
ZG9tYWluLCB3aGljaCBjYW4gcmVzdWx0IGluIGEgbmV2ZXIgZW5kaW5nIHN0b3J5Lg0KDQpU
aGlzIGlzIHRoZSByZWFzb24gd2h5IHRoZSBkb21haW4gc3RhdGUgYml0bWFwIGlzIHJlc2V0
IHRvIGNvbnRhaW4gYWxsDQpleGlzdGluZyBkb21haW5zIHRvIGJlIGZsYWdnZWQgYXMgImNo
YW5nZWQiLCBhcyBvdGhlcndpc2UgYSBjaGFuZ2UgbWlnaHQNCmdldCBsb3N0Lg0KDQpJJ2Qg
cmF0aGVyIGJlIGFibGUgdG8gaGFuZGxlIHRvZGF5J3MgdXNlIGNhc2VzIGluIGEgc2FuZSB3
YXkgdGhhbiB0byB0cnkNCmhhbmRsaW5nIGFueSB3ZWlyZCBmdXR1cmUgdXNlIGNhc2VzIHdo
aWNoIHdlIGRvbid0IGtub3cgeWV0Lg0KDQpJIHRoaW5rIHRvZGF5J3MgYmVoYXZpb3IgaXMg
bW9yZSBvciBsZXNzIGluc2FuZSBhbmQgdGhlIG5ldyBiZWhhdmlvciBpcw0KbXVjaCBlYXNp
ZXIgdG8gdW5kZXJzdGFuZCBhbmQgbW9yZSBpbnR1aXRpdmUuDQoNCg0KSnVlcmdlbg0K
--------------65jcAYjlhy4M0090fYmFXt9I
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------65jcAYjlhy4M0090fYmFXt9I--

--------------uNQq90XzzdXj68dOCyYUnEEB--

--------------nFyGG4zqLmpyQ60y39at8RT9
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmd9UU4FAwAAAAAACgkQsN6d1ii/Ey/H
wwf/d5sr5jBP/VVGWtaEyUa0S+srxVVjBR/QLG5IGDrtxWV17aBxuWDDtr6G/99OCgyZCpjOMoxk
mhteNxF0ywhpr03FW6VQioExOAnquYornLyY1vb1S8BzT3sCysvD0e1JtjlZxEB3MDCoyr9z2gFD
cWbImbYnb8eE4e5O6RrhOmQP/jLUbRYevzvpwRltONy2hLuh2fDXUKiV2Je/eM0CJuDdJB6PKOhY
l8wjq227M/LXECtgVWtgBULiDx0KpbrVG9BtLjbMxSlpDr298RvH7vyrVzFXOs5amJ5x/EnyCOVZ
3/4dZ6NGBpHXSRz+g2cSRucxKV7Q75OJi7Y+wxOY2Q==
=fuky
-----END PGP SIGNATURE-----

--------------nFyGG4zqLmpyQ60y39at8RT9--

