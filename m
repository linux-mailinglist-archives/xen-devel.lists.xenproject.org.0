Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E62F6AB0F07
	for <lists+xen-devel@lfdr.de>; Fri,  9 May 2025 11:32:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.979993.1366482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDK57-0006fD-Ao; Fri, 09 May 2025 09:31:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 979993.1366482; Fri, 09 May 2025 09:31:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDK57-0006cQ-7o; Fri, 09 May 2025 09:31:49 +0000
Received: by outflank-mailman (input) for mailman id 979993;
 Fri, 09 May 2025 09:31:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eMqf=XZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uDK55-0006cK-C4
 for xen-devel@lists.xenproject.org; Fri, 09 May 2025 09:31:47 +0000
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [2607:f8b0:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a19a9ea-2cb8-11f0-9ffb-bf95429c2676;
 Fri, 09 May 2025 11:31:42 +0200 (CEST)
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-b200178c011so1263990a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 09 May 2025 02:31:42 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-22fc7546a09sm13317925ad.9.2025.05.09.02.31.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 May 2025 02:31:40 -0700 (PDT)
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
X-Inumbo-ID: 6a19a9ea-2cb8-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746783101; x=1747387901; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QbGqDK74WFhvNDyVgy+vdd9sc2MXt4tWVR9or+eFH0g=;
        b=iOEgInnZ2A5+NSVZw4wMH1rMJ5nU3XUiDfnHg5SLSuJqkcH7Ra3lXVekgxxDHFE3LG
         X0xjUZ1iljbrT02MLQJv4ruCD1Sp9Cot2B2tzORwmEGEgwjfVXuiVNwAhlttoKHynmBU
         ucHxjKPnyferUxPGiDkbkp0xyBUQiv4eAP/0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746783101; x=1747387901;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QbGqDK74WFhvNDyVgy+vdd9sc2MXt4tWVR9or+eFH0g=;
        b=M3qf+UKuhb5X+ojqGz07sv1pXiHPKSkGjoF0Zh44dGIKU//DAhSxKGBq8L38rYlGF4
         WPYbjcuWnQ43wz4B5snr+Y5okLtuKvRjyVSVT9gxQXXSr99cne1q0vuW+UeySI92xfx5
         PoB7E0OcCuCfU8T9nWMSPsZ9TEiJO+IRER0FJzQPbfUrm4J4c4pUUqqpIPSM5IKCfTgQ
         pixpPqSIh+znpaFJ1Iqyg17nigKIy6Q7vyWiwyNmddfRHzYFJbU0Y/xiNdr5dAtKvM6j
         4/SqabVWpy7yCkkCl9102KU0ww5bzRUAArmWccILhFbpHHPDomsfq1EYj37duQuRH4v9
         ywxA==
X-Gm-Message-State: AOJu0YzwXMTZkqEk4BF9NQ9G+QYgV8AQxv4Lq5ldF1+3D4JlXAvU7MoH
	7m7b578oGm9avP3W484d9QCo2X6/4WS+sZiuAJbgJmB0HhTf4EMiFB44Rhd9c7M=
X-Gm-Gg: ASbGncu03APg31qTreXLY4OtFU8oEbJ3Oz2KPtgsDy1kiQsa0TVGt4ji0dUGx2IqwF9
	jA+emwYBCelhClj6vt/4nj0huhyN4DDowjuwlBrt/ktvXptQHQkYR2B6Ey9UAzLl44cHDxz/mYz
	T8nUKvI3tzyrm93gtMbB/1Pvbcghkn33652oHG37DQ7Gfob0dvr4NnBmpWYouyyWs+pi2UMi0zX
	Un+h72SvG+WzOYblJ3Qoy+8wHgS9NoAzSJeFt7jdI4o7hQaegi5JzLVfk3E6M9Bwj/kFkRd6Ou9
	RArnf9l+k7dPjsljxlHyug4Pik5AiVwxAfkr4S5B14IXwEWJL5Up39GN
X-Google-Smtp-Source: AGHT+IFdcGSdxmIPUcRPk93A6dYeyzKCfFuJZh7brYMlrcvS1mPwgv0DBJxdWStjeXnjm+MfX8OmIQ==
X-Received: by 2002:a17:902:ced0:b0:223:f9a4:3fa8 with SMTP id d9443c01a7336-22fc8b35b38mr42658415ad.19.1746783100681;
        Fri, 09 May 2025 02:31:40 -0700 (PDT)
Date: Fri, 9 May 2025 11:31:35 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jiqian Chen <Jiqian.Chen@amd.com>,
	Mykyta Poturai <Mykyta_Poturai@epam.com>
Subject: Re: [PATCH v21 2/2] vpci: translate virtual PCI bus topology for
 guests
Message-ID: <aB3Ld3Lia7KXh3t4@macbook.lan>
References: <20250508104608.531079-1-stewart.hildebrand@amd.com>
 <20250508104608.531079-3-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250508104608.531079-3-stewart.hildebrand@amd.com>

On Thu, May 08, 2025 at 06:46:07AM -0400, Stewart Hildebrand wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> There are two originators for the PCI configuration space access:
> 1. The domain that owns physical host bridge: MMIO handlers are
> there so we can update vPCI register handlers with the values
> written by the hardware domain, e.g. physical view of the registers
> vs guest's view on the configuration space.
> 2. Guest access to the passed through PCI devices: we need to properly
> map virtual bus topology to the physical one, e.g. pass the configuration
> space access to the corresponding physical devices.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

There's the addition of the ASSERTs in vpci_mmio_{read,write}() which
could do with an ARM maintainer Ack/RB.

Thanks, Roger.

