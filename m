Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCBF3087CD
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 11:31:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77914.141457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5R3h-0006bq-P6; Fri, 29 Jan 2021 10:31:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77914.141457; Fri, 29 Jan 2021 10:31:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5R3h-0006bR-Lh; Fri, 29 Jan 2021 10:31:21 +0000
Received: by outflank-mailman (input) for mailman id 77914;
 Fri, 29 Jan 2021 10:31:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mmvf=HA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l5R3f-0006bM-IG
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 10:31:19 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 324d1176-3cda-4ab6-9f9f-3e4e8b6ec8af;
 Fri, 29 Jan 2021 10:31:17 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 06142B152;
 Fri, 29 Jan 2021 10:31:17 +0000 (UTC)
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
X-Inumbo-ID: 324d1176-3cda-4ab6-9f9f-3e4e8b6ec8af
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611916277; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/OUR/WVsjWH8rfG6i/mdv/8J4wk1GCs7/hDyaF3Monk=;
	b=fxYLTM0DUzD8CfEJv936UbtKMltrXPA5OCnXriVSVHSGGO3Tx8yB3vdyy/ZRK0BBfab2jh
	stICcgZLTFhCQhqwHzf4eIq7/BqgUJ3YzEAHA6e44+A+h13uqA/cKLGZqjUuCgmq4qYO3r
	nJo2buz1PcJ+8GdJ4iY5SyPeyVATzow=
Subject: Ping: [PATCH v2 1/2] viridian: remove implicit limit of 64 VPs per
 partition
To: paul@xen.org, iwj@xenproject.org, wl@xen.org, anthony.perard@citrix.com
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, julien@xen.org,
 sstabellini@kernel.org, roger.pau@citrix.com,
 xen-devel@lists.xenproject.org, Igor Druzhinin <igor.druzhinin@citrix.com>
References: <1610425048-990-1-git-send-email-igor.druzhinin@citrix.com>
 <396e7b8d-444a-d67d-e0f7-f6b85052dff7@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9f421029-1abb-2aa8-2874-b6eb41b70d63@suse.com>
Date: Fri, 29 Jan 2021 11:31:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <396e7b8d-444a-d67d-e0f7-f6b85052dff7@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 25.01.2021 16:37, Igor Druzhinin wrote:
> On 12/01/2021 04:17, Igor Druzhinin wrote:
>> TLFS 7.8.1 stipulates that "a virtual processor index must be less than
>> the maximum number of virtual processors per partition" that "can be obtained
>> through CPUID leaf 0x40000005". Furthermore, "Requirements for Implementing
>> the Microsoft Hypervisor Interface" defines that starting from Windows Server
>> 2012, which allowed more than 64 CPUs to be brought up, this leaf can now
>> contain a value -1 basically assuming the hypervisor has no restriction while
>> 0 (that we currently expose) means the default restriction is still present.
>>
>> Along with the previous changes exposing ExProcessorMasks this allows a recent
>> Windows VM with Viridian extension enabled to have more than 64 vCPUs without
>> going into BSOD in some cases.
>>
>> Since we didn't expose the leaf before and to keep CPUID data consistent for
>> incoming streams from previous Xen versions - let's keep it behind an option.
>>
>> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
>> ---
> 
> ping? Paul?

Paul - I saw a reply by you on patch 2, but not on this one.

libxl maintainers - both patches would want to be acked by you.

Jan

