Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D6999C706
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2024 12:20:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.818592.1231896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0IAd-0007PC-Hb; Mon, 14 Oct 2024 10:19:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 818592.1231896; Mon, 14 Oct 2024 10:19:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0IAd-0007Mj-EN; Mon, 14 Oct 2024 10:19:23 +0000
Received: by outflank-mailman (input) for mailman id 818592;
 Mon, 14 Oct 2024 10:19:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9kmr=RK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t0IAb-0007Md-LF
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2024 10:19:21 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5f7f599-8a15-11ef-99a2-01e77a169b0f;
 Mon, 14 Oct 2024 12:19:19 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-37d4a5ecc44so2907773f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 14 Oct 2024 03:19:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d4b6a8666sm10969563f8f.22.2024.10.14.03.19.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Oct 2024 03:19:18 -0700 (PDT)
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
X-Inumbo-ID: c5f7f599-8a15-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728901159; x=1729505959; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GcZH8WjYoCDhbNDs9fcacHV9uOJXUKSKX169h2r10xM=;
        b=gLRCWdUOVJO9RIA2oYtjxKNcvsZ8G+oF7kFnYknqcoXiDMHliig/FkR6IvW+k1AFd+
         XpodZRQ2fXzt3j/c59hn8EFr+Mfy+tilYywRIJMWC6KIvNvIHfI1RzgQUX2th+yPDv3j
         iQ0TYxQjk0JJxZeJGByMkH/+AagTInl+5vrMcvXVszetQdFmt/zfx2acBVB5bacMPBW5
         ujEIHtGcsyQoiDhJg8rDh+8bgi6cEQlC75JjZmbXm37plHHdlayXDxT/CYsXnEYVm0D1
         +3Gm4RStG3wXU2AkO+iFGBOnSxu/GBh2kG9X+bX8jm5LGc60Cx1W8uC17XtSTJjq/BM4
         Ogyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728901159; x=1729505959;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GcZH8WjYoCDhbNDs9fcacHV9uOJXUKSKX169h2r10xM=;
        b=Mu1pg98iPiGOXSbRTTypa8fLfiuS2Mi+YRV3b/rAIaA8D3esP72jGUouezltqn7bPs
         KviIxettW5rQMuWs9Rf+HD5EBZl3+oLL0q+9TfoOgMAOz1tT5YbhqZw7G8t14NTAqcp6
         J3VJMZs8OuHhjSMRFykc2tzioLoH8+V4ru/Ma5Xc7I5IvItD/CfFTf6qRoLvtsE7/Crq
         2EgCKzCRUPjj69QLj++1BqljqmrypfwBpjOFvks9iryZIxEGEC0TFz6HDHalLE2aU07D
         0DwkojRUJnLAAS6ziaCYEcJyhBKY7opjkwoeRrPm5sV7/W4b2C8SuoEF7dsd+BiIYuCF
         PnpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeenN/NMQlb4bvlGDihx/3oHevnwLH5mENbubwYhw53qx2zsE495FSeenqsl+y21RfDt1GlaxzdMs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwbiYPwGYLtwW8d60sDI19GIvK3d+ZaN3dhx5xz4ER1spwkDJBX
	9Z+o+G7TArHM0GWO79qr2fiC5K/RXsQ1Qqy8Jk2WUCl3IcQk9+eqMgr1sykBxQ==
X-Google-Smtp-Source: AGHT+IG1qHScwMLhBiMpVbGsop8Ga3gqkm68B4nN07lmb1OX8EU6NEnW5WWy+A+amNTr+BfNnq7aHw==
X-Received: by 2002:a05:6000:1d0:b0:374:cd3e:7d98 with SMTP id ffacd0b85a97d-37d551e3caamr8076676f8f.19.1728901158724;
        Mon, 14 Oct 2024 03:19:18 -0700 (PDT)
Message-ID: <8cb656c9-937e-4ffa-b5fd-a49f7a341c26@suse.com>
Date: Mon, 14 Oct 2024 12:19:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/public: increment domctl interface version
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241014070650.14296-1-jgross@suse.com>
 <c7ea754e-e250-4431-b698-a10c2299ce75@suse.com>
 <79dca12b-6f16-4008-99cd-d0c3c1e7509c@suse.com>
 <2082c6ea-c778-444f-ad5f-15f25b87ba10@suse.com>
 <ea126b93-add2-415a-8a51-5b55ffcdd21e@suse.com>
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
In-Reply-To: <ea126b93-add2-415a-8a51-5b55ffcdd21e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.10.2024 10:00, Jürgen Groß wrote:
> On 14.10.24 09:46, Jan Beulich wrote:
>> On 14.10.2024 09:36, Jürgen Groß wrote:
>>> On 14.10.24 09:14, Jan Beulich wrote:
>>>> On 14.10.2024 09:06, Juergen Gross wrote:
>>>>> The recent addition of the XEN_DOMCTL_dt_overlay function was missing
>>>>> the related update of XEN_DOMCTL_INTERFACE_VERSION, as it has been the
>>>>> first interface change of the 4.20 release cycle.
>>>>>
>>>>> Fixes: 4c733873b5c2 ("xen/arm: Add XEN_DOMCTL_dt_overlay and device attachment to domains")
>>>>
>>>> I'm confused: That change (a) pre-dates the branching of 4.20 and (b)
>>>> bumped the version ...
>>>>
>>>>> --- a/xen/include/public/domctl.h
>>>>> +++ b/xen/include/public/domctl.h
>>>>> @@ -21,7 +21,7 @@
>>>>>    #include "hvm/save.h"
>>>>>    #include "memory.h"
>>>>>    
>>>>> -#define XEN_DOMCTL_INTERFACE_VERSION 0x00000017
>>>>> +#define XEN_DOMCTL_INTERFACE_VERSION 0x00000018
>>>>
>>>> ... from 0x16 to 0x17. And for no apparent reason, as plain additions don't
>>>> require a bump. Did you maybe mean to reference a different commit?
>>>
>>> Oh, indeed. I wanted to reference d6e9a2aab39e.
>>>
>>> And regarding to "plain additions don't require a bump": 4c733873b5c2 did
>>> a plain addition and bumped the version.
>>
>> Right, hence why I said "for no apparent reason".
> 
> There seems to be a lack of documentation in this regard.
> 
> Julien explicitly asked for the bump for that addition.

Julien - why was that? Bumps are needed only for backwards incompatible
changes. Plain additions therefore never require a bump. As as we get
better with properly checking e.g. padding fields, the frequency of
required bumps should also further reduce.

> I'm fine with dropping my patch if others agree that the bump isn't needed.
> In that case I'll send another one adding a comment for the mechanics of
> interface version bump in domctl.h and sysctl.h.

Oh, yes, please feel free to do so.

Jan

