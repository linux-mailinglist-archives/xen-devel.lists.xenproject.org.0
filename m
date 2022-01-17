Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F12E1490F5A
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jan 2022 18:24:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258219.444452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9VjJ-0006KM-Uw; Mon, 17 Jan 2022 17:23:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258219.444452; Mon, 17 Jan 2022 17:23:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9VjJ-0006HG-Rh; Mon, 17 Jan 2022 17:23:41 +0000
Received: by outflank-mailman (input) for mailman id 258219;
 Mon, 17 Jan 2022 17:23:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SaLw=SB=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1n9VjH-0006HA-M6
 for xen-devel@lists.xenproject.org; Mon, 17 Jan 2022 17:23:39 +0000
Received: from ppsw-32.csi.cam.ac.uk (ppsw-32.csi.cam.ac.uk [131.111.8.132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 347834ad-77ba-11ec-9bbc-9dff3e4ee8c5;
 Mon, 17 Jan 2022 18:23:38 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:49346)
 by ppsw-32.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.136]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1n9Vj9-000ISq-0Q (Exim 4.95) (return-path <amc96@srcf.net>);
 Mon, 17 Jan 2022 17:23:31 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id E16BB1FC70;
 Mon, 17 Jan 2022 17:23:30 +0000 (GMT)
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
X-Inumbo-ID: 347834ad-77ba-11ec-9bbc-9dff3e4ee8c5
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <cf0b4480-ac1d-ce21-4829-9e02a01590f2@srcf.net>
Date: Mon, 17 Jan 2022 17:23:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220113163833.3831-1-andrew.cooper3@citrix.com>
 <20220113163833.3831-4-andrew.cooper3@citrix.com>
 <5f2c932b-8e30-b636-76f9-d4b27a9f477b@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH 3/3] x86/spec-ctrl: Fix NMI race condition with VT-x
 MSR_SPEC_CTRL handling
In-Reply-To: <5f2c932b-8e30-b636-76f9-d4b27a9f477b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/01/2022 11:51, Jan Beulich wrote:
> On 13.01.2022 17:38, Andrew Cooper wrote:
>> @@ -119,12 +125,11 @@ UNLIKELY_END(realmode)
>>          SAVE_ALL
>>  
>>          /*
>> -         * PV variant needed here as no guest code has executed (so
>> -         * MSR_SPEC_CTRL can't have changed value), and NMIs/MCEs are liable
>> -         * to hit (in which case the HVM variant might corrupt things).
>> +         * SPEC_CTRL_ENTRY notes
>> +         *
>> +         * If we end up here, no guest code has executed.  We still have Xen's
>> +         * choice of MSR_SPEC_CTRL in context, and the RSB is safe.
>>           */
>> -        SPEC_CTRL_ENTRY_FROM_PV /* Req: %rsp=regs/cpuinfo Clob: acd */
>> -        /* WARNING! `ret`, `call *`, `jmp *` not safe before this point. */
> Is "no guest code has executed" actually enough here? If VM entry failed
> due to a later MSR-load-list entry, SPEC_CTRL could have changed value
> already, couldn't it?

No, it can't.

See the very start of SDM Chapter 25 "VMEntries" for the distinction
between early and late entry failures.  (i.e. those which cause
execution to continue beyond VMLAUNCH/VMRESUME, and those which cause
execution to continue from the vmexit handler.)

Early failures are conditions such as `pop %ss; vmlaunch`, and bad host
state in the VMCS.

Everything pertaining to guest state is late failure, so by the time we
get to processing the MSR load/save list, we're definitely not taking
this path.

~Andrew

