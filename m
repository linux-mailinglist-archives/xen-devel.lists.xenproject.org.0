Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E34126124C
	for <lists+xen-devel@lfdr.de>; Tue,  8 Sep 2020 16:03:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFeCM-00027d-CY; Tue, 08 Sep 2020 14:02:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1o9A=CR=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kFeCK-00027Y-SS
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2020 14:02:12 +0000
X-Inumbo-ID: b7ac4952-4756-492c-a5c7-5a7c2ae60ec1
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b7ac4952-4756-492c-a5c7-5a7c2ae60ec1;
 Tue, 08 Sep 2020 14:02:11 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id a17so19226469wrn.6
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2020 07:02:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=b64ZrZLqBPbIicSn0ST+LzUtuh9yzEPsSOf43ZhHKyo=;
 b=tPfh2UF38/uFTA4erCOIxrNcp3BuHj7xm4yNPCpHsoGcJFvLYjowPrXPzgbZynzD5G
 DZMotZ9p5veAAm94YV6bt9Qp7XiKTFmgqpFqQXeeECYPlv69ci9EPBvhPJsfh8P0Gbw1
 YPvagH7YlRNHZesJqCjUSPl9kKI7YqJO/jD9CGWwSBSFviJOSKH+CADVj7gv6h1jAIe2
 X8Uk+Q0ZjpO7J0pUYvTyxNUMAKFA4OoowoxdYYPa2bKcEyCs86gzOw0v+twcM3aAuD/H
 bTNqYM8zCA7/nHT8v237IBehqUztyl4hmKx/h4yFiGhLCXFTSJ4P50awplcYZzQbuNMj
 wwNw==
X-Gm-Message-State: AOAM530OAjZ1O4nvVic/T0zbT4eqDXGK9T2CNzBwUfFqlDS75hueuu3S
 ChDv1YIk+2c3tGnIZN+nzKY=
X-Google-Smtp-Source: ABdhPJzkUUfaw36llWKUaXzPAc69I6KXKr8bDTnvT+sw6zYudkF27tj6/IKUP9cvGZ4LSk9QzMfzbA==
X-Received: by 2002:a5d:60d0:: with SMTP id x16mr26821435wrt.196.1599573730794; 
 Tue, 08 Sep 2020 07:02:10 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id b187sm32729648wmb.8.2020.09.08.07.02.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 07:02:10 -0700 (PDT)
Date: Tue, 8 Sep 2020 14:02:08 +0000
From: Wei Liu <wl@xen.org>
To: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH 1/2] xl: implement documented --force option for
 block-detach
Message-ID: <20200908140208.foijr7xgu4cxwhad@liuwe-devbox-debian-v2>
References: <20200903100537.1337-1-paul@xen.org>
 <20200903100537.1337-2-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200903100537.1337-2-paul@xen.org>
User-Agent: NeoMutt/20180716
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Sep 03, 2020 at 11:05:36AM +0100, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> The manpage for 'xl' documents an option to force a block device to be
> released even if the domain to which it is attached does not co-operate.
> This option, however, is not implemented. This patch implements the option.
> 
> NOTE: The documentation is also adjusted since the normal positioning of
>       options is before compulsory parameters. It is also noted that use of
>       the --force option may lead to a guest crash.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> ---
> Cc: Ian Jackson <iwj@xenproject.org>
> Cc: Wei Liu <wl@xen.org>
> Cc: Anthony PERARD <anthony.perard@citrix.com>
> ---
>  docs/man/xl.1.pod.in   |  4 ++--
>  tools/xl/xl_block.c    | 21 ++++++++++++++++-----
>  tools/xl/xl_cmdtable.c |  3 ++-
>  3 files changed, 20 insertions(+), 8 deletions(-)
> 
> diff --git a/docs/man/xl.1.pod.in b/docs/man/xl.1.pod.in
> index 52a47a6fbd..5f7d3a7134 100644
> --- a/docs/man/xl.1.pod.in
> +++ b/docs/man/xl.1.pod.in
> @@ -1389,7 +1389,7 @@ Note that only PV block devices are supported by block-attach.
>  Requests to attach emulated devices (eg, vdev=hdc) will result in only
>  the PV view being available to the guest.
>  
> -=item B<block-detach> I<domain-id> I<devid> [I<OPTIONS>]
> +=item B<block-detach> [I<OPTIONS>] I<domain-id> I<devid>
>  
>  Detach a domain's virtual block device. I<devid> may be the symbolic
>  name or the numeric device id given to the device by domain 0.  You
> @@ -1406,7 +1406,7 @@ B<OPTIONS>
>  =item B<--force>
>  
>  If this parameter is specified the device will be forcefully detached, which
> -may cause IO errors in the domain.
> +may cause IO errors in the domain and possibly a guest crash

Missing "." at the end. This can be fixed while committing.

Acked-by: Wei Liu <wl@xen.org>

