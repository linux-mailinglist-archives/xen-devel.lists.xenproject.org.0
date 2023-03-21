Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 410756C2BB0
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 08:49:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512239.792090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peWjt-0002v6-8J; Tue, 21 Mar 2023 07:49:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512239.792090; Tue, 21 Mar 2023 07:49:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peWjt-0002sw-5X; Tue, 21 Mar 2023 07:49:01 +0000
Received: by outflank-mailman (input) for mailman id 512239;
 Tue, 21 Mar 2023 07:49:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=03cH=7N=list.ru=valor@srs-se1.protection.inumbo.net>)
 id 1peWjs-0002rq-0C
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 07:49:00 +0000
Received: from smtp58.i.mail.ru (smtp58.i.mail.ru [95.163.41.96])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d5c9ee2b-c7bc-11ed-87f5-c1b5be75604c;
 Tue, 21 Mar 2023 08:48:58 +0100 (CET)
Received: by smtp58.i.mail.ru with esmtpa (envelope-from <valor@list.ru>)
 id 1peWjo-00Bbo8-4v; Tue, 21 Mar 2023 10:48:57 +0300
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
X-Inumbo-ID: d5c9ee2b-c7bc-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=list.ru; s=mail4;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=rm4lFmRhnhCtpFnCGdOmtaxQPpjHbE0PTOio5aX/mjg=;
	t=1679384938;x=1679474938; 
	b=KkBzjNnNIBdUutiDxbTZGgS7huk458cwkaeYwRc5f91jSFnqYUC+AoK8j/jjfD949a09gIoc3QkLkdYgMKQywI5QHh2Xo+2113iMtFCMumOXiQo7DJVbfBYyPDSmfc0IOaK7RPkFw/vPw5DdSpKkJOD4cFDJeh81VGeVsi6QITkeFyGsh2V90QDp4Xfz+0QaWRiHKqz4cJqCYspqeHuw7Js0MUDSup8khK2ZDZzmbgU23m9E3tpWYkXM+YRQF1TqwDy9zKpBqwTbBnfdzXU1qYnt/eG9NP+b+ttthYUNXWgHQrEiHBy54RZ6wdhwnqTJIlVuXvgK7uiVv3/Ebb0mTA==;
Message-ID: <d6c137a1-4662-68ef-1ed4-8e9355e0290c@list.ru>
Date: Tue, 21 Mar 2023 10:48:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [XEN PATCH v1 1/1] x86/domctl: add gva_to_gfn command
Content-Language: ru, en-US
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Dmitry Isaykin <isaikin-dmitry@yandex.ru>
References: <e047a7a7-2e45-48de-2cb4-69001e95e1a8@list.ru>
 <CABfawhncTLzRvHYF3SyhdidfobP9PB3YOZ9oTjRREjKs07KtXQ@mail.gmail.com>
 <c5ea0f53-8cc9-509e-6c82-deea00f1ed74@list.ru>
 <CABfawhnRmGwB4VTx2i9Wg2c8dfyKqU5zM6MnWsMHBOfXA43+qA@mail.gmail.com>
From: =?UTF-8?B?0JrQvtCy0LDQu9GR0LIg0KHQtdGA0LPQtdC5?= <valor@list.ru>
In-Reply-To: <CABfawhnRmGwB4VTx2i9Wg2c8dfyKqU5zM6MnWsMHBOfXA43+qA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp58.i.mail.ru; auth=pass smtp.auth=valor@list.ru smtp.mailfrom=valor@list.ru
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD9303C7CA6F8B0D1AB35EB92D1D7235ABBB2D71FE7B71EFC36182A05F538085040B3B2A4491582B9D0B4409C5E98B4AA487321488680DBAA986769183B56D8482F
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE721AF84DC1D70954DEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006372D850D7477D401F58638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8ABF722410259389B709A486A888324376F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7E4DF6D1C10F22F599FA2833FD35BB23D9E625A9149C048EE9647ADFADE5905B128451B159A507268D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BE1488AC3D4DED311A471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FC69C563AEBEC0BF273AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F790063792C1D1031C6F1331D81D268191BDAD3D3666184CF4C3C14F3FC91FA280E0CE3D1A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89F9FFED5BD9FB417556D8C47C27EEC5E9FB5C8C57E37DE458BEDA766A37F9254B7
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D3416EA6E382A5BB176B748332226D92AABE31E2C7F6FA447C936C81C9F7B47CAB05B8AEC4CF85C180B1D7E09C32AA3244C2F761FAA2E72069B50725F6FDAF3CE9A60759606DA2E136AED98077840A144B9
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojrPvsFeLNXrWN08JvUjIaRw==
X-Mailru-Sender: 9422C5FC7C00AE69302EDEBB3FCEDF4FEC27E2FA55CDC1951FFD25A93A0411793AB249A19D58F90376E790B0992C7B54B52423DB74AF18EABD4DCABF7D1B4669C77752E0C033A69E3453F38A29522196
X-Mras: Ok



