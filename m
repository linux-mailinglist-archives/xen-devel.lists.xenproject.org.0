Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C42AC506B
	for <lists+xen-devel@lfdr.de>; Tue, 27 May 2025 16:01:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.998471.1379195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJus6-0003BG-1w; Tue, 27 May 2025 14:01:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 998471.1379195; Tue, 27 May 2025 14:01:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJus5-00038t-Vb; Tue, 27 May 2025 14:01:37 +0000
Received: by outflank-mailman (input) for mailman id 998471;
 Tue, 27 May 2025 14:01:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uJus4-00038n-Uz
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 14:01:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uJus4-0053ou-29;
 Tue, 27 May 2025 14:01:36 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uJus4-00AY08-2Z;
 Tue, 27 May 2025 14:01:36 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=rqbwXwjMP7vK3NmLgSzJprV7uK4nyJPjRabhk7YYEyE=; b=RKEqdBvXO0A8t8fK1WYqlr//oE
	Y/I7RA5+qfqDlblkU4HXAUUD0pri+hrRgwQtxe/34Ynp236glEr7vqSGlyw9gAiVoIIMnBKnLHc2I
	2zl1i3mq+rfjTlBX4i00G+vDJOuw8RUYYWMi9pWeZ12GaNeGfbxQemXWNRmzYp6PsV/s=;
Date: Tue, 27 May 2025 16:01:34 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH 2/3] CI: Use bash arrays to simplfy dom0 rootfs
 construction
Message-ID: <aDXFviVAxsscfKV2@l14>
References: <20250522173640.575452-1-andrew.cooper3@citrix.com>
 <20250522173640.575452-3-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522173640.575452-3-andrew.cooper3@citrix.com>

On Thu, May 22, 2025 at 06:36:39PM +0100, Andrew Cooper wrote:
> For Qubes, this requires switching from sh to bash.
> 
> This reduces the number of times the target filename needs to be written to 1.
> 
> Expand the comment to explain the concatination constraints.

Isn't the correct spelling "concatenation"? Same for the two comments.

> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> I would like to find a slightly nicer way of conditional parts, but nothing
> comes to mind.

Well, one way I can think of is having a new variable which can carry
the rootfs part associated with a particular test, then that variable
can be updated at the time we configure for that test. Something like:

# init
declare -a append_rootfs_part
# or append_rootfs_part=() is probably fine too.

case $test in
  argo)
    append_rootfs_part+=(argo.cpio.gz)
    # ... other test configuration
    ;;
esac

# Dom0 rootfs
parts=(
    rootfs.cpio.gz
    xen-tools.cpio.gz
    "${append_rootfs_part[@]}"
)

And that should works fine, even if there isn't any extra rootfs part.

> diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
> index 10af274a0ba7..1dd3f48b3d29 100755
> --- a/automation/scripts/qubes-x86-64.sh
> +++ b/automation/scripts/qubes-x86-64.sh
> @@ -187,10 +187,14 @@ Kernel \r on an \m (\l)
>      rm -rf rootfs
>  fi
>  
> -# Dom0 rootfs
> -cp binaries/ucode.cpio binaries/dom0-rootfs.cpio.gz
> -cat binaries/rootfs.cpio.gz >> binaries/dom0-rootfs.cpio.gz
> -cat binaries/xen-tools.cpio.gz >> binaries/dom0-rootfs.cpio.gz
> +# Dom0 rootfs.  The order or concatination is important; ucode wants to come

                             ^ of concatenation

Same typo in the other comment.

Beside the typo, patch looks fine:
Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 
Anthony PERARD

