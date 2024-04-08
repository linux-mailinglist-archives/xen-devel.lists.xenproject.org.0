Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB55D89BBAD
	for <lists+xen-devel@lfdr.de>; Mon,  8 Apr 2024 11:29:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701865.1096450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtlJR-00024r-Fj; Mon, 08 Apr 2024 09:29:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701865.1096450; Mon, 08 Apr 2024 09:29:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtlJR-000235-Bq; Mon, 08 Apr 2024 09:29:13 +0000
Received: by outflank-mailman (input) for mailman id 701865;
 Mon, 08 Apr 2024 09:29:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=djzs=LN=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rtlJQ-0001qD-9s
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2024 09:29:12 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7487bb62-f58a-11ee-a1ef-f123f15fe8a2;
 Mon, 08 Apr 2024 11:29:10 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-41691fbb392so142885e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Apr 2024 02:29:10 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 u22-20020a05600c139600b004162b4c6366sm12713981wmf.20.2024.04.08.02.29.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Apr 2024 02:29:09 -0700 (PDT)
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
X-Inumbo-ID: 7487bb62-f58a-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1712568550; x=1713173350; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D1aATWkcOYzd3YjpfZqd3Nql7lZCrsprpW65uWr7PLY=;
        b=G/vx8V1Umu05xCcEviBjhO/584sOKumdryjjvxdqfdafNsqM5uXRI0847kqq3bKLvI
         4zkGrDOebCUjk7u6ICGioA3wJ0toW0wZwd5Lg+iOMW3Xnww5SvF6iV9cNKM9GcLVQWdJ
         XMeEJiSPPANaM6VFgiaXqvKzTCyztJOjq00YA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712568550; x=1713173350;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D1aATWkcOYzd3YjpfZqd3Nql7lZCrsprpW65uWr7PLY=;
        b=c/bvH1O6QHqdipRwEF5QkHjC796KGEb8yNB4cOFd+4RldL29Ik1kD3jCdC9BP4WjDg
         j++SqYH2MNfdR0kopMLgmTeGuvu1opTssC8Yyn8zf5+dwo99JvaXvAyhGRpAtP5r6slS
         HjwlOOjmbgVjgsglw48Velfb7+l39NpF6kfHSwB+3eMrPLgi72EYfJWkFNcwpmbWiTin
         ivTE7syJMbS0LujUcPuVdKQZ5yrq62Rp9bviEjCTnwLS/kBGzbLJhpixeTkvNNaJz72V
         //DrBWEIGBMw3fcyYavM5o+EwtUyewPtPE6bi0BG+3Vcc1CfXpUR1gaHQzu2D4Tjl95g
         IOGQ==
X-Gm-Message-State: AOJu0YzUtiqViQEyNyUpCnVTaLx7YWZSUg1QZU+6t3rvnkmq12Z8+d6t
	B2w1c5ntVfkGl+BqcAIHqXP8j+Y5mtPpk5Y68oa4+cEpdUey5FHH/5MgFFNb0iMapWzIC6AKFvm
	U
X-Google-Smtp-Source: AGHT+IHKHUGZTELl72V4MWHUR/qDU/v+QgHDgba7KFOdipvdH+kVQOIjYxd6L1j+cCWGL7k36MgKsg==
X-Received: by 2002:a05:600c:a4a:b0:416:442a:6d23 with SMTP id c10-20020a05600c0a4a00b00416442a6d23mr2992321wmq.8.1712568549910;
        Mon, 08 Apr 2024 02:29:09 -0700 (PDT)
Date: Mon, 8 Apr 2024 10:29:08 +0100
From: Anthony PERARD <anthony.perard@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [OSSTEST PATCH 00/36] Switch to Debian Bookworm
Message-ID: <0f89a920-c834-4a51-9b53-8e94ba7e3664@perard>
References: <20240318165545.3898-1-anthony.perard@citrix.com>
 <93b8a3e8-2866-42ca-9132-1527d82928e9@perard>
 <f178e1fb-0b6f-4312-a483-b85f413db025@perard>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f178e1fb-0b6f-4312-a483-b85f413db025@perard>

On Fri, Apr 05, 2024 at 04:54:30PM +0100, Anthony PERARD wrote:
> On Thu, Mar 28, 2024 at 05:54:04PM +0000, Anthony PERARD wrote:
> > On Mon, Mar 18, 2024 at 04:55:09PM +0000, Anthony PERARD wrote:
> 
> I've now pushed
> "production-config: Set Bookworm's debian-installer version"
> 
> and these two:
> 
> > >   Switch to Debian Bookworm as default suite
> > >   make-hosts-flight: default to bookworm
> 
> osstest should start to use Debian Bookworm soon.

osstest failed it's own push gate, I didn't notice that the Arm* builds
was still using an old kernel (from our linux-arm-xen branch) instead of
6.1. So I've rewind this push and pushed an other fix instead:
https://lore.kernel.org/xen-devel/20240408092542.36711-1-anthony.perard@citrix.com/

Cheers,

-- 
Anthony PERARD

