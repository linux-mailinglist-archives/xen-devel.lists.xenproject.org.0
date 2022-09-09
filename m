Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E7A5B36B9
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 13:52:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.404227.646602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWcYT-0002RO-4x; Fri, 09 Sep 2022 11:52:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 404227.646602; Fri, 09 Sep 2022 11:52:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWcYT-0002PX-26; Fri, 09 Sep 2022 11:52:17 +0000
Received: by outflank-mailman (input) for mailman id 404227;
 Fri, 09 Sep 2022 11:52:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F1lU=ZM=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1oWcYR-0002PR-Hj
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 11:52:15 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6fec956-3035-11ed-a31c-8f8a9ae3403f;
 Fri, 09 Sep 2022 13:52:13 +0200 (CEST)
Received: from [10.10.1.154] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1662724328862890.7330068186138;
 Fri, 9 Sep 2022 04:52:08 -0700 (PDT)
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
X-Inumbo-ID: d6fec956-3035-11ed-a31c-8f8a9ae3403f
ARC-Seal: i=1; a=rsa-sha256; t=1662724330; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bp1dIBHfogg1T9u9356xHqbdkX40bDLb9MrbL63UV6KFxy7zCQXR/bpNuDWOxwqjN4PPuX1tBUGShhCYuKBm/04flA4JRHSuUrVgM+EXaQ5JZ7dp4Czpu590ckveKipsvtMcq1Rraf7vJsPnaBWxSckZQDCg/6/Oe5IN6cBG2e4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1662724330; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=Y0Juv2PmzMT0x2kgaZXavJwFRL8oT0cephI3evXdK5Y=; 
	b=AP032NFyeEURXtsfhwwPHnrr2p/iqbbhgz9s7cqBOHBdoJm/vRDXBtUsfSdb5pR2Y8erEXqMxS5hI6b2w+LdROgWcVB99bCSBdeP5XBqJ37Wjnup9D79UDAKOe9mfcNQxZZ0pDmCXTPGS/ClCemeKGTwCUpV2EmcS7RSXmYVRhI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1662724330;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Y0Juv2PmzMT0x2kgaZXavJwFRL8oT0cephI3evXdK5Y=;
	b=lotFuzsVGMU9ZS2Be3HraRpobS1Mefn7gF8zT0Ky+6REMpzcYP9IlsB1sQ0ecWBY
	gYUl+To2uNJ/PB+G7+wCUx81yb6/xyl3zMIJiT89efi1VceqoqD2TzJ8G6zyNMAdpeA
	/830elvgUihyFtLyVo826wV2ezx4Ydz2CKxu4QWk=
Message-ID: <dc4953b1-2975-eeda-6964-f37e1e68e33c@apertussolutions.com>
Date: Fri, 9 Sep 2022 07:52:07 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] xsm/flask: adjust print messages to use %pd
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "jandryuk@gmail.com" <jandryuk@gmail.com>
References: <20220909095012.4251-1-dpsmith@apertussolutions.com>
 <AS8PR08MB79918FE3B1C08991CFF62A3092439@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <AS8PR08MB79918FE3B1C08991CFF62A3092439@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 9/9/22 05:56, Henry Wang wrote:
> Hi Daniel,
> 
>> -----Original Message-----
>> Subject: [PATCH] xsm/flask: adjust print messages to use %pd
>>
>> Print messages from flask use an inconsistent format when printing the
>> domain
>> id. The %pd conversion specifier provides a consistent way to format for the
>> domain id and aligns with the rest of the hypervisor code.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>>   xen/xsm/flask/avc.c   | 8 ++++----
>>   xen/xsm/flask/hooks.c | 3 +--
>>   2 files changed, 5 insertions(+), 6 deletions(-)
>>
>> diff --git a/xen/xsm/flask/avc.c b/xen/xsm/flask/avc.c
>> index 4a75ec97e2..4a86681c81 100644
>> --- a/xen/xsm/flask/avc.c
>> +++ b/xen/xsm/flask/avc.c
>> @@ -566,14 +566,14 @@ void avc_audit(u32 ssid, u32 tsid, u16 tclass, u32
>> requested,
>>       if ( a && (a->sdom || a->tdom) )
>>       {
>>           if ( a->sdom && a->tdom && a->sdom != a->tdom )
>> -            avc_printk(&buf, "domid=%d target=%d ", a->sdom->domain_id, a-
>>> tdom->domain_id);
>> +            avc_printk(&buf, "source=%pd target=%dp ", a->sdom, a->tdom);
> 
> I guess this should be target=%pd?

Erg! Turns out there is no conversion specifier validation occurring for 
avc_printk(), thus the typo slipped through and not caught by the 
compiler. I will fix and also add the printf annotation to avc_printk() 
to help ensure conversion specifier and parameter types match.

> With this fixed:
> Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Thanks!

> This should also be fine to merge in 4.17, but following the discussion with
> Julien and Jan I think providing a Release ack would lead to confusion...

I was hoping it would go in, but understand if it is kept out. I have a 
list of clean-ups of varying sizes for XSM, with this one actually being 
requested by someone else. I figured it was a simple one that could be 
done quickly and might be worth trying to get it into the release.

v/r,
dps

