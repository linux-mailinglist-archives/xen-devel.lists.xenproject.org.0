Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF088B51AD
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 08:44:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.713855.1114737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1Kjz-0007sA-JY; Mon, 29 Apr 2024 06:43:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 713855.1114737; Mon, 29 Apr 2024 06:43:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1Kjz-0007qe-GO; Mon, 29 Apr 2024 06:43:55 +0000
Received: by outflank-mailman (input) for mailman id 713855;
 Mon, 29 Apr 2024 06:43:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GJEf=MC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s1Kjy-0007qY-0j
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 06:43:54 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7c8b7e2-05f3-11ef-909b-e314d9c70b13;
 Mon, 29 Apr 2024 08:43:52 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-34b3374ae22so4454580f8f.0
 for <xen-devel@lists.xenproject.org>; Sun, 28 Apr 2024 23:43:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 m2-20020a05600c4f4200b004186eb69a55sm40172765wmq.25.2024.04.28.23.43.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Apr 2024 23:43:52 -0700 (PDT)
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
X-Inumbo-ID: d7c8b7e2-05f3-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714373032; x=1714977832; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AmyoU+Q2sgIfz5uRo5wk7eBHOwAmZcwPO886Ck//vYs=;
        b=PY5PWzBZLnce8Ig+FFdm/BAPWd9qI8lOLAvlkX4ZgPd5BOvcwHWaPmtEE8giZn5dgP
         Jycbd7WWeM7VUaGmFF2vK6h0MLnwUD9x0Zeb+1YWMia5F2LO6+o2xH3F1qVPwN8ZgdGx
         gH1ivrsK+u5swz/O5H5lAZHvAFVZX9Ddvpkb8qPC8nHxOLE+O4Yiux8LTcgUkRXCdHOM
         QJTOwuKeypDj20Q7Bxprr05Da8o3bBulxFVi9albiRctY+MdLNQpdERgYsdi1WSw9Euw
         e4sFFbU3XRvjKqR5hUXYSVKqn7Bjiw5kALVakLE/uZoObWdMB+u4jjhYes3PuSjH+0kP
         cAIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714373032; x=1714977832;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AmyoU+Q2sgIfz5uRo5wk7eBHOwAmZcwPO886Ck//vYs=;
        b=aSMGP94iBhQYsn/jgzKN5DhGgIf+7C3W0BM9p5PHFNWe7SrezSznJvwLBMV8LN5xCx
         Z7I5ar+j95RGUtcRHNi049fQOFuQbOeAKPdjWmxctRVxlUaXJ3Jzlp9vIm4FReLacouf
         JiaCgA4lHkCEpcWikjn2VTN28FECDZUKRJQZrkV26MtknYWHEQ3pYruqXSZQPEvnkNrA
         ibFNdXE1JwsBbyKBEAGVqOPVzHcPUgQxPfw50D1G+s6NSrmEMt0sICAVjDD7YZ5uepDg
         HN06PH3WcKKcSre5jm/Cl8WavqGvRw52LRs9Ihmndm/gHP8QycO6e8UHa0pdgZRxFyZE
         C/YQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrrCglLH8e4Kl0E4rqMtR2fegc50ivaw2LcVVuDd0GTbqNJ4OL6WlGmDlWmJpabJrFMl5oKcQWcLyfOp6e3hTKopwUOFybs1LGTVazOOE=
X-Gm-Message-State: AOJu0Yy1q2wEUEhsU4bgvW3T7dzAuDZZ1RiQnaWbGLe8hzYyPBRCmK5q
	jicftpDqqFiBnaE3F/rvP9xskOTgAVzX8uu73JqD+SjUww+MO+FNiOnwxzpeaw==
