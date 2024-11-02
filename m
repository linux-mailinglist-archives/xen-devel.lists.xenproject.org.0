Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 199C29BA15B
	for <lists+xen-devel@lfdr.de>; Sat,  2 Nov 2024 17:06:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.829491.1244457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7Gdh-0006Kj-KO; Sat, 02 Nov 2024 16:06:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 829491.1244457; Sat, 02 Nov 2024 16:06:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7Gdh-0006I5-Gz; Sat, 02 Nov 2024 16:06:13 +0000
Received: by outflank-mailman (input) for mailman id 829491;
 Sat, 02 Nov 2024 16:06:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RajI=R5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t7Gdg-0006Hz-L5
 for xen-devel@lists.xenproject.org; Sat, 02 Nov 2024 16:06:12 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a87b93a-9934-11ef-a0c5-8be0dac302b0;
 Sat, 02 Nov 2024 17:06:02 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1730563555588553.9300586114913;
 Sat, 2 Nov 2024 09:05:55 -0700 (PDT)
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
X-Inumbo-ID: 5a87b93a-9934-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg4LjUxIiwiaGVsbyI6InNlbmRlcjQtb2YtbzUxLnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6IjVhODdiOTNhLTk5MzQtMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwNTYzNTYyLjc5NDcwOSwic2VuZGVyIjoiZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; t=1730563557; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EsGoqlZfo44P6g57kuLH8OYV/TzMSxXMpkOPo85ViW2IVYOK/8BKZnOSCfP2YZgsb9RSzIs3kJN0vA2d1iyILR9GWinzd9LOujIpK6Gux4yTu7YKPRTVRNAOaAmfJ4krIlhbfgVd5B6ZIYN14Q+Gl55btr8JWfhdbDOifHcZwWQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1730563557; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=n2CDV7e8ydz8WXHNAsmH56z8tCWwjsJOCGkZfFciXGw=; 
	b=S1u0CjJNHp/1roet2yn2jAiCVVCMEAC5E6bx/PVufVtK5fW+v8n0Xa5nkL2k6IDI9+jc4IH+Z97hRO4LHzBGyQ49iQbujSZ2quhvYsLzJ3WtsxwJwGLP8pTVyvU/pXt2Rdzwjx/mmZK5GYuWs2IOyZXtB70lU140TAp0kQjyBtw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1730563557;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=n2CDV7e8ydz8WXHNAsmH56z8tCWwjsJOCGkZfFciXGw=;
	b=WgpFgrAuVIvVXZPx//ftwuWYpOluL/O96KmQfKogE/3TVXpBqWky1qzff3hZ1X/F
	uNBngyTBaMAAfIJ5w7kJz68laJGJaQEuyGyAJrSeJMfGroP0LhBTLFzNftT0KB0gy1W
	L+axsSqvWubg3T6oNSO2VNnHyErqLsoab0YcxWeU=
Message-ID: <8ad34ea1-e84e-4a18-9bd6-03b04f324882@apertussolutions.com>
Date: Sat, 2 Nov 2024 12:05:54 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] x86/ucode: Delete the microcode_init() initcall
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20241028091856.2151603-1-andrew.cooper3@citrix.com>
 <20241028091856.2151603-3-andrew.cooper3@citrix.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20241028091856.2151603-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 10/28/24 05:18, Andrew Cooper wrote:
> The comment highlights just how bogus this really is.  Being an initcall, the
> boot allocator is long gone, and bootstrap_unmap() is a no-op.
> 
> The fact there is nothing to do should be a giant red flag about the validity
> of the mappings "being freed".  Indeed, they both constitute use-after-frees.
> 
> We could move the size/data/end clobbering into microcode_init_cache() which
> is the final consumer of the information, but we're intending to delete these
> static variables entirely, and it's less churn to just leave them dangling for
> a few patches.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Daniel P. Smith <dpsmith@apertussolutions.com>
> 
> After the $N'th rearranging, this could actually be merged into "x86/ucode:
> Drop ucode_mod and ucode_blob" with no effect on the intermediate patches.
> ---

Not sure if this helps, but for clarification sake, the module itself is 
freed by discard_initial_images() and ucode_mod is __initdata and will 
be cleaned up with the rest of _initdata. This function is called after 
the last user of ucode_mod and the call to bootstrap_unmap() perpetuates 
the assumption that some how the underlying module has remained mapped. 
There is not any condition where this function does anything that would 
affect the execution of the hypervisor. It frees nothing and sets the 
value of a unit local variable that is no longer used shortly before the 
backing memory is freed.

As to patch ordering, I have no opinion.

Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

