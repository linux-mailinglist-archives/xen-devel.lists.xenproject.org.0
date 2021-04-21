Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E023668FA
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 12:14:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114298.217820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ9sh-0006mc-Mn; Wed, 21 Apr 2021 10:14:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114298.217820; Wed, 21 Apr 2021 10:14:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ9sh-0006lv-Hi; Wed, 21 Apr 2021 10:14:51 +0000
Received: by outflank-mailman (input) for mailman id 114298;
 Wed, 21 Apr 2021 10:14:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7+nN=JS=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1lZ9sg-0006lV-Ko
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 10:14:50 +0000
Received: from mail-wr1-f44.google.com (unknown [209.85.221.44])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a1f9d2be-64e6-4f47-a4b1-740723d5a36f;
 Wed, 21 Apr 2021 10:14:50 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id s7so40674548wru.6
 for <xen-devel@lists.xenproject.org>; Wed, 21 Apr 2021 03:14:49 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id q5sm1932610wmj.20.2021.04.21.03.14.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 03:14:49 -0700 (PDT)
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
X-Inumbo-ID: a1f9d2be-64e6-4f47-a4b1-740723d5a36f
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rscqqqafEZ0wmiro6Nr2SQsvJDHxFBSyux335cUB5WM=;
        b=Ft3XvhalsqNTKiREJAWJIfzu7FUBzV+U55wGVDaxfIPsDd9vcHjh+vppB27iVCZOq2
         /dPsEWzHZ0gu64dyI/EvveZl+l1USGx+rjSTzch8gxsiaxyjNg+7MpyEQQpNokJmaJKe
         0szzUcvQJTjvoS+sLkQazd88cqKOnYtRspzaBfx5JiE9x09e3yIBne/6OzJPR0pEnMHv
         2GAlkJljVNr2w640mipj+AUioET4/ITdRTeeIjNHeEMyQb1ET06xjpMZB3+BZQCc1jiU
         fgQL1+3uDcYgxIlQdCosYPGymSBF+6j/YoO5x9Z4Htx0IhIrA2PFCt0FXTt/jaWzHjLm
         L7bw==
X-Gm-Message-State: AOAM531yMuCv8fL1QlpAfnqi0KK4hslbjzNOQeyN3SHsKHHS2RWASGg1
	JeyROhdt8HrBAxAvp608R/bXjhXPbug=
X-Google-Smtp-Source: ABdhPJwd+eZxc0Fq9U0dbAlxC8WAX21JjDO09+P6jaQqxTxq6XECmoWfZ2r4N2N3jmuXHddlNLxYyA==
X-Received: by 2002:adf:fec5:: with SMTP id q5mr26418214wrs.168.1619000089249;
        Wed, 21 Apr 2021 03:14:49 -0700 (PDT)
Date: Wed, 21 Apr 2021 10:14:47 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 4/6] tools/libs: move xc_resume.c to libxenguest
Message-ID: <20210421101447.gvhhkj2xiegmhwt7@liuwe-devbox-debian-v2>
References: <20210412152236.1975-1-jgross@suse.com>
 <20210412152236.1975-5-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210412152236.1975-5-jgross@suse.com>

On Mon, Apr 12, 2021 at 05:22:34PM +0200, Juergen Gross wrote:
> The guest suspend functionality is already part of libxenguest. Move
> the resume functionality from libxenctrl to libxenguest, too.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Wei Liu <wl@xen.org>

