Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA934F3010
	for <lists+xen-devel@lfdr.de>; Tue,  5 Apr 2022 14:25:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298954.509216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbiFR-0007hh-6A; Tue, 05 Apr 2022 12:25:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298954.509216; Tue, 05 Apr 2022 12:25:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbiFR-0007eX-2k; Tue, 05 Apr 2022 12:25:25 +0000
Received: by outflank-mailman (input) for mailman id 298954;
 Tue, 05 Apr 2022 12:25:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FxJD=UP=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nbiFP-0007eR-3E
 for xen-devel@lists.xenproject.org; Tue, 05 Apr 2022 12:25:23 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 757d0d43-b4db-11ec-a405-831a346695d4;
 Tue, 05 Apr 2022 14:25:21 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1649161515434997.570147188992;
 Tue, 5 Apr 2022 05:25:15 -0700 (PDT)
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
X-Inumbo-ID: 757d0d43-b4db-11ec-a405-831a346695d4
ARC-Seal: i=1; a=rsa-sha256; t=1649161517; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=X7kZ0oR51UZopkxbvr3/rdqmyTBa5QiM/mN6bE9vW4TCB4qvJDMmg4Qnsw1DwxBH4RgHL1QFDuq94bd7uJGEmk9Tm/HTL7xNuDuoota8y5N/v9pQBtOws/bvc0yvDBG0DOwArNTVelOUXP3KEMufi2EqG23so8w1D9A+f4kmRjw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1649161517; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=fR/2PJkBquhZn9cqmyUgmmbvio8ZT+SIOP6kXLDgiwI=; 
	b=H/z2c9V5sMCQNYHlfLw0a/MGNSe0+O/oActtBKt9ELP/Vjt06j8CnrDNfiOoAYqcZMVSXFu6PjpECqsmOxu6eRsCfbJH12G6zFb9C4jaD6BR/vM0JWWH4+SLR0t1XibzFrrmwKBcyFNH0B7zPRZBQzDu4CwhIKBlNKncnJ2nf3s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1649161517;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=fR/2PJkBquhZn9cqmyUgmmbvio8ZT+SIOP6kXLDgiwI=;
	b=e3lv574t4H2otQVEcnWQnLN30+e+kFA32FFRPrxAmvlxqMJ0Xa4KwGX4trPXL6RU
	+gdUGhvOVSpL7VOcFVD82XPc+REh0FtldC5jbo8lS2WJUGTMbzIsbeyKJ1LHj5H9X5U
	2UjM+26bfC4gjg22RI5Wd4xGSB+4rpFgqR/n0bBY=
Message-ID: <74f71b63-d8da-d920-a679-e53340152b80@apertussolutions.com>
Date: Tue, 5 Apr 2022 08:24:50 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/2] arch: ensure idle domain is not left privileged
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: scott.davis@starlab.io, jandryuk@gmail.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20220330230549.26074-1-dpsmith@apertussolutions.com>
 <20220330230549.26074-3-dpsmith@apertussolutions.com>
 <f1c3923a-9201-c200-1b1e-9a258d47e64a@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <f1c3923a-9201-c200-1b1e-9a258d47e64a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 4/5/22 04:26, Jan Beulich wrote:
> On 31.03.2022 01:05, Daniel P. Smith wrote:
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -589,6 +589,9 @@ static void noinline init_done(void)
>>      void *va;
>>      unsigned long start, end;
>>  
>> +    /* Ensure idle domain was not left privileged */
>> +    ASSERT(current->domain->is_privileged == false) ;
> 
> I think this should be stronger than ASSERT(); I'd recommend calling
> panic(). Also please don't compare against "true" or "false" - use
> ordinary boolean operations instead (here it would be
> "!current->domain->is_privileged").

Ack.

v/r,
dps

