Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IEWpLRSInWnBQQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 12:14:28 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7E8185F79
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 12:14:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239842.1541256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuqMB-0001Hr-8o; Tue, 24 Feb 2026 11:13:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239842.1541256; Tue, 24 Feb 2026 11:13:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuqMB-0001Ey-5B; Tue, 24 Feb 2026 11:13:35 +0000
Received: by outflank-mailman (input) for mailman id 1239842;
 Tue, 24 Feb 2026 11:13:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6gRX=A4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vuqM9-0001Es-R5
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 11:13:33 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9f9b4a4-1171-11f1-9ccf-f158ae23cfc8;
 Tue, 24 Feb 2026 12:13:31 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-65f73d68faeso260016a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Feb 2026 03:13:31 -0800 (PST)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65eaba1375dsm3353032a12.21.2026.02.24.03.13.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Feb 2026 03:13:30 -0800 (PST)
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
X-Inumbo-ID: d9f9b4a4-1171-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771931610; x=1772536410; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=h7K9r/SFNMchbVy3fk9vQLTjGEoLV0NuDbmHKRZEo+Q=;
        b=Cs4YBksIunWsYyhSRPS0OX7/QpqKSLuKPWPfYG0TQyrD9zhP0haZRlndlXuj53SOtx
         DcpThwGEhlP2TFLsHbBUEO8Y3MbugZgfKmKq7HdR6oOr8wbZoYi7T7JHVcko7wc92MEB
         UzQWlkkkUelTLQqFBu/LAFiiTTxkUwC4AKVPSfsC9YBbTvMCONOnXpeYR+tnCAxMCqYM
         wxAlbQI8hXtKFCRGH/6oxma1B7IkzuCzmKARDmWKPNV44NGIsrrwSS8ioMdPYpCvpMyH
         ibPkPpSSxtizphrIjoYppBgFnGLGD1eHVOG9GeIV7I/5ECVsAr0miP4Q3upaykeAyFAg
         R/tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771931610; x=1772536410;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h7K9r/SFNMchbVy3fk9vQLTjGEoLV0NuDbmHKRZEo+Q=;
        b=hlwiCMYuIIlvYTFimh12JkQq9n8Be8Cjw163NTS28lMjKBOAnJNBwpI0txMliZWI58
         McjjmTYnwWXRGR3cmBfzjOJmypj9QTghHK61B39RWTch/QMWiPfYharPGbQS6YgSxldA
         /J2uhGHfP1k2TXG7xSRmclgM70DmsoOC2CdUTZiMTbrbkmX7zI0Ll+Yy+mgRYvTsOuoM
         UWIc7uv5WhIBMTE+vk2sw0+2sNsK1lZHptW+QxB7zFW+lZZOzFs3Hc7WQtXdjIIgcbCr
         0vIDONpIXdnWtqvnkPfNOavBpfkz8YHgpHM9OzMuzgSa/C0e5Lq2uEBBCZfGq0MuX9L5
         ztPQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1NPUEflNPYtGHCC3buO52j5uPtT9Fwpk+ZapuUbTUpl9vZ8p13a8JIcHpQ4Wn2PdKSMEgRWXrhUA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzFAmId/z6+ChfPT0ysNTaiSriKs+fCeHeizIfHfrPLu74whQNQ
	3+xH0jXe/nz6NdtHTLfQhBd0OQOxbqe7uyTuMhW6e2S6T2jikJN2a0T/mHfW6uVlPjI=
X-Gm-Gg: ATEYQzz+W6Nutnuw98XgIMALlBzeHsWmt+Fh3qCzAktV7wD/lB93BIj4FSiZNpSYZYy
	3TBRmiXH199shL+ZChfjoFLwStbGS7x0W4QFGL3g6Qc3WgtJjOf0RfGRstGfJDB5opAglPUegeg
	ASNlMDs/pgh06Mx6JJEuwU122ypCUWDpbyXeQNUeVoP447kfuUISRIgAsl4WLeQ+dWZnh+1K0vo
	DLukABqRGwzVIyPZNggGhnuSAEEx25qd4CuhMageMWBpSl40geCq+N1FtD0NLk2RwykX9ulzZMU
	GggtrRGXmu0Nas8Yhg3MNMRtYmUyYuyzwg4VoLaLFfCBUtmkwLEBP0IqYmzhjYKC4YFJ0AVnU62
	U6rsW51l02oHdlAIstjo8nexRsuWqpwblzOpB15+GHdJHXTlGuXsWAmIZN6YsFGmlTipN4zPuj7
	E3joh8CY94BpXhZ2HKLaRGbf22hSM2luyv5rGjJOo2TQmupQ9m5tCXzdlmwH9QmLwigQ2B+s/1h
	Gax8FipVPnTyZqSxEoROYKiTkUdx/wcNMrb+hLnIpsCscJdAuxt3g==
