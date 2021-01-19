Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F05792FBD05
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jan 2021 17:57:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.70937.127011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1uJg-0003O1-N2; Tue, 19 Jan 2021 16:57:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 70937.127011; Tue, 19 Jan 2021 16:57:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1uJg-0003NU-Jk; Tue, 19 Jan 2021 16:57:16 +0000
Received: by outflank-mailman (input) for mailman id 70937;
 Tue, 19 Jan 2021 16:57:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U8Ox=GW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l1uJf-0003NP-6p
 for xen-devel@lists.xenproject.org; Tue, 19 Jan 2021 16:57:15 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c09a0261-3efb-477e-9b62-91d39de3e0ec;
 Tue, 19 Jan 2021 16:57:13 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 013F2AD62;
 Tue, 19 Jan 2021 16:57:13 +0000 (UTC)
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
X-Inumbo-ID: c09a0261-3efb-477e-9b62-91d39de3e0ec
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611075433; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3ZKRazEQjbg8VXER9HiC/am6UU7Whce1iVjdeaL3jTU=;
	b=ic32IaYSR7mHnkdGpVPfq1LI7vnrfJ0lBGda3y5QqjcVI7JPVWWErhzpp8kLXSaTiYyJQS
	Xj4heP8/0IaZU3/IuLI61YO0QIddGB73UGozcM/+UWLpgVHApvk6qs0fGlqtwn0wvipapD
	dMJpsglj5kSe1rv7JvMKAVIsDktYQG0=
Subject: Re: [PATCH] x86/vmx: Remove IO bitmap from minimal VMX requirements
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Hubert Jasudowicz <hubert.jasudowicz@cert.pl>
Cc: xen-devel@lists.xenproject.org, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>
References: <570e73b83c18cce4dbe4c70cc14b6df7c33f0502.1610720991.git.hubert.jasudowicz@cert.pl>
 <20210115144420.bcz7l52h2zs4ml34@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5211cb4d-4a60-68eb-2c67-a16565e02f23@suse.com>
Date: Tue, 19 Jan 2021 17:57:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210115144420.bcz7l52h2zs4ml34@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 15.01.2021 15:44, Roger Pau Monné wrote:
> On Fri, Jan 15, 2021 at 03:30:50PM +0100, Hubert Jasudowicz wrote:
>> This patch is a result of a downstream bug report[1]. Xen fails to
>> create a HVM domain while running under VMware Fusion 12.1.0 on
>> a modern Intel Core i9 CPU:
>>
>> (XEN) VMX: CPU0 has insufficient CPU-Based Exec Control (b5b9fffe; requires 2299968c)
>> (XEN) VMX: failed to initialise.
>>
>> It seems that Apple hypervisor API doesn't support this feature[2].
>>
>> Move this bit from minimal required features to optional.
>>
>> [1] https://github.com/CERT-Polska/drakvuf-sandbox/issues/418
>> [2] https://developer.apple.com/documentation/hypervisor/cpu_based_io_bitmaps
>>
>> Signed-off-by: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>
>> ---
>>  xen/arch/x86/hvm/vmx/vmcs.c        | 8 +++++---
>>  xen/include/asm-x86/hvm/vmx/vmcs.h | 2 ++
>>  2 files changed, 7 insertions(+), 3 deletions(-)
>>
>> diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
>> index 164535f8f0..bad4d6e206 100644
>> --- a/xen/arch/x86/hvm/vmx/vmcs.c
>> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
>> @@ -276,10 +276,10 @@ static int vmx_init_vmcs_config(void)
>>             CPU_BASED_MONITOR_EXITING |
>>             CPU_BASED_MWAIT_EXITING |
>>             CPU_BASED_MOV_DR_EXITING |
>> -           CPU_BASED_ACTIVATE_IO_BITMAP |
>>             CPU_BASED_USE_TSC_OFFSETING |
>>             CPU_BASED_RDTSC_EXITING);
>>      opt = (CPU_BASED_ACTIVATE_MSR_BITMAP |
>> +           CPU_BASED_ACTIVATE_IO_BITMAP |
>>             CPU_BASED_TPR_SHADOW |
>>             CPU_BASED_MONITOR_TRAP_FLAG |
>>             CPU_BASED_ACTIVATE_SECONDARY_CONTROLS);
>> @@ -1168,8 +1168,10 @@ static int construct_vmcs(struct vcpu *v)
>>      }
>>  
>>      /* I/O access bitmap. */
>> -    __vmwrite(IO_BITMAP_A, __pa(d->arch.hvm.io_bitmap));
>> -    __vmwrite(IO_BITMAP_B, __pa(d->arch.hvm.io_bitmap) + PAGE_SIZE);
>> +    if ( cpu_has_vmx_io_bitmap ) {
>> +        __vmwrite(IO_BITMAP_A, __pa(d->arch.hvm.io_bitmap));
>> +        __vmwrite(IO_BITMAP_B, __pa(d->arch.hvm.io_bitmap) + PAGE_SIZE);
>> +    }
> 
> Maybe I'm missing something, but don't you need to expand
> EXIT_REASON_IO_INSTRUCTION in vmx_vmexit_handler when there's no IO
> bitmap support so that all the emulation is bypassed and the IO port
> access is replayed by Xen?

I think it's worse than this: I don't see us ever setting
"unconditional I/O exiting", which means guests would be allowed
access to all I/O ports. IOW I think that other bit needs setting
when I/O bitmaps can't be made use of.

Jan

> I think you don't strictly need to modify EXIT_REASON_IO_INSTRUCTION
> and can use the existing g2m_ioport_list infrastructure to add the
> allowed ports present on the bitmap and prevent them from being
> forwarded to the IOREQ server.
> 
> Thanks, Roger.
> 


