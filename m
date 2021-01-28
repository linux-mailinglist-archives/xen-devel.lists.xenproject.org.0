Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D30EF307377
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 11:15:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76838.138806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l54K3-0001jm-8l; Thu, 28 Jan 2021 10:14:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76838.138806; Thu, 28 Jan 2021 10:14:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l54K3-0001jJ-56; Thu, 28 Jan 2021 10:14:43 +0000
Received: by outflank-mailman (input) for mailman id 76838;
 Thu, 28 Jan 2021 10:14:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AY0C=G7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l54K1-0001jE-8i
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 10:14:41 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 62cc55d1-dad7-4f5e-8ee3-2b86581dfc10;
 Thu, 28 Jan 2021 10:14:39 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EC803ACF4;
 Thu, 28 Jan 2021 10:14:38 +0000 (UTC)
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
X-Inumbo-ID: 62cc55d1-dad7-4f5e-8ee3-2b86581dfc10
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611828879; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uBbbqqeAOjaFoO6FrMOmVwTF0D8dYrYrVAaZqhZC/a8=;
	b=HcqNfmwuBTG+iqcjuUaDCC4zR+kkgh9Xc299rfpueMXC+3l7m6z4CH9agbdxrY4TFDpCq/
	bWHEOgZEIEYrAd3VNcTuUMJPyFDdvL+9ZRh7/pfxyeihqWPO2qE/hZYTH/9XuuL8/tr2FD
	jGgspiDvBmF7b58kQKPLODe36TcEQcQ=
Subject: Re: [PATCH] xen: Add RING_COPY_RESPONSE()
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <20210128031653.1640771-1-marmarek@invisiblethingslab.com>
 <680d6622-9876-c6ab-7554-705de4498c16@suse.com>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5573d666-80c4-8b54-27af-fea5c531569d@suse.com>
Date: Thu, 28 Jan 2021 11:14:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <680d6622-9876-c6ab-7554-705de4498c16@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 28.01.2021 06:38, Jürgen Groß wrote:
> On 28.01.21 04:16, Marek Marczykowski-Górecki wrote:
>> Using RING_GET_RESPONSE() on a shared ring is easy to use incorrectly
>> (i.e., by not considering that the other end may alter the data in the
>> shared ring while it is being inspected). Safe usage of a response
>> generally requires taking a local copy.
>>
>> Provide a RING_COPY_RESPONSE() macro to use instead of
>> RING_GET_RESPONSE() and an open-coded memcpy().  This takes care of
>> ensuring that the copy is done correctly regardless of any possible
>> compiler optimizations.
>>
>> Use a volatile source to prevent the compiler from reordering or
>> omitting the copy.
>>
>> This generalizes similar RING_COPY_REQUEST() macro added in 3f20b8def0.
>>
>> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>> ---
>>   xen/include/public/io/ring.h | 15 +++++++++------
>>   1 file changed, 9 insertions(+), 6 deletions(-)
>>
>> diff --git a/xen/include/public/io/ring.h b/xen/include/public/io/ring.h
>> index d68615ae2f67..b63d7362f0e9 100644
>> --- a/xen/include/public/io/ring.h
>> +++ b/xen/include/public/io/ring.h
>> @@ -231,22 +231,25 @@ typedef struct __name##_back_ring __name##_back_ring_t
>>   #define RING_GET_REQUEST(_r, _idx)                                      \
>>       (&((_r)->sring->ring[((_idx) & (RING_SIZE(_r) - 1))].req))
>>   
>> +#define RING_GET_RESPONSE(_r, _idx)                                     \
>> +    (&((_r)->sring->ring[((_idx) & (RING_SIZE(_r) - 1))].rsp))
>> +
>>   /*
>> - * Get a local copy of a request.
>> + * Get a local copy of a request/response.
>>    *
>> - * Use this in preference to RING_GET_REQUEST() so all processing is
>> + * Use this in preference to RING_GET_{REQUEST,RESPONSE}() so all processing is
>>    * done on a local copy that cannot be modified by the other end.
>>    *
>>    * Note that https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58145 may cause this
>>    * to be ineffective where _req is a struct which consists of only bitfields.
>>    */
>> -#define RING_COPY_REQUEST(_r, _idx, _req) do {				\
>> +#define RING_COPY_(action, _r, _idx, _req) do {				\
> 
> What about renaming _req to _dest in order to reflect that it can be
> a request _or_ a response?
> 
> "action" is misnamed, IMO. What about "type"?
> 
>>   	/* Use volatile to force the copy into _req. */			\
>> -	*(_req) = *(volatile typeof(_req))RING_GET_REQUEST(_r, _idx);	\
>> +	*(_req) = *(volatile typeof(_req))RING_GET_##action(_r, _idx);	\
>>   } while (0)
>>   
>> -#define RING_GET_RESPONSE(_r, _idx)                                     \
>> -    (&((_r)->sring->ring[((_idx) & (RING_SIZE(_r) - 1))].rsp))
>> +#define RING_COPY_REQUEST(_r, _idx, _req)  RING_COPY_(REQUEST, _r, _idx, _req)
>> +#define RING_COPY_RESPONSE(_r, _idx, _req) RING_COPY_(RESPONSE, _r, _idx, _req)
> 
> Use _rsp instead of _req for RING_COPY_RESPONSE()?

And, while at it, get rid of the leading underscores of
macro parameter names wherever possible without extra
code churn?

Jan

