Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F73BADBE94
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 03:32:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017648.1394639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRLBl-0000j3-QJ; Tue, 17 Jun 2025 01:32:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017648.1394639; Tue, 17 Jun 2025 01:32:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRLBl-0000h9-NY; Tue, 17 Jun 2025 01:32:37 +0000
Received: by outflank-mailman (input) for mailman id 1017648;
 Tue, 17 Jun 2025 01:32:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m6Tl=ZA=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1uRLBk-0000h3-Hs
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 01:32:36 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f134759c-4b1a-11f0-a309-13f23c93f187;
 Tue, 17 Jun 2025 03:32:35 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1750123946759626.2785154087962;
 Mon, 16 Jun 2025 18:32:26 -0700 (PDT)
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
X-Inumbo-ID: f134759c-4b1a-11f0-a309-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; t=1750123948; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DhOg1eh3CgOeEJojCIZS3aIh3pbnsVdf9Zc/lUj97sdyfAA0vW5qQ/fGxR2MKrhg3CrkLTD0Q0EVfbtPox2AuteQ81IXkzJD1tmYfSv9I7z5k1TKSqxdhUd6dhfJW0zyKilIS4rpsJIdbupihHRhrGHE4i8TaG242T0JTcI1hJY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750123948; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=JJHOoCCrFEDDE3+elqGVFHThJKLiglOSjqYyAnkLAR4=; 
	b=em2yRfKvV6AQXbJ+NnLBHMlykUp7d6guIKj+hPFmI1lHDhNL326qaPkUlVfksGkeONvSgGrSV4yZvy/EBuIcPJcKWenCxkx+Gf/uC841MYSoKjcOBJtv3kxr1k/hTLI7p24oVooz+OvKzBMMVai6HN3Sl99vSZIH3qjYbaIJs2M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750123948;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=JJHOoCCrFEDDE3+elqGVFHThJKLiglOSjqYyAnkLAR4=;
	b=QcRmgWtz0fN+/5HFjF7aoqSoGbRdqpb6nUB9tzUWbPY17hBOIKJjVGheAgprLjGs
	mfEoO+hGyjkqXnN8nH6X15P4sx2zQ2puqNcHS3QEf9S3PAUoo/sCNgH20k2WFjcI8EI
	DCy2jqJxxrAQrjJ2AWNLoN9lkhAtIptz/ekf8U0w=
Message-ID: <9f430606-f79e-470b-8323-92cd8f0f8ddd@apertussolutions.com>
Date: Mon, 16 Jun 2025 21:32:24 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/19] xen/dt: Move bootfdt functions to xen/bootfdt.h
Content-Language: en-US
To: Alejandro Vallejo <agarciav@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com>
 <20250530120242.39398-1-agarciav@amd.com>
 <20250530120242.39398-13-agarciav@amd.com>
 <a66c11c4-cfac-4934-b1f5-e07c728db8de@apertussolutions.com>
 <DAESPUKPILGY.3MLDXU7XG65X1@amd.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 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
In-Reply-To: <DAESPUKPILGY.3MLDXU7XG65X1@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 6/5/25 14:03, Alejandro Vallejo wrote:
> On Mon Jun 2, 2025 at 10:25 PM CEST, Daniel P. Smith wrote:
>>> +/* Helper to read a big number; size is in cells (not bytes) */
>>> +static inline u64 dt_read_number(const __be32 *cell, int size)
>>> +{
>>> +    u64 r = 0;
>>> +
>>> +    while ( size-- )
>>> +        r = (r << 32) | be32_to_cpu(*(cell++));
>>> +    return r;
>>> +}
>>
>> I know you are trying to keep code changes to a minimal but let's not
>> allow poorly constructed logic like this to continue to persist. This is
>> an unbounded, arbitrary read function that is feed parameters via
>> externally input. The DT spec declares only two number types for a
>> property, u32 and u64, see Table 2.3 in Section 2.2.4. There is no
>> reason to have an unbounded, arbitrary read function lying around
>> waiting to be leveraged in exploitation.
> 
> Seeing how it's a big lump of code motion, I really don't want to play games
> or I will myself lose track of what I changed and what I didn't.

You could have a preliminary commit before this one that removes a 
clearly vulnerable code, and then this commit can move it. Or reverse it 
and do the code move and fix it.

> While I agree it should probably be a switch statement (or factored away
> altogether), this isn't the place for it.

All due respect, but leaving code that is clearly a sitting 
vulnerability mine is not really a great choice.

V/r,
dps


