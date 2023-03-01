Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5D96A699E
	for <lists+xen-devel@lfdr.de>; Wed,  1 Mar 2023 10:15:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503903.776302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXIYC-0007eo-Lf; Wed, 01 Mar 2023 09:15:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503903.776302; Wed, 01 Mar 2023 09:15:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXIYC-0007cz-IL; Wed, 01 Mar 2023 09:15:04 +0000
Received: by outflank-mailman (input) for mailman id 503903;
 Wed, 01 Mar 2023 09:15:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4Y5i=6Z=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pXIYA-0007ct-Rc
 for xen-devel@lists.xenproject.org; Wed, 01 Mar 2023 09:15:03 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2062f.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b2b54e6-b811-11ed-96a0-2f268f93b82a;
 Wed, 01 Mar 2023 10:15:01 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3ec::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18; Wed, 1 Mar
 2023 09:14:59 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.030; Wed, 1 Mar 2023
 09:14:59 +0000
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
X-Inumbo-ID: 8b2b54e6-b811-11ed-96a0-2f268f93b82a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X7UsbW6Uc5Rp9T7O6410mq5neJdtBljw2n36XixoNSRkHo25I4kecDG/hYsNXqGlI2WaIPJKIxqy5fArKBYt0QoEQp7WZAfL8FZywBa2aQghk+nY6aLHPvuC1/tthnR+RlYT9tacikBWUW0kYgC/wz4kyHGMsaRM5ZAykkLpsxulsc2uEktlI+cgwkMSNpySi6BLM8wPDQTp/mJak5bJflKjc/lV+UVLFYyp05LYf958c8NYYn7AP5TsKTa/Xy2WjKOaykZFUfDN88D5jlvmUCjPAgMlrC2aBIMCELOE/RbGex0y5MMlmuULuyw2nYXrePZFBr9QmIYk1vUarFdzaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IB0USwdCN9iU8Pwcmnm845M1uRu2Y6Cqr26ibACaot0=;
 b=mcsiv8QdXmWFEsc8JQ2eCeh+3HX5vvFKMhXHKjCX/wbULQCR/RrBVyRF6bfDExUgqd+47pGYFym7myo9tRvjTMBbJ560TJnc/d+PLRt/8sU5dvipH8gce8G4QBhJqhzBWOuNpaDlNnVHdY9rK9fRTc4h+LpNgyiOWPypu3ROh1ETM57SC4ZPPGoqkHCqOw0bGmIJjWkv8Q4wh0bdQcxzbKOVNvRMMS0jC3YjgmDM8L/XZxD22w3GzddaSNnGgOgrCJAmSIiKzauyGTE9dMhXgTkU6dwgeXrZMknl1T6izTfc0BTOJe2Tt/PZ2JYYJXRNi8PIlUCGqPRzogcQoWjyEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IB0USwdCN9iU8Pwcmnm845M1uRu2Y6Cqr26ibACaot0=;
 b=4szn7y8mGml60qFlBhw41GHZNAoXLDNN5CvbjwNhsqTOnP8SiKAdYf1zaOgOfCE2WsUhOmmP/z7hQdofvFCv6PnGai6a+kp4f7IGFNypHOOMnOGT7G7Op9L+XgFSDtaCHYCdvwUVyfTcRrVVD/nC02i9TD499QABLIyWb8v/lSgD9A3MFridhp8nb+p7rOvcjblP6b2ssA9BmCgRIWlH5H1nhYak3mlfe5m7my+8cvjIl7tCaSQxEvL38hUJu1jCQXyKiL3uNH6t1lI7tBKt4jflHzKCPmINbkXfQwHUQ9s9UYayOpOJkvJYvlb4FLwUJ9oENbsEjNIE3udBhfT7Bw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7adeada7-e009-eca6-5e7d-5664d5af110a@suse.com>
Date: Wed, 1 Mar 2023 10:14:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 4/4] x86/hvm: create hvm_funcs for
 {svm,vmx}_{set,clear}_msr_intercept()
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
References: <20230227075652.3782973-1-burzalodowa@gmail.com>
 <20230227075652.3782973-5-burzalodowa@gmail.com>
 <732bbee0-24d3-f5e8-7353-b40a77c3ee2e@suse.com>
 <ab142406-36ed-ac42-a93c-f0fb5cf7950f@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ab142406-36ed-ac42-a93c-f0fb5cf7950f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0106.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8179:EE_
