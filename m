Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 672C137958F
	for <lists+xen-devel@lfdr.de>; Mon, 10 May 2021 19:27:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125407.236071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg9gg-0002xQ-7n; Mon, 10 May 2021 17:27:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125407.236071; Mon, 10 May 2021 17:27:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg9gg-0002v6-4p; Mon, 10 May 2021 17:27:22 +0000
Received: by outflank-mailman (input) for mailman id 125407;
 Mon, 10 May 2021 17:27:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lg9ge-0002uz-F6
 for xen-devel@lists.xenproject.org; Mon, 10 May 2021 17:27:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lg9gd-00027F-5t; Mon, 10 May 2021 17:27:19 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lg9gc-0000JB-Vw; Mon, 10 May 2021 17:27:19 +0000
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
	bh=kBChSxyk3jihcic0rYJXT6s+MBwS7r746fvzB2xyVvY=; b=YfpoD8VgPad51haxAFsAwLIXkP
	/Ck24h8bzrm7DOrB1otx8dlyYosKNTr2Tn3236gjpuknCKMHASunfravA9T1GIdtGuMQvFk4BbJnr
	Ctve4x2BEy7CW7cCMeESOzPsOJmLWpkyDqsVK1PVcN4bI03pbnTMpu+PZq+mPRDQZ+d8=;
Subject: Re: [PATCH] tools/xenstored: Prevent a buffer overflow in
 dump_state_node_perms()
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
References: <20210506161223.15984-1-julien@xen.org>
 <f9542104-b645-4d94-5aab-0854e4b54ff0@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <ec396bd6-c720-82c9-eceb-5f7ec466610f@xen.org>
Date: Mon, 10 May 2021 18:27:17 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <f9542104-b645-4d94-5aab-0854e4b54ff0@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 10/05/2021 08:49, Juergen Gross wrote:
> On 06.05.21 18:12, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> ASAN reported one issue when Live Updating Xenstored:
>>
>> =================================================================
>> ==873==ERROR: AddressSanitizer: stack-buffer-overflow on address 
>> 0x7ffc194f53e0 at pc 0x555c6b323292 bp 0x7ffc194f5340 sp 0x7ffc194f5338
>> WRITE of size 1 at 0x7ffc194f53e0 thread T0
>>      #0 0x555c6b323291 in dump_state_node_perms 
>> xen/tools/xenstore/xenstored_core.c:2468
>>      #1 0x555c6b32746e in dump_state_special_node 
>> xen/tools/xenstore/xenstored_domain.c:1257
>>      #2 0x555c6b32a702 in dump_state_special_nodes 
>> xen/tools/xenstore/xenstored_domain.c:1273
>>      #3 0x555c6b32ddb3 in lu_dump_state 
>> xen/tools/xenstore/xenstored_control.c:521
>>      #4 0x555c6b32e380 in do_lu_start 
>> xen/tools/xenstore/xenstored_control.c:660
>>      #5 0x555c6b31b461 in call_delayed 
>> xen/tools/xenstore/xenstored_core.c:278
>>      #6 0x555c6b32275e in main xen/tools/xenstore/xenstored_core.c:2357
>>      #7 0x7f95eecf3d09 in __libc_start_main ../csu/libc-start.c:308
>>      #8 0x555c6b3197e9 in _start (/usr/local/sbin/xenstored+0xc7e9)
>>
>> Address 0x7ffc194f53e0 is located in stack of thread T0 at offset 80 
>> in frame
>>      #0 0x555c6b32713e in dump_state_special_node 
>> xen/tools/xenstore/xenstored_domain.c:1232
>>
>>    This frame has 2 object(s):
>>      [32, 40) 'head' (line 1233)
>>      [64, 80) 'sn' (line 1234) <== Memory access at offset 80 
>> overflows this variable
>>
>> This is happening because the callers are passing a pointer to a variable
>> allocated on the stack. However, the field perms is a dynamic array, so
>> Xenstored will end up to read outside of the variable.
>>
>> Rework the code so the permissions are written one by one in the fd.
>>
>> Fixes: ed6eebf17d2c ("tools/xenstore: dump the xenstore state for live 
>> update")
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>

Committed.

Cheers,

-- 
Julien Grall

