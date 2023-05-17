Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 691B4705C09
	for <lists+xen-devel@lfdr.de>; Wed, 17 May 2023 02:39:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535745.833731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pz5C7-00081X-W3; Wed, 17 May 2023 00:39:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535745.833731; Wed, 17 May 2023 00:39:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pz5C7-0007zF-TA; Wed, 17 May 2023 00:39:07 +0000
Received: by outflank-mailman (input) for mailman id 535745;
 Wed, 17 May 2023 00:39:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VO9T=BG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pz5C6-0007z9-Uk
 for xen-devel@lists.xenproject.org; Wed, 17 May 2023 00:39:06 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 39f7e306-f44b-11ed-b229-6b7b168915f2;
 Wed, 17 May 2023 02:39:05 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C1EA86303F;
 Wed, 17 May 2023 00:39:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF43BC433D2;
 Wed, 17 May 2023 00:39:02 +0000 (UTC)
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
X-Inumbo-ID: 39f7e306-f44b-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684283944;
	bh=yBGgIce3LbkMp7weWqw3zjRUv/dBOkI/gB3bWEMe4kI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=r323E9w7DjzGjK2zeg7MVY0cD47j9L0FIYn4YJ6ZFUChRJB5jaLAKtd3UjWLCNT6r
	 hivD9p56joHsNh3gNlyzHGIQZX19GbKXCNGAbl+r5e8Kh6JNGe0u0Rtz69lRBvzJtg
	 3muClq9m/kdIXODEfrTNotULrrOGLjj+pQM5DUcPYY9/VjmgHRtd7Hg3EgY+DGc0tg
	 lwTeHXMmVWyoSjtNfqKR7D1DPQaiO5tYuoCtt9PUqd+Wi5T1QM+LA07NLGBylMo/mo
	 tSUJGminIaTITxwzZFNvQmH9U3dLldNWfil9rdWaxWTm2OxqasSNxHmKgeRSsLWORJ
	 orAPaFFHuPdUA==
Date: Tue, 16 May 2023 17:39:01 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <luca.fancellu@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, wei.chen@arm.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/3] xen/misra: xen-analysis.py: allow cppcheck version
 above 2.7
In-Reply-To: <20230504131245.2985400-3-luca.fancellu@arm.com>
Message-ID: <alpine.DEB.2.22.394.2305161738460.128889@ubuntu-linux-20-04-desktop>
References: <20230504131245.2985400-1-luca.fancellu@arm.com> <20230504131245.2985400-3-luca.fancellu@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 4 May 2023, Luca Fancellu wrote:
> Allow the use of Cppcheck version above 2.7, exception for 2.8 which
> is known and documented do be broken.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>
Tested-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/scripts/xen_analysis/cppcheck_analysis.py | 20 +++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/scripts/xen_analysis/cppcheck_analysis.py b/xen/scripts/xen_analysis/cppcheck_analysis.py
> index 658795bb9f5b..c3783e8df343 100644
> --- a/xen/scripts/xen_analysis/cppcheck_analysis.py
> +++ b/xen/scripts/xen_analysis/cppcheck_analysis.py
> @@ -157,13 +157,25 @@ def generate_cppcheck_deps():
>              "Error occured retrieving cppcheck version:\n{}\n\n{}"
>          )
>  
> -    version_regex = re.search('^Cppcheck (.*)$', invoke_cppcheck, flags=re.M)
> +    version_regex = re.search('^Cppcheck (\d+).(\d+)(?:.\d+)?$',
> +                              invoke_cppcheck, flags=re.M)
>      # Currently, only cppcheck version >= 2.7 is supported, but version 2.8 is
>      # known to be broken, please refer to docs/misra/cppcheck.txt
> -    if (not version_regex) or (not version_regex.group(1).startswith("2.7")):
> +    if (not version_regex) or len(version_regex.groups()) < 2:
>          raise CppcheckDepsPhaseError(
> -                "Can't find cppcheck version or version is not 2.7"
> -              )
> +            "Can't find cppcheck version or version not identified: "
> +            "{}".format(invoke_cppcheck)
> +        )
> +    major = int(version_regex.group(1))
> +    minor = int(version_regex.group(2))
> +    if major < 2 or (major == 2 and minor < 7):
> +        raise CppcheckDepsPhaseError(
> +            "Cppcheck version < 2.7 is not supported"
> +        )
> +    if major == 2 and minor == 8:
> +        raise CppcheckDepsPhaseError(
> +            "Cppcheck version 2.8 is known to be broken, see the documentation"
> +        )
>  
>      # If misra option is selected, append misra addon and generate cppcheck
>      # files for misra analysis
> -- 
> 2.34.1
> 

