Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7188A8EDF
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 00:32:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707790.1106056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxDou-0007EE-C2; Wed, 17 Apr 2024 22:32:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707790.1106056; Wed, 17 Apr 2024 22:32:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxDou-0007CK-9T; Wed, 17 Apr 2024 22:32:00 +0000
Received: by outflank-mailman (input) for mailman id 707790;
 Wed, 17 Apr 2024 22:31:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rxDos-0006xq-J4
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 22:31:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rxDoq-0007sZ-J8; Wed, 17 Apr 2024 22:31:56 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rxDoq-0001i0-9j; Wed, 17 Apr 2024 22:31:56 +0000
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
	bh=b36aNP/YuolflNKV45a8qpnLXiGR1ZvC4bh8IyUx6eY=; b=yDJDp2Vg4JqfIHA+G8CWqJaJig
	wTpY44XvmQvdeW3QmvrvYikFGNGcXPdZUxtoCxJjprD1Q+mFIMtPCwJTTk+ZsvkGLcznkD1iDiMTv
	v4afyPv1sdB5m9tbqV8ZEkGxQc6hUKRZn3xIJ2W4u9JblhZ3GxlB3EF2Epyq2vrhiLzs=;
Message-ID: <d6f385f2-c7c5-4d46-b199-d325b9ded703@xen.org>
Date: Wed, 17 Apr 2024 23:31:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drivers: serial: add Qualcomm GENI-based serial
 driver
Content-Language: en-GB
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Michal Orzel <michal.orzel@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <20240329000822.3363568-1-volodymyr_babchuk@epam.com>
 <20240329000822.3363568-3-volodymyr_babchuk@epam.com>
 <91ceb418-f055-45ba-82c4-f37e812d5242@amd.com> <87le5vxy26.fsf@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <87le5vxy26.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 02/04/2024 22:19, Volodymyr Babchuk wrote:
> 
> Hi Michal,
> 
> Michal Orzel <michal.orzel@amd.com> writes:
> 
>> Hello,
>>
>> On 29/03/2024 01:08, Volodymyr Babchuk wrote:
>>>
>>>
>>> Generic Interface (GENI) is a newer interface for low speed interfaces
>>> like UART, I2C or SPI. This patch adds the simple driver for the UART
>>> instance of GENI. Code is based on similar drivers in U-Boot and Linux
>>> kernel.
>> Do you have a link to a manual?
> 
> I wish I had. Qualcomm provides HW manuals only under very strict
> NDAs. At the time of writing I don't have access to the manual at
> all. Those patches are based solely on similar drivers in U-Boot and
> Linux kernel.
> 
>>>
>>> This driver implements only simple synchronous mode, because although
>>> GENI supports FIFO mode, it needs to know number of
>>> characters **before** starting TX transaction. This is a stark
>>> contrast when compared to other UART peripherals, which allow adding
>>> characters to a FIFO while TX operation is running.
>>>
>>> The patch adds both normal UART driver and earlyprintk version.
>>>
>>> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>>> ---
>>>   xen/arch/arm/Kconfig.debug           |  19 +-
>>>   xen/arch/arm/arm64/debug-qcom.inc    |  76 +++++++
>> Shouldn't all the files (+ other places) have geni in their names? Could qcom refer to other type of serial device?
> 
> AFAIK, there is an older type of serial device. Both Linux and U-Boot
> use "msm" instead of "qcom" in drivers names for those devices.
> 
> But I can add "geni" to the names, no big deal.
> 
>>
>>>   xen/arch/arm/include/asm/qcom-uart.h |  48 +++++
>>>   xen/drivers/char/Kconfig             |   8 +
>>>   xen/drivers/char/Makefile            |   1 +
>>>   xen/drivers/char/qcom-uart.c         | 288 +++++++++++++++++++++++++++
>>>   6 files changed, 439 insertions(+), 1 deletion(-)
>>>   create mode 100644 xen/arch/arm/arm64/debug-qcom.inc
>>>   create mode 100644 xen/arch/arm/include/asm/qcom-uart.h
>>>   create mode 100644 xen/drivers/char/qcom-uart.c
>>>
>>> diff --git a/xen/arch/arm/Kconfig.debug b/xen/arch/arm/Kconfig.debug
>>> index eec860e88e..f6ab0bb30e 100644
>>> --- a/xen/arch/arm/Kconfig.debug
>>> +++ b/xen/arch/arm/Kconfig.debug
>>> @@ -119,6 +119,19 @@ choice
>>>                          selecting one of the platform specific options below if
>>>                          you know the parameters for the port.
>>>
>>> +                       This option is preferred over the platform specific
>>> +                       options; the platform specific options are deprecated
>>> +                       and will soon be removed.
>>> +       config EARLY_UART_CHOICE_QCOM
>> The list is sorted alphabetically. Please adhere to that.
>>
> 
> Sure
> 
>>> +               select EARLY_UART_QCOM
>>> +               bool "Early printk via Qualcomm debug UART"
>> Shouldn't you add depends on ARM_64? Isn't this device Arm64 specific like in Linux?
>>
> 
> In linux it depends on ARCH_QCOM which can be enabled both for arm and
> arm64. But for Xen case... I believe it is better to make ARM_64
> dependency.
If you don't provide the early printk for arm32, then you need to add 
DEPENDS ON otherwise randconfig will fail on arm32.

