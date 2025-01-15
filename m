Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 181F9A129C5
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 18:24:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872922.1283919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY76j-0005bX-6b; Wed, 15 Jan 2025 17:23:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872922.1283919; Wed, 15 Jan 2025 17:23:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY76j-0005ZK-3z; Wed, 15 Jan 2025 17:23:09 +0000
Received: by outflank-mailman (input) for mailman id 872922;
 Wed, 15 Jan 2025 17:23:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3mb0=UH=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tY76g-0005ZE-H0
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 17:23:07 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ff96936-d365-11ef-99a4-01e77a169b0f;
 Wed, 15 Jan 2025 18:23:04 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1736961774356471.16132186163145;
 Wed, 15 Jan 2025 09:22:54 -0800 (PST)
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
X-Inumbo-ID: 5ff96936-d365-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1736961777; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JPJ53sX8UMHZxHB/qZhg0MDM871WOR2U3dcHIByM1BJ7ggYA1+diM90NF9jw/7VZ/d0aHRDrAf/7+JRdNc4HYOOnVujqQhei6EMRwcL3Iwx+T4oaC37iDLWloU8L2sunHHeXdiwZ26Gei4k/jhO9TFiBGZwQCWbjILeXiAiXktQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1736961777; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=lIXwxXJ8lS/esOK+izgmugOLHWpMoMlSbUHnye4+k4Q=; 
	b=TNBl30c3NevlYfa5E7/0gdWO+e15+sjpR3TAbgZZNx3QGzifAW9f6EDsSYrVdfGtJJe1cFB0/j7aMNIY2bt7zvPDg7cOfLX5hKuO+T9V9AeXvqD7sWXxfG0WhfKbZJVITKLdsLRHb3nzrxRXOKZmP6COl+dxdwzemPPFAanhFGk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736961776;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=lIXwxXJ8lS/esOK+izgmugOLHWpMoMlSbUHnye4+k4Q=;
	b=XXo34WAhzsdnh6OP4FSEm+qwdKaVU0N58lrrVSIfXxcZHNC6KeBhlsA/xGJZxICw
	beNajCFQByL/UWBrB9weCs9U9FSJq8QWWLd/hZbuPR7wcX9V9MX6IG7OeyPaeNf2F+K
	9S1JqET2YK0AfAxNeIOd/LAqf4llomHTtgM/eO9I=
Message-ID: <245a2a00-98c0-498f-8a9e-ca62dbe59a71@apertussolutions.com>
Date: Wed, 15 Jan 2025 12:22:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/15] x86/boot: add cmdline to struct boot_domain
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241226165740.29812-1-dpsmith@apertussolutions.com>
 <20241226165740.29812-4-dpsmith@apertussolutions.com>
 <508cff3c-3fd4-4ab7-89ef-30a72a267111@amd.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <508cff3c-3fd4-4ab7-89ef-30a72a267111@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 1/10/25 14:52, Jason Andryuk wrote:
> On 2024-12-26 11:57, Daniel P. Smith wrote:
>> Add a container for the "cooked" command line for a domain. This 
>> provides for
>> the backing memory to be directly associated with the domain being 
>> constructed.
>> This is done in anticipation that the domain construction path may 
>> need to be
>> invoked multiple times, thus ensuring each instance had a distinct memory
>> allocation.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> 
> 
>> @@ -1018,39 +1037,52 @@ static struct domain *__init 
>> create_dom0(struct boot_info *bi)
>>           panic("Error creating d%uv0\n", bd->domid);
>>       /* Grab the DOM0 command line. */
>> -    if ( bd->kernel->cmdline_pa || bi->kextra )
>> +    if ( (bd->kernel->cmdline_pa &&
>> +          ((char *)__va(bd->kernel->cmdline_pa))[0]) ||
>> +         bi->kextra )
>>       {
>> -        if ( bd->kernel->cmdline_pa )
>> -            safe_strcpy(cmdline,
>> -                        cmdline_cook(__va(bd->kernel->cmdline_pa), 
>> bi->loader));
>> +        size_t cmdline_size = domain_cmdline_size(bi, bd);
>> +
>> +        if ( cmdline_size )
>> +        {
>> +            if ( !(cmdline = xzalloc_array(char, cmdline_size)) )
>> +                panic("Error allocating cmdline buffer for %pd\n", d);
> 
> I guess I wasn't clear last time.  Instead of two levels of indent, I 
> was thinking at the top level:
> 
>      /* Grab the DOM0 command line. */
>      cmdline_size = domain_cmdline_size(bi, bd);
>      if ( cmdline_size )
>      {
> 
> domain_cmdline_size() checks all the pointers, so this removes 
> duplication and indent.

But it is possible for there to be no command line, thus there is a 
legitimate case where cmdline_size will be 0. If it is 0, there is no 
reason to go through all of this logic.

v/r,
dps

