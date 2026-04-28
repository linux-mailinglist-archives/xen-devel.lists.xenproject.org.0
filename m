Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGBzJOi38GkyXwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 15:36:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9EC485F99
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 15:36:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1296222.1572639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHiby-0008AO-4w; Tue, 28 Apr 2026 13:36:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1296222.1572639; Tue, 28 Apr 2026 13:36:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHiby-000886-2F; Tue, 28 Apr 2026 13:36:26 +0000
Received: by outflank-mailman (input) for mailman id 1296222;
 Tue, 28 Apr 2026 13:36:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wHibx-000880-6k
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 13:36:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHibu-00Grpf-Lb
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 15:36:24 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 69f0b7cd-bab6-0a2a0a5309dd-0a2a45098078-34
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 15:36:24 +0200
Received: from [209.85.218.44] (helo=mail-ej1-f44.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 69f0b7d6-2497-0a2a45090019-d155da2cdd93-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 15:36:22 +0200
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-b9358bc9c50so1520684466b.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 06:36:22 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bb89ffab9b3sm60186666b.42.2026.04.28.06.36.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Apr 2026 06:36:21 -0700 (PDT)
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
        d=suse.com; s=google; t=1777383382; x=1777988182; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yMTweACHPf2EqeECSCbR9ArNKBan1LGH5RaktMGo+50=;
        b=M7IbQ4mqp8+gNhzZ+rKUl5Oyf9U1hXbmzTQqKfAXjXb5Xa6FgXBcHxbwXaDry8fsX6
         B8Wicuy1w4Xbe8gwD+Kmgh9CDmrem0bK0MEHX9lwp70+eqFUdeelSwcxXa1OaEzMTJyb
         tBTV4dOmdPuGCqSJfdXnq6PQAcxp8CP0C8ayaeFDPX1oc93HEc0i2HGkczeXMd2kBYHD
         x73QpFETzjr7mJexOqTuBt0WjlKMs7Ru6d9khL/QMfggt83exOkxni+yKIwYEpvi2bqJ
         1HD29wxQD3Bw7lhBeu4eP1Ohy1nZQGF39rg9QdSCYwft4g3AAvZm7wGTIhPdlmVUyky0
         Bqfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777383382; x=1777988182;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yMTweACHPf2EqeECSCbR9ArNKBan1LGH5RaktMGo+50=;
        b=gz4i8x56TRMr/rQM1XpEbk0S4SqtGj4riGdHE4juYMsWOBl97aoctpJNKJnb4U9OMv
         osu2n2rTX/63D8T1Lkj66DZMNPJdlYok3yScz2nYzpNb+SLdCXLTwYWqs+JIknitMmnO
         uJH7scRBN3VuG8r9FW/1C5i/vk3Re7jy91lWfR4pA1FC1jKdnSc58L1spJq06sbohMPZ
         3oXvJhkrUxt/gcq8lRJOO3+O0am/BlPsSXEGoWLLq9ZaFfHldpzzgYi/K1YGI7QpNAYl
         FJE1Vi8e42AEKMLQXWrXNzmauQaio7XuYIQmwOtDnAa0tU0Ds1pZ35gDsMbSHFVCdATH
         p0hA==
X-Forwarded-Encrypted: i=1; AFNElJ/Skpr5MltQcmJPEqKgjEAo/XNqaYTSiHL2diPwbxGysfNYOol/vmsu+8G4YhR33gZaJ6R2Dqcwq4k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxScSVAgCXyIRNAGQzmaS6S5Xrxl7YgkOwovk8NG/ELrPbWV4hN
	e2rKSg8ZoAwvDW4nWkYcvMDcOBaeF+z4iSKPiP/ZLq9+kxWpcGGgJM7BOguZm4xgxl8hirVBTC5
	7H+DZpEk=
X-Gm-Gg: AeBDievFQenbSCzfGx8p4zJ7R71Cd6bD6cR1wvOdSmvSUFrE+BXk5DEssStcUjLFgxo
	Rau27+IQFem6TjbJ5v3o7YmV+uK+ySeBgDb/43l8wwpxTVw8YmOEWvaocqBEbn08M+pZDgNmdBr
	Rxklokh99VG6jT/Cjf3XC7faMRr5AXE9kPbVYlmIOfSbz2H1Acq8FqAkDlBlx7W1Tc2d7dshzKz
	xD9jiJW+Drvdx3WVNrO3eXOyqhIqvO8/wCO3LNRlu/v4wpOGvnSYVxfDUx8rAANnhbDuW94lArx
	zZrqAi3IrGx6CYwqfdVbB6MszmAfj+2fWrvj4zLGdOsmfMSRppkpVRumbZ7w8h2IXdT4KdDsEbt
	+xg0uJ+t5jTmHyVwx73lJ5Wc9TLe7KHVjoDdQdVFfTQE0VhuDurbzXTv6gbV79yKwjpYhfMZB2F
	ua0vch7Bo5r9WoBhGsy5NZczah5N1H9+lVp4+/qZgszSq/O5qy6agQRmARJr+GNWwHW8ZIZYmdR
	aL1L9Y42rQ8NF+8IfI+fqsmJVBKbK9bV0EQ0WL34vCcJraa/iWhcbqTVV0q+B4g
X-Received: by 2002:a17:907:3e97:b0:ba3:cacd:b9f6 with SMTP id a640c23a62f3a-bb8014e8a1emr186490466b.7.1777383381747;
        Tue, 28 Apr 2026 06:36:21 -0700 (PDT)
Message-ID: <ffc85ac6-2d32-48fe-a066-a8477fc085ff@suse.com>
Date: Tue, 28 Apr 2026 15:36:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] xen/public: introduce DOMID_ANY
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: dmukhin@ford.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20260423080840.530547-1-jgross@suse.com>
 <20260423080840.530547-2-jgross@suse.com>
 <bf54e159-c4ad-47e4-a6a8-574af834ac9f@amd.com>
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
In-Reply-To: <bf54e159-c4ad-47e4-a6a8-574af834ac9f@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------nltUoEkhYOgmBOpi0pCY6I7P"
X-purgate-ID: tlsNG-bad1c0/1777383382-93374A53-85D6C04F/0/0
X-purgate-type: clean
X-purgate-size: 9933
X-Rspamd-Queue-Id: DB9EC485F99
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.18 / 15.00];
	SIGNED_PGP(-2.00)[];
	R_MIXED_CHARSET(0.91)[subject];
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
	FORGED_RECIPIENTS(0.00)[m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,m:dmukhin@ford.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email,suse.com:email,suse.com:dkim,suse.com:mid];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------nltUoEkhYOgmBOpi0pCY6I7P
