Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D88080565C
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 14:48:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647895.1011613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAVmM-0001Tm-Pn; Tue, 05 Dec 2023 13:48:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647895.1011613; Tue, 05 Dec 2023 13:48:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAVmM-0001Ru-Li; Tue, 05 Dec 2023 13:48:02 +0000
Received: by outflank-mailman (input) for mailman id 647895;
 Tue, 05 Dec 2023 13:48:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kfJ1=HQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rAVmK-0001M0-P5
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 13:48:00 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e64c247a-9374-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 14:47:58 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40b5155e154so60840955e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 05 Dec 2023 05:47:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 f16-20020a05600c4e9000b0040b4e44cf8dsm18718737wmq.47.2023.12.05.05.47.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Dec 2023 05:47:57 -0800 (PST)
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
X-Inumbo-ID: e64c247a-9374-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701784078; x=1702388878; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HUuyfBMpPDj7pIB6gxTVnbrQBYgplSGL0ZpfBB/ycxs=;
        b=a90hPG77NpAO2lH3dMp4m1R3vUwfuNhu0Fkbf2TFnju/mG8rjEoFvRrK/na6MCZozC
         w2Tj1APHLZaTKCNQoS0eOP7c/N1K7JHNInsyBNzdBmIc85SK+46mFGoZLohYQtTPlO0m
         K2QyWXrNsEG/pamJixIztBQ1wyeezXqRgh0hXQDSL4cWWOvX9vM6G2J0oUwLEEVOPLZV
         uo89v+PeOgIlDTqyW80GJVmEKcPssLKURV5o0BCkhlQ8mMAdXkG4HilSWO7Jdz6SstgR
         GgUv5OdX8TLDav9TLfu5lEmeYljwfKyJ7bXrPgVA4kUxwNVVkMQ4yeyBvw/AjI8guX04
         e6zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701784078; x=1702388878;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HUuyfBMpPDj7pIB6gxTVnbrQBYgplSGL0ZpfBB/ycxs=;
        b=EvQj+A/nRul0q99PWMxNi+i15zOSQmadIl3YtrYmWmrPo3YJKKr/DzM4xwm91kc/wC
         9mdbz293aGwfDIxuvzFFrXnSrR8QBfyaOUZVRQgUH/QcPU8WkMc4/5rd0St2IIb1YHdV
         DZGUime0IAdUPfmp4okAitRQPL9wHW+Qe2gGrSEHcrUp8OEmWs4BMFXT0aT27SGoKisv
         Opm3xLAX933nuCJzghdWzzCuoHZlik9GmuN2OWqxjR95sI42ZdxiUbOPk3IR33UD0nEq
         ++He60Cyd3QFSZOXK/UMOUSdTerBq0fc3OwLepvOgZoBYTmR16yq1rRhNaZjJr0aET2g
         7YJQ==
X-Gm-Message-State: AOJu0Yzrm6xWv213yHjH7emoAe0k++0APjlnhA9lfdTw6NCxpVEZRC+F
	Snjl8bWqc8ZAsOce33VormYO
X-Google-Smtp-Source: AGHT+IFe+uSySxjNTBZbNWmMhnAoGMBiD45JfkK+FapGsmWdrvm8EHE4cg3QdxXhqcj+ejm1xFJFcg==
X-Received: by 2002:a05:600c:548a:b0:40c:909:42ab with SMTP id iv10-20020a05600c548a00b0040c090942abmr457848wmb.82.1701784078068;
        Tue, 05 Dec 2023 05:47:58 -0800 (PST)
