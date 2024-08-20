Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D95958147
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2024 10:45:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780210.1189837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgKU8-0002LB-Fh; Tue, 20 Aug 2024 08:45:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780210.1189837; Tue, 20 Aug 2024 08:45:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgKU8-0002Jd-Ci; Tue, 20 Aug 2024 08:45:00 +0000
Received: by outflank-mailman (input) for mailman id 780210;
 Tue, 20 Aug 2024 08:44:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yfvp=PT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sgKU6-0002JX-Dp
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2024 08:44:58 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a9c6252-5ed0-11ef-a507-bb4a2ccca743;
 Tue, 20 Aug 2024 10:44:57 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a7aac70e30dso561718666b.1
 for <xen-devel@lists.xenproject.org>; Tue, 20 Aug 2024 01:44:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a838396c682sm729383266b.196.2024.08.20.01.44.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Aug 2024 01:44:56 -0700 (PDT)
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
X-Inumbo-ID: 7a9c6252-5ed0-11ef-a507-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724143497; x=1724748297; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6yD8g2KoL50GiIU4H3yhFvykxcp80Bk8XWTn51eVuQw=;
        b=UUYRukFWr2LSMVR83A9voH8Ewl9T52oepVx/oJj0cvvSzw4fd+K2fte9QH3qryZbLz
         OP2cZ/L9QJk/bOlHxeqyJVqXxikXkoJV4d5K9g7PQc7nDmK2rVuCbLscOLEvwWJRMNSO
         j/YwtVlA0VIvDW8pW3j5B69TjHn7QejxwZsHM8OWu3O91Pf6nq9OUieABsr0Sx9AbIII
         QP2vaM2ICkiBAMJnXRc1h5HsKXwpOcF5piXTF4kxCKZGKu9sMtC/nsHjrRZYFRca1f4/
         qa82nDHGcBna64B50Bdp7IjKgd7vVdhuw3vzC/paF8ZMJOhAlgFWqjWoYCW3ErNO6KaE
         xLaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724143497; x=1724748297;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6yD8g2KoL50GiIU4H3yhFvykxcp80Bk8XWTn51eVuQw=;
        b=i2viZh9ivHMULhDHx3yY2X5Hk+zYbv8E0reJGhP6ivEbWvU7HFOHNWjdcEkFcEi1Hf
         gK7K+W9gMqGQ+FmEbJu0E7e8ehzgi9ciYtQX/nHq4kvGBK1HeWw9bvXD4RD1v5CiHijU
         rH3yWfdl6V6+k9/lT0FmloHFIScOxzw+Fdu1oqAH2UdzzrZWl2zRqPaSurxTBRHysjlr
         8qDDCeKdjUH42Cgm8898E3EBXcqAU1dA93fzGgFlk0zLYHU3uCsOwiIIoDXUc8eLIS05
         5z1h5qesCT98hA8hghwzX+Q0IRD6u0ydOnEQkBwG7JtlDLbPDKozQw1v4vVPN1IDaQOF
         JIQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUE9eTENRqBzar7mPIU89x9x4KdGUqjDRcDy2h9rx4hU++sYeCePld2K1/9Ex14QnhIGBUP2fOa2JBWun/sj4CL8zuVpJKKhOQjFjts0Ow=
X-Gm-Message-State: AOJu0YzDgsEd+aAXIp4ZWFXMVm6CQrvNoWD9eTF8u7HR7ij3H9SNVW7x
	MSuBtHVclikfTg+9Zh58Zl2yMrAzNIS4cip12PEeKMsa+NHI6ii30wufmrXrHzxmDnAvieZ+rME
	=
X-Google-Smtp-Source: AGHT+IGcH1K3GomaOMKnp10Sgh4hRQiaDwKk8MjXeZ4iL6GBsmVD3towt0FsuZ3Mxkev+5PfjgXUHQ==
X-Received: by 2002:a17:907:e29e:b0:a7d:c696:76ee with SMTP id a640c23a62f3a-a839292f15bmr1016706666b.17.1724143497021;
        Tue, 20 Aug 2024 01:44:57 -0700 (PDT)
Message-ID: <b9556863-1536-4310-8005-f92e8948356c@suse.com>
Date: Tue, 20 Aug 2024 10:44:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] xen: move max_pfn in xen_memory_setup() out of
 function scope
To: Juergen Gross <jgross@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org
References: <20240820082012.31316-1-jgross@suse.com>
 <20240820082012.31316-5-jgross@suse.com>
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
In-Reply-To: <20240820082012.31316-5-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.08.2024 10:20, Juergen Gross wrote:
> Instead of having max_pfn as a local variable of xen_memory_setup(),
> make it a static variable in setup.c instead. This avoids having to
> pass it to subfunctions, which will be needed in more cases in future.
> 
> Rename it to ini_nr_pages, as the value denotes the currently usable
> number of memory pages as passed from the hypervisor at boot time.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Tested-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

I wonder though why ...

> @@ -712,9 +713,9 @@ char * __init xen_memory_setup(void)
>  	int op;
>  
>  	xen_parse_512gb();
> -	max_pfn = xen_get_pages_limit();
> -	max_pfn = min(max_pfn, xen_start_info->nr_pages);
> -	mem_end = PFN_PHYS(max_pfn);
> +	ini_nr_pages = xen_get_pages_limit();
> +	ini_nr_pages = min(ini_nr_pages, xen_start_info->nr_pages);

... this can't be just

	ini_nr_pages = min(xen_get_pages_limit(), xen_start_info->nr_pages);

Jan

