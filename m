Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WK5PDpNMfGlZLwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jan 2026 07:15:47 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CE3B795B
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jan 2026 07:15:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1217223.1526980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlhmB-0003WU-9a; Fri, 30 Jan 2026 06:14:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1217223.1526980; Fri, 30 Jan 2026 06:14:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlhmB-0003TP-6M; Fri, 30 Jan 2026 06:14:39 +0000
Received: by outflank-mailman (input) for mailman id 1217223;
 Fri, 30 Jan 2026 06:14:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/N7h=AD=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vlhm9-0003TJ-G0
 for xen-devel@lists.xenproject.org; Fri, 30 Jan 2026 06:14:37 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f038bdca-fda2-11f0-9ccf-f158ae23cfc8;
 Fri, 30 Jan 2026 07:14:30 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-b886fc047d5so322460866b.3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Jan 2026 22:14:30 -0800 (PST)
Received: from ?IPV6:2a00:12d0:af5b:2f01:4042:c03:ce4d:a5a1?
 (2a00-12d0-af5b-2f01-4042-c03-ce4d-a5a1.ip.tng.de.
 [2a00:12d0:af5b:2f01:4042:c03:ce4d:a5a1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8dbefc56e8sm367842766b.15.2026.01.29.22.14.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jan 2026 22:14:29 -0800 (PST)
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
X-Inumbo-ID: f038bdca-fda2-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769753670; x=1770358470; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=odLvTtll6kkmjgwy4IMUke75LnRrXnUGi25AXl2U3+g=;
        b=WXujBznd9jTgXWjFr29H9VvcPNWOpOkn4S8mniUjAw929jAG1mb5S8c69UTJAKiaD/
         Dta7MmLPk3EnePI5A+MHPSWW/AQWbdtOjkAZV6H2ga7eegFCCgWS1hOvlwCXeNplIbUo
         fR7CBNiwJ7xxjG/9TGPVVRAj5JPmi6NCm5k+m73Vip2INFdzWYB6KUrAW222Yfl9TXnF
         F7qM8v9uxSX8RTVTVmlYo58iqPBk1TiGtbqVKvQ8l2GnTJv7yfVorNA1xdxScBHCnvV+
         edboHa3yLkcDtHOGWyfSKoivEf9jpZc6QlZxnwStUyfQMOSJZCuPlQoK3bgMHTkSlUS2
         9IAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769753670; x=1770358470;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=odLvTtll6kkmjgwy4IMUke75LnRrXnUGi25AXl2U3+g=;
        b=NEWI7eHRff4YzZIRfyjUVDMUtFH7NrUlnpeCdOeDsQ0/NWlsRFh+1ePgBF+odDA21E
         NGi7IcY256xHbtwO7EnJpjA6v1vuz/wNHs82KdIZNoizSTrS3mpWcja8HsZvGLiDas+9
         d/0B6vEn9hC2kqbVyyoM5vprjf0+j+DcZ65P/exfXgztcmu3oeDUqVL7FcWrI0/UYaUb
         IuQSWa16RZv6sLFNHxjzbwKTKn/4yYaHbCzoTmC8JPkY70WhItOFRhOgB6WMfRjsnpUD
         6u7uKaW7LdQgk5k70RSV8jJoHIRRlutTlsROAutKZgFEpAUwnNV64aXoM9lRnX7JUSYV
         QXYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVltn4EZHLUsxdNfjOWU/LZf7cI1Dg4VjsgeVMiuUllleiOp7uzbTUySOi+xy1jI1oZvvfdEANW69A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxP9xNvBIJ46WwwazmFHbQ1xvPZDLITGf7x54pahXDDRsUT8Hol
	K2EE5yeX1XFCef8nJafUlT3RzRzINz7LUUytH1XfbMOg+KgrvUcWtw7uuBGBlZD8RKo=
X-Gm-Gg: AZuq6aJLyW1Tw8t+f7QMT8weNPmPfEEnHwO0GeRV1WBBhDh7zTufM7O+YMiQ1FGdicS
	JTNOORWghPrRwyKr4/j7cpJAxWXB94CEj6DWeBvZmGm3/wAAL5II7n+7p04i7MRU+tpra2LhjYi
	A5z29El4oImvTxPkxGSlQAey5c588M9S53o2HgbbyX7jNalZVKvinbeV0x2A13ARZ23XVehLRsw
	upsU9BMUi9u1yV7hd5jHTlMa0AVvkplbFWYDmdM3oHGRrm+aHgBQO9nLY1LBwEUKroOSLBqhKZv
	JAE5xih5QA8IP0yprFcdwyWGKRj6VI0MfgSWx8u3NBu0aBukgh3cqY0be7SZ7LdbjUATv2qI5PE
	SWeGQnzO9tn2nCLb96V1LhWnxfhSeSku4eKJaPqot+rzlqlQWI0W6l6/9EQEgQJMWRJ0wkiu/GK
	z8mnl53Pkdj41BfwAz2JZMkV0u+h5HXEkO/tcijJfsfhcDghCzQPsa/axlf7Sxqc5XXOfD3c9GE
	Mq/dy4UCtktp+fMeUUA/1F7ejK3p3goBnFeKg==
X-Received: by 2002:a17:907:3d56:b0:b88:626a:adbe with SMTP id a640c23a62f3a-b8dff21f20amr93965066b.0.1769753670260;
        Thu, 29 Jan 2026 22:14:30 -0800 (PST)
Message-ID: <83ae6264-bae0-4b04-81f0-8a7ede0b12d2@suse.com>
Date: Fri, 30 Jan 2026 07:14:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] xen/domain: introduce DOMID_ANY
To: dmukhin@xen.org, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
 julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
 sstabellini@kernel.org, dmukhin@ford.com
References: <20260109140747.195460-2-dmukhin@ford.com>
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
In-Reply-To: <20260109140747.195460-2-dmukhin@ford.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------oH0i10GgAQ7jZXiDxXnwQWSf"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.09 / 15.00];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	R_MIXED_CHARSET(1.00)[subject];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:dmukhin@xen.org,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dmukhin@ford.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,ford.com:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 73CE3B795B
X-Rspamd-Action: no action

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------oH0i10GgAQ7jZXiDxXnwQWSf
Content-Type: multipart/mixed; boundary="------------qQe5jbTlHEuJU8EX19oSioWV";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: dmukhin@xen.org, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
 julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
 sstabellini@kernel.org, dmukhin@ford.com
Message-ID: <83ae6264-bae0-4b04-81f0-8a7ede0b12d2@suse.com>
Subject: Re: [PATCH v4] xen/domain: introduce DOMID_ANY
References: <20260109140747.195460-2-dmukhin@ford.com>
In-Reply-To: <20260109140747.195460-2-dmukhin@ford.com>
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

--------------qQe5jbTlHEuJU8EX19oSioWV
Content-Type: multipart/mixed; boundary="------------Q5BHO6vhuX0BaCUYy50Rsz7g"

--------------Q5BHO6vhuX0BaCUYy50Rsz7g
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDkuMDEuMjYgMTU6MDcsIGRtdWtoaW5AeGVuLm9yZyB3cm90ZToNCj4gRnJvbTogRGVu
aXMgTXVraGluIDxkbXVraGluQGZvcmQuY29tPg0KPiANCj4gQWRkIGEgbmV3IHN5bWJvbCBE
T01JRF9BTlkgdG8gaW1wcm92ZSB0aGUgcmVhZGFiaWxpdHkgb2YgdGhlIGNvZGUuDQo+IA0K
PiBVcGRhdGUgYWxsIHJlbGV2YW50IGRvbWlkX2FsbG9jKCkgY2FsbCBzaXRlcy4NCj4gDQo+
IEFtZW5kczogMmQ1MDY1MDYwNzEwICgieGVuL2RvbWFpbjogdW5pZnkgZG9tYWluIElEIGFs
bG9jYXRpb24iKQ0KPiBTaWduZWQtb2ZmLWJ5OiBEZW5pcyBNdWtoaW4gPGRtdWtoaW5AZm9y
ZC5jb20+DQoNCkknbSByZWFsbHkgaGFwcHkgeW91IHdyb3RlIHRoaXMgcGF0Y2gsIGFzIEkn
bSB3b3JraW5nIG9uIGEgc2VyaWVzIGZvcg0KeGVuc3RvcmVkLCB3aGVyZSBJIG5lZWQgRE9N
SURfQU5ZLiBJIHdhcyBqdXN0IGFib3V0IHRvIGludHJvZHVjZSBzb21ldGhpbmcNCmxpa2Ug
dGhhdCBteXNlbGYuIDotKQ0KDQpSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3Nz
QHN1c2UuY29tPg0KDQoNCkp1ZXJnZW4NCg==
--------------Q5BHO6vhuX0BaCUYy50Rsz7g
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------Q5BHO6vhuX0BaCUYy50Rsz7g--

--------------qQe5jbTlHEuJU8EX19oSioWV--

--------------oH0i10GgAQ7jZXiDxXnwQWSf
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAml8TEQFAwAAAAAACgkQsN6d1ii/Ey+r
vQf/U0UrswGXJxUOdlHaozZtVmYmdaZMNv4Lxjc0V7ow6azzOYT1ek50wmUPVlV2Vx4+vE+mAxsn
djg1oRAKPCpDpd77YSKfcqgS8G0yoms+Dyx4bSYlUsJof8EQsXhco7rjfXo6x4NkIAk7G5SYLTQv
hNImgzfj+n3ApVRELyWWgLeMVuTAH8IkqtVEGJwBm7FBgiWYNN4GKYmxaU4irJL00BYg6K8cTN0b
X+xAq9WDubfLWLL7iri7UaN5nn4qBhvY39upNPZfujZ6cK543xGVx/8lY9MVk/7Z8qf2MxFmb7fb
qVaX0OGlzTLd8ycEaMzpblGaJnuaCnB0pKDaBW94wA==
=hTUf
-----END PGP SIGNATURE-----

--------------oH0i10GgAQ7jZXiDxXnwQWSf--

