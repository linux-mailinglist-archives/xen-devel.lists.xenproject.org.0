Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A0B368FC1
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 11:49:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.116026.221421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZsQc-0003J6-Ix; Fri, 23 Apr 2021 09:48:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116026.221421; Fri, 23 Apr 2021 09:48:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZsQc-0003Ik-Fk; Fri, 23 Apr 2021 09:48:50 +0000
Received: by outflank-mailman (input) for mailman id 116026;
 Fri, 23 Apr 2021 09:48:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vTXC=JU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZsQb-0003Id-JB
 for xen-devel@lists.xenproject.org; Fri, 23 Apr 2021 09:48:49 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e62f7b4b-99a4-40ce-b599-06a2658f35ac;
 Fri, 23 Apr 2021 09:48:48 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4FFDCAC7D;
 Fri, 23 Apr 2021 09:48:47 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: e62f7b4b-99a4-40ce-b599-06a2658f35ac
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619171327; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=olQh/0u/QqXQ6bnr5oUfQpcU+9ISJ5zhq0LgcY0oSuk=;
	b=gEAdhAIVYeHYSRujChrS+xVXVvdoENKjHisyXR3O5WDwDdf/km0/n+NH9bEzjogIkcVd9K
	zY+NscJtwHLHqZy0All2tDBCbrJ8XPrMHoBWpOeKpdMVJpuEHAWIk8V8dBDaLIMZ3SGa/K
	w5MQrP3CRQj0m0p63K0+E1VKw0IYZ6c=
Subject: Re: [PATCH 2/2] x86/pv: fix clang build without CONFIG_PV32
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210423094343.5850-1-roger.pau@citrix.com>
 <20210423094343.5850-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4282c7fb-4561-29c1-2bf8-18a50c5530ef@suse.com>
Date: Fri, 23 Apr 2021 11:48:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210423094343.5850-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 23.04.2021 11:43, Roger Pau Monne wrote:
> Clang reports the following build error without CONFIG_PV:
> 
> hypercall.c:253:10: error: variable 'op' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
>     if ( !is_pv_32bit_vcpu(curr) )
>          ^~~~~~~~~~~~~~~~~~~~~~~
> hypercall.c:282:21: note: uninitialized use occurs here
>     return unlikely(op == __HYPERVISOR_iret)
>                     ^~
> /root/src/xen/xen/include/xen/compiler.h:21:43: note: expanded from macro 'unlikely'
> #define unlikely(x)   __builtin_expect(!!(x),0)
>                                           ^
> hypercall.c:253:5: note: remove the 'if' if its condition is always true
>     if ( !is_pv_32bit_vcpu(curr) )
>     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> hypercall.c:251:21: note: initialize the variable 'op' to silence this warning
>     unsigned long op;
>                     ^
>                      = 0
> 
> Rearrange the code in arch_do_multicall_call so that the if guards the
> 32bit branch and when CONFIG_PV32 is not set there's no conditional at
> all.
> 
> Fixes: 527922008bc ('x86: slim down hypercall handling when !PV32')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

I find it odd for the compiler to warn like this, but well ...
Acked-by: Jan Beulich <jbeulich@suse.com>

> Should the is_pv_32bit_vcpu be wrapped in an unlikely hint?

Not sure. Andrew did some similar rearrangement elsewhere for
other reasons, without adding unlikely(). Personally I think
we'd better add them, but then preferably add consistently as
possible.

Jan

