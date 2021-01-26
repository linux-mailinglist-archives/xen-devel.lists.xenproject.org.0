Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A441D3038C6
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 10:16:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74672.134196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4KS1-0004iF-OI; Tue, 26 Jan 2021 09:15:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74672.134196; Tue, 26 Jan 2021 09:15:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4KS1-0004hq-L4; Tue, 26 Jan 2021 09:15:53 +0000
Received: by outflank-mailman (input) for mailman id 74672;
 Tue, 26 Jan 2021 09:15:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4KRz-0004hl-St
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 09:15:51 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dbcd273d-2be0-4931-b7fc-bb0718d39d03;
 Tue, 26 Jan 2021 09:15:50 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0BF76B2C5;
 Tue, 26 Jan 2021 09:15:50 +0000 (UTC)
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
X-Inumbo-ID: dbcd273d-2be0-4931-b7fc-bb0718d39d03
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611652550; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ukZDcrCHahxAwFcetXyANyapzGMUJH+kMCl2CGjM00A=;
	b=N4fJagN1DgOMv21SuWrVaN2ANqR5DqkFd02HUEmKs6ssRbxTBZAWY9dwIrHLG8USrgebGK
	xVbTFrHV2BBdFBQw+fU5bxV/KJpLUtkgdclQQ2SJEXbsKnzvxiWT6k9ovsfaub1ZeJpo5o
	gSg5gwK6q9z1vcNU3eqdUt0eq++Iu0o=
Subject: Re: [PATCH V5 14/22] arm/ioreq: Introduce arch specific bits for
 IOREQ/DM features
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
 <1611601709-28361-15-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ff05bfd8-150a-1dbc-8c25-c922ee863146@suse.com>
Date: Tue, 26 Jan 2021 10:15:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <1611601709-28361-15-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 25.01.2021 20:08, Oleksandr Tyshchenko wrote:
> --- a/xen/include/xen/dm.h
> +++ b/xen/include/xen/dm.h
> @@ -19,6 +19,8 @@
>  
>  #include <xen/sched.h>
>  
> +#include <public/hvm/dm_op.h>
> +
>  struct dmop_args {
>      domid_t domid;
>      unsigned int nr_bufs;

How come this becomes necessary at this point in the series, when
nothing else in this header changes, and nothing changes in the
public headers at all? Is it perhaps a .c file that needs the
#include instead? Headers shouldn't pull in other headers without
clear need - as indicated in reply to a prior version, we have
way too many bad examples (causing headaches in certain cases),
and we'd like to avoid gaining more. (Oh, I notice you actually
have a post-commit-message remark about this, but then this
patch should be marked RFC until the issue was resolved.)

Jan

