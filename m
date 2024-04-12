Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9B78A2DB5
	for <lists+xen-devel@lfdr.de>; Fri, 12 Apr 2024 13:42:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704564.1101021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvFIG-0000QE-Ik; Fri, 12 Apr 2024 11:42:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704564.1101021; Fri, 12 Apr 2024 11:42:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvFIG-0000NO-FL; Fri, 12 Apr 2024 11:42:08 +0000
Received: by outflank-mailman (input) for mailman id 704564;
 Fri, 12 Apr 2024 11:42:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sUrc=LR=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1rvFIF-0000NI-EC
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2024 11:42:07 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af0c7f3f-f8c1-11ee-b908-491648fe20b8;
 Fri, 12 Apr 2024 13:42:05 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1712922119221380.95281235996936;
 Fri, 12 Apr 2024 04:41:59 -0700 (PDT)
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
X-Inumbo-ID: af0c7f3f-f8c1-11ee-b908-491648fe20b8
ARC-Seal: i=1; a=rsa-sha256; t=1712922121; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ijbSZ7tbCg/zEVJjgmdTphFk06ZG+viwTkFe7kDoJg3GDLzUcmBCQiIRARRHQuGj9Lp/twev2paH4dvWZbcbGmzShOXPQjbxYHrvWnZ4JzBNVakfYOEiUnr/PcM9D4M86ZNgm47IO7qMpuYa8V2FOapVtX6RvE019PkMSgYNmX8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1712922121; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=GEH9Rl0aYMS8XF11Wv91KlXIyN31zx1pEcivx5VQMWI=; 
	b=kllDh9+MB+8sVREgA6H+7ityhXvgGR4Erc2yTpY6zTYvBCrmsVHMARefNISCYc7vabXKmiY/YgTwgMgBaO99LCIFCWD2EOiqRXbNVqXLd5iEMV6Gw/kqXG0/6cV6bA9JKnvs4AWlp+VrqxZJdrn9h+lHsKWQtQcaKD1gbz/rQ0U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1712922121;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:From:From:To:To:Cc:Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=GEH9Rl0aYMS8XF11Wv91KlXIyN31zx1pEcivx5VQMWI=;
	b=HiW5wobQ8/0sb+oJJAWgig3iYzpy2h5nhNM3qV/fBuqvEke7RODpPmofphazfQh5
	xSmSgUWA60SZv4B7SO7fQlv4b+2UO+OaC6gWxtDsiYgsX75S237peDxUM7odT7+qkP9
	SOjBg1qD7T16YtxGnuffU7GNWnWUSCHHKnfpsfH0=
Message-ID: <9a5112a3-26fe-49a8-93ed-cd8c9610576c@apertussolutions.com>
Date: Fri, 12 Apr 2024 07:41:57 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] gzip: refactor state tracking
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jason.andryuk@amd.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20240411152518.2995-1-dpsmith@apertussolutions.com>
 <20240411152518.2995-4-dpsmith@apertussolutions.com>
 <360958a2-5b0d-4fbc-8637-2a33185bdd8d@citrix.com>
 <c03b4f1e-f2c9-4f92-a369-b8afad56bc0b@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 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
In-Reply-To: <c03b4f1e-f2c9-4f92-a369-b8afad56bc0b@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 4/12/24 07:34, Daniel P. Smith wrote:
> On 4/11/24 15:24, Andrew Cooper wrote:
>> On 11/04/2024 4:25 pm, Daniel P. Smith wrote:
>>> diff --git a/xen/common/gzip/gunzip.c b/xen/common/gzip/gunzip.c
>>> index 1bcb007395ba..9b4891731b8b 100644
>>> --- a/xen/common/gzip/gunzip.c
>>> +++ b/xen/common/gzip/gunzip.c
>>> @@ -102,12 +109,13 @@ __init int gzip_check(char *image, unsigned 
>>> long image_len)
>>>   __init int perform_gunzip(char *output, char *image, unsigned long 
>>> image_len)
>>>   {
>>> +    struct gzip_data gd;
>>>       int rc;
>>
>> By the end of this series,
>>
>> Reading symbols from xen-syms...
>> (gdb) p sizeof(struct gzip_data)
>> $1 = 2120
>>
>> x86 has an 8k stack and this takes 1/4 of it.  Other bits of state are
>> dynamically allocated, even in inflate.c, so I'd highly recommend doing
>> the same for this.
> 
> I take it you are mainly talking about crc_32_tab? Yes, I can switch 
> that to being dynamically allocated.

Never mind, reading your comment on patch4 made me realize you wanted 
the instance of struct dynamically allocated. Though the answer is 
still, yes, we can dynamically allocate it.

v/r,
dps

