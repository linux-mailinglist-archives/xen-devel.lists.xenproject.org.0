Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F71F442A4F
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 10:23:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219824.380861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhq0n-0007B9-Cp; Tue, 02 Nov 2021 09:23:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219824.380861; Tue, 02 Nov 2021 09:23:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhq0n-00079N-9p; Tue, 02 Nov 2021 09:23:21 +0000
Received: by outflank-mailman (input) for mailman id 219824;
 Tue, 02 Nov 2021 09:19:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5FfJ=PV=linux.alibaba.com=laijs@srs-us1.protection.inumbo.net>)
 id 1mhpxQ-00059w-VP
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 09:19:52 +0000
Received: from out30-132.freemail.mail.aliyun.com (unknown [115.124.30.132])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0784807a-3bbe-11ec-8553-12813bfff9fa;
 Tue, 02 Nov 2021 09:19:51 +0000 (UTC)
Received: from 30.22.113.90(mailfrom:laijs@linux.alibaba.com
 fp:SMTPD_---0UujaEY1_1635844786) by smtp.aliyun-inc.com(127.0.0.1);
 Tue, 02 Nov 2021 17:19:47 +0800
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
X-Inumbo-ID: 0784807a-3bbe-11ec-8553-12813bfff9fa
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04400;MF=laijs@linux.alibaba.com;NM=1;PH=DS;RN=14;SR=0;TI=SMTPD_---0UujaEY1_1635844786;
Message-ID: <d4ae23dd-377e-8316-909b-d5bdeacc0904@linux.alibaba.com>
Date: Tue, 2 Nov 2021 17:19:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: [PATCH V4 04/50] x86/xen: Add
 xenpv_restore_regs_and_return_to_usermode()
Content-Language: en-US
To: Borislav Petkov <bp@alien8.de>, Lai Jiangshan <jiangshanlai@gmail.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
 Jan Beulich <jbeulich@suse.com>, Thomas Gleixner <tglx@linutronix.de>,
 Juergen Gross <jgross@suse.com>, Peter Anvin <hpa@zytor.com>,
 xen-devel@lists.xenproject.org, Andy Lutomirski <luto@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20211026141420.17138-1-jiangshanlai@gmail.com>
 <20211026141420.17138-5-jiangshanlai@gmail.com> <YYD9ohN2Zcy4EdMb@zn.tnic>
From: Lai Jiangshan <laijs@linux.alibaba.com>
In-Reply-To: <YYD9ohN2Zcy4EdMb@zn.tnic>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2021/11/2 16:58, Borislav Petkov wrote:

>>   	 */
>>   
>> -	ALTERNATIVE "", "jmp	swapgs_restore_regs_and_return_to_usermode", \
>> +	ALTERNATIVE "", "jmp xenpv_restore_regs_and_return_to_usermode", \
> 
> Instead of sprinkling all those ALTERNATIVE calls everywhere,
> why don't you simply jump to the xenpv-one at the
> swapgs_restore_regs_and_return_to_usermode label itself and have a
> single ALTERNATIVE there?
> 

It will add a 5-byte NOP at the beginning of the native
swapgs_restore_regs_and_return_to_usermode.  I avoided adding unneeded
code in the native code even if it is NOPs and avoided melting xenpv-one into
the native one which will reduce the code readability.

I will follow your preference since a 5-byte NOP is so negligible in the slow
path with an iret instruction.

Or other option that adds macros to wrap the ALTERNATIVE.
RESTORE_REGS_AND_RETURN_TO_USERMODE and
COND_RESTORE_REGS_AND_RETURN_TO_USERMODE (test %eax before jmp in native case)



