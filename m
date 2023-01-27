Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA2467E508
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 13:23:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485563.752877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLNkd-0005Sq-QB; Fri, 27 Jan 2023 12:22:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485563.752877; Fri, 27 Jan 2023 12:22:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLNkd-0005Qa-NK; Fri, 27 Jan 2023 12:22:39 +0000
Received: by outflank-mailman (input) for mailman id 485563;
 Fri, 27 Jan 2023 12:22:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pLNkc-0005QU-Be
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 12:22:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pLNkb-0003Zl-D5; Fri, 27 Jan 2023 12:22:37 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pLNkb-0003Cg-5e; Fri, 27 Jan 2023 12:22:37 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=NNYmZxh3/3DjcWnwmpnH91d0aTGSNw/T0EVG0RJbciI=; b=SwwX/r4/Hj6eOUsLuOCkcyABLf
	bdKD53k3RfDPjyJto7p4O/rNVMANDp81HK0ACAJqFdRIKK8R4GIir3sA/ZJ2L6I+wRP6W9T2ihZrO
	yT2WXh79lEUqPnxyJFfvWMjHSEpvKMBgOwvm/ZaP/3AR0xUXPvdcd/d0Ud7ef8x6OiMU=;
Message-ID: <599792fa-b08c-0b1e-10c1-0451519d9e4a@xen.org>
Date: Fri, 27 Jan 2023 12:22:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
To: Oleksii <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Bobby Eshleman <bobby.eshleman@gmail.com>
References: <cover.1674816429.git.oleksii.kurochko@gmail.com>
 <06c2c36bd68b2534c757dc4087476e855253680a.1674816429.git.oleksii.kurochko@gmail.com>
 <fbab23b9-663e-9516-5721-a92486686f84@xen.org>
 <b7070c68ce88fdd3a1a7b04400ca8c3366ddf416.camel@gmail.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v6 1/2] xen/riscv: introduce early_printk basic stuff
In-Reply-To: <b7070c68ce88fdd3a1a7b04400ca8c3366ddf416.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Oleksii,

On 27/01/2023 11:49, Oleksii wrote:
> On Fri, 2023-01-27 at 11:26 +0000, Julien Grall wrote:
>> Hi,
>>
>> On 27/01/2023 11:15, Oleksii Kurochko wrote:
>>> Because printk() relies on a serial driver (like the ns16550
>>> driver)
>>> and drivers require working virtual memory (ioremap()) there is not
>>> print functionality early in Xen boot.
>>>
>>> The patch introduces the basic stuff of early_printk functionality
>>> which will be enough to print 'hello from C environment".
>>>
>>> Originally early_printk.{c,h} was introduced by Bobby Eshleman
>>> (
>>> https://github.com/glg-rv/xen/commit/a3c9916bbdff7ad6030055bbee7e53d
>>> 1aab71384)
>>> but some functionality was changed:
>>> early_printk() function was changed in comparison with the original
>>> as
>>> common isn't being built now so there is no vscnprintf.
>>>
>>> This commit adds early printk implementation built on the putc SBI
>>> call.
>>>
>>> As sbi_console_putchar() is already being planned for deprecation
>>> it is used temporarily now and will be removed or reworked after
>>> real uart will be ready.
>>>
>>> Signed-off-by: Bobby Eshleman <bobby.eshleman@gmail.com>
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>> Reviewed-by: Bobby Eshleman <bobby.eshleman@gmail.com>
>>> ---
>>> Changes in V6:
>>>       - Remove __riscv_cmodel_medany check from early_printk.c
>>
>> Why? I know Andrew believed this is wrong, but I replied back with my
>> understanding and saw no discussion afterwards explaining why I am
>> incorrect.
>>
>> I am not a maintainer of the code here, but I don't particularly
>> appreciate comments to be ignored. If there was any discussion on
>> IRC,
>> then please summarize them here.
> Sorry, I have to mentioned that in the description of patch series.

I think this should be part of the section --- in this patch as this 
makes easier to know what changes have been done.

> 
> There is no any specific reason to remove and only one reason I decided
> to remove the check was that the check wasn't present in original
> Alistair/Bobby patches and based on my experiments with that patches
> all worked fine. ( at least with some additional patches from my side I
> was able to run Dom0 with console )

The lines you removed only confirm that the file was built with the 
given model and if it is incorrect then the compilation will fail. There 
are no change in behavior expected past the compilation.

So I am not quite too sure what sort of experiment you did. Did you try 
to change the model used to build Xen?

Now if you (or anyone else) can tell me that there will be no issues if 
the model is changed. Then yes, I will agree that the check is unnecessary.

The alternative is you say that you are happy to accept the risk if the 
model is changed. If I were the maintainer, that would not be something 
I would agree with because "wrong" unwritten assumptions are a pain to 
debug. So I much prefer a "wrong" written assumptions that would tip me 
that the author thought the code would not work otherwise.

This is quite easy to remove the check after the fact if it is not correct.

I am not the maintainer of the code, so if this is what they want then 
so be it. But it needs to be explicitely stated. So far, the reviewed-by 
from Bobby was with the check, so it would imply that he was happy with 
it...

Cheers,

-- 
Julien Grall

