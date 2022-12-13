Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E81B164B28B
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 10:41:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460334.718221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p51n6-0002Fz-Q4; Tue, 13 Dec 2022 09:41:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460334.718221; Tue, 13 Dec 2022 09:41:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p51n6-0002DJ-NP; Tue, 13 Dec 2022 09:41:36 +0000
Received: by outflank-mailman (input) for mailman id 460334;
 Tue, 13 Dec 2022 09:41:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p51n5-0002DD-5B
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 09:41:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p51n4-0002jx-1r; Tue, 13 Dec 2022 09:41:34 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=[192.168.2.179]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p51n3-00018G-ST; Tue, 13 Dec 2022 09:41:34 +0000
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
	bh=f+XyvhETo3/jm4R9BjD5tXQOsytKqvYrdDnJWgjv90I=; b=YJYjGg+37vz+/rWJHezXHxmcdJ
	T8D3tFSLbRXPJQ913eODxm9ak3SB2XU5jaEaEE3kAfW7puzV/k7eS9h5tn1R5M6jlPZwl5jBR392C
	wy6hDFOoLSsEWNzEYIp765esxLNK5nc8J0/62CU4z4BAaaBbQAeB7LpKRxDFcxW3rugI=;
Message-ID: <2aad994c-8b4e-1521-a718-cbb807c18360@xen.org>
Date: Tue, 13 Dec 2022 09:41:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 15/20] tools/xenstore: make domain_is_unprivileged() an
 inline function
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20221101152842.4257-1-jgross@suse.com>
 <20221101152842.4257-16-jgross@suse.com>
 <872b4aae-34c1-be54-be58-6738ebd0537c@xen.org>
 <96e98cc3-71fd-13c5-ec0c-be9cdafc3678@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <96e98cc3-71fd-13c5-ec0c-be9cdafc3678@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 13/12/2022 07:57, Juergen Gross wrote:
> On 01.12.22 23:05, Julien Grall wrote:
>> Hi Juergen,
>>
>> On 01/11/2022 15:28, Juergen Gross wrote:
>>> clang is complaining about a NULL dereference for constructs like:
>>>
>>>    domain_is_unprivileged(conn) ? conn->in : NULL
>>
>> I have just build xenstored with clang 11 and didn't get a complain. 
>> So can you provide more details?
> 
> It was reported by Edwin during development of the XSA series:
> 
> On 11/08/2022 19:01, Edwin Torok wrote:
>  > xenstored_watch.c:152:39: warning: Access to field 'in' results in a 
> dereference of a null pointer (loaded from variable 'conn') 
> [core.NullDereference]
>  >          req = domain_is_unprivileged(conn) ? conn->in : NULL;
>  >                                               ^~~~~~~~
>  > 1 warning generated.
>  >
>  > clang 14 says this is a NULL dereference ...
> 
> You even responded to that report, BTW.

I respond to a lot of e-mails and don't necessarily remember all of them 
:). That's why we have commit message.

In this case, you want to mention the compiler version in the commit 
message.

With that:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

