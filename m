Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A9FB16EC8
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 11:38:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065241.1430634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhPjy-0007sY-Ga; Thu, 31 Jul 2025 09:38:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065241.1430634; Thu, 31 Jul 2025 09:38:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhPjy-0007qS-Df; Thu, 31 Jul 2025 09:38:22 +0000
Received: by outflank-mailman (input) for mailman id 1065241;
 Thu, 31 Jul 2025 09:38:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3v3Z=2M=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uhPjx-0007Lm-2L
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 09:38:21 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 177986be-6df2-11f0-b895-0df219b8e170;
 Thu, 31 Jul 2025 11:38:19 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-6154d14d6b7so723944a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 02:38:19 -0700 (PDT)
Received: from ?IPV6:2003:e5:872d:3c00:27e3:fc0:fb5:67a3?
 (p200300e5872d3c0027e30fc00fb567a3.dip0.t-ipconnect.de.
 [2003:e5:872d:3c00:27e3:fc0:fb5:67a3])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a9115562sm839125a12.59.2025.07.31.02.38.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 02:38:18 -0700 (PDT)
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
X-Inumbo-ID: 177986be-6df2-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753954699; x=1754559499; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=p8XtTWrNElgoYlJXpfGlJ/KXkkQJ9zNRCRnGoD8znFQ=;
        b=gLFaU1yInGBPFZM16yD1ANRG3cgpeLPiK4DyKXI20nTkjlvbJXrlQ1oHX1J36tSosY
         koIeu0KFPmaaiS6BqWLgJHASAS6plBlViV4665iQs8mvaX6LIjOtXlseNA29qP72EEqz
         lY+F0yg2gT3AzDRxq5+ynn0gWumfia1PlYgnTSvk9Z+WjNwl7aAiX2HZDFZ21ywxU6ac
         xw0j2C8d9CO9n968Jq13G9jSwMkP/yxb8hhHykj7GakchMvGdhlH4G8a4GRaiiVqo/6s
         qwjElFPc4Jmfp2nJhsaJfG53tY6rUCpfRmArqtch764eUDJ6wyzC1h75A36HW8yA2WdA
         ybJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753954699; x=1754559499;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p8XtTWrNElgoYlJXpfGlJ/KXkkQJ9zNRCRnGoD8znFQ=;
        b=ZLOdLUxR45r0z8eVE6Ljp6FdoQZu5rnc551BVn3rALHOmjDqUka+M85vPHvYE8Byrf
         mV/pysTdrwv42nJ7SnymLFnQCJUNmuTkD+qxpSfX7waJqU8zmiiMvlJY8Mn3RKND6LN6
         Ayrj4ApBYTTheCFboE0FfG0xnEKVAwCNrj8TyAy966n9RAR5PnZ+mK1+Z15MegcjKYCw
         315PBk64SdVuILZzQEcpF1obS9gY/u2fv9rCbc6NDbHNpT2KBrwf0oAXHMEdoNwlPteJ
         T68cEYbqxdW7ALVUrCV+NenNqpj/yH4sNBHj5e86k+klB9crNQvVQR4dD0e069+k4WC9
         HIRA==
X-Forwarded-Encrypted: i=1; AJvYcCUEm0ImMChxze2cK+Jy/9ke93+nguK80/pYqZmYY2jjc4a1Ku5kfFuy5fqU4MiPZQC6VQd8tY4WNcg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwH1f/WUuj0MV+K8JSPIoGO8U30vj0T1b+J4uSYzmhrbLXLHmQy
	7kIhwwohlZoSOa32BGO4rNtl1cc+I8HktSON7BBfnVe4oQ1G/HeIZadbY3UPS3pEjdI=
X-Gm-Gg: ASbGnctmZTp4eU+gnDK8ZRaM36HlYtMdfOXQ4ToAWWr8NB3hTPvi56fIxGx8L9p/txS
	Vs0SD/SoANmsVgbDve8PHmS16UQmWBXVH2PeRDuCqDp7BfzWxZDNtPkRUYgPeCRaI/bBapS8M3b
	p+B97OVAUCWfyUmBjN5de5DAX88rcPju4+crTxyoOcERpX15/F96nANBIqEfWkC91F8rHQW+29f
	6rd/04GckLPZBE1A2CeP7YOd3ESgVqwGXnhoRQ3JQ0qzxK34sJj5ETTjOYN3Ju0450KWOT/Q65C
	X97a0nnXDntvtwWITLr0xR4t1HCxAvo5uz9krz+gY7NivgnN4ol1CGIVg3HP/0EgWzZUgbsUZiA
	33dLt4uNg3775xJZ/GOD30m5VE2upfR2VvQScx/2MiCg8saFDDLRMyZmX2Xgn4o25bRZju0/zCM
	4RuvBGiXzTRIaezUMf+DI0yNDPWQhRrkhd5vmWlZHchg==
X-Google-Smtp-Source: AGHT+IGQhzJ3zLnVUpOuAnSGQKAgtvWt892zbmaNgjN/uhcXfrUbYhD7q0uARieQt2PULmeMsOWLZw==
X-Received: by 2002:a05:6402:30bc:b0:615:4dc5:43d2 with SMTP id 4fb4d7f45d1cf-61586f278d1mr4988061a12.8.1753954698595;
        Thu, 31 Jul 2025 02:38:18 -0700 (PDT)
Message-ID: <1d6f437e-740f-442a-b3f5-ed521051d522@suse.com>
Date: Thu, 31 Jul 2025 11:38:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v2 1/2] xen/evtchn: enable build optimization for
 evtchn_move_pirqs()/send_guest_pirq()
