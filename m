Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EC82C81F0
	for <lists+xen-devel@lfdr.de>; Mon, 30 Nov 2020 11:16:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.40774.73697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjgEC-0006Ow-4I; Mon, 30 Nov 2020 10:16:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 40774.73697; Mon, 30 Nov 2020 10:16:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjgEC-0006OV-0y; Mon, 30 Nov 2020 10:16:16 +0000
Received: by outflank-mailman (input) for mailman id 40774;
 Mon, 30 Nov 2020 10:16:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lj5U=FE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kjgEA-0006OK-8z
 for xen-devel@lists.xenproject.org; Mon, 30 Nov 2020 10:16:14 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1c41cb51-c734-4156-b1f1-ad3f04dd2374;
 Mon, 30 Nov 2020 10:16:12 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E14EBACB5;
 Mon, 30 Nov 2020 10:16:11 +0000 (UTC)
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
X-Inumbo-ID: 1c41cb51-c734-4156-b1f1-ad3f04dd2374
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606731372; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fFi+ssvb0SZ1fooUTaC0EQMDJk1EiU6HlH7OlP+oWQ0=;
	b=DJNZ9lcMRM5+oCGgrN4rhi+4nwj75VO7AQa/VL44QVRMBWDGN+2sLKcNHfWRiSswuRLoZR
	sDrna/BF327HgNCk3TPYTcOSq1OlUoX4ifzMJqVPT3K4K+LQEEHKvbejVhEkdlR7wQxAU4
	y+7aCuiW1X7HEY/WcRsRguPGPYC2Apk=
Subject: Re: [PATCH 04/16] x86/srat: vmap the pages for acpi_slit
To: Hongyan Xia <hx242@xen.org>
Cc: julien@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1588278317.git.hongyxia@amazon.com>
 <f4226fafcd333c0274fcee24601c280bf6494417.1588278317.git.hongyxia@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d41fee35-8889-3ab8-2a5e-f4b442747362@suse.com>
Date: Mon, 30 Nov 2020 11:16:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <f4226fafcd333c0274fcee24601c280bf6494417.1588278317.git.hongyxia@amazon.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30.04.2020 22:44, Hongyan Xia wrote:
> --- a/xen/arch/x86/srat.c
> +++ b/xen/arch/x86/srat.c
> @@ -196,7 +196,8 @@ void __init acpi_numa_slit_init(struct acpi_table_slit *slit)
>  		return;
>  	}
>  	mfn = alloc_boot_pages(PFN_UP(slit->header.length), 1);
> -	acpi_slit = mfn_to_virt(mfn_x(mfn));
> +	acpi_slit = vmap_boot_pages(mfn, PFN_UP(slit->header.length));
> +	BUG_ON(!acpi_slit);
>  	memcpy(acpi_slit, slit, slit->header.length);
>  }

I'm not sure in how far this series is still to be considered
active / pending; I still have it in my inbox as something to
look at in any event. If it is, then I think the latest by this
patch it becomes clear that we either want to make vmalloc()
boot-allocator capable, or introduce e.g. vmalloc_boot().
Having this recurring pattern including the somewhat odd
vmap_boot_pages() is imo not the best way forward. It would
then also no longer be necessary to allocate contiguous pages,
as none of the users up to here appear to have such a need.

Jan

