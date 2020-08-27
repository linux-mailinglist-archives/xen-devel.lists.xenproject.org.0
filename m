Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4F5254484
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 13:48:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBGOf-0006Cf-MQ; Thu, 27 Aug 2020 11:48:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cFEh=CF=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kBGOe-0006CX-NA
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 11:48:48 +0000
X-Inumbo-ID: fcf78610-1c22-4ccd-90ec-e45fcaa91f4c
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fcf78610-1c22-4ccd-90ec-e45fcaa91f4c;
 Thu, 27 Aug 2020 11:48:48 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id f7so5095311wrw.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2020 04:48:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0iYwV0sFfpewXTRWawZN7RItMuLiM0PVt6HFgKMHgns=;
 b=hINAW/lImL0sdhbCA9L1eoXXbrWHYKYGL5spxxJiPknV07fyIw2w6KKOMEXwHmJmds
 ExxDYUdM2zfSC+MxtVEpAxp88oT9if8noYJAQDeduL3+LtDqxZ0yDOkw7Pbxc5BRSBdH
 SaJQ19KAHO9TzJERuWBNIl9XNZtYyQpzeNj/8/6R3pJQXg7HSvbsmMiywT9xotIJ9acH
 RMOH2/9IXU+pQVBH/AEG3LSy9KnPTuqmnS8aNFuUqnbCiSKFlykEJzHXZ29CjXkkF5gv
 p9bF8Xn82x89YEcvFxHufnHUfjOkVwu0ohuFLJ5EqHb/p05cLGPotAGN5ensvGP/vSNl
 YvHg==
X-Gm-Message-State: AOAM5330sD/n/o3QfePpdR4Fm6jeO64z4ctIxEuVA3SrMFTGYPS3asjP
 a1mZ9Jio3h3xUvBTihy9arE=
X-Google-Smtp-Source: ABdhPJw6pXQj7/QzJ9zcbLmMdGASS5038ZmMOs/Ulmr+J4fCRmFLHBxzFdYv5/s/kblWIdYpPKsEOA==
X-Received: by 2002:adf:f7d0:: with SMTP id a16mr401924wrq.381.1598528927315; 
 Thu, 27 Aug 2020 04:48:47 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id e2sm5767051wrt.66.2020.08.27.04.48.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 04:48:46 -0700 (PDT)
Date: Thu, 27 Aug 2020 11:48:45 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v3 34/38] tools/libxl: move xl parsing checks to tools/xl
Message-ID: <20200827114845.p7f7byl5unme4o56@liuwe-devbox-debian-v2>
References: <20200823093519.18386-1-jgross@suse.com>
 <20200823093519.18386-35-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200823093519.18386-35-jgross@suse.com>
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

On Sun, Aug 23, 2020 at 11:35:15AM +0200, Juergen Gross wrote:
> check-xl-* scripts and data are not libxl- but xl-specific. Move them
> from tools/libxl/ to tools/xl/.

I think those should've been moved while the splitting of libxl /
xl happened. My bad.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Wei Liu <wl@xen.org>

