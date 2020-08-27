Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B53F72543D6
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 12:37:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBFHF-0006DV-RR; Thu, 27 Aug 2020 10:37:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cFEh=CF=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kBFHE-0006DO-UF
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 10:37:04 +0000
X-Inumbo-ID: b45b5236-2c81-4f63-899d-cf042146b797
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b45b5236-2c81-4f63-899d-cf042146b797;
 Thu, 27 Aug 2020 10:37:04 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id c18so335886wrm.9
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2020 03:37:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vblhD0cA9C+8Kd4ZODfCl9wYH8mUAZwWNLkYAgz1Nfw=;
 b=SLpJuG3zwsEKFgLFunmQTE8PLi8UP9XdxvM8z2qHRZ9Cn2lR6DavIrbdSMcXMRGmGN
 TvFoo1lMidjv5LN0sND4f3fSFaUWnAjp4YRBeyXi5pdUtm2A6RyP/oAosQw9wK+1BRXx
 oJIMjCjfk0Tg9O3zksOGsdQL9EUvdWvBsvrVRiCirTjHC0OMrmPqpy2n70O9XiOFpmbQ
 ogBe4OxhNmF7dB9hTbEQZjWEsU4QwVV7jQsC2N7i38jBgf7hQ1DJYXA1vAwDQuWn5Yxe
 +x9z16ZyAqJjsfs1/U+XkpALvVMHLpS+J0kMo3UXELbFuzEflN81tmrlx0w0pIyINrJ2
 cfEA==
X-Gm-Message-State: AOAM530F+xbLoxt8XUzniwrXMt5LVI6IEdSjgT4ajxd/t95xTwQDDrQ1
 MkFiYx0yMUOkUIU9xySkmsw=
X-Google-Smtp-Source: ABdhPJxyFtGLGICbBXEqGjOywcrn2w4WhEiie18nGIkYKSzga9/ZhMtI1+dEmJgAL8B6wNWxXMJrTQ==
X-Received: by 2002:a5d:5704:: with SMTP id a4mr19273386wrv.318.1598524623516; 
 Thu, 27 Aug 2020 03:37:03 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id q12sm4640675wrn.94.2020.08.27.03.37.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 03:37:03 -0700 (PDT)
Date: Thu, 27 Aug 2020 10:37:01 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 14/38] tools/misc: don't use libxenctrl internals from
 xen-hptool
Message-ID: <20200827103701.en75fypnl5oxbgac@liuwe-devbox-debian-v2>
References: <20200823093519.18386-1-jgross@suse.com>
 <20200823093519.18386-15-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200823093519.18386-15-jgross@suse.com>
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

On Sun, Aug 23, 2020 at 11:34:55AM +0200, Juergen Gross wrote:
> xen-hptool is including private headers from tools/libxc without any
> need. Switch it to use official headers only.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Wei Liu <wl@xen.org>