Message-ID: <4bfb71ef-0443-40dd-a854-349db42a7a30@suse.com>
Date: Tue, 5 Dec 2023 14:47:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] xen/livepatch: register livepatch regions when loaded
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20231130142944.46322-1-roger.pau@citrix.com>
 <20231130142944.46322-2-roger.pau@citrix.com>
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
In-Reply-To: <20231130142944.46322-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.11.2023 15:29, Roger Pau Monne wrote:
> Currently livepatch regions are registered as virtual regions only after the
> livepatch has been applied.
> 
> This can lead to issues when using the pre-apply or post-revert hooks, as at
> the point the livepatch is not in the virtual regions list.  If a livepatch
> pre-apply hook contains a WARN() it would trigger an hypervisor crash, as the
> code to handle the bug frame won't be able to find the instruction pointer that
> triggered the #UD in any of the registered virtual regions, and hence crash.
> 
> Fix this by adding the livepatch payloads as virtual regions as soon as loaded,
> and only remove them once the payload is unloaded.  This requires some changes
> to the virtual regions code, as the removal of the virtual regions is no longer
> done in stop machine context, and hence an RCU barrier is added in order to
> make sure there are no users of the virtual region after it's been removed from
> the list.
> 
> Fixes: 8313c864fa95 ('livepatch: Implement pre-|post- apply|revert hooks')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  xen/common/livepatch.c      |  5 +++--
>  xen/common/virtual_region.c | 40 +++++++++++--------------------------
>  2 files changed, 15 insertions(+), 30 deletions(-)
> 
> diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
> index 1209fea2566c..3199432f11f5 100644
> --- a/xen/common/livepatch.c
> +++ b/xen/common/livepatch.c
> @@ -942,6 +942,8 @@ static int prepare_payload(struct payload *payload,
>          }
>      }
>  
> +    register_virtual_region(region);
> +
>      return 0;
>  }
>  
> @@ -1071,6 +1073,7 @@ static int build_symbol_table(struct payload *payload,
>  static void free_payload(struct payload *data)
>  {
>      ASSERT(spin_is_locked(&payload_lock));
> +    unregister_virtual_region(&data->region);
>      list_del(&data->list);
>      payload_cnt--;
>      payload_version++;
> @@ -1386,7 +1389,6 @@ static inline void apply_payload_tail(struct payload *data)
>       * The applied_list is iterated by the trap code.
>       */
>      list_add_tail_rcu(&data->applied_list, &applied_list);
> -    register_virtual_region(&data->region);
>  
>      data->state = LIVEPATCH_STATE_APPLIED;
>  }
> @@ -1432,7 +1434,6 @@ static inline void revert_payload_tail(struct payload *data)
>       * The applied_list is iterated by the trap code.
>       */
>      list_del_rcu(&data->applied_list);
> -    unregister_virtual_region(&data->region);
>  
>      data->reverted = true;
>      data->state = LIVEPATCH_STATE_CHECKED;
> diff --git a/xen/common/virtual_region.c b/xen/common/virtual_region.c
> index 5f89703f513b..b444253848cf 100644
> --- a/xen/common/virtual_region.c
> +++ b/xen/common/virtual_region.c
> @@ -23,14 +23,8 @@ static struct virtual_region core_init __initdata = {
>  };
>  
>  /*
> - * RCU locking. Additions are done either at startup (when there is only
> - * one CPU) or when all CPUs are running without IRQs.
> - *
> - * Deletions are bit tricky. We do it when Live Patch (all CPUs running
> - * without IRQs) or during bootup (when clearing the init).
> - *
> - * Hence we use list_del_rcu (which sports an memory fence) and a spinlock
> - * on deletion.
> + * RCU locking. Modifications to the list must be done in exclusive mode, and
> + * hence need to hold the spinlock.
>   *
>   * All readers of virtual_region_list MUST use list_for_each_entry_rcu.
>   */
> @@ -58,38 +52,28 @@ const struct virtual_region *find_text_region(unsigned long addr)
>  
>  void register_virtual_region(struct virtual_region *r)
>  {
> -    ASSERT(!local_irq_is_enabled());
> +    unsigned long flags;
>  
> +    spin_lock_irqsave(&virtual_region_lock, flags);
>      list_add_tail_rcu(&r->list, &virtual_region_list);
> +    spin_unlock_irqrestore(&virtual_region_lock, flags);
>  }
>  
>  static void remove_virtual_region(struct virtual_region *r)
>  {
> -    unsigned long flags;
> +     unsigned long flags;

Nit: Stray blank added?

> -    spin_lock_irqsave(&virtual_region_lock, flags);
> -    list_del_rcu(&r->list);
> -    spin_unlock_irqrestore(&virtual_region_lock, flags);
> -    /*
> -     * We do not need to invoke call_rcu.
> -     *
> -     * This is due to the fact that on the deletion we have made sure
> -     * to use spinlocks (to guard against somebody else calling
> -     * unregister_virtual_region) and list_deletion spiced with
> -     * memory barrier.
> -     *
> -     * That protects us from corrupting the list as the readers all
> -     * use list_for_each_entry_rcu which is safe against concurrent
> -     * deletions.
> -     */
> +     spin_lock_irqsave(&virtual_region_lock, flags);
> +     list_del_rcu(&r->list);
> +     spin_unlock_irqrestore(&virtual_region_lock, flags);
>  }
>  
>  void unregister_virtual_region(struct virtual_region *r)
>  {
> -    /* Expected to be called from Live Patch - which has IRQs disabled. */
> -    ASSERT(!local_irq_is_enabled());
> -
>      remove_virtual_region(r);
> +
> +    /* Assert that no CPU might be using the removed region. */
> +    rcu_barrier();
>  }

rcu_barrier() is a relatively heavy operation aiui. Seeing ...

>  #if defined(CONFIG_LIVEPATCH) && defined(CONFIG_X86)

... this I'd like to ask to consider hiding {,un}register_virtual_region()
in "#ifdef CONFIG_LIVEPATCH" as well, to make clear these aren't supposed
to be used for other purpose. Would at the same time address two Misra
violations, I think (both functions having no callers when !LIVEPATCH).

Jan

