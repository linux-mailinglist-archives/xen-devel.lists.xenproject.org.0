Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFo3FMvg6GkHRQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 16:52:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 523B94478DB
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 16:52:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1290734.1570256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFYvv-000832-9W; Wed, 22 Apr 2026 14:52:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290734.1570256; Wed, 22 Apr 2026 14:52:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFYvv-00081Y-5m; Wed, 22 Apr 2026 14:52:07 +0000
Received: by outflank-mailman (input) for mailman id 1290734;
 Wed, 22 Apr 2026 14:52:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wFYvt-00081S-Cl
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 14:52:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFYvs-00FD4E-PN
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 16:52:04 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 69e8e085-bab6-0a2a0a5309dd-0a2a4506cadc-24
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 16:52:04 +0200
Received: from [209.85.208.54] (helo=mail-ed1-f54.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 69e8e094-7371-0a2a45060019-d155d036b050-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 16:52:04 +0200
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-67389cf78b0so9926077a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 07:52:04 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-672c480e31bsm3376184a12.11.2026.04.22.07.52.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Apr 2026 07:52:03 -0700 (PDT)
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
        d=suse.com; s=google; t=1776869524; x=1777474324; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZU3v2upR7Ya8ZiRWJFkhvr6VnE2YwbFdi4wsSfXJjoU=;
        b=ZCwxPvKOcOtSDhKzaZtJf6T1jVfVM05Vtr39xytQ/j2KRXOzPYfwTHxA2Fj/1Eb8ub
         j0I6nTl5VL7KtyE/yYn57l1nnrKC60PYr4MlEWjQL0xPrNYtrTF1rFSzVmenBHcn2yDl
         DUCtIuXC2AWHXu+279ijJTaELhHDh7azyeZJwOeFDmop+7OfzNChKLXi1X/QVdPkKZ5C
         Vi2B0HD2C8q8uSnzdon9tbN+fhNhGh1FBhCM+m3srWRgsLWr3Dg7DaJHZr3Yt+L5H5XK
         3yK4r6r2K1D5pda2rmEu52NPks/ua7Lp7UhYBPol2BgAtfVr0LY4yQEkKRUKc/Seez+3
         TZBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776869524; x=1777474324;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZU3v2upR7Ya8ZiRWJFkhvr6VnE2YwbFdi4wsSfXJjoU=;
        b=Dvilr5vktQ/dkeSWk/gbUxaqiWOLqrHi6+VreCruGzRm5Qu+rZp3bcyEH0TzuyjaP6
         JwngppwdupzkWrs6gkwvJ6l7hrYXFV78bFfV069TVtK3vL2xajN67MEOiJfYvdmon5nk
         hh5wymcdr9jWRRko3JPP9/ZeXUqqBz1k3JXGYnuwpEN9KPwPTXSQcgGHhQvmaNDnh/XM
         4H4N87KgipKpY5MbNvFEp6fqoZ66T4pqnOJR7NFy8Q2/n8bYKzbh/huhY/5yrt6NGjVr
         tukFGUZ33Afjc4eRTBD5+bXqV1NSCXyuAysoZXn6OOjE/MkfPD/JafXpmTh7yelGWgKO
         NFfw==
X-Forwarded-Encrypted: i=1; AFNElJ/R5rLX+g4GIlJB6yOIIJ3w+24RRmIXTjnQA08rfeLLDjtuvn33DMSoKb3+PYjIBC9PukkqTLWdscM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzaqcE/QgNdikseezU/bojsSnbCZE39GGoysCVDRX5qYbmyIZ3f
	jc/iLwZ43WguLKJqLgW+gQRwOpiNfoujXJGALJLYNPnfYCiqvJLmgLM+oqZKtaDUoTQ=
X-Gm-Gg: AeBDieuP3GZ54tpz4vdCcvqtiYzsGO4eDuOWtnjEzN3zJW3om6mK+e1aPgLtno9GDk4
	m+jQNeEK14vD3XlXIk7o9hw+fobHZpX38cWH23sjzVedy1+lvEhv8VMIA7HHedPTVCvBoPynCGv
	xtDUEFcvsoP+G8ubo94zT7oRUwB7Mka9rj2gjm1MdPSlj6Di5SgikTCnsrmGwsQ/dcpCrfIFlcV
	XY1NAqo41lD8NXoyOAPUAwNZFCYVbMXkCPxXVUR+Li4x/4F+hgjeXmwXiIR1FMx/zQd81oSPmoH
	ws2Dg0konKYT8LCkwwbxhfkIdqR57/OiYRb4Jb4y3UC8flqALPMRcnXSEpIlS+EP8J4kH5+noxu
	of7S1D1N3OL4JnXh3GJuaIOQJFo0gM0RncFtRcIbJnXdN2kbW1hcTf5CW03zsQs+qMTGbKEF3E8
	TPVifS7o5MuZRc849sFfKMEhg7D7uHDGxp0e3D7mU9DA5i87RjwDI0QBlG1oWeD3WlQuUc4iKhL
	C6NgdA2e+1mwLyv5w/pqCqM3IQSFACA+qJcQFnCwufbR9mLBDGJSbqnVB6Rd5H4
X-Received: by 2002:a05:6402:2792:b0:66b:582b:720a with SMTP id 4fb4d7f45d1cf-672bfd85cd9mr9791809a12.3.1776869523938;
        Wed, 22 Apr 2026 07:52:03 -0700 (PDT)
Message-ID: <560b6d87-87d0-4c6c-ac66-cd0d8a429792@suse.com>
Date: Wed, 22 Apr 2026 16:52:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] xen/domain: introduce DOMID_ANY
To: dmukhin@ford.com, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
 julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
 sstabellini@kernel.org
