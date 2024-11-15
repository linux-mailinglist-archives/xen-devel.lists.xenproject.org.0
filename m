Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B529B9CDA1A
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 08:56:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836921.1252836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBrAg-0000td-0J; Fri, 15 Nov 2024 07:55:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836921.1252836; Fri, 15 Nov 2024 07:55:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBrAf-0000r3-T7; Fri, 15 Nov 2024 07:55:13 +0000
Received: by outflank-mailman (input) for mailman id 836921;
 Fri, 15 Nov 2024 07:55:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OZ3N=SK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tBrAe-0000qv-4h
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 07:55:12 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed60a5d4-a326-11ef-99a3-01e77a169b0f;
 Fri, 15 Nov 2024 08:55:06 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-382242cd8bbso447241f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Nov 2024 23:55:06 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3821adadf8fsm3621730f8f.39.2024.11.14.23.55.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Nov 2024 23:55:05 -0800 (PST)
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
X-Inumbo-ID: ed60a5d4-a326-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MzQiLCJoZWxvIjoibWFpbC13cjEteDQzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImVkNjBhNWQ0LWEzMjYtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNjU3MzA2LjExNTc3NSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731657305; x=1732262105; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rrvjE0Cj6vWIvE+eeISs3VaWLZJAI6NXdikiHCOwDw0=;
        b=chb7hIsQwGYU5g5CyykA95wGe/hrTtoW9djNxNGbM3OnPR3gABLIyPCyBw81iFsScJ
         5c/lsNunhXT6sT8RaW6TjZUPApvxlFY563CGNWH3QraQAXU5g18I7FU41EQpBj4SoWzi
         9ytX6AaAOyVKQhBcq9Yy6D6+lclBjp7m4g20c7SfEbmVQvEEEoIDGPKRFe+FKh+IpdBp
         WnZuG/XR8/2RlVQP6bMXjXI1uYDCokkN+HXMUCfxORmC/HsKRfBKj0BdCyTlr3C4rRbB
         OY5pv72MQS+kScd9OCKzMmmGU5D34Ry8Xlyk75qlgdnnMQJ41HWaEXK23ModvQckQO97
         /0Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731657305; x=1732262105;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rrvjE0Cj6vWIvE+eeISs3VaWLZJAI6NXdikiHCOwDw0=;
        b=SWGGdjk2qr4uc49ZXcmm3R2PjNJveze9mwyxiqnYY8MkB5VStNvKuL7YopphIz9YhK
         b40Art9uPiZ21NPKBRNjyTiBVS98UJ/eSEYNoFkWpJKT6RPXajM2+4FfofWQII8ggR6D
         XS2NaYY5SJ49tWcG0v4nV+H/WfrmTE7QhfgQm3k+qb9e2ysvnvnqhLZgspCd4Jf8ySwX
         uNYvU0xYuLNy/FPisArzRwcfDC0/wVJz2HolvyWTbWCrV0XxZuO07F0YENkZTxzo8Gi6
         kSi87exTfiVIL+3lopVix1S0mx6R9zyOX4LsJIajYFrAjfrC9AokzcFa/o97xiulBTE7
         Vwlg==
X-Forwarded-Encrypted: i=1; AJvYcCWUzvR40fAq3+nIhWx56ATsyMr7kJgKWH3KHTezh1uky/szcrEMkePi6GMnqZwYPWm3OHXHBWFn1ng=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzBKiTqqLrMef5AJeKeE4JqRHeRzBbwJi75U3awtGhYfODQjSvA
	Qw4A8KIAUjentOoy13yMdEFs1KG04rVHVlw+hKXym7hq/AoTcjcV+1ews7iAPQ==
X-Google-Smtp-Source: AGHT+IGumqAWeeTUkube+A687oEew1gHMoE4R8kQbwmkpIWLPkgqrZ7M6KavqQgnVV4Je/bXJMMBcg==
X-Received: by 2002:a05:6000:4023:b0:37d:54a0:d0a1 with SMTP id ffacd0b85a97d-38225ac46camr1209996f8f.56.1731657305394;
        Thu, 14 Nov 2024 23:55:05 -0800 (PST)
