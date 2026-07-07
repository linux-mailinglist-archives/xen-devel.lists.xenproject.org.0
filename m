Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iu6tNJu8TGrKowEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 10:45:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EF871949E
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 10:45:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=MBf4asI3;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1356105.1610763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh1QO-00064o-W3; Tue, 07 Jul 2026 08:45:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1356105.1610763; Tue, 07 Jul 2026 08:45:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh1QO-000633-Sl; Tue, 07 Jul 2026 08:45:04 +0000
Received: by outflank-mailman (input) for mailman id 1356105;
 Tue, 07 Jul 2026 08:45:04 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wh1QN-00062x-VN
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 08:45:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wh1QN-00CWtg-Bx
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 10:45:03 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a4cbc80-5cb7-0a2a0a5109dd-0a2a450990f2-38
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 10:45:03 +0200
Received: from [209.85.218.46] (helo=mail-ej1-f46.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a4cbc8f-97e6-0a2a45090019-d155da2eb5ff-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 10:45:03 +0200
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-c125fbfbae0so390421866b.1
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 01:45:03 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c15ad9bca17sm85491066b.32.2026.07.07.01.45.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jul 2026 01:45:00 -0700 (PDT)
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
        d=suse.com; s=google; t=1783413903; x=1784018703; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=t0hAigDkVXb5l9InBeV60wbIEQrEf+q8hzy9UREv3zg=;
        b=MBf4asI3NXWtIUZHyzN5wmsXbUEDc8xtIHb/G/54aFO4GB+RvjXxiuy7ZpF8EGk3t+
         qI4k1XAmifqEp7i8lKphnTqOhCd5dacCrS5JzIXHMcP2XmS2VMB6ZzzGRNyyWguqL3EY
         8KFrcgI9+t/zjaYif5yuzqx84wBpgerUrRthJZu4QGaazIvefjVkkCIlSQdoUlymUYAG
         a3QRETx6456+c8YcSwR1ir5yCKJehbOzwoQ8ul9jCBZwfa49XHJYVLpxIkRDIUymcK9i
         2LVXljrtI+Wtyg1nuyaMyo8fNjg3B0h6oVl/TMloMqP76PAhHyjcTniqYeBBE02YETVb
         /GTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783413903; x=1784018703;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t0hAigDkVXb5l9InBeV60wbIEQrEf+q8hzy9UREv3zg=;
        b=eB30nA+BvnFMl1fceOmdasi2fSlvqd/OnszGWdw8igqzm93n19SA2rG/1CbXjEIc6n
         U2cvAYicuywP5R11j+Avo5NoCazCgh6QfLFksT64iVZsiEq7YvArsvGMSDMYKHgZ8IlS
         u6SbIjz4lNZqKKTSuEzgB0XeaYgSSxVm6s/BUqOXi4FRcAQ6hAyrLog+cr9Gc5Pb8Z8g
         3B5xFF1xEX0aBxP7fh/8Co7rmcDW7nhbsLs5r+u0j8aV/0r8Z9nEZ/TEyZljXtK9QBJb
         SYU/7mBe6NXoehldtd35FcqEmCKTYSP0ia1QozZihAHHyOziQ8AgS3UIud8zIYbOD0r3
         9Gpg==
X-Forwarded-Encrypted: i=1; AHgh+RoHkL9AAOYCGQt/94S+GTm1AUHy+ukgDVW/7iG4pJg8hoRDJvQptlAKEdgX5yREnrHaqpJeUW46ISY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyQ4bvVulPRSCecJ5txz8hOAWAzeJfUYWkRBQVNNqn9f0mokJoP
	BSq7Z21lNQE2EDEB2r3sOy9cZO2qs6/eQ/amuRca/2VcNOJH8qyTBn61faQ+4pGyT+o=
X-Gm-Gg: AfdE7cmBhWJff3oyb4ys1BujVs3OSc3SMdL10cIZcAezimsjM72wOQD3RWvnbSz7ak3
	XbbuysCYw+N0y8YcztKcJwyZP0Kn3JseZlbYQM2HVXs2MZHQ1EF5/AK1j05qT9nDAZm7EVXQbU5
	oz7KehsPRoSXRLqXbVDcCjZEfxR2r9pBRDOPanBKRIU1vlhNUpBNbxGUWR0Uj0MP9w5P+xVJJRE
	1JV+ba6h+f1sETu45jtpsWVVqFdnxGnoGkDIETV7d0HUHI5mlVn5HNNf2sgfZti/rC5XJGWZPBz
	c5acLWJeVMA3bZZzKgcStjqqd6LYeYY7ZN+uMaHwV1TASgIJSkceEeTiMpXaKhzaj4hI2KmlHE4
	nHqg5hfENTAjbAaY3eBBxC5e0FzO2O1nnvg1rhxyoslx4V0MyM4JXHvNtqQ2bnOmDO8/5Ob2axL
	OeWcXGDonnj+NzzznC4aNFZK41aXAAe8iiyoUA4zP2yuQ4u1GtIZnScxRTgXqF1gdXQWFhlPgAa
	jigGA2UCRHhYhcjg3jsZupUp54yQ4zNhf/n1/5mWbU=
X-Received: by 2002:a17:907:787:b0:c12:4988:f0ba with SMTP id a640c23a62f3a-c15a66b3211mr240306666b.11.1783413901843;
        Tue, 07 Jul 2026 01:45:01 -0700 (PDT)
Message-ID: <5edc7c12-8563-4369-bb9a-2f614b74eb31@suse.com>
Date: Tue, 7 Jul 2026 10:44:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] stubdom: remove grub-pv
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 xen-devel@lists.xenproject.org
References: <20260707083459.226297-1-jgross@suse.com>
 <eac4528a-f9b3-476e-adea-63d317ef30fe@suse.com>
