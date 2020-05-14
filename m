Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CCA1D2B7C
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 11:32:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZADu-00055o-Oj; Thu, 14 May 2020 09:32:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ezST=64=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jZADt-00055h-ML
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 09:32:13 +0000
X-Inumbo-ID: ca8f3056-95c5-11ea-9887-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ca8f3056-95c5-11ea-9887-bc764e2007e4;
 Thu, 14 May 2020 09:32:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C88BBAFAC;
 Thu, 14 May 2020 09:32:14 +0000 (UTC)
Subject: Re: [PATCH v8 08/12] xen: add /buildinfo/config entry to hypervisor
 filesystem
To: Juergen Gross <jgross@suse.com>
References: <20200508153421.24525-1-jgross@suse.com>
 <20200508153421.24525-9-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2e963c64-a2f0-dde7-ef3d-fd6e91c6e520@suse.com>
Date: Thu, 14 May 2020 11:32:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200508153421.24525-9-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 08.05.2020 17:34, Juergen Gross wrote:
> Add the /buildinfo/config entry to the hypervisor filesystem. This
> entry contains the .config file used to build the hypervisor.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with a remark and one further adjustment:

> @@ -73,3 +74,14 @@ obj-$(CONFIG_UBSAN) += ubsan/
>  
>  obj-$(CONFIG_NEEDS_LIBELF) += libelf/
>  obj-$(CONFIG_HAS_DEVICE_TREE) += libfdt/
> +
> +config.gz: ../.config
> +	gzip -c $< >$@
> +
> +config_data.o: config.gz
> +
> +config_data.S: $(XEN_ROOT)/xen/tools/binfile
> +	$(XEN_ROOT)/xen/tools/binfile $@ config.gz xen_config_data

This will want changing to the changed build infrastructure, such
that in default (non-verbose, non-silent) mode a line gets output
to stdout. But I'd be fine with this getting done subsequently.

> --- a/xen/include/xen/kernel.h
> +++ b/xen/include/xen/kernel.h
> @@ -100,5 +100,8 @@ extern enum system_state {
>  
>  bool_t is_active_kernel_text(unsigned long addr);
>  
> +extern const char xen_config_data;

Surely you meant to add [] here, and then possibly omit the & on
the line using the symbol?

Jan

