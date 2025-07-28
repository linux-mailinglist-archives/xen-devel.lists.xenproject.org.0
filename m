Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 143BEB13913
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 12:38:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061262.1426779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugLFO-0002pX-Ri; Mon, 28 Jul 2025 10:38:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061262.1426779; Mon, 28 Jul 2025 10:38:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugLFO-0002nb-P3; Mon, 28 Jul 2025 10:38:22 +0000
Received: by outflank-mailman (input) for mailman id 1061262;
 Mon, 28 Jul 2025 10:38:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s93S=2J=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1ugLFM-0002nV-TC
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 10:38:21 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f999e8bc-6b9e-11f0-b895-0df219b8e170;
 Mon, 28 Jul 2025 12:38:18 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 520264EE0749;
 Mon, 28 Jul 2025 12:38:17 +0200 (CEST)
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
X-Inumbo-ID: f999e8bc-6b9e-11f0-b895-0df219b8e170
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1753699097;
	b=3oAG/jCaCAHnYZallGSz73OxDsA5Vm5rEEfekLssxRpHhW6IHEJTZvHyDajgzQfR6jPt
	 ox5bJefQ7teIgEpS1YcaKvnTc9XT5i5yUIpInzgFAQB2pGY/PVleqvH5L/c+SMn0MS9dR
	 gVdD08YJ3RyWwDvY+laczAU3Nl3zM2T5jBTzpIJYGrVxuGbMvTErfqflTNlF421jX4zyN
	 bGYo1qft1/JOt0gaqXbXmCIh4XOOhXINV86A11rKPLA/ZTQ0KBfIN/uMNGFLVHBIO8n5/
	 TwsRPrMapUgYzAQTv8MStqkI7Go7cpimmePAnXIMah2FxkvrYjkSjcDpzkInyH9QHCgId
	 TCwyPKePYJ9IeOtATX+oLz0EqWDNoNdvSZBWL7tsChSAvzCqzFHtBLwkgd6E8uY3FAoza
	 6M1lf7BYUzWIuzcPNQBvRZJ/8wP1YthJLmKa2Kh9ZHh15zbEf1zqi1tndGnJi9WcqeDW4
	 uocBZwEVW5aaeywQta7UGYu84kq+2dnXivMROSoMZV8C809VmfYir1RsfkVsWGowk5Uxy
	 fEGKhloMNr/XR2akBGuMRVmbeL75DEiDCvxSDz3Waw87ZTZ+00Sld+obZ21XgOHurOsVq
	 3jbv/gJM/kYqQQ7XIdSlZjjK03yERMv3l27v6mGv7qIVL6bz4hD6wN7IyRsHMuA=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1753699097;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=rErPABlR5sENyHp6yRUbAxEHAFAOK0uy8qiVrTwmf3Q=;
	b=jQeZ5sf6xJpKumM+SUZxRN5rm9GlOrIErtPVSThbz2T9Vx8ycfufSCQirRR4ghaUhSul
	 qbl+Q+72spiQbjhVmPEZsBO7Eh0P0bePFXQr+j/amC+PGr97Uhggtky5iQeci2GO0D64n
	 MiVGWd7xjIQFOmx6LdbDjEGVFWyktPan2uoxOdiln9sMkOerzePCqLMU4K0KyjyINOOd9
	 POPR5thothufxodwtEJzJbkNEIzeYSXR6bm6HzYSSA4K0WlDFPXUMHPPLHQxAXpStFJa/
	 kEcG33k0rApTkHvL6TrMFG1gmc1j5ekA1BokOTGXUp9CJiK2r8UECm5Qxj6EJiXUEVrrv
	 BF9890IABvrxM0YTtRDwKhbkp0pCTGxSXTPA6Y70bh6x+0qALpAKmejvu86Xj7V8hUpko
	 jcs2K9mZBIeSgnF5fTLz8qLioxwkdlNz3+lWkCSodMXnVCB0xwphvD8/p/BNnKJblQVII
	 rGs4R6rpYuCdWlAnDigQa8Q7KSAGjOQfXbrBh0Ot6aPztYK81AzhkuOl4Il6I4fzeLun7
	 RIiE3lJbyDutP53RFPbjodvkNkqyHQC1kHhyuZDZ5UaC/3KoSuJkr+jGCmFcGLCUgkFJ9
	 R2bRZnVPx3ulNOCG0DZxjGsKGXtAOIy9XrY9SinSpYbZTYag4bYjyUuwqXmRCMc=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1753699097; bh=lUnZVloCqxfCFWmapZEu4eLbBfiaEzulSnCAk+h+tHk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qR6V2T1UvxOVbydA0RdbFHx9dqq/gwxfTsZVf+H8Le7RtZO0M4Rq5iYKdGZaswD1n
	 SQZjZge83J5lZgqrotjjhfv95b++ekIwZ0masrE6NQfRPdq0bXAL61PAsEdMHvmL4w
	 WV210SaRme2cATICkMZtjxBSTolEu62HQ+UQJgedqsjynmpERqdGiocTdjt3yWdTOO
	 Og2PAqj/Cqe98Uksb69iMkdGAH/UFyseRTu2yB2lMB/TUp8jYW9Byc3x9LwiukZS22
	 uh+GPLIQF07QPwST409EzuLnhFlrS1TrjHViJznuq4vcMP+8QOKJ3XPy+l9+IGlfRo
	 N4uE0zpJcwrfg==