[...]

> You see, this code is working inside-out. early printk code in Xen is
> written with assumption that early_uart_transmit don't need a scratch
> register. But this is not true for GENI... To send one character we
> must write two registers beforehand: TX_TRANS_LEN and CMD0. Only after
> that we can write something to FIFO. But early_uart_transmit has no
> scratch register to prepare values for TX_TRANS_LEN and CMD0. So we
> write what we do here
> 
> 1. Reset the state machine with ABORT command
> 2. Write 1 to TX_TRANS_LEN
> 3. Write START_TX to CMD0
> 
> Now early_uart_transmit can write "wt" to the FIFO and after that it can
> use "wt" as a scratch register to repeat steps 2 and 3.

AFAIU, this means we would potentially do one too many iteration. Does 
this have any implication to the runtime UART driver?

But why do we need to repeat step 2/3? Is this because both registers 
will be reset after the character is written?

> 
> Probably I need this as a comment to into the .inc file...
> 
>>> +        mov   w\c, #M_GENI_CMD_ABORT
>>> +        str   w\c, [\xb, #SE_GENI_M_CMD_CTRL_REG]
>>> +1:
>>> +        ldr   w\c, [\xb, #SE_GENI_M_IRQ_STATUS]   /* Load IRQ status */
>>> +        tst   w\c, #M_CMD_ABORT_EN         /* Check TX_FIFI_WATERMARK_EN bit */
>> The comment does not correspond to the code. Shouldn't this be the same as in early_uart_ready?
>>
> 
> We need to reset the state machine with ABORT command just in case.

Would you mind to explain what you mean with "just in case"? A pointer
to the corresponding Linux/U-boot code would be helpful.

[...]

>>> +
>>> +#endif /* __ASM_ARM_QCOM_UART_H */
>>> +
>>> +/*
>>> + * Local variables:
>>> + * mode: C
>>> + * c-file-style: "BSD"
>>> + * c-basic-offset: 4
>>> + * indent-tabs-mode: nil
>>> + * End:
>>> + */
>>> diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
>>> index e18ec3788c..52c3934d06 100644
>>> --- a/xen/drivers/char/Kconfig
>>> +++ b/xen/drivers/char/Kconfig
>>> @@ -68,6 +68,14 @@ config HAS_SCIF
>>>            This selects the SuperH SCI(F) UART. If you have a SuperH based board,
>>>            or Renesas R-Car Gen 2/3 based board say Y.
>>>
>>> +config HAS_QCOM_UART
>>> +       bool "Qualcomm GENI UART driver"
>>> +       default y
>>> +       depends on ARM
>> Isn't is Arm64 specific device?
>>
> 
> Probably yes. I believe it is safe to assume that it is Arm64-specific
> in Xen case.

Is it because there is no 32-bit HW from qualcomm that supports 
virtualization?

[...]

>>> +DT_DEVICE_START(qcom_uart, "QCOM UART", DEVICE_SERIAL)
>>> +    .dt_match = qcom_uart_dt_match,
>>> +    .init = qcom_uart_init,
>>> +DT_DEVICE_END
>>> +
>>> +/*
>>> + * Local variables:
>>> + * mode: C
>>> + * c-file-style: "BSD"
>>> + * c-basic-offset: 4
>>> + * indent-tabs-mode: nil
>>> + * End:
>>> + */
>>> --
>>> 2.43.0
>>
>> What about vUART? You don't seem to set vuart information that is used by vuart.c and vpl011.c
>>
> 
> I am not sure that it is possible to emulate GENI UART with simple vuart
> API. vuart makes assumption that there is one simple status register and
> FIFO register operates on per-character basis, while even earlycon part
> of the driver in Linux tries to pack 4 characters to one FIFO write.

So I agree that enabling vUART is probably going to be difficult. But 
you should be able to implement the vpl011 as it only require a base and 
an IRQ.

That said, from the driver PoV, there is no differentiation today. We 
could add a extra parameter, but I don't think this needs to be handled 
in this series.

Cheers,

-- 
Julien Grall

