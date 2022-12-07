Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF1464532D
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 05:49:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455801.713373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2mML-0001GT-W2; Wed, 07 Dec 2022 04:48:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455801.713373; Wed, 07 Dec 2022 04:48:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2mML-0001D4-TG; Wed, 07 Dec 2022 04:48:41 +0000
Received: by outflank-mailman (input) for mailman id 455801;
 Wed, 07 Dec 2022 04:48:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QqWv=4F=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1p2mMK-0001Cy-Ec
 for xen-devel@lists.xen.org; Wed, 07 Dec 2022 04:48:40 +0000
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [2607:f8b0:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 69dba24d-75ea-11ed-8fd2-01056ac49cbb;
 Wed, 07 Dec 2022 05:48:38 +0100 (CET)
Received: by mail-pg1-x532.google.com with SMTP id f9so15231617pgf.7
 for <xen-devel@lists.xen.org>; Tue, 06 Dec 2022 20:48:38 -0800 (PST)
Received: from localhost ([122.172.87.149]) by smtp.gmail.com with ESMTPSA id
 u9-20020a17090a6a8900b00216df8f03fdsm212803pjj.50.2022.12.06.20.48.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Dec 2022 20:48:36 -0800 (PST)
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
X-Inumbo-ID: 69dba24d-75ea-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VKbc7XJkLbZ+Csl96s6Aj6/DqsZlncX1H3vjDvBAqTw=;
        b=BD4kjrqnCvm+Uyyrz+iyPYyM3+qdZtOSrNAIPVb9rYTlZNyd8hd365oOeRZMGaF01K
         A92XhrSfwhphkKBMVuSiLq62XrGHxSt2wFHv81oat5v2FtzbMns7E1Hj56Hn5nsjplSJ
         NbshQXwYMpJ8AOWl0JBIyPNrw3U0lTDVs5B7/Z/AZ/ZBviBr2vPwf+OZk6GUt46vMd6v
         SIGaUmE4P5ZYRovc/FQNWcz/ndqX73GWNNyp12ayYPCnA4UM8WIAJuxyo3L6Rji4/+V4
         rDZF7Ae4//4Pj376SVnwgk28xDs8uEuenyPZvNeSJY1HBhoaNQGP2MHj7by9UB3zQyxZ
         XjDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VKbc7XJkLbZ+Csl96s6Aj6/DqsZlncX1H3vjDvBAqTw=;
        b=g2Dnh5+C8kQJtrA2Uh93Ch27gbGBwvb/4QE4Osk5xXHzCnZgTYQe/sNQezbnTJAd9K
         j2m11nm9U/hzFQgVYSNbctwk3HLfGFqgk7lDgUxM7a5bRy47ROaE3BtZRVDeHps9EyQ9
         WB6HALvrph0pMU4ZpvctxQomPdEL01fUaecbz023XE9ZBKQcmfBep7p8r2lPObLpPP4L
         cLFfDeGDpZaGuZN2L2CqgHDNygogQKQqCqEWQXAlxmsoianqqX9MJ49tBR93RB98kCcO
         NPW577GT4POmrwNZrzTGfkM5FemjqDwPS40CXF8D5ahaaM0nVVc9t73NjoAvc6UpEFBm
         wudA==
X-Gm-Message-State: ANoB5pnjvgJdIu/GoJbEbX7U5PEefgmnQFn+YvemTFEZziNZMdo6sKXa
	Ggm++3/TTVlK8tkF6BcrqksSEA==
X-Google-Smtp-Source: AA0mqf7QJTLywMsCpgFR6ZeVou2SUOdfrPz1kG7D1TrjyGpt7BFevwAuCn07tzwIwC9Je7BQmCk6CQ==
X-Received: by 2002:a63:164f:0:b0:477:f9fa:2a1e with SMTP id 15-20020a63164f000000b00477f9fa2a1emr45821014pgw.87.1670388517153;
        Tue, 06 Dec 2022 20:48:37 -0800 (PST)
Date: Wed, 7 Dec 2022 10:18:34 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Mathieu Poirier <mathieu.poirier@linaro.com>,
	Mike Holmes <mike.holmes@linaro.org>, Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>, xen-devel@lists.xen.org,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH V6 3/3] docs: Add documentation for generic virtio devices
Message-ID: <20221207044834.ouqdev3z3ro2mh64@vireshk-i7>
References: <cover.1667906228.git.viresh.kumar@linaro.org>
 <24a0278313ea9a9e6c093880dead835184025734.1667906228.git.viresh.kumar@linaro.org>
 <4fbe5c89-4468-9ad4-e391-2f51ceaa5b67@gmail.com>
 <20221205091118.lttaot42hcidb7gj@vireshk-i7>
 <71a281c6-78df-a107-15e6-a06cd93413a6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71a281c6-78df-a107-15e6-a06cd93413a6@gmail.com>

On 06-12-22, 17:53, Oleksandr Tyshchenko wrote:
> On 05.12.22 11:11, Viresh Kumar wrote:
> > Maybe we can add these fields and a config param, once someone wants
> > to reuse this stuff for QEMU ?
> 
> 
> I don't know what to suggest here, sorry.
> 
> On the one hand, it is an extra work for you trying to add functionality you
> don't need at the moment. On the other hand if we add "backendtype" config
> param right now with default to STANDALONE it might simplify work for
> someone who ends up adding other type (in particular, the QEMU). Let's see
> what the maintainers will say.

The extra work is minimal and that isn't something that worries me.
What worries me, based on past experience, is adding code that _may_
be required in future, and is never used eventually. And for that I
always vouch for not adding something unless we are sure we need it
and there is some code which makes use of that configuration right
away.

-- 
viresh

