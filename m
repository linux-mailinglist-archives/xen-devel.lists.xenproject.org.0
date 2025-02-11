Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0AFA309FD
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 12:33:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885436.1295244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thoVx-0007Kf-0s; Tue, 11 Feb 2025 11:33:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885436.1295244; Tue, 11 Feb 2025 11:33:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thoVw-0007Il-UG; Tue, 11 Feb 2025 11:33:16 +0000
Received: by outflank-mailman (input) for mailman id 885436;
 Tue, 11 Feb 2025 11:33:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OJrH=VC=huawei.com=ruanjinjie@srs-se1.protection.inumbo.net>)
 id 1thoVv-0007Ia-Kw
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 11:33:15 +0000
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f47a879a-e86b-11ef-b3ef-695165c68f79;
 Tue, 11 Feb 2025 12:33:06 +0100 (CET)
Received: from mail.maildlp.com (unknown [172.19.88.105])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4YsfPX61twzRmPj;
 Tue, 11 Feb 2025 19:30:08 +0800 (CST)
Received: from kwepemg200008.china.huawei.com (unknown [7.202.181.35])
 by mail.maildlp.com (Postfix) with ESMTPS id CA848140159;
 Tue, 11 Feb 2025 19:33:00 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemg200008.china.huawei.com (7.202.181.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 11 Feb 2025 19:32:59 +0800
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
X-Inumbo-ID: f47a879a-e86b-11ef-b3ef-695165c68f79
Message-ID: <b54bae8c-5106-41aa-60ab-27146660a16e@huawei.com>
Date: Tue, 11 Feb 2025 19:32:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next v5 11/22] arm64: entry: Switch to generic IRQ entry
To: Mark Rutland <mark.rutland@arm.com>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <oleg@redhat.com>,
	<sstabellini@kernel.org>, <tglx@linutronix.de>, <peterz@infradead.org>,
	<luto@kernel.org>, <mingo@redhat.com>, <juri.lelli@redhat.com>,
	<vincent.guittot@linaro.org>, <dietmar.eggemann@arm.com>,
	<rostedt@goodmis.org>, <bsegall@google.com>, <mgorman@suse.de>,
	<vschneid@redhat.com>, <kees@kernel.org>, <wad@chromium.org>,
	<akpm@linux-foundation.org>, <samitolvanen@google.com>,
	<masahiroy@kernel.org>, <hca@linux.ibm.com>, <aliceryhl@google.com>,
	<rppt@kernel.org>, <xur@google.com>, <paulmck@kernel.org>, <arnd@arndb.de>,
	<mbenes@suse.cz>, <puranjay@kernel.org>, <pcc@google.com>, <ardb@kernel.org>,
	<sudeep.holla@arm.com>, <guohanjun@huawei.com>, <rafael@kernel.org>,
	<liuwei09@cestc.cn>, <dwmw@amazon.co.uk>, <Jonathan.Cameron@huawei.com>,
	<liaochang1@huawei.com>, <kristina.martsenko@arm.com>, <ptosi@google.com>,
	<broonie@kernel.org>, <thiago.bauermann@linaro.org>, <kevin.brodsky@arm.com>,
	<joey.gouly@arm.com>, <liuyuntao12@huawei.com>, <leobras@redhat.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<xen-devel@lists.xenproject.org>
References: <20241206101744.4161990-1-ruanjinjie@huawei.com>
 <20241206101744.4161990-12-ruanjinjie@huawei.com>
 <Z6nv9SLi0za8tE69@J2N7QTR9R3>
Content-Language: en-US
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <Z6nv9SLi0za8tE69@J2N7QTR9R3>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemg200008.china.huawei.com (7.202.181.35)



