Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 137C81EBC4A
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 15:03:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg6ZJ-0003r3-Dm; Tue, 02 Jun 2020 13:03:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fJyN=7P=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jg6ZH-0003qw-Ey
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 13:02:59 +0000
X-Inumbo-ID: 61d923a8-a4d1-11ea-9dbe-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 61d923a8-a4d1-11ea-9dbe-bc764e2007e4;
 Tue, 02 Jun 2020 13:02:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 20BC9AA7C;
 Tue,  2 Jun 2020 13:03:00 +0000 (UTC)
Subject: Re: [PATCH-for-4.14 v2 1/2] xen: fix build with CONFIG_HYPFS_CONFIG
 enabled
To: Juergen Gross <jgross@suse.com>
References: <20200602125900.4424-1-jgross@suse.com>
 <20200602125900.4424-2-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2b6e9630-8181-d035-cc32-4d4793f1a326@suse.com>
Date: Tue, 2 Jun 2020 15:02:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200602125900.4424-2-jgross@suse.com>
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
 Wei Liu <wl@xen.org>, paul@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 02.06.2020 14:58, Juergen Gross wrote:
> Commit 58263ed7713e ("xen: add /buildinfo/config entry to hypervisor
> filesystem") added a dependency to .config, but the hypervisor's build
> config could be have another name via setting KCONFIG_CONFIG.
> 
> Fix that by using $(KCONFIG_CONFIG) instead. Additionally reference
> the config file via $(XEN_ROOT) instead of a relative path.
> 
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
albeit ...

> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -75,7 +75,8 @@ obj-$(CONFIG_UBSAN) += ubsan/
>  obj-$(CONFIG_NEEDS_LIBELF) += libelf/
>  obj-$(CONFIG_HAS_DEVICE_TREE) += libfdt/
>  
> -config.gz: ../.config
> +CONF_FILE := $(if $(patsubst /%,,$(KCONFIG_CONFIG)),$(XEN_ROOT)/xen/$(KCONFIG_CONFIG),$(KCONFIG_CONFIG))

... I'll be tempted to shorten this to

CONF_FILE := $(if $(patsubst /%,,$(KCONFIG_CONFIG)),$(XEN_ROOT)/xen/)$(KCONFIG_CONFIG)

Jan

