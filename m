Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AAD9BA19D
	for <lists+xen-devel@lfdr.de>; Sat,  2 Nov 2024 18:16:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.829551.1244538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7Hj6-0002y1-7U; Sat, 02 Nov 2024 17:15:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 829551.1244538; Sat, 02 Nov 2024 17:15:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7Hj6-0002ut-40; Sat, 02 Nov 2024 17:15:52 +0000
Received: by outflank-mailman (input) for mailman id 829551;
 Sat, 02 Nov 2024 17:15:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RajI=R5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t7Hj3-0002uj-R2
 for xen-devel@lists.xenproject.org; Sat, 02 Nov 2024 17:15:49 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19063a49-993e-11ef-a0c5-8be0dac302b0;
 Sat, 02 Nov 2024 18:15:47 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 173056774025455.43185237431601;
 Sat, 2 Nov 2024 10:15:40 -0700 (PDT)
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
X-Inumbo-ID: 19063a49-993e-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg4LjUxIiwiaGVsbyI6InNlbmRlcjQtb2YtbzUxLnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6IjE5MDYzYTQ5LTk5M2UtMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwNTY3NzQ3LjcxNTE1Niwic2VuZGVyIjoiZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; t=1730567742; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=l6FXH4SD2BCbR/Mky2ny7yVYQ+muQzxn19b5hhep1hT59y24aLgO7jxJnt/pOibP20uMjENy3wcSVd9vT+zsj9rjFdaSR2SDKU4MzI6lS6AYWmMb0E2eAocbu/Gz3C6+gdr2yhXLIGtZo6pwwKBS8CJ/49tFJympbbyNvPBEJl4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1730567742; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=X/1eYTu5iCclYZG5/QUy7XmL1x0wKedDmLPIgk5btTM=; 
	b=geNXYWpswKuc6OKbMY2JZ5N9+i9UgOP7h/KuqwRQhlXJ8IQAewh1Wf8wZhitgAbSGu5y53fuy9V5WKYM/4Uw+fAdz9w3fY0KxhvsomjKw3d+cC3ipqs9DiEyZfEXHOe9df2Z9sNmBMAZyWr/uBmlmV7osw2t4L5qGW/bUhIsJdg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1730567742;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=X/1eYTu5iCclYZG5/QUy7XmL1x0wKedDmLPIgk5btTM=;
	b=dMlt6eSxBuy1UmjzntaeQsEgj9X8c/mpxymRRn5OyJSJnsKWTgm3ym0ZQq67ya1J
	l+a1h/O6WWQEZOtYKgb7nXrWcdiRliva2Ri9rR7GrkvAMVLSxsgquPlguEf/cDwD01d
	bYG1oVTKwW/IoluiSW030BC1dhI1Z1IpMlfTA0+g=
Message-ID: <e251758a-40f2-413b-b827-64570f7dfd5e@apertussolutions.com>
Date: Sat, 2 Nov 2024 13:15:38 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] x86/ucode: Fold early_update_cache() into its
 single caller
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20241028091856.2151603-1-andrew.cooper3@citrix.com>
 <20241028091856.2151603-11-andrew.cooper3@citrix.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20241028091856.2151603-11-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 10/28/24 05:18, Andrew Cooper wrote:
> The data pointer is known good, so the -ENOMEM path is unnecessary.  However,
> if we find no patch, something's wrong seeing as early_microcode_init()
> indicated it was happy.
> 
> We are the entity initialising the cache, so we don't need the complexity of
> using microcode_update_cache().  Just assert the cache is empty, and populate
> it.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---

Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

