Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 782ADA7655D
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 14:07:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.932450.1334561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzDuR-0007or-N8; Mon, 31 Mar 2025 12:06:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 932450.1334561; Mon, 31 Mar 2025 12:06:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzDuR-0007nP-KN; Mon, 31 Mar 2025 12:06:31 +0000
Received: by outflank-mailman (input) for mailman id 932450;
 Mon, 31 Mar 2025 12:06:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AhU9=WS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tzDuP-0007li-Go
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 12:06:29 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92eb5435-0e28-11f0-9ea7-5ba50f476ded;
 Mon, 31 Mar 2025 14:06:27 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43cfba466b2so43790625e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 31 Mar 2025 05:06:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b6588e9sm11405868f8f.14.2025.03.31.05.06.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Mar 2025 05:06:26 -0700 (PDT)
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
X-Inumbo-ID: 92eb5435-0e28-11f0-9ea7-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743422787; x=1744027587; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SoXdx9362lMuWFXm4rmKqTwJvk4L9cvuVpZbFweaOMM=;
        b=gBr3D/NCMJJEeQt4fYmGuMGZIcdosi1UwzuqdAwJOmoIOol7t8vv58IlmpL7Nk9V15
         7sa7/oasccOUABwtCf2kh/RmgOyo62OlH2EjKIAB4ZyFmW2I1LK9kk4ImCY1m466LpGx
         UrcTm1UawDpy28tXJwwSifd8TMR9iU/y6ZdNreQwUTvjDVZ6/9nNaJd5ZpzO98tIfBMu
         ggyIVJYcbsLyiPHAwj4oiPz2tY08lFTV7PI0RRhIkUAYav4zD3EWGJHPnXPtbDTdeJnt
         uPlQB1wmaO5pfiwaAV1gBrtjEW40X59nbAx8PMrTSsQiCVnQsraSjeQJnWRx+x9TGFPa
         a91A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743422787; x=1744027587;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SoXdx9362lMuWFXm4rmKqTwJvk4L9cvuVpZbFweaOMM=;
        b=BoEviVcjUgGCMrZ/fk8zW1Jsn4NcSC4Ma5nS5uNVQYQzSk494HECAqK1/D/A04glQH
         tYnl1v1vHRguFDsDIybK9VvbJ6ls6vU3sZEVtUGCk1YVlH9ONqPkSOk8jjX8iNbWKxTb
         YWNhBcC0P4X4XPpu4awcCR5acL+TkoPp6+hrhUwM+K56rNO0anPujt2kXAdST0zC7ebS
         WgqVTokH7NTsMbxJX2mvMD7FHNESjh5Q1SN4BUuhMAvUvOO9MoqqIZt/RNVh8JFCFtIM
         unx8D85mXDX4zRByw7nQRVNJGuC4GnWtBq5xnXj7T5Iutf2aOXCY3HjQqlX5/t09TgU8
         Os/Q==
X-Gm-Message-State: AOJu0YzX28UpfOpH+apOXJv565tPYLb1eazhWbuZ6HhiF6qo3oor5PZA
	bwgBYDK1J3lve2Yhg45bqb8bMlMqL0uEFsyLxzsUC7FuhqrW5SZaA5umxcY1V1vpdxVi6emeZAQ
	=
X-Gm-Gg: ASbGncv/z2e8rXn+9RUgB+H+t0onwZ+iqLOpDVQtix5zeFD+OM/htlE15BAns+i51wc
	Fz9bIGrfn7wPK5CBxOCKCiQY+GnT+QS1fPYPtIO1YG8YqwRTVZg6RMi6v/8jgDKR39G2sy3t1ws
	iImzfRxbcpuWAA8AwnZaskQUf6NJnC2vNhnEZR1hULQ5g/V9twRpL7mes8rjBD8K0lXDqHpMQC8
	ixEELnJTzP5urjyVLz3yGlimR70WNuKLMo+gGwnOc5UFn9ZGI/5NmiMELyEj0bMzdrcpGcXZrOv
	OR2LdnB8QElg+TEmnxow75eyUKaNLVszq0jAC9qOtsg9Izyu89YeK0S/tY35fU1CyfbnmrffLhn
	wMVDYVqN27kDK7D7+ETs/lULTVyVXSXE27cHNDFVn
X-Google-Smtp-Source: AGHT+IH0YGOBCNj7awZ+RFFLpN/3l/0IlXszoKHnLvmSdQaBSbBhbF4G3OOdtXJb217wy9hNKpqlnA==
X-Received: by 2002:a05:6000:400e:b0:391:2e31:c7e5 with SMTP id ffacd0b85a97d-39c120cc88bmr6709027f8f.6.1743422787068;
        Mon, 31 Mar 2025 05:06:27 -0700 (PDT)
Message-ID: <4042ed88-5921-46a8-877c-81fa96a82b42@suse.com>
Date: Mon, 31 Mar 2025 14:06:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Config.mk: correct gcc5 check
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <03f284a2-cc9b-4950-89b7-f9feaac0e129@suse.com>
Content-Language: en-US
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
In-Reply-To: <03f284a2-cc9b-4950-89b7-f9feaac0e129@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.03.2025 14:01, Jan Beulich wrote:
> Passing the -dumpversion option to gcc may only print the major version
> (for 4.x.y it printed major and minor, which in nowaday's scheme is then
> indeed just 5 for 5.x).

I meanwhile notice that my self-built compilers print 3 digits, so there
really is a point to doc saying

"Depending on how the compiler has been configured it can be just a single
number (major version), two numbers separated by a dot (major and minor
version) or three numbers separated by dots (major, minor and patchlevel
version)."

I've locally changed the above to

(my system 4.x.y printed major and minor, which in nowaday's scheme is
then indeed just 5 for 5.x, which in turn is what my secondary system
compiler does)

Jan

