Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F38A76A5AE4
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 15:35:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503411.775690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX140-00027Z-QA; Tue, 28 Feb 2023 14:34:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503411.775690; Tue, 28 Feb 2023 14:34:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX140-00025x-N5; Tue, 28 Feb 2023 14:34:44 +0000
Received: by outflank-mailman (input) for mailman id 503411;
 Tue, 28 Feb 2023 14:34:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rjMb=6Y=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pX13y-00025n-UY
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 14:34:42 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20609.outbound.protection.outlook.com
 [2a01:111:f400:fe13::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 08f5ced3-b775-11ed-a550-8520e6686977;
 Tue, 28 Feb 2023 15:34:41 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS1PR04MB9700.eurprd04.prod.outlook.com (2603:10a6:20b:473::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Tue, 28 Feb
 2023 14:34:39 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.030; Tue, 28 Feb 2023
 14:34:39 +0000
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
X-Inumbo-ID: 08f5ced3-b775-11ed-a550-8520e6686977
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eDyJ6CPbQS08bQEHNzBKn5mR/PvRp1pZ6rSLQorrGHZdi8B6Z7Qh3cK59T9LWC2ohd98a/jfQmlz2VPFN9gesCVJmD5oIj2lB9WixA/lcqJBpBtprhs1zl+mfV9NP615lCn+e0A6EZ286u10JTLh1cEJJ/WNzMfrW3phor2Zp+cCE9K6flO9tQyPwuD2ozJb1xF3WukLhpdojEsPYvh+35KknWoagUb0mqDgwJLpHHXwUo3oOa8O2oAp0ILCmVNH2LticQFYXZBaDcl03fonXS6/8ChZaOXld0UIwa8OfsL94SogDuFvb/oqY3jYe3VfK1YmJPgJHUKJj9PE9isvLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YfCRyZD09J7MF0fUTxIaYJx3kdGw88pi/ktRGnphkSo=;
 b=RU0riz5zH04PXWUZqgSRGPWcI0cxMA3CNFLNJdDbucjSGW8Q5+YowwGagJivD32SzP5KsNzMKyXVZrkZCvr3DdT7rKc3qpGKkqJ8HXIHBRyfnCQiMhV/4atLw2I5LcoB3I5c2a7ID6FG5D22+xbtRJCDYfuf3rJWWtf4YWqHvmmQhLEqT23SPWBHgZO9GW+/d47HObOxbcto7SgHrLwnrQw4b6ey/gN+cIrtVfRIsslBULDBRxF5cuLbbVa5fgVYfe36ZEc1DsOobaNVWi2wKZI5QHzMmMaTpNOT7yJTR6Wgo0Rn0VAWAkfVYzXkAQjwRzTxVgSh3UPAWNTNzLfHgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YfCRyZD09J7MF0fUTxIaYJx3kdGw88pi/ktRGnphkSo=;
 b=oMQyrC1i4kLcI2EdaC6R8vBKHhagRwr+UKiEOwRutkrCMszt8NmF2Kk7vvxnd7cbxnXG6Hc55ZgIS8xEQHYFY5+L5XsK8UhNN3QqJqWs5IrNPh/TVkGSbAADdpe6yb7kDr3aiSVVV8HAYxVWORfF5Q6QT8eOClQsE9cc8tp7xv0FHnbsCEtesZk4fDE70noBnROK2mXKYY31eIs+U0CwXUZge+iNny9rTBZf/0fpQ47fkdoluIcvlpY+OVpCXeI9VaYzAHpCAB3WUONl608EnhDXJcGnf+z9nADgpHHh6NTZ/zEzUblFKXTDeWumt3ajqzQaM1gwHNz9wTcOqOYypA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bd819cdd-1c63-65b2-090f-911a4f9e8157@suse.com>
Date: Tue, 28 Feb 2023 15:34:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 3/4] x86/vmx: replace enum vmx_msr_intercept_type with the
 msr access flags
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230227075652.3782973-1-burzalodowa@gmail.com>
 <20230227075652.3782973-4-burzalodowa@gmail.com>
 <c9c6b915-fd3f-22d9-ebf9-5497eb6aa578@suse.com>
In-Reply-To: <c9c6b915-fd3f-22d9-ebf9-5497eb6aa578@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS1PR04MB9700:EE_
X-MS-Office365-Filtering-Correlation-Id: 36bc513b-522a-41df-a4d0-08db1998ec36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	78bfqLksEiOtPSkaUcRiaZve1lZXjrYM/uxhHvqOlODDw3DN5ErJmdYxeIn5CdLUVxdFlWQPV+RluGa1uym3K1tSQMhUn/V6GMlIuuKdkjTOMB5wqNaHm/XOk0TK3u5J40InzDB3aVezvPR0C7qqzPVIFduqihHT0QTIlVB0WaecYNVsZmQg07dVE5aFVRDEv36OVy3OTNDda0Q0CoAwn1rFdx02y4mhvcEvqQg4AUmHbvjv4Efy/nHPhqnaBi/fj7AQ4MPkQ6RgiV0+E8yOTsysc6Ec7FYpXGTWAVTZX42bZkC3D2G5Wa+okmklHyEyID4CYttr4PtFoACRKJFYL1TerA+XmARF4xqwMZGqaC+ji1ck+NPPv0WzOATW9EQ3bWWdSbuhEvesJyCj3bCY1wzLs4r7aMclVyE7Rq/5vZlUkCkYRBVw9SeajPc9w0txgRuHUVTIHwoymM9uIRgv5bD6qcfM0hqAWyChVd9SoIxsfBylNUWIdefBSLeB9hGnyvPgXOCAueCQPoHdwb+CcBgU2KdQ1vSqelvpEfRoc++TgzjgHD22YURSD00y95WIPdjdim0y3TjlUMOiuAmfujao39TxgS7u/lT97LhE0zFSbGQU5omuQHpBVP5MQDuZzey7VTefjw1grZkrNjRTkQSgF3dECiPXd5y+5exiWy5onlRSnPW/+y5I3ts1cQbLtU96M9brUY8TGLFFJk5POpersJRV5IIl9YHU1EByqHc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(366004)(39860400002)(136003)(376002)(346002)(451199018)(54906003)(86362001)(6486002)(316002)(31686004)(478600001)(31696002)(53546011)(26005)(2906002)(41300700001)(186003)(8936002)(83380400001)(5660300002)(6506007)(2616005)(6512007)(38100700002)(36756003)(66556008)(4326008)(6916009)(8676002)(66476007)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VHkxc1pqNFkzcm8vM1B0QVA0bDkxRW1VT2UvajdKeW5Kb2dFdCtKME1QMTFT?=
 =?utf-8?B?eEFDdU4rNEJzdy8vWXB3LzdXQVltVkIwdDJZOTE2dy9OazRPUHZyTG93MmFO?=
 =?utf-8?B?Z1FESWpwVWk4QTY3NjRsQjhxVzU3YU8ranVRRnF4MXV6ZEdmNm11WDVhdnZl?=
 =?utf-8?B?VkRuUWZ6VkQramt1UzFMZWFRREZjeUNYSWVibGg1eWNhaDJsVXAwY1kzYzJN?=
 =?utf-8?B?ZEpWV2FIbzB5dU5YSFJGay9xRHNZb1JhWk1ONG5UWVhXOGZwOTNkRXVIanl2?=
 =?utf-8?B?RkZXQjBla1J0TE15ZVBGcldMQkpRejd3NDdSa0tKdW5Ga0RRU0V4NktKRU1X?=
 =?utf-8?B?WGtiQUJPSnRCaWxQTUkyWkx2eEczeGVneDRIemZGSTEwUGJVSTJqWTk3Nnpo?=
 =?utf-8?B?V2FSZmdBcDFxM1cwRUdVWkZkM3dnWWphZ3ViSS9DakFlTVE5TW9NakJuK0sv?=
 =?utf-8?B?NERGOXRFQkFWQ25wMWdHcEw0aGQvUTM2WXlTVldJeDFEa3dYNE03eHNQMlNW?=
 =?utf-8?B?OUlzOWdrM2xWNmlxSmlKOUU0cWFzZWxPdllxckRFdFE0M0I2c3ZqcjhkYnd3?=
 =?utf-8?B?UzRCQ0k1c0hSK2FraG9pNlhQWjNmTmV6NklSSk4yS0NwUzQ3R2JRK3BCU2xR?=
 =?utf-8?B?M2RmQ2YyZS8ybVRYQjY5d1hJRVJNVTVsTFVZcVNUeDI4WXRjN0R6dHZwcytm?=
 =?utf-8?B?UjllRjFqU29wQVg3UnRJVklRcVc4MWJHQ0hkZStvbEY3dW56d1BHeWRSdWd6?=
 =?utf-8?B?VEx0UzFYT2pVK0JRNG5Ta0t0RlhKWGNXSDhJemdGVVRRNkFaNmpLVDJnZGdi?=
 =?utf-8?B?RnNaMjlWTm5TUDlQSWE2dUEybTNQM0FUN1diU3JkZTZjWXFEcGcrakw0bVNh?=
 =?utf-8?B?VGZUN1hkZm5IT3Ixd3VrRVozd3ZoOVpJcVJZSzUwdXNaTG5Db2ZvZEU2Y1h6?=
 =?utf-8?B?REwwWWJMa2xFdkJ4Q0JUdnJIbHRjV3dydzZBUWNBYlFUTGFhT2VjR3E0TGdJ?=
 =?utf-8?B?WnhpNkpJZmE4dVJ3cmhDSjFSRHU5OGtoSTNpME9yQWlHcjM1WEtLUUovTHhr?=
 =?utf-8?B?Q3E2RXl6QlNCMTlwUWNNVWkrOThuOXJNTlpGa3gwSHkrdSswOFl1Q25BVnBk?=
 =?utf-8?B?WFRRZm5xZ2UreERCa2o5YUJIem9FVWFGWWlNZmhWUlBIcmZBeTdoUm5TdG9C?=
 =?utf-8?B?NGFjNXFBZWw0T1UzV21pc1ZMZ1VHalo3L1dPd0wyVy9XR05iajl4U2djUGUz?=
 =?utf-8?B?ZDcxYWFDcTZZa3F1M1lkbHoydnVOc1NVUXZLcnI1bTRCdjd1dUsvbGQxeTN0?=
 =?utf-8?B?cTNoY01QcGJSMXpsdUYreHlPTDh4dStERFN0RThwT3VxMjU0TmRUc3BSbVZz?=
 =?utf-8?B?UkNmODRmL04wNUZKb2dXeUdnY09qYU1KeHc0L1VUdlZiU29YZWFvRG1hbDNl?=
 =?utf-8?B?SkVZdGZ6TUIxZlhpUWpTUlZPdVdKdGVlS0lzSHpKbkhzeXh1Y3QzbGpZaUdO?=
 =?utf-8?B?dnRqVGR5SWM4YTlRS1pBWFVxQ3JuaVRaNElNU2g4TFp6Zk0zR0VydVdvaE83?=
 =?utf-8?B?WWpGcEpjd3p6dVJ0eVA5bURmeTYxdkw4a01WTFlYSFZHTDEvVWh4dVJqU0pz?=
 =?utf-8?B?RDdWY3htZythTGY2VExnR25RVjRFQzRTbW0xVWJkdE9TazJsa3dseWdJTjQ5?=
 =?utf-8?B?NzNEQTQ1NFEvZUI2eis5QUNXNXpUZFR2YTdyd281TDdpcG9Sc0pyWHBOQkw4?=
 =?utf-8?B?eWZHTW0xTlR5Mm9wT3o4Mm9oT0FFNFp4TVBQc0x6aDVxTmp0M1hVRWc3WGxY?=
 =?utf-8?B?emFDRk9waTJ5cFZLb1ZoVGRRM1p0dlRvSDVaMWJMeU9qVG43eEdKNENSN1lE?=
 =?utf-8?B?N2tvU3Nka3VIS1h6UFZON0NQWSsxQzFUaFAxaHp5a0VYNS96bm43SjYrZzZh?=
 =?utf-8?B?eFI2UVVwMFlFbFEwVVcyd3BSQ0k2NVVVamNWamltaW5JN005Y0VmUHd0TXdD?=
 =?utf-8?B?c0FDSk91WlZaeWd4UktENDNjRlJLdmJOZHJvYU1uMTU1MU5Kcm9TZGUxR0Ir?=
 =?utf-8?B?SkxlTE5MZ1ZCbnoyb3MzZWwzUUNXOXUwMU9pYWNHUXlSUllaRmoxMXZhNG9v?=
 =?utf-8?Q?aoxNDuW9TKn+YLT5rjubwI7ao?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36bc513b-522a-41df-a4d0-08db1998ec36
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2023 14:34:39.3034
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Km+i+hNHkJA1gjhZ9HCHFw4nGcCZpzD/Pb0UeFJXSgXa5OZVAYiN3bIzy2Dp+8RYIlZNIEsr7vd+0EbrciZnSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9700

On 28.02.2023 15:31, Jan Beulich wrote:
> On 27.02.2023 08:56, Xenia Ragiadakou wrote:
>> --- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
>> +++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
>> @@ -644,18 +644,8 @@ static inline int vmx_write_guest_msr(struct vcpu *v, uint32_t msr,
>>      return 0;
>>  }
>>  
>> -
>> -/* MSR intercept bitmap infrastructure. */
>> -enum vmx_msr_intercept_type {
>> -    VMX_MSR_R  = 1,
>> -    VMX_MSR_W  = 2,
>> -    VMX_MSR_RW = VMX_MSR_R | VMX_MSR_W,
>> -};
>> -
>> -void vmx_clear_msr_intercept(struct vcpu *v, unsigned int msr,
>> -                             enum vmx_msr_intercept_type type);
>> -void vmx_set_msr_intercept(struct vcpu *v, unsigned int msr,
>> -                           enum vmx_msr_intercept_type type);
>> +void vmx_clear_msr_intercept(struct vcpu *v, unsigned int msr, int type);
>> +void vmx_set_msr_intercept(struct vcpu *v, unsigned int msr, int type);
> 
> unsigned int please again for the last parameter each.

Oh, also, another remark here towards patch 2: Note how the middle parameter
each is "unsigned int msr" here, when in SVM code you make it (kind of leave
it) uint32_t. As per ./CODING_STYLE unsigned int is to be preferred; in any
event both (and the eventual hook) want to agree.

Jan