X-Received: by 2002:a05:6402:4445:b0:65a:3655:9a05 with SMTP id 4fb4d7f45d1cf-65ea4ebf33amr4760876a12.7.1771931610431;
        Tue, 24 Feb 2026 03:13:30 -0800 (PST)
Message-ID: <1395c35e-0e2a-4eeb-addf-66f262ba0d91@suse.com>
Date: Tue, 24 Feb 2026 12:13:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] x86/xen: Consider Xen PVH support in CONFIG_XEN_PVHVM
To: Jan Beulich <jbeulich@suse.com>, Teddy Astie <teddy.astie@vates.tech>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <7b17bfbb4b25a59514707f91546ce8c3a24369e0.1771929804.git.teddy.astie@vates.tech>
 <3a08a2d0-a18f-40e1-b9bf-9b71e0c797c0@suse.com>
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
In-Reply-To: <3a08a2d0-a18f-40e1-b9bf-9b71e0c797c0@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Kf11xA0ozTVq0sXtf8haZz0V"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.37 / 15.00];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	R_MIXED_CHARSET(0.71)[subject];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:teddy.astie@vates.tech,m:boris.ostrovsky@oracle.com,m:oleksandr_tyshchenko@epam.com,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	HAS_ATTACHMENT(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 1D7E8185F79
X-Rspamd-Action: no action

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Kf11xA0ozTVq0sXtf8haZz0V
Content-Type: multipart/mixed; boundary="------------qfa6m4ZlcNkoswR7Fwstf6OK";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>, Teddy Astie <teddy.astie@vates.tech>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Message-ID: <1395c35e-0e2a-4eeb-addf-66f262ba0d91@suse.com>
Subject: Re: [RFC PATCH] x86/xen: Consider Xen PVH support in CONFIG_XEN_PVHVM
References: <7b17bfbb4b25a59514707f91546ce8c3a24369e0.1771929804.git.teddy.astie@vates.tech>
 <3a08a2d0-a18f-40e1-b9bf-9b71e0c797c0@suse.com>
In-Reply-To: <3a08a2d0-a18f-40e1-b9bf-9b71e0c797c0@suse.com>
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

--------------qfa6m4ZlcNkoswR7Fwstf6OK
Content-Type: multipart/mixed; boundary="------------7AcEWqxWp9nj6pCk07QDXHxv"

