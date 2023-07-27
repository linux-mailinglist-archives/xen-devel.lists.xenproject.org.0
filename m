Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C68E7655F4
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 16:28:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571135.894255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP1ym-00040g-NT; Thu, 27 Jul 2023 14:28:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571135.894255; Thu, 27 Jul 2023 14:28:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP1ym-0003yg-KL; Thu, 27 Jul 2023 14:28:36 +0000
Received: by outflank-mailman (input) for mailman id 571135;
 Thu, 27 Jul 2023 14:28:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m5Ij=DN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qP1yl-0003xo-00
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 14:28:35 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20608.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd9606bb-2c89-11ee-b248-6b7b168915f2;
 Thu, 27 Jul 2023 16:28:33 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB8051.eurprd04.prod.outlook.com (2603:10a6:20b:241::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Thu, 27 Jul
 2023 14:28:31 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 14:28:31 +0000
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
X-Inumbo-ID: dd9606bb-2c89-11ee-b248-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kmdhbopsnnit3i6aRBOzxlqqJvKlPtT5Hl/AJlGa3owJv/MFMFnEC9cBNv5qt+ViHOJMJ0aDstEIKMwgfVHqHUgn0nnaAKmlhQYEakW3Aide7fEO/rcgtHNL/yy2VRKlSKFf8G/dV6HqN5VIbODrp2HF8FfYDHS3ARRXVnKSeFTXKntsDm0+uiH5anWdGiTvpNYyOuZq7C3rpb/cMRbOC84IX9BtJYu9Mj6cUm6OXWBUxTQ7v0yWK6mMJKY3ZpGF6l804mm3Q8PCzeEho5U7vaXEQlAZOpDNndJGl7hYqJUquE2RopTT0Aq1cc3HLBmhrn/QNsAQhMzYP27D1WF7QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bETeTToQSrnYdAQ4bFkv2rUI5+NqZi9FPzn5otWSeoU=;
 b=MKLlYObazDRR56pjdq938fXbb4fun+uZFTPE7VB5NlvuI2Z3RvjPjFPhfgrnL6MC12tf42zPmOSSTbBFOZN7L9+DLW1cNlhwuI4NxlxaB8Yc34PoeTzNuIT074Rvvl6owZxTCoQCLOjFuymLylayjSdh9I5LJhybpfoIQD9F5OG5uW+XaS3dZSybvT06/5akCukJc/qpdGcdiMaUR0UCRyMlqS4zK5JsxAnBq51wf4lifB8Hpwbt8gGZH0gtULItNsn6ibLj39WRUpctr1PWvdJlVEtZBa+sch6KL16WePs9LwaYJqVoZfVaQ2c6QiVHyeqaCMR0EzmrhkLF1ONHKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bETeTToQSrnYdAQ4bFkv2rUI5+NqZi9FPzn5otWSeoU=;
 b=lAmboB4rXHRSAN0IoL1P4II8Sq8cb0VhKAnK1lP2uMUTJGS6CDdl6g/2xzc3dRHv6/20fMalHj0JXdGkvmgaFKJr2N6hIXOjdZDklBHerimICN+tOdwMN8EQKX/w3rsfKH3xdz7eebqt9si+FpvM2CERXuJ06qylFHnc0CQRng5NpjjV4kq9draWY9sf8zlldA/9BPZrG54lqW7dErpLKqSCXbFB/K91MGsEnIpmWh9lgL+tk/zpZFHqoLRDfVaGXPRFgdeLTc/WrsReJesHU6S8/trfuXqWNqlo6uMXTIeP5VKltwFkC0xseMDq2NS4ho/3Rqh3ZME+BTyryImw5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9729cae7-fd26-978c-cdf9-e9ae24ddba97@suse.com>
Date: Thu, 27 Jul 2023 16:28:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 4/4] x86/iommu: pass full IO-APIC RTE for remapping
 table update
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230726125508.78704-1-roger.pau@citrix.com>
 <20230726125508.78704-5-roger.pau@citrix.com>
 <4e9681c7-472e-ee6b-38e7-fc7fb28a2b07@suse.com>
 <ZMJ84u9_tDBcc5xN@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZMJ84u9_tDBcc5xN@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB8051:EE_
