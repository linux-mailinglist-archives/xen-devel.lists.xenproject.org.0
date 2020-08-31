Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A80E3257B3F
	for <lists+xen-devel@lfdr.de>; Mon, 31 Aug 2020 16:25:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kCkkY-0007ob-9N; Mon, 31 Aug 2020 14:25:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RZUy=CJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kCkkW-0007oV-KQ
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2020 14:25:32 +0000
X-Inumbo-ID: 30eaf966-0acc-419a-9ddd-399473519308
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 30eaf966-0acc-419a-9ddd-399473519308;
 Mon, 31 Aug 2020 14:25:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6EA19AB3E;
 Mon, 31 Aug 2020 14:25:30 +0000 (UTC)
Subject: Re: [xen-unstable test] 153154: regressions - trouble:
 broken/fail/pass
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org, "Durrant, Paul" <pdurrant@amazon.com>
References: <osstest-153154-mainreport@xen.org>
 <97b0ec7e-6b74-88f1-ccb0-cc22ea2817c9@suse.com>
 <20200831142347.GC753@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <722eb6de-66be-99c4-c88d-7ed9a85288fe@suse.com>
Date: Mon, 31 Aug 2020 16:25:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200831142347.GC753@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 31.08.2020 16:23, Roger Pau Monné wrote:
> On Mon, Aug 31, 2020 at 06:40:56AM +0200, Jürgen Groß wrote:
>> On 30.08.20 18:11, osstest service owner wrote:
>>> flight 153154 xen-unstable real [real]
>>> http://logs.test-lab.xenproject.org/osstest/logs/153154/
>>>
>>> Regressions :-(
>>>
>>> Tests which did not succeed and are blocking,
>>> including tests which could not be run:
>>>   test-amd64-amd64-xl-qemut-debianhvm-i386-xsm    <job status>            broken
>>>   test-amd64-amd64-xl-qemut-debianhvm-amd64    <job status>               broken
>>>   test-amd64-i386-xl-qemut-win7-amd64    <job status>                 broken
>>>   test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 10 debian-hvm-install fail REGR. vs. 152877
>>>   test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 10 debian-hvm-install fail REGR. vs. 152877
>>
>> Paul, I suspect some fallout from your hotplug/mtu series?
>>
>> The failure in
>>
>> http://logs.test-lab.xenproject.org/osstest/logs/153154/test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm/10.ts-debian-hvm-install.log
>>
>> is pointing in this direction IMO.
> 
> There's a stubdom panic at:
> 
> http://logs.test-lab.xenproject.org/osstest/logs/153154/test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm/godello0---var-log-xen-qemu-dm-debianhvm.guest.osstest.log
> 
> No idea if it's related to the MTU stuff or not. Seems to happen during
> netfront initialization, so might be related.

Might also be the netfront_init() changes in / for mini-os then.

Jan

