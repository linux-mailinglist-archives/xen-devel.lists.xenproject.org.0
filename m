Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 063224C423A
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 11:25:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278965.476458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNXmT-0006jJ-5L; Fri, 25 Feb 2022 10:24:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278965.476458; Fri, 25 Feb 2022 10:24:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNXmT-0006hW-1O; Fri, 25 Feb 2022 10:24:57 +0000
Received: by outflank-mailman (input) for mailman id 278965;
 Fri, 25 Feb 2022 10:24:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nNXmR-0006hQ-DH
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 10:24:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nNXmP-0007Kd-V0; Fri, 25 Feb 2022 10:24:53 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.31.13]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nNXmP-0002GR-P2; Fri, 25 Feb 2022 10:24:53 +0000
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
	bh=N1UUDo7gtYWrVku021KqM8cTfVxWRdNiS3Bd0+hOgho=; b=aisKRc4lbR3WJIJKem/9EjoxIk
	TOkAsK3Gxbj9yi1YqjVQvxMml0c3L0tdZQfoesKqZnFUM8l1yu0ToSvss/ZkK3mkoepspyk9V5eXz
	HGgkgISpSJqSLIzUaqpi+AYIp9VQ8WQv2Xam7xvW2wNpHNqoAJBHHKwrJZaG9QJ4yiDE=;
Message-ID: <2295bb1c-6298-75b2-5f51-80bf114e365f@xen.org>
Date: Fri, 25 Feb 2022 10:24:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v2 2/2] xen/include/public: deprecate GNTTABOP_transfer
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
References: <20220203131418.1319-1-jgross@suse.com>
 <20220203131418.1319-2-jgross@suse.com>
 <a35bb9ba-e2be-f73e-9272-906bc09d9b6e@xen.org>
 <93e50bc4-6e53-b753-c520-7d1d0a5a5f5a@suse.com>
 <7ca05a74-6b65-f9cb-f524-28d700a7d0e4@suse.com>
 <78543fe5-1dde-41b8-e28d-de2cf22fc87f@xen.org>
 <cade3f06-4f25-07d6-3090-08a6487ba298@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <cade3f06-4f25-07d6-3090-08a6487ba298@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 25/02/2022 08:12, Jan Beulich wrote:
> On 24.02.2022 23:55, Julien Grall wrote:
>> On 16/02/2022 09:29, Jan Beulich wrote:
>>> On 16.02.2022 08:20, Juergen Gross wrote:
>>>> On 15.02.22 22:13, Julien Grall wrote:
>>>>> As a side note, should we also update SUPPORT.md?
>>>>
>>>> Good question.
>>>
>>> I'm not sure here either - talking about individual hypercall sub-ops
>>> seems overly small granularity to me for this kind of doc. Plus I
>>> don't view deprecation and de-supporting as the same thing. The latter
>>> would mean to render unsupported any old XenoLinux which may still be
>>> in use, all of the sudden.
>>
>> I understand this would result to unsupport some old OSes (not clear how
>> old). However, from what Juergen said this feature is untested.
>>
>> To me it sound like we are not confident that we could security support
>> this feature.
>>
>> So I am not sure to understand why we only want to deprecate it.
> 
> Not sure what to say: Rendering unsupported however old guests is not
> a nice step. Hence my concern (which isn't an outright objection).

In the past we have removed support for feature we deemed unsafe to use 
and it would require effort to secure it. This is despite the fact that 
it may be used in production (e.g. PV devices, qemu trad...).

So I think the question here is really, do you think we can sensibly 
security support GNTTABOP_transfer?

Cheers,

-- 
Julien Grall

