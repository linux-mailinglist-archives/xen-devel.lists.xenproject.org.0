Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1744FB2173D
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 23:22:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078084.1439089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulZy0-0001og-K5; Mon, 11 Aug 2025 21:22:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078084.1439089; Mon, 11 Aug 2025 21:22:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulZy0-0001nE-HA; Mon, 11 Aug 2025 21:22:04 +0000
Received: by outflank-mailman (input) for mailman id 1078084;
 Mon, 11 Aug 2025 21:22:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ulZxz-0001n4-As
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 21:22:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ulZxy-000FNA-18;
 Mon, 11 Aug 2025 21:22:02 +0000
Received: from [2a02:8012:3a1:0:80f0:1985:f3d0:f76b]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ulZxy-000a7l-1p;
 Mon, 11 Aug 2025 21:22:02 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=7PTHGPDw9778ffCut53tnJbfFF7vp0y3VWK3bvlyvRo=; b=GE92PZtDMDhuTDcSsVCN4iNtyE
	SlPRHgPxWTyq0o67AfJbJwzOqmZBKT7VNXADtDn6GIeG+MivI8OZfvmC+kFXlLZCR4A4Gdou/hnSB
	0qsXeDxZFcMAc3KT8HQsN6IxvLfw2s5gUoo98SjSWDCtvqbxn3dKTT7mQ5xspeA3+PL4=;
Message-ID: <59396fd1-ca82-4655-9dcf-ec36e0d51ffc@xen.org>
Date: Mon, 11 Aug 2025 22:21:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misra: add ASSERT_UNREACHABLE() in default clauses
Content-Language: en-GB
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <7cd71ed21383c189fedb3250ddde54a593f7f98b.1754944131.git.dmytro_prokopchuk1@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <7cd71ed21383c189fedb3250ddde54a593f7f98b.1754944131.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 11/08/2025 21:30, Dmytro Prokopchuk1 wrote:
> MISRA Rule 16.4: Every switch statement shall have a default label.
> The default clause must contain either a statement or a comment
> prior to its terminating break statement.
> 
> However, there is a documented rule that apply to the Xen in
> 'docs/misra/rules.rst':
> Switch statements with integer types as controlling expression
> should have a default label:
>   - if the switch is expected to handle all possible cases
>    explicitly, then a default label shall be added to handle
>    unexpected error conditions, using BUG(), ASSERT(), WARN(),
>    domain_crash(), or other appropriate methods;
 > > These changes add `ASSERT_UNREACHABLE()` macro to the default clause of
> switch statements that already explicitly handle all possible cases. This
> ensures compliance with MISRA, avoids undefined behavior in unreachable
> paths, and helps detect errors during development.
> 
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
> ---
>   xen/arch/arm/decode.c      |  3 +++
>   xen/arch/arm/guest_walk.c  |  4 ++++
>   xen/common/grant_table.c   | 10 ++++++++--
>   xen/drivers/char/console.c |  3 +++
>   4 files changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/decode.c b/xen/arch/arm/decode.c
> index 2537dbebc1..cb64137b3b 100644
> --- a/xen/arch/arm/decode.c
> +++ b/xen/arch/arm/decode.c
> @@ -178,6 +178,9 @@ static int decode_thumb(register_t pc, struct hsr_dabt *dabt)
>           case 3: /* Signed byte */
>               update_dabt(dabt, reg, 0, true);
>               break;
> +        default:
> +            ASSERT_UNREACHABLE();
> +            break;

I am not sure about this one. Can't the compiler or even ECLAIR detect 
that the value we match "opB & 3" and the 4 different values are handled?

 >           }>
>           break;
> diff --git a/xen/arch/arm/guest_walk.c b/xen/arch/arm/guest_walk.c
> index 09fe486598..9199a29602 100644
> --- a/xen/arch/arm/guest_walk.c
> +++ b/xen/arch/arm/guest_walk.c
> @@ -167,6 +167,10 @@ static bool guest_walk_sd(const struct vcpu *v,
>               *perms |= GV2M_EXEC;
>   
>           break;
> +
> +        default:
> +            ASSERT_UNREACHABLE();
> +            break;
>       }
>   
>       return true;
> diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
> index cf131c43a1..60fc47f0c8 100644
> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -330,9 +330,12 @@ shared_entry_header(struct grant_table *t, grant_ref_t ref)
>           /* Returned values should be independent of speculative execution */
>           block_speculation();
>           return &shared_entry_v2(t, ref).hdr;
> +
> +    default:
> +        ASSERT_UNREACHABLE();
> +        break;
>       }
>   
> -    ASSERT_UNREACHABLE();
 >       block_speculation();>
>       return NULL;

I know you are trying to apply the MISRA rule. But this is odd that you 
move the ASSERT_UNREACHABLE() but then code after is still only 
reachable from the default. In fact, this is introducing a risk if 
someone decides to add a new case but then forgot to return a value.

By moving the two other lines, the compiler should be able to throw an 
error if you forgot a return.


> @@ -727,10 +730,13 @@ static unsigned int nr_grant_entries(struct grant_table *gt)
>           /* Make sure we return a value independently of speculative execution */
>           block_speculation();
>           return f2e(nr_grant_frames(gt), 2);
> +
> +    default:
> +        ASSERT_UNREACHABLE();
> +        break;
>   #undef f2e
>       }
>   
> -    ASSERT_UNREACHABLE();
>       block_speculation();
>   
>       return 0;

Same remark here.

> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index 9bd5b4825d..608616f2af 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -889,6 +889,9 @@ static int cf_check parse_console_timestamps(const char *s)
>           opt_con_timestamp_mode = TSM_DATE;
>           con_timestamp_mode_upd(param_2_parfs(parse_console_timestamps));
>           return 0;
> +    default:
> +        ASSERT_UNREACHABLE();

Looking at the implementation of parse_bool() it can return -1 if the 
input provided is incorrect. So I don't think this path should contain 
ASSERT_UNREACHABLE(). In fact, it should follow this directive:

"
        - if the switch is expected to handle a subset of all possible
          cases, then an empty default label shall be added with an
          in-code comment on top of the default label with a reason and
          when possible a more detailed explanation. Example::

              default:
                  /* Notifier pattern */
                  break;
"

Cheers,

-- 
Julien Grall


