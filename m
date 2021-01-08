Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 378092EF188
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jan 2021 12:42:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63373.112528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxq9z-00044t-KF; Fri, 08 Jan 2021 11:42:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63373.112528; Fri, 08 Jan 2021 11:42:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxq9z-00044V-H3; Fri, 08 Jan 2021 11:42:27 +0000
Received: by outflank-mailman (input) for mailman id 63373;
 Fri, 08 Jan 2021 11:42:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1BSv=GL=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1kxq9x-00044Q-JA
 for xen-devel@lists.xenproject.org; Fri, 08 Jan 2021 11:42:25 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d268a1bf-70cb-48e7-b3c0-4a3ddd2ceabb;
 Fri, 08 Jan 2021 11:42:24 +0000 (UTC)
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
X-Inumbo-ID: d268a1bf-70cb-48e7-b3c0-4a3ddd2ceabb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610106144;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=czdlG1yyMPNMKGCtdguLrl0jlxSG7plVRpgVj9xGHiY=;
  b=OoG3oU8cPss1j4grn0yklTnAG9kMkuSjLPbM0Qi++a0lLTCULCxwEG+g
   pMqCvZmv9Y/z3i+U9bYieokh2KWNQV0vRp9Y2l7jCHIgt/CRKY/HDYPK0
   LwrX+dkLfsTzLY9+6NpW5utsPQ3IJdgG6kadRbW6krlsn5Vj1dRElUivj
   w=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: mzoTebPBQI7K8qRaBCNLb46Mx+QymVQZdrBMm91tx5gY0gxDg8KPEs+7EBqJAFC2GYPCazunbe
 xiQTLosk08uEuBxdWCxu/XZD2l1MHtgxl297n4XsREq9xnZDZn54LrOI6ijK27wVbpaJo/F+oL
 SMfOwsp0Jd+Y4nhu/gr55QCVkpfUG2hOIEjhTcBcwamuox5bTDPqJJ9IYz/sm1TLXrQBIuwT6K
 /4F6Kb0YlHNXjJ/ICwfciLtxbvslxDdT6CT9yz6kw83GImDEgj0a/LD6yOhA4f03Q1wrsas07F
 dVo=
X-SBRS: 5.2
X-MesageID: 35058121
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,330,1602561600"; 
   d="scan'208";a="35058121"
Subject: Re: [PATCH 2/2] viridian: allow vCPU hotplug for Windows VMs
To: <paul@xen.org>, <xen-devel@lists.xenproject.org>
CC: <wl@xen.org>, <iwj@xenproject.org>, <anthony.perard@citrix.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<julien@xen.org>, <sstabellini@kernel.org>, <roger.pau@citrix.com>
References: <1610066796-17266-1-git-send-email-igor.druzhinin@citrix.com>
 <1610066796-17266-2-git-send-email-igor.druzhinin@citrix.com>
 <00a001d6e599$a07c8380$e1758a80$@xen.org>
 <c09f1304-c08f-1f18-319d-62aa518a89d1@citrix.com>
 <00a101d6e5b2$276b2140$764163c0$@xen.org>
 <e24a438e-3705-d035-2dd6-34fd4f558898@citrix.com>
 <00a201d6e5b3$18ad0ff0$4a072fd0$@xen.org>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <fdec599c-9e67-03d4-7acd-920867686ccd@citrix.com>
Date: Fri, 8 Jan 2021 11:42:18 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <00a201d6e5b3$18ad0ff0$4a072fd0$@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08/01/2021 11:40, Paul Durrant wrote:
>> -----Original Message-----
>> From: Igor Druzhinin <igor.druzhinin@citrix.com>
>> Sent: 08 January 2021 11:36
>> To: paul@xen.org; xen-devel@lists.xenproject.org
>> Cc: wl@xen.org; iwj@xenproject.org; anthony.perard@citrix.com; andrew.cooper3@citrix.com;
>> george.dunlap@citrix.com; jbeulich@suse.com; julien@xen.org; sstabellini@kernel.org;
>> roger.pau@citrix.com
>> Subject: Re: [PATCH 2/2] viridian: allow vCPU hotplug for Windows VMs
>>
>> On 08/01/2021 11:33, Paul Durrant wrote:
>>>> -----Original Message-----
>>>> From: Igor Druzhinin <igor.druzhinin@citrix.com>
>>>> Sent: 08 January 2021 11:30
>>>> To: paul@xen.org; xen-devel@lists.xenproject.org
>>>> Cc: wl@xen.org; iwj@xenproject.org; anthony.perard@citrix.com; andrew.cooper3@citrix.com;
>>>> george.dunlap@citrix.com; jbeulich@suse.com; julien@xen.org; sstabellini@kernel.org;
>>>> roger.pau@citrix.com
>>>> Subject: Re: [PATCH 2/2] viridian: allow vCPU hotplug for Windows VMs
>>>>
>>>> On 08/01/2021 08:38, Paul Durrant wrote:
>>>>>> -----Original Message-----
>>>>>> From: Igor Druzhinin <igor.druzhinin@citrix.com>
>>>>>> Sent: 08 January 2021 00:47
>>>>>> To: xen-devel@lists.xenproject.org
>>>>>> Cc: paul@xen.org; wl@xen.org; iwj@xenproject.org; anthony.perard@citrix.com;
>>>>>> andrew.cooper3@citrix.com; george.dunlap@citrix.com; jbeulich@suse.com; julien@xen.org;
>>>>>> sstabellini@kernel.org; roger.pau@citrix.com; Igor Druzhinin <igor.druzhinin@citrix.com>
>>>>>> Subject: [PATCH 2/2] viridian: allow vCPU hotplug for Windows VMs
>>>>>>
>>>>>> If Viridian extensions are enabled, Windows wouldn't currently allow
>>>>>> a hotplugged vCPU to be brought up dynamically. We need to expose a special
>>>>>> bit to let the guest know we allow it. It appears we can just start exposing
>>>>>> it without worrying too much about compatibility - see relevant QEMU
>>>>>> discussion here:
>>>>>>
>>>>>> https://patchwork.kernel.org/project/qemu-devel/patch/1455364815-19586-1-git-send-email-
>>>>>> den@openvz.org/
>>>>>
>>>>> I don't think that discussion really confirmed it was safe... just that empirically it appeared to
>>>> be so. I think we should err on
>>>>> the side of caution and have this behind a feature flag (but I'm happy for it to default to on).
>>>>
>>>> QEMU was having this code since 2016 and nobody complained is good
>>>> enough for me - but if you insist we need an option - ok, I will add one.
>>>>
>>>
>>> Given that it has not yet been in a release, perhaps you could just guard this and the
>> implementation of leaf 0x40000005 using HVMPV_ex_processor_masks?
>>
>> That looks sloppy and confusing to me - let's have a separate option instead.
>>
> 
> Yes, for this I guess it is really a separate thing. Using HVMPV_ex_processor_masks to control the presence of leaf 0x40000005 seems reasonable (since it's all about being able to use >64 vcpus). Perhaps a new HVMPV_cpu_hotplug for this one?

Agree.

Igor

