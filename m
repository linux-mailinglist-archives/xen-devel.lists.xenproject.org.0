Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26459389F10
	for <lists+xen-devel@lfdr.de>; Thu, 20 May 2021 09:43:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.130700.244678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljdKr-0005uH-FY; Thu, 20 May 2021 07:43:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130700.244678; Thu, 20 May 2021 07:43:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljdKr-0005rv-CX; Thu, 20 May 2021 07:43:13 +0000
Received: by outflank-mailman (input) for mailman id 130700;
 Thu, 20 May 2021 07:43:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3HBq=KP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ljdKq-0005rp-NF
 for xen-devel@lists.xenproject.org; Thu, 20 May 2021 07:43:12 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 934488d6-0b22-4aab-b263-f889b650697e;
 Thu, 20 May 2021 07:43:11 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0B022B148;
 Thu, 20 May 2021 07:43:11 +0000 (UTC)
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
X-Inumbo-ID: 934488d6-0b22-4aab-b263-f889b650697e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621496591; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fm7akdWL3Mft1M3L5KThdacJthcmV01J56Xd2xuO7so=;
	b=kIKysHJFAjOqZR+0HLtpbIKhUdZ8nIN//cmsY2w1EvdUzfTFlvhI/zm4gNx9D+izLpRkUm
	EJAx60oIq8RPFzUzrR9SInyTcjTPQ9XCRauvLHH7o2plmdraCHO5ovCJHNkiUHeHffhYEI
	QPU4PN0kp4e603rokI1Njzdn/cPrRt0=
Subject: Re: [PATCH v2 1/2] xen-pciback: redo VF placement in the virtual
 topology
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, Konrad Wilk <konrad.wilk@oracle.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <38774140-871d-59a4-cf49-9cb1cc78c381@suse.com>
 <8def783b-404c-3452-196d-3f3fd4d72c9e@suse.com>
 <87d771dd-8b00-4101-b76b-21087ea1b1df@oracle.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <214a6c61-5f6a-d841-312a-be2abb95f77a@suse.com>
Date: Thu, 20 May 2021 09:43:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <87d771dd-8b00-4101-b76b-21087ea1b1df@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 20.05.2021 02:36, Boris Ostrovsky wrote:
> 
> On 5/18/21 12:13 PM, Jan Beulich wrote:
>>  
>> @@ -95,22 +95,25 @@ static int __xen_pcibk_add_pci_dev(struc
>>  
>>  	/*
>>  	 * Keep multi-function devices together on the virtual PCI bus, except
>> -	 * virtual functions.
>> +	 * that we want to keep virtual functions at func 0 on their own. They
>> +	 * aren't multi-function devices and hence their presence at func 0
>> +	 * may cause guests to not scan the other functions.
> 
> 
> So your reading of the original commit is that whatever the issue it was, only function zero was causing the problem? In other words, you are not concerned that pci_scan_slot() may now look at function 1 and skip all higher-numbered function (assuming the problem is still there)?

I'm not sure I understand the question: Whether to look at higher numbered
slots is a function of slot 0's multi-function bit alone, aiui. IOW if
slot 1 is being looked at in the first place, slots 2-7 should also be
looked at.

Jan

