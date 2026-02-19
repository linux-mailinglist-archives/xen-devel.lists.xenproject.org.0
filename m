Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAVhH1XylmmYrQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 12:21:57 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FDC15E3D6
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 12:21:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1236151.1538914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt26I-00033A-VT; Thu, 19 Feb 2026 11:21:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1236151.1538914; Thu, 19 Feb 2026 11:21:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt26I-00031U-SJ; Thu, 19 Feb 2026 11:21:42 +0000
Received: by outflank-mailman (input) for mailman id 1236151;
 Thu, 19 Feb 2026 11:21:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Zdoi=AX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vt26G-00031O-V0
 for xen-devel@lists.xenproject.org; Thu, 19 Feb 2026 11:21:41 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2907b28a-0d85-11f1-b164-2bf370ae4941;
 Thu, 19 Feb 2026 12:21:39 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-b8f8f2106f1so125045866b.2
 for <xen-devel@lists.xenproject.org>; Thu, 19 Feb 2026 03:21:39 -0800 (PST)
Received: from ?IPV6:2a00:12d0:af5b:2f01:4042:c03:ce4d:a5a1?
 (2a00-12d0-af5b-2f01-4042-c03-ce4d-a5a1.ip.tng.de.
 [2a00:12d0:af5b:2f01:4042:c03:ce4d:a5a1])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65bad29d295sm4022621a12.8.2026.02.19.03.21.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Feb 2026 03:21:38 -0800 (PST)
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
X-Inumbo-ID: 2907b28a-0d85-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771500099; x=1772104899; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Q31N1Nu6u8r/jQV6pRbRsGg5wecGubvXJz7LIdeJSVE=;
        b=daMm+K+dtmAGb0pzjVVbnDEW+HGCYOVMMYOhKJScFkBk7gTlhqRAn7qp0VxO13ph5Z
         bxD+Z24ep2E5E0HroJh2rRHqdazPThXUfvjV5jByU9Y/0SGyjXlCmGDouzeqkVMg8YV0
         oRUk+RnQWh7Zr5agZFn68qbbcnNV9RdlNsDpXxqRawFybl8hndDuNF3gNgwxP0WBWYFY
         XhV3nNzRj+iaZMi9s4DTfq5jqmHFdg/fOQvKNeXSL4Dyy9Nm9vkNlMaxgagUGVIc0jky
         6r/XaSCmbkj7dK+Y560QJHonnBYzDmx00+nOzXofdrCA3oziX6QP738SBcWKUkX6Wa8j
         kTkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771500099; x=1772104899;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q31N1Nu6u8r/jQV6pRbRsGg5wecGubvXJz7LIdeJSVE=;
        b=WNw2VAVLZsbhXypp1EfD4kpCUK3SoFxUTzHYvctXDy9IkYaKBd/ih1FH6KqvzMIX08
         aiJw3Q6nC/B1LFgIyE0bRz508PyELnzRXBWhR3tvhHPMk6Dbbv6T7oghTX89vmMsmDXq
         IQgEid0LW9Irat+dcb6wqI0BhnChr4jKgFzjzSOuCXta4xwOh0q2RpSThvfH6Dh+GbXh
         j/jaGIVTrk/h+rqoHvrQvqzKWHFP+2y+eBPdxDl9cLuMUxnIcZfzedbLCmftZGNzUBbp
         xkyNdcPM41zdk2kr2bhEfgSjEsoxZkZ8csSJ9Q8t8bAjCtG+DWc5xnmhqAV8wO/PoONc
         sxDw==
X-Forwarded-Encrypted: i=1; AJvYcCUlVxOfxN4LrZWu7YShSCJqXiwBTuXmE0zoxgpj0eDqYl7D7zQAKN+p3DOBm+2yMVVr9GmDsj8+3vE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwN77OhAWvG6lDfxubFozAGCLPcyC67EefIb8NQZqtm+3LNAzaQ
	IFGiun00RFMP2dellO8+Kf2wp2oHpUm7NIipmSGeF3dBF2oSM/lzIaJYHosC/mknhh4=
