Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2396177B834
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 14:07:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583591.913840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVWLd-0005xP-6s; Mon, 14 Aug 2023 12:07:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583591.913840; Mon, 14 Aug 2023 12:07:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVWLd-0005uz-3t; Mon, 14 Aug 2023 12:07:01 +0000
Received: by outflank-mailman (input) for mailman id 583591;
 Mon, 14 Aug 2023 12:06:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dnfx=D7=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qVWLb-0005ut-CW
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 12:06:59 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 11316576-3a9b-11ee-b288-6b7b168915f2;
 Mon, 14 Aug 2023 14:06:58 +0200 (CEST)
Received: from [192.168.1.15] (host-79-55-201-67.retail.telecomitalia.it
 [79.55.201.67])
 by support.bugseng.com (Postfix) with ESMTPSA id 34CE04EE0737;
 Mon, 14 Aug 2023 14:06:57 +0200 (CEST)
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
X-Inumbo-ID: 11316576-3a9b-11ee-b288-6b7b168915f2
Message-ID: <3c7728ea-f0b4-604b-db4e-5c983e8b776e@bugseng.com>
Date: Mon, 14 Aug 2023 14:06:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH] xen/hypercalls: address violations of MISRA C:2012
 Rule 8.3
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>
References: <5500643d99b315aa4344e5e3a833e6efa9a0413f.1691737296.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2308111528510.2127516@ubuntu-linux-20-04-desktop>
 <6fd6cc67-3ec2-d811-17c4-02845f62042b@suse.com>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <6fd6cc67-3ec2-d811-17c4-02845f62042b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/08/23 09:14, Jan Beulich wrote:
> On 12.08.2023 00:30, Stefano Stabellini wrote:
>> On Fri, 11 Aug 2023, Federico Serafini wrote:
>>> --- a/xen/include/hypercall-defs.c
>>> +++ b/xen/include/hypercall-defs.c
>>> @@ -107,11 +107,16 @@ defhandle: physdev_op_compat_t
>>>   prefix: do PREFIX_hvm PREFIX_compat PREFIX_do_arm
>>>   physdev_op(int cmd, void *arg)
>>>   
>>> -prefix: do PREFIX_hvm PREFIX_compat
>>> +prefix: do PREFIX_hvm
>>>   #if defined(CONFIG_GRANT_TABLE) || defined(CONFIG_PV_SHIM)
>>>   grant_table_op(unsigned int cmd, void *uop, unsigned int count)
>>>   #endif
>>>   
>>> +prefix: PREFIX_compat
>>> +#if defined(CONFIG_GRANT_TABLE) || defined(CONFIG_PV_SHIM)
>>> +grant_table_op(unsigned int cmd, void *cmp_uop, unsigned int count)
>>> +#endif
>>
>> Everything checks out, so:
>>
>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>>
>> The other changes are uncontroversial. This one about splitting out the
>> compat version of grant_table_op is not great. I wonder if it would be
>> better to rename cmp_uop to uop in xen/common/compat/grant_table.c. I'll
>> let Jan and the others decide I am OK either way.
> 
> Would there be anything wrong with instead renaming compat_grant_table_op()'s
> respective parameter?
> 
> Jan

As far as I know, there would be nothing wrong with MISRA.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

