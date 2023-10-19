Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC087CF07C
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 08:54:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618910.963213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtMv3-0001ej-2E; Thu, 19 Oct 2023 06:54:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618910.963213; Thu, 19 Oct 2023 06:54:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtMv2-0001bw-VF; Thu, 19 Oct 2023 06:54:08 +0000
Received: by outflank-mailman (input) for mailman id 618910;
 Thu, 19 Oct 2023 06:54:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g4nO=GB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qtMv2-0001bq-BG
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 06:54:08 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20610.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4bba2d38-6e4c-11ee-9b0e-b553b5be7939;
 Thu, 19 Oct 2023 08:54:06 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS1PR04MB9405.eurprd04.prod.outlook.com (2603:10a6:20b:4db::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Thu, 19 Oct
 2023 06:54:04 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 06:54:04 +0000
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
X-Inumbo-ID: 4bba2d38-6e4c-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RL1KCdA4yS9vgJcgFcxUTdmcABKKnZGFw3P50iXdAekmQA0Jut5QGa1fC3OYoE40I1Cg5tpwEKIUlncE32BzfPXdHUmWvvV4ehsQ5gQ+DIUgaQd5hx5oAoOBMTUiPYNEMcwrFZNWsCeqVO6+698WImctzgoz/5SV+LcNcTqVxKMuyaRTiWcqDMcZOHIkViP2CRWoUz+XSEBMA2sm3ZUrsyQAPNwx66Nk3ssKUd0hHrn4q9MQ4x/X1G1FKZf0TQSoE+br4NjLRzR32qATQ8VLCstbP8NgY8ZLSnqEsfHKeJs571fjL4VevbZeod9OVMgle7Q4Md1/TFCHGl2CxzDUPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a8NhRa60bkS4jIzHQs9OrZ7ps371BjrXqvSA4SO6bPc=;
 b=Q/b0IFHScvzAqGOgCPGuxQADh/ORnhUkymtJATgXNcFWs2OLh4CVHyBkErta5NOklvekqvBSAExV/5t1mJ7GXA1F88Mssn2bcYfRKcof+PtLXPFl6UpZVYqv0kw433YFjPF7cJH718ravT5EIFnJsr7h4ppcHxghRt75M4U+3FTEWt/WWduOKD2elLg9cSJ5ZwLsG+v2eeAwLIqNAaqN1OzIIpUIWoET8feWPZN4LIXhAtzG3nWH5DfdoFZGxf9mG5xXNPHr7YVxphOnJJJVCOZqviNgUA6t8y8y1IPY/Ms1uW9OVyfqF49jcoUbowpA9H45xuinRsdiCHPOm9HI2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a8NhRa60bkS4jIzHQs9OrZ7ps371BjrXqvSA4SO6bPc=;
 b=Ed7iZY554zFu2ihI4+h47YP0pb+ncUMDKeTp7f/+NtYnNTzIC4ZGRiW4pxCzrHeiAEufI3DwuVmkmzNEnoTKJ57vF4frZn8jYhwYHGVcKi2b1yJgqVssYXpzsGWxUxBeV69PDjMy1nr4m9m/9R0y4osATl1gH229StnM2s1C7udRtpShVMtLwDrxTQAnQQHb22QHG2sjzrxz5flvdzGs0Duaq+UMx7IvB/T70M2Y84M8S0eS0trU6phonpBWDFIppCB1zSekyhqurG8QnkQMFuB1KTkCKdgifbYP9nPBVKxNzCppc4NP+9VW7rgLQDyL2s+vkxxpiC5LgJVF4YAdTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <30e35f13-d2d0-eaf3-9660-c508655b84ce@suse.com>
Date: Thu, 19 Oct 2023 08:54:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH v3] xen/mm: address violations of MISRA C:2012 Rules
 8.2 and 8.3
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Federico Serafini <federico.serafini@bugseng.com>,
 consulting@bugseng.com, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Henry Wang <henry.wang@arm.com>, xen-devel@lists.xenproject.org
References: <eedcfeb8d1c81527b7e18fcc0eca252577f00035.1696344012.git.federico.serafini@bugseng.com>
 <d7cd7a02-b960-384e-4af2-f70b425e5ad1@suse.com>
 <alpine.DEB.2.22.394.2310181543030.965337@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2310181543030.965337@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0067.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS1PR04MB9405:EE_
