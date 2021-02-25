Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B12D324CE2
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 10:32:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89654.169041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFD0j-0001rI-Td; Thu, 25 Feb 2021 09:32:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89654.169041; Thu, 25 Feb 2021 09:32:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFD0j-0001qt-Pv; Thu, 25 Feb 2021 09:32:41 +0000
Received: by outflank-mailman (input) for mailman id 89654;
 Thu, 25 Feb 2021 09:32:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qWJX=H3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lFD0i-0001ql-EC
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 09:32:40 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d2c86f6b-02e2-4c19-a6c9-e8bc63149443;
 Thu, 25 Feb 2021 09:32:39 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2657DACCF;
 Thu, 25 Feb 2021 09:32:38 +0000 (UTC)
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
X-Inumbo-ID: d2c86f6b-02e2-4c19-a6c9-e8bc63149443
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614245558; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AjkJf4O3dzVkjq702sFusBq8xTbdicOubQgnihwYT7Q=;
	b=VpoLdFqHh73ApSmM1sfEUruSG2FRNOLAAh4qhNcvki34p3pOpr1GL8ZY+WQ93QuS+YzsMP
	0wcrQMxVtAxD1iK0y9cdbxF1R+M/WGVR0PcjHtPkZtBX/P7ufGpPoBK+GQ4VPk/0ZVjkyl
	g20K7AugGdVBk61kP19/JU/xhR/gD6k=
Subject: Re: [PATCH v3][4.15] x86: mirror compat argument translation area for
 32-bit PV
From: Jan Beulich <jbeulich@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <iwj@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <dbdb045d-42de-af94-64cc-0be7992b80b6@suse.com>
Message-ID: <c56c115f-10de-35b0-c27c-1930e99d9377@suse.com>
Date: Thu, 25 Feb 2021 10:32:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <dbdb045d-42de-af94-64cc-0be7992b80b6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 25.02.2021 10:30, Jan Beulich wrote:
> Now that we guard the entire Xen VA space against speculative abuse
> through hypervisor accesses to guest memory, the argument translation
> area's VA also needs to live outside this range, at least for 32-bit PV
> guests. To avoid extra is_hvm_*() conditionals, use the alternative VA
> uniformly.
> 
> While this could be conditionalized upon CONFIG_PV32 &&
> CONFIG_SPECULATIVE_HARDEN_GUEST_ACCESS, omitting such extra conditionals
> keeps the code more legible imo.
> 
> Fixes: 4dc181599142 ("x86/PV: harden guest memory accesses against speculative abuse")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Roger - I would have dropped an R-b, but I've assumed keeping an A-b
would be fine. Please let me know if this was wrong.

Jan

