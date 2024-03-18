Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EAE987EDE0
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 17:48:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694931.1084207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmG9U-0006De-9w; Mon, 18 Mar 2024 16:47:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694931.1084207; Mon, 18 Mar 2024 16:47:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmG9U-0006B4-79; Mon, 18 Mar 2024 16:47:56 +0000
Received: by outflank-mailman (input) for mailman id 694931;
 Mon, 18 Mar 2024 16:47:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=emy9=KY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmG9T-0006Ay-L0
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 16:47:55 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 444415d6-e547-11ee-afdd-a90da7624cb6;
 Mon, 18 Mar 2024 17:47:54 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a467d8efe78so472934066b.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 09:47:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 e9-20020a170906c00900b00a46ce8f5e11sm564072ejz.152.2024.03.18.09.47.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Mar 2024 09:47:53 -0700 (PDT)
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
X-Inumbo-ID: 444415d6-e547-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710780474; x=1711385274; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3JQQC7SCOR0ADM40aLhKPCBH7sTI8Bxk7mQM461sbfo=;
        b=BJUXR7J6LNukJBHEdkdw3jgShFsyt/FF0grr/vHG68qp+LuPWp+P1aQbozRzXzSeuQ
         TGJzDd4IesZIgsVfQQiRQGKglbSIhp/kabnieECkoKsyJmYR06aOhayV2EkHh1UmmwM+
         rQzDRKAK+FW4CBreW2SCCLpX2d2gM2lkW5rVh5yo/h8eJTa7SyC1DfwIKFEYq0bsR+Rq
         M+duisopU6cVHDwUaTgdtH7Jt3h8na8ngRE9taXUdbcmh1xIRHRbflDGjHv5+MNfVf4E
         igKWCaPd80lwIYIV6buHzGod9mpKWO7c7XL0GLoFnHvufFM9fbc5JDHiK4vA4p0C+F1c
         WJqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710780474; x=1711385274;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3JQQC7SCOR0ADM40aLhKPCBH7sTI8Bxk7mQM461sbfo=;
        b=wX9NFUEy661AK1KsJMkorcyXjHuSd3lvWqRrZ57pWuWCIdabBSzd/zGdl9+jYlV5B7
         oZ+tdx2r9VC9pkHjR7ZyX3VazPR23NjqX+vhNTZxn29NjsERz9sZZBkDnFBQB8MLj0KC
         jKlAfH+uS3wM/d0eepyXVqOq6Qm49cB+hvMSxg28uw5Gf0zuq78WlLZrxZlpKYy6FuyO
         cSYsdrGVVr91uGaZrp02noAh+aV3Mx4jisXpqOofE6RXvjSwoU5xqaqCsBRD/kAJlO0/
         phw4ebwpFEoQOy3dHJ751JRuOt+G+pnZ8D+Pan5u0PsslyWGZ9ix9XoP1UEIqfP7+qdN
         /WQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFSNgtliPdjHaZ2iqXoEtHmf+y1JiwmmtIGMBpUkeECnIL0RqWgMx4kavHMgurkvrSR0oz+KnuXEHAfjzar5GyNTVQDre0dmmIw9KVNHI=
X-Gm-Message-State: AOJu0YzoWDZu54OYgTrbm/qHvXl2qiAtrwBJn2eNiUReU26Qvw00Ap+l
	nYZKPuif9gYAbjUWZAOhPFXBrgqWoGQEASsmXaSVPjX/BQVUqDG5r9IcrrueEw==
X-Google-Smtp-Source: AGHT+IFJpirN2ACSw9GPznDMX5THDiGiTds4anPrl9HayfkJPBBd8DafzaimSZUH39buKyLeBRbzAQ==
X-Received: by 2002:a17:906:3e18:b0:a44:51c1:733c with SMTP id k24-20020a1709063e1800b00a4451c1733cmr8337654eji.39.1710780474163;
        Mon, 18 Mar 2024 09:47:54 -0700 (PDT)
Message-ID: <5a3a2087-36fd-4ac7-8cd7-7dc29a0d0bd5@suse.com>
Date: Mon, 18 Mar 2024 17:47:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 05/10] EFI: address violations of MISRA C Rule 20.7
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 xen-devel@lists.xenproject.org
References: <cover.1710762555.git.nicola.vetrini@bugseng.com>
 <66095ff2496d9b2be701877a3df762293fc8708b.1710762555.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <66095ff2496d9b2be701877a3df762293fc8708b.1710762555.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.03.2024 12:53, Nicola Vetrini wrote:
> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
> of macro parameters shall be enclosed in parentheses". Therefore, some
> macro definitions should gain additional parentheses to ensure that all
> current and future users will be safe with respect to expansions that
> can possibly alter the semantics of the passed-in macro parameter.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> This file is matched by exclude-list.json, but the fix is rather trivial
> and actually benefits code that is in scope for compliance.

Hmm, yes, the change is simple enough to not be a big hindrance even if we
were to pull in incremental updates from gnu-efi, so
Acked-by: Jan Beulich <jbeulich@suse.com>

Albeit preferably with ...

> --- a/xen/include/efi/efierr.h
> +++ b/xen/include/efi/efierr.h
> @@ -22,7 +22,7 @@ Revision History
>  
>  
>  #define EFIWARN(a)                            (a)
> -#define EFI_ERROR(a)              (((INTN) a) < 0)
> +#define EFI_ERROR(a)              (((INTN)(a)) < 0)

... excess parentheses dropped in exchange:

#define EFI_ERROR(a)              ((INTN)(a) < 0)

I may take the liberty of doing so while committing.

Jan

