Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2436F41F0
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 12:44:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528477.821678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptnU0-0003dW-Lz; Tue, 02 May 2023 10:43:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528477.821678; Tue, 02 May 2023 10:43:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptnU0-0003ab-Iv; Tue, 02 May 2023 10:43:44 +0000
Received: by outflank-mailman (input) for mailman id 528477;
 Tue, 02 May 2023 10:43:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l/wp=AX=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1ptnTz-0003aV-5U
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 10:43:43 +0000
Received: from sender3-of-o58.zoho.com (sender3-of-o58.zoho.com
 [136.143.184.58]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32b7f95e-e8d6-11ed-8611-37d641c3527e;
 Tue, 02 May 2023 12:43:40 +0200 (CEST)
Received: from [10.10.1.128] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1683024216011767.2876740014466;
 Tue, 2 May 2023 03:43:36 -0700 (PDT)
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
X-Inumbo-ID: 32b7f95e-e8d6-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1683024218; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=la7k4xNjsSQnpYvPdTmYmMSusIMwiClw5LVgl55eUx8jePMgS0+ImyKRzXcJEfxnp4Qsbtohu8C/eSCAbe3h3CGJVn8JV+33RceH8R6+7v57jg4bCN5Lawl5FH6JHPZQa4ScMKt8Iejj8Dq0zTHdehDCbKk30DiwayZMblZGGhY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1683024218; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=oIghSZgYKIpdj1Zdp8vPzSF0OJ7ZJeiI5lUW7UH9DMc=; 
	b=lEJDv+8p7ANbe+jHXLr9ek3lJJnbwo7A9KixtdajhGOiHQkG69e6v3ErvFxRJItAVBEoMc2DVsr0BD9DIgF6m8rIVM2Nc8mZjLmtP9WrQa5UXHnyljXbe7o8cImgG882xOBTUVRQ70mD80kLH7XcWzMxpG727SRTbpsaoUTxmn0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1683024218;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=oIghSZgYKIpdj1Zdp8vPzSF0OJ7ZJeiI5lUW7UH9DMc=;
	b=sL8W/BgI3pojMDg1ZDr5k6uL/FnYNc4fGHjkyiEHFb5b+3TZwsTs7kv8QcJr9DOa
	+QmvWbcJhZONbEuwD/0/2ASp8rnLB16ebM/an4txTiWkTT6sQySeb1Q6ZgcNR2OMlXe
	l70VLsNuAMdeC0cDnErkEad3b4LvZPSlvB6TX8R4=
Message-ID: <600c8c62-5982-ec7e-7996-5b7fbfb40067@apertussolutions.com>
Date: Tue, 2 May 2023 06:43:33 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] sysctl: XSM hook should not cause
 XEN_SYSCTL_getdomaininfolist to (appear to) fail
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <26064a5a-423d-ded5-745e-61abb0fa601c@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <26064a5a-423d-ded5-745e-61abb0fa601c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External



On 5/2/23 03:17, Jan Beulich wrote:
> Unlike for XEN_DOMCTL_getdomaininfo, where the XSM check is intended to
> cause the operation to fail, in the loop here it ought to merely
> determine whether information for the domain at hand may be reported
> back. Therefore if on the last iteration the hook results in denial,
> this should not affect the sub-op's return value.
> 
> Fixes: d046f361dc93 ("Xen Security Modules: XSM")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> The hook being able to deny access to data for certain domains means
> that no caller can assume to have a system-wide picture when holding the
> results.
> 
> Wouldn't it make sense to permit the function to merely "count" domains?
> While racy in general (including in its present, "normal" mode of
> operation), within a tool stack this could be used as long as creation
> of new domains is suppressed between obtaining the count and then using
> it.
> 
> In XEN_DOMCTL_getpageframeinfo2 said commit had introduced a 2nd such
> issue, but luckily that sub-op and xsm_getpageframeinfo() are long gone.
> 

I understand there is a larger issue at play here but neutering the 
security control/XSM check is not the answer. This literally changes the 
way a FLASK policy that people currently have would be enforced, as well 
as contrary to how they understand the access control that it provides. 
Even though the code path does not fall under XSM maintainer, I would 
NACK this patch. IMHO, it is better to find a solution that does not 
abuse, misuse, or invalidate the purpose of the XSM calls.

On a side note, I am a little concern that only one person thought to 
include the XSM maintainer, or any of the XSM reviewers, onto a patch 
and the discussion around a patch that clearly relates to XSM for us to 
gauge the consequences of the patch. I am not assuming intentions here, 
only wanting to raise the concern.

So for what it is worth, NACK.

V/r,
Daniel P. Smith

