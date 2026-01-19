Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96584D3A214
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jan 2026 09:51:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208031.1520256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vhkyR-00073b-R8; Mon, 19 Jan 2026 08:50:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208031.1520256; Mon, 19 Jan 2026 08:50:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vhkyR-00071E-Nc; Mon, 19 Jan 2026 08:50:59 +0000
Received: by outflank-mailman (input) for mailman id 1208031;
 Mon, 19 Jan 2026 08:50:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5NKf=7Y=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vhkyQ-000715-N0
 for xen-devel@lists.xenproject.org; Mon, 19 Jan 2026 08:50:58 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f84dc2e1-f513-11f0-b15e-2bf370ae4941;
 Mon, 19 Jan 2026 09:50:57 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-47edffe5540so35598625e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 19 Jan 2026 00:50:57 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47f429071a2sm235389895e9.11.2026.01.19.00.50.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jan 2026 00:50:55 -0800 (PST)
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
X-Inumbo-ID: f84dc2e1-f513-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768812656; x=1769417456; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ptll9SHWVZupN3kNFevmi2rV+p8ZUoLcqAweBYKdp9E=;
        b=WZMiichWdEwUcWMW9QgAKN9tJqoGyLuynYUYUjqRoVX1ymU8U0az/M+fKnOFY3/RDa
         sFKU7K0HL6nfTIqAStpSwQMg+eeR+yfh/rX8lSDtoezfdiSDoW/n4YDhG6m0/6xW7O1Y
         c+ZgDAD9ZfaFQ1BVV2/6ug8t9Vccw1ft5+rN/hq/D5ywssMQFK1SKnWGhR5V/3u8LCsD
         60+9hkXtY0estrfBC7MgOTwVjlVLt6rzmni59TZbem1UpyTKoPdT3IqSMc0h7JvA4KDz
         jl6R2Y4geBkdr9PCNvMMWqimMZvBbJcE0aB8aQpn6XQwLV5u5uYVo0oEUHDayr/JYTPE
         mJOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768812656; x=1769417456;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ptll9SHWVZupN3kNFevmi2rV+p8ZUoLcqAweBYKdp9E=;
        b=GAkbSnuwmnKF5ytKJNXrpk9qDAty6B8cOmYJ25dcm9s+j7bU0f4IdoaCPJBPhVYZV6
         PXXVJ30/95F0rnEJsYsl1T2iwjoXPpDpgGle1zt6w+3S/X16WlxnfTRK5KrQ53Ccclqu
         ZCE/31wOB6viqZvXlpC4BhcJZjTDoEREnLuLepjZgaOOs1WgFpIJT95zzqQy/wxn1yPr
         WoDDGHPNdKVJBOS0E09e6Au66KUwDKBckhQfX8/i+odql7rY7hY/Vtd64VDlsUlTq/Ad
         2IUPHKc7VnpB4+89xKppuKcnBiP+jfJhmCQSSPArZX1XUe3N6UQ3JFzEnPGLWbVIJvDp
         cmkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWI65cGt+CmRlrrZR/zFpslsTEfOVYL8nGQH5tO0vyeqVj14lErrVXlP8/LxFfN2fNG7SaF3CtpXXY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YysirlPvC+nV5TE/+dxKPHwfGweNezl8GOy5VdzT8GYJJFuMiXe
	zYder21ntUvNNXQad17EXD0XyWnKlZt1FETetbwglYaMSo+7vmGtUOlQHLRwxCrakA==
X-Gm-Gg: AY/fxX62iiADT8bstw/MOOm+MBW7iV0Wf+FejvfcGJ0Taq1FJP4ar085HINCGsdZG+q
	eblBXNk5mDKD58zc1KCSwdGuKtU7Px90/sTLaiER5Nl5n7jxct24EPVHHRCLOmHiCEoNV+MRjLc
	87fepOziP1g4dbr4t58NdSWO//hEwrsr1FZMcbvz+JdIcZhs0DupQtfksgASl2U0bL83OTuWhA1
	fzilk/t5SAUu/+CeSFMVpggdBsj0Qx4YjklBjDcghvruoOdLwYynd3HT59YH57b+G6ahGFW2djP
	eh7et6Sqb9FYIAsgSdOvpJkNbYHrK5xYReYaFkooGJaqVv1G0pKaWubEKeJaGfTqtlYdz9Yz/fJ
	kkecZe2JzPkg8gVjF/PmqsH1BDa377fvKFMmO7ZyNy04nJ5V9+HWaN/jmJFgHvVBlouKaofjmW9
	IbJHD7UAnjzcUL8AYQLLZpojZefF8Ij2CwehwVCZ7WnF5KvUvtZGIEPfcb5PFTmHRQU4GZqGcMr
	14=
