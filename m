Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE267AB06AA
	for <lists+xen-devel@lfdr.de>; Fri,  9 May 2025 01:42:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.979677.1366184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDAsy-0000Dr-HN; Thu, 08 May 2025 23:42:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 979677.1366184; Thu, 08 May 2025 23:42:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDAsy-0000BX-E9; Thu, 08 May 2025 23:42:40 +0000
Received: by outflank-mailman (input) for mailman id 979677;
 Thu, 08 May 2025 23:42:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QXoN=XY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uDAsx-0000BR-3O
 for xen-devel@lists.xenproject.org; Thu, 08 May 2025 23:42:39 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ec7a9b7-2c66-11f0-9ffb-bf95429c2676;
 Fri, 09 May 2025 01:42:37 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BDEF05C6517;
 Thu,  8 May 2025 23:40:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEEE4C4CEE7;
 Thu,  8 May 2025 23:42:34 +0000 (UTC)
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
X-Inumbo-ID: 1ec7a9b7-2c66-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746747755;
	bh=vb4rarApPBdMsl51Tbw/q6cRzN6NxmQK8XthNMMLJag=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LIbI92Ow5GjRRHL7n1i0b6V4ftkNZGRgLxsb+2htDd4IyQuU3jINUQuKQ4DPRcZhm
	 ibFlwddPknw6a6EGsOGD38qUFRDVEaG6fgDj0mF4uyGmb65SCcvqNkxhNxp9VBouP9
	 jzy/TsC18CBpeGVi42WiLtCPFGYfLmqDTGyqpUKHwl3L0zgxsOpDQVNPNYOT8nc8Hf
	 W0VfHQ+VkpqQfOahlyDoffTU0b2VjOUb7q3w4YWAgA4tC5Q1UxYRvI/jJMg+vHYPbk
	 mMk73q3GiBMMXeYL6y3gF3S9K9Jw9CP0tg43zpSmD9bxoC38UNy0EeINO89n6gor2r
	 DD9i1XnxFpdkw==
Date: Thu, 8 May 2025 16:42:33 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 4/6] rangeset: introduce rangeset_subtract
In-Reply-To: <20250508132040.532898-5-stewart.hildebrand@amd.com>
Message-ID: <alpine.DEB.2.22.394.2505081640310.3879245@ubuntu-linux-20-04-desktop>
References: <20250508132040.532898-1-stewart.hildebrand@amd.com> <20250508132040.532898-5-stewart.hildebrand@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 8 May 2025, Stewart Hildebrand wrote:
> Introduce rangeset_subtract() to remove regions in r2 from r1.
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
> v1->v2:
> * no change
> ---
>  xen/common/rangeset.c      | 12 ++++++++++++
>  xen/include/xen/rangeset.h |  3 +++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/xen/common/rangeset.c b/xen/common/rangeset.c
> index e75871039087..b9e8912fb1c3 100644
> --- a/xen/common/rangeset.c
> +++ b/xen/common/rangeset.c
> @@ -397,6 +397,18 @@ int rangeset_merge(struct rangeset *r1, struct rangeset *r2)
>      return rangeset_report_ranges(r2, 0, ~0UL, merge, r1);
>  }
>  
> +static int cf_check subtract(unsigned long s, unsigned long e, void *data)
> +{
> +    struct rangeset *r = data;
> +
> +    return rangeset_remove_range(r, s, e);
> +}
> +
> +int rangeset_subtract(struct rangeset *r1, struct rangeset *r2)
> +{
> +    return rangeset_report_ranges(r2, 0, ~0UL, subtract, r1);
> +}
> +
>  int rangeset_add_singleton(
>      struct rangeset *r, unsigned long s)
>  {
> diff --git a/xen/include/xen/rangeset.h b/xen/include/xen/rangeset.h
> index 96c918082501..817505badf6f 100644
> --- a/xen/include/xen/rangeset.h
> +++ b/xen/include/xen/rangeset.h
> @@ -85,6 +85,9 @@ int rangeset_consume_ranges(struct rangeset *r,
>  /* Merge rangeset r2 into rangeset r1. */
>  int __must_check rangeset_merge(struct rangeset *r1, struct rangeset *r2);
>  
> +/* Subtract rangeset r2 from rangeset r1. */
> +int __must_check rangeset_subtract(struct rangeset *r1, struct rangeset *r2);
> +
>  /* Add/remove/query a single number. */
>  int __must_check rangeset_add_singleton(
>      struct rangeset *r, unsigned long s);
> -- 
> 2.49.0
> 

