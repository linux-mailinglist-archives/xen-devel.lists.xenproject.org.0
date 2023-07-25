Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D121762255
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 21:35:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569900.891066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qONoe-0003A8-Ih; Tue, 25 Jul 2023 19:35:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569900.891066; Tue, 25 Jul 2023 19:35:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qONoe-00036o-Fu; Tue, 25 Jul 2023 19:35:28 +0000
Received: by outflank-mailman (input) for mailman id 569900;
 Tue, 25 Jul 2023 19:35:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n1im=DL=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qONoc-00036h-MH
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 19:35:26 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 66d4befe-2b22-11ee-b240-6b7b168915f2;
 Tue, 25 Jul 2023 21:35:25 +0200 (CEST)
Received: from [192.168.1.101] (unknown [37.163.26.148])
 by support.bugseng.com (Postfix) with ESMTPSA id CEC8B4EE0738;
 Tue, 25 Jul 2023 21:35:23 +0200 (CEST)
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
X-Inumbo-ID: 66d4befe-2b22-11ee-b240-6b7b168915f2
Message-ID: <553dc3d0-a518-c8ba-f90b-76e45a47ff87@bugseng.com>
Date: Tue, 25 Jul 2023 21:35:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH 2/3] xen/arm: irq: address violations of MISRA C: 2012
 Rules 8.2 and 8.3
Content-Language: en-US, it
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1690217195.git.federico.serafini@bugseng.com>
 <a62e88a9c29cf7866c251968b5a5b6865aff4a2a.1690217195.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2307241551380.3118466@ubuntu-linux-20-04-desktop>
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <alpine.DEB.2.22.394.2307241551380.3118466@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Stefano,

On 25/07/23 00:55, Stefano Stabellini wrote:
>>   int request_irq(unsigned int irq, unsigned int irqflags,
>> -                void (*handler)(int, void *, struct cpu_user_regs *),
>> +                void (*handler)(int irq, void *dev_id,
>> +                                struct cpu_user_regs *regs),
> 
> We have an inconsistency where the handler functions on x86 typically
> call it void *data, while on arm they typically use void *dev_id
> (see xen/arch/x86/irq.c:request_irq and
> xen/arch/x86/hpet.c:hpet_interrupt_handler). I think we should be
> consistent. Or, if this is not a MISRA requirement because this is just
> a function pointer rather than a proper function, then I would leave it
> alone.

This is an inconsistency but it is not a violation of the rule 8.3.

Regards
-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

