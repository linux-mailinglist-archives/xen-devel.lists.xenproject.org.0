Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D41BF1BFFFC
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 17:20:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUAyi-0007sy-N0; Thu, 30 Apr 2020 15:19:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H9qc=6O=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jUAyh-0007st-1v
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 15:19:55 +0000
X-Inumbo-ID: 0a7cdab8-8af6-11ea-ae69-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0a7cdab8-8af6-11ea-ae69-bc764e2007e4;
 Thu, 30 Apr 2020 15:19:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A26AFAF01;
 Thu, 30 Apr 2020 15:19:51 +0000 (UTC)
Subject: Re: [PATCH 2/3] xen/sched: fix theoretical races accessing
 vcpu->dirty_cpu
To: xen-devel@lists.xenproject.org
References: <20200430151559.1464-1-jgross@suse.com>
 <20200430151559.1464-3-jgross@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <2bc16586-4937-9019-795d-9e54ea3e2c21@suse.com>
Date: Thu, 30 Apr 2020 17:19:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430151559.1464-3-jgross@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 30.04.20 17:15, Juergen Gross wrote:
> The dirty_cpu field of struct vcpu denotes which cpu still holds data
> of a vcpu. All accesses to this field should be atomic in case the
> vcpu could just be running, as it is accessed without any lock held
> in most cases.
> 
> There are some instances where accesses are not atomically done, and
> even worse where multiple accesses are done when a single one would
> be mandated.
> 
> Correct that in order to avoid potential problems.
> 
> Add some assertions to verify dirty_cpu is handled properly.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Please ignore this one, just realized it doesn't build for ARM.


Juergen