X-MS-Office365-Filtering-Correlation-Id: 42e9b4f9-a1d7-4048-9088-08dbd0702efd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8tZKVrlDSIA682/grnu2HXpiUrshAOTBSQrNutvtYIq/lfb7J8+yUs6Eu7OuGYDvl0v0Cg15hQtX/IFvBqfF8hMibdkvgh85y0KiF+0lxaXfXHyed3/3IRHLLPjs9RYJ/m4A9Wbxc9pdnmPIbLZFW0kYXGPeSjAj1C/lFnL5kscovRcwAoc8j0BaknzUlqQSJuJGxvZoltofvbS1PfB1qHcyPQdfva3R/O2eJYjmThhQ7ks/rrocksg3tu6rgBSv9O6IcJ50EcAFVVR/K7pJWQ/Cl1kB2bxm+p9rGK5jW1bXmWTtlVqs6bur+rRprptwOVXDzH2HlXQOC5FFDaPnB+SpeQRs06nguvjohcOwcW9MoIy3qNswHqzXHB0bpMchUUXrm2ElpICpK/5J+RepDTqus2cuoV0lILwE71L+1F0t3ipvIWO+U7apToXuj4aKKfESFP7ArPyZmMIeIflRNbbKl4Tgd1oP83EO6nhGC9hLAaf9Y9Ktee8noKVcJBUkQcZP4TFiudl8Vl04QgsJIIuHnQWETuAShSqUGWAKfIz2NBYJKbw8Bhb79QjFKeFtML9c8ttimO2EWc7m/8aSZnmKR1H7IBC1KpY4nR2G50BX0omxLc47iwm4Be8VcvoZE0oVGGGni27I3uJ3gCYvDw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(376002)(346002)(366004)(39860400002)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(6506007)(86362001)(31696002)(478600001)(26005)(6486002)(53546011)(2616005)(6512007)(8676002)(8936002)(4326008)(5660300002)(2906002)(7416002)(6916009)(66476007)(316002)(41300700001)(36756003)(54906003)(83380400001)(66556008)(66946007)(38100700002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0hobUJ6VGpHZ1M0VDVLNGNaamtvR0xOZytYdnM2dHNaUjhkRUt2RTBPSFY4?=
 =?utf-8?B?c2w0TWJQRzg3NGQ3RWFsRGJ3ZUNnVlNRQVdVa0NFdkJXSFA3d0RHeDJKUGla?=
 =?utf-8?B?SUNYMjUxcXV4SGhNMU8wcjkySXpaWnA0N3pOMElTdEcyUkI2TFh6UXBIQnl6?=
 =?utf-8?B?blVzTlpVNXF4dWw0VDVBK29Td1dMazFIbklZTnAwWkplY3NtbFdtNmhwcVBY?=
 =?utf-8?B?S1BhQ25xU0M2blpIdWg1RnBsU3gvbTNqdnQ0MVhSUmkxRHVsY3NmTTJPNk01?=
 =?utf-8?B?akloV2x2UlRkbGVxMUtDb3dLd1ErVS9pRG1aU0l0NStadHpiaGI3dzFURTR4?=
 =?utf-8?B?RmFlNGMzSjBLY05FSmw0ZDFHMVhxZFpPZmxVYmdCbWd1WVc3NG9vS2w0aDJR?=
 =?utf-8?B?TmFVK1ZZdE94OHp1K1ZJbFJYL2Jvc2d6Qnpoc1pGTHdQb2k5Ull4Y080Y21P?=
 =?utf-8?B?RGNWN1pFM1g4bDYwRmRUK0ZUZUQrck4vOGpQQ0ZuRERjZS83T3RHRGxvM1dG?=
 =?utf-8?B?ejJvZG04TmYyMHZCa3RMN1QwZng1QUdWUE5pR0VMYWh2OHV2cXhSM3dtYVhm?=
 =?utf-8?B?bzd5eUhxNWJZUDVmL1lLZE4rN2VpeXQyTXFqZWp5dFdqeVJKQVNjclI0RXFn?=
 =?utf-8?B?UFoxQ0duUnRYR2ZCUFI1U3RsMzJaRW4rb2tGcCsyOEsvV2NIU1Q3NTh1ckht?=
 =?utf-8?B?RitqbXpBQ1RHUUhrOXlBdjBJWnh3d3Z3eUE5TXB4VjVybUZBUkQvOG80TUY1?=
 =?utf-8?B?WTQwZ0x2b2hNVjFFMk1yQ25NckI0dU5hRUEyWWdDTU5Zc0VrQUxXcDJ0Zk00?=
 =?utf-8?B?d3N0WGE4S2tYbUNXMnB1RXAwcVB4MUF1YXRLWUg0R1lqSUlQSkQ2d2d3UVN5?=
 =?utf-8?B?OHp0UXpkR2o2R25lU0Y1bUx2Y0RZTVpwVisyVC9RekdEWDVnTzlac1lFeUJF?=
 =?utf-8?B?dnU4cW9ZUGJBdGhNaWtCc2JmT0V5Tk1nWTlPUlBSYVphTWY1RUhxOG4wVXBY?=
 =?utf-8?B?U1lmdzA4Sk5PNExsYmQzT1BYaGdCYUNpTkF4K2tKZ2ozSHdJY3hVM2ZCcFhQ?=
 =?utf-8?B?MllZeitja01hdEVDRmNPZUlRWEx5MTkyZnlXQXM2YnN3YnhQUnpKR2RIQkFv?=
 =?utf-8?B?dDQ2eXlHc3ZhNTAxRjRrVU1KMTgzeHhVLzFiZUc5dzBhTUNyb0owaUNYMnBP?=
 =?utf-8?B?QUttakM0bi9ONE5mRGJFWGJoWEhOMzlzMktndms2QUE1ZUVoU1dLc09oS2wv?=
 =?utf-8?B?R3ZqZERoaWRSN1RFZDJzQXFwaGxWVmtmNWd1U0daWC9NVFlodFJyVGNTVkww?=
 =?utf-8?B?UEpNL0Y3RHR1Rno4dm01VFI5dDV0K0Q5RGlDOEJsbk5JUmhSVFROd090aE1v?=
 =?utf-8?B?TTJIa05majFmSmhkbGdSZG96MUVvRzg1NVNMY00zNisxTmFsK1luZlFCS25q?=
 =?utf-8?B?NVBmQVpxLzVoeG9LVVVxeEZ2UVkyczYrcDJ2VTZNNmt3UCtQcG1jU1BudjUv?=
 =?utf-8?B?WEh4UkZYaS95ZkpNWndpSFZZeWowUkhCd1dEN3RYN2ZsS2lJdVdhNUFYRlZC?=
 =?utf-8?B?T1I3ZDdPSkgyUFVaU3ZobUtKaS85Y0xFR2k3bURxcmxEZ2xnS2hGcXhtU05L?=
 =?utf-8?B?WHd6czdaNlN1amdBeU5FemZwOWxtYlp3UWFOYzQ0SGF6WHhubkRrYWpza0NP?=
 =?utf-8?B?VGs4TWtSTlNCZ3JqVWFnVWdKUmo1R3dsWW1vK24rQ0IrcmNVYllPTUJ5eFpB?=
 =?utf-8?B?TVhzVXBEWWF1NjZmNjM0OEN4ZEFua0RTdXhYTEMyZVJmTiswSnZndXFSVyts?=
 =?utf-8?B?K1lmSHYvTHBYYi96VmdjNk5XTWljK0hXTmd4MWNMclN1RFNvMkxDM290VUht?=
 =?utf-8?B?bEJUSEE1UFUwVnV3djBMUWMydHE2YVFjVjZSSVB5dUpXZWVVQ0RUai8yL2p4?=
 =?utf-8?B?QW9nRE1rVzErWEViSmk3MDdCLzF6WU1rSU1XVGI4QXpGQVd4VGNJSU9wQ2tZ?=
 =?utf-8?B?enlxTnMwK3k1L3BYNGp3QXQvQml1ZzQxVTJKdjVmYkhreUNTd1NLQkQ0N0lN?=
 =?utf-8?B?eEJ4eFhTUUNTaUloa0ZOd0M4ZE0zNjR2cXBHWVdzU0RvQVpLYXVCd1ZYSmxz?=
 =?utf-8?Q?awLV/E59zSWukHWRw+rTxw5Cz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42e9b4f9-a1d7-4048-9088-08dbd0702efd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 06:54:04.7416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2YpnjLGp9Uam7C5P6m6a9CYJpXlHDdyZP8FgScuYwBIqZ7WNFfN0S+YgwL/aE1zPF6SiTvzY/SwQEafYKtx/nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9405

On 19.10.2023 00:43, Stefano Stabellini wrote:
> On Mon, 16 Oct 2023, Jan Beulich wrote:
>> On 03.10.2023 17:24, Federico Serafini wrote:
>>> --- a/xen/arch/x86/mm.c
>>> +++ b/xen/arch/x86/mm.c
>>> @@ -5901,17 +5901,17 @@ int destroy_xen_mappings(unsigned long s, unsigned long e)
>>>   * a problem.
>>>   */
>>>  void init_or_livepatch modify_xen_mappings_lite(
>>> -    unsigned long s, unsigned long e, unsigned int _nf)
>>> +    unsigned long s, unsigned long e, unsigned int nf)
>>>  {
>>> -    unsigned long v = s, fm, nf;
>>> +    unsigned long v = s, fm, flags;
>>
>> While it looks correct, I consider this an unacceptably dangerous
>> change: What if by the time this is to be committed some new use of
>> the local "nf" appears, without resulting in fuzz while applying the
>> patch? Imo this needs doing in two steps: First nf -> flags, then
>> _nf -> nf.
> 
> Wouldn't it be sufficient for the committer to pay special attention
> when committing this patch? We are in code freeze anyway, the rate of
> changes affecting staging is low.

Any kind of risk excludes a patch from being a 4.18 candidate, imo.
That was the case in early RCs already, and is even more so now. Paying
special attention is generally a possibility, yet may I remind you that
committing in general is intended to be a purely mechanical operation?

Jan

