Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D40734CCF2
	for <lists+xen-devel@lfdr.de>; Mon, 29 Mar 2021 11:23:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.102896.196427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQo76-0003Nc-St; Mon, 29 Mar 2021 09:23:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 102896.196427; Mon, 29 Mar 2021 09:23:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQo76-0003ND-Pa; Mon, 29 Mar 2021 09:23:12 +0000
Received: by outflank-mailman (input) for mailman id 102896;
 Mon, 29 Mar 2021 09:23:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yGoF=I3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lQo75-0003N8-Jd
 for xen-devel@lists.xenproject.org; Mon, 29 Mar 2021 09:23:11 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 19ae104a-046d-4999-80d7-5804b1253dbb;
 Mon, 29 Mar 2021 09:23:10 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C19E5B3C6;
 Mon, 29 Mar 2021 09:23:09 +0000 (UTC)
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
X-Inumbo-ID: 19ae104a-046d-4999-80d7-5804b1253dbb
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617009789; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VcBuQRcfoLaKj/rPC16xUMpz+pqVC9dTsmVWLgRfSjs=;
	b=RHfeSWAQvj09PGdgSBGuFA9Yi59wQK5jj9tFRpM0TpiBPIT4TQnT6eETo2xcJ1uLyrI6yN
	ZCMiUEGjQdDa76/M/o0UMC5HT5Ix16QgxdthnD6XiQV873QtBtH5qGhrhgRgrCDFlVd9oS
	nH8HYhA6k1atv8ppgPWpRrI47yYCc0s=
Subject: Re: [PATCH v2 3/3] x86/hpet: Restore old configuration if Legacy
 Replacement mode doesn't help
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 =?UTF-8?B?RnLDqWTDqXJpYyBQaWVycmV0?= <frederic.pierret@qubes-os.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210326185947.23243-1-andrew.cooper3@citrix.com>
 <20210326185947.23243-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9916882e-c31b-4943-13b5-702380325ae1@suse.com>
Date: Mon, 29 Mar 2021 11:23:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210326185947.23243-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 26.03.2021 19:59, Andrew Cooper wrote:
> If Legacy Replacement mode doesn't help in check_timer(), restore the old
> configuration before falling back to other workarounds.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Ian Jackson <iwj@xenproject.org>
> CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> CC: Frédéric Pierret <frederic.pierret@qubes-os.org>
> 
> v2:
>  * New.
> 
> For 4.15: Attempt to unbreak AMD Ryzen 1800X systems.
> 
> I'm tempted to fold this into the previous patch, but its presented here in
> isolation for ease of review.

Both combined
Reviewed-by: Jan Beulich <jbeulich@suse.com>
(i.e. I think they strictly should be folded).

Just as a (further) consideration: While I continue to think that
undoing immediately is what we want, I wonder whether every further
fallback attempt wouldn't want to also be accompanied by trying if
it _combined_ with legacy replacement mode actually helps if alone
it didn't. Perhaps we want to cross that bridge only if we get a
respective report ...

Jan

