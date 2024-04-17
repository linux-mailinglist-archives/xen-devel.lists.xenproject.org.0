Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AC58A79DA
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 02:30:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707141.1104699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwtAa-0006Cy-T5; Wed, 17 Apr 2024 00:29:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707141.1104699; Wed, 17 Apr 2024 00:29:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwtAa-0006Aj-Pj; Wed, 17 Apr 2024 00:29:00 +0000
Received: by outflank-mailman (input) for mailman id 707141;
 Wed, 17 Apr 2024 00:28:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8jr4=LW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rwtAZ-0006Ad-6d
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 00:28:59 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78088a3e-fc51-11ee-94a3-07e782e9044d;
 Wed, 17 Apr 2024 02:28:54 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4A0B9CE0F80;
 Wed, 17 Apr 2024 00:28:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B75BC113CE;
 Wed, 17 Apr 2024 00:28:48 +0000 (UTC)
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
X-Inumbo-ID: 78088a3e-fc51-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713313729;
	bh=4Q8hddUeDL43B0Kd84a31tQOaBZDSydcd8ZPBi9zYbg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=I4dFi6yjG9f7AqnAPjJpxY8THWPBdqmPXYRQ75HzYkF2gT2TRiY5EgVMZB1zRG+Ar
	 4WBCBn8W2FdR+gTaY8uweXAEKJD32qCItaBJfY27nfMJ76/OFlFWCVFbHgyRzYhBKW
	 lz5Mp5UIzTq0CziAQ1B1akForFHnd2kVPf7Ful6AeGiMmvzTgE23Q8VNooH2EP2XWD
	 LWkTlPez8AHQG1D3PKsTNzEJL0UBU4f5nPEWEXe51WglU3kdUVsG+TRyPYlG/XycRR
	 SMU9HFRJmhqrq0miMq/x3XuqPhjxKoUcV4i1fcIPPMq+tmxf25xw2Gd73NKWst5Ovu
	 QaJV/nzy//CdQ==
Date: Tue, 16 Apr 2024 17:28:47 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Jan Beulich <JBeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    "consulting @ bugseng . com" <consulting@bugseng.com>, 
    Roberto Bagnara <roberto.bagnara@bugseng.com>, 
    Federico Serafini <federico.serafini@bugseng.com>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [PATCH] xen/efi: Rewrite DOS/PE magic checking without
 memcmp()
In-Reply-To: <20240416155251.2942504-1-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2404161728400.2257106@ubuntu-linux-20-04-desktop>
References: <20240416155251.2942504-1-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1733869314-1713313729=:2257106"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1733869314-1713313729=:2257106
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 16 Apr 2024, Andrew Cooper wrote:
> Misra Rule 21.16 doesn't like the use of memcmp() between a string literal and
> a UINT8 array.  Rewrite using plain compares.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: consulting@bugseng.com <consulting@bugseng.com>
> CC: Roberto Bagnara <roberto.bagnara@bugseng.com>
> CC: Federico Serafini <federico.serafini@bugseng.com>
> CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
>  xen/common/efi/pe.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/common/efi/pe.c b/xen/common/efi/pe.c
> index a84992df9afe..ef8a2543e0a1 100644
> --- a/xen/common/efi/pe.c
> +++ b/xen/common/efi/pe.c
> @@ -111,7 +111,8 @@ const void *__init pe_find_section(const void *image, const UINTN image_size,
>      UINTN offset, i;
>  
>      if ( image_size < sizeof(*dos) ||
> -         memcmp(dos->Magic, "MZ", 2) != 0 )
> +         dos->Magic[0] != 'M' ||
> +         dos->Magic[1] != 'Z' )
>          return NULL;
>  
>      offset = dos->ExeHeader;
> @@ -119,7 +120,10 @@ const void *__init pe_find_section(const void *image, const UINTN image_size,
>  
>      offset += sizeof(*pe);
>      if ( image_size < offset ||
> -         memcmp(pe->Magic, "PE\0\0", 4) != 0 )
> +         pe->Magic[0] != 'P' ||
> +         pe->Magic[1] != 'E' ||
> +         pe->Magic[2] != '\0' ||
> +         pe->Magic[3] != '\0' )
>          return NULL;
>  
>      if ( pe->FileHeader.Machine != PE_HEADER_MACHINE )
> 
> base-commit: c0f890cd9d5fd2c17a1e3110cb26f98c90ce8429
> -- 
> 2.30.2
> 
--8323329-1733869314-1713313729=:2257106--