X-Gm-Gg: AZuq6aI5aoVTkiduua8xVSHkwNlyrLIYeXtKtQPoMNMqWM5N6MYgpen+VFAp2HXes0g
	rmTUHQ4Sk/GQncKOHpLkNRxeBBWnIhtWtRciaAod/SRFZ2eBqrHKwGiZk4uAbOIm4kIciQOI17K
	ZGx83AGq7ilKkqjzZdvWz7/WYSlh1upx2BS0uWhOQ/CxmQY6Rs/QAN/eFgtMnq0Lbepy/hj9aj9
	ifnVCFz1xFesv3T8+OBQyfW1awYwkD4k6d3VocjEIZprr/gAXYWa0pJir5ikJg9MBTdKGjdJyqP
	veUKtDbYWzllfNRL2AFCVNVoPksVTtOcXfQPVT0axJmPupaz/as2FvHsBnE3E/WoCa3rDxbjFX6
	9sl8ep5oDXLJ2h8ZN89lsOW6yECWEH2+rj+rH7Z8WJolqBimfxHQbHe9/0B1TL1o0WpcLGpQh76
	FOZsKRv6pbmMR0OjMArBthaycw8Z/bk6PRzYP98050w7n7eOTnYSlhivF+2oX4nONI5VmFvSdH+
	tPvVyTRxfIq5RVyMnb3FNGreqZxg20JVka+uqvV7eyKb32TzA==
X-Received: by 2002:a17:907:e117:b0:b8f:e46f:8079 with SMTP id a640c23a62f3a-b8fe46f8361mr490496666b.22.1771500098890;
        Thu, 19 Feb 2026 03:21:38 -0800 (PST)
Message-ID: <539aceb3-8e94-4476-a538-77c1eb47e188@suse.com>
Date: Thu, 19 Feb 2026 12:21:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG v2] common/domctl: xsm update for get_domain_state access
To: Jan Beulich <jbeulich@suse.com>
Cc: Chris Rogers <rogersc@ainfosec.com>,
 Dmytro Firsov <dmytro_firsov@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org, Jason Andryuk <jason.andryuk@amd.com>
References: <20260218190855.7272-1-dpsmith@apertussolutions.com>
 <1b0a2f66-e03d-4428-a9c0-f26f84e7f348@amd.com>
 <fd69b278-6e7d-46b0-95ac-fff3926b1c4f@suse.com>
 <a13a45a1-9da4-4fab-9d5d-59ac06ea7b23@suse.com>
 <7a334660-95db-4f6e-beb5-9115372567bb@suse.com>
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
In-Reply-To: <7a334660-95db-4f6e-beb5-9115372567bb@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------lSNMTYhfEJZeV2m89XtxJhnW"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.32 / 15.00];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	R_MIXED_CHARSET(0.77)[subject];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:rogersc@ainfosec.com,m:dmytro_firsov@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,m:jason.andryuk@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	HAS_ATTACHMENT(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: E7FDC15E3D6
X-Rspamd-Action: no action

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------lSNMTYhfEJZeV2m89XtxJhnW
Content-Type: multipart/mixed; boundary="------------Jeuqcxlt1tCQ5sZLkJ7N1Dci";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Chris Rogers <rogersc@ainfosec.com>,
 Dmytro Firsov <dmytro_firsov@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org, Jason Andryuk <jason.andryuk@amd.com>
Message-ID: <539aceb3-8e94-4476-a538-77c1eb47e188@suse.com>
Subject: Re: [BUG v2] common/domctl: xsm update for get_domain_state access
References: <20260218190855.7272-1-dpsmith@apertussolutions.com>
 <1b0a2f66-e03d-4428-a9c0-f26f84e7f348@amd.com>
 <fd69b278-6e7d-46b0-95ac-fff3926b1c4f@suse.com>
 <a13a45a1-9da4-4fab-9d5d-59ac06ea7b23@suse.com>
 <7a334660-95db-4f6e-beb5-9115372567bb@suse.com>
In-Reply-To: <7a334660-95db-4f6e-beb5-9115372567bb@suse.com>
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

--------------Jeuqcxlt1tCQ5sZLkJ7N1Dci
Content-Type: multipart/mixed; boundary="------------We50DAE6mZsSBYx5UcxiQJoB"

