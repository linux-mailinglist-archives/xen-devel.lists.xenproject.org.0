Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6007E3419DB
	for <lists+xen-devel@lfdr.de>; Fri, 19 Mar 2021 11:24:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.99158.188358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNCHb-0005n1-AK; Fri, 19 Mar 2021 10:23:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 99158.188358; Fri, 19 Mar 2021 10:23:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNCHb-0005mf-6d; Fri, 19 Mar 2021 10:23:07 +0000
Received: by outflank-mailman (input) for mailman id 99158;
 Fri, 19 Mar 2021 10:23:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ai2o=IR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lNCHa-0005ma-3A
 for xen-devel@lists.xenproject.org; Fri, 19 Mar 2021 10:23:06 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9fda5cdf-89b1-4568-a9bf-434eaa21627e;
 Fri, 19 Mar 2021 10:23:05 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 29EA5ACC6;
 Fri, 19 Mar 2021 10:23:04 +0000 (UTC)
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
X-Inumbo-ID: 9fda5cdf-89b1-4568-a9bf-434eaa21627e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1616149384; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wf7SiD2UhTJcHykNRnvUH7BeKEo3lRIyj9GVuRHdhs0=;
	b=XzAYZplBPi1nk98KJTdamJx0BAJxKo6DPBo/1XrwsLyYq91gEyVMs3g5n+qsHFL+g9r33I
	peZi7/ImobrLbfFaAXkin5rlx49q0P8Csg22Zzt8g0RoMLIBR5Yjo09OTCwOyZnrTdcDsL
	P1V38h9TuMyzFZl04Otk43Cix3lXjNU=
Subject: Re: [PATCH for-4.15] x86/mem_sharing: copy parent VM's hostp2m's
 max_mapped_pfn during forking
To: Tamas K Lengyel <tamas.lengyel@intel.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <bdeaf7893acd6497cc2b88f3a1357d1299960e9b.1616103095.git.tamas.lengyel@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <193bfae5-a80a-d02a-377d-c9e11ad038a8@suse.com>
Date: Fri, 19 Mar 2021 11:23:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <bdeaf7893acd6497cc2b88f3a1357d1299960e9b.1616103095.git.tamas.lengyel@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 18.03.2021 22:36, Tamas K Lengyel wrote:
> --- a/xen/arch/x86/mm/mem_sharing.c
> +++ b/xen/arch/x86/mm/mem_sharing.c
> @@ -1761,6 +1761,7 @@ static int copy_settings(struct domain *cd, struct domain *d)
>          return rc;
>  
>      copy_tsc(cd, d);
> +    p2m_get_hostp2m(cd)->max_mapped_pfn = p2m_get_hostp2m(d)->max_mapped_pfn;

Makes sense to me, yes, but then an immediate question is: What
about the somewhat similar {min,max}_remapped_gfn fields? Which
of course implies the more general question of how alternate
p2m-s (are supposed to) get treated in the first place. From my
looking at it, fork() doesn't appear to also fork those, but
also doesn't appear to refuse cloning when altp2m is in use.

Jan

