Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 916952FEF89
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 16:55:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72236.129913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2cJD-0001sp-55; Thu, 21 Jan 2021 15:55:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72236.129913; Thu, 21 Jan 2021 15:55:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2cJD-0001sQ-1V; Thu, 21 Jan 2021 15:55:43 +0000
Received: by outflank-mailman (input) for mailman id 72236;
 Thu, 21 Jan 2021 15:55:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iH6i=GY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l2cJB-0001sL-JU
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 15:55:41 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a462d292-5800-4c05-bc15-826ae7ead28e;
 Thu, 21 Jan 2021 15:55:40 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 67B6AAB7A;
 Thu, 21 Jan 2021 15:55:39 +0000 (UTC)
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
X-Inumbo-ID: a462d292-5800-4c05-bc15-826ae7ead28e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611244539; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7r/ur9lw+84p8Kl0xxbqnZ/rBVlo+n2eh1OrNlhxdwk=;
	b=A9SSLi1a3z1g3fA5lWGvg4ccxCdbDjY8TjTLu469U1LmA/MFOHGYIhukLxxETCGaauUQnA
	3klZujPtD3uiw2qSDe0TgLN+tZFEfWCYjxi3AVhzZNNifkWbVrOqx0WR1/P69bqKYXUO6h
	yg/Hiog8PTzfaD4/T5+MfmPX6rglanY=
Subject: Re: [PATCH v4 5/5] xen/cpupool: make per-cpupool sched-gran hypfs
 node writable
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Dario Faggioli <dfaggioli@suse.com>,
 xen-devel@lists.xenproject.org
References: <20210118115516.11001-1-jgross@suse.com>
 <20210118115516.11001-6-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d2d99ac9-07e4-68fc-bfaa-51edaff7055b@suse.com>
Date: Thu, 21 Jan 2021 16:55:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210118115516.11001-6-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 18.01.2021 12:55, Juergen Gross wrote:
> Make /cpupool/<id>/sched-gran in hypfs writable. This will enable per
> cpupool selectable scheduling granularity.
> 
> Writing this node is allowed only with no cpu assigned to the cpupool.
> Allowed are values "cpu", "core" and "socket".
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with two small adjustment requests:

> @@ -85,36 +85,43 @@ static int __init sched_select_granularity(const char *str)
>      {
>          if ( strcmp(sg_name[i].name, str) == 0 )
>          {
> -            opt_sched_granularity = sg_name[i].mode;
> +            *mode = sg_name[i].mode;
>              return 0;
>          }
>      }
>  
>      return -EINVAL;
>  }
> +
> +static int __init sched_select_granularity(const char *str)
> +{
> +    return sched_gran_get(str, &opt_sched_granularity);
> +}
>  custom_param("sched-gran", sched_select_granularity);
> +#elif CONFIG_HYPFS

Missing defined().

> @@ -1126,17 +1136,55 @@ static unsigned int hypfs_gran_getsize(const struct hypfs_entry *entry)
>      return strlen(gran) + 1;
>  }
>  
> +static int cpupool_gran_write(struct hypfs_entry_leaf *leaf,
> +                              XEN_GUEST_HANDLE_PARAM(const_void) uaddr,
> +                              unsigned int ulen)
> +{
> +    const struct hypfs_dyndir_id *data;
> +    struct cpupool *cpupool;
> +    enum sched_gran gran;
> +    unsigned int sched_gran = 0;
> +    char name[SCHED_GRAN_NAME_LEN];
> +    int ret = 0;
> +
> +    if ( ulen > SCHED_GRAN_NAME_LEN )
> +        return -ENOSPC;
> +
> +    if ( copy_from_guest(name, uaddr, ulen) )
> +        return -EFAULT;
> +
> +    if ( memchr(name, 0, ulen) == (name + ulen - 1) )
> +        sched_gran = sched_gran_get(name, &gran) ?
> +                     0 : cpupool_check_granularity(gran);
> +    if ( sched_gran == 0 )
> +        return -EINVAL;
> +
> +    data = hypfs_get_dyndata();
> +    cpupool = data->data;
> +    ASSERT(cpupool);
> +
> +    if ( !cpumask_empty(cpupool->cpu_valid) )
> +        ret = -EBUSY;
> +    else
> +    {
> +        cpupool->gran = gran;
> +        cpupool->sched_gran = sched_gran;
> +    }

I think this could do with a comment clarifying what lock this
is protected by, as the function itself has no sign of any
locking, not even an assertion that a certain lock is being held.
If you were to suggest some text, this as well as the minor issue
above could likely be taken care of while committing.

Jan

