Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHNmFzQy52k65QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 10:15:48 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B4143800A
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 10:15:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288567.1568829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF6Ge-00088U-NG; Tue, 21 Apr 2026 08:15:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288567.1568829; Tue, 21 Apr 2026 08:15:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF6Ge-00087R-J7; Tue, 21 Apr 2026 08:15:36 +0000
Received: by outflank-mailman (input) for mailman id 1288567;
 Tue, 21 Apr 2026 08:15:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wF6Gd-00087L-Pf
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 08:15:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wF6Gd-00BERw-6M
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 10:15:35 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 69e73225-5cb7-0a2a0a5109dd-0a2a450abec0-4
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 10:15:34 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 69e73226-56b3-0a2a450a0019-d155dd33adbb-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 10:15:34 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-43cfd832155so2868340f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 01:15:34 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4cc09b1sm35917552f8f.9.2026.04.21.01.15.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2026 01:15:33 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776759334; x=1777364134; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0AQTxiz1gbQvkhGhBuUVTdfaAfzKM2B750xrMMYT/DE=;
        b=cMhF8bTP6BRgOj4P9sx09sUQ5+i2K+YZIVrG5x9Axz+BXvgjPXg6YnMrGllWqV8UEh
         7IRwcCVmvMVLHWOe2H0Xy7gZNhFxxVlR3+ax2hA/4ukDXFAuySAWiGEYQKzIEEn+g57A
         Ukjv+TUTOsp8ZugLRZF9FUWHwVeTq3jc6VVx+lXC6UkZgQPcJMzUfTCMaS5Q/O8tC/yO
         BIkUWo6A45xgT1p5QBtNXNUThnR595oWdYamrSKsoGp4l7EOQttmdrUUhktk/KePV28K
         SxNxYrZw5dpk8TKD+3l3yWbhMDOGnEn8pdLddKm2TCw9jriwcggcc4l0ppOD3jP4k70q
         eShQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776759334; x=1777364134;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0AQTxiz1gbQvkhGhBuUVTdfaAfzKM2B750xrMMYT/DE=;
        b=KHZTim6EoqVUuvNjiBABqtWs13QivPrqk8tbB9VU1+/6Tbq0GBBVDo6i5Q1jYC2o4j
         65/PVW2y1pNc5kpmxob/o2Enw7HcXz4YSpTckT5RC49VqKpAbJXNmaUaZ/lnmPNM/BQh
         1TeYVDUn7YFBjh0MI+0ayinoTrjDjdUNTfxQqk5YG8vzEh1urvwrfzOwL15H+voK+NIj
         J56p32yDCC9G4lAouWiNNjmNvHciVkbKuTCIgXoLqxsbggH50J2mIt80IN0QzTxpacNi
         YO8xZ8BqN2H4bC282PbhNOOAtEq5+O6/6Q8cfZYoH4ZD1E3z+RkS56Fi6/wVBwHhtOhv
         coEg==
X-Forwarded-Encrypted: i=1; AFNElJ/pred1K5V5TojEI5IxePPHQPMfqvy9DKAncFNQAOFor3x3qaQLUOSZy+bwzEsrdlAzmxnWWDbmlSI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzYPYOMu9cRE8aQgxDx7j8T7UYvXIIcHAO1FqJdMcvhnVmHhS7z
	uDUijLm8zwmiMA1zwDbwDoWGNVzoz84NoyaZ7f1pfPIOC24VQvyPz8LcTe+MPQcb8Ng=
X-Gm-Gg: AeBDievwWSvZOvwVvTnpL4cPPH3XwzDLUPJclUp2BB0beG+hu46Nk8DSjQJxFk3lFG2
	WS0/ul9nKVqYp3rONjPMr7Cayy1emFkEezgBS4JQQkXAzqvL31UkdxxHaYcL8tvgIdJpG4VIu2C
	n4erdBo49r+r3/15TwfDLviQdlSkNxtmNwgSumMlxt3E43V5u2k9o1VteugOPxZot39v6rqprmA
	Yl2jc7azobJDhxzEhcOa30AsH9975ioWefNcohsKyUuYUwIzYIgJ2cHUbCZFbIMP+cMMUMoEP8x
	rai3NFG85FZsl5KGTBEyXLMH9Srx6c7adwnSGsgku5AFPlCZXUCPUXJzLHYJLN+fq3PeASGgwgD
	xd7lfupuQK2le86vhZwd9wCAdTB8QSObt+SFilHIbw3TxiMSmn1JLJxRkFbOrAbL5yOpyZ5JN6k
	ifRKm1tj2tBdkdpq4LR4I+V5GhmpgrShc++LAFFU+NIBp4P2sCqSLk0l4yYePh94f8I0vQ4BhRx
	jeOb5mptCcafwkKE5FZXkqojrwKBKnPc+0jphkiimQAW5fuKrlswfwW8WsB31Uk
