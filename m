Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A142FA4B3
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 16:32:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69756.124985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1WV9-00036i-6J; Mon, 18 Jan 2021 15:31:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69756.124985; Mon, 18 Jan 2021 15:31:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1WV9-00036J-31; Mon, 18 Jan 2021 15:31:31 +0000
Received: by outflank-mailman (input) for mailman id 69756;
 Mon, 18 Jan 2021 15:31:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d36Q=GV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l1WV7-00036E-Rg
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 15:31:29 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7196b7de-ad36-4c1d-90f1-64eb7281b9f0;
 Mon, 18 Jan 2021 15:31:28 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E5F19AC9B;
 Mon, 18 Jan 2021 15:31:27 +0000 (UTC)
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
X-Inumbo-ID: 7196b7de-ad36-4c1d-90f1-64eb7281b9f0
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610983888; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fd/TcNRyq9C036wRlECkL3Dz4fmR8mHO+AT3Uh/LPhg=;
	b=IOvlq5rntZ0xDtZve0RZTyO5KGfDCn7Eum8y9v792pkB/DmrQw0L7yCfw2+7MEPKKDr2oV
	Q30NOWGTgaL9kf1lv+qe6XQlc8sPlt/7VWNppaWw3gMUMBX4CLsy+Cjr6CxZoX2z1Up7p5
	MgZ9FI2cirSuMaATR1M3xeh+HGDkiUg=
Subject: Re: [PATCH] xen/xsm: Improve alloc/free of evtchn buckets
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210118150623.29550-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <21a82f0c-2267-0891-0f4a-0fdd9feec42c@suse.com>
Date: Mon, 18 Jan 2021 16:31:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210118150623.29550-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 18.01.2021 16:06, Andrew Cooper wrote:
> --- a/xen/common/event_channel.c
> +++ b/xen/common/event_channel.c
> @@ -147,6 +147,14 @@ static bool virq_is_global(unsigned int virq)
>      return true;
>  }
>  
> +static void free_evtchn_bucket(struct domain *d, struct evtchn *bucket)
> +{
> +    if ( !bucket )
> +        return;

You could avoid this since flask_free_security_evtchns() has
a similar check. Alternatively it could be dropped from there.
But even if you want to keep the duplication
Reviewed-by: Jan Beulich <jbeulich@suse.com>

One further aspect to consider though:

> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -309,12 +309,12 @@ static XSM_INLINE int xsm_evtchn_reset(XSM_DEFAULT_ARG struct domain *d1, struct
>      return xsm_default_action(action, d1, d2);
>  }
>  
> -static XSM_INLINE int xsm_alloc_security_evtchn(struct evtchn *chn)
> +static XSM_INLINE int xsm_alloc_security_evtchns(struct evtchn *chn, unsigned int nr)

I wonder whether we wouldn't better identify the difference
between pointer (to individual element) and array by writing
this (and others below) as

static XSM_INLINE int xsm_alloc_security_evtchns(struct evtchn chn[], unsigned int nr)

I think we've done so in a few places already, but of course it
would be a long way to get the entire code base consistent in
this regard. Plus of course while this works fine in function
declarations / definitions, it won't be possible to use for
struct / union fields.

Also it looks like this and further lines have become overly long.

Jan

