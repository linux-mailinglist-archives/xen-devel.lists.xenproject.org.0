Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BD6268E14
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 16:43:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHphC-0005fR-H5; Mon, 14 Sep 2020 14:43:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIgq=CX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kHphB-0005fK-0p
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 14:43:05 +0000
X-Inumbo-ID: 858dfa4d-9ca9-4657-97fe-21072ccccc01
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 858dfa4d-9ca9-4657-97fe-21072ccccc01;
 Mon, 14 Sep 2020 14:43:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 48AC1AF52;
 Mon, 14 Sep 2020 14:43:18 +0000 (UTC)
Subject: Re: [PATCH] tools: Delete XEN_DOMCTL_disable_migrate
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 Juergen Gross <jgross@suse.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <20200911190618.14708-1-andrew.cooper3@citrix.com>
 <d234c429-a42a-e8e0-3ef3-c48c8263f543@suse.com>
 <4f887862-8f3c-4bbb-4fc5-96542ece4894@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a572fb73-d8e9-adec-dc63-af707f4af02d@suse.com>
Date: Mon, 14 Sep 2020 16:43:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <4f887862-8f3c-4bbb-4fc5-96542ece4894@citrix.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 14.09.2020 16:04, Andrew Cooper wrote:
> On 14/09/2020 09:43, Jan Beulich wrote:
>> On 11.09.2020 21:06, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/cpuid.c
>>> +++ b/xen/arch/x86/cpuid.c
>>> @@ -708,7 +708,8 @@ int init_domain_cpuid_policy(struct domain *d)
>>>      if ( !p )
>>>          return -ENOMEM;
>>>  
>>> -    if ( d->disable_migrate )
>>> +    /* The hardware domain can't migrate.  Give it ITSC if available. */
>>> +    if ( is_hardware_domain(d) )
>>>          p->extd.itsc = cpu_has_itsc;
>> ... why not include is_xenstore_domain() here that you remove from
>> ...
>>
>>> @@ -452,9 +451,6 @@ struct domain *domain_create(domid_t domid,
>>>          watchdog_domain_init(d);
>>>          init_status |= INIT_watchdog;
>>>  
>>> -        if ( is_xenstore_domain(d) )
>>> -            d->disable_migrate = true;
>> ... here? On the tool stack side the change here only deletes code,
>> i.e. I don't see you taking care of the default enabling there
>> either. Am I overlooking any logic that now causes the feature to
>> be requested for the xenstore domain without you needing to add
>> any code?
> 
> The toolstack (legitimately) has knowledge of nomigrate, and will even
> implicitly turn on ITSC as a side effect, but will also honour explicit
> requests to turn it on or off.

Okay, it this is the case then ...

>>> --- a/xen/include/public/domctl.h
>>> +++ b/xen/include/public/domctl.h
>>> @@ -730,11 +730,6 @@ struct xen_domctl_hvmcontext_partial {
>>>      XEN_GUEST_HANDLE_64(uint8) buffer;  /* OUT: buffer to write record into */
>>>  };
>>>  
>>> -/* XEN_DOMCTL_disable_migrate */
>>> -struct xen_domctl_disable_migrate {
>>> -    uint32_t disable; /* IN: 1: disable migration and restore */
>>> -};
>>> -
>>>  
>>>  /* XEN_DOMCTL_gettscinfo */
>>>  /* XEN_DOMCTL_settscinfo */
>>> @@ -1191,7 +1186,7 @@ struct xen_domctl {
>>>  #define XEN_DOMCTL_gethvmcontext_partial         55
>>>  #define XEN_DOMCTL_vm_event_op                   56
>>>  #define XEN_DOMCTL_mem_sharing_op                57
>>> -#define XEN_DOMCTL_disable_migrate               58
>>> +/* #define XEN_DOMCTL_disable_migrate            58 - Obsolete */
>>>  #define XEN_DOMCTL_gettscinfo                    59
>>>  #define XEN_DOMCTL_settscinfo                    60
>>>  #define XEN_DOMCTL_getpageframeinfo3             61
>>> @@ -1242,7 +1237,6 @@ struct xen_domctl {
>>>          struct xen_domctl_ioport_permission ioport_permission;
>>>          struct xen_domctl_hypercall_init    hypercall_init;
>>>          struct xen_domctl_settimeoffset     settimeoffset;
>>> -        struct xen_domctl_disable_migrate   disable_migrate;
>>>          struct xen_domctl_tsc_info          tsc_info;
>>>          struct xen_domctl_hvmcontext        hvmcontext;
>>>          struct xen_domctl_hvmcontext_partial hvmcontext_partial;
>> Deletion of sub-ops, just like their modification, requires the
>> interface version to get bumped if it wasn't already during a
>> release cycle. I know you dislike the underlying concept, but as
>> long as the interface version continues to exist (with its
>> present meaning) I'm afraid it needs bumping for any backwards-
>> incompatible change.
> 
> I can fix it on commit.  I don't waste time tracking whether it has had
> its conditional bump.

... with this taken care of
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