X-MS-Office365-Filtering-Correlation-Id: 619ab14f-8d23-4a05-1631-08db8eadc073
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	T1XfC61j6lbnrKmYuLdP3BN4Qy1tqSeG4S3pvrAiuWe2enipDjHQVdjjJY/0Wco4rktdlndWdUPU/aqladQs3UTLCDjk5mjO8960a+Gz3gZr/JwAKlZF+AhsyP8rQ5v6rX4qNCRoOM0q5KVwyObfxfOl5/1v+xUDIlcrEdpvjwUGw1gQ0ezeJh8URJ3R07DumlFCuiGQl489AzU9MB2nXMqHbZk9B1w5ee8Yp9TbKcSG6PxodA5dMqLDu9JmjrWSrB2QwtkKbUcN0qXfcLtwt6sfLEbHQQxtcQiJJmt8dW1hHwd8hHD2z/9aO/5uPxTRWzBfBv2BaOrkVBFrjuOuSsFu+G85UkDzMSuE6mkY6QEXVWdLlGw/OZI3EXV+sQnRMUPzHNlE08p6Zq5kulNkZqKeiUQAW3gvFllwCR6bMYhDpQ/CQC6YyqFaFfFDvn/KG5uMl0gpNKBOxstDbeGHUA2sYO2k3Vbbxq1svdvZ4jHrmgeOMQ8wNZqzOUxAJq69Rm18KkqhCpxG6G8MRln/qv3j+iYgWvtMz3sd+jPPLZcq15cN+ZRuGnCjhAoW677F+IYyJLXNwyBiseCoKdkh/ksNYKzZ5+sbWFabuhqhgHcT4+YMMLDKP/9ZcYRYLj7A5RTWuGuoY68X4fb7E/dPRw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(136003)(39860400002)(396003)(346002)(451199021)(478600001)(41300700001)(6486002)(38100700002)(54906003)(6512007)(5660300002)(66556008)(2616005)(6916009)(4326008)(8936002)(66476007)(66946007)(8676002)(316002)(186003)(83380400001)(53546011)(26005)(6506007)(86362001)(2906002)(31696002)(15650500001)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?alJubUZYaE9jU0lwcTRVUTZqTTg2Zkh6d1B0QUN2eWFhbXFVNGhiRXNXTXA1?=
 =?utf-8?B?Z2VTZ2N6NiszNGorQ0dVNElHTFdLajVXSnorU2hWZmJKV0RiRktmNkwwejVZ?=
 =?utf-8?B?eWlEZXBEcWhQNUlud1pXZWRvUXhYN3ZBNVNyMDFrdmVvTDNFOEpQWEhCbFZu?=
 =?utf-8?B?UmphTjFtK1dGSmtsV3dEbFJ6Mmdtc2lsalZHVGxjYWcrcnZmdVlpY3c0Mlli?=
 =?utf-8?B?MjZsSnl6NVpFRmxmWEEwN3ZMbytnbXQ1dnExYXBkQlVWZGYzMnlCM3RLVE94?=
 =?utf-8?B?dURINnhjbUdrTFZtblBQQXRjMWl0R05UeWVveGxuVFF3NDlhWUZScTlhaXhk?=
 =?utf-8?B?emtIclVvTVU2R0hvQ2VYdVBGc2FFUWJsa3pNdjByd1JEM1JGeWNDaE1kUXhs?=
 =?utf-8?B?Z1p6TUFKNWRTcS9xOUVSZTZMK0Q3UlpGQWlJalAzZklkSnhsVk4xaXdVOFgr?=
 =?utf-8?B?R1FQVUpyRk14ODZWZGNGZmd5R1dBRkxndGVLY21Pb1N3MEs1aGpUNUtIK1dO?=
 =?utf-8?B?ejhZbmVWc3M0Nlh2NlhHRndpSGtlRmluS3RTcDRDYU8xTXp0MlVwcXBDTFd3?=
 =?utf-8?B?b0RTbS83elJlaFlGbWtncHorNUNnSDBTU09kcEQ1SFpoTXYzVzRXMGw4YXQr?=
 =?utf-8?B?dTJwblh3K2JxZ0J2S0RiYlRQekNreEQ1alhpVjlrMTVpQ1ovYVNqOC9FcURk?=
 =?utf-8?B?WWxIV2pDcDRmY0g0cTRETGV3NXFYZWFOS1JqWnZlbU5XSkFpL0NIN1poWTlk?=
 =?utf-8?B?RDVsZExrb0ZYa0xCYTlhSXhHS212TWU5VVdGQlQyVjlwa1dxYUhQMnlwS1R4?=
 =?utf-8?B?NDUwQ0Vxc1RVbTdnY25ZM0w3WVRDNjM0UEdXTDZDcWFXcDBMUlZMM3JVZHli?=
 =?utf-8?B?Q05JZFpDREZHV0FCNmJKUm9tMVM2WitoNTNqZHlCdG1MYUxlOWNZeHZTSkdw?=
 =?utf-8?B?QWtWbHJ3TURIYk02aVp1N0ZCSSsyMlN4Z1FlZGtYODJQZ0pYK0FVMWkwZDVw?=
 =?utf-8?B?QVhKdlFOSmlTdGQvTktUSG1KTjRCZDJrM1FEaVVmNnNxNUE2cS9QNTdXYW5E?=
 =?utf-8?B?cXMwc29id1dycitVM29ieFJMS2E1TjhHblBTd1N1bUZQZUNSQ3oydFFWMVlG?=
 =?utf-8?B?bUlzelZWd1puQTZaSUZBbXFBUnRiR3M1T1JqSVpWM0E0NFQyZkFpMG1lV08z?=
 =?utf-8?B?VkFSVUpCMFl4WlVXZEYwTkRObHlmc0M5cGEzLzJTbE5ZbXljekNhNzhEeVE1?=
 =?utf-8?B?V1c5NWxyU1IrV1NQV3ZDVjI3UndRcnlYcVJRdGRscDVVQ3d6TmN0aXN6dVdv?=
 =?utf-8?B?VHpSTWVIZzRNd2s3Ykp3TnF3bnFYeTFDYkxRWWE0aXlLOWFSUzl1NmhOT2FU?=
 =?utf-8?B?S2FlTGczOHQxdmtKTTc5L0lYWTJtNTQ4ZnV3ZFNERFMySCt0WTk3T004aytw?=
 =?utf-8?B?S01seExqN2lEWldBOGViUk5vQ3hVNEx5MVBMQWtuNFJzbkNGTWFkQi91Vk9s?=
 =?utf-8?B?alFDQXE5S21jNWNnc1NBSUg1ZHRENDVxRnh0TWNsRC9IeXk5dXpONGFMWWpX?=
 =?utf-8?B?bTBSR1FIYS9vWktpY0ZMWjdaeFEyNlpXM2hGalgzcDR2enNUTTVNRmdJUmR0?=
 =?utf-8?B?VlJuZDV0QW1qZnNpeFBKZTZaeldxM2RDOVBsZVRMYlUyaEo0RGpDc3lSUlRs?=
 =?utf-8?B?SHMzcHNXa1hPMU42aUJtQjhuL3gvMndxanV3MzIwRlRSKzVOVTlHVDJuczgr?=
 =?utf-8?B?STNGMzRkL2orRWhLTTZrNS9DK3orY1JsSDlnM3Z5Y3JDZ2J6ckJLQm1qdWJ4?=
 =?utf-8?B?dFVDTEZBcnpsTm9tUXFZRXJXUWhDMzhIRXg2b1hqaFZ3UUlOSlNrMFExZ0JT?=
 =?utf-8?B?dTlySDBGUE9WOEs4WlFiNVhmQzB3N0dIQ09FWGQ2QUxRYmRkZlhJYmEyN1c5?=
 =?utf-8?B?NzArSGZ5YkZ2WHBERFJCcG9kRGZPcS9PakxLM2VGekZ6L3hCb1RNNi9Fd1pm?=
 =?utf-8?B?NVpSVG1VWmMrN1l6TXZGWmJtQXhYZkViSWYyS3B0SWR6WklRMUx3YURacTNh?=
 =?utf-8?B?S0JYOEtBcWVwV3dWYzNBTy9uZk1hMCticzFYK0NpZHhLN3oxalY5ajRWQXBt?=
 =?utf-8?Q?IW2jXSfj9a2qGQUeboNal28Hf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 619ab14f-8d23-4a05-1631-08db8eadc073
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 14:28:31.3962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3GfiAMdZxzrm9rwDXtgbZE8J6uDFF5qFlinIo8gOoPZovSREZ92/shnwXeixko3rO1/9zZ2AquNZj5uWN1UhQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8051

