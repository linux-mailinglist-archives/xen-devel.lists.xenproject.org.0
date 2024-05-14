Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5DF8C4DA0
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 10:21:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721224.1124474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6nPJ-00074z-2W; Tue, 14 May 2024 08:21:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721224.1124474; Tue, 14 May 2024 08:21:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6nPI-00073g-VL; Tue, 14 May 2024 08:21:08 +0000
Received: by outflank-mailman (input) for mailman id 721224;
 Tue, 14 May 2024 08:21:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PE3g=MR=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s6nPH-0006V6-N7
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 08:21:07 +0000
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [2607:f8b0:4864:20::f35])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e6b5b63e-11ca-11ef-b4bb-af5377834399;
 Tue, 14 May 2024 10:21:03 +0200 (CEST)
Received: by mail-qv1-xf35.google.com with SMTP id
 6a1803df08f44-69b59c10720so26600506d6.3
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 01:21:04 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6a15f1ff4f2sm51205216d6.134.2024.05.14.01.21.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 May 2024 01:21:03 -0700 (PDT)
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
X-Inumbo-ID: e6b5b63e-11ca-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715674864; x=1716279664; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GIMBNJDqAwbir+r9DLchpcuwfLcGZ29LEOsj57pQAcM=;
        b=Q16WWkC8N6njOrqxAUT+gV7wAPokNtqsF/mXmVkmafwGF/GfrY+WEuUqdXL28NjN0H
         o/C0gtOs6XH2xsKIlYnKTOpj/Sg1xUW0BticyF0WEHthohH4fwQzWWyX+YcHOPMez/cH
         TQi7xUj/fOKCb6tBEqYrGrN0uomm3cNc8CNOQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715674864; x=1716279664;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GIMBNJDqAwbir+r9DLchpcuwfLcGZ29LEOsj57pQAcM=;
        b=SOZLPvWUN6+sXobh8iv6vqKedz40k8HyFz3PjU9GROKxAxSc2jGMOHfSzD92UOepPX
         Li/dEvAK13yhxNRsWV4OZC7nkP+UbYyWG4TinJiIer1HYewmyen3GjHagb2jYs9PYuTG
         PcmLqvd8RHvQVwDeP/SR8KHRts2rOqLy9fi7tfDzesrVQpp2TMYyCvCT9WLDEbIiuxbh
         q/i4WxI6EdiB3xpTLdMoYevtfbK1PXeqftEIScAbQULrirL7byVY+GyUImW/+VumNUiC
         R0nL0s2KNz8J3/PL48c1z31wcsiUJLQm2EGozSl72xzXpdbkG4qusajzOLH4NWcSQC2r
         C51w==
X-Gm-Message-State: AOJu0Yw/5BhOl2E5PR3ehyl0mQhF7VSLj4IOvR54ZJN5pVL2FkX+mJ6o
	/geYT7YMZ+EvW4i2XqIBIxaqSUw4zTVGNVp44NOMjFpQpW2kS3ByVyPGCVxsg61nWC+Kjcn7z4T
	0
X-Google-Smtp-Source: AGHT+IEmpXF/rH4PMvzksUdWu+iUzOlbETi2ejGRE3LiQcWB6IUCegjFf+p0i229qLnS/iyiLoUIHw==
X-Received: by 2002:a05:6214:5b8a:b0:6a0:b905:97ba with SMTP id 6a1803df08f44-6a168213d8amr163333516d6.44.1715674863730;
        Tue, 14 May 2024 01:21:03 -0700 (PDT)
Date: Tue, 14 May 2024 10:21:01 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Elias El Yandouzi <eliasely@amazon.com>
Cc: xen-devel@lists.xenproject.org, julien@xen.org, pdurrant@amazon.com,
	dwmw@amazon.com, Wei Liu <wei.liu2@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Wang <wawei@amazon.de>, Hongyan Xia <hongyxia@amazon.com>,
	Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH V3 (resend) 04/19] x86: Lift mapcache variable to the
 arch level
Message-ID: <ZkMe7YxnpHdQ74R3@macbook>
References: <20240513134046.82605-1-eliasely@amazon.com>
 <20240513134046.82605-5-eliasely@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240513134046.82605-5-eliasely@amazon.com>

On Mon, May 13, 2024 at 01:40:31PM +0000, Elias El Yandouzi wrote:
> From: Wei Liu <wei.liu2@citrix.com>
> 
> It is going to be needed by HVM and idle domain as well, because without
> the direct map, both need a mapcache to map pages.

The idle domain is a PV domain, and so gets the mapcache already
initialized with the current code?

> 
> This commit lifts the mapcache variable up and initialise it a bit earlier
> for PV and HVM domains.

It would be good to write down why mapcache was only used for PV, so
to understand it is safe to use for HVM also.

> Signed-off-by: Wei Liu <wei.liu2@citrix.com>
> Signed-off-by: Wei Wang <wawei@amazon.de>
> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

