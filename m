Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD012BAF8A
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 17:04:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.32498.63537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg8tA-0006dL-3e; Fri, 20 Nov 2020 16:03:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 32498.63537; Fri, 20 Nov 2020 16:03:56 +0000
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
	id 1kg8t9-0006cw-WC; Fri, 20 Nov 2020 16:03:56 +0000
Received: by outflank-mailman (input) for mailman id 32498;
 Fri, 20 Nov 2020 16:03:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xyTX=E2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kg8t8-0006cl-NW
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 16:03:54 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7eb679b1-11a5-4ea6-aa34-5fc261ea0c99;
 Fri, 20 Nov 2020 16:03:53 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B0D04ACC5;
 Fri, 20 Nov 2020 16:03:52 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xyTX=E2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kg8t8-0006cl-NW
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 16:03:54 +0000
X-Inumbo-ID: 7eb679b1-11a5-4ea6-aa34-5fc261ea0c99
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 7eb679b1-11a5-4ea6-aa34-5fc261ea0c99;
	Fri, 20 Nov 2020 16:03:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605888232; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kQuRyDTTo9Vnzyr/gEj6ClA7/m3i6E0omdsh9NeGv60=;
	b=jYVGhZuLaODWsNcgzLVP46xv5fNAN42vQibDSdhrHnJRSu0VbK+WdMwRG521atSZ9hDnG5
	fteSzFfs1vXA8LCHlHLaYZwSr/G8dSKrtoZvf8+IS7C5QUJKU7DcOJSx1PlQeWKgB90yxk
	elQ08DD+VmEJfgnQMvRGEyNoOpGQxEI=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id B0D04ACC5;
	Fri, 20 Nov 2020 16:03:52 +0000 (UTC)
Subject: Re: [PATCH v2 1/7] xen/acpi: Rework acpi_os_map_memory() and
 acpi_os_unmap_memory()
To: Julien Grall <julien@xen.org>
Cc: alex.bennee@linaro.org, masami.hiramatsu@linaro.org, ehem+xen@m5p.com,
 bertrand.marquis@arm.com, andre.przywara@arm.com, Rahul.Singh@arm.com,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20201023154156.6593-1-julien@xen.org>
 <20201023154156.6593-2-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <96a97d2f-90dd-c4a7-5747-825c832ce56d@suse.com>
Date: Fri, 20 Nov 2020 17:03:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201023154156.6593-2-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 23.10.2020 17:41, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> The functions acpi_os_{un,}map_memory() are meant to be arch-agnostic
> while the __acpi_os_{un,}map_memory() are meant to be arch-specific.
> 
> Currently, the former are still containing x86 specific code.
> 
> To avoid this rather strange split, the generic helpers are reworked so
> they are arch-agnostic. This requires the introduction of a new helper
> __acpi_os_unmap_memory() that will undo any mapping done by
> __acpi_os_map_memory().
> 
> Currently, the arch-helper for unmap is basically a no-op so it only
> returns whether the mapping was arch specific. But this will change
> in the future.
> 
> Note that the x86 version of acpi_os_map_memory() was already able to
> able the 1MB region. Hence why there is no addition of new code.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Reviewed-by: Rahul Singh <rahul.singh@arm.com>
> Tested-by: Rahul Singh <rahul.singh@arm.com>

This change breaks shutdown on x86. Either Dom0 no longer requests S5
(in which case I'd expect some data collection there to fail), or Xen
refuses the request. As a result, things go the machine_halt() path
instead. I've looked over the change again, but couldn't spot anything
yet which might explain the behavior. Yet reverting (just the non-Arm
parts, so I wouldn't have to revert multiple commits) made things
work again.

Jan

