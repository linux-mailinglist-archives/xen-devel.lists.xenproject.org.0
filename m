Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1659A1E66FD
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2020 18:01:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeKxG-0006uu-OQ; Thu, 28 May 2020 16:00:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eoT6=7K=xen.org=roger@srs-us1.protection.inumbo.net>)
 id 1jeKxF-0006up-2c
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 16:00:25 +0000
X-Inumbo-ID: 56b86458-a0fc-11ea-a7fe-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 56b86458-a0fc-11ea-a7fe-12813bfff9fa;
 Thu, 28 May 2020 16:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jeBFJd2UNVo6GKio2LfOs9T6os+j2HtTsJirjHMMsvw=; b=VM3EVXMJRkn+n0wyplatkbnr9d
 4FHQbkXCMmoz3X8A6niIWc0CSa1Ibmv1OTmTcWKXBFQF5VK+WD7dy8dStMkoSWRazsweertG2W820
 feSXerwfvEfBpjr7b6ZX57QvP8nWN+gb0JNpKvjSL71wEYMdi3as8C2nXle0ytDhjoxA=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xen.org>)
 id 1jeKxC-00080W-WD; Thu, 28 May 2020 16:00:23 +0000
Received: from [93.176.191.173] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <roger@xen.org>)
 id 1jeKxC-0007ml-LX; Thu, 28 May 2020 16:00:22 +0000
Date: Thu, 28 May 2020 18:00:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/hvm: Improve error information in handle_pio()
Message-ID: <20200528160003.GG1195@Air-de-Roger>
References: <20200528130738.12816-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200528130738.12816-1-andrew.cooper3@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, May 28, 2020 at 02:07:38PM +0100, Andrew Cooper wrote:
> domain_crash() should always have a message which emitted even in release
> builds, so something more useful than this is presented.
> 
>   (XEN) domain_crash called from io.c:171
>   (XEN) domain_crash called from io.c:171
>   (XEN) domain_crash called from io.c:171
>   ...
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Wei Liu <wl@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Paul Durrant <paul.durrant@citrix.com>
> CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> 
> Part of a bug reported by Marek.  Something else is wonky in the IO emulation
> state, and preventing us from yielding to the scheduler so the domain can
> progress with being shut down.
> ---
>  xen/arch/x86/hvm/io.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/x86/hvm/io.c b/xen/arch/x86/hvm/io.c
> index a5b0a23f06..4e468bfb6b 100644
> --- a/xen/arch/x86/hvm/io.c
> +++ b/xen/arch/x86/hvm/io.c
> @@ -167,7 +167,9 @@ bool handle_pio(uint16_t port, unsigned int size, int dir)
>          break;
>  
>      default:
> -        gdprintk(XENLOG_ERR, "Weird HVM ioemulation status %d.\n", rc);
> +        gprintk(XENLOG_ERR, "Unexpected PIO status %d, port %#x %s 0x%0*lx\n",
> +                rc, port, dir == IOREQ_WRITE ? "write" : "read",
> +                size * 2, data & ((1ul << (size * 8)) - 1));

I wonder, should data be initialized to 0 in order to prevent writing
garbage here if the buffer is not filled in the read case?

Note sure it's better to print garbage or just 0 in that case, as in
both cases it won't be possible to figure out if it's real data or
just the emulation didn't get to fill it (unless the specific error
path is checked).

Thanks, Roger.

