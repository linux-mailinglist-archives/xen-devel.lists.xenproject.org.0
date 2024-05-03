Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E75F8BA7C6
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2024 09:29:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.716258.1118354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2nM9-0004JE-Dj; Fri, 03 May 2024 07:29:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 716258.1118354; Fri, 03 May 2024 07:29:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2nM9-0004Gv-Ap; Fri, 03 May 2024 07:29:21 +0000
Received: by outflank-mailman (input) for mailman id 716258;
 Fri, 03 May 2024 07:29:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GLdc=MG=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1s2nM7-0004Gp-M1
 for xen-devel@lists.xenproject.org; Fri, 03 May 2024 07:29:19 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d98a99f8-091e-11ef-b4bb-af5377834399;
 Fri, 03 May 2024 09:29:17 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 125B44EE0738;
 Fri,  3 May 2024 09:29:17 +0200 (CEST)
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
X-Inumbo-ID: d98a99f8-091e-11ef-b4bb-af5377834399
MIME-Version: 1.0
Date: Fri, 03 May 2024 09:29:17 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 bertrand.marquis@arm.com, julien@xen.org, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH v2 1/3] drivers: char: address violation of MISRA C
 Rule 20.7
In-Reply-To: <alpine.DEB.2.22.394.2405011257290.497719@ubuntu-linux-20-04-desktop>
References: <cover.1714487169.git.nicola.vetrini@bugseng.com>
 <3ae8aa13a5562440cf60e4b30f713e5b2f73c577.1714487169.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2405011257290.497719@ubuntu-linux-20-04-desktop>
Message-ID: <25f8aec2da7e963f80c12e23fc5f725a@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-05-01 21:57, Stefano Stabellini wrote:
> On Tue, 30 Apr 2024, Nicola Vetrini wrote:
>> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
>> of macro parameters shall be enclosed in parentheses". Therefore, some
>> macro definitions should gain additional parentheses to ensure that 
>> all
>> current and future users will be safe with respect to expansions that
>> can possibly alter the semantics of the passed-in macro parameter.
>> 
>> No functional chage.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> 
>> ---
>> Changes in v2:
>> - drop excess parentheses from val parameter.
>> ---
>>  xen/drivers/char/omap-uart.c | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>> 
>> diff --git a/xen/drivers/char/omap-uart.c 
>> b/xen/drivers/char/omap-uart.c
>> index 03b5b66e7acb..e0128225f927 100644
>> --- a/xen/drivers/char/omap-uart.c
>> +++ b/xen/drivers/char/omap-uart.c
>> @@ -48,8 +48,9 @@
>>  /* System configuration register */
>>  #define UART_OMAP_SYSC_DEF_CONF   0x0d   /* autoidle mode, wakeup is 
>> enabled */
>> 
>> -#define omap_read(uart, off)       readl((uart)->regs + 
>> (off<<REG_SHIFT))
>> -#define omap_write(uart, off, val) writel((val), (uart)->regs + 
>> (off<<REG_SHIFT))
>> +#define omap_read(uart, off)       readl((uart)->regs + ((off) << 
>> REG_SHIFT))
>> +#define omap_write(uart, off, val) writel(val, (uart)->regs + \
>> +                                               ((off) << REG_SHIFT))
> 
> the alignment looks off but could be fixed on commit
> 

Can you clarify what you mean here? I aligned readl and writeln and the 
operands in writel to avoid the line being too long.

Thanks,

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

