Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 348044CE517
	for <lists+xen-devel@lfdr.de>; Sat,  5 Mar 2022 14:56:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.285148.484394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQUsf-0005b7-BO; Sat, 05 Mar 2022 13:55:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 285148.484394; Sat, 05 Mar 2022 13:55:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQUsf-0005Y8-88; Sat, 05 Mar 2022 13:55:33 +0000
Received: by outflank-mailman (input) for mailman id 285148;
 Sat, 05 Mar 2022 13:55:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SXtQ=TQ=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1nQUsd-0005Y2-Iy
 for xen-devel@lists.xenproject.org; Sat, 05 Mar 2022 13:55:31 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea800dc6-9c8b-11ec-8eba-a37418f5ba1a;
 Sat, 05 Mar 2022 14:55:29 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5EC0CB80C72;
 Sat,  5 Mar 2022 13:55:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E65DC004E1;
 Sat,  5 Mar 2022 13:55:26 +0000 (UTC)
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
X-Inumbo-ID: ea800dc6-9c8b-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1646488527;
	bh=BQrokMzSMloe/hyjVeBHCLDN0uRptwXDCXljI99iSGQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BjIAle22LuRoNHbItvtz5QjSdGbq1MZjYCdl1AcMg7OlUzfENaPvI9sCCynbnn903
	 oxjhERhiWX0Hb8MU9JkY7ZF54ZL1HDQii67RN47huVWuAo2CtdIyOPQsGbAgRbrm8z
	 OygsfFEKIuzNf8aqHKsAagzzfYBaQq7n2iL5yjXQ=
Date: Sat, 5 Mar 2022 14:55:23 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: zhanglianjie <zhanglianjie@uniontech.com>
Cc: Juergen Gross <jgross@suse.com>, David Vrabel <david.vrabel@citrix.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH] drivers/xen: use helper macro __ATTR_RW
Message-ID: <YiNry3TtIPbEh1Yr@kroah.com>
References: <20220305133823.158961-1-zhanglianjie@uniontech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220305133823.158961-1-zhanglianjie@uniontech.com>

On Sat, Mar 05, 2022 at 09:38:23PM +0800, zhanglianjie wrote:
> Use helper macro __ATTR_RW to define HYPERVISOR_ATTR_RW to make code more clear.
> Minor readability improvement.
> 
> Signed-off-by: zhanglianjie <zhanglianjie@uniontech.com>

Is this the name you sign legal documents with?  (I have to ask...)

> 
> diff --git a/drivers/xen/sys-hypervisor.c b/drivers/xen/sys-hypervisor.c
> index feb1d16252e7..fcb0792f090e 100644
> --- a/drivers/xen/sys-hypervisor.c
> +++ b/drivers/xen/sys-hypervisor.c
> @@ -22,11 +22,10 @@
>  #endif
> 
>  #define HYPERVISOR_ATTR_RO(_name) \
> -static struct hyp_sysfs_attr  _name##_attr = __ATTR_RO(_name)
> +static struct hyp_sysfs_attr _name##_attr = __ATTR_RO(_name)

Why change this line?  That's not relevant to this change :(

thanks,

greg k-h

