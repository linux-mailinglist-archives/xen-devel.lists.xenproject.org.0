Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD8C9CEFF0
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 16:31:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837727.1253635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tByI2-0003Rk-VF; Fri, 15 Nov 2024 15:31:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837727.1253635; Fri, 15 Nov 2024 15:31:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tByI2-0003Q1-SH; Fri, 15 Nov 2024 15:31:18 +0000
Received: by outflank-mailman (input) for mailman id 837727;
 Fri, 15 Nov 2024 15:31:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=54cC=SK=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tByI1-0003Pv-Fm
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 15:31:17 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a503aa17-a366-11ef-a0c7-8be0dac302b0;
 Fri, 15 Nov 2024 16:31:13 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1731684666510153.32777909395384;
 Fri, 15 Nov 2024 07:31:06 -0800 (PST)
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
X-Inumbo-ID: a503aa17-a366-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg4LjUxIiwiaGVsbyI6InNlbmRlcjQtb2YtbzUxLnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6ImE1MDNhYTE3LWEzNjYtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNjg0Njc0LjI2NDAyMiwic2VuZGVyIjoiZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; t=1731684669; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lDYfAyeARF84BHblEEg4JaQXe2daExmpeBN671C0a2UuEw8e8L7JNMq9I01R2JFwIOl+xS5RMdFS/mYlY66naWScKTJIPawYvoEJ7p5chXwbP5vfKasc+MajK3By72+HKEaQl8psqMTgL82NCo+o6kuN8CzEL5EvfqGCuRl7XYk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1731684669; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=TKdtslLSIhKbALEPsVQD5f8zYXoQFa/thBHaY+yGAss=; 
	b=aoZp9Kd3/zInKXzjaZw1D2cizFwgCxdfPRyxJjf2m43Vkr0vigTIu7FRGB4bpLLUavppW5bS9YV8HQ87ER5Z9QR+lyiF6kzyjOkonHMRLixyhGJKs3pmEN2gutkcrvdK81rWLFuo/5OGyWjELKcdteU51igimx2oGucl0+dCQzk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1731684669;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=TKdtslLSIhKbALEPsVQD5f8zYXoQFa/thBHaY+yGAss=;
	b=eImSsVlq1RYoIVJfsiGAfCnCfwZoM5clkBEN3MheTzb1uU9elfwJb5rup48sXTYR
	/4bfZvvRrPl9tIq9cpq2ZNT8T4PEasUw7CtkJHjD6qDioOJUTWtE7ycomJOjGL9RQxD
	iM65mgUFLR+xI34Za66IelbymrvdGFDgn1MtS9gM=
Message-ID: <972e232e-f468-454b-abfe-2924493c7dac@apertussolutions.com>
Date: Fri, 15 Nov 2024 10:31:04 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 5/6] x86/boot: introduce domid field to struct
 boot_domain
To: xen-devel@lists.xenproject.org
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241115131204.32135-1-dpsmith@apertussolutions.com>
 <20241115131204.32135-6-dpsmith@apertussolutions.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20241115131204.32135-6-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 11/15/24 08:12, Daniel P. Smith wrote:
> Add a domid field to struct boot_domain to hold the assigned domain id for the
> domain. During initialization, ensure all instances of struct boot_domain have
> the invalid domid to ensure that the domid must be set either by convention or
> configuration.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
>   xen/arch/x86/include/asm/bootdomain.h |  2 ++
>   xen/arch/x86/setup.c                  | 12 +++++++-----
>   2 files changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/x86/include/asm/bootdomain.h b/xen/arch/x86/include/asm/bootdomain.h
> index 12c19ab37bd8..3873f916f854 100644
> --- a/xen/arch/x86/include/asm/bootdomain.h
> +++ b/xen/arch/x86/include/asm/bootdomain.h
> @@ -12,6 +12,8 @@ struct boot_module;
>   struct domain;
>   
>   struct boot_domain {
> +    domid_t domid;

There is no definition for domid_t in this file, the only reason it has 
yet to fail, is that everywhere it is included has xen.h included before it.

v/r,
dps

