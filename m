Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE697223DE4
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jul 2020 16:16:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jwR9x-0006AF-Sl; Fri, 17 Jul 2020 14:16:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/fKj=A4=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jwR9w-0006AA-A7
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2020 14:16:20 +0000
X-Inumbo-ID: 15b84e74-c838-11ea-bca7-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 15b84e74-c838-11ea-bca7-bc764e2007e4;
 Fri, 17 Jul 2020 14:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nWS351F+OF9AZ16aEseAnYuJazPxdKXmf/c7Syxfwh0=; b=xOvSKzYwiHRWMhx4mpZgWNeoH1
 m+LjjgV9r68N27sPNqXN++EvWbn0UHl27gPzhzutE54rGD29UUtSZOclCUrFzC8TnthYaMNyzlDRO
 iGcxvIFtNxXVSAugz+j+xSdBYGe0GN4bvFt0NwtPUWQmj2hiaZeRjtOZbpacnjYPDwZE=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jwR9s-0007dm-Cw; Fri, 17 Jul 2020 14:16:16 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jwR9s-0000jy-5j; Fri, 17 Jul 2020 14:16:16 +0000
Subject: Re: [PATCH v6 01/11] memory: batch processing in acquire_resource()
To: Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>
References: <cover.1594150543.git.michal.leszczynski@cert.pl>
 <02415890e4e8211513b495228c790e1d16de767f.1594150543.git.michal.leszczynski@cert.pl>
 <83100b6c-3a06-e379-bef0-fcbd8fdcce98@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <81a874b6-d64c-24e6-d7d0-a6ff57a2ba86@xen.org>
Date: Fri, 17 Jul 2020 15:16:13 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <83100b6c-3a06-e379-bef0-fcbd8fdcce98@suse.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, tamas.lengyel@intel.com,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, luwei.kang@intel.com,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 15/07/2020 13:28, Jan Beulich wrote:
> May I ask that you drop the if() around this block of code?
> 
> Also, looking at this, I wonder whether it's a good idea to use the
> "start extent" model here anyway: You could as well update the
> struct (saying that it may be clobbered in the public header) and
> copy the whole thing back to the original guest struct. This would
> then remove the pretty arbitrary "UINT_MAX >> MEMOP_EXTENT_SHIFT"
> limit you currently need to enforce. The main question is whether
> we'd consider such an adjustment to an existing interface
> acceptable; there's an at least theoretical risk that it may break
> existing callers. Then again no existing caller can sensibly have
> specified a count above 32, and when the copying back would be
> limited to just the continuation case, no such caller would be
> affected in any way afaict.

I can see two risks with this approach:
    1) There is no requirement for the 'arg' buffer to be in read-write 
memory.
    2) A guest may expect to re-use the value within the structure after 
the hypercalls.

So I think the "start extent" model is better. This is already used in 
other memory sub-hypercalls, so the risk to break existing users is more 
limited.

Cheers,

-- 
Julien Grall

