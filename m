Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEcTGpId52mY4AEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 08:47:46 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A31D74371E8
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 08:47:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288316.1568595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF4tQ-0005Mu-21; Tue, 21 Apr 2026 06:47:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288316.1568595; Tue, 21 Apr 2026 06:47:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF4tP-0005Kf-VX; Tue, 21 Apr 2026 06:47:31 +0000
Received: by outflank-mailman (input) for mailman id 1288316;
 Tue, 21 Apr 2026 06:47:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wF4tO-0005Hs-2i
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 06:47:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wF4tL-00AVSJ-Q2
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 08:47:29 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 69e71d70-2eae-0a2a0a5409dd-0a2a450788d4-44
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 08:47:29 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 69e71d81-229c-0a2a45070019-d155dd33e0b4-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 08:47:29 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-43d0deb7ad5so3067316f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:47:29 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4cb135asm39127698f8f.6.2026.04.20.23.47.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Apr 2026 23:47:28 -0700 (PDT)
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
        d=suse.com; s=google; t=1776754049; x=1777358849; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=678q1i3pRlQ6ylqxWV10rzXOKtm/WiTRp9yCpjOlEiw=;
        b=D9KuhNdEEUqLc8eBtBtKijrcgid8zv5MjjEWmUvx9bdrx8JNdgSYVRGsjcaOeck9h9
         GFvDgOabcJ8jM6DOC57T/cedug7rywlmjNru2seQdp5ee4QUq6TgnXyuD4+SDDv6bg8V
         YG6Fnmv4RXcO8O81cMhPQbS7UpQJcXhMiDduN20BhWh+ONPuwDLdOyvFLun86eHdce5J
         kZOHAWY79EulLRfTBBVepUsCqh62tQL3JQpPe07IsV2EiS/QwENL6K8xjtU2TvYipHKr
         UDc3WmipyPvfseiiyL3SZLCWQdgHUGn2vcq8QZlE5zI4DkEQ6586ZpiVLjY/ZqnF7+2c
         NUAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776754049; x=1777358849;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=678q1i3pRlQ6ylqxWV10rzXOKtm/WiTRp9yCpjOlEiw=;
        b=MaoW96q5yR6CPAIa/xiUDJ2xawsW9c6ooE/7EC3akarIaEGvacmC/uxpA+0v1mU0Hg
         Rw5lbMGHjldPw8R3VVFngmazNySxp8rzqHc16SR8erp8QYtE4/hv+BbCgkb3VtPzu5Z+
         j+uUrZhGxn/LrnunIP2JL4e8p3rRrTyvKdDaxePEcYWO+XA9YQHnEJ455UbojHg3D8uD
         1hsrkQ6MX+OoxmTme0ZDSkLto+Q0xpy9FacalDzaKDLNucK2aYE3BzApKP6SdW6ZUuxD
         Xl0LNoq/9TVcw/fPsGv7N2BCNhOgG7mHNkVtFqmwZbfCZzVk/NP4BOkrRONsJLusZvtf
         mhEg==
X-Forwarded-Encrypted: i=1; AFNElJ9gwZUHbqDPZkooLVI26u/HAZ7rhRpDpjFo5OYTpCy1zhRZ9/y5K9zH3FvzU3N//pUCJku5hIjAwOU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyVIgUv/FkGlSD19SasW08ypTbSpleBM8tgDrNpAAw1xAxLZf2q
	jjHQSpFvxBSKAmTa1+U/xbYfpt5LqjVt2TumFHgY4+RJNpFQh6PnWmiSJATO0aLfkOO0yEAIUCl
	oZfM6gQc=
