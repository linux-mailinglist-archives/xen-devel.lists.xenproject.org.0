Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 190DE1BBC4A
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 13:19:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTOGN-0003Nm-1L; Tue, 28 Apr 2020 11:18:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v0V7=6M=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jTOGM-0003Ng-H3
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 11:18:54 +0000
X-Inumbo-ID: 07e3a24c-8942-11ea-984c-12813bfff9fa
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 07e3a24c-8942-11ea-984c-12813bfff9fa;
 Tue, 28 Apr 2020 11:18:48 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id z6so2424013wml.2;
 Tue, 28 Apr 2020 04:18:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=fBwuZ4QzlGUHOQQ5r8cLpSzseKT/A8Yt+G/+bSzTF6E=;
 b=A3WnMMln2VBVGixAR+4iur7IvC8YjxLYf137vjfswSDJGlWsH3AEfVi4PY5BOwWkl7
 RAdEe31q6+HfvMSkggEgcVbZFUsCMHdLXqYV6y0y8Gt08h/Gt+4PfuSlYUxM0l+lrCC2
 Yr7QEhG979QhUPNkJpUq/TIpfddNzl7SZIHRNJEzD1V0sn4J6xODfZarqZ5wU1JQF5SC
 MUG27PlAU8Tc2OLq1df6GIrvuYUBJJiQIj2SjG1QkRJU9FWnRR8kQVnYt2QEoo52Mxig
 fknPZNyX6OYH4r8nUYXt5RyiyFC8bSGE0hgT7z1HUCfFLD7EO/OLO14AksXpnkOdV8Nb
 vmPQ==
X-Gm-Message-State: AGi0PubuidhADGo3cf+DkAoE/3kcw/IuE4xqyU+j3f7umNedZDJMwgdp
 Lq72mdV3Bc3Yw85vE+oZ8RY=
X-Google-Smtp-Source: APiQypJWZwjuZkDC+XnOTrbzKQjlLQTeFTcMngmgsCo5IN4ctQ64OfCibTgjZom76XIVJ865Q5GXbw==
X-Received: by 2002:a1c:7c18:: with SMTP id x24mr3788296wmc.146.1588072727849; 
 Tue, 28 Apr 2020 04:18:47 -0700 (PDT)
Received: from
 liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id s14sm3010581wme.33.2020.04.28.04.18.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 04:18:47 -0700 (PDT)
Date: Tue, 28 Apr 2020 11:18:45 +0000
From: Wei Liu <wl@xen.org>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jason Andryuk <jandryuk@gmail.com>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] mini-os: Avoid segfaults in tc{g,s}etattr
Message-ID: <20200428111845.ee7373zz7pn3bdc5@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
References: <20200427034019.6251-1-jandryuk@gmail.com>
 <20200427075429.mshevnm2ype7tq32@function>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200427075429.mshevnm2ype7tq32@function>
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
Cc: Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Apr 27, 2020 at 09:54:29AM +0200, Samuel Thibault wrote:
> Jason Andryuk, le dim. 26 avril 2020 23:40:19 -0400, a ecrit:
> > Commit c96c22f1d94 "mini-os: minimal implementations of some termios
> > functions" introduced implementations of tcgetattr and tcsetattr.
> > However, they do not check if files[fildes].cons.dev is non-NULL before
> > dereferencing.  This is not a problem for FDs allocated through
> > alloc_fd, but the files array pre-allocates FDs 0-2 for stdio.  Those
> > entries have a NULL .dev, so tc{g,s}etattr on them segfault.
> > 
> > ioemu-stubdom segfaults when term_init() calls tcgetattr on FD 0.
> > 
> > Restore tcgetattr and tcsetattr behavior when .dev is NULL equivalent to
> > unsupported_function as it was before c96c22f1d94.
> > 
> > Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> 
> Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
> 
> Thanks!

Applied. Thanks.

