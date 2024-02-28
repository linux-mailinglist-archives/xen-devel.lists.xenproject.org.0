Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0EB86B342
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 16:37:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686722.1069101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfLz6-000815-53; Wed, 28 Feb 2024 15:36:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686722.1069101; Wed, 28 Feb 2024 15:36:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfLz6-0007yj-2P; Wed, 28 Feb 2024 15:36:40 +0000
Received: by outflank-mailman (input) for mailman id 686722;
 Wed, 28 Feb 2024 15:36:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WGB+=KF=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rfLz5-0007yd-1r
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2024 15:36:39 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 291c1f5a-d64f-11ee-afd8-a90da7624cb6;
 Wed, 28 Feb 2024 16:36:37 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-412b7baa9c5so2063155e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 28 Feb 2024 07:36:38 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 z9-20020a05600c114900b00410bca333b7sm2394015wmz.27.2024.02.28.07.36.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Feb 2024 07:36:36 -0800 (PST)
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
X-Inumbo-ID: 291c1f5a-d64f-11ee-afd8-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1709134597; x=1709739397; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vc3MR6wqRwFjdZ59y43EE7o5MZp5u8KpNsnAusaH2zI=;
        b=EGw5yP+FlmaJ7iK783LR48AXUg8qkLhiHux167XWbnZE666EFIKwoaIQ8yxJ4We4hH
         gXn9+Asf+lxCK/JT2LAEAJvCbjKtLlaQhRd3lLKB4NmNCU0rrDr8W7zNs8JfzbDEC01G
         wHbDX3nxypo7qKwTfXmm6z6fEzFFLiYUN85iI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709134597; x=1709739397;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vc3MR6wqRwFjdZ59y43EE7o5MZp5u8KpNsnAusaH2zI=;
        b=OR8YgusG5F8m3wKj0Pa9xl6ftpll5cqu+sa9U42aCAxfEooe3ZOXdoXmV4iuOUdBhz
         WJPX3XKYG/KQWA9rD3zo2ICG9Bkp86wOCHaA1nCVRtd9wc0fgSXP5tszkOvu5zHKmtbC
         mVpjCMT34QeFr5TNJQMj/3kHMUIAAr2q4TYIJc6PMDtqS7VgXr0w36+8b6FAtSsYTtrr
         kKwdAiae+PO0/lr3SmZARot24kFVCD7jF8rONFJQH7FwpcBL9nDWNGgup+PjcIvhtnIX
         291A4bXN6/CEITbRyx9ZddxgQPBKqo8JLIY/YBRlb7nheuygoVXkatZ4BP8B/9q1ArdN
         qxdg==
X-Gm-Message-State: AOJu0YzYbjKoaU7zJzdvZUvna0TCxJC95GhIakJTpmZjJPXehG3GRQ27
	RieCqqxC9TxgRe7OLlSRyr8AM6G79n316YV0n0yDJ5kzPXQMyAbeISVn+CudNeM=
X-Google-Smtp-Source: AGHT+IHhEwHeHosI3c6mcjtPP0oInY2niCQa0bxlDl2wUDFEW5rSqsPBjjLgbWyUcG0u8SvLx27tTw==
X-Received: by 2002:a05:600c:4f09:b0:412:ae70:992e with SMTP id l9-20020a05600c4f0900b00412ae70992emr3901658wmq.21.1709134597489;
        Wed, 28 Feb 2024 07:36:37 -0800 (PST)
Date: Wed, 28 Feb 2024 15:36:35 +0000
From: Anthony PERARD <anthony.perard@cloud.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 1/2] libxl: Fix segfault in device_model_spawn_outcome
Message-ID: <f477d391-4676-4cf3-b87a-8f8ee83e7db6@perard>
References: <20240109170540.38239-1-jandryuk@gmail.com>
 <20240109170540.38239-2-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240109170540.38239-2-jandryuk@gmail.com>

On Tue, Jan 09, 2024 at 12:05:39PM -0500, Jason Andryuk wrote:
> libxl__spawn_qdisk_backend() explicitly sets guest_config to NULL when
> starting QEMU (the usual launch through libxl__spawn_local_dm() has a
> guest_config though).
> 
> Bail early on a NULL guest_config/d_config.  This skips the QMP queries
> for chardevs and VNC, but this xenpv QEMU instance isn't expected to
> provide those - only qdisk (or 9pfs backends after an upcoming change).
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

