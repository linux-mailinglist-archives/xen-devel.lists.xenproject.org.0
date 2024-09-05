Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD5296E608
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2024 01:04:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791460.1201330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smLWZ-00084y-1Q; Thu, 05 Sep 2024 23:04:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791460.1201330; Thu, 05 Sep 2024 23:04:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smLWY-00082X-UX; Thu, 05 Sep 2024 23:04:22 +0000
Received: by outflank-mailman (input) for mailman id 791460;
 Thu, 05 Sep 2024 23:04:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KMVQ=QD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1smLWX-00082R-Sx
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2024 23:04:21 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e2572be-6bdb-11ef-99a1-01e77a169b0f;
 Fri, 06 Sep 2024 01:04:19 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8FD855C5C8D;
 Thu,  5 Sep 2024 23:04:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAD6DC4CEC3;
 Thu,  5 Sep 2024 23:04:15 +0000 (UTC)
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
X-Inumbo-ID: 2e2572be-6bdb-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725577457;
	bh=IIHI97oHkvD7q/BHJz7Ooxg6O6FLw2nTbamd4yoYZEE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=B++djAbvDE3qQFIcLvX7OatrU8lv05IkaYNO1Z7btf0MFwocJJvVQ1Q1sBO1j/gVf
	 T69rwyOhsgAf+RxFp3j0QoZaaS6diYsSpgGXX2jz3j8VqFQsf7b7GuVBNAimGlZbZB
	 V4NmxTWVYcddGmLNK+y+JifTJ3ZEE5/3uS2WZzIZIjVJRqqKn6UU7cZvRjFXsgMinP
	 uR0iAPTdpxKGp768YEoWlvLLb6f4tUBK2fmGQHP2IdbhGYO+NocZg8WvpqSMhl3pkS
	 uSlF2hoVls0yZEIzNSHr1Kfr0nFI9tZyXkDc3r69CpalMw6ksxHg1NAUM9y+0C2TNU
	 Cgh4+7ibuKuDQ==
Date: Thu, 5 Sep 2024 16:04:14 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, Jan Beulich <JBeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: Re: [PATCH v3 2/5] xen/bitops: Drop the remnants of
 hweight{8,16}()
In-Reply-To: <20240904225530.3888315-3-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2409051604080.53815@ubuntu-linux-20-04-desktop>
References: <20240904225530.3888315-1-andrew.cooper3@citrix.com> <20240904225530.3888315-3-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 4 Sep 2024, Andrew Cooper wrote:
> They are no more.  No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


