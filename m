Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D22ED55877B
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 20:28:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355122.582594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4RYY-00038O-0m; Thu, 23 Jun 2022 18:27:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355122.582594; Thu, 23 Jun 2022 18:27:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4RYX-00035l-UH; Thu, 23 Jun 2022 18:27:53 +0000
Received: by outflank-mailman (input) for mailman id 355122;
 Thu, 23 Jun 2022 18:27:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o4RYW-00035f-IL
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 18:27:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4RYW-00037D-BN; Thu, 23 Jun 2022 18:27:52 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.0.239]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4RYW-0001jr-4s; Thu, 23 Jun 2022 18:27:52 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=vqi+5J+xYLjIcS3T8bw+ELiCQCid09kSbgk89Kae82g=; b=q24Em/EylNde4ER2+Fws8uAQ2/
	gMz9fQ6drj1Xc1yDOeWDcHO1VfcdUan9M5TPDFMuQHPjtzW/JpuRg/iJXysz8K4i/VrWIaYBVldC7
	KqnvlqFz6dv7tq/iGJxQpBVsy42V1twgxgrbJY5VIJL7wivPK9ANg7icGWKwuggT7Obs=;
Message-ID: <4f8f6cf3-3aee-9128-df09-d3957c233c42@xen.org>
Date: Thu, 23 Jun 2022 19:27:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH v2 2/4] tools/xenstore: add documentation for new
 set/get-feature commands
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220527072427.20327-1-jgross@suse.com>
 <20220527072427.20327-3-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220527072427.20327-3-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 27/05/2022 08:24, Juergen Gross wrote:
> Add documentation for two new Xenstore wire commands SET_FEATURE and
> GET_FEATURE used to set or query the Xenstore features visible in the
> ring page of a given domain.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> Do we need support in the migration protocol for the features?

I would say yes. You want to make sure that the client can be migrated 
without loosing features between two xenstored.

> V2:
> - remove feature bit (Julien Grall)
> - GET_FEATURE without domid will return Xenstore supported features
>    (triggered by Julien Grall)
> ---
>   docs/misc/xenstore.txt | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/docs/misc/xenstore.txt b/docs/misc/xenstore.txt
> index a3d3da0a5b..00f6969202 100644
> --- a/docs/misc/xenstore.txt
> +++ b/docs/misc/xenstore.txt
> @@ -331,6 +331,20 @@ SET_TARGET		<domid>|<tdomid>|
>   
>   	xenstored prevents the use of SET_TARGET other than by dom0.
>   
> +GET_FEATURE		[<domid>|]		<value>|
> +SET_FEATURE		<domid>|<value>|
> +	Returns or sets the contents of the "feature" field located at
> +	offset 2064 of the Xenstore ring page of the domain specified by
> +	<domid>. <value> is a decimal number being a logical or of the

In the context of migration, I am stilll a bit concerned that the 
features are stored in the ring because the guest could overwrite it.

I would expect the migration code to check that the GET_FEATURE <domid> 
is a subset of GET_FEATURE on the targeted Xenstored. So it can easily 
prevent a guest to migrate.

So I think this should be a shadow copy that will be returned instead of 
the contents of the "feature" field.

> +	feature bits as defined in docs/misc/xenstore-ring.txt. Trying
> +	to set a bit for a feature not being supported by the running
> +	Xenstore will be denied. Providing no <domid> with the
> +	GET_FEATURE command will return the features which are supported
> +	by Xenstore.

Do we want to allow modifying the features when the guest is running?

> +
> +	xenstored prevents the use of GET_FEATURE and SET_FEATURE other
> +	than by dom0.

Cheers,

-- 
Julien Grall