Content-Language: en-US
From: Juergen Gross <jgross@suse.com>
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
In-Reply-To: <eac4528a-f9b3-476e-adea-63d317ef30fe@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------IzMc1pt0J82AFW0VP25iQzrN"
X-purgate-ID: tlsNG-bad1c0/1783413903-46D3C986-B6088749/0/0
X-purgate-type: clean
X-purgate-size: 9181
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.08 / 15.00];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:from_mime,suse.com:dkim,suse.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:samuel.thibault@ens-lyon.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	HAS_ATTACHMENT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 10EF871949E

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------IzMc1pt0J82AFW0VP25iQzrN
Content-Type: multipart/mixed; boundary="------------9Slt4KTno3F2bc0iEzLAbXfd";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 xen-devel@lists.xenproject.org
Message-ID: <5edc7c12-8563-4369-bb9a-2f614b74eb31@suse.com>
Subject: Re: [PATCH 0/5] stubdom: remove grub-pv
References: <20260707083459.226297-1-jgross@suse.com>
 <eac4528a-f9b3-476e-adea-63d317ef30fe@suse.com>
In-Reply-To: <eac4528a-f9b3-476e-adea-63d317ef30fe@suse.com>
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

--------------9Slt4KTno3F2bc0iEzLAbXfd
Content-Type: multipart/mixed; boundary="------------idWWw93KOFu2EgbkGd14cHXT"

