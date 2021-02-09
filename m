Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 767863150FA
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 14:56:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83256.154462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9TUV-0006BB-J5; Tue, 09 Feb 2021 13:55:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83256.154462; Tue, 09 Feb 2021 13:55:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9TUV-0006Am-Fm; Tue, 09 Feb 2021 13:55:43 +0000
Received: by outflank-mailman (input) for mailman id 83256;
 Tue, 09 Feb 2021 13:55:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A1nq=HL=gmail.com=wei.liu.linux@srs-us1.protection.inumbo.net>)
 id 1l9TUT-0006Ah-OU
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 13:55:41 +0000
Received: from mail-wm1-f45.google.com (unknown [209.85.128.45])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d9a7ce4a-daa4-4d66-a8d9-2e576671d8ce;
 Tue, 09 Feb 2021 13:55:41 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id i9so3552968wmq.1
 for <xen-devel@lists.xenproject.org>; Tue, 09 Feb 2021 05:55:41 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id 2sm20140855wre.24.2021.02.09.05.55.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 05:55:39 -0800 (PST)
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
X-Inumbo-ID: d9a7ce4a-daa4-4d66-a8d9-2e576671d8ce
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XSnpm7/HVnmzb1rRaH6rhaurZgUv42UULqOJi/Beqao=;
        b=puuXZ4/U40TJLhXZkbAPZ9WxGgQQbz1YomO0h+O/apWZOhujuI9nCWfYT2bF3PTxk5
         Z60c2iJBw8qd6SKuFErSProTJwJmni+AjwLcoEfyO4cNCqT+GkmMH0GpXkOXdC1ezRTY
         FgXKL1hR88Oa9x/c0+J3x45m5+raNcQWW5zZ7BJdmpizy0R3r9muxKqSIltC9AxMXB76
         aKQDwXoh+UgvtV2EkjogWHFeIZ6r7tNNKzrNVTvjQ9IVDTOqNj75xnepUWvs6E4fQWy0
         zb6UzwP3xngN0HiyTH6Wk64V3Fu3R+gCPHgjAoRgQmNzjvQSvBt9vXAmiXB7O0a581Vx
         nPMA==
X-Gm-Message-State: AOAM531/X/TlFs3thHCOPEU7+u4vwKfyYPDt9WOsvIOvIgC2xqrL2mtg
	2GwehSLzuMK1av50R4xjJvg=
X-Google-Smtp-Source: ABdhPJwNB2giv7+CoyjHR4gxPw378n2meWhV1w/yKa2jvI06fXrZd3Z4dr3WdpEwpM4n3qwOnwgCXQ==
X-Received: by 2002:a1c:ab57:: with SMTP id u84mr3640970wme.115.1612878940148;
        Tue, 09 Feb 2021 05:55:40 -0800 (PST)
Date: Tue, 9 Feb 2021 13:55:38 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Jens Axboe <axboe@kernel.dk>, Wei Liu <wei.liu@kernel.org>,
	Paul Durrant <paul@xen.org>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 4/7] xen/events: link interdomain events to associated
 xenbus device
Message-ID: <20210209135538.ysr5pzxihvwxn22p@liuwe-devbox-debian-v2>
References: <20210206104932.29064-1-jgross@suse.com>
 <20210206104932.29064-5-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210206104932.29064-5-jgross@suse.com>
User-Agent: NeoMutt/20180716

On Sat, Feb 06, 2021 at 11:49:29AM +0100, Juergen Gross wrote:
> In order to support the possibility of per-device event channel
> settings (e.g. lateeoi spurious event thresholds) add a xenbus device
> pointer to struct irq_info() and modify the related event channel
> binding interfaces to take the pointer to the xenbus device as a
> parameter instead of the domain id of the other side.
> 
> While at it remove the stale prototype of bind_evtchn_to_irq_lateeoi().
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Wei Liu <wei.liu@kernel.org>

