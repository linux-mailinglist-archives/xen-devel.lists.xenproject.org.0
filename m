Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4305B3AD057
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 18:26:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144844.266548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luHK3-0003cp-SW; Fri, 18 Jun 2021 16:26:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144844.266548; Fri, 18 Jun 2021 16:26:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luHK3-0003ah-Nh; Fri, 18 Jun 2021 16:26:23 +0000
Received: by outflank-mailman (input) for mailman id 144844;
 Fri, 18 Jun 2021 16:26:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UjTI=LM=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1luHK2-0003ab-4S
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 16:26:22 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 73fbbfcd-046e-411f-baa8-79811bb6328e;
 Fri, 18 Jun 2021 16:26:21 +0000 (UTC)
Received: from [10.10.1.24] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1624033567093708.0667345382088;
 Fri, 18 Jun 2021 09:26:07 -0700 (PDT)
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
X-Inumbo-ID: 73fbbfcd-046e-411f-baa8-79811bb6328e
ARC-Seal: i=1; a=rsa-sha256; t=1624033568; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kXnR/sGZffRZiaozBMT4wEAGaR8WcbChg3EQD2vpRi2C16XSGIwNNIMXq/BNXHNFW8h9IzJQbr3fuZaLXfQnG/vKTCOTNOULA47LqIt81dtHLpfnyydDfqDB9dzwYrpqD7A7vOfz7WimlFI3Tuj5RiC8A9GBBv8M+8gYxx98YOA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1624033568; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=JEcFlCIYiQ9K1LpfSywvu/l9GKUmomfwRNSk+UmgtM4=; 
	b=A4jrXjHtU7NhfFmlVwx2BvsovT10ZIvMgpAibgmwh8tqCz95lkrAxNThRolWuY2qfeYAEcM8T7OUNNB8YzZjaFbUOKCeXbuxLgXkTuPJeoqKj3PbndcNYCbsA63ksqUk7sF4p8p25cdppsHkOPZgBgUQKmPG7+AXpAJaIKiHGEo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1624033568;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=JEcFlCIYiQ9K1LpfSywvu/l9GKUmomfwRNSk+UmgtM4=;
	b=RSNo66P38whmO9Xy2XIGEFvdCpqG9Cu/PyPIsUrmOyOdogAdlgW+StEg+vOTiLo4
	kgi36lWI/MoPMSTe6RdufpuHRnVPFdHX+otBhlPNRIv+1TjS7MEL9pQ3PS7ZzaNNHw3
	1JlVO1dY/REIOUD3Ap+mS2Zv/Tr8B/i8P7AkxMnw=
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Tim Deegan <tim@xen.org>, Juergen Gross <jgross@suse.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Dario Faggioli <dfaggioli@suse.com>, Paul Durrant <paul@xen.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, persaur@gmail.com,
 christopher.w.clark@gmail.com, adam.schwalm@starlab.io,
 scott.davis@starlab.io, xen-devel@lists.xenproject.org
References: <20210617233918.10095-1-dpsmith@apertussolutions.com>
 <20210617233918.10095-2-dpsmith@apertussolutions.com>
 <07566583-d4bc-dfb8-eccd-d779783d959a@citrix.com>
 <3345073c-45ab-b875-6d3c-32dadfb63fc9@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH 1/6] xsm: refactor xsm_ops handling
Message-ID: <88ece8ae-f1a0-927d-e1cd-20a65fa0b583@apertussolutions.com>
Date: Fri, 18 Jun 2021 12:26:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <3345073c-45ab-b875-6d3c-32dadfb63fc9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 6/18/21 7:44 AM, Jan Beulich wrote:
> On 18.06.2021 13:34, Andrew Cooper wrote:
>> On 18/06/2021 00:39, Daniel P. Smith wrote:
>>> @@ -197,16 +204,21 @@ bool __init has_xsm_magic(paddr_t start)
>>>  
>>>  int __init register_xsm(struct xsm_operations *ops)
>>>  {
>>> -    if ( verify(ops) )
>>> +    if ( xsm_ops_registered != XSM_OPS_UNREGISTERED )
>>> +        return -EAGAIN;
>>
>> I know you moved this around the function, but it really isn't -EAGAIN
>> material any more.  It's "too late - nope".
>>
>> -EEXIST is probably best for "I'm never going to tolerate another call".
>>
>>> +
>>> +    if ( !ops )
>>>      {
>>> -        printk(XENLOG_ERR "Could not verify xsm_operations structure\n");
>>> +        xsm_ops_registered = XSM_OPS_REG_FAILED;
>>> +        printk(XENLOG_ERR "Invalid xsm_operations structure registered\n");
>>>          return -EINVAL;
>>
>> Honestly, I'd be half tempted to declare register_xsm() with
>> __nonnull(0) and let the compiler reject any attempt to pass a NULL ops
>> pointer.
>>
>> Both callers pass a pointer to a static singleton objects.
> 
> Why check at all when the source of the arguments is all internal?
> We don't check pointers to be non-NULL elsewhere, with a few odd
> exceptions (which imo should all be dropped).

In verify(ops) there was a check on ops for NULL, I pulled that check up
into here as I removed verify(). Based on Andy's comment, this function
is looking like it is on the chopping block as well.

v/r,
dps


