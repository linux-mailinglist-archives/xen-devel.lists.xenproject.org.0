Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F7A8C99D5
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2024 10:31:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.725887.1130192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s8yQF-0000Pt-0w; Mon, 20 May 2024 08:31:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 725887.1130192; Mon, 20 May 2024 08:31:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s8yQE-0000N4-Tv; Mon, 20 May 2024 08:31:06 +0000
Received: by outflank-mailman (input) for mailman id 725887;
 Mon, 20 May 2024 08:31:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ccuw=MX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s8yQD-0000Mx-SZ
 for xen-devel@lists.xenproject.org; Mon, 20 May 2024 08:31:05 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4bc7e707-1683-11ef-b4bb-af5377834399;
 Mon, 20 May 2024 10:31:04 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2e538a264f7so33063841fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 20 May 2024 01:31:04 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41ff6fd7e73sm371847995e9.27.2024.05.20.01.31.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 May 2024 01:31:02 -0700 (PDT)
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
X-Inumbo-ID: 4bc7e707-1683-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716193863; x=1716798663; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yqEjJIT9mlNdqu0zBGWobRlv+C0QGKeWgUxXWYwC3Cg=;
        b=eqgR+/r7+EKl2xkwyBdpHUWMHgUrHrQwjzSA5vws0cly6sQe0PGg/B9bFK20tKp8EW
         1J4dLMrOCyFYM2zXa1Nt1Edcw+IpEfRC21+oJfMnGUVlss9fNq5wKxz6/LMplUdmkhNm
         aKaW9j+abF8cmqSP0bZKK+YWz5pID8KX77cVk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716193863; x=1716798663;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yqEjJIT9mlNdqu0zBGWobRlv+C0QGKeWgUxXWYwC3Cg=;
        b=hC44NcNVPVmXVFvymYrwFnzd61S7+dvA34LtMwPmcfbSR65ohIlORgmMj7QeXcOY10
         WXFIVPqXz6mz2l2g0+o2O4zb2Qd+Mp4h/NFoOmZDwvVk80oRYkGRHUqWJScwbCkZ39Hc
         FbyJOVMyA5XoBA79Cyw5NoUl9fqVY2DX/9IMIGqHWTp2BhxeIzczrTSSIbqT5EDCzBGg
         igZ7jOy0CqGXi6taSYZYn5NQEJi/IWtsaND8HJa56p/arHy/JsePZ4xu3pxnaWmT7PW/
         sOW9cmllQhN8HqrqVWIbpQVbdLGaPOfxV9jUm0mas3KMeeE8GuNadmrIjihMIOs3L3l9
         jTJg==
X-Gm-Message-State: AOJu0YytHpZCt6LxiNGNWLxI7yuMbztJrd4Hd5PLjrxXBGbL6d8TTVZP
	BnaYQq1yeIGBD/lP13MPuL3HCN69oDZRuhghIfbzFCrs8BwkMFWim3fmNUkzjVU=
X-Google-Smtp-Source: AGHT+IFy/aIeAjbwW3Y208Wq5B5ZbEUsQ9yZw2tAqtYxnlgG6wKiWlE2muw5Wne31jOdoeS7L6ctPw==
X-Received: by 2002:a2e:9e51:0:b0:2e7:1588:7255 with SMTP id 38308e7fff4ca-2e71588729dmr39982421fa.32.1716193863325;
        Mon, 20 May 2024 01:31:03 -0700 (PDT)
Date: Mon, 20 May 2024 10:31:02 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Petr =?utf-8?B?QmVuZcWh?= <w1benny@gmail.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH for-4.19? v4 1/6] x86/p2m: Add braces for better code
 clarity
Message-ID: <ZksKRrr5aeWnkK1l@macbook>
References: <cover.1716029860.git.w1benny@gmail.com>
 <36d1488857a595fd6a286ab2de26cd672df3f387.1716029860.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <36d1488857a595fd6a286ab2de26cd672df3f387.1716029860.git.w1benny@gmail.com>

On Sat, May 18, 2024 at 11:02:12AM +0000, Petr Beneš wrote:
> From: Petr Beneš <w1benny@gmail.com>
> 
> No functional change.
> 
> Signed-off-by: Petr Beneš <w1benny@gmail.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

TBH I'm fine without the braces, but if lack of them can cause
confusion:

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

CODING_STYLE states that braces can be omitted for blocks with single
statements, I guess we should clarify whether multi-line statements
are accepted, as the example contains a single-line statement.

Thanks, Roger.

