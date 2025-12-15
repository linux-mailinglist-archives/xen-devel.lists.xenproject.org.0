Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A849CBDE01
	for <lists+xen-devel@lfdr.de>; Mon, 15 Dec 2025 13:50:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1187000.1508427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV81o-0007nd-Ad; Mon, 15 Dec 2025 12:50:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1187000.1508427; Mon, 15 Dec 2025 12:50:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV81o-0007lH-7H; Mon, 15 Dec 2025 12:50:16 +0000
Received: by outflank-mailman (input) for mailman id 1187000;
 Mon, 15 Dec 2025 12:50:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0ibL=6V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vV81n-0007lB-3j
 for xen-devel@lists.xenproject.org; Mon, 15 Dec 2025 12:50:15 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9911ad26-d9b4-11f0-b15b-2bf370ae4941;
 Mon, 15 Dec 2025 13:50:13 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-477619f8ae5so26381525e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Dec 2025 04:50:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a8f6f118esm72255745e9.3.2025.12.15.04.50.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Dec 2025 04:50:12 -0800 (PST)
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
X-Inumbo-ID: 9911ad26-d9b4-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765803013; x=1766407813; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=V0a7lLUjSX3NokxNjCBEIrxQK10UTN7G3Brkr3DLc8M=;
        b=grR5rY+4/B1KwwHKfQ0wurzoxgKWReIYAZYStAIijaCQ0Rabzr7IVtFBkr4ICyHTR5
         LNfYAVR5tM2xbtR6sPRUKsqMtPyuY56TLwabh62IKMzOv2XZZ5VizevvxqoQ1vf2ingF
         gvNVIJ988x17kFP6908IEDp9i/BdpUEaevYlf/pVcHeJQ0utSdo67Uhrr9SQfFYV9gIP
         AZzDr8NoYhu9wG8gemUpHewLfX+tOa/zJ9YVO3sUh9Lm0PStplIt6unRcH45ocT9P66u
         raZeVEbcnx169Sh+Dgm+CkuA5PQkL3tDCss+kSQKqMsOrPbKk2H8p7N/et6q6g7DDnia
         mHpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765803013; x=1766407813;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V0a7lLUjSX3NokxNjCBEIrxQK10UTN7G3Brkr3DLc8M=;
        b=F70wlnTCZWqf4z2cyrAYaZlHigDdU8+SjUyMgExlGB2lgfT3JUG1WgfA6hTGMOjEYK
         Sge0dyL5EJNCTmBRgZj+qNfvJ+roftNzQWq8PcG2kgcrjY84Nior4W6WebOyXwP+kMGo
         VKbefyPDa4cwCE1kwpsH+hbRCWf5dbxfxFXOND885RH+I6TbO35UrbOvsmySL+DWVwvF
         uapP4DjqFeN1TPH0Aqdy+hBsvJlgWy8KnWZBqcMwx44pVbXejveUkKTkHncUg7R744fY
         b43Vxuny/BOAJBQIhCkP0RdT1TOlTaCoQ6gau7zgviUYZCiaf6srZ6N7ElXLUUEo8MIT
         fAYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBOg715KdEkgQNyzYalspnTs2asJ8NO4n/X0mIcDIykyalgqyeQyJi70scxdN2LFw/d+/8xrYpPjw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxoS9If9sJN0u97emSW406MvoL4DIGyeGBKn3TpJqtjV+5EwUJF
	0jizklBtl69oN2dBfg9p0DEjD10GEdLuDR/rhdv/abzMGA3DAo4lYSuK/Zcw7FnKWA==
