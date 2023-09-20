Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE3C7A8294
	for <lists+xen-devel@lfdr.de>; Wed, 20 Sep 2023 15:03:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.605718.943309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiwrN-0004TP-0S; Wed, 20 Sep 2023 13:03:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 605718.943309; Wed, 20 Sep 2023 13:03:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiwrM-0004QO-U1; Wed, 20 Sep 2023 13:03:16 +0000
Received: by outflank-mailman (input) for mailman id 605718;
 Wed, 20 Sep 2023 13:03:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w83i=FE=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1qiwrL-0004QI-L3
 for xen-devel@lists.xenproject.org; Wed, 20 Sep 2023 13:03:15 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f11d1c9-57b6-11ee-8789-cb3800f73035;
 Wed, 20 Sep 2023 15:03:14 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-32164a6af64so2058498f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 20 Sep 2023 06:03:14 -0700 (PDT)
Received: from leoy-huanghe (static-212-193-78-212.thenetworkfactory.nl.
 [212.78.193.212]) by smtp.gmail.com with ESMTPSA id
 cf21-20020a170906b2d500b009ad8d444be4sm9252230ejb.43.2023.09.20.06.03.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Sep 2023 06:03:13 -0700 (PDT)
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
X-Inumbo-ID: 0f11d1c9-57b6-11ee-8789-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695214994; x=1695819794; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=umEBqPbrvP0g0jC9qeLh6KG1xA0mXPS1YoVtY6Ta6lU=;
        b=MMVIunvwvUhl9L3WkTkHVpY9/JPwcTY0BFkAyV/VKLboIHPRX97jLpMpHxFrRapDOC
         uDsGWwie85Xv+vDNm4DNW8ljMAxc+4B0qjFieEqBERvb79ILPRr9oxbH1rdy3kFps4rR
         SUvWw+4DvOB1qoMVVQAZGwLt0TGbDLI3nT8z4KMGLtcGimD6n/ZIicRe27hZxImfQcwb
         Gge58UNCzrhMGi766ONPl04VnEWRnlyAmPTDjUNbJdMJjzsgYZbHTzObTWWj2SnJdMKY
         KD2LyJihoKvknAZacnDBVof9iG2vq0Ox/w0NL9e8QMGqIt6dcXuUJAWU0HvW/7E5WjQ/
         zxww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695214994; x=1695819794;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=umEBqPbrvP0g0jC9qeLh6KG1xA0mXPS1YoVtY6Ta6lU=;
        b=tblReJEYAMj3er6ljiLDVQ4gg4JffOoWGA1oYE00KSpYCMKbJqwegalqtBz1NW/vG4
         x9N1qhVcE50VOFMctjz1i302kwrAW3HmcphXcgfZr2VwLsRbelDR9cRxXI9K+banQ7YL
         cB9cDVPrRUzEx+ayOFb9yo4qaIm6sDlEkpR5b6HhfzZ6GdAp/baWZsYMVBcLPHdRibMm
         f4JIJtU4Z2I0qBM+tTGnroPW6HoTu2HXYxh/NnlAwKbFnyTQWpjxRApeFD0IMl+xxH3q
         6y1d9ahhVvA5vLIPziS/WqWzlA/CXn5sWt1/UYybIWIlbVQBnWiD8d+3T+ZlktB29ZrR
         mGlQ==
X-Gm-Message-State: AOJu0Yww4yj/vYNbVZ41s0iyHxe77S3PHoIlQF6soaRPxbuF6SqODFOd
	UL8t6CxmD53RaRM0iaziI8jR2Q==
X-Google-Smtp-Source: AGHT+IGPMZMEZqbYMgwf5SzzTa18y5nDAvg0As6HbOHDO+wgxN41BtTi67eb7TMrFcC61K2MIaojoQ==
X-Received: by 2002:adf:fac3:0:b0:309:1532:8287 with SMTP id a3-20020adffac3000000b0030915328287mr2333821wrs.19.1695214993840;
        Wed, 20 Sep 2023 06:03:13 -0700 (PDT)
Date: Wed, 20 Sep 2023 21:03:11 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Julien Grall <julien@xen.org>
Cc: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Henry Wang <Henry.Wang@arm.com>, Penny Zheng <penny.zheng@arm.com>
Subject: Re: RFC: arm64: Handling reserved memory nodes
Message-ID: <20230920130311.GB143839@leoy-huanghe>
References: <20230914081607.GA1400758@leoy-huanghe.lan>
 <23a0185e-428d-496b-96b6-d5082800bfd4@xen.org>
 <20230916081541.GA3291774@leoy-huanghe.lan>
 <561f8b9d-3877-4251-8cf7-7cdf313254bb@xen.org>
 <20230920100344.GA71044@leoy-huanghe>
 <6c59477f-d133-4cab-4f4e-afd8e710453c@amd.com>
 <6bfbf707-cfc8-4cf3-80d0-eeaba0e5865a@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6bfbf707-cfc8-4cf3-80d0-eeaba0e5865a@xen.org>

On Wed, Sep 20, 2023 at 11:36:24AM +0100, Julien Grall wrote:

[...]

> Can you confirm the version of Xen you are using?

For this question, I use a very new Xen repo with staging branch which
I git pulled at last week.

Thanks,
Leo

