Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHEdEBwjl2lAvAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 15:50:04 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE7315FC2D
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 15:50:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1236429.1539145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt5LS-0006zt-8x; Thu, 19 Feb 2026 14:49:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1236429.1539145; Thu, 19 Feb 2026 14:49:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt5LS-0006xj-6D; Thu, 19 Feb 2026 14:49:34 +0000
Received: by outflank-mailman (input) for mailman id 1236429;
 Thu, 19 Feb 2026 14:49:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Zdoi=AX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vt5LQ-0006vg-WB
 for xen-devel@lists.xenproject.org; Thu, 19 Feb 2026 14:49:33 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3311f969-0da2-11f1-b164-2bf370ae4941;
 Thu, 19 Feb 2026 15:49:31 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-65b94e0a875so1462643a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 19 Feb 2026 06:49:32 -0800 (PST)
Received: from ?IPV6:2a00:12d0:af5b:2f01:4042:c03:ce4d:a5a1?
 (2a00-12d0-af5b-2f01-4042-c03-ce4d-a5a1.ip.tng.de.
 [2a00:12d0:af5b:2f01:4042:c03:ce4d:a5a1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8fc735e872sm585475766b.10.2026.02.19.06.49.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Feb 2026 06:49:31 -0800 (PST)
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
X-Inumbo-ID: 3311f969-0da2-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771512571; x=1772117371; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RiaziIfv6nYQB+Q2maA8CGEfKFFLnXWXM//u1aHrEHs=;
        b=Q9WjZOCDGq0jrDHAadMTy2bebNj+iwpzmAnwTICiIuxJcEvdlXUwXT2tWl3fvR0+8Q
         EMbNbOWoiGYNM4aEpggjU1Sg5bVSYzWH/Ce9jsuvQwL63P2GjQ6fz8vQCAVNCNhRo4et
         Plbgo36d7ukoRZIPD+O6Tljo54sBjrJBhZq7X1Edky/2etQG5vfpLaYHPj1SZWY5Sayv
         Q70FIZcaVLILQsGZVYNPhiofz2bKYOPAwUSiTzWNe83hWDzfQ5sSNWIk4Lf0Q/ZwPCFY
         P/fpldD7PKpfqMd/FkOCCX1XOGwDwsylDPv02AhmMg0l2wyKkumrqA5VhMocGn2tDSTS
         FSag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771512571; x=1772117371;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RiaziIfv6nYQB+Q2maA8CGEfKFFLnXWXM//u1aHrEHs=;
        b=CjMl2lfzrMt1XX8KEpBWxy77CHdGPi1/Gs0i9XeaBKKGpY3G0yP4knz/eGZ8rKEIad
         w3X6/nmWqdsRiipGEwX0S/Rr+XbDS9lDGhuxBD3qpbibp7Vgqrg/yCm4xmeVRWO1lj2n
         zEsVzTtCoaKpSUeUZdBKuKa9wHoS5R4OkhCt0b4IBEtCCd5jIKq1dwIPdKWF7ezLy5N6
         5O35xQFHL/qCbKVNOXTYmFthVYCNBDYCpvNcs0KCByOTqI10aBGmxNDa0OPqYKF6RW2H
         cTEzZjCq7gqfGjfkHrMajGD1KJzFFVhN4rdNX7bPA4aR9r4mnFDnIR2wRd8+8PYOK2OO
         TSbg==
X-Forwarded-Encrypted: i=1; AJvYcCVLgCC43Wm3ZxUXMn8l2a0ODjFUskM2BrI342IspM6TPXSyJCQz4x2jQXsLxlxEq/Scg4X+twvjfOI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyWYLhPDQos8EB5N1XS+mpgOJyQAgOiV+Tx9oitRJc0VicpWb2L
	9mASO5uhm0vrfRWufWrdYfedDntuJy54dIBwjeuJc3V7uKuGE4ffmo4nrOixjKT8A/c=
X-Gm-Gg: AZuq6aKfb3Jh1ZFxQ7aP5i/GOVOHu5jVN61trlJJJfq3CNIh06B4eJTx5AXSyADLLjY
	JzeTGNbHiJL2cCERB5icXCTAaLB8J72QIXku5RlJ6UlyWeguml9zLxSJI5lJABUNxNSFo3/HTqW
	HjILFjgrdx1bItTpNCmatrjcR4jfpi/gVdfEj0kITrFR4YvUL3BeSjvpGg6uQtI2QcX9UYeFcOS
	dU+4Da+oDZ9AcliOvpjPnpC7s2/QHFTDBnwUqM1oOy0rJrfmWwsm4DNDJBzEwhMEGS7w1ixbhyM
	MEH76qgq4Wwm40Qely7SAjkrVahn9b32Cy53Hq5cN2LfFWOWnDABRFDDXA8lYQwYmlSV5UJb8DF
	Twcg8czCThcX3iWT2BlKEco2a6W8d9IyJpXz3bB6D/dFmfKWGEzlfnneWQJ8vNQ1ao5lH+GebXv
	5t8TlZMh7fC1yi3hLyajOLK7xILwlzoSdn3OSTsRNbDkRvIXYhle2Vairul7/fcDnkZrRGQASBo
	3tQ7QZuMlmjKvXaEIH2JqmNLrphtWx3zHvZaK3rjXUh/RzEEQ==
X-Received: by 2002:a17:906:f59d:b0:b76:f57f:a2c3 with SMTP id a640c23a62f3a-b903daa5f44mr364786066b.12.1771512571303;
        Thu, 19 Feb 2026 06:49:31 -0800 (PST)
Message-ID: <d113f326-1a8e-40c4-8187-c255aac7aeba@suse.com>
Date: Thu, 19 Feb 2026 15:49:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG v2] common/domctl: xsm update for get_domain_state access
To: Jason Andryuk <jason.andryuk@amd.com>, Jan Beulich <jbeulich@suse.com>
Cc: Chris Rogers <rogersc@ainfosec.com>,
 Dmytro Firsov <dmytro_firsov@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20260218190855.7272-1-dpsmith@apertussolutions.com>
 <1b0a2f66-e03d-4428-a9c0-f26f84e7f348@amd.com>
 <fd69b278-6e7d-46b0-95ac-fff3926b1c4f@suse.com>
 <a13a45a1-9da4-4fab-9d5d-59ac06ea7b23@suse.com>
 <7a334660-95db-4f6e-beb5-9115372567bb@suse.com>
 <539aceb3-8e94-4476-a538-77c1eb47e188@suse.com>
 <88098c92-b905-49bf-be78-ccc794b1d5e0@amd.com>
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
In-Reply-To: <88098c92-b905-49bf-be78-ccc794b1d5e0@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------wK0FRF8waLqxf8xu0gQ0gcfZ"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.32 / 15.00];
	SIGNED_PGP(-2.00)[];
	R_MIXED_CHARSET(0.77)[subject];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jason.andryuk@amd.com,m:jbeulich@suse.com,m:rogersc@ainfosec.com,m:dmytro_firsov@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim];
	DKIM_TRACE(0.00)[suse.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	HAS_ATTACHMENT(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 6FE7315FC2D
X-Rspamd-Action: no action

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------wK0FRF8waLqxf8xu0gQ0gcfZ
Content-Type: multipart/mixed; boundary="------------vMzHeRKnqIsoas9yupWsUKj6";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jason Andryuk <jason.andryuk@amd.com>, Jan Beulich <jbeulich@suse.com>
Cc: Chris Rogers <rogersc@ainfosec.com>,
 Dmytro Firsov <dmytro_firsov@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
Message-ID: <d113f326-1a8e-40c4-8187-c255aac7aeba@suse.com>
Subject: Re: [BUG v2] common/domctl: xsm update for get_domain_state access
References: <20260218190855.7272-1-dpsmith@apertussolutions.com>
 <1b0a2f66-e03d-4428-a9c0-f26f84e7f348@amd.com>
 <fd69b278-6e7d-46b0-95ac-fff3926b1c4f@suse.com>
 <a13a45a1-9da4-4fab-9d5d-59ac06ea7b23@suse.com>
 <7a334660-95db-4f6e-beb5-9115372567bb@suse.com>
 <539aceb3-8e94-4476-a538-77c1eb47e188@suse.com>
 <88098c92-b905-49bf-be78-ccc794b1d5e0@amd.com>
In-Reply-To: <88098c92-b905-49bf-be78-ccc794b1d5e0@amd.com>
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

--------------vMzHeRKnqIsoas9yupWsUKj6
Content-Type: multipart/mixed; boundary="------------sLXD7NgoyPafGKV56QfLrHCT"

--------------sLXD7NgoyPafGKV56QfLrHCT
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTkuMDIuMjYgMTI6MzEsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IE9uIDIwMjYtMDIt
MTkgMDY6MjEsIErDvHJnZW4gR3Jvw58gd3JvdGU6DQo+PiBPbiAxOS4wMi4yNiAxMjoxMywg
SmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMTkuMDIuMjAyNiAxMjowMywgSnVlcmdlbiBH
cm9zcyB3cm90ZToNCj4+Pj4gT24gMTkuMDIuMjYgMTE6NTIsIEphbiBCZXVsaWNoIHdyb3Rl
Og0KPj4+Pj4gT24gMTkuMDIuMjAyNiAwMDowNCwgSmFzb24gQW5kcnl1ayB3cm90ZToNCj4+
Pj4+PiBPbiAyMDI2LTAyLTE4IDE0OjA4LCBEYW5pZWwgUC4gU21pdGggd3JvdGU6DQo+Pj4+
Pj4+IC0tLSBhL3hlbi9jb21tb24vZG9tYWluLmMNCj4+Pj4+Pj4gKysrIGIveGVuL2NvbW1v
bi9kb21haW4uYw0KPj4+Pj4+PiBAQCAtMjEwLDcgKzIxMCw3IEBAIHN0YXRpYyB2b2lkIHNl
dF9kb21haW5fc3RhdGVfaW5mbyhzdHJ1Y3QgDQo+Pj4+Pj4+IHhlbl9kb21jdGxfZ2V0X2Rv
bWFpbl9zdGF0ZSAqaW5mbywNCj4+Pj4+Pj4gwqDCoMKgIGludCBnZXRfZG9tYWluX3N0YXRl
KHN0cnVjdCB4ZW5fZG9tY3RsX2dldF9kb21haW5fc3RhdGUgKmluZm8sIHN0cnVjdCANCj4+
Pj4+Pj4gZG9tYWluICpkLA0KPj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgZG9taWRfdCAqZG9taWQpDQo+Pj4+Pj4+IMKgwqDCoCB7
DQo+Pj4+Pj4+IC3CoMKgwqAgdW5zaWduZWQgaW50IGRvbTsNCj4+Pj4+Pj4gK8KgwqDCoCB1
bnNpZ25lZCBpbnQgZG9tID0gLTE7DQo+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgIGludCByYyA9
IC1FTk9FTlQ7DQo+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBkb21haW4gKmhkbDsN
Cj4+Pj4+Pj4gQEAgLTIxOSw2ICsyMTksMTAgQEAgaW50IGdldF9kb21haW5fc3RhdGUoc3Ry
dWN0IA0KPj4+Pj4+PiB4ZW5fZG9tY3RsX2dldF9kb21haW5fc3RhdGUgKmluZm8sIHN0cnVj
dCBkb21haW4gKmQsDQo+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgIGlmICggZCApDQo+Pj4+Pj4+
IMKgwqDCoMKgwqDCoMKgIHsNCj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJjID0geHNtX2dl
dF9kb21haW5fc3RhdGUoWFNNX1hTX1BSSVYsIGQpOw0KPj4+Pj4+PiArwqDCoMKgwqDCoMKg
wqAgaWYgKCByYyApDQo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBy
YzsNCj4+Pj4+Pj4gKw0KPj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNldF9kb21h
aW5fc3RhdGVfaW5mbyhpbmZvLCBkKTsNCj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCByZXR1cm4gMDsNCj4+Pj4+Pj4gQEAgLTIzOCwyOCArMjQyLDM5IEBAIGludCBnZXRfZG9t
YWluX3N0YXRlKHN0cnVjdCANCj4+Pj4+Pj4geGVuX2RvbWN0bF9nZXRfZG9tYWluX3N0YXRl
ICppbmZvLCBzdHJ1Y3QgZG9tYWluICpkLA0KPj4+Pj4+DQo+Pj4+Pj4gQmV0d2VlbiB0aGUg
dHdvIGh1bmtzIGlzIHRoaXM6DQo+Pj4+Pj4NCj4+Pj4+PiDCoMKgwqDCoMKgwqAgaGRsID0g
bG9ja19kb21fZXhjX2hhbmRsZXIoKTsNCj4+Pj4+Pg0KPj4+Pj4+IMKgwqDCoMKgwqDCoCAv
Kg0KPj4+Pj4+IMKgwqDCoMKgwqDCoMKgICogT25seSBkb21haW4gcmVnaXN0ZXJlZCBmb3Ig
VklSUV9ET01fRVhDIGV2ZW50IGlzIGFsbG93ZWQgdG8gcXVlcnkNCj4+Pj4+PiDCoMKgwqDC
oMKgwqDCoCAqIGRvbWFpbnMgaGF2aW5nIGNoYW5nZWQgc3RhdGUuDQo+Pj4+Pj4gwqDCoMKg
wqDCoMKgwqAgKi8NCj4+Pj4+PiDCoMKgwqDCoMKgwqAgaWYgKCBjdXJyZW50LT5kb21haW4g
IT0gaGRsICkNCj4+Pj4+PiDCoMKgwqDCoMKgwqAgew0KPj4+Pj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHJjID0gLUVBQ0NFUzsNCj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3Rv
IG91dDsNCj4+Pj4+PiDCoMKgwqDCoMKgwqAgfQ0KPj4+Pj4+DQo+Pj4+Pj4gU28gaXQgaXMg
b25seSB0aGUgZG9tYWluIHdpdGggVklSUV9ET01fRVhDIHRoYXQgY2FuIGVudGVyIHRoZSB3
aGlsZSBsb29wOg0KPj4+Pj4+DQo+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgIHdoaWxlICggZG9t
X3N0YXRlX2NoYW5nZWQgKQ0KPj4+Pj4+PiDCoMKgwqDCoMKgwqDCoCB7DQo+Pj4+Pj4+IC3C
oMKgwqDCoMKgwqDCoCBkb20gPSBmaW5kX2ZpcnN0X2JpdChkb21fc3RhdGVfY2hhbmdlZCwg
RE9NSURfTUFTSyArIDEpOw0KPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgZG9tID0gZmluZF9u
ZXh0X2JpdChkb21fc3RhdGVfY2hhbmdlZCwgRE9NSURfTUFTSyArIDEsIGRvbSArIDEpOw0K
Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICggZG9tID49IERPTUlEX0ZJUlNU
X1JFU0VSVkVEICkNCj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJy
ZWFrOw0KPj4+Pj4+PiArDQo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBkID0gcmN1X2xvY2tf
ZG9tYWluX2J5X2lkKGRvbSk7DQo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoIGQgJiYg
eHNtX2dldF9kb21haW5fc3RhdGUoWFNNX1hTX1BSSVYsIGQpICkNCj4+Pj4+Pg0KPj4+Pj4+
IC4uLiBpZiB0aGUgVklSUV9ET01fRVhDIG93bmVyIGlzIGRlbmllZCBmb3IgZG9tYWluIGQg
Li4uDQo+Pj4+Pj4NCj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHsNCj4+Pj4+Pj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgcmN1X3VubG9ja19kb21haW4oZCk7DQo+Pj4+Pj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGQgPSBOVUxMOw0KPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBjb250aW51ZTsNCj4+Pj4+Pg0KPj4+Pj4+IC4uLiB0aGUgY2FsbGVyIHdvdWxk
IGNvbnRpbnVlIC4uLg0KPj4+Pj4+DQo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCB9DQo+Pj4+
Pj4+ICsNCj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoIHRlc3RfYW5kX2Ns
ZWFyX2JpdChkb20sIGRvbV9zdGF0ZV9jaGFuZ2VkKSApDQo+Pj4+Pj4NCj4+Pj4+PiAuLi4g
YW5kIHRoaXMgYml0IHdvdWxkIG5ldmVyIGJlIGNsZWFyZWQuwqAgU2hvdWxkIHRoZSBWSVJR
X0RPTV9FWEMgb3duZXINCj4+Pj4+PiBhbHdheXMgZ2V0IHRvIGNsZWFyIHRoZSBiaXQgZXZl
biBpZiBpdCBjYW5ub3Qgc2VlIHRoZSByZXN1bHQ/DQo+Pj4+Pg0KPj4+Pj4gSSBkb24ndCB0
aGluayBzbywgbm8uIFdoZW5ldmVyIGEgbGVnaXRpbWF0ZSBjb25zdW1lciBvY2N1cnMgKHRo
ZSBvd25lciBvZg0KPj4+Pj4gVklSUV9ET01fRVhDIGNhbiBjaGFuZ2UsIGFmdGVyIGFsbCks
IGl0J2xsIHRoZW4gY29uc3VtZSB0aGUgYml0cyBhcyBuZWVkZWQuDQo+Pj4+PiBNb3JlIGdl
bmVyYWxseSwgSSB0aGluayB3ZSdyZSBiZXR0ZXIgb2ZmIG5vdCBtYWtpbmcgdGhlIGNvZGUg
aGVyZSBkZXBlbmQNCj4+Pj4+IHRvbyBtdWNoIG9uIHRoYXQgc3BlY2lhbCBWSVJRX0RPTV9F
WEMgcHJvcGVydHkuDQo+Pj4+DQo+Pj4+IE9UT0ggYSBuZXcgVklSUV9ET01fRVhDIG93bmVy
IHdpbGwgcmVzdWx0IGluIGEgY29tcGxldGUgcmVzZXQgb2YgdGhlIGJpdG1hcA0KPj4+PiBh
bnl3YXkgKHRoYXQgaXM6IHRoZSBiaXRzIGZvciBhbGwgZXhpc3RpbmcgZG9tYWlucyB3aWxs
IGJlIHNldCwgd2hpbGUgYWxsDQo+Pj4+IG90aGVycyB3aWxsIGJlIGNsZWFyZWQpLg0KPj4+
DQo+Pj4gWWVzLCB3aGlsZSB3cml0aW5nIG15IHJlcGx5IEkgd29uZGVyZWQgd2hldGhlciBJ
IHNob3VsZCBtZW50aW9uIHRoYXQuIFRvIGtlZXANCj4+PiB0aGluZ3MgYSBsaXR0bGUgbW9y
ZSBzaW1wbGUsIEkgZGlkbid0LiBQbHVzIGZvciB0aGlzIGFzcGVjdCB0aGUgbGFzdCBzZW50
ZW5jZQ0KPj4+IG9mIG15IGVhcmxpZXIgcmVwbHkgYWxzbyBhcHBsaWVzLg0KPj4NCj4+IEkg
YmVsaWV2ZSBmbGFzayBzZXR0aW5ncyBjYW4gYmUgY2hhbmdlZCwgcmlnaHQ/DQo+Pg0KPj4g
SWYgc28sIGNsZWFyaW5nIHRoZSBiaXQgd291bGQgYmUgYWZmZWN0aW5nIHRoZSBzY2VuYXJp
byB3aGVyZSB0aGUgVklSUV9ET01fRVhDDQo+PiBpcyBOT1QgY2hhbmdlZCwgYnV0IHRoZSBm
bGFzayBzZXR0aW5ncyBhcmUgdXBkYXRlZCB0byBhbGxvdyBpdCBvYnRhaW5pbmcgaW5mbw0K
Pj4gYWJvdXQgZC4NCj4gDQo+IFllcywgdGhpcyBjb3VsZCBoYXBwZW4sIHNvIHRoZSBiaXRz
IHNob3VsZCByZW1haW4gc2V0Lg0KDQpJbiB0aGUgYWJvdmUgc2NlbmFyaW8sIEkgdGhpbmsg
VklSUV9ET01fRVhDIHNob3VsZCBiZSB0cmlnZ2VyZWQgYWZ0ZXIgYSBmbGFzaw0KcG9saWN5
IHVwZGF0ZSBpbiBvcmRlciB0byBsZXQgeGVuc3RvcmVkIGxvb2sgZm9yIHByZXZpb3VzbHkg
bWlzc2VkIGRvbWFpbiBzdGF0ZQ0KY2hhbmdlcy4NCg0KDQpKdWVyZ2VuDQo=
--------------sLXD7NgoyPafGKV56QfLrHCT
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------sLXD7NgoyPafGKV56QfLrHCT--

--------------vMzHeRKnqIsoas9yupWsUKj6--

--------------wK0FRF8waLqxf8xu0gQ0gcfZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmmXIvoFAwAAAAAACgkQsN6d1ii/Ey8E
IAf/fkneo7MbieUiG8sLlzmU6AAqujPAlUgToqHBnhEfDakktNjv9/yGQaJPfXexsEfCdhA4hjba
w2e6JYKwSuYl+jce4W+vG6UyKJMtufFy6Wr5VKkXCXVjzT2+LTHSotlfSmT1DEUc6txU5P84ZObN
GEt/Hwr35DyYdGItS7D7Jk/nIJJ1DqeGWYgMmYjrcXRa4dj7Yj5/k3Hut1W0Ml/rz2UD9aazjvGs
NcLXX7FB1E7g+QOB6wzXNnBpxdMXDE6OKICRI5dCZ7pydTUeoUR9D9ZhJTJlS29pM7ZI5HK3Cys1
ecK26Bk/qOOTNf31i95iDMV41K9L6XgkONHFJfvYaw==
=gw2i
-----END PGP SIGNATURE-----

--------------wK0FRF8waLqxf8xu0gQ0gcfZ--