MIME-Version: 1.0
Date: Mon, 28 Jul 2025 12:38:17 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Anthony
 PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org, Jbeulich
 <jbeulich@suse.com>
Subject: Re: [PATCH v2] misra: add deviations of MISRA C Rule 5.5
In-Reply-To: <a6f8f7e9-157a-4c99-a15a-cae4b2043ef2@suse.com>
References: <7f5223bf37ed42c90e4bd426659eaa87c2c6879f.1753455885.git.dmytro_prokopchuk1@epam.com>
 <a6f8f7e9-157a-4c99-a15a-cae4b2043ef2@suse.com>
Message-ID: <4db06b93173be64963d8fca547f1f0e6@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-07-28 11:36, Jan Beulich wrote:
> On 25.07.2025 18:24, Dmytro Prokopchuk1 wrote:
>> --- a/docs/misra/deviations.rst
>> +++ b/docs/misra/deviations.rst
>> @@ -142,6 +142,31 @@ Deviations related to MISRA C:2012 Rules:
>>         memmove.
>>       - Tagged as `deliberate` for ECLAIR.
>> 
>> +   * - R5.5
>> +     - Clashes between bitops functions and macros names are 
>> deliberate and are
>> +       needed for input validation and error handling, ensures that 
>> the size of
>> +       the object being pointed to by 'addr' meets the minimum 
>> requirements for
>> +       the bit operation, preventing unsafe operations on improperly 
>> sized data
>> +       types that could lead to undefined behavior or memory 
>> corruption.
>> +       The macros encapsulate this conditional logic into a single, 
>> reusable form;
>> +       which simplifies the code, avoids redundant function call.
>> +     - Specified macros should be ignored.
> 
> At the risk of going too far with nitpicking: Who are "specified 
> macros" here? The
> text doesn't mention any names. In fact, the way it's written it could 
> be taken to
> mean all macros there, including any that are yet to be added. I don't 
> think such
> is appropriate for a deviation.
> 

I agree with Jan here. Either you make a single deviation record 
encompassing all deviated macros or you have one per deviation (e.g., 
one for irq.h, one for grant_table.h and one for bitops.h) listing the 
macros that are considered. For bitops it might be a concern the actual 
functions going out of sync, but in that case you could just spell out 
the deviation and say "all pairs functions/macros in file <file> that 
are defined using the same identifier" or something similar.

>> +   * - R5.5
>> +     - Clashes between 'pirq_cleanup_check' function and macro names 
>> are deliberate.
>> +       The purpose is to ensure that the specific cleanup action 
>> ('pirq_cleanup_check')
>> +       is performed conditionally when the parameter 'event channel 
>> number' equals
>> +       zero, otherwise it does nothing.
>> +       This approach simplifies the code, avoids redundant function 
>> call.
>> +     - Specified macro should be ignored.
> 
> Here it's clear which macro is meant, but ...
> 
>> +   * - R5.5
>> +     - Clashes between grant table functions and macros names are 
>> deliberate.
>> +       These macros address differences in argument count during 
>> compile-time,
>> +       effectively discarding unused parameters to avoid warnings or 
>> errors
>> +       related to unused arguments.
>> +     - Specified macro should be ignored.
> 
> ... here it again isn't.
> 
> Jan

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

