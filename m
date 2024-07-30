Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD41942389
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 01:45:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768138.1178899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYwWo-0006rH-8I; Tue, 30 Jul 2024 23:45:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768138.1178899; Tue, 30 Jul 2024 23:45:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYwWo-0006oI-4U; Tue, 30 Jul 2024 23:45:14 +0000
Received: by outflank-mailman (input) for mailman id 768138;
 Tue, 30 Jul 2024 23:45:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0AIz=O6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sYwWm-0006My-N6
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 23:45:12 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c1f08adb-4ecd-11ef-8776-851b0ebba9a2;
 Wed, 31 Jul 2024 01:45:11 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BB8F1620D4;
 Tue, 30 Jul 2024 23:45:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F288C32782;
 Tue, 30 Jul 2024 23:45:08 +0000 (UTC)
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
X-Inumbo-ID: c1f08adb-4ecd-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722383109;
	bh=a+vHT8Nm+k0WX4XnQot8QkxL0cHiny+p2cpRNMPAlwU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Fxb6Vz0GzYCzJfCPH9eNRDRmb8snVdo2W3uKaksQyUZ9t1KDtDWmwhcyN5BPsYnBK
	 x6RS2+lM/ifYT/MLuYdKAdFFf8NJcMxu5Orr9pA57LM+dSrrvLEQ4yh8VT+BQumV7f
	 oLrV4XR3Xwlv9J+EdOnXxjfXZHTSFb4wgdbCe+35fLMEaWfWXuSjUiADWhuWrcnb9L
	 IyYkT+pMY27Szxs4QK96K2m+AQrD4AK6xk1BcPgu31HczWRn0VbD4ym2e0WY++/Xr4
	 IrTaudUqj7JN9KeLf9x5qPQkiU0lXzgiVhP7hLi8EmF5okEfF2/l5DcbBvph2R4wOS
	 fDLm6XrTU1eyw==
Date: Tue, 30 Jul 2024 16:45:08 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Jan Beulich <JBeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH 3/4] xen/domain: Simpliy domain_create() now the idle
 domain is complete earlier
In-Reply-To: <20240718215744.3892072-4-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2407301644480.4857@ubuntu-linux-20-04-desktop>
References: <20240718215744.3892072-1-andrew.cooper3@citrix.com> <20240718215744.3892072-4-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 18 Jul 2024, Andrew Cooper wrote:
> With x86 implementing arch_init_idle_domain(), there is no longer any need to
> call arch_domain_create() with the idle domain.
> 
> Have the idle domain exit early with all other system domains.  Move the
> static-analysis ASSERT() earlier.  Then, remove the !is_idle_domain()
> protections around the majority of domain_create() and remove one level of
> indentation.
> 
> No practical change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


