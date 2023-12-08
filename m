Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03ECB8097A1
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 01:50:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650288.1015667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBP4I-0005nT-KR; Fri, 08 Dec 2023 00:50:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650288.1015667; Fri, 08 Dec 2023 00:50:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBP4I-0005kS-GT; Fri, 08 Dec 2023 00:50:14 +0000
Received: by outflank-mailman (input) for mailman id 650288;
 Fri, 08 Dec 2023 00:50:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RvmJ=HT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rBP4H-0005kM-FN
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 00:50:13 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc591f22-9563-11ee-9b0f-b553b5be7939;
 Fri, 08 Dec 2023 01:50:10 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 56DBD62241;
 Fri,  8 Dec 2023 00:50:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03126C433C8;
 Fri,  8 Dec 2023 00:50:06 +0000 (UTC)
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
X-Inumbo-ID: bc591f22-9563-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701996608;
	bh=zmQdo+B6WuD7ueSIZ4jgwHm5py5TIxg5iLgpDLowmQw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JpwvrVuMufxKeCLEdL4i1JCyx9EbfS07vMXm/OIkOcnmocCXQNrmhqEE54qYGTXM9
	 MS3hU1kR61v3BWjxioIIpFE/eu5r4N2Q4hhbmekmE+68UyDt4JMSHlI2xediUJ6vuP
	 KYYcuQBG9UBfSrk+G6cxS4ZiYuxxVmZrm0GemKo3fv5Etk3ouJxG5PEtSDvtvNpK+R
	 M9tS2Pg9BoQ8dygWZ2GGbkyOGL/8czB7vpqV6yb4w79ICIXia5O8NpfbXHJR2t9/9B
	 w4joimxAxVjdxyiF0GiarYOwN35dsltW8zqbBU6HUrHF/AHNy3sKmWABCWqdGyy5lX
	 umFxlIM7KcuiA==
Date: Thu, 7 Dec 2023 16:50:05 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/3] xen/x86: address violations of MISRA C:2012 Rule
 14.4
In-Reply-To: <d494980216b8f0f870083fcfae7269f45e779780.1701941924.git.maria.celeste.cesario@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2312071647140.1265976@ubuntu-linux-20-04-desktop>
References: <cover.1701941924.git.maria.celeste.cesario@bugseng.com> <d494980216b8f0f870083fcfae7269f45e779780.1701941924.git.maria.celeste.cesario@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 7 Dec 2023, Simone Ballarin wrote:
> From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
> 
> The xen sources contain violations of MISRA C:2012 Rule 14.4 whose
> headline states:
> "The controlling expression of an if statement and the controlling
> expression of an iteration-statement shall have essentially Boolean type".
> 
> Add comparisons to avoid using enum constants as controlling expressions
> to comply with Rule 14.4.
> No functional change.
> 
> Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
> Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>

I think it would have been better to put all the iommu_intremap changed
in the same patch (patch #1). But anyway:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


