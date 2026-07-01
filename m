Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Q3OFLXYRRWqi6QoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 15:09:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1066EDDDB
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 15:09:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=QP3Qc26r;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1349938.1607548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weugT-0007iN-Kp; Wed, 01 Jul 2026 13:08:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1349938.1607548; Wed, 01 Jul 2026 13:08:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weugT-0007g3-HK; Wed, 01 Jul 2026 13:08:57 +0000
Received: by outflank-mailman (input) for mailman id 1349938;
 Wed, 01 Jul 2026 13:08:56 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1weugS-0007fu-47
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 13:08:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weugR-00AxJM-Dc
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 15:08:55 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a451159-e002-0a2a0a5209dd-0a2a4504998e-32
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 15:08:55 +0200
Received: from [209.85.218.53] (helo=mail-ej1-f53.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a451167-a01d-0a2a45040019-d155da35ec64-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 15:08:55 +0200
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-c12a1a3cdb9so58552466b.0
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 06:08:55 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c1288f4771csm270046666b.42.2026.07.01.06.08.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2026 06:08:54 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782911335; x=1783516135; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QvWdkHra12plO1MEg4iyy5k+8TYQ9q3UWHLtfiJmLXU=;
        b=QP3Qc26rKOwnkmDvzY6u8UlKLdmyoenavJ0mPeVH5BMS+RzjchKxMHL78UKc5jZRyK
         Y/MklDtt8XUZhCKm+qtqi2yhzJmMg64QFvNzPossp7P8NxyMGrgGMt+pK8VRXmoYSzom
         ia91SwuU+efzbyTQKDrEZgNnXCP8JQ7SPBRv/zh4EwF4GxPHkTGXZPeTSpdTz/GEcihK
         X3TWcCR5o4JgYLiscri6bCrT+hcFFiMamUqG406UKD6lUUoLKPBD2G3G+buxm0BQjWh/
         eIyLlQX/IkumLubOp1+IGfZg7w9ifr3uWY1vn3HjxGmmsMvu5DJ9cN1FLsZvBILrQGd0
         qWpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782911335; x=1783516135;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QvWdkHra12plO1MEg4iyy5k+8TYQ9q3UWHLtfiJmLXU=;
        b=W3DMlnlUih4vDIcjZD/65750r/Pj16qI25R0lAXiswItImE01d4rgersgoNPSCmMBl
         GOvrvbbpFdGEFnvErYMCsbLeZq7VernNTXq/QQL/KJdHFzFw8ESRusJ5a+i0K2Yz1Rkt
         qLW7e6M8rChwy4sX5gPNE4mLf5iMQ3qlHlgaDbrj5XyNPBBe2J21z8ieoxmNmlz2gKDI
         LgA7R7pcxtErM5ekrw2UpeiBeFDnZzLg4XwtjWW7d/qrlcUTE3HMOdo4aMiLNhcOKfjD
         svmV2DUP3yjcq2xF42TdITmWBffbIs2bzgPBpXuD+zMv+baCdmheB+SpWv1BkxqgzZf3
         LM+w==
X-Forwarded-Encrypted: i=1; AHgh+RrAREmTzzp6g7e+mJfG6rk2zwOFJJAXr0JAapFhBWcGRdqe+Dy5HwevJUV5Sl7yZ5rkAuK7ppFAQv0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyRGL7KzwhlZqDiEKMLjne8EwHUtdxoRx1VAF7UJqZ9fMPPIMaY
	Hj66BRcTCvnCUZyyImcXonFXAnIPqDO8UNn0WHwvtlJZTyFRZQmm1wmTZoCK2JaKA1+YyWWzhs9
	mjVW145X7tw==
X-Gm-Gg: AfdE7ck2u/eLCeEEunGDFe+9wy4mIjZjP7pCz5aecDM4yS3MqlHCCntsXHx80nWbyWw
	xttff63/qlkewJ2chh7SAcknqQXiW8IiVrnlbgwhd0rVNQI3N8NLNt1G+t8QFBR5q/NUZ57vmY/
	oLE1e/U9SqYQs+ZdGEsKPp+3Z5SPxoeOiNmjhdAaVa8kVX8hLYuofPFBn+p9I66Ly6k8J/2wZH9
	UtCYsSOjOmkJNrhPC2TjgjVw4OcQ/aVRO4ymbNz5xbOFaM14PuMY9pkN6zMr1ksQ+gtkaNDpUDG
	VuL81s6pn+ZLbvHeO7mzzNIk9CCUQemQJxfjH70UFdtciIyKgPqpTeWs1pHOUylWkadv8arcmEZ
	8J02l6W9DQ6t7pIqzTQVSL+NDm6AnwPGsCR1l5i4leF7HDc5LPy5PF9WVGTQEAsXcqiS0opJupj
	wfTH2MS+WBpdTM/v9pGa8GJKYSGaDkQJju53FN3zOaDIquuuxcutXSQ8ksa7KWSbyi4mVULOxkH
	lykpDuVvizo+9sc8DjzTnMJtOZ2nk9pvXUqQWR757Iuwgx82Kf4jQ==
X-Received: by 2002:a17:907:e117:b0:c12:70e8:6025 with SMTP id a640c23a62f3a-c12ae4089bdmr37842166b.21.1782911334685;
        Wed, 01 Jul 2026 06:08:54 -0700 (PDT)
Message-ID: <f4623033-ec0f-4b91-8443-724701c79f37@suse.com>
Date: Wed, 1 Jul 2026 15:08:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Change XEN_DOMCTL_setvcpuaffinity interface
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260701111606.4063972-1-jgross@suse.com>
 <4e16c1eb-e1ff-4d7a-bfa8-223d357716ee@suse.com>
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
In-Reply-To: <4e16c1eb-e1ff-4d7a-bfa8-223d357716ee@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------A67jv0t704UZ8WCDSEngQCm7"
X-purgate-ID: tlsNG-ebf023/1782911335-AF12E1CC-FA0E12CC/0/0
X-purgate-type: clean
X-purgate-size: 9976
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.08 / 15.00];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	R_MIXED_CHARSET(1.00)[subject];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:anthony.perard@vates.tech,m:dfaggioli@suse.com,m:gwd@xenproject.org,m:andrew.cooper3@citrix.com,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	HAS_ATTACHMENT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DB1066EDDDB

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------A67jv0t704UZ8WCDSEngQCm7
Content-Type: multipart/mixed; boundary="------------PiSQMyb4xi4gPyoUxUulCir1";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-ID: <f4623033-ec0f-4b91-8443-724701c79f37@suse.com>
Subject: Re: [PATCH 0/3] Change XEN_DOMCTL_setvcpuaffinity interface
References: <20260701111606.4063972-1-jgross@suse.com>
 <4e16c1eb-e1ff-4d7a-bfa8-223d357716ee@suse.com>
