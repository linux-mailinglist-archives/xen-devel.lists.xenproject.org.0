Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5367220CFC3
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2020 17:42:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jpvuQ-0001wf-49; Mon, 29 Jun 2020 15:41:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LUBK=AK=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jpvuN-0001vv-Sg
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2020 15:41:23 +0000
X-Inumbo-ID: fc32d9e6-ba1e-11ea-bb8b-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fc32d9e6-ba1e-11ea-bb8b-bc764e2007e4;
 Mon, 29 Jun 2020 15:41:23 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 72D94253B7;
 Mon, 29 Jun 2020 15:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593445282;
 bh=v4o/sTBPFwFPeWTSIwtW+Aupixd+ozXq8yjf4Q0efkM=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=YGzYArGbcosRmEvHAhRENWfXUa/41gJFqQKWFNl+Uo24zpv6gfAq1pwfew7c/Da/c
 vOMGeVrqUWjphdVHn2Ahrubcb12el3zGYx6i+BOfnEbgy/39lzvXAxIE1vcN1q7LEx
 HTsU2Nrv3Oqmt3ligFXt6y5ULF3h2qSSJDqWENlU=
Date: Mon, 29 Jun 2020 08:41:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v4 for-4.14 2/2] pvcalls: Document correctly and
 explicitely the padding for all arches
In-Reply-To: <20200627095533.14145-3-julien@xen.org>
Message-ID: <alpine.DEB.2.21.2006290841030.8121@sstabellini-ThinkPad-T480s>
References: <20200627095533.14145-1-julien@xen.org>
 <20200627095533.14145-3-julien@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 paul@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <jgrall@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sat, 27 Jun 2020, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> The specification of pvcalls suggests there is padding for 32-bit x86
> at the end of most the structure. However, they are not described in
> in the public header.
> 
> Because of that all the structures would be 32-bit aligned and not
> 64-bit aligned for 32-bit x86.
> 
> For all the other architectures supported (Arm and 64-bit x86), the
> structure are aligned to 64-bit because they contain uint64_t field.
> Therefore all the structures contain implicit padding.
> 
> Given the specification is authoriitative, the padding will the same for
> the all architectures. The potential breakage of compatibility is ought
> to be fine as pvcalls is still a tech preview.
> 
> As an aside, the padding sadly cannot be mandated to be 0 as they are
> already present. So it is not going to be possible to use the padding
> for extending a command in the future.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Aside from typos other mentioned:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>     This wants to be included in Xen 4.14 to avoid more users to rely on
>     wrong public headers.
> 
>     Changes in v4:
>         - Revert back to v1 for the patch and expand the commit message
> 
>     Changes in v3:
>         - Use __i386__ rather than CONFIG_X86_32
> 
>     Changes in v2:
>         - It is not possible to use the same padding for 32-bit x86 and
>         all the other supported architectures.
> ---
>  docs/misc/pvcalls.pandoc        | 8 --------
>  xen/include/public/io/pvcalls.h | 4 ++++
>  2 files changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/docs/misc/pvcalls.pandoc b/docs/misc/pvcalls.pandoc
> index 665dad556c39..971cd8f4b122 100644
> --- a/docs/misc/pvcalls.pandoc
> +++ b/docs/misc/pvcalls.pandoc
> @@ -246,9 +246,7 @@ The format is defined as follows:
>      			uint32_t domain;
>      			uint32_t type;
>      			uint32_t protocol;
> -    			#ifdef CONFIG_X86_32
>      			uint8_t pad[4];
> -    			#endif
>      		} socket;
>      		struct xen_pvcalls_connect {
>      			uint64_t id;
> @@ -257,16 +255,12 @@ The format is defined as follows:
>      			uint32_t flags;
>      			grant_ref_t ref;
>      			uint32_t evtchn;
> -    			#ifdef CONFIG_X86_32
>      			uint8_t pad[4];
> -    			#endif
>      		} connect;
>      		struct xen_pvcalls_release {
>      			uint64_t id;
>      			uint8_t reuse;
> -    			#ifdef CONFIG_X86_32
>      			uint8_t pad[7];
> -    			#endif
>      		} release;
>      		struct xen_pvcalls_bind {
>      			uint64_t id;
> @@ -276,9 +270,7 @@ The format is defined as follows:
>      		struct xen_pvcalls_listen {
>      			uint64_t id;
>      			uint32_t backlog;
> -    			#ifdef CONFIG_X86_32
>      			uint8_t pad[4];
> -    			#endif
>      		} listen;
>      		struct xen_pvcalls_accept {
>      			uint64_t id;
> diff --git a/xen/include/public/io/pvcalls.h b/xen/include/public/io/pvcalls.h
> index 905880735dda..6da6b5533a10 100644
> --- a/xen/include/public/io/pvcalls.h
> +++ b/xen/include/public/io/pvcalls.h
> @@ -68,6 +68,7 @@ struct xen_pvcalls_request {
>              uint32_t domain;
>              uint32_t type;
>              uint32_t protocol;
> +            uint8_t pad[4];
>          } socket;
>          struct xen_pvcalls_connect {
>              uint64_t id;
> @@ -76,10 +77,12 @@ struct xen_pvcalls_request {
>              uint32_t flags;
>              grant_ref_t ref;
>              uint32_t evtchn;
> +            uint8_t pad[4];
>          } connect;
>          struct xen_pvcalls_release {
>              uint64_t id;
>              uint8_t reuse;
> +            uint8_t pad[7];
>          } release;
>          struct xen_pvcalls_bind {
>              uint64_t id;
> @@ -89,6 +92,7 @@ struct xen_pvcalls_request {
>          struct xen_pvcalls_listen {
>              uint64_t id;
>              uint32_t backlog;
> +            uint8_t pad[4];
>          } listen;
>          struct xen_pvcalls_accept {
>              uint64_t id;
> -- 
> 2.17.1
> 

