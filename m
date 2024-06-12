Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDA990518F
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2024 13:47:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739241.1146230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHMRQ-0005tQ-1q; Wed, 12 Jun 2024 11:47:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739241.1146230; Wed, 12 Jun 2024 11:47:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHMRP-0005rt-V0; Wed, 12 Jun 2024 11:46:59 +0000
Received: by outflank-mailman (input) for mailman id 739241;
 Wed, 12 Jun 2024 11:46:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h1N0=NO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sHMRO-0005rn-9w
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2024 11:46:58 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78176594-28b1-11ef-b4bb-af5377834399;
 Wed, 12 Jun 2024 13:46:56 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-57c76497cefso4891361a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 12 Jun 2024 04:46:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57aae0c9f88sm10891913a12.21.2024.06.12.04.46.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jun 2024 04:46:55 -0700 (PDT)
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
X-Inumbo-ID: 78176594-28b1-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718192816; x=1718797616; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/8Bqkp/I/7LiyMqxZ2e88rah2tV1WpwqC+6QLe+jgZM=;
        b=akR6C/1MoIocJV/t2c1mZH6WTS4HV7Yo+BygQkuN1+fzKLwL/uDoEnU1+55GpHY5+0
         1FUefHsnxDcSW31KT+UmKWgFgpcpfKdbevAL5ZqAmRPOdiN2XFXm6Pojv4vvZZdPlx90
         kGMFiuNJYuD+o8HVzhlHetQU/nZTM1lJoKwZQK2y9Eo8Ac/AjNzzBWqMAUf+BzsXWG+O
         4oCjTzlJEdOceOejpfHM+5zUed4XMyk95K4/G9i5mqUoJ7EEkcbB/WhWE4b6YAhU/Crd
         QVma6pa4Z8GRQi5O/a2PNwqwt3jFYR6NehdwZg6KfXhIydZ3nurbpK0Uxr8RZzyY/3tB
         z6xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718192816; x=1718797616;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/8Bqkp/I/7LiyMqxZ2e88rah2tV1WpwqC+6QLe+jgZM=;
        b=wNWAmWLJ0nbBjlXImlzxGm7cLfjMmDl4a0y4+cDm9JkvEfHafqvBtEiXaxIGDQCcvf
         /kcRayhltLOGTNKdo2f/r6SHZUmfVv+e5oVNkJX+x5b/7evDsOBIptUlK7Kchc583dJU
         GwDW24kYQ+Un14HuQFwIZsAdHMuamAMpB2vIyL5LxNC9ooL6zv6GN94vI5u3VRcSrqxa
         8HETbF5Y6L4Sm6AeqL843ifZIOKr8Cbyfijr/HDqvBjJqfJko6Usrvt1rsPZQDp/dVue
         nZMRy7RuhTbLiIIb6PFl/1jeKuTvrqBuLHUvMItFfpPoV5yUzhjguFd8Fk6p8h0KcrGv
         98nA==
X-Gm-Message-State: AOJu0Yxd86tBG7eK1SfWX2i3h8Z507g5ZFhmuOjn3NDpFKvUbEEIKS1t
	GwFsuQhhsyptd+P94aWRiQMlpSZbdwGwsnoitzpgJZ35brBf1SjMzRwsDzbbSQ==
X-Google-Smtp-Source: AGHT+IHK5Pw6kBKzQHvkTRwAlohxJm4OmztL/eN/LDUZwEMWiGohjwXjhe8CsFih5tcUxGmeDyqaTQ==
X-Received: by 2002:a50:9e84:0:b0:57c:6740:f47c with SMTP id 4fb4d7f45d1cf-57ca97936a9mr1180871a12.27.1718192815631;
        Wed, 12 Jun 2024 04:46:55 -0700 (PDT)
Message-ID: <aaac0f5d-18d9-4cd6-ad89-e8d5aaa3a797@suse.com>
Date: Wed, 12 Jun 2024 13:46:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19???] x86/physdev: replace physdev_{,un}map_pirq()
 checking against DOMID_SELF
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>
References: <c7d12669-7851-4701-9b2d-0b22f9d32c1d@suse.com>
 <Zml984lQW1XcrG9_@macbook>
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
In-Reply-To: <Zml984lQW1XcrG9_@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.06.2024 12:52, Roger Pau Monné wrote:
> On Wed, Jun 12, 2024 at 10:44:56AM +0200, Jan Beulich wrote:
>> It's hardly ever correct to check for just DOMID_SELF, as guests have
>> ways to figure out their domain IDs and hence could instead use those as
>> inputs to respective hypercalls. Note, however, that for ordinary DomU-s
>> the adjustment is relaxing things rather than tightening them, since
>> - as a result of XSA-237 - the respective XSM checks would have rejected
>> self (un)mapping attempts for other than the control domain.
>>
>> Since in physdev_map_pirq() handling overall is a little easier this
>> way, move obtaining of the domain pointer into the caller. Doing the
>> same for physdev_unmap_pirq() is just to keep both consistent in this
>> regard. For both this has the advantage that it is now provable (by the
>> build not failing) that there are no DOMID_SELF checks left (and none
>> could easily be re-added).
>>
>> Fixes: 0b469cd68708 ("Interrupt remapping to PIRQs in HVM guests")
>> Fixes: 9e1a3415b773 ("x86: fixes after emuirq changes")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

> I wonder if we should introduce a helper to check for the current
> domain:
> 
> #define is_current_domain(d) ((d) == current->domain)

Hmm, that's not even shorter, and imo not any more "meaningful". Plus
it wouldn't cover the case where we have currd already in a local var.

Jan

