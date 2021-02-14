Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B10E31B20A
	for <lists+xen-devel@lfdr.de>; Sun, 14 Feb 2021 19:38:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.84993.159275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBMGQ-00042g-UD; Sun, 14 Feb 2021 18:36:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 84993.159275; Sun, 14 Feb 2021 18:36:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBMGQ-00042H-Qt; Sun, 14 Feb 2021 18:36:58 +0000
Received: by outflank-mailman (input) for mailman id 84993;
 Sun, 14 Feb 2021 18:36:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lBMGP-00042C-70
 for xen-devel@lists.xenproject.org; Sun, 14 Feb 2021 18:36:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lBMGO-0000DI-U9; Sun, 14 Feb 2021 18:36:56 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lBMGO-0002P5-FX; Sun, 14 Feb 2021 18:36:56 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=cv+PoO2hB3Ur/fcAURS3NBl+Is4TBPmhFrEjfDJTO5o=; b=kzuvCnlR95SOwLAiXp25xrvVLm
	+gngY086PBKMUbCMb+dRw8dWqBaSaCd+EYAIuhea0TAM2Dz2AOOzxVw5v4xUR+3u5GAL29bueNbOM
	h3Gv0zjTC5GXA6g6H4dK5vXA+zg5kURm95oujtMrmSrEKxpMgf+L8fHc+BhT0WUApKBg=;
Subject: Re: [RFC PATCH v2 00/15] xen/arm: port Linux LL/SC and LSE atomics
 helpers to Xen
To: Ash Wilding <ash.j.wilding@gmail.com>
Cc: bertrand.marquis@arm.com, rahul.singh@arm.com, sstabellini@kernel.org,
 xen-devel@lists.xenproject.org
References: <cb0f7055-6d9a-5c39-6198-109593fd3424@xen.org>
 <20201217153742.14034-1-ash.j.wilding@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <5d79ab3f-7307-d61d-f743-6b14cde2477f@xen.org>
Date: Sun, 14 Feb 2021 18:36:54 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20201217153742.14034-1-ash.j.wilding@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 17/12/2020 15:37, Ash Wilding wrote:
> Hi Julien,

Hi,

First of all, apologies for the very late reply.

> Thanks for taking a look at the patches and providing feedback. I've seen your
> other comments and will reply to those separately when I get a chance (maybe at
> the weekend or over the Christmas break).
> 
> RE the differences in ordering semantics between Xen's and Linux's atomics
> helpers, please find my notes below.
> 
> Thoughts?

Thank you for the very detailed answer, it made a lot easier to 
understand the differences!

I think it would be good to have some (if not all) the content in 
Documents for future reference.

[...]

> The tables below use format AAA/BBB/CCC/DDD/EEE, where:
> 
>   - AAA is the memory barrier before the operation
>   - BBB is the acquire semantics of the atomic operation
>   - CCC is the release semantics of the atomic operation
>   - DDD is whether the asm() block clobbers memory
>   - EEE is the memory barrier after the operation
> 
> For example, ---/---/rel/mem/dmb would mean:
> 
>   - No memory barrier before the operation
>   - The atomic does *not* have acquire semantics
>   - The atomic *does* have release semantics
>   - The asm() block clobbers memory
>   - There is a DMB memory barrier after the atomic operation
> 
> 
>      arm64 LL/SC
>      ===========
> 
>          Xen Function            Xen                     Linux                   Inconsistent
>          ============            ===                     =====                   ============
> 
>          atomic_add              ---/---/---/---/---     ---/---/---/---/---     ---
>          atomic_add_return       ---/---/rel/mem/dmb     ---/---/rel/mem/dmb     --- (1)
>          atomic_sub              ---/---/---/---/---     ---/---/---/---/---     ---
>          atomic_sub_return       ---/---/rel/mem/dmb     ---/---/rel/mem/dmb     --- (1)
>          atomic_and              ---/---/---/---/---     ---/---/---/---/---     ---
>          atomic_cmpxchg          dmb/---/---/---/dmb     ---/---/rel/mem/---     YES (2)

If I am not mistaken, Linux is implementing atomic_cmpxchg() with the 
*_mb() version. So the semantic would be:

---/---/rel/mem/dmb

>          atomic_xchg             ---/---/rel/mem/dmb     ---/acq/rel/mem/dmb     YES (3)

 From Linux:

