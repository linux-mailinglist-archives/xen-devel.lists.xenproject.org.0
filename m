Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 191F37D88F1
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 21:31:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623959.972289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qw63f-0002aT-Sd; Thu, 26 Oct 2023 19:30:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623959.972289; Thu, 26 Oct 2023 19:30:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qw63f-0002Yd-Pv; Thu, 26 Oct 2023 19:30:19 +0000
Received: by outflank-mailman (input) for mailman id 623959;
 Thu, 26 Oct 2023 19:30:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z2QB=GI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qw63e-0002YX-1M
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 19:30:18 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1610e8e0-7436-11ee-98d5-6d05b1d4d9a1;
 Thu, 26 Oct 2023 21:30:16 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7BE56CE3FC3;
 Thu, 26 Oct 2023 19:30:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27096C433C8;
 Thu, 26 Oct 2023 19:30:10 +0000 (UTC)
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
X-Inumbo-ID: 1610e8e0-7436-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698348610;
	bh=iymV6sGjgVauPfGbWU1lqHoHgT9biz7JtDNLa0H18E0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VI8jz8hIQvFY3U3DJfcnZetaFcVkfK8EnsMO2sSmVx4dQdKuBHNg0CqqWczNdC5Im
	 cfvnN77NavAux9wOR3B9zjaMNY7vMh40mHHtDbU0NqiEYbM/GWvBfXdN+QKc6cCTfw
	 wykYcMjUWWJp9oLpHR6UEkXlSJBzelJ0IUoX/0pq02PawciZQPo0z3ihoaA4/5Z3UD
	 A1sSGqnPnPHY+NvZaRO3V//3g+YJwdFtt5uH7Y+Cuh8JtTCI8YnL3jAtTuRWj5KmrC
	 T2JtA5EmYS5DZi1B81NEkpVqKJULjm6pYbQzqym1x/KY2pm6GDt93RhxLj4QmaYSVp
	 kYILza9KPbSgw==
Date: Thu, 26 Oct 2023 12:30:08 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <luca.fancellu@arm.com>
cc: xen-devel@lists.xenproject.org, wei.chen@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [for-4.19 PATCH 1/2] cppcheck: rework exclusion_file_list.py
 code
In-Reply-To: <20231026103243.2077516-2-luca.fancellu@arm.com>
Message-ID: <alpine.DEB.2.22.394.2310261230010.271731@ubuntu-linux-20-04-desktop>
References: <20231026103243.2077516-1-luca.fancellu@arm.com> <20231026103243.2077516-2-luca.fancellu@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 26 Oct 2023, Luca Fancellu wrote:
> Rework the exclusion_file_list.py code to have the function
> load_exclusion_file_list() detached from the xen-analysis.py tool,
> in a way so that other modules can use the function.
> The xen-analysis tool and in particular its module cppcheck_analysis.py
> will use a new function cppcheck_exclusion_file_list().
> 
> No functional changes are intended.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

