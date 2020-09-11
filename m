Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 827FC265961
	for <lists+xen-devel@lfdr.de>; Fri, 11 Sep 2020 08:30:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGcZD-0004FW-7z; Fri, 11 Sep 2020 06:29:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eh3a=CU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kGcZB-0004FR-QH
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2020 06:29:49 +0000
X-Inumbo-ID: 6e18164a-8866-44f2-96dc-9a56faf07621
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6e18164a-8866-44f2-96dc-9a56faf07621;
 Fri, 11 Sep 2020 06:29:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CE39FAED8;
 Fri, 11 Sep 2020 06:30:03 +0000 (UTC)
Subject: Re: [PATCH 01/11 v2] gitignore: Move ignores from global to
 subdirectories
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Doug Goldstein <cardoe@cardoe.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <202009092152.089LqrKZ039176@m5p.com>
 <75d49f83-f53a-8263-40c3-51d2cd624ccd@suse.com>
 <20200910182200.GB45655@mattapan.m5p.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3174b892-6177-cf8a-2c2a-7c6f1b0ecc2e@suse.com>
Date: Fri, 11 Sep 2020 08:29:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200910182200.GB45655@mattapan.m5p.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 10.09.2020 20:22, Elliott Mitchell wrote:
> On Thu, Sep 10, 2020 at 11:13:26AM +0200, Jan Beulich wrote:
>> On 27.08.2020 21:09, Elliott Mitchell wrote:
>>> --- a/tools/misc/.gitignore
>>> +++ b/tools/misc/.gitignore
>>> @@ -1 +1,22 @@
>>> -xen-ucode
>>> +/cpuperf/cpuperf-perfcntr
>>> +/cpuperf/cpuperf-xen
>>> +/lowmemd
>>> +/xc_shadow
>>> +/xen-cpuid
>>> +/xen-detect
>>> +/xen-diag
>>> +/xen-hptool
>>> +/xen-hvmcrash
>>> +/xen-hvmctx
>>> +/xen-livepatch
>>> +/xen-lowmemd
>>> +/xen-mfndump
>>> +/xen-tmem-list-parse
>>> +/xen-ucode
>>> +/xen_cpuperf
>>> +/xencov
>>> +/xenhypfs
>>> +/xenlockprof
>>> +/xenperf
>>> +/xenpm
>>> +/xenwatchdogd
>>
>> The earlier discussion had left me with the impression that the ./
>> form would be slightly better to use to avoid puzzling the
>> occasional reader. Did I overlook or mis-interpret anything? Did you
>> come to the conclusion that / is better, but forgot to mention the
>> "why" in at least the cover letter?
> 
> Some of Xen's documentation isn't that great, even though most of `git`'s
> documentation is quite good a few pieces aren't so great.  The
> information on how .gitignore files are treated is less than wonderful.
> 
> I had *thought* "./" would restrict to capturing files in the current
> directory, but after some testing and then some reading of the
> documentation (oh, `git check-ignore` is a thing).  Then reading the
> documentation again.  Then reading the documentation *again*.  I found an
> initial "/" restricts a pattern to the current directory, but `git`
> doesn't handle "./".
> 
> Apparently a pattern with a slash *anywhere* besides the *end* (which
> includes the very start) will be treated as a full path relative to the
> current directory.  As such "foo/bar" and "/foo/bar" are equivalent.  Yet
> "foo" and "/foo" are *not* equivalent.

But then ./foo and /foo ought to be equivalent, too. Unless of
course the . gets in the way of matching names in the first
place ...

Jan

