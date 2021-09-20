Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B47134118BA
	for <lists+xen-devel@lfdr.de>; Mon, 20 Sep 2021 17:59:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191009.340859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSLhD-00016d-9Z; Mon, 20 Sep 2021 15:59:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191009.340859; Mon, 20 Sep 2021 15:59:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSLhD-00014N-5p; Mon, 20 Sep 2021 15:59:07 +0000
Received: by outflank-mailman (input) for mailman id 191009;
 Mon, 20 Sep 2021 15:59:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Spoc=OK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mSLhA-00014H-V7
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 15:59:04 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ad0c7200-1a2b-11ec-b878-12813bfff9fa;
 Mon, 20 Sep 2021 15:59:03 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2106.outbound.protection.outlook.com [104.47.17.106])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-11-gjhvfbWHMXKIE8fe8wfIYA-1; Mon, 20 Sep 2021 17:59:01 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7150.eurprd04.prod.outlook.com (2603:10a6:800:12a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Mon, 20 Sep
 2021 15:58:59 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.018; Mon, 20 Sep 2021
 15:58:59 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR1PR01CA0031.eurprd01.prod.exchangelabs.com (2603:10a6:102::44) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.17 via Frontend
 Transport; Mon, 20 Sep 2021 15:58:59 +0000
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
X-Inumbo-ID: ad0c7200-1a2b-11ec-b878-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632153542;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4phuOynMIFldPo8ylpEV+JxDP7Hpa57DkW7ngd4oF7o=;
	b=cvKPptb4PIFDlef3a/VgAw97pl48MMXsf3o3MdMW1momXiVudLf1QJ1qqfuafmJ8TVOgXY
	nncJgbntPMxIaipJ2rcc7AJ+tVonVcIx9Nh9i3LcwCqgr4NgLrd9HsgRoi/F8GPr5aaG/X
	BjrVLT96jJnhSIZxthEmE8phKO/7MiU=
X-MC-Unique: gjhvfbWHMXKIE8fe8wfIYA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YVEh96IOhhIk/uYchMOrfn82XJ4hE0Z6v8NFeUtt6abs8nxbbVQIS2Pdht3AgABenDSJSm7Vctt00Q6Pwd2J15OwVemv6WjOhIcRgjB0HDHWIdjHb2/bHFJ3xj4iNCQHf2mUS5QWqeXRFDFS1kFQ/gdJL0WZiO3aIZ0eAdpLklYJJ3cqC0QD1SbfyvVP151T0qzMwb9daByHKQ1wO9/16s4xxCNwDjAIz2LCAMO3jREx4++I0VdMgjvrREKSq18FVDOzs5QfQO3fgY11XtbF0YB6mdU5wU1tG19icLPAMCTmvGaHHauQ+QLIzyDT87yFKziDDw+uNjz50Oe3AHZUsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=4phuOynMIFldPo8ylpEV+JxDP7Hpa57DkW7ngd4oF7o=;
 b=m2MxQzqc+n/dozAWlCB0tYkd7DT+PF/o3rMrauIjPjGovQOathXV/2si4oVM0k1Ui8nfganqGHb0fUCbp+a4ESLG4fVlxo3nDbx3BnYNLi4Dw1R53VHApj7Ck++iEX/Ip7aQ8JgQJjleF6yHmS1ZGfHOaGVsJMPLb3vX5+EookPy0KXVacAyXCdsZHAwfeaXNF/ClnWGRTpmMvpturPQuDqTYOI54uh84BwQqAgMMc/6vSfFmgtHlarBRjLm+xp071mk6jhu31E4cmeBpLmmQHr0MCiRhA4bYbvi2PL3mhJBTuaZIUF9LOmv/fe/v/94WmlGPEf0Zyj4LnaS1YSszA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [xen-unstable test] 164996: regressions - FAIL
To: Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org
References: <osstest-164996-mainreport@xen.org>
 <d049ba60-db81-aaa4-1769-54c6964cfd06@suse.com>
 <24904.44119.940679.241639@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4b10bf2d-bb14-8333-7ece-bba0b1bb7fdc@suse.com>
Date: Mon, 20 Sep 2021 17:58:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <24904.44119.940679.241639@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1PR01CA0031.eurprd01.prod.exchangelabs.com
 (2603:10a6:102::44) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 606619a3-dc2d-4ba7-ba46-08d97c4f8f33
X-MS-TrafficTypeDiagnostic: VI1PR04MB7150:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7150A892A7B8D6A366BF639CB3A09@VI1PR04MB7150.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	X8Ow0DUmELH/osHxbaBApb//2CixQbwDeqsgP1x926uxjAZO5OYPwNYoGEfLTmv6egn0RTCU8L3DROTdxCrSgo/rCsmUQRiPr8LATl0qQ+4N5cu2zotdqqwfVzp+lUhmTtPtdIF2H1wzc46BD4YOkN00zTKWuQTN/UIWUpC3Z+xcAkoUIY6XAFAnmJUdB/u6vFsNHOtCfgFGq+VaCUBaNUmTSMEZ2RNxARP6LknXZdnyG9p6b+OwV57lDK0xnczLMk1wGHJXmS6Os8eJ3MN3nqJQIjr76219dRag2C+b/GlwqEJUq7Z4jCnLqZImQu2rr0eNssZfCRf3vx3g4jVuvp+HPctjIkgnfXhtHSydZ7FMBc0QjT54KrjOTnQiwUN2Fco8czbWk46qMg6wTvuMGJsVeYVlZYMaSFUhoKzJCou68dNUVIaGVetVjpY1Bk+czTnpEN1E5T8Rc831BKG1tSUTKajgCvRjx0sP03Q+kxY9D4iif1nwDVs5PUY11VsW5j+fSGA6LpuHWt99/yt7rLr+5o8fMQvLEiKWTUTR2yYGhO0hXm7UkUqeD1aO+pcRg1pvB/Jbl2Hj171LzXvM8yvM0XN2+DhOcZH8VZOaIepO18SyXQLwO2PRsT+R5G0Mm/9OI6C8boMHgY0tQpE7MGoZqXSHfzeJ4mc1z006paZQHMRgkYZduQ4IBNYTVlKKc4bcsEZW6hHfUauFKMHn4IQXPZJGoLlOeC7DmYTDb7CMCV0LbF6eZNpUEmyI0JkY3a7BwXlIu3cRPaR1NSk+5IyZe1aIzAnlS/Jm55FbZDq/WEzOZMhlPmtmFFWu8H5egekICdTV682OJ/P66RvWOw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(396003)(346002)(376002)(366004)(39860400002)(316002)(16576012)(31686004)(5660300002)(2906002)(31696002)(4326008)(86362001)(8936002)(36756003)(8676002)(2616005)(83380400001)(53546011)(478600001)(186003)(66556008)(66476007)(6486002)(26005)(66946007)(38100700002)(956004)(966005)(6916009)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MXVBWmgyY0xhMXk4bnhRbVhKM1pzQ2hDVHFRby9Nb2k1OVFFMG5ZUjhDNU5W?=
 =?utf-8?B?THQ4ZXM4OUJsSUQ4UG4zV1EvMFV6cW5TTGIvZ2VXVGhMNlRVQmNGSlhwUlpo?=
 =?utf-8?B?NHcvano0QkYrbHN3ZitDcE4yWmtkcng4eVFzbWU0bnNwT0RQd29hVUw1WFp1?=
 =?utf-8?B?WHMrU1F6WkF1THBnYU9LSjJWZVFsT0J3ZHFWUEE2bDdQaU9RM0lvTVlnMWM5?=
 =?utf-8?B?amNBempPMEVCLzAzZ2VvT1pwYU92Q1hZWEpQSFZnZXMvVGZ2UjQwREE5MWlt?=
 =?utf-8?B?NGx6TUk2RU1HemdRL25KQWt0SDVJcXFobHRDYkVub3BpOTB6NjY3R1BKWG5p?=
 =?utf-8?B?U0NGc0tDTmJTOXJHRHczSC9DRDlMNjF4VlZySlBBdXIzTGdja0tudTRqYnBE?=
 =?utf-8?B?OWcydVlIam54L2dUN1ZkakRiY0RNRFVkYTZObFBIUWVRNXhPaE9KZ0hLZHpM?=
 =?utf-8?B?dHVrejdlMG42V001ZFJHeXpkcmdaQXhicHRZR2prTlVHMEFpNEJWdVJaYlVw?=
 =?utf-8?B?NWNDRXVmV3psZTJKbG9qV2JmajlCWHNsVG5Vd1JVOER6Y0lpR2YzbTdsUG15?=
 =?utf-8?B?eGJDQ1BSeUNjRm5OQWZjdTU5ZXY5KzhMeWx6L0RGZndVNG9Wd2JZUGxqOGtv?=
 =?utf-8?B?UEFNY3BIdjE5Q0N1N2U3dGtnK1o2cXQ2ZEZXemxSRTVzcHF2VDc0YXVJOVFS?=
 =?utf-8?B?aTZDOEUrWGFaaGhtSGRHZy9nZWQzSHZZRzR2ckZmWFZaSlFXWTRqdlNyY3pU?=
 =?utf-8?B?dmlYSTdqQlEybWdyejNkSjJKb1FiOTJ4OWJuSC9YTVllbDZwNXUyUnBZTEVr?=
 =?utf-8?B?akdmNGgrbzZmRy9JUHRyRDFPaDFocEpiVm82K0dzZXN0OHZleGd1aUZkc1NI?=
 =?utf-8?B?S0JhRGZWSjJLdWJKeHRBVk8vVEFEK1A3QkhHa2dQbjh1MVBqWHVBZHlkT2lB?=
 =?utf-8?B?WTBYOGNzVzA4SWxCMjhmNkFyUFA0ZHlFU1ZXcnh0c1FWTlZ4ZytWQTNJY3Nu?=
 =?utf-8?B?ZnQrQnZnb3llK2tHWmd3Ni8zVkVMa1Q0VEh2TzVSa256bFBQTjNxYlMvWVNz?=
 =?utf-8?B?T2VUWmhDTzh3YnlzbFlicmdpaVJFQ0pnTm1KZ2pkQU00WHEzakpwNUU4dCt3?=
 =?utf-8?B?L3F3WVRycVp5L3ZaQlBST04rbmdTUHlXL2xEalBXTXRIQlEvWmZxUFlUOVVV?=
 =?utf-8?B?d1JOOEJmNWNyMDBiSnVvaHVHRnJ4VTl3bjlRbDE4bGZRQ083cWR5Z2tycGFv?=
 =?utf-8?B?Mk9ENXpPcTh2MkRLS1htdmhwVXlFaXpxeGlqdUhGRExDaTRwVVFoMm9nN25l?=
 =?utf-8?B?ZXhxSkthK2xRUmgxTUM4aXpwR2M4Y3pCS2k5OGhMbE5NWWYwUGxZMDlMU3ph?=
 =?utf-8?B?bnI4eFlyY29WYzFRT3Q1cWRjdEtwa0JDTkJSd21MTDltdzY3eUhLUWM4aXdj?=
 =?utf-8?B?QmtHNnVLeXg3bTJTN3ZZcnMveGZGR3JUd2FRRnVEM3lVbTlCUUVwSXd1TTdN?=
 =?utf-8?B?a3VpZDJkMktnMkRSNXJWVkF1REhXVDZpaEhuaWFCNEtHMTFVYXRRbzIwTW8x?=
 =?utf-8?B?bnpCQlpOVmZvTVA1WGV6Zk4xR05BWmFOdHlqelhXL2l5MG5uV0IrMDBSZUtB?=
 =?utf-8?B?a21NV3VpL2YrQVNoekZFZTlJMXhPZlVXVVJQcXg1Uk9zclNjQlEzVUNaRDR6?=
 =?utf-8?B?YUp1TVhvUUwrSWd1MGxJbXg3dlhqRFE1dURFVFVXSXZsSkx2bnFjVXNTQnpz?=
 =?utf-8?Q?JbwnF7nDMbMzvw3AsZ0kZq4C6GG8KAeBv9hU/gv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 606619a3-dc2d-4ba7-ba46-08d97c4f8f33
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2021 15:58:59.7947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cZTOd6Vi26NZarNT0ufMsSJ8jXN+WdmJDFYN+be+v3OtaehGcq2Aneb3ooddxCfn96XeGZR4MctE3MWhBFZxFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7150

On 20.09.2021 17:44, Ian Jackson wrote:
> Jan Beulich writes ("Re: [xen-unstable test] 164996: regressions - FAIL"):
>> As per
>>
>> Sep 15 14:44:55.502598 [ 1613.322585] Mem-Info:
>> Sep 15 14:44:55.502643 [ 1613.324918] active_anon:5639 inactive_anon:15857 isolated_anon:0
>> Sep 15 14:44:55.514480 [ 1613.324918]  active_file:13286 inactive_file:11182 isolated_file:0
>> Sep 15 14:44:55.514545 [ 1613.324918]  unevictable:0 dirty:30 writeback:0 unstable:0
>> Sep 15 14:44:55.526477 [ 1613.324918]  slab_reclaimable:10922 slab_unreclaimable:30234
>> Sep 15 14:44:55.526540 [ 1613.324918]  mapped:11277 shmem:10975 pagetables:401 bounce:0
>> Sep 15 14:44:55.538474 [ 1613.324918]  free:8364 free_pcp:100 free_cma:1650
>>
>> the system doesn't look to really be out of memory; as per
>>
>> Sep 15 14:44:55.598538 [ 1613.419061] DMA32: 2788*4kB (UMEC) 890*8kB (UMEC) 497*16kB (UMEC) 36*32kB (UMC) 1*64kB (C) 1*128kB (C) 9*256kB (C) 7*512kB (C) 0*1024kB 0*2048kB 0*4096kB = 33456kB
>>
>> there even look to be a number of higher order pages available (albeit
>> without digging I can't tell what "(C)" means). Nevertheless order-4
>> allocations aren't really nice.
> 
> The host history suggests this may possibly be related to a qemu update.
> 
> http://logs.test-lab.xenproject.org/osstest/results/host/rochester0.html
> 
>> What I can't see is why this may have started triggering recently. Was
>> the kernel updated in osstest? Is 512Mb of memory perhaps a bit too
>> small for a Dom0 on this system (with 96 CPUs)? Going through the log
>> I haven't been able to find crucial information like how much memory
>> the host has or what the hypervisor command line was.
> 
> Logs from last host examination, including a dmesg:
> 
> http://logs.test-lab.xenproject.org/osstest/results/host/rochester0.examine/
> 
> Re the command line, does Xen not print it ?
> 
> The bootloader output seems garbled in the serial log.
> 
> Anyway, I think Xen is being booted EFI judging by the grub cfg:
> 
> http://logs.test-lab.xenproject.org/osstest/logs/165002/test-arm64-arm64-libvirt-raw/rochester0--grub.cfg.1

Also judging by output seen in the log file.

> which means that it is probaly reading this:
> 
> http://logs.test-lab.xenproject.org/osstest/logs/165002/test-arm64-arm64-libvirt-raw/rochester0--xen.cfg
> 
> which gives this specification of the command line:
> 
>   options=placeholder conswitch=x watchdog noreboot async-show-all console=dtuart dom0_mem=512M,max:512M ucode=scan  

Funny - about half of this look to be x86-only options.

But yes, this confirms my suspicion on this Dom0 getting limited to
512M of RAM.

> The grub cfg has this:
> 
>  multiboot /xen placeholder conswitch=x watchdog noreboot async-show-all console=dtuart dom0_mem=512M,max:512M ucode=scan  ${xen_rm_opts}
> 
> It's not clear to me whether xen_rm_opts is "" or "no-real-mode edd=off".

Which wouldn't matter - the two options are x86-only again, and hence
would (if anything) trigger log messages about unknown options. Such
log messages would be seen in the ring buffer only though, not on the
serial console (for getting issued too early).

Jan


