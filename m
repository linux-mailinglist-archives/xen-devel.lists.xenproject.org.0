Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C53752F8D8D
	for <lists+xen-devel@lfdr.de>; Sat, 16 Jan 2021 15:41:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69032.123722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0mkd-0005TR-KF; Sat, 16 Jan 2021 14:40:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69032.123722; Sat, 16 Jan 2021 14:40:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0mkd-0005T2-Gt; Sat, 16 Jan 2021 14:40:27 +0000
Received: by outflank-mailman (input) for mailman id 69032;
 Sat, 16 Jan 2021 14:40:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mPXe=GT=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l0mkb-0005Sx-4p
 for xen-devel@lists.xenproject.org; Sat, 16 Jan 2021 14:40:25 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2ca8472a-ffc3-4b3e-bc4c-47655f23fa88;
 Sat, 16 Jan 2021 14:40:23 +0000 (UTC)
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
X-Inumbo-ID: 2ca8472a-ffc3-4b3e-bc4c-47655f23fa88
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610808022;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=KJhkfKUEI0Hp4W7qPYL2IfcJm9DtncAExU7SsFBHZQI=;
  b=KHN5r//mlLenpm4H35rjEUoQ1u72TCNGKSo0eNUKr69JEAzNN82popMX
   MW/bIW0uIni3Aii1MjT7IyUaT3xfoZR/5IAUqQSY0PcfE3Z9vgOqsv1Ka
   M3CJBJ/dAHpjpuctyTQTMgMGUXV3e2NpmuOx37BvSHp/RLxjoBueTJU34
   Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: XxuVbzyplCYu8H1Oep1DADzLGTmheL1priIsyzZ/z4hCJbxCLUcwjk2luzm9h12+10wiYQ8J+U
 5dmDD19oP6GVTE/N+jTJX/6WAbwDu3LtJHmlcgTLxw4Q63+RpcEZh1D0g5arb6CkKvl8fWeegj
 zOka+gqZO1/jHgvgMr1lZCdf6BH6+nY/GRGats+dlmRxxnG9ig/WM5DnKm5Wmt41+kuXREy138
 C+i2gGEi7YdtfK3UimKhFmYDSkEzoS6idfhic4lIShH/wQQKcxBVOCddqPaAjDWKcc0FFzEggt
 LkM=
X-SBRS: 5.2
X-MesageID: 35226376
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,352,1602561600"; 
   d="scan'208";a="35226376"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TPmD5De/C4zXh6NDOeMVRDQR9u5k2quBD60hzNK7vwmTbrvqq7BSwNYZEnt5XMehCV/qn+F7qyIlor3jeem7tra/grjj58nrZ8ELxLXxbk5w4y6eRI/lXTCi68YAWJNqDJbroMN4SvN42ja9P1GsDRz11QQCAV0IfUapa0uZmBhgH4X7RWe3B8m+ExvgAg7Wrl7ewZfOJlID7PSNCSAmfV7YOVujtWaVUTp5l208fjPKUfczrjUah5JYhoZS93UXHNKibgyfa+335Sg6BMIVhAkyCf4azcKso+1XokkFdxUTJEkM/UZDaDpueXElgffgLmCf/XHc2EaOUD6PBfqeYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YLRRy/cLgLOVa3liVzc21e7BIeX+y983Tyd0LIZx+Xc=;
 b=LrTNtdTC+jokCqfIGh7ZRDmvW5JjnydBN7Jd1a4eHMXOMq+Ogf3LvIVVmiziNhN7pN7L6WOv98qCazipd2HwO8ITAvGCouuNQ18rsFLigobfVZmHySIO6AM9nukO0JZVie6njWLIq5wjpQnXTh96VPrS3++OcFYP0stXxrscSeFzj/TZ8myDNl4Ff49o26vXRpEiKdTgR4O2p70/WwTiNrQyHEgXwKK6NB/GRcyG+hvX8031SFAMuVkvVCttocibgzAiC+2XGpXtopuJrjeERgMjvNSJcYl7DBC6KVkXaCpI8qFjJKDUbi/gEe1M74c0znZc1ILtkblBQeXm5Fr3oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YLRRy/cLgLOVa3liVzc21e7BIeX+y983Tyd0LIZx+Xc=;
 b=AL5zNhN12FbdKo8vfVmb9VAq1N2GUKONLyss2j5HyG72EdXwXpKReQkOkiXY96a7p2NWkCjfrynhemt8+p0qMSq2juV9dTrTeQZ4EPMqWzwWWJr6uMm2ABzhV6Z9ShLv3l6jqPMAdTIjfAUYue/bEOa0uE7gsYuHl8kmY/jaGds=
