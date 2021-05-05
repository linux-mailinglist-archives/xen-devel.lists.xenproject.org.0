Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A083739AA
	for <lists+xen-devel@lfdr.de>; Wed,  5 May 2021 13:47:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123034.232112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leFzZ-0003ki-F3; Wed, 05 May 2021 11:47:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123034.232112; Wed, 05 May 2021 11:47:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leFzZ-0003i4-BI; Wed, 05 May 2021 11:47:01 +0000
Received: by outflank-mailman (input) for mailman id 123034;
 Wed, 05 May 2021 11:46:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Xmi=KA=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1leFzX-0003hy-Db
 for xen-devel@lists.xenproject.org; Wed, 05 May 2021 11:46:59 +0000
Received: from mail-wm1-f49.google.com (unknown [209.85.128.49])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4fa12e28-e515-4361-91f8-a1cc8d2861e8;
 Wed, 05 May 2021 11:46:58 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso3236712wmh.4
 for <xen-devel@lists.xenproject.org>; Wed, 05 May 2021 04:46:58 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id a15sm18874106wrr.53.2021.05.05.04.46.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 04:46:57 -0700 (PDT)
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
X-Inumbo-ID: 4fa12e28-e515-4361-91f8-a1cc8d2861e8
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PBdsPUy4DRPAzZuVsLYDfVk9sY5Ky4uTdfEw+XMXhSI=;
        b=Fw+j79j6XeLkAHNw+dx8WUtyrxa56hzqE29lK9gLqt75qgcePabqNIj7sEIi3+7gZ0
         MOoT1GsSjvyPzLlHTo825JAAXCzG1/nd86asep+Ry3IbuD2ObIVn5T9arWHqQWuBT1hz
         tK0tgRMsyLAxmKruIccNp7i+0obuMQJpD5DXsCbXWSS1k4o6O3CqiUByMakiSBEXOLK1
         qf3hApv55rb2lHxNUyfrbeGcI5Lm2rCTwqpA2wlIH622W35cP3Ez3+lu2tfF4bPY8NFT
         EVl/UzP/GJ4GM/P9Mn82sGtgp5qMZYkgH3dtjlLbp98jpVcWkVa0QVp2ocrzdsA16L+y
         hbcg==
X-Gm-Message-State: AOAM5338zINrAmeoaBfzT7FCdYJQReaImn8OsssqRXC8gLmbvmZ+GW3j
	JC3g+p0MmgEZOoXE4+UMUz8=
X-Google-Smtp-Source: ABdhPJyU8OIY52MWZyxOw6ncxPZ0GYVaG8zTkh7cJh2GJqP/+sFlTELVApgmfey2wOdrH5aJLQfYSw==
X-Received: by 2002:a1c:b342:: with SMTP id c63mr9499069wmf.179.1620215217661;
        Wed, 05 May 2021 04:46:57 -0700 (PDT)
Date: Wed, 5 May 2021 11:46:55 +0000
From: Wei Liu <wl@xen.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH v2] xl: constify cmd_table entries
Message-ID: <20210505114655.ejblmjv3u4aq65ia@liuwe-devbox-debian-v2>
References: <20210504161436.613782-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210504161436.613782-1-anthony.perard@citrix.com>

On Tue, May 04, 2021 at 05:14:36PM +0100, Anthony PERARD wrote:
> Also constify cmdtable_len and make use of ARRAY_SIZE, which is
> available in "xen-tools/libs.h".
> 
> The entries in cmd_table don't need to be modified once xl is running.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> Reviewed-by: Julien Grall <jgrall@amazon.com>

Acked-by: Wei Liu <wl@xen.org>

