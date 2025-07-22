Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DACB0D471
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 10:23:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052166.1420745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ue8HZ-0005Sm-KZ; Tue, 22 Jul 2025 08:23:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052166.1420745; Tue, 22 Jul 2025 08:23:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ue8HZ-0005Q7-Hq; Tue, 22 Jul 2025 08:23:29 +0000
Received: by outflank-mailman (input) for mailman id 1052166;
 Tue, 22 Jul 2025 08:23:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D6vH=2D=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ue8HY-0005Q1-TA
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 08:23:28 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 23d56526-66d5-11f0-b894-0df219b8e170;
 Tue, 22 Jul 2025 10:23:26 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-451dbe494d6so56898485e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 22 Jul 2025 01:23:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759c84e2727sm6966929b3a.33.2025.07.22.01.23.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 01:23:25 -0700 (PDT)
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
X-Inumbo-ID: 23d56526-66d5-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753172606; x=1753777406; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ndvqElTTc8Aeqp8cn+1Wh+oeTL9PfQZ5UmMTN+1M9nY=;
        b=KRNv/h4W+cuF76xifrPT+F7AzctJwIs2yDkaoz63gML5MiMkOUQjronOTRnAAKG5uC
         UyEjcI7h3SMwRAw/+VLMmIbiRQzqIWJOHwBtcP/Kq4KofX2SD6kQ2071db2w9DpFdLlz
         3LB4c0RrYCpuWm1ooLcXwo5t7lxC9Z9Ai4m54rFzyjmJP7omeSWPQ5frYC6Wo9h1mZSS
         SaV9+u4N1CmwGq5jDg3x/cUivJeoPxkM6bDjRXIjBk61J+IN6i9nzOsH2HhETkJSMx5J
         +djI4XBhKb+l24j1asYchPNPIQdKC4uXTGxJq6PjRyQXxGQzuazkRo1zUMK0FE17k+Ns
         osAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753172606; x=1753777406;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ndvqElTTc8Aeqp8cn+1Wh+oeTL9PfQZ5UmMTN+1M9nY=;
        b=FWjVdmWOUSfEzoAlHy84McgqYNOCdXm9+gUJ/M5fB2jo0JYw95+cYoAWG+LBNo6duS
         3bT7Q4OcoB03zj6xvoCAJhppIDlWgBncqMGXHujZByAkypuXZs/xycTV6MdQ4OU11cyH
         KTjE8NmZhHEBjQWjePxPF09nyQJfeWa0vRj2LeeKNkc6PxL/QUSsevwQCZnt97OThBLF
         ShqEmn9poMpekyyBsNxJ9qVRtpmd5cg3ZuF97vmz58ubtckfiGGy0qIcCDNkZdmMWQ68
         qArvwAVmgMfUhZkc+WbSATJbJhBag/zciQ/AfoTJurQYlSXDbPHx9wnkNEAxZ8IkQDoa
         FZKg==
X-Forwarded-Encrypted: i=1; AJvYcCVi64kMks7OJxbw0SL6iHo5v7S8qujBuxHmSZevihDx0ZW4wo9YZR5DrO7PrQo0YB/WCSWFIhFKG3w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzfwIrGar3mQK4PCk8cvvB+bnnRvgf3xr6sBsE5FwT7PBr/INXB
	seLhrkQqJA0wK8b/1go2B5eXDj0ZUSZPQFGUkIci/SlNAzKCN76zkaxUsuNDM16t6g==
X-Gm-Gg: ASbGncvdj9o4MhW/sZ1jvet6g7T0wxPBbvpd0FG2G8n1JU2OevgQqsH9AvOmD3//frb
	wg2f14AILHfDOgYLimHbaCprY8uJ7nj/zlcMj+wdiwtYEF18oLoK2UkhLArssIXV27GC3NWPzAc
	vRyqrqkRGAXlh+r6Vtn6pv/pEKkX3QGn+ZNqNCl7VynR+Zpa0SVLPHe6pGFlZg/j9orGvrTyDa5
	kzN82+Guq+ZX4Tr1knG121mWwA5I2L4vxuflCsItRJjick3DGCG2KnrodJb4OxGNuvPMH/1TSXR
	9K5jYP9pO+XKXzPS5IsUhw+VPAU2G5QtejohpM+NC3hU38hida2GObHzVnhrsCanVTayPlwKx1P
	befpFPK28fUmidagCq4rT6ZNDTkDvauAtp2KQDDsauI2X4XHMT0/HUdn1RRDxW1YMDv8ThsM7ER
	9qeA0Qd/g=
X-Google-Smtp-Source: AGHT+IEsfKepV0JtZkPJlLxBXMb2hykjDm+ngp9sU/vMxz8j+mdV3aiqBfA/b1qBKLUbOlUCpS/jDw==
X-Received: by 2002:a05:6000:98b:b0:3a6:d7e9:4309 with SMTP id ffacd0b85a97d-3b60e51c8edmr14437174f8f.29.1753172605820;
        Tue, 22 Jul 2025 01:23:25 -0700 (PDT)
Message-ID: <f1605fd9-4e98-4ab3-8fa8-ed52b0f76b56@suse.com>
Date: Tue, 22 Jul 2025 10:23:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v2 1/2] xen/evtchn: enable build optimization for
 evtchn_move_pirqs()/send_guest_pirq()
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Roger Pau Monne <roger.pau@citrix.com>, Ayan Kumar Halder
 <ayankuma@amd.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250718101149.3107110-1-grygorii_strashko@epam.com>
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
In-Reply-To: <20250718101149.3107110-1-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.07.2025 12:11, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> On platforms without PIRQ support evtchn_move_pirqs()/send_guest_pirq()
> functions are unreachable (Misra rule 2.1).
> 
> Move these function under CONFIG_HAS_PIRQ ifdefs to fix Misra rule 2.1
> violation and resolve call of evtchn_move_pirqs() from common /sched/core.c
> vcpu_move_irqs() code by moving evtchn_move_pirqs() into x86
> arch_move_irqs() callback (which is converted to define).

The patch title isn't quite appropriate anymore with this description, I
think.

> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
preferably with ...

> @@ -1707,6 +1709,7 @@ void evtchn_destroy_final(struct domain *d)
>  }
>  
>  
> +#ifdef CONFIG_HAS_PIRQ
>  void evtchn_move_pirqs(struct vcpu *v)
>  {
>      struct domain *d = v->domain;

... one of the two blank lines also dropped here, just like you do ...

> @@ -1722,7 +1725,7 @@ void evtchn_move_pirqs(struct vcpu *v)
>      }
>      read_unlock(&d->event_lock);
>  }
> -
> +#endif /* CONFIG_HAS_PIRQ */

... here. Happy to adjust while committing, but please consider suggesting
a replacement patch title.

Jan

