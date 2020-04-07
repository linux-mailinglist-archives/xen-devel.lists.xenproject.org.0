Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C19EC1A16B7
	for <lists+xen-devel@lfdr.de>; Tue,  7 Apr 2020 22:23:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLukE-0006vX-UK; Tue, 07 Apr 2020 20:22:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=AwYI=5X=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1jLukD-0006vS-Nk
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2020 20:22:49 +0000
X-Inumbo-ID: 8c689e86-790d-11ea-814e-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8c689e86-790d-11ea-814e-12813bfff9fa;
 Tue, 07 Apr 2020 20:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
 :Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=9cb0Ngob3m4Rf98EgXfN468qBc1kGCEo4ujhwcMP7iA=; b=idLaRNiukHqqeA46NJGDlGWTI9
 6FOFhV89kw4u2OEJIk4TvHSciHo5a0G1BigVtjNSg3Pq5d4TPUlvXBPj6Z3h89dbeEIIaUr3Wl6wv
 kHsHqih+V5Q3jwcWxWliOwOlRwGrAxpxW4X4o6E/8jXomdlbdooYevqIeCkyyeLMTcUc=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jLukB-0003fI-ER; Tue, 07 Apr 2020 20:22:47 +0000
Received: from 44.142.6.51.dyn.plus.net ([51.6.142.44] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jLukB-0001YH-5D; Tue, 07 Apr 2020 20:22:47 +0000
Date: Tue, 7 Apr 2020 21:22:44 +0100
From: Wei Liu <wl@xen.org>
To: Andrew Panyakin <apanyaki@amazon.com>
Subject: Re: [XEN PATCH] libxc/migration: Abort migration on precopy policy
 request
Message-ID: <20200407202244.a6isag63njejbshe@debian>
References: <eb85d7fee920b54eea3b4c0e77ab40593613ccc4.1586270820.git.apanyaki@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb85d7fee920b54eea3b4c0e77ab40593613ccc4.1586270820.git.apanyaki@amazon.com>
User-Agent: NeoMutt/20180716
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 David Woodhouse <dwmw@amazon.co.uk>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Apr 07, 2020 at 02:52:22PM +0000, Andrew Panyakin wrote:
> libxc defines XGS_POLICY_ABORT for precopy policy to signal that migration
> should be aborted (eg. if the estimated pause time is too huge for the
> instance). Default simple precopy policy never returns that, but it could be
> overriden with a custom one.
> 

Right. I think this is a real problem.

> Signed-off-by: Andrew Panyakin <apanyaki@amazon.com>
> ---
>  tools/libxc/xc_sr_save.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/tools/libxc/xc_sr_save.c b/tools/libxc/xc_sr_save.c
> index fa736a311f..507274ce22 100644
> --- a/tools/libxc/xc_sr_save.c
> +++ b/tools/libxc/xc_sr_save.c
> @@ -560,6 +560,12 @@ static int send_memory_live(struct xc_sr_context *ctx)
>  
>      }
>  
> +    if ( policy_decision == XGS_POLICY_ABORT ) {

The { should be on a new line.

> +        PERROR("Abort precopy loop");
> +        rc = -1;
> +        goto out;

There is no need to have "goto out" here.

These can be fixed easily while committing, so no need to resend yet. I
will give other people a chance to comment.

Wei.

> +    }
> +
>   out:
>      xc_set_progress_prefix(xch, NULL);
>      free(progress_str);
> -- 
> 2.16.6
> 

