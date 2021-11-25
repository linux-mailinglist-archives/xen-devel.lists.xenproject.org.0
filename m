Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 338CC45DDC2
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 16:42:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.231599.400851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqGsp-0003AW-Pi; Thu, 25 Nov 2021 15:41:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 231599.400851; Thu, 25 Nov 2021 15:41:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqGsp-00037r-M7; Thu, 25 Nov 2021 15:41:59 +0000
Received: by outflank-mailman (input) for mailman id 231599;
 Thu, 25 Nov 2021 15:41:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CZwX=QM=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mqGsn-00037f-CA
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 15:41:57 +0000
Received: from ppsw-33.csi.cam.ac.uk (ppsw-33.csi.cam.ac.uk [131.111.8.133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3853eaff-4e06-11ec-9787-a32c541c8605;
 Thu, 25 Nov 2021 16:41:56 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:49588)
 by ppsw-33.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.137]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mqGsV-000iZJ-hX (Exim 4.95) (return-path <amc96@srcf.net>);
 Thu, 25 Nov 2021 15:41:39 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 279221FBFC;
 Thu, 25 Nov 2021 15:41:39 +0000 (GMT)
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
X-Inumbo-ID: 3853eaff-4e06-11ec-9787-a32c541c8605
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <0b674f45-d82a-74cb-5853-97cb5e8eead9@srcf.net>
Date: Thu, 25 Nov 2021 15:41:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 1/2] xen: make HYPERVISOR_get_debugreg() always_inline
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 x86@kernel.org, linux-kernel@vger.kernel.org
Cc: peterz@infradead.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, kernel test robot <lkp@intel.com>
References: <20211125092056.24758-1-jgross@suse.com>
 <20211125092056.24758-2-jgross@suse.com>
 <3c922d47-9eab-5150-f4c6-3db40a77599a@srcf.net>
 <c4a1657b-2904-0d10-3a95-07b84062eb52@suse.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <c4a1657b-2904-0d10-3a95-07b84062eb52@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/11/2021 15:04, Juergen Gross wrote:
> On 25.11.21 16:00, Andrew Cooper wrote:
>> On 25/11/2021 09:20, Juergen Gross wrote:
>>> HYPERVISOR_get_debugreg() is being called from noinstr code, so it
>>> should be attributed "always_inline".
>>>
>>> Fixes: f4afb713e5c3a4419ba ("x86/xen: Make get_debugreg() noinstr")
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>> ---
>>>   arch/x86/include/asm/xen/hypercall.h | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/arch/x86/include/asm/xen/hypercall.h
>>> b/arch/x86/include/asm/xen/hypercall.h
>>> index 0575f5863b7f..28ca1119606b 100644
>>> --- a/arch/x86/include/asm/xen/hypercall.h
>>> +++ b/arch/x86/include/asm/xen/hypercall.h
>>> @@ -287,7 +287,7 @@ HYPERVISOR_set_debugreg(int reg, unsigned long
>>> value)
>>>       return _hypercall2(int, set_debugreg, reg, value);
>>>   }
>>>   -static inline unsigned long
>>> +static __always_inline unsigned long
>>>   HYPERVISOR_get_debugreg(int reg)
>>>   {
>>>       return _hypercall1(unsigned long, get_debugreg, reg);
>>
>> All this is going to do is push the error one step further in.
>>
>> Next, objtool will complain that hypercall_page isn't noinstr.
>
> I don't think so:
>
> .pushsection .noinstr.text, "ax"
>         .balign PAGE_SIZE
> SYM_CODE_START(hypercall_page)
>         .rept (PAGE_SIZE / 32)
>                 UNWIND_HINT_FUNC
>                 .skip 31, 0x90
>                 ret
>         .endr

/sigh yes.  It would help if I was reading an up to date tree.

Sorry for the noise.

~Andrew

