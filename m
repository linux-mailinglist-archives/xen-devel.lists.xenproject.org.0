Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF064575525
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jul 2022 20:38:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.367769.598891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oC3iV-00057B-B4; Thu, 14 Jul 2022 18:37:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 367769.598891; Thu, 14 Jul 2022 18:37:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oC3iV-00053w-7t; Thu, 14 Jul 2022 18:37:39 +0000
Received: by outflank-mailman (input) for mailman id 367769;
 Thu, 14 Jul 2022 18:37:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3zuY=XT=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1oC3iT-00053q-PP
 for xen-devel@lists.xenproject.org; Thu, 14 Jul 2022 18:37:38 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 06d408b9-03a4-11ed-bd2d-47488cf2e6aa;
 Thu, 14 Jul 2022 20:37:36 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1657823849553651.8044949330165;
 Thu, 14 Jul 2022 11:37:29 -0700 (PDT)
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
X-Inumbo-ID: 06d408b9-03a4-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; t=1657823852; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lET8+YswKQnt9z1OT2xhDqDPbpGN8hvbv6gfW19MgBRoj1wCQEOxY/PiMy/AHi5f4lTuPWH75yj7qNbVsIZh5SHsVB363AGotwIZt9ynF5coDTtmjxL8kTVmzFSkixQzQKmdGqUGTeKoVbWij0Lr+c3dPMjTahfwTzuq5iqMdMI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1657823852; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=fG+QZHlO/wSEPhTewtGSNBoT1Wkf0kp1paagS1eHz+k=; 
	b=cSNSDU81n7BxlAfyQ02HQTxh/EbDrq7C6k6iOYF+Ld3bBX96WhA3hKSsEw97HJPieN8S4Vxo8rja32tMjAg94WBRY5UDGlHrrDtacaaUitduLsH1ECgFOCLaJ4fIzjiiVigJFhfrAOzL2+MuD+zUf5IS9K3aFJgbcGDNby4W32o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1657823852;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:From:From:To:To:Cc:Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=fG+QZHlO/wSEPhTewtGSNBoT1Wkf0kp1paagS1eHz+k=;
	b=ops2pci6OZN4lCJORnY+Nh+w+/3QcxVHaEgX+sq5tSEuYc2CGr6V77MbYBxJmew+
	r2zg1GsxsjDAQvZ4SfqI+YJKzdtO3CdUDRqA7OcfI2buKLKoKLKLXI8mnd/Gj55nx5A
	NXVYMTPo241rNmFsWEYCGTBoxYI20KjqAL1iycUI=
Message-ID: <08f742e3-eff2-a53c-bf1d-91226a223d4f@apertussolutions.com>
Date: Thu, 14 Jul 2022 14:37:14 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Hyperlaunch Working Group: Status and Next Steps (15JUL22)
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Rich Persaud <persaur@gmail.com>,
 "Smith, Jackson" <rsmith@RiversideResearch.org>,
 "Brookes, Scott" <sbrookes@RiversideResearch.org>,
 "Lei, Jason" <jlei@RiversideResearch.org>,
 Scott Davis <scott.davis@starlab.io>
References: <bb409564-0f4b-b59c-9a62-574028e6029b@apertussolutions.com>
In-Reply-To: <bb409564-0f4b-b59c-9a62-574028e6029b@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 7/10/22 18:45, Daniel P. Smith wrote:
> Greetings All,
> 
> We will be holding a Hyperlaunch Working Group meeting on Friday, July
> 15th at 0900PDT/1200EDT/1700GMT. The agenda will be ready by Wednesday
> and can be found at the below cryptpad link. Call-in details will be
> published in the agenda once it has been set up.
> 
> Agenda:
> https://cryptpad.fr/pad/#/2/pad/edit/0uw06jY29gjSJMxs8Q9CWipp/
> 
> 


Agenda has been published with the call in being via GoTo Meeting[1]. If
anyone would like to see specific questions addressed, feel free to
contribute to the Community Topics section.


[1] https://meet.goto.com/apertussolutions


V/r,
Daniel P. Smith
Apertus Solutions, LLC

