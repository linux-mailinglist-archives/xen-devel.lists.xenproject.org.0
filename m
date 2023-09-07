Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A52796E41
	for <lists+xen-devel@lfdr.de>; Thu,  7 Sep 2023 03:00:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596989.931146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qe3NO-0007Rt-Ej; Thu, 07 Sep 2023 01:00:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596989.931146; Thu, 07 Sep 2023 01:00:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qe3NO-0007PW-AB; Thu, 07 Sep 2023 01:00:06 +0000
Received: by outflank-mailman (input) for mailman id 596989;
 Thu, 07 Sep 2023 01:00:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Shnx=EX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qe3NN-0006mS-3Q
 for xen-devel@lists.xenproject.org; Thu, 07 Sep 2023 01:00:05 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df0f1f91-4d19-11ee-9b0d-b553b5be7939;
 Thu, 07 Sep 2023 03:00:02 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 1012BCE1843;
 Thu,  7 Sep 2023 01:00:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15692C433C7;
 Thu,  7 Sep 2023 00:59:56 +0000 (UTC)
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
X-Inumbo-ID: df0f1f91-4d19-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694048398;
	bh=OFsA55LpLmg+Z24VmkZpNSJ4scM8gq3ZvDaI4opJXd4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=m7m6/YWyS4Y5Zo6G3Ig5zvwMrDpEeucSsB73FtrROcN38usYK/AgKZcvvZGi3G+zH
	 mUq9EH0fqeVnua2AbQDA+UfoVSU8A4p7Og+8INeWkzVTdYes7t0HX37Jl8wZ6xfFnP
	 ewpknfLY6yl3Ljd2bgm75vy7RhAfABUM8KxLWJSbiUalf98zPIO+jRXT1zf23LCVis
	 wexnalVnZPSSw/TnQjM8Ds5bcKyiexLVNmRvs4D/4eXh2GKFEmt4wHTWVa7sky44aY
	 w0q1Gb1XLFuTs3utm9GnlshYhRwzizEs4NEeCe1QxJ5cdHTlGHqspjGiSqr/xN19HB
	 04GqZ+5NN1pYw==
Date: Wed, 6 Sep 2023 17:59:55 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH 2/2] automation: execute SAF translation before the
 analysis with ECLAIR
In-Reply-To: <b766ea02253f76d9aaacf06a1ffba8bab45ca0b8.1693585223.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2309061759330.6458@ubuntu-linux-20-04-desktop>
References: <cover.1693585223.git.nicola.vetrini@bugseng.com> <b766ea02253f76d9aaacf06a1ffba8bab45ca0b8.1693585223.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 1 Sep 2023, Nicola Vetrini wrote:
> This allows local MISRA deviation comments to be translated into
> the format recognized by ECLAIR.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/eclair_analysis/prepare.sh | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/automation/eclair_analysis/prepare.sh b/automation/eclair_analysis/prepare.sh
> index 275a1a3f517c..0cac5eba00ae 100755
> --- a/automation/eclair_analysis/prepare.sh
> +++ b/automation/eclair_analysis/prepare.sh
> @@ -38,5 +38,8 @@ fi
>      cd xen
>      cp "${CONFIG_FILE}" .config
>      make clean
> +    find . -type f -name "*.safparse" -print -delete
>      make -f ${script_dir}/Makefile.prepare prepare
> +    # Translate the /* SAF-n-safe */ comments into ECLAIR CBTs
> +    scripts/xen-analysis.py --run-eclair --no-build --no-clean
>  )
> -- 
> 2.34.1
> 

