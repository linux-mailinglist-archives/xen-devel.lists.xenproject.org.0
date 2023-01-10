Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDFE66453F
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 16:48:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474793.736150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFGr4-0004Ga-PZ; Tue, 10 Jan 2023 15:48:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474793.736150; Tue, 10 Jan 2023 15:48:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFGr4-0004DA-Ka; Tue, 10 Jan 2023 15:48:02 +0000
Received: by outflank-mailman (input) for mailman id 474793;
 Tue, 10 Jan 2023 15:48:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EOFq=5H=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1pFGr2-0004D4-SC
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 15:48:00 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26e5a169-90fe-11ed-b8d0-410ff93cb8f0;
 Tue, 10 Jan 2023 16:47:56 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id ud5so29802976ejc.4
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jan 2023 07:47:56 -0800 (PST)
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
X-Inumbo-ID: 26e5a169-90fe-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K9zFij6mcz/5EjbhUw4rVwr2bV1YHqurcc0Zhp61PdA=;
        b=lGnK5ikqxgW2LT21/K1L03RqZw22csPgayOQPywKPrXj/PUk/llgT4yYraB9McgByq
         t4fKoY4aqlf5mCVUsA4e6xu7RE0MiuWoNToUqjykUB0PuPYMT9wTvUZ+nxIZmqGUt54T
         9zcCo9Onl6n3i2/+cXtVUpB7wF5SEmcC/PDsa5E1OJflqcljdXHnu3TDPcYvWmFgU+vx
         UkA9Ema/mEn+vbDPxx80icJIA6+B4Bo2lyPzj3OeEVgE8oEGMDQsA4Skw+ToRK1GcR3a
         0kf/QuO0B0gNC8/sp1dlsFRKknnSMQbv82jltuQ7g1mVdPHm3mgL1VR9F6j0sgtQPDSA
         XWFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K9zFij6mcz/5EjbhUw4rVwr2bV1YHqurcc0Zhp61PdA=;
        b=ql55Wj1/qhYKPbecTkYT7Uqe7sXmZEi1SgkcnayK+S8Rm602BAZxHZPUJyN3h3zRNS
         jkqTbVelpL3cPQla5R/3qR/+LIeUYlP1Q0dTk0SNz90Kj81sLua6juUFfsucpWxiAy9V
         s0XbDW1whtWZLM4RTgAxGipsFM/sUMWf3X0Rin/WeKpQ4n7XJuAoGoG5IsAcCtK2+E1k
         U51LDZVMzDPUzqZ7nzJeVgrusULlOY8e8lsZHqq4XHSc2mI3YCW7vnRznjzbaNkZvE4K
         ZJ5v+6yyhb9EA+qAi6347GWOmPmiLZXbn85Wksdbc0IZOLUW8dSOf4NQJZCl3fUSecqg
         jkIw==
X-Gm-Message-State: AFqh2kqHyE6zrzHc+WG4YbSQ9hiSjpaUq/c3VWao59+lNq5+0PlMfynQ
	qFocHpuNEds8A5KAdeqY4i+U9ELt9NWO6oAHsVc=
X-Google-Smtp-Source: AMrXdXtZCjmz2eEYGUuQtsjAmvIANrsSpe4d8dJvKJijER8DPcqmuDmusth+yawebeTjAUFsi8iKeAQdCI4B1/trC0s=
X-Received: by 2002:a17:906:3b5a:b0:82c:356c:c4c8 with SMTP id
 h26-20020a1709063b5a00b0082c356cc4c8mr3777148ejf.649.1673365676310; Tue, 10
 Jan 2023 07:47:56 -0800 (PST)
MIME-Version: 1.0
References: <20230110151854.50746-1-anthony.perard@citrix.com>
In-Reply-To: <20230110151854.50746-1-anthony.perard@citrix.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 10 Jan 2023 10:47:43 -0500
Message-ID: <CAKf6xptZruBdm+dRLtqan+uFTCyMdpscRRasQBeeiRno1WJXUQ@mail.gmail.com>
Subject: Re: [XEN PATCH] tools: Fix build with recent QEMU, use "--enable-trace-backends"
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 10, 2023 at 10:25 AM Anthony PERARD
<anthony.perard@citrix.com> wrote:
>
> The configure option "--enable-trace-backend" isn't accepted anymore
> and we should use "--enable-trace-backends" instead which was
> introduce in 2014 and allow multiple backends.
>
> "--enable-trace-backends" was introduced by:
>     5b808275f3bb ("trace: Multi-backend tracing")
> The backward compatible option "--enable-trace-backend" is removed by
>     10229ec3b0ff ("configure: remove backwards-compatibility and obsolete options")
>
> As we already use ./configure options that wouldn't be accepted by
> older version of QEMU's configure, we will simply use the new spelling
> for the option and avoid trying to detect which spelling to use.
>
> We already make use if "--firmwarepath=" which was introduced by
>     3d5eecab4a5a ("Add --firmwarepath to configure")
> which already include the new spelling for "--enable-trace-backends".
>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

Thanks,
Jason

