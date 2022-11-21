Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 275B2632A2B
	for <lists+xen-devel@lfdr.de>; Mon, 21 Nov 2022 18:01:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.446815.702637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxAAR-0001gt-Sp; Mon, 21 Nov 2022 17:01:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 446815.702637; Mon, 21 Nov 2022 17:01:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxAAR-0001dT-Pg; Mon, 21 Nov 2022 17:01:11 +0000
Received: by outflank-mailman (input) for mailman id 446815;
 Mon, 21 Nov 2022 17:01:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8l2o=3V=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oxAAQ-0001d6-F2
 for xen-devel@lists.xenproject.org; Mon, 21 Nov 2022 17:01:10 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2062d.outbound.protection.outlook.com
 [2a01:111:f400:fe16::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 15df6b23-69be-11ed-8fd2-01056ac49cbb;
 Mon, 21 Nov 2022 18:01:07 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7784.eurprd04.prod.outlook.com (2603:10a6:20b:2ae::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Mon, 21 Nov
 2022 17:01:02 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5834.011; Mon, 21 Nov 2022
 17:01:02 +0000
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
X-Inumbo-ID: 15df6b23-69be-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UJk4AIyHxR26fJZBzOHWniB6uujp6lBb6HMzCvZq9fTyvcTp+FZ6UIEuSyuWK8IljdS0WAbLIHxlAW9b25Hl5QyF7DDOJUiqESGW3nIGLumkP8HFxS9SoeGrY0nCBwYM+Rdk48KFIvCg7VlmbjUpGUHsb98S19/P5eFdjC/kyrFx6knuF/wQI54QWbOrG+6zwUuOpfsxobtwSaNdJNbZgdmCx19/rXmle6LnasvgLt+CSPvix5DsEdQrkkCyFBUsEBqRv10scBJqQ2nvr18guMikNzNzcJ93Ad4NoCJlLeTOFb2yDWaCcl8kjI/2Piaatk6U6RvnLl/T3bFfA0D2ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EwSaJ69VqtlHaXJZo53ZeJUMPXoNBAWFGcHJKcXt8nc=;
 b=LuGUVoNA3OugqNrgZ1rrus9bMLIKsGbPhTEgFot+HTvbxLNI+CuQJTBg3vAkM2u7B+RLM8vz1K5OU6BoyJuF7+JqEtiCRoPoIr5wFWmOnV2QDuDOcVtccly942fKJGdS4pr96TFnCoSqqcGp7lyI84qHvrTegoHvmds/gnXianolZUrca5ARm8ASf1381Q8faXTLqTOdTFjyfTRFeNtzy4Ig5ITC3U3fQOtftbAsFDVISwij/+yEZlgaMnoonUbzwcMPnrFKLyitXaoSV/Cqr55MTgiTfSCx9r+Xkg296WYDrJdXbkxzDy4plQfWUmlgYC5cj+fcs+sKWvJoBT+kRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EwSaJ69VqtlHaXJZo53ZeJUMPXoNBAWFGcHJKcXt8nc=;
 b=hdX3wu/hDrPpBdCDWHLdU0xnsd1eZVvXgP1LjGA8XlqoWWtel6KX5abIyvnsYXu5psWc/w9fipD9zLpZ25Zz869XQzOWiwLJtJpWQ4zt7iUPvaVza3GBB2ZofTixCgLjWYANqtODBqv2LOC/JD+Z7lV0akqw9J9O0uLmNhIF+DKGsZKR0Cxg6E4JQGoo6VrRz1UGU6CkJPILBakHrR6ySfCtO6+UBO/4rkYdYADokQZrMgevsYwi1+q8NHzi5RSdKlmbVg17VBP/Vjh3PfDarsJgeRK39HMKJtJPesG04WkcHbeUxYLkNfhVu+75FjBYNmTaGWNt37E73EnoFPnCrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <296f95d8-5506-c95d-1c14-915cbf3e4f30@suse.com>
Date: Mon, 21 Nov 2022 18:01:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: EFI's -mapbs option may cause Linux to panic()
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <60663f81-09cd-e46b-bb94-1afe50519086@suse.com>
 <Y3uryky3urmQlIjs@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y3uryky3urmQlIjs@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0038.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7784:EE_
X-MS-Office365-Filtering-Correlation-Id: 0aaecb1e-c195-45d7-f88c-08dacbe1f853
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2sd87gxsZmpG7bsFjh5BF7IxJBXcwvPF61JRejo/YSQEIq50UlSPsxy1j12jsRY70tVJ+BfgFVjeXVSPFYPBldBgXqYlTDSTJSjs+2+1z8KPIMwfa3/8kFbCbV4fJk6mXFghrTl8Q9vFOKn63XzWc9HRmsFqUgiZ2T7bjmhmyW8FjbHzN8BNotcOwSbuYFDRMlXD1kDYkqeyBAQFsURPG5ZpIWE4snGAXGuAz8Kw3xab7lauHm55GOUVwGimeb58INf96JR1MwwsGc/NaC593PH6JKy5UnE+D+w5ift9gK84fug8RQULIp26p2u+Ni4aC+Wf3R8frNEs2u0uUFZHDSbrhnZ5XrTnkNu9U8BOw+mK2otuPLU4qD8GoCmOD1GxFYQJvMLfihA1wajAC50Td+SFkBMQSgNgblnEsUatSsRMFSd4DrYkkl0HKoyXeKAItVCylB3vfpxqR0/pU9wG5cJuG594NrPvztlvBb/bWF2TFm+io2aDKywfqwBtW6GyovCOD8UQayfVcITy3T5qgWK5xLEZLa0z+8Ut/CzDcCN7+rFvsR2NvTBJWOvU7RFdQ6lsCmzUeoFzKOiUqKRMY/3x6JmT5J4Lg7zveNssS7d6XIhm3yH0bCkXV7lbHu2i5+Hq311cru+LW2ZjsMouqWSlBbMQfMNrDBWmOY/QMU1JcO2LIrqfl4jrbEiMEoPqp89AQgVFSss3K2YEPDySKvFY7pDW7UTMMtwrLo8x+DM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(376002)(366004)(39860400002)(396003)(136003)(451199015)(31686004)(41300700001)(5660300002)(8936002)(54906003)(316002)(6916009)(66899015)(66946007)(4326008)(66556008)(66476007)(8676002)(6486002)(83380400001)(31696002)(6506007)(478600001)(86362001)(36756003)(2906002)(26005)(6512007)(2616005)(186003)(53546011)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGozOWZvMDJJNk02WU13SHFIQ2NGOWtERDBoVlRWR0R3dzZXaXgvNm1YVC8v?=
 =?utf-8?B?Q0hIZ2cvdVB1a2FDeTNKTlkreDBPSmoreXl6dUhURVA3VHFzbmhHclliTVBC?=
 =?utf-8?B?OTFScElYSGovczRDTTdKdG0xTVl2dVJYOEEwVU5VT2dMcWV1dWs4dW5ZU0NQ?=
 =?utf-8?B?MS9UMHdPMUJtcENLbE9Ud3BTbFB6TzN6ZUk1eFJDNEd5akVzWmtCQjNmWjVH?=
 =?utf-8?B?ZU5FeEdjME9oVHdaT1lqaWU0ZXpyV3JXcjdDZWcwUHU3VFpVbFpFYzVXaUZN?=
 =?utf-8?B?b2hVV0cra05nbDVTUlUrM0FJUnBOOHJlTUVENkhoUzRVZ3NWL1JRY0Y4bkxw?=
 =?utf-8?B?TklKZHFCbFZvei9vNVNyNE9mNzMwMWF4dGJrbjk0WFlxTlpza01QUitpK1M2?=
 =?utf-8?B?MmJZVnExWXBIcy9rOTlzcmE4Y0tXb3lMWkIrVzhEaWpuZkw5dzlacVJ6ZWZS?=
 =?utf-8?B?TUtzcmdia0srMFIyU0YyV20xWS9KYlV1U1dDbGlYb21wSUhweGFCM3plUFNL?=
 =?utf-8?B?TlhFNUlXSkswU2o1aU1FMXVKNUpjd2FvR0hwMG1SMVRYRWdGQ21jd3dsejJR?=
 =?utf-8?B?ekpkSkJlREFoNkkvczduZHIyWEM4V3pHTy9RRGhxUXdXZHRxTkxzcWRlaG10?=
 =?utf-8?B?cUdYWkJlN2Eva01nTG9IZEs3cnV1ZTE2MnVnVVpGclRCaDhYZ1U0WUFJTjBq?=
 =?utf-8?B?MUFWQ0pXQStZZUtzYUNKY1JrcSsxcE5aYlgrdmVNSGNDZjFXN21KdEZtcllT?=
 =?utf-8?B?a0VvaFJWeFljYldEcU55WlNVTXB2RzRwT21yQlIybnp2Tk94aVlHNllOOUYx?=
 =?utf-8?B?UldZS1VJWDduWFJid3haUmFTMEtkc0JmNGE0dkJ4aS95TDBhU1IwektFeVpM?=
 =?utf-8?B?cmJ6U0lHVlRsdFVnZnpLV29vVjVRMEFjVzY4U3FhcDloVEVrYkF0RW1ZRGRp?=
 =?utf-8?B?cDI0b2ZueE0wY2VsemQ0V1Q1RnA0MzRFUkZzWlZ2MW1BWG1MQzROTzZsbzFN?=
 =?utf-8?B?VnFQK3lIME0xeVV6OXJBWUxuanFUM1ljZ2R3V29nZFk4dUphQmdUd0x6WUxi?=
 =?utf-8?B?TTJJYXRuWXVPUm5KeE02TDJmeGRKZDlwM2NTcFRhY2l4aUs5Y21TZFRtbmdX?=
 =?utf-8?B?MUhVZCtKWTAza2JWZHlGcjYrdzk5VTVSSGNGUDFmbWxkcDJHa2QwbVpGWjVN?=
 =?utf-8?B?SnFZYkNqUFRiYlcxZUw0TXMways5NStLRnhqc1NSc0NxS2MrL0VxM1o3aXA0?=
 =?utf-8?B?RytONmZyS3NtMm4wQk5XK2dodVQvMkhZNVAyWFpuUUR3aUR2MWFpa2t4TVcv?=
 =?utf-8?B?K2tXaGZzWjAxSnByYUdvUEtxSStpeXgxdkRZbUFxMmtJN0F3eFVhbEhXbnFj?=
 =?utf-8?B?RnZhQlZUcmIxc2J0MFRlc1VkWlExKy9HbG15WW1jWmlCdHdhMG53eWtoWWFz?=
 =?utf-8?B?L0tNVVRCakdlRmpVdmRkazlhVE5QSzM2eHhMU0dTNVBxQmxDVzl0TjdVQU5n?=
 =?utf-8?B?dDdMZEFiMlRNeTFOSjk4eE5hYTdjWk56RGZoaFYvV1pidGh6QUN6QkRPczNN?=
 =?utf-8?B?WDdhdDJnQ3JGS3RNRU1WREVRdndvODRQYWxTakVvY1liOG83K1dybHh5QU1K?=
 =?utf-8?B?UFo0WTZQb3NTQzh4ZFM5MlBJZVdXa2o0emFQVjFDMXEvcjQ4Z0NBc25PeURl?=
 =?utf-8?B?alB3cDNJS3hqQ09BNWpWeHBwZEQ3ZDArUldDVHRQVHZnWXU3MmY4bXJsOHNi?=
 =?utf-8?B?TXFJUmNKWUljV1dyNFg4TFJEUnZaNSsvUFNSaTNkUkxVUXFhd0FiejdDdTRQ?=
 =?utf-8?B?ZUlNUFNpQ2o1UlJFTGFGczRGbzZBcVRnV1A0Z2pRQVczZUpRV25oUTFzZkx2?=
 =?utf-8?B?VTVqRnk4Q1VIYmZrNlhtdGgwYmZhQVhxWEoxVlI5RFdSc2QvZkFpMFYyc1ht?=
 =?utf-8?B?SDl4Y3RHRVMyeEtyM0VNcDFUQXZjL3ZkRjV6Zzc5NGxRN096cWVoYnBIbEsx?=
 =?utf-8?B?dXQwaFcxNXVaNDAvUTBDSG93QXBhUFZmaUZkSks1YjdzNkhVZmU3RkJNVXhi?=
 =?utf-8?B?RjJnbGNobnRGNVdyT2JYTE1VWnFlTGR5SDc5WXdyRkhpVy9ON2tlck4rOXpi?=
 =?utf-8?Q?pGtuciVmHUydiItW+qx3Od/Yv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aaecb1e-c195-45d7-f88c-08dacbe1f853
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2022 17:01:02.1772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V2pAcVZotcdGxPQrKHCrHsoWJPFXeJti6NlWtiQ90f4PnOT6aGo4so4yRL2PMC8n8iwTTontXEuE9lvFiZs33Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7784

On 21.11.2022 17:48, Roger Pau Monné wrote:
> On Mon, Nov 21, 2022 at 05:27:16PM +0100, Jan Beulich wrote:
>> Hello,
>>
>> on a system with these first two EFI memory map entries
>>
>> (XEN)  0000000000000-000000009dfff type=4 attr=000000000000000f
>> (XEN)  000000009e000-000000009ffff type=2 attr=000000000000000f
>>
>> i.e. except for 2 pages all space below 1M being BootServicesData, the
>> -mapbs option has the effect of marking reserved all that space. Then
>> Linux fails trying to allocate its lowmem trampoline (which really it
>> shouldn't need when running in PV mode), ultimately leading to
>>
>> 		panic("Real mode trampoline was not allocated");
>>
>> in their init_real_mode().
>>
>> While for PV I think it is clear that the easiest is to avoid
>> trampoline setup in the first place, iirc PVH Dom0 also tries to
>> mirror the host memory map to its own address space. Does PVH Linux
>> require a lowmem trampoline?
> 
> Yes, it does AFAIK.  I guess those two pages won't be enough for
> Linux boot trampoline requirements then.
> 
> I assume native Linux is fine with this memory map because it reclaims
> the EfiBootServicesData region and that's enough.

That's my understanding as well.

>> While the two pages here are just enough for Xen's trampoline, I still
>> wonder whether we want to adjust -mapbs behavior. Since whatever we
>> might do leaves a risk of conflicting with true firmware (mis)use of
>> that space, the best I can think of right now would be another option
>> altering behavior (or providing altered behavior). Yet such an option
>> would likely need to be more fine-grained then than covering all of
>> the low Mb in one go. Which feels like both going too far and making
>> it awkward for people to figure out what value(s) to use ...
>>
>> Thoughts anyone?
> 
> I'm unsure what to recommend.  The mapbs option is a workaround for
> broken firmware, and it's not enabled by default, so we might be lucky
> and never find a system with a memory map like you describe that also
> requires mapbs in order to boot.

Guess how we've learned of the issue: Systems may boot fine without
-mapbs, but they may fail to reboot because of that (in)famous issue of
firmware writers not properly separating boot services code paths from
runtime services ones. And there we're dealing with a system where I
suspect this to be the case, just that - unlike in earlier similar
cases - there's no "clean" crash proving the issue (the system simply
hangs). Hence my request that they use -mapbs to try to figure out.

And yes, "reboot=acpi" helps there, but they insist on knowing what
component is to blame.

Jan

> Any native OS would also have problems booting in such system if it
> has any option similar to mapbs, so I don't see much solution.
> 
> Thanks, Roger.


