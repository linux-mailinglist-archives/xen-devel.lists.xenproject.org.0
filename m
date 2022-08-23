Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F96E59D491
	for <lists+xen-devel@lfdr.de>; Tue, 23 Aug 2022 10:29:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391761.629710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQPHd-0004fO-RV; Tue, 23 Aug 2022 08:29:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391761.629710; Tue, 23 Aug 2022 08:29:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQPHd-0004cj-OI; Tue, 23 Aug 2022 08:29:13 +0000
Received: by outflank-mailman (input) for mailman id 391761;
 Tue, 23 Aug 2022 08:29:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TRIX=Y3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oQPHc-0004cK-0B
 for xen-devel@lists.xenproject.org; Tue, 23 Aug 2022 08:29:12 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062.outbound.protection.outlook.com [40.107.21.62])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a95f5115-22bd-11ed-9250-1f966e50362f;
 Tue, 23 Aug 2022 10:29:10 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9517.eurprd04.prod.outlook.com (2603:10a6:102:229::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Tue, 23 Aug
 2022 08:29:08 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5546.024; Tue, 23 Aug 2022
 08:29:08 +0000
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
X-Inumbo-ID: a95f5115-22bd-11ed-9250-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dy2Nxrij1qCysWJti5HM3QkciekIh0/obWk2LgfUvwRK+/FEcauEbl3cSYLLfshyiRny98ob6QOFiuOW0/v1YhJS5sTWAPFkT3L0KmHZy7vv5B6VWkJRoetUSqJBAcQbTWgOqaBDX+PB8kKWPbnY/0ZPH5DBi+GWvaAxvbR2hdSbOEycR6meLfUoKvcl9SXhU/pzDggzpdji1nsaeoHu5dKBiAbXVKkZNzlQeWBLGjskKRPzvtRh3amMC5k/PwR+qpOTw1kmVgESi1K9p7bD21XSps9k29e3opsaEEr9TpPZal+63CTHqdFM5pAT9UclOpCDGuMA6y5m3U6o2iQlOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fV/AMztGcI3Kt30otJGmkIe11yMCQPqDFKTbdiuNXzg=;
 b=A9K0dp56tNV8ggLK87UbjeFILZ2wCRb6Pbu94evORyzJxOWNPfmIgH64N4eq4PCTKyxxz4IYbHPM+TeSwrC8gwUleBkF5Lr8gE0CI4fv/mmpJG8sygC5QCdzZPFZNpdH8N1wvNV583eW6E1F8/xI3HDcXGBPE6j6It62Vbqt06ucGHbJ+dy7XDmN92V4s7s0E/lLddjsjY0YPArmvY1+kviYht21dGegYI3kW/YPGTCzEsLqngj9xKOBtBaXAo+2ukizUWxNQ/vZR9v9JhDlWs8iRa4pWiJfrATYPv2+p9mw90cLjFK5MZmzHUGQ0gDs4Qq7x0PHyutzOdBMLGcGsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fV/AMztGcI3Kt30otJGmkIe11yMCQPqDFKTbdiuNXzg=;
 b=rwfFBFbNojI9Ro3xrqm63txKZiU4pi2pjkszb7JUUVEp0SHi84yMn6A2j/9sKnSI0bIVk+ky2AFEziMHQHePmvs/E3BYQ8cSLuV5DRXUPIZa1oyrlBRotVmLKZ5yrQ9UrUQd8zsAmnLI+C6m2a9jKd0hZfQ3aOx9UFEuilLSL59P5At2hVmvt009nCLnpTC4RFtS/MTcwTTwTRZ2K0lrYducyj5qDA2A7KkRoTirvEXSNKdlwO5vc6BbQdes1f2naaL1AUlJrED2lXwTxGbNY1qkbq1sPZR0rSysJbp8FrxdWvXelwQ404FYzbJaISSHjWD+aCdObA0daB2N/vqFKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f8a3f7d6-1db9-cc74-5d60-8a0e22b80a3d@suse.com>
Date: Tue, 23 Aug 2022 10:29:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 3/7] xen/evtchn: restrict the maximum number of evtchn
 supported for domUs
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Rahul Singh <rahul.singh@arm.com>
Cc: bertrand.marquis@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1660902588.git.rahul.singh@arm.com>
 <1a8c49dcc237187cbb9fccaafe1e6533fe68381c.1660902588.git.rahul.singh@arm.com>
 <71c651a6-e8ad-78fc-efe5-2f20c332530a@suse.com>
 <96618b21-7cb5-d160-75b3-953ccdc75ac5@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <96618b21-7cb5-d160-75b3-953ccdc75ac5@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0139.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 65cebb20-3bb4-4d95-8e43-08da84e18c36
