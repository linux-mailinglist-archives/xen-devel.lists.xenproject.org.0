Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA97A828FE
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 16:57:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.944284.1342797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2WrY-0002aP-Sq; Wed, 09 Apr 2025 14:57:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 944284.1342797; Wed, 09 Apr 2025 14:57:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2WrY-0002Y7-PH; Wed, 09 Apr 2025 14:57:12 +0000
Received: by outflank-mailman (input) for mailman id 944284;
 Wed, 09 Apr 2025 14:57:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L8O5=W3=gmail.com=ryabinin.a.a@srs-se1.protection.inumbo.net>)
 id 1u2WrX-0002Xz-CS
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 14:57:11 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9ce0b73-1552-11f0-9eab-5ba50f476ded;
 Wed, 09 Apr 2025 16:57:10 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-30bec442a25so8991001fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Apr 2025 07:57:10 -0700 (PDT)
Received: from [172.27.52.232] (auburn-lo423.yndx.net. [93.158.190.104])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30f4649d61csm1929521fa.7.2025.04.09.07.57.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Apr 2025 07:57:09 -0700 (PDT)
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
X-Inumbo-ID: e9ce0b73-1552-11f0-9eab-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744210630; x=1744815430; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XTxp3qW+KPuzf+zXWuGUYa2ldWHd+1dpKttsCAAJnR4=;
        b=UKxVpbEHCWM1jk/52cEX1EyDYb/4ziG1hh+P/Ecq6+kjEWalrvnwkRBxGQ7tXHnUT/
         cHb+UWieav5jX2iQSVHh2SCuBY2GoxWkEQA/l/5oRqITbZykQdI/bboQ+pdOXrR/Dhdf
         GhTS0jqphvrvp/2zFtGghhwPKasp7DGrnJO5kVBJtyDFY4/8H/biJ/HcOy0hJTuQuRQl
         cfvASKlXzAUdhLxZFnONzYGtWna+EI+N2LS4Rns3YnTAV9EgvE1PcjcuugXcXk/2m3QF
         x0DAiY6ULWyw5txWKo+vELJ8giUHiW6X1ECfHIG2xiDy7uFIakKDo8wcqcdqG3pZKdnI
         mprA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744210630; x=1744815430;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XTxp3qW+KPuzf+zXWuGUYa2ldWHd+1dpKttsCAAJnR4=;
        b=vAaFK3M2UaWY7r7owl9Ff4TF7aSiCLm67Q4I4CFfj6v8c5waoQZWayx+bYC1z5AVJ1
         uRQAyK/SvbIsercs1bShT9fUsJAnBNLKoewpO0ualFNLhAxJekrEQh6fAPRg9nDpIFIq
         ntlrS2wHw3IwKS2Z+UMXYOd9aLaxJ9zdVE7CYzpCu7zrgLhxBaYvipCKRZG6LGzudt6p
         ++wwXZ7u0DA0Jb7LVWJUROBQEpZW2ExPXIl91tj/V2CwgMlGopzxXE0wiHG2PcRjYezk
         8rVXeFTvU1wZneFQqC/apW+vPFMb0e74L/lub5qdtrSIj77vReiEdW3LVC/i10zjAcnP
         zysA==
X-Forwarded-Encrypted: i=1; AJvYcCUilEp1QAj6uv2eLDQ70Fd+DRN8rdTcZlrJp/rxzscDFk/neaQ93405tcBOshT4DiBrdgSkdovXczA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzYCLQ7o8cV9LXGcLBX0SyBNLSp1ulvZXK//G+FdcLptD1grRdo
	94c4w++fpgLjgzTXUrTkJvCDa6E+92zL/zg6P+AYtf5XZaK9yuWi
