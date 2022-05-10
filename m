Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72422521348
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 13:09:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325443.548011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noNju-00027s-IY; Tue, 10 May 2022 11:09:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325443.548011; Tue, 10 May 2022 11:09:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noNju-00025u-FL; Tue, 10 May 2022 11:09:14 +0000
Received: by outflank-mailman (input) for mailman id 325443;
 Tue, 10 May 2022 11:09:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VXvK=VS=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1noNjt-00025o-47
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 11:09:13 +0000
Received: from ppsw-41.csi.cam.ac.uk (ppsw-41.csi.cam.ac.uk [131.111.8.141])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e6be9af-d051-11ec-8fc4-03012f2f19d4;
 Tue, 10 May 2022 13:09:12 +0200 (CEST)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:60480)
 by ppsw-41.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.139]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1noNjn-000BAz-Q7 (Exim 4.95) (return-path <amc96@srcf.net>);
 Tue, 10 May 2022 12:09:07 +0100
Received: from [192.168.1.10] (host-92-26-109-251.as13285.net [92.26.109.251])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id DBD321FBB6;
 Tue, 10 May 2022 12:09:06 +0100 (BST)
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
X-Inumbo-ID: 9e6be9af-d051-11ec-8fc4-03012f2f19d4
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <00d82608-9430-6b20-26b5-207c62358179@srcf.net>
Date: Tue, 10 May 2022 12:09:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Julien Grall <julien@xen.org>, Lin Liu <lin.liu@citrix.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <cover.1652170719.git.lin.liu@citrix.com>
 <c9488a2fe15d59dc86712e70614c4dbe0794506b.1652170719.git.lin.liu@citrix.com>
 <76c9bed5-6643-4fa6-eaf5-c865f942193c@xen.org>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH v3 4/6] xen: Switch to byteswap
In-Reply-To: <76c9bed5-6643-4fa6-eaf5-c865f942193c@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/05/2022 11:51, Julien Grall wrote:
> On 10/05/2022 11:15, Lin Liu wrote:
>> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
>> index 4aae281e89..70d3be3be6 100644
>> --- a/xen/common/device_tree.c
>> +++ b/xen/common/device_tree.c
>> @@ -171,7 +171,7 @@ bool_t dt_property_read_u32(const struct
>> dt_device_node *np,
>>       if ( !val || len < sizeof(*out_value) )
>>           return 0;
>>   -    *out_value = be32_to_cpup(val);
>> +    *out_value = be32_to_cpu(*val);
>
> This code has been taken from Linux and I would rather prefer to keep
> the *cpup* helpers to avoid any changes when backporting.

I specifically requested that this be de-obfuscated.  Hiding indirection
is a fantastic way to introduce bugs, and we've had XSAs in the past
because of it (admittedly in libxl, but still...).

This file is already Xen style, not Linux, so won't be taking backports
directly, and the resulting compiler diagnostic will make it obvious
what is going on. be32_to_cpu(*val) works fine on older versions of Xen too.

In this case, the cost of changing is well worth the improvements and
simplifications gained.  See the 0/6 diffstat and see that the compiler
can make better optimisations when it can see the builtin.

>
>> diff --git a/xen/include/xen/unaligned.h b/xen/include/xen/unaligned.h
>> index 0a2b16d05d..16b2e6f5f0 100644
>> --- a/xen/include/xen/unaligned.h
>> +++ b/xen/include/xen/unaligned.h
>> @@ -20,62 +20,62 @@
>>     static inline uint16_t get_unaligned_be16(const void *p)
>>   {
>> -    return be16_to_cpup(p);
>> +    return be16_to_cpu(*(const uint16_t *)p)
>
> I haven't checked the existing implementation of be16_to_cpup().

It's a plain dereference, just like this.  AFAICT, it wasn't unaligned
safe before, either.

It should be reasonably easy to fix in a followup patch.  Just memcpy()
to/from the void pointer to a stack variable of the appropriate type.

~Andrew

