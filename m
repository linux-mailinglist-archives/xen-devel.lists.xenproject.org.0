Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 944AB2F6EF9
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 00:34:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67545.120641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0C7R-00050b-2d; Thu, 14 Jan 2021 23:33:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67545.120641; Thu, 14 Jan 2021 23:33:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0C7Q-00050C-VQ; Thu, 14 Jan 2021 23:33:32 +0000
Received: by outflank-mailman (input) for mailman id 67545;
 Thu, 14 Jan 2021 23:33:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G/ia=GR=xilinx.com=stefanos@srs-us1.protection.inumbo.net>)
 id 1l0C7P-000507-Ib
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 23:33:31 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (unknown
 [40.107.223.42]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4eb765cd-1e4c-4050-b8bd-bc5cafbaeaa1;
 Thu, 14 Jan 2021 23:33:29 +0000 (UTC)
Received: from BL1PR13CA0064.namprd13.prod.outlook.com (2603:10b6:208:2b8::9)
 by CY4PR02MB2758.namprd02.prod.outlook.com (2603:10b6:903:11c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.11; Thu, 14 Jan
 2021 23:33:28 +0000
Received: from BL2NAM02FT062.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:2b8:cafe::82) by BL1PR13CA0064.outlook.office365.com
 (2603:10b6:208:2b8::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.6 via Frontend
 Transport; Thu, 14 Jan 2021 23:33:27 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT062.mail.protection.outlook.com (10.152.77.57) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3742.6 via Frontend Transport; Thu, 14 Jan 2021 23:33:27 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 14 Jan 2021 15:33:25 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Thu, 14 Jan 2021 15:33:25 -0800
Received: from [10.23.124.104] (port=58123 helo=localhost)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <stefano.stabellini@xilinx.com>)
 id 1l0C7J-0007nr-5m; Thu, 14 Jan 2021 15:33:25 -0800
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
X-Inumbo-ID: 4eb765cd-1e4c-4050-b8bd-bc5cafbaeaa1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MimWrYfo7iZEkT5De7mOjYetkoTobXU+zSplckFlO4FCXx0li2QQ0dSAuBNYuvJUS0t06qO0jJiCbI/IYUsT4pwE80J8U8rR08/1VrnpFpY7dd1q+hB/k4kx2WpUlOUASpPSttWS0HZj7smwAcEziarU5x7kgJZ+nJhrYZ24STasmF3juJErhzqst2uyu21JX6HsSFJpwDEi6E2QBMK+S/7zMekdL8ErmG0nfuCYvjes731qvrAbswEaT7CiHcuHm4bF6eOExhXgtGQ89OhNd5hjZcxFicenytpm9GtdCggXY/4VvMQYMJTguvC3dlW1MHCVGUxJ5HtKyXuuIuKV9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wi2Vd7a0tY+V6YcutHMFB5unCQcz9neRn0M7jTpgTHI=;
 b=lLsxJxbcKTTWyLT1WhQeU4ruvIH///PmCkxyKjmRW6PfS4rAJRfmkOJYTyG2nQXZ6UZe9CKfZwnSEXXq68R4gJ6Tt3JMdn2Qy3E0p9zNPcmbgmubdxmFuXom//2zL1ybALwsR2bpOs294nTJOWIPZrqQxZtqK7c/1UGCTcGL+u4EeT47aF8tChNwruIjzWz8u5zJAIEmWr78kujQ3SrttKBukY0tlVUnrWQpA1x6ABV5QnToRi22ChrqT1kS1JeBSjbxdQ06u+Mjv3a+jzJoO/PsmQ43djohLL1FGPbmWaElOV7lCKjBsxib58b02eS55tFNLRTAIu15FGuRDApVEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=epam.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wi2Vd7a0tY+V6YcutHMFB5unCQcz9neRn0M7jTpgTHI=;
 b=hvapnsBdMqfRp9bS/Bnj32WO5XZ5yZ/kCwO7i7p8g0cNy1JhCarVIeHmWDJHAw4aAQed9D/qC3Un6K4J5Qm1msu3IJwK1OHOF1x1/NUINU9d1BGZjnh/gyOIG3q8HXMuUSWrYMlobvJP6mVO8d/6bS4BI/bPyrzfSTsc6jozXoE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Date: Thu, 14 Jan 2021 15:33:24 -0800
From: Stefano Stabellini <stefano.stabellini@xilinx.com>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Julien
 Grall" <jgrall@amazon.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>, Dario Faggioli <dario.faggioli@suse.com>,
	<Bertrand.Marquis@arm.com>, <andrew.cooper3@citrix.com>
Subject: Re: IRQ latency measurements in hypervisor
In-Reply-To: <87pn294szv.fsf@epam.com>
Message-ID: <alpine.DEB.2.21.2101141515230.31265@sstabellini-ThinkPad-T480s>
References: <87pn294szv.fsf@epam.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3ae3f66-771c-4a9d-0914-08d8b8e4cb48
X-MS-TrafficTypeDiagnostic: CY4PR02MB2758:
X-Microsoft-Antispam-PRVS:
	<CY4PR02MB2758FE6A7E8AABAE815F851EA0A80@CY4PR02MB2758.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DJ5sUM1VJrrA7yeWKiNEVKBWM4k87HyRmjZCahaOyl9yB88F0ShqMs4hKUuxIAxQDlXY4eHPB2w5hGOonXLLK/TIO3fiKCRudmAg9Xsks4itdPplimkp1O/fg1tOLoicqrAXQ4IP4FdBhYQ5MEa0411SHKnVa74vJvQ1PDiVB1UupVef4VFeIXll3TKS8o46nbkzMZ1U8QkOJa29tnkQKAQQuFw9jFeZQEwwT9WKi+xBeIEhquwJvWMvsvC9uhcipwA3K4YHpKT9iPjvexFP+FL8UosfdbR3g+NlrNxjgIL50a9oCu5+KPq5+1U7S+MxSej2paCm1zFSnayJ5992Hwt5zumdp0s5zUaaltXHk0r1RXOTHR70eQ6zMkRIZFx6dkLgFnvDvUFKCHN4OXXbAljwsJYi7tT7UT7p2PLGkYAZ85x6sZ/1w3dk5b4VFxilMl2lE26VJmxSEiSJ9RICTps2aNqFZghy+1cu4eGqPz9aci+pA4eQyPbyiz54RTF9+bl6rE977Fc1543r8YfSPxJOL0oinvAebrGeaCH9IHpQoIZpGd2/5ikGyHgkNh0X
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(7916004)(39860400002)(376002)(136003)(346002)(396003)(46966006)(6916009)(8676002)(8936002)(82310400003)(2906002)(9686003)(9786002)(47076005)(33716001)(54906003)(36906005)(336012)(82740400003)(5660300002)(426003)(7636003)(316002)(26005)(4326008)(966005)(356005)(186003)(83380400001)(44832011)(478600001)(70586007)(70206006)(34020700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 23:33:27.4065
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3ae3f66-771c-4a9d-0914-08d8b8e4cb48
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL2NAM02FT062.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2758

+ Bertrand, Andrew (see comment on alloc_heap_pages())

Really great work, Volodymyr! Some comments below.


On Tue, 12 Jan 2021, Volodymyr Babchuk wrote:
> Hello community,
> 
> Recently I was experimenting with context switching latencies in
> Xen. I want to share my findings and discuss some issues I have found.
> 
> My target was to ensure that no more 30us passes between interrupt
> generation and handling in a guest VM. Main goal was to determine if
> Xen is ready for soft RT and to identify main issues that prevent
> this.
> 
> TLDR: I was able to achieve mean 15us latency with tuned RTDS
> scheduler, disabled serial console and some hacks to the Xen
> toolstack. This was done on a setup with 1 PCPU.
> 
> Test setup.
> 
> ARMv8 platform. Namely Renesas Rcar H3 SoC on Salvator board.
> 
> To accurately determine latency, I employed one of timer counter units
> (TMUs) available on the SoC. This is 32-bit timer with auto-reload,
> that can generate interrupt on underflow. I fed it with 33.275MHz
> clock, which gave me resolution of about 30ns. I programmed the timer
> to generate interrupt every 10ms. My ISR then read the current timer
> value and determined how much time passed since last underrun. This
> gave me time interval between IRQ generation and ISR invocation.
> Those values were collected and every 10 seconds statistics was
> calculated. There is an example of output from my Linux driver:

It looks like a solid approach to collect results, similar to the one we
used for the cache coloring work. Just make sure to collect very many
results.

A few of questions: did you use a single physical CPU? Are you using
RTDS and schedule 2 vCPU on 1 pCPU? Is dom0 idle or busy? I take the
results were measured in domU?


> [   83.873162] rt_eval_tmu e6fc0000.tmu: Mean: 44 (1320 ns) stddev: 8 (240 ns)
> [   94.136632] rt_eval_tmu e6fc0000.tmu: Mean: 44 (1320 ns) stddev: 8 (240 ns)
> [  104.400098] rt_eval_tmu e6fc0000.tmu: Mean: 50 (1500 ns) stddev: 129 (3870 ns)
> [  114.663828] rt_eval_tmu e6fc0000.tmu: Mean: 44 (1320 ns) stddev: 8 (240 ns)
> [  124.927296] rt_eval_tmu e6fc0000.tmu: Mean: 56 (1680 ns) stddev: 183 (5490 ns)
> 
> This is the baremetal Linux. And there is Dom0:
> 
> [  237.431003] rt_eval_tmu e6fc0000.tmu: Mean: 306 (9180 ns) stddev: 25 (750 ns)
> [  247.694506] rt_eval_tmu e6fc0000.tmu: Mean: 302 (9060 ns) stddev: 17 (510 ns)
> 
> Driver outputs both the raw timer value (eg. 4) and the same value
> scaled to nanoseconds (eg. 1320 ns). As you can see baremetal setup is
> much faster. But experiments showed that Linux does not provide
> consistent values, even when running in baremetal mode. You can see
> sporadic spikes in "std dev" values.

So baremetal IRQ latency is 1320-1680ns and Linux IRQ latency is
9060-9180ns. I am not surprised that Linux results are inconsistent but
I have a couple of observations:

- 9us is high for Linux
If the system is idle, the latency should be lower, around 2-3us. I
imagine you are actually running some sort of interference from dom0? Or
using RTDS and descheduling vCPUs?

- the stddev of 3870ns is high for baremetal
In the baremetal case the stddev should be minimal if the system is
idle.


> So my next step was to use proper RT OS to do the measurements. I
> chose Zephyr. My PR that adds Xen support to Zephyr can be found at
> [1]. Support for RCAR Gen3 is not upstreamed, but is present on my
> GitHub([2]). At [3] you can find the source code for application that
> does the latency measurements. It behaves exactly as my linux driver,
> but provides a bit more information:
> 
>  *** Booting Zephyr OS build zephyr-v2.4.0-2750-g0f2c858a39fc  ***
> RT Eval app
> 
> Counter freq is 33280000 Hz. Period is 30 ns
> Set alarm in 0 sec (332800 ticks)
> Mean: 600 (18000 ns) stddev: 3737 (112110 ns) above thr: 0% [265 (7950 ns) - 66955 (2008650 ns)] global [265 (7950 ns) 66955 (2008650 ns)]
> Mean: 388 (11640 ns) stddev: 2059 (61770 ns) above thr: 0% [266 (7980 ns) - 58830 (1764900 ns)] global [265 (7950 ns) 66955 (2008650 ns)]
> Mean: 358 (10740 ns) stddev: 1796 (53880 ns) above thr: 0% [265 (7950 ns) - 57780 (1733400 ns)] global [265 (7950 ns) 66955 (2008650 ns)]
> ...
> 
> So there you can see: mean time, standard deviation, % of interrupts
> that was processed above 30us threshold, minimum and maximum latency
> values for the current 10s run, global minimum and maximum.
> 
> Zephyr running as baremetal showed very stable results (this is an
> older build, so no extended statistics there):
> 
> ## Starting application at 0x480803C0 ...
>  *** Booting Zephyr OS build zephyr-v2.4.0-1137-g5803ee1e8183  ***
> RT Eval app
> 
> Counter freq is 33280000 Hz. Period is 30 ns
> Mean: 31 (930 ns) stddev: 0 (0 ns)
> Mean: 31 (930 ns) stddev: 0 (0 ns)
> Mean: 31 (930 ns) stddev: 0 (0 ns)
> Mean: 31 (930 ns) stddev: 0 (0 ns)
> Mean: 31 (930 ns) stddev: 0 (0 ns)
> Mean: 31 (930 ns) stddev: 0 (0 ns)
> ...
> 
> As Zephyr provided stable readouts with no jitter, I used it to do all
> subsequent measurements.

I am a bit confused here. Looking at the numbers above the stddev is
112110 ns in the first instance. That is pretty high. Am I looking at
the wrong numbers?


 
> IMPORTANT! All subsequent tests was conducted with only 1 CPU core
> enabled. My goal was to ensure that system can timely react to an
> external interrupt even under load.

All right. FYI I have no frame of reference for 2 vCPUs on 1 pCPUs, all
my tests were done with 1vCPU <-> 1pCPU and the null scheduler.

 
> Test results and latency sources
> 
> As you can see, baremetal OS provides latency of ~0.9us without any
> deviations. The same code running as DomU on idle system shows mean
> latency of 12us and deviation of about 10us. Range of latencies in a
> 10s batch can vary from 8us to 25us. This fits into required 30us
> threshold, so no big issue there.
> 
> But this worsens under certain conditions.
> 
> 1. Serial console. RCAR serial driver (scif) works in synchronous
>    mode, so any heavy serial console output leads to higher
>    latency. Tests shows mean latency of 1000us and deviation of 1332
>    us. 54% of interrupts are handled outside of 30us period. Real
>    values may be even higher, because in some cases timer would do
>    full cycle and instead of say 11ms ISR would read 11 % 10 = 1ms
>    latency. I tried to enable asynchronous mode for the serial
>    console. This made things better, but it lead to gaps in output, so
>    I just turned the serial console off completely.

That's very interesting. I wonder if other serial drivers would cause
similar issues, e.g. PL011.


> 2. RTDS scheduler. With console disabled, things like "hexdump -v
>    /dev/zero" didn't affected the latency so badly, but anyways,
>    sometimes I got ~600us spikes. This is not a surprise, because of
>    default RTDS configuration. I changed period for DomU from default
>    10ms to 100us and things got better: with Dom0 burning CPU I am
>    rarely getting max latency of about ~30us with mean latency of ~9us
>    and deviation of ~0.5us. On other hand, when I tried to set period
>    to 30us, max latency rose up to ~60us.

This is very interestingi too. Did you get any spikes with the period
set to 100us? It would be fantastic if there were none.


> 3. Huge latency spike during domain creation. I conducted some
>    additional tests, including use of PV drivers, but this didn't
>    affected the latency in my "real time" domain. But attempt to
>    create another domain with relatively large memory size of 2GB led
>    to huge spike in latency. Debugging led to this call path:
> 
>    XENMEM_populate_physmap -> populate_physmap() ->
>    alloc_domheap_pages() -> alloc_heap_pages()-> huge
>    "for ( i = 0; i < (1 << order); i++ )" loop.
> 
>    This loops handles struct page* for every one of 262144 pages that
>    was allocated by calling populate_physmap(). This function is not
>    preemptible and it takes about a second to complete on my
>    setup. Needless to say that it completely screws any responsiveness
>    of the hypervisor.
> 
> I managed to overcome the issue #3 by commenting out all calls to
> populate_one_size() except the populate_one_size(PFN_4K_SHIFT) in
> xg_dom_arm.c. This lengthened domain construction, but my "RT" domain
> didn't experienced so big latency issues. Apparently all other
> hypercalls which are used during domain creation are either fast or
> preemptible. No doubts that my hack lead to page tables inflation and
> overall performance drop.

I think we need to follow this up and fix this. Maybe just by adding
a hypercall continuation to the loop.



> Conclusions.
> 
> I wanted to:
> 
> 1. Share my approach to IRQ latency measurements.
> 
> 2. Share results of said measurements.

Thank you very much. I asked a couple of questions above to better
understand your setup.


> 3. Ask for other potential scenarios, which can affect IRQ latency so I
>    can test them on my setup.

I'll follow up once I understood the above a bit better.


> 4. Discuss the issue with alloc_domheap_pages(). I brooded over ways
>    to make it preemptible. But it is a) located deep in call chain and
>    b) used not only by hypercalls. So I can't see an easy way to make
>    it preemptible. The best solution would be of course to make the
>    whole hypervisor preemptible. I even heard about some work long
>    time ago...
> 
> 5. Show that under certain conditions Xen can be used in a soft RT
>    system. Of course, additional tests are needed, but with some minor
>    tweaks it can provide ~15us IRQ latency on a typical workload.
> 
> [1] https://github.com/zephyrproject-rtos/zephyr/pull/30164
> [2] https://github.com/lorc/zephyr/tree/renesas_salvator_x
> [3] https://github.com/lorc/zephyr/blob/rt_eval/samples/rt_eval/src/main.c


