Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0594D9BA149
	for <lists+xen-devel@lfdr.de>; Sat,  2 Nov 2024 16:44:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.829460.1244446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7GIM-0002hV-Up; Sat, 02 Nov 2024 15:44:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 829460.1244446; Sat, 02 Nov 2024 15:44:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7GIM-0002fs-Rc; Sat, 02 Nov 2024 15:44:10 +0000
Received: by outflank-mailman (input) for mailman id 829460;
 Sat, 02 Nov 2024 15:44:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RajI=R5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t7GIL-0002fm-K3
 for xen-devel@lists.xenproject.org; Sat, 02 Nov 2024 15:44:09 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 49e49077-9931-11ef-a0c5-8be0dac302b0;
 Sat, 02 Nov 2024 16:44:06 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 173056224020049.258949114127745;
 Sat, 2 Nov 2024 08:44:00 -0700 (PDT)
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
X-Inumbo-ID: 49e49077-9931-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg4LjUxIiwiaGVsbyI6InNlbmRlcjQtb2YtbzUxLnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6IjQ5ZTQ5MDc3LTk5MzEtMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwNTYyMjQ2LjQ1OTU5Nywic2VuZGVyIjoiZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; t=1730562241; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OGBIPuAQMsVyjarfdBi5LqKuRWBG/n7EtlBJH6mljL1ikSK3LnT2MVvp2WvZhMSvaX5qun7VlSk0KjVFJC26FdNm4U3GbVwqGT4BFHm7oOEzg5psWIICOR0Gi9okijUdlXPHM3PxC/xj+MdGqWWvzw/LZGeZd4TPbkjmQnC3yWM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1730562241; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=c50rI2GD3TZzGa8WcxTRRBV2MLbkgNEAvy09dAxAyNs=; 
	b=HYL+wiNLB/lhs59u13AGDBiOKKRFBAqt2Seo2x506nKD/RxJCJ3OuiYynOx9SKw1GnmN9etoxuqxMEV6X07FjciStYHr7cDeUTXbhKyjiAMsG1XmrDTCNLlOn6BSTqFIPhzMCOd1pF5DxjpWUPXVZsxqPan5Sl0ETwsKdJXVqSY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1730562241;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=c50rI2GD3TZzGa8WcxTRRBV2MLbkgNEAvy09dAxAyNs=;
	b=Tww15z1bnnuZSBQ1y/rWhQT7O2aTvApHrsvUemzZ5P4qHzwT7uHuOcg0PZkiSsU8
	BPo0hLhfyero03sDsKQEQfbJk10SNgpGCHVjKm9M7g8RDJ1MTXyvzmAzKqVe3WNMB1B
	6i/xlXgNmaN0cCXkQiFiDx3nevXBcwrCl4i+xqdY=
Message-ID: <d9452783-83a0-4c18-991c-ea587fc8ae35@apertussolutions.com>
Date: Sat, 2 Nov 2024 11:43:58 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] x86/ucode: Turn microcode_init_cache() into a
 presmp_initcall
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20241028091856.2151603-1-andrew.cooper3@citrix.com>
 <20241028091856.2151603-2-andrew.cooper3@citrix.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20241028091856.2151603-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 10/28/24 05:18, Andrew Cooper wrote:
> There's no need for microcode_init_cache() to be called exactly where it is in
> __start_xen().  All that matters is it must be after xmalloc() is available
> and before APs start up.
> 
> As a consequence, microcode_init_cache() runs a little later on boot now.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
>   xen/arch/x86/cpu/microcode/core.c    | 4 +++-
>   xen/arch/x86/include/asm/microcode.h | 1 -
>   xen/arch/x86/setup.c                 | 2 --
>   3 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
> index 8d916d891e6e..9a2cc631d2aa 100644
> --- a/xen/arch/x86/cpu/microcode/core.c
> +++ b/xen/arch/x86/cpu/microcode/core.c
> @@ -819,8 +819,9 @@ static int __init early_update_cache(const void *data, size_t len)
>       return rc;
>   }
>   
> -int __init microcode_init_cache(struct boot_info *bi)
> +static int __init cf_check microcode_init_cache(void)
>   {
> +    struct boot_info *bi = &xen_boot_info;

For context, the current function definition didn't have *bi const 
because it will become necessary later update state in bi. So it is 
natural for it to remain as such by getting the reference from global.

Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

