Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0551E924199
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2024 16:59:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752544.1160759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOeyC-0003N0-2k; Tue, 02 Jul 2024 14:59:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752544.1160759; Tue, 02 Jul 2024 14:59:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOeyB-0003Kd-Vv; Tue, 02 Jul 2024 14:58:59 +0000
Received: by outflank-mailman (input) for mailman id 752544;
 Tue, 02 Jul 2024 14:58:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Fm4M=OC=kernel.dk=axboe@srs-se1.protection.inumbo.net>)
 id 1sOey9-0003KX-Th
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2024 14:58:58 +0000
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [2607:f8b0:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 99e9ce44-3883-11ef-aaf1-7f3abd7486c0;
 Tue, 02 Jul 2024 16:58:55 +0200 (CEST)
Received: by mail-oi1-x22f.google.com with SMTP id
 5614622812f47-3d5b2963b04so232129b6e.3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jul 2024 07:58:55 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-3d62fb48ab1sm1698965b6e.54.2024.07.02.07.58.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 07:58:53 -0700 (PDT)
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
X-Inumbo-ID: 99e9ce44-3883-11ef-aaf1-7f3abd7486c0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1719932334; x=1720537134; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YLJvrCKp8MLcu/+RMIXBzlT9gAnXUofdIoGhevdTams=;
        b=FvBvBmK0z6peR6NEAkdlU/OUOWjnKEKccP9SgOC5UsBsjq4YtAe7qrmDZLSHah6w1a
         RcElviB4LRig7RKQFQTsvU+UPnYZtIwa/dgtjKgR8Tbfa/CSfGmPVo91XQF9nADAdkL8
         2OnOkh206oJ8huiBlm6qT95t4l0ZANBgRa5aQKjjYgofaeCUkf9yoa/U3Ulz3mUfiw9S
         vDBK3ikh4vp5zmtAtMglwVOauXNKydnL8rN//rcyV/Dcdu8fXtgPhVBBgl0RAZn2t2RK
         f0iOngNx2s2BqjYa3npX4651SeKcUTgxN6gmM+u0W7LIeso/EbcPkm4gSGvnkl/6pIU1
         VsjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719932334; x=1720537134;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YLJvrCKp8MLcu/+RMIXBzlT9gAnXUofdIoGhevdTams=;
        b=LRAmIO22ucxF5RMZ8aUhqyaZTtKSNOzqYaYstRGts6BaSiB49+aR3TBGSMZlkKy/R8
         y2IplzJFJuLJ6NmRm5y90QvBLxsvEYlBM662Rg+wPMuYxazQuC9oqbMQI61GPDPj7yre
         YOYJrje68NvZa1xJF2ShPgcYVduRaNMcZCS0wZ6bAiCXOj/T8JA6mhkc0to0NaY8s/xz
         z/fo3cQwAtEAvCYKnTyrO/TwD7rWbPd+fccDqnLO8iCWZiEd3KCt75YDCrHEpWL4vxLU
         4WJ4WTfPMRpGLxQYscetQ51krujDgzW+uRvmt1+CmQbYJnStxwSdGysy4Us9SG0HidFc
         gyFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbQH2fdB0F2SjGQ1KtCTM7U91Sx8VcvufqPZY7QIksqKmZVrlfsJE5DAQbm1ARM2l6+Ct1cBuP824vZ3HL0jCkRtvbZHATeHvOwG0NvgM=
X-Gm-Message-State: AOJu0YyTK5r6ODcHAMsD30a2gwjDJ8A8sODh3IhR7GqCGqDlBJWQnqip
	6d+9WoZmV/OrocVDmNIJELJa/PTbB0SM6zoAYR4gjwhjSQzE3WwaWBBQvE3TGMo=
X-Google-Smtp-Source: AGHT+IEyS9oKtRMN8bwuH7h258UqecHYDZYqumNvgtOD1xV0BYd67tKCeRFF+kfE9D14plOte1qhsw==
X-Received: by 2002:a05:6808:210c:b0:3d6:303f:5989 with SMTP id 5614622812f47-3d6afcbd885mr9690375b6e.0.1719932334045;
        Tue, 02 Jul 2024 07:58:54 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: roger.pau@citrix.com, Christoph Hellwig <hch@lst.de>
Cc: jgross@suse.com, marmarek@invisiblethingslab.com, 
 xen-devel@lists.xenproject.org, linux-block@vger.kernel.org, 
 Rusty Bird <rustybird@net-c.com>
In-Reply-To: <20240625055238.7934-1-hch@lst.de>
References: <20240625055238.7934-1-hch@lst.de>
Subject: Re: [PATCH] xen-blkfront: fix sector_size propagation to the block
 layer
Message-Id: <171993233260.107674.762169022819526197.b4-ty@kernel.dk>
Date: Tue, 02 Jul 2024 08:58:52 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.0


On Tue, 25 Jun 2024 07:52:38 +0200, Christoph Hellwig wrote:
> Ensure that info->sector_size and info->physical_sector_size are set
> before the call to blkif_set_queue_limits by doing away with the
> local variables and arguments that propagate them.
> 
> Thanks to Marek Marczykowski-Górecki and Jürgen Groß for root causing
> the issue.
> 
> [...]

Applied, thanks!

[1/1] xen-blkfront: fix sector_size propagation to the block layer
      commit: 98d34c087249d39838874b83e17671e7d5eb1ca7

Best regards,
-- 
Jens Axboe




