Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2F91EB9BE
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 12:43:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg4O1-0004wV-Aj; Tue, 02 Jun 2020 10:43:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d8pY=7P=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jg4O0-0004wQ-AW
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 10:43:12 +0000
X-Inumbo-ID: da8af3b2-a4bd-11ea-9947-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id da8af3b2-a4bd-11ea-9947-bc764e2007e4;
 Tue, 02 Jun 2020 10:43:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A3E56AC96;
 Tue,  2 Jun 2020 10:43:12 +0000 (UTC)
Subject: Re: [PATCH v10 08/12] xen: add /buildinfo/config entry to hypervisor
 filesystem
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20200519072106.26894-1-jgross@suse.com>
 <20200519072106.26894-9-jgross@suse.com>
 <e2e71f5e-ac77-b5ed-71c1-bf5b7d74abcd@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <95e4a29c-85e1-b7ed-ee7e-5517a094bd6a@suse.com>
Date: Tue, 2 Jun 2020 12:43:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <e2e71f5e-ac77-b5ed-71c1-bf5b7d74abcd@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 02.06.20 11:03, Andrew Cooper wrote:
> On 19/05/2020 08:21, Juergen Gross wrote:
>> diff --git a/xen/common/Makefile b/xen/common/Makefile
>> index bf7d0e25a3..3d61239fbf 100644
>> --- a/xen/common/Makefile
>> +++ b/xen/common/Makefile
>> @@ -1,6 +1,7 @@
>>   obj-$(CONFIG_ARGO) += argo.o
>>   obj-y += bitmap.o
>>   obj-y += bsearch.o
>> +obj-$(CONFIG_HYPFS_CONFIG) += config_data.o
>>   obj-$(CONFIG_CORE_PARKING) += core_parking.o
>>   obj-y += cpu.o
>>   obj-$(CONFIG_DEBUG_TRACE) += debugtrace.o
>> @@ -73,3 +74,14 @@ obj-$(CONFIG_UBSAN) += ubsan/
>>   
>>   obj-$(CONFIG_NEEDS_LIBELF) += libelf/
>>   obj-$(CONFIG_HAS_DEVICE_TREE) += libfdt/
>> +
>> +config.gz: ../.config
>> +	gzip -c $< >$@
> 
> I had to disable HYPFS in the XenServer build.  Inside RPM, this fails with

Disabling CONFIG_HYPFS_CONFIG should work, too.

> 
> make[3]: *** No rule to make target `../.config', needed by
> `config.gz'.  Stop.
> make[3]: *** Waiting for unfinished jobs....
> 
> This needs to be an expression involving $(KCONFIG_CONFIG) because
> .config is only the default, and it surely needs a $(XEN_ROOT) in there?
Will send a patch.

Oh, in fact I'll send two patches, as I guess pv-shim doesn't want to
have CONFIG_HYPFS set.


Juergen