#define __XCHG_CASE(w, sfx, name, sz, mb, nop_lse, acq, acq_lse, rel, 
cl)       \

[...]

         /* LL/SC */ 
          \
         "       prfm    pstl1strm, %2\n" 
          \
         "1:     ld" #acq "xr" #sfx "\t%" #w "0, %2\n" 
          \
         "       st" #rel "xr" #sfx "\t%w1, %" #w "3, %2\n" 
          \
         "       cbnz    %w1, 1b\n" 
          \
         "       " #mb, 
          \

[...]

__XCHG_CASE(w,  ,  mb_, 32, dmb ish, nop,  , a, l, "memory")

So I think the Linux semantic would be:

---/---/rel/mem/dmb

Therefore there would be no inconsistency between Xen and Linux.

> 
> (1) It's actually interesting to me that Linux does it this way. As with the
>      LSE atomics below, I'd have expected acq/rel semantics and ditch the DMB.

I have done some digging. The original implementation of atomic_{sub, 
add}_return was actually using acq/rel semantics up until Linux 3.14. 
But this was reworked by 8e86f0b409a4 "arm64: atomics: fix use of 
acquire + release for full barrier semantics".

>      Unless I'm missing something where there is a concern around taking an IRQ
>      between the LDAXR and the STLXR, which can't happen in the LSE atomic case
>      since it's a single instruction. But the exclusive monitor is cleared on
>      exception return in AArch64 so I'm struggling to see what that potential
>      issue may be. Regardless, Linux and Xen are consistent so we're OK ;-)

The commit I pointed above contains a lot of details on the issue. For 
convenience, I copied the most relevant bits below:

"
On arm64, these operations have been incorrectly implemented as follows:

             // A, B, C are independent memory locations

             <Access [A]>

             // atomic_op (B)
     1:      ldaxr   x0, [B]         // Exclusive load with acquire
             <op(B)>
             stlxr   w1, x0, [B]     // Exclusive store with release
             cbnz    w1, 1b

             <Access [C]>

The assumption here being that two half barriers are equivalent to a
full barrier, so the only permitted ordering would be A -> B -> C
(where B is the atomic operation involving both a load and a store).

Unfortunately, this is not the case by the letter of the architecture
and, in fact, the accesses to A and C are permitted to pass their
nearest half barrier resulting in orderings such as Bl -> A -> C -> Bs
or Bl -> C -> A -> Bs (where Bl is the load-acquire on B and Bs is the
store-release on B). This is a clear violation of the full barrier
requirement.
"

> (2) The Linux version uses either STLXR with rel semantics if the comparison
>      passes, or DMB if the comparison fails.

I think the DMB is only on the success path and there is no barrier on 
the failure path. The commit 4e39715f4b5c "arm64: cmpxchg: avoid memory 
barrier on comparison failure" seems to corroborate that.

> This is weaker than Xen's version,
>      which is quite blunt in always wrapping the operation between two DMBs. This
>      may be a holdover from Xen's arm32 versions being ported to arm64, as we
>      didn't support acq/rel semantics on LDREX and STREX in Armv7-A? Regardless,

The atomic helpers used in Xen were originally taken from Linux 3.14. 
Back then, atomic_cmpxchg() were using the two full barriers. This was 
introduced by the commit I pointed out in (1).

This was then optimized with commit 4e39715f4b5c "arm64: cmpxchg: avoid 
memory barrier on comparison failure".

>      this is quite a big discrepancy and I've not yet given it enough thought to
>      determine whether it would actually cause an issue. My feeling is that the
>      Linux LL/SC atomic_cmpxchg() should have have acq semantics on the LL, but
>      like you said these helpers are well tested so I'd be surprised if there
>      is a bug. See (5) below though, where the Linux LSE atomic_cmpxchg() *does*
>      have acq semantics.

If my understanding is correct the semantics would be (xen vs Linux):

  - failure: dmb/---/---/---/dmb     ---/---/rel/mem/---
  - success: dmb/---/---/---/dmb     ---/---/rel/mem/dmb

I think the success path is not going to be a problem. But we would need 
to check if all the callers expect a full barrier for the failure path 
(I would hope not).

