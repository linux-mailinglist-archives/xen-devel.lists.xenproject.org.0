Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id guFkHT8iRWp07goAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 16:20:47 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B44826EEA63
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 16:20:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=KCPjR5Xo;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1350023.1607592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wevn1-0003Ui-HG; Wed, 01 Jul 2026 14:19:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1350023.1607592; Wed, 01 Jul 2026 14:19:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wevn1-0003T8-EW; Wed, 01 Jul 2026 14:19:47 +0000
Received: by outflank-mailman (input) for mailman id 1350023;
 Wed, 01 Jul 2026 14:19:46 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wevn0-0003T2-NS
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 14:19:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wevn0-002zaz-3s
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 16:19:46 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a452200-2eae-0a2a0a5409dd-0a2a450bea26-4
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 16:19:45 +0200
Received: from [209.85.208.49] (helo=mail-ed1-f49.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a452201-ac48-0a2a450b0019-d155d031bdfc-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 16:19:45 +0200
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-6983f20a8bfso1375854a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 07:19:45 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c1288f0d68asm289584066b.31.2026.07.01.07.19.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2026 07:19:43 -0700 (PDT)
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
        d=suse.com; s=google; t=1782915585; x=1783520385; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=l8fT8el2oFfYGyvxnweVFg4qecD61F7QfiQTC10goyo=;
        b=KCPjR5XoMJBjmVyW/9SPdujFFlr22P4Ft3ql0iTzRDCdGMO+kB6gggKC/JjA4q5K06
         7D0tM4RGM3scHVcrwBIbH61DAh8TMyP4MUKgTnzVbZ3WvPuwGgYdzKyZePWSuX8NqG3v
         exWwzmN46DSCVI7dS42pYIXA3WMSppAAqqi6pcK2D1qPzpaguHpfuFPunLBA2L5kosvD
         NyFOjzZD8X3teQ2GmBqF5QmrqmEp7BkcfoinGNJLmr12qJJ88sPGdi1/zv39KAo6w/Ta
         0RfdDa5ortoCgTue5E+LP/YvaY9vzb6z6qbzNUr8shNl/HIsWvDPpLo0sJwpDaePFOZT
         g16g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782915585; x=1783520385;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l8fT8el2oFfYGyvxnweVFg4qecD61F7QfiQTC10goyo=;
        b=dKSS0I2HgziCnHONFIVf5/KZSmvvDHiJYo3wPOqA5NsPvXolK/okaZf3Y5E+N28xoo
         2TxEYMAizNaY5WAtU7drsMVaZXNaU8WO5k2vBJRKvoqyu2QU9RDB8StICUqNFzWQHXn0
         gZEsztsx5MRTf2olF/WraDJn6PSpIFTvbZ0w4cl1E7Go/aG3S7ZInEKsAmwmDpVDd6UX
         t/FTznh24WGUqC29ezosHd3cAXbPA17usDT6f2etV8eix0GtivAb+sd9EPWo+9CD6WEr
         1hjnqnlELWtffipqjJbjyrXLRU9caVwAe6aE+avtZg1wOkSyrO7W/MrIQyQAoCpYgYQI
         uIXg==
X-Forwarded-Encrypted: i=1; AHgh+RpoWbW5Bnh6UeCSbKhydp3k2n7SywPr1H+kpOiMXwKQEuFVG+oqCFkDASGx6ITkWvcwV8yCSl1wTcs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzf1ADdFNC8iVJwprouodvHGsUCGQdOk9808vujmVhoQnwvG32x
	qHj6x0IbjzB5JkEkfFyWVNpvVo4UeKy3CYyv7jMd9xALfoIoU1gjiLZavU4oK3oQx3c=
X-Gm-Gg: AfdE7cm0jQqgthdvBPb/omQX6t20LwRzfThza4JZjiG6Llium71BWCCan1+3cLvreas
	rPelAPlbK2ATdNJ7hs5WOpLgWTQcF3jThlWc7TlneKEAcd6o+JnBH3lQ1Z8ZfL1csi9Ozm2X2fw
	W5cj297izPRaJZmz65cde8zcE2YN3hHCwjpOJCq2ZsjYR3JnY61dIPt6f3+K2qr4NfDOg8Ntdo9
	JrpbfT0MS07UZGcAShMDcsfjHbv1U6Cfu+zd0XaejfbsPjpRjFi4hkMuhIS6oXVF/73nqfCzU38
	eIhJJHt066ZSsPpL/EMio5dby+/7+CPSTPjJ0/j+zfd6Uruayz0RYNEhywPprnkqhG82Dz+bhdI
	MbIRfWmajN7WyfkoQif/jGWbKa9GeuL6sM5o/vIjNAy8zCfLlzWS9byPDEK8FpNJd2dZdUF0bDw
	E1QCEZDOU4EyzpDEqUdNQ26P3eBVaGJVaoGhoy4/+6072ztWq14cObIs06oxv4BqDFQUCt38Zqq
	USIc16rgU7fnxJQAeRjU9Gjdjn4mqA3v+4wWN6VpS4=
X-Received: by 2002:a17:907:a704:b0:bff:334:1fe1 with SMTP id a640c23a62f3a-c12a9dc50c4mr111586266b.12.1782915585326;
        Wed, 01 Jul 2026 07:19:45 -0700 (PDT)
Message-ID: <8bff241e-c4c3-4ffd-b358-9ab1bb0f8a9e@suse.com>
Date: Wed, 1 Jul 2026 16:19:43 +0200
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
 <f4623033-ec0f-4b91-8443-724701c79f37@suse.com>
 <ff6cf07f-bc82-41d2-8a14-80cdcea54af1@suse.com>
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
In-Reply-To: <ff6cf07f-bc82-41d2-8a14-80cdcea54af1@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0p0xN5eaHpuatzKkU9YY4nTZ"
X-purgate-ID: tlsNG-42698a/1782915585-3A73A220-A8AE3B41/0/0
X-purgate-type: clean
X-purgate-size: 11316
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.08 / 15.00];
	SIGNED_PGP(-2.00)[];
	R_MIXED_CHARSET(1.00)[subject];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	MAILLIST(-0.18)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:anthony.perard@vates.tech,m:dfaggioli@suse.com,m:gwd@xenproject.org,m:andrew.cooper3@citrix.com,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:dkim,suse.com:mid,suse.com:from_mime];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FORWARDED(0.00)[mailman];
	HAS_ATTACHMENT(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B44826EEA63

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0p0xN5eaHpuatzKkU9YY4nTZ
Content-Type: multipart/mixed; boundary="------------5dglv8sBPRTbNKuf8j0W90pC";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-ID: <8bff241e-c4c3-4ffd-b358-9ab1bb0f8a9e@suse.com>
Subject: Re: [PATCH 0/3] Change XEN_DOMCTL_setvcpuaffinity interface
References: <20260701111606.4063972-1-jgross@suse.com>
 <4e16c1eb-e1ff-4d7a-bfa8-223d357716ee@suse.com>
 <f4623033-ec0f-4b91-8443-724701c79f37@suse.com>
 <ff6cf07f-bc82-41d2-8a14-80cdcea54af1@suse.com>
In-Reply-To: <ff6cf07f-bc82-41d2-8a14-80cdcea54af1@suse.com>
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

--------------5dglv8sBPRTbNKuf8j0W90pC
Content-Type: multipart/mixed; boundary="------------TH1xNPsNt3QwZwU0jwwtMT98"

--------------TH1xNPsNt3QwZwU0jwwtMT98
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDEuMDcuMjYgMTU6NDgsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwMS4wNy4yMDI2
IDE1OjA4LCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0KPj4gT24gMDEuMDcuMjYgMTM6MzksIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDAxLjA3LjIwMjYgMTM6MTYsIEp1ZXJnZW4gR3Jv
c3Mgd3JvdGU6DQo+Pj4+IFRvZGF5IHRoZSBYRU5fRE9NQ1RMX3NldHZjcHVhZmZpbml0eSBo
eXBlcmNhbGwgd2lsbCBub3Qgb25seSBjaGFuZ2UgdGhlDQo+Pj4+IGFmZmluaXR5IHNldHRp
bmdzIG9mIGEgdmNwdSwgaXQgd2lsbCByZXR1cm4gdGhlIG5ldyBlZmZlY3RpdmUgc2V0dGlu
Z3MsDQo+Pj4+IHRvby4NCj4+Pj4NCj4+Pj4gSW4gY2FzZSBhbiBlcnJvciBoYXBwZW5zIGR1
cmluZyB0aGlzIGh5cGVyY2FsbCwgdGhlIGV4cGVjdGF0aW9uIG9mIHRoZQ0KPj4+PiBjYWxs
ZXIgaXMgdGhhdCB0aGUgYWZmaW5pdHkgb2YgdGhlIHZjcHUgZGlkbid0IGNoYW5nZS4gVGhp
cyBpc24ndCB0cnVlLA0KPj4+PiBob3dldmVyLCBpZiBwYXNzaW5nIHRoZSBuZXcgZWZmZWN0
aXZlIGFmZmluaXR5IGJhY2sgdG8gdGhlIHVzZXIgaXMNCj4+Pj4gZmFpbGluZy4NCj4+Pg0K
Pj4+IFRoYXQnbGwgYmUgdGhlIGNhbGxlcidzIGZhdWx0IHRob3VnaC4gQW55IC1FRkFVTFQg
Y29taW5nIGJhY2sgYXJlIGFuDQo+Pj4gaW5kaWNhdGlvbiB0aGF0IHRoZSBjYWxsZXIgbmVl
ZHMgZml4aW5nLg0KPj4+DQo+Pj4+IEluc3RlYWQgb2YgbWFraW5nIGVycm9yIGhhbmRsaW5n
IGluIHRoZSBoeXBlcnZpc29yIGV2ZW4gbW9yZSBjb21wbGV4LA0KPj4+PiBqdXN0IGNoYW5n
ZSB0aGUgaW50ZXJmYWNlIGJ5IE5PVCBwYXNzaW5nIGJhY2sgdGhlIG5ldyBhZmZpbml0eS4g
SXQgY2FuDQo+Pj4+IGVhc2lseSBiZSBvYnRhaW5lZCBieSBhbm90aGVyIFhFTl9ET01DVExf
Z2V0dmNwdWFmZmluaXR5IGNhbGwgaWYNCj4+Pj4gbmVlZGVkLg0KPj4+DQo+Pj4gQXQgdGhl
IGV4cGVuc2Ugb2YgZnVydGhlciBpbmNyZWFzaW5nIHRoZSBwcmVzc3VyZSBvbiB0aGUgZG9t
Y3RsIGxvY2suDQo+Pj4gV2hlbiBtYWtpbmcgdGhlIHJlY2VudCBlcnJvciBjb2RlIGNoYW5n
ZSBpbiB0aGlzIGFyZWEsIEkgd2FzIGFjdHVhbGx5DQo+Pj4gd29uZGVyaW5nIGluIGhvdyBm
YXIgdGhlc2UgdHdvIHN1Yi1vcHMgbWlnaHQgYWxzbyBiZSBjYW5kaWRhdGVzIGZvcg0KPj4+
IG1vdmluZyBvdXQgb2YgdGhlIGxvY2tlZCByZWdpb24uIFlldCB3aXRoIHZjcHVfYWZmaW5p
dHlfZG9tY3RsKCkgbm90DQo+Pj4gdXNpbmcgYW55IGxvY2tpbmcgdGhhdCBkaWRuJ3QgbG9v
ayBlbnRpcmVseSBzdHJhaWdodGZvcndhcmQgdG8gYW5zd2VyLg0KPj4NCj4+IFRoZSBjYWxs
aW5nIGhpZXJhcmNoeSBmb3IgdGhlIFhFTl9ET01DVExfc2V0dmNwdWFmZmluaXR5IGNhc2Ug
aXM6DQo+Pg0KPj4gdmNwdV9hZmZpbml0eV9kb21jdGwoKQ0KPj4gICAgIHZjcHVfc2V0X2hh
cmRfYWZmaW5pdHkoKQ0KPj4gICAgICAgdmNwdV9zZXRfYWZmaW5pdHkoKQ0KPj4gICAgIHZj
cHVfc2V0X2FmZmluaXR5KCkNCj4+DQo+PiB2Y3B1X3NldF9hZmZpbml0eSgpIGRvZXMgdGhl
IGNvcnJlY3QgbG9ja2luZyAodGFrZXMgdGhlIHVuaXQgbG9jaykuDQo+IA0KPiBCdXQgdGhh
dCdzIG5vdCBzdWZmaWNpZW50OiBUaGUgdHdvIGludm9sdmVkIHZjcHVfc2V0X2FmZmluaXR5
KCkgY2FsbHMNCj4gd2FudCB0byBzdGF5IHRvZ2V0aGVyLCBpLmUuIG5vdCByYWNlIHdpdGgg
YW5vdGhlciBkb21jdGwuDQoNCkhtbSwgd2hpbGUgSSB1bmRlcnN0YW5kIHdoeSB0aGlzIHdv
dWxkIGJlIG5pY2UsIEknbSBoYXZpbmcgYSBoYXJkIHRpbWUNCmltYWdpbmluZyBhIHNhbmUg
c2NlbmFyaW8gd2hlcmUgdHdvIG9yIG1vcmUgaW5zdGFuY2VzIGFyZSBpc3N1aW5nDQpoeXBl
cmNhbGxzIGZvciBjaGFuZ2luZyBhZmZpbml0aWVzLiBBdCBsZWFzdCBvbmUgb2YgdGhvc2Ug
aW5zdGFuY2VzIHdpbGwNCm5vdCBiZSBoYXBweSBhZnRlcndhcmRzLCBpbiBjYXNlIHRoZSBs
b2NrIGlzIHNwbGl0IGJvdGggbWlnaHQgYnkgdW5oYXBweS4NCg0KSSBkb24ndCBzZWUgdGhp
cyBiZWluZyBhIHN1YnN0YW50aWFsIGRvd25zaWRlLCBhcyB0aGUgbWFpbiBwcm9ibGVtIHdv
dWxkDQpiZSBvbiB0aGUgdXNlciBzaWRlIGFsbG93aW5nIG11bHRpcGxlIGNvbmN1cnJlbnQg
YWZmaW5pdHkgY2hhbmdlcyBmb3INCnRoZSBzYW1lIHZjcHUocykuDQoNCk9UT0ggaXQgd291
bGQgYmUgcXVpdGUgZWFzeSB0byBtZXJnZSBib3RoIGFmZmluaXR5IHNldHRpbmdzIGludG8g
b25lDQpsb2NrZWQgcmVnaW9uLCBhcyB0aGUgdW5kZXJseWluZyBmdW5jdGlvbiBzY2hlZF9z
ZXRfYWZmaW5pdHkoKSBjYW4gYmUNCmNhbGxlZCB3aXRoIGJvdGggYWZmaW5pdHkgbWFza3Mg
b3Igd2l0aCBvbmx5IG9uZSBvZiB0aGVtLiBUaGlzIHdvdWxkDQpyZXF1aXJlIG9ubHkgYSBt
aW5vciByZW9yZyBvZiB0aGUgYWZmaW5pdHkgaGVscGVycy4NCg0KDQpKdWVyZ2VuDQo=
--------------TH1xNPsNt3QwZwU0jwwtMT98
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------TH1xNPsNt3QwZwU0jwwtMT98--

--------------5dglv8sBPRTbNKuf8j0W90pC--

--------------0p0xN5eaHpuatzKkU9YY4nTZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmpFIf8FAwAAAAAACgkQsN6d1ii/Ey9Z
bgf/Wu8DTEd5olwQOtmqjH7ZwdPWG1MLjpuhS1lIBeMEoHMua+PYUDuS9rz61qJSTTdEJeJBujum
OZ7ZN29kKbruI6WeYBAGUxUcKlkafRHCFWr3SyITZzwc30nIoV8fQFdGYzpUvs6n7sgBTkA2qlqG
k4xqQ21z6OzZR+d5ENdJIdNgpACiR9oYRvBB2+m9sh6SWgfHjnhcDc5HziHmkX8Q8RVM9eqM8Hc1
OL3Sx8Yo62I8yvEmlsR+1G8rVr6rzLJeM6OxoMhOTUeXUjaC2NG6LoR+W1i9sXiMAY510Y8j/32U
WtBY9L2tvb0Pw8DyjOOpIhJbYXsyHQfYsWdlenzB0w==
=rEQ7
-----END PGP SIGNATURE-----

--------------0p0xN5eaHpuatzKkU9YY4nTZ--

