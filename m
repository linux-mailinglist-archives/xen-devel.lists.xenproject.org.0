Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 704489040CE
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 18:05:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738621.1145435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH3zN-0003en-Pc; Tue, 11 Jun 2024 16:04:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738621.1145435; Tue, 11 Jun 2024 16:04:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH3zN-0003ch-Ma; Tue, 11 Jun 2024 16:04:49 +0000
Received: by outflank-mailman (input) for mailman id 738621;
 Tue, 11 Jun 2024 16:04:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uR64=NN=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sH3zM-0003cb-A1
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 16:04:48 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 516dbaf8-280c-11ef-b4bb-af5377834399;
 Tue, 11 Jun 2024 18:04:45 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1718121879640188.48405145338086;
 Tue, 11 Jun 2024 09:04:39 -0700 (PDT)
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
X-Inumbo-ID: 516dbaf8-280c-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; t=1718121881; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=T2PNNVP5U5+K9ZnxNZw6iQlsNzR7xvEU5qj9pN5ZWj5NK5TyofSuBFuNcCdIshziM/m7XJvJJIJaElqwOJigIqw0kQ9mut4bWdT4rHGSaq7e4rIAxazOh2HYrkc27v3UhJfIk4E+FmwBNoXC/saqLJzlpB2QX+anRlR3JxIdgBI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1718121881; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=KfeiOOgfpOFgvkhWmHPxuL2X27FsXUGlE70IAUigRFA=; 
	b=AzURdVW6SVPmcMQiyTOKhibd5kvPXBLaTmhjKRi4zkf/HKrEOt9YUmvEuv05tbDgnZ0XcYUs2qp2AHoaDJ+ZynZVqezW0b+Rm+Zzw/0MhdiJUq25uGz+Rj8ISMreT/w857WHJrLk4lVaUMguGyO5UpL8+XIzJNXNlIJ/bGH4MUs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1718121881;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=KfeiOOgfpOFgvkhWmHPxuL2X27FsXUGlE70IAUigRFA=;
	b=H2qWCh+MmVBKIsA+oLMtksxMlitWUla4Vy4TrhIgDL6WHV/OXQqc3Y9CMwpG9DEM
	M+czwmDb/j8Z1jrsk7BFseGc5EKpml9e77rZeVsH9jJwEH2Vf1v+TkoohF8d6ANpu5u
	9e/Q2hX5KMAkohNaPlIkvYn6kklrTgY1fkn8r+MI=
Message-ID: <6a5e71a6-52cb-4795-af8e-5e674754ab63@apertussolutions.com>
Date: Tue, 11 Jun 2024 12:04:37 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: alter EFI section
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <5b9d57b4-bd28-4523-bb80-f4a5912eb3e8@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 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
In-Reply-To: <5b9d57b4-bd28-4523-bb80-f4a5912eb3e8@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 6/10/24 02:38, Jan Beulich wrote:
> To get past the recurring friction on the approach to take wrt
> workarounds needed for various firmware flaws, I'm stepping down as the
> maintainer of our code interfacing with EFI firmware. Two new
> maintainers are being introduced in my place.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> For the new maintainers, here's a 1st patch to consider right away:
> https://lists.xen.org/archives/html/xen-devel/2024-03/msg00931.html.
> 
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -308,7 +308,9 @@ F:	automation/eclair_analysis/
>   F:	automation/scripts/eclair
>   
>   EFI
> -M:	Jan Beulich <jbeulich@suse.com>
> +M:	Daniel P. Smith <dpsmith@apertussolutions.com>
> +M:	Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> +R:	Jan Beulich <jbeulich@suse.com>
>   S:	Supported
>   F:	xen/arch/x86/efi/
>   F:	xen/arch/x86/include/asm/efi*.h

Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>