X-Gm-Gg: AY/fxX52N978pbM2CAY9ZuZbWggk1d7pMx+lDRIUDVwzwGKmJ9vdqhCE/prE9K/C0SO
	mJDPafUDF5Y9UNY4vOmsvEmmi2vJ0iVDnd8Qgk8MnsJsUe+0A8JTZD5BzmU+d33Oxsh1EyJLx15
	wK1ChFobrGe5ftke7kbG5rmZ4idwQ9C86Y4SloqwzA8vJEIJq3niXilbmBWP7m//X+Pc0IGAprh
	Xl7monJYPFU4flq+FaVI558D+CEpWqYg9i4M7DOJXWD4Vc9NEUTyL4lcqKk+ln99nsV4zmJMkl9
	cnXCZkM67J1LMiguWpqK8wtApuqHRPPfIL0n3jIOWedddXY05Zfw4EN5ewgbD0rIi4NFZrBbycI
	wE0xO/NwL6pGp20szczijPMjuhqE6SpLLMwkLrokgHoyoq+VrmstpmmvE5iF5fHPssSEXuigumb
	XvzC+kJXeUp19hd7Phhe3sffirco0f+9IGc3FkFO2PSyrzxzAjqJVnEvleStdPAOEsvhfHpKH/r
	fMl1QLj1rWIwA==
X-Google-Smtp-Source: AGHT+IFYRxoTB1iC7pB0YZasPGJqVkoqcihp+HiAGE2Dtc2YP3aSSyNv2pCx3u0zCi3p0J6rZ/KxqA==
X-Received: by 2002:a05:600d:8449:b0:477:79f8:daa8 with SMTP id 5b1f17b1804b1-47a908011f8mr90939105e9.17.1765803012872;
        Mon, 15 Dec 2025 04:50:12 -0800 (PST)
Message-ID: <5d4df3f0-1391-4063-ba48-684ca5058af3@suse.com>
Date: Mon, 15 Dec 2025 13:50:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 20/24] xen/x86: wrap x86-specific domctl-op with
 CONFIG_MGMT_HYPERCALLS
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, grygorii_strashko@epam.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20251212040209.1970553-1-Penny.Zheng@amd.com>
 <20251212040209.1970553-21-Penny.Zheng@amd.com>
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
In-Reply-To: <20251212040209.1970553-21-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.12.2025 05:02, Penny Zheng wrote:
> --- a/xen/arch/x86/include/asm/paging.h
> +++ b/xen/arch/x86/include/asm/paging.h
> @@ -57,7 +57,8 @@
>  #endif
>  #if defined(CONFIG_PAGING) && !defined(CONFIG_PV_SHIM_EXCLUSIVE)
>  /* Enable log dirty mode */
> -#define PG_log_dirty   (XEN_DOMCTL_SHADOW_ENABLE_LOG_DIRTY << PG_mode_shift)
> +#define PG_log_dirty   IS_ENABLED(CONFIG_MGMT_HYPERCALLS) &&                \
> +                        (XEN_DOMCTL_SHADOW_ENABLE_LOG_DIRTY << PG_mode_shift)

This needs wrapping in parentheses, at which point indentation of the 2nd line
will then also be correct.

> --- a/xen/include/hypercall-defs.c
> +++ b/xen/include/hypercall-defs.c
> @@ -196,10 +196,10 @@ dm_op(domid_t domid, unsigned int nr_bufs, xen_dm_op_buf_t *bufs)
>  #endif
>  #ifdef CONFIG_MGMT_HYPERCALLS
>  sysctl(xen_sysctl_t *u_sysctl)
> -#endif
>  #if defined(CONFIG_X86) && defined(CONFIG_PAGING) && !defined(CONFIG_PV_SHIM_EXCLUSIVE)
>  paging_domctl_cont(xen_domctl_t *u_domctl)
>  #endif
> +#endif

/* CONFIG_MGMT_HYPERCALLS */ please (as soon as #if-s nest or there's other
complexity).

> @@ -279,6 +279,9 @@ hvm_op                             do       do       do       do       do
>  #endif
>  #ifdef CONFIG_MGMT_HYPERCALLS
>  sysctl                             do       do       do       do       do
> +#if defined(CONFIG_X86) && defined(CONFIG_PAGING) && !defined(CONFIG_PV_SHIM_EXCLUSIVE)
> +paging_domctl_cont                 do       do       do       do       -
> +#endif
>  #endif
>  #ifndef CONFIG_PV_SHIM_EXCLUSIVE
>  domctl                             do       do       do       do       do

Hmm, paging_domctl_cont ahead of domctl isn't very nice. Of course much depends
on how all of this will look by the end of the series.

Jan

