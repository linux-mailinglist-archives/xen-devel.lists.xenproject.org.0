Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 958B4494D77
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jan 2022 12:56:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259033.446708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAW2J-00065I-Pe; Thu, 20 Jan 2022 11:55:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259033.446708; Thu, 20 Jan 2022 11:55:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAW2J-00063D-LB; Thu, 20 Jan 2022 11:55:27 +0000
Received: by outflank-mailman (input) for mailman id 259033;
 Thu, 20 Jan 2022 11:55:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YFdd=SE=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1nAW2H-000637-Vn
 for xen-devel@lists.xenproject.org; Thu, 20 Jan 2022 11:55:25 +0000
Received: from ppsw-42.csi.cam.ac.uk (ppsw-42.csi.cam.ac.uk [131.111.8.142])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d91dacc4-79e7-11ec-8fa7-f31e035a9116;
 Thu, 20 Jan 2022 12:55:24 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:49014)
 by ppsw-42.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1nAW29-0010RV-8b (Exim 4.95) (return-path <amc96@srcf.net>);
 Thu, 20 Jan 2022 11:55:17 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 5DC2D1FADB;
 Thu, 20 Jan 2022 11:55:17 +0000 (GMT)
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
X-Inumbo-ID: d91dacc4-79e7-11ec-8fa7-f31e035a9116
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <914f2264-d424-e42b-31ac-1832224cc1d9@srcf.net>
Date: Thu, 20 Jan 2022 11:55:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220117183415.11150-1-andrew.cooper3@citrix.com>
 <20220117183415.11150-5-andrew.cooper3@citrix.com>
 <3395e756-fa47-8d94-148a-03a573331e5a@suse.com>
 <74c2961b-29e1-9641-8a8b-b7cb0598b7be@srcf.net>
 <ad0c183a-ff7b-c560-ed3b-469d3f5c5b0a@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH v2 4/4] x86/spec-ctrl: Fix NMI race condition with VT-x
 MSR_SPEC_CTRL handling
In-Reply-To: <ad0c183a-ff7b-c560-ed3b-469d3f5c5b0a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/01/2022 08:14, Jan Beulich wrote:
> On 19.01.2022 18:00, Andrew Cooper wrote:
>> On 19/01/2022 13:42, Jan Beulich wrote:
>>> On 17.01.2022 19:34, Andrew Cooper wrote:
>>>> --- a/xen/arch/x86/hvm/vmx/entry.S
>>>> +++ b/xen/arch/x86/hvm/vmx/entry.S
>>>> @@ -35,7 +35,14 @@ ENTRY(vmx_asm_vmexit_handler)
>>>>  
>>>>          /* SPEC_CTRL_ENTRY_FROM_VMX    Req: b=curr %rsp=regs/cpuinfo, Clob: acd */
>>>>          ALTERNATIVE "", DO_OVERWRITE_RSB, X86_FEATURE_SC_RSB_HVM
>>>> -        ALTERNATIVE "", DO_SPEC_CTRL_ENTRY_FROM_HVM, X86_FEATURE_SC_MSR_HVM
>>>> +
>>>> +        .macro restore_spec_ctrl
>>>> +            mov    $MSR_SPEC_CTRL, %ecx
>>>> +            movzbl CPUINFO_xen_spec_ctrl(%rsp), %eax
>>>> +            xor    %edx, %edx
>>>> +            wrmsr
>>>> +        .endm
>>>> +        ALTERNATIVE "", restore_spec_ctrl, X86_FEATURE_SC_MSR_HVM
>>>>          /* WARNING! `ret`, `call *`, `jmp *` not safe before this point. */
>>>>  
>>>>          /* Hardware clears MSR_DEBUGCTL on VMExit.  Reinstate it if debugging Xen. */
>>>> @@ -82,8 +89,7 @@ UNLIKELY_END(realmode)
>>>>          mov VCPUMSR_spec_ctrl_raw(%rax), %eax
>>>>  
>>>>          /* WARNING! `ret`, `call *`, `jmp *` not safe beyond this point. */
>>>> -        /* SPEC_CTRL_EXIT_TO_VMX   Req: a=spec_ctrl %rsp=regs/cpuinfo, Clob: cd */
>>>> -        ALTERNATIVE "", DO_SPEC_CTRL_EXIT_TO_GUEST, X86_FEATURE_SC_MSR_HVM
>>>> +        /* SPEC_CTRL_EXIT_TO_VMX   Req: %rsp=regs/cpuinfo              Clob:    */
>>>>          ALTERNATIVE "", __stringify(verw CPUINFO_verw_sel(%rsp)), X86_FEATURE_SC_VERW_HVM
>>> I notice you did update this clobber remark, but what about the one further
>>> up in context?
>> What about it?  It still clobbers %eax, %ecx and %edx.
> Oh, sorry - I did look at DO_OVERWRITE_RSB only, not paying attention
> to the now open-coded 2nd part, which - due to the blank line - doesn't
> appear connected to the comment anymore.

Yeah - it's a little harder now that it isn't a single line.  The
req/clob information really is most useful at the start of the block,
because that's where it is important to get the context correct.

Can I take this as an R-by then?

~Andrew

