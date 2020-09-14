Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7C126887F
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 11:34:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHksc-0008FI-B1; Mon, 14 Sep 2020 09:34:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/hQe=CX=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kHksb-0008FC-Fn
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 09:34:33 +0000
X-Inumbo-ID: 71aa9235-b897-4ef6-b102-e4d621da2799
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 71aa9235-b897-4ef6-b102-e4d621da2799;
 Mon, 14 Sep 2020 09:34:22 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id m6so17954317wrn.0
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2020 02:34:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xMGmaZP4GyG03IWippv3BDbUqRGOZAgoO1WY02EWjks=;
 b=bZb1O0OeHC94T6tQKOOGUW/R8KnEnr+al3wJznVc7XhWJGarW4vjF4fLlAaA7ZsqXm
 Nx7oYCBe/HQm/rqVZ8hK+RqEv9qX1tzKIFbfEcrpRFa93hD93I09pID6g3pfWcAPLCrL
 neSUFtsaGWwGo700cC49zGBMJxvg74hCinuFPr9aVSWJIt0kd75l9Q69SgpQVGju8gCw
 B0OaX824BG1Km0aUJg5gSIilkUAzSNJhOCCX3zgFzAq7kIKp1s9O1mg12hRLb+wu7bNt
 13f0RBcYACrkQDjTqRPT8jxo3TSgn3R4cIlB4MKw0d1WCj9oqAXbW10Y4qLiofK8QK3U
 tqag==
X-Gm-Message-State: AOAM532RRtdAe3An6NH3TI/rF7QeG8FGCJt63RBRXl1Uzftr0bOMjTaD
 FDZIja3xDVqPd0P8K/1ZslEmwuWbKHg=
X-Google-Smtp-Source: ABdhPJwsHV7nMcgfqaKyqO0t+5LfSXfE+TMGgDGSQl8DdYv50XBsxHqmrD3DE7MIjmvWb3RvqwUfeg==
X-Received: by 2002:adf:b602:: with SMTP id f2mr14324710wre.186.1600076061660; 
 Mon, 14 Sep 2020 02:34:21 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id k4sm20194013wrx.51.2020.09.14.02.34.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 02:34:21 -0700 (PDT)
Date: Mon, 14 Sep 2020 09:34:19 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3] tools/libs/stat: fix broken build
Message-ID: <20200914093419.yj6vx5bxodenrwsb@liuwe-devbox-debian-v2>
References: <20200912130836.11024-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200912130836.11024-1-jgross@suse.com>
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

On Sat, Sep 12, 2020 at 03:08:36PM +0200, Juergen Gross wrote:
> Making getBridge() static triggered a build error with some gcc versions:
> 
> error: 'strncpy' output may be truncated copying 15 bytes from a string of
> length 255 [-Werror=stringop-truncation]
> 
> Fix that by using a buffer with 256 bytes instead.
> 
> Fixes: 6d0ec053907794 ("tools: split libxenstat into new tools/libs/stat directory")
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Wei Liu <wl@xen.org>

