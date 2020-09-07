Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FE325FBFF
	for <lists+xen-devel@lfdr.de>; Mon,  7 Sep 2020 16:26:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFI5Z-0000BD-Iw; Mon, 07 Sep 2020 14:25:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Eb3x=CQ=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kFI5Y-0000B5-Go
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 14:25:44 +0000
X-Inumbo-ID: d5a3583e-ccd3-46c8-b496-72bd4fd461ad
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d5a3583e-ccd3-46c8-b496-72bd4fd461ad;
 Mon, 07 Sep 2020 14:25:43 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id w5so16010722wrp.8
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2020 07:25:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=XoTdD1S1ndwrPmDjN4MKCB9OGG0BuIzCyKEmVnwGqyo=;
 b=NVkVjpId+01DO1KtTJGYr7iieBHHOD9el+vyp+VkBqhxF0Oj76K/9RofE4tUO7Oazq
 0iG/OlxA2P2LlJhogivTtuLo3DEeZWBAjFEpCFvRWh1pu+FfEFqko9C3LY5p+5Aalx9p
 D0x74HVzR1DJpiyhGAY55lvnz7uq0MzaeSOYnEHteyNZ6I9wzlQNCds8t8SzbzsZk6K8
 wLI+Xh4OOPjNFMYZRCyggZMStlPu5GU5ZdRJ7u9j9uJ7ZiDhsF3m2cRZFwDAGzAO/K79
 WZOLj2AiwxMGe5CznbYxYRGGDSwF/kGan2Ew5idrnROxOraXVjHQi4b/kc2sEXgwvKmL
 slGQ==
X-Gm-Message-State: AOAM531tugXapOSp1sEu7f4xDKXuRx3enWwm2LAqGxFuHegBL7O7R3EX
 etCMwPA43Gtgphjne4eqjCQ=
X-Google-Smtp-Source: ABdhPJwHtmWWTL97fWSbr3xW4ecu08r+c1rN58vr8zodoJSJLCFfMqUt3dr7SY5Np7Jo/sJGfxI9vg==
X-Received: by 2002:adf:e292:: with SMTP id v18mr3178682wri.256.1599488742931; 
 Mon, 07 Sep 2020 07:25:42 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id w14sm12511172wrk.95.2020.09.07.07.25.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 07:25:42 -0700 (PDT)
Date: Mon, 7 Sep 2020 14:25:41 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v4 01/31] tools: generate pkg-config files from make
 variables
Message-ID: <20200907142541.nfofazisbqonktdo@liuwe-devbox-debian-v2>
References: <20200828150747.25305-1-jgross@suse.com>
 <20200828150747.25305-2-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200828150747.25305-2-jgross@suse.com>
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

On Fri, Aug 28, 2020 at 05:07:17PM +0200, Juergen Gross wrote:
> For each library built two variants of pkg-config files are created
> from a per-library template: an "official" one for installation on
> the user's system, and one used for building internal tools, like e.g.
> qemu.
> 
> Instead of the template which is looking very similar for all libraries
> generate the pkg-config files directly from make variables.
> 
> This will reduce the need to specify some pkg-config file entries in
> the templates, as the contents can easily be generated from available
> data (e.g. "Version:" and "Requires.private:" entries).
> 
> Especially the variant used for building internal tools needs to gain
> additional runtime link parameters for the internally used libraries,
> as otherwise those won't be found by the users (e.g. qemu).
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Do you have the new generated files handy so that I can eyeball them a
bit?

If you don't already have them, I can find some time to apply this patch
to generate them myself.

Wei.

