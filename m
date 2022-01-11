Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 452CE48AF7B
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 15:26:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255748.438351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7I65-00071M-6Z; Tue, 11 Jan 2022 14:26:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255748.438351; Tue, 11 Jan 2022 14:26:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7I65-0006zH-3b; Tue, 11 Jan 2022 14:26:01 +0000
Received: by outflank-mailman (input) for mailman id 255748;
 Tue, 11 Jan 2022 14:25:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xvmG=R3=gmail.com=wei.liu.xen@srs-se1.protection.inumbo.net>)
 id 1n7I63-0006z8-Fm
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 14:25:59 +0000
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64f56803-72ea-11ec-9ce5-af14b9085ebd;
 Tue, 11 Jan 2022 15:25:58 +0100 (CET)
Received: by mail-wr1-f54.google.com with SMTP id k30so15712923wrd.9
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jan 2022 06:25:58 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id r11sm10321532wrz.78.2022.01.11.06.25.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 06:25:57 -0800 (PST)
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
X-Inumbo-ID: 64f56803-72ea-11ec-9ce5-af14b9085ebd
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1Uer6CTYRWwpViw4ms4Jp1npKGiYs25zUXSNb5Ts5w4=;
        b=YgnDprobxQ8HGlEBO5ZD4A0xpaRW5SR3RN5FXD5VB4v+slhTpnrDbW2XOYlHihCSo2
         YHkxV1v/lUos6TpFE4ly+osxheCDB3ihBZHzSCThRSkCTo+7IwrY4vmf/cRUepj4IlC1
         tB0ubi1rzdfNvFLTA6TYyjNOH8RZXx1Oi+WIIz/8E3e+eoPYqjnCefHaut+sVHjmgD9O
         RlPxzq25NfMVomAYcymHmNnT45oYEqL1wGtMUdxS08AJI2Y/tQTOpcvrsW6sNi8/hM/b
         lhXxcdZJ6xNmZ9o0yifJkqgw5GqsJH/1p5h23ujv/nBgFu1/5iKfHc2aby5bdnU/nyQk
         Ap6A==
X-Gm-Message-State: AOAM531kICaEF8Nr+1aVunuWmDYr6b7+iP1x2oInnJRbiCyE7wez2obv
	D7wAwYwUr2Vs1kwxeNxk+Q0=
X-Google-Smtp-Source: ABdhPJxGfuHyGaoUG2BZFeyDN5UN8i/LGIKKk6QJmq7r+NBOS0Xq7inr6IAGtO6WraRoX5K9x7kwiQ==
X-Received: by 2002:adf:d0c2:: with SMTP id z2mr4020523wrh.335.1641911158085;
        Tue, 11 Jan 2022 06:25:58 -0800 (PST)
Date: Tue, 11 Jan 2022 14:25:56 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: SeaBIOS 1.15.0
Message-ID: <20220111142556.s3iblivgs34egxmy@liuwe-devbox-debian-v2>
References: <a072e1f9-3667-e0fd-038f-3492113729c6@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a072e1f9-3667-e0fd-038f-3492113729c6@suse.com>

On Tue, Jan 11, 2022 at 09:37:56AM +0100, Jan Beulich wrote:
> Wei,
> 
> iirc it was you who has been looking after our SeaBIOS use. Seeing that
> 1.15.0 was tagged, should we update the version we use by default? (I
> would have asked on irc, but I didn't see you there.)
> 

Yes, we should.

I will find some time to update it this week.

Sorry for the delay.

Wei.

> Jan
> 

