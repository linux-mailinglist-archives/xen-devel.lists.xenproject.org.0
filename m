Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E389876BC46
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 20:23:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574468.899759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQu1U-0001xB-Ic; Tue, 01 Aug 2023 18:23:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574468.899759; Tue, 01 Aug 2023 18:23:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQu1U-0001tr-Ff; Tue, 01 Aug 2023 18:23:08 +0000
Received: by outflank-mailman (input) for mailman id 574468;
 Tue, 01 Aug 2023 18:23:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PUJK=DS=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qQu1T-0001tk-BQ
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 18:23:07 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 746a07b3-3098-11ee-8613-37d641c3527e;
 Tue, 01 Aug 2023 20:23:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 8BC9982853A7;
 Tue,  1 Aug 2023 13:23:03 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id XoBu06R2ebb9; Tue,  1 Aug 2023 13:23:02 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 59AC882853DF;
 Tue,  1 Aug 2023 13:23:02 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id oGYoZW4Pvb6j; Tue,  1 Aug 2023 13:23:02 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id D0D4C82853A7;
 Tue,  1 Aug 2023 13:23:01 -0500 (CDT)
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
X-Inumbo-ID: 746a07b3-3098-11ee-8613-37d641c3527e
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 59AC882853DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1690914182; bh=vVuA9sK/GcfstVkfqozkCI+BlEvlmi8R5qcN3jfU8M0=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=o1vhQOZKVOtzzCyoQltX3q4FyeFhIrOxoTpOjgmBtvy2ZGZflBNIhWNKozO6WApYF
	 y10jxpmw8p1KcFfLvn8C7lzyFwt/QemE82irZbNTG5OKz7q0J/ubq07mnY6sbxsDnB
	 Z6BzbJ8cS8MM05c7YAdGYHoKNfrhN3T7u93XyON8=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <3b492bff-6ef6-f242-7d74-206a599afaab@raptorengineering.com>
Date: Tue, 1 Aug 2023 13:23:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/5] xen/ppc: Switch to medium PIC code model
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1690579561.git.sanastasio@raptorengineering.com>
 <335ce2a18f8cce679dd8b30d11560989131b4337.1690579561.git.sanastasio@raptorengineering.com>
 <0b2cb188-bcb1-1ed3-1181-9e1d0d98ab4a@suse.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <0b2cb188-bcb1-1ed3-1181-9e1d0d98ab4a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/1/23 7:20 AM, Jan Beulich wrote:
> On 28.07.2023 23:35, Shawn Anastasio wrote:
>> @@ -11,16 +13,19 @@ ENTRY(start)
>>      FIXUP_ENDIAN
>>  
>>      /* set up the TOC pointer */
>> -    LOAD_IMM32(%r2, .TOC.)
>> +    bcl	    20, 31, .+4
>> +1:  mflr    %r12
>> +    addis   %r2, %r12, .TOC.-1b@ha
>> +    addi    %r2, %r2, .TOC.-1b@l
>>  
>>      /* set up the initial stack */
>> -    LOAD_IMM32(%r1, cpu0_boot_stack)
>> +    LOAD_REG_ADDR(%r1, cpu0_boot_stack)
> 
> Question: Would perhaps make sense to use %sp and %rtoc in place of
> %r1 and %r2 (not just here of course)?

In my opinion, usage of the aliased register names ends up making the
code less clear.

