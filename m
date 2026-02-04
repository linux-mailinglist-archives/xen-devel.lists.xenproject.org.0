Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wEoLFzEZg2n+hgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 11:02:25 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6DBE438D
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 11:02:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1220329.1529039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnZhR-0003BM-DB; Wed, 04 Feb 2026 10:01:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1220329.1529039; Wed, 04 Feb 2026 10:01:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnZhR-00039v-9C; Wed, 04 Feb 2026 10:01:29 +0000
Received: by outflank-mailman (input) for mailman id 1220329;
 Wed, 04 Feb 2026 10:01:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yHEP=AI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vnZhO-00039p-Tx
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 10:01:27 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76969848-01b0-11f1-9ccf-f158ae23cfc8;
 Wed, 04 Feb 2026 11:01:24 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b8849dc12f6so951883566b.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Feb 2026 02:01:24 -0800 (PST)
Received: from ?IPV6:2a00:12d0:af5b:2f01:4042:c03:ce4d:a5a1?
 (2a00-12d0-af5b-2f01-4042-c03-ce4d-a5a1.ip.tng.de.
 [2a00:12d0:af5b:2f01:4042:c03:ce4d:a5a1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8e9fef0011sm106407466b.32.2026.02.04.02.01.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Feb 2026 02:01:23 -0800 (PST)
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
X-Inumbo-ID: 76969848-01b0-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770199284; x=1770804084; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XJHK94ukL1n2dsYoD8K9jye5m+VlF36ZzcB48HzGLz0=;
        b=EYmfeyYFSzgiNi5X3h95qGvdnrJOAokFkJEpqwbW4vQdpXbOicBq12vDbp+cgIU810
         5oomWEFCJl+CNws1ltw1yYerIl7bvaAGlNE0OdL+cJUxNENJbPzWQWn1vZU4hYnAS1bI
         xnUpElpLHjojaAn62s8RTNx5BMy7/vU6WUjQ8rd9SSGtLwkal3nhctsv0PsTksJJ88pN
         agxwy9Nb3NlzDC2CqpJeycF5gV22WILCxhavHMsfEqfz32oy34MAzNZiZZSRhMr/+eer
         ZoMeqhmEpZoAYCgjrSN1/w60ou8yXDHyjfMQs4LVg2AizVjQReyzEKwb9W4O7LUcbKXd
         ZZfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770199284; x=1770804084;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XJHK94ukL1n2dsYoD8K9jye5m+VlF36ZzcB48HzGLz0=;
        b=vuIU1oDC71dPEZj3d9sCuEUMMJi4xg+4PfOcXZ0gW+SH7x++bpYoCARRRRDbSIqcHG
         d09fzDN+a/EQS74XcfaFUIapAnIDrZlTtDxGsxBUej4Zfddpf8Guk1b1tvfzEzEHbeeT
         lrgNlSmtC3t4dzrRQoEZjXR585ygM42Pg+qyYrOO8qGcQurT7d3TbaN0x9QAPzjgazxr
         bxGQSG1HuCEFn9SHj8cGC+akZ/IJ3R189QKoSaf3PgQXnVOVXG5CBUqXqrRfVqNqWVm3
         m7SkNffL9WQy6aU7pPqzQZTDUegK2+iRu7EDtwk0VCzBEUq4GGPSV/tTEzROHA6SD711
         YBGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvYIWoJY+iNNGPz91G8xXjX7pYTdvQwiV2QpCxp6K6zfwWh1DExil85y1lJu9vRELEJczvhlIYvq4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzVqRwuNweGfY2+YPGYMWLsb2ZbSiBpSo+4zad2EYW43NGSTF4H
	nxmyE2cpdtu52Jb/MJ2eh6z62DIIE+tTy/xUFpZd9Qr6tuOEGSf+8WYQBPcGF0yviLU=
X-Gm-Gg: AZuq6aJhNp7B3QM10ghWxkc2AbCthvzRPmv+pO/H0SvRl87+IjRYtVDzxe7aH9MhNnE
	OMWhJkVwdYkZL2Usbk63idW+eFzezL3PwTlIoYAT4/RFdnf2uendDDjEY/DktBltHTd8noghWot
	OzIO0qXrYsDncD4t7twzdb83znbO1KSI/Fvvp4UdGiA4YkOTRXamdGABZahis1pnGRkrDEuOmf/
	3RMSd0eN/8CD9LeZ06DHY5xxDEQAq0GEE0NR3dxCFcuROv8j7Vbnvpv4LmfD6wiypwbRLNQGjwE
	AtfBaFV+tdUT0eJ8JSQai438QmgcHK8kS/Mxm+Jyso3gHrytCnL+0Af46vSNIC/5k+dU9KqLhQC
	YIRoRr4Q01XGWe1+xLKCHvEVEDbhFHCMOw8RaSqpSiEQNEHeEabNuNlb0yPAPlTWqi3VTbsWy2o
	NFTggMXU0XA7ral7QHDoeUW1ZCIUZEEyb9IXJMNknILSXrdnbwFsGbiDryIOvqcF+OYguHogl6v
	f6pfcydyNuZvZv1dPVZ5cBCN9+tBXwwJI5jJw==
X-Received: by 2002:a17:907:960d:b0:b74:984c:a3de with SMTP id a640c23a62f3a-b8e9f08317emr196609166b.28.1770199283549;
        Wed, 04 Feb 2026 02:01:23 -0800 (PST)
Message-ID: <f52c72ee-0579-4ec9-95d1-57c26eb21b6c@suse.com>
Date: Wed, 4 Feb 2026 11:01:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] xen/domain: introduce DOMID_ANY
To: Jan Beulich <jbeulich@suse.com>
Cc: dmukhin@xen.org, xen-devel@lists.xenproject.org,
 andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, sstabellini@kernel.org, dmukhin@ford.com,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20260109140747.195460-2-dmukhin@ford.com>
 <aYL6Bt3Cs3HgeMPm@Mac.lan> <0e3a1af4-d87c-405c-a0a7-598929df3f4b@suse.com>
 <aYMKk9YtrR7NOKyt@Mac.lan> <cef81f1b-4348-43a1-a146-dfc57437a97a@suse.com>
 <e31a8309-a963-4084-913b-39af9222eb2e@suse.com>
 <36537370-1fe3-45e8-9790-852d73f93e07@suse.com>
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
In-Reply-To: <36537370-1fe3-45e8-9790-852d73f93e07@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------4x0hg2b3OAVh5lPhWK37SVJD"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.08 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:dmukhin@xen.org,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:julien@xen.org,m:michal.orzel@amd.com,m:sstabellini@kernel.org,m:dmukhin@ford.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	DKIM_TRACE(0.00)[suse.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	HAS_ATTACHMENT(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: BE6DBE438D
X-Rspamd-Action: no action

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------4x0hg2b3OAVh5lPhWK37SVJD
Content-Type: multipart/mixed; boundary="------------8piz3JPyrZ9onQbCHtl1TN0F";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: dmukhin@xen.org, xen-devel@lists.xenproject.org,
 andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, sstabellini@kernel.org, dmukhin@ford.com,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Message-ID: <f52c72ee-0579-4ec9-95d1-57c26eb21b6c@suse.com>
Subject: Re: [PATCH v4] xen/domain: introduce DOMID_ANY
References: <20260109140747.195460-2-dmukhin@ford.com>
 <aYL6Bt3Cs3HgeMPm@Mac.lan> <0e3a1af4-d87c-405c-a0a7-598929df3f4b@suse.com>
 <aYMKk9YtrR7NOKyt@Mac.lan> <cef81f1b-4348-43a1-a146-dfc57437a97a@suse.com>
 <e31a8309-a963-4084-913b-39af9222eb2e@suse.com>
 <36537370-1fe3-45e8-9790-852d73f93e07@suse.com>
In-Reply-To: <36537370-1fe3-45e8-9790-852d73f93e07@suse.com>
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

--------------8piz3JPyrZ9onQbCHtl1TN0F
Content-Type: multipart/mixed; boundary="------------4gKgp89DJ2WzZFojYGO4JJ0k"

--------------4gKgp89DJ2WzZFojYGO4JJ0k
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDQuMDIuMjYgMTA6NTEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNC4wMi4yMDI2
IDEwOjI1LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMDQuMDIuMjYgMTA6MTUsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDA0LjAyLjIwMjYgMTA6MDAsIFJvZ2VyIFBhdSBN
b25uw6kgd3JvdGU6DQo+Pj4+IE9uIFdlZCwgRmViIDA0LCAyMDI2IGF0IDA4OjU2OjEwQU0g
KzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+Pj4gT24gMDQuMDIuMjAyNiAwODo0OSwg
Um9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+Pj4+PiBBbHNvLCBJIHdvdWxkIHJlbW92ZSB0
aGUgdG9vbHMgZ3VhcmRzLCBJIHRoaW5rIG9uY2UgYSBET01JRF8gY29uc3RhbnQNCj4+Pj4+
PiBpcyBhbGxvY2F0ZWQgaXQgYmVjb21lcyBwYXJ0IG9mIHRoZSBwdWJsaWMgQUJJLCBhbmQg
aXQgY2Fubm90IGJlDQo+Pj4+Pj4gd2l0aGRyYXduLiAgU2VlIGZvciBleGFtcGxlIERPTUlE
X0lETEU6IGl0J3Mgb25seSB1c2VkIGludGVybmFsbHkgaW4NCj4+Pj4+PiB0aGUgaHlwZXJ2
aXNvciBBRkFJQ1QsIHlldCB0aGUgZGVmaW5lIGlzIGZ1bGx5IHZpc2libGUgaW4gdGhlDQo+
Pj4+Pj4gaGVhZGVycy4NCj4+Pj4+DQo+Pj4+PiBJdCB3YXMgbWUgdG8gYXNrIGZvciBpdCB0
byBiZSBndWFyZGVkIGxpa2UgdGhpcy4gRE9NSURfSURMRSAoYW5kIHBlcmhhcHMNCj4+Pj4+
IG90aGVycykgbm90IGJlaW5nIGd1YXJkZWQgKGF0IGxlYXN0IGZvciBJRExFOiBieSBqdXN0
IF9fWEVOX18pIGltbyB3YXMgYQ0KPj4+Pj4gbWlzdGFrZS4gVGhhdCBtaXN0YWtlIG1heSBp
biBmYWN0IGJlIGNvcnJlY3RhYmxlLCBpZiB3ZSBjb3VsZCBwcm92ZSB0aGF0DQo+Pj4+PiB0
aGUgSUQgY2Fubm90IHVzZWZ1bGx5IGJlIHBhc3NlZCBpbnRvIGFueXdoZXJlLg0KPj4+Pg0K
Pj4+PiBFdmVuIGlmIGl0J3Mgbm90IHBhc3NlZCBpbnRvIGFueXRoaW5nLCBkb2VzIGl0IG1h
a2Ugc2Vuc2UgdG8gZ3VhcmQNCj4+Pj4gdGhlbT8gIFRoZSByZXNlcnZlZCBkb21pZCB2YWx1
ZXMgYXJlIGFscmVhZHkgY29uc3VtZWQsIGllOiBjYW5ub3QgYmUNCj4+Pj4gcmV1c2VkIGlu
IGFueSB3YXkuICBJdCBqdXN0IHNlZW0gdG8gbWUgbGlrZSBtb3JlIGlmZGVmZXJ5IGNodXJu
IGZvciBubw0KPj4+PiBzcGVjaWZpYyBiZW5lZml0Lg0KPj4+DQo+Pj4gV2VsbC4gRnJvbSBh
biBhYnN0cmFjdCBwZXJzcGVjdGl2ZSwgcHVyZWx5IGh5cG90aGV0aWNhbCBhdCB0aGlzIHBv
aW50LCBJDQo+Pj4gY291bGQgc2VlIGEgcG90ZW50aWFsIG5lZWQgdG8gcmUtbnVtYmVyIHRo
ZW0sIGUuZy4gdG8gc2ltcGxpZnkgY2hlY2tpbmcNCj4+PiBhZ2FpbnN0IGdyb3VwcyBvZiB0
aGVzZSBzcGVjaWFsIElEcy4NCj4+Pg0KPj4+IFllcywgZXhjZXNzICNpZmRlZi1hcnkgaXMg
YW4gaXNzdWUuIEV4Y2VzcyBleHBvc3VyZSBvZiB0aGluZ3MgYWxzbyBpcywNCj4+PiB0aG91
Z2guIEZpbmRpbmcgdGhlIHJpZ2h0IGJhbGFuY2UgYmV0d2VlbiBib3RoIGNhbiBiZSBpbnRl
cmVzdGluZy4NCj4+DQo+PiBJIGhhdmUgYSBwYXRjaCBpbiB3b3JrIHdoaWNoIHdvdWxkIHdh
bnQgRE9NSURfQU5ZIG5vdCBiZSBndWFyZGVkLiBJIHRoaW5rDQo+PiBlc3BlY2lhbGx5IERP
TUlEX0FOWSBjb3VsZCBiZSB1c2VmdWwgZm9yIG90aGVyIGNhc2VzLCB0b28uDQo+IA0KPiBN
aW5kIG1lIGFza2luZyB3aGVyZSwgb3V0c2lkZSBvZiB0aGUgdG9vbHN0YWNrLCB5b3UgaW50
ZW5kIHRvIHVzZSBpdD8NCg0KSSdkIGxpa2UgdG8gYmUgYWJsZSB0byB1c2UgaXQgZm9yIFhl
bnN0b3JlIHBlcm1pc3Npb25zLg0KDQpQcmltYXJ5IHVzZSBjYXNlIHdvdWxkIGJlIHRvIGFs
bG93IHRoZSBzcGVjaWFsIHdhdGNoZXMgZm9yIGRvbWFpbiBjcmVhdGlvbg0KYW5kIHJlbW92
YWwgdG8gYmUgdXNhYmxlIGZvciBhbGwgZ3Vlc3RzLCBidXQgdGhlcmUgbWlnaHQgYmUgdXNl
IGNhc2VzIHdoZXJlDQphIGRvbVUgd2FudHMgdG8gZ2l2ZSBub2RlIHJlYWQgYWNjZXNzIGZv
ciBldmVyeW9uZS4NCg0KDQpKdWVyZ2VuDQo=
--------------4gKgp89DJ2WzZFojYGO4JJ0k
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------4gKgp89DJ2WzZFojYGO4JJ0k--

--------------8piz3JPyrZ9onQbCHtl1TN0F--

--------------4x0hg2b3OAVh5lPhWK37SVJD
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmmDGPIFAwAAAAAACgkQsN6d1ii/Ey8N
fAf/dAip2kUNJCY6limktZZOrWZIPvFcxoVi0kZUq7FzJjzGIm963q3zN5OgQFQprcyah/scnfrB
ore5GtNlplcJc83We4oyC1ghpqrBfjrrhEdRd9QVHOMMMDJnw+IbZ4RyQz3I8Nlj8oCLH9cPhK7h
gkH9WMrn4PxA1fMLSCe8GpM7+MRdExnhGp7zjUiu3ycMIuXML9hnOy2vJPBBx26gW4CpUj9bt5lU
/g3uugTaX5DsdhD7WLLDXGKAbVxK8TtVMMUxaQ/afQHgcpZU/Ha5TASWXMo1ZdX30/zj5kpB6GTK
26l8/pxHFksE/Dba98ZRz7Qfwu+GtVnr930Drx49bw==
=JQmw
-----END PGP SIGNATURE-----

--------------4x0hg2b3OAVh5lPhWK37SVJD--

