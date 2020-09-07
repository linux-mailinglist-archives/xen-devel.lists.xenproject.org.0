Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFF425FC28
	for <lists+xen-devel@lfdr.de>; Mon,  7 Sep 2020 16:36:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFIFZ-0001Jc-54; Mon, 07 Sep 2020 14:36:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Eb3x=CQ=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kFIFY-0001JX-I0
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 14:36:04 +0000
X-Inumbo-ID: 51518054-6f87-4e05-88be-4dbfcf05686f
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 51518054-6f87-4e05-88be-4dbfcf05686f;
 Mon, 07 Sep 2020 14:36:03 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id b79so14415820wmb.4
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2020 07:36:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=wFfTQIndOKFOrXtxOP45GZmql48uRD/uTBKmK++0yCc=;
 b=pTEXAa74SLcQyjyDJ1QYhnOEXN//W2NufZdnjqWIXe9hZpvAvYwZZLjjPXKNkwy7wA
 wd54+hUyY2jztA8fxQZrc9NM5OmxrzMk+iAzCcj2PrGRTeMrRh5CR/Z24pDfObIr4NO+
 5ylkhtwViW00R0GHYdvhGvNlCMiICFGb4X2nmXqoi/vs6gWfl00cR+eUlVAg6mSGcFHg
 MnwerS/oe20PudSr6lgXmX3EIKukAUq5z4KAn2xiAC3gx/PNLt5szKXlSdVwb+LUY9tg
 U/4JVz6/UoMzJElxL7RsYoxAHfyGpV/ifCfIBHFFVjFYa/qJ4rjIIPOFBBdYhdg7Jt9R
 uISA==
X-Gm-Message-State: AOAM532TD09y+Lth+dD0b7TEAnL4ciQE5NYDmgjg7MTuaRPU/MX7E6KK
 JqaDZU6vwFy2R7742yedhcY=
X-Google-Smtp-Source: ABdhPJzJ/F2jKqZOuJX+J3cnru52DDG5bxODpjzXlQiZ2cxMV7UJh9IE42JKx2pYIYcotaTiSPiUlQ==
X-Received: by 2002:a1c:5605:: with SMTP id k5mr16172956wmb.142.1599489363000; 
 Mon, 07 Sep 2020 07:36:03 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id a83sm26926804wmh.48.2020.09.07.07.36.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 07:36:02 -0700 (PDT)
Date: Mon, 7 Sep 2020 14:36:01 +0000
From: Wei Liu <wl@xen.org>
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: xen-devel@lists.xenproject.org, nd@arm.com,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/3] tools/hotplug: Fix dhcpd symlink removal in vif-nat
Message-ID: <20200907143601.iuuk5yrzgv2stpze@liuwe-devbox-debian-v2>
References: <cover.1597920095.git.diego.sueiro@arm.com>
 <3b0efb9fb1ba94922c0ae156c0ab0be6a9f45f25.1597920095.git.diego.sueiro@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3b0efb9fb1ba94922c0ae156c0ab0be6a9f45f25.1597920095.git.diego.sueiro@arm.com>
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

On Thu, Aug 20, 2020 at 12:00:23PM +0100, Diego Sueiro wrote:
> Copy temp files used to add/remove dhcpd configurations to avoid
> replacing potential symlinks.
> 

Can you clarify the issue you saw a bit?

Which one of the parameter is a symlink (I assume the latter) and what
problem you see with replacing the symlinks?

> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> ---
>  tools/hotplug/Linux/vif-nat | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/hotplug/Linux/vif-nat b/tools/hotplug/Linux/vif-nat
> index 2614435..1ab80ed 100644
> --- a/tools/hotplug/Linux/vif-nat
> +++ b/tools/hotplug/Linux/vif-nat
> @@ -99,7 +99,8 @@ dhcparg_remove_entry()
>    then
>      rm "$tmpfile"
>    else
> -    mv "$tmpfile" "$dhcpd_arg_file"
> +    cp "$tmpfile" "$dhcpd_arg_file"
> +    rm "$tmpfile"
>    fi

You could've simplified the code a bit here and below now that both
branches issue the same rm command.

But don't resend just yet. Please help me understand your issue first.

Wei.

>  }
>  
> @@ -109,11 +110,11 @@ dhcparg_add_entry()
>    local tmpfile=$(mktemp)
>    # handle Red Hat, SUSE, and Debian styles, with or without quotes
>    sed -e 's/^DHCPDARGS="*\([^"]*\)"*/DHCPDARGS="\1'"${dev} "'"/' \
> -     "$dhcpd_arg_file" >"$tmpfile" && mv "$tmpfile" "$dhcpd_arg_file"
> +     "$dhcpd_arg_file" >"$tmpfile" && cp "$tmpfile" "$dhcpd_arg_file"
>    sed -e 's/^DHCPD_INTERFACE="*\([^"]*\)"*/DHCPD_INTERFACE="\1'"${dev} "'"/' \
> -     "$dhcpd_arg_file" >"$tmpfile" && mv "$tmpfile" "$dhcpd_arg_file"
> +     "$dhcpd_arg_file" >"$tmpfile" && cp "$tmpfile" "$dhcpd_arg_file"
>    sed -e 's/^INTERFACES="*\([^"]*\)"*/INTERFACES="\1'"${dev} "'"/' \
> -     "$dhcpd_arg_file" >"$tmpfile" && mv "$tmpfile" "$dhcpd_arg_file"
> +     "$dhcpd_arg_file" >"$tmpfile" && cp "$tmpfile" "$dhcpd_arg_file"
>    rm -f "$tmpfile"
>  }
>  
> @@ -125,7 +126,8 @@ dhcp_remove_entry()
>    then
>      rm "$tmpfile"
>    else
> -    mv "$tmpfile" "$dhcpd_conf_file"
> +    cp "$tmpfile" "$dhcpd_conf_file"
> +    rm "$tmpfile"
>    fi
>    dhcparg_remove_entry
>  }
> -- 
> 2.7.4
> 

