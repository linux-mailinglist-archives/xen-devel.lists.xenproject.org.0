Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 219321F753F
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 10:25:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjezx-00009B-MR; Fri, 12 Jun 2020 08:25:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kdnc=7Z=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jjezw-000096-6s
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 08:25:12 +0000
X-Inumbo-ID: 3b748498-ac86-11ea-bb8b-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3b748498-ac86-11ea-bb8b-bc764e2007e4;
 Fri, 12 Jun 2020 08:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=txcUfoiGspimgOYYu/8rbE+C3QgTxC7VpbR3EUnp4jo=; b=LlzB0EyU0y0pfxErrBlQuAT/As
 B8DaxKqyR2nBYVDiRUqE9DurDjYQX6Y3QTZ1jkmGttcjusDYqtV2A6uxaUVd3n/nJYKXQzUW5QgyP
 Tt2ig3yGBsxix6qDrsdrmgMNVq4sVN8/DTcx6IqHRynXQ7RhGmTt/yPSaMLp3/tZclW4=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jjezs-0004bJ-3x; Fri, 12 Jun 2020 08:25:08 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jjezr-00085Y-SU; Fri, 12 Jun 2020 08:25:08 +0000
Subject: Re: Kexec and libxenctlr.so
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Julien Grall <jgrall@amazon.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>, "wl@xen.org" <wl@xen.org>,
 daniel.kiper@oracle.com
References: <7a88218d-981e-6583-15a5-3fcaffb05294@amazon.com>
 <261293b1-f4c9-e41d-0c76-cd47fe5c0dc2@suse.com>
 <5602eebf-c149-17f7-37c9-b263ff290509@xen.org>
 <ffd017a7-8278-85ee-81fa-9dad147eb0e5@suse.com>
 <6fa3067c-2c71-bb8e-eab8-30f44782d002@xen.org>
 <6c662ac7-ee10-1ac1-5b9f-df9a02d00d5c@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <ae721247-ef18-b044-7a5b-fba6313d5f99@xen.org>
Date: Fri, 12 Jun 2020 09:25:05 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <6c662ac7-ee10-1ac1-5b9f-df9a02d00d5c@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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

Hi Juergen,

On 12/06/2020 05:25, Jürgen Groß wrote:
> On 11.06.20 18:00, Julien Grall wrote:
>>
>>
>> On 11/06/2020 16:35, Jürgen Groß wrote:
>>> On 11.06.20 17:27, Julien Grall wrote:
>>>> Hi,
>>>>
>>>> On 11/06/2020 16:21, Jürgen Groß wrote:
>>>>> On 11.06.20 16:57, Julien Grall wrote:
>>>>>> Hi all,
>>>>>>
>>>>>> kexec-tools has an option to load dynamically libxenctlr.so (not 
>>>>>> .so.4.x) (see [1]).
>>>>>>
>>>>>> Given that the library has never been considered stable, it is 
>>>>>> probably a disaster that is waiting to happen.
>>>>>>
>>>>>> Looking at the tree kexec is using the follow libxc functions:
>>>>>>     - xc_kexec_get_range()
>>>>>>     - xc_kexec_load()
>>>>>>     - xc_kexec_unload()
>>>>>>     - xc_kexec_status()
>>>>>>     - xc_kexec_exec()
>>>>>>     - xc_version()
>>>>>>     - xc_interface_open()
>>>>>>     - xc_interface_close()
>>>>>>     - xc_get_max_cpus()
>>>>>>     - xc_get_machine_memory_map()
>>>>>>
>>>>>> I think it is uncontroversial that we want a new stable library 
>>>>>> for all the xc_kexec_* functions (maybe libxenexec)?
>>>>>>
>>>>>> However I am not entirely sure where to put the others.
>>>>>>
>>>>>> I am thinking to introduce libxensysctl for xc_get_max_cpus() as 
>>>>>> it is a XEN_SYSCTL. We could possibly include 
>>>>>> xc_get_machine_memory_map() (despite it is a XENMEM_).
>>>>>>
>>>>>> For xc_version(), I am thinking to extend libxentoolcore to also 
>>>>>> include "stable xen API".
>>>>>>
>>>>>> Any opinion on the approach?
>>>>>
>>>>> You could consider hypfs (at least for some of the functionality).
>>>>
>>>> That would work!
>>>>
>>>>>
>>>>> xc_version() and xc_get_max_cpus() would be rather easy.
>>>>
>>>> I am guessing we will need a fallback to the normal hypercalls if 
>>>> hypfs is not present.
>>>
>>> Or we don't support kexec-tools running on a system without hypfs
>>> (or the related functions would return an error on those systems).
>>
>> AFAICT, hypfs allows you to modify runtime parameters which is not 
>> required for kexec.
> 
> Well, and? kexec won't use this functionality.
> 
> libxenctrl allows to create domains, which isn't required for kexec.
> And kexec doesn't do it.

And so does libc... so that was clear not my point...

> 
> We could still have the entry points for that functionality in
> libxenexec, which could use libxenhypfs (and maybe others).
> 
>> Such feature could be undesirable in some setup and therefore I don't 
>> think this is acceptable to impose that for kexec.
> 
> If we really have setups where this would be an issue we'd need
> to modify the flask integration of hypfs to be able to disallow
> write access to hypfs. Or we could even add per-node access rights.

... Not everyone wants to use flask and I don't think this should be a 
condition to forbid runtime configuration change for all the system.

You may want to set a minimal Xen with no runtime configuration support 
and no flask. Yet you may want to kexec for updating your Xen.

Even with the runtime bits removed, I still don't think we should impose 
to build hypfs in the hypervisor given there are already always built 
hypercalls.

Cheers,

-- 
Julien Grall

