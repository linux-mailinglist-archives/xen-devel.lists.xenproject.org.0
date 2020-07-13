Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 968AC21D8E7
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2020 16:49:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1juzkD-0005zk-4B; Mon, 13 Jul 2020 14:47:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S1uT=AY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1juzkB-0005zf-R7
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2020 14:47:47 +0000
X-Inumbo-ID: d0bee1de-c517-11ea-926b-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d0bee1de-c517-11ea-926b-12813bfff9fa;
 Mon, 13 Jul 2020 14:47:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 34F2DAB55;
 Mon, 13 Jul 2020 14:47:48 +0000 (UTC)
Subject: Re: [PATCH v2] docs: specify stability of hypfs path documentation
To: Juergen Gross <jgross@suse.com>
References: <20200713140338.16172-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8a96b1b9-cbcb-557a-5b82-661bbe40fe25@suse.com>
Date: Mon, 13 Jul 2020 16:47:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200713140338.16172-1-jgross@suse.com>
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

On 13.07.2020 16:03, Juergen Gross wrote:
> In docs/misc/hypfs-paths.pandoc the supported paths in the hypervisor
> file system are specified. Make it more clear that path availability
> might change, e.g. due to scope widening or narrowing (e.g. being
> limited to a specific architecture).
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Release-acked-by: Paul Durrant <paul@xen.org>

Acked-by: Jan Beulich <jbeulich@suse.com>

However, I'd like agreement by at least one other REST maintainer on
...

> @@ -55,6 +58,11 @@ tags enclosed in square brackets.
>  * CONFIG_* -- Path is valid only in case the hypervisor was built with
>    the respective config option.
>  
> +In case a tag for a path indicates that this path is available in some
> +case only, this availability might be extended or reduced in future by
> +modification or removal of the tag. A path once assigned meaning won't go
> +away altogether or change its meaning, though.

... the newly imposed guarantee we're now making. We really want to
avoid declaring something as stable without being quite certain we
can keep it stable.

Jan

