Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7C39A31A4
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2024 02:19:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821462.1235290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1aiW-00037T-BA; Fri, 18 Oct 2024 00:19:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821462.1235290; Fri, 18 Oct 2024 00:19:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1aiW-00034J-7r; Fri, 18 Oct 2024 00:19:44 +0000
Received: by outflank-mailman (input) for mailman id 821462;
 Fri, 18 Oct 2024 00:19:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xu+L=RO=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t1aiV-00034D-69
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2024 00:19:43 +0000
Received: from sender3-of-o57.zoho.com (sender3-of-o57.zoho.com
 [136.143.184.57]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa1e5804-8ce6-11ef-99a3-01e77a169b0f;
 Fri, 18 Oct 2024 02:19:41 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729210771493744.6108440044962;
 Thu, 17 Oct 2024 17:19:31 -0700 (PDT)
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
X-Inumbo-ID: aa1e5804-8ce6-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1729210774; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ROmzkvP5hA532cjCBYpk7MhEhBEqxnSbYBh6jjD7dl7HALnMZV2fZUy0EZ5et63B7CWW/f19lqTTQDc9NFAxMPXNd3J5mXhazW5XU9saWm3JghqLjUhu9rH9TTfUzG7y7E9BxHgstj3kx3YtC73oWnh4xeItJ+0NLH77fnKNje0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729210774; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=pKs5rlu+UF0KVgzNhpCHFYB1Rd0E4htXrkx4KJCb8G8=; 
	b=mTPm+PLKHEk8cah5NKL8nyKZHNVYfuhYVodMR9xtmPRLUX2lgw8NhKf80pxmCRMht3CslXkduRhVF2H9JOx4YvRSKz5HvxHAgYLD9z1Og8/RNGI9sOQPCYGqd5tsbEuKVnjd9rwMfQEwWFkLgu/P6NoD/0DgHCAHrSfrot7wRac=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729210774;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=pKs5rlu+UF0KVgzNhpCHFYB1Rd0E4htXrkx4KJCb8G8=;
	b=XtEscou7wT1l87j6g+dNqbkMM4Kp0m5TN9y9meBrUZpVKS1sogpKtY7NGDNG2avO
	2nZ2rSJLEh4UPNbQZs+z3RBxv7YDCfvssPcCSCkHjKrvZ9okHkh1MLxz05bFcAw3fub
	OfFGrXEOm6NxW+cQ/uyrm0kq6Q1HkKSGS2f0TxTI=
Message-ID: <09c2a61c-04ae-4750-b9bb-671548d714e7@apertussolutions.com>
Date: Thu, 17 Oct 2024 20:19:29 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/44] x86/boot: move headroom to boot modules
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241017170325.3842-1-dpsmith@apertussolutions.com>
 <20241017170325.3842-8-dpsmith@apertussolutions.com>
 <a0a12283-4197-41dc-89c1-1b7a703e3d0a@citrix.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <a0a12283-4197-41dc-89c1-1b7a703e3d0a@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 10/17/24 17:39, Andrew Cooper wrote:
> On 17/10/2024 6:02 pm, Daniel P. Smith wrote:
>> diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
>> index d19473d8941e..5fe4f1387d03 100644
>> --- a/xen/arch/x86/include/asm/bootinfo.h
>> +++ b/xen/arch/x86/include/asm/bootinfo.h
>> @@ -17,6 +17,19 @@
>>   struct boot_module {
>>       /* Transitionary only */
>>       module_t *mod;
> 
> Blank line here.
> 
> I know it falls back out later, but it's very important for legibility
> to be able to tell at a glance which comment belongs to which item.

Ack.

v/r,
dps

