Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 652D4757549
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 09:27:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564963.882771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLf6U-0008Qj-3d; Tue, 18 Jul 2023 07:26:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564963.882771; Tue, 18 Jul 2023 07:26:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLf6U-0008OY-0g; Tue, 18 Jul 2023 07:26:38 +0000
Received: by outflank-mailman (input) for mailman id 564963;
 Tue, 18 Jul 2023 07:26:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4bXZ=DE=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qLf6S-0008OS-JG
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 07:26:36 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c81c1a2-253c-11ee-b23a-6b7b168915f2;
 Tue, 18 Jul 2023 09:26:34 +0200 (CEST)
Received: from [192.168.1.100] (unknown [37.161.123.45])
 by support.bugseng.com (Postfix) with ESMTPSA id A59734EE0C88;
 Tue, 18 Jul 2023 09:26:32 +0200 (CEST)
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
X-Inumbo-ID: 6c81c1a2-253c-11ee-b23a-6b7b168915f2
Message-ID: <283befdf-d338-5637-78e7-94b018d53a5e@bugseng.com>
Date: Tue, 18 Jul 2023 09:26:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH 1/4] xen/arm: justify or initialize conditionally
 uninitialized variables
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1689329728.git.nicola.vetrini@bugseng.com>
 <1ad20473a031eca75db4007bdc169616b512ef44.1689329728.git.nicola.vetrini@bugseng.com>
 <f38ecc34-4e4d-8142-50a1-a54097a909a0@xen.org>
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
In-Reply-To: <f38ecc34-4e4d-8142-50a1-a54097a909a0@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 17/07/23 23:15, Julien Grall wrote:
> Hi Nicola,
> 
> I am currently looking at the code to check if we can avoid some SAF-*. 
> But I need some clarification on the usage.
> 
> On 14/07/2023 12:49, Nicola Vetrini wrote:
>> @@ -2914,6 +2924,7 @@ static int __init make_vpl011_uart_node(struct 
>> kernel_info *kinfo)
>>       void *fdt = kinfo->fdt;
>>       int res;
>>       gic_interrupt_t intr;
> 
> This value will be passed to set_interrupt() which contains the 
> following code:
> 
> __be32 *cells = interrupt;
> [...]
> dt_set_cells(&cells, ....);
> 
> Where  gic_interrupt_t is:
> 
> typedef __be32 gic_interrupt[3];
> 
> This is very similar to the pattern in ...
> 
>> +    /* SAF-1-safe MC3R1.R9.1*/
>>       __be32 reg[GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS];
>>       __be32 *cells;
>>       struct domain *d = kinfo->d;
>> @@ -3435,6 +3446,7 @@ static void __init initrd_load(struct 
>> kernel_info *kinfo)
>>       paddr_t paddr, len;
>>       int node;
>>       int res;
>> +    /* SAF-1-safe MC3R1.R9.1 */
>>       __be32 val[2];
> 
> ... here.
> 
> cellp = (__be32 *)val;
> dt_set_cell(&cellp, ..., load_addr);
> 
> Would you be able to explain why Eclair is complaining for this one but 
> not the previous one?
> 
> Cheers,
> 

It did complain, but I specified an always_write property on the first 
parameter of set_interrupt, because dt_set_cell does always write it 
trough the argument cells. (there are three calls to dt_set_cell, which 
means that the array is fully initialized).
The difference is that initrd_load calls dt_set_cell directly. 
dt_set_cell does indeed initialize val[2], but only because it's called 
with the appropriate size. If the latter is wrapped in a function or 
macro, then I can add the same property as above and avoid the deviation.

Regards,

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

