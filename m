Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8016F7119FB
	for <lists+xen-devel@lfdr.de>; Fri, 26 May 2023 00:09:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539896.841219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2J8P-0007zZ-Lc; Thu, 25 May 2023 22:08:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539896.841219; Thu, 25 May 2023 22:08:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2J8P-0007xt-Hr; Thu, 25 May 2023 22:08:37 +0000
Received: by outflank-mailman (input) for mailman id 539896;
 Thu, 25 May 2023 22:08:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gGWh=BO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1q2J8O-0007xn-B8
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 22:08:36 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b02f94b4-fb48-11ed-8611-37d641c3527e;
 Fri, 26 May 2023 00:08:34 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A460160B2E;
 Thu, 25 May 2023 22:08:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0E3CC433D2;
 Thu, 25 May 2023 22:08:30 +0000 (UTC)
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
X-Inumbo-ID: b02f94b4-fb48-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685052512;
	bh=5g/HkwMm8XNJI1vp98454/Sli426iE1jv1+3sg/DUu8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GNLIeoSgGabMd4itR0MGgzqTsrXKnM4R4qyH/q99ymFajk7DQMnmFThnAv5z/Iw5k
	 /rnO8/07lsgABKIpBZGTpE+jm5IQmgCwm7g685/EH0thlueNueVMNKavHOB1lwaV8h
	 udYSvE2FFvwO9aMGXiv22geT9lKzAb/cTn/sM28zSCfhcAcMLiJ9hStY0dWAQF0p8T
	 TIT1a4XirtmuE+7AiZXAmF/MDAuWPP0W9eh5LhfTcX/JPEJTHgraxH4796CYFQa4Rn
	 1MruwYMqmKCMS+xOYhB4NscI4QeNr0bGlSo8tZwquXDDCSDQaOQl1Ta+L7FlTTMwwL
	 zgSlHuo2iDNBw==
Date: Thu, 25 May 2023 15:08:29 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <luca.fancellu@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, wei.chen@arm.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/3] xen/misra: xen-analysis.py: Fix latent bug
In-Reply-To: <20230519093019.2131896-3-luca.fancellu@arm.com>
Message-ID: <alpine.DEB.2.22.394.2305251508170.44000@ubuntu-linux-20-04-desktop>
References: <20230519093019.2131896-1-luca.fancellu@arm.com> <20230519093019.2131896-3-luca.fancellu@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 19 May 2023, Luca Fancellu wrote:
> Currenly there is a latent bug that is not triggered because
> the function cppcheck_merge_txt_fragments is called with the
> parameter strip_paths having a list of only one element.
> 
> The bug is that the split function should not be in the
> loop for strip_paths, but one level before, fix it.
> 
> Fixes: 02b26c02c7c4 ("xen/scripts: add cppcheck tool to the xen-analysis.py script")
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>
Tested-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/scripts/xen_analysis/cppcheck_report_utils.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/scripts/xen_analysis/cppcheck_report_utils.py b/xen/scripts/xen_analysis/cppcheck_report_utils.py
> index c5f466aff141..fdc299c7e029 100644
> --- a/xen/scripts/xen_analysis/cppcheck_report_utils.py
> +++ b/xen/scripts/xen_analysis/cppcheck_report_utils.py
> @@ -104,8 +104,8 @@ def cppcheck_merge_txt_fragments(fragments_list, out_txt_file, strip_paths):
>                  for path in strip_paths:
>                      text_report_content[i] = text_report_content[i].replace(
>                                                                  path + "/", "")
> -                    # Split by : separator
> -                    text_report_content[i] = text_report_content[i].split(":")
> +                # Split by : separator
> +                text_report_content[i] = text_report_content[i].split(":")
>  
>              # sort alphabetically for second field (misra rule) and as second
>              # criteria for the first field (file name)
> -- 
> 2.34.1
> 

