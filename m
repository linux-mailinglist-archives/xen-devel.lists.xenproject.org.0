Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CCF467930
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 15:12:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237701.412286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt9IX-0002U0-B4; Fri, 03 Dec 2021 14:12:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237701.412286; Fri, 03 Dec 2021 14:12:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt9IX-0002RG-7y; Fri, 03 Dec 2021 14:12:25 +0000
Received: by outflank-mailman (input) for mailman id 237701;
 Fri, 03 Dec 2021 14:12:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LwEy=QU=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mt9IV-0002R0-DC
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 14:12:23 +0000
Received: from ppsw-32.csi.cam.ac.uk (ppsw-32.csi.cam.ac.uk [131.111.8.132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0827c63e-5443-11ec-b1df-f38ee3fbfdf7;
 Fri, 03 Dec 2021 15:12:22 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:44318)
 by ppsw-32.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.136]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mt9IT-000mMJ-1s (Exim 4.95) (return-path <amc96@srcf.net>);
 Fri, 03 Dec 2021 14:12:21 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 662331FC8B;
 Fri,  3 Dec 2021 14:12:21 +0000 (GMT)
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
X-Inumbo-ID: 0827c63e-5443-11ec-b1df-f38ee3fbfdf7
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <76c98cae-13d5-4ad8-9238-71bef56609d1@srcf.net>
Date: Fri, 3 Dec 2021 14:12:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 62/65] x86/entry: Make IDT entrypoints CET-IBT compatible
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
 <20211126123446.32324-63-andrew.cooper3@citrix.com>
 <c41e4bf9-e523-ec9b-aeb9-c91662685dc4@suse.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <c41e4bf9-e523-ec9b-aeb9-c91662685dc4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/12/2021 13:23, Jan Beulich wrote:
> On 26.11.2021 13:34, Andrew Cooper wrote:
>> Each IDT vector needs to land on an endbr64 instruction.  This is especially
>> important for the #CP handler, which will escalate to #DF if the endbr64 is
>> missing.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>
> One remark though:
>
>> @@ -1136,7 +1158,8 @@ autogen_stubs: /* Automatically generated stubs. */
>>  #endif
>>  
>>          ALIGN
>> -1:      pushq $0
>> +1:      ENDBR64
>> +        pushq $0
>>          movb  $vec,4(%rsp)
>>          jmp   common_interrupt
>>  
>> @@ -1146,7 +1169,8 @@ autogen_stubs: /* Automatically generated stubs. */
>>          .elseif vec == X86_EXC_CSO || vec == X86_EXC_SPV || \
>>                  vec == X86_EXC_VE  || (vec > X86_EXC_CP && vec < TRAP_nr)
>>  
>> -1:      test  $8,%spl        /* 64bit exception frames are 16 byte aligned, but the word */
>> +1:      ENDBR64
>> +        test  $8,%spl        /* 64bit exception frames are 16 byte aligned, but the word */
>>          jz    2f             /* size is 8 bytes.  Check whether the processor gave us an */
>>          pushq $0             /* error code, and insert an empty one if not.              */
>>  2:      movb  $vec,4(%rsp)
> Like with initializers of compound objects vs trailing commas there, I
> think it would help if we moved away from placing insns on the same
> lines as labels. As can be seen here, inserting something always means
> touching two lines instead of just adding one.

I had actually wondered the same, without drawing a comparison to
trailing commas.  I'll adjust.

~Andrew

