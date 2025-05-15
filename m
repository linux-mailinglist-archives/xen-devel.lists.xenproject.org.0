Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20634AB817B
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 10:53:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.984951.1370897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFUKz-0004Tn-84; Thu, 15 May 2025 08:53:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 984951.1370897; Thu, 15 May 2025 08:53:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFUKz-0004Rz-5X; Thu, 15 May 2025 08:53:09 +0000
Received: by outflank-mailman (input) for mailman id 984951;
 Thu, 15 May 2025 08:53:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CT6j=X7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uFUKx-0004Rt-7k
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 08:53:07 +0000
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [2607:f8b0:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb4f894a-3169-11f0-9ffb-bf95429c2676;
 Thu, 15 May 2025 10:52:51 +0200 (CEST)
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-7406c6dd2b1so1543983b3a.0
 for <xen-devel@lists.xenproject.org>; Thu, 15 May 2025 01:52:51 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-22fc7546aefsm113085255ad.37.2025.05.15.01.52.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 May 2025 01:52:49 -0700 (PDT)
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
X-Inumbo-ID: fb4f894a-3169-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747299170; x=1747903970; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nQJIFPkZ1E2RYkoyUNZqDnBF0F0qsw5TjA12sLk+xz0=;
        b=vysPlycJ9KWV6bPFFBr9PFe9AoOVkcqc6+rUv6QYMOGrZCB7Hlfrt7fNdFc09lHedC
         5PqsRShjgbOI3ScvadratRTFXaeT3kOr6cJ3wyn39OIcAeZiT9ns73yc843W+prF4mXu
         bbbQeqIYy5FTxRy/iSwLLRC5HylIAdQrpwcaM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747299170; x=1747903970;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nQJIFPkZ1E2RYkoyUNZqDnBF0F0qsw5TjA12sLk+xz0=;
        b=q8NcNXEbettfW9FjQR+79c8VrYM84UIj0V6Z88ljjSkGI8kYJbOvCq865yLL2Rjmfg
         3ziwiml1tlJGwdU9ryCUejyCRc6kQRuktZ9znSeiA+xoaOQemTcEEAMD9SybJ5Xr3xma
         og4eTNpFXsKwDdmqNeH1PpR+T7cpYziNfF62zF3/H8yur6xQacRuAg9fbFhRo81lLpVW
         /5hOwv6i3dy9wpp8obFrdU0KZ+VmA0f1sZOl+N8lY3Wlf3RaLZQ73qUyJVrV92kygWep
         jRfVpf8QJDqj2SuFX+cDegU26byQpYI1vnXcBUAVFxyLnNPO5e2GhcpFh3e1yPZJWOhD
         f7ng==
X-Gm-Message-State: AOJu0YxfULe36Pmq83nCU8m7NImjaLs5Awl4NQLuXWdYT+UlLlGi7ROU
	G3Vklf/hScZH/MPCFfgQNkndjnVJxF8qApO+z/K4u6WjQjjfRRybzBSW7VUg4pu/FEQ=
X-Gm-Gg: ASbGncuM1f+NNET5iKNFYPh7uve342F9Hkw0++Nktv6A8g0C8wI8E0PfhIK7imGnL5x
	Z6nHY6qR77QXslffgs5XDs9J53D4xthwT2bpciirzsxhhm9KHhwsXn30HA0DkdCshOr28ngQtdT
	/zn5UQu1pB4yNGvh1WpiNHPyOflG0gkR6omtdO/stc9lsg5pWmcGWs1LIIfEg0SVOghG1nsgvcN
	5hwoQz704m7IywGjVoMTausOS1XdyPTpP4Nx27fJ61N6i02iltBtxYxElOR/ZVE7IGsnXLTV3tP
	7ABUkZh09dwecXbqHTZ7Y2ZorSJSMVjE+s0CU5h8qHipwJ/gbO/sOeTm
X-Google-Smtp-Source: AGHT+IHVkJDQsSPJoZ1Aqwp7Co47f/qgm1ZodGe1JlzhpAhPibMdI9Jdxl+iPVJ8RcNBRxSA9sA3fw==
X-Received: by 2002:a17:902:f68f:b0:224:3994:8a8c with SMTP id d9443c01a7336-231b3959febmr40012325ad.8.1747299169964;
        Thu, 15 May 2025 01:52:49 -0700 (PDT)
Date: Thu, 15 May 2025 10:52:44 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 4/6] rangeset: introduce rangeset_subtract
Message-ID: <aCWrXJp3AgmAvU9m@macbook.lan>
References: <20250508132040.532898-1-stewart.hildebrand@amd.com>
 <20250508132040.532898-5-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250508132040.532898-5-stewart.hildebrand@amd.com>

On Thu, May 08, 2025 at 09:20:33AM -0400, Stewart Hildebrand wrote:
> Introduce rangeset_subtract() to remove regions in r2 from r1.

Oh, you could have replaced the code in arch_iommu_hwdom_init() to
make use of this new helper.  I will prepare a patch now.

Regards, Roger.

