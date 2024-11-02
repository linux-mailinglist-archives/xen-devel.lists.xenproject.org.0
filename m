Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F589BA15E
	for <lists+xen-devel@lfdr.de>; Sat,  2 Nov 2024 17:08:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.829501.1244477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7Gfy-0007N0-6q; Sat, 02 Nov 2024 16:08:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 829501.1244477; Sat, 02 Nov 2024 16:08:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7Gfy-0007KW-3V; Sat, 02 Nov 2024 16:08:34 +0000
Received: by outflank-mailman (input) for mailman id 829501;
 Sat, 02 Nov 2024 16:08:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RajI=R5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t7Gfw-0007KO-T4
 for xen-devel@lists.xenproject.org; Sat, 02 Nov 2024 16:08:32 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2d9d3c3-9934-11ef-a0c5-8be0dac302b0;
 Sat, 02 Nov 2024 17:08:30 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1730563703954441.23462835858766;
 Sat, 2 Nov 2024 09:08:23 -0700 (PDT)
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
X-Inumbo-ID: b2d9d3c3-9934-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg4LjUxIiwiaGVsbyI6InNlbmRlcjQtb2YtbzUxLnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6ImIyZDlkM2MzLTk5MzQtMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwNTYzNzEwLjc5NDk5NCwic2VuZGVyIjoiZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; t=1730563705; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VPO7hrM1w8ASjvVEbyV2K1Y0NwFtSPJopyWReyTf5pXYFCcLLRtTp4C645UJMZn2VSL7nb14hnfyiQHfqp4eFm7fvRdArM8iX2H50bRwU4cH4kKLWqJWF0PFh/Gkp07wpCg0HsQw+Bs8AfmmCAUWljCLP4nTXR7kxItlQMy4pc0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1730563705; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=C3wpKZ80RmQoX+M4JOB8WjCvMCfcjXUNazjjLl9Tlpk=; 
	b=ZxJmJh4P8HwyAZ4hAmu32KPK8r5TeNfCEyzuPkjxwlQ4NDeeY1SYjHp8Gl9Qc4brwiFjbdsRhT4CC41T0AsoYAXxSX5KxwRg143DUmaJXNaqqWMo+N3sHap4XYvBFKO4vF4cBeuY7m5mUfVO/QeQoXJUGJ+Q0pno4OkkkpMA4nI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1730563705;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=C3wpKZ80RmQoX+M4JOB8WjCvMCfcjXUNazjjLl9Tlpk=;
	b=hz6l8ReKY7Ni0bWHXmQsG9OEznSKUcV86NfxUtYVtTOp7RjGPEXoodBzmU35uzQU
	8vK0w+jpBy/o7G9z4H6yvywS/uX4SUxatF0wPPZxaZ43ePuKVXYCl1q3FGG5lb6CF6k
	b21ew4V7xzODZQ3i3ncWKCq7ta8hwYLoNwvGQ2JA=
Message-ID: <86254623-0864-46ee-a545-a3ebda871aa1@apertussolutions.com>
Date: Sat, 2 Nov 2024 12:08:22 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] x86/ucode: Fold early_microcode_update_cpu() into
 it's single caller
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20241028091856.2151603-1-andrew.cooper3@citrix.com>
 <20241028091856.2151603-5-andrew.cooper3@citrix.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20241028091856.2151603-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 10/28/24 05:18, Andrew Cooper wrote:
> Diff-wise, as early_microcode_update_cpu() is the larger function, this more
> closely resembles "merge early_microcode_load() into it's single callee", but
> the end result is the same.
> 
> At the same time, rename the len variable to size.  This is for better
> consistency with existing logic, and to reduce churn later.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---

Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

