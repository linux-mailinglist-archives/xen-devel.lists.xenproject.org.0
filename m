Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A986A722ED0
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 20:36:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543847.849165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6F2Y-0005ov-Al; Mon, 05 Jun 2023 18:34:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543847.849165; Mon, 05 Jun 2023 18:34:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6F2Y-0005lt-7B; Mon, 05 Jun 2023 18:34:50 +0000
Received: by outflank-mailman (input) for mailman id 543847;
 Mon, 05 Jun 2023 18:34:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q6F2W-0005ll-90
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 18:34:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q6F2S-0002mt-92; Mon, 05 Jun 2023 18:34:44 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q6F2S-00070P-38; Mon, 05 Jun 2023 18:34:44 +0000
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
	bh=TSMsm/uDwx1pfiaYA1ufCuiyfF+RfzVysWX23j2GE84=; b=EqIJ6WNJR2EGWBH27DXLoOflyB
	lbpDGmx7M8eq6y5qOXGfnK3Xv/AmursaoGe/uEVpjrWYPHprm9M0ijL+SJSzhiDUbX6XLgSPrmVzt
	cvvMN1mKwa7XAd5P/VMSL+h/9iQssfCxrIBqpBZCaoP96G4J/hIVBsnV53rv34ZgsQfA=;
Message-ID: <bec29c53-cade-9686-6ade-0f61f4bde27d@xen.org>
Date: Mon, 5 Jun 2023 19:34:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
To: Michal Orzel <michal.orzel@amd.com>,
 Julien Grall <julien.grall.oss@gmail.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230601085001.1782-1-michal.orzel@amd.com>
 <7C760D1D-DAAE-48AC-8B2B-E6140452BE4A@arm.com>
 <73a143ee-8301-e0c0-a3fc-83ec10441c4c@amd.com>
 <CAJ=z9a3iZHwXPwWiJykeSJbi0YvfD-L6SO3LxxRom=DPAqPuVg@mail.gmail.com>
 <703ccd1b-1908-4f5b-3b48-e02d317a2090@amd.com>
 <CAJ=z9a1V2XNKyc9gQjxhqRmTjpfamQfC5DfZfXZ15VoNqp2wNQ@mail.gmail.com>
 <bf9e8ba1-5ca9-d958-8e09-3f74710fd830@amd.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH] xen/arm: debug-pl011: Use 32-bit accessors for broader
 compatibility
