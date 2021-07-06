Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFCF3BD666
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 14:32:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.151217.279485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0kEo-0003Rm-Sk; Tue, 06 Jul 2021 12:31:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151217.279485; Tue, 06 Jul 2021 12:31:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0kEo-0003P7-Nl; Tue, 06 Jul 2021 12:31:42 +0000
Received: by outflank-mailman (input) for mailman id 151217;
 Tue, 06 Jul 2021 12:31:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m0kEn-0003Oz-RY
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 12:31:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m0kEh-0000fl-Iu; Tue, 06 Jul 2021 12:31:35 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m0kEh-0006Sm-Bk; Tue, 06 Jul 2021 12:31:35 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=IC733MwopdlLdAIvN9suHiWX4yh27vRvQRZgZQ+e8Ak=; b=g4DtXmS6D5CvZHNxIZcA0A9sOQ
	TkvK121Va0tsJ1noTNovpXqAPkr7u++PR96AM1OFjooJptFOvpDJhno7fJHvac90EbzDmvpkkywhe
	JBjZIC3+15laGeG4Mk1yFxQtrG0y3nnihoobbmjq89/s2UTmg3n4Nwzkrq7n2RGiPGZ0=;
Subject: Re: [PATCH v4] arm64: Change type of hsr, cpsr, spsr_el1 to uint64_t
To: Michal Orzel <michal.orzel@arm.com>, Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, bertrand.marquis@arm.com
References: <20210705063952.25629-1-michal.orzel@arm.com>
 <20210706140010.4b8802d9.olaf@aepfle.de>
 <5d4ebedb-ebba-f586-f377-32467213369b@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <10e11e44-b643-b214-57d6-db4499e19da7@xen.org>
Date: Tue, 6 Jul 2021 13:31:32 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <5d4ebedb-ebba-f586-f377-32467213369b@arm.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 06/07/2021 13:30, Michal Orzel wrote:
> Hi,
> 
> On 06.07.2021 14:00, Olaf Hering wrote:
>> Am Mon,  5 Jul 2021 08:39:52 +0200
>> schrieb Michal Orzel <michal.orzel@arm.com>:
>>
>>> Modify type of hsr, cpsr, spsr_el1 to uint64_t.
>>
>> I think this is now commit 918b8842a852e0e7446286f546724b1c63c56c66, which fails to build:
>>
>> ...
>> diff -u reference.size tmp.size
>> --- reference.size      2021-06-29 10:50:32.237518309 +0200
>> +++ tmp.size    2021-07-06 13:58:19.052592351 +0200
>> @@ -4,8 +4,8 @@
>>   start_info                |       -       -    1112    1168
>>   trap_info                 |       -       -       8      16
>>   cpu_user_regs             |       -       -      68     200
>> -vcpu_guest_core_regs      |     304     304       -       -
>> -vcpu_guest_context        |     344     344    2800    5168
>> +vcpu_guest_core_regs      |     312     312       -       -
>> +vcpu_guest_context        |     352     352    2800    5168
>>   arch_vcpu_info            |       0       0      24      16
>>   vcpu_time_info            |      32      32      32      32
>>   vcpu_info                 |      48      48      64      64
>> gmake[2]: *** [Makefile:24: check-headers] Error 1
>>
>> osstest may catch this error as well.
>>
>> Olaf
>>
> 
> Where does this report come from so that I can investigate it?
> Locally I can build this patch on arm64,arm32,x86 without any issues.

This is coming from the tools/include/xen-foreign. I could reproduce it 
with a:

make tools

I am currently writing a patch for it. I will send it once I have tested it.

Cheers,

> 
> Cheers,
> Michal
> 

-- 
Julien Grall

