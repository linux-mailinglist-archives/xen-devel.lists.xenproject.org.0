Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 071202CED17
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 12:32:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44549.79836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl9Jh-0003e0-Ma; Fri, 04 Dec 2020 11:32:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44549.79836; Fri, 04 Dec 2020 11:32:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl9Jh-0003de-Ja; Fri, 04 Dec 2020 11:32:01 +0000
Received: by outflank-mailman (input) for mailman id 44549;
 Fri, 04 Dec 2020 11:32:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OO73=FI=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kl9Jf-0003dV-UC
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 11:31:59 +0000
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d660ac91-ff95-4495-b952-28d566274875;
 Fri, 04 Dec 2020 11:31:59 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id a3so6701247wmb.5
 for <xen-devel@lists.xenproject.org>; Fri, 04 Dec 2020 03:31:59 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id a13sm2500624wrm.39.2020.12.04.03.31.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 03:31:57 -0800 (PST)
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
X-Inumbo-ID: d660ac91-ff95-4495-b952-28d566274875
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2dGeClOo6CkgVFL97zGExp3XBN7NVsuRMwITjZfQOFU=;
        b=gznEApqmxxl2E5Jx+gz7umrEFcwAup4oE2Y46jZyyGuY1HpoVmk2h1dmgQpw8nSN7Z
         MryaTMF7sAMNzcBcuT7zCNaKEmxKphqsOHV+nLvKgyvmEA4o/c3/t6klPvT5KmNSN2XF
         eXOx76JQE475/z6FYGni/nwILQ84WDRu/RelMOrMJ5M1aD8VS1uynV+aDGjMGkt6o8T+
         iSYBrbpiNsCtHKXMKJxpGyCwYtiDiTFJCFGwWopP7IuLLNknJxu9Zq1FtjEhZxQM+xZy
         MB6qTvJUvioUux1H3b65H5oSlgyvZlbzsDQ4P7uaZwrOt5Dyi4ih7hStAsKC5wwAGWR3
         DxjQ==
X-Gm-Message-State: AOAM530j/VR8Mc3i4qZSRCyJofYDN+O6U230p2QgdjoWwMPh2CHN1kEy
	uxfF/cYQx4x5MkxztvsefNk=
X-Google-Smtp-Source: ABdhPJyijUxXhCWeU2bbKH6t0CGkQef+sxJegilKGYz0fnoLuXeWUNtv2PjVMKXeP8FzG9hwq8KfPQ==
X-Received: by 2002:a1c:2394:: with SMTP id j142mr3810422wmj.42.1607081518387;
        Fri, 04 Dec 2020 03:31:58 -0800 (PST)
Date: Fri, 4 Dec 2020 11:31:56 +0000
From: Wei Liu <wl@xen.org>
To: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@ainfosec.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v5 17/23] libxl: introduce 'libxl_pci_bdf' in the idl...
Message-ID: <20201204113156.xckbfbujcky2mohi@liuwe-devbox-debian-v2>
References: <20201203142534.4017-1-paul@xen.org>
 <20201203142534.4017-18-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203142534.4017-18-paul@xen.org>
User-Agent: NeoMutt/20180716

On Thu, Dec 03, 2020 at 02:25:28PM +0000, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> ... and use in 'libxl_device_pci'
> 
> This patch is preparatory work for restricting the type passed to functions
> that only require BDF information, rather than passing a 'libxl_device_pci'
> structure which is only partially filled. In this patch only the minimal
> mechanical changes necessary to deal with the structural changes are made.
> Subsequent patches will adjust the code to make better use of the new type.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>

Acked-by: Wei Liu <wl@xen.org>

George and Nick, please comment on the go bindings.

