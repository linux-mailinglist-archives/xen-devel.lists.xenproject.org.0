Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AECF7F1414
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 14:14:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.636717.992427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r546D-0001Je-VI; Mon, 20 Nov 2023 13:14:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 636717.992427; Mon, 20 Nov 2023 13:14:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r546D-0001HX-Rj; Mon, 20 Nov 2023 13:14:01 +0000
Received: by outflank-mailman (input) for mailman id 636717;
 Mon, 20 Nov 2023 13:13:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4RyQ=HB=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1r546B-0001HR-Tc
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 13:13:59 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa55013e-87a6-11ee-98df-6d05b1d4d9a1;
 Mon, 20 Nov 2023 14:13:58 +0100 (CET)
Received: from [10.253.41.90] (unknown [160.78.253.159])
 by support.bugseng.com (Postfix) with ESMTPSA id 078794EE0739;
 Mon, 20 Nov 2023 14:13:57 +0100 (CET)
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
X-Inumbo-ID: aa55013e-87a6-11ee-98df-6d05b1d4d9a1
Message-ID: <b481a966-4f29-4b05-8246-d3f1eec19d0c@bugseng.com>
Date: Mon, 20 Nov 2023 14:13:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 3/5] xen/sort: address violations of MISRA C:2012 Rule
 8.2
Content-Language: en-US, it
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1700209834.git.federico.serafini@bugseng.com>
 <de68f8220fbb97ae6a3382138c23e81d0988a472.1700209834.git.federico.serafini@bugseng.com>
 <19d887e6-8c07-43f3-a2de-88ce0a0c99ba@suse.com>
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <19d887e6-8c07-43f3-a2de-88ce0a0c99ba@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/11/23 10:02, Jan Beulich wrote:
> On 17.11.2023 09:40, Federico Serafini wrote:
>> --- a/xen/include/xen/sort.h
>> +++ b/xen/include/xen/sort.h
>> @@ -23,8 +23,8 @@
>>   extern gnu_inline
>>   #endif
>>   void sort(void *base, size_t num, size_t size,
>> -          int (*cmp)(const void *, const void *),
>> -          void (*swap)(void *, void *, size_t))
>> +          int (*cmp)(const void *key, const void *elem),
> 
> Why "key" and "elem" here, but ...
> 
>> +          void (*swap)(void *a, void *b, size_t size))
> 
> ... "a" and "b" here? The first example of users of sort() that I'm
> looking at right now (x86/extable.c) is consistent in its naming.
> 

On the Arm side there are {cmp,swap}_memory_node() and
{cmp,swap}_mmio_handler(): "key"/"elem" are used for the comparison
and "_a"/"_b" for the swap.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

