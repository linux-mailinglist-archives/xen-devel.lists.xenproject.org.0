Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 758DE71020B
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 02:38:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539261.839958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1yzH-0006oz-Kh; Thu, 25 May 2023 00:37:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539261.839958; Thu, 25 May 2023 00:37:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1yzH-0006nK-Ho; Thu, 25 May 2023 00:37:51 +0000
Received: by outflank-mailman (input) for mailman id 539261;
 Thu, 25 May 2023 00:37:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gGWh=BO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1q1yzG-0006mv-20
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 00:37:50 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e0a4a67-fa94-11ed-8611-37d641c3527e;
 Thu, 25 May 2023 02:37:47 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3F480640E1;
 Thu, 25 May 2023 00:37:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 501BBC433D2;
 Thu, 25 May 2023 00:37:43 +0000 (UTC)
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
X-Inumbo-ID: 5e0a4a67-fa94-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684975064;
	bh=R/CEbL3gLijXrnN1wmloMA92/w/+Y2y8jCJRaA0r2j4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=PE8mFMDLFhgHlmb768p/ZNPrUeoe57nW4gUASnYvLAD3hedPozwIkOwTL0HgonGV2
	 kkQFVi2jAdPAwoaeR0bydedXYLccIVxnniErj1G5IaNhVAfytDv60NDiMxqgd87nkH
	 pcklZBLTjVohQVBQv3Li9ct/R/XHKfhJO/3VrAvEeBuNPSAd6AQqxIUjogEtEEaAZ8
	 n81yaIZnc+kAoQrWOSS6thvQB+Vx/evtX7VQ27lmiitjuKq8C+9hkVa+gwqsMhgiv4
	 bsKY88lgH2gjVhuczBSpjAAsZZSDXSEFL205wsF9mHxTWmwK+yR+Mp6eFT4+dO7kXp
	 FfEcBsQvILIFQ==
Date: Wed, 24 May 2023 17:37:41 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <luca.fancellu@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, wei.chen@arm.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/3] xen/misra: xen-analysis.py: Improve the cppcheck
 version check
In-Reply-To: <20230519093019.2131896-2-luca.fancellu@arm.com>
Message-ID: <alpine.DEB.2.22.394.2305241737340.44000@ubuntu-linux-20-04-desktop>
References: <20230519093019.2131896-1-luca.fancellu@arm.com> <20230519093019.2131896-2-luca.fancellu@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 19 May 2023, Luca Fancellu wrote:
> Use tuple comparison to check the cppcheck version.
> 
> Take the occasion to harden the regex, escaping the dots so that we
> check for them instead of generic characters.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/scripts/xen_analysis/cppcheck_analysis.py | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
> 
> diff --git a/xen/scripts/xen_analysis/cppcheck_analysis.py b/xen/scripts/xen_analysis/cppcheck_analysis.py
> index c8abbe0fca79..8dc45e653b79 100644
> --- a/xen/scripts/xen_analysis/cppcheck_analysis.py
> +++ b/xen/scripts/xen_analysis/cppcheck_analysis.py
> @@ -157,7 +157,7 @@ def generate_cppcheck_deps():
>              "Error occured retrieving cppcheck version:\n{}\n\n{}"
>          )
>  
> -    version_regex = re.search('^Cppcheck (\d+).(\d+)(?:.\d+)?$',
> +    version_regex = re.search('^Cppcheck (\d+)\.(\d+)(?:\.\d+)?$',
>                                invoke_cppcheck, flags=re.M)
>      # Currently, only cppcheck version >= 2.7 is supported, but version 2.8 is
>      # known to be broken, please refer to docs/misra/cppcheck.txt
> @@ -166,15 +166,10 @@ def generate_cppcheck_deps():
>              "Can't find cppcheck version or version not identified: "
>              "{}".format(invoke_cppcheck)
>          )
> -    major = int(version_regex.group(1))
> -    minor = int(version_regex.group(2))
> -    if major < 2 or (major == 2 and minor < 7):
> +    version = (int(version_regex.group(1)), int(version_regex.group(2)))
> +    if version < (2, 7) or version == (2, 8):
>          raise CppcheckDepsPhaseError(
> -            "Cppcheck version < 2.7 is not supported"
> -        )
> -    if major == 2 and minor == 8:
> -        raise CppcheckDepsPhaseError(
> -            "Cppcheck version 2.8 is known to be broken, see the documentation"
> +            "Cppcheck version < 2.7 or 2.8 are not supported"
>          )
>  
>      # If misra option is selected, append misra addon and generate cppcheck
> -- 
> 2.34.1
> 

