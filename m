Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8301F7C6A
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 19:20:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjnLQ-0006dL-NK; Fri, 12 Jun 2020 17:19:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4JN/=7Z=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jjnLP-0006dG-7W
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 17:19:55 +0000
X-Inumbo-ID: ee39802a-acd0-11ea-8496-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ee39802a-acd0-11ea-8496-bc764e2007e4;
 Fri, 12 Jun 2020 17:19:54 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: /nQooLJvH6IZHgxgGvmOgqMAoDqd5ohFLsielr+JMRI+KQVnyfVbZT3Ou5TV3HVh9yOg9AdrSZ
 3Vq8MMMmscqe1kixsOzAhSwceAt7K1/wNtw0dxYorqHMSkUvcvg1WJ7hcD60keE7PdfUPfvzcA
 WAVqvIXKaHiFeaVyPEBLOEfTbrjdh835lpYc9KCuxuBsZOQjl120EMrY+VNFjx4kumUcx/Xwzd
 rTh4jDTJwEt6H5qg9yBjrf7ynLrnFMXMnD+5ZCKQq0zwJJR7j49Wd6FG3Rs1nkI1FK9DFEIlvf
 IeY=
X-SBRS: 2.7
X-MesageID: 20273413
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,504,1583211600"; d="scan'208";a="20273413"
Subject: Re: Xen 4.10 breakage with buster (was Re: [xen-4.10-testing test]
 151033: regressions - trouble: blocked/fail/pass/starved)
To: Ian Jackson <ian.jackson@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "George
 Dunlap" <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <osstest-151033-mainreport@xen.org>
 <24291.43673.301735.439410@mariner.uk.xensource.com>
 <24291.45488.423085.940252@mariner.uk.xensource.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <becfad2d-01fd-2559-7fb4-837a9d71eb42@citrix.com>
Date: Fri, 12 Jun 2020 18:19:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <24291.45488.423085.940252@mariner.uk.xensource.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 12/06/2020 17:47, Ian Jackson wrote:
> Ian Jackson writes ("Xen 4.10 breakage with buster (was Re: [xen-4.10-testing test] 151033: regressions - trouble: blocked/fail/pass/starved)"):
>>>  test-amd64-amd64-xl-qcow2    10 debian-di-install        fail REGR. vs. 150039
>>>  test-amd64-amd64-pygrub      10 debian-di-install        fail REGR. vs. 150039
>>>  test-amd64-i386-xl-raw       10 debian-di-install        fail REGR. vs. 150039
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

Ah - you found them faster than I did.  Yes - these were the ones I was
thinking of.

No objections.

~Andrew

