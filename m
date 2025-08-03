Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21776B19418
	for <lists+xen-devel@lfdr.de>; Sun,  3 Aug 2025 15:20:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1068605.1432579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiYcW-0004vU-JX; Sun, 03 Aug 2025 13:19:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1068605.1432579; Sun, 03 Aug 2025 13:19:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiYcW-0004sV-Fv; Sun, 03 Aug 2025 13:19:24 +0000
Received: by outflank-mailman (input) for mailman id 1068605;
 Sun, 03 Aug 2025 13:19:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iRTh=2P=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uiYcU-0004qs-EP
 for xen-devel@lists.xenproject.org; Sun, 03 Aug 2025 13:19:22 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74fd357d-706c-11f0-b897-0df219b8e170;
 Sun, 03 Aug 2025 15:19:17 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4561607166aso24929305e9.2
 for <xen-devel@lists.xenproject.org>; Sun, 03 Aug 2025 06:19:17 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45923c34af8sm30149645e9.24.2025.08.03.06.19.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Aug 2025 06:19:15 -0700 (PDT)
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
X-Inumbo-ID: 74fd357d-706c-11f0-b897-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754227156; x=1754831956; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0d54vzT0IEtRJjFgIgZYJvAjoUZJMvrVl8H8Cakn0OM=;
        b=k1+WmqIA0hnxez+LCRxXVPOwzuvZ3ampx7uFbfemPF1U2OGRoSpOm9xX6Aiksl/oEY
         seanIwf05o2nUrLCd/kodyN65sEXdvlD8EMdy4rptCPCTy50ZHzMP7zD2xPKJd+Mb6wN
         9BzIx+q7mdGpX5ReDQgrEUC8ACUKmm+qCvpEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754227156; x=1754831956;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0d54vzT0IEtRJjFgIgZYJvAjoUZJMvrVl8H8Cakn0OM=;
        b=wb8SRNo1PoJ6n2swuFbh2vbVrMNts0I0q1Pgi16BSgZb17kHKZVXyjLjCfHaAKsxND
         ejTUHRQgJI20QgnLIC/3j8l+ryEzNCES3IrNHE4zbiG3MMKvaMOwfkRBy/Pt3e5O0R2o
         hijU5bkGMZXvdiJvFPIB5LhtJwQdgyWYARlgkUKSfL1su1MWWQ02wiRk3R0SLeH+jzrs
         hnlvDtePUF4sG9KYSdOKRTd12Aivyx7aEZO6CTok0ImmLTuh0odWTbDdyd4iXVVLCii9
         6UU2n2DSI1hMLzKtDkg8zEoRvMK+jdBYhH9Yd2qBYNf935AUXxveLgp4kORc8axAdFHa
         ZSeA==
X-Forwarded-Encrypted: i=1; AJvYcCXr4cX0/z9JR13vSIVXfn3VBa6YfXhBFfEe5epyH3WkX2s5gpzwJk/0IEu+s7U76Y0TlSIMf1mws4s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxyGmQNBOnaM1eaREm+VVAZcJLchPnYTlJkiy599z8vqP8g4fnZ
	+k49o2Xt1gkJG4ukzNUF1Ch1TGooP31GT1S+7vSbo++k9VF6dbqcPjRgBSqL8t9Rkks=
X-Gm-Gg: ASbGnctPYq2IrBBjqYzbWBFeTHbFdTBxV3jIqus6PvC3A1fcD9eny55UTWFCl5vRHuH
	kcafZtubZ/tGHEsFs4WgK0DWfwQf6c8iZwDC/zQLoTxmoOSjK/E9BErpPT2zXYDdKjorO8zBW9Q
	zw8C7ND/WR49eOHo525jXDaHt8dGo14IlQhVUw4PdP2N3xGpwBeIrJczJnZl9TCRE9/yQGWAx9w
	C8LmBOSeu6kjVmVg0++nPwXImlZdViStJxmktqXT4/QtZbpaESs55WhWPZZ03liCWp/XV9HG2j/
	Lj00JnH45RVibf62Mwfbba4ZMNDqvophK3jsnjQ9ULHPJomB/jtsKwiXKkrJ3tg6JGyqWoZS5mL
	36bVhYAHErFAm1EcothO78/ZKz+1ZgndMozzC1RGGg9HumAqMeQHp8mZb3FHKPDGAkhk3
