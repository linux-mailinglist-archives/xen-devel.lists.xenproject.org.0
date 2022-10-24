Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0A360B044
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 18:03:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429249.680159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omzvL-00082A-Fy; Mon, 24 Oct 2022 16:03:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429249.680159; Mon, 24 Oct 2022 16:03:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omzvL-0007zI-Cz; Mon, 24 Oct 2022 16:03:35 +0000
Received: by outflank-mailman (input) for mailman id 429249;
 Mon, 24 Oct 2022 16:03:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ny4u=2Z=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1omzvK-0007z6-0u
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 16:03:34 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140089.outbound.protection.outlook.com [40.107.14.89])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68a97912-53b5-11ed-8fd0-01056ac49cbb;
 Mon, 24 Oct 2022 18:03:32 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7972.eurprd04.prod.outlook.com (2603:10a6:20b:236::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Mon, 24 Oct
 2022 16:03:30 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5746.021; Mon, 24 Oct 2022
 16:03:30 +0000
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
X-Inumbo-ID: 68a97912-53b5-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T3pvuORjQphDk+SZGs9Wk4Jj9cydMT65VNxittxsJ4lNDQgts1Barh2f1knT3uALBlQLiYlzPaTdwEj5NijUXkykXaFZHl7B56EEGEiYSGUdsLExcX0hikRv1en8KMbzS8Erx+mxfwj9Wq4EBtMIwdYnIfAc3q6uBfcLPjEb8fnuk70JknQ8NsRR6eMt5bnuDEl3EUquDS9aNF59NcIvfZirsGhsLoFtxlvSCe4gviRp0jFcLSIXTxDolxacVqY1csNzgGLSWTnca/FKMqwuiEHZXrC+PyQNijI/nAeAv+UMTufYF3rTfrdz3+YwL8IdXsEDnX9uNanL9iIzVyUoXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bJiqYHYM3F2tuyHStKtr5L59tMOD3GIy2fs7vuXLenE=;
 b=UMFsWW9qFBUJfI74PeoJOZKbfQOQ4gVo4SH/OFmTsv+/7Qjkbwj3s7U7MQqHRt4EwDTMdyNCX/wuUXnMAyAgyLd7uiUzu1pUaeF+v/aYvpDRpPrE2k0S3OQ7dWYwzvfWz+PNCUdCHLaNDNOw/2oP6axJZAI+9kfcw1VVHvBGgpWPidW8FINl45GOJ/ZP2l3zVNhyBdlY/PwrIg1H3Utb3qs/RM2DH9KkexB7wJruP40B+jLn+EbFmVQnsrs+ZXFfGZtB/TjFeaWHdtH8aKBreJw+bKn0rvJg2rWNpmYtJUH432OJ0KCKeQzgwGbXoK6tylgNhWktMuOMjGggYf9Qxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bJiqYHYM3F2tuyHStKtr5L59tMOD3GIy2fs7vuXLenE=;
 b=M0tgES4JEq+OXSwEIvlO14cysn2SB/JoT/6mH/I8/kNp14tsTRQ4dk9j2QEsp6f2ZBMHSuJ36Vahss6wFYe8LVluamKAX2UuNJK3e3xvu8lyEfKlCJ5Fv/OVhP/P/A+89zv8pPUbsSv1/kKg6dFx+2E90NKhPepnSgByUlAiP/OY+DWny0ZCPMovIRzvdkVbn92CDJIFKPGlx50JFo/CmRjzxxPlnB1OfEsx22Jfx+ncnFLSRmkS8cTDifoIqmYcjnV9jdXJhwi7t0vG2SyIvyBoTXrqEwXUnrmld7NNnhSQ8nevXivDJXrPVvS86w3WzIFMuhLk2Yot/CDjrSYwhw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8755ff2f-f775-2ca1-5969-462ab05c6493@suse.com>
Date: Mon, 24 Oct 2022 18:03:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH for-4.17 6/6] vpci: refuse BAR writes only if the BAR is
 mapped
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
References: <20221020094649.28667-1-roger.pau@citrix.com>
 <20221020094649.28667-7-roger.pau@citrix.com>
 <cc94a021-aa76-87da-0d14-e01f09377b57@suse.com>
 <Y1apcHK6O7IDWlKF@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y1apcHK6O7IDWlKF@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR04CA0179.eurprd04.prod.outlook.com
 (2603:10a6:20b:530::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7972:EE_
X-MS-Office365-Filtering-Correlation-Id: 363c2729-0f9f-416b-471e-08dab5d94b3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ftMucM6KK0x2CJ4FlQvXSGQD7qTGXMNXRebSTosH89qyFPxq4gIVautGfHGK1erEZ0v3Qkrb7sNw5FoPpgr5rdcqKbAqM8/VSjU1pcqJUWqMMgQOu4PCLC7WRVxbCyOgIaMBoYekJMwlcTVFCCAKwKsYqEXgntPDrXqTBm4aKp+oAbn94otzOqjyOiILSQ88S3VhTe8pKAROQdANgurTrdq91U8rfDFd2CBnT2xv65GeqvDgTBiKgFHN7hB8ovWWmtWtnqRZQQsDWwhzMxpfzgDJcj5mAwvUK+jRGDpudhvT29tt3LGnvVZMqQl4P3LnE8KlrncuxMCbmWIo+8sVK4IUGfPjCJ9RsFCkF9dk1VWsDWKVoO29oPaK736JWlY7K0IFSksa0pOj5Q4KIOy7+dqwYHId6l8v0mRq/EmxCtvVURAeqKv1sGnAf6UaJZ+nUy8vsORRTXlNX/pH8PvURlaMIN8SH2GzdaGDg0KuhvLq+7MrnP81PEE4SjtaUkbKixWL2OklFO/65+DnfEknYJZg56LucTrJNHrTWHAmeLKIm4OHWV9dhebez/2+ZcUBkn3Y/qa1Vk/DYLiPEhfuRDv+eLoJyxGN5WXJjG1Z/XiL8xTXnAZNLnd3AifEw+CjHRsKRRczDL1CDmbY7ikac8GnRfe9wQgq78TQUncQJ7Ml00H8KgikKQnfuJMPXGbL5qhH8GnX5qdM4BAmjCvILwsJAoY39Xr8H8zxkhb2qvxNkFdF/6cTuNbY/jpU7MjrykxD7NMfpJs6aqTFfrdDru4gcKQaRPYLAVnvS5RxljA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(136003)(366004)(346002)(39860400002)(396003)(451199015)(31686004)(36756003)(86362001)(31696002)(2906002)(38100700002)(186003)(2616005)(83380400001)(6506007)(53546011)(66946007)(4326008)(6486002)(66556008)(6512007)(26005)(66476007)(316002)(6916009)(8676002)(5660300002)(8936002)(41300700001)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SU5JMjJDYlk2MVdvNE5KdmsyU1VYb0FZL01iTENsaVc0ZFRHQXFvTTloc1Ex?=
 =?utf-8?B?Q1ZrbkE4TnYvNGFTNnZYT285QlJxc2RLd3B3ZTA0b0tFRFQxR29uMkZOUUNk?=
 =?utf-8?B?cmZmOFJJM05rWlZKaDJFV0RjZ05Ceis3eVlsakRZdEJrLy9hcldZV1J1VGJn?=
 =?utf-8?B?NFMza0FjcmJJanE3ejR3dnF4NVcrSzc1MXB1U21JQUZSZmFYdDZtWHc2bWhU?=
 =?utf-8?B?NnB2ZDhZV1RBNGRFMUxNTzczdUxNS2FIUnF2cC9qSFlLQ2hBZzZxTXh1VGx2?=
 =?utf-8?B?UFNyd2RuWTdBSGtNbTNYc1UxUXl6YkJvSkVab2Zuajlrd0ZFQ0VSMytuNSt0?=
 =?utf-8?B?WVhWL3EzMzhTVzdXM1JTQ01vRU1uTGU4SG81NUdoR1BSVDRxY1luSWZSd1hn?=
 =?utf-8?B?L0NqM2xhS3hpQ1oyMHBsak5SQnJtN0t3akNxSVR2QlBXQzJwTExoa29rRGVN?=
 =?utf-8?B?WnhWMmJRTGlLQ1pERWlRbjNXek9oQXlpcllQbklqcDdIVWg4L2lWeHVGcERk?=
 =?utf-8?B?TGU1MitRRGVWNzQxWVZ2VzhHQTdaWUdxSDE0WEYyYU41aU9JNENNS2t3K1d5?=
 =?utf-8?B?ak9qWVh0bW1ETUJwWDhMY3plRXV0a0lqQU85a2FkUUVxMDl3VWJrY1NKZVFq?=
 =?utf-8?B?eVpaalQ2dkkvQk1wWk8xSnBVMGdVWFdwWDJTTXhqNGFTYzEvcTRmVWYvclN4?=
 =?utf-8?B?VFVmN04vVTI2WmdIVFR0ZGtPc3ZTeTJEdUpSd3FZUEpwenVlcGxkYlpyRm83?=
 =?utf-8?B?WlFsTGZYYzNDQUJIMy8vbWJEMEwxNHlkREdSWjhma2dLV3VrOWViSW9iU0p3?=
 =?utf-8?B?TmFVMGFnWE9rSmZ0RjdKZE5VUnhxU1lqUGRLbEZ1Q2huNkJCdG5ERWRzTlRh?=
 =?utf-8?B?Q3JaWkh0VzVFZFBvMFBGdjVYWDE1M3BycVRxYnJ1MEZXY1d2K2gxQnRuZVZx?=
 =?utf-8?B?cCt4YW9YQXdiQUU5a09QaWJBaGlZMFZJdWc0UkxmZ29wV210TDlCakdkczZF?=
 =?utf-8?B?VmtmSEt3ZDhUNEMvWGJOQUdmUGtpem5qeUFCck5CamJOamNqdGxaaXl0NTN5?=
 =?utf-8?B?N29BREo0NUd4cWJtbTN0clJ1aXRvV2gweTgwR3pkOVdMendYSHRybXBKUC8z?=
 =?utf-8?B?UkJEZXdFOGZZdFNjSUpoSmJpMm9KKzlTRGNkWTgycUlXOENqTE1YYjN5ZkhW?=
 =?utf-8?B?YlRlbXdZYzRZSmcwWTlnV0hBWWwzZkFiams4OEF5ZEdydzZiVndDeFJ4cTZl?=
 =?utf-8?B?Q3ZvM1VPK3dWRkYyK0hjMS9LZmlyVkRqVTN6UVBVL2loMGdyaUxxaWZ2YmtT?=
 =?utf-8?B?VVlZdDZuN3FiTFBxSU1rOU5RM01wWUF3WFRnMHZvNHBIZ01WT285TVBod0Zm?=
 =?utf-8?B?OFErZUNwSlFucDN6eHhNZjEzbFVnWXBMMmVuN0txbDBteXNJL3cxSHQrNldD?=
 =?utf-8?B?a1JZZmpDTGpIZi96U0RTK1QwdjJ2OXBpdDFmazV2V0tjSFhkM1MxQTdGRVc3?=
 =?utf-8?B?emYxd2RrQzVEM3hpT0wvdThoVlVIUWRCOFdTL09tQ1lEMjZqbVZsS3ZJN2xi?=
 =?utf-8?B?UEZ1Vlp5UHUvaFhGbHFhRVNBRitTTVpTbXg4NGFpa0ViNWcrQTY4RFBIUDM4?=
 =?utf-8?B?Q3dVaEFRT2Q2djlPbWpBMEtJM2wyU0J3VVJxTHlYMkxhZkdsdGdIRGI5bXJw?=
 =?utf-8?B?T3k1WUp0dC9qQzgyS3pOdG1WWkJyU29NTVEzRmJsZnJMQjIrZnc0Q203Yjcz?=
 =?utf-8?B?dGdOQ1l4ZGMwMmk1YWZ0T2wrVVZLUExQaDFzdXczeFN3bW5ZbzJEbmRwU2Zn?=
 =?utf-8?B?cnM1Sy9JdFhIb0dkYXd5RE1oRzlSdjhKeGpneUZDQjRYNFlJVWVPY0RoZVFk?=
 =?utf-8?B?aUh0VXpYT2RYK0xMSDV4d0NqcE0zakRTZElZa29hWWFyT3JlbHVOYy84OGxk?=
 =?utf-8?B?ZmdacjZ2TERLY3ZuUzNCc3Fnc1UydXcwREx2U1A5QlRTbmN5aVl2UjNVS2lp?=
 =?utf-8?B?R1BhZDJDUTBYd3BZVmFicnJXWWlWMzdXaVFOL3k5cmEwYXdkMHE1VHU0Szg3?=
 =?utf-8?B?SnZBbWx6akQ3RURLb1R0c2hqTCs1bUhUWnNDOW01R0taRG1MdlhWT2pQdWVq?=
 =?utf-8?Q?/nEjW6/qaPJFUP+K2O1W1gUKw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 363c2729-0f9f-416b-471e-08dab5d94b3a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 16:03:30.2237
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GHqMKmX+roIth8nonrmNa+Z6RcJp39/5EaS7flKb8A5w3aeYtrTEN+88yniH5HRi4mcMfkaPlGROGEdntn0NPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7972

On 24.10.2022 17:04, Roger Pau Monné wrote:
> On Mon, Oct 24, 2022 at 01:51:03PM +0200, Jan Beulich wrote:
>> On 20.10.2022 11:46, Roger Pau Monne wrote:
>>> Writes to the BARs are ignored if memory decoding is enabled for the
>>> device, and the same happen with ROM BARs if the write is an attempt
>>> to change the position of the BAR without disabling it first.
>>>
>>> The reason of ignoring such writes is a limitation in Xen, as it would
>>> need to unmap the BAR, change the address, and remap the BAR at the
>>> new position, which the current logic doesn't support.
>>>
>>> Some devices however seem to have the memory decoding bit hardcoded to
>>> enabled, and attempts to disable it don't get reflected on the
>>> command register.
>>
>> This isn't compliant with the spec, is it? It looks to contradict both
>> "When a 0 is written to this register, the device is logically
>> disconnected from the PCI bus for all accesses except configuration
>> accesses" and "Devices typically power up with all 0's in this
>> register, but Section 6.6 explains some exceptions" (quoting from the
>> old 3.0 spec, which I have readily to hand). The referenced section
>> then says "Such devices are required to support the Command register
>> disabling function described in Section 6.2.2".
> 
> It's unclear to me whether setting the bit to 0 is plain ignored, or
> just fails to be reflected on the command register.
> 
>> How does any arbitrary OS go about sizing the BARs of such a device?
> 
> AFAICT from Linux behavior, an OS would just set to 0 the memory
> decoding command register bit and write the value, but there's no
> check afterwards that the returned value from a read of the register
> still has memory decoding disabled.   Xen does exactly the same:
> attempt to toggle the bit but don't check the value written.

