Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF34255FB6
	for <lists+xen-devel@lfdr.de>; Fri, 28 Aug 2020 19:29:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBiAO-0005Fi-8a; Fri, 28 Aug 2020 17:27:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YQLo=CG=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1kBiAM-0005Fd-HN
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2020 17:27:54 +0000
X-Inumbo-ID: 4c951a1c-a38a-466d-8af0-6a580704135f
Received: from mail-qv1-xf42.google.com (unknown [2607:f8b0:4864:20::f42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4c951a1c-a38a-466d-8af0-6a580704135f;
 Fri, 28 Aug 2020 17:27:53 +0000 (UTC)
Received: by mail-qv1-xf42.google.com with SMTP id e5so783727qvr.3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2020 10:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Q8v4k3oqOVOxKDMwE26PPdMxM+Hndox3ir7TAKV5ugc=;
 b=AudRx7DxPc4uUDliEC12wgiLeCv3pG9FLRIgheSOxzhbsDH6xXsBu3Mm2uSKuCKL8n
 fj60qoFP+IHWOb1in1SGbRIC3Srwq63ULEvYCYJEw7+NJA2fvtj7R9Cm5wPwg6QPGwTh
 x0lMF9cgVoG/nGMEigNig57G+ceSWZA3Qs1zQFLg8c07AJb8EvdQsF/bny1FxjmOEwEE
 PxjdbmV91zkhfsbpVHTxQv6jRUk1tgfzTDDmqvdYDNQpHlCJU/3i9hipHPdaug/GLPBt
 Z1raQeHUBeJO/X9tXftxtHb9MdgPA4WPcf/a4AJnWw0C+gF44joAJtB4n1LiAtuDwcCp
 HhPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Q8v4k3oqOVOxKDMwE26PPdMxM+Hndox3ir7TAKV5ugc=;
 b=XDDpVuyYD+GU+JWQj0NHrmdHRdB/h6lyS2eur90toGra3VNQoZTTRqZW+yt+HpTFQy
 DapAuDzOXpgU0oSM2+jjjEqd65xGaq1fhNg+979QW3ErVZNZouFVZQZPpgWIm9TxNSNl
 2TgHQYV70OrS/DmcBJM8la+5C+aSFC2ggAxvvWvUtwmBYiC2M6Pi7mdRA1/R1HpVl1gd
 rkeEoGIcXHgb8+dxX2YaW2utO8Vdj0hYP3rZc71Oyc0C/0xkxr4/tMFNrlkvkvh7hJFy
 2gygJZ2Qvtb3RHXdVVO8LpDgH5izUoU6XsC7ekYq9OAW5HUHHJxF9RCsAH0+t0Co22u6
 0xMg==
X-Gm-Message-State: AOAM531KLzXGQzhJBxR2yvBtVNaPQAvX77OHojpISLb5XJGWTg86C3sv
 XlEkB67/HrgFHb7GGC0ftrk=
X-Google-Smtp-Source: ABdhPJwoX0pIWb+k6TA/tq/uuQrHAOIx6D8fAQ2zh3xt8DfgwFw9KaRKGvxbjMkg+u01fsvBBvhazg==
X-Received: by 2002:a0c:ca86:: with SMTP id a6mr2876484qvk.209.1598635673190; 
 Fri, 28 Aug 2020 10:27:53 -0700 (PDT)
Received: from six (cpe-67-241-56-252.twcny.res.rr.com. [67.241.56.252])
 by smtp.gmail.com with ESMTPSA id g13sm1261921qki.62.2020.08.28.10.27.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 28 Aug 2020 10:27:52 -0700 (PDT)
Date: Fri, 28 Aug 2020 13:27:47 -0400
From: Nick Rosbrook <rosbrookn@gmail.com>
To: George Dunlap <george.dunlap@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Nick Rosbrook <rosbrookn@ainfosec.com>,
 Ian Jackson <ian.jackson@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] Revert "libxl: Generate golang bindings in libxl
 Makefile"
Message-ID: <20200828172747.GA22067@six>
References: <20200828163054.1981275-1-george.dunlap@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200828163054.1981275-1-george.dunlap@citrix.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

On Fri, Aug 28, 2020 at 05:30:54PM +0100, George Dunlap wrote:
> This reverts commit 60db5da62ac051aab0b217fa2d96acca1cd3ca3e.
> 
> This is in preparation for the planned move to hosting the xenlight
> package in a separate repo.
> 
> This also fixes a regression when building with a read-only source and
> an out-of-tree build.
> 
> Signed-off-by: George Dunlap <george.dunlap@citrix.com>

Acked-by: Nick Rosbrook <rosbrookn@ainfosec.com>

