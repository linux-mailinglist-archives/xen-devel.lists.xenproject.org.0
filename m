Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE3F561CBB
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jun 2022 16:12:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358552.587829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6uuQ-0000bh-Lk; Thu, 30 Jun 2022 14:12:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358552.587829; Thu, 30 Jun 2022 14:12:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6uuQ-0000ZV-IU; Thu, 30 Jun 2022 14:12:42 +0000
Received: by outflank-mailman (input) for mailman id 358552;
 Thu, 30 Jun 2022 14:12:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nqik=XF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1o6uuP-0000ZH-HA
 for xen-devel@lists.xenproject.org; Thu, 30 Jun 2022 14:12:41 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2ad12bf-f87e-11ec-bd2d-47488cf2e6aa;
 Thu, 30 Jun 2022 16:12:40 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1656598351733138.8688270947107;
 Thu, 30 Jun 2022 07:12:31 -0700 (PDT)
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
X-Inumbo-ID: b2ad12bf-f87e-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; t=1656598353; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=igP5pbu1ys8J5ghzmGq2c8dwV6JMoo/gG3IxyyAFRp8s2HU7mtrvDZzDox00vjVF9oXi4R262oNihHJmiPVduJYrx3wTgA0yTMbecoAt2lPmYLxFZriAUG3dXQR35Tc0QaSsrMrkBYuI/dch5aRLe0MHfxOFdoFCzBQ0N/JeCC4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1656598353; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=j8joM4+E+WUJ6OrZpzbtO/GPRIcptxzBks4vfrc1hEg=; 
	b=LsK0vSANe+1js72lexBa6sYWvVYzZ9tWULgW+mcbScyqaQRh0MSMNPM0ixD8G+dFHtFrMscqCQiktRmdXPxllyvV13QELm9Rcr5ccBnSUv4Ch4m7tC8aI6kerlbYRBxnwNUq2uZkEq9oLIowipQ8CX9UXwxdIAkEu8mRImk8qYg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1656598353;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=j8joM4+E+WUJ6OrZpzbtO/GPRIcptxzBks4vfrc1hEg=;
	b=DHSKSmUxKjGaWQIp6SbJpTsV6j/uWze+uBNOLh/crYghB9NThHbWu0sv21KGYSlq
	oiNCgP15WnvQr9iW+ZG2lIVX9NWtXR6nSIDMXgZxThqruODDxSoA18YAJnmV0e7bqO7
	xgnOWvMmAFByjaR3RNEcAkqB4djKCIDHuKMaoHlo=
Message-ID: <e6aacf59-5752-c8f6-ff5b-4755b3f1de98@apertussolutions.com>
Date: Thu, 30 Jun 2022 10:10:26 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v9 1/3] xsm: create idle domain privileged and demote
 after setup
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
 scott.davis@starlab.io, jandryuk@gmail.com, christopher.clark@starlab.io,
 Luca Fancellu <luca.fancellu@arm.com>, Julien Grall <jgrall@amazon.com>,
 Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Jan Beulich
 <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli
 <dfaggioli@suse.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <20220630022110.31555-1-dpsmith@apertussolutions.com>
 <20220630022110.31555-2-dpsmith@apertussolutions.com>
 <Yr1ryXy/mMi6tJzY@Air-de-Roger>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <Yr1ryXy/mMi6tJzY@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External


On 6/30/22 05:24, Roger Pau Monné wrote:
> On Wed, Jun 29, 2022 at 10:21:08PM -0400, Daniel P. Smith wrote:
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
>> Reviewed-by: Rahul Singh <rahul.singh@arm.com>
>> Tested-by: Rahul Singh <rahul.singh@arm.com>
> 
> LGTM:
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks, Roger.

Thank you.

