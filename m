Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A2B573B74
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jul 2022 18:45:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.366916.597878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBfUD-0007X4-Rg; Wed, 13 Jul 2022 16:45:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 366916.597878; Wed, 13 Jul 2022 16:45:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBfUD-0007Up-O9; Wed, 13 Jul 2022 16:45:17 +0000
Received: by outflank-mailman (input) for mailman id 366916;
 Wed, 13 Jul 2022 16:45:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qtki=XS=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1oBfUB-0007UT-Nt
 for xen-devel@lists.xenproject.org; Wed, 13 Jul 2022 16:45:16 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a0917d8-02cb-11ed-bd2d-47488cf2e6aa;
 Wed, 13 Jul 2022 18:45:14 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1657730708771749.0087011726923;
 Wed, 13 Jul 2022 09:45:08 -0700 (PDT)
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
X-Inumbo-ID: 2a0917d8-02cb-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; t=1657730710; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=n5ToOKuGl62OEFSUf+VMJh0rYq0z80qscpY0a8l5cpR+DQSFeSkpHDPFfjFZWN5ZHdIN9lpKEEsLAcuzyP3VGZFf+kiHPaD045NJZy8rj8siKzE2E0cafW5iJQtQgv8NLby1NG5wGHH0OcfxVADxEkcDqWPVxQVxD+w25jFzak0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1657730710; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=GB1FqFfHp7Do6un/kvkk+uc3ZVl2jYxAFcMB8ma8vag=; 
	b=lZd0+PQAWwH7srOqLGsZRflZwOQzHqdv9V8mpD+fh4ZCGC+J8CFhTneFeo1ovtQXrl9NTeexts8OOZvaZUMhM5qWV3RmyAzssK06wDG+nvZDrLs4ZLviIMNfoKwY7UeGcGbNEAe+Gjv7T88d4/Im+56IhSAeniDtS5kTuR2CJx8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1657730710;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=GB1FqFfHp7Do6un/kvkk+uc3ZVl2jYxAFcMB8ma8vag=;
	b=R8VKvvwog4LJwOWsU6JiH3320T0HdERIAi1p4NCeQLNnOFEUre8M86ClhhTbM+LU
	G4tvf6+zawT8gADsSLwDR348YX+Its7HhTn/IjoSAp7r/IiiRtAqCpHMS55FUML/y2f
	hOhURcuy7HxclUTXkrAXVYaw/KbSzdeH8Fqvme94=
Message-ID: <87a70ec9-e8d5-f30b-8ab8-aea817101cd1@apertussolutions.com>
Date: Wed, 13 Jul 2022 12:44:55 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Hyperlaunch Working Group: Status and Next Steps (15JUL22)
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Rich Persaud <persaur@gmail.com>,
 "Smith, Jackson" <rsmith@RiversideResearch.org>,
 "Brookes, Scott" <sbrookes@RiversideResearch.org>,
 "Lei, Jason" <jlei@RiversideResearch.org>,
 Scott Davis <scott.davis@starlab.io>
References: <bb409564-0f4b-b59c-9a62-574028e6029b@apertussolutions.com>
 <ba284333-bd95-9ca2-e453-14df5c047bb6@xen.org>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <ba284333-bd95-9ca2-e453-14df5c047bb6@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 7/13/22 12:42, Julien Grall wrote:
> Hi,
> 
> On 10/07/2022 23:45, Daniel P. Smith wrote:
>> Greetings All,
>>
>> We will be holding a Hyperlaunch Working Group meeting on Friday, July
>> 15th at 0900PDT/1200EDT/1700GMT.
> 
> Did you mean 16:00 GMT rather than 17:00 GMT?

Yes, you are correct, I did mean 16:00 GMT. My apologies for that,
hopefully it did not cause any confusion.

v/r,
dps

> Cheers,
> 

