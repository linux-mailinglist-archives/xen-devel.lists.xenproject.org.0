Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 297C16D70DA
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 01:44:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518181.804445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjqIj-0006lm-Rm; Tue, 04 Apr 2023 23:42:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518181.804445; Tue, 04 Apr 2023 23:42:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjqIj-0006ji-Mn; Tue, 04 Apr 2023 23:42:57 +0000
Received: by outflank-mailman (input) for mailman id 518181;
 Tue, 04 Apr 2023 23:42:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zi2d=73=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1pjqIi-0006jc-73
 for xen-devel@lists.xen.org; Tue, 04 Apr 2023 23:42:56 +0000
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [2607:f8b0:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 680bcece-d342-11ed-b464-930f4c7d94ae;
 Wed, 05 Apr 2023 01:42:49 +0200 (CEST)
Received: by mail-pl1-x632.google.com with SMTP id w4so32818573plg.9
 for <xen-devel@lists.xen.org>; Tue, 04 Apr 2023 16:42:49 -0700 (PDT)
Received: from localhost ([122.172.85.8]) by smtp.gmail.com with ESMTPSA id
 y6-20020a170902864600b0019a97a4324dsm8937815plt.5.2023.04.04.16.42.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 16:42:34 -0700 (PDT)
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
X-Inumbo-ID: 680bcece-d342-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680651768;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=feIblo+o8kbpXNJYhzwlTFiRu9n2TLSdCk9P+Iemon0=;
        b=Yan3Q9i7usnOf/ue1Ycdr66MdZ/nw/QgnlqaS4UNZDvl86rfJ9JCpESP5YkLjkYU2h
         ypWspWID3xtm7mfI2MG/9QdNp/C7Njy0uSzzOeY6mBxt0hhJTbZ5n3AQiFh2gixGgn8X
         OnKq6gCfWgacDC7Y9wkL4k8rtMMP/QUTSPLkw+nLWCnjvVmkGx2v9qBnMUS17sp86BSW
         ir9I0Zmzy9ZGad7QpnpU+/ARWvp8T5Z+N2OFKBEL54Dz26YGb86FeiB8+j4NMJXPUiWo
         9RMfyrAa8yxV3pOFIHADm/xxHiGZ4gT9EMFKoEfJIM8Vwtl50/BxI4UHwL5Fb+8z7OnL
         KP0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680651768;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=feIblo+o8kbpXNJYhzwlTFiRu9n2TLSdCk9P+Iemon0=;
        b=K1stWgcAyZf8ClVwrQ7be0SWWjLvxgZbspSfEORaID8mEcL+JKZlRWmvJExjTXKdB5
         u9wOB+jC3BQk5V7p2IN22tugSaCntRHHai7aAo5R1xN2QoBtM4NsRFQ8PF6KGw0enj69
         x02tNv2gg16Fz7JC6ybt4vjwkkn8dmWG7xNOuWbBZLOgu6CdNFBloJbceS910L5IGbif
         9ZYFtzIbiCmdjvBdI2wUUeQgB1pkeSa+fDq1hRIWj3o3o9ZcuVqArO+007hrg3Eseh/z
         +4CdOMZWuclLA/mrCD6Ql6HnyDNs7Yk9WJ69yZmNjVqLwMzTDJpyHVVjucoRPoINnqDE
         bq4w==
X-Gm-Message-State: AAQBX9dGHVGm2QuAKjSb26u1w+lz75XzYulQxLHvj9UIHih05SzA8TiC
	ZFropbMcWQp0ql5yxJHfIBLNSg==
X-Google-Smtp-Source: AKy350ba2lwW+XWrJEcaG00ngHmXaxvRAhtHPRrC1Vt33qoLwtfK/oXIIbLdeQDDb2MkXMlAm5GfPQ==
X-Received: by 2002:a17:902:f68f:b0:19c:be0c:738 with SMTP id l15-20020a170902f68f00b0019cbe0c0738mr5157163plg.59.1680651767862;
        Tue, 04 Apr 2023 16:42:47 -0700 (PDT)
Date: Wed, 5 Apr 2023 05:12:28 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>, xen-devel@lists.xen.org,
	stratos-dev@op-lists.linaro.org, Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Mathieu Poirier <mathieu.poirier@linaro.com>,
	Erik Schilling <erik.schilling@linaro.org>
Subject: Re: [PATCH] libxl: arm: Allow grant mappings for backends running on
 Dom0
Message-ID: <20230404234228.vghxrrj6auy7zw4c@vireshk-i7>
References: <817f0320316dd144826add0ac834618026b91160.1680165772.git.viresh.kumar@linaro.org>
 <25fb2b71-b663-b712-01cd-5c75aa4ccf9b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <25fb2b71-b663-b712-01cd-5c75aa4ccf9b@gmail.com>

On 04-04-23, 21:16, Oleksandr Tyshchenko wrote:
> ok, probably makes sense

While testing both foreign and grant mappings I stumbled upon another
related problem. How do I control the creation of iommu node from
guest configuration file, irrespective of the domain backend is
running at ? This is what we have right now:

- always create iommu nodes if backend-dom != 0
- always create iommu nodes if forced_grant == 1

what I need to cover is
- don't create iommu nodes irrespective of the domain

This is required if you want to test both foreign and grant memory
allocations, with different guests kernels. i.e. one guest kernel for
device with grant mappings and another guest for device with foreign
mappings. There is no way, that I know of, to disable the creation of
iommu nodes. Of course we would want to use the same images for kernel
and other stuff, so this needs to be controlled from guest
configuration file.

-- 
viresh

