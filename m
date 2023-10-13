Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D83007C8523
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 13:59:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616512.958577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrGpB-0003qV-Jr; Fri, 13 Oct 2023 11:59:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616512.958577; Fri, 13 Oct 2023 11:59:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrGpB-0003nY-FR; Fri, 13 Oct 2023 11:59:25 +0000
Received: by outflank-mailman (input) for mailman id 616512;
 Fri, 13 Oct 2023 11:59:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ujq9=F3=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1qrGpA-0003nS-6Y
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 11:59:24 +0000
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [2607:f8b0:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f27c1be2-69bf-11ee-98d4-6d05b1d4d9a1;
 Fri, 13 Oct 2023 13:59:23 +0200 (CEST)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1c8a1541233so15667145ad.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Oct 2023 04:59:23 -0700 (PDT)
Received: from leoy-huanghe.lan ([98.98.49.106])
 by smtp.gmail.com with ESMTPSA id
 j9-20020a170902da8900b001c5900c9e8fsm3731399plx.81.2023.10.13.04.59.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 04:59:20 -0700 (PDT)
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
X-Inumbo-ID: f27c1be2-69bf-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697198362; x=1697803162; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CNRz1GKH8GbFeMxGqOmgpfu4sRiR9UOclOmjFv8HXCs=;
        b=CP2+lO54sTzrHMJ/XObWdTSG9ZF34ygqPkSWGkwM89mhZgotbSRjX5Kzv6naCjO7dh
         J9PJlga676SZOlSmlQ7n2Kg3ydhHnkFTKNQTR/KSz4nEQUoCiT7h/vAC88aDBfVE6hnm
         XzOaV39x8CKvjtxXEiwtX7jFAsQTYPpcl9lx4TpCxjl9FPQDWRTR2/G7ZClcgBFymWcQ
         gha7iibJDUJx4zu+hvSvfBiIvdj1oDOpuxi2XeTUntGJdVITrr5HiNKj8qMIrGoBoglK
         ksO58naaMj+7yqvVWlQOlDglQ2PXRlBITfgzLLpy+udb8WNl5PLBbNtxIxOp5ge2/LGC
         BU6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697198362; x=1697803162;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CNRz1GKH8GbFeMxGqOmgpfu4sRiR9UOclOmjFv8HXCs=;
        b=ACGdkAAPKGKLYNKPXQNoSLiHRxtQJVPd0RImXxKyKO1AwbdpfDMDpCFcwxggfu25Lx
         Rt0J2IW7ihvLJlxgd5TTCjxkdhEp7SCCTbi15zEAeuWfA1x3lG432tETLlV9MSxcuZmr
         d6fFVQ4WB0RZoziKUbMMk4aXvQ3VRmOmeb9crWIN6gsp1341SZhCSKYrkev+IXrdp84O
         4zTZHo7PpKCdyOsZhF+R3vZDdv7dEgDtlMchKxBu6TcfZX+BkjEo4tkcN1kBQUlpD4AA
         EIM9GRjx957WDm3H/aZAYrGyGv6O437k+XOS22vQsr0F6KCvOV1QOzHR7dCSq55i6Z5q
         CbIA==
X-Gm-Message-State: AOJu0YwA/ahlN59U4eA06WGyREOVBvuo6mPu0WQ79cYjL1rW6qE5HK1C
	XyvTp48j2AbNkxkMSFelK1PV0MIfoDCproe1YpcFLg==
X-Google-Smtp-Source: AGHT+IEbFq8tu80hM7pKj5l834Cu4DG7hJfxCFj4PQTK7giy0Kl9Uz05Q+uDPfv6nmG9hdscjifUMQ==
X-Received: by 2002:a17:902:c084:b0:1bb:b30e:4364 with SMTP id j4-20020a170902c08400b001bbb30e4364mr21197944pld.39.1697198361514;
        Fri, 13 Oct 2023 04:59:21 -0700 (PDT)
Date: Fri, 13 Oct 2023 19:59:17 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Michal Orzel <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3] xen/arm: Skip memory nodes if not enabled
Message-ID: <20231013115917.GB928468@leoy-huanghe.lan>
References: <20231013102929.1266849-1-leo.yan@linaro.org>
 <b8312c46-c1f8-455f-b277-b36a1dc636ab@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8312c46-c1f8-455f-b277-b36a1dc636ab@amd.com>

Hi Michal,

On Fri, Oct 13, 2023 at 01:00:12PM +0200, Michal Orzel wrote:
> Hi Leo,
> 
> On 13/10/2023 12:29, Leo Yan wrote:
> > 
> > 
> > Currently, the Xen hypervisor doesn't handle the status, the issue can
> > be described from two perspectives: the memory nodes and the reserved
> > memory nodes.
> The first part about the status is a bit ambiguous.
> How about (this can be done on commit):
> Currently, Xen doesn't check the status property of memory/reserved
> memory nodes, which may lead to the following issues:

Agreed. Will send the new patch soon.

[...]

> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Will add your review tag. Thanks for review and suggestion!

Leo