Sure - both assume that the bit is writable in the first place. Yet
altering the BARs when the write had no effect is not really correct.

>>> --- a/xen/drivers/vpci/header.c
>>> +++ b/xen/drivers/vpci/header.c
>>> @@ -388,7 +388,7 @@ static void cf_check bar_write(
>>>      else
>>>          val &= PCI_BASE_ADDRESS_MEM_MASK;
>>>  
>>> -    if ( pci_conf_read16(pdev->sbdf, PCI_COMMAND) & PCI_COMMAND_MEMORY )
>>> +    if ( bar->enabled )
>>>      {
>>>          /* If the value written is the current one avoid printing a warning. */
>>>          if ( val != (uint32_t)(bar->addr >> (hi ? 32 : 0)) )
>>> @@ -425,7 +425,7 @@ static void cf_check rom_write(
>>>      uint16_t cmd = pci_conf_read16(pdev->sbdf, PCI_COMMAND);
>>>      bool new_enabled = val & PCI_ROM_ADDRESS_ENABLE;
>>>  
>>> -    if ( (cmd & PCI_COMMAND_MEMORY) && header->rom_enabled && new_enabled )
>>> +    if ( rom->enabled && new_enabled )
>>>      {
>>>          gprintk(XENLOG_WARNING,
>>>                  "%pp: ignored ROM BAR write with memory decoding enabled\n",
>>
>> The log message wording then wants adjustment, I guess?
> 
> Hm, I think the message is fine for the purposes here, vPCI is indeed
> ignoring a write with memory decoding enabled, or else rom->enabled
> would be false.
> 
> Or are you arguing that the message is already wrong in the current
> context and should instead be:
> 
> "ignored ROM BAR write with memory decoding and ROM enabled"

No, my point rather was that we're no longer checking for memory decoding
to be disabled. Aiui we still require that the guest has cleared its view
of the bit, so I guess the messages could still be viewed as applicable.
Personally I'd prefer disambiguation.

Jan

