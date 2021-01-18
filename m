Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF7E2FA758
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 18:21:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69906.125303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1YDJ-0008EP-CV; Mon, 18 Jan 2021 17:21:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69906.125303; Mon, 18 Jan 2021 17:21:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1YDJ-0008E2-92; Mon, 18 Jan 2021 17:21:13 +0000
Received: by outflank-mailman (input) for mailman id 69906;
 Mon, 18 Jan 2021 17:21:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Fyoy=GV=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1l1YDH-0008Dx-F9
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 17:21:11 +0000
Received: from mail-qk1-x735.google.com (unknown [2607:f8b0:4864:20::735])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b7f4e5fd-d060-4572-b754-21911ee437e5;
 Mon, 18 Jan 2021 17:21:10 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id n142so19348954qkn.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 Jan 2021 09:21:10 -0800 (PST)
Received: from doug-macbook.localdomain
 ([2600:1700:7b90:52f8:356b:25e6:f090:c8bf])
 by smtp.gmail.com with ESMTPSA id y9sm10702193qtm.96.2021.01.18.09.21.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jan 2021 09:21:09 -0800 (PST)
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
X-Inumbo-ID: b7f4e5fd-d060-4572-b754-21911ee437e5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cardoe.com; s=google;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to;
        bh=/jleia+phS/pdR23Mi263b6G0wM5GjkU+v/4H4fP3Ds=;
        b=IYiGYk571QpjHyeg1b4/h4wgLHrzJBU4aCRRVT2/mERNkGw8IW6aTW4F/H23Tlx46d
         eNqVj3vTNQLwifAmBoxh+xliMzYSnQdKFMm9L9sLj1b7XSkhn2kggX+XH6BucXDdYl3y
         58BDwjZ2tfRPqU/PLFf7qtZfvKSFcb6RcrqXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to;
        bh=/jleia+phS/pdR23Mi263b6G0wM5GjkU+v/4H4fP3Ds=;
        b=ZtNfmG81JMOy4yuQwWqcra76VFI5/BM8XesXz1EiV0EifLEKeQW7di8cMzjUVTWQp0
         +Oas7WDz61mITs0H1dmG5QjaNWcYor+4tEV5DYv5MqkVL6v8bKltSvCf6DrH7+tyD8xi
         QMDCj+Of8EJeUC1wcVGuftsl/4TDI54s56kzyFaJ9v4QrybXF66uHeyFtgu5q4z6/5Jd
         W+yi99l7ops+XU31aouWj+cybmyQ197lL11JE1b3mfyYrd6aE1vdBaDAQP+5+I/DvkqG
         ZJFNb/237EuMZ8U7yrP4neJ0/28lIpE/5B02RMeN/XlD4CCj/DIB3UlJsJP9Crk8ORs4
         AndQ==
X-Gm-Message-State: AOAM531v6t4kfM8JK2uFRb7+oApdZKH0vlX+xSB+Vc62Y5uieN7nHUSG
	7qCw+xcqrE0vpsgF3IFPYUTd4E2shj3M/A==
X-Google-Smtp-Source: ABdhPJx1cfmWOhSgtpCfXj2ohy3HnpBKJ4v/GsLQOvGHPbzW7VNm3RwXm64OQ1NnpCPHXXcebL11XA==
X-Received: by 2002:a05:620a:1203:: with SMTP id u3mr583633qkj.39.1610990470193;
        Mon, 18 Jan 2021 09:21:10 -0800 (PST)
