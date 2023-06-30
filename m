Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F7C7437AD
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jun 2023 10:44:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557375.870669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qF9ja-0001wn-17; Fri, 30 Jun 2023 08:44:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557375.870669; Fri, 30 Jun 2023 08:44:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qF9jZ-0001uC-TI; Fri, 30 Jun 2023 08:44:05 +0000
Received: by outflank-mailman (input) for mailman id 557375;
 Fri, 30 Jun 2023 08:44:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xqRh=CS=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1qF9jY-0001u2-Qe
 for xen-devel@lists.xen.org; Fri, 30 Jun 2023 08:44:04 +0000
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [2607:f8b0:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 437dc010-1722-11ee-b237-6b7b168915f2;
 Fri, 30 Jun 2023 10:44:03 +0200 (CEST)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1b80b343178so10354105ad.0
 for <xen-devel@lists.xen.org>; Fri, 30 Jun 2023 01:44:03 -0700 (PDT)
Received: from localhost ([122.172.87.195]) by smtp.gmail.com with ESMTPSA id
 n10-20020a170902d2ca00b001b3cac25f82sm10302271plc.139.2023.06.30.01.44.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jun 2023 01:44:01 -0700 (PDT)
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
X-Inumbo-ID: 437dc010-1722-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688114642; x=1690706642;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=povlhvs4UHlXNtVAhf3Lo76RsMYqdqmIBZ/BnrwgAxE=;
        b=iuh0qvxiDMpX5mzXu7+bpHFZw6/613yVwKfLV7LweQZOAWwuNYvYBAjG6A3jdgIBmA
         qbWEf4Apinwmy9QjlX0Gyjmu2inY42LOcMA3iBqF+fiOC6xqu7U2/BP8H45dabwZKEY0
         jsOF5t5iRUko0IZ9h022qRX5020gaYtJBLMVPcYq+w+McU0UJZ8bc6dxUQHKVaEhWQUJ
         sxq61kCR2N0R6FoYXFaJ3EPl5hgkd0ptpYawZRySC19hcO/5l1Zrvda4JcxpnHTAd4Nq
         0aih5p348or6BARnF7qhX5fGTGIXH6QFraXRDzNYPXz+ovHQY3+2gD1Dm9+FtocqcRup
         B/8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688114642; x=1690706642;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=povlhvs4UHlXNtVAhf3Lo76RsMYqdqmIBZ/BnrwgAxE=;
        b=bHFXt70erCoQB/tdO8mPnKOAj5Cl8lNbt7qUwbgruyrP7f3vQGKg2CO0AajCzVkLZx
         eUcGrTcIEForFwPBCVA3NIx6TKeSL2R4kt9R2svNUU0vEuQPZcJRQhsHA9vUJvCaVt9V
         ehxecll4si8xiwVzMIxNEIseQAxXZj7U8p1vOtDi2ktKEAfIc1B8o4l2ij/Hr8i+wDO4
         ubdYDygixc068eOZz9O0cUFdc6P3LaGjjYtuE6Nh5qf4X8cDjv+J8aljHHpNNRi6fCB0
         g85ZeC51uinzuN7s4Txa/ToQ5Gee23WBuKWwQ23cIzNi2ex4he+wcJiUI04N/udYhNrp
         S1TQ==
X-Gm-Message-State: ABy/qLYyqGshdEH1ISjQ7FS++PK8GPKve94+DRoFVd1reBIq609yMAcI
	8vn3SIe6iT7jzEMyBM193VnbBQ==
X-Google-Smtp-Source: APBJJlHmnHXMgzgIcMK+Fd20ECvaWJKKhakfftqB1jw6XxVAUyixvQj7aSjkcrWhsmOYOXnGiI03WA==
X-Received: by 2002:a17:902:da92:b0:1b7:e646:4cc4 with SMTP id j18-20020a170902da9200b001b7e6464cc4mr1223815plx.28.1688114641694;
        Fri, 30 Jun 2023 01:44:01 -0700 (PDT)
Date: Fri, 30 Jun 2023 14:13:58 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Julien Grall <julien@xen.org>
Cc: George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@ainfosec.com>, xen-devel@lists.xen.org,
	Juergen Gross <jgross@suse.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.com>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>,
	Erik Schilling <erik.schilling@linaro.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH V3.1] libxl: arm: Add grant_usage parameter for virtio
 devices
Message-ID: <20230630084358.t3gxdei6g26az6x5@vireshk-i7>
References: <0e347b2f4817cc578a5f8e41bf70503ae8cf69e3.1685684586.git.viresh.kumar@linaro.org>
 <7a0afe5aebba4c0b5be43a517dedf41d4e4ddd57.1686636036.git.viresh.kumar@linaro.org>
 <ecf753b0-3ccd-461a-925a-f3bac49dd269@perard>
 <20230630044032.khorme7rnlgzvl2u@vireshk-i7>
 <8c0a5345-833c-281b-b4f5-59b335e730ab@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c0a5345-833c-281b-b4f5-59b335e730ab@xen.org>

On 30-06-23, 09:40, Julien Grall wrote:
> The patch is missing an ack from the golang maintainers. I noticed you
> didn't CC them (done now).

Ahh, thanks.

> In the future, I would suggest to use one of the scripts in the repo to find
> the appropriate maintainers:
>  * scripts/get_maintainers.pl: It will output the list of maintainers
>  * scripts/add_maintainers.pl: It will add the maintainers for each
>    patch files in a given directory.

Right.

-- 
viresh

