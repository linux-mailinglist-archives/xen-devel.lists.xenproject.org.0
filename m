Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B3EB5068A
	for <lists+xen-devel@lfdr.de>; Tue,  9 Sep 2025 21:45:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1117335.1463481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uw4HD-0004vS-Qg; Tue, 09 Sep 2025 19:45:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1117335.1463481; Tue, 09 Sep 2025 19:45:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uw4HD-0004tI-Ny; Tue, 09 Sep 2025 19:45:15 +0000
Received: by outflank-mailman (input) for mailman id 1117335;
 Tue, 09 Sep 2025 19:45:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1uw4HC-0004tC-Ue
 for xen-devel@lists.xenproject.org; Tue, 09 Sep 2025 19:45:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uw4HC-001oQa-2e;
 Tue, 09 Sep 2025 19:45:14 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uw4HC-001zps-2r;
 Tue, 09 Sep 2025 19:45:14 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
	:Subject:Cc:To:Date:From; bh=fMBaU2ULXckfSkpkBP60C0aXC+bM4T65O8EiPR2eGvA=; b=
	S2HtFku6z9uJFXup6uSoGT0plWUBdQOdjWhJVS3olfWJlr51ECXfiLB9KLZEPslecWt/p0bCmRthW
	3urdz69rQbYcGA5SBg7AahXLCOVlrsgsPg6i9/iUGjykoYKyxVGZ7Dyg9R8lNW7a4UIXstKv0ouSu
	iCnHbTbaAIgyFhexA=;
From: dmukhin@xen.org
Date: Tue, 9 Sep 2025 12:45:13 -0700
To: Michal Orzel <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org
Subject: Re: [ImageBuilder] Use LOAD_CMD by default if not specified in
 load_file()
Message-ID: <aMCDyZkWoKuzc7xf@kraken>
References: <20250909074141.7356-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909074141.7356-1-michal.orzel@amd.com>

On Tue, Sep 09, 2025 at 09:41:41AM +0200, Michal Orzel wrote:
> Commit 061d6782756f modified load_file() to take load command as
> argument but did not change all the invocations (e.g. loading standalone
> Linux, bitstream, etc.) which broke the output script (load command
> empty). Fix it by defaulting to LOAD_CMD if not specified.
> 
> Fixes: 061d6782756f ("Add config option to use separate load commands for Xen, DOM0 and DOMU binaries")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Denis Mukhin <dmukhin@ford.com> 

> ---
>  scripts/uboot-script-gen | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
> index 849b8f939e81..4f9261035d73 100755
> --- a/scripts/uboot-script-gen
> +++ b/scripts/uboot-script-gen
> @@ -736,6 +736,12 @@ function load_file()
>      local base="$(realpath $PWD)"/
>      local relative_path=${absolute_path#"$base"}
>  
> +    # Default to LOAD_CMD if not specified
> +    if test -z "${load_cmd}"
> +    then
> +        load_cmd="${LOAD_CMD}"
> +    fi
> +
>      if test "$FIT"
>      then
>          echo "imxtract \$fit_addr $fit_scr_name $memaddr" >> $UBOOT_SOURCE
> -- 
> 2.43.0
> 
> 

