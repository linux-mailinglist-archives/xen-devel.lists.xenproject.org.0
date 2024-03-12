Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 936EB879884
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 17:06:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691946.1078594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk4db-0001NT-7U; Tue, 12 Mar 2024 16:05:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691946.1078594; Tue, 12 Mar 2024 16:05:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk4db-0001Kg-4K; Tue, 12 Mar 2024 16:05:59 +0000
Received: by outflank-mailman (input) for mailman id 691946;
 Tue, 12 Mar 2024 16:05:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t7HW=KS=3mdeb.com=krystian.hebel@srs-se1.protection.inumbo.net>)
 id 1rk4dZ-0001KZ-FB
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 16:05:57 +0000
Received: from 17.mo583.mail-out.ovh.net (17.mo583.mail-out.ovh.net
 [46.105.56.132]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68c5d833-e08a-11ee-afdd-a90da7624cb6;
 Tue, 12 Mar 2024 17:05:56 +0100 (CET)
Received: from director7.ghost.mail-out.ovh.net (unknown [10.109.139.11])
 by mo583.mail-out.ovh.net (Postfix) with ESMTP id 4TvJQr0mMdz1FNt
 for <xen-devel@lists.xenproject.org>; Tue, 12 Mar 2024 16:05:56 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-ktqmh (unknown [10.111.182.20])
 by director7.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 24BA81FEA1;
 Tue, 12 Mar 2024 16:05:54 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.108])
 by ghost-submission-6684bf9d7b-ktqmh with ESMTPSA
 id l/0fNGJ98GX/+AEASnncPg
 (envelope-from <krystian.hebel@3mdeb.com>); Tue, 12 Mar 2024 16:05:54 +0000
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
X-Inumbo-ID: 68c5d833-e08a-11ee-afdd-a90da7624cb6
Authentication-Results:garm.ovh; auth=pass (GARM-108S0025fe8f4cf-b773-4400-aff0-01b1bbbd189c,
                    0B6B113C544506A41C6EB031E0F94F2E66B6AEBC) smtp.auth=krystian.hebel@3mdeb.com
X-OVh-ClientIp:217.171.61.25
Message-ID: <173cc1f7-d906-47ed-bba3-d43da219fd7b@3mdeb.com>
Date: Tue, 12 Mar 2024 17:05:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 6/9] x86/shutdown: protect against recurrent
 machine_restart()
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
References: <cover.1699982111.git.krystian.hebel@3mdeb.com>
 <87b0e650f28038c2fb64c5eb607c8fdaa7b4db07.1699982111.git.krystian.hebel@3mdeb.com>
 <665c7f47-a218-4187-858d-562bb5b9513b@suse.com>
From: Krystian Hebel <krystian.hebel@3mdeb.com>
In-Reply-To: <665c7f47-a218-4187-858d-562bb5b9513b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 9035346755143379312
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrjeefgdekgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomhepmfhrhihsthhirghnucfjvggsvghluceokhhrhihsthhirghnrdhhvggsvghlseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejuedvffefvdeuvdeffeduuddtjeetgeefffdugfdvkeehtedutefghfdtteejieenucffohhmrghinhepfehmuggvsgdrtghomhenucfkphepuddvjedrtddrtddruddpvddujedrudejuddriedurddvhedpfeejrdehledrudegvddruddtkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepkhhrhihsthhirghnrdhhvggsvghlseefmhguvggsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdfovfetjfhoshhtpehmohehkeefpdhmohguvgepshhmthhpohhuth


On 8.02.2024 12:30, Jan Beulich wrote:
> On 14.11.2023 18:50, Krystian Hebel wrote:
>> If multiple CPUs called machine_restart() before actual restart took
>> place, but after boot CPU declared itself not online,
> Can you help me please in identifying where this operation is? I can see
> two places where a CPU is removed from cpu_online_map, yet neither
> __stop_this_cpu() nor __cpu_disable() ought to be coming into play here.
> In fact I didn't think CPU0 was ever marked not-online. Except perhaps
> if we came through machine_crash_shutdown() -> nmi_shootdown_cpus(), but
> I'm sure you would have mentioned such a further dependency.
>
> Jan
BUG_ON() in cpu_notifier_call_chain() (I've been playing with some of
the notifiers and one of them eventually failed) resulted in panic()
around the same time AP did in pm_idle() due to inconsistent settings
between BSP and AP for MWAIT/MONITOR support after TXT dynamic
launch. There is 5s delay between smp_send_stop() and actual reboot,
during that time AP spammed the output so the original reason for
panic() was visible only after unreasonable amount of scrolling.

Adding TXT support is the reason why I even started making AP bring-up
parallel. Problem with MWAIT doesn't happen in current code or changes
in this patchset, but handling of such error is related to SMP so I've 
included it.

Best regards,

-- 
Krystian Hebel
Firmware Engineer
https://3mdeb.com | @3mdeb_com


