Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A299C3674
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 03:18:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833296.1248425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAJzx-0001JQ-Bf; Mon, 11 Nov 2024 02:17:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833296.1248425; Mon, 11 Nov 2024 02:17:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAJzx-0001GK-8F; Mon, 11 Nov 2024 02:17:49 +0000
Received: by outflank-mailman (input) for mailman id 833296;
 Mon, 11 Nov 2024 02:17:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zp6W=SG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tAJzv-0000v6-Ph
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 02:17:47 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22618230-9fd3-11ef-99a3-01e77a169b0f;
 Mon, 11 Nov 2024 03:17:44 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 736F6A414D2;
 Mon, 11 Nov 2024 02:15:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F517C4CECD;
 Mon, 11 Nov 2024 02:17:41 +0000 (UTC)
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
X-Inumbo-ID: 22618230-9fd3-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE0Ny43NS4xOTMuOTEiLCJoZWxvIjoibnljLnNvdXJjZS5rZXJuZWwub3JnIn0=
X-Custom-Transaction: eyJpZCI6IjIyNjE4MjMwLTlmZDMtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMjkxNDY0LjMyNDY1LCJzZW5kZXIiOiJzc3RhYmVsbGluaUBrZXJuZWwub3JnIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731291462;
	bh=5npUYnPCujKacKgnWxXrB0c6VETFvfgOYaHsSXO82Sw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=c01jjuk6mRJnlpExVNiSg8Y/MIlUoCRRq2S41izowoKcU8Cq9RO/I72lGy407eUGR
	 Zj2aggRH1SGYty6fI/4QEsiIWe89RpHk3K4wkWfNoa/mD37kFkifxMTy40wdmXazBs
	 rZLzkupVioLf7nDMe0T8h9UJFY88Ma6bkHQbia9CI0IH3nmF5DTsb3FI3/WD/8+gJf
	 ruB+BP3i9EgOUsa3pCY5eGj7DIgf4hJSw4pfHOv6aNa+AUqQPYebLUttaO/jE7UZUM
	 u5rkHGXqC4hfPNNVhVW771KXOvl25s9U+FkB7FgkBmSFFPGN8J6RgpeVdAKJzB4aMz
	 LAuct4znFy80g==
Date: Sun, 10 Nov 2024 18:17:40 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH 3/3] automation/eclair: tag Rule 16.3 as clean
In-Reply-To: <4ab02498ab368964302b247341b1401eb53faa63.1730880832.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2411101817250.14721@ubuntu-linux-20-04-desktop>
References: <cover.1730880832.git.federico.serafini@bugseng.com> <4ab02498ab368964302b247341b1401eb53faa63.1730880832.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 6 Nov 2024, Federico Serafini wrote:
> Tag MISRA C:2012 Rule 16.3 as clean for both architectures:
> new violations will cause a failure of the CI/CD pipeline.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Pending the first 2 patches being acked:

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/eclair_analysis/ECLAIR/tagging.ecl | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/eclair_analysis/ECLAIR/tagging.ecl
> index e1d4ed012a..cb7d5743d2 100644
> --- a/automation/eclair_analysis/ECLAIR/tagging.ecl
> +++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
> @@ -64,6 +64,7 @@ MC3R1.R14.1||
>  MC3R1.R14.3||
>  MC3R1.R14.4||
>  MC3R1.R16.2||
> +MC3R1.R16.3||
>  MC3R1.R16.7||
>  MC3R1.R17.1||
>  MC3R1.R17.3||
> @@ -112,7 +113,7 @@ if(string_equal(target,"x86_64"),
>  )
>  
>  if(string_equal(target,"arm64"),
> -    service_selector({"additional_clean_guidelines","MC3R1.R2.1||MC3R1.R5.3||MC3.R11.2||MC3R1.R16.3||MC3R1.R16.6||MC3R1.R20.7"})
> +    service_selector({"additional_clean_guidelines","MC3R1.R2.1||MC3R1.R5.3||MC3.R11.2||MC3R1.R16.6||MC3R1.R20.7"})
>  )
>  
>  -reports+={clean:added,"service(clean_guidelines_common||additional_clean_guidelines)"}
> -- 
> 2.43.0
> 

