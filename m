Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 696C65393D9
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 17:21:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339781.564693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw3gR-0006mu-OF; Tue, 31 May 2022 15:21:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339781.564693; Tue, 31 May 2022 15:21:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw3gR-0006k9-KZ; Tue, 31 May 2022 15:21:23 +0000
Received: by outflank-mailman (input) for mailman id 339781;
 Tue, 31 May 2022 15:21:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xfyb=WH=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nw3gQ-0006k3-5b
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 15:21:22 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5209ab2b-e0f5-11ec-bd2c-47488cf2e6aa;
 Tue, 31 May 2022 17:21:20 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 165401046882150.27441617519514;
 Tue, 31 May 2022 08:21:08 -0700 (PDT)
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
X-Inumbo-ID: 5209ab2b-e0f5-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; t=1654010470; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jXQL5afCFOHY0iy8n/JQfeFSw6x+Mt8NbKltWVAxIg+aJxl4WDkmHXm512nDm6u/yE7+g0PsZ7Skfd0/4aIGIeZO5EbmCjOdXgj6+Zo9dOcA2GQFikoJjLqX4CMGizIKwlYswxEFvI7rW/pDqDdQfziwVeVNJRwS6S8gaGw33vU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1654010470; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=OrjEDt0PWKPZrYPxCeiDha30EHSPR1QIo3aE2v8sutU=; 
	b=E8DLoE7MNdiRw5XzOh0sInMROdVYLZvFnJu/bGfG5fMdiRlIbCGhc8g1hCgWu+tb5HDvFtQg35PbCKOEVXkMeGyIW76W6vlfKbS6E8rYGjdnQXZ8QFCzQCeyJk74PxT6inOtRREw2ZXb38yE4oO+WGMaxVCe3AVUHU/npp9OmtI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1654010470;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=OrjEDt0PWKPZrYPxCeiDha30EHSPR1QIo3aE2v8sutU=;
	b=oi+azsdUUz55nUJWgB/U+fP9F6gq1Og91b/XBXf8RdGAdJhkestHIKHnLN+WAGDD
	8sX4DYVKWqMd9cdAAyBOCOQfshpSAqPXJ3KiepJ3LjXUT34Ja9w2KUHdpud/ItV28SD
	5qqXD0+Vvrlwzz4ixMXaMSmuMQHLsK/P/p8vwLxM=
Message-ID: <28239bb1-686f-af94-0e38-b2e056c8acc6@apertussolutions.com>
Date: Tue, 31 May 2022 11:19:39 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v8 1/2] xsm: create idle domain privileged and demote
 after setup
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: scott.davis@starlab.io, christopher.clark@starlab.io, jandryuk@gmail.com,
 Luca Fancellu <luca.fancellu@arm.com>, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli
 <dfaggioli@suse.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>
References: <20220531145646.10062-1-dpsmith@apertussolutions.com>
 <20220531145646.10062-2-dpsmith@apertussolutions.com>
 <73072b2b-0cb8-6a7e-04fe-11dd2085e9ad@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <73072b2b-0cb8-6a7e-04fe-11dd2085e9ad@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External


On 5/31/22 11:16, Jan Beulich wrote:
> On 31.05.2022 16:56, Daniel P. Smith wrote:
>> There are new capabilities, dom0less and hyperlaunch, that introduce internal
>> hypervisor logic, which needs to make resource allocation calls that are
>> protected by XSM access checks. The need for these resource allocations are
>> necessary for dom0less and hyperlaunch when they are constructing the initial
>> domain(s).  This creates an issue as a subset of the hypervisor code is
>> executed under a system domain, the idle domain, that is represented by a
>> per-CPU non-privileged struct domain. To enable these new capabilities to
>> function correctly but in a controlled manner, this commit changes the idle
>> system domain to be created as a privileged domain under the default policy and
>> demoted before transitioning to running. A new XSM hook,
>> xsm_set_system_active(), is introduced to allow each XSM policy type to demote
>> the idle domain appropriately for that policy type. In the case of SILO, it
>> inherits the default policy's hook for xsm_set_system_active().
>>
>> For flask, a stub is added to ensure that flask policy system will function
>> correctly with this patch until flask is extended with support for starting the
>> idle domain privileged and properly demoting it on the call to
>> xsm_set_system_active().
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
>> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
>> Acked-by: Julien Grall <jgrall@amazon.com> # arm
> 
> Hmm, here and on patch 2 you've lost Rahul's R-b and T-b, afaict.

erg, you are right, my apologies. Would you like me to respin as v9 to
get it in there, so it is not lost?

v/r,
dps

