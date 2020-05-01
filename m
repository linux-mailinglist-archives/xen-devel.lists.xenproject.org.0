Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE081C11EB
	for <lists+xen-devel@lfdr.de>; Fri,  1 May 2020 14:12:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUUW3-0003mZ-4V; Fri, 01 May 2020 12:11:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UQub=6P=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jUUW2-0003mU-1Q
 for xen-devel@lists.xenproject.org; Fri, 01 May 2020 12:11:38 +0000
X-Inumbo-ID: e6cd0944-8ba4-11ea-9b01-12813bfff9fa
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e6cd0944-8ba4-11ea-9b01-12813bfff9fa;
 Fri, 01 May 2020 12:11:35 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id g12so6127423wmh.3
 for <xen-devel@lists.xenproject.org>; Fri, 01 May 2020 05:11:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=oISAyXYDrHJxSbEFstkEoJjITTjc22xzBIPAVa2VhQk=;
 b=DrEXsWheMDZTc7YJxxd9dd1bEBFt78YHrhZuL4xv/tqS/EUL4cT5kwdR528LTNWp9+
 zM9sxo6/JtChf6Z7AOIqCzmby9Nt4rFpwAFnZ0hiGgrPUmUT3XFceY3Tvr7qILQpIBLL
 BK5LiH3yR3tJtXGFlQosbwCUiu1Urn50EOUpRV89NY1bJeYjoCodxt879Vu5DRn2YBKt
 VVIOq0bmXteL68gdkM7fuwNaZed2zUx5cyreGrkbTZVBenna9/YSj491oFs3c3nR26IH
 cjP8YGyMiSsnRFiwvgj866NKLSGMH/uACYBcBtvVFSwog/5tHFOCqXOEO0tT+x2hT6Uh
 Utrg==
X-Gm-Message-State: AGi0PuaKjGh0h5VC5LuwOp0DRA+2DnvhYX/iZqnXGq0/q5StOSfKfNOo
 HGf+zKXZmMU2niZpw8zowog=
X-Google-Smtp-Source: APiQypIRtzFVm+O8Mk/G5G33UG5hi8Ufted1QM/8uykOvQQtW0zJNP0MAxmowiGouF46U0rtmd5BOA==
X-Received: by 2002:a1c:9cca:: with SMTP id f193mr3655724wme.71.1588335094797; 
 Fri, 01 May 2020 05:11:34 -0700 (PDT)
Received: from
 liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id a9sm3547346wmm.38.2020.05.01.05.11.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 May 2020 05:11:34 -0700 (PDT)
Date: Fri, 1 May 2020 12:11:32 +0000
From: Wei Liu <wl@xen.org>
To: Hongyan Xia <hx242@xen.org>
Subject: Re: [PATCH 11/16] x86: add a boot option to enable and disable the
 direct map
Message-ID: <20200501121132.kzhu7u2vmpoeju2x@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
References: <cover.1588278317.git.hongyxia@amazon.com>
 <7360b59e8fd39796fee56430a437b20c948d08c2.1588278317.git.hongyxia@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7360b59e8fd39796fee56430a437b20c948d08c2.1588278317.git.hongyxia@amazon.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, julien@xen.org,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Apr 30, 2020 at 09:44:20PM +0100, Hongyan Xia wrote:
> From: Hongyan Xia <hongyxia@amazon.com>
> 
> Also add a helper function to retrieve it. Change arch_mfn_in_direct_map
> to check this option before returning.
> 
> This is added as a boot command line option, not a Kconfig. We do not
> produce different builds for EC2 so this is not introduced as a
> compile-time configuration.

Having a Kconfig will probably allow the compiler to eliminate dead
code.

This is not asking you to do the work, someone can come along and adjust 
arch_has_directmap easily.

Wei.

