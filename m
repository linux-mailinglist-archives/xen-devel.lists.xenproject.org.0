Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E031E7E60
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 15:15:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeer6-0007ah-FG; Fri, 29 May 2020 13:15:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5ub4=7L=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jeer5-0007ac-9B
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 13:15:23 +0000
X-Inumbo-ID: 7305dc78-a1ae-11ea-a8b4-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7305dc78-a1ae-11ea-a8b4-12813bfff9fa;
 Fri, 29 May 2020 13:15:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 79FA2AEDD;
 Fri, 29 May 2020 13:15:20 +0000 (UTC)
Subject: Re: [BUG] Core scheduling patches causing deadlock in some situations
To: =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>
References: <1317891616.59673956.1590755403816.JavaMail.zimbra@cert.pl>
 <57d213df-9edb-8f31-59e4-13f5cc07b543@suse.com>
 <1150720994.59695220.1590756705329.JavaMail.zimbra@cert.pl>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <1f68a02a-3472-1bb0-90b9-6f3ccefca0b3@suse.com>
Date: Fri, 29 May 2020 15:15:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1150720994.59695220.1590756705329.JavaMail.zimbra@cert.pl>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: chivay@cert.pl, xen-devel@lists.xenproject.org, bonus@cert.pl,
 Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 29.05.20 14:51, Michał Leszczyński wrote:
> ----- 29 maj 2020 o 14:44, Jürgen Groß jgross@suse.com napisał(a):
> 
>> On 29.05.20 14:30, Michał Leszczyński wrote:
>>> Hello,
>>>
>>> I'm running DRAKVUF on Dell Inc. PowerEdge R640/08HT8T server with Intel(R)
>>> Xeon(R) Gold 6132 CPU @ 2.60GHz CPU.
>>> When upgrading from Xen RELEASE 4.12 to 4.13, we have noticed some stability
>>> problems concerning freezes of Dom0 (Debian Buster):
>>>
>>> ---
>>>
>>> maj 27 23:17:02 debian kernel: rcu: INFO: rcu_sched self-detected stall on CPU
>>> maj 27 23:17:02 debian kernel: rcu: 0-....: (5250 ticks this GP)
>>> idle=cee/1/0x4000000000000002 softirq=11964/11964 fqs=2515
>>> maj 27 23:17:02 debian kernel: rcu: (t=5251 jiffies g=27237 q=799)
>>> maj 27 23:17:02 debian kernel: NMI backtrace for cpu 0
>>> maj 27 23:17:02 debian kernel: CPU: 0 PID: 643 Comm: z_rd_int_1 Tainted: P OE
>>> 4.19.0-6-amd64 #1 Debian 4.19.67-2+deb10u2
>>> maj 27 23:17:02 debian kernel: Hardware name: Dell Inc. PowerEdge R640/08HT8T,
>>> BIOS 2.1.8 04/30/2019
>>> maj 27 23:17:02 debian kernel: Call Trace:
>>> maj 27 23:17:02 debian kernel: <IRQ>
>>> maj 27 23:17:02 debian kernel: dump_stack+0x5c/0x80
>>> maj 27 23:17:02 debian kernel: nmi_cpu_backtrace.cold.4+0x13/0x50
>>> maj 27 23:17:02 debian kernel: ? lapic_can_unplug_cpu.cold.29+0x3b/0x3b
>>> maj 27 23:17:02 debian kernel: nmi_trigger_cpumask_backtrace+0xf9/0xfb
>>> maj 27 23:17:02 debian kernel: rcu_dump_cpu_stacks+0x9b/0xcb
>>> maj 27 23:17:02 debian kernel: rcu_check_callbacks.cold.81+0x1db/0x335
>>> maj 27 23:17:02 debian kernel: ? tick_sched_do_timer+0x60/0x60
>>> maj 27 23:17:02 debian kernel: update_process_times+0x28/0x60
>>> maj 27 23:17:02 debian kernel: tick_sched_handle+0x22/0x60
>>>
>>> ---
>>>
>>> This usually results in machine being completely unresponsive and performing an
>>> automated reboot after some time.
>>>
>>> I've bisected commits between 4.12 and 4.13 and it seems like this is the patch
>>> which introduced a bug:
>>> https://github.com/xen-project/xen/commit/7c7b407e77724f37c4b448930777a59a479feb21
>>>
>>> Enclosed you can find the `xl dmesg` log (attachment: dmesg.txt) from the fresh
>>> boot of the machine on which the bug was reproduced.
>>>
>>> I'm also attaching the `xl info` output from this machine:
>>>
>>> ---
>>>
>>> release : 4.19.0-6-amd64
>>> version : #1 SMP Debian 4.19.67-2+deb10u2 (2019-11-11)
>>> machine : x86_64
>>> nr_cpus : 14
>>> max_cpu_id : 223
>>> nr_nodes : 1
>>> cores_per_socket : 14
>>> threads_per_core : 1
>>> cpu_mhz : 2593.930
>>> hw_caps :
>>> bfebfbff:77fef3ff:2c100800:00000121:0000000f:d19ffffb:00000008:00000100
>>> virt_caps : pv hvm hvm_directio pv_directio hap shadow
>>> total_memory : 130541
>>> free_memory : 63591
>>> sharing_freed_memory : 0
>>> sharing_used_memory : 0
>>> outstanding_claims : 0
>>> free_cpus : 0
>>> xen_major : 4
>>> xen_minor : 13
>>> xen_extra : -unstable
>>> xen_version : 4.13-unstable
>>> xen_caps : xen-3.0-x86_64 xen-3.0-x86_32p hvm-3.0-x86_32 hvm-3.0-x86_32p
>>> hvm-3.0-x86_64
>>> xen_scheduler : credit2
>>> xen_pagesize : 4096
>>> platform_params : virt_start=0xffff800000000000
>>> xen_changeset : Wed Oct 2 09:27:27 2019 +0200 git:7c7b407e77-dirty
>>
>> Which is your original Xen base? This output is clearly obtained at the
>> end of the bisect process.
>>
>> There have been quite some corrections since the release of Xen 4.13, so
>> please make sure you are running the most actual version (4.13.1).
>>
>>
>> Juergen
> 
> Sure, we have tested both RELEASE 4.13 and RELEASE 4.13.1. Unfortunately these corrections didn't help and the bug is still reproducible.
> 
>  From our testing it turns out that:
> 
> Known working revision: 997d6248a9ae932d0dbaac8d8755c2b15fec25dc
> Broken revision: 6278553325a9f76d37811923221b21db3882e017
> First bad commit: 7c7b407e77724f37c4b448930777a59a479feb21

Would it be possible to test xen unstable, too?

I could imagine e.g. commit b492c65da5ec5ed or 99266e31832fb4a4 to have
an impact here.


Juergen

