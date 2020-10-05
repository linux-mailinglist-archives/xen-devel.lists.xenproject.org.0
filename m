Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3DA2834A7
	for <lists+xen-devel@lfdr.de>; Mon,  5 Oct 2020 13:08:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2972.8542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kPOLg-0000O6-CG; Mon, 05 Oct 2020 11:08:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2972.8542; Mon, 05 Oct 2020 11:08:08 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kPOLg-0000Nh-8f; Mon, 05 Oct 2020 11:08:08 +0000
Received: by outflank-mailman (input) for mailman id 2972;
 Mon, 05 Oct 2020 11:08:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sJhL=DM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kPOLf-0000Nc-69
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 11:08:07 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3fb8e2cf-4f88-4555-a609-829ab9b14a00;
 Mon, 05 Oct 2020 11:08:04 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=sJhL=DM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kPOLf-0000Nc-69
	for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 11:08:07 +0000
X-Inumbo-ID: 3fb8e2cf-4f88-4555-a609-829ab9b14a00
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 3fb8e2cf-4f88-4555-a609-829ab9b14a00;
	Mon, 05 Oct 2020 11:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601896085;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=2oqGIF+RPbEV9LC+XbTk9RHebwJC93BbN0vGQTsrcug=;
  b=Ij8yW9FGVHNuzj3uI3DlGEZ9Zn7sCh5i9NuEoza9ZenvSRYm7+5Vn01b
   /1sayXeYnIFQXuE4VOTtxvw2jZc5lLp2XOWnA5MNN4YekOV2hDf8DgdQS
   MvQV74EbhxFbekEnnnlGEUYDeqK8SwYSw7I0ap+bgI7rmGtYtb02ZiN5k
   c=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: tM0DIien0snYoU20+2830JM6Bq02tA1Tah1giYqW/Wv9DcdcaYz+GbTMcy1wruIMq1REzzwVh6
 x6vfabkEzy5IPr/O8GUfnQBsIcwAHoEWooq2rta3eG2SX9zaUd6Dr3XvR1RYn0gtWJBu9n19O3
 it7spY0KtAlByKC1SpJDjPeF1udresv5M2069oHWPhCIdDxja7XbTw/rJZqDTkosTbOXpniCAW
 b5LpmAhdAxJzEXVmGVeyHIqcJEd0CBRuHefWSeGbJFd4axPHcOHP7BrbUDyxEnYluv4bxiWA9/
 zHs=
X-SBRS: None
X-MesageID: 28253952
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,338,1596513600"; 
   d="scan'208";a="28253952"
Subject: Re: [PATCH 7/8] x86/hvm: Drop restore boolean from
 hvm_cr4_guest_valid_bits()
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
References: <20200930134248.4918-1-andrew.cooper3@citrix.com>
 <20200930134248.4918-8-andrew.cooper3@citrix.com>
 <20201001110003.GE19254@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <9c502782-0484-7939-0c97-fe12a94ea2a7@citrix.com>
Date: Mon, 5 Oct 2020 12:07:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201001110003.GE19254@Air-de-Roger>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 01/10/2020 12:00, Roger Pau Monné wrote:
> On Wed, Sep 30, 2020 at 02:42:47PM +0100, Andrew Cooper wrote:
>> Previously, migration was reordered so the CPUID data was available before
>> register state.  nestedhvm_enabled() has recently been made accurate for the
>> entire lifetime of the domain.
>>
>> Therefore, we can drop the bodge in hvm_cr4_guest_valid_bits() which existed
>> previously to tolerate a guests' CR4 being set/restored before
>> HVM_PARAM_NESTEDHVM.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks,