Subject: Re: [PATCH] kconfig: ensure strndup() declaration is visible
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <5db4e135-16e9-db1d-3e04-c0145f9f39bd@suse.com>
From: Doug Goldstein <cardoe@cardoe.com>
Autocrypt: addr=cardoe@cardoe.com; keydata=
 xsBNBF5LGPMBCADEZFhxQYVAKLdisE/vC0BBf8/RFLPJaxI9oKpHhuCCM0R4cjfi7yR255hG
 qpBmQ3zbtRHnIrts8yQhW7hY/Gd/QVujE2AyBr8GqmMEoiHqIIAAykmMYThi0guDehgP3BGC
 sIOg1zQao4UuLCXU+uUweFxMR8+ATXZAxh9j6dEJcKvyLiS3ZpD3d3Ev4VF1WTHwzj87eUyD
 Xp2hN+w3qIPyTlkBv3pzZHuowhm3xUj+gSgBdfFFzRNTj1go6NT4YqcTqu/6geeP9wEuf+0h
 reM2zddweVnEqUgs7rYTu+gFckGOp6vqunsIL4t7mxUlUdR9W/26ogWtsPidcCSpQUH3ABEB
 AAHNIkRvdWcgR29sZHN0ZWluIDxjYXJkb2VAY2FyZG9lLmNvbT7CwJQEEwEIAD4WIQQ8YcHM
 wTxmFAQZsmnhXudhSZqTXgUCXksY9wIbAwUJAeEzgAULCQgHAwUVCgkICwUWAwIBAAIeAQIX
 gAAKCRDhXudhSZqTXnIxB/9mJfMYswa6T0A/SqsIRj3P38h3a3imS4rdLv/jPjgNvdozuhWH
 i37cyw1V81x8zu90cWNyENGzw/v8q6R7FR7kJ7GS6mz4IN4X6V4OxnKc0veKgYfeivWAcrVS
 OFwTU/gG4zdXH4iKur4rfo3aa09+8tw+zsCXuNuAaNLjmtIrWdsHM47eV1s+mrZgplvVh7iA
 G8CRdK42/QTsUai7t1iAYiRu4AdXKXfa9wej/FBzXkK1HBmJwrVcgf5E6Qa2s98vQCjaRJ3d
 LwWb5EAwjAO82e7W3dIClp2D0LP0916tohn0OF+WurzJpkSFsxive21aZEOPy1Oy5m0Bt5ot
 uRXNzsBNBF5LGPUBCAC8yXDcoRhy44Sn2m+BhN+smvyWFFFu7uS3vjpfZonslkypWtHIy2M/
 Z1vNl0LEH6yTz0EX0aSjKSU/6DdyfyJtacbbWw2LjfMuc8yIjDK1VgyRb7GPuklWxRcQnwGU
 RJ65yQQ2BV9w9aPRltTIU5Ez8ybEOJd/DL49rJ5Rd+DPe1/7ga4fTtawNoj4zeZMDkPBGlNW
 ffiMB1A4mlacGTtUkc6S4YNERdo9erBbtca9pxcZwdk00eW2KM5LOjvymslcWvKtmMAQI+6O
 LPOSO7N0YKDvaYF8yYsC/J3OMf2EIhPTOoVlgWdUbuNAeV9Z97pGCc8TYyUQjWOc1/0SUQv3
 ABEBAAHCwHwEGAEIACYWIQQ8YcHMwTxmFAQZsmnhXudhSZqTXgUCXksY9QIbDAUJAeEzgAAK
 CRDhXudhSZqTXsGyB/9QqUqL/B8ljwJOP751A2ysXlMS0/ctA0B2BltlU6i6TyhpD4CeBb+/
 01SE1JN0Lx7e7S6ZjG5n0NldHOTemDq+IGP+Wfn5rQnE5+Cbs+XKeMoUqnP+prT6hyK+xXZs
 CTUk0zhgQVn5RjJY6tZE0qCD1bwZ/w5AIXRbeOeqcKWMxrKCjJZ9b/laGZ3XpLb6YywoVWaW
 Lr8q9Vpl02JMSTtemuvvkOwhR1tEyfZ8dOWOv3YQRNBPy/d0YckTcUCnF5rrNnjN1m+F/Td3
 k1myX5qpwfGB9UaJTq30Io9EVkA65Ti1yf3KVaBpmKGDRC0syxKfiteY+QVyV+NW+EbAN9YA
