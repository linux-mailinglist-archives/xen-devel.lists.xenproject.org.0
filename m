Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E83E584CBCB
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 14:41:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677594.1054298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXiBA-000571-Bo; Wed, 07 Feb 2024 13:41:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677594.1054298; Wed, 07 Feb 2024 13:41:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXiBA-00054K-8f; Wed, 07 Feb 2024 13:41:32 +0000
Received: by outflank-mailman (input) for mailman id 677594;
 Wed, 07 Feb 2024 13:41:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rXiB8-000548-9K
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 13:41:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rXiB7-0002QX-QF; Wed, 07 Feb 2024 13:41:29 +0000
Received: from [15.248.2.25] (helo=[10.24.67.29])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rXiB7-00082H-KO; Wed, 07 Feb 2024 13:41:29 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=zcOA5p3mqf4Dg5+yjoHYeX6pM7rYcgT5lxB287zKftI=; b=SkxGDrCG1Ijva3yNyyngIquqlt
	TiI7kMt5jMn9Ejr8v7Q4vk9i58O/MNZztTxb9PMWPC/mhKMIx5uIdhEk+MGtZxGmRk3st1KTthbDr
	N4f6hMFEDhg0VIei+Q1AQX3+6lmdIlrfv+NwPk6du9/y/m8B+IqueiGE78RJlR2Ui3JA=;
Message-ID: <13384e3e-c947-4cb3-a39a-b1ef801f0d12@xen.org>
Date: Wed, 7 Feb 2024 13:41:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] config: update Mini-OS commit
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20240207133106.6185-1-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240207133106.6185-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 07/02/2024 13:31, Juergen Gross wrote:
> Update the Mini-OS upstream revision.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>   Config.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Config.mk b/Config.mk
> index f7d6d84847..077d841bb7 100644
> --- a/Config.mk
> +++ b/Config.mk
> @@ -224,7 +224,7 @@ QEMU_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/qemu-xen.git
>   QEMU_UPSTREAM_REVISION ?= master
>   
>   MINIOS_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/mini-os.git
> -MINIOS_UPSTREAM_REVISION ?= 090eeeb1631f00a9a41ebf66d9b4aacb97eb51e7
> +MINIOS_UPSTREAM_REVISION ?= b119f0178fd86876d0678007dfcf435ab8bb7568

I looked at the changes and I am puzzled by one. In p9_stat(), I see a 
call with:

   free_stat(&stat);

'stat' is defined as 'struct p9_stat *stat' and 'free_stat' expects a 
'struct p9_stat'.

Wouldn't this resuilt to a build error?

Cheers,

-- 
Julien Grall