X-MS-Office365-Filtering-Correlation-Id: 76205c50-2369-4c70-473f-08db1a356df7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2CYrm43Bgp4Us+tSTPxpJpo2uCH5CJ2OzbxIVl+CVk5zf2lXFK2FCtFSQxbU+138Dc8WFy/C2RcJkxZ2uV3jmGqwqlubq3uWAE3YLTxgQLnAVWCmM35cjAza+exD1/ToQL6uMm2e1EthVbAkUZzhJlmU8wJadEXGOz4cX8zmyOIyphUHMmTfRuTBHYL+VgiFS7bCtjodvBRPhS7se6gc5VWYhpV5erMSZAoaY5OsLJS23W3xY9qsyyL5lP1RixZUpmUq6EGYkNankBgIS5U6iAwCBgPJtqGRQSfTBuCeIXDtBGaLhmVgoF1dxg3/4ZQFjFFEO8KYfTo6JoJd6Bizb8OFkmfHtPgffuuYYKKCHbAwht+p0UD0NfEK9PSFUyMWGzOlDZ5PfnRJZ2psEfSimIDkvAjUf63NGjnvAGAO6xFZp+lTF02lqgsyF3mv0/8EJq/0G54OLVR7t2EskzHDbaYfAddNqoZsRA3dJWYFulX1FX7FuaI1YyCpT+w3sebVsHZ0BJwryOK5daZKbob/Shz0KQD6rNQdyTJ0+WfCE9vcnzJCgvxhfpIGnEY9Ot8b0+meDJGVUjt+otcf/dwD2usBFE4YNPz7/L2AUpAmtPzlm1VQfHBNKYLBcocnhXUSLM/pbHAVJajyn/zWPm3ADqnHCw9/0knfI+wYaOwzOmB3zfijso7p+TPFW21qR2rer7VtHV53OJ0vbL6+RRtJfBRO+ECDGm9SEAIqpzaMzu0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(136003)(376002)(346002)(39860400002)(396003)(451199018)(31686004)(83380400001)(478600001)(316002)(54906003)(110136005)(36756003)(4326008)(8676002)(38100700002)(66476007)(2616005)(53546011)(6512007)(6506007)(186003)(26005)(6666004)(6486002)(31696002)(5660300002)(66946007)(66556008)(8936002)(86362001)(2906002)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WkowamxnSEJIMnZDeFRTUDBhWmNqS2J4MHhLMEtDUTNqa0RHVStUQ2pBa0dE?=
 =?utf-8?B?a1BVUUpVQ081WWJQalliN0UyaS9TV0hKTVhMQWhVK3ZwL1p1U3pRa1ZoWWpi?=
 =?utf-8?B?NkI4aVdtSUdBM3hHS2kxUTdyYyt6bC91eG1NcG1hTU1zRDJNakdWaDlyQnN4?=
 =?utf-8?B?L0NzTXF6cG1RLzU4WWkzRCs5QytYVlJyeVA3YlJxRHFnbFhWOHdibmZ3bzA2?=
 =?utf-8?B?SmJhRGZMazBGY0FJcjRRVzNVYkhVZ2RyamlweE5sSUlEcGQ1M0JEa0NHTEpu?=
 =?utf-8?B?Mko5SHhOSzBsQklsZUFkVUowd2k1bEZoTVovRmZITXBGNFVoWWRHWmg5NkNq?=
 =?utf-8?B?QU1EWHQxdlIxelBtOG9GL2RtSGdjV0VBVXpLWnFXTDQzUWRHZGFDR0hSR3RO?=
 =?utf-8?B?YlJpa1BoVmFEaUlJQmlKb1JobTdrb011THFNY0JPYk5YZDNZY1FybSsvbVRO?=
 =?utf-8?B?M05WZVlVN1IyMXlDd1YxUFFQdXdxVmJkcnlhMXV5cnJOeWNBK2tpcURacFN4?=
 =?utf-8?B?dzNwSnM1MlJoSmc1ekg3SEdsdDloNlA2OGkzVDRrc3lINVJUN2FnaEZsRHFB?=
 =?utf-8?B?enZUQ0pqMmdDWmhnc0FTSEQzaXFTeGJnVFFEd1RaRDZQd04zNG9rdEphQW9H?=
 =?utf-8?B?Z2IrTTZYM2tXcnJYL0htOXRZUmNwUWVPRUZVZ1RGd01KREx4OWZ4Mkw4TkJk?=
 =?utf-8?B?dDZDcThjV2ZNV0h6UXlnR3pQVDNqU0gzN2hHdWF2ZUtJOTBJVW1EUDhVUVNk?=
 =?utf-8?B?OEMvUXRKTzJsNEJheGt1UkpvTWRQTDhVNFd3TkNPWTlRZjUya0thMkdlVEta?=
 =?utf-8?B?aDMvVE9CM0ZRZmtidGJyVXl2NElYNVlmOExzWTVucE9UMCtFQ2xVRk9zeUlT?=
 =?utf-8?B?bkJaSEptMTlCQmRZbWRHOVM2cDF1RWhNQzRwU0NEQUFVWHFQaElyaXZtYU4y?=
 =?utf-8?B?dGc4MGZNVnhqZlFiWC9Cb0FmcXdpbXRPNEwxWVQyUlBoQ2FxUjFkT0wwd01i?=
 =?utf-8?B?TmpEeDR5SzlCZ01RcUlrWVJJa3oyVjVnR0JwN3pXN2l1ZCtRYnkyMytCbTYx?=
 =?utf-8?B?bzAzMUlMNGhQeStuczJYZnlJZjBubGNnVlBtU0pvTUUvTCtKa0FFcFhhQnJY?=
 =?utf-8?B?eWdyeHBMZFIyTHNyY0x2TDlsN0lSR1FzR091c0MzUFhjbFZBRVAxdmNra0lO?=
 =?utf-8?B?ejFIV1YvaVkyL29WWXZHRnNBc1kzOURSa1RxRExaVFVVQjBXSGZsVVdCcDhl?=
 =?utf-8?B?UC9zWmU1YnNyUTlNbVoxYkxWRHI0MFVmU2ljY2p2SG1GeVo4TE1NQ0xRL3ZC?=
 =?utf-8?B?czM5ZmovRHc2YzVsSkwvSlRRcCtyQndBdWVyMGtBb1RJNE5nN05VM3Y2aDNS?=
 =?utf-8?B?RHh3KzZDZzk4SSt3MVJoZlpqeXV5dFFEOTNSYndaOHRpV1p1UjU0UHYvcG01?=
 =?utf-8?B?UFM2WEw3R2llZ2N2SmdFeU5wWjg5Smd1L2k4dHAzakpIY0lFK05maWNDSlh3?=
 =?utf-8?B?UWkyS0txaGhMV3JtM3lleC9vQkdBY2pJTUdodU5HeU9TL2gyVmIyS3NER3JI?=
 =?utf-8?B?c3FrVjNlWnNPeW1TMGllV1c4dnhsOXpKdWpGZGt0UEZTaWJZM1NOSk9DbVZ5?=
 =?utf-8?B?TWl0ZEx6VEFZcjRkWGx2UitoZjhHVHFuRlRTdXVVNUV4aUxPR2pYS1FqRWt5?=
 =?utf-8?B?M090MWoyaVpMYlM1djNxOWRQSHF2cncyT3l4cXhZVEVMaCtaV28wWjVFMHkv?=
 =?utf-8?B?THFudGMvSm1EY21aSkZjdFhvWDN1UTNaa1dPc01paDZxbE4xcTNaREEzeUJK?=
 =?utf-8?B?OHZVY3R4MklYUU95Nm04TXByaERBQTRqbW1XU1BBQU5CWDY3VGpOQjBVeDQ4?=
 =?utf-8?B?N3FVWUVKd1JrUWYya2Y0UVJMZFZWQkpZQ21YNlc4MjRUUWZIdGJxSEJBWlpX?=
 =?utf-8?B?OEJ0Mk9rT2Y1SDdoNHhlRXNhTTdtMk1rRlJiMjVNUzNZelowNnR3cGovbzFH?=
 =?utf-8?B?TExBbmZvaXNkZWtQNFViYkExTXhIVCtyc2J0NkVyOHpIRGJVNjI0SUE5WkZ5?=
 =?utf-8?B?OGIzUUhnbVp6bDIya0lxRDRTaHFCT2puNDgvMmtWNDlEUjZjb1V0eG4yMlNO?=
 =?utf-8?Q?j2Q4ljfPGTD1W3dgbd7x5YVLC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76205c50-2369-4c70-473f-08db1a356df7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2023 09:14:58.8255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nIPXfDvcUvOQIU03WjSeztCO/fuXpFg+GlLoqCm0C6nWNafruEis0kKzRv0G4en11V6jc4iruMEEs1z0OHN7WA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8179