21.03.2023 2:34, Tamas K Lengyel пишет:
> 
> 
> On Mon, Mar 20, 2023 at 3:23 PM Ковалёв Сергей <valor@list.ru 
> <mailto:valor@list.ru>> wrote:
>  >
>  >
>  >
>  > 21.03.2023 1:51, Tamas K Lengyel wrote:
>  > >
>  > >
>  > > On Mon, Mar 20, 2023 at 12:32 PM Ковалёв Сергей <valor@list.ru 
> <mailto:valor@list.ru>
>  > > <mailto:valor@list.ru <mailto:valor@list.ru>>> wrote:
>  > >  >
>  > >  > gva_to_gfn command used for fast address translation in LibVMI 
> project.
>  > >  > With such a command it is possible to perform address translation in
>  > >  > single call instead of series of queries to get every page table.
>  > >
>  > > You have a couple assumptions here:
>  > >   - Xen will always have a direct map of the entire guest memory - 
> there
>  > > are already plans to move away from that. Without that this approach
>  > > won't have any advantage over doing the same mapping by LibVMI
>  >
>  > Thanks! I didn't know about the plan. Though I use this patch
>  > back ported into 4.16.
>  >
>  > >   - LibVMI has to map every page for each page table for every lookup -
>  > > you have to do that only for the first, afterwards the pages on which
>  > > the pagetable is are kept in a cache and subsequent lookups would be
>  > > actually faster then having to do this domctl since you can keep being
>  > > in the same process instead of having to jump to Xen.
>  >
>  > Yes. I know about the page cache. But I have faced with several issues
>  > with cache like this one https://github.com/libvmi/libvmi/pull/1058 
> <https://github.com/libvmi/libvmi/pull/1058> .
>  > So I had to disable the cache.
> 
> The issue you linked to is an issue with a stale v2p cache, which is a 
> virtual TLB. The cache I talked about is the page cache, which is just 
> maintaining a list of the pages that were accessed by LibVMI for future 
> accesses. You can have one and not the other (ie. ./configure  
> --disable-address-cache --enable-page-cache).
> 
> Tamas

Thanks. I know about the page cache. Though I'm not familiar with
it close enough.

As far as I understand at the time the page cache implementation in
LibVMI looks like this:
1. Call sequence: vmi_read > vmi_read_page > driver_read_page >
    xen_read_page > memory_cache_insert ..> get_memory_data >
    xen_get_memory > xen_get_memory_pfn > xc_map_foreign_range
2. This is perfectly valid while guest OS keeps page there. And
    physical pages are always there.
3. To renew cache the "age_limit" counter is used.
4. In Xen driver implementation in LibVMI the "age_limit" is
    disabled.
5. Also it is possible to invalidate cache with "xen_write" or
    "vmi_pagecache_flush". But it is not used.
6. Other way to avoid too big cache is cache size limit. So on
    every insert half of the cache is dropped on size overflow.

So the only thing we should know is valid mapping of guest
virtual address to guest physical address.

And the slow paths are:
1. A first traversal of new page table set. E.g. for the new process.
2. Or new subset of page tables for known process.
3. Subsequent page access after cache clean on size overflow.

Am I right?

The main idea behind the patch:
1. For the very first time it would be done faster with hypercall.
2. For subsequent calls v2p translation cache could be used (used in
    my current work in LibVMI).
3. To avoid errors with stale cache v2p cache could be invalidated
    on every event (VMI_FLUSH_RATE = 1).

-- 
Best regards,
Sergey Kovalev


