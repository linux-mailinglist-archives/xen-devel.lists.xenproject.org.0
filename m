Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7216E3A9982
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 13:45:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.142900.263529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltTzN-0006zc-DL; Wed, 16 Jun 2021 11:45:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 142900.263529; Wed, 16 Jun 2021 11:45:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltTzN-0006xK-AP; Wed, 16 Jun 2021 11:45:45 +0000
Received: by outflank-mailman (input) for mailman id 142900;
 Wed, 16 Jun 2021 11:45:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=igu3=LK=gmail.com=rm.skakun@srs-us1.protection.inumbo.net>)
 id 1ltTzM-0006xE-EF
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 11:45:44 +0000
Received: from mail-lj1-x232.google.com (unknown [2a00:1450:4864:20::232])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 51577879-0491-4a3f-82ff-b34a26e2ec2d;
 Wed, 16 Jun 2021 11:45:43 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id b37so3332313ljr.13
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jun 2021 04:45:43 -0700 (PDT)
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
X-Inumbo-ID: 51577879-0491-4a3f-82ff-b34a26e2ec2d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dtd/r4kQdNTFgMzEtuMDxRln8AeazBFMNuFE+IwxLQ0=;
        b=tM9YyD9dbmrU6QAIak9v1L1Hze3NeFQPPNBEtD4omgZjEyhQcUg1q3wkLUmDpwXXOT
         6u+FMb976YVcaypY+NkjNsra9tUi2NzMsuaXdS253tuTX+l569fNkUgrvOzggDbWTp8W
         ENky2qq1vTSb11/DZgVTmvzbf9N+SWxrHqqLmE895cQUdLDT00v5gJHuqst+RLC6DELx
         AZubyEXZLMybvYei/eZAvnHzFQnU3mWT2NbfPe9zTz+GpRTN5egfyB5q61LhPml0mNjt
         9xsP8j3AJPQS9llNh712rLD/eGmKOg1uNQpb4kiRypPtttLcmaoFcMAzMHxwwR+iDCTV
         h9lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dtd/r4kQdNTFgMzEtuMDxRln8AeazBFMNuFE+IwxLQ0=;
        b=hjGG4WkHoenU8KfGsYdL8Km3zgxM4GlodKf0fALGqsDRN+hmPagNeTfhGUkOAY3IFS
         +NFSPPYVGk5AeVZr7N0hstKs/O642BJb04YWQ7xvIPis4frBW5lcHP1MfgR6olr8j35Y
         t+bm407g3/ChUm7KJWQ63mtDki9mZ6AG7jXFbTJl6ueL8tGezuowP0DcQpUN1QTo8xhI
         BygEbTgQdZthDBvnpJXKXQZKRViUFkYwAmlDxiVUXaN3ogPWpuBiBW8mgmmZF+sPjThY
         TQJWGYU6cXTwiWjnkSBkUvxr/KF6Wd+BltrU65fTDPFjst6IlIpBCwDIuox4/ta++/es
         J1DA==
X-Gm-Message-State: AOAM532enZTvopB1K2VpN56fXxLFwJaNWHyVv3o8v1jdm0ugL5BWWZN3
	5yESG2vz95boKRSViaBeTlQuzMaTVIVT7YFkPqbiVGXjKqp89Q==
X-Google-Smtp-Source: ABdhPJzI40Mx409ixL6A8VaGSABYZuuy5E1EPuBErhnFhAQBqUvi8LwmZwSBohmrfaadIq0f8nBwGp02vfH8jjD6rDc=
X-Received: by 2002:a05:651c:291:: with SMTP id b17mr2735729ljo.497.1623843942771;
 Wed, 16 Jun 2021 04:45:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210611095528.9230-1-roman_skakun@epam.com> <855a58e2-1e03-4763-cb56-81367b73762c@oracle.com>
 <CADu_u-MqALJkG8RJHrr65vC_sHu-UyvCGwwUfaBong0eir5+hQ@mail.gmail.com> <fbaeaad5-ea8a-ff2d-2e62-d27b4d234e8e@oracle.com>
In-Reply-To: <fbaeaad5-ea8a-ff2d-2e62-d27b4d234e8e@oracle.com>
From: Roman Skakun <rm.skakun@gmail.com>
Date: Wed, 16 Jun 2021 14:45:32 +0300
Message-ID: <CADu_u-MgdJYH-sf57AL_Fg3AnjpHoZ1Bk1nxytmoupJc=hJDfw@mail.gmail.com>
Subject: Re: [PATCH] swiotlb-xen: override common mmap and get_sgtable dma ops
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org, 
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Roman Skakun <roman_skakun@epam.com>, 
	Andrii Anisov <andrii_anisov@epam.com>
Content-Type: text/plain; charset="UTF-8"

> We make sure that we allocate contiguous memory in xen_swiotlb_alloc_coherent().

I understood.
Thanks!

-- 
Best Regards, Roman.

