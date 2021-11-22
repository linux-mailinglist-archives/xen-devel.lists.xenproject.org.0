Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC39458FB4
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 14:49:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228885.396106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp9gb-0007Dp-1G; Mon, 22 Nov 2021 13:48:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228885.396106; Mon, 22 Nov 2021 13:48:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp9ga-0007BT-UL; Mon, 22 Nov 2021 13:48:44 +0000
Received: by outflank-mailman (input) for mailman id 228885;
 Mon, 22 Nov 2021 13:48:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=75Oo=QJ=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mp9gY-0007BN-Kf
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 13:48:42 +0000
Received: from ppsw-33.csi.cam.ac.uk (ppsw-33.csi.cam.ac.uk [131.111.8.133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e656f299-4b9a-11ec-9787-a32c541c8605;
 Mon, 22 Nov 2021 14:48:40 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:48634)
 by ppsw-33.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.137]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mp9gV-000xtQ-j1 (Exim 4.95) (return-path <amc96@srcf.net>);
 Mon, 22 Nov 2021 13:48:39 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 917101FC53;
 Mon, 22 Nov 2021 13:48:39 +0000 (GMT)
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
X-Inumbo-ID: e656f299-4b9a-11ec-9787-a32c541c8605
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <ecb4b299-5445-f3e7-5175-9422433061c0@srcf.net>
Date: Mon, 22 Nov 2021 13:48:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 3/5] x86/crash: Drop manual hooking of exception_table[]
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211119182106.14868-1-andrew.cooper3@citrix.com>
 <20211119182106.14868-4-andrew.cooper3@citrix.com>
 <4cff0241-ee75-59f5-49ff-cd29964efcbe@suse.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <4cff0241-ee75-59f5-49ff-cd29964efcbe@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22/11/2021 08:57, Jan Beulich wrote:
> On 19.11.2021 19:21, Andrew Cooper wrote:
>> --- a/xen/arch/x86/crash.c
>> +++ b/xen/arch/x86/crash.c
>> @@ -36,10 +36,8 @@ static unsigned int crashing_cpu;
>>  static DEFINE_PER_CPU_READ_MOSTLY(bool, crash_save_done);
>>  
>>  /* This becomes the NMI handler for non-crashing CPUs, when Xen is crashing. */
>> -static void noreturn do_nmi_crash(const struct cpu_user_regs *regs)
>> +static int noreturn do_nmi_crash(const struct cpu_user_regs *regs, int cpu)
>>  {
>> -    unsigned int cpu = smp_processor_id();
>> -
>>      stac();
>>  
>>      /* nmi_shootdown_cpus() should ensure that this assertion is correct. */
> Looks like this is the first instance of a noreturn function returning non-void.
> Are you sufficiently certain that (older) compilers won't complain about missing
> return statements (with a value)?

Yes.  https://godbolt.org/z/8a1efoh39

~Andrew

