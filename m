Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9DD7BAFEB
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 03:07:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613194.953564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoZJ9-0002bH-9q; Fri, 06 Oct 2023 01:07:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613194.953564; Fri, 06 Oct 2023 01:07:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoZJ9-0002Yc-6P; Fri, 06 Oct 2023 01:07:11 +0000
Received: by outflank-mailman (input) for mailman id 613194;
 Fri, 06 Oct 2023 01:07:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ehtw=FU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qoZJ7-0002KB-Dr
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 01:07:09 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab3755a0-63e4-11ee-98d3-6d05b1d4d9a1;
 Fri, 06 Oct 2023 03:07:08 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 834A561BE9;
 Fri,  6 Oct 2023 01:07:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89024C433C8;
 Fri,  6 Oct 2023 01:07:04 +0000 (UTC)
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
X-Inumbo-ID: ab3755a0-63e4-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696554426;
	bh=yc3CqMubtXVPF3l2MoXJ2cXECj3Yw020qJya+3m7tHE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nzU1mjf/cXU9+PlQiAElnZ/atkg2GF4VtqONDQuaoghr8IPRw4u24lTIr90b6GtxA
	 to26Gv+SrHFzXtNIcALG+wmcrhtHJ534ZIJp9YTLuyI/ppQuTp1yb/VKa6LWrOAiFV
	 W/YVuYMQSs0KkUI3ZyqRrlIdjLPonkzmebi4rTIDs1bXijYSzIeLQeYD7Tx+5VADJv
	 2ZiRfbhwkY86dVeeV8FSTvRqisWayWEjf5AyAsVpbm7ko7AoO44kxUoX4/NB5vEj3h
	 N6fleMepTI/Xe1iO4KTDVgEaqpig/5T33V6sKen20AZXTkpJA+5Cznbx9gY40KjUrX
	 JojxegCmqUxAA==
Date: Thu, 5 Oct 2023 18:07:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, George Dunlap <george.dunlap@citrix.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH][for-4.19 2/2] xen/spinlock: fix use of 0 as a null
 pointer constant
In-Reply-To: <44395904e6cca0cc83a9d01abbc50047ecba961e.1696494834.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2310051806570.2348112@ubuntu-linux-20-04-desktop>
References: <cover.1696494834.git.nicola.vetrini@bugseng.com> <44395904e6cca0cc83a9d01abbc50047ecba961e.1696494834.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 5 Oct 2023, Nicola Vetrini wrote:
> The constant 0 is used as a null pointer constant, in
> violation of MISRA C:2012 Rule 11.9, in builds with
> CONFIG_DEBUG_LOCK_PROFILE defined.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Release builds should not be impacted by this
> ---
>  xen/include/xen/spinlock.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/include/xen/spinlock.h b/xen/include/xen/spinlock.h
> index e7a1c1aa8988..16d933ae7ebe 100644
> --- a/xen/include/xen/spinlock.h
> +++ b/xen/include/xen/spinlock.h
> @@ -94,7 +94,7 @@ struct lock_profile_qhead {
>      int32_t                   idx;     /* index for printout */
>  };
>  
> -#define _LOCK_PROFILE(name) { 0, #name, &name, 0, 0, 0, 0, 0 }
> +#define _LOCK_PROFILE(name) { NULL, #name, &name, 0, 0, 0, 0, 0 }
>  #define _LOCK_PROFILE_PTR(name)                                               \
>      static struct lock_profile * const __lock_profile_##name                  \
>      __used_section(".lockprofile.data") =                                     \
> -- 
> 2.34.1
> 

