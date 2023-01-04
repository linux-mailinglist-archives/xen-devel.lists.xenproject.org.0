Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C0D65CB55
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 02:22:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470857.730508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCsTp-00072U-De; Wed, 04 Jan 2023 01:22:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470857.730508; Wed, 04 Jan 2023 01:22:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCsTp-00070I-Ao; Wed, 04 Jan 2023 01:22:09 +0000
Received: by outflank-mailman (input) for mailman id 470857;
 Wed, 04 Jan 2023 01:22:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eMRm=5B=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pCsTn-00070C-QK
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 01:22:07 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 33c37a1e-8bce-11ed-91b6-6bf2151ebd3b;
 Wed, 04 Jan 2023 02:22:06 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id F3976B810FA;
 Wed,  4 Jan 2023 01:22:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0014C433D2;
 Wed,  4 Jan 2023 01:22:03 +0000 (UTC)
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
X-Inumbo-ID: 33c37a1e-8bce-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672795324;
	bh=pTGI2ZexUZC1WRlRQKkwMJUAN5r/S/qdIbguBBS3LXs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WtXaF5/0GmUJHS6EKjC90BWZokfrZamzUxNu/v3g60FuOCYvEJQw7RGNgcsA6/L35
	 SVuTJ0CHTvouMLmBKsN6OoM65Y1ptNY6LIqjWYRjJJzffg8SvMEbYxpgP/TW8aBwfI
	 uXXAMirDvkbdqX5vlXSQHTgNyXyjujSLLuKxhxd8dQ2XlnNYlTERQZ65ZG2wTTDuXW
	 k11E2ohgi9Uhe92XySYG95EBzaQiYjy2diPOq6df+pqm74uAug05phXOaaY5WH3DnT
	 MgT040kdLGrvA+X4xEadcNCoSIggZZxhYH+jT6PPRmHevmhN15vHx7g3oVCByqw9oL
	 16Tha2WuIhEGg==
Date: Tue, 3 Jan 2023 17:22:01 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH 6/6] CI: Simplify the MUSL check
In-Reply-To: <20221230003848.3241-7-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2301031721530.4079@ubuntu-linux-20-04-desktop>
References: <20221230003848.3241-1-andrew.cooper3@citrix.com> <20221230003848.3241-7-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 30 Dec 2022, Andrew Cooper wrote:
> There's no need to do ad-hoc string parsing.  Use grep -q instead.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> CC: Doug Goldstein <cardoe@cardoe.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Anthony PERARD <anthony.perard@citrix.com>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  automation/scripts/build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/automation/scripts/build b/automation/scripts/build
> index 206312ecc7d0..f2f5e55bc04f 100755
> --- a/automation/scripts/build
> +++ b/automation/scripts/build
> @@ -65,7 +65,7 @@ else
>          cfgargs+=("--disable-stubdom")
>      fi
>  
> -    if  ! test -z "$(ldd /bin/ls|grep musl|head -1)"; then
> +    if ldd /bin/ls | grep -q musl; then
>          # disable --disable-werror for QEMUU when building with MUSL
>          cfgargs+=("--with-extra-qemuu-configure-args=\"--disable-werror\"")
>          # SeaBIOS doesn't build on MUSL systems
> -- 
> 2.11.0
> 

