Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1797527C002
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 10:49:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNBKB-0001NX-Ca; Tue, 29 Sep 2020 08:49:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pXYx=DG=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kNBK9-0001NS-Ei
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 08:49:25 +0000
X-Inumbo-ID: 805d3371-ca81-4cca-864e-89111b8c210c
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 805d3371-ca81-4cca-864e-89111b8c210c;
 Tue, 29 Sep 2020 08:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=iG08JebPUihEMEo8XWFgiGnnHff003PLHKIbYZ9ghjU=; b=KDhO6IhGWNdadpqs6r8sBijxqM
 Fk8A3cXuQjU9Oi3gdqbez54tGa1mSElG5FFQ5B3X6n3Fy1CKl08mVEmUePPaxB9o0oYNkYiCPy6Wf
 ZDJuOqusLji56Vg8PoceBmDEO6Pgc5bWcDA/uWZyHmOGuRw4sJ01hPR8bcE9lihOhB/w=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kNBK5-0005KG-HJ; Tue, 29 Sep 2020 08:49:21 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kNBK5-0007iY-4e; Tue, 29 Sep 2020 08:49:21 +0000
Subject: Re: [PATCH 01/12] evtchn: refuse EVTCHNOP_status for Xen-bound event
 channels
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <0d5ffc89-4b04-3e06-e950-f0cb171c7419@suse.com>
 <e7331fa6-e557-4319-6137-2c2525f78822@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <035484d6-4472-c8ec-bc65-756b94ff98b4@xen.org>
Date: Tue, 29 Sep 2020 09:49:19 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <e7331fa6-e557-4319-6137-2c2525f78822@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Jan,

On 28/09/2020 11:56, Jan Beulich wrote:
> Callers have no business knowing the state of the Xen end of an event
> channel.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

> 
> --- a/xen/common/event_channel.c
> +++ b/xen/common/event_channel.c
> @@ -933,6 +933,11 @@ int evtchn_status(evtchn_status_t *statu
>       }
>   
>       chn = evtchn_from_port(d, port);
> +    if ( consumer_is_xen(chn) )
> +    {
> +        rc = -EACCES;
> +        goto out;
> +    }
>   
>       rc = xsm_evtchn_status(XSM_TARGET, d, chn);
>       if ( rc )
> 

-- 
Julien Grall

