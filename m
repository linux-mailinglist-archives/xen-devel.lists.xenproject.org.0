Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1449D9C24B0
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2024 19:13:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832747.1248030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9TSh-00040B-Hq; Fri, 08 Nov 2024 18:11:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832747.1248030; Fri, 08 Nov 2024 18:11:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9TSh-0003xc-Du; Fri, 08 Nov 2024 18:11:59 +0000
Received: by outflank-mailman (input) for mailman id 832747;
 Fri, 08 Nov 2024 18:11:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pHpy=SD=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t9TSf-0003xV-2O
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2024 18:11:57 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id edb6a023-9dfc-11ef-a0c6-8be0dac302b0;
 Fri, 08 Nov 2024 19:11:53 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 173108950565775.16323100540728;
 Fri, 8 Nov 2024 10:11:45 -0800 (PST)
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
X-Inumbo-ID: edb6a023-9dfc-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg4LjUxIiwiaGVsbyI6InNlbmRlcjQtb2YtbzUxLnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6ImVkYjZhMDIzLTlkZmMtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMDg5NTEzLjYyMTAxMiwic2VuZGVyIjoiZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; t=1731089507; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KMT4sawYA+b39pOu2UPWfQ50MCSAyf4UQcYnpTd4k3ZiyFi8VJ7nGfF//uCdynbA3vsTLRM+P1C1t/DvfnASMcUsnUiJK4xTyrcEJMKcvDFBZXX/+4zLLInXgynMWBWA34fsAKOxPXAFwjgEfHuU8NvM7f/5DP1QB1qQ0riYiVw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1731089507; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=WTRvt10S0XSQbGAcLZDMZCSbdE1ek9NvEvcIu4QFdEc=; 
	b=jgFSrtE6rWBUl2E4Wc/DckCc8tTKuMNZzNnPYJ8XxXiDClZngDiJ61vjkjayvoDYLTdJe5bBVJ5ZmDyABf77mwkofMb53wqhFwJ4wCIODkZJPHo6iVkqx7NdX6+ZfpdDj7jXOcRhi7G7sIyvxG9TjULFotI8EYPDt+fiJkrmYVc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1731089507;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=WTRvt10S0XSQbGAcLZDMZCSbdE1ek9NvEvcIu4QFdEc=;
	b=DqCOL7i79CZIBT/Mld+1GK4/M+m575DEU9WoT5mw3kln6ZGxCEtg1bCwZXosRDgk
	82qB0iUnKRBh4OqqYA1sf6NGvSpFWjlcnurgast1bFKnFMmREDpM6e+Q9ZMznPXcLjY
	r9xO7nzfptpoqx0nA/N9KfYXEb6yAYMTqSxj2bEo=
Message-ID: <badb64f3-6c51-4f81-969d-14843513def5@apertussolutions.com>
Date: Fri, 8 Nov 2024 13:11:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/boot: Fix bootinfo.h to be standalone
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Krystian Hebel <krystian.hebel@3mdeb.com>, Jan Beulich
 <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241108141210.298063-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20241108141210.298063-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 11/8/24 09:12, Andrew Cooper wrote:
> Work to rebase the Trenchboot patch series has encountered:
> 
>    In file included from ./arch/x86/include/asm/tpm.h:4,
>                     from arch/x86/boot/../tpm.c:23:
>    ./arch/x86/include/asm/bootinfo.h:88:35: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'next_boot_module_index'
>       88 | static inline unsigned int __init next_boot_module_index(
>          |
> 
> Fix this by including the necessary header.
> 
> Fixes: 74af2d98276d ("x86/boot: eliminate module_map")
> Reported-by: Krystian Hebel <krystian.hebel@3mdeb.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Daniel P. Smith <dpsmith@apertussolutions.com>
> CC: Krystian Hebel <krystian.hebel@3mdeb.com>
> ---

Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

