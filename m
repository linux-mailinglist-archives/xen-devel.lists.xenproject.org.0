Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F193A6C7C
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jun 2021 18:55:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.141729.261697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsprH-0002Sz-60; Mon, 14 Jun 2021 16:54:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 141729.261697; Mon, 14 Jun 2021 16:54:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsprH-0002Qj-31; Mon, 14 Jun 2021 16:54:43 +0000
Received: by outflank-mailman (input) for mailman id 141729;
 Mon, 14 Jun 2021 16:54:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lsprG-0002Qd-31
 for xen-devel@lists.xenproject.org; Mon, 14 Jun 2021 16:54:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lsprF-0000nQ-UV; Mon, 14 Jun 2021 16:54:41 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lsprF-0007UN-NO; Mon, 14 Jun 2021 16:54:41 +0000
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
	MIME-Version:Date:Message-ID:References:Cc:To:From:Subject;
	bh=urDkAB80A1heHPQyL7ADYzlwiCB93nhY3SG2xm4m4h8=; b=zm+UbbJrSgBidipqLPHMJPE3z5
	e3IXlvPQfVeFK916vaSXHozBTWFSOFNp5bDun1yGgVC5BaNwv4GUY1n7gT+OcwIDB15N0kCLDkHtC
	WjM0ver3vYAHZcWbKL0JRp7CwPntwjlFu6w6qnc3a7o73CjH7Xjhm2qGyyr4uRNesCFI=;
Subject: Re: [PATCH v2] Arm: avoid .init.data to be marked as executable
From: Julien Grall <julien@xen.org>
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
References: <5c173e92-f615-c95a-21a2-5c894727414d@suse.com>
 <74fbf731-59f2-0b2e-8707-142091a5876d@xen.org>
Message-ID: <d4406c77-040f-d70d-b356-0020c82bc624@xen.org>
Date: Mon, 14 Jun 2021 18:54:39 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <74fbf731-59f2-0b2e-8707-142091a5876d@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 14/06/2021 15:54, Julien Grall wrote:
> Hi Jan,
> 
> On 14/06/2021 15:52, Jan Beulich wrote:
>> This confuses disassemblers, at the very least. Move
>> .altinstr_replacement to .init.text. The previously redundant ALIGN()
>> now gets converted to page alignment, such that the hypervisor mapping
>> won't have this as executable (it'll instead get mapped r/w, which I'm
>> told is intended to be adjusted at some point).
>>
>> Note that for the actual patching logic's purposes this part of
>> .init.text _has_ to live after _einittext (or before _sinittext), or
>> else branch_insn_requires_update() would produce wrong results.
>>
>> Also, to have .altinstr_replacement have consistent attributes in the
>> object files, add "x" to the one instance where it was missing.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Julien Grall <jgrall@amazon.com>

Comitted.

Cheers,

-- 
Julien Grall

