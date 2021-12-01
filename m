Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6D94656EC
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 21:14:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236216.409730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msVyq-0006rN-EB; Wed, 01 Dec 2021 20:13:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236216.409730; Wed, 01 Dec 2021 20:13:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msVyq-0006os-Ac; Wed, 01 Dec 2021 20:13:28 +0000
Received: by outflank-mailman (input) for mailman id 236216;
 Wed, 01 Dec 2021 20:13:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fqf2=QS=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1msVyo-0006om-PF
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 20:13:26 +0000
Received: from ppsw-42.csi.cam.ac.uk (ppsw-42.csi.cam.ac.uk [131.111.8.142])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 21d3f233-52e3-11ec-976b-d102b41d0961;
 Wed, 01 Dec 2021 21:13:24 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:34820)
 by ppsw-42.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1msVyf-000BTf-8m (Exim 4.95) (return-path <amc96@srcf.net>);
 Wed, 01 Dec 2021 20:13:17 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 788291FD7A;
 Wed,  1 Dec 2021 20:13:17 +0000 (GMT)
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
X-Inumbo-ID: 21d3f233-52e3-11ec-976b-d102b41d0961
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <5a1c0ba9-7583-39c0-87ce-dcb62ea4c7b9@srcf.net>
Date: Wed, 1 Dec 2021 20:13:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20211130181139.14398-1-andrew.cooper3@citrix.com>
 <20211130181139.14398-3-andrew.cooper3@citrix.com>
 <037802f4-d28b-62bc-e830-78149f1cc2ff@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH 2/2] x86/hvm: Rework nested hap functions to reduce
 parameters
In-Reply-To: <037802f4-d28b-62bc-e830-78149f1cc2ff@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/12/2021 09:14, Jan Beulich wrote:
> On 30.11.2021 19:11, Andrew Cooper wrote:
>> Most functions in this call chain have 8 parameters, meaning that the final
>> two booleans are spilled to the stack for for calls.
>>
>> First, delete nestedhap_walk_L1_p2m and introduce nhvm_hap_walk_L1_p2m() as a
>> thin wrapper around hvm_funcs just like all the other nhvm_*() hooks.  This
>> involves including xen/mm.h as the forward declaration of struct npfec is no
>> longer enough.
>>
>> Next, replace the triple of booleans with struct npfec, which contains the
>> same information in the bottom 3 bits.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Wei Liu <wl@xen.org>
>> CC: Tamas K Lengyel <tamas@tklengyel.com>
>> CC: Alexandru Isaila <aisaila@bitdefender.com>
>> CC: Petre Pircalabu <ppircalabu@bitdefender.com>
>>
>> I don't much like this, but I think it's the least bad option in the short
>> term.  npfec is horribly mis-named/mis-used (at best, it should be considered
>> npf_info, and probably inherits from the same API/ABI mistakes our regular
>> pagewalk functions have) and is going to have to be untangled to make nested
>> virt a maintainable option.
> So why use struct npfec here then in the first place? It could as well
> be "unsigned int" with constants defined for X, R, and W, couldn't it?

I started prototyping that first, but substantially ups the work
required to support XU/XS down the line, and that's far more likely to
happen before getting around to cleaning up the API/ABI.

>> --- a/xen/include/asm-x86/hvm/hvm.h
>> +++ b/xen/include/asm-x86/hvm/hvm.h
>> @@ -25,6 +25,7 @@
>>  #include <asm/current.h>
>>  #include <asm/x86_emulate.h>
>>  #include <asm/hvm/asid.h>
>> +#include <xen/mm.h>
> Nit: Typically we have xen/ includes ahead of asm/ ones.

Fixed.

>
>> @@ -631,6 +630,14 @@ static inline enum hvm_intblk nhvm_interrupt_blocked(struct vcpu *v)
>>      return hvm_funcs.nhvm_intr_blocked(v);
>>  }
>>  
>> +static inline int nhvm_hap_walk_L1_p2m(
>> +    struct vcpu *v, paddr_t L2_gpa, paddr_t *L1_gpa, unsigned int *page_order,
>> +    uint8_t *p2m_acc, struct npfec npfec)
>> +{
>> +    return hvm_funcs.nhvm_hap_walk_L1_p2m(
>> +        v, L2_gpa, L1_gpa, page_order, p2m_acc, npfec);
>> +}
> Is there a specific reason you don't switch to altcall right in
> this patch, making a follow-on change unnecessary?

I was still hoping to keep the altcall stuff in one patch.  I'm happy to
do the rebase.

~Andrew

