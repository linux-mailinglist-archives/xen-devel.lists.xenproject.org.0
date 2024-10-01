Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E42B898B5BD
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 09:37:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807773.1219411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svXQS-0008V0-71; Tue, 01 Oct 2024 07:36:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807773.1219411; Tue, 01 Oct 2024 07:36:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svXQS-0008Ru-3A; Tue, 01 Oct 2024 07:36:04 +0000
Received: by outflank-mailman (input) for mailman id 807773;
 Tue, 01 Oct 2024 07:36:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jjk+=Q5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1svXQQ-0008Ro-OC
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 07:36:02 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ceada99e-7fc7-11ef-a0ba-8be0dac302b0;
 Tue, 01 Oct 2024 09:36:01 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a8a897bd4f1so783136066b.3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2024 00:36:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2775b47sm670143366b.19.2024.10.01.00.36.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Oct 2024 00:36:00 -0700 (PDT)
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
X-Inumbo-ID: ceada99e-7fc7-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727768161; x=1728372961; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=58jZ5FooZDBgSInjg3t7huQ/UIcBWOZEXlZDn2KMdWg=;
        b=bgDrNdMxgxvZU/UDXgBGYlW2g5xRt0h5U3yevV/oMvM7IMrwQ56adR3yQP2Cq83KID
         gWNNLE+73TEo23/LlkaYoDAfeKkvnyzeobnB+eYXhmPPCic0vGx0CKYgv2C1/ftC43Mi
         c0TScom2Mr2ypiltQ2YGZjaPZuEBNyGOoPKvihi0jnm5MicE+st30HdWrvSsgbmDXn86
         OuMsrSbOxa6uKyIQwZrc4+7xtSVbFjhFQza/9YtIcQHnIzy/TEbhM+AXzzZH+9FA7nCe
         ewWH/XIbHa9rFiKRsdzJk9ZlDsmbCCeptgtYdbDWESw7XK+TvmucKl+kLLu9bbqcjcAc
         rVwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727768161; x=1728372961;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=58jZ5FooZDBgSInjg3t7huQ/UIcBWOZEXlZDn2KMdWg=;
        b=WrOeUATfaUSB2I84PpDRTxoBd4Le3aGlLEPIiawOEKbXzGhQHy5LRQbRZof6vWPIsJ
         F7kIJABS5OjC64ljHfjl9VWUHJHemc3+syNUwBCisfICvhulQUjD0Uy0icnvxxSViJHe
         ZcbWbfWsg5h+lcLEdJaYzTBCvXQGUeV7eEVKhNJAFKdFuRCxNh9/9YyuDMbvQa8Pd5wv
         IKUgN5RU4ajULHiAAi9ze5PVf4g97EUD3H9rZ4qYGQz3P0pUfb2xruuTLJ77ac26k/Yf
         hV1vRnelTHP3FnrZxzheGfDl5Q9iEHdEnOdZ8t25yb1hxkD2Lun1y/YPq2j9UuklZt/s
         ltVw==
X-Forwarded-Encrypted: i=1; AJvYcCVKi4f51DMlrwWmx6MXlf5IzSxlVn58/v2kg6X6eDKvrEMpnR6TNoy9G7hzBB62mB0fH8a3myR1WJ8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzgM21tV08xUoxk3vzMpz/IDwSC/KGpwcrhY5CkTLeMjACNVf9o
	nRZBkWtnatH1lwHxX80Ec+L3YARJcmbygOMhd/JYvaMel4o1xNkbSdli3SKp2Q==
X-Google-Smtp-Source: AGHT+IHC/4RHESF/zl2gZyRApuXHM7Id2xEpFEM7DqXsfhKIvsv/ph3l63u/vzd6anBFArIv/ANI2w==
X-Received: by 2002:a17:907:3ea7:b0:a77:e2e3:354d with SMTP id a640c23a62f3a-a93c490996bmr1678404466b.23.1727768160837;
        Tue, 01 Oct 2024 00:36:00 -0700 (PDT)
Message-ID: <4045d42b-76dd-464d-af26-85fd9b0b9f05@suse.com>
Date: Tue, 1 Oct 2024 09:36:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/pv: Handle #PF correctly when reading the IO
 permission bitmap
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240930161837.1248144-1-andrew.cooper3@citrix.com>
 <20240930161837.1248144-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240930161837.1248144-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.09.2024 18:18, Andrew Cooper wrote:
> RFC: Should we make the boundary check be (port + bytes + 8)?  That would be
> more correct, but liable to break unsuspecting VMs.  Maybe we should just
> comment our way out of it.

What would the "+ 8" be intended to express? (I take it you mean ...

> --- a/xen/arch/x86/pv/emul-priv-op.c
> +++ b/xen/arch/x86/pv/emul-priv-op.c
> @@ -169,29 +169,26 @@ static intguest_io_okay(unsigned int port, unsigned int bytes,
>  
>      if ( (port + bytes) <= v->arch.pv.iobmp_limit )

... this check, which looks correct to me as is. In particular with the
"+ 8" there would appear to be no way to access ports at the very top of
the 64k range anymore, as PHYSDEVOP_set_iobitmap handling caps nr_ports
at 64k. IOW I think "commenting our way out of it" is the only possible
approach.)

With or without such a comment added
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

