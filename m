Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDD36F44D5
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 15:13:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528605.821978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptppE-00028p-1n; Tue, 02 May 2023 13:13:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528605.821978; Tue, 02 May 2023 13:13:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptppD-00026v-Ua; Tue, 02 May 2023 13:13:47 +0000
Received: by outflank-mailman (input) for mailman id 528605;
 Tue, 02 May 2023 13:13:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l/wp=AX=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1ptppC-0001XX-HU
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 13:13:46 +0000
Received: from sender3-of-o57.zoho.com (sender3-of-o57.zoho.com
 [136.143.184.57]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 296b7a5f-e8eb-11ed-8611-37d641c3527e;
 Tue, 02 May 2023 15:13:44 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 168303321714554.42914743891174;
 Tue, 2 May 2023 06:13:37 -0700 (PDT)
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
X-Inumbo-ID: 296b7a5f-e8eb-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1683033219; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DsQx1ESOzcVBBH2ANjAdHbaBnC4tR7oXlnEkDVluQxGPrxObtvhUb8qjW3ritVo5WWJDejqqTDTjcFtsmjpBMT3T0lhk9TJOPHx9mmBxpuAmAtCAxMi6APjG1zlym2oB2zRn78RzaN8NVUOjKDb9D1YqxnUdya4oZTbk/jZaOFM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1683033219; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=uGj/pRqsgttZ5oVhJc1QbtEHDuuAij/v2kcj4sZAlMc=; 
	b=Zm5MBp5CVjOXAtHO3HyP+0SRyT+t1GPCx4oMkek8gtPIkpKaA1OY1oHONitQSu2GHJMTIxo0NloMM/LFx7WpkMoKOZgo8kZ6fbDCwFETwTYAECYwMqX84sL9K3jMQvd5s5HPIhFXnKWGuDTGnq/KVRO90XJbgHplrjO4CaIZhYU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1683033219;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:To:To:Cc:Cc:References:From:From:Subject:Subject:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=uGj/pRqsgttZ5oVhJc1QbtEHDuuAij/v2kcj4sZAlMc=;
	b=m4dNLS0RGeNXCYU8fX3aR82Czddukbn7X233xE/IReNvI44Kx6g0PjSChyahQqUf
	3SL/ZTNInQCfUxShhP0x48G5cnSPnAiURsb8RRdIwWnTdGpgOrB1uXbj4U2VBGUNL3R
	z+wSXn5BUGrCbLJ5cjsa5IIEM/fyDwpDZk+6/FMg=
Message-ID: <ccbd0769-ef20-01ea-2204-ee0c211dcd5d@apertussolutions.com>
Date: Tue, 2 May 2023 09:13:35 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <26064a5a-423d-ded5-745e-61abb0fa601c@suse.com>
 <600c8c62-5982-ec7e-7996-5b7fbfb40067@apertussolutions.com>
 <ZFDtMMUzBGXFZPsQ@Air-de-Roger>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH] sysctl: XSM hook should not cause
 XEN_SYSCTL_getdomaininfolist to (appear to) fail
In-Reply-To: <ZFDtMMUzBGXFZPsQ@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 5/2/23 07:00, Roger Pau Monné wrote:
> On Tue, May 02, 2023 at 06:43:33AM -0400, Daniel P. Smith wrote:
>>
>>
>> On 5/2/23 03:17, Jan Beulich wrote:
>>> Unlike for XEN_DOMCTL_getdomaininfo, where the XSM check is intended to
>>> cause the operation to fail, in the loop here it ought to merely
>>> determine whether information for the domain at hand may be reported
>>> back. Therefore if on the last iteration the hook results in denial,
>>> this should not affect the sub-op's return value.
>>>
>>> Fixes: d046f361dc93 ("Xen Security Modules: XSM")
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> The hook being able to deny access to data for certain domains means
>>> that no caller can assume to have a system-wide picture when holding the
>>> results.
>>>
>>> Wouldn't it make sense to permit the function to merely "count" domains?
>>> While racy in general (including in its present, "normal" mode of
>>> operation), within a tool stack this could be used as long as creation
>>> of new domains is suppressed between obtaining the count and then using
>>> it.
>>>
>>> In XEN_DOMCTL_getpageframeinfo2 said commit had introduced a 2nd such
>>> issue, but luckily that sub-op and xsm_getpageframeinfo() are long gone.
>>>
>>
>> I understand there is a larger issue at play here but neutering the security
>> control/XSM check is not the answer. This literally changes the way a FLASK
>> policy that people currently have would be enforced, as well as contrary to
>> how they understand the access control that it provides. Even though the
>> code path does not fall under XSM maintainer, I would NACK this patch. IMHO,
>> it is better to find a solution that does not abuse, misuse, or invalidate
>> the purpose of the XSM calls.
>>
>> On a side note, I am a little concern that only one person thought to
>> include the XSM maintainer, or any of the XSM reviewers, onto a patch and
>> the discussion around a patch that clearly relates to XSM for us to gauge
>> the consequences of the patch. I am not assuming intentions here, only
>> wanting to raise the concern.
>>
>> So for what it is worth, NACK.
> 
> I assume the NACK is to the remarks after the '---'?
> 
> The patch itself doesn't change the enforcement of the XSM checks,
> just prevents returning an error when the information from the last
> domain in the loop can not be fetched.
> 
> Am I missing something?

Actually, I should have finished my first cup of tea and looked closer 
at the patch in the larger context instead of the description, as the 
two do not align. You are correct, and provided I am not wrong here, the 
change is a no-op formatting change that removes an intermediate 
variable. I do not see how directly checking the return in an if versus 
checking the return stored in a variable. Additionally, the claim is 
that this occurs when XSM is enabled, which is also incorrect. The only 
difference at this location in code between not having XSM enabled and 
having it enabled is that for the latter, xsm_getdomaininfo() is an 
in-lined version versus a function call. In either case, both will 
return 0 unless you are using FLASK and have a policy blocking the 
domain from making the call.

V/r,
Daniel P. Smith



