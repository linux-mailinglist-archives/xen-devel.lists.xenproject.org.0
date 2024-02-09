Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 518F484FF49
	for <lists+xen-devel@lfdr.de>; Fri,  9 Feb 2024 22:54:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678850.1056417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYYos-0006fb-MV; Fri, 09 Feb 2024 21:54:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678850.1056417; Fri, 09 Feb 2024 21:54:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYYos-0006e4-Ju; Fri, 09 Feb 2024 21:54:02 +0000
Received: by outflank-mailman (input) for mailman id 678850;
 Fri, 09 Feb 2024 21:54:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H1sd=JS=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rYYoq-0006dv-Pi
 for xen-devel@lists.xenproject.org; Fri, 09 Feb 2024 21:54:00 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9ca1f9e-c795-11ee-98f5-efadbce2ee36;
 Fri, 09 Feb 2024 22:53:58 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2B9E0621A7;
 Fri,  9 Feb 2024 21:53:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25859C433C7;
 Fri,  9 Feb 2024 21:53:56 +0000 (UTC)
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
X-Inumbo-ID: b9ca1f9e-c795-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707515636;
	bh=8ju2yy5RFnHwcW52knD89kxNaAND8c1d1mv15ahob0o=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=c3uEbhhbfBKY6TSAJiaJ8elG9KSXET75X++W0bW1URkVYKtj2lCs0d107E37upZzv
	 3EX0y3qmglWULOWeD2hceYjzqA82FCcOujoidWQ9JmPtV2rlIuR2XAwPEhNpU2avZB
	 FVFQ2RoF9feZL7+K18PEurJZYSUd+J08C5kQ4zaN90bMeRTznLnunGZk7CRLnGsMo/
	 F6+dgS4lfLZDSM8HQI7JMIGsQ46LQyojQZdjURpZUhidBWSs0CK5G7GAxZccCequDu
	 TV8QBA9qUTqYMGacNpLb1/apk7/egpzePn3oyJCWzVimwbgh6HQb8H/R0tvDNvy7Tm
	 T8C4d8VMgMEoA==
Date: Fri, 9 Feb 2024 13:53:54 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH] eclair: remove wrongly added -eval_file
In-Reply-To: <976ea35a8682adb2991d249a48bb2b41e834e4e6.1707482589.git.simone.ballarin@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2402091353490.1925432@ubuntu-linux-20-04-desktop>
References: <976ea35a8682adb2991d249a48bb2b41e834e4e6.1707482589.git.simone.ballarin@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 8 Feb 2024, Simone Ballarin wrote:
> properties.ecl does not exist and it is not
> even generated by propertyparser.py. Loading
> this file causes empty ECLAIR analysis.
> 
> Fixes: f4519ee8 ("eclair: move function and macro properties outside ECLAIR")
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/eclair_analysis/ECLAIR/analysis.ecl | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/analysis.ecl b/automation/eclair_analysis/ECLAIR/analysis.ecl
> index 684c5b0b39..a604582da3 100644
> --- a/automation/eclair_analysis/ECLAIR/analysis.ecl
> +++ b/automation/eclair_analysis/ECLAIR/analysis.ecl
> @@ -30,7 +30,6 @@ if(not(scheduled_analysis),
>  -eval_file=deviations.ecl
>  -eval_file=call_properties.ecl
>  -eval_file=tagging.ecl
> --eval_file=properties.ecl
>  -eval_file=concat(set,".ecl")
>  
>  -doc="Hide reports in external code."
> -- 
> 2.34.1
> 

