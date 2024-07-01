Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8654291DABC
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 10:58:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751402.1159359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOCr6-0000pX-N8; Mon, 01 Jul 2024 08:57:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751402.1159359; Mon, 01 Jul 2024 08:57:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOCr6-0000nK-Jx; Mon, 01 Jul 2024 08:57:48 +0000
Received: by outflank-mailman (input) for mailman id 751402;
 Mon, 01 Jul 2024 08:57:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kQX2=OB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sOCr4-0000n7-Ry
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 08:57:46 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc0a5a4f-3787-11ef-90a4-e314d9c70b13;
 Mon, 01 Jul 2024 10:57:46 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2e72224c395so30297001fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jul 2024 01:57:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7080256afb5sm5958027b3a.79.2024.07.01.01.57.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jul 2024 01:57:45 -0700 (PDT)
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
X-Inumbo-ID: fc0a5a4f-3787-11ef-90a4-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719824265; x=1720429065; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pF6GHpIlhAXYM7R/16+MysgWYBsHsZeHRu5IpiScw3A=;
        b=Lyb23x+iaK8vqL2roBejuULKssP4OhUjGj/kSJ1KZSrV2K5l+drQ8ge2hcLrtlO3sj
         lqUxr/zPdYvz/QkHhmyMIhAWwb0PE4Vy5OaQ8fw59MscyI9XFlG3xtkAxoGJ/+FfSqF0
         zGCytWqF8fBv083weoIVNqoX5Z61CpmdG1mTnFKYsyX7H9J/AOVH0XpZO8q7VCpCF1ug
         AkQ803I7+ofzKbrIiD+MaRGJrd89Nuurhoiek5V7T9kHMVcBp28/nInkS8F/oNITZ8fB
         tdUxWJdk+kpZwisGeMaqCCOekLINEznkanMFu98nwQ4WRhZ8XJiaKTgFUDI0ZUArWKT5
         URVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719824265; x=1720429065;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pF6GHpIlhAXYM7R/16+MysgWYBsHsZeHRu5IpiScw3A=;
        b=sXZ7kXygvraDRaNXWRyjm2JOIjUvgzvQKMJiGaGqDhxt5zMiVMqtpid7DRPIkKan6V
         oUgazUewAj021tC8kIezmfF56YWblg35zq+oo3sHY+vYTu75lD0slcuXTrEz83vdbHNu
         ZdZsl0pGWyL9VEDBHLh7lA/lKyIsmlWin4cSFhtzO7JU1keXi+dI8J45oDZU/64WDcWY
         FveeSrXYs+PVbv+mZZrKxPcfWlT3nJvlhg711nEOFdhuAWV3WHG8kdELJaQ7MAkuiFZM
         iKhUlwSmrepH8QGD2cC2F1IJNP517lj/ltdzEOsaVVTJBSvpL4CQhCWvE94B+j6xqpDa
         ep6w==
X-Forwarded-Encrypted: i=1; AJvYcCX4QVRNypNx+g0631Dw7SZFemeuF0b1hfLPJhI0CSRxnqXXK/vRxQKtQuZP5EBWgzbDcL5ZXjRA+5Tic4fK0UnOiYwIA+DC4+3Q9PYYqCs=
X-Gm-Message-State: AOJu0YxgNO2hfVmSY1mpkmeof2qV9jAOSec2vq0EA9qwYOVk4ZmDq3MD
	bWumZShboh35IEvSzUGT9g/OEBu52UeTwog2zSjOiCJtodZFL2yCvtU1lQjBa/Se0T+Qs1SqX5Y
	=
X-Google-Smtp-Source: AGHT+IE4W3MmL2KDSVsGyPYGsF6+s8zABiHMNW5cAweIWWhJAN6qGo38f+F6H578d9S/NMEJHsAC8w==
X-Received: by 2002:a2e:9613:0:b0:2ec:5b10:685a with SMTP id 38308e7fff4ca-2ee5e35db6emr31987791fa.17.1719824265592;
        Mon, 01 Jul 2024 01:57:45 -0700 (PDT)
Message-ID: <4cc9a5c7-df57-4a90-8164-cf3002596870@suse.com>
Date: Mon, 1 Jul 2024 10:57:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 09/12] x86/mm: add defensive return
To: Federico Serafini <federico.serafini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: consulting@bugseng.com, xen-devel@lists.xenproject.org
References: <cover.1719383180.git.federico.serafini@bugseng.com>
 <acb26329a980809dda100825f52b05d0cc295315.1719383180.git.federico.serafini@bugseng.com>
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
In-Reply-To: <acb26329a980809dda100825f52b05d0cc295315.1719383180.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.06.2024 11:28, Federico Serafini wrote:
> Add defensive return statement at the end of an unreachable
> default case. Other than improve safety, this meets the requirements
> to deviate a violation of MISRA C Rule 16.3: "An unconditional `break'
> statement shall terminate every switch-clause".
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Tentatively
Reviewed-by: Jan Beulich <jbeulich@suse.com>

> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -916,6 +916,7 @@ get_page_from_l1e(
>                  return 0;
>              default:
>                  ASSERT_UNREACHABLE();
> +                return -EPERM;
>              }
>          }
>          else if ( l1f & _PAGE_RW )

I don't like the use of -EPERM here very much, but I understand that there's
no really suitable errno value. I wonder though whether something far more
"exotic" wouldn't be better in such a case, say -EBADMSG or -EADDRNOTAVAIL.
Just to mention it: -EPERM is what failed XSM checks would typically yield,
so from that perspective alone even switching to -EACCES might be a little
bit better.

I further wonder whether, with the assertion catching an issue with the
implementation, we shouldn't consider using BUG() here instead. Input from
in particular the other x86 maintainers appreciated.

Jan

