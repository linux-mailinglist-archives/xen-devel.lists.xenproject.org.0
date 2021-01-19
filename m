Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 519DD2FB4DA
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jan 2021 10:14:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.70211.125923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1n5U-00084V-3n; Tue, 19 Jan 2021 09:14:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 70211.125923; Tue, 19 Jan 2021 09:14:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1n5U-000846-0Q; Tue, 19 Jan 2021 09:14:08 +0000
Received: by outflank-mailman (input) for mailman id 70211;
 Tue, 19 Jan 2021 09:14:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U8Ox=GW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l1n5S-000841-Dl
 for xen-devel@lists.xenproject.org; Tue, 19 Jan 2021 09:14:06 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9c232df1-5f7e-4dc3-a54a-dcd581e167cb;
 Tue, 19 Jan 2021 09:14:05 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 71B40AD17;
 Tue, 19 Jan 2021 09:14:04 +0000 (UTC)
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
X-Inumbo-ID: 9c232df1-5f7e-4dc3-a54a-dcd581e167cb
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611047644; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k7gmz56+hjNBOEwDkp7Jv8sTqI0ORE6fWyo6F5Pa7e4=;
	b=H/bgFioH+iG2rFquLSuR4RD4Uy5z///0+F6kj8KgfD346rjkOcLqbFY8RDc6rbev6mpGsi
	2+wfS614Cyp8gIfrd6DOpbWypoPe65VO9Urscl9f0AGTfN3+7hAzERYZ8dKgp1C6lDr9Vl
	92iGd0krmFDfHUjZfHT9GWVVrOVwg5g=
Subject: Re: [PATCH] xen/domain: Introduce vcpu_teardown()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210119003206.2255-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e12e7387-0020-6085-a048-4c253808af48@suse.com>
Date: Tue, 19 Jan 2021 10:14:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210119003206.2255-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 19.01.2021 01:32, Andrew Cooper wrote:
> Similarly to c/s 98d4d6d8a6 "xen/domain: Introduce domain_teardown()",
> introduce a common mechanism for restartable per-vcpu teardown logic.
> 
> Extend the PROGRESS() mechanism to support saving and restoring the vcpu loop
> variable across hypercalls.
> 
> This will eventually supersede domain_reliquish_resources(), and reduce the
> quantity of redundant logic performed.
> 
> No functional change (yet).
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
albeit perhaps with a name or type change:

> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -532,6 +532,7 @@ struct domain
>       */
>      struct {
>          unsigned int val;
> +        struct vcpu *ptr;
>      } teardown;

I think the field either wants to be generic (and then of type void *)
or specific (and then be named "vcpu"). Which one is better certainly
depends on possibly anticipated future usage.

Jan

