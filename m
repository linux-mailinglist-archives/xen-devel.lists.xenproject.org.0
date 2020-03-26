Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C486193BB8
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 10:22:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHOgs-0006il-QL; Thu, 26 Mar 2020 09:20:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ColY=5L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jHOgr-0006iQ-Mm
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 09:20:41 +0000
X-Inumbo-ID: 0fd97e2c-6f43-11ea-bec1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0fd97e2c-6f43-11ea-bec1-bc764e2007e4;
 Thu, 26 Mar 2020 09:20:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7E845AC0C;
 Thu, 26 Mar 2020 09:20:40 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <6fa81b4d-528d-5c33-50c5-a18396b4383a@suse.com>
 <01414205-1157-9d50-8d45-3e833b430c8e@suse.com>
 <f3ccdba4-736e-4e30-028f-2b571724cdf6@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1bd9dd9e-7603-8332-6ad0-395e48e2cfe2@suse.com>
Date: Thu, 26 Mar 2020 10:20:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <f3ccdba4-736e-4e30-028f-2b571724cdf6@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [Xen-devel] [PATCH v5 02/10] x86emul: support MOVDIRI insn
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <Paul.Durrant@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 25.03.2020 21:58, Andrew Cooper wrote:
> On 24/03/2020 12:29, Jan Beulich wrote:
>> Note that SDM revision 070 doesn't specify exception behavior for
>> ModRM.mod == 0b11; assuming #UD here.
> 
> Didn't I confirm this behaviour for you last time around?

Iirc you did, but the SDM still hasn't changed. Do you have a
suggestion on alternative wording.

>> @@ -10075,6 +10079,14 @@ x86_emulate(
>>                              : "0" ((uint32_t)src.val), "rm" (_regs.edx) );
>>          break;
>>  
>> +    case X86EMUL_OPC(0x0f38, 0xf9): /* movdiri mem,r */
>> +        vcpu_must_have(movdiri);
>> +        generate_exception_if(dst.type != OP_MEM, EXC_UD);
>> +        /* Ignore the non-temporal behavior for now. */
>> +        dst.val = src.val;
>> +        sfence = true;
> 
> Looking again at the SDM, I'm not entirely sure this is good enough.
> 
> Even on top of WB/WP mappings, it needs to have WC properties, knock
> aliasing lines out of the cache, and ending up as a bus transaction.
> 
> Also, I'm not convinced the current chunking algorithm for qemu which
> repeatedly subdivides down to 1, is compatible with the misaligned
> behaviour described, guaranteeing a split of two.

Taking care of these two will be a significant amount of (re-)work of
the HVM emulation layer. I'll see if I can come up with time and ideas
on how to do this.

Jan

