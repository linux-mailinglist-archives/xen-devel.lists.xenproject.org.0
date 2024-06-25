Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D325916156
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 10:33:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747456.1154876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM1cE-00033D-HW; Tue, 25 Jun 2024 08:33:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747456.1154876; Tue, 25 Jun 2024 08:33:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM1cE-00030j-E2; Tue, 25 Jun 2024 08:33:26 +0000
Received: by outflank-mailman (input) for mailman id 747456;
 Tue, 25 Jun 2024 08:33:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sC98=N3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sM1cD-00030b-8k
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 08:33:25 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95988d06-32cd-11ef-b4bb-af5377834399;
 Tue, 25 Jun 2024 10:33:23 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2ec408c6d94so60179321fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2024 01:33:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9eb3c5cf6sm75596155ad.156.2024.06.25.01.33.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jun 2024 01:33:22 -0700 (PDT)
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
X-Inumbo-ID: 95988d06-32cd-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719304402; x=1719909202; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qwsCe4VZPuQHqQL6NWMLwuN/4TGL3rAFIhoM7GsDsPE=;
        b=CU2HtsTktfgQtxWytngO074fNit25qXmJFb97OHJKhdlldHvUwfpTazHfRlzOTdiXd
         LVplMw7di52eJaaU21CbyrxeOYfRQxMROk1a1tZDFBMTcez2A6rEjkBdUpjcVf7Jhx5p
         I418WRWNe8Dvm6pEbNuXn/SoBCabBPip6dE9mqQ3r21jkqUF5onZZnePJlPvQ73RYPIv
         y6bEuMvI3Ex2Qp270t0j+qQG4AFtUNJeDSE2d5KuOQL+GbHZ4hmBRGFd6a0fdoLx2/28
         an5lGWdDg5qULLEQMFHD5dOuCJBMPRYUo+GiZKD/Xa1Wjvq9bd/Jxd+TQ3KHYfC7KYOq
         TH5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719304402; x=1719909202;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qwsCe4VZPuQHqQL6NWMLwuN/4TGL3rAFIhoM7GsDsPE=;
        b=FcY/Y24Isxo58LhmZh6UetjULknX9aVxrIUuQDZ8tHPo99c87yszX6kRcZrIqWNd57
         h9bM/wDh/+76tkqsYuAwQpY4iJoJhgO8Q1mTu9s4czvnRFyE/7iv4uEF/UARUbe1z0rn
         60AbfkeKy1jJuGWLZpQeIB9dD9gtEc23GlP6mqai8+8Wvg62rJCI8bKpSCgIj3B2k+aQ
         Bnhr00iNfn1U7v92QAVKNGtR5hM63gmDB3ThK8E1Tg+/dzb9k8N79XX9jpf0M7pwhFVh
         DOh2XxlNzFwQmAaa7plNHjgplXEfpZf/So2nOxbz0PtVTa1vWIyi7T9B7jX/RxC7kPyw
         DBIA==
X-Forwarded-Encrypted: i=1; AJvYcCVDw6uuA+5/ZmVy8NcaokwpsFqneKDWn/HcxYIGL2yd1ILDY4uEiu1qWdekes+LuvJuiJ4pUjtdQ8XZvODXPsnsrkrQSbsKKeqR7Oj7b4s=
X-Gm-Message-State: AOJu0Yyu4yO7d4IE96Qck/9PzdD4N1fZqtZD7TMdxv+icfT7jScrYqeJ
	+1cE0lmVuwTQ4vrLHh+I7j+GWWtxdHkKobAqp5BlGo6j0hSXcBICJ1pPmlbrhQ==
X-Google-Smtp-Source: AGHT+IGE9cL0P4ecJZz8YAKz+DSs7Y5aK8zR97xjYTCG/eB/LcSLA+xH6IIRfFfQ/DaKtijtOsy3Og==
X-Received: by 2002:a2e:9e59:0:b0:2ec:5518:9550 with SMTP id 38308e7fff4ca-2ec5930fdbcmr54413921fa.10.1719304402646;
        Tue, 25 Jun 2024 01:33:22 -0700 (PDT)
Message-ID: <1ed2364d-6960-4bb2-9f3c-ac672a97e74b@suse.com>
Date: Tue, 25 Jun 2024 10:33:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/sched: fix rare error case in cpu_schedule_down()
To: Juergen Gross <jgross@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <20240625082736.7238-1-jgross@suse.com>
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
In-Reply-To: <20240625082736.7238-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.06.2024 10:27, Juergen Gross wrote:
> In case cpu_schedule_up() is failing to allocate memory for struct
> sched_resource,

Or (just to mention it again) in case the function isn't called at all
because some earlier CPU_UP_PREPARE handler fails.

> cpu_schedule_down() will be called with the
> sched_resource pointer being NULL. This needs to be handled.
> 
> Reported-by: Jan Beulich <jbeulich@suse.com>
> Fixes: 207589dbacd4 ("xen/sched: move per cpu scheduler private data into struct sched_resource")
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

You didn't tag it for 4.19 and you also didn't Cc Oleksii, so I expect you
deem this minor enough to be delayed until 4.20 opens, despite the Fixes:
tag?

Jan

