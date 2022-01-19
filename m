Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E00A493E9B
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jan 2022 17:53:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258896.446380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAECs-0003PA-Mv; Wed, 19 Jan 2022 16:53:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258896.446380; Wed, 19 Jan 2022 16:53:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAECs-0003MI-Ju; Wed, 19 Jan 2022 16:53:10 +0000
Received: by outflank-mailman (input) for mailman id 258896;
 Wed, 19 Jan 2022 16:53:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VeFE=SD=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1nAECr-0003MC-Ow
 for xen-devel@lists.xenproject.org; Wed, 19 Jan 2022 16:53:09 +0000
Received: from ppsw-33.csi.cam.ac.uk (ppsw-33.csi.cam.ac.uk [131.111.8.133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46d65d45-7948-11ec-bc18-3156f6d857e4;
 Wed, 19 Jan 2022 17:53:08 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:49288)
 by ppsw-33.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.137]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1nAECk-000X2x-g5 (Exim 4.95) (return-path <amc96@srcf.net>);
 Wed, 19 Jan 2022 16:53:02 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id B31221FC25;
 Wed, 19 Jan 2022 16:53:01 +0000 (GMT)
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
X-Inumbo-ID: 46d65d45-7948-11ec-bc18-3156f6d857e4
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <00b2e4ee-eb60-d336-b9af-04e410fdc5e2@srcf.net>
Date: Wed, 19 Jan 2022 16:53:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220117183415.11150-1-andrew.cooper3@citrix.com>
 <20220117192533.6048-1-andrew.cooper3@citrix.com>
 <93ec9bab-0a21-365b-3bcd-0fbf70bdbbbb@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH v2 5/4] x86/hvm: Drop hvm_{get,set}_guest_bndcfgs() and
 use {get,set}_regs() instead
In-Reply-To: <93ec9bab-0a21-365b-3bcd-0fbf70bdbbbb@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/01/2022 13:50, Jan Beulich wrote:
> On 17.01.2022 20:25, Andrew Cooper wrote:
>> hvm_{get,set}_guest_bndcfgs() are thin wrappers around accessing MSR_BNDCFGS.
>>
>> MPX was implemented on Skylake uarch CPUs and dropped in subsequent CPUs, and
>> is disabled by default in Xen VMs.
>>
>> It would be nice to move all the logic into vmx_msr_{read,write}_intercept(),
>> but the common HVM migration code uses guest_{rd,wr}msr().  Therefore, use
>> {get,set}_regs() to reduce the quantity of "common" HVM code.
>>
>> In lieu of having hvm_set_guest_bndcfgs() split out, use some #ifdef
>> CONFIG_HVM in guest_wrmsr().  In vmx_{get,set}_regs(), split the switch
>> statements into two depending on whether the require remote VMCS acquisition
>> or not.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>
> One remark:
>
>> @@ -323,10 +324,9 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
>>          break;
>>  
>>      case MSR_IA32_BNDCFGS:
>> -        if ( !cp->feat.mpx || !is_hvm_domain(d) ||
>> -             !hvm_get_guest_bndcfgs(v, val) )
>> +        if ( !cp->feat.mpx ) /* Implies Intel HVM only */
> Wouldn't it make sense to accompany this comment by ...
>
>>              goto gp_fault;
>> -        break;
>     ASSERT(is_hvm_domain(d));
>
> (and then the same on the "set" path)?

So this is the reason for the default logic in the {get,set}_reg()
path.  The absence of MSR_BNDCFGS in the PV and SVM paths will cause the
VM to be crashed cleanly.  If you're on a VMX on a non-MPX capable
system, the VMREAD/VMWRITE will hit a BUG (which in due course I want to
downgrade to a domain crash).

It's a bit more friendly than an ASSERT() (doesn't take the system
down), is present in release builds too, and more precise as it excludes
SVM too.

~Andrew

P.S. I'm still trying to decide on an acceptable name to hide {
ASSERT_UNREACHABLE(); gprink(); domain_crash() } behind, so we can
downgrade more BUG()/etc to more runtime-friendly options.

