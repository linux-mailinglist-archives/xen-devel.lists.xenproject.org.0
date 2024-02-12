Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E64A85115D
	for <lists+xen-devel@lfdr.de>; Mon, 12 Feb 2024 11:46:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679532.1056997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZTpW-0006No-Ie; Mon, 12 Feb 2024 10:46:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679532.1056997; Mon, 12 Feb 2024 10:46:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZTpW-0006LO-FJ; Mon, 12 Feb 2024 10:46:30 +0000
Received: by outflank-mailman (input) for mailman id 679532;
 Mon, 12 Feb 2024 10:46:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9jSY=JV=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rZTpU-0006DK-IK
 for xen-devel@lists.xenproject.org; Mon, 12 Feb 2024 10:46:28 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8e96f68-c993-11ee-98f5-efadbce2ee36;
 Mon, 12 Feb 2024 11:46:27 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40fd2f7ef55so22515615e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Feb 2024 02:46:27 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 1-20020a05600c024100b0041061f094a2sm8156202wmj.11.2024.02.12.02.46.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Feb 2024 02:46:26 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: f8e96f68-c993-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707734786; x=1708339586; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IKaRny37rlggD7+Q7v7k3tUewmO/LOXkeak5vLz7CEc=;
        b=GUnsRnJj5y7MxElOGsViBgvTWnLtey5MdrM6kgw0gX0t7Ztl0Y5KU+lW0gxUz0UEP4
         fBVFwka98gmvdHng3gv/Pr+LIAaoCxSjj04vlydtnoS8HdiX2+KwJzYuP6gE7kQq5Beg
         A8fxJFILn2ZJNbDqifpVXke+t62ZopXRVQwyo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707734786; x=1708339586;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IKaRny37rlggD7+Q7v7k3tUewmO/LOXkeak5vLz7CEc=;
        b=efuJjTrXkC1axW8LEyrUvrlmta/9+n/5zSUcGmAOOnBlcwBw60/yIFKlox6OjV56VM
         jpck5RGBDbtbXT/runDdejcZ0cXmstqragGQ2H3FWVR+UBdxNd6+Pf425r1Ke+kfjzn7
         tbJZQNj9Trea5mzJKL9AejBiepOTa2HsXznMP3jr9clPfeVMlBS4vvwoDnOMRkW7BCHP
         xCuCiFZAODGZVQxA465sUwiO4Ki9rhN2mVCQVY1QiD8+4o7XsydRfSdnqTKIZtgmEN+h
         FgQu+EA2fQJM5DZoqbEQNrTfa4uNsgk7GukKLIlxQ+fB6c0qPgkoErOmS2FYt/gj/aDU
         dh2Q==
X-Gm-Message-State: AOJu0Yz7ANOI8WKdXPKq9DYQN0PB2y++kSYLC5J4ULn/jjq79KyCkTw1
	InsGJwg0hL1NC6eVnC1OWyQaL1I/BOe5OhXRHMpS8gV6OLCp7zQxM4eELlhhMVE=
X-Google-Smtp-Source: AGHT+IE168UjhgjYQRZvqUwbFsc0agU2d3CEYELFR69OlqwkMqUHxJPjRjtMK7QAwatLifjoq5ntxQ==
X-Received: by 2002:a05:600c:46cf:b0:410:4b4:dc7f with SMTP id q15-20020a05600c46cf00b0041004b4dc7fmr6260437wmo.4.1707734786398;
        Mon, 12 Feb 2024 02:46:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXwu3EgZRT95uQW2pjaMqIQDUx31/paspiMeKQR2oI0onoJV3YVSTUuOOyOLE0hIGq0BsroqKKUXlcffYnEbO2Ecww0hiaHy37ITGI=
Date: Mon, 12 Feb 2024 10:46:25 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 0/4] libxl: blktap/tapback support
Message-ID: <792bceb5-e39e-4684-b320-825c6782af0e@perard>
References: <20240201183024.145424-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240201183024.145424-1-jandryuk@gmail.com>

On Thu, Feb 01, 2024 at 01:30:20PM -0500, Jason Andryuk wrote:
> This patch re-introduces blktap support to libxl.  Unlike earlier
> versions, it does not link against any blktap library.  libxl changes
> are needed to write to the vbd3 backend XenStore nodes.
> 
> blktap has three components.  tapdisk is a daemon implementing the disk
> IO, NBD (Network Block Device), and Xen PV interfaces.  tap-ctl is a
> tool to control tapdisks - creating, starting, stopping and freeing.
> tapback manages the XenStore operations and instructs tapdisk to
> connect.
> 
> It is notable that tapdisk performs the grant and event channel ops, but
> doesn't interact with XenStore.  tapback performs XenStore operations
> and notifies tapdisks of values and changes.
> 
> The flow is: libxl writes to the "vbd3" XenStore nodes and runs the
> block-tap script.  The block-tap script runs tap-ctl to create a tapdisk
> instance as the physical device.  tapback then sees the tapdisk and
> instructs the tapdisk to connect up the PV blkif interface.
> 
> This is expected to work without the kernel blktap driver, so the
> block-tap script is modified accordingly to write the UNIX NBD path.
> (It works with the kernel blktap driver as well - upstream blktap hasn't
> removed the blktap driver requirement yet -
> https://github.com/xapi-project/blktap/pull/364)
> 
> An example command to attach a vhd:
> xl block-attach vm 'vdev=xvdf,backendtype=tap,format=vhd,target=/srv/target.vhd'
> 
> VHD support is important for OpenXT since there are lots of existing
> VHDs which still need supporting.  tapdisk also supports encrypted VHDs
> which is not available in QEMU.
> 
> blktap's tapback needs minimal changes to work with libxl:
> https://github.com/xapi-project/blktap/pull/394

It might be nice to have an entry in the ChangeLog. But it's looks like
the blktap project isn't ready yet, so we might need to point that out.

Cheers,

-- 
Anthony PERARD

