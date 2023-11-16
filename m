Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A247EE47D
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 16:36:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634479.989948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3ePl-0006Oh-5V; Thu, 16 Nov 2023 15:36:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634479.989948; Thu, 16 Nov 2023 15:36:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3ePl-0006N0-2r; Thu, 16 Nov 2023 15:36:21 +0000
Received: by outflank-mailman (input) for mailman id 634479;
 Thu, 16 Nov 2023 15:36:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qNyY=G5=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1r3ePk-0006Mu-IT
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 15:36:20 +0000
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [2607:f8b0:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1e863d7-8495-11ee-9b0e-b553b5be7939;
 Thu, 16 Nov 2023 16:36:17 +0100 (CET)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1cc58219376so8373825ad.1
 for <xen-devel@lists.xenproject.org>; Thu, 16 Nov 2023 07:36:17 -0800 (PST)
Received: from leoy-huanghe ([98.98.115.147]) by smtp.gmail.com with ESMTPSA id
 d13-20020a170902c18d00b001c60635c13esm9343665pld.115.2023.11.16.07.36.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 07:36:15 -0800 (PST)
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
X-Inumbo-ID: e1e863d7-8495-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700148976; x=1700753776; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6Txd2MhpM35Heuel0TWSciO+NHURp/X/7lvvpbyBBHg=;
        b=bBdbYj5udQzlVzo9EzqIiqH1TsXIDVLg6l6cfspP8iufe1zUDLpw8/zL9kNlOs0/SR
         a06dTLrr4MhUk3SExRY6753WcgmBiZS4BlUPP3DnUrgnasOI8B5dTi8WcqPWagHzE2X5
         Q3nHWAISrIMCo8+aEYLjCPDraxSsQgBnSiNRa27xBRAtDPVgyjmU7MjP6seOT0JLtdbK
         9NlQoS07Ryrh8LK0HloK5H2I9xDNCDXGHq/06NXJ/JHjFEkxpcmfnQIrbrTRVT7M9ivw
         b8NdEP7FJn031H0MJK2zATcYVQP1t8Gr0+naaZZGg4gj4eiR0jLGnLDezSYQ6acg9/Lq
         4kSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700148976; x=1700753776;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Txd2MhpM35Heuel0TWSciO+NHURp/X/7lvvpbyBBHg=;
        b=apcNJlPvnb08jh5Qnct2OpwygRwm5/Yv4ToZnfkF0lEgvR9diCv3+dqryyMOuNoHtr
         nAWho/hSMJCOQW2nGXqqKkD6VLtB+2XkV5iwhaFTxzSWFoko9UxQH5Swc98fEj5jKznc
         SnFsMgUbDODCPXee4CEOVTwEHScuKFIEJ5RtvuY328U8dUnTwAFtFH+/pDodBE8HXsc0
         3FxZXCYZ8cUA59AsxB6AF4FC+GEmkmatbD1MrT73zsJ2C1PNelnhqkRrAN9NcibjRkhS
         /5mRictKW7vBem/L6m7IjoxAwA32uj/oFmEoUv3CYXC3Q895s4EcOjTtIlUgMJYNukKz
         f2QQ==
X-Gm-Message-State: AOJu0Yy+ZLeIVjRJcIZIWcB5stuXK9mxNZfs84nfLpOgP5q1WoB3I6TR
	XSByj9QIRktUPXOnkG3zQ9VKLA==
X-Google-Smtp-Source: AGHT+IHhPWM6qEWMj/Rk7HGlKBKChFJ30r1OqZ/zCBsyz5TCyZK5uk7Lff+82ygGS7qFmWZhIEcyDA==
X-Received: by 2002:a17:903:603:b0:1ca:20a0:7b08 with SMTP id kg3-20020a170903060300b001ca20a07b08mr8673893plb.50.1700148976301;
        Thu, 16 Nov 2023 07:36:16 -0800 (PST)
Date: Thu, 16 Nov 2023 23:36:04 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Luca Fancellu <Luca.Fancellu@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Xen-devel <xen-devel@lists.xenproject.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Rahul Singh <Rahul.Singh@arm.com>, Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH v4 2/2] xen/arm: Enlarge identity map space to 10TB
Message-ID: <20231116153539.GA30433@leoy-huanghe>
References: <d3952200-9edb-4de0-94e3-c00c571a10b9@xen.org>
 <794B0D71-70A7-4546-98E0-EC01573E0D89@arm.com>
 <990b21a3-f8c7-4d02-a8ac-63d31794a76d@xen.org>
 <alpine.DEB.2.22.394.2310171258330.965337@ubuntu-linux-20-04-desktop>
 <4fc83e61-1e57-4f75-b017-7045842165e5@xen.org>
 <69be876f-4238-4041-a6ff-50f7f6487d5d@xen.org>
 <20231019093559.GA105208@leoy-huanghe.lan>
 <80a5c950-242b-467c-8764-8f06e19dc5d4@xen.org>
 <20231106094524.GD90848@leoy-huanghe.lan>
 <81ec6ac0-8414-41d1-bfe3-ffa6c5750036@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81ec6ac0-8414-41d1-bfe3-ffa6c5750036@xen.org>

On Thu, Nov 16, 2023 at 02:21:18PM +0000, Julien Grall wrote:

[...]

> I have done the changes and directly committed the series. So no need to
> respin.

Thanks a lot, Julien!

Leo

