Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BE07888DE
	for <lists+xen-devel@lfdr.de>; Fri, 25 Aug 2023 15:45:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590925.923287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZX7b-0005Ep-AL; Fri, 25 Aug 2023 13:45:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590925.923287; Fri, 25 Aug 2023 13:45:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZX7b-0005CY-7Z; Fri, 25 Aug 2023 13:45:07 +0000
Received: by outflank-mailman (input) for mailman id 590925;
 Fri, 25 Aug 2023 13:45:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qZX7a-0005CS-2d
 for xen-devel@lists.xenproject.org; Fri, 25 Aug 2023 13:45:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qZX7V-0002tp-EW; Fri, 25 Aug 2023 13:45:01 +0000
Received: from [54.239.6.180] (helo=[192.168.0.85])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qZX7V-0003Yb-7T; Fri, 25 Aug 2023 13:45:01 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=Y6m1EG/T/xNHxnmYnszI9uJvl42Pbk9qbihQnNAJ2RY=; b=PzKylNIj0y0ZHqcC2KuMs+f9CK
	ITqdDon3jYG/QLRymfgeTrxw3Ta1GLDlob+RdsLG6pb+oUaWIelYx7btARdr+tCSqzeXVgy8Wk0jo
	87d0Mg0NxpJu9r6b14BDYIASY8FMt5hRBKktSNFULwNOX4w8OT/SIF6WQf3lSTtvHJIE=;
Message-ID: <3831607e-499e-4a48-9d11-76dbd8948fdd@xen.org>
Date: Fri, 25 Aug 2023 14:44:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/misra: add rules 10.1 10.2 10.3 10.4
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com,
 george.dunlap@citrix.com, bertrand.marquis@arm.com,
 nicola.vetrini@bugseng.com, roberto.bagnara@bugseng.com,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
References: <20230823231451.2989262-1-sstabellini@kernel.org>
 <4cf3053a-504e-514d-e940-a47e9498b1c4@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <4cf3053a-504e-514d-e940-a47e9498b1c4@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 25/08/2023 14:40, Jan Beulich wrote:
> On 24.08.2023 01:14, Stefano Stabellini wrote:
>> --- a/docs/misra/rules.rst
>> +++ b/docs/misra/rules.rst
>> @@ -318,6 +318,58 @@ maintainers if you want to suggest a change.
>>        - An element of an object shall not be initialized more than once
>>        -
>>   
>> +   * - `Rule 10.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_10_01.c>`_
>> +     - Required
>> +     - Operands shall not be of an inappropriate essential type
>> +     - The following are allowed:
>> +         - Value-preserving conversions of integer constants
>> +         - Bitwise and, or, xor, one's complement, bitwise and assignment,
>> +           bitwise or assignment, bitwise xor assignment (bitwise and, or, xor
>> +           are safe on non-negative integers; also Xen assumes two's complement
>> +           representation)
>> +         - Left shift, right shift, left shift assignment, right shift
>> +           assignment (see C-language-toolchain.rst for assumptions on
>> +           compilers' extensions)
> 
> Is "assumptions" the right term here? We don't just assume these are there,
> we actually checked their doc and behavior. Maybe simply "uses of" instead?
> 
>> +         - Implicit conversions to boolean for logical operators' arguments
> 
> What is "logical operators" here? Perhaps this wants to be "conditionals"
> instead, to cover all of ?:, if(), while(), for() (did I forget any?), of
> which only the first is an operator?
> 
>> +   * - `Rule 10.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_10_03.c>`_
>> +     - Required
>> +     - The value of an expression shall not be assigned to an object
>> +       with a narrower essential type or of a dierent essential type
> 
> Nit: ff missing?
> 
>> +       category
>> +     - Please beware that this rule has many violations in the Xen
>> +       codebase today, and its adoption is aspirational. However, when
>> +       submitting new patches please try to decrease the number of
>> +       violations when possible.
>> +
>> +       gcc has a helpful warning that can help you spot and remove
>> +       violations of this kind: conversion. For instance, you can use
>> +       it as follows:
>> +
>> +       cd xen; CFLAGS="-Wconversion -Wno-error=sign-conversion -Wno-error=conversion" make
> 
> Maybe slightly shorter as
> 
> CFLAGS="-Wconversion -Wno-error=sign-conversion -Wno-error=conversion" make -C xen
> 
> ?

+1. It also means that the command can be called multiple time without 
having to type 'cd -' between.

Cheers,

-- 
Julien Grall

