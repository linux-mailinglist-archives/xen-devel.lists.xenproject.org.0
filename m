Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0080664E6D0
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 06:01:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464137.722485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p62qX-00080A-3C; Fri, 16 Dec 2022 05:01:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464137.722485; Fri, 16 Dec 2022 05:01:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p62qX-0007xV-06; Fri, 16 Dec 2022 05:01:21 +0000
Received: by outflank-mailman (input) for mailman id 464137;
 Fri, 16 Dec 2022 05:01:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mn8i=4O=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1p62qW-0007xP-47
 for xen-devel@lists.xen.org; Fri, 16 Dec 2022 05:01:20 +0000
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [2607:f8b0:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac81a0b6-7cfe-11ed-91b6-6bf2151ebd3b;
 Fri, 16 Dec 2022 06:01:18 +0100 (CET)
Received: by mail-pl1-x635.google.com with SMTP id s7so1216783plk.5
 for <xen-devel@lists.xen.org>; Thu, 15 Dec 2022 21:01:18 -0800 (PST)
Received: from localhost ([122.172.87.149]) by smtp.gmail.com with ESMTPSA id
 b6-20020a1709027e0600b0018157b415dbsm537336plm.63.2022.12.15.21.01.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Dec 2022 21:01:16 -0800 (PST)
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
X-Inumbo-ID: ac81a0b6-7cfe-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y6sM3CLFx3Fy5uwyuAh2gtzya9yIGLD49kfG4h0dhkU=;
        b=OLj6YNkH4XWdDyTLCFZ4ciwvjd7oqmlpz1llI+SPHIq0PxRCkEUDAesLwdl1IB75/X
         zWvHaKwNAdOlPmUqBEzf5FStPKTqC6Ve7Ql+1HdoLx4i67nbc32QiMK3a0wBzfqlQ3Yi
         7Qvz8kMxYUXwaB4RIdaCyyVqhL1xGzJOC6xD7RNFSeN7r2si2aQ+YOBYUIHmEwB9tTYv
         mB5cUpq5W8yrHW4OYe8cqwhchFgLEC7M7AOu082n7kULhiAk0X6ykzGZz8T/REcNJzyW
         uSPHSApH37ty7cUnuNGrctxt3zNoo949ccKI9kecSFD7AB57A30/xOl38ri9u7n9pySt
         lo4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y6sM3CLFx3Fy5uwyuAh2gtzya9yIGLD49kfG4h0dhkU=;
        b=GYhwyBCcbYMMCTuZJtb49bhBC7ydyxploZZW2rIChePgtQhaWozx5Gs4iMpZUwhykz
         ZCR0scYf5SHpYTvIOdYS7TThq+I5toMWIZcoo5A5Fb5/7y8C9QFOOPLgL9tk4uyuj9fr
         3izS9L2Ydpajp8+udHGF8ynoWn970ORdJ2uNKw/SFwt3MNeEI0Uy9dwCI3sOMO/0oil4
         zuf6nbPhgtDtM9YCPDJ9+Y3tmpJNWdRBtBIMrojMrAp9gARVG7DcdpaYWNXvoGyUQlAW
         T7gVWGneh8KfvBZCPi/cUZ1ayrdRpOLOPNSmcF7thQT39HQFUDqE/ECGlxIHhXCMSou8
         wRnQ==
X-Gm-Message-State: ANoB5pmO+npPKh5A/hDxfS8p23GjQmZdyobN3d4F0ZK6Di3KMf4n4VfF
	K4Kf3gC/Z0HAoCxYHKVldEXhqg==
X-Google-Smtp-Source: AA0mqf6LADEdJ77G3Of0evmQpH68qE2zvSi/yzZG2oJro3xb8lLBGlCy1oMm8E6xvGYFHmuTYGKPPQ==
X-Received: by 2002:a17:902:6901:b0:185:441e:4cfa with SMTP id j1-20020a170902690100b00185441e4cfamr30673087plk.42.1671166877013;
        Thu, 15 Dec 2022 21:01:17 -0800 (PST)
Date: Fri, 16 Dec 2022 10:31:14 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xen.org" <xen-devel@lists.xen.org>,
	Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>,
	"osstest-admin@xenproject.org" <osstest-admin@xenproject.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	"stratos-dev@op-lists.linaro.org" <stratos-dev@op-lists.linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Mathieu Poirier <mathieu.poirier@linaro.com>,
	Mike Holmes <mike.holmes@linaro.org>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] libxl: virtio: Fix build error for 32-bit platforms
Message-ID: <20221216050114.7mtrlnsujrm7mbu7@vireshk-i7>
References: <aab5f13a-782b-cb4f-ac8d-321f865c8281@xen.org>
 <d4cf6539ff179e7ade820feadd8088f33da49196.1671111056.git.viresh.kumar@linaro.org>
 <Y5slue6ujqmCscJd@perard.uk.xensource.com>
 <b4c0e361-2b6a-f7b9-941d-4315144c6f65@suse.com>
 <e8988370-f838-dd23-729f-892561f54b58@citrix.com>
 <Y5tabu1WUgS6sTNq@perard.uk.xensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y5tabu1WUgS6sTNq@perard.uk.xensource.com>

On 15-12-22, 17:33, Anthony PERARD wrote:
> For those virtio one in particular, it's probably ok. libxl doesn't
> mind, and hopefully the consumer of those don't mind either.

FWIW, the consumer in this case, Rust based xen-vhost-frontent [1]
implementation, did break and I still need to fix it to read hex
properly :)

-- 
viresh

[1] https://github.com/vireshk/xen-vhost-frontend

