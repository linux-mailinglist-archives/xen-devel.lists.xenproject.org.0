Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E10687DBDCB
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 17:26:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625291.974453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxV5z-0004wM-Rg; Mon, 30 Oct 2023 16:26:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625291.974453; Mon, 30 Oct 2023 16:26:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxV5z-0004uC-Or; Mon, 30 Oct 2023 16:26:31 +0000
Received: by outflank-mailman (input) for mailman id 625291;
 Mon, 30 Oct 2023 16:26:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3VkP=GM=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qxV5x-0004u6-O6
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 16:26:29 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 135bbb14-7741-11ee-9b0e-b553b5be7939;
 Mon, 30 Oct 2023 17:26:27 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-538e8eca9c1so7536241a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Oct 2023 09:26:27 -0700 (PDT)
Received: from localhost ([213.195.118.109]) by smtp.gmail.com with ESMTPSA id
 l2-20020aa7c3c2000000b005407ac82f4csm6237500edr.97.2023.10.30.09.26.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Oct 2023 09:26:27 -0700 (PDT)
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
X-Inumbo-ID: 135bbb14-7741-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1698683187; x=1699287987; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y2CsJS2Z1go25NNTkqlGOMv00wUBDUayWJEChGx+47s=;
        b=AzX5RMTusCJqBm5A60Zk90LkSPFN8LBBjNfznn1oVWplWPV+gRh9Fqib2724KHQXp4
         ursQS/ZLfh9Hq0MvZwHmD4OVGVM1mwVFdWXa1lPnBNbAfH9b31wbz/XsE2Q+o4vdv+qi
         JJycn4+cR/+yszscTERvFbjJWsgDM/wQLAHYY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698683187; x=1699287987;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y2CsJS2Z1go25NNTkqlGOMv00wUBDUayWJEChGx+47s=;
        b=DcXouABrP+V786IryEI4+cZFrCW6akbYOtBGiedmN8PVtv4MgEK75+EVsLil24xFGM
         jL6hkGwHPyVldCs67r+c76cGITOdST3iOKV9y2ppyXkSoDy8J7wDVRCeJ1kgk2tjwwvX
         MlkxMlmhtyEyzs1YDlNHbwsDiqhb1cFUwuZh3NOGCqH4RL5CsHZHJOIDPD8+BITFHjk0
         o+8Fo7yg/IxdSjqr8IOPxXtvAUti6GR1UHb6UkbvInPg2N8jodXzWc9071uNs8C1SWxG
         NFc2IVA3vnbkrR6YrHmUUE7VV3jIRuVq8sYRUnmIb+LXvAxysEwCR5nINcc35cw+vAvT
         mD8g==
X-Gm-Message-State: AOJu0YxcfRpM8Lzt11Vk3WDOj0d2t/F4STqAkr5W+vElF7K9X8hrQLAa
	FSmy76/ACC6OZj6x4vInaTkPqg==
X-Google-Smtp-Source: AGHT+IHGuribpwoBub0/lexlIKKuy2qCNwmwTmw/O0xO9KKo2Dkv1NcvGYzWZN17GliWTsLHxGEr0A==
X-Received: by 2002:aa7:d351:0:b0:53e:467c:33f1 with SMTP id m17-20020aa7d351000000b0053e467c33f1mr9306436edr.8.1698683187331;
        Mon, 30 Oct 2023 09:26:27 -0700 (PDT)
Date: Mon, 30 Oct 2023 17:26:26 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH] arch: drop get_processor_id()
Message-ID: <ZT_ZMv5SJVcZ-9zf@macbook>
References: <446254b4-8231-f6db-5f18-ed367503454c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <446254b4-8231-f6db-5f18-ed367503454c@suse.com>

On Mon, Oct 30, 2023 at 02:29:09PM +0100, Jan Beulich wrote:
> smp_processor_id() is what we commonly use; there's no need for it to
> have an alias.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

