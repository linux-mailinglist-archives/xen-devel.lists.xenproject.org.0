Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B34B911FF3
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2024 11:03:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.745137.1152293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKaA0-0001El-E5; Fri, 21 Jun 2024 09:02:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 745137.1152293; Fri, 21 Jun 2024 09:02:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKaA0-0001CJ-Ae; Fri, 21 Jun 2024 09:02:20 +0000
Received: by outflank-mailman (input) for mailman id 745137;
 Fri, 21 Jun 2024 09:02:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BNSN=NX=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1sKa9y-0001CD-PA
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2024 09:02:18 +0000
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [2607:f8b0:4864:20::c35])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f4e25dfd-2fac-11ef-b4bb-af5377834399;
 Fri, 21 Jun 2024 11:02:16 +0200 (CEST)
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-5c19d338401so872949eaf.0
 for <xen-devel@lists.xenproject.org>; Fri, 21 Jun 2024 02:02:16 -0700 (PDT)
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
X-Inumbo-ID: f4e25dfd-2fac-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1718960535; x=1719565335; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=McodRIC87u9bhDhJyxOpy6e8jfj9BZt6jkX1PhJdSRE=;
        b=Km31+jwQObFmGhErrku5mFJNKbGmP+3g4C1FrAGTUJFQ2TLqvOkiY7gsbhF6Oz323b
         Hh+EyiEPRVFu5M5nxPy557cFqY4ruCbke5gux9tLB3+aB1xPXPrjIGXfKuV6rJqiKi9g
         5Wya37A6gm0kd5v//sQEntBBAFrh69cdV32ng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718960535; x=1719565335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=McodRIC87u9bhDhJyxOpy6e8jfj9BZt6jkX1PhJdSRE=;
        b=PnP2lfNgC9o2WsfEWcqrFz2daVseawU39AUUquqVDt/mVe5IGewFwJCPmkhph75iEz
         EwzT/xyen0K1d7kQR8DlGm0km804m9rxI8aPmtSGvrTBs/vXbWdH+T7RQBUfy20GWwYP
         nYs48Bch3m9XIY/zLi5ozRUidM52N2pnFgKh6z5magaL4GTJCNZRcIvzk6xNqLMzCenI
         /eW5ZlN84YdPqErq72FvO4TzbhFN9sP5fVnyqCaXjeMuPmt/YPARIjDthkA4TJKelWQV
         ktPID7oO83Hto7rbpl8SIu6cVT3lwjarM/m2Vifq1e9sgEp/MMVZ6FfC2Kx8NKRf4JLh
         AMDw==
X-Gm-Message-State: AOJu0YyDcNo18zIfx9HwTTuTxoPmN2CnEae2nb1NJpqTJscwshDzjwaR
	tHCwMvOtWO6ng47pc7LhCoers32EDeTjKPiWhvYw9x8n0Z7WfCjgSxf/baD6qL/VUWJdUj9P/L2
	hBEGArx4kbzyKMqXqZdRv4CiEgkUWOHMrQcS4gA==
X-Google-Smtp-Source: AGHT+IGua3W/8XFYTCTmCz9RNjwwGAwWMI76YhNGQhSVHJedDS0RVnsu0VVpvQMJaOpak8hypVPHYXDxN3iSTRz1Bgs=
X-Received: by 2002:a05:6870:b28a:b0:254:96ec:bc44 with SMTP id
 586e51a60fabf-25c94a1f0ddmr8347130fac.28.1718960535449; Fri, 21 Jun 2024
 02:02:15 -0700 (PDT)
MIME-Version: 1.0
References: <5b6dfc7571bd76b5546d3881bd660a4e7a745409.1718928467.git.victorm.lira@amd.com>
In-Reply-To: <5b6dfc7571bd76b5546d3881bd660a4e7a745409.1718928467.git.victorm.lira@amd.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Fri, 21 Jun 2024 10:02:04 +0100
Message-ID: <CA+zSX=bCUUP8AVeLy9fMjSSqEHGnpJCUnGUgGT1kZ-i6eiWZXg@mail.gmail.com>
Subject: Re: [XEN PATCH] common/sched: address a violation of MISRA C Rule 8.8
To: victorm.lira@amd.com
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
	Stewart Hildebrand <stewart.hildebrand@amd.com>, Dario Faggioli <dfaggioli@suse.com>, 
	Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 21, 2024 at 1:21=E2=80=AFAM <victorm.lira@amd.com> wrote:
>
> From: Victor Lira <victorm.lira@amd.com>
>
> Rule 8.8: "The static storage class specifier shall be used in all
> declarations of objects and functions that have internal linkage"
>
> This patch fixes this by adding the static specifier.
> No functional changes.
>
> Reported-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> Signed-off-by: Victor Lira <victorm.lira@amd.com>

With the changes noted already:

Acked-by: George Dunlap <george.dunlap@cloud.com>

