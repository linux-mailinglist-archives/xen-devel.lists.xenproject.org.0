Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24669192ACB
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2020 15:09:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jH6fI-0005u2-4I; Wed, 25 Mar 2020 14:05:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=O/z9=5K=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jH6fH-0005tx-15
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2020 14:05:51 +0000
X-Inumbo-ID: ba7c7dfe-6ea1-11ea-8620-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ba7c7dfe-6ea1-11ea-8620-12813bfff9fa;
 Wed, 25 Mar 2020 14:05:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E7D8FAC3A;
 Wed, 25 Mar 2020 14:05:47 +0000 (UTC)
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
References: <20200226124705.29212-1-jgross@suse.com>
 <20200226124705.29212-4-jgross@suse.com>
 <5bf4b576-5025-8b02-a0aa-42615784161d@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <3f136f6e-8a23-7264-5e74-3bb37accceeb@suse.com>
Date: Wed, 25 Mar 2020 15:05:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <5bf4b576-5025-8b02-a0aa-42615784161d@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [Xen-devel] [PATCH v6 03/12] docs: add feature document for Xen
 hypervisor sysfs-like support
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 09.03.20 12:48, Julien Grall wrote:
> Hi Juergen,
> 
> On 26/02/2020 12:46, Juergen Gross wrote:
>> On the 2019 Xen developer summit there was agreement that the Xen
>> hypervisor should gain support for a hierarchical name-value store
>> similar to the Linux kernel's sysfs.
>>
>> In the beginning there should only be basic support: entries can be
>> added from the hypervisor itself only, there is a simple hypercall
>> interface to read the data.
>>
>> Add a feature document for setting the base of a discussion regarding
>> the desired functionality and the entries to add.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> ---
>> V1:
>> - remove the "--" prefixes of the sub-commands of the user tool
>>    (Jan Beulich)
>> - rename xenfs to xenhypfs (Jan Beulich)
>> - add "tree" and "write" options to user tool
>>
>> V2:
>> - move example tree to the paths description (Ian Jackson)
>> - specify allowed characters for keys and values (Ian Jackson)
>>
>> V3:
>> - correct introduction (writable entries)
>>
>> V4:
>> - add list specification
>> - add entry example (Julien Grall)
>> - correct date and Xen version (Julien Grall)
>> - add ARM64 as possible architecture (Julien Grall)
>> - add version description to the feature doc (Jan Beulich)
>> ---
>>   docs/features/hypervisorfs.pandoc |  92 
>> +++++++++++++++++++++++++++++++++
>>   docs/misc/hypfs-paths.pandoc      | 105 
>> ++++++++++++++++++++++++++++++++++++++
>>   2 files changed, 197 insertions(+)
>>   create mode 100644 docs/features/hypervisorfs.pandoc
>>   create mode 100644 docs/misc/hypfs-paths.pandoc
>>
>> diff --git a/docs/features/hypervisorfs.pandoc 
>> b/docs/features/hypervisorfs.pandoc
>> new file mode 100644
>> index 0000000000..a0a0ead057
>> --- /dev/null
>> +++ b/docs/features/hypervisorfs.pandoc
>> @@ -0,0 +1,92 @@
>> +% Hypervisor FS
>> +% Revision 1
>> +
>> +\clearpage
>> +
>> +# Basics
>> +---------------- ---------------------
>> +         Status: **Supported**
> 
> I think you also want to update SUPPORT.MD with the status of the feature.

I will send a patch doing this when all patches up to patch 6 have
gone in, as those are needed at least.

> 
> Other than that:
> 
> Acked-by: Julien Grall <jgrall@amazon.com>

Thanks


Juergen