X-Gm-Gg: AeBDieutaGIRRBFk3V7RuLxa09FJ44jxvuMKgTQ5+0GCVMoOeeIlOf/GhTGWFWaE/hq
	QESUmWH6eTOKYY2twqxMQr3/o4Kx4km+jFZjDd9jY80DWET8pCje4bEjOcqfcv4uBVrUKVW8qNU
	dHJzfxa0UbtZ7KFweZAD1bwFOMNl/DATVQFIRcIxRU7JgBC4vFhNirwhNl8vcFSpBtlVQeiWouh
	EP4+HGJw5RLLYFcldr6duP2fZRHfL55WSPJ7Lo8fSqko9+crnWAH6YjQMbhTG+ATQdlB7fRcCps
	PZyQ/V97Mf1AgrQyOQJNXFUjTamaR8yaVBSsGzDCXcAjTXr6IW2vviUj/+DsdsMOZTdUcdPBJHo
	9NM5urejHUI5cTF8oeNATMnvE3DONC/70W1559oOmZNRQTJKe70ZxCOj5BYcQz2xW18Rq4W5VU5
	D2k+mHL7iRnP3+/Yfn5/oiyFOBZnUuXNmghfBMV+JtqjiOFl6oCEjTFhFBM1lMbsteUUqrjv/jT
	/2xHmmhvlC2p+aqmO+xEXjboRGVTd4rPp2LxPIBAZMYl6ECkK7gA99bl93mH424
X-Received: by 2002:a05:6000:186c:b0:43d:73de:abce with SMTP id ffacd0b85a97d-43fe3e0a96cmr25901898f8f.32.1776754048447;
        Mon, 20 Apr 2026 23:47:28 -0700 (PDT)
Message-ID: <4e887b1a-dd26-4a9e-b717-6b6760dc97d4@suse.com>
Date: Tue, 21 Apr 2026 08:47:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] tools/xenstored: allow domU to get own features
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20260313074751.2904215-1-jgross@suse.com>
 <20260313074751.2904215-2-jgross@suse.com>
 <d0f9b670-49e1-4e06-bfdc-4847db790cbc@amd.com>
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
In-Reply-To: <d0f9b670-49e1-4e06-bfdc-4847db790cbc@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------gZQevFdlNm10dsOQUBwVI3vL"
X-purgate-ID: tlsNG-ef75cf/1776754049-AF374C48-138582C5/0/0
X-purgate-type: clean
X-purgate-size: 11249
X-Spamd-Result: default: False [-2.42 / 15.00];
	SIGNED_PGP(-2.00)[];
	R_MIXED_CHARSET(0.67)[subject];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,suse.com:email,suse.com:dkim,suse.com:mid];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A31D74371E8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------gZQevFdlNm10dsOQUBwVI3vL
Content-Type: multipart/mixed; boundary="------------ZcIBfm0WIf1jAdgox2KmiBmc";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <4e887b1a-dd26-4a9e-b717-6b6760dc97d4@suse.com>
Subject: Re: [PATCH 1/8] tools/xenstored: allow domU to get own features
References: <20260313074751.2904215-1-jgross@suse.com>
 <20260313074751.2904215-2-jgross@suse.com>
 <d0f9b670-49e1-4e06-bfdc-4847db790cbc@amd.com>
In-Reply-To: <d0f9b670-49e1-4e06-bfdc-4847db790cbc@amd.com>
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

--------------ZcIBfm0WIf1jAdgox2KmiBmc
Content-Type: multipart/mixed; boundary="------------22L0ZWjDSJ80g9M8EOOj0w4S"