References: <20260408234046.1314021-1-dmukhin@ford.com>
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
In-Reply-To: <20260408234046.1314021-1-dmukhin@ford.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------F3bzep3e9CEmUPeyVniLGaG7"
X-purgate-ID: tlsNG-16d1c6/1776869524-52576D75-37240957/0/0
X-purgate-type: clean
X-purgate-size: 17471
X-Spamd-Result: default: False [-2.08 / 15.00];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:dmukhin@ford.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	DKIM_TRACE(0.00)[suse.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.918];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 523B94478DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------F3bzep3e9CEmUPeyVniLGaG7
Content-Type: multipart/mixed; boundary="------------4hZedzfjvbrFB305UgoRENdi";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: dmukhin@ford.com, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
 julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
 sstabellini@kernel.org
Message-ID: <560b6d87-87d0-4c6c-ac66-cd0d8a429792@suse.com>
Subject: Re: [PATCH v7] xen/domain: introduce DOMID_ANY
References: <20260408234046.1314021-1-dmukhin@ford.com>
In-Reply-To: <20260408234046.1314021-1-dmukhin@ford.com>
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

--------------4hZedzfjvbrFB305UgoRENdi
Content-Type: multipart/mixed; boundary="------------cgY2VWHnRRUfWJ6RKGT2hzPN"