Content-Type: multipart/mixed; boundary="------------jANO70Zjy6aUD1NmQqph0f3U";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: dmukhin@ford.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <ffc85ac6-2d32-48fe-a066-a8477fc085ff@suse.com>
Subject: Re: [PATCH 1/4] xen/public: introduce DOMID_ANY
References: <20260423080840.530547-1-jgross@suse.com>
 <20260423080840.530547-2-jgross@suse.com>
 <bf54e159-c4ad-47e4-a6a8-574af834ac9f@amd.com>
In-Reply-To: <bf54e159-c4ad-47e4-a6a8-574af834ac9f@amd.com>
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

--------------jANO70Zjy6aUD1NmQqph0f3U
Content-Type: multipart/mixed; boundary="------------Ilfb87TlZHlws3P4BBinl6Wi"

--------------Ilfb87TlZHlws3P4BBinl6Wi
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjguMDQuMjYgMDA6MDAsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IE9uIDIwMjYtMDQt
MjMgMDQ6MDgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBBZGQgRE9NSURfQU5ZIHRvIHhl
bi9pbmNsdWRlL3B1YmxpYy94ZW4uaCBtZWFudCB0byBiZSBhIHdpbGRjYXJkIGZvcg0KPj4g
ZG9taWRzLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IERlbmlzIE11a2hpbiA8ZG11a2hpbkBm
b3JkLmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNl
LmNvbT4NCj4+IC0tLQ0KPj4gVGhpcyBpcyBiYXNlZCBvbiBEZW5pcyBNdWtoaW4ncyBwYXRj
aCAieGVuL2RvbWFpbjogaW50cm9kdWNlIERPTUlEX0FOWSIuDQo+PiBBcyBteSBzZXJpZXMg
aXMgYW5vdGhlciB1c2UgY2FzZSBmb3IgRE9NSURfQU5ZIGFuZCBpdCBpcyBhIGJhY2twb3J0
DQo+PiBjYW5kaWRhdGUsIEkndmUgc3BsaXQgb3V0IHRoZSBkZWZpbml0aW9uIG9mIERPTUlE
X0FOWSBmcm9tIERlbmlzJw0KPj4gcGF0Y2ggaW4gb3JkZXIgdG8gbWFrZSBwcm9ncmVzcyBm
b3IgbXkgc2VyaWVzLg0KPiANCj4gSSB0aGluayB3ZSBwcm9iYWJseSB3YW50IERlbmlzIGFz
IHRoZSBBdXRob3IsIHNpbmNlIHRoaXMgaXMgYW4gdW5tb2RpZmllZCBwaWVjZSANCj4gb2Yg
aGlzIHBhdGNoLg0KDQpBcGFydCBmcm9tIHRoZSBjb21taXQgbWVzc2FnZSwgeWVzLg0KDQpL
ZWVwaW5nIERlbmlzIGFzIHRoZSBhdXRob3IgaXMgZmluZSB3aXRoIG1lLg0KDQo+PiAtLS0N
Cj4+IMKgIHhlbi9pbmNsdWRlL3B1YmxpYy94ZW4uaCB8IDcgKysrKysrKw0KPj4gwqAgMSBm
aWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS94ZW4v
aW5jbHVkZS9wdWJsaWMveGVuLmggYi94ZW4vaW5jbHVkZS9wdWJsaWMveGVuLmgNCj4+IGlu
ZGV4IGIxMmZkMTBlNjMuLmYzNWE2ZjIxZjAgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vaW5jbHVk
ZS9wdWJsaWMveGVuLmgNCj4+ICsrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy94ZW4uaA0KPj4g
QEAgLTYwOCw2ICs2MDgsMTMgQEAgREVGSU5FX1hFTl9HVUVTVF9IQU5ETEUobW11ZXh0X29w
X3QpOw0KPj4gwqAgLyogRE9NSURfSU5WQUxJRCBpcyB1c2VkIHRvIGlkZW50aWZ5IHBhZ2Vz
IHdpdGggdW5rbm93biBvd25lci4gKi8NCj4+IMKgICNkZWZpbmUgRE9NSURfSU5WQUxJRMKg
wqDCoMKgwqDCoMKgIHhlbl9ta191aW50KDB4N0ZGNCkNCj4+ICsvKg0KPj4gKyAqIERPTUlE
X0FOWSBpcyB1c2VkIHRvIHNpZ25hbCBubyBzcGVjaWZpYyBkb21haW4gSUQgcmVxdWVzdGVk
Lg0KPj4gKyAqIEhhbmRsZXIgc2hvdWxkIHBpY2sgYSB2YWxpZCBJRCwgb3IgaGFuZGxlIGl0
IGFzIGEgYnJvYWRjYXN0IHZhbHVlDQo+IA0KPiBNYXliZSBzL2Jyb2FkY2FzdC93aWxkY2Fy
ZC8/DQoNClllcywgc291bmRzIGJldHRlci4NCg0KPiANCj4gRWl0aGVyIHdheToNCj4gDQo+
IFJldmlld2VkLWJ5OiBKYXNvbiBBbmRyeXVrIDxqYXNvbi5hbmRyeXVrQGFtZC5jb20+DQoN
ClRoYW5rcywNCg0KDQpKdWVyZ2VuDQo=
--------------Ilfb87TlZHlws3P4BBinl6Wi
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------Ilfb87TlZHlws3P4BBinl6Wi--

--------------jANO70Zjy6aUD1NmQqph0f3U--

--------------nltUoEkhYOgmBOpi0pCY6I7P
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmnwt9UFAwAAAAAACgkQsN6d1ii/Ey/o
YQf/aptfvUHNlJgz3tfSgx8JwLx6YZeraeTDo8sJEGNoXxAthkm0q98RVbQiy+p4sHBV55gEptnL
HvX+nFJUfaOnjvKU7xwZPhmn+H5NHtlyzAHX6kkyX7nnsKeKRaR0zJmi/nf38fw+WEaS6RFqSGwd
Jg0+b4DD8wbg+ffwxIDhrdn/NPsO9DB5nuKOn6UT/DoQdH0k962ZYN5dhMcT2i0CsBUEczaMQo65
tNk/eb6rcLqqmye2w6sc4Zny6ygqf38D1xFrw9Z30SF1vNR05yLB2v6Jhx6ut4Sur4aHOmczth7X
yyLf+moFn9TFwM6lHXqc+rRiOkhwDY6o4RfyVIhZLg==
=f82e
-----END PGP SIGNATURE-----

--------------nltUoEkhYOgmBOpi0pCY6I7P--

