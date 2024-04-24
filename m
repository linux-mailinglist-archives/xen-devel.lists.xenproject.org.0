Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 265918B06EE
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 12:07:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711307.1111184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzZWp-00019l-2w; Wed, 24 Apr 2024 10:07:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711307.1111184; Wed, 24 Apr 2024 10:07:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzZWo-00017S-VF; Wed, 24 Apr 2024 10:07:02 +0000
Received: by outflank-mailman (input) for mailman id 711307;
 Wed, 24 Apr 2024 10:07:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qV27=L5=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rzZWn-00086f-Pj
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 10:07:01 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64657aec-0222-11ef-909a-e314d9c70b13;
 Wed, 24 Apr 2024 12:07:01 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 6A5114EE0739;
 Wed, 24 Apr 2024 12:07:00 +0200 (CEST)
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
X-Inumbo-ID: 64657aec-0222-11ef-909a-e314d9c70b13
MIME-Version: 1.0
Date: Wed, 24 Apr 2024 12:07:00 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, bertrand.marquis@arm.com,
 julien@xen.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 04/10] drivers: char: address violation of MISRA C
 Rule 20.7
In-Reply-To: <509a6c09-85e7-4854-b7dc-116cde022b26@suse.com>
References: <cover.1713885065.git.nicola.vetrini@bugseng.com>
 <a5e4472b91398b7f9e802ea82c8435fa8ad27066.1713885065.git.nicola.vetrini@bugseng.com>
 <509a6c09-85e7-4854-b7dc-116cde022b26@suse.com>
Message-ID: <83c180d692149d5cf0f56fecdc3af4b3@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-04-24 09:23, Jan Beulich wrote:
> On 23.04.2024 17:12, Nicola Vetrini wrote:
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
>> +#define omap_write(uart, off, val) writel((val), (uart)->regs + \
> 
> Would have been nice to drop the excess parentheses at the same time.
> 
> Jan

Right. I think I'll have a few more patches on this rule, so maybe I can 
adjust it.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

