Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2612722C3
	for <lists+xen-devel@lfdr.de>; Mon, 21 Sep 2020 13:41:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKKBQ-000855-IH; Mon, 21 Sep 2020 11:40:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wcPU=C6=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kKKBP-00084x-Bn
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2020 11:40:35 +0000
X-Inumbo-ID: dcc67a4e-35de-42d9-8d0f-241693b1b223
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dcc67a4e-35de-42d9-8d0f-241693b1b223;
 Mon, 21 Sep 2020 11:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:References:Cc:To:From:Subject;
 bh=AlBbjW7/cdCMOUxu4JInEhQwZusQVzJjTLp9zfcFOhA=; b=lbFoOg+phl489YwGSRN8/nIERK
 EHxON8qICqwuNnW/EMkFhJdb7nISGCt3gfTiqMoMbsQMuV0QSmxMvX8/yO9+3cgJWj7VH37cBXEIx
 1jD8z0CrWKBl4wpLdo516+ZQ6EuVRa6r4u7IBFt2yOLUf9CPlfh361c3gzrxOrDgPWQE=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kKKBN-0007lq-Rz; Mon, 21 Sep 2020 11:40:33 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kKKBN-0006jU-La; Mon, 21 Sep 2020 11:40:33 +0000
Subject: Re: Memory ordering question in the shutdown deferral code
From: Julien Grall <julien@xen.org>
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Paul Durrant <pdurrant@amazon.com>
Cc: "Xia, Hongyan" <hongyxia@amazon.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <468576ba-8d3f-98e9-e65e-1128b5220d40@xen.org>
Message-ID: <a75efed4-d435-1746-85ab-a87b328c1101@xen.org>
Date: Mon, 21 Sep 2020 12:40:31 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <468576ba-8d3f-98e9-e65e-1128b5220d40@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

(+ Xen-devel)

Sorry I forgot to CC xen-devel.

On 21/09/2020 12:38, Julien Grall wrote:
> Hi all,
> 
> I have started to look at the deferral code (see 
> vcpu_start_shutdown_deferral()) because we need it for LiveUpdate and 
> Arm will soon use it.
> 
> The current implementation is using an smp_mb() to ensure ordering 
> between a write then a read. The code looks roughly (I have slightly 
> adapted it to make my question more obvious):
> 
> domain_shutdown()
>      d->is_shutting_down = 1;
>      smp_mb();
>      if ( !vcpu0->defer_shutdown )
>      {
>        vcpu_pause_nosync(v);
>        v->paused_for_shutdown = 1;
>      }
> 
> vcpu_start_shutdown_deferral()
>      vcpu0->defer_shutdown = 1;
>      smp_mb();
>      if ( unlikely(d->is_shutting_down) )
>        vcpu_check_shutdown(v);
> 
>      return vcpu0->defer_shutdown;
> 
> smp_mb() should only guarantee ordering (this may be stronger on some 
> arch), so I think there is a race between the two functions.
> 
> It would be possible to pause the vCPU in domain_shutdown() because 
> vcpu0->defer_shutdown wasn't yet seen.
> 
> Equally, vcpu_start_shutdown_deferral() may not see d->is_shutting_down 
> and therefore Xen may continue to send the I/O. Yet the vCPU will be 
> paused so the I/O will never complete.
> 
> I am not fully familiar with the IOREQ code, but it sounds to me this is 
> not the behavior that was intended. Can someone more familiar with the 
> code confirm it?
> 
> Cheers,
> 

-- 
Julien Grall

