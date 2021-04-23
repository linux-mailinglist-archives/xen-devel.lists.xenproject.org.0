Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB4A368FAC
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 11:45:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.116018.221398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZsNU-00030s-Rc; Fri, 23 Apr 2021 09:45:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116018.221398; Fri, 23 Apr 2021 09:45:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZsNU-00030T-O8; Fri, 23 Apr 2021 09:45:36 +0000
Received: by outflank-mailman (input) for mailman id 116018;
 Fri, 23 Apr 2021 09:45:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vTXC=JU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZsNT-00030L-FA
 for xen-devel@lists.xenproject.org; Fri, 23 Apr 2021 09:45:35 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6fee097a-eeee-4c85-9fe6-997d0b23c85e;
 Fri, 23 Apr 2021 09:45:34 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 48E87AC7D;
 Fri, 23 Apr 2021 09:45:33 +0000 (UTC)
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
X-Inumbo-ID: 6fee097a-eeee-4c85-9fe6-997d0b23c85e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619171133; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XLQV4kiqmFdESHxAW6tg9GDsZLiRz9sApRi0SZPZ9QM=;
	b=lDWCATq0IuJ7JjrQjmqWHk4bQX8Jl5PZZJO3iHzzBgk3vbGfamX19wAPLdwiBhfZbfwm+E
	Q+N3kh06dnUnWNMXaJbem7ROk/GelTHF0BZYJrFh/BuqC/CdEBOERTGyoB+/0omvGbP7nU
	uESo2YFrHq49XvzSpZW/9afBaXUCAFo=
Subject: Re: [PATCH 1/2] x86/oprofile: fix oprofile for clang build
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210423094343.5850-1-roger.pau@citrix.com>
 <20210423094343.5850-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b1bac4bc-f406-b111-a46a-fb407eabceb3@suse.com>
Date: Fri, 23 Apr 2021 11:45:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210423094343.5850-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 23.04.2021 11:43, Roger Pau Monne wrote:
> Clang complains with:
> 
> backtrace.c:46:19: error: unused function 'is_32bit_vcpu' [-Werror,-Wunused-function]
> static inline int is_32bit_vcpu(struct vcpu *vcpu)
>                   ^
> 
> Fix this by guarding the function with CONFIG_COMPAT, as it's only
> caller is also doing so.
> 
> Fixes: d23d792478d ('x86: avoid building COMPAT code when !HVM && !PV32')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

See my "x86/oprof: fix !HVM && !PV32 build" from the 16th.

Jan

