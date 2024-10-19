Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6703C9A504F
	for <lists+xen-devel@lfdr.de>; Sat, 19 Oct 2024 20:24:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.822644.1236596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2E7P-0005H5-BR; Sat, 19 Oct 2024 18:24:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 822644.1236596; Sat, 19 Oct 2024 18:24:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2E7P-0005Fa-8Z; Sat, 19 Oct 2024 18:24:03 +0000
Received: by outflank-mailman (input) for mailman id 822644;
 Sat, 19 Oct 2024 18:24:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qdF/=RP=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t2E7O-0005FU-1p
 for xen-devel@lists.xenproject.org; Sat, 19 Oct 2024 18:24:02 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e478b1f-8e47-11ef-99a3-01e77a169b0f;
 Sat, 19 Oct 2024 20:23:59 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729362234172172.78630606787408;
 Sat, 19 Oct 2024 11:23:54 -0700 (PDT)
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
X-Inumbo-ID: 4e478b1f-8e47-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1729362235; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=N84psd4OuWCRHbPXfMqew9IriduK9qEoF8SMbOEk9jt6mnPcPoEQL3Nw35Lbp7yYJ4+u6k2sclOO/MEBQLVWHiUFMpwFOsYnRASyINbPWZX33LCT9khjpmYrWZlDrIpZova8I2sHaCLkm7FUuIBONZvSI7N+2NzZW8TjxeirDn4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729362235; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=SHoNmuO0gYmDxQNpXWyCwOI+zewpEv3IPGRCkzcH7YU=; 
	b=mMy0gKtMXQJ04XONQvrkIoq3+NCBZx7qCk2Gh4sh+z0wlr6/tMAF1zUMoJx4Y7wnmWMu/BE7zpfDHyqMPm3kKMWtnMtxH9FJbwNwayW05io1Mbp7mSlDXB3lHJ1qsl43Y6MbuW6lSLgQUTFJ1sW02eZT5buCM72tQNmGxuJWSMs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729362235;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=SHoNmuO0gYmDxQNpXWyCwOI+zewpEv3IPGRCkzcH7YU=;
	b=euagaa4ru97T1FfnxXognOqmyKQkEXIaBRRoXzV9I4bxXv/e2Pwuw7AAV5fKniYb
	CIzHwHEGHiMFKPOaWjrkd5ePhRpjYAUbET10Em22SHIkWeFX3lnPALbzWoAjhB5fjXv
	TMNpGkAnT3oTY1Bpp4/cprSszrhXIkgY2+DzPQQE=
Message-ID: <bf9041cd-04bb-41c4-a221-67403d1ad6bb@apertussolutions.com>
Date: Sat, 19 Oct 2024 14:23:52 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/boot: Fix PVH boot following the start of the MBI->BI
 conversion
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20241019182054.3842879-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20241019182054.3842879-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 10/19/24 14:20, Andrew Cooper wrote:
> pvh_init() sets up the mbi pointer, but leaves mbi_p at 0.  This isn't
> compatbile with multiboot_fill_boot_info() starting from the physical address,
> in order to remove the use of the mbi pointer.
> 
> Fixes: 038826b61e85 ("x86/boot: move x86 boot module counting into a new boot_info struct")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Daniel P. Smith <dpsmith@apertussolutions.com>
> 
> This is a testiment to how tangled the boot code really is.
> ---
>   xen/arch/x86/setup.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 6746ed8cced6..bfede5064e8c 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1048,6 +1048,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>       {
>           ASSERT(mbi_p == 0);
>           pvh_init(&mbi, &mod);
> +        mbi_p = __pa(mbi);
>       }
>       else
>       {
> 
> base-commit: e9f227685e7204cb2293576ee5b745b828cb3cd7

Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

