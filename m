Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B36191945
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 19:37:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGoNu-0005p9-VA; Tue, 24 Mar 2020 18:34:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2LnZ=5J=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jGoNt-0005p4-Fr
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 18:34:41 +0000
X-Inumbo-ID: 1f333a16-6dfe-11ea-a6c1-bc764e2007e4
Received: from mail-ed1-f67.google.com (unknown [209.85.208.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1f333a16-6dfe-11ea-a6c1-bc764e2007e4;
 Tue, 24 Mar 2020 18:34:40 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id a43so21911420edf.6
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2020 11:34:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=i++1IH6IDzzOWaY1lgi/S48jAWLrNmoCYcp6t0zFnUk=;
 b=NdjONcEAdEDyDBRTMHOBVe5zRP0D4NR2pzhv2PINwcrM4b6Bf+C2O7+J3pQRoENu4X
 2B71DFaBZJ0vtdjovXSvWViZdsJoKYXIHUCyQZPJnNq2A5V6tuFMS1olRfRB1chm2esZ
 qGWfejGIzfLsXhsfCqFchMT5gT8jiaS9wce8Utos31lku1dl4sH8OQrA6uzO640k/zth
 9WN5SYGXKqTQjecxA9m62UPwxAnzuWlc57hHqUUZTdEvWktXynbKAIn8/Q4go972kjVo
 YIcrVUSB0bf7YM6DHOzlNn4XcnJzmK8p8r0mpXgPiJdz1XlBftaRgpgGLj1GHO/dZcfd
 cxgg==
X-Gm-Message-State: ANhLgQ1D6XRuL6eo4DffYpMDfWshxPKFvr0xw+27GWsv+scOQigWZn6T
 4RMGU1UE3C48wl4hx9kO3m8=
X-Google-Smtp-Source: ADFU+vtlzVECJGfg410SWB/whVlVDDbEYb+XsoK8AnjH6QX4O2tTYi+xBp2nt6hfKutZacNklzeUUg==
X-Received: by 2002:a50:8e08:: with SMTP id 8mr17928668edw.153.1585074879663; 
 Tue, 24 Mar 2020 11:34:39 -0700 (PDT)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-224.amazon.com.
 [54.240.197.224])
 by smtp.gmail.com with ESMTPSA id s4sm560831edw.19.2020.03.24.11.34.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Mar 2020 11:34:39 -0700 (PDT)
To: David Woodhouse <dwmw2@infradead.org>, paul@xen.org,
 xen-devel@lists.xenproject.org
References: <759b48cc361af1136e3cf1658f3dcb1d2937db9c.camel@infradead.org>
 <20200319212150.2651419-1-dwmw2@infradead.org>
 <20200319212150.2651419-2-dwmw2@infradead.org>
 <004701d5febc$3632bfe0$a2983fa0$@xen.org>
 <45c147a12565cb1b0ca34217a8d66289a91ec35c.camel@infradead.org>
 <3018bb93-b79c-9182-30cc-364fb59ec2fd@xen.org>
 <d86994c7fa3bf73136d1caf4999181223d7bdf2c.camel@infradead.org>
 <8efd11af-7603-c823-62db-468f07a49790@xen.org>
 <21a867b0a394c7ccee2f1c5d10e367905f30174e.camel@infradead.org>
From: Julien Grall <julien@xen.org>
Message-ID: <24a41a05-eb02-824c-5794-0440bb4b7134@xen.org>
Date: Tue, 24 Mar 2020 18:34:37 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <21a867b0a394c7ccee2f1c5d10e367905f30174e.camel@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Subject: Re: [Xen-devel] [PATCH 2/2] xen/mm: Introduce
 PGC_state_uninitialised
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, hongyxia@amazon.com,
 'Jan Beulich' <jbeulich@suse.com>,
 'Volodymyr Babchuk' <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



Hi David,

On 24/03/2020 17:55, David Woodhouse wrote:
> On Tue, 2020-03-24 at 10:08 +0000, Julien Grall wrote:
>> Hi David,
>>
>> On 23/03/2020 10:55, David Woodhouse wrote:
>>> On Mon, 2020-03-23 at 09:34 +0000, Julien Grall wrote:
>>>> For liveupdate, we will need a way to initialize a page but mark it as
>>>> already inuse (i.e in the same state as they would be if allocated
>>>> normally).
>>>
>>> I am unconvinced of the veracity of this claim.
>>>
>>> We don't want to turn specific details of the current Xen buddy
>>> allocator part into of the implicit ABI of live update. That goes for
>>> the power-of-two zone boundaries, amongst other things.
>>
>> Why would you to do that? Marking the page as already used is no
>> different to "PGC_state_unitialized" except the "struct page_info" and
>> the internal of the buddy allocator would be properly setup for start
>> rather than at free.
> 
> The internals of the buddy allocator *cannot* be set up properly for a
> page which it would not actually give out — like the zero page.
> 
> We *could* do some tricks to allocate the zone structures for zones
> which *do* exist but contain only "pre-allocated" pages so the buddy
> allocator has never seen those zones... yet.
> 
> 
>> I think using "PGC_state_unitialised" for preserved page is an abuse. I
>> understand this is existing in other part of Xen (particularly on x86),
>> but I would rather not try to add more.
> 
> 
> I am perfectly happy to try avoiding PGC_state_uninitialised for pages
> which are "in use" at boot time due to live update.
> 
> All I insist on is that you explicitly describe the ABI constraints
> that it imposes, if any.

Agreed.

> 
> For example, that hack which stops the buddy allocator from giving out
> page zero: Could we have live updated from a Xen without that hack, to
> a Xen which has it? With page zero already given out to a domain?

The buddy allocator could never have given out page 0 on x86 because it 
is part of the first MB of the RAM (see arch_init_memory() in 
arch/x86/mm.c). AFAIK, the first MB cannot be freed..

The change in the buddy allocator was to address the Arm side and also 
make clear this was a problem this is a weakness of the allocator.

> What's yours? How would we cope with a situation like that, over LU?

When do you expect the pages to be carved out from the buddy allocator?

I can see only two situations:
	1) Workaround a bug in the allocator.
         2) A CPU errata requiring to not use memory.

In the case of 1), it is still safe for a domain to run with that page. 
However, we don't want to give it back to the page allocator. A solution 
is to mark them as "offlining/broken". Alternatively, you could remove 
the swap the page (see more below).

In the case of 2), it is not safe for a domain to run with that page. So 
it is probably best to swap the pages with a new one. For HVM domain 
(including the P2M), it should be easy. For PV domain, I am not entirely 
sure if that's feasible.

Cheers,

-- 
Julien Grall