--------------7AcEWqxWp9nj6pCk07QDXHxv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMDIuMjYgMTI6MDEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyNC4wMi4yMDI2
IDExOjUxLCBUZWRkeSBBc3RpZSB3cm90ZToNCj4+IEl0J3MgY3VycmVudGx5IHBvc3NpYmxl
IHRvIGJ1aWxkIExpbnV4IHdpdGggQ09ORklHX1BWSHxDT05GSUdfWEVOX1BWSFZNDQo+PiBh
bmQgbm8gQ09ORklHX1hFTl9QVkguDQo+IA0KPiBJbiB3aGljaCBjYXNlLCBob3cgY2FuIHlv
dSBleHBlY3QgWGVuIFBWSCB0byB3b3JrPw0KDQpJIGFncmVlLiBTaW1pbGFyIHRvIGEga2Vy
bmVsIG5vdCB3b3JraW5nIHByb3Blcmx5IG9uIEFNRCB3aGVuIGNvbmZpZ3VyZWQNCnRvIHN1
cHBvcnQgSU5URUwgY3B1cyBvbmx5Lg0KDQo+IA0KPj4gVGhhdCBsZWFkcyB0byBpbmNvbnNp
c3RlbnQga2VybmVscyB0aGF0IGZhaWxzIHdpdGgNCj4+ICJNaXNzaW5nIHhlbiBQVkggaW5p
dGlhbGl6YXRpb24iIHdoZW4gYm9vdGluZyB1c2luZyBQVkggYm9vdCBtZXRob2Qgb3INCj4+
IGRpc3BsYXkgdmFyaW91cyBlcnJvcnMgYW5kIGZhaWwgdG8gaW5pdGlhbGl6ZSBYZW4gUFYg
ZHJpdmVycyB3aGVuIGJvb3RpbmcNCj4+IHdpdGggUFZILUdSVUIuDQo+Pg0KPj4gICAgICBw
bGF0Zm9ybV9wY2lfdW5wbHVnOiBYZW4gUGxhdGZvcm0gUENJOiB1bnJlY29nbmlzZWQgbWFn
aWMgdmFsdWUNCj4+ICAgICAgLi4uDQo+PiAgICAgICMgbW9kcHJvYmUgeGVuLWJsa2Zyb250
DQo+PiAgICAgIG1vZHByb2JlOiBFUlJPUjogY291bGQgbm90IGluc2VydCAneGVuX2Jsa2Zy
b250JzogTm8gc3VjaCBkZXZpY2UNCj4+ICAgICAgIyBtb2Rwcm9iZSB4ZW4tbmV0ZnJvbnQN
Cj4+ICAgICAgbW9kcHJvYmU6IEVSUk9SOiBjb3VsZCBub3QgaW5zZXJ0ICd4ZW5fbmV0ZnJv
bnQnOiBObyBzdWNoIGRldmljZQ0KPj4NCj4+IFdoZW4gYnVpbHQgd2l0aG91dCBDT05GSUdf
WEVOX1BWSCwgUFZILXNwZWNpZmljIGxvZ2ljIGlzIGRpc2FibGVkLCBoZW5jZSB3aGVuDQo+
PiBib290aW5nIHdpdGggZS5nIFBWSC1PVk1GLCBMaW51eCBhc3N1bWVzIHdlIGFyZSBhIEhW
TSBndWVzdCwgZXZlbiB3aGVuIHdlIGFyZW4ndA0KPj4gYWN0dWFsbHkgb25lIChpbiB0aGUg
IndpdGggSFZNIGVtdWxhdGVkIGRldmljZXMiIHNlbnNlKS4NCj4+DQo+PiBBcyBpdCBpcyBh
Y3R1YWxseSBwb3NzaWJsZSB0byBib290IFhlbiBQVkggd2l0aG91dCBDT05GSUdfUFZIOyBh
bmQgdGhhdCBtb3N0DQo+PiBYZW4tcmVsYXRlZCBsb2dpYyBleGlzdCB3aXRoaW4gQ09ORklH
X1hFTl9QVkhWTTsgY29uc2lkZXIgUFZIIGd1ZXN0cyBzdXBwb3J0DQo+PiB3aXRoaW4gQ09O
RklHX1hFTl9QVkhWTSBpbnN0ZWFkIG9mIENPTkZJR19YRU5fUFZILg0KPiANCj4gWEVOX1BW
SFZNIHNlcnZlcyBhIGRpZmZlcmVudCBwdXJwb3NlIHRob3VnaCwgaWlyYy4NCg0KSSBkb2Vz
Lg0KDQpDT05GSUdfWEVOX1BWSCBkZXBlbmRzIG9uIENPTkZJR19YRU5fUFZIVk0gZXhhY3Rs
eSBiZWNhdXNlIGEgbG90IG9mIHRoZQ0KbG9naWMgcmVxdWlyZWQgZm9yIFBWSCBtb2RlIHdh
cyBpbXBsZW1lbnRlZCBhcyBhIHBlcmZvcm1hbmNlIHR3ZWFrIG9mIEhWTQ0KdW5kZXIgdGhl
IENPTkZJR19YRU5fUFZIVk0gdW1icmVsbGEuDQoNCkluIGNhc2UgeW91IHdhbnQgdG8gYm9v
dCBhcyBhIHdvcmtpbmcgUFZIIGd1ZXN0LCB5b3UgbmVlZCBhIGtlcm5lbA0KY29uZmlndXJl
ZCB3aXRoIENPTkZJR19YRU5fUFZILiBJdCBpcyB0aGF0IHNpbXBsZS4NCg0KSXRzIGEgTkFD
SyBmcm9tIG1lLg0KDQoNCkp1ZXJnZW4NCg==
--------------7AcEWqxWp9nj6pCk07QDXHxv
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------7AcEWqxWp9nj6pCk07QDXHxv--

--------------qfa6m4ZlcNkoswR7Fwstf6OK--

--------------Kf11xA0ozTVq0sXtf8haZz0V
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmmdh9kFAwAAAAAACgkQsN6d1ii/Ey8N
zQf/aWOdTBwRo3TlDg3roX963oWe85siDtfIlJY2FZh3g2/tHmNwB+U0cPHlF5YZanq8BTjp8dpK
EemcL+WQiBKE+iUoJfAzeC+JRi9HuEHp/B+2ObhjUJVz4EN1IH7/tHOkhJoefoM3pwf4x1FtrGBJ
uGoc/hlztvbEX/P5gGh/fadoAG1oiL1InzV2ZqG/rJyIP1ndWbi/oZRliFU1BCGbs1zfbclxdALJ
B8R0kRoTY07NFVENqeRxiTM/FeicXtwBKyMNxwY5rnLoTm+8llrZ8J9TlXWKtlCyZngLNgStVvO7
QX9kteHqcOFsdzOzbVc7WI5bIiNigPWwpQUHjI2Tzw==
=go4l
-----END PGP SIGNATURE-----

--------------Kf11xA0ozTVq0sXtf8haZz0V--