--------------22L0ZWjDSJ80g9M8EOOj0w4S
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjAuMDQuMjYgMjM6MjgsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IE9uIDIwMjYtMDMt
MTMgMDM6NDcsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBFeHBhbmQgdGhlIFhTX0dFVF9G
RUFUVVJFIGNvbW1hbmQgdG8gYWxsb3cgYW4gdW5wcml2aWxlZ2VkIGRvbWFpbiB0bw0KPj4g
cmVhZCBpdHMgb3duIGF2YWlsYWJsZSBmZWF0dXJlcy4gV2hpbGUgdGhpcyBpbmZvcm1hdGlv
biBpcyBhdmFpbGFibGUNCj4+IHZpYSB0aGUgcmVsYXRlZCBmaWVsZCBpbiB0aGUgc2hhcmVk
IHBhZ2UgdXNlZCBmb3IgY29tbXVuaWNhdGlvbiB3aXRoDQo+PiBYZW5zdG9yZSwgdXNlciBs
YW5kIGNvbXBvbmVudHMgb2YgdGhlIGRvbVUgd291bGQgbmVlZCBzcGVjaWFsIHN1cHBvcnQN
Cj4+IGluIHRoZSByZWxhdGVkIGtlcm5lbCBkcml2ZXIgdG8gb2J0YWluIHRoYXQgZGF0YS4g
V2l0aCBzdXBwb3J0aW5nIHRoZQ0KPj4gWFNfR0VUX0ZFQVRVUkUgZm9yIHRoYXQgcHVycG9z
ZSwgb25seSBhbiB1cCB0byBkYXRlIGxpYnhlbnN0b3JlIGlzDQo+PiBuZWVkZWQuDQo+Pg0K
Pj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPj4g
LS0tDQo+PiDCoCBkb2NzL21pc2MveGVuc3RvcmUudHh0wqDCoCB8wqAgOSArKysrKy0tLS0N
Cj4+IMKgIHRvb2xzL3hlbnN0b3JlZC9jb3JlLmPCoMKgIHzCoCAzICstLQ0KPj4gwqAgdG9v
bHMveGVuc3RvcmVkL2RvbWFpbi5jIHwgMTYgKysrKysrKysrKystLS0tLQ0KPj4gwqAgMyBm
aWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkNCj4+DQo+
PiBkaWZmIC0tZ2l0IGEvZG9jcy9taXNjL3hlbnN0b3JlLnR4dCBiL2RvY3MvbWlzYy94ZW5z
dG9yZS50eHQNCj4+IGluZGV4IDRlY2NiYzJmN2YuLjhhMmMxOWQxMTYgMTAwNjQ0DQo+PiAt
LS0gYS9kb2NzL21pc2MveGVuc3RvcmUudHh0DQo+PiArKysgYi9kb2NzL21pc2MveGVuc3Rv
cmUudHh0DQo+PiBAQCAtNDI3LDEzICs0MjcsMTQgQEAgU0VUX0ZFQVRVUkXCoMKgwqDCoMKg
wqDCoCA8ZG9taWQ+fDx2YWx1ZT58DQo+PiDCoMKgwqDCoMKgIHRvIHNldCBhIGJpdCBmb3Ig
YSBmZWF0dXJlIG5vdCBiZWluZyBzdXBwb3J0ZWQgYnkgdGhlIHJ1bm5pbmcNCj4+IMKgwqDC
oMKgwqAgWGVuc3RvcmUgd2lsbCBiZSBkZW5pZWQuIFByb3ZpZGluZyBubyA8ZG9taWQ+IHdp
dGggdGhlDQo+PiDCoMKgwqDCoMKgIEdFVF9GRUFUVVJFIGNvbW1hbmQgd2lsbCByZXR1cm4g
dGhlIGZlYXR1cmVzIHdoaWNoIGFyZSBzdXBwb3J0ZWQNCj4+IC3CoMKgwqAgYnkgWGVuc3Rv
cmUuDQo+PiArwqDCoMKgIGJ5IFhlbnN0b3JlIGZvciB0aGUgZG9tYWluIGlzc3VpbmcgdGhl
IGNvbW1hbmQuDQo+PiDCoMKgwqDCoMKgIFNFVF9GRUFUVVJFIGZvciBhIGRvbWFpbiB3aWxs
IGJlIHJlamVjdGVkIGFmdGVyIHRoZSBJTlRST0RVQ0UNCj4+IC3CoMKgwqAgY29tbWFuZCBm
b3IgdGhpcyBkb21haW4gaGFzIGJlZW4gc2VudCB0byB4ZW5zdG9yZWQuDQo+PiArwqDCoMKg
IGNvbW1hbmQgZm9yIHRoaXMgZG9tYWluIGhhcyBiZWVuIHNlbnQgdG8geGVuc3RvcmVkLiBU
aGlzIGhhcyB0aGUNCj4+ICvCoMKgwqAgZWZmZWN0IHRoYXQgZG9tMCB3aWxsIGFsd2F5cyBo
YXZlIGFsbCBzdXBwb3J0ZWQgZmVhdHVyZXMgZW5hYmxlZC4NCj4gDQo+IFRoaXMgc3RhdGVt
ZW50Li4uDQo+IA0KPj4gLS0tIGEvdG9vbHMveGVuc3RvcmVkL2RvbWFpbi5jDQo+PiArKysg
Yi90b29scy94ZW5zdG9yZWQvZG9tYWluLmMNCj4+IEBAIC0xMjkzLDE3ICsxMjkzLDIzIEBA
IGludCBkb19nZXRfZmVhdHVyZShjb25zdCB2b2lkICpjdHgsIHN0cnVjdCBjb25uZWN0aW9u
IA0KPj4gKmNvbm4sDQo+PiDCoMKgwqDCoMKgIGNoYXIgKnJlc3VsdDsNCj4+IMKgwqDCoMKg
wqAgbl9hcmdzID0gZ2V0X3N0cmluZ3MoaW4sIHZlYywgQVJSQVlfU0laRSh2ZWMpKTsNCj4+
IC3CoMKgwqAgaWYgKG5fYXJncyA+IDEpDQo+PiAtwqDCoMKgwqDCoMKgwqAgcmV0dXJuIEVJ
TlZBTDsNCj4+IC3CoMKgwqAgaWYgKG5fYXJncyA9PSAxKSB7DQo+PiArwqDCoMKgIGlmICgh
bl9hcmdzKSB7DQo+PiArwqDCoMKgwqDCoMKgwqAgZmVhdHVyZXMgPSBjb25uLT5kb21haW4g
PyBjb25uLT5kb21haW4tPmZlYXR1cmVzDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgOiBYRU5TVE9SRV9GRUFUVVJFUzsNCj4gDQo+IC4uLiBjb3ZlciB0
aGlzLCB5ZXM/wqAgV2l0aCBhIHN0dWJkb20sIGRvbTAgd2lsbCBoYXZlIGNvbm4tPmRvbWFp
bi4gY29ubi0+ZG9tYWluLSANCj4gID5mZWF0dXJlcyBpcyBpbml0aWFsaXplZCB0byBYRU5T
VE9SRV9GRUFUVVJFUyBhbmQgY2Fubm90IGNoYW5nZS7CoCBQcm92aWRlZCB0aGF0IA0KPiBp
cyBjb3JyZWN0Og0KDQpUaGlzIGlzIGNvcnJlY3QuDQoNCj4gDQo+IFJldmlld2VkLWJ5OiBK
YXNvbiBBbmRyeXVrIDxqYXNvbi5hbmRyeXVrQGFtZC5jb20+DQoNClRoYW5rcywNCg0KDQpK
dWVyZ2VuDQoNCg==
--------------22L0ZWjDSJ80g9M8EOOj0w4S
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------22L0ZWjDSJ80g9M8EOOj0w4S--

--------------ZcIBfm0WIf1jAdgox2KmiBmc--

--------------gZQevFdlNm10dsOQUBwVI3vL
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmnnHX8FAwAAAAAACgkQsN6d1ii/Ey/2
Pgf+N/w3KQc5a5gg/4WEdn6VFUTwXynKccOv+R6YQREDWEib6ZabYJWmBiHT0ASH3lC7w8Uo8Fpf
mQQpGriaLne3Cl02SSgJAmNd+bF7M/2k8BLt3wqdTzxYxVtkoTyq41e+ITSkaeQjCF663qZNqNqf
JBF2xA2cxUtRybsTP+jrX24jfYVZkKTYN7/C2U+Y+iJSXfvbq/pCekH51ReRVge+VcCFmRmUmp+r
dbGWKdpiLNFHvwD6S+gEPoOIRXIUErCKlM8f3DoeAx65Qs9Q6WUfzjWs8KdkhhciYe9wiO+r36dZ
/4/UaseQxBqZMOsAxTReYyGfZs9FhKasNef0py5zWw==
=9W1+
-----END PGP SIGNATURE-----

--------------gZQevFdlNm10dsOQUBwVI3vL--

