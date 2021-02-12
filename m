Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BA431A21D
	for <lists+xen-devel@lfdr.de>; Fri, 12 Feb 2021 16:54:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.84349.158174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAam8-00031w-BQ; Fri, 12 Feb 2021 15:54:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 84349.158174; Fri, 12 Feb 2021 15:54:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAam8-00031X-80; Fri, 12 Feb 2021 15:54:32 +0000
Received: by outflank-mailman (input) for mailman id 84349;
 Fri, 12 Feb 2021 15:54:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aDps=HO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lAam6-00031R-Ol
 for xen-devel@lists.xenproject.org; Fri, 12 Feb 2021 15:54:30 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 01c6bf23-4629-4233-a6a5-ab47d3435a42;
 Fri, 12 Feb 2021 15:54:30 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 50A45AD29;
 Fri, 12 Feb 2021 15:54:29 +0000 (UTC)
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
X-Inumbo-ID: 01c6bf23-4629-4233-a6a5-ab47d3435a42
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613145269; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C7GMDUyMOdTLI3rewXsY5zd2XTLH56wGuBSolmtWDq4=;
	b=klk5ZmyMZS+rwZq5oJVvqQ6K9dOpJivuQmr3cvKDL0jBd+MEPA7vZXr8On+/5F4fb9UJCz
	4su0Rz2IBQSizFAt5NMU2cDFDrUCx5jdZn79DO1leJikogfvw/UCPupC5lZ9fJM2kAzbWU
	c8AcFfJ+WW+7IKyUpi3foeI2JlYFuZs=
Subject: Re: [PATCH 02/10] tools/libxg: Fix uninitialised variable in
 write_x86_cpu_policy_records()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210212153953.4582-1-andrew.cooper3@citrix.com>
 <20210212153953.4582-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b8aed3ea-16b1-3e0f-abfb-ec90f7ce302c@suse.com>
Date: Fri, 12 Feb 2021 16:54:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210212153953.4582-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12.02.2021 16:39, Andrew Cooper wrote:
> Various version of gcc, when compiling with -Og, complain:
> 
>   xg_sr_common_x86.c: In function 'write_x86_cpu_policy_records':
>   xg_sr_common_x86.c:92:12: error: 'rc' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>      92 |     return rc;
>         |            ^~
> 
> The complaint is legitimate, and can occur with unexpected behaviour of two
> related hypercalls in combination with a libc which permits zero-length
> malloc()s.
> 
> Have an explicit rc = 0 on the success path, and make the MSRs record error
> handling consistent with the CPUID record before it.
> 
> Fixes: f6b2b8ec53d ("libxc/save: Write X86_{CPUID,MSR}_DATA records")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


