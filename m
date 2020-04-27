Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB911BAE8B
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2020 21:55:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jT9r0-0006of-Sd; Mon, 27 Apr 2020 19:55:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R4Dr=6L=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jT9qz-0006oa-Tp
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2020 19:55:45 +0000
X-Inumbo-ID: 13e77915-88c1-11ea-97d6-12813bfff9fa
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 13e77915-88c1-11ea-97d6-12813bfff9fa;
 Mon, 27 Apr 2020 19:55:45 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id g12so269816wmh.3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2020 12:55:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=S630ISA74E4eIpHiCILDqtw5ut5cEEBYYClHZyJxO0Q=;
 b=XbqeJPm32pcatwBo/PWBxg+2L6XLOZ3bhlW+oviX43whvXB8M1v3z/vHNbjpUZ5rNR
 ZqUpOUI+O6hmlhD2kFSF4TLvrUJ+xOr6TlGJKniEa3sShD3rlnnrFRz65XuI8zx/2hUV
 +/yVVMqMsHfyQx2T/cwWMVxB6XfCu/oULFMlFhsGv0Tv4ftCuRXKbrpkHDoTol714luj
 WKy88mcqzNhSjYM1LPgOl15ak9CPyoADij6GCHahUysx84jH1zlKL5HueE1yTIIyNhTg
 Fz6yUrxXUVDyTH1BVomrXBrhJCpNj/NdT6pO3tDyvin2bMVltoL3slU9lbzf0jOl8i2d
 xpQw==
X-Gm-Message-State: AGi0PuZ0cNcHPOcuIjfNUDxuPbnOWkV9f80jZQPkTUyFwA0FsKjP+1ge
 iLFKzpVBcf9Q/qh1bXtJPAg=
X-Google-Smtp-Source: APiQypITpZfvbKhA/dWTvMvMFTg7nSsqAxNzsjSqBBHtzhXdGaQvxSZZScEU9FCwwYio1L5awOaVTA==
X-Received: by 2002:a1c:ed04:: with SMTP id l4mr329007wmh.93.1588017344484;
 Mon, 27 Apr 2020 12:55:44 -0700 (PDT)
Received: from
 liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id j10sm290547wmi.18.2020.04.27.12.55.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 12:55:43 -0700 (PDT)
Date: Mon, 27 Apr 2020 19:55:42 +0000
From: Wei Liu <wl@xen.org>
To: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH 01/12] libxc/save: Shrink code volume where possible
Message-ID: <20200427195542.yiuvw4xgfjfzn6wh@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
References: <20191224151932.6304-1-andrew.cooper3@citrix.com>
 <20191224151932.6304-2-andrew.cooper3@citrix.com>
 <24093.61657.676890.721999@mariner.uk.xensource.com>
 <a10d1572-d5c5-716a-0651-aee2345348dd@citrix.com>
 <24231.5161.862828.377795@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24231.5161.862828.377795@mariner.uk.xensource.com>
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Apr 27, 2020 at 06:19:37PM +0100, Ian Jackson wrote:
> Andrew Cooper writes ("Re: [PATCH 01/12] libxc/save: Shrink code volume where possible"):
> > On 14/01/2020 16:48, Ian Jackson wrote:
> > > Andrew Cooper writes ("[PATCH 01/12] libxc/save: Shrink code volume where possible"):
> > >> A property of how the error handling (0 on success, nonzero otherwise)
> > >> allows these calls to be chained together with the ternary operatior.
> > > I'm quite surprised to find a suggestion like this coming from you in
> > > particular.
> > 
> > What probably is relevant is that ?: is a common construct in the
> > hypervisor, which I suppose does colour my expectation of people knowing
> > exactly what it means and how it behaves.
> 
> I expect other C programmers to know what ?: does, too.  But I think
> using it to implement the error monad is quite unusual.  I asked
> around a bit and my feeling is still that this isn't an improvement.
> 
> > > Or just to permit
> > >    rc = write_one_vcpu_basic(ctx, i);    if (rc) goto error;
> > > (ie on a single line).
> > 
> > OTOH, it should come as no surprise that I'd rather drop this patch
> > entirely than go with these alternatives, both of which detract from
> > code clarity. The former for hiding control flow, and the latter for
> > being atypical layout which unnecessary cognitive load to follow.
> 
> I think, then, that it would be best to drop this patch, unless Wei
> (or someone else) disagrees with me.

I don't feel strongly either way.

Wei.

