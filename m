Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 871322DFFB7
	for <lists+xen-devel@lfdr.de>; Mon, 21 Dec 2020 19:29:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.57520.100687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krPvE-0001tu-8U; Mon, 21 Dec 2020 18:28:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57520.100687; Mon, 21 Dec 2020 18:28:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krPvE-0001tU-4t; Mon, 21 Dec 2020 18:28:40 +0000
Received: by outflank-mailman (input) for mailman id 57520;
 Mon, 21 Dec 2020 18:28:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1krPvC-0001tL-Kg
 for xen-devel@lists.xenproject.org; Mon, 21 Dec 2020 18:28:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1krPvB-000384-4m; Mon, 21 Dec 2020 18:28:37 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1krPvA-0003Nk-Pp; Mon, 21 Dec 2020 18:28:37 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=Y/euKdNMGL3snMT4AoD3RkSaZRDr4keLc+9TFDXw8IY=; b=6VET6jgd6pxToJMrmgL4cyl0wl
	RLzAGjcPpKijh5X3Nvbx+NqK8oTKeGJrOs7f4bFbrK9D6zBJOArR8sJr77MbDf7HeJoXOSlpMeP36
	xRuZocZRDzb5dnsG4K9JhuDmSs4LHmJ3NS+R/xRmp3Yv8O1FmNWwZJCfSClmR6yZuGrE=;
Subject: Re: [RESEND] [RFC PATCH] xen/arm: domain_build: Ignore empty memory
 bank
To: Elliott Mitchell <ehem+xen@m5p.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Ian Jackson <iwj@xenproject.org>
References: <X+DbupqYE3rrFaIM@mattapan.m5p.com>
From: Julien Grall <julien@xen.org>
Message-ID: <102a361a-a070-185f-c564-8e4c30f96ab6@xen.org>
Date: Mon, 21 Dec 2020 18:28:35 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <X+DbupqYE3rrFaIM@mattapan.m5p.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Elliott,

I was planning to review the first version today, but as you sent a new 
version I will answer on this one directly.

On 21/12/2020 17:30, Elliott Mitchell wrote:
> Previously Xen had stopped processing Device Trees if an empty
> (size == 0) memory bank was found.
> 
> Commit 5a37207df52066efefe419c677b089a654d37afc changed this behavior to
> ignore such banks.  Unfortunately this means these empty nodes are
> visible to code which accesses the device trees.  Have domain_build also
> ignore these entries.

I am probably missing something here. The commit you pointed out will 
only take care of memory nodes (including reserved-memory).

It should not be possible to reach handle_device() with actual RAM. 
Although, it would with the reserved memory node.

Could you provide a bit more details on the issue? In particular, I am 
interested to see the offending node and its content.

> ---
> This is tagged "RFC" due to issues.
> 
> Authorship of this is unclean.  In the first version (checked in, but
> never sent to the list and never compiled) a different condition was used
> and the comment was absent.  When examing the code it became clear a
> condition identical to
> 5a37207df52066efefe419c677b089a654d37afc was appropriate and so I changed
> to !size.  Since what the code is doing was sufficiently similar, the
> comment was grabbed.
> How far does this dilute authorship?  I diagnosed the bug and figured out
> where to add the lines, but the amount inspired by Julien Grall gives
> Julien Grall some level of claim of authorship.  Advice is needed.

You did all the investigation of the bug and the code is small enough. 
So I think it is fine for you to claim the authorship.

> 
> Commit 7d2b21fd36c2a47799eed71c67bae7faa1ec4272 is an outright bug for
> me.  I don't know what percentage of users will experience this bug, but
> being observed this quickly suggests this is major enough to be urgent
> for the stable-4.14 branch.

We usually work on fix for upstream first and then backport it.

> I doubt this is the only bug exposed by
> 5a37207df52066efefe419c677b089a654d37afc.

Are you saying that with my patch dropped, Xen will boot but with it 
will not?

> This might actually effect
> most uses of the device-tree code.  I think either the core needs to be
> fixed to hide zero-sized entries from anything outside of
> xen/common/device_tree.c, otherwise all uses of the device-tree core need
> to be audited to ensure they ignore zero-sized entries.

The meaning of zero-sized is not the same everywhere. In the case of 
memory banks, it can be safely ignored.

For other devices (e.g. GIC), hiding it may make things worse because a 
size 0 means the node is bogus.

> Notably this is
> the second location where zero-size device-tree entries need to be
> ignored, preemptive action should be taken before a third is found by
> bugreport. >
> Perhaps this fix is appropriate for the stable-4.14 branch and a proper
> solution should be implemented for the main branch?
> 
> The error message which first showed was
> "Unable to retrieve address %u for %s\n".  Where the number in %u was
> 0, this seems a poor error message.  Version 0.1 (which never got
> compiled) had been:  if(!addr) continue;

Usually, dt_get_address() will fail because it can't translate the 
address, not because the size is 0. The more...

> 
> As I thought the 0 it was reporting was an address of 0.  Perhaps the
> message should instead be:
> "Unable to retrieve address for index %u of %s\n"?
> ---
>   xen/arch/arm/domain_build.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index e824ba34b0..0b83384bd3 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1405,6 +1405,11 @@ static int __init handle_device(struct domain *d, struct dt_device_node *dev,
>       {
>           struct map_range_data mr_data = { .d = d, .p2mt = p2mt };
>           res = dt_device_get_address(dev, i, &addr, &size);
> +
> +        /* Some DT may describe empty bank, ignore them */
> +        if ( !size )
> +            continue;

... dt_device_get_address() will not set the size if the node is bogus. 
So you can't rely on either addr or size when res is non-zero.

handle_device() (at least on unstable) will not initialize the two 
variables to 0. So I guess you are lucky that you compiler zeroed them 
for you, but that's not the normal behavior.

So I think we first need to figure out what is the offending node and 
why it is dt_device_get_address() is returning an error for it.

That said, I agree that we possibly want a check size == 0 (action TBD) 
in map_range_to_domain() as the code would do the wrong thing for 0.

>           if ( res )
>           {
>               printk(XENLOG_ERR "Unable to retrieve address %u for %s\n",
> 

Cheers,

-- 
Julien Grall