--------------We50DAE6mZsSBYx5UcxiQJoB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTkuMDIuMjYgMTI6MTMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxOS4wMi4yMDI2
IDEyOjAzLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMTkuMDIuMjYgMTE6NTIsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDE5LjAyLjIwMjYgMDA6MDQsIEphc29uIEFuZHJ5
dWsgd3JvdGU6DQo+Pj4+IE9uIDIwMjYtMDItMTggMTQ6MDgsIERhbmllbCBQLiBTbWl0aCB3
cm90ZToNCj4+Pj4+IC0tLSBhL3hlbi9jb21tb24vZG9tYWluLmMNCj4+Pj4+ICsrKyBiL3hl
bi9jb21tb24vZG9tYWluLmMNCj4+Pj4+IEBAIC0yMTAsNyArMjEwLDcgQEAgc3RhdGljIHZv
aWQgc2V0X2RvbWFpbl9zdGF0ZV9pbmZvKHN0cnVjdCB4ZW5fZG9tY3RsX2dldF9kb21haW5f
c3RhdGUgKmluZm8sDQo+Pj4+PiAgICAgaW50IGdldF9kb21haW5fc3RhdGUoc3RydWN0IHhl
bl9kb21jdGxfZ2V0X2RvbWFpbl9zdGF0ZSAqaW5mbywgc3RydWN0IGRvbWFpbiAqZCwNCj4+
Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICBkb21pZF90ICpkb21pZCkNCj4+Pj4+ICAg
ICB7DQo+Pj4+PiAtICAgIHVuc2lnbmVkIGludCBkb207DQo+Pj4+PiArICAgIHVuc2lnbmVk
IGludCBkb20gPSAtMTsNCj4+Pj4+ICAgICAgICAgaW50IHJjID0gLUVOT0VOVDsNCj4+Pj4+
ICAgICAgICAgc3RydWN0IGRvbWFpbiAqaGRsOw0KPj4+Pj4gICAgIA0KPj4+Pj4gQEAgLTIx
OSw2ICsyMTksMTAgQEAgaW50IGdldF9kb21haW5fc3RhdGUoc3RydWN0IHhlbl9kb21jdGxf
Z2V0X2RvbWFpbl9zdGF0ZSAqaW5mbywgc3RydWN0IGRvbWFpbiAqZCwNCj4+Pj4+ICAgICAN
Cj4+Pj4+ICAgICAgICAgaWYgKCBkICkNCj4+Pj4+ICAgICAgICAgew0KPj4+Pj4gKyAgICAg
ICAgcmMgPSB4c21fZ2V0X2RvbWFpbl9zdGF0ZShYU01fWFNfUFJJViwgZCk7DQo+Pj4+PiAr
ICAgICAgICBpZiAoIHJjICkNCj4+Pj4+ICsgICAgICAgICAgICByZXR1cm4gcmM7DQo+Pj4+
PiArDQo+Pj4+PiAgICAgICAgICAgICBzZXRfZG9tYWluX3N0YXRlX2luZm8oaW5mbywgZCk7
DQo+Pj4+PiAgICAgDQo+Pj4+PiAgICAgICAgICAgICByZXR1cm4gMDsNCj4+Pj4+IEBAIC0y
MzgsMjggKzI0MiwzOSBAQCBpbnQgZ2V0X2RvbWFpbl9zdGF0ZShzdHJ1Y3QgeGVuX2RvbWN0
bF9nZXRfZG9tYWluX3N0YXRlICppbmZvLCBzdHJ1Y3QgZG9tYWluICpkLA0KPj4+Pg0KPj4+
PiBCZXR3ZWVuIHRoZSB0d28gaHVua3MgaXMgdGhpczoNCj4+Pj4NCj4+Pj4gICAgICAgIGhk
bCA9IGxvY2tfZG9tX2V4Y19oYW5kbGVyKCk7DQo+Pj4+DQo+Pj4+ICAgICAgICAvKg0KPj4+
PiAgICAgICAgICogT25seSBkb21haW4gcmVnaXN0ZXJlZCBmb3IgVklSUV9ET01fRVhDIGV2
ZW50IGlzIGFsbG93ZWQgdG8gcXVlcnkNCj4+Pj4gICAgICAgICAqIGRvbWFpbnMgaGF2aW5n
IGNoYW5nZWQgc3RhdGUuDQo+Pj4+ICAgICAgICAgKi8NCj4+Pj4gICAgICAgIGlmICggY3Vy
cmVudC0+ZG9tYWluICE9IGhkbCApDQo+Pj4+ICAgICAgICB7DQo+Pj4+ICAgICAgICAgICAg
cmMgPSAtRUFDQ0VTOw0KPj4+PiAgICAgICAgICAgIGdvdG8gb3V0Ow0KPj4+PiAgICAgICAg
fQ0KPj4+Pg0KPj4+PiBTbyBpdCBpcyBvbmx5IHRoZSBkb21haW4gd2l0aCBWSVJRX0RPTV9F
WEMgdGhhdCBjYW4gZW50ZXIgdGhlIHdoaWxlIGxvb3A6DQo+Pj4+DQo+Pj4+PiAgICAgDQo+
Pj4+PiAgICAgICAgIHdoaWxlICggZG9tX3N0YXRlX2NoYW5nZWQgKQ0KPj4+Pj4gICAgICAg
ICB7DQo+Pj4+PiAtICAgICAgICBkb20gPSBmaW5kX2ZpcnN0X2JpdChkb21fc3RhdGVfY2hh
bmdlZCwgRE9NSURfTUFTSyArIDEpOw0KPj4+Pj4gKyAgICAgICAgZG9tID0gZmluZF9uZXh0
X2JpdChkb21fc3RhdGVfY2hhbmdlZCwgRE9NSURfTUFTSyArIDEsIGRvbSArIDEpOw0KPj4+
Pj4gICAgICAgICAgICAgaWYgKCBkb20gPj0gRE9NSURfRklSU1RfUkVTRVJWRUQgKQ0KPj4+
Pj4gICAgICAgICAgICAgICAgIGJyZWFrOw0KPj4+Pj4gKw0KPj4+Pj4gKyAgICAgICAgZCA9
IHJjdV9sb2NrX2RvbWFpbl9ieV9pZChkb20pOw0KPj4+Pj4gKyAgICAgICAgaWYgKCBkICYm
IHhzbV9nZXRfZG9tYWluX3N0YXRlKFhTTV9YU19QUklWLCBkKSApDQo+Pj4+DQo+Pj4+IC4u
LiBpZiB0aGUgVklSUV9ET01fRVhDIG93bmVyIGlzIGRlbmllZCBmb3IgZG9tYWluIGQgLi4u
DQo+Pj4+DQo+Pj4+PiArICAgICAgICB7DQo+Pj4+PiArICAgICAgICAgICAgcmN1X3VubG9j
a19kb21haW4oZCk7DQo+Pj4+PiArICAgICAgICAgICAgZCA9IE5VTEw7DQo+Pj4+PiArICAg
ICAgICAgICAgY29udGludWU7DQo+Pj4+DQo+Pj4+IC4uLiB0aGUgY2FsbGVyIHdvdWxkIGNv
bnRpbnVlIC4uLg0KPj4+Pg0KPj4+Pj4gKyAgICAgICAgfQ0KPj4+Pj4gKw0KPj4+Pj4gICAg
ICAgICAgICAgaWYgKCB0ZXN0X2FuZF9jbGVhcl9iaXQoZG9tLCBkb21fc3RhdGVfY2hhbmdl
ZCkgKQ0KPj4+Pg0KPj4+PiAuLi4gYW5kIHRoaXMgYml0IHdvdWxkIG5ldmVyIGJlIGNsZWFy
ZWQuICBTaG91bGQgdGhlIFZJUlFfRE9NX0VYQyBvd25lcg0KPj4+PiBhbHdheXMgZ2V0IHRv
IGNsZWFyIHRoZSBiaXQgZXZlbiBpZiBpdCBjYW5ub3Qgc2VlIHRoZSByZXN1bHQ/DQo+Pj4N
Cj4+PiBJIGRvbid0IHRoaW5rIHNvLCBuby4gV2hlbmV2ZXIgYSBsZWdpdGltYXRlIGNvbnN1
bWVyIG9jY3VycyAodGhlIG93bmVyIG9mDQo+Pj4gVklSUV9ET01fRVhDIGNhbiBjaGFuZ2Us
IGFmdGVyIGFsbCksIGl0J2xsIHRoZW4gY29uc3VtZSB0aGUgYml0cyBhcyBuZWVkZWQuDQo+
Pj4gTW9yZSBnZW5lcmFsbHksIEkgdGhpbmsgd2UncmUgYmV0dGVyIG9mZiBub3QgbWFraW5n
IHRoZSBjb2RlIGhlcmUgZGVwZW5kDQo+Pj4gdG9vIG11Y2ggb24gdGhhdCBzcGVjaWFsIFZJ
UlFfRE9NX0VYQyBwcm9wZXJ0eS4NCj4+DQo+PiBPVE9IIGEgbmV3IFZJUlFfRE9NX0VYQyBv
d25lciB3aWxsIHJlc3VsdCBpbiBhIGNvbXBsZXRlIHJlc2V0IG9mIHRoZSBiaXRtYXANCj4+
IGFueXdheSAodGhhdCBpczogdGhlIGJpdHMgZm9yIGFsbCBleGlzdGluZyBkb21haW5zIHdp
bGwgYmUgc2V0LCB3aGlsZSBhbGwNCj4+IG90aGVycyB3aWxsIGJlIGNsZWFyZWQpLg0KPiAN
Cj4gWWVzLCB3aGlsZSB3cml0aW5nIG15IHJlcGx5IEkgd29uZGVyZWQgd2hldGhlciBJIHNo
b3VsZCBtZW50aW9uIHRoYXQuIFRvIGtlZXANCj4gdGhpbmdzIGEgbGl0dGxlIG1vcmUgc2lt
cGxlLCBJIGRpZG4ndC4gUGx1cyBmb3IgdGhpcyBhc3BlY3QgdGhlIGxhc3Qgc2VudGVuY2UN
Cj4gb2YgbXkgZWFybGllciByZXBseSBhbHNvIGFwcGxpZXMuDQoNCkkgYmVsaWV2ZSBmbGFz
ayBzZXR0aW5ncyBjYW4gYmUgY2hhbmdlZCwgcmlnaHQ/DQoNCklmIHNvLCBjbGVhcmluZyB0
aGUgYml0IHdvdWxkIGJlIGFmZmVjdGluZyB0aGUgc2NlbmFyaW8gd2hlcmUgdGhlIFZJUlFf
RE9NX0VYQw0KaXMgTk9UIGNoYW5nZWQsIGJ1dCB0aGUgZmxhc2sgc2V0dGluZ3MgYXJlIHVw
ZGF0ZWQgdG8gYWxsb3cgaXQgb2J0YWluaW5nIGluZm8NCmFib3V0IGQuDQoNCg0KSnVlcmdl
bg0KDQo=
--------------We50DAE6mZsSBYx5UcxiQJoB
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------We50DAE6mZsSBYx5UcxiQJoB--

--------------Jeuqcxlt1tCQ5sZLkJ7N1Dci--

--------------lSNMTYhfEJZeV2m89XtxJhnW
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmmW8kIFAwAAAAAACgkQsN6d1ii/Ey/o
vgf+MAm7k39sNRDkRuinN+z60qt39bjl8PeBLusLPb6ZdecvsxrBzzB/YSEtWPJjnZvSsPvXbNja
s9V1p1mQJLx5sr8F2hWAl3v36zZKQER/QWBpqffUdoYBT3RzU1wcJ+ayaavreJ+Asp7fzwOfRg4u
KCm4JoiUm8pg4gKb/pWCUBqmlHloWkBonktAfCFPOXAZB7kZjFViL2D7n8reOvqubk1LYvDg2apH
qIVGHO+tZ2hZ/lvb1FO2vrYl0/hjB3pm9InMihbXIA/CqHeNKxeX0iP5Ewy8A7fNm7E3UZgIFrwO
Ez2+Nn2cOBFhUaCY2FJrrWPH+SKnp42hRQ+FcAKu4A==
=K4pf
-----END PGP SIGNATURE-----

--------------lSNMTYhfEJZeV2m89XtxJhnW--

