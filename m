Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E26B25D1B4
	for <lists+xen-devel@lfdr.de>; Fri,  4 Sep 2020 08:53:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kE5aY-0002yR-Hn; Fri, 04 Sep 2020 06:52:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=saQb=CN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kE5aW-0002yM-TT
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 06:52:44 +0000
X-Inumbo-ID: 578f55d8-49de-4c85-bf33-5715ead8c974
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 578f55d8-49de-4c85-bf33-5715ead8c974;
 Fri, 04 Sep 2020 06:52:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2601DAC19;
 Fri,  4 Sep 2020 06:52:43 +0000 (UTC)
Subject: Re: [xen-unstable test] 153602: regressions - FAIL
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Ian Jackson <iwj@xenproject.org>
Cc: Costin Lupu <costin.lupu@cs.pub.ro>, xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>
References: <osstest-153602-mainreport@xen.org>
 <1bdbf90f-2150-cb86-63a2-37e5148ec34e@suse.com>
 <24401.5895.115731.487189@mariner.uk.xensource.com>
 <52d2bdeb-ccde-9d9d-9f62-24571e9e4c15@suse.com>
 <565646cc-2833-d34e-2bc3-eb920ac7f140@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <233c6207-4724-55b0-3c92-84251edfc5b2@suse.com>
Date: Fri, 4 Sep 2020 08:52:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <565646cc-2833-d34e-2bc3-eb920ac7f140@suse.com>
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

On 04.09.2020 08:38, Jürgen Groß wrote:
> On 04.09.20 08:32, Jan Beulich wrote:
>> On 03.09.2020 18:17, Ian Jackson wrote:
>>> Jan Beulich writes ("Re: [xen-unstable test] 153602: regressions - FAIL"):
>>>> On 03.09.2020 12:24, osstest service owner wrote:
>>>>> flight 153602 xen-unstable real [real]
>>>>> http://logs.test-lab.xenproject.org/osstest/logs/153602/
>>>>>
>>>>> Regressions :-(
>>>>>
>>>>> Tests which did not succeed and are blocking,
>>>>> including tests which could not be run:
>>>>>   test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 10 debian-hvm-install fail REGR. vs. 152877
>>>>>   test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 10 debian-hvm-install fail REGR. vs. 152877
>>>>
>>>> While at least the hypervisor logs don't provide clear indication
>>>> (and I don't know where else to look among the files osstest
>>>> provides) I can't help thinking that stubdom apparently
>>>> crashing is still fallout from the mini-os changes (and no-one
>>>> really looks to care). In particular I think that this
>>>
>>> I haven't looked at this in detail but I notice that I am having
>>> build failures.
>>>
>>> Prior to e013e8514389 "config: use mini-os master for unstable", the
>>> version of mini-os used for builds was controlled by xen.git's
>>> Config.mk.
>>>
>>> Since then it has been mini-os master.  NB there is no push gate for
>>> mini-os.  IIRC we discussed this at the time and it was thought that
>>> breakage due to mini-os would be unlikely.
>>>
>>> To unblock development in xen.git I suggest reverting the minios part
>>> of 165f3afbfc3d "Config.mk: Unnail versions (for unstable branch)",
>>> choosing some known-working version of minios to put in Config.mk.
>>
>> Afaict this would still not work, due to 8d990807ec2c ("stubdom/grub:
>> update init_netfront() call for mini-os"). The dependencies between
>> the two trees aren't helpful at all in a case like this one.
> 
> This is clearly a problem of the mini-os private interfaces used by
> stubdom/grub. The clean solution here would be either to add a stable
> ABI to mini-os usable by stubdom/grub (and probably others in similar
> cases) in order to avoid such issues, or to have feature defines like
> for libxl in order to be able to specify to use the old interfaces of
> mini-os by stubdoms (which could be removed after all users having been
> switched to the new interfaces).

Actually, with also reverting 8d990807ec2c in the main tree (along with
effectively reverting e013e8514389, which comes down to the same as Ian
suggested for 165f3afbfc3d), and with its future re-installment at the
same time bumping the mini-os commit to use, things ought to work I
would think. That would then be the same model again as used for
qemu-trad.

Jan

