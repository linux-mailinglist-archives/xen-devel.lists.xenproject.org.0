Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 377CCA5BF9C
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 12:47:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907948.1315138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1try4Y-0006u7-03; Tue, 11 Mar 2025 11:46:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907948.1315138; Tue, 11 Mar 2025 11:46:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1try4X-0006rQ-TA; Tue, 11 Mar 2025 11:46:57 +0000
Received: by outflank-mailman (input) for mailman id 907948;
 Tue, 11 Mar 2025 11:46:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EmiY=V6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1try4W-0006rK-Gn
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 11:46:56 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 878ac211-fe6e-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 12:46:54 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-ac2a9a74d9cso337860666b.1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 04:46:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac2a385e09dsm297184766b.48.2025.03.11.04.46.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 04:46:52 -0700 (PDT)
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
X-Inumbo-ID: 878ac211-fe6e-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741693614; x=1742298414; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oo+zFSk1rEJLd5hQmX0r94e4LlW+Zu7ptqf6pG4Xz8s=;
        b=Nbby92TjuJyqL1V7wgE+2T3qeH10M4Ip/JtJLCnnQf6NAxw8H8ufW+0AOiJ6v+MJuZ
         FaSeT8mxCpIwO8o9rmDr+Tv/0MNZLILTuSuSRxRr0TFgSj6g8QZO4uWbjrucIpsnfPH3
         4zL/cdUPo+ugEywe6uFLYNhZF4KC9Z6XsnMX/JgAWZtRIPX9FLOrsOCTqvQLT69T8cw3
         xDg9mdSX4gOw2p1KtbLBbFQpj47G5UjwyW3uZiR4vHdMRY4jT6thH3h0fdi4xwZv61Ge
         W775fQQ8mTnHshSWHhRer09OoDrFFo3ZsG67hJSyLd24iCCaibOMsDSmeMRabralFWBF
         K1ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741693614; x=1742298414;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oo+zFSk1rEJLd5hQmX0r94e4LlW+Zu7ptqf6pG4Xz8s=;
        b=ZNdMJ0D6ekk3bWGO1/FYjiPEn9Fb7bQgLKgeh+Fv7ghPKXnSgQYCVfXdDWaqeuOPgA
         P/NnRRWVTAXp8qMetNDv6nXfWHRb41Vnp1JIbBbCe1z/aCADZaIOcH/zg4eQgjoa6BII
         JCDydycxnaxW+8OZG9JQrJ981m5eveYP1sWbh/tiiPESui4fudO1xdGfCIvgu4D0hh8d
         zQ+ChMl7nsQMgXU4HJ5DwkA8hBncVmvXil6Xgtl+olfV3bEmn8AiCLw2MW3EsoJKC5Oj
         TGs7YKrQnj+knPPPxexzN6d5vTOdVWqZ5BUdkAhe3e1bsLH67Ivy47A3LloeGOjVMHlh
         rAHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXspIEhJ8eEjrS4ENlamXrDaRrf6wm173iQLfj7cIWWaEuGa0kEeKgJK0X++2yRLorVENCdK7NgePM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzQZ4/Ajtw87i0ZRzdfFO8zuNvM96zxPRBthZjysD2w7FP3jPg9
	f4z2UEqtsIDZLjdNdjI5OJm9jYaPMZlz8MLfyvybMmmh+PIqlt6oN/99ugiMeA==
X-Gm-Gg: ASbGncuvuvr9tiZ+yde7EqRx4k4UHfRDd2P679PRv+6/OEAscoqNnNdRiVF6HFqRKCe
	3JGLurvtswIyd2++R1R4XBbrmtFTMtXd3MVYFoDFQhEK5FRdAl7QK4KBP2XK1FLo6Na66a/wkwL
	+n5agYMY1yblN2NKBSs5pBZ27vvpbTqpEF+qFFw5GmZ/sqlpkSmlINUVLNymAb9uThJSo5TRUrc
	6FOHOufxhBGRWWUFVCQNdzUyo/uBWSyJCXSMciBJ/lUAnfwwA4T/O0slNYe5U2hxFsGfKD+6yJA
	1Fgp0/eW3leGF3xH2WBlwXNgXRkPlnjJkNMdZV4iVN9nZX1AoT9M/V0pWdNtJoSFeY+bywIq1SA
	/DKggbGqVkBm+DyVnbyWh8tfYQnBC/g==
X-Google-Smtp-Source: AGHT+IEXRrV+YxhntIWg4PtUh80zEOtYNr1aFeTzgUieJF81VjXaMzyNN7PmtuiBpRx/FIcO9v3HAA==
X-Received: by 2002:a17:907:608e:b0:ac2:b826:1e6b with SMTP id a640c23a62f3a-ac2b9db3c7bmr435021366b.4.1741693612636;
        Tue, 11 Mar 2025 04:46:52 -0700 (PDT)
Message-ID: <6668a29f-0b78-4579-8583-132d9fb3df0c@suse.com>
Date: Tue, 11 Mar 2025 12:46:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 7/7] xen/arm: scmi: generate scmi dt node for DomUs
To: Grygorii Strashko <gragst.linux@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Roger Pau Monne <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Juergen Gross
 <jgross@suse.com>, Grygorii Strashko <grygorii_strashko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20250311111618.1850927-1-grygorii_strashko@epam.com>
 <20250311111618.1850927-8-grygorii_strashko@epam.com>
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
In-Reply-To: <20250311111618.1850927-8-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.03.2025 12:16, Grygorii Strashko wrote:
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -1223,6 +1223,13 @@ struct xen_domctl_vmtrace_op {
>  #define XEN_DOMCTL_vmtrace_get_option         5
>  #define XEN_DOMCTL_vmtrace_set_option         6
>  };
> +
> +/* XEN_DOMCTL_get_sci_info */
> +struct xen_domctl_sci_info {
> +    uint64_t paddr;
> +    uint32_t func_id;
> +};

Please take a look at the rest of this header: Outside of x86-specific
sub-ops there's no use of uint64_t; uint64_aligned_t wants using instead.

> @@ -1333,6 +1340,9 @@ struct xen_domctl {
>  #define XEN_DOMCTL_dt_overlay                    87
>  #define XEN_DOMCTL_gsi_permission                88
>  #define XEN_DOMCTL_set_llc_colors                89
> +
> +#define XEN_DOMCTL_get_sci_info                  90
> +
>  #define XEN_DOMCTL_gdbsx_guestmemio            1000
>  #define XEN_DOMCTL_gdbsx_pausevcpu             1001
>  #define XEN_DOMCTL_gdbsx_unpausevcpu           1002

The latter of the blank lines may make sense to add. There former shouldn't
be there imo.

Jan

