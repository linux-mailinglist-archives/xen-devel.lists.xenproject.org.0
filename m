Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1BF98781B
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 19:05:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805820.1217046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1strui-0000av-Dr; Thu, 26 Sep 2024 17:04:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805820.1217046; Thu, 26 Sep 2024 17:04:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1strui-0000ZQ-Aw; Thu, 26 Sep 2024 17:04:24 +0000
Received: by outflank-mailman (input) for mailman id 805820;
 Thu, 26 Sep 2024 17:04:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SdHj=QY=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1struh-0000ZK-3X
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 17:04:23 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f4162bd-7c29-11ef-a0ba-8be0dac302b0;
 Thu, 26 Sep 2024 19:04:22 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1727370253541397.23243337335043;
 Thu, 26 Sep 2024 10:04:13 -0700 (PDT)
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
X-Inumbo-ID: 5f4162bd-7c29-11ef-a0ba-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1727370256; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ONY46fMVThxq8xzaqeSM5C/CD3uiYsdQdp0bSJ5YD8PfdJqlocMGjqzJKIBY05XYp1/AFC8HfRe56twxS1BRdgE81ObR+U3xL+lJ9RCMHiP3Ve9se+L8wlDmrkoO417DlK99hcwCPIBBt7dO2rhCQWqPYQxvo49juLo83nk5eEs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1727370256; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4gJYTIwepA8VoDbkOkHTpDNcs0TrMyCWhkmcclRP3JE=; 
	b=EADoLHZZkUvN+9/Wjnx/memQNUHGvNZrs7qhMWSODf/a1OCxsy56HLIqpHCpOt/njuHF6j/Hh+n8xed+mrlalbgPf5Tgu5aemxEg8PtZ8MjgJWbzdvVfqFJb24cWkl1J2O/8fbu7/uEOZLpxEVk+0K1GbSZ7IzVkelluHMkvFBM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1727370256;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=4gJYTIwepA8VoDbkOkHTpDNcs0TrMyCWhkmcclRP3JE=;
	b=Scl3Lzjamw0UgItgPTa6V/Gqf1sNJgsLQ2yv0HNez3yh/03M3iJXWpu/jGN1zqZo
	X77x8TYez0saCYu7geEOR30WOaKrJFf9WW6sh1QIQ+2V8njdJew0vXEeYotEeRAM01Y
	g6yOfQwy1YZstlpmba76M48XKRkDsZtU5EbfjIto=
Message-ID: <4baaf012-fa7b-4e37-9910-f4f01a5ea40e@apertussolutions.com>
Date: Thu, 26 Sep 2024 13:04:12 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/44] x86/boot: split bootstrap_map_addr() out of
 bootstrap_map()
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20240830214730.1621-1-dpsmith@apertussolutions.com>
 <20240830214730.1621-10-dpsmith@apertussolutions.com>
 <10217d0f-441c-4991-b935-d27a6dd4b49b@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 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
In-Reply-To: <10217d0f-441c-4991-b935-d27a6dd4b49b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 9/4/24 02:49, Jan Beulich wrote:
> On 30.08.2024 23:46, Daniel P. Smith wrote:
>> From: Andrew Cooper <andrew.cooper3@citrix.com>
>>
>> Using an interface based on addresses directly, not modules.
>>
>> No functional change.
> 
> Okay, a mechanical transformation. But what's the goal?

I would defer to Andy's reply.

>> --- a/xen/arch/x86/include/asm/setup.h
>> +++ b/xen/arch/x86/include/asm/setup.h
>> @@ -34,6 +34,7 @@ void setup_io_bitmap(struct domain *d);
>>   
>>   unsigned long initial_images_nrpages(nodeid_t node);
>>   void discard_initial_images(void);
>> +void *bootstrap_map_addr(uint64_t start, uint64_t end);
> 
> Better paddr_t?

I don't see why not. It was Andy's patch, so unless he has an objection, 
I can change it.

v/r,
dps

