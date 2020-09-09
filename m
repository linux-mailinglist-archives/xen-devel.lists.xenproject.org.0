Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 053AC262DAE
	for <lists+xen-devel@lfdr.de>; Wed,  9 Sep 2020 13:11:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFxzw-0000I0-NN; Wed, 09 Sep 2020 11:10:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gZt3=CS=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kFxzv-0000Hv-PG
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2020 11:10:43 +0000
X-Inumbo-ID: fbe15f29-f557-4b3e-aa16-caa8197a01da
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fbe15f29-f557-4b3e-aa16-caa8197a01da;
 Wed, 09 Sep 2020 11:10:42 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id s13so1872284wmh.4
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2020 04:10:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=pXMPBPBXf5JMmXzavRqeNkc6FoXMrn7a4Ix2+gyqQjY=;
 b=KVeEv4WzxS6IRGtIl2qqnm+MWRSwfhlU3ucmTdc3LYj4kIUSpbtiCQ11IT3QzOxVoA
 93RTaP1pbuWLZE2Qvdw1MVM9OMTnBAACtZ1nxNzAyurm9E3LMe48cSLVWCaCZk5CS7cS
 EgY2Z3LAwBRn7fsvI2hbJ8yn0YwZNF8R+R39L7b5I8R8SlPpQ4Ns0W/4GKhtq8teRYKf
 phiNfhR99ePirR72euEw4KEvynOKj357FJNjVGu9eiQQW9MJ0B17yKxUXEA8kiUxdk3H
 OyiJT9QH5EkaRvhdLTrTdKtDMcrH9X61/mH0a5+XiLelweHQKOkRtkWa0mDhrjVLsZEG
 K6+A==
X-Gm-Message-State: AOAM532DUQGAPWXiQvW574e7fb698F9AcSUxxWo42tuEW80d0nLDRvfc
 U1HnMtv54+ZeUTr8yuVjD/I=
X-Google-Smtp-Source: ABdhPJxuzunEYc1KXuVlKV6pSCZ7bDiu/HSvBXbpTzT3ALmDsBTNN20oFKCKv2evYS/D2yM1/6pQ6g==
X-Received: by 2002:a1c:2cd7:: with SMTP id s206mr3163291wms.165.1599649841710; 
 Wed, 09 Sep 2020 04:10:41 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id f1sm3711357wrt.20.2020.09.09.04.10.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 04:10:40 -0700 (PDT)
Date: Wed, 9 Sep 2020 11:10:39 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Olaf Hering <olaf@aepfle.de>, xen-devel@lists.xenproject.org,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v1] libxc: use bitmap_alloc
Message-ID: <20200909111039.bgdxy5loqwzpnhym@liuwe-devbox-debian-v2>
References: <20200909095344.9462-1-olaf@aepfle.de>
 <9406261f-2c83-7208-726d-bdbacfffd8b9@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9406261f-2c83-7208-726d-bdbacfffd8b9@citrix.com>
User-Agent: NeoMutt/20180716
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Sep 09, 2020 at 11:01:19AM +0100, Andrew Cooper wrote:
> On 09/09/2020 10:53, Olaf Hering wrote:
> > Use existing helper to allocate a bitmap.
> >
> > Signed-off-by: Olaf Hering <olaf@aepfle.de>
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Wei Liu <wl@xen.org>

I've rebased pushed this patch to staging to save another round of
posting. Please check if there is any issue.

Wei.

