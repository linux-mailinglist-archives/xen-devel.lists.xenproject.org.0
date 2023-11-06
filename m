Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E727E1E6F
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 11:33:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627870.978728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzwu5-0007D5-Lc; Mon, 06 Nov 2023 10:32:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627870.978728; Mon, 06 Nov 2023 10:32:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzwu5-0007A9-II; Mon, 06 Nov 2023 10:32:21 +0000
Received: by outflank-mailman (input) for mailman id 627870;
 Mon, 06 Nov 2023 10:32:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4FDE=GT=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1qzwu4-0007A3-34
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 10:32:20 +0000
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [2607:f8b0:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c21c3f8d-7c8f-11ee-98da-6d05b1d4d9a1;
 Mon, 06 Nov 2023 11:32:18 +0100 (CET)
Received: by mail-oi1-x234.google.com with SMTP id
 5614622812f47-3b3f55e1bbbso2792481b6e.2
 for <xen-devel@lists.xenproject.org>; Mon, 06 Nov 2023 02:32:18 -0800 (PST)
Received: from leoy-huanghe.lan ([98.98.115.250])
 by smtp.gmail.com with ESMTPSA id
 s12-20020a056a00194c00b006979f70fdd5sm5260934pfk.219.2023.11.06.02.32.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Nov 2023 02:32:16 -0800 (PST)
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
X-Inumbo-ID: c21c3f8d-7c8f-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699266737; x=1699871537; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3Glr2SFL0YBMIuUBsQl3elw2fY+LCwHpY+w6UQc49Lw=;
        b=CXXz+OpYIAUvxGB5vVM0OXnn5hFXJQ8YWELVc2tA1uh8pDLrH4hcK7IGLxNJhjrEG9
         KE6taWiTd/q3FKrA0xEQYefijSunh/9vpbbTNfMO7TAaL9Ggwtn4oSM709Bsx8AAlN06
         KCBTBCe04BUS4JUKsoQ+Sgwxui7zYC/9ZLLzZI6JRi9P//SwMHuf6v2cad2bFi+aoJzj
         V+DExx/w5J2c1p80LCqOOPZWGIqrTTiOPrdy3yDS35kJaAnfuagrXzfgfW+yKSI2Iz/3
         UOpNPdT9QJcuIBxn7MpjaDyU0ypnqxjrF041Ew+SHxWyoeHvrJuA3Jh1VlX6iLPOXeFf
         LENg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699266737; x=1699871537;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Glr2SFL0YBMIuUBsQl3elw2fY+LCwHpY+w6UQc49Lw=;
        b=kYCH7U8dpc4w8z6RkhlLaP7JuzoiaLwiI1SAVA64M+w2+ScPah6dxQ0ulldAuIBXP2
         MfI0Iz9PaNXGA4Kg7oSWMddK5L2Z7H4kzk3BnVQqkw3Eb14Mag/ynR7H3er92Wp4y3Mb
         eAbeQs0XYwMZN1m+Pp47HiK7MxxUkspesTTkYvHzv6FbsuQGTXQqIdFi6vJoKv4PK+UE
         ucBHgusjfYu1iFA1sf8uouIoeKqlJR0Vop3oFa6O+ZCJ4BHcqp3yxAacmk6qULOPaB12
         QfZsSZhTuLZoF2Ql3wgQl4k5lA+osTk7LwU80ZbR5zkh0oZhljMB1i6Pn/AbeL1bBxNi
         LfKw==
X-Gm-Message-State: AOJu0YwTQH5zVw6vCpnPmFqVgiQ2+NFyTv5Yqge6GoCOkscSF5tJ2591
	Bg6Y/xR2MTLzmrpedFlCXNr/nQ==
X-Google-Smtp-Source: AGHT+IE4QzQKpNqlC/4uXIcoEWj1FRMWDCdQkrCDDpEdbaTq0K26Bj6WMrp/1R8uuU4XsnIKnN8E/w==
X-Received: by 2002:a05:6808:4189:b0:3a7:6d4a:fd78 with SMTP id dj9-20020a056808418900b003a76d4afd78mr27230415oib.24.1699266736813;
        Mon, 06 Nov 2023 02:32:16 -0800 (PST)
Date: Mon, 6 Nov 2023 18:32:12 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v4] xen/arm: Skip memory nodes if not enabled
Message-ID: <20231106103212.GE90848@leoy-huanghe.lan>
References: <20231013120442.1267488-1-leo.yan@linaro.org>
 <20231106021742.GA90848@leoy-huanghe.lan>
 <191b5aa4-182f-4b2e-8430-e605de592890@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <191b5aa4-182f-4b2e-8430-e605de592890@xen.org>

Hi Julien,

On Mon, Nov 06, 2023 at 09:52:45AM +0000, Julien Grall wrote:

[...]

> > Gentle ping.
> > 
> > I don't see this patch is landed in Xen master or staging branch, should
> > anything I need to follow up?
> 
> The tree has been frozen for the past few weeks for any patches that are not
> meant for 4.18. We branched for 4.18 last week so staging is now in
> soft-reopening until 4.18 is released.

Thank you for the info.

> I am aware of few patches that are ready to be merged. But I haven't yet
> gone through all of them and merge to 4.19. It will probably be done once
> 4.18 is released.

Sure, good to know this.  I will wait a bit and just let me know if
I need to follow up anything.

Thanks,
Leo