Subject: Re: IRQ latency measurements in hypervisor
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Julien Grall <jgrall@amazon.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>, Dario Faggioli <dario.faggioli@suse.com>
References: <87pn294szv.fsf@epam.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <b42ec58b-aa78-f781-f90e-b2f89a5ff832@citrix.com>
Date: Sat, 16 Jan 2021 14:40:13 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <87pn294szv.fsf@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P123CA0002.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::14) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad4a1cd1-4f37-46e8-046f-08d8ba2ca540
X-MS-TrafficTypeDiagnostic: BYAPR03MB4535:
X-Microsoft-Antispam-PRVS: <BYAPR03MB453576F7015DA0BEA58A3B0BBAA60@BYAPR03MB4535.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Lb1S5yMEp4A95ZNKMKeQSe4HX4XEZQMeLnE/AmxuD4gIrC6i7Q+qIrel2I60EECzyZ4Zy23c2tulQRakI4Ddmb8NOPzRyDhFsQ5B7zI9oknU8VvxCoNDvihjVWECaaD9t0FxMoTEkljbrMOhvLFIUnWDBv4UGp6v7DCW4PN3QrKDaOf3fhRUFl5AyDTuBNiznOI1qnVu5YR24M2poBffMBMWtaYQFTJgbJQRx/fAmMz8L7YmgwhFEhQlWkXoQYq4XZaAOhmSUnMyOEjiAYuxz6RgzsYCkLxlSPJfvEvxDy748nnoEryIHoSFCfsrnE2vR9vKr7vqeqyrQGAIf06uSCVhIKZNICmx7XvG/TfCYOrfLPRW9lzcncJ8BasIEQxiXczurmXlOQA2DH9tAe0A5ggrJlv+gN3FKtdBacjirKoInD1LlMKE5NNJ2YMyoYbxDwqegVcpdYvs78ERXM3o6JcoiYMS5W2KI2XeBO62Lb8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(366004)(39860400002)(376002)(396003)(66556008)(66476007)(26005)(83380400001)(478600001)(86362001)(31696002)(8676002)(53546011)(4326008)(6666004)(16526019)(66946007)(186003)(2616005)(956004)(36756003)(2906002)(316002)(8936002)(5660300002)(16576012)(54906003)(110136005)(6486002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UU9BWEROK3N2QjBDcGNZWndtWnhrUzdTc1BHb0RjeHV6Q3pSay9sbjBHbDV2?=
 =?utf-8?B?S0lBM1dJWFRGZ3pRenltVFVuSiszdHJ2bWJadkxPbjFYdXc0TnRodVo0NGZL?=
 =?utf-8?B?NElxb3dHNmlWOWUwZkhoaTVTWmpRbGhxQkdvZjBwRHQzL3hIUzF0Vk5uME9i?=
 =?utf-8?B?R29aZlgwblE5THE3eGdaYm9uUXJHT2dZeFJmRHhBWEFmQWpCSmk4QWh3a3Iw?=
 =?utf-8?B?KzdGNlZiZ1Z1Tk16RUw4VmtFRHVaaDcrVUI3MlRyYkNveEJDUHJmaFZKZEZp?=
 =?utf-8?B?QjJqcE5sM1k1ZmpoQ3k4M3I5d0pUcUYzNEdzSExUWlR5eU5jQ01xNHVxRDBK?=
 =?utf-8?B?YkdKYXJDeWVVeE15UkJIMEY0T1B1WjgyYWJnRjRWM0pGY20vUTBTZ1NQWU5k?=
 =?utf-8?B?NjI4cklhWDNFYTBRMkxQOTFQMjBheC91Zis4OGRMTkpQajYvOEhtUWxOSUQ4?=
 =?utf-8?B?WGJoMytDR2kyMUJBMTFiWTRFVlA1TmRFVElyZm5XR0czQ3VYdDRYQ0lhVUNO?=
 =?utf-8?B?QVUvbk40UzZ0Tm1sR1lTbFRNQkJJZzdSZEZKK0lNN0VvbUZzUlFqWDA4Uy9k?=
 =?utf-8?B?ckl6akhSak1UZXdUQTVrbm9od3VTL0FPSWZia0RxU0ZNNjg3UWN2cmJCVnBF?=
 =?utf-8?B?MDVydEt4bVdIUUp2V1FFUUtrRTVwMjI5bjROVW9zNUpoN21ZRjJDQ0hEcTRD?=
 =?utf-8?B?ZE9YMzZsQjRQVmNwSCtCVVc0ekowbjFvWlljcWhLdUhqdUNsNThlUFJBZ0JI?=
 =?utf-8?B?djRidExpdlc4QlMrSXJHYUl6WnJpZmxYTWd0S1dNQm5seldObTZhUitUT3l0?=
 =?utf-8?B?aEdhUkpIMjlpVkd5SWU3dmV1cStVVkl6dVRCOENBUGxIUzlTYnRXM0VNNC9w?=
 =?utf-8?B?OEhjRlFyUXFsblV2UEROeVRVZmNsbzZwR0IxTGVZZEFOUDIwcm1wb2pWS0tS?=
 =?utf-8?B?NXZESG9CK0s0ZWtmb3ZYZmFlQzF0anN5ZTR4TlZJNm9xMitPZ3REb2kySGtK?=
 =?utf-8?B?UUYrcnRFZEdjMmZFMnU0R0JucTF0dFVkVnJNclptSkpLVi9uTlBBUkdJNGdE?=
 =?utf-8?B?NUF4UjdIUGtBY0puYnRQa2ZvbCsxbmJFRFRncmo2bFI3TDB6NEprWGF2MUps?=
 =?utf-8?B?Z1NTOERNSzkrekUwUjRmR1VGaWtFbGtnamtlRnRyVm0yRkFVa201bnVvT1ha?=
 =?utf-8?B?L0JpS2FEdGZ5YnRyWkUrZmZlUUwvNFJzTWZ1c25kSHduT0FleXB4TXczbUJl?=
 =?utf-8?B?VW03ZElINEYvVzEvdWdLVlVWNFJreXZnVDNpRTNrZzlUcHpTWWZTSW9OZmZa?=
 =?utf-8?Q?x5Y4fH4yWHfg7Dj4YSFzSHAikOztb/XTaG?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ad4a1cd1-4f37-46e8-046f-08d8ba2ca540
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2021 14:40:18.8997
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 66kPdY0qqU6M1W8uoALWwVA6u0oUj+YxkUzOMvRJ1xtS2+SFESk9mdKRF2/YsAGNpbnKLcSu+iOkHqdiMZlddKvmX285zQZyn908B/TH+ig=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4535
X-OriginatorOrg: citrix.com

On 12/01/2021 23:48, Volodymyr Babchuk wrote:
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
>
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
>
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
>
>
> IMPORTANT! All subsequent tests was conducted with only 1 CPU core
> enabled. My goal was to ensure that system can timely react to an
> external interrupt even under load.
>
>
> Test results and latency sources
>
> As you can see, baremetal OS provides latency of ~0.9us without any
> deviations. The same code running as DomU on idle system shows mean
> latency of 12us and deviation of about 10us. Range of latencies in a
> 10s batch can vary from 8us to 25us. This fits into required 30us
> threshold, so no big issue there.

This is all very interesting work - thankyou for sharing.

However, there is one set of measurements which I think are missing, and
are needed to describe the full picture.

You've got measurements for a native kernel taking interrupts, with
excellent results for Zephyr, and good results for Linux.

You've also got measurements for putting Xen into the mix, and the
results could do with some work.

Adding Xen totally changes the structure of the system.  Conceptually
(if the Xen model were expressed as native), what you've got now is a
single piece of userspace (pid1, no fork()ing), which is single threaded
(but doing its own private task switching between "thread"), where some
threads are making blocking system calls (all Xen hypercalls are fully
synchronous) while other threads are measuring the latency for a signal
to hit.

I think it would be incredibly valuable to mock something like that up
as a 3rd set of measurements, because it allows for a fairer comparison
of the rough structure of a virtualised system, with and without Xen
being involved.


It would also be very valuable to see where the latency is in the
system.  Would it be possible to set up a shared page, and have the
various moving parts write the counter value they see into it, so the
final stats can do a breakdown?

You probably want counter samples from:
1) When Xen has positively identified this single interrupt
2) When the interrupt has been marked pending for the guest
3) When the guest kernel has positively identified this single interrupt
4) When the interrupt handler has run (this is the datapoint you've got,
AFAICT).

