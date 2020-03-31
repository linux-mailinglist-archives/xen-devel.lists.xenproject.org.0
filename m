Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3A8198CF9
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2020 09:32:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJBLr-00015s-Hu; Tue, 31 Mar 2020 07:30:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=DP+J=5Q=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jJBLp-00015l-HD
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 07:30:21 +0000
X-Inumbo-ID: 7a007abc-7321-11ea-ba05-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7a007abc-7321-11ea-ba05-12813bfff9fa;
 Tue, 31 Mar 2020 07:30:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 37060AEA3;
 Tue, 31 Mar 2020 07:30:20 +0000 (UTC)
Subject: Re: [PATCH 2/8] xen/public: sysctl: set_parameter.params and
 debug.keys should be const
To: Julien Grall <julien@xen.org>
References: <20200330192157.1335-1-julien@xen.org>
 <20200330192157.1335-3-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <81a7f1a5-6fce-a996-9bcb-0fe6dfe05e30@suse.com>
Date: Tue, 31 Mar 2020 09:30:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200330192157.1335-3-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, dfaggioli@suse.com,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 30.03.2020 21:21, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> The fields set_parameter.params and debug.keys should never be modified
> by the hypervisor. So mark them as const.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> I am not entirely sure whether we should bump the systcl version for
> this change. Any thoughts?

No, it should be left as is - it's about _binary_ compatibility (e.g.
if structure layout changes, or a sub-function gets dropped). The
need to potentially address build issues resulting from changes like
the one here isn't covered by it, but by the __XEN__ / __XEN_TOOLS__
conditional at the top of the header.

Jan

