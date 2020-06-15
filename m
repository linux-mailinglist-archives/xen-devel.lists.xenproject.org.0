Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F13701F9895
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 15:30:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkpBH-0002wq-Jj; Mon, 15 Jun 2020 13:29:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gw2r=74=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jkpBG-0002wl-Ds
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 13:29:42 +0000
X-Inumbo-ID: 44283eda-af0c-11ea-b7fb-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 44283eda-af0c-11ea-b7fb-12813bfff9fa;
 Mon, 15 Jun 2020 13:29:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 72ACEACE1;
 Mon, 15 Jun 2020 13:29:43 +0000 (UTC)
Subject: Re: Xen 4.10 breakage with buster (was Re: [xen-4.10-testing test]
 151033: regressions - trouble: blocked/fail/pass/starved)
To: Ian Jackson <ian.jackson@citrix.com>
References: <osstest-151033-mainreport@xen.org>
 <24291.43673.301735.439410@mariner.uk.xensource.com>
 <24291.45488.423085.940252@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3c68a609-a069-f7e1-3c99-291da372df96@suse.com>
Date: Mon, 15 Jun 2020 15:29:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <24291.45488.423085.940252@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 12.06.2020 18:47, Ian Jackson wrote:
> Ian Jackson writes ("Xen 4.10 breakage with buster (was Re: [xen-4.10-testing test] 151033: regressions - trouble: blocked/fail/pass/starved)"):
>>>  test-amd64-amd64-xl-qcow2    10 debian-di-install        fail REGR. vs. 150039
>>>  test-amd64-amd64-pygrub      10 debian-di-install        fail REGR. vs. 150039
>>>  test-amd64-i386-xl-raw       10 debian-di-install        fail REGR. vs. 150039
>>
>>   domainbuilder: detail: xc_dom_find_loader: trying Linux bzImage loader ... 
>>   domainbuilder: detail: XZ: Saw data stream end
>>   domainbuilder: detail: _xc_try_lzma_decode: XZ decompress OK, 0x4cd8f0 -> 0x1a7779c
>>   domainbuilder: detail: loader probe OK
>>   ...
>>   domainbuilder: detail: xc_dom_alloc_segment:   module0      : 0xffffffff82c00000 -> 0xffffffff82c02000  (pfn 0x2c00 + 0x2 pages)
>>   xc: error: panic: xc_dom_core.c:387: xc_dom_do_gunzip: inflate failed (rc=-5): Internal error
>>   libxl: error: libxl_dom.c:744:libxl__build_dom: xc_dom_build_image failed: No such file or directory
>>
>> http://logs.test-lab.xenproject.org/osstest/logs/151033/test-amd64-amd64-pygrub/10.ts-debian-di-install.log
>>
>> ????  Anyone have any ideas ?  I would have guessed that this was an
>> incompatibility between pygrub and the boot config made by the new
>> pygrub but
>>    git-log origin/staging-4.10..origin/stable-4.11 tools/pygrub/
>> suggests not.
> 
> Andy suggested on IRC that there were some compression fixes which had
> perhaps not been backported far enough.
> 
> I think that's
> 
>    lz4: fix system halt at boot kernel on x86_64
>    14b62ab3e5a79816edfc6dd3afce1bb68c106ac5
>    master commit: 5d90ff79542ab9c6eebe5c315c68c196bcf353b9
> 
>    lz4: refine commit 9143a6c55ef7 for the 64-bit case
>    6561994b87af3e9cd28ee99c42e8b2697621687d
>    master commit: 2d7572cdfa4d481c1ca246aa1ce5239ccae7eb59
> 
> Anyone have any objection to me sending those to 4.10 and maybe 4.9 ?
> They apply cleanly in both cases.

Seeing the other pieces that have been put onto these old branches
recently, it's probably fine to add the two ones here as well. In
general, as mentioned before, I view it as wrong to put non-
security fixes onto the security-only branches. But since I can see
why changes to address newer compilers' changed behavior may be
wanted/needed, I guess the ones here fall into a pretty similar
group.

Jan

