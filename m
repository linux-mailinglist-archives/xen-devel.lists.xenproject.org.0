Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 218F057E318
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jul 2022 16:37:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.373307.605440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEtm3-0003Tr-Ub; Fri, 22 Jul 2022 14:37:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 373307.605440; Fri, 22 Jul 2022 14:37:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEtm3-0003Rr-PH; Fri, 22 Jul 2022 14:37:03 +0000
Received: by outflank-mailman (input) for mailman id 373307;
 Fri, 22 Jul 2022 14:37:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fVTW=X3=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1oEtm2-0003Rl-P9
 for xen-devel@lists.xenproject.org; Fri, 22 Jul 2022 14:37:02 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be5b179b-09cb-11ed-924f-1f966e50362f;
 Fri, 22 Jul 2022 16:37:01 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1658500613510367.3388619115185;
 Fri, 22 Jul 2022 07:36:53 -0700 (PDT)
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
X-Inumbo-ID: be5b179b-09cb-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; t=1658500615; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UkLSqu+I+jERP8niOM9qnZwTq4ONc7DgQMfomir4FoMIuRD5leLLpjCIRNXSmQpvbXohzWLz4jmfIIh++iZ2xAjZ58DRBd5ILP+aQ02duRe6Pj7DQSGXrsBD6NKFOF8cHlAOkb7DPn5182OcNdXmL2xIqDhDs8XyT2SCyBvhvSk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1658500615; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=cyMNX9hjD/zX8ywkDXCFUsBvTbaj01gv0K3cyjQb/w8=; 
	b=d0yoeUYJPoVHeR79sO7aUDwN3tNLCIViP4yIbReAtrXN8LZc1MKwMtIb/8Yv9eKjmMeCOM/Srt31HLi5ASlM68Uh49Gv0LWSzYZvjQVZPovsWvyleAxXzEL4fRzaWmgC6Gb26FoIgekKTQPoc+6Nzwca37unK1hy/Y2OhV+P+Y0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1658500615;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:To:To:Cc:Cc:References:From:From:Subject:Subject:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=cyMNX9hjD/zX8ywkDXCFUsBvTbaj01gv0K3cyjQb/w8=;
	b=W/r7hO09+rkXpRNPW4cqh/nmKDRcUn0WQ3Mahmu3uPeKT4nJl0dA0gCQ/4LTf9Ri
	CNU7gvOtrd4o89tB1bCiAPla5X7gAD9Kfy3VvyOfXGNkX+zGBYdM1cdgU3YLVf2xPG/
	GJ0MlBHRdxP2Fhs6bvKcFTU29Revs1Afq0PfY03o=
Message-ID: <96cc29cf-5b31-eabd-3cca-eeaa7d7c58db@apertussolutions.com>
Date: Fri, 22 Jul 2022 10:36:29 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: "Smith, Jackson" <rsmith@RiversideResearch.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "scott.davis@starlab.io" <scott.davis@starlab.io>,
 "christopher.clark@starlab.io" <christopher.clark@starlab.io>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20220706210454.30096-1-dpsmith@apertussolutions.com>
 <20220706210454.30096-11-dpsmith@apertussolutions.com>
 <BN0P110MB16425760D6D6991942DEE6DCCF8C9@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v1 10/18] x86: introduce the domain builder
In-Reply-To: <BN0P110MB16425760D6D6991942DEE6DCCF8C9@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External


On 7/18/22 09:59, Smith, Jackson wrote:
> Hi Daniel,
> 
>> -----Original Message-----
>> Subject: [PATCH v1 10/18] x86: introduce the domain builder
>>
>> This commit introduces the domain builder configuration FDT parser along
>> with the domain builder core for domain creation. To enable domain builder
>> to be a cross architecture internal API, a new arch domain creation call
> is
>> introduced for use by the domain builder.
> 
>> diff --git a/xen/common/domain-builder/core.c
> 
>> +void __init builder_init(struct boot_info *info) {
>> +    struct boot_domain *d = NULL;
>> +
>> +    info->builder = &builder;
>> +
>> +    if ( IS_ENABLED(CONFIG_BUILDER_FDT) )
>> +    {
> 
>> +    }
>> +
>> +    /*
>> +     * No FDT config support or an FDT wasn't present, do an initial
>> +     * domain construction
>> +     */
>> +    printk("Domain Builder: falling back to initial domain build\n");
>> +    info->builder->nr_doms = 1;
>> +    d = &info->builder->domains[0];
>> +
>> +    d->mode = opt_dom0_pvh ? 0 : BUILD_MODE_PARAVIRTUALIZED;
>> +
>> +    d->kernel = &info->mods[0];
>> +    d->kernel->kind = BOOTMOD_KERNEL;
>> +
>> +    d->permissions = BUILD_PERMISSION_CONTROL |
>> BUILD_PERMISSION_HARDWARE;
>> +    d->functions = BUILD_FUNCTION_CONSOLE |
>> BUILD_FUNCTION_XENSTORE |
>> +                     BUILD_FUNCTION_INITIAL_DOM;
>> +
>> +    d->kernel->arch->headroom = bzimage_headroom(bootstrap_map(d-
>>> kernel),
>> +                                                   d->kernel->size);
>> +    bootstrap_map(NULL);
>> +
>> +    if ( d->kernel->string.len )
>> +        d->kernel->string.kind = BOOTSTR_CMDLINE; }
> 
> Forgive me if I'm incorrect, but I believe there is an issue with this
> fallback logic for the case where no FDT was provided.

IIUC, the issue at hand has to deal with patch #15.

> If dom0_mem is not supplied to the xen cmd line, then d->meminfo is never
> initialized. (See dom0_compute_nr_pages/dom0_build.c:335)
> This was giving me trouble because bd->meminfo.mem_max.nr_pages was left at
> 0, effectivity clamping dom0 to 0 pages of ram.
> 
> I'm not sure what the best solution is but one (easy) possibility is just
> initializing meminfo to the dom0 defaults near the end of this function:
>         d->meminfo.mem_size = dom0_size;
>         d->meminfo.mem_min = dom0_min_size;
>         d->meminfo.mem_max = dom0_max_size;

I believe the correct fix is to this hunk,

@@ -416,7 +379,12 @@ unsigned long __init dom0_compute_nr_pages(
         }
     }

-    d->max_pages = min_t(unsigned long, max_pages, UINT_MAX);
+    /* Clamp according to min/max limits and available memory (final). */
+    nr_pages = max(nr_pages, min_pages);
+    nr_pages = min(nr_pages, max_pages);
+    nr_pages = min(nr_pages, avail);
+
+    bd->domain->max_pages = min_t(unsigned long, max_pages, UINT_MAX);

Before that last line, there should be a clamp up of max_pages, e.g.

    nr_pages = max(nr_pages, min_pages);
    nr_pages = min(nr_pages, max_pages);
    nr_pages = min(nr_pages, avail);

    max_pages = max(nr_pages, max_pages);

    bd->domain->max_pages = min_t(unsigned long, max_pages, UINT_MAX);

v/r,
dps