Message-ID: <e5f98449-5894-83ae-2854-2aef3609195a@cardoe.com>
Date: Mon, 18 Jan 2021 11:21:07 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <5db4e135-16e9-db1d-3e04-c0145f9f39bd@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="sgM8sbRhwqy4GZxADzRVBwAxhPRT7PIWS"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--sgM8sbRhwqy4GZxADzRVBwAxhPRT7PIWS
Content-Type: multipart/mixed; boundary="VNy4uDWupbRAngXgiHluXT334HWbchvAx";
 protected-headers="v1"
From: Doug Goldstein <cardoe@cardoe.com>
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <e5f98449-5894-83ae-2854-2aef3609195a@cardoe.com>
Subject: Re: [PATCH] kconfig: ensure strndup() declaration is visible
References: <5db4e135-16e9-db1d-3e04-c0145f9f39bd@suse.com>
In-Reply-To: <5db4e135-16e9-db1d-3e04-c0145f9f39bd@suse.com>

--VNy4uDWupbRAngXgiHluXT334HWbchvAx
Content-Type: multipart/mixed;
 boundary="------------AC1F4C93958ECCE3EBC55A12"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------AC1F4C93958ECCE3EBC55A12
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 1/11/21 8:42 AM, Jan Beulich wrote:
> Its guard was updated such that it is visible by default when POSIX 200=
8
> was adopted by glibc. It's not visible by default on older glibc.
>=20
> Fixes: f80fe2b34f08 ("xen: Update Kconfig to Linux v5.4")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> --- a/xen/tools/kconfig/parser.y
> +++ b/xen/tools/kconfig/parser.y
> @@ -4,6 +4,7 @@
>    */
>   %{
>  =20
> +#define _GNU_SOURCE
>   #include <ctype.h>
>   #include <stdarg.h>
>   #include <stdio.h>
>=20

Ack-by: Doug Goldstein <cardoe@cardoe.com>

--------------AC1F4C93958ECCE3EBC55A12
Content-Type: application/pgp-keys;
 name="OpenPGP_0xE15EE761499A935E.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="OpenPGP_0xE15EE761499A935E.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBF5LGPMBCADEZFhxQYVAKLdisE/vC0BBf8/RFLPJaxI9oKpHhuCCM0R4cjfi7yR255hGq=
pBm
Q3zbtRHnIrts8yQhW7hY/Gd/QVujE2AyBr8GqmMEoiHqIIAAykmMYThi0guDehgP3BGCsIOg1=
zQa
o4UuLCXU+uUweFxMR8+ATXZAxh9j6dEJcKvyLiS3ZpD3d3Ev4VF1WTHwzj87eUyDXp2hN+w3q=
IPy
TlkBv3pzZHuowhm3xUj+gSgBdfFFzRNTj1go6NT4YqcTqu/6geeP9wEuf+0hreM2zddweVnEq=
Ugs
7rYTu+gFckGOp6vqunsIL4t7mxUlUdR9W/26ogWtsPidcCSpQUH3ABEBAAHNIkRvdWcgR29sZ=
HN0
ZWluIDxjYXJkb2VAY2FyZG9lLmNvbT7CwJQEEwEIAD4WIQQ8YcHMwTxmFAQZsmnhXudhSZqTX=
gUC
XksY9wIbAwUJAeEzgAULCQgHAwUVCgkICwUWAwIBAAIeAQIXgAAKCRDhXudhSZqTXnIxB/9mJ=
fMY
swa6T0A/SqsIRj3P38h3a3imS4rdLv/jPjgNvdozuhWHi37cyw1V81x8zu90cWNyENGzw/v8q=
6R7
FR7kJ7GS6mz4IN4X6V4OxnKc0veKgYfeivWAcrVSOFwTU/gG4zdXH4iKur4rfo3aa09+8tw+z=
sCX
uNuAaNLjmtIrWdsHM47eV1s+mrZgplvVh7iAG8CRdK42/QTsUai7t1iAYiRu4AdXKXfa9wej/=
FBz
XkK1HBmJwrVcgf5E6Qa2s98vQCjaRJ3dLwWb5EAwjAO82e7W3dIClp2D0LP0916tohn0OF+Wu=
rzJ
pkSFsxive21aZEOPy1Oy5m0Bt5otuRXNzsBNBF5LGPUBCAC8yXDcoRhy44Sn2m+BhN+smvyWF=
FFu
7uS3vjpfZonslkypWtHIy2M/Z1vNl0LEH6yTz0EX0aSjKSU/6DdyfyJtacbbWw2LjfMuc8yIj=
DK1
VgyRb7GPuklWxRcQnwGURJ65yQQ2BV9w9aPRltTIU5Ez8ybEOJd/DL49rJ5Rd+DPe1/7ga4fT=
taw
Noj4zeZMDkPBGlNWffiMB1A4mlacGTtUkc6S4YNERdo9erBbtca9pxcZwdk00eW2KM5LOjvym=
slc
WvKtmMAQI+6OLPOSO7N0YKDvaYF8yYsC/J3OMf2EIhPTOoVlgWdUbuNAeV9Z97pGCc8TYyUQj=
WOc
1/0SUQv3ABEBAAHCwHwEGAEIACYWIQQ8YcHMwTxmFAQZsmnhXudhSZqTXgUCXksY9QIbDAUJA=
eEz
gAAKCRDhXudhSZqTXsGyB/9QqUqL/B8ljwJOP751A2ysXlMS0/ctA0B2BltlU6i6TyhpD4CeB=
b+/
01SE1JN0Lx7e7S6ZjG5n0NldHOTemDq+IGP+Wfn5rQnE5+Cbs+XKeMoUqnP+prT6hyK+xXZsC=
TUk
0zhgQVn5RjJY6tZE0qCD1bwZ/w5AIXRbeOeqcKWMxrKCjJZ9b/laGZ3XpLb6YywoVWaWLr8q9=
Vpl
02JMSTtemuvvkOwhR1tEyfZ8dOWOv3YQRNBPy/d0YckTcUCnF5rrNnjN1m+F/Td3k1myX5qpw=
fGB
9UaJTq30Io9EVkA65Ti1yf3KVaBpmKGDRC0syxKfiteY+QVyV+NW+EbAN9YA
=3DkDjR
-----END PGP PUBLIC KEY BLOCK-----

--------------AC1F4C93958ECCE3EBC55A12--

--VNy4uDWupbRAngXgiHluXT334HWbchvAx--

--sgM8sbRhwqy4GZxADzRVBwAxhPRT7PIWS
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEPGHBzME8ZhQEGbJp4V7nYUmak14FAmAFw4QFAwAAAAAACgkQ4V7nYUmak16b
bgf/URjjqVOobliVncaDu+GeYNatTu925FHydSYS3C9PYdTRl/L26Rq1rLp3m9eozHMTsz5tmMKw
+fA19/iB5yWUORct6WKyuYsSKxlKf5l9bkH6sjREAsW/qfCZ4Pjn9ybiGdvWKAWK3RB9WOqi//36
xSVTBFiyx7nm/jok9hT7uJs9wXnmMpIOcyfybMwnB5J8j9g9YSbNehcKheXNCnI07eLZdkyw1MYo
jCkAgoIiUe2AVfpBts1+MWqOIiEsPDvoAbc+emZJO7qWq/7zfGwcQ0tQsF4CzFqUV2kUOM5jQkOu
Cj7olxDjFLWolVfOeq6Pde5KrQ1ue/tdgTACSkzngg==
=HUei
-----END PGP SIGNATURE-----

--sgM8sbRhwqy4GZxADzRVBwAxhPRT7PIWS--

