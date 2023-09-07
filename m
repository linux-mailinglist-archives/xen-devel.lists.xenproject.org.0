Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D318B796E6B
	for <lists+xen-devel@lfdr.de>; Thu,  7 Sep 2023 03:08:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597002.931165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qe3Vm-0001qr-Hs; Thu, 07 Sep 2023 01:08:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597002.931165; Thu, 07 Sep 2023 01:08:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qe3Vm-0001oP-EQ; Thu, 07 Sep 2023 01:08:46 +0000
Received: by outflank-mailman (input) for mailman id 597002;
 Thu, 07 Sep 2023 01:08:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Shnx=EX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qe3Vl-0001j3-0h
 for xen-devel@lists.xenproject.org; Thu, 07 Sep 2023 01:08:45 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14f47ce1-4d1b-11ee-9b0d-b553b5be7939;
 Thu, 07 Sep 2023 03:08:43 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 7FD4DCE1843;
 Thu,  7 Sep 2023 01:08:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABB50C433C8;
 Thu,  7 Sep 2023 01:08:35 +0000 (UTC)
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
X-Inumbo-ID: 14f47ce1-4d1b-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694048917;
	bh=RRl6GA06ApCW7aDGvJ8FmMiHINPRUfB9jHWxl5LVVSE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=pcaUqBmKcxJ0MWe2Nnz33EhC6GW5vhsH3F7Z7+izE/dD6/D16r9Tq5Mzy5UT6tu9p
	 LKwkMOkOKZEJtLv+6FMJv90l0O+GTUuF3KM8IXkP03jX+xHqH9HUnb2rbcy7lxAOek
	 BgjyJEDN6E25CRxyBvWeO99qiMzTelHHKbsTpWK7btaTuJLIvkwuJbnskPWq9r9Ry2
	 zweb0EZ9uHGzAmGCEmn3I/o1AjOaDG1psFnL/87LuUfatkPzpdoq2L/Q3lb/I640AA
	 4ncvwb4TVMAq4Lwaz0Uu86ayaPKf0rkXMRIBXIqh4a0BDQh8dd9K2byCKX9XaZbWU6
	 dltkDa1PmL8tA==
Date: Wed, 6 Sep 2023 18:08:32 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH v2 2/2] automation: execute SAF translation before
 the analysis with ECLAIR
In-Reply-To: <8d4dba44bf70de642d3128cd11785ebdf1fce421.1693998375.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2309061808270.6458@ubuntu-linux-20-04-desktop>
References: <cover.1693998375.git.nicola.vetrini@bugseng.com> <8d4dba44bf70de642d3128cd11785ebdf1fce421.1693998375.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 6 Sep 2023, Nicola Vetrini wrote:
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

