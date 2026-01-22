Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPAoHG15cmlSlQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 20:24:29 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DAA6CF9B
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 20:24:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1211850.1523299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vj0Hx-0001HU-AZ; Thu, 22 Jan 2026 19:24:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1211850.1523299; Thu, 22 Jan 2026 19:24:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vj0Hx-0001FO-66; Thu, 22 Jan 2026 19:24:17 +0000
Received: by outflank-mailman (input) for mailman id 1211850;
 Thu, 22 Jan 2026 19:24:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hlyj=73=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vj0Hv-0001FI-F4
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 19:24:15 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef1b09d9-f7c7-11f0-9ccf-f158ae23cfc8;
 Thu, 22 Jan 2026 20:24:13 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-b885a18f620so32650166b.3
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jan 2026 11:24:13 -0800 (PST)
Received: from ?IPV6:2a00:12d0:af5b:2f01:4042:c03:ce4d:a5a1?
 (2a00-12d0-af5b-2f01-4042-c03-ce4d-a5a1.ip.tng.de.
 [2a00:12d0:af5b:2f01:4042:c03:ce4d:a5a1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b885b8011dfsm7507866b.70.2026.01.22.11.24.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jan 2026 11:24:12 -0800 (PST)
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
X-Inumbo-ID: ef1b09d9-f7c7-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769109853; x=1769714653; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rgCDhTXuBJXwPqbF6FpQHo5ADFTyYqE2io4DiR+xhoA=;
        b=E7WgmfR1LVtVn2zijTvS5qa7LxgLWAAVB6+jY/1WfO0Ymhm4V8Tvw0TrPnuI1oDQmN
         GFBMeTB8TfGDbhKqvQuAo5KtR71HxinOipdottpwM+8eZDQ5Bev+fEgeiRznDC5A6V8d
         GPZH90XfGyIne2tGasbqVSKb61rAXzahUFsnf4+gsXO27rjHdgFGf3FD5P190+cU+B+Q
         7zncPkXq1UsQcjU0uedd8leryknKjTSxbLopEkY6VoqLCFteaLDlGhcfp6TQ9ZV7Qvr2
         KN2qEus84La4JhF1+xVVrYRnhr+YjnOK0PJYqwTEl/NXCx/IMmGlpNZH9CeZoght1hPq
         VKTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769109853; x=1769714653;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rgCDhTXuBJXwPqbF6FpQHo5ADFTyYqE2io4DiR+xhoA=;
        b=cREKNbmfFSduZrklXXKGu1w5Zo7oq24i/eZqBbf5jpUUTAMmKWwVUom1ljHeUkgy1l
         koac3jJ3KItozAjsOC4KmszhJY3QkCwzTmeIZyKv1E6BKZtA4V6UKP8ChFKy1ntGCkT2
         S3zDBWINo85UZfKyWWWEPHPVz4NAmZw3SLZj7KOTxufzYKuipoRHMqEhrDccew4Ztscw
         NbIuvDKuS8XnwWLYJxuRTGHpdr6e5qrkMs6aVbcyTVJyYfaYgE+GwcOznWYD+PFdCnyZ
         2/1m3SRr9Jxjd/4c4gqo/b3+yf9P9SLUmG8nErDrrzvRBqTG7Z6LpgxSmXza83Bu3V4u
         OmFw==
X-Gm-Message-State: AOJu0Yx/ZdgZDKFzA+R6NsdTQwmnD6ipNjnWIhbOQkT3jti6B1ZxApZ1
	rfbGfzoun/zL5mfu9NrBUe5YVdQx/sICQdOEHLHxpMifnc1ld6OPWV8+dux+QR8nKl4=
X-Gm-Gg: AZuq6aLK7Zj6O6mLEM29NzJg9Tby6/XuPTEdzUNDjpbLzypZMuQO5mp38k21CU3q+qz
	GLIT/WGNX7uvtDSmkiO4Gv+F6k4ebcbNyR2gJH1ojW/E4/QAXFPD9lUaB6zv3qZMjXSBBOlcJVH
	ecCSElLo9lgQ8m3RLGpxXVmnf5AvVdmnktZqubsa1i7XEwvADNY5Ne2fdonLGqBZvVWNZitybac
	1aC7HOq4mzOuvqRg8JWkmvK61i3MqeqmwYOWJ6HkhV18YI+K1CUQyKo8ZGy/WpFULniu373Cslv
	cuzF+ATQKR1BvpHP+SjwcxqeUSIGWFqjGz4pjpEdvxrRY/BHPlavU6xK+nBwqcKYGC9wi/3GtwL
	HEXWNn5+NVsuf+Lxu9FTYYYLj9Atd8yB+Wxzyf44cSPIJW00eVa/iDYNyjGfNAu/K1uekYeo7mR
	5TdBOsgZqPt2gKWF0ejU0Yb7Dq9Czvqvku49siw6vC134bdcVJh9wD7pdx5QOVQb0/irNFgXyCw
	nqx1vE1gpa/uRqzSh16fEcXBY1r01lOiHtp3w==
X-Received: by 2002:a17:907:a04:b0:b86:fed0:2b with SMTP id a640c23a62f3a-b885ae65c13mr20487966b.32.1769109852583;
        Thu, 22 Jan 2026 11:24:12 -0800 (PST)
Message-ID: <64adf935-1fd8-4d3c-b9b2-cafb0e065463@suse.com>
Date: Thu, 22 Jan 2026 20:24:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: MTRR init sequence in Xen
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>
References: <145af46c-eab5-4d0f-ba35-4ae646c0e4cd@suse.com>
 <e46ceae9-0680-4fb9-adb9-84530745fa4d@citrix.com> <aXJgNUxe3kiqlgaW@Mac.lan>
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
In-Reply-To: <aXJgNUxe3kiqlgaW@Mac.lan>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------vMnlJv4EU0t2zQDeEsgLY4Hz"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.97 / 15.00];
	SIGNED_PGP(-2.00)[];
	R_MIXED_CHARSET(1.11)[subject];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	HAS_ATTACHMENT(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: D5DAA6CF9B
X-Rspamd-Action: no action

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------vMnlJv4EU0t2zQDeEsgLY4Hz
Content-Type: multipart/mixed; boundary="------------mecoxbJo3Xbbj27VngaKsd0Q";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>
Message-ID: <64adf935-1fd8-4d3c-b9b2-cafb0e065463@suse.com>
Subject: Re: MTRR init sequence in Xen
References: <145af46c-eab5-4d0f-ba35-4ae646c0e4cd@suse.com>
 <e46ceae9-0680-4fb9-adb9-84530745fa4d@citrix.com> <aXJgNUxe3kiqlgaW@Mac.lan>
In-Reply-To: <aXJgNUxe3kiqlgaW@Mac.lan>
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

--------------mecoxbJo3Xbbj27VngaKsd0Q
Content-Type: multipart/mixed; boundary="------------54x8dgl1JYW9AZapAtv7Om0J"

--------------54x8dgl1JYW9AZapAtv7Om0J
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjIuMDEuMjYgMTg6MzYsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+IE9uIFRodSwg
SmFuIDIyLCAyMDI2IGF0IDA1OjIxOjEyUE0gKzAwMDAsIEFuZHJldyBDb29wZXIgd3JvdGU6
DQo+PiBPbiAyMi8wMS8yMDI2IDM6NTYgcG0sIErDvHJnZW4gR3Jvw58gd3JvdGU6DQo+Pj4g
SnVzdCBhcyBhIGhlYWRzIHVwOiBhIGhhcmR3YXJlIHBhcnRuZXIgb2YgU1VTRSBoYXMgc2Vl
biBoYXJkIGxvY2t1cHMNCj4+PiBvZiB0aGUgTGludXgga2VybmVsIGR1cmluZyBib290IG9u
IGEgbmV3IG1hY2hpbmUuIFRoaXMgbWFjaGluZSBoYXMNCj4+PiA4IE5VTUEgbm9kZXMgYW5k
IDk2MCBDUFVzLiBUaGUgaGFuZyBvY2N1cnMgaW4gcm91Z2hseSAxLjUlIG9mIHRoZSBib290
DQo+Pj4gYXR0ZW1wdHMgaW4gTVRSUiBpbml0aWFsaXphdGlvbiBvZiB0aGUgQVBzLg0KPj4+
DQo+Pj4gSSBoYXZlIHNlbnQgYSBzbWFsbCBwYXRjaCBzZXJpZXMgdG8gTEtNTCB3aGljaCBz
ZWVtcyB0byBmaXggdGhlIHByb2JsZW06DQo+Pj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
bGttbC8yMDI2MDEyMTE0MTEwNi43NTU0NTgtMS1qZ3Jvc3NAc3VzZS5jb20vDQo+Pj4NCj4+
PiBBcyBYZW4gTVRSUiBoYW5kbGluZyBpcyB0YWtlbiBmcm9tIHRoZSBMaW51eCBrZXJuZWws
IEkgZ3Vlc3MgdGhlIHNhbWUNCj4+PiBwcm9ibGVtIGNvdWxkIGhhcHBlbiBpbiBYZW4sIHRv
by4NCj4+Pg0KPj4+IEFzIHRoZSBoYW5nIGFsd2F5cyBvY2N1cnJlZCB3aGlsZSB3YWl0aW5n
IGZvciB0aGUgbG9jaywgd2hpY2ggaXMNCj4+PiBzZXJpYWxpemluZyB0aGUgc2luZ2xlIENQ
VXMgZG9pbmcgTVRSUiBpbml0aWFsaXphdGlvbiwgbXkgc29sdXRpb24gd2FzDQo+Pj4gdG8g
ZWxpbWluYXRlIHRoZSBsb2NrLCBhbGxvd2luZyBhbGwgQVBzIHRvIGluaXQgTVRSUnMgaW4g
cGFyYWxsZWwuDQo+Pj4NCj4+PiBNYXliZSB3ZSB3YW50IHRvIGRvIHRoZSBzYW1lIGluIFhl
bi4NCj4+DQo+PiBJIHN1c3BlY3QgWGVuIG1pZ2h0IGJlIGluc3VsYXRlZCBieSB0aGUgZmFj
dCB0aGF0IHdlIGRvbid0IGhhdmUgcGFyYWxsZWwNCj4+IEFQIHN0YXJ0ICh5ZXQpLCBzbyB3
ZSBkb24ndCBoYXZlIHRoZSB3aG9sZSBzeXN0ZW0gY29tcGV0aW5nIG9uIHRoZQ0KPj4gc3Bp
bmxvY2sgYXQgb25jZS4NCj4gDQo+IE9oLCBJIHRoaW5rIEkndmUgbWlzdW5kZXJzdG9vZCB0
aGUgaXNzdWUuICBMaW51eCBpcyBkb2luZyBNVFJSIGluaXQgaW4NCj4gdGhlIEFQIHN0YXJ0
dXAgcGF0aCwgYW5kIHNvIGlmIGl0IHRha2VzIHRvbyBsb25nIExpbnV4IHdpbGwgcmVwb3J0
DQo+IHRoYXQgdGhlIEFQIGhhcyBmYWlsZWQgdG8gc3RhcnQuDQoNCk5vLCBMaW51eCBpcyBk
ZWZlcnJpbmcgdGhlIE1UUlJzIHVudGlsIGFsbCBBUHMgYXJlIHVwLCBqdXN0IGxpa2UgWGVu
DQoob3IgWGVuIGRvZXMgaXQgbGlrZSBMaW51eCkuDQoNCj4gDQo+IFRoaXMgaXMgbm90IGFu
IGlzc3VlIG9uIFhlbiBiZWNhdXNlIE1UUlIgaW5pdGlhbGl6YXRpb24gaXMgZGVmZXJyZWQN
Cj4gdW50aWwgYWxsIEFQcyBhcmUgdXAsIGFuZCBoZW5jZSBpcyBub3QgcGFydCBvZiB0aGUg
dGltZWQgQVAgc3RhcnQNCj4gcGF0aC4gIFRoaXMgb3B0aW1pemF0aW9uIHdhcyBkb25lIGlu
Og0KPiANCj4gMGQyMmM4ZDkyYzZjIHg4NjogQ1BVIHN5bmNocm9uaXphdGlvbiB3aGlsZSBk
b2luZyBNVFJSIHJlZ2lzdGVyIHVwZGF0ZQ0KPiANCj4gU28gZXZlbiBpZiB3ZSBkaWQgcGFy
YWxsZWwgQVAgc3RhcnR1cCB3ZSB3b24ndCBsaWtlbHkgYmUgYWZmZWN0ZWQsDQo+IGJlY2F1
c2Ugd2Ugd291bGQgc3RpbGwgZGVmZXIgdGhlIE1UUlIgc2V0dXAgdW50aWwgYWxsIEFQcyBh
cmUgdXAuDQoNCldlIHdpbGwgYmUgYWZmZWN0ZWQsIGFzIGl0cyB0aGUgZGVmZXJyZWQgTVRS
UiBzZXR1cCB3aGljaCBpcyB0aGUNCnByb2JsZW0uDQoNCg0KSnVlcmdlbg0K
--------------54x8dgl1JYW9AZapAtv7Om0J
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------54x8dgl1JYW9AZapAtv7Om0J--

--------------mecoxbJo3Xbbj27VngaKsd0Q--

--------------vMnlJv4EU0t2zQDeEsgLY4Hz
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmlyeVsFAwAAAAAACgkQsN6d1ii/Ey/J
agf+JoGEFI8S6N8ApcyRRMB/qw/6R0sJ6CioCy+nEEdp7GkFjx907NwEvcMYhpkkTpc8THMMH2Eg
MNoPPK3unfrpTgM1J4/uKMWhqWhasaEOhwQ6CFt9Gk8mjK98JERAk90+oenPsjztw2+TxjQgk9pm
JM/k1E6kUKIIuN/8Pux6xIM5u96hpb0tE2Hco9UF2QIV60I8T8m2aNZ21qBpGcbVA4+1d4P5Gdff
yfY0NS1LteURYqrAhcQT6iatG5DusosR8a7yZ9RxwPjCb9JVV23TpLZRjJbXLhSh74UoYR3jaRE6
/DNOY6poLOQvQHwrdfyyojioOtELF4TrY+bI1IO9cg==
=2D26
-----END PGP SIGNATURE-----

--------------vMnlJv4EU0t2zQDeEsgLY4Hz--

