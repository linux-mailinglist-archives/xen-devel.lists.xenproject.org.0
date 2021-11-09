Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E037644B057
	for <lists+xen-devel@lfdr.de>; Tue,  9 Nov 2021 16:29:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224042.387096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkT3M-0007Xm-4x; Tue, 09 Nov 2021 15:28:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224042.387096; Tue, 09 Nov 2021 15:28:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkT3M-0007VN-15; Tue, 09 Nov 2021 15:28:52 +0000
Received: by outflank-mailman (input) for mailman id 224042;
 Tue, 09 Nov 2021 15:28:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j4nh=P4=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mkT3K-0007Tm-P4
 for xen-devel@lists.xenproject.org; Tue, 09 Nov 2021 15:28:50 +0000
Received: from ppsw-32.csi.cam.ac.uk (ppsw-32.csi.cam.ac.uk [131.111.8.132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc602d69-4171-11ec-a9d2-d9f7a1cc8784;
 Tue, 09 Nov 2021 16:28:49 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:39002)
 by ppsw-32.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.136]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mkT33-000x3r-0M (Exim 4.95) (return-path <amc96@srcf.net>);
 Tue, 09 Nov 2021 15:28:33 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id C53601FBEE;
 Tue,  9 Nov 2021 15:28:32 +0000 (GMT)
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
X-Inumbo-ID: bc602d69-4171-11ec-a9d2-d9f7a1cc8784
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
To: Peter Zijlstra <peterz@infradead.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
 tglx@linutronix.de, bp@alien8.de, dave.hansen@linux.intel.com,
 x86@kernel.org, hpa@zytor.com, jgross@suse.com
References: <1635896196-18961-1-git-send-email-boris.ostrovsky@oracle.com>
 <YYk+D17oIOGKWNtN@hirez.programming.kicks-ass.net>
 <48fb48fa-c65d-8e38-dabb-cf9be21365ca@oracle.com>
 <YYqPd1c9HIQH9k/9@hirez.programming.kicks-ass.net>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH] x86/smp: Factor out parts of native_smp_prepare_cpus()
Message-ID: <aef8093d-f7da-c8b4-ebf6-6053b50b77ba@srcf.net>
Date: Tue, 9 Nov 2021 15:28:32 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YYqPd1c9HIQH9k/9@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB

On 09/11/2021 15:10, Peter Zijlstra wrote:
> On Mon, Nov 08, 2021 at 12:20:26PM -0500, Boris Ostrovsky wrote:
>>> But looking at those functions; there seems to be more spurious
>>> differences. For example, the whole sched_topology thing.
>>
>> I did look at that and thought this should be benign given that Xen PV=

>> is not really topology-aware. I didn't see anything that would be a
>> cause for concern but perhaps you can point me to things I missed.
> And me not being Xen aware... What does Xen-PV guests see of the CPUID
> topology fields? Does it fully sanitize the CPUID data, or is it a clea=
n
> pass-through from whatever CPU the vCPU happens to run on at the time?

That depends on hardware support (CPUID Faulting or not), version of Xen
(anything before Xen 4.7 is totally insane.=C2=A0 Anything more recent is=

only moderately insane), and whether the kernel asks via the enlightened
CPUID path or not.

On hardware lacking CPUID faulting, and for a kernel using
native_cpuid() where it ought to be using the PVOP, it sees the real
hardware value of the CPU it happens to be running on.

~Andrew


