Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBDA63AD7E
	for <lists+xen-devel@lfdr.de>; Mon, 28 Nov 2022 17:18:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449096.705744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozgpj-0005t0-KT; Mon, 28 Nov 2022 16:18:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449096.705744; Mon, 28 Nov 2022 16:18:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozgpj-0005pY-Gu; Mon, 28 Nov 2022 16:18:15 +0000
Received: by outflank-mailman (input) for mailman id 449096;
 Mon, 28 Nov 2022 16:18:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+e8T=34=gmail.com=alexdeucher@srs-se1.protection.inumbo.net>)
 id 1ozgpi-0005pS-FI
 for xen-devel@lists.xenproject.org; Mon, 28 Nov 2022 16:18:14 +0000
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [2607:f8b0:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4198cfa0-6f38-11ed-91b6-6bf2151ebd3b;
 Mon, 28 Nov 2022 17:18:13 +0100 (CET)
Received: by mail-oi1-x22c.google.com with SMTP id s206so12107734oie.3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Nov 2022 08:18:13 -0800 (PST)
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
X-Inumbo-ID: 4198cfa0-6f38-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dUmDKm1BpvIA6b7fg9TAsV7I3v/dDsa2Ew5AZiuOYPE=;
        b=nhYgjDRaG8GIB07OWuhluoflnp2AgXdKFYUlqJTAkGKb7OBUwRf5JaXc99kv5rIjzB
         XibHDK5QistPDLVZdQUldDUKgNxEvSutDoZZqK0kKp7RV07NZMTEQPbQe1wQb3y9Hel1
         uL4o2thCCSgT17Vzp9QYA69pu/F2Q7rxd5HwKCcfIlVzMr7rsGnLk+i1rSeVPSGwF438
         49ZNUQN/7ffCQId7bVcCc2XPQXdJjdUpK527oC86VDrn1zeybvep0YYkblwvbRrfKCB5
         M2uireOApJqO6XIh6W1pk41FKOl9rEZVTIjfHHDDJ4SklUmvb6N7GNl4dxCXDg8/hiob
         MzJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dUmDKm1BpvIA6b7fg9TAsV7I3v/dDsa2Ew5AZiuOYPE=;
        b=64qW0mdFS2qODxuZHcZrmWjzfv/UERqeB3W1bsGDaRe6eUHRT7/QivrWbONzwHli/l
         nL6KqoZIw444Ej/Ye/yUiI+FbxsQRMn9xS6gwVoZfuyQx4M8zJ4opz/71cD/2NKbKSOt
         feOxP65yj9TiKiBiYDZ7O5ijPFK4aXVOGW0n9VNa6nDWT2FZksTrL+lQEZfpmK1lAolX
         DIwHkSp4u9HodVpqwbk3Ail4kVw/ei3V8Q3GqS7NkjP0eptAXm9OIQnHWjkcZVO1xnns
         qsUGZs5jCI16P0AGYr4pmLJHXULHj7bKQD5l8KZZ/Xh+dqpT+Qs9RV/onHDddcsBq9pR
         xT+g==
X-Gm-Message-State: ANoB5pka86Z3ZdoqxY6W2gYTWu3hAjE0Anj8/d8V44vzbF9+bWeAWZw9
	iU1lqLpB2VIpNo/a5Vo1HnCuoixFwKwLH9LeMzI=
X-Google-Smtp-Source: AA0mqf43Ny6wktI/b9zIB2jtXO0sK5QhF8mG/bYbdBhNFrS7Wia5GSy7m9AunvQEeQE5S237dX5kciTIzTmPiM/Pgtk=
X-Received: by 2002:a05:6808:9b8:b0:34f:97ea:14d with SMTP id
 e24-20020a05680809b800b0034f97ea014dmr15155644oig.96.1669652292076; Mon, 28
 Nov 2022 08:18:12 -0800 (PST)
MIME-Version: 1.0
References: <Y4Mz0glMNwDPaFPO@itl-email>
In-Reply-To: <Y4Mz0glMNwDPaFPO@itl-email>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 28 Nov 2022 11:18:00 -0500
Message-ID: <CADnq5_NfupG-DzNDJfntg+uSWH2m_8mLfj=ddkMdnNYNRhXWUw@mail.gmail.com>
Subject: Re: AMD GPU problems under Xen
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: christian.koenig@amd.com, 
	Xen developer discussion <xen-devel@lists.xenproject.org>, dri-devel@lists.freedesktop.org, 
	amd-gfx@lists.freedesktop.org, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 28, 2022 at 2:18 AM Demi Marie Obenour
<demi@invisiblethingslab.com> wrote:
>
> Dear Christian:
>
> What is the status of the AMDGPU work for Xen dom0?  That was mentioned in
> https://lore.kernel.org/dri-devel/b2dec9b3-03a7-e7ac-306e-1da024af8982@amd.com/
> and there have been bug reports to Qubes OS about problems with AMDGPU
> under Xen (such as https://github.com/QubesOS/qubes-issues/issues/7648).

I would say it's a work in progress.  It depends what GPU  you have
and what type of xen setup you are using (PV vs PVH, etc.).  In
general, your best bet currently is dGPU add in boards because they
are largely self contained.  APUs and platforms with integrated dGPUs
are a bit more complicated as they tend to have more platform
dependencies like ACPI tables and methods in order for the driver to
be able to initialize the hardware properly.  Additionally, GPUs map a
lot of system memory so bounce buffers aren't really viable.  You'll
really need IOMMU,

Alex

> --
> Sincerely,
> Demi Marie Obenour (she/her/hers)
> Invisible Things Lab

