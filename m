Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F67DA58E0E
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 09:24:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.906193.1313640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trYQR-0000zx-4Y; Mon, 10 Mar 2025 08:23:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 906193.1313640; Mon, 10 Mar 2025 08:23:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trYQR-0000y3-1t; Mon, 10 Mar 2025 08:23:51 +0000
Received: by outflank-mailman (input) for mailman id 906193;
 Mon, 10 Mar 2025 08:23:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sahL=V5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1trYQP-0000xx-O8
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 08:23:49 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd341253-fd88-11ef-9898-31a8f345e629;
 Mon, 10 Mar 2025 09:23:47 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43cf3192f3bso7886075e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 10 Mar 2025 01:23:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ceb78e18dsm67960435e9.34.2025.03.10.01.23.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Mar 2025 01:23:46 -0700 (PDT)
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
X-Inumbo-ID: fd341253-fd88-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741595027; x=1742199827; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vJM3I/iPye/L6ru6I2ZzHRu7c7u5COrjTsrwqoxXGuY=;
        b=fFksLo4JcTbfbmJNFLVvB5Lb4vo3DpRG7IRR0gyMv4Bsir2sawetLfneh28GXODYgt
         z3zZS9uCn3psTwrgEJfy9VqJAtKsgeSJCKBytHU1+wtlRIge2yjS3yGGWjdMNC4Np/wr
         QmA6uPI1n+byK9IKz4tHtEtc/v94e9rqziYOXXRAa6Mb2TjzRA2ejXXAhcQ1UHbJdtq/
         G6BePw4FkTkBYV1BOImwvyCkSvBo5GnlqE7YVdM3H531VZCtM4K1nU7FsmRnLMT08j/3
         BIf0OI9D6ylhiTT6bQUQLTk30ELr9vpNQai6MNNY36xtvzMPC1QRzDSYdcA+i8ueeqfB
         +VLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741595027; x=1742199827;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vJM3I/iPye/L6ru6I2ZzHRu7c7u5COrjTsrwqoxXGuY=;
        b=SSJSlqrmfMMjcNmy9J8mQs7128TP9XDfAQAML6rlvcCTllbeVBYQDcuejowh8sq8qy
         C2uW6IjdQmA/I4Hf+bcae1dUP21Nbc7IEsktqXyoLXTfJVxeQA/6LQ9fsKmk1pc7W741
         xtSncxgIHRRBHoeugWRXmo5Prk8s6G81ScvCGQMd4WgbXNIUJCrHokzgOEP0p/8SRE0u
         H3Z5UmVs/feeJY9G+urkE+VRxiB2tTEPZJwPC3tFK60maLBn7TxePfK2U3A69mmS4B91
         b4wSENZ2UuGucImXhknkjcLuG1y9HQg9mG52BfEpY7C+pp9vKavMDkinptqpdprDoFmL
         5iPg==
X-Forwarded-Encrypted: i=1; AJvYcCVs99zgWIXnGOYAE7h3bwAy+oAnY4+fne+0rBLxRmdgTkor99X3SQMz+TpwXJOLJjR6LLUp/2UBksg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw8Cd/PuQe8wPvJ9YyASgkfmsGQvX9SdlZqAygxi6o5otNokRQn
	O482HJjHc6QIC2z63Ln0IT3VPPPYmUrsXavZJbqsL8bMXQnLW9N5TAUVwUVT/Q==
X-Gm-Gg: ASbGncveDKVQW6XXtWIPToPxMpqILn6P/9Fi9HRIU6B9t6Jin9LP/XIDhECcJw6Ep03
	VE5mzBvzO7JQz+eDBnPlTeJ8ottyoLmhFj2XIakmfE7EIwwOkvu57dayXpl21CxxyLvSIaVPmBz
	YqXbMhyxzyarAGk6vW/4D5L+OaQvfOcfiuaT3VtZ0agln0v+6cORvsJYj6d0lM11l/WfKiRyrfV
	u6aVYEVgJnFCdIUFL+3dX/6wTzrIW2LUdRnoIFgjIWOmOTUL+ZUJNgwxaGbE9VLcFP1PgHFuGb2
	NhBZ59O53F1V4YWg0II8L2UnwJ7Wn9oniG/SfXCug2POisgkjsj7hGNwdj5dbgPt4GGJWkqrjUy
	W/XHPiiMeuGhtdAQidypb+AIR+u68/w==
X-Google-Smtp-Source: AGHT+IESXDuZpJvXZRhIgKBoUyy7pzt836dB7b2KJdLGuISuN4m/C82irkRbImBscQx1VeVNHVWLug==
X-Received: by 2002:a05:600c:3556:b0:43c:ec27:8de1 with SMTP id 5b1f17b1804b1-43cec278ef4mr40089175e9.10.1741595027209;
        Mon, 10 Mar 2025 01:23:47 -0700 (PDT)
Message-ID: <169bd7cf-dab9-4ecd-b951-a5ee6cbc069f@suse.com>
Date: Mon, 10 Mar 2025 09:23:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/domain: Initialise the domain handle before inserting
 into the domlist
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250307164637.3087855-1-andrew.cooper3@citrix.com>
Content-Language: en-US
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
In-Reply-To: <20250307164637.3087855-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.03.2025 17:46, Andrew Cooper wrote:
> As soon as the the domain is in the domlist, it can be queried via various
> means, ahead of being fully constructed.  Ensure it the UUID give by the
> toolstack is in place ahead of this.

Nit: The latter sentence is a little bumpy to read.

> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



