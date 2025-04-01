Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F573A77A48
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 14:00:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.933923.1335757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzaIR-0004Gv-DW; Tue, 01 Apr 2025 12:00:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 933923.1335757; Tue, 01 Apr 2025 12:00:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzaIR-0004E0-Av; Tue, 01 Apr 2025 12:00:47 +0000
Received: by outflank-mailman (input) for mailman id 933923;
 Tue, 01 Apr 2025 12:00:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WxAi=WT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tzaIQ-0001md-OQ
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 12:00:46 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1c8fd8f-0ef0-11f0-9ea7-5ba50f476ded;
 Tue, 01 Apr 2025 14:00:46 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-391342fc1f6so4859179f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 01 Apr 2025 05:00:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b79e33asm14112644f8f.66.2025.04.01.05.00.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Apr 2025 05:00:45 -0700 (PDT)
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
X-Inumbo-ID: f1c8fd8f-0ef0-11f0-9ea7-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743508845; x=1744113645; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3qekdNUqCvpMaPyCEk3DKVrFHTGPXVQAlbwO0gptoXI=;
        b=YczKRiYnDoK1PTdBAPEmH9ljr4ClO17JFLvGZNicyGV/7aZWMTHttXN6ThKRHbWSxf
         1Q03RfRBcsta9zFYGmgHl8PUhi4MjlB3k8+8AoM9wRS+qhY5gavKO1xXxji6NP8P7Xew
         8puPUiuqAs/v4FqNUbdDTCeXeL8hJ6Fn6XA26+6tlta02rYF59OFQ+FnH0bmwzms6qKP
         FuGYj/ow/DW4AAUTLpWqj2UfV5J+4HJaea5UYGvfehvnvhKw4UqSfazFl8D1QYxWq3ti
         O+fGS6I7tD13O3MfShdf9CTuZYgnLKEjx13pU/GYKSfRFi4P1NoHM4fmXKpPoFWaMQpf
         XrYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743508845; x=1744113645;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3qekdNUqCvpMaPyCEk3DKVrFHTGPXVQAlbwO0gptoXI=;
        b=jlzj7LAXuiC5xBKF3x+P0D24It35Iorgn43DjBmgeV5x5yvnGWIaIQBbCOfDbi7JFc
         SvHct3GbkLtXFUOoZAOSUCkUhjZ8T3Ck9LRf5Dso7Vv1JsETQSLxagrjXUbj5SS8L8n7
         Wb8n6gFDJ3z+s0dBB9dICMSMVP10CoHi6LGU4T9mRXo7BhfoD1uAEoomjopDV231PyEy
         6XbvsuqgsWus+xV7apyzTg5scm1o29ZymjWSoRG/JSEaMJKZJ/qZkPe9OoGxq/nFWDMq
         iC5KKryaN9F+hJCsLgGR3/NaMzth3QvOTX0L16CZpKO5QEq6izQgnk/VgWfgWenqooqs
         Hn2Q==
X-Forwarded-Encrypted: i=1; AJvYcCW18LHcb7TJUoHkwFfggyN4ryQ2+Tty9kgtUe5u8tskRtpl04dhMFYOWiZM1oKKKEONTj9nI1sDEB4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzHEu/6Mo2Pj+ZTvbkD0oYK69YPKIvySR2tzMDWj0FQo1DbTGU0
	H7rHJ3O1M32NMqsAw6DX1LWkaAnbqtj102B3gBhA8hUoXMvkmYiGdt1FQvhw3A==
X-Gm-Gg: ASbGncu8Riuzl4mQ3RSM1jUCN0G+P0oPjhgY74fUpEx2jybuCM2P59IxeTputdAE/Y8
	ukihlY5tCf2TfTu0EZ7dbIFVDt5M5S8GYO6Re4eI4YegOpWW0Njva4aE78kcV3I8pIpvRXASmlq
	Iv6IchqC6YiN3AYT7WiZiuvTjntmGhUc4g+I3P6COOCyCkl+aJcegdjFqnqDmLAEK+aHTk/qFpv
	8WF0054PNY7Y4k8/Q81INsALUD8tg66LXH3sUz7VLwSfSleVT2boC3LkSE8CP3LyT2MuI+AqFyF
	821r7s0e/SEQeDrMaKFCRF/C9C/tmYdX4nBHOYNWz0FzgqQTA3Fh+147WRPhpOAIMOm/HfGRcw1
	ujQonqUY0ig3PnHzaba86Q8/TYHgbhw==
X-Google-Smtp-Source: AGHT+IGVTjE50Mwt/p6Sslki70RiZ27mt2+FrE+rzDOSTBuemDjaHYm6a+AoRHxZLZwTAn17dV4bsg==
X-Received: by 2002:a5d:6d8d:0:b0:391:1218:d5f7 with SMTP id ffacd0b85a97d-39c12114f44mr9718993f8f.40.1743508845445;
        Tue, 01 Apr 2025 05:00:45 -0700 (PDT)
Message-ID: <049a2acc-09a9-43b8-9937-960ce2b99fda@suse.com>
Date: Tue, 1 Apr 2025 14:00:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] xen: introduce hardware domain create flag
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250331214321.205331-1-jason.andryuk@amd.com>
 <20250331214321.205331-2-jason.andryuk@amd.com>
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
In-Reply-To: <20250331214321.205331-2-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.03.2025 23:43, Jason Andryuk wrote:
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -820,11 +820,15 @@ struct domain *domain_create(domid_t domid,
>      d->is_privileged = flags & CDF_privileged;
>  
>      /* Sort out our idea of is_hardware_domain(). */
> -    if ( domid == 0 || domid == hardware_domid )
> +    if ( (flags & CDF_hardware) || domid == hardware_domid )

Since it's || here ...

>      {
>          if ( hardware_domid < 0 || hardware_domid >= DOMID_FIRST_RESERVED )
>              panic("The value of hardware_dom must be a valid domain ID\n");
>  
> +        /* late_hwdom is only allowed for dom0. */
> +        if ( hardware_domain && hardware_domain->domain_id )
> +            return ERR_PTR(-EINVAL);
> +
>          old_hwdom = hardware_domain;
>          hardware_domain = d;
>      }

... doesn't this code then also need to set CDF_hardware if it's unset
in the function argument? Then:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

