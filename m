Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F214592F9
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 17:27:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.229010.396337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpC9g-0000iE-1I; Mon, 22 Nov 2021 16:26:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 229010.396337; Mon, 22 Nov 2021 16:26:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpC9f-0000fx-UH; Mon, 22 Nov 2021 16:26:55 +0000
Received: by outflank-mailman (input) for mailman id 229010;
 Mon, 22 Nov 2021 16:26:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=75Oo=QJ=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mpC9e-0000fr-U5
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 16:26:54 +0000
Received: from ppsw-32.csi.cam.ac.uk (ppsw-32.csi.cam.ac.uk [131.111.8.132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ffdfad27-4bb0-11ec-a9d2-d9f7a1cc8784;
 Mon, 22 Nov 2021 17:26:53 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:42006)
 by ppsw-32.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.136]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mpC9b-0001YF-2D (Exim 4.95) (return-path <amc96@srcf.net>);
 Mon, 22 Nov 2021 16:26:51 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 273C61FC53;
 Mon, 22 Nov 2021 16:26:51 +0000 (GMT)
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
X-Inumbo-ID: ffdfad27-4bb0-11ec-a9d2-d9f7a1cc8784
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <68c0d8b1-68de-fe4e-f3be-de70117a29fa@srcf.net>
Date: Mon, 22 Nov 2021 16:26:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211119182106.14868-1-andrew.cooper3@citrix.com>
 <20211119182106.14868-6-andrew.cooper3@citrix.com>
 <fe2af9ad-36a7-40c9-8591-4b83831a3e87@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH 5/5] x86/traps: Clean up diagnostics
In-Reply-To: <fe2af9ad-36a7-40c9-8591-4b83831a3e87@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22/11/2021 09:08, Jan Beulich wrote:
> On 19.11.2021 19:21, Andrew Cooper wrote:
>> do{_reserved,}_trap() should use fatal_trap() rather than opencoding part of
> Nit: That's do{_unhandled,}_trap() now.

Ah yes.  Will fix.

>> --- a/xen/arch/x86/traps.c
>> +++ b/xen/arch/x86/traps.c
>> @@ -759,21 +759,7 @@ static int nmi_show_execution_state(const struct cpu_user_regs *regs, int cpu)
>>      return 1;
>>  }
>>  
>> -const char *trapstr(unsigned int trapnr)
>> -{
>> -    static const char * const strings[] = {
>> -        "divide error", "debug", "nmi", "bkpt", "overflow", "bounds",
>> -        "invalid opcode", "device not available", "double fault",
>> -        "coprocessor segment", "invalid tss", "segment not found",
>> -        "stack error", "general protection fault", "page fault",
>> -        "spurious interrupt", "coprocessor error", "alignment check",
>> -        "machine check", "simd error", "virtualisation exception"
>> -    };
>> -
>> -    return trapnr < ARRAY_SIZE(strings) ? strings[trapnr] : "???";
>> -}
>> -
>> -static const char *vec_name(unsigned int vec)
>> +const char *vec_name(unsigned int vec)
> Is this perhaps too ambiguous a name for a non-static function? exn_vec_name()
> at least, maybe?

"exception" has the same problem that "trap" has.  It's actively
incorrect naming.

vec_name() is already less bad as a global than trapstr() was, so I
don't consider this an issue.  I could expand it to vector_name(), but
that would gain several more hunks in the patch.

~Andrew

