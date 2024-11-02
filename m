Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34ABB9BA15D
	for <lists+xen-devel@lfdr.de>; Sat,  2 Nov 2024 17:08:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.829496.1244466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7GfA-0006qp-TU; Sat, 02 Nov 2024 16:07:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 829496.1244466; Sat, 02 Nov 2024 16:07:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7GfA-0006os-Qm; Sat, 02 Nov 2024 16:07:44 +0000
Received: by outflank-mailman (input) for mailman id 829496;
 Sat, 02 Nov 2024 16:07:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RajI=R5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t7Gf9-0006oi-Rb
 for xen-devel@lists.xenproject.org; Sat, 02 Nov 2024 16:07:43 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9511604d-9934-11ef-99a3-01e77a169b0f;
 Sat, 02 Nov 2024 17:07:40 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1730563654426548.9313518201419;
 Sat, 2 Nov 2024 09:07:34 -0700 (PDT)
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
X-Inumbo-ID: 9511604d-9934-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg4LjUxIiwiaGVsbyI6InNlbmRlcjQtb2YtbzUxLnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6Ijk1MTE2MDRkLTk5MzQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwNTYzNjYwLjY4MzM0NCwic2VuZGVyIjoiZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; t=1730563655; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JaXPibpD3NZp6roNtrcmvAij0U3YaHfNWXlPmWL4Tjplkqcz1AUr+3+BgoOs2B7pua9hM5AzJX92tIhVCrcDayuwXpJO5C7yU3HiL2yqI8oy1sdHj79+BB6H0ixUR0Saiv9zwU8KdtA0EmgQHjA9bKycr46A1JNiocBQZ7LEptE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1730563655; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+UkhMJm458gChJYM7FpKbWH9/6biV05OQCv4FeSWsG0=; 
	b=LbmxDgTT4vkZUOq93i9WJ36EPBSFT3XefGXBao3rjE5lbHhs5nV2uUfLgKFsgp32CG53mm/Ckzaz3Llv6JM8p6Czcgu/ufesMrwz7hgi2in7S+im+FGrQu+UL1NO6g6U8+kioTUsC01c9bcczhGuS43/CGvjExc6H4XLBSmV8sI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1730563655;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=+UkhMJm458gChJYM7FpKbWH9/6biV05OQCv4FeSWsG0=;
	b=NdahAKzJqYMdqJCXBkmLwxV7PXMO0gYejuUFejLsk/2w5NRmzFN6zZ12xNgvlWg4
	pS+rl6ok6JoR8/iNq58t523BwWBdRCvnpKa0FV4eRYBl3nF/lZ+AcmCi8NeLKq5cFJk
	uOBi6q3tHtqWljOBDLvx9zriBghaUEu8Jlinrnd4=
Message-ID: <8dcb2d28-cbf0-4236-99d2-9605a4406e38@apertussolutions.com>
Date: Sat, 2 Nov 2024 12:07:33 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] x86/ucode: Break early_microcode_load() out of
 early_microcode_init()
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20241028091856.2151603-1-andrew.cooper3@citrix.com>
 <20241028091856.2151603-4-andrew.cooper3@citrix.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20241028091856.2151603-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 10/28/24 05:18, Andrew Cooper wrote:
> microcode_grab_module() and early_microcode_update_cpu() are logically one
> task that passes state via static variables.
> 
> We intend to delete said static variables, so start by moving these functions
> out of early_microcode_init().
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

