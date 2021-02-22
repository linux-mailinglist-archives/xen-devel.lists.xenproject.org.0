Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6F53219B9
	for <lists+xen-devel@lfdr.de>; Mon, 22 Feb 2021 15:06:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88087.165471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEBqT-0007N7-Ad; Mon, 22 Feb 2021 14:05:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88087.165471; Mon, 22 Feb 2021 14:05:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEBqT-0007Mg-7Q; Mon, 22 Feb 2021 14:05:53 +0000
Received: by outflank-mailman (input) for mailman id 88087;
 Mon, 22 Feb 2021 14:05:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6bXc=HY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lEBqR-0007MZ-BY
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 14:05:51 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8e29f0f0-5302-40d2-bde1-4fefbdc427cf;
 Mon, 22 Feb 2021 14:05:50 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 89F0AADDB;
 Mon, 22 Feb 2021 14:05:49 +0000 (UTC)
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
X-Inumbo-ID: 8e29f0f0-5302-40d2-bde1-4fefbdc427cf
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614002749; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OZv5MLMWp4gbXkOtW95MCRMHdyhv7FEZHTNn45SU7hQ=;
	b=cZd4df3m2UNfpnV+hs5RPZXAisLsrpG1WDS1qZbRUwM1aCFcino3YBB3AOxJtY1ay/YstT
	OQSuL349mYTg6/uKti5qeT0ZqSZ8wzN+Io7Bw+AxYJlr3PKnnn5npW8+kS8kAQ1PLMlfgp
	9nNxv9tym5A6tVMOru0MERcOV3V7aSo=
Subject: Re: [PATCH v3 1/2][4.15] VMX: delay p2m insertion of APIC access page
To: Ian Jackson <iwj@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Kevin Tian <kevin.tian@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Julien Grall <julien@xen.org>
References: <4731a3a3-906a-98ac-11ba-6a0723903391@suse.com>
 <90271e69-c07e-a32c-5531-a79b10ef03dd@suse.com>
 <24627.38031.77928.536108@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <04a2869a-282f-783a-6c03-8a2d7209411a@suse.com>
Date: Mon, 22 Feb 2021 15:05:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <24627.38031.77928.536108@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 22.02.2021 12:25, Ian Jackson wrote:
> Jan Beulich writes ("[PATCH v3 1/2][4.15] VMX: delay p2m insertion of APIC access page"):
>> Inserting the mapping at domain creation time leads to a memory leak
>> when the creation fails later on and the domain uses separate CPU and
>> IOMMU page tables - the latter requires intermediate page tables to be
>> allocated, but there's no freeing of them at present in this case. Since
>> we don't need the p2m insertion to happen this early, avoid the problem
>> altogether by deferring it until the last possible point.
> 
> Thanks.
> 
>>   This comes at
>> the price of not being able to handle an error other than by crashing
>> the domain.
> 
> How worried should I be about this ?

Not overly much I would say. The difference is between a failure
(-ENOMEM) during domain creation vs the domain getting crashed
before it gets first scheduled. This is certainly less friendly
to the user, but lack of memory shouldn't typically happen when
creating domains. Plus the memory talked about here is such that
gets provided explicitly to the domain (the p2m pool), rather
than a system wide pool.

Jan

