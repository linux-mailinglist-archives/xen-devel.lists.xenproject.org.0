Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CBA1B0C58
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2020 15:14:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQWFI-0006zz-VJ; Mon, 20 Apr 2020 13:13:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=z/8R=6E=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jQWFH-0006zt-ES
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2020 13:13:55 +0000
X-Inumbo-ID: c906f144-8308-11ea-b58d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c906f144-8308-11ea-b58d-bc764e2007e4;
 Mon, 20 Apr 2020 13:13:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4FE38AC92;
 Mon, 20 Apr 2020 13:13:52 +0000 (UTC)
Subject: Re: [PATCH v2] sched: print information about scheduling granularity
To: Sergey Dyasli <sergey.dyasli@citrix.com>
References: <20200420130650.14341-1-sergey.dyasli@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8543ad06-2b98-a211-8360-c57ee9ddafa2@suse.com>
Date: Mon, 20 Apr 2020 15:13:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200420130650.14341-1-sergey.dyasli@citrix.com>
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 20.04.2020 15:06, Sergey Dyasli wrote:
> --- a/xen/common/sched/cpupool.c
> +++ b/xen/common/sched/cpupool.c
> @@ -40,6 +40,30 @@ static DEFINE_SPINLOCK(cpupool_lock);
>  static enum sched_gran __read_mostly opt_sched_granularity = SCHED_GRAN_cpu;
>  static unsigned int __read_mostly sched_granularity = 1;
>  
> +static void sched_gran_print(enum sched_gran mode, unsigned int gran)
> +{
> +    char *str = "";

const please (could easily be added while committing of course)

Jan

