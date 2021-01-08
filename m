Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 314A42EF511
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jan 2021 16:45:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63666.113016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxtxF-00078S-01; Fri, 08 Jan 2021 15:45:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63666.113016; Fri, 08 Jan 2021 15:45:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxtxE-000782-Su; Fri, 08 Jan 2021 15:45:32 +0000
Received: by outflank-mailman (input) for mailman id 63666;
 Fri, 08 Jan 2021 15:45:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3tJ2=GL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kxtxD-00077x-8w
 for xen-devel@lists.xenproject.org; Fri, 08 Jan 2021 15:45:31 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9544472e-d7c2-4119-8f0d-41c7144f2b42;
 Fri, 08 Jan 2021 15:45:30 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 766D1ADD8;
 Fri,  8 Jan 2021 15:45:29 +0000 (UTC)
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
X-Inumbo-ID: 9544472e-d7c2-4119-8f0d-41c7144f2b42
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610120729; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3VEyoWpsC22uijHbrK0zhQv54Rw0rdwXv8W4HoLrGOc=;
	b=uo1Wi0uamPfK/9jh9K8yoP5mVqF/+rmDPplOH7p53IJYduH49ShF84knLZULr1f1Tn4fWS
	DHsu2DJrTa1KVVSTq0FqvvA5WL6jL81s4uRnroBYsV66Lu4MHbUubTQkUx+rqzy4py+bxd
	AjE5uE+Y5h91a8qgMh0I83Nq+Jk1Kjg=
Subject: Re: [PATCH] x86/hypercall: fix gnttab hypercall args conditional
 build on pvshim
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210108154251.59952-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2d014990-6a13-0139-8fde-7e6c0d5e5707@suse.com>
Date: Fri, 8 Jan 2021 16:45:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210108154251.59952-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 08.01.2021 16:42, Roger Pau Monne wrote:
> A pvshim build doesn't require the grant table functionality built in,
> but it does require knowing the number of arguments the hypercall has
> so the hypercall parameter clobbering works properly.
> 
> Instead of also setting the argument count for the gnttab case if PV
> shim functionality is enabled, just drop all of the conditionals from
> hypercall_args_table, as a hypercall having a NULL handler won't get
> to use that information anyway.
> 
> Note this hasn't been detected by osstest because the tools pvshim
> build is done without debug enabled, so the hypercall parameter
> clobbering doesn't happen.
> 
> Fixes: d2151152dd2 ('xen: make grant table support configurable')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

