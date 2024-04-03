Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12285897146
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 15:35:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700548.1093877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rs0m2-0004xT-45; Wed, 03 Apr 2024 13:35:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700548.1093877; Wed, 03 Apr 2024 13:35:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rs0m2-0004vs-18; Wed, 03 Apr 2024 13:35:30 +0000
Received: by outflank-mailman (input) for mailman id 700548;
 Wed, 03 Apr 2024 13:35:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g+Gt=LI=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1rs0m0-0004vm-4o
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2024 13:35:28 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0734d5a9-f1bf-11ee-afe5-a90da7624cb6;
 Wed, 03 Apr 2024 15:35:27 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1712151321823908.6436745542595;
 Wed, 3 Apr 2024 06:35:21 -0700 (PDT)
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
X-Inumbo-ID: 0734d5a9-f1bf-11ee-afe5-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; t=1712151323; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=T2d9diPrIwfJsOwK7NyKNNR5oF8tFCja1slxo9Q4RtoQXqWbWGd7+cr5X6wyFVobCGnIJXVB+tjGPnCDTdR6WXRB9O+Qu9kZeiIWwfI6RRzYkheEcd6cVjtEV/TJYIzDJhmVvDgM/VbqYoMH0LQbnITS+yQWHc0HMe1PbF3If0A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1712151323; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=/MO9bX1PzD/CubB0FQOA3VV0mnrAnV0VNXvlK9zdKts=; 
	b=QHa6wQRkKXyvvmFZ5w+cF0kTkVDJqRFS6sZA5oWwvBEFMqnNUO/9XOBcGqwX20J7WyPRPmhcWX+weACsrgh36TrmVBnHELuu1Vv9rKyDJ5w7IqYaeC5XrTpRG8kAu3GZbC+nvulAvzoyiG1FxRoLp/VfV653F8zNBwGPhzTauF8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1712151323;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=/MO9bX1PzD/CubB0FQOA3VV0mnrAnV0VNXvlK9zdKts=;
	b=G1kanYFG/3yDJWOhAlZHONQwitOQBljtJo3W4hS7yspwTv9vaxzsKb7cAcUymRYS
	noYk0BcJL3JEzBpYpA9oSvGWD5ZIArceCuChNUNfP29Fool5/OzvqQsfvUMEV9I5MwL
	i4uDeTepls1yTyjOZS7dNBAlPNwyMvm+3xrufD+k=
Message-ID: <e10a05b3-5b55-423e-8ebf-ebc745cc2649@apertussolutions.com>
Date: Wed, 3 Apr 2024 09:35:19 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "evtchn: refuse EVTCHNOP_status for Xen-bound
 event channels"
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich
 <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>
References: <20240402170612.2477791-1-andrew.cooper3@citrix.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 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
In-Reply-To: <20240402170612.2477791-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 4/2/24 13:06, Andrew Cooper wrote:
> The commit makes a claim without any kind of justification.
> 
> The claim is false, and the commit broke lsevtchn in dom0.  It is also quite
> obvious from XSM_TARGET that it has broken device model stubdoms too.
> 
> Whether to return information about a xen-owned evtchn is a matter of policy,
> and it's not acceptable to short circuit the XSM on the matter.
> 
> This reverts commit f60ab5337f968e2f10c639ab59db7afb0fe4f7c3.
> 
> Fixes: f60ab5337f96 ("evtchn: refuse EVTCHNOP_status for Xen-bound event channels")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: George Dunlap <George.Dunlap@citrix.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Daniel Smith <dpsmith@apertussolutions.com>
> ---
>   xen/common/event_channel.c | 6 ------
>   1 file changed, 6 deletions(-)
> 
> diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
> index 20f586cf5ecd..ae6c2f902645 100644
> --- a/xen/common/event_channel.c
> +++ b/xen/common/event_channel.c
> @@ -1040,12 +1040,6 @@ int evtchn_status(evtchn_status_t *status)
>   
>       read_lock(&d->event_lock);
>   
> -    if ( consumer_is_xen(chn) )
> -    {
> -        rc = -EACCES;
> -        goto out;
> -    }
> -
>       rc = xsm_evtchn_status(XSM_TARGET, d, chn);
>       if ( rc )
>           goto out;
> 
> base-commit: 7a09966e7b2823b70f6d56d0cf66c11124f4a3c1

Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>