X-Google-Smtp-Source: AGHT+IHD4uUFZrYfolaCwpwtvzGm8rIyaQRszIGouJe4P3K7KmojEQh5XJ9r//0tHaFemcyJedStJA==
X-Received: by 2002:a05:600c:1d05:b0:459:d709:e5c9 with SMTP id 5b1f17b1804b1-459d709e963mr8815925e9.6.1754227156362;
        Sun, 03 Aug 2025 06:19:16 -0700 (PDT)
Message-ID: <c1aff2d0-0542-48da-a0bd-30d0eae1eef4@citrix.com>
Date: Sun, 3 Aug 2025 14:19:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen: rework error handling in vcpu_create
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>
References: <20250801202418.38977-1-stewart.hildebrand@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250801202418.38977-1-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/08/2025 9:24 pm, Stewart Hildebrand wrote:
> In vcpu_create after scheduler data is allocated, if
> vmtrace_alloc_buffer fails, it will jump to the wrong cleanup label
> resulting in a memory leak.
>
> Move sched_destroy_vcpu and destroy_waitqueue_vcpu to vcpu_teardown.
> Make vcpu_teardown idempotent: deal with NULL unit.
>
> Fix vcpu_runstate_get (called during XEN_SYSCTL_getdomaininfolist post
> vcpu_teardown) when v->sched_unit is NULL.

This is unfortunate.  It feels wrong to be updating stats on a domain
that's in the process of being destroyed, especially as a side effect of
a get call.

But, I wonder if we've uncovered an object lifecycle problem here. 
Previously any vCPU which was addressable in the system (i.e. domid was
addressable, a d->vcpu[x] was not NULL) had a unit.

>
> Fixes: 217dd79ee292 ("xen/domain: Add vmtrace_size domain creation parameter")
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> ---
> v1->v2:
> * move cleanup functions to vcpu_teardown
> * renamed, was ("xen: fix memory leak on error in vcpu_create")
> ---
>  xen/common/domain.c     | 14 ++++++--------
>  xen/common/sched/core.c |  5 ++++-
>  2 files changed, 10 insertions(+), 9 deletions(-)
>
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 5241a1629eeb..9c65c2974ea3 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -388,6 +388,8 @@ static int vmtrace_alloc_buffer(struct vcpu *v)
>  static int vcpu_teardown(struct vcpu *v)
>  {
>      vmtrace_free_buffer(v);
> +    sched_destroy_vcpu(v);
> +    destroy_waitqueue_vcpu(v);
>  
>      return 0;
>  }

Along with this, you want a matching:

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 5241a1629eeb..3fd75a6d6784 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1412,8 +1412,6 @@ static void cf_check complete_domain_destroy(struct rcu_head *head)
             continue;
         tasklet_kill(&v->continue_hypercall_tasklet);
         arch_vcpu_destroy(v);
-        sched_destroy_vcpu(v);
-        destroy_waitqueue_vcpu(v);
     }
 
     grant_table_destroy(d);


> @@ -448,13 +450,13 @@ struct vcpu *vcpu_create(struct domain *d, unsigned int vcpu_id)
>      }
>  
>      if ( sched_init_vcpu(v) != 0 )
> -        goto fail_wq;
> +        goto fail;
>  
>      if ( vmtrace_alloc_buffer(v) != 0 )
> -        goto fail_wq;
> +        goto fail;
>  
>      if ( arch_vcpu_create(v) != 0 )
> -        goto fail_sched;
> +        goto fail;
>  
>      d->vcpu[vcpu_id] = v;
>      if ( vcpu_id != 0 )
> @@ -472,11 +474,7 @@ struct vcpu *vcpu_create(struct domain *d, unsigned int vcpu_id)
>  
>      return v;
>  
> - fail_sched:
> -    sched_destroy_vcpu(v);
> - fail_wq:
> -    destroy_waitqueue_vcpu(v);
> -
> + fail:
>      /* Must not hit a continuation in this context. */
>      if ( vcpu_teardown(v) )
>          ASSERT_UNREACHABLE();
> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
> index 2ab4313517c3..fb7c99b05360 100644
> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -321,7 +321,7 @@ void vcpu_runstate_get(const struct vcpu *v,
>       */
>      unit = is_idle_vcpu(v) ? get_sched_res(v->processor)->sched_unit_idle
>                             : v->sched_unit;
> -    lock = likely(v == current) ? NULL : unit_schedule_lock_irq(unit);
> +    lock = likely(v == current || !unit) ? NULL : unit_schedule_lock_irq(unit);

This is obfuscation for obfuscations sake.  The normal way of writing it
would be:

    if ( v != current && unit )
        lock = unit_schedule_lock_irq(unit);

and that is precisely what the compiler emits.

Moreover it also matches the pattern for how the lock is released, later
in the function.

~Andrew

