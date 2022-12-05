Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EFC64277D
	for <lists+xen-devel@lfdr.de>; Mon,  5 Dec 2022 12:30:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.453472.711085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p29fW-0006ko-5B; Mon, 05 Dec 2022 11:29:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 453472.711085; Mon, 05 Dec 2022 11:29:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p29fW-0006iX-2V; Mon, 05 Dec 2022 11:29:54 +0000
Received: by outflank-mailman (input) for mailman id 453472;
 Mon, 05 Dec 2022 11:29:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g57r=4D=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1p29fU-0006iQ-B7
 for xen-devel@lists.xen.org; Mon, 05 Dec 2022 11:29:52 +0000
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [2607:f8b0:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21045360-7490-11ed-8fd2-01056ac49cbb;
 Mon, 05 Dec 2022 12:29:50 +0100 (CET)
Received: by mail-pl1-x632.google.com with SMTP id g10so10488198plo.11
 for <xen-devel@lists.xen.org>; Mon, 05 Dec 2022 03:29:51 -0800 (PST)
Received: from localhost ([122.172.87.149]) by smtp.gmail.com with ESMTPSA id
 o8-20020a17090a420800b0020a7d076bfesm8925105pjg.2.2022.12.05.03.29.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 03:29:48 -0800 (PST)
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
X-Inumbo-ID: 21045360-7490-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iVXW2V7isRG367mkt7rNrw2wPQksUNLUSv5XAk1GEm8=;
        b=HqUauqiPEytjp+MNxGhPWtF4O+4nSW8/dCTVuvQtPQWNMSrsMZ0u5x3invn4jmrddD
         nSe9zlvvv5PA3Qjy9Wa1ANWqoPU0F7gE7jqH6g7klCycXhcIfSQp76UWaaNDQzttyq+4
         yXq2Aksf24uAgelsSE27tr/vjE1r1qdxu9BzdUMBSRDAfjcklFSuPl5JhNY954kT6OUQ
         kXF9jSiGCIWjRFtYWGegZ8NAzNzvusluYoRHyrlXkKkkdPiJFAPeWqZxFJS9+95jhX4Q
         YXZ7UqKLt/fAIejvZqgYNqevWYLcal36MEeuw0kIg54D48U5WPShpR5K5kMWEieqSRRf
         BPEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iVXW2V7isRG367mkt7rNrw2wPQksUNLUSv5XAk1GEm8=;
        b=SVcsCr4PPjG1iKuF/W44Jv9KwjilPjnurDGEnlX5GyydhNgApYxaeuSz1K/IEORwDw
         nd/xhCl7QyZjy4r39G36WPUMJpT/IGKiP99Q+RP7bbTD6QQCgMcnW5ySvTGzxO5wTahL
         1DmFtuj3r924xZ9UC6Od/qA75eVYC0lW2+hlxZ2qT4X1sjagWuXzDexEIbPHiBqnsu7c
         c1iAIdA41LnGkiHSGh+jGSSx7AE6gatJjBftqgULON0UdT+IVyoqtnPuixTEq5niV4Nc
         QATBXCarc8+7jpNt84annUvY9GiTJyzBjo/z1l+hiUJYi1nF4MUDsNCQa+Xjtb+6AlgQ
         y1dw==
X-Gm-Message-State: ANoB5plcwK8MCiCr4Y0QlxBvoaf3ukqPDcebUVOZcy5UB3Ybu/oUi7tu
	1i4WfQo1Ou9vnZ+bIpYpLijBKA==
X-Google-Smtp-Source: AA0mqf7aJlLHLH4sw8/bBJGZ0Qg9kTGxUACMXRpXWD/CjnS4paS69DkwNoGfnznk5mHryYe3iHu+5w==
X-Received: by 2002:a17:90a:f402:b0:219:3212:c462 with SMTP id ch2-20020a17090af40200b002193212c462mr40967632pjb.83.1670239789548;
        Mon, 05 Dec 2022 03:29:49 -0800 (PST)
Date: Mon, 5 Dec 2022 16:59:46 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Mathieu Poirier <mathieu.poirier@linaro.com>,
	Mike Holmes <mike.holmes@linaro.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xen.org, Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH V6 1/3] libxl: Add support for generic virtio device
Message-ID: <20221205112946.qwa647k35uv7eyqr@vireshk-i7>
References: <cover.1667906228.git.viresh.kumar@linaro.org>
 <f1dc91669df27705c25a1f3018427c2db77b32a6.1667906228.git.viresh.kumar@linaro.org>
 <6a546552-d71d-a262-5981-8058dc37ae26@gmail.com>
 <20221205061518.l2i4kqkzcivpxaxl@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221205061518.l2i4kqkzcivpxaxl@vireshk-i7>

On 05-12-22, 11:45, Viresh Kumar wrote:
> > > +    rc = libxl__backendpath_parse_domid(gc, be_path, &virtio->backend_domid);
> > > +    if (rc) goto out;
> > > +
> > > +    rc = libxl__parse_backend_path(gc, be_path, &dev);
> > > +    if (rc) goto out;
> > 
> > The same question for dev variable.
> 
> Hmm, this we aren't using at all, which KBD does use it. Maybe we
> should even call libxl__parse_backend_path() ?

Removing it works just fine for me.

-- 
viresh