> 
> (3) The Linux version just adds acq semantics to the LL, so we're OK here.
> 
> 
>      arm64 LSE (comparison to Xen's LL/SC)
>      =====================================
> 
>          Xen Function            Xen                     Linux                   Inconsistent
>          ============            ===                     =====                   ============
> 
>          atomic_add              ---/---/---/---/---     ---/---/---/---/---     ---
>          atomic_add_return       ---/---/rel/mem/dmb     ---/acq/rel/mem/---     YES (4)
>          atomic_sub              ---/---/---/---/---     ---/---/---/---/---     ---
>          atomic_sub_return       ---/---/rel/mem/dmb     ---/acq/rel/mem/---     YES (4)
>          atomic_and              ---/---/---/---/---     ---/---/---/---/---     ---
>          atomic_cmpxchg          dmb/---/---/---/dmb     ---/acq/rel/mem/---     YES (5)
>          atomic_xchg             ---/---/rel/mem/dmb     ---/acq/rel/mem/---     YES (4)
> 
> (4) As noted in (1), this is how I would have expected Linux's LL/SC atomics to
>      work too. I don't think this discrepancy will cause any issues.
IIUC, the LSE implementation would be using a single instruction that 
has both the acquire and release semantics. Therefore, it would act as a 
full barrier.

On the other hand, in the LL/SC implementation, the acquire and release 
semantics is happening with two different instruction. Therefore, they 
don't act as a full barrier.

So I think the memory ordering is going to be equivalent between Xen and 
the Linux LSE implementation.

> 
> (5) As with (2) above, this is quite a big discrepancy to Xen. However at least
>      this version has acq semantics unlike the LL/SC version in (2), so I'm more
>      confident that there won't be regressions going from Xen LL/SC to Linux LSE
>      version of atomic_cmpxchg().
Are they really different? In both cases, the helper will act as a full 
barrier. The main difference is how this ordering is achieved.

> 
> 
>      arm32 LL/SC
>      ===========
> 
>          Xen Function            Xen                     Linux                   Inconsistent
>          ============            ===                     =====                   ============
> 
>          atomic_add              ---/---/---/---/---     ---/---/---/---/---     ---
>          atomic_add_return       dmb/---/---/---/dmb     XXX/XXX/XXX/XXX/XXX     YES (6)
>          atomic_sub              ---/---/---/---/---     ---/---/---/---/---     ---
>          atomic_sub_return       dmb/---/---/---/dmb     XXX/XXX/XXX/XXX/XXX     YES (6)
>          atomic_and              ---/---/---/---/---     ---/---/---/---/---     ---
>          atomic_cmpxchg          dmb/---/---/---/dmb     XXX/XXX/XXX/XXX/XXX     YES (6)
>          atomic_xchg             dmb/---/---/---/dmb     XXX/XXX/XXX/XXX/XXX     YES (6)
> 
> (6) Linux only provides relaxed variants of these functions, such as
>      atomic_add_return_relaxed() and atomic_xchg_relaxed(). Patches #13 and #14
>      in the series add the stricter versions expected by Xen, wrapping calls to
>      Linux's relaxed variants inbetween two calls to smb_mb(). This makes them
>      consistent with Xen's existing helpers, though is quite blunt.

Linux will do the same when the fully ordered version is not implemented 
(see include/linux/atomic-fallback.h).

>  It is worth
>      noting that Armv8-A AArch32 does support acq/rel semantics on exclusive
>      accesses, with LDAEX and STLEX, so I could imagine us introducing a new
>      arm32 hwcap to detect whether we're on actual Armv7-A hardware or Armv8-A
>      AArch32, then swap to lighterweight STLEX versions of these helpers rather
>      than the heavyweight double DMB versions. Whether that would actually give
>      measurable performance improvements is another story!

That's good to know! So far, I haven't heard anyone using Xen 32-bit on 
Armv8. I would wait until there is a request before introducing a 3rd 
(4th if counting the ll/sc as 2) implementation for the atomics helpers.

That said, the 32-bit port is meant to only be supported on Armv7. It 
should boot on Armv8, but there is no promise it will be fully 
functional nor stable.

Overall, it looks like to me that re-syncing the atomic implementation 
with Linux should not be a major problem.

We are in the middle of 4.15 freeze, I will try to go through the series 
ASAP.

Cheers,

-- 
Julien Grall

