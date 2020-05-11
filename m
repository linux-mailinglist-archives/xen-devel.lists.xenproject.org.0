Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1601CD397
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2020 10:16:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jY3bf-0001FD-9R; Mon, 11 May 2020 08:16:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tfUY=6Z=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jY3be-0001F7-0v
 for xen-devel@lists.xenproject.org; Mon, 11 May 2020 08:16:10 +0000
X-Inumbo-ID: ab12708e-935f-11ea-a1f5-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ab12708e-935f-11ea-a1f5-12813bfff9fa;
 Mon, 11 May 2020 08:16:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3810CB07B;
 Mon, 11 May 2020 08:16:11 +0000 (UTC)
Subject: Re: [PATCH] xen/cpuhotplug: Fix initial CPU offlining for PV(H) guests
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <1588976923-3667-1-git-send-email-boris.ostrovsky@oracle.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <8a94d819-5143-58e2-9bd2-1cc341ba3a80@suse.com>
Date: Mon, 11 May 2020 10:16:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1588976923-3667-1-git-send-email-boris.ostrovsky@oracle.com>
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
Cc: sstabellini@kernel.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 09.05.20 00:28, Boris Ostrovsky wrote:
> Commit a926f81d2f6c ("xen/cpuhotplug: Replace cpu_up/down() with
> device_online/offline()") replaced cpu_down() with device_offline()
> call which requires that the CPU has been registered before. This
> registration, however, happens later from topology_init() which
> is called as subsys_initcall(). setup_vcpu_hotplug_event(), on the
> other hand, is invoked earlier, during arch_initcall().
> 
> As result, booting a PV(H) guest with vcpus < maxvcpus causes a crash.
> 
> Move setup_vcpu_hotplug_event() (and therefore setup_cpu_watcher()) to
> late_initcall(). In addition, instead of performing all offlining steps
> in setup_cpu_watcher() simply call disable_hotplug_cpu().
> 
> Fixes: a926f81d2f6c (xen/cpuhotplug: Replace cpu_up/down() with device_online/offline()"
> Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen

