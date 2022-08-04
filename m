Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BEC589F54
	for <lists+xen-devel@lfdr.de>; Thu,  4 Aug 2022 18:23:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380586.614800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJdco-0006CI-5n; Thu, 04 Aug 2022 16:23:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380586.614800; Thu, 04 Aug 2022 16:23:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJdco-00069v-2u; Thu, 04 Aug 2022 16:23:06 +0000
Received: by outflank-mailman (input) for mailman id 380586;
 Thu, 04 Aug 2022 16:23:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oJdcl-00069p-TK
 for xen-devel@lists.xenproject.org; Thu, 04 Aug 2022 16:23:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oJdcj-0008R2-Fh; Thu, 04 Aug 2022 16:23:01 +0000
Received: from [54.239.6.184] (helo=[10.7.237.15])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oJdcj-0007sR-9x; Thu, 04 Aug 2022 16:23:01 +0000
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
	bh=fSDtqr15Z5LAJw/KSpamennGcFRCaZ3Zfeq+wVx8ZjE=; b=nSINw/IzvN3WVzIFdYdWbMbS9i
	wyQC58a2AaU6XZ0JMpZwyYvoVYSf95rAOUHxOH6qKJ3zAdRQa/rvWfxKudj65BNhXEPaA0cefRmLZ
	d8xO6CnB8SYOV9p/iUrv2S/G/6/GWWZQz50nhZyPDjft9XePjqXYlaO/AuLCyqZ4AjN8=;
Message-ID: <7b71368c-25bc-9fa0-f8c7-3e85186c15cf@xen.org>
Date: Thu, 4 Aug 2022 17:22:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.0
Subject: Re: [xen-unstable test] 172089: regressions - FAIL
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: osstest service owner <osstest-admin@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <osstest-172089-mainreport@xen.org>
 <9a72a1ef-c332-7dd3-b84d-baf34f9d7d9f@xen.org>
 <d5f37740-aeee-8cb1-7377-a92d43fe1898@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <d5f37740-aeee-8cb1-7377-a92d43fe1898@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 03/08/2022 13:13, Jan Beulich wrote:
> On 03.08.2022 14:02, Julien Grall wrote:
>> On 03/08/2022 08:13, osstest service owner wrote:
>>> flight 172089 xen-unstable real [real]
>>> http://logs.test-lab.xenproject.org/osstest/logs/172089/
>>>
>>> Regressions :-(
>>>
>>> Tests which did not succeed and are blocking,
>>> including tests which could not be run:
>>>    build-i386-libvirt            6 libvirt-build            fail REGR. vs. 172073
>>>    build-amd64-libvirt           6 libvirt-build            fail REGR. vs. 172073
>>>    build-arm64-libvirt           6 libvirt-build            fail REGR. vs. 172073
>>
>> I was going to force this flight because of the libvirt issues. But...
>>
>>>    test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 12 debian-hvm-install fail REGR. vs. 172073
>>
>> ... this is not a test related to libvirt. Can one of the x86 folks
>> advise whether the issue is benign?
> 
> This test has been failing every now and then; whether for the same reason
> cannot be told anymore as the older logs are gone. I would therefore like
> to recommend to wait for the results of the next flight.

Thanks for the input. There is a new flight [1] where the only blocking 
issues are because of libvirt. So I will push that one.

Cheers,

[1] https://lore.kernel.org/all/osstest-172120-mainreport@xen.org/

-- 
Julien Grall

