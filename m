Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F355386AB
	for <lists+xen-devel@lfdr.de>; Mon, 30 May 2022 19:17:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.338704.563510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvj0O-0000Yz-Jx; Mon, 30 May 2022 17:16:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 338704.563510; Mon, 30 May 2022 17:16:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvj0O-0000W2-Ga; Mon, 30 May 2022 17:16:36 +0000
Received: by outflank-mailman (input) for mailman id 338704;
 Mon, 30 May 2022 17:16:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=epuh=WG=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nvj0M-0000Vv-Ul
 for xen-devel@lists.xenproject.org; Mon, 30 May 2022 17:16:35 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f3824bc-e03c-11ec-837f-e5687231ffcc;
 Mon, 30 May 2022 19:16:32 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1653930988362815.3065671106809;
 Mon, 30 May 2022 10:16:28 -0700 (PDT)
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
X-Inumbo-ID: 3f3824bc-e03c-11ec-837f-e5687231ffcc
ARC-Seal: i=1; a=rsa-sha256; t=1653930989; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FZSmp3w6yb9TuGGL/tLA4W9hnHp5WDTpLElYoQsekbmyhBNRVHFhfqRc75HGvMH8zYHkozukU9iQrJMFxY9VPjgbNe2iq00L8bv3e/wryT5KIjzlnSdaYOaMNFUYDSIdrjAV0ClK1Hfd/dy0hKoXhfJknzNw84gOsYnzHdJBLYg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1653930989; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=vEH37xc67Ijg3jQLE7drU5kLQbof2IZGxoa4VwC/JJA=; 
	b=D9qHgPnBkg0LmOZqSpAamt8V/zydi9ktLdTaFijg/Av356APZpo19YH6diP7HQLe73ekgGXSy2ngF32+QI7M+6n/cZOPsIHgDVZYSx0OpnJYJ6rjZ2BpdeySU8oNXnq0jlo1vM+Z/aSt8NkNcmaYALqDHQetK+R1wJ+izGlRWhY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1653930989;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:To:To:Cc:Cc:References:From:From:Subject:Subject:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=vEH37xc67Ijg3jQLE7drU5kLQbof2IZGxoa4VwC/JJA=;
	b=bHT54zAEXy0zwUQS8tv84Fj3LridkfQyE7HlxqxXKTi9bvMMEMdT2hxHteo47wdz
	iIaePxaoNgqQ/9gVHsXU9lRMJVmUslzNE56cj68WQ8uBehgrVVQrCxLn1tZfr1nsfLL
	0GAL6koLpHVwLJesBMzKWgsdmqNB/H7KrYPFkqEs=
Message-ID: <0c894277-85c1-faa7-a360-a82531733f12@apertussolutions.com>
Date: Mon, 30 May 2022 13:15:00 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: xen-devel@lists.xenproject.org
Cc: scott.davis@starlab.io, jandryuk@gmail.com, christopher.clark@starlab.io
References: <20220511113035.27070-1-dpsmith@apertussolutions.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: PING: [PATCH v7 0/2] Adds starting the idle domain privileged
In-Reply-To: <20220511113035.27070-1-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External


On 5/11/22 07:30, Daniel P. Smith wrote:
> This series makes it so that the idle domain is started privileged under the
> default policy, which the SILO policy inherits, and under the flask policy. It
> then introduces a new one-way XSM hook, xsm_transition_running, that is hooked
> by an XSM policy to transition the idle domain to its running privilege level.
> 
> Changes in v7:
> - adjusted error message in default and flask xsm_set_system_active hooks
> - merged panic messages in arm and x86 setup.c to a single line
> 

Pinging to see if there are open issues I need to address or is the
series acceptable? IIU I am missing an ACK on patch 1 of the series from
x86 and sched maintainers. If it is already in your queues, apologies
for the nag.

V/r,
Daniel P. Smith

