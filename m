Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D21E520217
	for <lists+xen-devel@lfdr.de>; Mon,  9 May 2022 18:15:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.324679.546833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no62T-0005Sx-Ae; Mon, 09 May 2022 16:15:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 324679.546833; Mon, 09 May 2022 16:15:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no62T-0005Pt-7r; Mon, 09 May 2022 16:15:13 +0000
Received: by outflank-mailman (input) for mailman id 324679;
 Mon, 09 May 2022 16:15:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UBfn=VR=arm.com=suzuki.poulose@srs-se1.protection.inumbo.net>)
 id 1no62R-0005Pn-NL
 for xen-devel@lists.xenproject.org; Mon, 09 May 2022 16:15:11 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 327ea382-cfb3-11ec-a406-831a346695d4;
 Mon, 09 May 2022 18:15:09 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DD7641480;
 Mon,  9 May 2022 09:15:08 -0700 (PDT)
Received: from [10.57.1.248] (unknown [10.57.1.248])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 15C183F73D;
 Mon,  9 May 2022 09:14:59 -0700 (PDT)
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
X-Inumbo-ID: 327ea382-cfb3-11ec-a406-831a346695d4
Message-ID: <d9ec6f31-6125-0723-b7d7-5898abeb3289@arm.com>
Date: Mon, 9 May 2022 17:14:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Subject: Re: [PATCH 09/30] coresight: cpu-debug: Replace mutex with
 mutex_trylock on panic notifier
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>, akpm@linux-foundation.org,
 bhe@redhat.com, pmladek@suse.com, kexec@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 coresight@lists.linaro.org, linuxppc-dev@lists.ozlabs.org,
 linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-um@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, netdev@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, rcu@vger.kernel.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org,
 kernel-dev@igalia.com, kernel@gpiccoli.net, halves@canonical.com,
 fabiomirmar@gmail.com, alejandro.j.jimenez@oracle.com,
 andriy.shevchenko@linux.intel.com, arnd@arndb.de, bp@alien8.de,
 corbet@lwn.net, d.hatayama@jp.fujitsu.com, dave.hansen@linux.intel.com,
 dyoung@redhat.com, feng.tang@intel.com, gregkh@linuxfoundation.org,
 mikelley@microsoft.com, hidehiro.kawai.ez@hitachi.com, jgross@suse.com,
 john.ogness@linutronix.de, keescook@chromium.org, luto@kernel.org,
 mhiramat@kernel.org, mingo@redhat.com, paulmck@kernel.org,
 peterz@infradead.org, rostedt@goodmis.org, senozhatsky@chromium.org,
 stern@rowland.harvard.edu, tglx@linutronix.de, vgoyal@redhat.com,
 vkuznets@redhat.com, will@kernel.org, Leo Yan <leo.yan@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Mike Leach <mike.leach@linaro.org>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-10-gpiccoli@igalia.com>
 <3cafe4fd-8a0b-2633-44a3-2995abd6c38c@arm.com>
 <65f24bc5-2211-0139-ee12-b2608e81ceb1@igalia.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <65f24bc5-2211-0139-ee12-b2608e81ceb1@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi

On 09/05/2022 14:09, Guilherme G. Piccoli wrote:
> On 28/04/2022 05:11, Suzuki K Poulose wrote:
>> Hi Guilherme,
>>
>> On 27/04/2022 23:49, Guilherme G. Piccoli wrote:
>>> The panic notifier infrastructure executes registered callbacks when
>>> a panic event happens - such callbacks are executed in atomic context,
>>> with interrupts and preemption disabled in the running CPU and all other
>>> CPUs disabled. That said, mutexes in such context are not a good idea.
>>>
>>> This patch replaces a regular mutex with a mutex_trylock safer approach;
>>> given the nature of the mutex used in the driver, it should be pretty
>>> uncommon being unable to acquire such mutex in the panic path, hence
>>> no functional change should be observed (and if it is, that would be
>>> likely a deadlock with the regular mutex).
>>>
>>> Fixes: 2227b7c74634 ("coresight: add support for CPU debug module")
>>> Cc: Leo Yan <leo.yan@linaro.org>
>>> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
>>> Cc: Mike Leach <mike.leach@linaro.org>
>>> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
>>> Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
>>
>> How would you like to proceed with queuing this ? I am happy
>> either way. In case you plan to push this as part of this
>> series (I don't see any potential conflicts) :
>>
>> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> 
> Hi Suzuki, some other maintainers are taking the patches to their next
> branches for example. I'm working on V2, and I guess in the end would be
> nice to reduce the size of the series a bit.
> 
> So, do you think you could pick this one for your coresight/next branch
> (or even for rc cycle, your call - this is really a fix)?
> This way, I won't re-submit this one in V2, since it's gonna be merged
> already in your branch.

I have queued this to coresight/next.

Thanks
Suzuki

