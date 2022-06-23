Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88467557C6F
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 15:04:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354982.582391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4MV1-00008G-Ef; Thu, 23 Jun 2022 13:03:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354982.582391; Thu, 23 Jun 2022 13:03:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4MV1-00006B-BQ; Thu, 23 Jun 2022 13:03:55 +0000
Received: by outflank-mailman (input) for mailman id 354982;
 Thu, 23 Jun 2022 13:03:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o4MV0-000065-A3
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 13:03:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4MUy-0005Ia-CV; Thu, 23 Jun 2022 13:03:52 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.0.239]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4MUy-0006Tr-4i; Thu, 23 Jun 2022 13:03:52 +0000
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
	bh=nc93QevzFFrvQG+OpgidGEp8N0UGZEg6+XCxC1OqZ+0=; b=rF7qsCcno9HEGVRv8+JeoVyjy5
	nm5g15ITUYaz2uQP3R//DARvU7EXE2ce9PMPJTD/jfXkCt/3uMdxfKUFwrRbEYNU6U7KRXysIZ20N
	PaaK6/kMV5M9G+/ItnkirkJWiFslxwGJRAqBRicA+JEoaaGPKKZQ1u+j0r4zMnrpBp9A=;
Message-ID: <de0ae18f-b0b7-c63c-ed03-d0260dfc4c1d@xen.org>
Date: Thu, 23 Jun 2022 14:03:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH] tools/xenstored: Harden corrupt()
To: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>
Cc: Julien Grall <jgrall@amazon.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20220623112407.13604-1-julien@xen.org>
 <d0de3b7b-fdb4-716c-227d-5fee024d8fd9@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <d0de3b7b-fdb4-716c-227d-5fee024d8fd9@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 23/06/2022 13:59, Jan Beulich wrote:
> On 23.06.2022 13:24, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> At the moment, corrupt() is neither checking for allocation failure
>> nor freeing the allocated memory.
>>
>> Harden the code by printing ENOMEM if the allocation failed and
>> free 'str' after the last use.
>>
>> This is not considered to be a security issue because corrupt() should
>> only be called when Xenstored thinks the database is corrupted. Note
>> that the trigger (i.e. a guest reliably provoking the call) would be
>> a security issue.
>>
>> Fixes: 06d17943f0cd ("Added a basic integrity checker, and some basic ability to recover from store")
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Is this something which would want queuing for backport?

I would say yes. There are a couple of more Xenstored patches I would 
consider for backporting:

fe9be76d880b tools/xenstore: fix error handling of check_store()
b977929d3646 tools/xenstore: fix hashtable_expand() zeroing new area

Who is taking care of tools backport nowadays?

Cheers,

-- 
Julien Grall

