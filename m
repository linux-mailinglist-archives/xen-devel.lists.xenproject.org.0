Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B52342543D5
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 12:37:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBFH3-0006By-FO; Thu, 27 Aug 2020 10:36:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cFEh=CF=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kBFH1-0006Bq-Rq
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 10:36:51 +0000
X-Inumbo-ID: 055eb706-6f26-4768-b339-410e1c164691
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 055eb706-6f26-4768-b339-410e1c164691;
 Thu, 27 Aug 2020 10:36:51 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id f7so4888430wrw.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2020 03:36:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3rOh1dUp3REswwx8sSsJ3ToXN2yaaBs7Ea+cSGqPdh4=;
 b=Jpb0OJI45YYOOwzR7u9vAJdPojXdRq0OptDtz+YqEtIfdJTKSzWk5psspunu0SP8UE
 sU91S+UsJUfOSrFCQPv9ONe9acb1GWCr4hPc5OjcpSKYtVqU7z7HmnCMg1tpOH2OsDih
 Zy0116UOunY96A58v11srLFxPUFvG6belVRcG0spLVm1D39ZTSfLKqNVizGqevHqMDy4
 ZtRlDmy7yCcX/hnqXCvaERkTBwg5AMyWqJPwTBdLCU7vFELyLO+xjEPQ/JXVUhQMWos3
 DzW4rXnQKNPvKq0dKeJrxQJ54IlIVSGntNLcwNrWpfjmoXbng3Vpgssb3V2h4BrVhKku
 X/zw==
X-Gm-Message-State: AOAM533btuU9HAiOMZm1jI8jJoNjUNtwHArfUG2TGY5qD3ohp+1Nsbyq
 yCElKas47kMqboq6PEmOZkk=
X-Google-Smtp-Source: ABdhPJwARnSwKWioFfhkKJjfvGmdU0Y7zt/6yT7kcWpTLyQi1VhUipnWpfBzCibfJuqxXrtti3rcNQ==
X-Received: by 2002:a5d:514c:: with SMTP id u12mr20484818wrt.90.1598524610247; 
 Thu, 27 Aug 2020 03:36:50 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id w7sm4213837wrm.92.2020.08.27.03.36.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 03:36:49 -0700 (PDT)
Date: Thu, 27 Aug 2020 10:36:48 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v3 13/38] tools: don't assume libxenguest and libxenctrl
 to be in same directory
Message-ID: <20200827103648.fju77pbdggt5p46a@liuwe-devbox-debian-v2>
References: <20200823093519.18386-1-jgross@suse.com>
 <20200823093519.18386-14-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200823093519.18386-14-jgross@suse.com>
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

On Sun, Aug 23, 2020 at 11:34:54AM +0200, Juergen Gross wrote:
> There are quite some places in Makefiles assuming libxenguest and
> libxenctrl being built in the same directory via a single Makefile.
> 
> Drop this assumption by specifying the dependencies and path variables
> for both libraries correctly.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Wei Liu <wl@xen.org>

