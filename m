Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 726B2493F77
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jan 2022 19:01:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258903.446402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAFFs-0002Iz-RD; Wed, 19 Jan 2022 18:00:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258903.446402; Wed, 19 Jan 2022 18:00:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAFFs-0002G0-NT; Wed, 19 Jan 2022 18:00:20 +0000
Received: by outflank-mailman (input) for mailman id 258903;
 Wed, 19 Jan 2022 18:00:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VeFE=SD=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1nAFFq-0002Fu-PP
 for xen-devel@lists.xenproject.org; Wed, 19 Jan 2022 18:00:18 +0000
Received: from ppsw-43.csi.cam.ac.uk (ppsw-43.csi.cam.ac.uk [131.111.8.143])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a653c8c1-7951-11ec-bc18-3156f6d857e4;
 Wed, 19 Jan 2022 19:00:15 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:52462)
 by ppsw-43.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.139]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1nAFFg-000SwA-pL (Exim 4.95) (return-path <amc96@srcf.net>);
 Wed, 19 Jan 2022 18:00:08 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 9BBE11FA77;
 Wed, 19 Jan 2022 18:00:08 +0000 (GMT)
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
X-Inumbo-ID: a653c8c1-7951-11ec-bc18-3156f6d857e4
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <fe416bfa-9f10-229f-1786-10c95cbcd05c@srcf.net>
Date: Wed, 19 Jan 2022 18:00:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220117183415.11150-1-andrew.cooper3@citrix.com>
 <20220117183415.11150-2-andrew.cooper3@citrix.com>
 <752485db-deec-1011-f65a-d277fc3e404a@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH v2 1/4] x86/guest: Introduce {get,set}_reg()
 infrastructure
In-Reply-To: <752485db-deec-1011-f65a-d277fc3e404a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/01/2022 13:28, Jan Beulich wrote:
> On 17.01.2022 19:34, Andrew Cooper wrote:
>> --- a/xen/arch/x86/hvm/hvm.c
>> +++ b/xen/arch/x86/hvm/hvm.c
>> @@ -3744,6 +3744,28 @@ int hvm_msr_write_intercept(unsigned int msr, uint64_t msr_content,
>>      return X86EMUL_EXCEPTION;
>>  }
>>  
>> +uint64_t hvm_get_reg(struct vcpu *v, unsigned int reg)
>> +{
>> +    ASSERT(v == current || !vcpu_runnable(v));
>> +
>> +    switch ( reg )
>> +    {
>> +    default:
>> +        return alternative_call(hvm_funcs.get_reg, v, reg);
>> +    }
>> +}
>> +
>> +void hvm_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
>> +{
>> +    ASSERT(v == current || !vcpu_runnable(v));
>> +
>> +    switch ( reg )
>> +    {
>> +    default:
>> +        return alternative_vcall(hvm_funcs.set_reg, v, reg, val);
> I'm inclined to ask to drop "return" from here.

It's a tossup between this, and a following break.  I was guestimating
based on the subsequent patches, because there is isn't a plausible use
for common logic following the switch statement.

> Also, for both functions, without it being clear for what kind of
> registers beyond MSRs this may want using down the road, I wonder
> whether uint64_t is actually wide enough.

The tsc scaling/offset registers will probably be the easiest to move,
because they're driven almost exclusively from common code. 
nhvm_vcpu_p2m_base() too, because it is only read, and is trivial.

cr2 would be easy example, except it's probably not useful to split out
of the general cr paths.

Another MSR example which is simple to move (and drop hooks) is
get_shadow_gs_base().


The segment registers are the only obvious examples which don't fit into
uint64_t.

As a tangent, code generation for get/set_sreg() would probably be far
better if get() returned by value, and set() took by value.  struct
segment_register is only a pair of registers, and the optimiser can
probably keep most callsites from spilling to the stack.

>> --- a/xen/arch/x86/hvm/svm/svm.c
>> +++ b/xen/arch/x86/hvm/svm/svm.c
>> @@ -2469,6 +2469,33 @@ static bool svm_get_pending_event(struct vcpu *v, struct x86_event *info)
>>      return true;
>>  }
>>  
>> +static uint64_t svm_get_reg(struct vcpu *v, unsigned int reg)
>> +{
>> +    struct domain *d = v->domain;
>> +
>> +    switch ( reg )
>> +    {
>> +    default:
>> +        printk(XENLOG_G_ERR "%s(%pv, 0x%08x) Bad register\n",
>> +               __func__, v, reg);
> Is __func__ actually of much use here and in similar further places?

Yes.  Admittedly moreso before I added the domain_crash(), but it is
information not printed.

It is specifically useful because nothing in the domain_crash() path
distinguishes PV and HVM guests, meaning that the output is ambiguous at
a glance when investigating customer logs.  VTx vs SVM is less ambiguous
at a glance because Intel vs AMD information is plentiful in dmesg, but
there's no harm making it clearer.

>> @@ -852,6 +867,15 @@ static inline int hvm_vmtrace_get_option(
>>      return -EOPNOTSUPP;
>>  }
>>  
>> +static inline uint64_t pv_get_reg(struct vcpu *v, unsigned int reg)
>> +{
>> +    ASSERT_UNREACHABLE();
>> +}
>> +static inline void pv_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
>> +{
>> +    ASSERT_UNREACHABLE();
>> +}
> Were these meant to have hvm_ prefixes?

Oops yes.  I'm not entirely sure if the stubs are necessary, given our
usual DCE rule.  I'll try some !PV and !HVM builds and see whether I can
drop them entirely.

> With at least this last aspect addressed
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

~Andrew

