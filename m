Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E53F32EAA36
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 12:53:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61824.108944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwkt9-0007Yz-On; Tue, 05 Jan 2021 11:52:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61824.108944; Tue, 05 Jan 2021 11:52:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwkt9-0007Ye-Lb; Tue, 05 Jan 2021 11:52:35 +0000
Received: by outflank-mailman (input) for mailman id 61824;
 Tue, 05 Jan 2021 11:52:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=apNQ=GI=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kwkt8-0007YZ-AZ
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 11:52:34 +0000
Received: from mail-wm1-f50.google.com (unknown [209.85.128.50])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5aff6320-cf35-46f7-8a60-c232eeb20448;
 Tue, 05 Jan 2021 11:52:33 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id c124so2747038wma.5
 for <xen-devel@lists.xenproject.org>; Tue, 05 Jan 2021 03:52:33 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id h9sm93478341wre.24.2021.01.05.03.52.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 03:52:32 -0800 (PST)
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
X-Inumbo-ID: 5aff6320-cf35-46f7-8a60-c232eeb20448
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=iXMZQqC3MWhXakssXiIdIkdQQ27BtAhcCJTwYDB0i40=;
        b=YS9PHtBY2FcoMGXV9gwmJN0Q6v5uZC1k82pKodjSXDo5SdUi36wYAy4YCFC7WRPYgz
         1pRNoCwybtChcQg28FrhbP8piq0GrlRe91dTWWkWbmuwK4Mu/fZc0MNDfKuhw2zNtjCw
         JuOojoj7N3UQf+iDoIteMYnhreVaIV6U6pjIVUqi2WslOlHv59y0ytKZq6WGdy1FmQ5N
         wl5rD7jMsQN86lzq5DVDMEbSZ1qmILQXjqVgFLABHYZtWSx841VdAifDb/1RFbctNbuY
         uM6iSUHVoX+Z82+JDXVuOrpurJpqps2wdBHJG6BqpYSaP7yiyK2Ee5YydX3s+JVSw4zo
         kz+w==
X-Gm-Message-State: AOAM530bvLHSCqkgX1p9STJDfonRfsczAZ5CC9OUylzlI96jg6S+vMRq
	u7bph7JMoELdATzGQurnYSw=
X-Google-Smtp-Source: ABdhPJye2NAJnpULgvhW7y7NdJqUg3XCGq368flTojUGM6CMYk91BjyOi6GShI6QlnKS+upqpV3HCA==
X-Received: by 2002:a1c:2e88:: with SMTP id u130mr3123385wmu.83.1609847552813;
        Tue, 05 Jan 2021 03:52:32 -0800 (PST)
Date: Tue, 5 Jan 2021 11:52:30 +0000
From: Wei Liu <wl@xen.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH 0/2] libs: implement some missing functions on FreeBSD
Message-ID: <20210105115230.fxp2eiyay77e4s3p@liuwe-devbox-debian-v2>
References: <20210105102546.88462-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210105102546.88462-1-roger.pau@citrix.com>
User-Agent: NeoMutt/20180716

On Tue, Jan 05, 2021 at 11:25:44AM +0100, Roger Pau Monne wrote:
> Add support for dm_op, restrict and map resource ioctls on FreeBSD.
> 
> Roger Pau Monne (2):
>   libs/foreignmemory: implement the missing functions on FreeBSD
>   libs/devicemodel: add dm_op support for FreeBSD

Acked-by: Wei Liu <wl@xen.org>