X-Gm-Gg: ASbGncu5c2jsHk1hKg7tVb/yfAJF75FzMCjAGJo8aKs0vjVgR4Hy4qdUbhkzoSUqDAJ
	6eS1rhREMtzdgvR1R8teLK6C9+/lRuBt6hz6WpTh7HMzZICjwvfmG0LEB7CqoPQZmGp/gDotSwR
	xCWIY214qTP4RbtA6C9pa9NIq0YIhgwt27I4k02W7J/sZ4Zk7+Lu6Wbr7GBwxVdzrKORs8NJEcx
	sY/KVCIqo5ifmfsv4muom4dTMRnZs9mGPmjvEZ+DA+lycGAX7vZlw2rTQRbrwuy1/LQIJ59f1qS
	zoj/eTE82/FIf5POZEhymKKf/hs4Y7HeuzLGF1K8hd0M9np6w4cBzmJ5vG7rJXXLIuN0Kg==
X-Google-Smtp-Source: AGHT+IG7fk9emZaqKs/kKGowvaUASd2CDo9SSBq5dR2zvDPKxRK4W1C4hr7cqLTnQPNN0OUJNfi0kg==
X-Received: by 2002:a05:651c:221a:b0:30d:62c1:3bfc with SMTP id 38308e7fff4ca-30f4387ba49mr2911011fa.7.1744210629436;
        Wed, 09 Apr 2025 07:57:09 -0700 (PDT)
Message-ID: <02d570de-001b-4622-b4c4-cfedf1b599a1@gmail.com>
Date: Wed, 9 Apr 2025 16:56:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] kasan: Avoid sleepable page allocation from atomic
 context
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Hugh Dickins
 <hughd@google.com>, Nicholas Piggin <npiggin@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>, Juergen Gross <jgross@suse.com>,
 Jeremy Fitzhardinge <jeremy@goop.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, kasan-dev@googlegroups.com, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, stable@vger.kernel.org
References: <cover.1744128123.git.agordeev@linux.ibm.com>
 <2d9f4ac4528701b59d511a379a60107fa608ad30.1744128123.git.agordeev@linux.ibm.com>
 <3e245617-81a5-4ea3-843f-b86261cf8599@gmail.com>
 <Z/aDckdBFPfg2h/P@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
Content-Language: en-US
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <Z/aDckdBFPfg2h/P@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/9/25 4:25 PM, Alexander Gordeev wrote:
> On Wed, Apr 09, 2025 at 04:10:58PM +0200, Andrey Ryabinin wrote:
> 
> Hi Andrey,
> 
>>> @@ -301,7 +301,7 @@ static int kasan_populate_vmalloc_pte(pte_t *ptep, unsigned long addr,
>>>  	if (likely(!pte_none(ptep_get(ptep))))
>>>  		return 0;
>>>  
>>> -	page = __get_free_page(GFP_KERNEL);
>>> +	page = __get_free_page(GFP_ATOMIC);
>>>  	if (!page)
>>>  		return -ENOMEM;
>>>  
>>
>> I think a better way to fix this would be moving out allocation from atomic context. Allocate page prior
>> to apply_to_page_range() call and pass it down to kasan_populate_vmalloc_pte().
> 
> I think the page address could be passed as the parameter to kasan_populate_vmalloc_pte().

We'll need to pass it as 'struct page **page' or maybe as pointer to some struct, e.g.:
struct page_data {
 struct page *page;
};


So, the kasan_populate_vmalloc_pte() would do something like this:

kasan_populate_vmalloc_pte() {
	if (!pte_none)
		return 0;
	if (!page_data->page)
		return -EAGAIN;

	//use page to set pte

        //NULLify pointer so that next kasan_populate_vmalloc_pte() will bail
	// out to allocate new page
	page_data->page = NULL; 
}

And it might be good idea to add 'last_addr' to page_data, so that we know where we stopped
so that the next apply_to_page_range() call could continue, instead of starting from the beginning. 


> 
>> Whenever kasan_populate_vmalloc_pte() will require additional page we could bail out with -EAGAIN,
>> and allocate another one.
> 
> When would it be needed? kasan_populate_vmalloc_pte() handles just one page.
> 

apply_to_page_range() goes over range of addresses and calls kasan_populate_vmalloc_pte()
multiple times (each time with different 'addr' but the same '*unused' arg). Things will go wrong
if you'll use same page multiple times for different addresses.


> Thanks!


