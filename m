Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A2F8C6FA2
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 02:46:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722731.1126994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7PFo-000152-OZ; Thu, 16 May 2024 00:45:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722731.1126994; Thu, 16 May 2024 00:45:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7PFo-00012T-Lw; Thu, 16 May 2024 00:45:52 +0000
Received: by outflank-mailman (input) for mailman id 722731;
 Thu, 16 May 2024 00:45:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcFO=MT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s7PFm-00012J-Sz
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 00:45:50 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a38cfcbe-131d-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 02:45:49 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B304061616;
 Thu, 16 May 2024 00:45:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0F5DC116B1;
 Thu, 16 May 2024 00:45:46 +0000 (UTC)
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
X-Inumbo-ID: a38cfcbe-131d-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715820348;
	bh=897RYxPsxTHuVRECkO/nYLXZsj4jFRfOyYR5LD47M9k=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ew50qXNyYZ/dLI5g3rNOXjNXUUY1nIH4lj7k4okyqpVR4VjjUAaA+Ia/t4BBbNhGI
	 AcOzBFyqhcTv0MKhjC7/xWwPC+1b7rDGQbPzfIK0Im9TSNHHUpWKP0r7zGvx+tozqy
	 24WN/ZiIUffM03GMPydQVpeM5CjKhb4bfaEi8JQSGHN/T+bs2YLK5x5F96Dr+aWxLz
	 ISloXLiPW99a96ZWxOT5sl37Kii6tvF4niOknC2DpithuzfVU9o1A6ju0puQzjU+9P
	 UVtZVefZBZBzTZbJM9UHiUXiGE1L1qzCHuxZb7sl18m5rvQUTk3HL4nGHz64iM7jCK
	 8pa+MeDDw02Hw==
Date: Wed, 15 May 2024 17:45:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Subject: Re: [XEN PATCH v2 09/15] x86/traps: clean up superfluous #idef-s
In-Reply-To: <7f0b98062ce67ad8176670efbe3c3ebdb43d2b1c.1715761386.git.Sergiy_Kibrik@epam.com>
Message-ID: <alpine.DEB.2.22.394.2405151745360.2544314@ubuntu-linux-20-04-desktop>
References: <cover.1715761386.git.Sergiy_Kibrik@epam.com> <7f0b98062ce67ad8176670efbe3c3ebdb43d2b1c.1715761386.git.Sergiy_Kibrik@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 15 May 2024, Sergiy Kibrik wrote:
> Remove preprocessor checks for CONFIG_HVM option, because expressions covered
> by these checks are already guarded by cpu_has_vmx, which itself depends
> on CONFIG_HVM option (via CONFIG_VMX).
> 
> No functional change intended.
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>

Nice!

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


