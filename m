Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A01E32D14E7
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 16:40:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46762.82893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmIcw-0004u6-9T; Mon, 07 Dec 2020 15:40:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46762.82893; Mon, 07 Dec 2020 15:40:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmIcw-0004th-6P; Mon, 07 Dec 2020 15:40:38 +0000
Received: by outflank-mailman (input) for mailman id 46762;
 Mon, 07 Dec 2020 15:40:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oN+h=FL=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kmIcu-0004tb-DN
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 15:40:36 +0000
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5ee1d84f-0483-4d84-84e8-5ac2c563014f;
 Mon, 07 Dec 2020 15:40:35 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id k10so11832922wmi.3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Dec 2020 07:40:35 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id 90sm15771278wrl.60.2020.12.07.07.40.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 07:40:34 -0800 (PST)
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
X-Inumbo-ID: 5ee1d84f-0483-4d84-84e8-5ac2c563014f
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=zKr99a2PtjKqyw1Cfrt8oWmnwL3Z9GPuLWdaa1WZMls=;
        b=IL04gh6xKAgZVB0oj8R/erpNwABAn+/skGbmdu84bm1vhegXnR/Gr24UGDgQKJa428
         AxIwnA6K5iuBeOb/u/t7d3JKD/ETPiTvI3mhi3a2qf/5FfSGl0V+qTBRMcQJ3SFFJESI
         wKi2gVW4erZjGhqsFcuh62pYdkPMXQLbdi9bCf5mPyub2McwQYu0zRPuhuTw5FpW5+Jd
         jR9azEtYA5jzuJNOW5k9KvOORDcDPoikr7rziO+JXSUl1NTQIo1NGbb6fAH0nJaPBQq7
         xM80lLif4KHV5cvnqq+7EQATnnxNC7znL/b1rHbBjP17G/wmhXFK3osh43K4g7WyzL84
         Hdrg==
X-Gm-Message-State: AOAM5333sIfhcTmo8CnLKLJzOKenILCK8gClsId2TkCP5nekkmDuTQL0
	CK/jqRx4kfIO2ysEOLS2jtE=
X-Google-Smtp-Source: ABdhPJzgTnYMLU50Da7z2XDhoyg234fDYc7FgWvOMCRwogXG3VBN874GUtLWn1LNcEPwjsCKYVumgA==
X-Received: by 2002:a1c:4c07:: with SMTP id z7mr18865454wmf.142.1607355634964;
        Mon, 07 Dec 2020 07:40:34 -0800 (PST)
Date: Mon, 7 Dec 2020 15:40:33 +0000
From: Wei Liu <wl@xen.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3] docs: fix documentation about default scheduler
Message-ID: <20201207154033.t3bexjrvx5vrv2n4@liuwe-devbox-debian-v2>
References: <20201117093258.26754-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201117093258.26754-1-roger.pau@citrix.com>
User-Agent: NeoMutt/20180716

On Tue, Nov 17, 2020 at 10:32:58AM +0100, Roger Pau Monne wrote:
> Fix the command line document to account for the default scheduler in
> Kconfig being credit2 now, and the fact that it's selectable at build
> time and thus different builds could end up with different default
> schedulers.
> 
> Fixes: dafd936dddbd ('Make credit2 the default scheduler')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Well I have not seen an explicit agreement on the text from the v1
thread, and I don't have v2 in my inbox, but this patch is definitely an
improvement over the old text in that it shows the correct scheduler. In
the interest of making progress:

Acked-by: Wei Liu <wl@xen.org>

Wei.

