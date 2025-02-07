Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EB9A2BE6C
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2025 09:52:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.883496.1293458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgK5G-00037O-51; Fri, 07 Feb 2025 08:51:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 883496.1293458; Fri, 07 Feb 2025 08:51:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgK5G-00035w-1f; Fri, 07 Feb 2025 08:51:34 +0000
Received: by outflank-mailman (input) for mailman id 883496;
 Fri, 07 Feb 2025 08:51:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YZ94=U6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tgK5F-00035q-G2
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2025 08:51:33 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba880cc2-e530-11ef-a073-877d107080fb;
 Fri, 07 Feb 2025 09:51:32 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-436202dd7f6so19827325e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 07 Feb 2025 00:51:32 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4391dfd7d7asm46308375e9.36.2025.02.07.00.51.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Feb 2025 00:51:31 -0800 (PST)
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
X-Inumbo-ID: ba880cc2-e530-11ef-a073-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738918292; x=1739523092; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dRc9YTNzuTZdjYtXt3pqobtE26JPtcORUPd5tgPp6F0=;
        b=Me7H5QOQozb9f9BlQW2bwJITWJj7Onh0N90KzgSzliy7ood2A8A8+i7aV0B77Ymmai
         nd0BKTTO3GNumasS+MG1o1kOgLTpgReMTfZF45pi05EFYXXl2mCLWP5IS7lTcrmyVQ1Y
         2O7zWWV75QryBEhh822iftG8VyyZw4Oja0FQ9cC4VX5Czq+7ErV0Ozr7MKAuxkx1TiUD
         /qrDgEnaeh/2LN93UF0tDIKzoNtgZ1l4qEwfunipSRwHFCRE6T8vE7yupd/8x/o/ehtE
         PDuBcAYa6c//u1KOOTA923c1E1P0h3KRa1x0/n65Go1DYiDL6gtjeoSKXOB66XaoOpHh
         w8Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738918292; x=1739523092;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dRc9YTNzuTZdjYtXt3pqobtE26JPtcORUPd5tgPp6F0=;
        b=SGymNAvE0dcxD8VXAEOlYq5/SzRZt+TDNKG69gmtCxxiIT5QgEF+HyXTCPJIhTSoIt
         XWaj13utMd7oloOE2Hr58/Scos0oqqIhpOviLDTjT6/5g6DOtBB19e+jYsp7nQQSCcII
         779MzGI73wONKaepC0muJ1FJm+KryfSKDVH5mq34p/Ci4EYp2DrSOYtlo3aifoiNNvDG
         LLL6wm1sZgok+/+fzu0Np06kBG5YteGJ8IIaUvYi45Vu3Py+P2VYIHFPlbmhtHAn0DlA
         QhM6DqrFrzGiiSdHGMi6Z3WbHSSAasMpkOYXr3H9/eK1Kcw+/lLsjmDuhe74u0BP/UZg
         zrjA==
X-Forwarded-Encrypted: i=1; AJvYcCVxMDSX7Gq2k5wC0zSb9r0ZhDqg6tY8R5I5UhTau7H6jiNkVLayWTTNL+a7Zp5EmhDDz10H6S6GEiE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxOg+s74e8bNbK5rGUpyJB+buMeM1uITH0dIySkSLQegAwKwiXR
	Hw40BoVtanYGMKRSrRFCXGMa/7D5fmyJSwTnxkPOFGhv5byX9gNYM10LvG4XXA==
X-Gm-Gg: ASbGncu52Yvcu+dvnvlksBL+noMxDow82unbHOrgbCxkzIPapssxfob8xATBY0371MQ
	wYaUII1FzxJ6Hp1HataqyGTmODgjDbcneyO839hVXfqC8uJbh1Fu46MNK2Elzq3bW5F766h2Mkl
	KBxNSZOsp0z2n2ojx357+qUyIAWt1fTZ+7498EnoqUXvUoyDNRbuGc9BY+ntxfWOSSfN1yoJ9nQ
	3w5rT1U/QiOPJErz9bduE18oDQ7w79oCt1m3CdEnT+3aM7gfj9dAHLVP5aD6TAYKrJltIU6wv4j
	SZvTD0cqlC43UEMldXQtJRZJo64bwjM5FJENx+jzLE0haGKMnFhZqXOwmaM+DtNRaVPm5JyUCwf
	m
X-Google-Smtp-Source: AGHT+IE/PwZ5ySxKvaJR+Onw29NT/0GmhRNMXPtyeTsxyFcpZSGT8N+9uK7T9VuCkRDehcaEFuxk4Q==
X-Received: by 2002:a05:6000:1fac:b0:38d:baf7:8d38 with SMTP id ffacd0b85a97d-38dc8dafc9emr981676f8f.12.1738918291775;
        Fri, 07 Feb 2025 00:51:31 -0800 (PST)
Message-ID: <fed6f1dd-8c32-47d7-b879-e38b372bf4eb@suse.com>
Date: Fri, 7 Feb 2025 09:51:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/console: introduce is_console_printable()
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, dmukhin@ford.com,
 julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
 sstabellini@kernel.org, xen-devel@lists.xenproject.org
References: <20250207005532.345746-1-dmkhn@proton.me>
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
In-Reply-To: <20250207005532.345746-1-dmkhn@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.02.2025 01:58, dmkhn@proton.me wrote:
> --- a/xen/include/xen/console.h
> +++ b/xen/include/xen/console.h
> @@ -8,6 +8,7 @@
>  #define __CONSOLE_H__
>  
>  #include <xen/inttypes.h>
> +#include <xen/ctype.h>
>  #include <public/xen.h>
>  
>  struct xen_sysctl_readconsole;
> @@ -50,4 +51,9 @@ void console_serial_puts(const char *s, size_t nr);
>  
>  extern int8_t opt_console_xen;
>  
> +static inline bool is_console_printable(unsigned char c)
> +{
> +	return isprint(c) || c == '\n' || c == '\t';

Nit: Unlike ctype.h, console.h has no indication of using Linux style.
Hence when moving the function here the hard tab should have been
switched to four blanks. Can likely be adjusted while committing.

Jan

