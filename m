Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A496A88A2D
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 19:45:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.951048.1347190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4NsE-0000Hl-MC; Mon, 14 Apr 2025 17:45:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 951048.1347190; Mon, 14 Apr 2025 17:45:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4NsE-0000F8-J6; Mon, 14 Apr 2025 17:45:34 +0000
Received: by outflank-mailman (input) for mailman id 951048;
 Mon, 14 Apr 2025 17:45:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1u4NsC-0000F2-W2
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 17:45:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1u4NsC-00EzdP-1a;
 Mon, 14 Apr 2025 17:45:32 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1u4NsC-00Gx2A-0d;
 Mon, 14 Apr 2025 17:45:32 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=YJ479cbZTBAhBAiHOFwCpLnbNTSMn3nwNWM/z0lyndA=; b=wZudPI8+YA2cVW6zDxqAw8rqGi
	dUyvLJ3dDHFjB0/1CYBmUXpbvN4dgr+QfY1aXDBONj/t5c5HeTFm8Kp4ojIP15UE3F8UPhzjj3mYB
	QDeuLcxzi+DLhngbiCWF01gSyMeiZQrw3Xw60W5FbTN2m5Aau6TgUKsr8WPuYEB/r6FQ=;
Date: Mon, 14 Apr 2025 19:45:30 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v3 6/6] CI: Include microcode for x86 hardware jobs
Message-ID: <Z_1JuudeZAXihzwb@l14>
References: <20250414110903.2355303-1-andrew.cooper3@citrix.com>
 <20250414110903.2355303-7-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414110903.2355303-7-andrew.cooper3@citrix.com>

On Mon, Apr 14, 2025 at 12:09:03PM +0100, Andrew Cooper wrote:
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index 1b82b359d01f..ac5367874526 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -306,6 +306,7 @@ alpine-3.18-gcc-debug:
>        CONFIG_ARGO=y
>        CONFIG_UBSAN=y
>        CONFIG_UBSAN_FATAL=y
> +      CONFIG_UCODE_SCAN_DEFAULT=y

Is there a change that this patch series gets backported? Because that
new Kconfig option won't exist.

Othewise, patch looks fine:
Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 
Anthony PERARD

