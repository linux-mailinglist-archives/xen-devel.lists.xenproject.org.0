Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13048818589
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 11:48:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656649.1024974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFXeC-0005vd-3w; Tue, 19 Dec 2023 10:48:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656649.1024974; Tue, 19 Dec 2023 10:48:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFXeC-0005sI-0e; Tue, 19 Dec 2023 10:48:24 +0000
Received: by outflank-mailman (input) for mailman id 656649;
 Tue, 19 Dec 2023 10:48:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z0wA=H6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFXeA-0005sC-NT
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 10:48:22 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 205f6c7e-9e5c-11ee-98eb-6d05b1d4d9a1;
 Tue, 19 Dec 2023 11:48:21 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-336672406f0so1911562f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 19 Dec 2023 02:48:21 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 v18-20020a5d5912000000b003365e7f35f4sm8883594wrd.46.2023.12.19.02.48.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Dec 2023 02:48:20 -0800 (PST)
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
X-Inumbo-ID: 205f6c7e-9e5c-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702982901; x=1703587701; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2q4xN6y8OUPTcH9aKJaNvWJwQ77oIP2jYturtuqyKCg=;
        b=g+jA8znhSoXvil30Bhh0AARe+2Cg+AflZEUIY89vmL1R8qiZf8JUOYlpAkbpV+Mfml
         WhTi3njpZd2lD895IYFV1D//EHqy498rEt+jGZnLyxv1ipZhrvtqvvAPvemoMM9Kmpc3
         z/mzxcfoeROHLA35GtZXr/SN/V13l1F5tClFA8WO5JAjoynCLy8+7Ht4IxeF8UmIXua7
         MLf9aHJ7QJumP8fRhQslt5Wa6kNk3zvUEteQUHI0emCcnmCNbzmqbatyTo4+J6yPnG0G
         Dq9dUfs7fab8gwxKxDekfMxsRYLSxABdV7x41vjwrf/cGhA6UibXdhJ+WDNkHYZYDtth
         RwWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702982901; x=1703587701;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2q4xN6y8OUPTcH9aKJaNvWJwQ77oIP2jYturtuqyKCg=;
        b=pRtUvf4SLJhHOzqjgfs+DvublXyeM57vx3ryZpWkkseGgojPDCztOinTAfaePLTYZj
         Sn4xqjxY2k0AY5AmqTiJ0KwaD805ilGKys6VVCqUe70ei9tJfH7gdCe2AYmNdIOxRXIF
         RTUyO+Dy0LoqemkG0OpDVD85B0w2/lhvnhq/rEeadl3NYUGGq+LdnqQhY9ELd5PrUyoM
         RVJlOcKO6a8yfRePxF3qtlMO7WMmMTBfd0T4p7Db3U8Ibfv4mQcnJNNGbrNRGQtMOSW3
         t0E9o3dEQRoW8R7eR144i+QFv1pn60zqQ/g42RR/mVb/730eLM0+zOPZPKcSJI3EGF0r
         yldg==
X-Gm-Message-State: AOJu0YwCl0zXxarFl8CagCn3EcaCAtfnYa1GqVXK5rRmkspQpms1XSUW
	qV2tPhWI5iM4ydfXy7n9CRCq
X-Google-Smtp-Source: AGHT+IHrMEWLad+X4b7RyX4o43WZfFSzFm/SNztrSBGBGEo78iWt8SjgOYlcVQVr68b7mhYItB6DHA==
X-Received: by 2002:a5d:6707:0:b0:336:6426:4e1d with SMTP id o7-20020a5d6707000000b0033664264e1dmr2513626wru.17.1702982900883;
        Tue, 19 Dec 2023 02:48:20 -0800 (PST)
Message-ID: <09b8c0e5-b0d0-428b-8e72-d66b4ccf8c9c@suse.com>
Date: Tue, 19 Dec 2023 11:48:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 5/5] xen/wait: address violations of MISRA C Rule 11.9
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1702553835.git.nicola.vetrini@bugseng.com>
 <a4e13ba24ab54895454d8df1c956865f7cf7f0b5.1702553835.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <a4e13ba24ab54895454d8df1c956865f7cf7f0b5.1702553835.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.12.2023 12:44, Nicola Vetrini wrote:
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Nevertheless, imo ...

> --- a/xen/common/wait.c
> +++ b/xen/common/wait.c
> @@ -125,7 +125,7 @@ static void __prepare_to_wait(struct waitqueue_vcpu *wqv)
>      struct vcpu *curr = current;
>      unsigned long dummy;
>  
> -    ASSERT(wqv->esp == 0);
> +    ASSERT(wqv->esp == NULL);
>  
>      /* Save current VCPU affinity; force wakeup on *this* CPU only. */
>      if ( vcpu_temporary_affinity(curr, smp_processor_id(), VCPU_AFFINITY_WAIT) )
> @@ -171,7 +171,7 @@ static void __prepare_to_wait(struct waitqueue_vcpu *wqv)
>            [sz] "i" (PAGE_SIZE)
>          : "memory", "rax", "rdx", "r8", "r9", "r10", "r11" );
>  
> -    if ( unlikely(wqv->esp == 0) )
> +    if ( unlikely(wqv->esp == NULL) )
>      {
>          gdprintk(XENLOG_ERR, "Stack too large in %s\n", __func__);
>          domain_crash(curr->domain);

... in both cases the better change (more in line with what we do elsewhere,
even if not liked by Misra and hence being deviated by us) would have been
to use ! in place of == NULL.

Jan

