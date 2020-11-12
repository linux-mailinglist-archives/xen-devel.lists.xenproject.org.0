Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4028A2B03ED
	for <lists+xen-devel@lfdr.de>; Thu, 12 Nov 2020 12:33:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25709.53651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdAqM-0002fG-I8; Thu, 12 Nov 2020 11:32:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25709.53651; Thu, 12 Nov 2020 11:32:46 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdAqM-0002et-Ew; Thu, 12 Nov 2020 11:32:46 +0000
Received: by outflank-mailman (input) for mailman id 25709;
 Thu, 12 Nov 2020 11:32:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2UFB=ES=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kdAqK-0002eo-T6
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 11:32:44 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ea525d32-fe24-4fbe-b9a4-989e21023fea;
 Thu, 12 Nov 2020 11:32:44 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 496C5AE95;
 Thu, 12 Nov 2020 11:32:43 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2UFB=ES=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kdAqK-0002eo-T6
	for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 11:32:44 +0000
X-Inumbo-ID: ea525d32-fe24-4fbe-b9a4-989e21023fea
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ea525d32-fe24-4fbe-b9a4-989e21023fea;
	Thu, 12 Nov 2020 11:32:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605180763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+6eocP+7M7OPePQ+4EPQUhWrSB+LV7BUOWte+//Gnzs=;
	b=g5WHe1JwBz5hLH4mf7r2B9V0NrHuqLJ+NmUT1pXP1UB/OIcn9QfKjh97v+kFDpJJEKls7q
	hV4phG0iYfX4ZSj3GE4AsjPJ6PQ9phY6OtU0kb1Y8rKQputFPQzLvf7kUL8PmmEkwdR/90
	x4UcwQSb0JesVVkJQvwTKIX4OAvF6m8=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 496C5AE95;
	Thu, 12 Nov 2020 11:32:43 +0000 (UTC)
Subject: Re: [PATCH V2 09/23] xen/dm: Make x86's DM feature common
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Julien Grall <julien.grall@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
 <1602780274-29141-10-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3f432fdb-0625-4803-3a16-62200a6264ca@suse.com>
Date: Thu, 12 Nov 2020 12:32:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <1602780274-29141-10-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 15.10.2020 18:44, Oleksandr Tyshchenko wrote:
> From: Julien Grall <julien.grall@arm.com>
> 
> As a lot of x86 code can be re-used on Arm later on, this patch
> splits devicemodel support into common and arch specific parts.
> 
> The common DM feature is supposed to be built with IOREQ_SERVER
> option enabled (as well as the IOREQ feature), which is selected
> for x86's config HVM for now.

Did you consider doing it the other way around? It would seem
more natural to have the top level dm-op handling arch-specific
and call into e.g. ioreq_server_dm_op() for otherwise unhandled
ops, just like e.g. do_domctl() calls into iommu_do_domctl()
(indirectly via arch_do_domctl()). I ask because in the long
run I expect the ioreq server sub-ops to only be a small part
of the overall set of dm-ops; already now it's 7 out of 18 if
I got the counting right.

This would then also leave compat_dm_op() in x86 code.

But yes, there are also downsides with this alternative.

Jan

