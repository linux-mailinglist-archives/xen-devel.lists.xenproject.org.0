Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBB06C2141
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 20:23:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512096.791750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peL5n-00053P-7C; Mon, 20 Mar 2023 19:22:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512096.791750; Mon, 20 Mar 2023 19:22:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peL5n-00050e-3t; Mon, 20 Mar 2023 19:22:51 +0000
Received: by outflank-mailman (input) for mailman id 512096;
 Mon, 20 Mar 2023 19:22:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GPvh=7M=list.ru=valor@srs-se1.protection.inumbo.net>)
 id 1peL5l-00050X-6W
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 19:22:49 +0000
Received: from smtp59.i.mail.ru (smtp59.i.mail.ru [95.163.41.97])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97b4cf65-c754-11ed-87f5-c1b5be75604c;
 Mon, 20 Mar 2023 20:22:46 +0100 (CET)
Received: by smtp59.i.mail.ru with esmtpa (envelope-from <valor@list.ru>)
 id 1peL5g-007fv9-EO; Mon, 20 Mar 2023 22:22:45 +0300
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
X-Inumbo-ID: 97b4cf65-c754-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=list.ru; s=mail4;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=TVLpv2R8EjXC92ZLE3YQikJhIO/MrUq+5Ry6oAbXq2s=;
	t=1679340166;x=1679430166; 
	b=lbXHHImB2k/Dx2MIg2dbr3sU5efnnculWlQruWm9OvP9fhytaw/ZuO/f9ShTzgzMWb4Dwk75R9OaZhGoLNhcXsYaJMDggs0JaPyV4FiRCzttLna6fP+j6ctIQkNzDh6dvQIkd29V9I0zLkTI43DpcdaoScR+UHvBP+JwHV/h4mYNMyQkEHgjDBzOpmcG1tffRK8jKHnwnrqwO3wuDC9YylPfEtHETw7uMNd/WyZc1OuQr1mpOgEQtYf9LCfF6RV8OVpyreQPA5bDuMFigWbcZYpJt6wXUSgt6zxE80UuANU4j6BOiipdF3dp811Ho+RB86LH2VwkEwjrQjSHP6XdXQ==;
Message-ID: <c5ea0f53-8cc9-509e-6c82-deea00f1ed74@list.ru>
Date: Mon, 20 Mar 2023 22:22:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
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
From: =?UTF-8?B?0JrQvtCy0LDQu9GR0LIg0KHQtdGA0LPQtdC5?= <valor@list.ru>
In-Reply-To: <CABfawhncTLzRvHYF3SyhdidfobP9PB3YOZ9oTjRREjKs07KtXQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp59.i.mail.ru; auth=pass smtp.auth=valor@list.ru smtp.mailfrom=valor@list.ru
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD9303C7CA6F8B0D1AB35EB92D1D7235ABBB2D71FE7B71EFC36182A05F53808504001BE95F248C8772D12AB927C928AFDDF6D34D7AD2FCD7853A3011C0662A8FD08
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE71BB7708D34E2BFDAEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063770519A3AF4A224F58638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8D2E1ACF7608D463E6D5721B2BDAFF0D66F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE746CC513BB44FBA1D9FA2833FD35BB23D9E625A9149C048EECCD848CCB6FE560CC26CFBAC0749D213D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B317C7E487E00003AA471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FC03C2644391C455E83AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F7900637A28A502E88DD91B5D81D268191BDAD3D3666184CF4C3C14F3FC91FA280E0CE3D1A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89F00AD5422731CA18C42539A7722CA490CB5C8C57E37DE458BEDA766A37F9254B7
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D343F22CE0A71FDB37EDABA773E2D92384F8E5A4C6A0DCD5F9197EAFA0D7F1437339D215E88C548ACA41D7E09C32AA3244C9D5C9865B7C3989B4208942C1BA2010764EE5813BBCA3A9DED98077840A144B9
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojrPvsFeLNXrVGfy8Eo+s3BA==
X-Mailru-Sender: 6C3E74F07C41AE944C83DF7F8E76CAD98D61B4B1ECF62AA8FE367B51D0645A45E1E1E2713883DFAD671A0538F0E0E4B8C77752E0C033A69E86F8B8EC1BECD1EECCC3E8BC0E932F7CB4A721A3011E896F
X-Mras: Ok



21.03.2023 1:51, Tamas K Lengyel wrote:
> 
> 
> On Mon, Mar 20, 2023 at 12:32 PM Ковалёв Сергей <valor@list.ru 
> <mailto:valor@list.ru>> wrote:
>  >
>  > gva_to_gfn command used for fast address translation in LibVMI project.
>  > With such a command it is possible to perform address translation in
>  > single call instead of series of queries to get every page table.
> 
> You have a couple assumptions here:
>   - Xen will always have a direct map of the entire guest memory - there 
> are already plans to move away from that. Without that this approach 
> won't have any advantage over doing the same mapping by LibVMI

Thanks! I didn't know about the plan. Though I use this patch
back ported into 4.16.

>   - LibVMI has to map every page for each page table for every lookup - 
> you have to do that only for the first, afterwards the pages on which 
> the pagetable is are kept in a cache and subsequent lookups would be 
> actually faster then having to do this domctl since you can keep being 
> in the same process instead of having to jump to Xen.

Yes. I know about the page cache. But I have faced with several issues
with cache like this one https://github.com/libvmi/libvmi/pull/1058 .
So I had to disable the cache.

> 
> With these perspectives in mind I don't think this would be a useful 
> addition. Please prove me wrong with performance numbers and a specific 
> use-case that warrants adding this and how you plan to introduce it into 
> LibVMI without causing performance regression to all other use-cases.

I will send You a PR into LibVMI in a day or two. I don't have any
performance numbers at the time. I send this patch to share my current
work as soon as possible.

To prevent regression in all use-cases we could add a configure option.
Thanks to make me notice that!

> 
> Tamas


-- 
С уважением,
Ковалёв Сергей.


