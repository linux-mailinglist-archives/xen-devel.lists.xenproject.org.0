Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E371D2EAA44
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 12:57:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61836.108981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwkxe-0007wX-SB; Tue, 05 Jan 2021 11:57:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61836.108981; Tue, 05 Jan 2021 11:57:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwkxe-0007w7-OE; Tue, 05 Jan 2021 11:57:14 +0000
Received: by outflank-mailman (input) for mailman id 61836;
 Tue, 05 Jan 2021 11:57:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=apNQ=GI=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kwkxc-0007w0-Vc
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 11:57:13 +0000
Received: from mail-wr1-f45.google.com (unknown [209.85.221.45])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e9449d43-1b94-4c79-962b-179756685b25;
 Tue, 05 Jan 2021 11:57:12 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id d26so35847939wrb.12
 for <xen-devel@lists.xenproject.org>; Tue, 05 Jan 2021 03:57:11 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id x25sm3822695wmc.3.2021.01.05.03.57.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 03:57:09 -0800 (PST)
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
X-Inumbo-ID: e9449d43-1b94-4c79-962b-179756685b25
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9MKjqem3onZjaMNicrrMcLPM0jXh46iUUKnwtuKAKXI=;
        b=Z+Tg78iDIEOSrQeMGnDRWvPAnv9Ks/zOz1Lns5xOwZ/kxjRQe6vXhk7wj9JfETrxks
         ha3tR+lYwL6e/KTMrNLBAuPWLcUaJm27RYE7BbZW/2dr/eEn+oLLfpFjKsuSTHUxHqU0
         zu6crIGVbBQGere62utkZYrRFowu6461Qpr/1htPDyUNzq2xYJ6QL7oi44IOFCJsEaWU
         Qo+xXDeTkxpkDmFGKrdxuILtj/xkqu1jvv+BV5tJMWqT7XgENF7DmLP+p4BmREwasOmY
         beZfsujr4n+CIBy4l2raXetl9h8PJ0vTIANwKCfej86NWu/7aD10+Q8DSjecmke8O6du
         +UqQ==
X-Gm-Message-State: AOAM533E9kgBzrlnnB1bwjJv4nWrgKnjcWl6H6C3ipt9oHuXS4ocjA0c
	KAu36F+cAzWo7qrJ+PZ4cyI=
X-Google-Smtp-Source: ABdhPJzZvg7Cb3Y4uIPxLBpyXupB9ICOGPScyskP4yoHx2Fjw6FfGxoY9w1gGDid6HIci4A+BRUgYg==
X-Received: by 2002:a5d:6682:: with SMTP id l2mr83250141wru.213.1609847830313;
        Tue, 05 Jan 2021 03:57:10 -0800 (PST)
Date: Tue, 5 Jan 2021 11:57:08 +0000
From: Wei Liu <wl@xen.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH v1] tools: ipxe: update for fixing build with GCC10
Message-ID: <20210105115708.aq2nfk3x4cnizzws@liuwe-devbox-debian-v2>
References: <20210104115223.25403-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210104115223.25403-1-olaf@aepfle.de>
User-Agent: NeoMutt/20180716

On Mon, Jan 04, 2021 at 12:52:23PM +0100, Olaf Hering wrote:
> Update to v1.21.1 to fix build in Tumbleweed, which has been broken
> since months due to lack of new release.
> 
> Signed-off-by: Olaf Hering <olaf@aepfle.de>

Acked-by: Wei Liu <wl@xen.org>

> ---
>  tools/firmware/etherboot/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/firmware/etherboot/Makefile b/tools/firmware/etherboot/Makefile
> index 0de30599bf..ed9e11305f 100644
> --- a/tools/firmware/etherboot/Makefile
> +++ b/tools/firmware/etherboot/Makefile
> @@ -10,7 +10,7 @@ else
>  IPXE_GIT_URL ?= git://git.ipxe.org/ipxe.git
>  endif
>  
> -IPXE_GIT_TAG := 1dd56dbd11082fb622c2ed21cfaced4f47d798a6
> +IPXE_GIT_TAG := 988d2c13cdf0f0b4140685af35ced70ac5b3283c
>  
>  IPXE_TARBALL_URL ?= $(XEN_EXTFILES_URL)/ipxe-git-$(IPXE_GIT_TAG).tar.gz
>  

