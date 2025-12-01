Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B03C98330
	for <lists+xen-devel@lfdr.de>; Mon, 01 Dec 2025 17:13:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1175888.1500483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQ6WK-0005Wd-3q; Mon, 01 Dec 2025 16:13:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1175888.1500483; Mon, 01 Dec 2025 16:13:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQ6WK-0005VB-01; Mon, 01 Dec 2025 16:13:00 +0000
Received: by outflank-mailman (input) for mailman id 1175888;
 Mon, 01 Dec 2025 16:12:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0dw1=6H=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vQ6WI-0005UI-Bk
 for xen-devel@lists.xenproject.org; Mon, 01 Dec 2025 16:12:58 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99722be1-ced0-11f0-9d19-b5c5bf9af7f9;
 Mon, 01 Dec 2025 17:12:57 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-477a1c28778so50418375e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Dec 2025 08:12:57 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4791116c0acsm249945665e9.7.2025.12.01.08.12.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Dec 2025 08:12:56 -0800 (PST)
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
X-Inumbo-ID: 99722be1-ced0-11f0-9d19-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764605577; x=1765210377; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0+QyCyMhm+d4P3mDrjW3JiBgI+OLgmknpMMXTQ6TJcs=;
        b=a3kiHeqA9U5RJpseLLQViUIrzfn8tWsAYU83NOtmUrRkPOSp8JcEYR3OEjCKe32m6U
         hhICbhWdliI0cFu+meOw8n2vlYNqt6fm203pOWqak9biD0LOaZX1kUk2lZJv2M8sHlvB
         zY8KOBs1l2vNUVa6uzesKwzpP7FJlKYB57kRCCOO9+zl5LKk/1RPE5EsshhKNj7JDyNf
         MsueXLDo1N0uB2dnossfdoxXXlWmF6rwbaIjk0DMqie9KYHfBoaHlD+LudoxRcZfg+Vb
         J0irEmXgY2+GcCQT/Ck4bL7T3LpV2cYR8juuqMytrrw40wuofufYYDyvyP6zJZ8m/rq4
         CR7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764605577; x=1765210377;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0+QyCyMhm+d4P3mDrjW3JiBgI+OLgmknpMMXTQ6TJcs=;
        b=cObLNnK/yI6b7ujLA152emmjZxaPbZ5Av/d+Aw1MMLHuzu0ywWo+5hZJa4x8P8ZzSt
         qTWMmZ3MzbX2FUJbkCDibMMj4jTzIPQPe+NmfsK2QRcHXtk3xG/+4jSuiYf+kWviMsBk
         JVdeM+q2dKMKK3tevv5J2rSK9KHmGN8MWUXFHFTJ8FMpqSm+M/v1gDF477u62Z2H1FXT
         yN+e/THwx4Fm2U/+yqumHApMGYUwl1P0KGT+dP2miI9T33D1IUjD4+fDthQUZ0OWVtzv
         4tHEEt6gHIOI9bG8hTVQ1KMJf4+jC1QL5fI8oQyCmnuq3B85HHCjb1o9LHuPCg9iFthS
         moqg==
X-Forwarded-Encrypted: i=1; AJvYcCViHshfQ/wXX8ZWPUkCzlUzEkyiTOuVgAo4mWNB2JFm/Z4bX4T4XOZXR9FDpUP50wJoqDhLKsAGR0M=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw/gVKn/cwE2yy4DFIVlouHjpV+YQhQKBfej1jaaIJvtIdc1KBd
	l9lm3kj1HVUbemF+dsqddF9ix3Tk+Ech5TaWmQFR3EhOGJojqTkwBojNELPnEFnltA==
X-Gm-Gg: ASbGncvTXYHhLxFH6CbRY6ACbDZPTYvm3BDqRNk351aE3ZG2YxvqCXJQatQR96r7mh+
	JfsoFXp/lJCWDzhI32k9X7yKT2AJm7aiWHWxSbfVrQcPXJKRaO5a/RtXINojnWo6dBFkpKS1DOV
	t2XEI8iZopc8N0kaYy+cFh33u24wg/jfr+gHW5JRBaSmREyLbRsuxXv0PE4xUGgfoSGmvTGRvPO
	sySxHazHx7eucWcC/KBFDSknVcVeQ346P63OuHZ+aHnSIMxYyDotxdW3ZG9p4HDAjvSlMwotAa8
	O4aCvVf2OFgp8JdCyWAuV9dbmnNOjRuQveGxhLJLVBDD38JF7Oc3JuwNu0dJHSeXslQB4yTHwfr
	IjvxpRjGcC1a94hSQRi+sl8BTneZmhFR1rSwLoXFL8uk5zLgUxrs+DnanTjU/6Ua3GRjnE6erJX
	NOFgYN9zLrtlvX024YyNlmRDYxpTy0VSMe3i0SMA2J2A4SwFmKbGTJWVIWg4QsU3TmOp4ECmn7U
	elyQgubJ8XF3Q==
X-Google-Smtp-Source: AGHT+IERL6XEyYunP9oNeqB05lJoQW1Rj2pCjwGStO/akjAVJkSdzcppMG9FHM05OQ7uPCIve24irA==
X-Received: by 2002:a05:600c:c8c:b0:477:9fcf:3fe3 with SMTP id 5b1f17b1804b1-47904a6bd48mr251206395e9.0.1764605576642;
        Mon, 01 Dec 2025 08:12:56 -0800 (PST)
Message-ID: <a34abdf7-574d-41eb-b22c-9aa4ba2f3997@suse.com>
Date: Mon, 1 Dec 2025 17:12:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1.9 1/3] x86/amd: Use setup_force_cpu_cap() for BTC_NO
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251126132220.881028-2-andrew.cooper3@citrix.com>
 <20251201160512.1311688-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20251201160512.1311688-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.12.2025 17:05, Andrew Cooper wrote:
> A XenServer feature in the process of being upstreamed is to be able to
> re-caculate the guest CPU Policies at runtime, e.g. after a microcode load
> and/or livepatch to expose new functionality.  Right now, upstream Xen only
> rescans the Raw CPU Policy on microcode load.
> 
> One complication with recalculating the guest policies is that BTC_NO is
> handled differently to other $FOO_NO bits, by using __set_bit() rather than
> setup_force_cpu_cap().
> 
> For consistency, switch it to using setup_force_cpu_cap().  This doesn't
> matter for upstream Xen right now, but it will ease upstream the feature.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


