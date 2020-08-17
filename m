Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDDF2463D9
	for <lists+xen-devel@lfdr.de>; Mon, 17 Aug 2020 11:56:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7bs4-0006Xf-PH; Mon, 17 Aug 2020 09:56:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5P54=B3=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1k7bs3-0006XZ-KZ
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 09:56:03 +0000
X-Inumbo-ID: cbe17c95-0411-4d76-9b91-61fa3974a675
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cbe17c95-0411-4d76-9b91-61fa3974a675;
 Mon, 17 Aug 2020 09:56:02 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id g75so13356670wme.4;
 Mon, 17 Aug 2020 02:56:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=xW+7rEqmDrgn63svh0fXMbO1m3LLQj/3UD14ZrV2yvI=;
 b=HlBPEbetqfo0HhhnQU7+ptwAL/PyRC7ty4etvE+O0PoMfic54YRTX/ekEjktmbDJhT
 1h3B+UOwd/zcB1B7JTPuS43SCA5ElHkBeCxQmyE9/c0D4gp8ZcV9klaZNBicX9Rnj6Yx
 chIM7Mzqqxx0e8wHM68KowNc9SRImDnQTBEY8PMGDr9oSnnm9O7/LMonwj0r14NGitKD
 5+ZbhBa+wMtMsCT+FZlXSLIMK8OtbRglPh3INAVAN9VSgb6M/zDoyq/9Hz/iIHXIpsLE
 uyW6tKuLD+jCQI34NjW0O6vwpxzbkCxxH1QIW8heFP+iOpr8R9DQhV9l1AoFV5CS2DKq
 r2dw==
X-Gm-Message-State: AOAM533K5tCiv2hDsLSxmnL0rYVTFHxLRSnkh4E5Szel2LDcDfhAYlDm
 N9vXM2vAYDIgLPT2jZwLDcA=
X-Google-Smtp-Source: ABdhPJz7AOpULhiqvMe22YQS9XzxoCDkzhy7WT1X4c6VU00K4bi3khj6/4GFkE3zHWZHBnzi2m+SNQ==
X-Received: by 2002:a1c:1f85:: with SMTP id
 f127mr14721154wmf.154.1597658161495; 
 Mon, 17 Aug 2020 02:56:01 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id s19sm35429330wrb.54.2020.08.17.02.56.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 02:56:00 -0700 (PDT)
Date: Mon, 17 Aug 2020 09:55:59 +0000
From: Wei Liu <wl@xen.org>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org, wl@xen.org
Subject: Re: [PATCH] mini-os: fix do_map_frames() for pvh
Message-ID: <20200817095559.uobssd2gk5jmd23z@liuwe-devbox-debian-v2>
References: <20200815111257.29302-1-jgross@suse.com>
 <20200815214321.qp46x46ucqlh6mp6@function>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200815214321.qp46x46ucqlh6mp6@function>
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

On Sat, Aug 15, 2020 at 11:43:21PM +0200, Samuel Thibault wrote:
> Juergen Gross, le sam. 15 août 2020 13:12:57 +0200, a ecrit:
> > In case ov PVH dom_map_frames() is missing to increment the virtual
> > address. This leads to writing only the first page table entry multiple
> > times.
> > 
> > Signed-off-by: Juergen Gross <jgross@suse.com>
> 
> Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

Applied.