On 28.02.2023 21:14, Xenia Ragiadakou wrote:
> 
> On 2/28/23 16:58, Jan Beulich wrote:
>> On 27.02.2023 08:56, Xenia Ragiadakou wrote:
>>> Add hvm_funcs hooks for {set,clear}_msr_intercept() for controlling the msr
>>> intercept in common vpmu code.
>>
>> What is this going to buy us? All calls ...
>>
>>> --- a/xen/arch/x86/cpu/vpmu_amd.c
>>> +++ b/xen/arch/x86/cpu/vpmu_amd.c
>>> @@ -165,9 +165,9 @@ static void amd_vpmu_set_msr_bitmap(struct vcpu *v)
>>>   
>>>       for ( i = 0; i < num_counters; i++ )
>>>       {
>>> -        svm_clear_msr_intercept(v, counters[i], MSR_RW);
>>> -        svm_set_msr_intercept(v, ctrls[i], MSR_W);
>>> -        svm_clear_msr_intercept(v, ctrls[i], MSR_R);
>>> +        hvm_clear_msr_intercept(v, counters[i], MSR_RW);
>>> +        hvm_set_msr_intercept(v, ctrls[i], MSR_W);
>>> +        hvm_clear_msr_intercept(v, ctrls[i], MSR_R);
>>>       }
>>>   
>>>       msr_bitmap_on(vpmu);
>>> @@ -180,8 +180,8 @@ static void amd_vpmu_unset_msr_bitmap(struct vcpu *v)
>>>   
>>>       for ( i = 0; i < num_counters; i++ )
>>>       {
>>> -        svm_set_msr_intercept(v, counters[i], MSR_RW);
>>> -        svm_set_msr_intercept(v, ctrls[i], MSR_RW);
>>> +        hvm_set_msr_intercept(v, counters[i], MSR_RW);
>>> +        hvm_set_msr_intercept(v, ctrls[i], MSR_RW);
>>>       }
>>>   
>>>       msr_bitmap_off(vpmu);
>>
>> ... here will got to the SVM functions anyway, while ...
>>
>>> --- a/xen/arch/x86/cpu/vpmu_intel.c
>>> +++ b/xen/arch/x86/cpu/vpmu_intel.c
>>> @@ -230,22 +230,22 @@ static void core2_vpmu_set_msr_bitmap(struct vcpu *v)
>>>   
>>>       /* Allow Read/Write PMU Counters MSR Directly. */
>>>       for ( i = 0; i < fixed_pmc_cnt; i++ )
>>> -        vmx_clear_msr_intercept(v, MSR_CORE_PERF_FIXED_CTR0 + i, MSR_RW);
>>> +        hvm_clear_msr_intercept(v, MSR_CORE_PERF_FIXED_CTR0 + i, MSR_RW);
>>>   
>>>       for ( i = 0; i < arch_pmc_cnt; i++ )
>>>       {
>>> -        vmx_clear_msr_intercept(v, MSR_IA32_PERFCTR0 + i, MSR_RW);
>>> +        hvm_clear_msr_intercept(v, MSR_IA32_PERFCTR0 + i, MSR_RW);
>>>   
>>>           if ( full_width_write )
>>> -            vmx_clear_msr_intercept(v, MSR_IA32_A_PERFCTR0 + i, MSR_RW);
>>> +            hvm_clear_msr_intercept(v, MSR_IA32_A_PERFCTR0 + i, MSR_RW);
>>>       }
>>>   
>>>       /* Allow Read PMU Non-global Controls Directly. */
>>>       for ( i = 0; i < arch_pmc_cnt; i++ )
>>> -        vmx_clear_msr_intercept(v, MSR_P6_EVNTSEL(i), MSR_R);
>>> +        hvm_clear_msr_intercept(v, MSR_P6_EVNTSEL(i), MSR_R);
>>>   
>>> -    vmx_clear_msr_intercept(v, MSR_CORE_PERF_FIXED_CTR_CTRL, MSR_R);
>>> -    vmx_clear_msr_intercept(v, MSR_IA32_DS_AREA, MSR_R);
>>> +    hvm_clear_msr_intercept(v, MSR_CORE_PERF_FIXED_CTR_CTRL, MSR_R);
>>> +    hvm_clear_msr_intercept(v, MSR_IA32_DS_AREA, MSR_R);
>>>   }
>>>   
>>>   static void core2_vpmu_unset_msr_bitmap(struct vcpu *v)
>>> @@ -253,21 +253,21 @@ static void core2_vpmu_unset_msr_bitmap(struct vcpu *v)
>>>       unsigned int i;
>>>   
>>>       for ( i = 0; i < fixed_pmc_cnt; i++ )
>>> -        vmx_set_msr_intercept(v, MSR_CORE_PERF_FIXED_CTR0 + i, MSR_RW);
>>> +        hvm_set_msr_intercept(v, MSR_CORE_PERF_FIXED_CTR0 + i, MSR_RW);
>>>   
>>>       for ( i = 0; i < arch_pmc_cnt; i++ )
>>>       {
>>> -        vmx_set_msr_intercept(v, MSR_IA32_PERFCTR0 + i, MSR_RW);
>>> +        hvm_set_msr_intercept(v, MSR_IA32_PERFCTR0 + i, MSR_RW);
>>>   
>>>           if ( full_width_write )
>>> -            vmx_set_msr_intercept(v, MSR_IA32_A_PERFCTR0 + i, MSR_RW);
>>> +            hvm_set_msr_intercept(v, MSR_IA32_A_PERFCTR0 + i, MSR_RW);
>>>       }
>>>   
>>>       for ( i = 0; i < arch_pmc_cnt; i++ )
>>> -        vmx_set_msr_intercept(v, MSR_P6_EVNTSEL(i), MSR_R);
>>> +        hvm_set_msr_intercept(v, MSR_P6_EVNTSEL(i), MSR_R);
>>>   
>>> -    vmx_set_msr_intercept(v, MSR_CORE_PERF_FIXED_CTR_CTRL, MSR_R);
>>> -    vmx_set_msr_intercept(v, MSR_IA32_DS_AREA, MSR_R);
>>> +    hvm_set_msr_intercept(v, MSR_CORE_PERF_FIXED_CTR_CTRL, MSR_R);
>>> +    hvm_set_msr_intercept(v, MSR_IA32_DS_AREA, MSR_R);
>>>   }
>>>   
>>>   static inline void __core2_vpmu_save(struct vcpu *v)
>>
>> ... all calls here will go to VMX'es. For making either vpmu_<vendor>.c
>> build without that vendor's virtualization enabled, isn't it all it
>> takes to have ...
>>
>>> @@ -916,6 +932,18 @@ static inline void hvm_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
>>>       ASSERT_UNREACHABLE();
>>>   }
>>>   
>>> +static inline void hvm_set_msr_intercept(struct vcpu *v, uint32_t msr,
>>> +                                         int flags)
>>> +{
>>> +    ASSERT_UNREACHABLE();
>>> +}
>>> +
>>> +static inline void hvm_clear_msr_intercept(struct vcpu *v, uint32_t msr,
>>> +                                           int flags)
>>> +{
>>> +    ASSERT_UNREACHABLE();
>>> +}
>>
>> ... respective SVM and VMX stubs in place instead?
> 
> IMO it is more readable and they looked very good candidates for being 
> abstracted because they are doing the same thing under both technologies.
> Are you suggesting that their usage in common code should be discouraged 
> and should not be exported via the hvm_funcs interface? Or just that the 
> amount of changes cannot be justified.

The amount of changes is okay if the route taken is deemed useful going
forward. For now I view vPMU as too special to provide sufficient
justification for yet another pair of hook functions. The more that - as
indicated before - every single call site will only ever call one of the
two possible callees.

> IIUC Andrew also suggested to use hvm_funcs for msr intercept handling 
> but I 'm not sure whether he had this or sth else in mind.

Andrew, any chance you could outline your thinking / further plans here?
In particular, do you have other future use sites in mind that would
live outside of vendor-specific code?

Jan

