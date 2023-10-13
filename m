Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D00E87C81E9
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 11:23:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616336.958256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrEOY-0003JD-5w; Fri, 13 Oct 2023 09:23:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616336.958256; Fri, 13 Oct 2023 09:23:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrEOY-0003Gq-3M; Fri, 13 Oct 2023 09:23:46 +0000
Received: by outflank-mailman (input) for mailman id 616336;
 Fri, 13 Oct 2023 09:23:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qrEOW-0003FM-Ob
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 09:23:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qrEOV-0003W4-HX; Fri, 13 Oct 2023 09:23:43 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qrEOV-0004SG-9x; Fri, 13 Oct 2023 09:23:43 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=YyswfprD7K7JyBsBv+/zxxkbIiRUMSoadaWyJUFP/t0=; b=2YaaMhun5Vt+iwoliAkBQuHV+6
	5LssFV/B8MC+WnZTwSyK6jsHkm8guRLy+Ylpet2ahdK7MJRkOx8obOjbYKlVfMO384gtsy9H6BStf
	PABRSOOCUYISbU4YC6ZflUOY63nxxT2dLrGQRbq8DyUaOn9y1isxOtx1FiaCdlgQk75A=;
Message-ID: <beab75c7-8e6a-4571-8fb0-4e57086d414e@xen.org>
Date: Fri, 13 Oct 2023 10:23:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: MISRA C:2012 D4.11 caution on staging
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, roger.pau@citrix.com,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
References: <7972c20f361126022fa97f6b51ca2d9c@bugseng.com>
 <alpine.DEB.2.22.394.2310101658030.3431292@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2310101658030.3431292@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/10/2023 01:01, Stefano Stabellini wrote:
> Hey Julien, please double-check what I am writing below

Hi Stefano,

> On Tue, 10 Oct 2023, Nicola Vetrini wrote:
>> Hi,
>>
>> as you can see from [1], there's a MISRA C guideline, D4.11, that is supposed
>> to be clean
>> (i.e., have no reports), but has a caution on an argument to memcpy
>> (the second argument might be null according to the checker, given a set of
>> assumptions on
>> the control flow). To access the report just click on the second link in the
>> log, which should take you to a webpage with a list of
>> MISRA guidelines. Click on D4.11 and you'll see the full report, which I
>> pasted below for convenience.
>>
>> If the finding is genuine, then some countermeasure needs to be taken against
>> this
>> possible bug, otherwise it needs to be motivated why the field config->handle
>> can't
>> be null at that point.
>> The finding is likely the result of an improvement made to the checker,
>> because the first
>> analysis I can see that spots it happened when rc1 has been tagged, but that
>> commit does not
>> touch the involved files.
>>
>> [1] https://gitlab.com/xen-project/xen/-/jobs/5251222578
>>
>>   caution for MC3R1.D4.11 untagged
>> xen/common/domain.c:758.27-758.40:
>> [59] null pointer passed as 2nd argument to memory copy function
> 
> 
> This looks like a genuine issue: in domain_create, config->handle could
> be uninitialized. For example, domain_create can be called
> from xen/arch/arm/domain_build.c:create_domUs, passing &d_cfg, and I
> don't see where we initialize d_cfg.handle.
> 
> This was just by code inspection. Julien, did I miss anything?

cfg->handle is an embedded array. It will get automatically initialized 
to zero as we are using:

d_cfg = { ... };

Now, looking through the steps of the analysis [1], there is something odd.

The code looks like this:

if ( !is_idle_domain(d) )
   ...


if ( err = arch_domain_create(... ) != 0 )
   ...

init_status |= ...

if ( !is_idle_domain() )
   ...


One the first if, Eclair assumes that the domain is equal to 32767 (e.g. 
idle domain):

[27] field 'domain_id' is equal to 32767

But then on third if, we have:

[30] assuming field 'domain_id' is not equal to 32767; taking true branch

So the question is why did Eclair think 'domain_id' changed?

Cheers,

[1] 
https://saas.eclairit.com:3787/fs/var/local/eclair/xen-project.ecdf/xen-project/xen/ECLAIR_normal/4.18.0-rc2/ARM64/5251222578/PROJECT.ecd;/sources/xen/common/domain.c.html#{%22select%22:true,%22selection%22:{%22hiddenAreaKinds%22:[],%22hiddenSubareaKinds%22:[],%22show%22:false,%22selector%22:{%22enabled%22:true,%22negated%22:true,%22kind%22:0,%22domain%22:%22kind%22,%22inputs%22:[{%22enabled%22:true,%22text%22:%22caution%22}]}}}

Here it detects


-- 
Julien Grall

