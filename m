Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD638A2DB6
	for <lists+xen-devel@lfdr.de>; Fri, 12 Apr 2024 13:42:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704566.1101032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvFIe-0000rS-0g; Fri, 12 Apr 2024 11:42:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704566.1101032; Fri, 12 Apr 2024 11:42:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvFId-0000oJ-R6; Fri, 12 Apr 2024 11:42:31 +0000
Received: by outflank-mailman (input) for mailman id 704566;
 Fri, 12 Apr 2024 11:42:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sUrc=LR=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1rvFIc-0000NI-IE
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2024 11:42:30 +0000
Received: from sender3-of-o59.zoho.com (sender3-of-o59.zoho.com
 [136.143.184.59]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd44c544-f8c1-11ee-b908-491648fe20b8;
 Fri, 12 Apr 2024 13:42:29 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1712922144138705.1674847806388;
 Fri, 12 Apr 2024 04:42:24 -0700 (PDT)
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
X-Inumbo-ID: bd44c544-f8c1-11ee-b908-491648fe20b8
ARC-Seal: i=1; a=rsa-sha256; t=1712922145; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=S1/X09ezzzbJ5AjVMS/vnqRK7qJRE2taCNA937YflodMvywRS/fETRpRlKAwzpYB7rLr/ZslBYzt2nO3CQWTNZ+DGOWka6Hjs+kJMgz+i19rTeQ3GouJiym2JknCCdEv95KKb/3DXndEFUfLPjwnoNZA+kwr7xtU6TmHA/AdcRE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1712922145; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=AH6O84wbgEd1+0PGg1GVHsJ6Sl1tbXLN0Z6vY82xzU8=; 
	b=W6fDOW8s7h5Jc6N+RijRHKuOGCWSVX0GbhviCFd19UeblbQYgP9i5l3HtswkW1ku4pAcDSrmjFE8kz6fWnloDV/eIM6NW130kxZCY4Wx319XtVCowD/6XCov2XCQo5ZWGcE/nBJUKncqV3w32dJ0hNgg28i5zaHvSkNzhddBJO0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1712922145;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=AH6O84wbgEd1+0PGg1GVHsJ6Sl1tbXLN0Z6vY82xzU8=;
	b=TOhR8srRh4nIEPdtwR4VRFy2Nu0p+0/lfFbsuErcisj3CCdObhkPpzKYOsNdo8JU
	/Bd1Ka4v4LJPnrOCyHGDwy99d6BOrDzbjTexVpWsITEJynhv229AiMRSEQe+tZcKKL2
	x9R5C88Io7TgZRvRdE2R1vCYNbcETucM44rpb1Bs=
Message-ID: <c03c076b-c61e-4c0b-a3be-776d1626074a@apertussolutions.com>
Date: Fri, 12 Apr 2024 07:42:22 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] gzip: move crc state into consilidated gzip state
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jason.andryuk@amd.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20240411152518.2995-1-dpsmith@apertussolutions.com>
 <20240411152518.2995-5-dpsmith@apertussolutions.com>
 <10931f84-3c83-4efd-9a78-933f3e9de3f2@citrix.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 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
In-Reply-To: <10931f84-3c83-4efd-9a78-933f3e9de3f2@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 4/11/24 15:43, Andrew Cooper wrote:
> On 11/04/2024 4:25 pm, Daniel P. Smith wrote:
>> diff --git a/xen/common/gzip/inflate.c b/xen/common/gzip/inflate.c
>> index c8dd35962abb..6c8c7452a31f 100644
>> --- a/xen/common/gzip/inflate.c
>> +++ b/xen/common/gzip/inflate.c
>> @@ -1125,16 +1125,14 @@ static int __init inflate(struct gzip_data *gd)
>>    *
>>    **********************************************************************/
>>   
>> -static ulg __initdata crc_32_tab[256];
>> -static ulg __initdata crc;  /* initialized in makecrc() so it'll reside in bss */
>> -#define CRC_VALUE (crc ^ 0xffffffffUL)
>> +#define CRC_VALUE (gd->crc ^ 0xffffffffUL)
>>   
>>   /*
>>    * Code to compute the CRC-32 table. Borrowed from
>>    * gzip-1.0.3/makecrc.c.
>>    */
>>   
>> -static void __init makecrc(void)
>> +static void __init makecrc(struct gzip_data *gd)
>>   {
>>   /* Not copyrighted 1990 Mark Adler */
>>   
>> @@ -1151,7 +1149,7 @@ static void __init makecrc(void)
>>       for (i = 0; i < sizeof(p)/sizeof(int); i++)
>>           e |= 1L << (31 - p[i]);
>>   
>> -    crc_32_tab[0] = 0;
>> +    gd->crc_32_tab[0] = 0;
>>   
>>       for (i = 1; i < 256; i++)
>>       {
>> @@ -1162,11 +1160,11 @@ static void __init makecrc(void)
>>               if (k & 1)
>>                   c ^= e;
>>           }
>> -        crc_32_tab[i] = c;
>> +        gd->crc_32_tab[i] = c;
>>       }
>>   
>>       /* this is initialized here so this code could reside in ROM */
>> -    crc = (ulg)0xffffffffUL; /* shift register contents */
>> +    gd->crc = (ulg)0xffffffffUL; /* shift register contents */
>>   }
>>   
>>   /* gzip flag byte */
> 
> I can't see any way that a non-32bit value ever gets stored, because 'e'
> doesn't ever have bit 32 set in it.  I have a sneaking suspicion that
> this is code written in the 32bit days, where sizeof(long) was still 4.

Yes, I can switch crc and crc_32_tab to uint32_t.

> This change, if correct, halves the size of gzip_state.

Ack.

v/r,
dps

