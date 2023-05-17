Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A95F17071F9
	for <lists+xen-devel@lfdr.de>; Wed, 17 May 2023 21:23:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536003.834124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzMj4-0002wK-Kw; Wed, 17 May 2023 19:22:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536003.834124; Wed, 17 May 2023 19:22:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzMj4-0002sz-Fu; Wed, 17 May 2023 19:22:18 +0000
Received: by outflank-mailman (input) for mailman id 536003;
 Wed, 17 May 2023 19:22:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VO9T=BG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pzMj2-0002sl-Ah
 for xen-devel@lists.xenproject.org; Wed, 17 May 2023 19:22:16 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e913144-f4e8-11ed-8611-37d641c3527e;
 Wed, 17 May 2023 21:22:10 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8E48564A91;
 Wed, 17 May 2023 19:22:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59629C433EF;
 Wed, 17 May 2023 19:22:08 +0000 (UTC)
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
X-Inumbo-ID: 1e913144-f4e8-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684351329;
	bh=cotWtwoEBc9omPlWdhAXiXoaigkbzGVwDbWMTLQ9FI0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mhbGZFlQo0Odftazgd8GWtAh4dMsnBplqJyvkaaYebadIj15LSJ1WjFFezq+o/DY9
	 aD3OLjg+YIWP0Hpbxyee3UEUXUR3wLS2uaUbJVhHEnfEqA8HqNz/+d5AmlGSWV0Mk/
	 4ylMAFKXC4gYg1rbnODjuSmGpDby9y/ubMcTAt4N8Fsd/qqpGMKs/WEPrhGL7Ibb/W
	 QOb5QESQZ+cjZ1HrAYKWEgw1jLmjdcKN/BB0bK/H00D/OnV96LlakV5+CwC6+BjIaq
	 6qnydeRgHMElLaCDOZt8cRFPDUTMJ80ZH7mBXCI11JEqem3Qmbiri2Ugjbf+2sTfhx
	 U2jfassxwHm5g==
Date: Wed, 17 May 2023 12:22:05 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Olaf Hering <olaf@aepfle.de>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1] automation: allow to rerun build script
In-Reply-To: <20230517055722.4057-1-olaf@aepfle.de>
Message-ID: <alpine.DEB.2.22.394.2305171222000.128889@ubuntu-linux-20-04-desktop>
References: <20230517055722.4057-1-olaf@aepfle.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 17 May 2023, Olaf Hering wrote:
> Calling build twice in the same environment will fail because the
> directory 'binaries' was already created before. Use mkdir -p to ignore
> an existing directory and move on to the actual build.
> 
> Signed-off-by: Olaf Hering <olaf@aepfle.de>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/scripts/build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/automation/scripts/build b/automation/scripts/build
> index 197d085f3e..9085cba352 100755
> --- a/automation/scripts/build
> +++ b/automation/scripts/build
> @@ -36,7 +36,7 @@ fi
>  cp xen/.config xen-config
>  
>  # Directory for the artefacts to be dumped into
> -mkdir binaries
> +mkdir -p binaries
>  
>  if [[ "${CPPCHECK}" == "y" ]] && [[ "${HYPERVISOR_ONLY}" == "y" ]]; then
>      # Cppcheck analysis invokes Xen-only build.
> 

