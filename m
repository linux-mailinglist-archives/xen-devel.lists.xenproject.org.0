Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B04F6A84442
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 15:10:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945701.1343843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2rfV-00046s-Ru; Thu, 10 Apr 2025 13:10:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945701.1343843; Thu, 10 Apr 2025 13:10:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2rfV-00044H-OL; Thu, 10 Apr 2025 13:10:09 +0000
Received: by outflank-mailman (input) for mailman id 945701;
 Thu, 10 Apr 2025 13:10:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HBao=W4=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1u2rfU-00044B-6N
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 13:10:08 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e24822f-160d-11f0-9eac-5ba50f476ded;
 Thu, 10 Apr 2025 15:10:06 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1744290595500658.8456412694419;
 Thu, 10 Apr 2025 06:09:55 -0700 (PDT)
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
X-Inumbo-ID: 1e24822f-160d-11f0-9eac-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; t=1744290598; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JOVwFsmMgBKbzIePHBO4rAHxASvDVBn7F/1sCpXY1SNR2sOkpeL+2HQsfg3MRzts63VPEZLx4gQXxmTS3i1cTdu9rvCwJn81l3hLZVswgmWKQRima35rai8rPTpUZ009G8/0ocP0fsxNQd1MX6+YQ6xX6kOZSCnggPA0Pwn2tGg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744290598; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=YwV4frp5CtfZYpgSz/+0qb414wbwFFnjjvaRHmFElUw=; 
	b=Bsj592xQokgjgH2t8nMnyyyTWQOH7Ly37sCoIjbmRrKoekLbmHqaf1tRSoY1tUBuNySZUCXeBOwX7IC4DnnK+sUbL9iDpaij2/CeDdJXyE1cJOXVLLtkWNkxmDIcsjeJGBilQQnppp6SBpL07IyYzR+ckFv+pvoEzzi3tDuMwrg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744290598;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=YwV4frp5CtfZYpgSz/+0qb414wbwFFnjjvaRHmFElUw=;
	b=c4A74/wagMTLVzyOgJqPTyfFMJOQnbDGojEnvQOjB2v4W8v4J1VL4qBoXG1gvzXA
	mFGYZM7y5DcnkINe+3Xqttb5wI/e3xnfpLMg3XjeCVciNnz63Mu2LC/bewZ7etf1xBX
	jv5alWfgBJaj6h7ZXYXPKwGe323SuHkNtJVJZpBY=
Message-ID: <7fa754f8-d785-45d8-b9da-de5c85bc793b@apertussolutions.com>
Date: Thu, 10 Apr 2025 09:09:53 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/16] x86/boot: introduce boot domain
To: Jan Beulich <jbeulich@suse.com>, Alejandro Vallejo <agarciav@amd.com>
Cc: Jason Andryuk <jason.andryuk@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-2-agarciav@amd.com>
 <141229a0-2cd2-4886-b5e5-02c85b0ca5ab@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <141229a0-2cd2-4886-b5e5-02c85b0ca5ab@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 4/9/25 02:24, Jan Beulich wrote:
> On 08.04.2025 18:07, Alejandro Vallejo wrote:
>> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
>>
>> To begin moving toward allowing the hypervisor to construct more than one
>> domain at boot, a container is needed for a domain's build information.
>> Introduce a new header, <xen/asm/bootdomain.h>, that contains the initial
>> struct boot_domain that encapsulate the build information for a domain.
>>
>> Add a kernel and ramdisk boot module reference along with a struct domain
>> reference to the new struct boot_domain. This allows a struct boot_domain
>> reference to be the only parameter necessary to pass down through the domain
>> construction call chain.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>

I have to object because the meaningless rename is going cause 
significant pain in the rebase of the follow-on series for no improved 
code clarity.

V/r,
DPS

