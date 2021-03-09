Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DF8332395
	for <lists+xen-devel@lfdr.de>; Tue,  9 Mar 2021 12:04:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95339.179962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJaAE-0005NM-B2; Tue, 09 Mar 2021 11:04:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95339.179962; Tue, 09 Mar 2021 11:04:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJaAE-0005Mx-7D; Tue, 09 Mar 2021 11:04:34 +0000
Received: by outflank-mailman (input) for mailman id 95339;
 Tue, 09 Mar 2021 11:04:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Bv84=IH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lJaAB-0005Mn-QB
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 11:04:31 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 28e0eb0f-9480-4ced-815b-cb0b29b975ae;
 Tue, 09 Mar 2021 11:04:30 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 66B8BAB8C;
 Tue,  9 Mar 2021 11:04:29 +0000 (UTC)
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
X-Inumbo-ID: 28e0eb0f-9480-4ced-815b-cb0b29b975ae
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615287869; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bWIGzd4e8jN/Sk9xCn2VfslJvP8ZvleK4Z70J4q4SGM=;
	b=AjqsHZRJW9dYQMq3E+P6+n81jNhXH06Hz5Ux7fwDw85BPm2vZeFowbyEKbZX460y1XCYhO
	qFQnOIdaFHs2BXjReQsxEeo9BvFKDGDIzpnmf4UvqvlKNg87NZIYxEUH6S+MLvc2A4KhA8
	0BeEbHytBYFcN4fO1z2VpMzxPf+F8rg=
Subject: Re: [PATCH] xen/arm: Use register_t type in cpuinfo entries
To: Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <b65f29a67f87de8b25cd23b5fa111c50a2efb1d0.1615209093.git.bertrand.marquis@arm.com>
 <712d7c6a-3ace-a6b7-a188-faeb4f1258d3@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5bb482ff-a689-67e3-1bc7-30b9bf24034e@suse.com>
Date: Tue, 9 Mar 2021 12:04:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <712d7c6a-3ace-a6b7-a188-faeb4f1258d3@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08.03.2021 20:48, Julien Grall wrote:
> On 08/03/2021 17:18, Bertrand Marquis wrote:
>> --- a/xen/arch/arm/smpboot.c
>> +++ b/xen/arch/arm/smpboot.c
>> @@ -321,7 +321,8 @@ void start_secondary(void)
>>       if ( !opt_hmp_unsafe &&
>>            current_cpu_data.midr.bits != boot_cpu_data.midr.bits )
>>       {
>> -        printk(XENLOG_ERR "CPU%u MIDR (0x%x) does not match boot CPU MIDR (0x%x),\n"
>> +        printk(XENLOG_ERR "CPU%u MIDR (0x%"PRIregister") does not match boot "
>> +               "CPU MIDR (0x%"PRIregister"),\n"
> 
> For printk messages, we don't tend to split it like that (even for more 
> than 80 characters one). Instead, the preferred approach is:
> 
> printk(XENLOG_ERR
>         "line 1\n"
>         "line 2\n")

Except of course you want to repeat XENLOG_ERR for the 2nd line.

Jan

