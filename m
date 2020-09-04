Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F214825D3BE
	for <lists+xen-devel@lfdr.de>; Fri,  4 Sep 2020 10:34:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kE7B3-0005dN-Ml; Fri, 04 Sep 2020 08:34:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=saQb=CN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kE7B2-0005dC-5Q
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 08:34:32 +0000
X-Inumbo-ID: 22bea200-5e74-4a72-bbf3-586a093a282f
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 22bea200-5e74-4a72-bbf3-586a093a282f;
 Fri, 04 Sep 2020 08:34:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8EC9EB655;
 Fri,  4 Sep 2020 08:34:31 +0000 (UTC)
Subject: Re: [PATCH v3 1/8] x86/vmx: handle writes to MISC_ENABLE MSR
To: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <20200901105445.22277-1-roger.pau@citrix.com>
 <20200901105445.22277-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <82aff399-52f3-c0af-f467-e110c94dddc6@suse.com>
Date: Fri, 4 Sep 2020 10:34:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200901105445.22277-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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

On 01.09.2020 12:54, Roger Pau Monne wrote:
> Such handling consist in checking that no bits have been changed from
> the read value, if that's the case silently drop the write, otherwise
> inject a fault.
> 
> At least Windows guests will expect to write to the MISC_ENABLE MSR
> with the same value that's been read from it.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
>  xen/arch/x86/hvm/vmx/vmx.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)

Btw - early next week I think I'll time out waiting for a VMX side
ack for this change.

Jan

