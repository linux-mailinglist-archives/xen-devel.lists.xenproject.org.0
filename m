Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 702AF7F227A
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 01:48:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637432.993224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5Ew3-0008Md-Hc; Tue, 21 Nov 2023 00:48:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637432.993224; Tue, 21 Nov 2023 00:48:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5Ew3-0008Ki-Ez; Tue, 21 Nov 2023 00:48:15 +0000
Received: by outflank-mailman (input) for mailman id 637432;
 Tue, 21 Nov 2023 00:48:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GQYN=HC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r5Ew2-0008KZ-70
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 00:48:14 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a5a09a8b-8807-11ee-98e0-6d05b1d4d9a1;
 Tue, 21 Nov 2023 01:48:12 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A0B0F6133A;
 Tue, 21 Nov 2023 00:48:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C88B8C433C8;
 Tue, 21 Nov 2023 00:48:09 +0000 (UTC)
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
X-Inumbo-ID: a5a09a8b-8807-11ee-98e0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700527691;
	bh=LUHpDX5wqMLjvKfPjNvWlzIsD0EF2aldBVWWDZeRGV4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Hz2j2lZnHFdNAYfGVcgAHn2yHs92kYJq2YsGt+HA/GzQaTBtybXzBG92OkAI+17id
	 /3wKAg+6Zqt1j3gflICJ0BmZa2irwb9zlAznGBU46814Z/dllR1Mx0TeUK1ce2tBAa
	 cc+VFTVQO6WRg2t9evNWVsfGM40ZU3X5u8aVnO6hqUqfvCN5kZJiuTQKtZVAacFWeU
	 NLJHHyJ7gcWL2ivhEEAfemcYnu8/ZeUsw3T7jRiptJmw80C99UQ0oPwcLQVQXqGA46
	 GNEO37XjNM6bSRueqsRvegXbYcd5Du5ayt94+Oboyj/T8m+rRvr4152ITIjCYFpITK
	 rl+yQFZtJGtCw==
Date: Mon, 20 Nov 2023 16:48:08 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Jan Beulich <JBeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Roberto Bagnara <roberto.bagnara@bugseng.com>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [PATCH 3/6] xen/efi: Make efi-boot.h compile with
 -Wwrite-strings
In-Reply-To: <20231120224912.1421916-4-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2311201645150.773207@ubuntu-linux-20-04-desktop>
References: <20231120224912.1421916-1-andrew.cooper3@citrix.com> <20231120224912.1421916-4-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1842415497-1700527691=:773207"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1842415497-1700527691=:773207
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 20 Nov 2023, Andrew Cooper wrote:
> GCC complains:
> 
>   In file included from arch/arm/efi/boot.c:700:
>   arch/arm/efi/efi-boot.h: In function 'efi_arch_handle_cmdline':
>   arch/arm/efi/efi-boot.h:482:16: error: assignment discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
>     482 |         name.s = "xen";
>         |                ^
> 
> There's no easy option.  .rodata is really read-only, so the fact Xen doesn't
> crash means these strings aren't written to.
> 
> Lie to the compiler using a union.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Roberto Bagnara <roberto.bagnara@bugseng.com>
> CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> I *really* don't like this, but it's the only suggestion given.

Hi Andrew, I am trying to understand what is the part you don't like. I
understand that union string looks iffy due to being a union with const
and non-const. Is that your concern or you also spotted additional
problems with this?

If that is the only issue, maybe we can come up with a matter in-code
comment or commit message. (The TODO is not immediately obvious to me
what the issue to be improved is.)


> ---
>  xen/arch/arm/efi/efi-boot.h | 2 +-
>  xen/arch/x86/efi/efi-boot.h | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
> index 1c3640bb65fd..c26bf18b68b9 100644
> --- a/xen/arch/arm/efi/efi-boot.h
> +++ b/xen/arch/arm/efi/efi-boot.h
> @@ -479,7 +479,7 @@ static void __init efi_arch_handle_cmdline(CHAR16 *image_name,
>          w2s(&name);
>      }
>      else
> -        name.s = "xen";
> +        name.cs = "xen"; /* TODO, find a better way of doing this. */
>  
>      prop_len = 0;
>      prop_len += snprintf(buf + prop_len,
> diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
> index eebc54180bf7..e2d256e0517b 100644
> --- a/xen/arch/x86/efi/efi-boot.h
> +++ b/xen/arch/x86/efi/efi-boot.h
> @@ -324,7 +324,8 @@ static void __init efi_arch_handle_cmdline(CHAR16 *image_name,
>          w2s(&name);
>      }
>      else
> -        name.s = "xen";
> +        name.cs = "xen"; /* TODO, find a better way of doing this. */
> +
>      place_string(&mbi.cmdline, name.s);
>  
>      if ( mbi.cmdline )
> -- 
> 2.30.2
> 
> 
--8323329-1842415497-1700527691=:773207--

