Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF62425FC0A
	for <lists+xen-devel@lfdr.de>; Mon,  7 Sep 2020 16:29:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFI8R-0000R9-Ab; Mon, 07 Sep 2020 14:28:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Eb3x=CQ=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kFI8P-0000R4-NU
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 14:28:41 +0000
X-Inumbo-ID: 2a1ef213-fe8e-4bbe-8f08-0aa9fc4e0dbe
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2a1ef213-fe8e-4bbe-8f08-0aa9fc4e0dbe;
 Mon, 07 Sep 2020 14:28:40 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id b79so14395419wmb.4
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2020 07:28:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=WlPpCdYhqYLCVgNzruln/1KXNk8zyd5gsbIT15Kiazs=;
 b=HpV7lrs6skuyBn7QYgPsM0lYyLMSdDpu0D93NWlr7PvmTYZtT/lPXEDgMnkJmG9yQe
 H0D/upDYttIXn68taEyGZMRBPuCaWwVE9L0aFiLOog/B6CT1klWIjp2Z23Sg4kOd+khn
 Owb7pgoab0LHOVJ74y0A7FvNiSAcNU8KAIoFd9Weh5iC+mQf17VJMji3fyO1SHhXBuv6
 PJpgKD1s/rplvZqhpLIwiLTDZb0ircosGKVPqoKOipTprH2+myRdd9RJJqYHOuuUdgHM
 msgrr3EUkB3k8jRLvCVyWMjM4+LiWucnviOopIHAaKOcZdkJwHAUNfoee7b09Wm3RXmX
 t60Q==
X-Gm-Message-State: AOAM5311q4JVzmcAh4w0o3IqmpxZLscz6UoziQYkkb9ejiTUS+F4LONM
 MxEiKwglItBoyUq15NUChpA=
X-Google-Smtp-Source: ABdhPJzRVl3GC9XQLf+vbBp+2OQSTJSfj3LwIV7Uf57OtXuQWkriXHpi3GKYGb2RI9Jfg60wWv493A==
X-Received: by 2002:a1c:6187:: with SMTP id v129mr20410954wmb.35.1599488919250; 
 Mon, 07 Sep 2020 07:28:39 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id g2sm28334252wmg.32.2020.09.07.07.28.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 07:28:38 -0700 (PDT)
Date: Mon, 7 Sep 2020 14:28:37 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v2] tools/hotplug/Linux: don't needlessly use
 non-standard features in vif-{bridge,route}
Message-ID: <20200907142837.ufspmdt6x2zo66nk@liuwe-devbox-debian-v2>
References: <a417690e-539c-b1b0-a372-3aea54d5dabd@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a417690e-539c-b1b0-a372-3aea54d5dabd@suse.com>
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

On Wed, Sep 02, 2020 at 08:09:28AM +0200, Jan Beulich wrote:
> We're not after any "fall-through" behavior here. Replace the constructs
> with ones understood by all conforming shells, including older bash
> (problem observed with 3.1.51(1)).
> 
> Fixes: b51715f02bf9 ("tools/hotplug/Linux: remove code duplication in vif-bridge")
> Fixes: 3683290fc0b0 ("tools/hotplug: only attempt to call 'ip route' if there is valid command")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Wei Liu <wl@xen.org>

