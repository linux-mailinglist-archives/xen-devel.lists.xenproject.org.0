Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 172DA88C224
	for <lists+xen-devel@lfdr.de>; Tue, 26 Mar 2024 13:31:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698065.1089376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rp5x2-0003K2-IO; Tue, 26 Mar 2024 12:30:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698065.1089376; Tue, 26 Mar 2024 12:30:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rp5x2-0003IR-F0; Tue, 26 Mar 2024 12:30:48 +0000
Received: by outflank-mailman (input) for mailman id 698065;
 Tue, 26 Mar 2024 12:30:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EqC6=LA=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rp5x1-0003IF-5p
 for xen-devel@lists.xenproject.org; Tue, 26 Mar 2024 12:30:47 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aabba542-eb6c-11ee-a1ef-f123f15fe8a2;
 Tue, 26 Mar 2024 13:30:45 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-34175878e3cso3834613f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 26 Mar 2024 05:30:45 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 n7-20020a056000170700b00341cfa5f16fsm4489995wrc.30.2024.03.26.05.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Mar 2024 05:30:44 -0700 (PDT)
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
X-Inumbo-ID: aabba542-eb6c-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1711456244; x=1712061044; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9TsJzQDax/ckC8yYv+YLh+kCHWUXJ4dhYhH8AtZwWT0=;
        b=IpZJJhHBLnqJRukcNnfCtuPWNzYjpy+xfKxTduNIUPVZS1JBWTwqMLm66yOwQ3AVl0
         +cWDjxWaJZuzcR+3wthD6nfnR9s2myV+zUCHbSJ39zLj5LKK7goADQCGucRo3/RGPQTp
         x3GMK68Kg3o51536UGSSy9w90O5/lhrwT85BY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711456244; x=1712061044;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9TsJzQDax/ckC8yYv+YLh+kCHWUXJ4dhYhH8AtZwWT0=;
        b=QQlhXjn6w643FfQ2WAvDZxEWoL0snlri9kDxOYOjA6/wEG2wk3BffVAS2EiTpjPIWW
         fQa3b2r4VNVf+NwbLDuX1ewIcU8ge5tP9P70IiXT0JV9+fgy3X4TygyXrcpVggriaSJx
         gDqr1GAlrEf71+imDDKWXBNb8UO7BvI5FNQE4IaG/tqp9akUzarYb/gMfQuWmXrESNgP
         wTqAZ8ldfttguJoSSv2+z3bgxkiOnWfZgRkMU3X3v/zP1V1POQGfJaW/Q88wTKo8xowb
         k9hDU6jCYPuDJivU9NdQxX4qTnrkIqq8yhS4qLzTV7B1o9E0XolVaSFo1cgMRvhWL+0Z
         jH/w==
X-Gm-Message-State: AOJu0YzsN9klgOvjQtyakx5mQCOiMblIJ3ownE2ha8E9Od4siaLs/HLr
	enSPedJvO2x3BgBxQ4m/VW9upP1ojSRX5iUbl/0pXlIx3fBZ5MYYnxeHJYKew5Y=
X-Google-Smtp-Source: AGHT+IFNUVrXNvsA0hzt0eFJCExyVxn5qiu02GM/wJCWe7e4DR8AUoC1Iv/dy3AgCd0MQVYX44f7IQ==
X-Received: by 2002:a5d:628f:0:b0:33e:4d34:f40f with SMTP id k15-20020a5d628f000000b0033e4d34f40fmr7588499wru.46.1711456244599;
        Tue, 26 Mar 2024 05:30:44 -0700 (PDT)
Date: Tue, 26 Mar 2024 12:30:43 +0000
From: Anthony PERARD <anthony.perard@cloud.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [OSSTEST PATCH 34/36] Temporally switch "qemu-mainline" branch
 to Bookworm
Message-ID: <0412f0af-071f-4e7a-80b8-69d9401f6723@perard>
References: <20240318165545.3898-1-anthony.perard@citrix.com>
 <20240318165545.3898-35-anthony.perard@citrix.com>
 <ZfscD497p91dcPx4@macbook>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZfscD497p91dcPx4@macbook>

On Wed, Mar 20, 2024 at 06:25:35PM +0100, Roger Pau Monné wrote:
> On Mon, Mar 18, 2024 at 04:55:43PM +0000, Anthony PERARD wrote:
> > QEMU doesn't build on buster anymore.
> > 
> > This should be remove once bookworm is the default suite.
> 
> Is this change required anymore, patch 35 makes bookworm the default,
> hence it seems pointless to switch QEMU just one patch ahead.

You didn't read the cover letter?

But I guess I can skip this patch, it's not that important.

Cheers,

-- 
Anthony PERARD

