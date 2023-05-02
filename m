Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9DB6F447D
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 15:03:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528587.821948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptpev-0007W6-FI; Tue, 02 May 2023 13:03:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528587.821948; Tue, 02 May 2023 13:03:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptpev-0007Sv-C5; Tue, 02 May 2023 13:03:09 +0000
Received: by outflank-mailman (input) for mailman id 528587;
 Tue, 02 May 2023 13:03:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l/wp=AX=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1ptpet-0007RC-V6
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 13:03:07 +0000
Received: from sender3-of-o59.zoho.com (sender3-of-o59.zoho.com
 [136.143.184.59]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ada93777-e8e9-11ed-b225-6b7b168915f2;
 Tue, 02 May 2023 15:03:06 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1683032582345892.9308198213303;
 Tue, 2 May 2023 06:03:02 -0700 (PDT)
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
X-Inumbo-ID: ada93777-e8e9-11ed-b225-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; t=1683032583; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dcnrjMXMEBqaDs8HEbZpO1CdF6/rgjf5Vvlwc8+apeqQe0DT6bMc+fLmzS123Eqx2HOoPNyZBgGDvjzrDl/k90nzuymYQYfhshju5oMKBv6NAY357rd9y6aWnPqbso9TuKQg7mqE+KJwrhfcwwibJSh+xzjk4RSu3+caj4wulbU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1683032583; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=+PmM/urMgFqGb0mSi5wPADvNdwp6VGJZKc8t26d4ohA=; 
	b=Zs5kwMKNBZqS8yx+15CNimtqKJkvfKHP9XZv+pmDW/PJ865FwLAYEnbWVdtliui1mkIolBjbush/x8Hchwglss1oJ14AKbEsJiwXnNf2/T4GYFWHAkTyIbEh7ZAmAKvEkITJh0yd0jAGXfJrLokjwR+NKoreib0/KiRHKLAANGI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1683032583;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:To:To:Cc:Cc:References:From:From:Subject:Subject:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=+PmM/urMgFqGb0mSi5wPADvNdwp6VGJZKc8t26d4ohA=;
	b=BcKrPcPdZbdx2GDypUx5ylnwwgJp3d5gGkboQZl1jK2Bz5jX2wH36yWz0zR28nzB
	A9QbRKDCGhrBoiu93reV+7VwhyqQNZrN/oIQK0+C0fn+dEmj+ngFPiDCeQdcrP8biVi
	xzPpivbblMjvlIoASFGgtSQ/If9WFt3HHWEas9EI=
Message-ID: <0c01a75d-8a98-3931-28fa-68ed373e9a2e@apertussolutions.com>
Date: Tue, 2 May 2023 09:03:00 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <20230430144646.13624-1-jgross@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH] xen/sysctl: fix XEN_SYSCTL_getdomaininfolist handling
 with XSM
In-Reply-To: <20230430144646.13624-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 4/30/23 10:46, Juergen Gross wrote:
> In case XSM is active, the handling of XEN_SYSCTL_getdomaininfolist
> can fail if the last domain scanned isn't allowed to be accessed by
> the calling domain (i.e. xsm_getdomaininfo(XSM_HOOK, d) is failing).
> 
> Fix that by just ignoring scanned domains where xsm_getdomaininfo()
> is returning an error, like it is effectively done when such a
> situation occurs for a domain not being the last one scanned.
> 
> Fixes: d046f361dc93 ("Xen Security Modules: XSM")
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>   xen/common/sysctl.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
> index 02505ab044..0cbfe8bd44 100644
> --- a/xen/common/sysctl.c
> +++ b/xen/common/sysctl.c
> @@ -89,8 +89,7 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
>               if ( num_domains == op->u.getdomaininfolist.max_domains )
>                   break;
>   
> -            ret = xsm_getdomaininfo(XSM_HOOK, d);
> -            if ( ret )
> +            if ( xsm_getdomaininfo(XSM_HOOK, d) )
>                   continue;
>   
>               getdomaininfo(d, &info);


This change does not match the commit message. This says it fixes an 
issue, but unless I am totally missing something, this change is nothing 
more than formatting that drops the use of an intermediate variable. 
Please feel free to correct me if I am wrong here, otherwise I believe 
the commit message should be changed to reflect the code change.

Second, as far as the problem description goes. The *only* time the call 
to xsm_getdomaininfo() at this location will return anything other than 
0, is when FLASK is being used and a domain whose type is not allowed 
getdomaininfo is making the call. XSM_HOOK signals a no-op check for the 
default/dummy policy, and the SILO policy does not override the 
default/dummy policy for this check.

V/r,
Daniel P. Smith

