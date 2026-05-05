Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WC/uOX3Y+WmbEgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 13:46:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 698E14CCE5C
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 13:46:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300583.1575122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKEDM-0007dW-QT; Tue, 05 May 2026 11:45:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300583.1575122; Tue, 05 May 2026 11:45:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKEDM-0007aS-Mq; Tue, 05 May 2026 11:45:24 +0000
Received: by outflank-mailman (input) for mailman id 1300583;
 Tue, 05 May 2026 11:45:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wKEDK-0007Zt-M5
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 11:45:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKEDK-00GG6A-2s
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 13:45:22 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 69f9d851-5cb7-0a2a0a5109dd-0a2a4508e4ca-2
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 13:45:21 +0200
Received: from [209.85.208.44] (helo=mail-ed1-f44.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 69f9d851-63b5-0a2a45080019-d155d02cc468-3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 13:45:21 +0200
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-67bc8609a9bso2330088a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 04:45:21 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-67cd91bc5b0sm351860a12.23.2026.05.05.04.45.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 May 2026 04:45:20 -0700 (PDT)
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
        d=suse.com; s=google; t=1777981521; x=1778586321; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dbkx0v7dVwi7AIE9c948PfZrrE8y6E3HRwqFQDjLoeA=;
        b=TqfiMh50gMpXZMomtASbnqIBBMhlQMsuyNnn6M5gnKuQ6tAHLqg/y5OspwVvFxOuUi
         Jl1CVcqwCJ/IJohYNWVY/HU4pxGYj9n2svje5f8nIP5f5S1ULVImFsD+jAPjgYq69s6R
         G8zz8/JgoSDkQTrXUPLb9LmZLWfB/h9JVo3Gq7Arqhpowi1NzBDb2WysanbTD7yrsCFJ
         rhXPFkP3Ue3Lamuk8xYLjW13m2S80mWIIIxePH4J6FoICGxTU/V3GP92O733+VV/rYem
         unca+M6IICX25Uxd8gjL2or1pxTfAdaYFrlRMgy8izqgd3hTNEDXxuoDpzI7D4iNMeP4
         lejw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777981521; x=1778586321;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dbkx0v7dVwi7AIE9c948PfZrrE8y6E3HRwqFQDjLoeA=;
        b=AxSAKWZVqS5USqpl5ex5KC+br+ozjl57BI92iWP8rqagO3brcxK8pMt9kDFNC+d7Sd
         /AhV6lJgdK/+8dda8jIHKzQxo0PU9BqL1RfzTTdwa03xTF2zMKy0NCagtG/rfRtWm+48
         GHD8cFYIV9s1IB/qxM1TcmitMDzESVDqZUN9xiUdkVoP+lhAOQfuQz5G61uTRROUEUY6
         N5rCRUb5vgb1aCHYb4WDM439BFJxMV76VLGMlwJXLOEOW4xvNATz1bHUSDwrNNiUiTkF
         ElfsPN3qYFn12C/s2ahAUo03NmvX9tNA2Ab6qFhDPDHxiRsRxWEpcW2rbubAYE8MN1Xa
         fIwQ==
X-Forwarded-Encrypted: i=1; AFNElJ9P+A4LgNylt0mBTxyGKmg9JZ58EJXABFrcWdENI5KeAz9Z7I6MW3Cj1swy8YES0Pf/sT17QYwfalg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyYkTHjSvCav3VLtdyqA32DwjOX03MWv3rmv/qZEoiN8YWfFq6O
	Tgtaai9sgwzoa8gCR/LYZxVS27qTADM6Nr92t55FO/1vEC8QYsn1N8lHYeWtGCOYbwk=
X-Gm-Gg: AeBDievRo+yc0FzEs9W8t9qW0Epm5pJumD0hwnLIrWxO4YGQaHQQyhQDtVMhW4j3jJ0
	FyliNBudXoKkgKbx743uD1RsbGpl9gA+o1mXXeUE8q5AWOlrtm6oqTi3SAeHAXRrm/nRSSRYvLp
	n02deyI9kP7tzlsHbi/saaspezueq61FuyUVJZ0gb4vxsRicofEp0mDFRduA2x0U+ZJ/EQWGaMM
	040txsbR1YOaKBvIXzS9fe7meYruyKtKrKiiaFWduJfh29uFla4PmgIWLZR0Cqe6mUosWfPtGKS
	4Hrutnjncgl4PsSvloFKG2iWbwixNLjuD85+KG/i8sgmQNrtpYnuU6W/KJ5qm0NK5/TC4TVS4bd
	6TosmXKTyXZftGU767Aa82GIg0mq5+v/53qDsnni6/tgVJo3+EL7Yno4TToYQCKb/DJazBYcs+A
	1gCRHpnsJG5UwEyO3HonQ0fvGdK8Pcm9GLUceAn98PumBbe/yNIvruZjpHbiVaREw8sTgJaaGxW
	yT5gJEbQcYJ6bgccw1g4+MJl7caUEZv5MJj63WqeTQC3ZaWBrZfQ3nAHEQiTraG
X-Received: by 2002:a05:6402:2786:b0:67b:4e46:f12f with SMTP id 4fb4d7f45d1cf-67ccc3790ecmr1419521a12.25.1777981521021;
        Tue, 05 May 2026 04:45:21 -0700 (PDT)
Message-ID: <598d6dfd-da1b-4b10-9c42-2bb1242b700d@suse.com>
Date: Tue, 5 May 2026 13:45:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/xen: Fix a potential problem in
 xen_e820_resolve_conflicts()
To: Jan Beulich <jbeulich@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, x86@kernel.org
References: <20260505080653.197775-1-jgross@suse.com>
 <6b241236-ed6d-4ada-beac-8f660bd55185@suse.com>
 <59b953ce-4b51-4a47-8dba-9895dea33d41@suse.com>
 <29422b34-b33f-4a25-838f-de6078151e46@suse.com>
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
In-Reply-To: <29422b34-b33f-4a25-838f-de6078151e46@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------aQ9DkZhYp2ID3woTprv8iofE"
X-purgate-ID: tlsNG-c1860d/1777981521-38D63DB1-33AD83C8/0/0
X-purgate-type: clean
X-purgate-size: 13676
X-Rspamd-Queue-Id: 698E14CCE5C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.32 / 15.00];
	SIGNED_PGP(-2.00)[];
	R_MIXED_CHARSET(0.77)[subject];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:boris.ostrovsky@oracle.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,m:x86@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid];
	DKIM_TRACE(0.00)[suse.com:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	HAS_ATTACHMENT(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.946];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------aQ9DkZhYp2ID3woTprv8iofE
Content-Type: multipart/mixed; boundary="------------l00BF6gHWOEUiAPRiNCkiIfR";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, x86@kernel.org
Message-ID: <598d6dfd-da1b-4b10-9c42-2bb1242b700d@suse.com>
Subject: Re: [PATCH] x86/xen: Fix a potential problem in
 xen_e820_resolve_conflicts()
References: <20260505080653.197775-1-jgross@suse.com>
 <6b241236-ed6d-4ada-beac-8f660bd55185@suse.com>
 <59b953ce-4b51-4a47-8dba-9895dea33d41@suse.com>
 <29422b34-b33f-4a25-838f-de6078151e46@suse.com>
In-Reply-To: <29422b34-b33f-4a25-838f-de6078151e46@suse.com>
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

--------------l00BF6gHWOEUiAPRiNCkiIfR
Content-Type: multipart/mixed; boundary="------------0D2AwGlbw3k5al2QDBS9ODDA"

--------------0D2AwGlbw3k5al2QDBS9ODDA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDUuMDUuMjYgMTI6MjQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNS4wNS4yMDI2
IDExOjEzLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0KPj4gT24gMDUuMDUuMjYgMTA6NDMsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDA1LjA1LjIwMjYgMTA6MDYsIEp1ZXJnZW4gR3Jv
c3Mgd3JvdGU6DQo+Pj4+IFdoZW4gZml4aW5nIGEgY29uZmxpY3QgaW4geGVuX2U4MjBfcmVz
b2x2ZV9jb25mbGljdHMoKSwgdGhlIGxvb3Agb3Zlcg0KPj4+PiB0aGUgRTgyMCBtYXAgZW50
cmllcyBuZWVkcyB0byBiZSByZXN0YXJ0ZWQsIGFzIHRoZSBFODIwIG1hcCB3aWxsIGhhdmUN
Cj4+Pj4gYmVlbiBtb2RpZmllZCBieSB0aGUgZml4LiBPdGhlcndpc2UgZW50cmllcyBtaWdo
dCBiZSBza2lwcGVkIGJ5DQo+Pj4+IGFjY2lkZW50Lg0KPj4+Pg0KPj4+PiBGaXhlczogYmUz
NWQ5MWM4ODgwICgieGVuOiB0b2xlcmF0ZSBBQ1BJIE5WUyBtZW1vcnkgb3ZlcmxhcHBpbmcg
d2l0aCBYZW4gYWxsb2NhdGVkIG1lbW9yeSIpDQo+Pj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJn
ZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4+Pg0KPj4+IEZpcnN0LCB3aGlsZSB0cnlp
bmcgdG8gcmV2aWV3IHRoaXMsIGlzbid0IHRoZXJlIGFub3RoZXIgaXNzdWUgaW4NCj4+PiB4
ZW5fZTgyMF9zd2FwX2VudHJ5X3dpdGhfcmFtKCksIGluIHRoYXQNCj4+Pg0KPj4+IAkJCWVu
dHJ5LT5hZGRyID0gZW50cnlfZW5kIC0gc3dhcF9zaXplICsNCj4+PiAJCQkJICAgICAgc3dh
cF9hZGRyIC0gc3dhcF9lbnRyeS0+YWRkcjsNCj4+Pg0KPj4+DQo+Pj4gcmVhbGx5IG1lYW5z
IHRvIGJlDQo+Pj4NCj4+PiAJCQllbnRyeS0+YWRkciA9IGVudHJ5X2VuZCAtIHN3YXBfc2l6
ZSArDQo+Pj4gCQkJCSAgICAgIHN3YXBfZW50cnktPmFkZHIgLSBzd2FwX2FkZHI7DQo+Pj4N
Cj4+PiAoYWZmZWN0aW5nIG5vbi1wYWdlLWFsaWduZWQgRTgyMCBlbnRyaWVzKT8NCj4+DQo+
PiBZZXMsIHlvdSBhcmUgcmlnaHQuDQo+Pg0KPj4+DQo+Pj4gRnVydGhlciwgdGhhdCBmdW5j
dGlvbiBjb252ZXJ0cyBzd2FwX2VudHJ5IHRvIHRoZSBwYWdlLWFsaWduZWQgc3VwZXJzZXQN
Cj4+PiBvZiB0aGUgcGFzc2VkIGluIHJhbmdlLiBIb3cgaXMgaXQgZ3VhcmFudGVlZCB0aGF0
IHRoaXMgbmV3IHJhbmdlIHdvbid0DQo+Pj4gb3ZlcmxhcCB3aXRoIHRoZSBwcmVkZWNlc3Nv
ciBhbmQvb3Igc3VjY2Vzc29yIG9uZT8gV291bGRuJ3QgdGhhdCBuZWVkDQo+Pj4gdG8gYmUg
Y29udmVyc2lvbiB0byB0aGUgcGFnZS1hbGlnbmVkIHN1YnNldCBpbnN0ZWFkPw0KPj4NCj4+
IFRoaXMgaXMgc3VidGxlLiA6LSkNCj4+DQo+PiBXZSBhcmUgY29udmVydGluZyB0byBSQU0g
KHVzYWJsZSksIHNvIHRoZSB0eXBlIHZhbHVlIGlzIDEuIGU4MjBfX3VwZGF0ZV90YWJsZSgp
DQo+PiB3aWxsIGhhbmRsZSBvdmVybGFwcyBqdXN0IGZpbmUsIHdpdGggaGlnaGVyIHR5cGUg
dmFsdWVzICJ3aW5uaW5nIiBhZ2FpbnN0IGxvd2VyDQo+PiBvbmVzLiBTbyBhbnkgb3RoZXIg
cmVnaW9uIG92ZXJsYXBwaW5nIHdpdGggdGhlIG5ldyBSQU0gcmVnaW9uIHdpbGwgcmVzdWx0
IGluDQo+PiBhbm90aGVyIGNvbmZsaWN0IGluIHRoZSBuZXh0IGxvb3AgaXRlcmF0aW9uLg0K
PiANCj4gT2gsIHdvdywgYW5kIHRoaXMgaXMgYSBwcm9wZXJ0eSBvZiB0aGUgZnVuY3Rpb24g
dGhhdCBvbmUgY2FuIHJlbHkgdXBvbj8NCg0KSXQgaXMgZG9jdW1lbnRlZCB0byBiZSBoYW5k
bGVkIHRoaXMgd2F5Lg0KDQo+PiBVc2luZyB0aGUgcGFnZS1hbGlnbmVkIHN1YnNldCB3b3Vs
ZCByZXN1bHQgaW4gcG9zc2libGUgbWVtb3J5IGhvbGVzLCB3aGljaCB3b3VsZA0KPj4gYmUg
cHJvYmxlbWF0aWMgKHRoZSBrZXJuZWwgb3IgcGFnZSB0YWJsZXMgc2hvdWxkbid0IGhhdmUg
aG9sZXMsIGFmdGVyIGFsbCkuDQo+IA0KPiBBcmVuJ3Qgc3VjaCBob2xlcyBub3JtYWwgdG8g
b2NjdXIsIGUuZy4gb24gbWlzYWxpZ25lZCBSQU0vVU5VU0FCTEUNCj4gYm91bmRhcmllcz8N
Cg0KVGhpcyBjYW4gaGFwcGVuLCB5ZXMsIGJ1dCBpdCBzaG91bGQgbm90IGJlIHRoZSBjYXNl
IGluIHRoZSBhcmVhIHdoZXJlIHRoZQ0Ka2VybmVsIGlzIGFjdHVhbGx5IGxvY2F0ZWQuDQoN
Cj4gDQo+Pj4gQW5kIHRoZW4sIGlzIHBhc3NpbmcgdGhlIHBhZ2UtYWxpZ25lZCBzdXBlcnNl
dCB0byB4ZW5fYWRkX3JlbWFwX25vbnJhbSgpDQo+Pj4gcmVhbGx5IGFwcHJvcHJpYXRlPyBX
aHkgd291bGQgYW55IGxlYWRpbmcgb3IgdHJhaWxpbmcgc3BhY2UgdGhlcmUgYmUNCj4+PiBz
dWJqZWN0IHRvIHJlbWFwcGluZz8NCj4+DQo+PiBIb3cgd291bGQgeW91IHdhbnQgdG8gcmVt
YXAgYSBzdWItcGFnZSBwaHlzaWNhbCBtZW1vcnkgYXJlYSB0byBhbm90aGVyIGxvY2F0aW9u
DQo+PiB3aXRob3V0IGFmZmVjdGluZyB0aGUgcmVzdCBvZiB0aGUgcGFnZT8gV2UgYXJlIHJl
d29ya2luZyB0aGUgZmluYWwgcDJtIG1hcCBoZXJlLg0KPiANCj4gV2VsbCwgZmlyc3QgYW5k
IGZvcmVtb3N0OiB4ZW5fYWRkX3JlbWFwX25vbnJhbSgpIHRha2VzIGFuZCBzdG9yZXMgYnl0
ZS0NCj4gZ3JhbnVsYXIgYWRkcmVzc2VzIC8gc2l6ZXMsIHdpdGggdGhlIHNvbGUgcmVxdWly
ZW1lbnQgYmVpbmcgdGhhdCB0aGUNCj4gb2Zmc2V0LWludG8tcGFnZSBiZSBpZGVudGljYWwg
YmV0d2VlbiBib3RoIGFkZHJlc3Nlcy4gVGhhdCBjaGVjayBhbG9uZQ0KPiBhbHJlYWR5IGlu
ZGljYXRlcyB0aGF0IG5vbi1wYWdlLWFsaWduZWQgYWRkcmVzc2VzIGFyZSBleHBlY3RlZCB0
byBiZQ0KPiBwYXNzZWQgaW50byBoZXJlLg0KDQpJJ2Qgc2F5ICJ0b2xlcmF0ZWQiIGluc3Rl
YWQgb2YgImV4cGVjdGVkIi4NCg0KPiBGdXJ0aGVyLCB4ZW5fYWNwaV9vc19pb3JlbWFwKCkg
dXNlcyB0aGUgcmVzdWx0aW5nIHJlbWFwIHRhYmxlLCBhbmQgaXMNCj4gYnl0ZSBncmFudWxh
ci4gV2l0aCB0aGUgcGh5c2ljYWwgYWRkcmVzcyBhZGp1c3RtZW50IHRoZXJlLCBib3RoIG1h
cHBpbmdzDQo+IGNvdWxkICh0aGVvcmV0aWNhbGx5KSBjb2V4aXN0LiBCdXQgdGhlIHByb2Js
ZW0gSSdtIHRyeWluZyB0byBwb2ludCBvdXQNCj4gaXMgdGhhdCBieSBwYXNzaW5nIHRoZSBw
YWdlLWFsaWduZWQgc3VwZXJzZXQgaW50byB4ZW5fYWRkX3JlbWFwX25vbnJhbSgpDQo+IHlv
dSBtaXNndWlkZSB4ZW5fYWNwaV9vc19pb3JlbWFwKCkgKHdoaWxlIGF0IHRoZSBzYW1lIHRp
bWUNCj4geGVuX2RvX3JlbWFwX25vbnJhbSgpIHdpbGwgZG8gc3VpdGFibGUgcm91bmRpbmcg
dG8gcGFnZSBib3VuZGFyaWVzIGV2ZW4NCj4gaWYgZXhhY3QgYWRkcmVzc2VzIHdlcmUgcGFz
c2VkKS4NCg0KQWgsIG9rYXksIG5vdyBJIHVuZGVyc3RhbmQgeW91ciBjb25jZXJuLg0KDQpJ
J20gb24gdGhlIGVkZ2Ugd2hldGhlciBhIGNoYW5nZSBpcyB3YW50ZWQgb3Igbm90LiBUaGUg
Y3VycmVudCBpbXBsZW1lbnRhdGlvbg0KaXMgY29ycmVjdCwgd2hpbGUgSSBhZ3JlZSB0aGF0
IHVzaW5nIG5vbi1wYWdlLWFsaWduZWQgYWRkcmVzc2VzIHNob3VsZCB3b3JrLg0KDQpPVE9I
IHVzaW5nIGEgc3VwZXJzZXQgaXMgZmluZSwgdG9vLiBFc3BlY2lhbGx5IGFzIHRoZSByZW1h
cCBpcyBkb25lIGJhc2VkIG9uDQptZW1vcnkgbWFwIGVudHJpZXMsIHdoaWxlIHRoZSBjYWxs
ZXIgb2YgeGVuX2FjcGlfb3NfaW9yZW1hcCgpIHdpbGwgYWN0IGJhc2VkDQpvbiBBQ1BJIHRh
YmxlIGVudHJpZXMuIEl0IGlzIHBlcmZlY3RseSBmaW5lIHRvIGhhdmUgbXVsdGlwbGUgTlZT
IHJlY29yZHMgaW4NCmFuIGFyZWEgY292ZXJlZCBieSBhIHNpbmdsZSBtZW1vcnkgbWFwIGVu
dHJ5LCBzbyBjYWxsaW5nIHhlbl9hY3BpX29zX2lvcmVtYXAoKQ0Kb25seSBmb3IgYSBwYXJ0
IG9mIGEgcmVtYXAgZW50cnkgaXNuJ3Qgd2VpcmQgYXQgYWxsLg0KDQpTbyB0aGUgaW1wbGVt
ZW50YXRpb24gbmVlZHMgdG8gZW5zdXJlIHRoYXQgYSByZW1hcCBlbnRyeSBpcyBhbGxvd2Vk
IHRvIGJlIGENCnN1cGVyc2V0IG9mIGFuIGFyZWEgbWFwcGVkIHZpYSB4ZW5fYWNwaV9vc19p
b3JlbWFwKCksIHJlc3VsdGluZyBpbiBubyBuZWVkIHRvDQptb2RpZnkgdGhlIGN1cnJlbnQg
Y29kaW5nLg0KDQpBcyB0aGlzIHdob2xlIGhhbmRsaW5nIHdhcyBhZGRlZCB0byBzdXBwb3J0
IGEgdmVyeSByYXJlIGNhc2UsIEknZCByYXRoZXIgbm90DQpyaXNrIHRvIGJyZWFrIHRoYXQg
Y2FzZSBieSBkb2luZyBjb3NtZXRpYyBjaGFuZ2VzLiBPVE9IIEkgd291bGRuJ3QgTkFDSyBh
IHBhdGNoLg0KDQoNCkp1ZXJnZW4NCg==
--------------0D2AwGlbw3k5al2QDBS9ODDA
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------0D2AwGlbw3k5al2QDBS9ODDA--

--------------l00BF6gHWOEUiAPRiNCkiIfR--

--------------aQ9DkZhYp2ID3woTprv8iofE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmn52FAFAwAAAAAACgkQsN6d1ii/Ey+C
5Qf7BeoIwlyhPgJtPsPgIISl0F7pv4Cfp/RxSj7ne0zughMgRIsC0Zf7HOR43eM3TCk/C3Qc5Jn7
IZXauw7nlHLq+shyBXxODwQXBSWs642WtF0Pne4berrSxtqQOQ7koSg74UQCmi+dIHR49gr2Ehtj
YcwpTXqA/BLMce8Azw31eEJrARrYk67Rcut1rCB2NToCIFgrGCXktlGzW6Cm3nTwvtKncDkD/Saz
4oNdxI4Pmibejes/akJwZL5X6yikWy/F7KmEEaXskIkPqD6LrdSkOb4SzQifAbJ7Ly9Tc99jq9ry
2KMyJSVWJBCV8tDeQiToAKedm/2afLSdAU5j8pGOJA==
=C6Jh
-----END PGP SIGNATURE-----

--------------aQ9DkZhYp2ID3woTprv8iofE--

