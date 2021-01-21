Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEE72FEDE5
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 16:03:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72161.129685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2bUH-0003eh-5C; Thu, 21 Jan 2021 15:03:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72161.129685; Thu, 21 Jan 2021 15:03:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2bUH-0003eH-1M; Thu, 21 Jan 2021 15:03:05 +0000
Received: by outflank-mailman (input) for mailman id 72161;
 Thu, 21 Jan 2021 15:03:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dq2E=GY=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1l2bUF-0003e7-DC
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 15:03:03 +0000
Received: from mail-wr1-f48.google.com (unknown [209.85.221.48])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 26e70407-0a4b-4f9f-b1fc-76403d8bab91;
 Thu, 21 Jan 2021 15:03:02 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id l12so2074470wry.2
 for <xen-devel@lists.xenproject.org>; Thu, 21 Jan 2021 07:03:02 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id a27sm9015785wrc.94.2021.01.21.07.03.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 07:03:01 -0800 (PST)
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
X-Inumbo-ID: 26e70407-0a4b-4f9f-b1fc-76403d8bab91
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kViYYjVRVrubS/QFGOpRx3DrfxADGSU909q5UYDe7yQ=;
        b=Ziu9m72xhafc16BzXumr0TV8Kxc76ALhWUEXGLvfWckD/8+EK8umuje0f/yFCmO7t5
         CPZCuLMcxsVmfin8lFOlYcbN64DRPZnOxxVW/5NTNgd5HqbUug3aiBhwqMp/yH/CoGSd
         EDJ/q8ASyXazkiuP5X4+mzHn4dv9qoFj5Cd1QCkTlPv75C46SSEEx/psHSbuerwLRD4T
         ALdmHPjHxzlQCkFIjYImYK4pdVrAMuurwoZcLfljParPPN/kESegapo/NWfvsd22Or/a
         YaFeLaY58cDg+AD5bDgLIXdKf/jZa2k+NcEwcOadtYvSdY0wX91ylZCmgfMwy8s0+wJI
         8BNw==
X-Gm-Message-State: AOAM532obHYIbqPY/A+RVd/BbGKoiewbutMjyuQkmzdjqW6aWKhNFHYz
	DUOjPEBGRNexMJ0CVYpZhrc=
X-Google-Smtp-Source: ABdhPJzFh43CnDcSESGXOBP0bl4nCkfc5+Nkwmc6iWOHxk9Qs99y/tji7JKdiscmyh4s2kcpXdU8Pw==
X-Received: by 2002:a5d:5253:: with SMTP id k19mr6029959wrc.224.1611241381860;
        Thu, 21 Jan 2021 07:03:01 -0800 (PST)
Date: Thu, 21 Jan 2021 15:02:59 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 4/5] libxenguest: drop redundant decompression
 declarations
Message-ID: <20210121150259.2b5okuve6ifli4v5@liuwe-devbox-debian-v2>
References: <aab9e3e6-5125-6b0a-6cd4-960fd783b1b2@suse.com>
 <17147e8a-2c5d-ac96-db16-8db4f4e87bbd@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17147e8a-2c5d-ac96-db16-8db4f4e87bbd@suse.com>
User-Agent: NeoMutt/20180716

On Tue, Jan 19, 2021 at 04:16:53PM +0100, Jan Beulich wrote:
> The ones in xg_dom_decompress_unsafe.h suffice.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Wei Liu <wl@xen.org>

