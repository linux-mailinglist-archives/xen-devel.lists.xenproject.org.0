Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB6685BAEC
	for <lists+xen-devel@lfdr.de>; Tue, 20 Feb 2024 12:50:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683447.1062972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcOdZ-0004I1-R4; Tue, 20 Feb 2024 11:50:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683447.1062972; Tue, 20 Feb 2024 11:50:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcOdZ-0004GF-ML; Tue, 20 Feb 2024 11:50:13 +0000
Received: by outflank-mailman (input) for mailman id 683447;
 Tue, 20 Feb 2024 11:50:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qAG8=J5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rcOdY-0004G9-4J
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2024 11:50:12 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32f539c5-cfe6-11ee-98f5-efadbce2ee36;
 Tue, 20 Feb 2024 12:50:10 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-512a96e44e2so3529016e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 20 Feb 2024 03:50:10 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 b7-20020a05622a020700b0042e124c7b17sm1679254qtx.60.2024.02.20.03.50.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 03:50:09 -0800 (PST)
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
X-Inumbo-ID: 32f539c5-cfe6-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1708429809; x=1709034609; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L48l2hpsjGRvCKL00qVAvQZynCjle73QSMbq61LuMbw=;
        b=blvXx2ouFz8rNtgKIPFPmuziy5reAgb4hpQ56V+z/LFv9VdDooKHSr6DjtJuQHMWOE
         gUFZy4fO3NYonSEwV4ixcXuwiMll1BDJoJ5JKjIB8Y4nmCu/wYZeu1ea+A3y20xlTFgP
         8YCr9wuitod44Wg54Q+6fUN4NUixoLo/sQyzw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708429809; x=1709034609;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L48l2hpsjGRvCKL00qVAvQZynCjle73QSMbq61LuMbw=;
        b=PbMbiPFG71eY4LP+7M9eJ40qVmhJo16KxJ4jD3XEhvLhRuJZYbsfoOQWAzKIRj/aHg
         hTW4nLPQqfUj/Ydbtcid69UoRje+IeMweesd3bPMmr+0J+WbfSkOXcMSabLVk2kKLqHd
         C7CNANpFYf3SX24D6y+xGsvrCQ4sJzMz8PN3yAdxRfLLUsvY6Ks6oTNeN396scTKYA3n
         rdw3VROxDivA4yrme5DmuCMTj7l3/ogNyfpwwhpUHjfrTxYySeCEK5AB8Md0PQHSur8C
         gDoOBcQ+AMXZWC2p8Z8IlBL6onOh48tO3GcR+cEMtJ/JXpwhxWiknzLQiAzJ/w1tJoiA
         NVBA==
X-Forwarded-Encrypted: i=1; AJvYcCXTNwAZCfdwOmJcqmRPXZqp2TUub/BEnIWNcS8ZdxJURzdd8htmtc1+umMmDexWO5smuPLtceyfvmN07T2sId0vSj3z5WVRb2MYFfQnByo=
X-Gm-Message-State: AOJu0YxlvgqL8NSQugxMj3bnW8zBYYLru847swqn/zaVhZED2PNvdazV
	0tub3weH3AM3N+yxGU4lNHn5CIy1DQO8OxW6jlocvSR6VraZnMh6s3UlF4kipkw=
X-Google-Smtp-Source: AGHT+IHUZ8iQeWiuL3aFeiidpOcUFxCSR6QyScwRy5qnJiOguqCxJ4LpXQwdFCaOwM+JubG1vE+kxQ==
X-Received: by 2002:a05:6512:1088:b0:512:c9bc:f491 with SMTP id j8-20020a056512108800b00512c9bcf491mr971397lfg.47.1708429809506;
        Tue, 20 Feb 2024 03:50:09 -0800 (PST)
Date: Tue, 20 Feb 2024 12:50:07 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Jens Axboe <axboe@kernel.dk>, xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org
Subject: Re: [PATCH 2/4] xen-blkfront: rely on the default discard granularity
Message-ID: <ZdSR75QHen-omYCZ@macbook>
References: <20240220084935.3282351-1-hch@lst.de>
 <20240220084935.3282351-3-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240220084935.3282351-3-hch@lst.de>

On Tue, Feb 20, 2024 at 09:49:33AM +0100, Christoph Hellwig wrote:
> The block layer now sets the discard granularity to the physical
> block size default.  Take advantage of that in xen-blkfront and only
> set the discard granularity if explicitly specified.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Roger Pau Monné <roger.apu@citrix.com>

Thanks, Roger.

