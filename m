Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1F62207BF
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 10:48:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvd4W-0006GD-9Z; Wed, 15 Jul 2020 08:47:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9G22=A2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jvd4U-0006G8-W4
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 08:47:23 +0000
X-Inumbo-ID: cc1d5cf8-c677-11ea-bca7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cc1d5cf8-c677-11ea-bca7-bc764e2007e4;
 Wed, 15 Jul 2020 08:47:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5921CAE65;
 Wed, 15 Jul 2020 08:47:24 +0000 (UTC)
Subject: Re: [PATCH v2 5/7] x86: generalize padding field handling
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <bb6a96c6-b6b1-76ff-f9db-10bec0fb4ab1@suse.com>
 <83274416-2812-53c9-f8cb-23ebdf73782e@suse.com>
 <20200714142948.GK7191@Air-de-Roger>
 <a319e308-9cf3-52dc-1883-fe749e3c5629@suse.com>
 <20200715083441.GR7191@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cf99e680-c870-bb7c-8513-dc5b17595afe@suse.com>
Date: Wed, 15 Jul 2020 10:47:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200715083441.GR7191@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 15.07.2020 10:34, Roger Pau Monné wrote:
> On Wed, Jul 15, 2020 at 08:36:10AM +0200, Jan Beulich wrote:
>> On 14.07.2020 16:29, Roger Pau Monné wrote:
>>> On Wed, Jul 01, 2020 at 12:27:37PM +0200, Jan Beulich wrote:
>>>> --- a/xen/common/compat/memory.c
>>>> +++ b/xen/common/compat/memory.c
>>>> @@ -354,10 +354,13 @@ int compat_memory_op(unsigned int cmd, X
>>>>                  return -EFAULT;
>>>>  
>>>>  #define XLAT_vnuma_topology_info_HNDL_vdistance_h(_d_, _s_)		\
>>>> +            case XLAT_vnuma_topology_info_vdistance_pad:                \
>>>>              guest_from_compat_handle((_d_)->vdistance.h, (_s_)->vdistance.h)
>>>>  #define XLAT_vnuma_topology_info_HNDL_vcpu_to_vnode_h(_d_, _s_)		\
>>>> +            case XLAT_vnuma_topology_info_vcpu_to_vnode_pad:            \
>>>>              guest_from_compat_handle((_d_)->vcpu_to_vnode.h, (_s_)->vcpu_to_vnode.h)
>>>>  #define XLAT_vnuma_topology_info_HNDL_vmemrange_h(_d_, _s_)		\
>>>> +            case XLAT_vnuma_topology_info_vmemrange_pad:                \
>>>>              guest_from_compat_handle((_d_)->vmemrange.h, (_s_)->vmemrange.h)
>>>
>>> I find this quite ugly, would it be better to just handle them with a
>>> default case in the XLAT_ macros?
>>
>> Default cases explicitly do not get added to be able to spot missing
>> case labels, as most compilers will warn about such when the controlling
>> expression is of enum type.
> 
> As you say on the comment above, ignoring those for translation
> macros would be better, and would avoid the ugliness of having to add
> the _pad cases here.

Ah, yes, if the supposed adjustment would also suppress the generation
of respective enumerators.

Jan

