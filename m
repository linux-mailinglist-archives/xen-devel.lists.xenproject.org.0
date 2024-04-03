Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 279508964F8
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 08:53:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700317.1093262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rruUr-0002zV-RL; Wed, 03 Apr 2024 06:53:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700317.1093262; Wed, 03 Apr 2024 06:53:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rruUr-0002ws-O5; Wed, 03 Apr 2024 06:53:21 +0000
Received: by outflank-mailman (input) for mailman id 700317;
 Wed, 03 Apr 2024 06:53:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XszW=LI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rruUq-0002wi-Aq
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2024 06:53:20 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9faaa7e-f186-11ee-a1ef-f123f15fe8a2;
 Wed, 03 Apr 2024 08:53:18 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4155819f710so30955395e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Apr 2024 23:53:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 p18-20020a05600c359200b0041543b57ca2sm20552871wmq.21.2024.04.02.23.53.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Apr 2024 23:53:17 -0700 (PDT)
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
X-Inumbo-ID: d9faaa7e-f186-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712127197; x=1712731997; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eU4Kvxa6S2lNftq7OIqQb8wRacONrsh7tQKm0bDHwbE=;
        b=NW9HaT3qwWnFm1vNaorcIGmK6baMD+BEhPeYhXpRlFX6t8eQuCk61mDkLneYTV5GFV
         HhCV1R8XeaUKTV+5JVbAmUNWg5pQkX+kXSRKfaodRPd60wgd7W0S9xn6ha6SRDb13zE6
         dEXnfxu+cn0J0GbDjxg8ORoGrs137PZtdK0VcigTzHymu7/2gEFsbFN9a4Jz5z3vwAN9
         /RfdhAgYzGaxBv/V9oU0d1hthRWXEkTIBg1ZZLa+GVdsLPA9mljK6uOY/2VmFw2vWNKC
         amkRmwvUYNhm5QVmHAO/bq8Nv8oreHsfpjduGFFtJFkSeFHAaDzBBPpSLj/oZXPdhfBP
         Mw+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712127197; x=1712731997;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eU4Kvxa6S2lNftq7OIqQb8wRacONrsh7tQKm0bDHwbE=;
        b=xGety241hQp1d+SY9EWtHx0WdG7L8nTJiiwqpOWR0EH75r30hSzxnwiKaqAyvGwk20
         6YkR8sQZwxpeOPkDruCUiRDT/TPBAdr/Bzuro17m4PStJ6dJlnlI2w3WkC/GM/1xly7+
         BFkcGK21oidilcvFRbacMKZAmvKOiqT399LSJfrc1f95EnI48X54Khjm979krKmdJWUE
         fMpwZLdjk5Gy2RVytGhgqB0JrNVxJ09rU7sKLOn2DpqFCOtBQqQ4HQE3zHRb4cvK9wad
         7vfc/yEJQsIsFgrDN+ZRKAPvPQ8iDPbIhSu60a0zZJRYlxDF9acfELk5e0XYRy3Ib9Kg
         lCMg==
X-Forwarded-Encrypted: i=1; AJvYcCUXygelt99krXUl2n2pZor+SeIYDEteAakAa+N4+ND3aCOcYUT7zIE8EKA8mn25qtqHYPd4c1FHN+/DAV48yHbwrvS3An0m+HXpNRaagrY=
X-Gm-Message-State: AOJu0Yy0lwJtMJjP8HCYfWdixapvm7j2n+Nm2J6Wti44LF4QLT7Vk5XE
	1/qwiera2fvzH10huPk6wDXh0/XrdGmazKj9EUR8zslrKwrDEhq4fAiF4Gi/Zg==
X-Google-Smtp-Source: AGHT+IFetfrdk6iobUzCIgBTV3irAHyOpG8VlWQElRZK8Csygfa8o5fD6xypuvqGizwBBvU79LBb4g==
X-Received: by 2002:a05:600c:1c1f:b0:415:6ad6:cc27 with SMTP id j31-20020a05600c1c1f00b004156ad6cc27mr5178778wms.24.1712127197680;
        Tue, 02 Apr 2024 23:53:17 -0700 (PDT)
Message-ID: <c6a89dfa-933e-4e90-a951-ebfba26b428f@suse.com>
Date: Wed, 3 Apr 2024 08:53:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 4/7] xen/evtchn: address a violation of MISRA C:2012
 Rule 16.3
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1712042178.git.federico.serafini@bugseng.com>
 <98c4197ab3bcf82d0055836cf950f1268dbcc91c.1712042178.git.federico.serafini@bugseng.com>
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
In-Reply-To: <98c4197ab3bcf82d0055836cf950f1268dbcc91c.1712042178.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.04.2024 09:22, Federico Serafini wrote:
> Add break statement to address a violation of MISRA C:2012 Rule 16.3
> ("An unconditional `break' statement shall terminate every
> switch-clause ").
> 
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



