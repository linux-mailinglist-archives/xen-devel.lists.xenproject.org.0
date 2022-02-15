Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE4C4B6D1B
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 14:13:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273165.468247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJxdj-0003YC-OZ; Tue, 15 Feb 2022 13:13:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273165.468247; Tue, 15 Feb 2022 13:13:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJxdj-0003VQ-L3; Tue, 15 Feb 2022 13:13:07 +0000
Received: by outflank-mailman (input) for mailman id 273165;
 Tue, 15 Feb 2022 13:13:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nJxdh-0003VK-Cd
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 13:13:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nJxdh-0001MW-2e; Tue, 15 Feb 2022 13:13:05 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239] helo=[192.168.8.20])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nJxdg-0006Sp-SN; Tue, 15 Feb 2022 13:13:05 +0000
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
	bh=6J7psP7Iy28BwTvT7zC1AKnRAyiW2NFGFhyAnXSj0OI=; b=Afo/+ctLAhv/W74/kIZZ64JXQ9
	EUR13Yx0P0CHwTc4z/IPYH4V7LmiqxL+kQd9c2Js9EVvdPb3Y2AlHRO+2htrqWhxAbdto33JFY2za
	IxusRXtmCAzz45B/eQ0brm+r8n0a0ZznR+MPh62QYO25UYEC8e9mzIeccbcYwzuuxrbI=;
Message-ID: <7710f137-7123-ca70-3a58-3dba1981b2c2@xen.org>
Date: Tue, 15 Feb 2022 13:13:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: [PATCH] rwlock: remove unneeded subtraction
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220215093951.97830-1-roger.pau@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220215093951.97830-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 15/02/2022 09:39, Roger Pau Monne wrote:
> There's no need to subtract _QR_BIAS from the lock value for storing
> in the local cnts variable in the read lock slow path: the users of
> the value in cnts only care about the writer-related bits and use a
> mask to get the value.
> 
> Note that further setting of cnts in rspin_until_writer_unlock already
> do not subtract _QR_BIAS.

The rwlock is a copy of the Linux implementation. So I looked at the 
history to find out why _QR_BIAS was substracted.

It looks like this was done to get better assembly on x86:

commit f9852b74bec0117b888da39d070c323ea1cb7f4c
Author: Peter Zijlstra <peterz@infradead.org>
Date:   Mon Apr 18 01:27:03 2016 +0200

     locking/atomic, arch/qrwlock: Employ atomic_fetch_add_acquire()

     The only reason for the current code is to make GCC emit only the
     "LOCK XADD" instruction on x86 (and not do a pointless extra ADD on
     the result), do so nicer.

     Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
     Acked-by: Waiman Long <waiman.long@hpe.com>
     Cc: Andrew Morton <akpm@linux-foundation.org>
     Cc: Linus Torvalds <torvalds@linux-foundation.org>
     Cc: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
     Cc: Peter Zijlstra <peterz@infradead.org>
     Cc: Thomas Gleixner <tglx@linutronix.de>
     Cc: linux-arch@vger.kernel.org
     Cc: linux-kernel@vger.kernel.org
     Signed-off-by: Ingo Molnar <mingo@kernel.org>

diff --git a/kernel/locking/qrwlock.c b/kernel/locking/qrwlock.c
index fec082338668..19248ddf37ce 100644
--- a/kernel/locking/qrwlock.c
+++ b/kernel/locking/qrwlock.c
@@ -93,7 +93,7 @@ void queued_read_lock_slowpath(struct qrwlock *lock, 
u32 cnts)
          * that accesses can't leak upwards out of our subsequent critical
          * section in the case that the lock is currently held for write.
          */
-       cnts = atomic_add_return_acquire(_QR_BIAS, &lock->cnts) - _QR_BIAS;
+       cnts = atomic_fetch_add_acquire(_QR_BIAS, &lock->cnts);
         rspin_until_writer_unlock(lock, cnts);

         /*

This is a slowpath, so probably not a concern. But I thought I would 
double check whether the x86 folks are still happy to proceed with that 
in mind.

Cheers,

-- 
Julien Grall

