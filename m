Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4B6199838
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2020 16:13:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJHa9-0004Hy-Mn; Tue, 31 Mar 2020 14:09:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=DP+J=5Q=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jJHa8-0004Ht-TZ
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 14:09:32 +0000
X-Inumbo-ID: 3dda6074-7359-11ea-b58d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3dda6074-7359-11ea-b58d-bc764e2007e4;
 Tue, 31 Mar 2020 14:09:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CF27EB042;
 Tue, 31 Mar 2020 14:09:30 +0000 (UTC)
Subject: Re: [PATCH v2 3/7] x86/ucode/intel: Remove gratuitous memory
 allocations from cpu_request_microcode()
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200327122901.11569-1-andrew.cooper3@citrix.com>
 <20200327122901.11569-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c366336a-281e-db6f-1930-f7239d44bf4f@suse.com>
Date: Tue, 31 Mar 2020 16:09:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200327122901.11569-4-andrew.cooper3@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 27.03.2020 13:28, Andrew Cooper wrote:
> cpu_request_microcode() needs to scan its container and duplicate one blob,
> but the get_next_ucode_from_buffer() helper duplicates every blob in turn.
> Furthermore, the length checking is only safe from overflow in 64bit builds.
> 
> Delete get_next_ucode_from_buffer() and alter the purpose of the saved
> variable to simply point somewhere in buf until we're ready to return.
> 
> This is only a modest reduction in absolute code size (-144), but avoids
> making memory allocations for every blob in the container.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> v2:
>  * Rebase over struct microcode_patch re-work
>  * Reinstate printk() for bad data

Ooi, did the number mentioned above indeed no change with this?
(I don't mean you to adjust it, as it's precise value is not
really meaningful anyway without also knowing compiler version
etc.)

Jan

