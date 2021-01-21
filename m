Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B322FEDE4
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 16:02:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72159.129673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2bTp-0003Ya-Q3; Thu, 21 Jan 2021 15:02:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72159.129673; Thu, 21 Jan 2021 15:02:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2bTp-0003YA-Ms; Thu, 21 Jan 2021 15:02:37 +0000
Received: by outflank-mailman (input) for mailman id 72159;
 Thu, 21 Jan 2021 15:02:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dq2E=GY=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1l2bTo-0003Xn-HG
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 15:02:36 +0000
Received: from mail-wr1-f47.google.com (unknown [209.85.221.47])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4ee02c0f-eb41-49db-87d7-5a283df32744;
 Thu, 21 Jan 2021 15:02:35 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id 6so2066056wri.3
 for <xen-devel@lists.xenproject.org>; Thu, 21 Jan 2021 07:02:35 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id d22sm4309439wmd.43.2021.01.21.07.02.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 07:02:34 -0800 (PST)
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
X-Inumbo-ID: 4ee02c0f-eb41-49db-87d7-5a283df32744
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HmanpGnDlRNosm92WXnhkbuhRHe0NTx3G7gqg1gvGgo=;
        b=Gh1WeviU3Ym3ixv+gojl9ylj/BsBLkT+BKjOmA8kutoykMKl1Xecnfd/kpiUk+36pa
         RvwC14C0oA0DDPH6ONRvFS2XPob0F/9qxfQCT0oqIE3WHKH9GqcV0rFLnQ/wr0JgGTJ0
         57+4ZZsJ00C9BFZYCcWNMXOhjgemFW14nOwkGVdt5HbIwJaI8hw7+sTVrV2LIR/xYEaW
         bYExqi+JyDgxhzKCGPjczmtwbO8P9LJtDvLBhr99RyUOpMBAUSO7Qz4ZGOV8y2Q/uLu3
         wQJVUnFSPyIsnKmj8SJRedIvrb54LV8PgOIHuhGSTl4Cj82nE28qG50KB+S4dyqg6Eny
         +qtA==
X-Gm-Message-State: AOAM533i/Lif+U4jdjp/qgwerAyApDS1g76UkbFkMHnF6Wh+liHGUQIH
	0vK7kbHX27cG0SPy1u/N1JY=
X-Google-Smtp-Source: ABdhPJw7wzg7WSX73ac+d2gX91TTHq+7AmoBh9uXlsSY0z1zaP/pyds4PQ7tABCk3QtbtEok7/kEsg==
X-Received: by 2002:adf:80d0:: with SMTP id 74mr15022430wrl.110.1611241355137;
        Thu, 21 Jan 2021 07:02:35 -0800 (PST)
Date: Thu, 21 Jan 2021 15:02:33 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 3/5] libxenguest: "standardize" LZO kernel
 decompression code
Message-ID: <20210121150233.elijzzfud3cftrjm@liuwe-devbox-debian-v2>
References: <aab9e3e6-5125-6b0a-6cd4-960fd783b1b2@suse.com>
 <4fb01879-4b9c-e711-ecd0-39b0e4d50878@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4fb01879-4b9c-e711-ecd0-39b0e4d50878@suse.com>
User-Agent: NeoMutt/20180716

On Tue, Jan 19, 2021 at 04:16:35PM +0100, Jan Beulich wrote:
> Add a DOMPRINTF() other methods have, indicating success. To facilitate
> this, introduce an "outsize" local variable and update *size as well as
> *blob only once done. The latter then also avoids leaving a pointer to
> freed memory in dom->kernel_blob in case of a decompression error.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Wei Liu <wl@xen.org>

