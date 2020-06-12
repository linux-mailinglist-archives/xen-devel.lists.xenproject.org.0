Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A321F75D0
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 11:20:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjfq0-0004Il-OI; Fri, 12 Jun 2020 09:19:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=liIz=7Z=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jjfpz-0004If-Cw
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 09:18:59 +0000
X-Inumbo-ID: be3d291e-ac8d-11ea-bb8b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id be3d291e-ac8d-11ea-bb8b-bc764e2007e4;
 Fri, 12 Jun 2020 09:18:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DF29AADC5;
 Fri, 12 Jun 2020 09:18:59 +0000 (UTC)
Subject: Re: Kexec and libxenctlr.so
To: Julien Grall <julien@xen.org>, Julien Grall <jgrall@amazon.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>, "wl@xen.org" <wl@xen.org>,
 daniel.kiper@oracle.com
References: <7a88218d-981e-6583-15a5-3fcaffb05294@amazon.com>
 <261293b1-f4c9-e41d-0c76-cd47fe5c0dc2@suse.com>
 <5602eebf-c149-17f7-37c9-b263ff290509@xen.org>
 <ffd017a7-8278-85ee-81fa-9dad147eb0e5@suse.com>
 <6fa3067c-2c71-bb8e-eab8-30f44782d002@xen.org>
 <6c662ac7-ee10-1ac1-5b9f-df9a02d00d5c@suse.com>
 <ae721247-ef18-b044-7a5b-fba6313d5f99@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <ae231e90-46da-31f3-81cb-560b92211022@suse.com>
Date: Fri, 12 Jun 2020 11:18:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <ae721247-ef18-b044-7a5b-fba6313d5f99@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "paul@xen.org" <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 12.06.20 10:25, Julien Grall wrote:
> Hi Juergen,
> 
> On 12/06/2020 05:25, Jürgen Groß wrote:
>> On 11.06.20 18:00, Julien Grall wrote:
>>>
>>>
>>> On 11/06/2020 16:35, Jürgen Groß wrote:
>>>> On 11.06.20 17:27, Julien Grall wrote:
>>>>> Hi,
>>>>>
>>>>> On 11/06/2020 16:21, Jürgen Groß wrote:
>>>>>> On 11.06.20 16:57, Julien Grall wrote:
>>>>>>> Hi all,
>>>>>>>
>>>>>>> kexec-tools has an option to load dynamically libxenctlr.so (not 
>>>>>>> .so.4.x) (see [1]).
>>>>>>>
>>>>>>> Given that the library has never been considered stable, it is 
>>>>>>> probably a disaster that is waiting to happen.
>>>>>>>
>>>>>>> Looking at the tree kexec is using the follow libxc functions:
>>>>>>>     - xc_kexec_get_range()
>>>>>>>     - xc_kexec_load()
>>>>>>>     - xc_kexec_unload()
>>>>>>>     - xc_kexec_status()
>>>>>>>     - xc_kexec_exec()
>>>>>>>     - xc_version()
>>>>>>>     - xc_interface_open()
>>>>>>>     - xc_interface_close()
>>>>>>>     - xc_get_max_cpus()
>>>>>>>     - xc_get_machine_memory_map()
>>>>>>>
>>>>>>> I think it is uncontroversial that we want a new stable library 
>>>>>>> for all the xc_kexec_* functions (maybe libxenexec)?
>>>>>>>
>>>>>>> However I am not entirely sure where to put the others.
>>>>>>>
>>>>>>> I am thinking to introduce libxensysctl for xc_get_max_cpus() as 
>>>>>>> it is a XEN_SYSCTL. We could possibly include 
>>>>>>> xc_get_machine_memory_map() (despite it is a XENMEM_).
>>>>>>>
>>>>>>> For xc_version(), I am thinking to extend libxentoolcore to also 
>>>>>>> include "stable xen API".
>>>>>>>
>>>>>>> Any opinion on the approach?
>>>>>>
>>>>>> You could consider hypfs (at least for some of the functionality).
>>>>>
>>>>> That would work!
>>>>>
>>>>>>
>>>>>> xc_version() and xc_get_max_cpus() would be rather easy.
>>>>>
>>>>> I am guessing we will need a fallback to the normal hypercalls if 
>>>>> hypfs is not present.
>>>>
>>>> Or we don't support kexec-tools running on a system without hypfs
>>>> (or the related functions would return an error on those systems).
>>>
>>> AFAICT, hypfs allows you to modify runtime parameters which is not 
>>> required for kexec.
>>
>> Well, and? kexec won't use this functionality.
>>
>> libxenctrl allows to create domains, which isn't required for kexec.
>> And kexec doesn't do it.
> 
> And so does libc... so that was clear not my point...
> 
>>
>> We could still have the entry points for that functionality in
>> libxenexec, which could use libxenhypfs (and maybe others).
>>
>>> Such feature could be undesirable in some setup and therefore I don't 
>>> think this is acceptable to impose that for kexec.
>>
>> If we really have setups where this would be an issue we'd need
>> to modify the flask integration of hypfs to be able to disallow
>> write access to hypfs. Or we could even add per-node access rights.
> 
> ... Not everyone wants to use flask and I don't think this should be a 
> condition to forbid runtime configuration change for all the system.
> 
> You may want to set a minimal Xen with no runtime configuration support 
> and no flask. Yet you may want to kexec for updating your Xen.
> 
> Even with the runtime bits removed, I still don't think we should impose 
> to build hypfs in the hypervisor given there are already always built 
> hypercalls.

There might be a misunderstanding here.

I just wanted to point out that in case you need a new stable interface
between kexec and the hypervisor you could consider using hypfs for that
purpose instead of introducing a new hypercall.

In case all hypercalls are already present, then fine.

If not I don't see why introducing a new hypercall should be preferred
over using an existing mechanism.


Juergen