>
> Thanks, just one nit below.
>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Wei Liu <wl@xen.org>
>> CC: Jun Nakajima <jun.nakajima@intel.com>
>> CC: Kevin Tian <kevin.tian@intel.com>
>> ---
>>  xen/arch/x86/hvm/domain.c       | 2 +-
>>  xen/arch/x86/hvm/hvm.c          | 8 ++++----
>>  xen/arch/x86/hvm/svm/svmdebug.c | 6 ++++--
>>  xen/arch/x86/hvm/vmx/vmx.c      | 2 +-
>>  xen/arch/x86/hvm/vmx/vvmx.c     | 2 +-
>>  xen/include/asm-x86/hvm/hvm.h   | 2 +-
>>  6 files changed, 12 insertions(+), 10 deletions(-)
>>
>> diff --git a/xen/arch/x86/hvm/domain.c b/xen/arch/x86/hvm/domain.c
>> index 8e3375265c..0ce132b308 100644
>> --- a/xen/arch/x86/hvm/domain.c
>> +++ b/xen/arch/x86/hvm/domain.c
>> @@ -275,7 +275,7 @@ int arch_set_info_hvm_guest(struct vcpu *v, const vcpu_hvm_context_t *ctx)
>>      if ( v->arch.hvm.guest_efer & EFER_LME )
>>          v->arch.hvm.guest_efer |= EFER_LMA;
>>  
>> -    if ( v->arch.hvm.guest_cr[4] & ~hvm_cr4_guest_valid_bits(d, false) )
>> +    if ( v->arch.hvm.guest_cr[4] & ~hvm_cr4_guest_valid_bits(d) )
>>      {
>>          gprintk(XENLOG_ERR, "Bad CR4 value: %#016lx\n",
>>                  v->arch.hvm.guest_cr[4]);
>> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
>> index 101a739952..54e32e4fe8 100644
>> --- a/xen/arch/x86/hvm/hvm.c
>> +++ b/xen/arch/x86/hvm/hvm.c
>> @@ -972,14 +972,14 @@ const char *hvm_efer_valid(const struct vcpu *v, uint64_t value,
>>          X86_CR0_CD | X86_CR0_PG)))
>>  
>>  /* These bits in CR4 can be set by the guest. */
>> -unsigned long hvm_cr4_guest_valid_bits(const struct domain *d, bool restore)
>> +unsigned long hvm_cr4_guest_valid_bits(const struct domain *d)
>>  {
>>      const struct cpuid_policy *p = d->arch.cpuid;
>>      bool mce, vmxe;
>>  
>>      /* Logic broken out simply to aid readability below. */
>>      mce  = p->basic.mce || p->basic.mca;
>> -    vmxe = p->basic.vmx && (restore || nestedhvm_enabled(d));
>> +    vmxe = p->basic.vmx && nestedhvm_enabled(d);
>>  
>>      return ((p->basic.vme     ? X86_CR4_VME | X86_CR4_PVI : 0) |
>>              (p->basic.tsc     ? X86_CR4_TSD               : 0) |
>> @@ -1033,7 +1033,7 @@ static int hvm_load_cpu_ctxt(struct domain *d, hvm_domain_context_t *h)
>>          return -EINVAL;
>>      }
>>  
>> -    if ( ctxt.cr4 & ~hvm_cr4_guest_valid_bits(d, true) )
>> +    if ( ctxt.cr4 & ~hvm_cr4_guest_valid_bits(d) )
>>      {
>>          printk(XENLOG_G_ERR "HVM%d restore: bad CR4 %#" PRIx64 "\n",
>>                 d->domain_id, ctxt.cr4);
>> @@ -2425,7 +2425,7 @@ int hvm_set_cr4(unsigned long value, bool may_defer)
>>      struct vcpu *v = current;
>>      unsigned long old_cr;
>>  
>> -    if ( value & ~hvm_cr4_guest_valid_bits(v->domain, false) )
>> +    if ( value & ~hvm_cr4_guest_valid_bits(v->domain) )
>>      {
>>          HVM_DBG_LOG(DBG_LEVEL_1,
>>                      "Guest attempts to set reserved bit in CR4: %lx",
>> diff --git a/xen/arch/x86/hvm/svm/svmdebug.c b/xen/arch/x86/hvm/svm/svmdebug.c
>> index ba26b6a80b..f450391df4 100644
>> --- a/xen/arch/x86/hvm/svm/svmdebug.c
>> +++ b/xen/arch/x86/hvm/svm/svmdebug.c
>> @@ -106,6 +106,7 @@ bool svm_vmcb_isvalid(const char *from, const struct vmcb_struct *vmcb,
>>      unsigned long cr0 = vmcb_get_cr0(vmcb);
>>      unsigned long cr3 = vmcb_get_cr3(vmcb);
>>      unsigned long cr4 = vmcb_get_cr4(vmcb);
>> +    unsigned long valid;
> Could you init valid here at definition time? Also cr4_valid might be
> a better name since the sacope of the variable is quite wide.

I have some further cleanup in mind, which is why I did it like this.

~Andrew

