Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E5A76B609
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 15:40:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574200.899435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQpbK-000573-8C; Tue, 01 Aug 2023 13:39:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574200.899435; Tue, 01 Aug 2023 13:39:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQpbK-00054j-4y; Tue, 01 Aug 2023 13:39:50 +0000
Received: by outflank-mailman (input) for mailman id 574200;
 Tue, 01 Aug 2023 13:39:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gjSu=DS=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qQpbJ-00054d-HL
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 13:39:49 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1950b4e-3070-11ee-8613-37d641c3527e;
 Tue, 01 Aug 2023 15:39:47 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 33C4A4EE0737;
 Tue,  1 Aug 2023 15:39:47 +0200 (CEST)
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
X-Inumbo-ID: e1950b4e-3070-11ee-8613-37d641c3527e
MIME-Version: 1.0
Date: Tue, 01 Aug 2023 15:39:47 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v2 1/3] xen/common: address MISRA C:2012 Rule 5.3
In-Reply-To: <3c29439b-cfb8-68d0-8677-91ba897f5e7e@suse.com>
References: <cover.1690893696.git.nicola.vetrini@bugseng.com>
 <a2ec33d23fbc956d6b84e3736ff7f09549ab85b6.1690893696.git.nicola.vetrini@bugseng.com>
 <3c29439b-cfb8-68d0-8677-91ba897f5e7e@suse.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <b8d874f18ca1b97d3132ff72a0841e32@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 01/08/2023 15:33, Jan Beulich wrote:
> On 01.08.2023 14:47, Nicola Vetrini wrote:
>> --- a/xen/common/compat/memory.c
>> +++ b/xen/common/compat/memory.c
>> @@ -81,6 +81,7 @@ int compat_memory_op(unsigned int cmd, 
>> XEN_GUEST_HANDLE_PARAM(void) compat)
>>              struct compat_memory_exchange xchg;
>>              struct compat_add_to_physmap atp;
>>              struct compat_add_to_physmap_batch atpb;
>> +            struct compat_remove_from_physmap rmfp;
>>              struct compat_vnuma_topology_info vnuma;
>>              struct compat_mem_access_op mao;
>>              struct compat_mem_acquire_resource mar;
>> @@ -321,12 +322,10 @@ int compat_memory_op(unsigned int cmd, 
>> XEN_GUEST_HANDLE_PARAM(void) compat)
>> 
>>          case XENMEM_remove_from_physmap:
>>          {
>> -            struct compat_remove_from_physmap cmp;
>> -
>> -            if ( copy_from_guest(&cmp, compat, 1) )
>> +            if ( copy_from_guest(&cmp.rmfp, compat, 1) )
>>                  return -EFAULT;
>> 
>> -            XLAT_remove_from_physmap(nat.xrfp, &cmp);
>> +            XLAT_remove_from_physmap(nat.xrfp, &cmp.rmfp);
> 
> Is there a reason not to use the same name in the compat union as is
> used in the native one, like all other members do?
> 

No, I just didn't notice there was a native remove_from_physmap field
when choosing the name.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

