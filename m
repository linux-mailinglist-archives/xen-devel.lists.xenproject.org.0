Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A90DA2EA6B2
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 09:40:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61766.108780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwhtM-0005tq-KI; Tue, 05 Jan 2021 08:40:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61766.108780; Tue, 05 Jan 2021 08:40:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwhtM-0005tR-Gs; Tue, 05 Jan 2021 08:40:36 +0000
Received: by outflank-mailman (input) for mailman id 61766;
 Tue, 05 Jan 2021 08:40:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hFWs=GI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kwhtK-0005tM-Tm
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 08:40:35 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c1116efc-03ce-43d3-92cc-06bb98261c87;
 Tue, 05 Jan 2021 08:40:33 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CCC82AA35;
 Tue,  5 Jan 2021 08:40:32 +0000 (UTC)
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
X-Inumbo-ID: c1116efc-03ce-43d3-92cc-06bb98261c87
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1609836032; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5HvMHz5XbVTM6BKr0BZUSclCy7DwTB4CCgkXeFufdqI=;
	b=gOWNyCdwpAy1CtrX+2yBEw5ZZSJXPda9NEOXlg5wq+4x9Q7zlmDAvJeg7I00K7MdDHmTBR
	M5+qCyA97wgv+UtzNMS11/Jd170Vb+R577xkNoAgfhdKZrDP8BPfIFh3/viroxagHYPPVc
	r3QI8sUS5Xs9D/gr/S6Y5r5AiGt+84A=
Subject: Re: [PATCH 1/2] x86/mem_sharing: copy cpuid during vm forking
To: Tamas K Lengyel <tamas.lengyel@intel.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <6d5ca8a57a2745e933f00706bff306844611f64d.1609781242.git.tamas.lengyel@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7106d2d6-507e-b94a-fb60-0d80e991b8af@suse.com>
Date: Tue, 5 Jan 2021 09:40:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <6d5ca8a57a2745e933f00706bff306844611f64d.1609781242.git.tamas.lengyel@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04.01.2021 18:41, Tamas K Lengyel wrote:
> --- a/xen/arch/x86/mm/mem_sharing.c
> +++ b/xen/arch/x86/mm/mem_sharing.c
> @@ -1764,6 +1764,7 @@ static int fork(struct domain *cd, struct domain *d)
>  
>          domain_pause(d);
>          cd->max_pages = d->max_pages;
> +        memcpy(cd->arch.cpuid, d->arch.cpuid, sizeof(*d->arch.cpuid));

Can such copying please be done using assignment rather than
memcpy(), for the added type safety? (I wouldn't mind doing
this while committing, so long as you don't mind.)

Jan