X-Received: by 2002:a05:600c:138a:b0:477:1af2:f40a with SMTP id 5b1f17b1804b1-4801e33c066mr158758235e9.17.1768812656132;
        Mon, 19 Jan 2026 00:50:56 -0800 (PST)
Message-ID: <e456a747-40c6-47e8-95b3-992a3900e571@suse.com>
Date: Mon, 19 Jan 2026 09:50:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] xen/p2m: move xenmem_access_to_p2m_access() to
 common p2m.c
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 jason.andryuk@amd.com
References: <20260115092841.2651224-1-Penny.Zheng@amd.com>
 <20260115092841.2651224-5-Penny.Zheng@amd.com>
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
In-Reply-To: <20260115092841.2651224-5-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.01.2026 10:28, Penny Zheng wrote:
> --- a/xen/arch/x86/mm/p2m.c
> +++ b/xen/arch/x86/mm/p2m.c
> @@ -2203,6 +2203,46 @@ void p2m_log_dirty_range(struct domain *d, unsigned long begin_pfn,
>      guest_flush_tlb_mask(d, d->dirty_cpumask);
>  }
>  
> +#if defined(CONFIG_VM_EVENT) || defined(CONFIG_ALTP2M)
> +bool xenmem_access_to_p2m_access(const struct p2m_domain *p2m,
> +                                 xenmem_access_t xaccess,
> +                                 p2m_access_t *paccess)
> +{
> +    static const p2m_access_t memaccess[] = {
> +#define ACCESS(ac) [XENMEM_access_##ac] = p2m_access_##ac
> +        ACCESS(n),
> +        ACCESS(r),
> +        ACCESS(w),
> +        ACCESS(rw),
> +        ACCESS(x),
> +        ACCESS(rx),
> +        ACCESS(wx),
> +        ACCESS(rwx),
> +        ACCESS(rx2rw),
> +        ACCESS(n2rwx),
> +        ACCESS(r_pw),
> +#undef ACCESS
> +    };
> +
> +    switch ( xaccess )
> +    {
> +    case 0 ... ARRAY_SIZE(memaccess) - 1:
> +        xaccess = array_index_nospec(xaccess, ARRAY_SIZE(memaccess));
> +        *paccess = memaccess[xaccess];
> +        break;
> +
> +    case XENMEM_access_default:
> +        *paccess = p2m->default_access;
> +        break;
> +
> +    default:
> +        return false;
> +    }
> +
> +    return true;
> +}
> +#endif /* VM_EVENT || ALTP2M */
> +
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/include/xen/mem_access.h b/xen/include/xen/mem_access.h
> index 4de651038d..8e7d9ea2e3 100644
> --- a/xen/include/xen/mem_access.h
> +++ b/xen/include/xen/mem_access.h
> @@ -73,11 +73,6 @@ typedef enum {
>      /* NOTE: Assumed to be only 4 bits right now on x86. */
>  } p2m_access_t;
>  
> -struct p2m_domain;
> -bool xenmem_access_to_p2m_access(const struct p2m_domain *p2m,
> -                                 xenmem_access_t xaccess,
> -                                 p2m_access_t *paccess);
> -
>  /*
>   * Set access type for a region of gfns.
>   * If gfn == INVALID_GFN, sets the default access type.
> diff --git a/xen/include/xen/p2m-common.h b/xen/include/xen/p2m-common.h
> index f0bd9a6b98..bd4169caee 100644
> --- a/xen/include/xen/p2m-common.h
> +++ b/xen/include/xen/p2m-common.h
> @@ -43,5 +43,8 @@ int __must_check check_get_page_from_gfn(struct domain *d, gfn_t gfn,
>                                           bool readonly, p2m_type_t *p2mt_p,
>                                           struct page_info **page_p);
>  
> +bool xenmem_access_to_p2m_access(const struct p2m_domain *p2m,
> +                                 xenmem_access_t xaccess,
> +                                 p2m_access_t *paccess);

CI says "no" on both PPC and RISC-V. I wouldn't be surprised of build issues
on Arm or x86 either, seeing that p2m-common.h doesn't (and shouldn't) include
xen/mem_access.h. It's arch/<arch>/include/asm/p2m.h which is responsible for
the inclusion ahead of including p2m-common.h. Question though is: If this is
an x86-only function, why was its decl put in xen/mem_access.h rather than
x86'es asm/mem_access.h. I'll try that before giving up and handing this back
to you, but may I stress again that you please properly test your changes? It
is not the responsibility of the committer to deal with such fallout.

Jan