X-Google-Smtp-Source: AGHT+IGV9QhE8Uh08XACdt8Pecj+SP4U2ho0NPzOA100X3MpoLfDpu0l38/eE10sSw6TI7lHPL05DA==
X-Received: by 2002:a5d:64cc:0:b0:34c:def3:2f82 with SMTP id f12-20020a5d64cc000000b0034cdef32f82mr3853473wri.27.1714373032372;
        Sun, 28 Apr 2024 23:43:52 -0700 (PDT)
Message-ID: <36ab7bce-2f72-4ad8-8315-2bfc1268d032@suse.com>
Date: Mon, 29 Apr 2024 08:43:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/15] xen/overlay: Enable device tree overlay assignment
 to running domains
Content-Language: en-US
To: Henry Wang <xin.wang2@amd.com>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20240424033449.168398-1-xin.wang2@amd.com>
 <20240424033449.168398-8-xin.wang2@amd.com>
 <da67f90f-6807-4fdc-b65b-f7a4ba9f78ad@suse.com>
 <97a401ff-4b5c-4e6a-8d9c-e36305ec64f5@amd.com>
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
In-Reply-To: <97a401ff-4b5c-4e6a-8d9c-e36305ec64f5@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.04.2024 05:36, Henry Wang wrote:
> Hi Jan, Julien, Stefano,
> 
> On 4/24/2024 2:05 PM, Jan Beulich wrote:
>> On 24.04.2024 05:34, Henry Wang wrote:
>>> --- a/xen/include/public/sysctl.h
>>> +++ b/xen/include/public/sysctl.h
>>> @@ -1197,7 +1197,9 @@ struct xen_sysctl_dt_overlay {
>>>   #define XEN_SYSCTL_DT_OVERLAY_ADD                   1
>>>   #define XEN_SYSCTL_DT_OVERLAY_REMOVE                2
>>>       uint8_t overlay_op;                     /* IN: Add or remove. */
>>> -    uint8_t pad[3];                         /* IN: Must be zero. */
>>> +    bool domain_mapping;                    /* IN: True of False. */
>>> +    uint8_t pad[2];                         /* IN: Must be zero. */
>>> +    uint32_t domain_id;
>>>   };
>> If you merely re-purposed padding fields, all would be fine without
>> bumping the interface version. Yet you don't, albeit for an unclear
>> reason: Why uint32_t rather than domid_t? And on top of that - why a
>> separate boolean when you could use e.g. DOMID_INVALID to indicate
>> "no domain mapping"?
> 
> I think both of your suggestion make great sense. I will follow the 
> suggestion in v2.
> 
>> That said - anything taking a domain ID is certainly suspicious in a
>> sysctl. Judging from the description you really mean this to be a
>> domctl. Anything else will require extra justification.
> 
> I also think a domctl is better. I had a look at the history of the 
> already merged series, it looks like in the first version of merged part 
> 1 [1], the hypercall was implemented as the domctl in the beginning but 
> later in v2 changed to sysctl. I think this makes sense as the scope of 
> that time is just to make Xen aware of the device tree node via Xen 
> device tree.
> 
> However this is now a problem for the current part where the scope (and 
> the end goal) is extended to assign the added device to Linux Dom0/DomU 
> via device tree overlays. I am not sure which way is better, should we 
> repurposing the sysctl to domctl or maybe add another domctl (I am 
> worrying about the duplication because basically we need the same sysctl 
> functionality but now with a domid in it)? What do you think?

I'm taking it that what is a sysctl right now legitimately is. Therefore
folding both into domctl would at least be bending the rules of what
should be sysctl and what domctl. It would need clarifying what (fake)
domain such a (folded) domctl ought to operate on for the case that's
currently a sysctl. That then may (or may not) be justification for such
folding.

Jan

> @Stefano: Since I am not 100% if I understand the whole story behind 
> this feature, would you mind checking if I am providing correct 
> information above and sharing your opinions on this? Thank you very much!
> 
> [1] 
> https://lore.kernel.org/xen-devel/13240b69-f7bb-6a64-b89c-b7c2cbb7e465@xen.org/
> 
> Kind regards,
> Henry
> 
>> Jan
> 


