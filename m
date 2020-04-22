Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F40A41B411F
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2020 12:50:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRCxM-0005jD-P8; Wed, 22 Apr 2020 10:50:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9j4T=6G=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jRCxL-0005j8-LX
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2020 10:50:15 +0000
X-Inumbo-ID: 0bdf5acc-8487-11ea-b58d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0bdf5acc-8487-11ea-b58d-bc764e2007e4;
 Wed, 22 Apr 2020 10:50:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id F1F18AC22;
 Wed, 22 Apr 2020 10:50:12 +0000 (UTC)
Subject: Re: [PATCH v3] sched: print information about scheduling granularity
To: Sergey Dyasli <sergey.dyasli@citrix.com>
References: <20200422093010.12940-1-sergey.dyasli@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b8f74570-fc9f-61c5-7e52-c2a50e8350dc@suse.com>
Date: Wed, 22 Apr 2020 12:50:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200422093010.12940-1-sergey.dyasli@citrix.com>
Content-Type: text/plain; charset=utf-8
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22.04.2020 11:30, Sergey Dyasli wrote:
> --- a/xen/common/sched/cpupool.c
> +++ b/xen/common/sched/cpupool.c
> @@ -40,19 +40,50 @@ static DEFINE_SPINLOCK(cpupool_lock);
>  static enum sched_gran __read_mostly opt_sched_granularity = SCHED_GRAN_cpu;
>  static unsigned int __read_mostly sched_granularity = 1;
>  
> +struct sched_gran_name {
> +    enum sched_gran mode;
> +    const char *name;
> +};
> +
> +static const struct sched_gran_name sg_name[] = {
> +    {SCHED_GRAN_cpu, "cpu"},
> +    {SCHED_GRAN_core, "core"},
> +    {SCHED_GRAN_socket, "socket"},
> +};

Personally I think that in cases like this one it is more
(space) efficient to use char[8] or so for the second
struct member.

Jan

