Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D43CA9E889
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 08:51:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.970098.1358869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9IKM-0005Ld-9r; Mon, 28 Apr 2025 06:50:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 970098.1358869; Mon, 28 Apr 2025 06:50:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9IKM-0005Jf-7E; Mon, 28 Apr 2025 06:50:54 +0000
Received: by outflank-mailman (input) for mailman id 970098;
 Mon, 28 Apr 2025 06:50:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5hYN=XO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u9IKL-0005IA-Cj
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 06:50:53 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 204ccff3-23fd-11f0-9eb4-5ba50f476ded;
 Mon, 28 Apr 2025 08:50:52 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43ea40a6e98so41798175e9.1
 for <xen-devel@lists.xenproject.org>; Sun, 27 Apr 2025 23:50:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073cbed98sm9983782f8f.48.2025.04.27.23.50.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Apr 2025 23:50:51 -0700 (PDT)
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
X-Inumbo-ID: 204ccff3-23fd-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745823052; x=1746427852; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IyHkp5gRATiKumJtgIE2KJBpq3+lauuvvQ6VWuetA3w=;
        b=Q4m2xGyCbUfgkX0MfkcaiTmmpjVaTYxJCsuv95Prj16jgaJVDxax7MnxbqAMTgE6by
         eiQklR+NF8+35KP5SeVtdEWLgaFTbgU5VQRhoyWjP3ur50kXhYenUrke2xiEI092k+CP
         7F4wDn9xrm1BKRqQ5xp0BBTKpBamyv7W11/c9oUAFKs0DS9wPpYdgQbLo+gFm7bqeZR6
         MopUnqAJDioLMSwTNlzfe3au08YJ3F04v1H41/1G1ivhZhvRQbzu1oE/M2crS1uPMQr7
         oJGzt3eDBhUtrHLquBklo+v1p5SDi7B6WR7Qpgh320jKUiLAu+xrI2i0oQOACCHiYptK
         Momw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745823052; x=1746427852;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IyHkp5gRATiKumJtgIE2KJBpq3+lauuvvQ6VWuetA3w=;
        b=FFbyNvlHQWrUn6WEcXIAB9iFR9MDZU/LmO9j3BSO1uuKb00aHFkJKm2vY8aM5PzkTo
         aaLLaBp21BGf8aNX9VGF6HQskTAsDHmjGL7RAvKPr7Ot3ylZjFZJLqdGe9M12hXrYBlq
         DJyn9Yy0PKrh3+800UpZ1FYBFMIaSbHtdXeVMo7SkG674WzYS9ak+hSlyDQIvKeyyM8l
         GeXVma222XRb54vWBXr44ZrwHnGHAvhHHIoMATe9C75CWycAl5j/Azd6N4FrLe0sU3Xg
         v93YwZCofJok7LaeOjjezXJFtvYFkO/XMaIYG42hRdkYYHB0LeCiaN78OGxYyPV7tXR9
         woQA==
X-Forwarded-Encrypted: i=1; AJvYcCWdzVsqLZU1/67T3ywkd8K08aetYQ44cGGfkzMWC5RG/Bg+lfYtgcHCsJicJ9nS9U4gYOtgW2q5xTQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzo8H2nHAjYqt8sGdUX9xK+Clag4aWp0k5mcisOqJaBx+B7OMPY
	M5u8XsljzEwr/Cmbp8gFpMJxwq6MJHkCcKCN9JXG2QCwBgRtC6Nv9xIxt458Pw==
X-Gm-Gg: ASbGncsU9l3+XUmvDZnEAbCDDqQnlt5gMd+WR1p8j/2kOyqLRgq8njkysnqzq2FW3lD
	3KcPehogbW6A31y1Sr3btG4zlnC6CCWIyrB58VMNL5dZbV/O713gfUUo8OVLrQSDQsRYYGLiiLT
	gkAuomaqle8phhjBACtCKAUSutPrQSMmCpMs517En5SaFJ39Z8qQVyGoozu+ag4zzVe0XyHke9s
	VGjnQ0C6SHNlk0glc2HHHBs2eMDehG+cCeZ4jtPQYPtIWopbCi5B8dnAaup38cxc1+btNrqp4wB
	mL/b1sSNbvPnUl475g8OZirl1/vNJemL5JUUKf2OqQQe2LIiomuVkLtPd0AUX/vnmWtQV1miq5r
	/vbLbqUQKDSUfv4rlbzkxzZAQjA==
X-Google-Smtp-Source: AGHT+IGoJl73UDGLD5e5sMwkrRhqsL+gaK4OgidPTzywd1ng1wrZvXqVJr8n/WJ6MyyWqi10g/Qh7A==
X-Received: by 2002:a5d:63d2:0:b0:39f:4d62:c5fc with SMTP id ffacd0b85a97d-3a074e43194mr5849601f8f.35.1745823052034;
        Sun, 27 Apr 2025 23:50:52 -0700 (PDT)
Message-ID: <cacff70d-5269-451d-b264-4d02b299e677@suse.com>
Date: Mon, 28 Apr 2025 08:50:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] xen/console: cleanup conring management
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250426185021.100646-1-dmukhin@ford.com>
 <20250426185021.100646-2-dmukhin@ford.com>
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
In-Reply-To: <20250426185021.100646-2-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.04.2025 20:50, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Move console_locks_busted handling inside conring_puts() to remove
> tasklet code duplication.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> ---
> Changes v1->v2:
> - added Stefano's R-b
> ---
>  xen/drivers/char/console.c | 29 ++++++++++++++---------------
>  1 file changed, 14 insertions(+), 15 deletions(-)
> 
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index c3150fbdb7..aaa97088aa 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -325,6 +325,17 @@ static void cf_check do_dec_thresh(unsigned char key, bool unused)
>   * ********************************************************
>   */
>  
> +static void cf_check notify_dom0_con_ring(void *unused)
> +{
> +    send_global_virq(VIRQ_CON_RING);
> +}
> +
> +static DECLARE_SOFTIRQ_TASKLET(notify_dom0_con_ring_tasklet,
> +                               notify_dom0_con_ring,
> +                               NULL);
> +
> +static bool console_locks_busted;
> +
>  static void conring_puts(const char *str, size_t len)
>  {
>      ASSERT(rspin_is_locked(&console_lock));
> @@ -334,6 +345,9 @@ static void conring_puts(const char *str, size_t len)
>  
>      if ( conringp - conringc > conring_size )
>          conringc = conringp - conring_size;
> +
> +    if ( !console_locks_busted )
> +        tasklet_schedule(&notify_dom0_con_ring_tasklet);
>  }

As before I'm unconvinced it is a good idea to have tasklet scheduling here.
You also didn't address that v1 comment of mine verbally, iirc.

Jan