Maybe for point 2, you also want some metadata as to what context was
interrupted (EL0..2).

You ought to see reasonably consistent results when interrupting EL0,
because that should transition immediately to EL1.  For interrupting
EL1, you'll perhaps see variation depending on whether other higher
priority are being serviced.

For interrupting EL2, this is where I'd expect you to see all the
problems with hypercalls, or potentially other work Xen is doing. 
Fundamentally, Xen can't just drop what it's doing and resume guest
context for the interrupt to be delivered.

We get around this with the hypercall continuation mechanism, which is
conceptually similar to voluntary preemption (we periodically check to
see if we should stop doing what we're doing, unwind state safely, and
get back out into guest context).

However, even using hypercall continuations, there will be a minimum
unit of work, necessary to guarantee forward progress, which cannot be
subdivided further.  There is also a cost to having finer grain
continuation checks, but hopefully that is confined to the error margins.


Alternatively, if we still have problems, something to consider might be
the task domain concept which has been discussed before.  This was an
idea to try and bring something more like normal tasks to Xen, by having
a hypervisor context that the control domain could queue work with,
who's running wouldn't be a synchronous hypercall from from the guest's
perspective.

Such a task domain would require a mechanism to ensure it got scheduled
with a high enough priority not to get starved, and would probably
benefit if we restructured Xen to have fewer irq-off areas (which would
be a great thing irrespective - the scheduler lock in particular needs
to become irqs-off).  In other words, the task domain concept is a lot
of work to do, with only a general hope of it resulting in an
improvement - it shouldn't be jumped upon until lightly to solve perf
problems.

~Andrew

