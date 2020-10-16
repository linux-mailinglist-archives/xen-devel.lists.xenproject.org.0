Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EFA290642
	for <lists+xen-devel@lfdr.de>; Fri, 16 Oct 2020 15:27:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8081.21518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTPl1-0006ZG-So; Fri, 16 Oct 2020 13:26:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8081.21518; Fri, 16 Oct 2020 13:26:55 +0000
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
	id 1kTPl1-0006Yr-PJ; Fri, 16 Oct 2020 13:26:55 +0000
Received: by outflank-mailman (input) for mailman id 8081;
 Fri, 16 Oct 2020 13:26:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rWFt=DX=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kTPkz-0006Yj-MS
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 13:26:53 +0000
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 72b34579-4f43-4b23-b5ab-7d7d8df22896;
 Fri, 16 Oct 2020 13:26:52 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id q5so3006463wmq.0
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2020 06:26:52 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id v6sm2904715wmj.6.2020.10.16.06.26.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 06:26:51 -0700 (PDT)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=rWFt=DX=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kTPkz-0006Yj-MS
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 13:26:53 +0000
X-Inumbo-ID: 72b34579-4f43-4b23-b5ab-7d7d8df22896
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 72b34579-4f43-4b23-b5ab-7d7d8df22896;
	Fri, 16 Oct 2020 13:26:52 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id q5so3006463wmq.0
        for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2020 06:26:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7IbjvTI1eR/IAMivLeDmCbKLKTYNQtvDuViSY0ATWE4=;
        b=fjg8bb34elL+F6znlQ21qekwQDswOKjVbIu6jJ7rySSU3Tg/tayVQbRF/xr5tPd4ue
         xUzKrVFOw6b8EPI3oI7vayQ6lT4ujrsoEAHwfV4tlYEhCxC9SPdhl/GB11nRkhj/08Jp
         1ViUp8vTpzrevyQRoDE2MAk13xa+mD2rhmNr0jKfzSiOJh5Xt8rYo2xEVwYKnl91XkI3
         /ZM4QSrKD5IjRhddfCc0ow4UIevSZJzuVJFTHLV0mhgNtNBYze6lmFF6o2ht5OHUtdNO
         OJgVzbxu+YW1SwO7382Udxu+fNGzK7ocRgWC42IVTaRsWXmOdB8lQHWdDu5AFk+WExFv
         2g8g==
X-Gm-Message-State: AOAM533m44g5XJjHBfx4NNbHWe/UvLWdOfIpqxZNuf0311/u3BYZ/Uei
	aVwp8sVBV9K5m5aYBXUibFZ2UxTIGNI=
X-Google-Smtp-Source: ABdhPJyYU4prEnXJhzuHB63Y/JTgeEvOaLwg6FILHVLLLc0V19dug6gruuuHoLlzJEf87fRxKMpn/w==
X-Received: by 2002:a7b:cf26:: with SMTP id m6mr3753963wmg.71.1602854811762;
        Fri, 16 Oct 2020 06:26:51 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id v6sm2904715wmj.6.2020.10.16.06.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 06:26:51 -0700 (PDT)
Date: Fri, 16 Oct 2020 13:26:49 +0000
From: Wei Liu <wl@xen.org>
To: Ian Jackson <iwj@xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] tools/gdbsx: drop stray recursion into tools/include/
Message-ID: <20201016132649.3ib7wiyucbukmvxo@liuwe-devbox-debian-v2>
References: <ece6c5c2-43f8-36d2-370c-37d988baeb87@suse.com>
 <24456.19422.318790.279648@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24456.19422.318790.279648@mariner.uk.xensource.com>
User-Agent: NeoMutt/20180716

On Thu, Oct 15, 2020 at 02:17:18PM +0100, Ian Jackson wrote:
> Jan Beulich writes ("[PATCH] tools/gdbsx: drop stray recursion into tools/include/"):
> > Doing so isn't appropriate here - this gets done very early in the build
> > process. If the directory is mean to to be buildable on its own,
> > different arrangements would be needed.
> > 
> > The issue has become more pronounced by 47654a0d7320 ("tools/include:
> > fix (drop) dependencies of when to populate xen/"), but was there before
> > afaict.
> > 
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>

I tried to applied this one but git didn't like it.

Jan, feel free to apply it yourself.

Wei.

