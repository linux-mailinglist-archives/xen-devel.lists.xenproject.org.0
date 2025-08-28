Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D79FB3957F
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 09:39:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1097708.1451935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urXE7-0001j9-Rm; Thu, 28 Aug 2025 07:39:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1097708.1451935; Thu, 28 Aug 2025 07:39:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urXE7-0001gQ-Og; Thu, 28 Aug 2025 07:39:19 +0000
Received: by outflank-mailman (input) for mailman id 1097708;
 Thu, 28 Aug 2025 07:39:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tukF=3I=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1urXE6-0001g3-2s
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 07:39:18 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 190e55df-83e2-11f0-ae26-e363de0e7a9e;
 Thu, 28 Aug 2025 09:39:15 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-45a1b05a59fso4422125e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 00:39:15 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45b66b6985bsm54411745e9.2.2025.08.28.00.39.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 00:39:14 -0700 (PDT)
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
X-Inumbo-ID: 190e55df-83e2-11f0-ae26-e363de0e7a9e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756366755; x=1756971555; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p7y1pXqs8Qboeyi6xLd7khLJJ/lz+M3UYVy7YPrYBQ8=;
        b=lH8r4MHVsTZB13qhJfIYIa87A51fUnbvSfpaRjxd2H5PYjC7GJx0qEfF3kkMgPACjh
         8F+s+JHoj1MRmt1xZQBf9LI3OQX5JjRaiWQvURc1C8yBivX0qL18pPN2/dCJ7sRLTMI7
         q0ymWptH4RGQ2n5+OH2JHf4Ven4aDixc0JrDY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756366755; x=1756971555;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p7y1pXqs8Qboeyi6xLd7khLJJ/lz+M3UYVy7YPrYBQ8=;
        b=TP9MZnUCFe4uNvaO+tDMbIa4WArVMi1D3YVpcnLlsk6NxkMFDApVeCrnhHPylFQqu9
         mRr5pV6yXXmLsyDM0Mm2gLYIFuRqvWCgg7oiWvkAjpOQtmCv9PBKanZLiKGi71yuTJfi
         /jmRk6/7RWwG2v0N7ohNmnuRqVVpIEci9SBxvzAE0k66ZYqV/j6/fVcFJt1rvvhZ70uX
         ihmZyBhQj5VeC+ANJekOqBjkAeahqGN6DtLQZ6uhCkKJ6IMbluqHcYKV/yK+BQ22W6O8
         6ziX/Yu7z1xVeH8vqc0UGyIrN/nHKv3PprYPs4rUauDDk/Q3eHPghvL82RVIdjx45lmD
         CQ2g==
X-Forwarded-Encrypted: i=1; AJvYcCXhJOVRBD0czzQeje5qHhJYsq+vwSc477EydlO8sdLsVSs2Jsy7M48IerHbsMVTKMxemKEziM4H8QE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw3LRVkfhRpOp3ZZVX/42o3v7+BzHAieOPfd6NmGoo1D98FTlpK
	Cl18VnV3cFULYZV6baAbR0zxAT+lDNRiODJAxoheQz8DGylbrCX8Rrw6E/nIXWate1WFR9b4Qdx
	wVcnM
X-Gm-Gg: ASbGncsfgnrULVoAo5VDh9ot9Txmp2MDHYs5JE3wGj9G4HYUa3O00RetBiVU/u+TpAk
	HrkgG+KyLpuDE9xthNCK178S/lXyouevW4lLS777wDLQpNwLfJw2WIxEIZ42EkQOnPeH+rw1Nbg
	jovleZU5j224V6vHyLy0nQHKRCMnpoNfZ2/NTVwEYfW0Uymp7uOfZsmOBnSTrAwkFk5sjV2u1+Y
	/vCUKJj2yFS+i9LSe8PztaoMjMkhmPa+8QHFGU+og7hkJ/xLdygKvM9xnJ0LWEPN0U5E8GoTFNW
	+0eGjKgMsjytYFQ/P2IBmFAfom8WobAZ5ExitHUOZRbD6LvohaO+PDdLXS3xQJTqaotCUdBgk3Z
	nUDSqecQ5+Q6JVaPYKsGeApn4e83eS4ZBrXA5Io6qUQD7AYjKcHCGV7sa+6jUNaHtRr2bAiYbgH
	S1
X-Google-Smtp-Source: AGHT+IF/qerpWkSJLtedLgTezRR9OurNxz0AUUbm/plI/17+q7CkqC5pjccRmdIn+bquSalrWAoNDA==
X-Received: by 2002:a05:600c:1389:b0:455:f59e:fd9b with SMTP id 5b1f17b1804b1-45b517c584cmr219260515e9.24.1756366754927;
        Thu, 28 Aug 2025 00:39:14 -0700 (PDT)
Date: Thu, 28 Aug 2025 09:39:13 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Mark Syms <mark.syms@cloud.com>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org,
	sstabellini@kernel.org, anthony@xenproject.org, paul@xen.org
Subject: Re: [PATCH] [xen-block] Return BLKIF_RSP_EOPNOTSUPP for unknown
 operation
Message-ID: <aLAHoR3BtBz9G9Q0@Mac.lan>
References: <20250827160841.351707-1-mark.syms@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250827160841.351707-1-mark.syms@cloud.com>

On Wed, Aug 27, 2025 at 05:08:41PM +0100, Mark Syms via wrote:
> Returning BLKIF_RSP_ERROR if an operation is not supoprted does not
> allow the frontend to exercise any discretion on how to handle the
> response and may lead to an operating system crash. As different
> backends may support different feature sets and we might, during a
> migration, switch backends, an in-flight request might be issued (or
> reissued) which is then not supported by this backend.

Linux blkfront at least will empty the ring on resume, and re-process
and queue the requests after having negotiated the (possibly) new set
of features with the backend.  That however doesn't avoid finding
flush requests that might not longer be supported by the new backend,
in which case Linux blkfront will drop such requests.

I assume the fixes done here are not targeted at dealing with a Linux
blkfront?

> Signed-off-by: Mark Syms <mark.syms@cloud.com>
> ---
>  hw/block/dataplane/xen-block.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/block/dataplane/xen-block.c b/hw/block/dataplane/xen-block.c
> index 48c2e315f3..32cf919a97 100644
> --- a/hw/block/dataplane/xen-block.c
> +++ b/hw/block/dataplane/xen-block.c
> @@ -167,7 +167,8 @@ static int xen_block_parse_request(XenBlockRequest *request)
>          return 0;
>      default:
>          error_report("error: unknown operation (%d)", request->req.operation);
> -        goto err;
> +        request->status = BLKIF_RSP_EOPNOTSUPP;
> +        return -1;

The comment in blkif.h contains:

 /* Operation not supported (only happens on barrier writes). */
#define BLKIF_RSP_EOPNOTSUPP  -2

So in principle BLKIF_RSP_EOPNOTSUPP is only to be used as a response
for BLKIF_OP_WRITE_BARRIER or BLKIF_OP_FLUSH_DISKCACHE requests,
however blkback already uses it as a response to unknown request
types (like you propose here).

Would you mind also sending a patch to adjust blkif.h in Xen to remove
the "(only happens on barrier writes)" part of the comment?

Thanks Roger.

