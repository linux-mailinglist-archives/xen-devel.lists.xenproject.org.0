Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8794551AE
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 01:33:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227048.392573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnVLf-0002de-EP; Thu, 18 Nov 2021 00:32:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227048.392573; Thu, 18 Nov 2021 00:32:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnVLf-0002ai-Ae; Thu, 18 Nov 2021 00:32:19 +0000
Received: by outflank-mailman (input) for mailman id 227048;
 Thu, 18 Nov 2021 00:32:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9nqF=QF=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mnVLd-0002ac-4g
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 00:32:17 +0000
Received: from ppsw-43.csi.cam.ac.uk (ppsw-43.csi.cam.ac.uk [131.111.8.143])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa6ac775-4806-11ec-9787-a32c541c8605;
 Thu, 18 Nov 2021 01:32:15 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:37186)
 by ppsw-43.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.139]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mnVLa-000IU2-oa (Exim 4.95) (return-path <amc96@srcf.net>);
 Thu, 18 Nov 2021 00:32:14 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 682EC1FD7A;
 Thu, 18 Nov 2021 00:32:14 +0000 (GMT)
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
X-Inumbo-ID: fa6ac775-4806-11ec-9787-a32c541c8605
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <6935bdd8-6b4a-80f6-d134-768dc0d37abe@srcf.net>
Date: Thu, 18 Nov 2021 00:32:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211111175740.23480-1-andrew.cooper3@citrix.com>
 <20211111175740.23480-6-andrew.cooper3@citrix.com>
 <e220b6f2-3cb9-e7b0-6b74-4b266e4e7fb6@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH 5/5] x86/ioapic: Drop function pointers from
 __ioapic_{read,write}_entry()
In-Reply-To: <e220b6f2-3cb9-e7b0-6b74-4b266e4e7fb6@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/11/2021 10:43, Jan Beulich wrote:
> On 11.11.2021 18:57, Andrew Cooper wrote:
>> Function pointers are expensive, and the raw parameter is a constant from all
>> callers, meaning that it predicts very well with local branch history.
> The code change is fine, but I'm having trouble with "all" here: Both
> functions aren't even static, so while callers in io_apic.c may
> benefit (perhaps with the exception of ioapic_{read,write}_entry(),
> depending on whether the compiler views inlining them as warranted),
> I'm in no way convinced this extends to the callers in VT-d code.
>
> Further ISTR clang being quite a bit less aggressive about inlining,
> so the effects might not be quite as good there even for the call
> sites in io_apic.c.
>
> Can you clarify this for me please?

The way the compiler lays out the code is unrelated to why this form is 
an improvement.

Branch history is a function of "the $N most recently taken branches".  
This is because "how you got here" is typically relevant to "where you 
should go next".

Trivial schemes maintain a shift register of taken / not-taken results.  
Less trivial schemes maintain a rolling hash of (src addr, dst addr) 
tuples of all taken branches (direct and indirect).  In both cases, the 
instantaneous branch history is an input into the final prediction, and 
is commonly used to select which saturating counter (or bank of 
counters) is used.

Consider something like

while ( cond )
{
     memcpy(dst1, src1, 64);
     memcpy(dst2, src2, 7);
}

Here, the conditional jump inside memcpy() coping with the tail of the 
copy flips result 50% of the time, which is fiendish to predict for.

However, because the branch history differs (by memcpy()'s return 
address which was accumulated by the call instruction), the predictor 
can actually use two different taken/not-taken counters for the two 
different "instances" if the tail jump.  After a few iterations to warm 
up, the predictor will get every jump perfect despite the fact that 
memcpy() is a library call and the branches would otherwise alias.


Bringing it back to the code in question.  The "raw" parameter is an 
explicit true or false at the top of all call paths leading into these 
functions.  Therefore, an individual branch history has a high 
correlation with said true or false, irrespective of the absolute code 
layout.  As a consequence, the correct result of the prediction is 
highly correlated with the branch history, and it will predict 
perfectly[1] after a few times the path has been used.

~Andrew

[1] Obviously, it's not actually perfect outside of a synthetic 
example.  Aliasing in the predictor is a necessary property of keeping 
the logic small enough to provide an answer fast, but the less 
accidental aliasing there is, the faster the CPU performance in 
benchmarks, so incentives are in our favour here.

