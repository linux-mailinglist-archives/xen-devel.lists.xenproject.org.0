Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E74733B0A
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 22:40:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550443.859537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qAGEX-0003rX-Ff; Fri, 16 Jun 2023 20:39:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550443.859537; Fri, 16 Jun 2023 20:39:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qAGEX-0003oC-Cg; Fri, 16 Jun 2023 20:39:49 +0000
Received: by outflank-mailman (input) for mailman id 550443;
 Fri, 16 Jun 2023 20:39:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qAGEW-0003o6-Bp
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 20:39:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qAGEW-0007Fs-3t; Fri, 16 Jun 2023 20:39:48 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.4.107]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qAGEV-00065F-Ub; Fri, 16 Jun 2023 20:39:48 +0000
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
	bh=VL+cRYrEmHp8kTUaslrsVojaQapY5xH6BuFlfiSxutw=; b=nQa3lgJq0IF/WrSNKiCSeSszHm
	U0DdXIQCx05omRXlN51ke3QvZkx4QDpy0hLS5EE8xy9YWrkk1OIso1wEmKRSBn27SrTamRRObvInJ
	uq61dJoJaRvP9wMpZwtAvRJjjbBAW/Sh94Rw+UCe2EmP3gBD++W7non+vpn+kbg0pDEU=;
Message-ID: <c14fed22-2bca-a39d-81bb-5901447e632f@xen.org>
Date: Fri, 16 Jun 2023 21:39:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v4 2/4] xen: Add files needed for minimal ppc64le build
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <cover.1686936278.git.sanastasio@raptorengineering.com>
 <97a72e26edafb1d7b3a583755f015d04066c1e53.1686936278.git.sanastasio@raptorengineering.com>
 <8383dd1a-064c-17c9-bb7f-4509518b9b42@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <8383dd1a-064c-17c9-bb7f-4509518b9b42@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 16/06/2023 21:24, Andrew Cooper wrote:
>> --- /dev/null
>> +++ b/xen/arch/ppc/ppc64/head.S
>> @@ -0,0 +1,27 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +
>> +.section .text.header, "ax", %progbits
>> +
>> +ENTRY(start)
>> +    /*
>> +     * Depending on how we were booted, the CPU could be running in either
>> +     * Little Endian or Big Endian mode. The following trampoline from Linux
>> +     * cleverly uses an instruction that encodes to a NOP if the CPU's
>> +     * endianness matches the assumption of the assembler (LE, in our case)
>> +     * or a branch to code that performs the endian switch in the other case.
>> +     */
>> +    tdi 0, 0, 0x48    /* Reverse endian of b . + 8          */
>> +    b . + 44          /* Skip trampoline if endian is good  */
>> +    .long 0xa600607d  /* mfmsr r11                          */
>> +    .long 0x01006b69  /* xori r11,r11,1                     */
>> +    .long 0x00004039  /* li r10,0                           */
>> +    .long 0x6401417d  /* mtmsrd r10,1                       */
>> +    .long 0x05009f42  /* bcl 20,31,$+4                      */
>> +    .long 0xa602487d  /* mflr r10                           */
>> +    .long 0x14004a39  /* addi r10,r10,20                    */
>> +    .long 0xa6035a7d  /* mtsrr0 r10                         */
>> +    .long 0xa6037b7d  /* mtsrr1 r11                         */
>> +    .long 0x2400004c  /* rfid                               */
>> +
>> +    /* Now that the endianness is confirmed, continue */
>> +1:  b 1b
> 
> .size start, . - start
> .type start, %function

Shouldn't we introduce ENDPROC()/END() to avoid open-coding these two 
lines everywhere?

Cheers,

-- 
Julien Grall