--------------idWWw93KOFu2EgbkGd14cHXT
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDcuMDcuMjYgMTA6MzksIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNy4wNy4yMDI2
IDEwOjM0LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gVGhlIGdydWItcHYgc3R1YmRvbXMg
KDMyLSBhbmQgNjQtYml0KSBhcmUgZGlzYWJsZWQgYnkgZGVmYXVsdCBzaW5jZQ0KPj4gc2V2
ZXJhbCB5ZWFycyBub3cuDQo+Pg0KPj4gUmVtb3ZlIHRoZW0gaW4gb3JkZXIgdG8gZW5hYmxl
IHJlbW92aW5nIHF1aXRlIHNvbWUgbW9yZSBjb2RlIGZyb20gWGVuLg0KPj4gSW4gY2FzZSBz
b21lb25lIGlzIHJlYWxseSBkZXBlbmRpbmcgb24gZ3J1Yi1wdiwgdGhleSBjYW4gZWFzaWx5
IHRha2UgaXQNCj4+IGZyb20gYW4gb2xkZXIgWGVuIGJ1aWxkLCBhcyB0aGVyZSBpcyBubyBY
ZW4gdmVyc2lvbiBkZXBlbmRlbmN5IGluDQo+PiBncnViLXB2IChhIHZlcnNpb24gYnVpbHQg
MyB5ZWFycyBhZ28gaGFzIGJlZW4gdGVzdGVkIHRvIHN0aWxsIHdvcmsNCj4+IHdpdGggY3Vy
cmVudCA0LjIzIHN0YWdpbmcgWGVuKS4NCj4gDQo+IFdoYXQgZ3VhcmFudGVlcyB0aGlzIHRv
IHJlbWFpbiB0aGlzIHdheSwgd2hlbiAuLi4NCj4gDQo+PiBKdWVyZ2VuIEdyb3NzICg1KToN
Cj4+ICAgIHN0dWJkb206IHJlbW92ZSBzdXBwb3J0IGZvciBncnViLXB2DQo+PiAgICBzdHVi
ZG9tOiByZW1vdmUgc3VwcG9ydCBmb3IgYnVpbGRpbmcgaW4gMzItYml0IG1vZGUNCj4+ICAg
IHN0dWJkb206IHJlbW92ZSBidWlsZGluZyBvZiBsaWJ4ZW5ndWVzdCBhbmQgbGlieGVuY3Ry
bA0KPiANCj4gLi4uIHRoZXJlIHdhcyB0aGlzIGRlcGVuZGVuY3kgb24gKHVuc3RhYmxlKSBs
aWJyYXJpZXM/DQoNCk9ubHkgc3RhYmxlIGh5cGVyY2FsbHMgYXJlIGJlaW5nIHVzZWQuIE90
aGVyd2lzZSB0aGUgZG9tY3RsIHZlcnNpb24NCmNoZWNrIHdvdWxkIGZhaWwsIHJpZ2h0Pw0K
DQpJIGRpZCBhIHJldmlldyBvZiB0aGUgc3R1YmRvbSBzcGVjaWZpYyBncnViIGNvZGUgYW5k
IGRpZG4ndCBzcG90IGFueQ0KdXNlIG9mIGFuIHVuc3RhYmxlIGh5cGVyY2FsbCwgQlRXLg0K
DQoNCkp1ZXJnZW4NCg==
--------------idWWw93KOFu2EgbkGd14cHXT
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------idWWw93KOFu2EgbkGd14cHXT--

--------------9Slt4KTno3F2bc0iEzLAbXfd--

--------------IzMc1pt0J82AFW0VP25iQzrN
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmpMvIsFAwAAAAAACgkQsN6d1ii/Ey8D
IQf/YYQrdKjzD6zqUqr7lwjQOZphY1pB/b0epL9Paw+RK05U5U7KmX4raK7JResFP25A9dmZAx9d
XdnV5k2ISIRBazkXKkfbJ4KNKDLbRCATsDgJg6MWdNCwjQfYgglulZx/f3TfmOVFN+YRc0ohL9vt
WHxgGvsmoIWm0ww42lrtmPBu6rNJ1W6CYUIdnOzSUzTUlmDoCf1AXGM3KUzHjtZKB9I+PqRIq28h
3Fhu9w2mnIUAdcGNFmV+nSZZYU41gTm7fYhFqwvEQH0jP25cLVtBH2rF+WWmQ+4O1G1sOYg2q8Jo
svaXhgtZyLLuZY+VHup34eJ6oMZ/Frfi5qMtTnGvoQ==
=zcd2
-----END PGP SIGNATURE-----

--------------IzMc1pt0J82AFW0VP25iQzrN--

