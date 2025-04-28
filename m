Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C464A9FD3C
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 00:48:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.971243.1359711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9XGE-0004hg-0W; Mon, 28 Apr 2025 22:47:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 971243.1359711; Mon, 28 Apr 2025 22:47:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9XGD-0004gA-Ts; Mon, 28 Apr 2025 22:47:37 +0000
Received: by outflank-mailman (input) for mailman id 971243;
 Mon, 28 Apr 2025 22:47:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u4d+=XO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u9XGC-0004g4-5q
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 22:47:36 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5491aa0-2482-11f0-9ffb-bf95429c2676;
 Tue, 29 Apr 2025 00:47:33 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A65DE5C63F5;
 Mon, 28 Apr 2025 22:45:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1084C4CEE4;
 Mon, 28 Apr 2025 22:47:29 +0000 (UTC)
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
X-Inumbo-ID: c5491aa0-2482-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745880451;
	bh=lVB+zbkL6tNab2bg5504SQvzXNn0GlEGb7EWxDuiTIw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kLZNSwiRkBOrBHjrpJeNBeX8BuFKktnb7f28y4hd3DtvCJkZ27+msnt4/DV5ylMMS
	 xZzBExKgDL/jHnEqNS4/QWv8lZp8Cc52iYO9HBRlTcVzWD2AarbmBHUwsvScWCClYb
	 Oi9EctH3qMye/DEZhv4oIDHb1Vs7kcTD6JlawqfBsYusmfiiIU5W+A46+KzprMn3v5
	 NJVfEx1irZLB/oKJqxQDujy/YdbMlhsU6vt6/zwkqIesMADb30v/FwsYzl/NGZVfvN
	 QCoyHikT0kWZaDfLJmOlLCsQBnjt3esmYsoBBNGqfgCgnrwuClhKvxrS8XzwGLD9cw
	 iusmRKdvnb9/w==
Date: Mon, 28 Apr 2025 15:47:28 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Victor Lira <victorm.lira@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Federico Serafini <federico.serafini@bugseng.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH v1 2/2] automation/eclair: add Rule 14.3 to the monitored
 set
In-Reply-To: <d5e278584038bb8410bf81d0c67ebfbc5464caba.1745625477.git.victorm.lira@amd.com>
Message-ID: <alpine.DEB.2.22.394.2504281547090.785180@ubuntu-linux-20-04-desktop>
References: <5f2e316aae4667d1fe851e68552eb881c4d5a015.1745625477.git.victorm.lira@amd.com> <d5e278584038bb8410bf81d0c67ebfbc5464caba.1745625477.git.victorm.lira@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-92807636-1745880451=:785180"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-92807636-1745880451=:785180
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 25 Apr 2025, victorm.lira@amd.com wrote:
> From: Federico Serafini <federico.serafini@bugseng.com>
> 
> MISRA C Rule 14.3 is already tagged as clean: add it to the
> monitored set to avoid regressions.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> Signed-off-by: Victor Lira <victorm.lira@amd.com>

Assuming the previous patch gets accepted:

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: Anthony PERARD <anthony.perard@vates.tech>
> Cc: Michal Orzel <michal.orzel@amd.com>
> Cc: Jan Beulich <jbeulich@suse.com>
> Cc: Julien Grall <julien@xen.org>
> Cc: Roger Pau Monné <roger.pau@citrix.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Cc: Federico Serafini <federico.serafini@bugseng.com>
> Cc: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> 
>  automation/eclair_analysis/ECLAIR/monitored.ecl | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/monitored.ecl b/automation/eclair_analysis/ECLAIR/monitored.ecl
> index 8351996ec8..ca2f5e3c7f 100644
> --- a/automation/eclair_analysis/ECLAIR/monitored.ecl
> +++ b/automation/eclair_analysis/ECLAIR/monitored.ecl
> @@ -53,6 +53,7 @@
>  -enable=MC3A2.R13.2
>  -enable=MC3A2.R13.6
>  -enable=MC3A2.R14.1
> +-enable=MC3A2.R14.3
>  -enable=MC3A2.R14.4
>  -enable=MC3A2.R16.2
>  -enable=MC3A2.R16.3
> --
> 2.47.0
> 
--8323329-92807636-1745880451=:785180--

