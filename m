Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D901FA556
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 03:01:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkzxu-00033L-UL; Tue, 16 Jun 2020 01:00:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S/rR=75=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jkzxt-0002WR-GS
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 01:00:37 +0000
X-Inumbo-ID: c99a6830-af6c-11ea-bb8b-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c99a6830-af6c-11ea-bb8b-bc764e2007e4;
 Tue, 16 Jun 2020 01:00:36 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 63173207D4;
 Tue, 16 Jun 2020 01:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592269235;
 bh=J8jly909MLc0Y2ifdSI7UaZj0/Am7nLpruFY9//yKFE=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=mrVy+HNgMsmIdtPo2H2g8Cq26JPA4K4xeahHH/6o324NISce4uA+GVqJ05iZf2QDD
 XaQvDvsxN2gcsit8CK7agQt37vfTwcw0FLp2l28xcUzfr5VkQ/Kh4XwhA3h0oqlMpp
 4hZOitPpnPRG/oAtGTX58u43x8ohf1OvPDFenVro=
Date: Mon, 15 Jun 2020 18:00:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v3 for-4.14] pvcalls: Document correctly and explicitely
 the padding for all arches
In-Reply-To: <20200613184132.11880-1-julien@xen.org>
Message-ID: <alpine.DEB.2.21.2006151343430.9074@sstabellini-ThinkPad-T480s>
References: <20200613184132.11880-1-julien@xen.org>
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

On Sat, 13 Jun 2020, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> The documentation of pvcalls suggests there is padding for 32-bit x86
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
> The paddings are now corrected for 32-bit x86 and written explicitly for
> all the architectures.
> 
> While the structure size between 32-bit and 64-bit x86 is different, it
> shouldn't cause any incompatibility between a 32-bit and 64-bit
> frontend/backend because the commands are always 56 bits and the padding
> are at the end of the structure.
> 
> As an aside, the padding sadly cannot be mandated to be 0 as they are
> already present. So it is not going to be possible to use the padding
> for extending a command in the future.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ---
>     Changes in v3:
>         - Use __i386__ rather than CONFIG_X86_32
> 
>     Changes in v2:
>         - It is not possible to use the same padding for 32-bit x86 and
>         all the other supported architectures.
> ---
>  docs/misc/pvcalls.pandoc        | 18 ++++++++++--------
>  xen/include/public/io/pvcalls.h | 14 ++++++++++++++
>  2 files changed, 24 insertions(+), 8 deletions(-)
> 
> diff --git a/docs/misc/pvcalls.pandoc b/docs/misc/pvcalls.pandoc
> index 665dad556c39..caa71b36d78b 100644
> --- a/docs/misc/pvcalls.pandoc
> +++ b/docs/misc/pvcalls.pandoc
> @@ -246,9 +246,9 @@ The format is defined as follows:
>      			uint32_t domain;
>      			uint32_t type;
>      			uint32_t protocol;
> -    			#ifdef CONFIG_X86_32
> +			#ifndef __i386__
>      			uint8_t pad[4];
> -    			#endif
> +			#endif


Hi Julien,

Thank you for doing this, and sorry for having missed v2 of this patch, I
should have replied earlier.

The intention of the #ifdef blocks like:

  #ifdef CONFIG_X86_32
    uint8_t pad[4];
  #endif

in pvcalls.pandoc was to make sure that these structs would be 64bit
aligned on x86_32 too.

I realize that the public header doesn't match, but the spec is the
"master copy". We have been saying it for a while (Andy in particular)
that the specification documents are the one that define the protocol,
not the public headers. This is the very first time we get to act on
that statement. What a special occasion this is :-)

So I think we should keep the specification as is and fix the public
header instead. Something like v1 of this patch.