Message-ID: <69f9e816-6f17-4821-b26e-668f451e24c5@suse.com>
Date: Fri, 15 Nov 2024 08:55:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] xen/pci: introduce PF<->VF links
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241112205321.186622-1-stewart.hildebrand@amd.com>
 <20241112205321.186622-2-stewart.hildebrand@amd.com>
 <975e3dbd-40e8-49c6-8aab-7e7bde1a233f@suse.com>
 <06149848-c14c-4f44-80b8-b596479505cf@amd.com>
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
In-Reply-To: <06149848-c14c-4f44-80b8-b596479505cf@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.11.2024 19:50, Stewart Hildebrand wrote:
> On 11/14/24 05:34, Jan Beulich wrote:
>> On 12.11.2024 21:53, Stewart Hildebrand wrote:
>>> Add links between a VF's struct pci_dev and its associated PF struct
>>> pci_dev.
>>>
>>> The hardware domain is expected to add a PF first before adding
>>> associated VFs. Similarly, the hardware domain is expected to remove the
>>> associated VFs before removing the PF. If adding/removing happens out of
>>> order, print a warning and return an error. This means that VFs can only
>>> exist with an associated PF.
>>>
>>> Additionally, if the hardware domain attempts to remove a PF with VFs
>>> still present, mark the PF and VFs broken, because Linux Dom0 has been
>>> observed to not respect the error returned.
>>>
>>> Move the call to pci_get_pdev() down to avoid dropping and re-acquiring
>>> the pcidevs_lock(). Drop the call to pci_add_device() as it is invalid
>>> to add a VF without an existing PF.
>>>
>>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>
>> I'm okay with this, so in principle
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> Thanks, I very much appreciate it! However, is it appropriate for me to
> pick up this tag considering the requested/proposed changes?

In general if in doubt, leave it out. Here, since you're meaning to
make further changes, it certainly wants leaving out.

>>> @@ -703,7 +696,38 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>>>           * extended function.
>>>           */
>>>          if ( pdev->info.is_virtfn )
>>> -            pdev->info.is_extfn = pf_is_extfn;
>>> +        {
>>> +            struct pci_dev *pf_pdev = pci_get_pdev(NULL,
>>> +                                                   PCI_SBDF(seg,
>>> +                                                           info->physfn.bus,
>>> +                                                           info->physfn.devfn));
> 
> BTW, since I'm spinning another rev anyway, are there any opinions on
> the indentation here?

Well, yes. Andrew's preferred (or so I think) way of laying this out
would (imo) certainly be better here:

            struct pci_dev *pf_pdev =
                pci_get_pdev(NULL,
                             PCI_SBDF(seg, info->physfn.bus,
                                      info->physfn.devfn));

(with less line wrapping if stuff fits within 80 chars, which I didn't
specifically check).

>>> +                       &pdev->sbdf,
>>> +                       &PCI_SBDF(seg, info->physfn.bus, info->physfn.devfn));
>>> +                free_pdev(pseg, pdev);
>>> +                ret = -ENODEV;
>>> +                goto out;
>>> +            }
>>> +
>>> +            pdev->info.is_extfn = pf_pdev->info.is_extfn;
>>
>> There's a comment related to this, partly visible in patch context above.
>> That comment imo needs moving here. And correcting while moving (it's
>> inverted imo, or at least worded ambiguously).
> 
> I'll move it. As far as wording goes, I suggest:
> 
>             /*
>              * PF's 'is_extfn' field indicates whether the VF is an extended
>              * function.
>              */

Or maybe "VF inherits its 'is_extfn' from PF"?

>>> +            pdev->pf_pdev = pf_pdev;
>>> +            list_for_each_entry(vf_pdev, &pf_pdev->vf_list, vf_list)
>>> +            {
>>> +                if ( vf_pdev == pdev )
>>> +                {
>>> +                    already_added = true;
>>> +                    break;
>>> +                }
>>> +            }
>>> +            if ( !already_added )
>>> +                list_add(&pdev->vf_list, &pf_pdev->vf_list);
>>> +        }
>>>      }
>>
>> Personally, as I have a dislike for excess variables, I'd have gotten away
>> without "already_added". Instead of setting it to true, vf_pdev could be
>> set to NULL. Others may, however, consider this "obfuscation" or alike.
> 
> This relies on vf_pdev being set to non-NULL when the list is empty and
> after the last iteration if the list doesn't contain the element. I had
> to look up the definitions of list_for_each_entry, INIT_LIST_HEAD, and
> list_{add,del,entry} to verify that vf_pdev would be non-NULL in those
> cases.
> 
> Perhaps a better approach would be to introduce list_add_unique() in
> Xen's list library? Then we can also get rid of the vf_pdev variable.
> 
> static inline bool list_contains(struct list_head *entry,
>                                  struct list_head *head)
> {
>    struct list_head *ptr;
> 
>    list_for_each(ptr, head)
>    {
>        if ( ptr == entry )
>            return true;
>    }
> 
>    return false;
> }
> 
> static inline void list_add_unique(struct list_head *new,
>                                    struct list_head *head)
> {
>     if ( !list_contains(new, head) )
>         list_add(new, head);
> }

I'm uncertain of this kind of an addition. For long lists one would need to
be careful with whether to actually use list_contains(). It being a simple
library function would make this easy to overlook.

Jan

