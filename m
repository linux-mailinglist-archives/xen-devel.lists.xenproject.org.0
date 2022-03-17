Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C02F4DC474
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 12:07:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291497.494756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUnyr-0007PG-Kh; Thu, 17 Mar 2022 11:07:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291497.494756; Thu, 17 Mar 2022 11:07:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUnyr-0007Mk-GV; Thu, 17 Mar 2022 11:07:45 +0000
Received: by outflank-mailman (input) for mailman id 291497;
 Thu, 17 Mar 2022 11:07:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nUnyp-0007Mc-VH
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 11:07:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nUnyp-0000M0-Qr; Thu, 17 Mar 2022 11:07:43 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230] helo=[10.7.239.19])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nUnyp-0000XX-KW; Thu, 17 Mar 2022 11:07:43 +0000
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
	bh=9jIZQLPoBgQdj1j6jMc+F5u7xZ9vcvpxznzvg/fskbk=; b=xC/wY1BYmIG2KI9vOe6Cj2AqzO
	PoBy1R7kc2amzhN7XHZwUmtO6SJok73TrvedzybiWViNYrUUtQpFlhEfRfUnNGNUzHhGF/z9XEf2S
	PjgNTl1RI3DEJD88Yx6hQxz8AV2Gh0L0NtBaSDOHnJpwI13TQRNnOinvN4R5DHsW7bTs=;
Message-ID: <d44b8e44-4e7e-c395-da9c-916ec641a687@xen.org>
Date: Thu, 17 Mar 2022 11:07:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 1/3] tools/xenstore: add documentation for new
 set/get-feature commands
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220316161017.3579-1-jgross@suse.com>
 <20220316161017.3579-2-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220316161017.3579-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 16/03/2022 16:10, Juergen Gross wrote:
> Add documentation for two new Xenstore wire commands SET_FEATURE and
> GET_FEATURE used to set or query the Xenstore features visible in the
> ring page of a given domain.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>   docs/misc/xenstore-ring.txt |  1 +
>   docs/misc/xenstore.txt      | 12 ++++++++++++
>   2 files changed, 13 insertions(+)
> 
> diff --git a/docs/misc/xenstore-ring.txt b/docs/misc/xenstore-ring.txt
> index f91accb5b0..bd000f694e 100644
> --- a/docs/misc/xenstore-ring.txt
> +++ b/docs/misc/xenstore-ring.txt
> @@ -68,6 +68,7 @@ Mask    Description

I find a bit odd we describe the feature in term of mask rather bit. 
This will get more difficult to read as we add more bits.

This is not new, so not change expected in this series.

>   -----------------------------------------------------------------
>   1       Ring reconnection (see the ring reconnection feature below)
>   2       Connection error indicator (see connection error feature below)
> +4       GET_FEATURE and SET_FEATURE Xenstore wire commands are available

Below, you wrote the two commands are dom0 only. Furthermore, I would 
expect such comment return something like ENOSYS if they are not present.

So do we really need to add a feature bit for GET_FEATURE/SET_FEATURE?

>   
>   The "Connection state" field is used to request a ring close and reconnect.
>   The "Connection state" field only contains valid data if the server has
> diff --git a/docs/misc/xenstore.txt b/docs/misc/xenstore.txt
> index ea3d8be177..31e3d53c52 100644
> --- a/docs/misc/xenstore.txt
> +++ b/docs/misc/xenstore.txt
> @@ -332,6 +332,18 @@ SET_TARGET		<domid>|<tdomid>|
>   
>   	xenstored prevents the use of SET_TARGET other than by dom0.
>   
> +GET_FEATURE		<domid>|		<value>|

Did you indented to add many spaces before <value>?

> +SET_FEATURE		<domid>|<value>|
> +	Returns or sets the contents of the "feature" field located at
> +	offset 2064 of the Xenstore ring page of the domain specified by
> +	<domid>. <value> is a decimal number being a logical or of the
> +	feature bits as defined in docs/misc/xenstore-ring.txt. Trying
> +	to set a bit for a feature not being supported by the running
> +	Xenstore will be denied.
How will the caller know which feature is supported? Also, what happen 
if a client decided to overwrite 'feature'? Could the result potentially 
prevent migration/liveupdate or else?

Cheers,

-- 
Julien Grall

