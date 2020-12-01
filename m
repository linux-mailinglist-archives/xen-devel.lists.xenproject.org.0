Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D24DF2C9A47
	for <lists+xen-devel@lfdr.de>; Tue,  1 Dec 2020 10:01:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41758.75174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk1Wk-0002LE-IW; Tue, 01 Dec 2020 09:00:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41758.75174; Tue, 01 Dec 2020 09:00:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk1Wk-0002Kp-FS; Tue, 01 Dec 2020 09:00:50 +0000
Received: by outflank-mailman (input) for mailman id 41758;
 Tue, 01 Dec 2020 09:00:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KrUB=FF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kk1Wi-0002Kk-FP
 for xen-devel@lists.xenproject.org; Tue, 01 Dec 2020 09:00:48 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 11074f4f-65cf-41f5-83f0-a50536beda04;
 Tue, 01 Dec 2020 09:00:47 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BBD9AACA8;
 Tue,  1 Dec 2020 09:00:46 +0000 (UTC)
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
X-Inumbo-ID: 11074f4f-65cf-41f5-83f0-a50536beda04
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606813246; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7C9N7AXS0BopIlIGgXrPcBYo/B9HhXxAUyIPjqTIqmU=;
	b=GQaxkkaShDPVV0mMRfi8G+mdNcWQoHLbzisF3SmUM3dO0PmsCdr1q/gLOvfUDku0sOnsLr
	wRr1opE38nsFqUDM59ewvN0pJJ1pziKPirvVOq00CSkpty6NjZe/etXsNIKUcLhhFqTBFe
	g3Ye51MENuouI4nnfbhb5bUeqfQT0EU=
Subject: Re: [PATCH v2 15/17] xen/cpupool: add cpupool directories
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Dario Faggioli <dfaggioli@suse.com>,
 xen-devel@lists.xenproject.org
References: <20201201082128.15239-1-jgross@suse.com>
 <20201201082128.15239-16-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <07118fab-6252-eb37-5844-b63e5dfc0976@suse.com>
Date: Tue, 1 Dec 2020 10:00:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201201082128.15239-16-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01.12.2020 09:21, Juergen Gross wrote:
> Add /cpupool/<cpupool-id> directories to hypfs. Those are completely
> dynamic, so the related hypfs access functions need to be implemented.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - added const (Jan Beulich)

Any particular reason this doesn't extend to ...

> @@ -1003,12 +1006,131 @@ static struct notifier_block cpu_nfb = {
>      .notifier_call = cpu_callback
>  };
>  
> +#ifdef CONFIG_HYPFS
> +static const struct hypfs_entry *cpupool_pooldir_enter(
> +    const struct hypfs_entry *entry);
> +
> +static struct hypfs_funcs cpupool_pooldir_funcs = {

... this (similarly in the next patch)? Granted I didn't look at
the hypfs patches yet, but I don't suppose these struct instances
need to be writable.

Jan

