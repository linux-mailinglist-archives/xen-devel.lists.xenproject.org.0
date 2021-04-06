Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 363E43551D7
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 13:19:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.105891.202516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTjjq-0006dh-LE; Tue, 06 Apr 2021 11:19:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 105891.202516; Tue, 06 Apr 2021 11:19:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTjjq-0006dI-Hq; Tue, 06 Apr 2021 11:19:18 +0000
Received: by outflank-mailman (input) for mailman id 105891;
 Tue, 06 Apr 2021 11:19:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vt1H=JD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lTjjo-0006dD-QZ
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 11:19:16 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b1ad60d3-a1aa-4fd7-bc90-fb8a3437c2a9;
 Tue, 06 Apr 2021 11:19:16 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 215A8B14C;
 Tue,  6 Apr 2021 11:19:15 +0000 (UTC)
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
X-Inumbo-ID: b1ad60d3-a1aa-4fd7-bc90-fb8a3437c2a9
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617707955; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EZRNt5TC35xt7+712sy5IjhppVIPcGSFngA7WQnre5c=;
	b=o19l/0v3vl5SUblv0NmadfRmaaalsyaxEQI7Lpr8aVFRh5kDZ/yGiyxl+MrkApVFalPSMm
	kqMOtdeW4ajAp0WY8J9x5gOwAFoZ/SRfu/4n509dhF7DrE4FyeHK2vMu98at8SB7ZEEnXB
	Sl3bkH9Xq0OtukDua1F2pQLEMFbodnE=
Subject: Re: [PATCH 3/3] docs/doxygen: doxygen documentation for grant_table.h
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210406103603.8530-1-luca.fancellu@arm.com>
 <20210406103603.8530-4-luca.fancellu@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <073e28bc-ad94-429d-6384-744864d12b57@suse.com>
Date: Tue, 6 Apr 2021 13:19:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210406103603.8530-4-luca.fancellu@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 06.04.2021 12:36, Luca Fancellu wrote:
> Modification to include/public/grant_table.h:
> 
> 1) Change anonymous structure to be named structure,
>    because doxygen can't deal with them.

Especially in the form presented (adding further name space clutter
for consumers to fall over) I object to this, most notably ...

> @@ -584,7 +599,7 @@ DEFINE_XEN_GUEST_HANDLE(gnttab_swap_grant_ref_t);
>   * page granted to the calling domain by a foreign domain.
>   */
>  struct gnttab_cache_flush {
> -    union {
> +    union a {

... this one.

Jan

