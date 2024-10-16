Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5519A061F
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2024 11:53:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.819869.1233329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t10i9-0005BY-34; Wed, 16 Oct 2024 09:52:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 819869.1233329; Wed, 16 Oct 2024 09:52:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t10i8-00059k-WA; Wed, 16 Oct 2024 09:52:56 +0000
Received: by outflank-mailman (input) for mailman id 819869;
 Wed, 16 Oct 2024 09:52:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sXg9=RM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t10i7-00059e-J5
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2024 09:52:55 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a148a65-8ba4-11ef-a0be-8be0dac302b0;
 Wed, 16 Oct 2024 11:52:54 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-37d462c91a9so4072542f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 16 Oct 2024 02:52:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4313f6c5d22sm44778545e9.40.2024.10.16.02.52.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Oct 2024 02:52:53 -0700 (PDT)
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
X-Inumbo-ID: 6a148a65-8ba4-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1729072374; x=1729677174; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3UgS7OpM1ld1zoSp8JuQLsQDd5JjjbrgQkVmt5QIjrk=;
        b=N84Fcyvakf0qxZFRHAo4xhmx4QZ6O+SNrNdKsscGnU6+kijm6fAGzj0bdsLIx7O2hK
         l5+Dtz6u1SwZi0XUHFk5pxNCMSS4qClZ8U1SiMVRQMkHVLw7eOuRbCxRlagbkmS+oysY
         AOKN2tOf/7GvWkB6FKXVAJ9Q4yaq0GiKvC7HR71L2YtE4U7B5r3XmGw+E/uuz9qAVkjs
         l1r+iajXDNGVRqKWI5yn0XOXkIkEOkltRqC34WFYWuiX3PYaRxtG7qE772dF9OeHnsaT
         c+WUAYYne4e8ZanA36r4U4CM02I8sSYfJz5Owpwxh6hdz6n0pqCy1dA+gLFAmz9yg2mW
         qdsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729072374; x=1729677174;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3UgS7OpM1ld1zoSp8JuQLsQDd5JjjbrgQkVmt5QIjrk=;
        b=nix+kBcjB7yKXXQsmIjiqlZKJF9jwlbvHA1h7Kq4481xajWc3JQcPyAuFqB+VRWtF+
         znc22C7KBR/YAynZ5WDKCZZZtzYHR2hAU72cejSHahDPicAWYjCn5XGMPA5WNo8eLLnw
         Q2tChWs9MVB+Lb+0nSL1WfC3z5DSeXtR/8QEx79HxD8/lZxAL/y1VfX9IHNMQeKqpUVN
         EZESJSWNHvxhmIq8EDw/cQ8oLhd4UalpJ4/fhZJHBoM4IhOqrwDb0pjT78jtspIkkpj7
         z0tQJnHC0LEKpPxOYl5xfBeTtKFgZPUTZgsOdD3RQfsXUyA4W6Lg9CZp5h9ClYqKi0AD
         iQZw==
X-Forwarded-Encrypted: i=1; AJvYcCUGkAQDJGKSWIiqK0AZlvqThhMciAHtFYzl3G6CG+Xy5LFlT/8qp1LSYgtTR0qhm9ilI/9BPN81EsQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyusLThTL0lABpEjyJzG5mvy5QM4EsAWJ9BeSjQtW3q5LeGcMww
	9FgNyGKWdS2TZOPTtoLKouZZH8x+A3dGRMGbgazjMcThC1WelLMRmxd0TRnrdw==
X-Google-Smtp-Source: AGHT+IGKJh5QX2kGh6nSDjN16nEAau2Zz+yWHQO2jF+IcnXAHgeL5mIzE6/PFnVhDNqyJ42PjHAmyw==
X-Received: by 2002:a5d:5587:0:b0:37c:ce58:5a1b with SMTP id ffacd0b85a97d-37d5529f017mr11246449f8f.51.1729072373809;
        Wed, 16 Oct 2024 02:52:53 -0700 (PDT)
Message-ID: <46e66868-6ddc-4037-8c3a-5a60b39d8b73@suse.com>
Date: Wed, 16 Oct 2024 11:52:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] xen/pci: introduce PF<->VF links
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241011152727.366770-1-stewart.hildebrand@amd.com>
 <20241011152727.366770-3-stewart.hildebrand@amd.com>
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
In-Reply-To: <20241011152727.366770-3-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.10.2024 17:27, Stewart Hildebrand wrote:
> Add links between a VF's struct pci_dev and its associated PF struct
> pci_dev. Move the calls to pci_get_pdev()/pci_add_device() down to avoid
> dropping and re-acquiring the pcidevs_lock().
> 
> During PF removal, unlink VF from PF and mark the VF broken. As before,
> VFs may exist without a corresponding PF, although now only with
> pdev->broken = true. If the PF is removed and re-added, dom0 is expected
> to also remove and re-add the VFs.

Right, or else the VF struct instance would remain orphaned the way you've
implemented this. Question is whether it is a reasonable assumption that a
Dom0 which failed to remove the VFs during PF removal might later
"remember" that it still needs to report VFs removed. I for one doubt that.

> @@ -703,7 +696,44 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>           * extended function.
>           */
>          if ( pdev->info.is_virtfn )
> -            pdev->info.is_extfn = pf_is_extfn;
> +        {
> +            struct pci_dev *pf_pdev;
> +
> +            pf_pdev = pci_get_pdev(NULL,
> +                                   PCI_SBDF(seg, info->physfn.bus,
> +                                            info->physfn.devfn));
> +
> +            if ( !pf_pdev )
> +            {
> +                ret = pci_add_device(seg, info->physfn.bus, info->physfn.devfn,
> +                                     NULL, node);
> +                if ( ret )
> +                {
> +                    printk(XENLOG_WARNING "Failed to add SR-IOV device PF %pp for VF %pp\n",
> +                           &PCI_SBDF(seg, info->physfn.bus, info->physfn.devfn),
> +                           &pdev->sbdf);
> +                    free_pdev(pseg, pdev);
> +                    goto out;
> +                }
> +                pf_pdev = pci_get_pdev(NULL,
> +                                       PCI_SBDF(seg, info->physfn.bus,
> +                                                info->physfn.devfn));
> +                if ( !pf_pdev )
> +                {
> +                    ASSERT_UNREACHABLE();
> +                    printk(XENLOG_ERR "Failed to find SR-IOV device PF %pp for VF %pp\n",
> +                           &PCI_SBDF(seg, info->physfn.bus, info->physfn.devfn),
> +                           &pdev->sbdf);
> +                    free_pdev(pseg, pdev);
> +                    ret = -EILSEQ;
> +                    goto out;

Might be helpful to have the printk() ahead of the ASSERT_UNREACHABLE(), in the
unlikely event that the assertion would actually trigger. Positioning doesn't
make a difference for release builds anyway.

Jan

