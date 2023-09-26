Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 859E47AE691
	for <lists+xen-devel@lfdr.de>; Tue, 26 Sep 2023 09:16:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608284.946656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ql2Io-0002rO-Lt; Tue, 26 Sep 2023 07:16:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608284.946656; Tue, 26 Sep 2023 07:16:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ql2Io-0002ph-JG; Tue, 26 Sep 2023 07:16:14 +0000
Received: by outflank-mailman (input) for mailman id 608284;
 Tue, 26 Sep 2023 07:16:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=40kW=FK=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1ql2Im-0002pa-VB
 for xen-devel@lists.xenproject.org; Tue, 26 Sep 2023 07:16:13 +0000
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [2607:f8b0:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 900d1822-5c3c-11ee-9b0d-b553b5be7939;
 Tue, 26 Sep 2023 09:16:08 +0200 (CEST)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1c60f1a2652so28715065ad.0
 for <xen-devel@lists.xenproject.org>; Tue, 26 Sep 2023 00:16:08 -0700 (PDT)
Received: from localhost ([122.172.81.92]) by smtp.gmail.com with ESMTPSA id
 y3-20020a170902864300b001bdc8a5e96csm10153416plt.169.2023.09.26.00.16.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Sep 2023 00:16:06 -0700 (PDT)
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
X-Inumbo-ID: 900d1822-5c3c-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695712567; x=1696317367; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AxN91ZtW8jLaX/UOOowUUIWGzrSleiAiGKIAhbg+1vo=;
        b=nlsbIZsdojvgPFUR7gQ1Oz1Ksty5hsFtbZZLWQmd86sRVuBwestM0P5+uQkQuTyXyv
         VW1FdM9HhM9KP1UvyRYoJ5E6puIlvH1pWYO2ZfAzw6reht18fev3dth/J0UFgIJ3VQHK
         NUSgyzuoof4JZ0JOrGAmPH3Ogza30oyevR/+nydcslQuSx8wt77TgoAaoafX+rbtpsME
         VaNDQVmWy5BcBaeHFNyDsWhup7ME838vKmTMu3g4dy+1wnlqcv3xxy2di4jB15ZTJa9K
         HJFsPsmHuC/KsKHN3ex8i/80O0Tp3jiaxNlKwi4jgBnP2YXr6ixp32j2EJAyj68fNhpy
         kfFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695712567; x=1696317367;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AxN91ZtW8jLaX/UOOowUUIWGzrSleiAiGKIAhbg+1vo=;
        b=tJHwbKSA7l05qXpikaYNHEzoGMjKGrF19LxGZaje0X01/tZ6mF90JzGnZTJewJnBUy
         FBAIk1+PoylxWq16POoR82unNMeP/h56jHqcLurn7O3A0LSpE0brLyLnXNjlFoycuIQC
         XTAQpAYspqtBFxadf3nkK6mZ0xV2GbGaFUz0Wg+JKTb/uEQWAiIVHbao/EluAv3EremZ
         yC9LEEM9CdZQ0pyp8fcH6LIsyAVIvAjTRheCTeHtz1NEj3SFJNQp26mUjX/KacQtsga7
         ggqQx0FCITwi0GFC5DqlmYPLIdWOB10y9Q5Mjm0VtmaH6qo+e/NWN8/4GecsCnC2LiNv
         1EnA==
X-Gm-Message-State: AOJu0YzczTt2xcqGTQh5OB71WWiVaJqdHM5ZmSFJUmwpZYZZeMFXxhkA
	bRk5RGMKWPgqVbULfqZuRi0Q9Q==
X-Google-Smtp-Source: AGHT+IG1mTIUQ0wJLd2lPyUrwgHzq8jfM2cuuoePUp8wHpqga4QOjofY/6V2yztIVZLuGMzESpOI0w==
X-Received: by 2002:a17:903:2344:b0:1bc:2fe1:1821 with SMTP id c4-20020a170903234400b001bc2fe11821mr2991411plh.17.1695712567328;
        Tue, 26 Sep 2023 00:16:07 -0700 (PDT)
Date: Tue, 26 Sep 2023 12:46:03 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Juergen Gross <jgross@suse.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	Erik Schilling <erik.schilling@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 0/2] xen: privcmd: Add ioeventfd support
Message-ID: <20230926071603.yckfk7wbzejtmqdk@vireshk-i7>
References: <cover.1693311370.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1693311370.git.viresh.kumar@linaro.org>

On 29-08-23, 17:59, Viresh Kumar wrote:
> Hello,
> 
> Now that irqfd support (backend to guest interrupt) is already merged, this
> series solves the other part of the problem, i.e. ioeventfd (guest to backend
> interrupt).
> 
> More details inside the commits.

Can someone help review this please ?

-- 
viresh

