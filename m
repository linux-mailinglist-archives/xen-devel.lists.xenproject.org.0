Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5631CA4ED
	for <lists+xen-devel@lfdr.de>; Fri,  8 May 2020 09:14:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWxCk-0007Y9-ET; Fri, 08 May 2020 07:13:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=t3Kb=6W=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jWxCi-0007Xz-VX
 for xen-devel@lists.xenproject.org; Fri, 08 May 2020 07:13:52 +0000
X-Inumbo-ID: 77e9aa6c-90fb-11ea-9887-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 77e9aa6c-90fb-11ea-9887-bc764e2007e4;
 Fri, 08 May 2020 07:13:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3E717AA4F;
 Fri,  8 May 2020 07:13:53 +0000 (UTC)
Subject: Re: [PATCH v8 06/12] x86/HVM: make hvmemul_blk() capable of handling
 r/o operations
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <60cc730f-2a1c-d7a6-74fe-64f3c9308831@suse.com>
 <1587789a-b0d6-6d18-99fc-a94bbea52d7b@suse.com>
 <507d4ced-d6ff-dfd9-d6e5-0a732c334de1@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <27a0e367-6b63-716c-185e-7d4325db1acb@suse.com>
Date: Fri, 8 May 2020 09:13:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <507d4ced-d6ff-dfd9-d6e5-0a732c334de1@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 07.05.2020 22:34, Andrew Cooper wrote:
> On 05/05/2020 09:15, Jan Beulich wrote:
>> In preparation for handling e.g. FLDENV or {F,FX,X}RSTOR here as well.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> v8: New (could be folded into "x86emul: support MOVDIR{I,64B} insns",
>>     but would invalidate Paul's R-b there).
>>
>> --- a/xen/arch/x86/hvm/emulate.c
>> +++ b/xen/arch/x86/hvm/emulate.c
>> @@ -1453,7 +1453,7 @@ static int hvmemul_blk(
>>      struct hvm_emulate_ctxt *hvmemul_ctxt =
>>          container_of(ctxt, struct hvm_emulate_ctxt, ctxt);
>>      unsigned long addr;
>> -    uint32_t pfec = PFEC_page_present | PFEC_write_access;
>> +    uint32_t pfec = PFEC_page_present;
>>      int rc;
>>      void *mapping = NULL;
>>  
>> @@ -1462,6 +1462,9 @@ static int hvmemul_blk(
>>      if ( rc != X86EMUL_OKAY || !bytes )
>>          return rc;
>>  
>> +    if ( x86_insn_is_mem_write(state, ctxt) )
>> +        pfec |= PFEC_write_access;
>> +
> 
> For the instructions with two memory operands, it conflates the
> read-only side with the read-write side.

"Conflates" is probably the wrong word? The bug you point out is
really in x86_insn_is_mem_write(), in that so far it would return
false for MOVDIR64B and ENQCMD{,S}. As a result I'll fix the
issue there while, at the same time, folding this patch into
"x86emul: support MOVDIR{I,64B} insns".

Jan

