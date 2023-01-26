Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F05D467CE76
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jan 2023 15:41:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485066.752021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pL3Qn-0006iQ-Bz; Thu, 26 Jan 2023 14:40:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485066.752021; Thu, 26 Jan 2023 14:40:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pL3Qn-0006gd-99; Thu, 26 Jan 2023 14:40:49 +0000
Received: by outflank-mailman (input) for mailman id 485066;
 Thu, 26 Jan 2023 14:40:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BaYt=5X=citrix.com=prvs=383a151c9=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pL3Ql-0006gU-LJ
 for xen-devel@lists.xenproject.org; Thu, 26 Jan 2023 14:40:47 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 69b40072-9d87-11ed-b8d1-410ff93cb8f0;
 Thu, 26 Jan 2023 15:40:45 +0100 (CET)
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
X-Inumbo-ID: 69b40072-9d87-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1674744045;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=VM9sR+syhv1vlmzJLowt67XHK+AqrGCrBVP2V3L5BVM=;
  b=LSO19JMy8xZSUD/J28RqT7hOFmt4uPumbTB8ByckdYs2p+yKN2BClavk
   YqK9FrRcvag6bVrmfwv8mkoiShXxIkJsYK34tZFQX1tng+dNR/WBNKF3b
   2ESieND6oomHlKDYZVoRfQo3ZFIWz/RDBVhJp4ILN9Q2GcHqO3y7AJ4N5
   Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 94765648
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:IW1lvKsNOK541jr2r129nIPcXufnVGpeMUV32f8akzHdYApBsoF/q
 tZmKW6PPKmNNGSjKdwgOo2+9EwOv5PQm4RrSwU/+y4xRi0Q+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg0HVU/IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj51v0gnRkPaoQ5AaEySFOZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwdgszbDK+2LuMxJGJa8dznc09L+v0M9ZK0p1g5Wmx4fcORJnCR+PB5MNC3Sd2jcdLdRrcT
 5NHM3w1Nk2GOkARfA5NU/rSn8/x7pX7WzRetFKSo7tx+2XJxRZ9+LPsLMDUapqBQsA9ckOw9
 z6ZoTmnXkFy2Nq31BfV70OutOX0vi7nccFJMZmo3+JaqQjGroAUIEJPDgbqyRWjsWa7UshaI
 lYZ+QIvq7Yz702hStThXxy+r2WAtxRaUN1Ve8Uq5QfIxqfK7gKxAmkfUiUHeNEgrNUxRzEhy
 hmOhdyBLSNrmK2YTzSa7Lj8hTqqNDIcN2MqeS4ORgxD6N7myLzflTqWEIwlSvTsyISoR3epm
 WviQDUCa6s70/U11YeGogn9hxGeh7bWVQcr5SfIUTfwhu9mX7KNa4ut4FndyP9PKoeFU1WM1
 EQ5d9iiAPMmVs/UynHUKAkZNPTwvqvebmWA6bJ6N8N5nwlB7UJPamy5DNtWAE5yevgJdjbyC
 KM4kVMAvcQDVJdGgEIeXm5QNyjI5fK4fTgGfqqOBjarXnSWXFHvwc2WTRTMt10BaWB1+U3FB
 b+VcNy3EVERArl9wTy9So81iOF0mn5hnD+MGs6jk3xLNIZyglbPEd/p13PXPogEAF6s+l2Jo
 76zyePVo/mgbAEOSnaOqtNCRbz7BXM6GYr3u6Rqmh2re2Jb9JUaI6aJm9sJItU195m5Y8+Up
 hlRrGcEkgug7ZAGQC3WAk1ehETHBMYn8ChmY3R3YT5FGRELOO6S0UvWTLNvFZFPyQCp5aUco
 yUtEylYPslydw==
IronPort-HdrOrdr: A9a23:Awy4dqHfg7c+kw+rpLqFFpLXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskdvZJjko6HyBEGBKUmskqKdkrNhQ4tKPTOW8ldASbsP0WKM+UyaJ8STzJ856U
 4kSdkDNDSSNyk2sS+Z2njDLz9I+rDuzE2xv4njJjVWPHxXgspbnmFE43OgYzVLrX59dOME/f
 Snl656Tg6bCDsqR/X+KmgOWuDCo9HRtZT9fBIKPR4o7wGSkSil8vrfHwKD1hkTaihIy7s562
 TJ+jaZ2oyT992rwBrV12ve9LRTgcDgzcZqDtGNjM99EESPti+YIKhxUbiLvDQ4u8Gq8U0rl8
 ToqwotOM5igkmhHV2dkF/AygPk2DYr52Ta0lmIkV7qvMD/TiJSMap8bM9iA1/kA4VJhqA27E
 oNtFjpw6Z/PFflpmDQ9tLIXxZlmg6dpmcjq/caizhyQJYTc7hYqK0Y5QdwHI0bFCz3xYg7GK
 02Zfusosp+QBe/VTT0r2NvyNujUjAaGQqHeFELvoi4wiVbh3dwymof3Yg6km0b/JwwZpFY76
 DvM7hulptJUsgKBJgNQ9spcI+SMCjgUBjMOGWdLRDOE7wGAWvEr9rN7LA89IiRCeo1JM9Zov
 v8eWIdkVR3V1PlCMWI0pEO2AvKWn+BUTPkzdwbz4Rlu5XnLYCbbRGreRQLqY+Nsv8fCsrUV7
 KYI5RNGcLuKmPoBMJgwxD+YZ9PMnMTOfdl5+rTY2j+/f4jF7ea7dAzMcyjfIYFKAxUA18X10
 FzBgQaJ617nzeWszHD8VShBU8EvCTEjNxN+ePhjpkuIbM2R/hxWtJ8syX42ii6E0wCjkV/Rj
 oPHFrGqNL4mYDkxxeM042eUiAtRnq8F93bIjp3TEkxQhLJmJ44yqeiUHEXxneBOxl5VtjbFA
 5Eqz1MiOGKE6A=
X-IronPort-AV: E=Sophos;i="5.97,248,1669093200"; 
   d="scan'208";a="94765648"
Date: Thu, 26 Jan 2023 14:40:39 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
	<marmarek@invisiblethingslab.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] tools/python: change 's#' size type for Python >= 3.10
Message-ID: <Y9KQ53cVznRdT7ie@perard.uk.xensource.com>
References: <20230126051310.4149074-1-marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230126051310.4149074-1-marmarek@invisiblethingslab.com>

On Thu, Jan 26, 2023 at 06:13:10AM +0100, Marek Marczykowski-Górecki wrote:
> Python < 3.10 by default uses 'int' type for data+size string types
> (s#), unless PY_SSIZE_T_CLEAN is defined - in which case it uses
> Py_ssize_t. The former behavior was removed in Python 3.10 and now it's
> required to define PY_SSIZE_T_CLEAN before including Python.h, and using
> Py_ssize_t for the length argument. The PY_SSIZE_T_CLEAN behavior is
> supported since Python 2.5.
> 
> Adjust bindings accordingly.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