X-MS-TrafficTypeDiagnostic: PAXPR04MB9517:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8dFj4HBRrHNtEEvx1XC5uGnOb1BcIBbfGOnshNrJUQjs0H/5vEeoF+tSysQ7qIIiIEpcnm2wFB9jSJTDYFpzmG4VQIN3483R+4yGZVD6d+2zkGw+LTNiu12/vs+yuwyaU6QGQw1ajauZ57KFzL3uwdOjp2YO0D7wEscV0zVR2+jgKSijeQuDjKYncWH0DWvOuQfI5TOKEgOzAtZ5J+YPr5SbbhGGu7Phu+/35oriXp18JWsntgWgsIJrE2JF3ShpyLE0/4A0PNvfi/hO9HAs2bN0DkDwLaagKasEhduJk5JPFPxjw4+cSAOSPMKhPhDH1E/CPRqrQETh/0WMtZqM+CBhz7tronXnn3Lfi8g7NBibRq31AkDrp5i+io90wRy2Hu4LeYNooq74N8u2MTbD2JRl+OJ4wQt9C3p6LsWxmKMqXYCHWGtlBzZKCVI7xjJvOf3vf4NeZS4bA0DMjzq+6cngZD/X6U9oX+X/arxs5LnfhPoA2XpK3/33ClBwcIAxAMfrPKG1dXbNRP3ViFf/7cMQOPE6wUcQqt64Xj9JmXc08hmXgGGnleHyDRGOq1zrJO2/Dr9fMv7aBLI5TqfdolG5nPGE06B2EXGRohtMGqvOGgMgtPXa0AfBaUqmc4DfeQMvt3GVtxDy8acxvkv81/u8Uf0BycSZDHE5pDjfuqrYkt1+kQ/dnLaoImA/TCw4TP1nDa5qELSlY8XF4kUARQSd6SbKBECPoYmXl7Ji63Vz9XUoGlBC5BeAgXdjZQ37NMUfFxLctMyj6lI5tUYDNM+yZud8f3y4GNboL5wWCQM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(39860400002)(376002)(366004)(396003)(346002)(478600001)(6506007)(53546011)(2906002)(86362001)(31696002)(36756003)(6512007)(26005)(31686004)(41300700001)(2616005)(6486002)(186003)(316002)(66946007)(38100700002)(110136005)(8676002)(66476007)(4326008)(54906003)(66556008)(5660300002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEVOMU5wanFVM3dwMDNjM295RXlXekZlai85M2luVjNSeVYxaW9KNWpKSDNV?=
 =?utf-8?B?THZFZXhzSEZqMVBtdkJRTGV0MFp3bEwrWFhYZEJrSUd1OEZKZFZyT1diTml3?=
 =?utf-8?B?OFdQQmJPbVRSWWxyUUFoYVA5UnhqaEZDUUh2ejdHUkhMSmhEVEFONFdoaXFX?=
 =?utf-8?B?MnZHUElMWWNuZkkrSFhyR2dnUUFqbUVQN09CVFRNc3JHUzFqdktPdHBTbWp6?=
 =?utf-8?B?Wm1YMHR4MUZmN08yWkl2OGdCRFdaVjdHRGtMMTNGOWZHVVJSd291bGlvWllR?=
 =?utf-8?B?ek5QQXNkaGRnYjVEWGxveHNNVXdmbXRZSVlsbmI4d3V4VzRuQjZ5L0xRWEQ1?=
 =?utf-8?B?Z1Q1L0l1NEhSZitCU0l2QVRaNk90ejJGb1l4M1J3MzlkSG1ZZ1F2MHBuV3Fp?=
 =?utf-8?B?TW9UYW8vdmk2ZVNwUkN6MUdJMTBhMW1CVFA4RGM0Qk10VFpLUnpCeGhrYU1r?=
 =?utf-8?B?b0ZjcS95UXhFc1JJanZoNW0zK0xIN2JhTWNJNndhVzQ5QXdPTUl0bmF6cThj?=
 =?utf-8?B?VGp6dEdqOUR2dTU5NEhwMmtMU2pvQWYzdFU3Z00zT0VzR1ovd1lONEZ5UWJU?=
 =?utf-8?B?SC92ZlVnWnd5UnRqei80Q245M3ZUUnI0NnFUdjExWFFJUEJzajlzVktuNVQ4?=
 =?utf-8?B?TlJ2bWNqVStNRHhNTE1mL0llRnJuQ21ob1JuWWdXYkkxbTBzMTBkZEJUcGpF?=
 =?utf-8?B?YWRjRjVjaUJrN3pUMjF5NU1nOUVkRVh0ZVljRUVrRVVkS01GaDZJbGpmcEVN?=
 =?utf-8?B?b3RlaHZldjBJUjhLQnFMdXpzUTlGNzdFQU5rR0hMUEdLQWhZTGIwM09qb29T?=
 =?utf-8?B?L3pKRkpzUUVDdjhCTXNrWmJ6WEtLMVhTRFViWk9neVZUQ1FEZDY5bXdqR0I3?=
 =?utf-8?B?K3QydmhSWHdQTHJEM0pKYVlmemY4K2szcTlEVEVyS21SaVpibTRtZVNNZ04x?=
 =?utf-8?B?VkdIWXJsYUNsb1ZVb3hRTkdFTzBEZWpUY1QzcmhlYlFOckNzUHdWd29CRzJv?=
 =?utf-8?B?N2tETkdWOE9LOTlzLytxSmR1MEJ2Y3JGSzc4d3Q1V2FUc3N0VXU2OVlidGda?=
 =?utf-8?B?dmtrSGJodFRoTDVJZ3A2MGtGZ29SNDJ1SDhYdTBIZjFsY0UrWE1nWXVOcndM?=
 =?utf-8?B?N2lXazdHelFPTVdVS0RDTTZFWWRPNFBpNVcwWjVQOEhDL3ZpUlRmRU9qNFBz?=
 =?utf-8?B?ZEE2MldvRmNWVUVZeTIrRFpqb0NTTTArRXVFSlpYOENnWmRYNnRmRWtscVdT?=
 =?utf-8?B?SmNRSlJCRGVheXZhYVo0L2R1WTR1UTVDejNGdFBvb1hxZjVSc1JKMWNKZGtk?=
 =?utf-8?B?U2lFbjZ2M3JxRTBkYWgreEQ0UFVic1lyb3RiTmRZSWNNcUZTVmdBcHN2bzE3?=
 =?utf-8?B?TmV1azNhOTNBdTl3MFVkdW9hbk9RbkRmR3ZsVE9JNHlSZ1RFSG5WdXg0NUdJ?=
 =?utf-8?B?SFVBY0huQURZdW9qdm91czBDNkZCZWxsSGFpN25YSWhPU0hRa2R2VWRPZUVY?=
 =?utf-8?B?bDNTMEtNWVhEaVIzZW92TFpJQVY4OWNHNE5xaHd6RFNNaXFzcS9zZTlHTXFW?=
 =?utf-8?B?QURON2JIamUrZW0rWDVSbVM2YjlBU3lNbDNFTFBNS08ySG10YVR2U1hzYmdC?=
 =?utf-8?B?dzBTTERVSTZPRWxXbWNhd1NEd1VaKzY5V1lDSitPcDU5YmJVc0hLZzNTSlJl?=
 =?utf-8?B?RnppNlFNOW9zbWZQWldZelhWOUJpOVg1TStTR1hRRC9WNmJRd0JmZ28vTGtl?=
 =?utf-8?B?bnJWUUtwKzRkekJqNTFMU1FhSnQ5N2poaC94VGtLQ01QOW1QckxUeExOdVZn?=
 =?utf-8?B?MzZ3SFZtMmtMR1BpaS9FZXRIUWlUMHlJT0V3T0RPQVhxN2JkaFhabGN2WXFE?=
 =?utf-8?B?ZXlObHVJUlNZb2RIV0gwcnQxdE5URGFnZzdoa2JHUDFQa1hyc2FYMVVwRDFC?=
 =?utf-8?B?QVRXa2JocVF5R1lNRWY5TllzVDdUMG1HUWZVMFJPaytwTUNZMXJUMkdxVVhQ?=
 =?utf-8?B?N0hJTVhKeVpMRTlwbUdFbUt2bEVYZ0Qxc2FYUjBicG1Xei9LNE11b1hLVTYy?=
 =?utf-8?B?QkV3TDBMWER5UkhzQ0FvUjVNSkp6cHduRDlOYTh4RHgxWENhOWsxZjQ2b2FD?=
 =?utf-8?Q?HTkOgTlV9gUOll8xzJd2uBQzr?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65cebb20-3bb4-4d95-8e43-08da84e18c36
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 08:29:08.3271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oETHinaiYa6tnMsXxLyrEkv3MXRt5jBz90+M9RDUycH9yDxhGeuOMoZnAHCqoomS1sv7yllZB+nV0B8nJYidvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9517

On 23.08.2022 09:56, Julien Grall wrote:
> On 22/08/2022 14:49, Jan Beulich wrote:
>> On 19.08.2022 12:02, Rahul Singh wrote:
>>> --- a/xen/arch/arm/domain_build.c
>>> +++ b/xen/arch/arm/domain_build.c
>>> @@ -3277,7 +3277,7 @@ void __init create_domUs(void)
>>>           struct xen_domctl_createdomain d_cfg = {
>>>               .arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE,
>>>               .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
>>> -            .max_evtchn_port = -1,
>>> +            .max_evtchn_port = MAX_EVTCHNS_PORT,
>>>               .max_grant_frames = -1,
>>>               .max_maptrack_frames = -1,
>>>               .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
>>> --- a/xen/include/xen/sched.h
>>> +++ b/xen/include/xen/sched.h
>>> @@ -76,6 +76,9 @@ extern domid_t hardware_domid;
>>>   /* Maximum number of event channels for any ABI. */
>>>   #define MAX_NR_EVTCHNS MAX(EVTCHN_2L_NR_CHANNELS, EVTCHN_FIFO_NR_CHANNELS)
>>>   
>>> +/* Maximum number of event channels supported for domUs. */
>>> +#define MAX_EVTCHNS_PORT 4096
>>
>> I'm afraid the variable name doesn't express its purpose, and the
>> comment also claims wider applicability than is actually the case.
>> It's also not clear whether the constant really needs to live in
>> the already heavily overloaded xen/sched.h.
> 
> IMHO, I think the value would be better hardcoded with an explanation on 
> top how we chose the default value.

Indeed that might be best, at least as long as no 2nd party appears.
What I was actually considering a valid reason for having a constant
in a header was the case of other arches also wanting to support
dom0less, at which point they likely ought to use the same value
without needing to duplicate any commentary or alike.

Jan

