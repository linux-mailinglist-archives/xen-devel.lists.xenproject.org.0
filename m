Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 366E3554ACE
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 15:20:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353871.580869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o40H9-000871-7x; Wed, 22 Jun 2022 13:20:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353871.580869; Wed, 22 Jun 2022 13:20:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o40H9-00082j-45; Wed, 22 Jun 2022 13:20:07 +0000
Received: by outflank-mailman (input) for mailman id 353871;
 Wed, 22 Jun 2022 13:20:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o40H7-0007uz-E0
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 13:20:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o40H7-0004vT-4G; Wed, 22 Jun 2022 13:20:05 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.1.223]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o40H6-0005ms-UO; Wed, 22 Jun 2022 13:20:05 +0000
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
	bh=re9m33pb8PdlVNWNCIbk86qkedpewIxKyzmz4q5PK3Y=; b=nsVG5gGoF8vOj2y2m7CZkdwLZy
	kjBKRoqwO3NgxD06ESf82Ebk2P923LYGRVhacxguYE3UVom8sakPxvFP9C0njjUVlJWQuFM8WH66/
	cHJCv4IsDCAm9OXVm0Dx7I7H3tusR+ACTVqFb4cvlf/Za6N5YCC/tVWbiDJmTgByV89g=;
Message-ID: <a9566b42-2360-4d3f-5272-8f69368d50f2@xen.org>
Date: Wed, 22 Jun 2022 14:20:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: Tentative fix for dom0 boot problem
To: Juergen Gross <jgross@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <d465abfb-6d44-0739-9959-3e3311dd671c@suse.com>
 <e32a84bf-ad49-da95-4a19-61872c2ff7e0@xen.org>
 <bc8899d7-0300-8640-57d9-52c2a1bf599c@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <bc8899d7-0300-8640-57d9-52c2a1bf599c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 22/06/2022 13:13, Juergen Gross wrote:
> On 22.06.22 12:50, Julien Grall wrote:
>>
>>
>> On 22/06/2022 11:45, Juergen Gross wrote:
>>> Julien,
>>
>> Hi Juergen,
>>
>>> could you please test the attached patches?
>>
>> I am getting the following error:
>>
>> (XEN) d0v0 Unhandled: vec 14, #PF[0003]
>> (XEN) Pagetable walk from ffffffff84001000:
>> (XEN)  L4[0x1ff] = 000000046c004067 0000000000004004
>> (XEN)  L3[0x1fe] = 000000046c003067 0000000000004003
>> (XEN)  L2[0x020] = 000000046c024067 0000000000004024
>> (XEN)  L1[0x001] = 001000046c001025 0000000000004001
> 
> Hmm, from this data I guess this was a write to a page table.
> 
>> (XEN) domain_crash_sync called from entry.S: fault at ffff82d040325906 
>> x86_64/entry.S#create_bounce_frame+0x15d/0x177
>> (XEN) Domain 0 (vcpu#0) crashed on cpu#1:
>> (XEN) ----[ Xen-4.17-unstable  x86_64  debug=y  Tainted:   C    ]----
>> (XEN) CPU:    1
>> (XEN) RIP:    e033:[<ffffffff832a3481>]
> 
> Can you please find out the associated statement?

arch/x86/kernel/head64.c:433

This is the memset() for __brk_base.

> 
>> (XEN) RFLAGS: 0000000000000206   EM: 1   CONTEXT: pv guest (d0v0)
>> (XEN) rax: 0000000000000000   rbx: ffffffff84000000   rcx: 
>> 000000000002b000
>> (XEN) rdx: ffffffff84000000   rsi: ffffffff84000000   rdi: 
>> ffffffff84001000
>> (XEN) rbp: 0000000000000000   rsp: ffffffff82a03e60   r8:  
>> 0000000000000000
>> (XEN) r9:  0000000000000000   r10: 0000000000000000   r11: 
>> 0000000000000000
>> (XEN) r12: 0000000000000000   r13: 0000000000000000   r14: 
>> 0000000000000000
>> (XEN) r15: 0000000000000000   cr0: 0000000080050033   cr4: 
>> 00000000003426e0
>> (XEN) cr3: 000000046c001000   cr2: ffffffff84001000
>> (XEN) fsb: 0000000000000000   gsb: ffffffff83271000   gss: 
>> 0000000000000000
>> (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e02b   cs: e033
>> (XEN) Guest stack trace from rsp=ffffffff82a03e60:
>> (XEN)    000000000002b000 0000000000000000 0000000000000003 
>> ffffffff832a3481
>> (XEN)    000000010000e030 0000000000010006 ffffffff82a03ea8 
>> 000000000000e02b
>> (XEN)    0000000000000000 ffffffff832ae884 0000000000000000 
>> 0000000000000000
>> (XEN)    0000000000000000 0000000000000000 0000000000000000 
>> 0000000000000000
>> (XEN)    0000000000000000 0000000000000000 0000000000000000 
>> 0000000000000000
>> (XEN)    0000000000000000 0000000000000000 0000000000000000 
>> 0000000000000000
>> (XEN)    0000000000000000 0000000000000000 0000000000000000 
>> 0000000000000000
>> (XEN)    0000000000000000 0000000000000000 ffffffff832a317f 
>> 0000000000000000
> 
> Further analysis might be easier if you can supply function + 
> displacement for
> any text segment addresses on the stack.

ffffffff832ae884: arch/x86/include/asm/text-patching.h:112
ffffffff832a317f: arch/x86/kernel/head64.c:325

> 
> BTW, I could boot the kernel with my patches as Dom0 without any 
> problem. OTOH
> it booted even without the patches. :-)

So I have tried with two different compilers (GCC 7.3.1 and GCC 10.2.1) 
and hit the same error. This would suggest this is related to my 
.config. You can find it in [1] if you want to reproduce it yourself.

Cheers,

[1] https://pastebin.com/xityGDN9

-- 
Julien Grall

