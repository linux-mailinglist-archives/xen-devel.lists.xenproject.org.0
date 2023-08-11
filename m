Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77191779AEE
	for <lists+xen-devel@lfdr.de>; Sat, 12 Aug 2023 01:04:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582722.912623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUbAn-0003BS-Js; Fri, 11 Aug 2023 23:04:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582722.912623; Fri, 11 Aug 2023 23:04:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUbAn-00039j-GH; Fri, 11 Aug 2023 23:04:01 +0000
Received: by outflank-mailman (input) for mailman id 582722;
 Fri, 11 Aug 2023 23:04:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=01QD=D4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qUbAm-00036x-PS
 for xen-devel@lists.xenproject.org; Fri, 11 Aug 2023 23:04:00 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5adc84d6-389b-11ee-b284-6b7b168915f2;
 Sat, 12 Aug 2023 01:04:00 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B6F8B66B5A;
 Fri, 11 Aug 2023 23:03:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6306C433C8;
 Fri, 11 Aug 2023 23:03:56 +0000 (UTC)
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
X-Inumbo-ID: 5adc84d6-389b-11ee-b284-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691795038;
	bh=D9ltO18j6sy6Tn8K6qxsj07MdUcbctefYGAt7s2+ojI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NplaOdHgnnxI00rhhfZS1CH/19M0PhTz1E7a3cnrCCw7BUuOIxCgarMVIfdRzb43l
	 bzg4BmxNnLMuOEY+pSFOdPX8r/f9N9NuiEq6t3mHqX0O0205nrxe9bNwiBcc9DCdIv
	 9IBEhq7JEhOrhOPbIp/0kC0PqjzuBWzUC9oY3zvqRk6KWWy322h3TYDuq5QI7sEFBR
	 dj6VBHqyXKcIIVnOAHEnRfGQcBA68TfHZAh/90tFCSwUqPPDMSRfITvybjQbVJxtRl
	 19XCrDL0qu0YaxRO753UyHDLWgHs5adVZIcQo0/IlIZs1/BwT6ygbGR+rqkcWdUCXR
	 ANgOgRUcKF09w==
Date: Fri, 11 Aug 2023 16:03:55 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com
Subject: Re: [XEN PATCH 5/6] vpic/msix: make 'get_slot' static
In-Reply-To: <6ff95436f704c852e6397a584eef65f9d1713999.1691676251.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308111603430.2127516@ubuntu-linux-20-04-desktop>
References: <cover.1691676251.git.nicola.vetrini@bugseng.com> <6ff95436f704c852e6397a584eef65f9d1713999.1691676251.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 11 Aug 2023, Nicola Vetrini wrote:
> The function can become static since it's used only within this file.
> This also resolves a violation of MISRA C:2012 Rule 8.4 due to the absence
> of a declaration before the function definition.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Fixes: b177892d2d0e ("vpci/msix: handle accesses adjacent to the MSI-X table")

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/drivers/vpci/msix.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
> index 25bde77586a4..f9df506f29bf 100644
> --- a/xen/drivers/vpci/msix.c
> +++ b/xen/drivers/vpci/msix.c
> @@ -223,7 +223,7 @@ static void __iomem *get_table(const struct vpci *vpci, unsigned int slot)
>      return msix->table[slot];
>  }
>  
> -unsigned int get_slot(const struct vpci *vpci, unsigned long addr)
> +static unsigned int get_slot(const struct vpci *vpci, unsigned long addr)
>  {
>      unsigned long pfn = PFN_DOWN(addr);
>  
> -- 
> 2.34.1
> 

