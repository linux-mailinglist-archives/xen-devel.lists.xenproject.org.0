Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A07D3929EC6
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2024 11:16:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755217.1163523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQkTt-0000hx-Ni; Mon, 08 Jul 2024 09:16:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755217.1163523; Mon, 08 Jul 2024 09:16:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQkTt-0000fD-Kx; Mon, 08 Jul 2024 09:16:21 +0000
Received: by outflank-mailman (input) for mailman id 755217;
 Mon, 08 Jul 2024 09:16:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xFgZ=OI=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sQkTr-0000P7-VE
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2024 09:16:19 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc7019d5-3d0a-11ef-bbfb-fd08da9f4363;
 Mon, 08 Jul 2024 11:16:19 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3679df4cb4cso2196922f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jul 2024 02:16:19 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3678e06eba4sm14779790f8f.90.2024.07.08.02.16.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jul 2024 02:16:18 -0700 (PDT)
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
X-Inumbo-ID: bc7019d5-3d0a-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720430179; x=1721034979; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Hr3Yta8uX11L+kq3fXBQS0olcjRC5nTSlZ321S1ZdcI=;
        b=mlUXzVWhF0uY3cZgX1EVEoOJctSVxBqyu4rkxEP+oqMU56NQ/GDsedOJcCSM/GdZ1F
         I/7RwdXFLJ/xyyGogA6wKgXaBMYElqlMjf6jQS6QSg8GHj0ydM/RUR4iTdyoE1x5O004
         OapZWXhvYACsKqSq4DLd5jC5TKFT2PoNuDQh4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720430179; x=1721034979;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hr3Yta8uX11L+kq3fXBQS0olcjRC5nTSlZ321S1ZdcI=;
        b=jj6CfOIw/BdOleuME6Nf8wGBW+K+OFTjtZZ8IoflZI1/8xpvDwPaq5F6m3q5DG9rS7
         3ONxTVxpXj/3z/NDVzQf+yVRUFZLr2hgmmsj4TLfv0YJJ7VnZj/8AhruaIntMdI4O6KC
         o2TL3k2r2UkdtC1MgK1iLJvCk6raBozLCNnzXrLVQeS/cZTlvRwIxGQcqVC85UTyzkPO
         VM3/g/URXBw/isk+N6BsoOamYqCRB76LjIzDC9GDwfKhYVd2zTH3wnKnFExzewETgzO0
         Oy0+8l743XJSd6Gy+i/+466Z8MaUF4MSxwZI6uZIO1+5O1Jh3SLDcHz9uWe8dAy6ZVv+
         m1HQ==
X-Gm-Message-State: AOJu0YylA9FqhBDyPACMrNCMnp3QWAClS9Ej9FCI5768GZLevL6XDUB0
	tfqoo9gZ25UemM8NaWECO+GEH8y9ZRYjDj9arXcp1nBuvHvfcOBg8IkRhpQZoIg=
X-Google-Smtp-Source: AGHT+IFKSelxEstASrT5en/WWmyjQOOp0U1EmvccI5b8CP4LZTcRHiQE0NIS57dcyg9Nz3O4cPQNFg==
X-Received: by 2002:a5d:4392:0:b0:360:9d2a:fe05 with SMTP id ffacd0b85a97d-3679f6f0ddbmr10459116f8f.13.1720430178719;
        Mon, 08 Jul 2024 02:16:18 -0700 (PDT)
Date: Mon, 8 Jul 2024 11:16:17 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>, Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.19 3/6] CI: Refresh the Coverity Github Action
 configuration
Message-ID: <ZouuYRgZNr00CSUi@macbook.local>
References: <20240705152037.1920276-1-andrew.cooper3@citrix.com>
 <20240705152037.1920276-4-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240705152037.1920276-4-andrew.cooper3@citrix.com>

On Fri, Jul 05, 2024 at 04:20:34PM +0100, Andrew Cooper wrote:
> Update to Ubuntu 24.04, and checkout@v4 as v2 is deprecated.
> 
> The build step goes out of it's way to exclude docs and stubdom (but include
> plain MiniOS), so disable those at the ./configure stage.

Since we now disable those at configure time, could the build step be
switched to a plain `make build`?

Thanks, Roger.