On 2025/2/10 20:24, Mark Rutland wrote:
> On Fri, Dec 06, 2024 at 06:17:33PM +0800, Jinjie Ruan wrote:
>> Currently, x86, Riscv, Loongarch use the generic entry. Convert arm64
>> to use the generic entry infrastructure from kernel/entry/*.
>> The generic entry makes maintainers' work easier and codes
>> more elegant.
>>
>> Switch arm64 to generic IRQ entry first, which removed duplicate 100+
>> LOC, and it will switch to generic entry completely later. Switch to
>> generic entry in two steps according to Mark's suggestion will make
>> it easier to review.
>>
>> The changes are below:
>>  - Remove *enter_from/exit_to_kernel_mode(), and wrap with generic
>>    irqentry_enter/exit(). Also remove *enter_from/exit_to_user_mode(),
>>    and wrap with generic enter_from/exit_to_user_mode() because they
>>    are exactly the same so far.
>>
>>  - Remove arm64_enter/exit_nmi() and use generic irqentry_nmi_enter/exit()
>>    because they're exactly the same, so the temporary arm64 version
>>    irqentry_state can also be removed.
>>
>>  - Remove PREEMPT_DYNAMIC code, as generic entry do the same thing
>>    if arm64 implement arch_irqentry_exit_need_resched().
>>
>> Suggested-by: Mark Rutland <mark.rutland@arm.com>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>>  arch/arm64/Kconfig                    |   1 +
>>  arch/arm64/include/asm/entry-common.h |  64 ++++++
>>  arch/arm64/include/asm/preempt.h      |   6 -
>>  arch/arm64/kernel/entry-common.c      | 307 ++++++--------------------
>>  arch/arm64/kernel/signal.c            |   3 +-
>>  5 files changed, 129 insertions(+), 252 deletions(-)
>>  create mode 100644 arch/arm64/include/asm/entry-common.h
> 
> Superficially this looks nice, but to be clear I have *not* looked at
> this in great detail; minor comments below.
> 
> [...]
> 
>> +static inline void arch_exit_to_user_mode_prepare(struct pt_regs *regs,
>> +						  unsigned long ti_work)
>> +{
>> +	local_daif_mask();
>> +}
>> +
>> +#define arch_exit_to_user_mode_prepare arch_exit_to_user_mode_prepare
> 
> I'm a little worried that this may be fragile having been hidden in the
> common code, as it's not clear exactly when this will occur during the
> return sequence, and the ordering requirements could easily be broken by
> refactoring there.
> 
> I suspect we'll want to pull this later in the arm64 exit sequence so
> that we can have it explicit in entry-common.c.

Yes, this key function is hidden in generic entry code and is not easy
to clear and see when it is executed. But placing it directly in
entry-common.c in arm64 may change the order in which lockdep_sys_exit()
and local_daif_mask() are called, it's not clear what the potential
impact is.

Before:
   exit_to_user_mode_prepare()
      ...
      -> local_daif_mask()
      -> lockdep_sys_exit()


arm64_exit_to_user_mode()
  ...
  -> exit_to_user_mode_prepare()
     -> lockdep_sys_exit()
  -> local_daif_mask()

> 
> [...]
> 
>> index 14ac6fdb872b..84b6628647c7 100644
>> --- a/arch/arm64/kernel/signal.c
>> +++ b/arch/arm64/kernel/signal.c
>> @@ -9,6 +9,7 @@
>>  #include <linux/cache.h>
>>  #include <linux/compat.h>
>>  #include <linux/errno.h>
>> +#include <linux/irq-entry-common.h>
>>  #include <linux/kernel.h>
>>  #include <linux/signal.h>
>>  #include <linux/freezer.h>
>> @@ -1603,7 +1604,7 @@ static void handle_signal(struct ksignal *ksig, struct pt_regs *regs)
>>   * the kernel can handle, and then we build all the user-level signal handling
>>   * stack-frames in one go after that.
>>   */
>> -void do_signal(struct pt_regs *regs)
>> +void arch_do_signal_or_restart(struct pt_regs *regs)
>>  {
>>  	unsigned long continue_addr = 0, restart_addr = 0;
>>  	int retval = 0;
> 
> Is the expected semantic the same here, or is those more than just a
> name change?

Yes, the expected semantic is the same here, they both handle
_TIF_SIGPENDING and _TIF_NOTIFY_SIGNAL thread flags before
exit to user.

In arm64 the code call sequence is:

  exit_to_user_mode()
     -> exit_to_user_mode_prepare()
        -> do_notify_resume(regs, flags)
           -> if (thread_flags & (_TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL))
                 do_signal(regs)

In generic entry code, the logic is the same:

  exit_to_user_mode_prepare()
      -> exit_to_user_mode_loop()
          -> if (ti_work & (_TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL))
                 arch_do_signal_or_restart(regs)

> 
> Mark.
> 

