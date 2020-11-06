Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CD42A9960
	for <lists+xen-devel@lfdr.de>; Fri,  6 Nov 2020 17:23:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.20966.47086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kb4Vn-0007qk-Kk; Fri, 06 Nov 2020 16:22:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20966.47086; Fri, 06 Nov 2020 16:22:51 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kb4Vn-0007pr-HO; Fri, 06 Nov 2020 16:22:51 +0000
Received: by outflank-mailman (input) for mailman id 20966;
 Fri, 06 Nov 2020 16:22:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rw0I=EM=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kb4Vl-0007pZ-QG
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 16:22:49 +0000
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a5bef956-f499-4854-80e9-a767dea7f57c;
 Fri, 06 Nov 2020 16:22:48 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id 10so1227524wml.2
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2020 08:22:48 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id q7sm2156341wrg.95.2020.11.06.08.22.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 08:22:47 -0800 (PST)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=rw0I=EM=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kb4Vl-0007pZ-QG
	for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 16:22:49 +0000
X-Inumbo-ID: a5bef956-f499-4854-80e9-a767dea7f57c
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id a5bef956-f499-4854-80e9-a767dea7f57c;
	Fri, 06 Nov 2020 16:22:48 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id 10so1227524wml.2
        for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2020 08:22:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=KG2zUBmP7kZXhXDNWYXvcoA06zpbsQshPoKcnzmqQRc=;
        b=TFAdEYGNza0esXidyXMUcff/KLc82Oj/mH5NGvy6vFoDkWKGw/KT5UHfN95oq+5Qws
         dx9M1G2el7f6Xy0+d7V72RPOFJnQGJ1f6riWjIeTYVFbV0AQSdF4GoULGopWBeB7sOwF
         iVG5ZvG62thLF7idxOI2knUSvFHi6rVHrLlgrKWaIAlBjKSjq5fr+o9XaD/lpjzGNhOs
         n+pcr8v4SzCAEFNVhKhmc6TSlWD0Pf+3bHT9DaZgwLraPOqDBfnZQeH/07NGPwCX0ZkV
         AT80/zy1vCD8uCABHG1nzwVrLsDh7+j3EsdHCJ0MFzkmeyODW9GRR6s3JuenzwTYwV0S
         ewgg==
X-Gm-Message-State: AOAM531jfpiQDjQz5IUnPuqb6yHepbAkYz1B2XvP7mlIIqYwG9geM8bs
	RwEUmJDUCQl+T/YXCslkjYE=
X-Google-Smtp-Source: ABdhPJwJWPI1M4JHxT5nzYrE0pPJbNbkhTX/x0v/qvfL3kWLS8SQd/HUc1M5Dl/05wptqSIPC2FG1Q==
X-Received: by 2002:a7b:cb46:: with SMTP id v6mr384280wmj.146.1604679767955;
        Fri, 06 Nov 2020 08:22:47 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id q7sm2156341wrg.95.2020.11.06.08.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 08:22:47 -0800 (PST)
Date: Fri, 6 Nov 2020 16:22:46 +0000
From: Wei Liu <wl@xen.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH v1] tools: add readv_exact to xenctrl
Message-ID: <20201106162246.vmehbvecfqu4ewta@liuwe-devbox-debian-v2>
References: <20201028144151.2766-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201028144151.2766-1-olaf@aepfle.de>
User-Agent: NeoMutt/20180716

On Wed, Oct 28, 2020 at 03:41:51PM +0100, Olaf Hering wrote:
> Read a batch of iovec's.
> 
> In the common case of short reads, finish individual iov's with read_exact.
> 
> Signed-off-by: Olaf Hering <olaf@aepfle.de>

I see your series, so I will drop this one and go over that series
instead.

Wei.

