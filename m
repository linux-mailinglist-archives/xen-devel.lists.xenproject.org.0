Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63EA38B7AB9
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 16:59:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714976.1116398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1ow6-0006Tu-5B; Tue, 30 Apr 2024 14:58:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714976.1116398; Tue, 30 Apr 2024 14:58:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1ow6-0006Qk-1F; Tue, 30 Apr 2024 14:58:26 +0000
Received: by outflank-mailman (input) for mailman id 714976;
 Tue, 30 Apr 2024 14:58:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q3to=MD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s1ow5-0006Qe-3z
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 14:58:25 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16abc0b5-0702-11ef-b4bb-af5377834399;
 Tue, 30 Apr 2024 16:58:22 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-41b79450f8cso36845595e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Apr 2024 07:58:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 m16-20020a05600c3b1000b0041496734318sm49461958wms.24.2024.04.30.07.58.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Apr 2024 07:58:21 -0700 (PDT)
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
X-Inumbo-ID: 16abc0b5-0702-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714489102; x=1715093902; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B2ovsyWUN93Z5+yL8ZbHU/AwvELtSzmSnTH1TL2bdi8=;
        b=FwUhWJdvJRs/AwCUTajMUq4KJWElF5YPTPgQQdtvmN0fvVRUiWbYipRLGto43ZYrSl
         cg6XthV2+bY24+fymhcvKOWygdNFtBVXuWcNUYZCJzAuJFjj2BN1PqgdS0aUzvmArsbI
         2y1fIqXtzH3Il4pL9yk5m8g2JZNKoa2JLvA+jxzq4rS8cqXEOihhG2QSn+Wz2u4krGxu
         HOAYzOufsi6u3Uqk+ii2oJqj8e71WGZpmFWNNUcknwOiM8o7ehwMkU9Vvw5MvMfkiP9z
         ST9rzFQTFRkTTxIZmjXT01NYFRHJj0Ty+nbf51NdJgUBjtYWaf37+k3mgHlX+/yur+YG
         XGBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714489102; x=1715093902;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B2ovsyWUN93Z5+yL8ZbHU/AwvELtSzmSnTH1TL2bdi8=;
        b=olMieskF+Qxq7cofw5uB+x5Sgk40cu+r80vKWbDiEuOlg2o6N6mXm2dKRQ4nr7t9o9
         vGlxj/FpGWelrAErc2Zkp0RlCFmgdAFe6NvdlWGttEyofWP0QpZNocsr9JTLBMHZQ4ko
         ohOVuqXxjm6QW5eZb7t270NvUKhtnGA8YPpRARAs4CtzF4voZ/te5dWNzoHOh3iQzrzY
         r0GEOCL9l5I8uyrpDbtAewXfcmYkoLv5WsltjylyUuITOURi0wC1qOl95T+JNK+wHS3v
         oR5JC6/pYDbl2a85Gd6F++iEPaPWOE3z6t7JcUdzzCy/p7ect7P1n48/HUgclyAdEUlz
         CFBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtcgN8iHGN/cuzwedZeedrUeA18mAo7+J1YN7go4BSRGlq5Y4+wDQA9LCgJ7EfpCRL2eFu6PQW+8wDdWfyYJlCXRnVSdbxBfqje8yxiek=
X-Gm-Message-State: AOJu0YzIPZqU2jzk/OgQreet8E/yzDy9sqbvBaqoZ/kQg83oP1zwZCJR
	/R25P/7YjIY+Db7aaVLGj09hycwGyJXWbPk9eutIVNuUoYZ+gPwiiDSJncVbdw==
X-Google-Smtp-Source: AGHT+IFMsr1WRD8xulwo4O9R0arW/g5tGlsZJHd+5WV92dz1HzBPnSVfaU6nGUKU8lhYUX2lZBfk+g==
X-Received: by 2002:a05:600c:cc6:b0:41a:446b:10df with SMTP id fk6-20020a05600c0cc600b0041a446b10dfmr2827689wmb.12.1714489101953;
        Tue, 30 Apr 2024 07:58:21 -0700 (PDT)
Message-ID: <6633a35b-37a8-4439-8722-448b2e85cb7f@suse.com>
Date: Tue, 30 Apr 2024 16:58:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/7] x86/msi: Extend per-domain/device warning
 mechanism
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.3491f479d5b6238106af8ddc56ec6834090b330f.1714154036.git-series.marmarek@invisiblethingslab.com>
 <46f33e8ae1aa7d310e7a99e9da29d29096b0935b.1714154036.git-series.marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <46f33e8ae1aa7d310e7a99e9da29d29096b0935b.1714154036.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.04.2024 19:53, Marek Marczykowski-Górecki wrote:
> The arch_msix struct had a single "warned" field with a domid for which
> warning was issued. Upcoming patch will need similar mechanism for few
> more warnings, so change it to save a bit field of issued warnings.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
(if that makes sense at all, considering that one fundamental part of it,
the macro, was suggested by me)

However, unlike at other times I'd like this to go in only together with
the following patch (or whatever other 2nd user of the new machinery).

Jan

