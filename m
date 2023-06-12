Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F111F72BCCA
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 11:34:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546941.854055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8dwW-0000VQ-O2; Mon, 12 Jun 2023 09:34:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546941.854055; Mon, 12 Jun 2023 09:34:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8dwW-0000S5-L4; Mon, 12 Jun 2023 09:34:32 +0000
Received: by outflank-mailman (input) for mailman id 546941;
 Mon, 12 Jun 2023 09:34:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yDFT=CA=bugseng.com=roberto.bagnara@srs-se1.protection.inumbo.net>)
 id 1q8dwV-0000Rz-FV
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 09:34:31 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 54a32310-0904-11ee-b232-6b7b168915f2;
 Mon, 12 Jun 2023 11:34:30 +0200 (CEST)
Received: from [192.168.1.142] (unknown [151.57.12.77])
 by support.bugseng.com (Postfix) with ESMTPSA id 0B3254EE073E;
 Mon, 12 Jun 2023 11:34:28 +0200 (CEST)
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
X-Inumbo-ID: 54a32310-0904-11ee-b232-6b7b168915f2
Message-ID: <6525d690-e487-ead8-34d6-55219ccfbfa2@bugseng.com>
Date: Mon, 12 Jun 2023 11:34:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.7.12) Gecko/20050929
 Thunderbird/1.0.7 Fedora/1.0.7-1.1.fc4 Mnenhy/0.7.3.0
Subject: Re: [PATCH v2] docs/misra: new rules addition
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: julien@xen.org, andrew.cooper3@citrix.com, roger.pau@citrix.com,
 bertrand.marquis@arm.com, Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
References: <20230609174543.4067574-1-sstabellini@kernel.org>
 <a3229436-c714-ab2d-27f9-eac1455d3943@suse.com>
From: Roberto Bagnara <roberto.bagnara@bugseng.com>
In-Reply-To: <a3229436-c714-ab2d-27f9-eac1455d3943@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/06/23 09:33, Jan Beulich wrote:
> On 09.06.2023 19:45, Stefano Stabellini wrote:
>> @@ -133,6 +146,13 @@ existing codebase are work-in-progress.
>>          headers (xen/include/public/) are allowed to retain longer
>>          identifiers for backward compatibility.
>>   
>> +   * - `Rule 6.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_06_01.c>`_
>> +     - Required
>> +     - Bit-fields shall only be declared with an appropriate type
>> +     - In addition to the C99 types, we also consider appropriate types:
>> +       unsigned char, unsigned short, unsigned long, unsigned long long,
>> +       enum.
> 
> What about their signed equivalents? I'm surprised that I found only very
> few uses (in Arm insn decoding afaict), but they generally have a purpose.
> Are the uses we have (and new ones which may appear) intended to become
> deviations?

Explicitly signed integer types are all supported by GCC as well.
So they can be added to the list.

>> @@ -143,6 +163,12 @@ existing codebase are work-in-progress.
>>        - Octal constants shall not be used
>>        -
>>   
>> +   * - `Rule 7.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_07_02.c>`_
>> +     - Required
>> +     - A "u" or "U" suffix shall be applied to all integer constants
>> +       that are represented in an unsigned type
>> +     -
> 
> I continue to consider "represented in" problematic here without
> further qualification.

We should distinguish two things here.  The headline of Rule 7.2
is non negotiable: it is simply as it is.  As all headlines,
it is a compromise between conciseness and mnemonic value.
If what is wanted there is not the headline, then you can add
"implicitly" before "represented".  Or you may leave the headline
and add an explanatory note afterwards.

>> @@ -314,6 +340,11 @@ existing codebase are work-in-progress.
>>          used following a subsequent call to the same function
>>        -
>>   
>> +   * - Rule 21.21
>> +     - Required
>> +     - The Standard Library function system of <stdlib.h> shall not be used
>> +     -
> 
> Still no "inapplicable" note (whichever way it would be worded to also
> please Roberto)?

I am not the one to be pleased ;-)

But really, I don't follow: when you say the rule is inapplicable
your reasoning is, IIUC, "nobody would even dream using system() in Xen".
Which is exactly what the rule is asking.  If Xen adopts the rule,
tooling will make sure system() is not used, and seeing that the rule
is applied, assessors will be pleased.

