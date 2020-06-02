Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 876FB1EBB78
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 14:19:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg5sy-0006Zz-Mv; Tue, 02 Jun 2020 12:19:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d8pY=7P=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jg5sx-0006Zu-2v
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 12:19:15 +0000
X-Inumbo-ID: 458b0cda-a4cb-11ea-9947-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 458b0cda-a4cb-11ea-9947-bc764e2007e4;
 Tue, 02 Jun 2020 12:19:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6EEADACF1;
 Tue,  2 Jun 2020 12:19:15 +0000 (UTC)
Subject: Re: [PATCH-for-4.14 1/2] xen: fix build with CONFIG_HYPFS_CONFIG
 enabled
To: Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>
References: <20200602114050.5964-1-jgross@suse.com>
 <20200602114050.5964-2-jgross@suse.com>
 <d6c1360e-6ecd-7dda-554d-dced4767deaa@suse.com>
 <20200602120726.vm3br27ygbvbs2bx@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <7157b762-014b-802a-ea85-ae7bf89a5d73@suse.com>
Date: Tue, 2 Jun 2020 14:19:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200602120726.vm3br27ygbvbs2bx@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
 paul@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 02.06.20 14:07, Wei Liu wrote:
> On Tue, Jun 02, 2020 at 01:55:14PM +0200, Jan Beulich wrote:
>> On 02.06.2020 13:40, Juergen Gross wrote:
>>> --- a/xen/common/Makefile
>>> +++ b/xen/common/Makefile
>>> @@ -75,7 +75,7 @@ obj-$(CONFIG_UBSAN) += ubsan/
>>>   obj-$(CONFIG_NEEDS_LIBELF) += libelf/
>>>   obj-$(CONFIG_HAS_DEVICE_TREE) += libfdt/
>>>   
>>> -config.gz: ../.config
>>> +config.gz: $(XEN_ROOT)/xen/$(KCONFIG_CONFIG)
>>
>> Looking at all pre-existing uses of KCONFIG_CONFIG this is the
>> first one assuming it holds a relative path. The doc also doesn't
>> indicate it can't be an absolute one.
> 
> This is not an objection to this patch right?

I can see his point.

In case KCONFIG_CONFIG is set to an absolute path the result won't
build.

The proper solution would be to test KCONFIG_CONFIG for being an
absolute path and do the prefixing of $(XEN_ROOT)/xen/ only if this
isn't the case.

I'll send V2 of this patch.


Juergen