--------------cgY2VWHnRRUfWJ6RKGT2hzPN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDkuMDQuMjYgMDE6NDAsIGRtdWtoaW5AZm9yZC5jb20gd3JvdGU6DQo+IEZyb206IERl
bmlzIE11a2hpbiA8ZG11a2hpbkBmb3JkLmNvbT4NCj4gDQo+IEFkZCBhIG5ldyBzeW1ib2wg
RE9NSURfQU5ZIHRvIGltcHJvdmUgdGhlIHJlYWRhYmlsaXR5IG9mIHRoZSBjb2RlLg0KPiAN
Cj4gVXBkYXRlIGFsbCByZWxldmFudCBkb21pZF9hbGxvYygpIGNhbGwgc2l0ZXMgYW5kIGhh
cmRlbiB0aGUgZG9taWRfYWxsb2MoKQ0KPiBpbnB1dCB2YWx1ZSBjaGVjay4NCj4gDQo+IEFs
c28sIGZpeCBwcm9ibGVtIHdpdGggcGFzc2luZyBpbnZhbGlkIGRvbWFpbiBJRHMgaW4NCj4g
WEVOX0RPTUNUTF9jcmVhdGVkb21haW46IHR1cm5zIG91dCBsaWJ4bF9fZG9tYWluX21ha2Uo
KSAodG9vbHN0YWNrKQ0KPiB1c2VzIDB4ZmZmZiBhcyBkb21haW4gSUQuDQo+IA0KPiBBbWVu
ZHM6IDJkNTA2NTA2MDcxMCAoInhlbi9kb21haW46IHVuaWZ5IGRvbWFpbiBJRCBhbGxvY2F0
aW9uIikNCj4gU2lnbmVkLW9mZi1ieTogRGVuaXMgTXVraGluIDxkbXVraGluQGZvcmQuY29t
Pg0KPiAtLS0NCj4gQ2hhbmdlcyBzaW5jZSB2NjoNCj4gLSBmaXhlZCBsaWJ4bF9kb21pZF92
YWxpZF9ndWVzdCgpIGNoZWNrIGluIGxpYnhsX2NyZWF0ZS5jDQo+IC0gTGluayB0byB2Njog
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcveGVuLWRldmVsLzIwMjYwMzA3MDI1NDUxLjMxNDgw
NzgtMi1kbXVraGluQGZvcmQuY29tLw0KPiAtIENJOiBodHRwczovL2dpdGxhYi5jb20veGVu
LXByb2plY3QvcGVvcGxlL2RtdWtoaW4veGVuLy0vcGlwZWxpbmVzLzI0Mzg3OTA3NDgNCj4g
LS0tDQo+ICAgdG9vbHMvbGlicy9saWdodC9saWJ4bF9jcmVhdGUuYyAgICAgICAgIHwgIDQg
KysrLQ0KPiAgIHRvb2xzL3Rlc3RzL2RvbWlkL2hhcm5lc3MuaCAgICAgICAgICAgICB8ICAx
ICsNCj4gICB0b29scy90ZXN0cy9kb21pZC90ZXN0LWRvbWlkLmMgICAgICAgICAgfCAxMiAr
KysrKystLS0tLS0NCj4gICB4ZW4vY29tbW9uL2RldmljZS10cmVlL2RvbTBsZXNzLWJ1aWxk
LmMgfCAgMiArLQ0KPiAgIHhlbi9jb21tb24vZG9tY3RsLmMgICAgICAgICAgICAgICAgICAg
ICB8ICAzICstLQ0KPiAgIHhlbi9jb21tb24vZG9taWQuYyAgICAgICAgICAgICAgICAgICAg
ICB8ICA1ICsrKystDQo+ICAgeGVuL2luY2x1ZGUvcHVibGljL3hlbi5oICAgICAgICAgICAg
ICAgIHwgIDcgKysrKysrKw0KPiAgIDcgZmlsZXMgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygr
KSwgMTEgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGlicy9saWdo
dC9saWJ4bF9jcmVhdGUuYyBiL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfY3JlYXRlLmMNCj4g
aW5kZXggYmZjOTE0OTA5NmEzLi42ZmQ2MmQxNDAzODkgMTAwNjQ0DQo+IC0tLSBhL3Rvb2xz
L2xpYnMvbGlnaHQvbGlieGxfY3JlYXRlLmMNCj4gKysrIGIvdG9vbHMvbGlicy9saWdodC9s
aWJ4bF9jcmVhdGUuYw0KPiBAQCAtNjgxLDggKzY4MSwxMCBAQCBpbnQgbGlieGxfX2RvbWFp
bl9tYWtlKGxpYnhsX19nYyAqZ2MsIGxpYnhsX2RvbWFpbl9jb25maWcgKmRfY29uZmlnLA0K
PiAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7DQo+ICAgDQo+ICAgICAgICAgICAg
ICAgICAgIGxvY2FsX2RvbWlkID0gdjsNCj4gKyAgICAgICAgICAgIH0gZWxzZSBpZiAobGli
eGxfZG9taWRfdmFsaWRfZ3Vlc3QoaW5mby0+ZG9taWQpKSB7DQo+ICsgICAgICAgICAgICAg
ICAgbG9jYWxfZG9taWQgPSBpbmZvLT5kb21pZDsNCj4gICAgICAgICAgICAgICB9IGVsc2Ug
ew0KPiAtICAgICAgICAgICAgICAgIGxvY2FsX2RvbWlkID0gaW5mby0+ZG9taWQ7IC8qIE1h
eSBub3QgYmUgdmFsaWQgKi8NCj4gKyAgICAgICAgICAgICAgICBsb2NhbF9kb21pZCA9IERP
TUlEX0FOWTsNCj4gICAgICAgICAgICAgICB9DQo+ICAgDQo+ICAgICAgICAgICAgICAgcmV0
ID0geGNfZG9tYWluX2NyZWF0ZShjdHgtPnhjaCwgJmxvY2FsX2RvbWlkLCAmY3JlYXRlKTsN
Cj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3RzL2RvbWlkL2hhcm5lc3MuaCBiL3Rvb2xzL3Rl
c3RzL2RvbWlkL2hhcm5lc3MuaA0KPiBpbmRleCAxN2ViMjJhOWE4NTQuLjY1ZGEwZDA3NWEy
YiAxMDA2NDQNCj4gLS0tIGEvdG9vbHMvdGVzdHMvZG9taWQvaGFybmVzcy5oDQo+ICsrKyBi
L3Rvb2xzL3Rlc3RzL2RvbWlkL2hhcm5lc3MuaA0KPiBAQCAtNDEsNiArNDEsNyBAQCBleHRl
cm4gdW5zaWduZWQgbG9uZyBmaW5kX25leHRfemVyb19iaXQoY29uc3QgdW5zaWduZWQgbG9u
ZyAqYWRkciwNCj4gICANCj4gICAjZGVmaW5lIERPTUlEX0ZJUlNUX1JFU0VSVkVEICAgICAg
ICAgICAgKDEwMCkNCj4gICAjZGVmaW5lIERPTUlEX0lOVkFMSUQgICAgICAgICAgICAgICAg
ICAgKDEwMSkNCj4gKyNkZWZpbmUgRE9NSURfQU5ZICAgICAgICAgICAgICAgICAgICAgICAo
MTAyKQ0KPiAgIA0KPiAgICNlbmRpZiAvKiBfVEVTVF9IQVJORVNTXyAqLw0KPiAgIA0KPiBk
aWZmIC0tZ2l0IGEvdG9vbHMvdGVzdHMvZG9taWQvdGVzdC1kb21pZC5jIGIvdG9vbHMvdGVz
dHMvZG9taWQvdGVzdC1kb21pZC5jDQo+IGluZGV4IDU5MTVjNDY5OWE1Yy4uNzFjYzRlN2Zk
ODZkIDEwMDY0NA0KPiAtLS0gYS90b29scy90ZXN0cy9kb21pZC90ZXN0LWRvbWlkLmMNCj4g
KysrIGIvdG9vbHMvdGVzdHMvZG9taWQvdGVzdC1kb21pZC5jDQo+IEBAIC00MSwyMCArNDEs
MjAgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2KQ0KPiAgICAgICAgICAgZG9t
aWRfZnJlZShleHBlY3RlZCk7DQo+ICAgDQo+ICAgICAgIC8qDQo+IC0gICAgICogVGVzdCB0
aGF0IHRoYXQgdHdvIGNvbnNlY3V0aXZlIGNhbGxzIG9mIGRvbWlkX2FsbG9jKERPTUlEX0lO
VkFMSUQpDQo+ICsgICAgICogVGVzdCB0aGF0IHRoYXQgdHdvIGNvbnNlY3V0aXZlIGNhbGxz
IG9mIGRvbWlkX2FsbG9jKERPTUlEX0FOWSkNCj4gICAgICAgICogd2lsbCBuZXZlciByZXR1
cm4gdGhlIHNhbWUgSUQuDQo+ICAgICAgICAqIE5COiBJRCMwIGlzIHJlc2VydmVkIGFuZCBz
aGFsbCBub3QgYmUgYWxsb2NhdGVkIGJ5DQo+IC0gICAgICogZG9taWRfYWxsb2MoRE9NSURf
SU5WQUxJRCkuDQo+ICsgICAgICogZG9taWRfYWxsb2MoRE9NSURfQU5ZKS4NCj4gICAgICAg
ICovDQo+ICAgICAgIGZvciAoIGV4cGVjdGVkID0gMTsgZXhwZWN0ZWQgPCBET01JRF9GSVJT
VF9SRVNFUlZFRDsgZXhwZWN0ZWQrKyApDQo+ICAgICAgIHsNCj4gLSAgICAgICAgYWxsb2Nh
dGVkID0gZG9taWRfYWxsb2MoRE9NSURfSU5WQUxJRCk7DQo+ICsgICAgICAgIGFsbG9jYXRl
ZCA9IGRvbWlkX2FsbG9jKERPTUlEX0FOWSk7DQo+ICAgICAgICAgICB2ZXJpZnkoYWxsb2Nh
dGVkID09IGV4cGVjdGVkLA0KPiAgICAgICAgICAgICAgICAgICJURVNUIDM6IGV4cGVjdGVk
ICV1IGFsbG9jYXRlZCAldVxuIiwgZXhwZWN0ZWQsIGFsbG9jYXRlZCk7DQo+ICAgICAgIH0N
Cj4gICAgICAgZm9yICggZXhwZWN0ZWQgPSAxOyBleHBlY3RlZCA8IERPTUlEX0ZJUlNUX1JF
U0VSVkVEOyBleHBlY3RlZCsrICkNCj4gICAgICAgew0KPiAtICAgICAgICBhbGxvY2F0ZWQg
PSBkb21pZF9hbGxvYyhET01JRF9JTlZBTElEKTsNCj4gKyAgICAgICAgYWxsb2NhdGVkID0g
ZG9taWRfYWxsb2MoRE9NSURfQU5ZKTsNCj4gICAgICAgICAgIHZlcmlmeShhbGxvY2F0ZWQg
PT0gRE9NSURfSU5WQUxJRCwNCj4gICAgICAgICAgICAgICAgICAiVEVTVCA0OiBleHBlY3Rl
ZCAldSBhbGxvY2F0ZWQgJXVcbiIsIERPTUlEX0lOVkFMSUQsIGFsbG9jYXRlZCk7DQo+ICAg
ICAgIH0NCj4gQEAgLTY0LDcgKzY0LDcgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiph
cmd2KQ0KPiAgICAgICAgICAgZG9taWRfZnJlZShleHBlY3RlZCk7DQo+ICAgICAgIGZvciAo
IGV4cGVjdGVkID0gMTsgZXhwZWN0ZWQgPCBET01JRF9GSVJTVF9SRVNFUlZFRCAvIDI7IGV4
cGVjdGVkKysgKQ0KPiAgICAgICB7DQo+IC0gICAgICAgIGFsbG9jYXRlZCA9IGRvbWlkX2Fs
bG9jKERPTUlEX0lOVkFMSUQpOw0KPiArICAgICAgICBhbGxvY2F0ZWQgPSBkb21pZF9hbGxv
YyhET01JRF9BTlkpOw0KPiAgICAgICAgICAgdmVyaWZ5KGFsbG9jYXRlZCA9PSBleHBlY3Rl
ZCwNCj4gICAgICAgICAgICAgICAgICAiVEVTVCA1OiBleHBlY3RlZCAldSBhbGxvY2F0ZWQg
JXVcbiIsIGV4cGVjdGVkLCBhbGxvY2F0ZWQpOw0KPiAgICAgICB9DQo+IEBAIC03Miw3ICs3
Miw3IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICoqYXJndikNCj4gICAgICAgLyogUmUt
YWxsb2NhdGUgbGFzdCBJRCBmcm9tIFsxLi5ET01JRF9GSVJTVF9SRVNFUlZFRCAtIDFdLiAq
Lw0KPiAgICAgICBleHBlY3RlZCA9IERPTUlEX0ZJUlNUX1JFU0VSVkVEIC0gMTsNCj4gICAg
ICAgZG9taWRfZnJlZShET01JRF9GSVJTVF9SRVNFUlZFRCAtIDEpOw0KPiAtICAgIGFsbG9j
YXRlZCA9IGRvbWlkX2FsbG9jKERPTUlEX0lOVkFMSUQpOw0KPiArICAgIGFsbG9jYXRlZCA9
IGRvbWlkX2FsbG9jKERPTUlEX0FOWSk7DQo+ICAgICAgIHZlcmlmeShhbGxvY2F0ZWQgPT0g
ZXhwZWN0ZWQsDQo+ICAgICAgICAgICAgICAiVEVTVCA2OiBleHBlY3RlZCAldSBhbGxvY2F0
ZWQgJXVcbiIsIGV4cGVjdGVkLCBhbGxvY2F0ZWQpOw0KPiAgIA0KPiBkaWZmIC0tZ2l0IGEv
eGVuL2NvbW1vbi9kZXZpY2UtdHJlZS9kb20wbGVzcy1idWlsZC5jIGIveGVuL2NvbW1vbi9k
ZXZpY2UtdHJlZS9kb20wbGVzcy1idWlsZC5jDQo+IGluZGV4IDg0MGQxNDQxOWRhMi4uM2Mx
OGRhZTVlNjI1IDEwMDY0NA0KPiAtLS0gYS94ZW4vY29tbW9uL2RldmljZS10cmVlL2RvbTBs
ZXNzLWJ1aWxkLmMNCj4gKysrIGIveGVuL2NvbW1vbi9kZXZpY2UtdHJlZS9kb20wbGVzcy1i
dWlsZC5jDQo+IEBAIC04NTIsNyArODUyLDcgQEAgdm9pZCBfX2luaXQgY3JlYXRlX2RvbVVz
KHZvaWQpDQo+ICAgICAgICAgICBpZiAoIChtYXhfaW5pdF9kb21pZCArIDEpID49IERPTUlE
X0ZJUlNUX1JFU0VSVkVEICkNCj4gICAgICAgICAgICAgICBwYW5pYygiTm8gbW9yZSBkb21h
aW4gSURzIGF2YWlsYWJsZVxuIik7DQo+ICAgDQo+IC0gICAgICAgIGRvbWlkID0gZG9taWRf
YWxsb2MoRE9NSURfSU5WQUxJRCk7DQo+ICsgICAgICAgIGRvbWlkID0gZG9taWRfYWxsb2Mo
RE9NSURfQU5ZKTsNCj4gICAgICAgICAgIGlmICggZG9taWQgPT0gRE9NSURfSU5WQUxJRCAp
DQo+ICAgICAgICAgICAgICAgcGFuaWMoIkVycm9yIGFsbG9jYXRpbmcgSUQgZm9yIGRvbWFp
biAlc1xuIiwgZHRfbm9kZV9uYW1lKG5vZGUpKTsNCj4gICANCj4gZGlmZiAtLWdpdCBhL3hl
bi9jb21tb24vZG9tY3RsLmMgYi94ZW4vY29tbW9uL2RvbWN0bC5jDQo+IGluZGV4IDkzNzM4
OTMxYzU3NS4uYjk2OWY1YWRhNmNjIDEwMDY0NA0KPiAtLS0gYS94ZW4vY29tbW9uL2RvbWN0
bC5jDQo+ICsrKyBiL3hlbi9jb21tb24vZG9tY3RsLmMNCj4gQEAgLTQwOSw4ICs0MDksNyBA
QCBsb25nIGRvX2RvbWN0bChYRU5fR1VFU1RfSEFORExFX1BBUkFNKHhlbl9kb21jdGxfdCkg
dV9kb21jdGwpDQo+ICAgDQo+ICAgICAgIGNhc2UgWEVOX0RPTUNUTF9jcmVhdGVkb21haW46
DQo+ICAgICAgIHsNCj4gLSAgICAgICAgLyogTkI6IElEIzAgaXMgcmVzZXJ2ZWQsIGZpbmQg
dGhlIGZpcnN0IHN1aXRhYmxlIElEIGluc3RlYWQuICovDQo+IC0gICAgICAgIGRvbWlkX3Qg
ZG9taWQgPSBkb21pZF9hbGxvYyhvcC0+ZG9tYWluID86IERPTUlEX0lOVkFMSUQpOw0KPiAr
ICAgICAgICBkb21pZF90IGRvbWlkID0gZG9taWRfYWxsb2Mob3AtPmRvbWFpbik7DQo+ICAg
DQo+ICAgICAgICAgICBpZiAoIGRvbWlkID09IERPTUlEX0lOVkFMSUQgKQ0KPiAgICAgICAg
ICAgew0KPiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9kb21pZC5jIGIveGVuL2NvbW1vbi9k
b21pZC5jDQo+IGluZGV4IDIzODdkZGIwODMwMC4uYjAyNThlNDc3YzFhIDEwMDY0NA0KPiAt
LS0gYS94ZW4vY29tbW9uL2RvbWlkLmMNCj4gKysrIGIveGVuL2NvbW1vbi9kb21pZC5jDQo+
IEBAIC0xOSw3ICsxOSw3IEBAIHN0YXRpYyBERUNMQVJFX0JJVE1BUChkb21pZF9iaXRtYXAs
IERPTUlEX0ZJUlNUX1JFU0VSVkVEKTsNCj4gICAgKiBAcGFyYW0gZG9taWQgRG9tYWluIElE
IGhpbnQ6DQo+ICAgICogLSBJZiBhbiBleHBsaWNpdCBkb21haW4gSUQgaXMgcHJvdmlkZWQs
IHZlcmlmeSBpdHMgYXZhaWxhYmlsaXR5IGFuZCB1c2UgaXQNCj4gICAgKiAgIGlmIElEIGlz
IG5vdCB1c2VkOw0KPiAtICogLSBJZiBET01JRF9JTlZBTElEIGlzIHByb3ZpZGVkLCBzZWFy
Y2ggWzEuLkRPTUlEX0ZJUlNUX1JFU0VSVkVELTFdIHJhbmdlLA0KPiArICogLSBJZiBET01J
RF9BTlkgaXMgcHJvdmlkZWQsIHNlYXJjaCBbMS4uRE9NSURfRklSU1RfUkVTRVJWRUQtMV0g
cmFuZ2UsDQo+ICAgICogICBzdGFydGluZyBmcm9tIHRoZSBsYXN0IHVzZWQgSUQuIEltcGxl
bWVudGF0aW9uIGd1YXJhbnRlZXMgdGhhdCB0d28NCj4gICAgKiAgIGNvbnNlY3V0aXZlIGNh
bGxzIHdpbGwgbmV2ZXIgcmV0dXJuIHRoZSBzYW1lIElELiBJRCMwIGlzIHJlc2VydmVkIGZv
cg0KPiAgICAqICAgdGhlIGZpcnN0IGJvb3QgZG9tYWluIChjdXJyZW50bHksIGRvbTApIGFu
ZCBleGNsdWRlZCBmcm9tIHRoZSBhbGxvY2F0aW9uDQo+IEBAIC0zMSw2ICszMSw5IEBAIGRv
bWlkX3QgZG9taWRfYWxsb2MoZG9taWRfdCBkb21pZCkNCj4gICB7DQo+ICAgICAgIHN0YXRp
YyBkb21pZF90IGRvbWlkX2xhc3Q7DQo+ICAgDQo+ICsgICAgaWYgKCBkb21pZCA+PSBET01J
RF9GSVJTVF9SRVNFUlZFRCAmJiBkb21pZCAhPSBET01JRF9BTlkgKQ0KPiArICAgICAgICBy
ZXR1cm4gRE9NSURfSU5WQUxJRDsNCj4gKw0KDQpXaXRob3V0IGNoYW5naW5nIHRvb2xzL2hl
bHBlcnMvaW5pdC14ZW5zdG9yZS1kb21haW4uYyB0byB1c2UgRE9NSURfQU5ZDQppbnN0ZWFk
IG9mIH4wIGFzIGlucHV0IGRvbWlkIHRoaXMgd2lsbCBicmVhayB4ZW5zdG9yZS1zdHViZG9t
IGNyZWF0aW9uLg0KDQpBbm90aGVyIG9wdGlvbiB3b3VsZCBiZSB0byBtb2RpZnkgeGNfZG9t
YWluX2NyZWF0ZSgpIHRvIHVzZSBET01JRF9BTlkNCmluIGNhc2UgZG9taWQgd2FzIHNwZWNp
ZmllZCBhcyAwIG9yID49IERPTUlEX0ZJUlNUX1JFU0VSVkVELiBUaGlzIHdvdWxkDQphdCBv
bmNlIGZpeCB0aGUgdGVzdCBjYXNlcyBBbnRob255IHNhdyBmYWlsaW5nLiBJJ20gbm90IHN1
cmUgdGhpcyBpcw0KYSBtb2RpZmljYXRpb24gYmVpbmcgYWNjZXB0ZWQsIHRob3VnaC4NCg0K
DQpKdWVyZ2VuDQo=
--------------cgY2VWHnRRUfWJ6RKGT2hzPN
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------cgY2VWHnRRUfWJ6RKGT2hzPN--

--------------4hZedzfjvbrFB305UgoRENdi--

--------------F3bzep3e9CEmUPeyVniLGaG7
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmno4JMFAwAAAAAACgkQsN6d1ii/Ey+B
eAf+JVZcN79xZTf4pv4JkygPrSPvVRiGzFoINO+pIz3TkHR3XglFAt/0YxJhx0/k23rawDnQv57R
b5YXf4KpCTT787XOvVMSYq4LP2kAsL7KL2RL61cW5EqczuNG36IvB7ezt/4JgqMhurtvFzi27G28
aDefVoW5SqsQ6EgObIsszRXCFtan5FLKNCx1TnVO/zYyMcHW2DzB5wWtVzaeJMTksgbZPmWU6wNC
ZYwxOf9U/YwCXRD48sQh20eogZThTe1DFZw6co/q/wbE9rW0CnEEJFGm1eml6eTq8pHbDCrIQz7x
xlFYyi2e09lAvr9ypVelUJcFu216pHlRtQocekncJQ==
=7dNz
-----END PGP SIGNATURE-----

--------------F3bzep3e9CEmUPeyVniLGaG7--