In-Reply-To: <4e16c1eb-e1ff-4d7a-bfa8-223d357716ee@suse.com>
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

--------------PiSQMyb4xi4gPyoUxUulCir1
Content-Type: multipart/mixed; boundary="------------Gnwb3UE1GbMejCumxeW4QdQq"

--------------Gnwb3UE1GbMejCumxeW4QdQq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDEuMDcuMjYgMTM6MzksIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwMS4wNy4yMDI2
IDEzOjE2LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gVG9kYXkgdGhlIFhFTl9ET01DVExf
c2V0dmNwdWFmZmluaXR5IGh5cGVyY2FsbCB3aWxsIG5vdCBvbmx5IGNoYW5nZSB0aGUNCj4+
IGFmZmluaXR5IHNldHRpbmdzIG9mIGEgdmNwdSwgaXQgd2lsbCByZXR1cm4gdGhlIG5ldyBl
ZmZlY3RpdmUgc2V0dGluZ3MsDQo+PiB0b28uDQo+Pg0KPj4gSW4gY2FzZSBhbiBlcnJvciBo
YXBwZW5zIGR1cmluZyB0aGlzIGh5cGVyY2FsbCwgdGhlIGV4cGVjdGF0aW9uIG9mIHRoZQ0K
Pj4gY2FsbGVyIGlzIHRoYXQgdGhlIGFmZmluaXR5IG9mIHRoZSB2Y3B1IGRpZG4ndCBjaGFu
Z2UuIFRoaXMgaXNuJ3QgdHJ1ZSwNCj4+IGhvd2V2ZXIsIGlmIHBhc3NpbmcgdGhlIG5ldyBl
ZmZlY3RpdmUgYWZmaW5pdHkgYmFjayB0byB0aGUgdXNlciBpcw0KPj4gZmFpbGluZy4NCj4g
DQo+IFRoYXQnbGwgYmUgdGhlIGNhbGxlcidzIGZhdWx0IHRob3VnaC4gQW55IC1FRkFVTFQg
Y29taW5nIGJhY2sgYXJlIGFuDQo+IGluZGljYXRpb24gdGhhdCB0aGUgY2FsbGVyIG5lZWRz
IGZpeGluZy4NCj4gDQo+PiBJbnN0ZWFkIG9mIG1ha2luZyBlcnJvciBoYW5kbGluZyBpbiB0
aGUgaHlwZXJ2aXNvciBldmVuIG1vcmUgY29tcGxleCwNCj4+IGp1c3QgY2hhbmdlIHRoZSBp
bnRlcmZhY2UgYnkgTk9UIHBhc3NpbmcgYmFjayB0aGUgbmV3IGFmZmluaXR5LiBJdCBjYW4N
Cj4+IGVhc2lseSBiZSBvYnRhaW5lZCBieSBhbm90aGVyIFhFTl9ET01DVExfZ2V0dmNwdWFm
ZmluaXR5IGNhbGwgaWYNCj4+IG5lZWRlZC4NCj4gDQo+IEF0IHRoZSBleHBlbnNlIG9mIGZ1
cnRoZXIgaW5jcmVhc2luZyB0aGUgcHJlc3N1cmUgb24gdGhlIGRvbWN0bCBsb2NrLg0KPiBX
aGVuIG1ha2luZyB0aGUgcmVjZW50IGVycm9yIGNvZGUgY2hhbmdlIGluIHRoaXMgYXJlYSwg
SSB3YXMgYWN0dWFsbHkNCj4gd29uZGVyaW5nIGluIGhvdyBmYXIgdGhlc2UgdHdvIHN1Yi1v
cHMgbWlnaHQgYWxzbyBiZSBjYW5kaWRhdGVzIGZvcg0KPiBtb3Zpbmcgb3V0IG9mIHRoZSBs
b2NrZWQgcmVnaW9uLiBZZXQgd2l0aCB2Y3B1X2FmZmluaXR5X2RvbWN0bCgpIG5vdA0KPiB1
c2luZyBhbnkgbG9ja2luZyB0aGF0IGRpZG4ndCBsb29rIGVudGlyZWx5IHN0cmFpZ2h0Zm9y
d2FyZCB0byBhbnN3ZXIuDQoNClRoZSBjYWxsaW5nIGhpZXJhcmNoeSBmb3IgdGhlIFhFTl9E
T01DVExfc2V0dmNwdWFmZmluaXR5IGNhc2UgaXM6DQoNCnZjcHVfYWZmaW5pdHlfZG9tY3Rs
KCkNCiAgIHZjcHVfc2V0X2hhcmRfYWZmaW5pdHkoKQ0KICAgICB2Y3B1X3NldF9hZmZpbml0
eSgpDQogICB2Y3B1X3NldF9hZmZpbml0eSgpDQoNCnZjcHVfc2V0X2FmZmluaXR5KCkgZG9l
cyB0aGUgY29ycmVjdCBsb2NraW5nICh0YWtlcyB0aGUgdW5pdCBsb2NrKS4NCg0KRm9yIG5v
dCBuZWVkaW5nIHRoZSBkb21jdGwgbG9jayB0aGUgWEVOX0RPTUNUTF9nZXR2Y3B1YWZmaW5p
dHkgcGF0aA0Kd291bGQgbmVlZCB0byB0YWtlIHRoZSB1bml0IGxvY2ssIHRvby4NCg0KDQpK
dWVyZ2VuDQo=
--------------Gnwb3UE1GbMejCumxeW4QdQq
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------Gnwb3UE1GbMejCumxeW4QdQq--

--------------PiSQMyb4xi4gPyoUxUulCir1--

--------------A67jv0t704UZ8WCDSEngQCm7
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmpFEWYFAwAAAAAACgkQsN6d1ii/Ey+R
hQgAiFcQL1/BexzltyBKpcNqde3m58V3k66enVf924PZisyIWKt5uR5o7SSudOG0CAlPd7ZxMwaJ
q9pwx3BN72wok+1m5jS6ZoiRm19FBb3gCYx6XtAB2mxRSH4I4nVNiBociGALbeCOGyIxaFD69ZQ/
jsKVEVUyH7U7fehoqkeIxYJKWzTPsE9+jaI0wmbgyHGo5Uw5A7FH/oxCBPpTuue3eAS5fwUcoT0t
6DHn/r1UiWDS6SXfiVzL7KnaRtrVvidZAF9qFV+bgAPWpPvaC7JvORfKTpds3ej2BcSUdPmfJs56
C4hkty5BejF0aMvjJgAcqeWILU3W9+eJj8jr4GlcYg==
=aag2
-----END PGP SIGNATURE-----

--------------A67jv0t704UZ8WCDSEngQCm7--