X-Received: by 2002:a5d:5d02:0:b0:43d:77c6:be6d with SMTP id ffacd0b85a97d-43fe3db39c6mr25971184f8f.7.1776759334217;
        Tue, 21 Apr 2026 01:15:34 -0700 (PDT)
Message-ID: <daccf4e4-4373-43d3-8f43-a11cc844062a@suse.com>
Date: Tue, 21 Apr 2026 10:15:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/9] tools/xenstored: add support for watch depth
 feature
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260421074211.308473-1-jgross@suse.com>
 <f46c1782-2a76-4657-a78a-f68a9dec4e89@suse.com>
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
In-Reply-To: <f46c1782-2a76-4657-a78a-f68a9dec4e89@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------aaplL58PZ4eiYfjuEyeFNa0D"
X-purgate-ID: tlsNG-4011c0/1776759334-81D808B7-7FC0491B/0/0
X-purgate-type: clean
X-purgate-size: 9646
X-Spamd-Result: default: False [-1.46 / 15.00];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	R_MIXED_CHARSET(0.63)[subject];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.987];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	HAS_ATTACHMENT(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 93B4143800A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------aaplL58PZ4eiYfjuEyeFNa0D
Content-Type: multipart/mixed; boundary="------------VWKkGKYFFgIF3sLV5DOtG0eE";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-ID: <daccf4e4-4373-43d3-8f43-a11cc844062a@suse.com>
Subject: Re: [PATCH v2 0/9] tools/xenstored: add support for watch depth
 feature
References: <20260421074211.308473-1-jgross@suse.com>
 <f46c1782-2a76-4657-a78a-f68a9dec4e89@suse.com>
In-Reply-To: <f46c1782-2a76-4657-a78a-f68a9dec4e89@suse.com>
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

--------------VWKkGKYFFgIF3sLV5DOtG0eE
Content-Type: multipart/mixed; boundary="------------ycAiCmu6JNpC7xxErlkpuL5O"

--------------ycAiCmu6JNpC7xxErlkpuL5O
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjEuMDQuMjYgMDk6NTUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyMS4wNC4yMDI2
IDA5OjQyLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gSW4gb3JkZXIgdG8gcmVkdWNlIGV4
Y2Vzc2l2ZSBudW1iZXIgb2Ygd2F0Y2ggZXZlbnRzIHRoZSB3YXRjaCBkZXB0aA0KPj4gZmVh
dHVyZSBoYXMgYmVlbiBkZWZpbmVkLCBhbGxvd2luZyB0aGUgdXNlciB0byBsaW1pdCB0aGUg
bnVtYmVyIG9mDQo+PiBub2RlIGxldmVscyBiZWxvdyB0aGUgd2F0Y2hlZCBub2RlIHRvIGNh
dXNlIGV2ZW50cy4NCj4+DQo+PiBUaGlzIHNlcmllcyBpcyBpbXBsZW1lbnRpbmcgdGhpcyBm
ZWF0dXJlIGZvciB4ZW5zdG9yZWQgKGluY2x1ZGluZyB0aGUNCj4+IFBWIGFuZCBQVkggc3R1
YmRvbSB2YXJpYW50cykuDQo+Pg0KPj4gUG9zc2libGUgdXNlcnMgYXJlOg0KPj4NCj4+IC0g
eGwvbGlieGw6IHVzZSBkb21pZCBpbmZvcm1hdGlvbiBmb3IgdGhlIHNwZWNpYWwgQGludHJv
ZHVjZURvbWFpbiBhbmQNCj4+ICAgIEByZWxlYXNlRG9tYWluIHdhdGNoZXMsIHdoaWNoIHdp
bGwgYmUgYXZhaWxhYmxlIHdoZW4gdXNpbmcgZGVwdGggPSAxDQo+Pg0KPj4gLSB4ZW5jb25z
b2xlZCwgbGlrZSB4bC9saWJ4bA0KPj4NCj4+IC0gYW55IFBWLWRldmljZSBiYWNrZW5kcyB3
YXRjaGluZyBkaXJlY3RvcmllcyBmb3IgYWRkZWQgZGV2aWNlcyAobm8NCj4+ICAgIHdhdGNo
IGV2ZW50cyB3aGVuIGFueSBkZXZpY2Ugc3BlY2lmaWMgbm9kZSBpcyBtb2RpZmllZCkNCj4+
DQo+PiAtIGFueSBQVi1kZXZpY2UgZnJvbnRlbmQgYW5kIGJhY2tlbmQgd2F0Y2hpbmcgdGhl
ICJzdGF0ZSIgbm9kZSBvZiB0aGUNCj4+ICAgIG90aGVyIHNpZGUsIGluIGNhc2UgdGhlIG90
aGVyIHNpZGUgcGxheXMgZGlydHkgZ2FtZXMgYnkgYnVpbGRpbmcNCj4+ICAgIGxhcmdlIHN1
Yi10cmVlcyBiZW5lYXRoIHRoZSAic3RhdGUiIG5vZGUNCj4+DQo+PiBDaGFuZ2VzIGluIFYy
Og0KPj4gLSBzb21lIG1pbm9yIHN0YWxlIGNoYW5nZXMgcmV2ZXJ0ZWQNCj4+IC0gbGFzdCBw
YXRjaCBjb3ZlcmVkIGJ5IHRoZSBzZXJpZXMgbm93LCBtYW4gcGFnZSB1cGRhdGVkDQo+IA0K
PiBJcyB0aGlzIHJlYWxseSBldmVyeXRoaW5nIHRoYXQgY2hhbmdlZD8gSSB3YW50ZWQgdG8g
Y29tbWl0IHRoZSBmaXJzdCB0d28NCj4gcGF0Y2hlcyBmcm9tIHYxLCBidXQgSSBoYWQgdG8g
bGVhdmUgb3V0IHBhdGNoIDEgYXMgaXQgZGlkbid0IGFwcGx5LiBQYXRjaA0KDQpBaCwgdGhl
cmUgd2FzIGNoYW5nZSBpbiB0aGUgcGF0Y2ggY29udGV4dCBkdWUgdG8gdGhlIHBlci1kb21h
aW4gcXVvdGEgc2VyaWVzOg0KYSBsaXRlcmFsIGF0b2koKSB3YXMgcmVwbGFjZWQgYnkgYSBw
YXJzZV9kb21pZCgpLg0KDQoNCkp1ZXJnZW4NCg==
--------------ycAiCmu6JNpC7xxErlkpuL5O
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------ycAiCmu6JNpC7xxErlkpuL5O--

--------------VWKkGKYFFgIF3sLV5DOtG0eE--

--------------aaplL58PZ4eiYfjuEyeFNa0D
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmnnMiUFAwAAAAAACgkQsN6d1ii/Ey/a
lAf/ZDXTR1oJqhcGWVgQYdztyE477Lg/jYA5jQimi3pmcIiie+dVR/C9Vn9HdYnC7XOUcvrO5LPr
pRPohSlM0L4RoSp0mchBGsVZigNsHL+KPUlR9bMrwnvklr/545N2Llu/uDVlC/OiKd94Lruh/uPI
bgYycPwRPHsyzJCMKvYUV+9TVDQu6RY/O++TgHvLaqW4bkKoVMDvPBjKCQ7I2eujc1HtWdnPbzmj
5ZF8hoH6xlqMjb9ob01CGxf1eDuX/RcPUy4aUMEyfTuEG+3ANGjJKaDc3qLajxuY1rV+4+0KgrE3
lROoBJhs7CrcfV/1+e9n5xoNd2xv7z5uX7wsAhYHyw==
=4Fzt
-----END PGP SIGNATURE-----

--------------aaplL58PZ4eiYfjuEyeFNa0D--