To: Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Roger Pau Monne <roger.pau@citrix.com>, Ayan Kumar Halder
 <ayankuma@amd.com>, Bertrand Marquis <bertrand.marquis@arm.com>
References: <20250718101149.3107110-1-grygorii_strashko@epam.com>
 <2d4fb9fc-7fa4-4dcc-b68f-d067793d5c30@epam.com>
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
In-Reply-To: <2d4fb9fc-7fa4-4dcc-b68f-d067793d5c30@epam.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------1oVMzCeyi0EJE73oS4wQNKWj"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------1oVMzCeyi0EJE73oS4wQNKWj
Content-Type: multipart/mixed; boundary="------------wCX2IpjdoXQ0N5TklDWljiNK";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Roger Pau Monne <roger.pau@citrix.com>, Ayan Kumar Halder
 <ayankuma@amd.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Message-ID: <1d6f437e-740f-442a-b3f5-ed521051d522@suse.com>
Subject: Re: [XEN][PATCH v2 1/2] xen/evtchn: enable build optimization for
 evtchn_move_pirqs()/send_guest_pirq()
References: <20250718101149.3107110-1-grygorii_strashko@epam.com>
 <2d4fb9fc-7fa4-4dcc-b68f-d067793d5c30@epam.com>
In-Reply-To: <2d4fb9fc-7fa4-4dcc-b68f-d067793d5c30@epam.com>
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

--------------wCX2IpjdoXQ0N5TklDWljiNK
Content-Type: multipart/mixed; boundary="------------sRLwkzFQlAK3IbboQNZ0C9Ty"

--------------sRLwkzFQlAK3IbboQNZ0C9Ty
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMzEuMDcuMjUgMTE6MjUsIEdyeWdvcmlpIFN0cmFzaGtvIHdyb3RlOg0KPiBIaSBKdWVy
Z2VuLCBEYXJpbywgR2VvcmdlLA0KPiANCj4gU29ycnkgdGhhdCBkaXN0dXJiaW5nIHlvdS4N
Cj4gV291bGQgaXQgYmUgcG9zc2libGUgdG8gdGFrZSBhIGxvb2sgYXQgdGhpcyBwYXRjaCBh
cyBpdA0KPiBoYXMgY2hhbmdlIGluIGNvbW1vbi9zY2hlZC9jb3JlLmM/DQo+IA0KPiBPbiAx
OC4wNy4yNSAxMzoxMSwgR3J5Z29yaWkgU3RyYXNoa28gd3JvdGU6DQo+PiBGcm9tOiBHcnln
b3JpaSBTdHJhc2hrbyA8Z3J5Z29yaWlfc3RyYXNoa29AZXBhbS5jb20+DQo+Pg0KPj4gT24g
cGxhdGZvcm1zIHdpdGhvdXQgUElSUSBzdXBwb3J0IGV2dGNobl9tb3ZlX3BpcnFzKCkvc2Vu
ZF9ndWVzdF9waXJxKCkNCj4+IGZ1bmN0aW9ucyBhcmUgdW5yZWFjaGFibGUgKE1pc3JhIHJ1
bGUgMi4xKS4NCj4+DQo+PiBNb3ZlIHRoZXNlIGZ1bmN0aW9uIHVuZGVyIENPTkZJR19IQVNf
UElSUSBpZmRlZnMgdG8gZml4IE1pc3JhIHJ1bGUgMi4xDQo+PiB2aW9sYXRpb24gYW5kIHJl
c29sdmUgY2FsbCBvZiBldnRjaG5fbW92ZV9waXJxcygpIGZyb20gY29tbW9uIC9zY2hlZC9j
b3JlLmMNCj4+IHZjcHVfbW92ZV9pcnFzKCkgY29kZSBieSBtb3ZpbmcgZXZ0Y2huX21vdmVf
cGlycXMoKSBpbnRvIHg4Ng0KPj4gYXJjaF9tb3ZlX2lycXMoKSBjYWxsYmFjayAod2hpY2gg
aXMgY29udmVydGVkIHRvIGRlZmluZSkuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogR3J5Z29y
aWkgU3RyYXNoa28gPGdyeWdvcmlpX3N0cmFzaGtvQGVwYW0uY29tPg0KDQpBY2tlZC1ieTog
SnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPiAjIHhlbi9zY2hlZA0KDQoNCkp1ZXJn
ZW4NCg==
--------------sRLwkzFQlAK3IbboQNZ0C9Ty
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------sRLwkzFQlAK3IbboQNZ0C9Ty--

--------------wCX2IpjdoXQ0N5TklDWljiNK--

--------------1oVMzCeyi0EJE73oS4wQNKWj
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmiLOYkFAwAAAAAACgkQsN6d1ii/Ey+S
YAf/QByE7uAyryqawO37P/WaZ8AB4T7L1QvLFVIyakOIPvdCeZMKwR5QAe9hio6j2W1/FENX6SxE
dN2y+sYyeUOkp+NruBVLhDzKR7HLM2ays7aTWn9u80vsU0bIm6X/Yfkr3btisv8gFl8tMFaBjNJY
QNXCT+acRkVllTyg14J9fxdP0/evmI8g+pfW2aq6V7WZKo/d2dNq1GiiT4/2JCL+Cf7i4yPtmplL
lN2Mj7MVH8ZcvFh+S25c+nV/elhvRX+DsYd7EGVWOMPag+nSNUCxpsiwKJtGd1y1w+gS0f1QYP80
KptkOvToTmm1t8pEMNCOpfGHfc3//WnzQ3exY4ALVg==
=Hpiv
-----END PGP SIGNATURE-----

--------------1oVMzCeyi0EJE73oS4wQNKWj--