In-Reply-To: <bf9e8ba1-5ca9-d958-8e09-3f74710fd830@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 01/06/2023 13:38, Michal Orzel wrote:
> 
> On 01/06/2023 14:17, Julien Grall wrote:
>> 	
>>
>>
>>
>>
>> On Thu, 1 Jun 2023 at 13:48, Michal Orzel <michal.orzel@amd.com <mailto:michal.orzel@amd.com>> wrote:
>>
>>      Hi Julien,
>>
>>      On 01/06/2023 13:12, Julien Grall wrote:
>>      >
>>      >
>>      >
>>      > Hi,
>>      >
>>      > Sorry for the formatting.
>>      >
>>      > On Thu, 1 Jun 2023 at 12:31, Michal Orzel <michal.orzel@amd.com <mailto:michal.orzel@amd.com> <mailto:michal.orzel@amd.com <mailto:michal.orzel@amd.com>>> wrote:
>>      >
>>      >     Hi Bertrand,
>>      >
>>      >     On 01/06/2023 12:19, Bertrand Marquis wrote:
>>      >     >
>>      >     >
>>      >     > Hi Michal,
>>      >     >
>>      >     >> On 1 Jun 2023, at 10:50, Michal Orzel <michal.orzel@amd.com <mailto:michal.orzel@amd.com> <mailto:michal.orzel@amd.com <mailto:michal.orzel@amd.com>>> wrote:
>>      >     >>
>>      >     >> There are implementations of the PL011 that can only handle 32-bit
>>      >     >> accesses (i.e. no 16-bit or 8-bit), usually advertised by 'reg-io-width'
>>      >     >> dt property set to 4. On such UARTs, the current early printk code for
>>      >     >> arm64 does not work. To fix this issue, make all the accesses to be 32-bit
>>      >     >> by using ldr, str without a size field. This makes it possible to use
>>      >     >> early printk on such platforms, while all the other implementations should
>>      >     >> generally cope with 32-bit accesses. In case they do not, they would
>>      >     >> already fail as we explicitly use writel/readl in the runtime driver to
>>      >     >> maintain broader compatibility and to be SBSAv2 compliant. Therefore, this
>>      >     >> change makes the runtime/early handling consistent (also it matches the
>>      >     >> arm32 debug-pl011 code).
>>      >     >>
>>      >     >> Signed-off-by: Michal Orzel <michal.orzel@amd.com <mailto:michal.orzel@amd.com> <mailto:michal.orzel@amd.com <mailto:michal.orzel@amd.com>>>
>>      >     >> ---
>>      >     >> xen/arch/arm/arm64/debug-pl011.inc | 8 ++++----
>>      >     >> 1 file changed, 4 insertions(+), 4 deletions(-)
>>      >     >>
>>      >     >> diff --git a/xen/arch/arm/arm64/debug-pl011.inc b/xen/arch/arm/arm64/debug-pl011.inc
>>      >     >> index 6d60e78c8ba3..80eb8fdc1ec7 100644
>>      >     >> --- a/xen/arch/arm/arm64/debug-pl011.inc
>>      >     >> +++ b/xen/arch/arm/arm64/debug-pl011.inc
>>      >     >> @@ -25,9 +25,9 @@
>>      >     >>  */
>>      >     >> .macro early_uart_init xb, c
>>      >     >>         mov   x\c, #(7372800 / CONFIG_EARLY_UART_PL011_BAUD_RATE % 16)
>>      >     >> -        strh  w\c, [\xb, #FBRD]      /* -> UARTFBRD (Baud divisor fraction) */
>>      >     >> +        str   w\c, [\xb, #FBRD]      /* -> UARTFBRD (Baud divisor fraction) */
>>      >     >>         mov   x\c, #(7372800 / CONFIG_EARLY_UART_PL011_BAUD_RATE / 16)
>>      >     >> -        strh  w\c, [\xb, #IBRD]      /* -> UARTIBRD (Baud divisor integer) */
>>      >     >> +        str   w\c, [\xb, #IBRD]      /* -> UARTIBRD (Baud divisor integer) */
>>      >     >>         mov   x\c, #WLEN_8           /* 8n1 */
>>      >     >>         str   w\c, [\xb, #LCR_H]     /* -> UARTLCR_H (Line control) */
>>      >     >>         ldr   x\c, =(RXE | TXE | UARTEN)
>>      >     >> @@ -41,7 +41,7 @@
>>      >     >>  */
>>      >     >> .macro early_uart_ready xb, c
>>      >     >> 1:
>>      >     >> -        ldrh  w\c, [\xb, #FR]        /* <- UARTFR (Flag register) */
>>      >     >> +        ldr   w\c, [\xb, #FR]        /* <- UARTFR (Flag register) */
>>      >     >>         tst   w\c, #BUSY             /* Check BUSY bit */
>>      >     >>         b.ne <http://b.ne> <http://b.ne <http://b.ne>>  1b                     /* Wait for the UART to be ready */
>>      >     >> .endm
>>      >     >> @@ -52,7 +52,7 @@
>>      >     >>  * wt: register which contains the character to transmit
>>      >     >>  */
>>      >     >> .macro early_uart_transmit xb, wt
>>      >     >> -        strb  \wt, [\xb, #DR]        /* -> UARTDR (Data Register) */
>>      >     >> +        str   \wt, [\xb, #DR]        /* -> UARTDR (Data Register) */
>>      >     >
>>      >     > Is it really ok to drop the 8bit access here ?
>>      >     It is not only ok, it is necessary. Otherwise it won't work on the above mentioned UARTs (they can only perform 32-bit access).
>>      >
>>      >
>>      > IIRC some compilers will complain because you use wN with “str”.
>>      Hmm, I would expect it to be totally ok as the size is determined by the reg name. Any reference?
>>
>>
>> I don’t have the spec with me. I will have a look on Monday and reply back here.

I had another look at this. You are right, "str" can work with wN or xN. 
I got confused because in the past the issue we had was with the asm 
volatile with 'msr' (see 57e761b60dc9 "xen/arm64: Remove 
READ/WRITE_SYSREG32 helper macros").

[...]

>> I am aware of this issue but I don’t understand how this is related to this discussion.
>>
>> My only request is you don’t break the existing behavior of the early PL011 driver on arm64.
> I understand your concern about legacy devices and that you do not want to break the existing code on arm64.
> But please correct me if I'm wrong. These two lines:
> str   w\c, [\xb, #LCR_H]
> str   w\c, [\xb, #CR]

Hmmm... Looking at the spec, LCR_H is meant to be 8-bit and CR 16-bit. 
So I think we need to modify both of them. I am happy to send a patch 
separately for that either before or after your patch.

Cheers,

-- 
Julien Grall