On 27.07.2023 16:19, Roger Pau Monné wrote:
> On Thu, Jul 27, 2023 at 02:39:06PM +0200, Jan Beulich wrote:
>> On 26.07.2023 14:55, Roger Pau Monne wrote:
>>> @@ -439,36 +430,45 @@ unsigned int cf_check io_apic_read_remap_rte(
>>>  }
>>>  
>>>  void cf_check io_apic_write_remap_rte(
>>> -    unsigned int apic, unsigned int reg, unsigned int value)
>>> +    unsigned int apic, unsigned int pin, uint64_t rte)
>>>  {
>>> -    unsigned int pin = (reg - 0x10) / 2;
>>> +    struct IO_xAPIC_route_entry new_rte = { .raw = rte };
>>>      struct IO_xAPIC_route_entry old_rte = { };
>>> -    struct IO_APIC_route_remap_entry *remap_rte;
>>> -    unsigned int rte_upper = (reg & 1) ? 1 : 0;
>>>      struct vtd_iommu *iommu = ioapic_to_iommu(IO_APIC_ID(apic));
>>> -    int saved_mask;
>>> -
>>> -    old_rte = __ioapic_read_entry(apic, pin, true);
>>> +    bool masked = true;
>>> +    int rc;
>>>  
>>> -    remap_rte = (struct IO_APIC_route_remap_entry *) &old_rte;
>>> -
>>> -    /* mask the interrupt while we change the intremap table */
>>> -    saved_mask = remap_rte->mask;
>>> -    remap_rte->mask = 1;
>>> -    __io_apic_write(apic, reg & ~1, *(u32 *)&old_rte);
>>> -    remap_rte->mask = saved_mask;
>>> -
>>> -    if ( ioapic_rte_to_remap_entry(iommu, apic, pin,
>>> -                                   &old_rte, rte_upper, value) )
>>> +    if ( !cpu_has_cx16 )
>>>      {
>>> -        __io_apic_write(apic, reg, value);
>>> +       /*
>>> +        * Cannot atomically update the IRTE entry: mask the IO-APIC pin to
>>> +        * avoid interrupts seeing an inconsistent IRTE entry.
>>> +        */
>>> +        old_rte = __ioapic_read_entry(apic, pin, true);
>>> +        if ( !old_rte.mask )
>>> +        {
>>> +            masked = false;
>>> +            old_rte.mask = 1;
>>> +            __ioapic_write_entry(apic, pin, true, old_rte);
>>> +        }
>>> +    }
>>>  
>>> -        /* Recover the original value of 'mask' bit */
>>> -        if ( rte_upper )
>>> -            __io_apic_write(apic, reg & ~1, *(u32 *)&old_rte);
>>> +    rc = ioapic_rte_to_remap_entry(iommu, apic, pin, &old_rte, new_rte);
>>> +    if ( rc )
>>> +    {
>>> +        if ( !masked )
>>> +        {
>>> +            /* Recover the original value of 'mask' bit */
>>> +            old_rte.mask = 0;
>>> +            __ioapic_write_entry(apic, pin, true, old_rte);
>>> +        }
>>> +        dprintk(XENLOG_ERR VTDPREFIX,
>>> +                "failed to update IRTE for IO-APIC#%u pin %u: %d\n",
>>> +                apic, pin, rc);
>>
>> Afaics you don't alter the error behavior of ioapic_rte_to_remap_entry(),
>> and in the sole (pre-existing) case of an error a debug log message is
>> already being issued. Why the addition?
> 
> I think I was trying to mimic the behavior of
> amd_iommu_ioapic_update_ire(), which does print the errors as opposed
> to doing so in update_intremap_entry_from_ioapic().
> 
> I've now removed it, and adjusted the code to match the rest of your
> comments.  Will post v4 of 4/4 only as a reply to v3, I don't think
> there's a need to resend the rest unless you prefer it that way.

Just this patch is going to be fine (maybe even as v3.1).

Jan

