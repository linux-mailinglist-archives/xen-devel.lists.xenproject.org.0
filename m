Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE69C53BFE0
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jun 2022 22:35:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.341262.566470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwrWG-0005Dl-PI; Thu, 02 Jun 2022 20:34:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 341262.566470; Thu, 02 Jun 2022 20:34:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwrWG-0005BK-MJ; Thu, 02 Jun 2022 20:34:12 +0000
Received: by outflank-mailman (input) for mailman id 341262;
 Thu, 02 Jun 2022 20:34:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UOPH=WJ=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nwrWE-0005BE-Tj
 for xen-devel@lists.xenproject.org; Thu, 02 Jun 2022 20:34:11 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59129eec-e2b3-11ec-837f-e5687231ffcc;
 Thu, 02 Jun 2022 22:34:08 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1654202041607149.97825902238378;
 Thu, 2 Jun 2022 13:34:01 -0700 (PDT)
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
X-Inumbo-ID: 59129eec-e2b3-11ec-837f-e5687231ffcc
ARC-Seal: i=1; a=rsa-sha256; t=1654202044; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jI7oPNrdL9B7UXMz4sP5T3Td9d/l7FTXZagqhEHve1BSXm8wyVJAXn1Uh/OAt/dd2rO8XK+LAxDaBM41cFJMI6aQeTxLL3fZR+qS2sVzftN+UGu6teqThbI+ob4bu/kKrAxjWLSddEdIB8KCmIkMfc+K8V1eouvKWITWtpZlcEo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1654202044; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=jmSMCc7An9p2x9gZRj95kKJbQaxi7b3qBXJ2yh2fLb4=; 
	b=SZIdSomcZ8qoWC3N05KhHFUKgtZ1YWn9zki7C0n00KJe5SEKh6YU5prwA9fWJuV5F+niZGtAS0XffytG16w8PJQSxVbTj2N1vdBpI/z3ilgaE+M9/eYy+vtJ1f2551QtcDC1rZg/ARgnYsKHnK2UdTq8hogOcbOFxRIwBuWeXAY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1654202044;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:To:To:Cc:Cc:References:From:From:Subject:Subject:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=jmSMCc7An9p2x9gZRj95kKJbQaxi7b3qBXJ2yh2fLb4=;
	b=hOdOCoF157gkQgwvsbgA/S8C5pQ4sM+WtOj3jCu373rcbtWR5UlFX/mXQDTpsj10
	MQWAwBtazU4strePB6PgKzmhvooaPBtVRmv03OgLJXJTm5uZe3xBOqgjvg6ELqTHrmV
	raUe9gv950HRntX4HcUJG36gs8ye+KPJlIpV6UzI=
Message-ID: <da87eeb4-516c-64bf-ee96-619a19875add@apertussolutions.com>
Date: Thu, 2 Jun 2022 16:32:30 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: xen-devel@lists.xenproject.org
Cc: scott.davis@starlab.io, christopher.clark@starlab.io, jandryuk@gmail.com,
 Luca Fancellu <luca.fancellu@arm.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20220531145646.10062-1-dpsmith@apertussolutions.com>
 <20220531145646.10062-3-dpsmith@apertussolutions.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v8 2/2] flask: implement xsm_set_system_active
In-Reply-To: <20220531145646.10062-3-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 5/31/22 10:56, Daniel P. Smith wrote:
> This commit implements full support for starting the idle domain privileged by
> introducing a new flask label xenboot_t which the idle domain is labeled with
> at creation.  It then provides the implementation for the XSM hook
> xsm_set_system_active to relabel the idle domain to the existing xen_t flask
> label.
> 
> In the reference flask policy a new macro, xen_build_domain(target), is
> introduced for creating policies for dom0less/hyperlaunch allowing the
> hypervisor to create and assign the necessary resources for domain
> construction.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> Tested-by: Luca Fancellu <luca.fancellu@arm.com>

I am still debugging, but I now have a dom0 crashing due to an AVC that
is being tripped with this patch applied to the tip of staging. I just
wanted to give a heads-up, and I will follow back up once I can
determine the root cause.

v/r,
dps

