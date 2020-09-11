Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4212667F7
	for <lists+xen-devel@lfdr.de>; Fri, 11 Sep 2020 19:59:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGnJz-0003KX-2p; Fri, 11 Sep 2020 17:58:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g4Bj=CU=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kGnJx-0003KS-Pf
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2020 17:58:49 +0000
X-Inumbo-ID: a2bd7cda-7895-4c88-ba97-98244a8b6ba7
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a2bd7cda-7895-4c88-ba97-98244a8b6ba7;
 Fri, 11 Sep 2020 17:58:48 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id e17so5217166wme.0
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2020 10:58:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=1RflvOB8O8J+PsALd1dMdnpVhAnu2C0ip87gE2whspg=;
 b=gI+XIWH8M5hyJeK0Pu3MmhLIQLh7Rd0prbOPGQdNxPwXOhB6LHy6od404XpGDi1oyK
 cqJ2nBGEoQy5ukiVG7sS7r+pb1sqZc537RBMwCQx3fBuWmJtp41U4j8nD7JUUuBn1XBq
 MdvSkuVeZJIvqNZuCflkMvH+QVgqmwxv4zeoxo8isjbtYreoewsiBz2C9+kbMMjTQZ/g
 URYaO6A2T78wAK94GY4JPIsKaN+rn8e1EpmgZ7kBMwWyKEQCjOcRAXrR+gJ3IBm4EVRK
 Puqscz6iDZh++Ohq5FKG3Gv0LsUqSrJPc2XlkpBDBg6RjvbZFyn/smTuBPaDzovcu0gu
 aERg==
X-Gm-Message-State: AOAM533lhdHQZqygrIq+NTbmHVB9yh7W/f/pfAcqnRX00jIyFQSlM/8a
 EeuHDARuDNr4c1ipuNDO/r3OYRwImIM=
X-Google-Smtp-Source: ABdhPJzWBVkQqqRYgc0xdfvg+BoKKLYSdkBxDzrLCJy0B1ed3mSOJFiRGglpDmv5kDbrQkfshR5RlQ==
X-Received: by 2002:a1c:3588:: with SMTP id c130mr3225703wma.94.1599847128090; 
 Fri, 11 Sep 2020 10:58:48 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id q20sm5573460wmj.5.2020.09.11.10.58.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2020 10:58:47 -0700 (PDT)
Date: Fri, 11 Sep 2020 17:58:46 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
Subject: Re: [PATCH] tools/libs/stat: fix broken build
Message-ID: <20200911175846.ximv7mojq4bujhem@liuwe-devbox-debian-v2>
References: <20200911131528.19734-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200911131528.19734-1-jgross@suse.com>
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

On Fri, Sep 11, 2020 at 03:15:28PM +0200, Juergen Gross wrote:
> Making getBridge() static triggered a build error with some gcc versions:
> 
> error: 'strncpy' output may be truncated copying 15 bytes from a string of
> length 255 [-Werror=stringop-truncation]
> 
> Fix that by printing a sane error message and bailing out in case the name of
> a bridge is too long.
> 
> Fixes: 6d0ec053907794 ("tools: split libxenstat into new tools/libs/stat directory")

But this patch is not the one that created the bug though? It just
happens to be the last patch that touched that file.

> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  tools/libs/stat/xenstat_linux.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/tools/libs/stat/xenstat_linux.c b/tools/libs/stat/xenstat_linux.c
> index 793263f2b6..ce38b3433f 100644
> --- a/tools/libs/stat/xenstat_linux.c
> +++ b/tools/libs/stat/xenstat_linux.c
> @@ -75,6 +75,12 @@ static void getBridge(char *excludeName, char *result, size_t resultLen)
>  	while ((de = readdir(d)) != NULL) {
>  		if ((strlen(de->d_name) > 0) && (de->d_name[0] != '.')
>  			&& (strstr(de->d_name, excludeName) == NULL)) {
> +				if (strlen(de->d_name) > resultLen - 1) {
> +					fprintf(stderr,
> +						"bridge name %s too long\n",
> +						de->d_name);
> +					break;
> +				}
>  				sprintf(tmp, "/sys/class/net/%s/bridge", de->d_name);
>  
>  				if (access(tmp, F_OK) == 0) {
> -- 
> 2.26.2
> 

