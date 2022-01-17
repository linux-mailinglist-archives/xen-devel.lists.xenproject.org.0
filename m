Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCED490739
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jan 2022 12:41:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258128.444187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9QOG-0003ms-6q; Mon, 17 Jan 2022 11:41:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258128.444187; Mon, 17 Jan 2022 11:41:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9QOG-0003ku-36; Mon, 17 Jan 2022 11:41:36 +0000
Received: by outflank-mailman (input) for mailman id 258128;
 Mon, 17 Jan 2022 11:41:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SaLw=SB=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1n9QOF-0003km-4m
 for xen-devel@lists.xenproject.org; Mon, 17 Jan 2022 11:41:35 +0000
Received: from ppsw-33.csi.cam.ac.uk (ppsw-33.csi.cam.ac.uk [131.111.8.133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b567a68-778a-11ec-9bbc-9dff3e4ee8c5;
 Mon, 17 Jan 2022 12:41:33 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:48654)
 by ppsw-33.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.137]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1n9QO8-000kgf-g6 (Exim 4.95) (return-path <amc96@srcf.net>);
 Mon, 17 Jan 2022 11:41:28 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id BFCA61FC70;
 Mon, 17 Jan 2022 11:41:27 +0000 (GMT)
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
X-Inumbo-ID: 6b567a68-778a-11ec-9bbc-9dff3e4ee8c5
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <c609152c-9a4c-2ce1-2d32-37b095c85181@srcf.net>
Date: Mon, 17 Jan 2022 11:41:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220113163833.3831-1-andrew.cooper3@citrix.com>
 <20220113163833.3831-3-andrew.cooper3@citrix.com>
 <aebd4542-8eb8-5073-a578-5b96a6354b84@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH 2/3] x86/spec-ctrl: Drop
 SPEC_CTRL_{ENTRY_FROM,EXIT_TO}_HVM
In-Reply-To: <aebd4542-8eb8-5073-a578-5b96a6354b84@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/01/2022 11:22, Jan Beulich wrote:
> On 13.01.2022 17:38, Andrew Cooper wrote:
>> --- a/xen/arch/x86/hvm/svm/entry.S
>> +++ b/xen/arch/x86/hvm/svm/entry.S
>> @@ -59,7 +59,7 @@ __UNLIKELY_END(nsvm_hap)
>>          mov VCPUMSR_spec_ctrl_raw(%rax), %eax
>>  
>>          /* WARNING! `ret`, `call *`, `jmp *` not safe beyond this point. */
>> -        SPEC_CTRL_EXIT_TO_HVM   /* Req: a=spec_ctrl %rsp=regs/cpuinfo, Clob: cd */
>> +        /* SPEC_CTRL_EXIT_TO_SVM   (nothing currently) */
>>  
>>          pop  %r15
>>          pop  %r14
>> @@ -86,7 +86,8 @@ __UNLIKELY_END(nsvm_hap)
>>  
>>          GET_CURRENT(bx)
>>  
>> -        SPEC_CTRL_ENTRY_FROM_HVM    /* Req: b=curr %rsp=regs/cpuinfo, Clob: acd */
>> +        /* SPEC_CTRL_ENTRY_FROM_SVM    Req: b=curr %rsp=regs/cpuinfo, Clob: ac  */
>> +        ALTERNATIVE "", DO_OVERWRITE_RSB, X86_FEATURE_SC_RSB_HVM
> Just for my own understanding: The comments you add aren't commented
> out macro invocations (as I did read it first), but comments naming
> would-be-macros which are then expanded "manually"? That is partly
> because initially I read the description saying "Expand and drop the
> macros" as meaning that the macros grow in what they contain, which
> looked contradictory to them getting dropped at the same time.
> Perhaps me not sufficiently understanding the difference between all
> possible meanings of "expand" vs "extend" ...

They're grep fodder to be able to easily locate where we're doing
entry/exit speculation logic.  These paths will continue to diverge over
time, and cannot have a common implementation.

~Andrew

