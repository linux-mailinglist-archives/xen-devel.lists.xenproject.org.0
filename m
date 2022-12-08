Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 126A3647331
	for <lists+xen-devel@lfdr.de>; Thu,  8 Dec 2022 16:35:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.457239.715128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3Iux-0007Vc-46; Thu, 08 Dec 2022 15:34:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 457239.715128; Thu, 08 Dec 2022 15:34:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3Iux-0007Tq-0V; Thu, 08 Dec 2022 15:34:35 +0000
Received: by outflank-mailman (input) for mailman id 457239;
 Thu, 08 Dec 2022 15:34:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=u3z7=4G=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p3Iuv-0007Tk-GB
 for xen-devel@lists.xenproject.org; Thu, 08 Dec 2022 15:34:33 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0627.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf5bfd26-770d-11ed-91b6-6bf2151ebd3b;
 Thu, 08 Dec 2022 16:34:32 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8231.eurprd04.prod.outlook.com (2603:10a6:20b:3ff::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Thu, 8 Dec
 2022 15:34:27 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Thu, 8 Dec 2022
 15:34:27 +0000
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
X-Inumbo-ID: cf5bfd26-770d-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b5qdIDoIlwFFLzVXtNIxwdTblizzc4FERZ9lajCpY/JE9MMMzEKjjTgEWcEFrGKQLVUKruVtyK48qmKJgITVLDO2JGK2mqOhwQ3/RONhFHK7h3FfyDHzDI5ZC3nGTbA7zcOgQ8djsUxPLHCij1l8Urc/sNh7yh+DFSmAD6/XV/evksrDhEyD4q4NETUOCxA52e5ZGxkdQFwVvrzVytUjqPVrUd2f3NJyYSvm+GS2oOS/YvEShOXqnU0XMIhudg3G31i0WQ3z53BAB15bdEoIm/ElmXa9qVevHkAWQSDkkqP5E/fYdq2o0voqvWCshthd7VnlufgaxayoBbKfucpITw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LFjrw/i7rnHF1ifbMIw2RAbjfbMnu8L0QnsRWzAIIYw=;
 b=AyWTXFoEx3Fltb2nDHdAWATwoSLNXsH1dYCTcf7kpDZZcOwlW/bWBuPyrOTg2No8Tg1aw9tus1Cg0cgQHAlhPvCW9GpjS0RRZG9aAWsx6RGTvypKKU6+fg9v5R1aO0ALe/CScCpybJys2sdEuZBC2wjQatfGS57fFyUdBkRsjl5nXHa+1wIHcBK7ByJadAKc8hXEOwmbouFb3SEV/asqE8cdLZzmM7z4dAeHRNAkCL4NeEHaRWiWLN28Y5bwJUBpNBz0lham4IXzpLrkxMW+QuRpS6hYN3S6/lH0s9zwnW7rnOgIUZhMVRQNbNhDZqE4wcOAxTH1wOcru7sMquComQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LFjrw/i7rnHF1ifbMIw2RAbjfbMnu8L0QnsRWzAIIYw=;
 b=Dhf8zM0mtj8qCjJaNPMILGoxiaVRJLJ3pEvHdDxHXS2LvwxH2BePFfYhRgMgynEzmkgFxGO3fElrV0AfJ5Qnm/gd8I29T7tdtbs+7bwLxFzbKUjFXXntuDUb7RNuQwWLRKeMGnlK7dojVKB3oLqw7NmqakZ0rzWElQeTQ0rgkg26fFOJrPkLEzpMiHGbE3WVN/A76XGzyQaIN8Mvg1+2LgDjvt2k3HU+ZiIqtziubbVrPPWEIM8vh6fOC/tgK8UhTVWmTKG707rmfVLELHqx0QUuffrkbofhZ1KK1c7DCEBuZqXhtF99dQW2S2qKYHZIQPWNEBgDwj++iIS9/dqUNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <35f9e529-35b9-0432-8e98-8b0100953856@suse.com>
Date: Thu, 8 Dec 2022 16:34:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 1/2] x86/ucode: allow cpu_request_microcode() to skip
 memory allocation
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Sergey Dyasli <sergey.dyasli@citrix.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20221208132639.29942-1-sergey.dyasli@citrix.com>
 <c6676171-8cab-dfbc-4b18-d9c724588398@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c6676171-8cab-dfbc-4b18-d9c724588398@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0150.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8231:EE_
X-MS-Office365-Filtering-Correlation-Id: b05f3d94-6a09-4df1-e056-08dad931b0b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	F1Ej91RE5xRB4C8hPaXOXI1/OOotzXHD4pENXLyI6Ae0PCN2rCohkPVgCnxtUAUYVmv1OIjfLNVgzN3NF2BlA2BLvqWfKGA5jY2YLFtAPVyUq5X+9RwVe5s+aglqBGlIBjnfOug/RpKw+1CjcqS5WhiGtc/77AsdEaHLS7bdrqf1gbzFLylZ8dytqz2+Vi1FT7Doc/s4n1O7E1BL01oZzKX2XTzSkhyKa+6hEDQa/URHAoYX0qzv4WcKlqZOCBXUczJ/+QoT6qzu14kJpGExZVHLPt7ng/4NEhfEbeMBvO9yIjpaBo2ebB6Yp1p1pi7fNDzhsbRvx71rrHrReUEl+QSWFdUM02ZMEuP6p60XDqhTdLQlwV+YUCFxyfi4CM0H6UaoBN1JfEGDNXzhOxD+2tX1Fs+GsiceKY3nogSSjK9lMNGZ10eIiWHidbnr8wD0WUD8Yf65f/ZS6s1ZqB51vWTpKWZKJEpOdQg48xxASLWtgL7SIVdwnY98ijqgeBpVV6me3drSPPcMziHPSJc2wCD7kS1aMND+bC4HA0wySIvGCq6wMVDSYoioDBAQYHLe00xVDDR/OXW61dYPbfdshZvFZ14Ajzi+svlJH4StIGdwKFQ0pRIj4M7qvmKHhaiN8rVBQ+C5qD8BbaNENWFAL5V6YAeTCERoon0gwD5KVskxocQLQh9mGH8moOojK1fWN2GCZCY58PFdNnMj8knDWGSEwfHCFiwTr49hUTWQbbk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(346002)(396003)(136003)(376002)(39860400002)(451199015)(36756003)(6506007)(6486002)(31696002)(53546011)(86362001)(478600001)(316002)(66556008)(4326008)(2906002)(110136005)(54906003)(41300700001)(66476007)(8676002)(66946007)(8936002)(6512007)(38100700002)(186003)(2616005)(26005)(83380400001)(5660300002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?KzhxYXhYcmQvOUtscE5GbzJ2aW1HTDRmT1h2Z09ad0gvMElWdkdMOGNvTzJK?=
 =?utf-8?B?ODhBN3JZK2dhUlRNdVc5Wk00L29JOEpYcHVDRExjWUpLVDNKTGhWaE4rR2xR?=
 =?utf-8?B?NkdqUmhKNG1NUjVRUGFVSW15T0tURUJZd1R6aUY3K21OY3JoQ0E2cEEraytB?=
 =?utf-8?B?QWgyZXdFZVJHc3o4VE9PL3ZpRlpkNzR0MGxuRGpIS2Z2SUNsTWh6Y1NmUzVz?=
 =?utf-8?B?d09CaUEwcGVLcnZFbGtkY2prc3Z0UWFGYUFNblBVMEJONmhMQm5RemRKeTd3?=
 =?utf-8?B?d21aamZKVXdEYVFVS0xnLzAzZmN2QTIzYmJIMzVzOEhiRkxteTBwalhYWUlQ?=
 =?utf-8?B?ZkF1eVNsaVFVcjZyeVcyUmU2cVcyVGdPZHFWV0p2UE5UK1ExUmFNRkZvNWgv?=
 =?utf-8?B?OFVNMFBKbE9LNm1pNloxWUhMaUJuUGprTDJybi9LdFcwOHBzUkdMdHJ0UEtz?=
 =?utf-8?B?WnoweFRrdVRsRUk1bDNGdXJZZjQ4ajUxVm5SdHlLMWw5U25zQThwSXBkZW5u?=
 =?utf-8?B?RXJGSGJmYkorVGRNVk8wSmFJZnV1dGhlUWFDOXJBSWZ2aFArcGRhcGRzMHZk?=
 =?utf-8?B?cDBkdjh0N1c4cndoNnJGUUFINW1zSGxUaFpwQjBNNU9URnMvb0ZJUW5QNWFC?=
 =?utf-8?B?ei9mNzZpeUV4L0E4VWtCTUp0MFM3blNMVTJrMDA3RzRoVitjdEpwWTZoRW9R?=
 =?utf-8?B?bEdVZ2d0WVBVVkh0QUt6UW5rNEZCU1U3WDJKSHQ0Z2hUaGp4S2hDUktYcFRS?=
 =?utf-8?B?VzJ6dDBJVmNyenJVazlNZW9OTEU5VTBVbFpCcWVNK2dLT200L1QyVlJVVmQx?=
 =?utf-8?B?SWVGNkYvVWF4YVBDdVRWNzZNYmZSa3VWWEgwT05yZ2lKSlQvVmNaNjk4YnhW?=
 =?utf-8?B?NGFFM2swYjJHc2NOcWF5N0k5V0ZsSFA3QzAzbjQ4UFVKdnRJOVM3UE93dGZX?=
 =?utf-8?B?YVVYSUsrZkFUMEE2eHBHSk9ETkhLUWp1blloMDhDNko2ejh1b0tKeUVkeEhZ?=
 =?utf-8?B?a1VKU0xncHZocHpxeVJURDIwUEp3a1VmcFVzL2dtb0U2d2ZFREdDdXUvNDlJ?=
 =?utf-8?B?TTlOc0loRU04cktmRktYTEFTNzRySytPclJkUU0xT0RQNS9laHdhSVZudlMy?=
 =?utf-8?B?aVU1VGJWcHNFem90UXpaSnRsbGc2TVBzN2Mya1lSb29VbU82Szhhc3lwRDVI?=
 =?utf-8?B?ZTlReHBNU2Y4ZjUvbENVZUpCRW5VS2VLV0VyM2oreHExRTJJR0Q2dHFYSk1m?=
 =?utf-8?B?dDdpdndpcE4rUmZza2Q3ZFo2by9MU0d2d0IvV3JNdnpSMzVTZWlCNkdpWXFQ?=
 =?utf-8?B?Y2dIWlZOMkZuUU1DUmpZM2VVVHUzVS83SG0yRy8zbHBnMThBSUZXT1V5b0Nv?=
 =?utf-8?B?VEc4dUozbjFUSjRmVmJPVnc3SWNjMXFqcFo1QVhSM1IxUVk0VlJXT1ZHVGJi?=
 =?utf-8?B?T29SeDBpcnVRMXF1b0htV3BGUlJ0QzZFOGw3MmNHZDJ5ZEZIT0NVdmlrWG16?=
 =?utf-8?B?bmlXYitIUVFGTnN5aU1nb2ZXK2I4Ymxoa2wzUG1TY09GQ1VPQTFQSEhlNURP?=
 =?utf-8?B?UHZiSnkxVC9sL2h2a3Rvc28wVjNiRWcvNm5rMVkzV2g4S2FiWG1nd3VXT3FY?=
 =?utf-8?B?Y1lMZ3M2M2dzZ2NqRi92NTJiTEJLOHU3aTBkZkxQOHJFU0hLTDBxWnhwUmI3?=
 =?utf-8?B?ZS9sQlJ0YnVkWFRIekk2bndwdTQ0VlppcFRoZjhxWHFVZXd1eE9HMDNPMVpv?=
 =?utf-8?B?Z3hYT3B4aFBwVmdKa2VvbEFPN2tYVFpyMXBwVTl6N2ZxQW1VdUE2WnpkV3RL?=
 =?utf-8?B?bjZWOWlnTVp2SC9oOWpRN2tLQWhNU2NEVjd5QmdtZmVSYlVjTFBLdXVWaUF3?=
 =?utf-8?B?amYrVG5tcEN6UFUvdnFpMWZNWldJM1JDekhTWnBwMEthZGxuL2Zua0d1RmM0?=
 =?utf-8?B?aEhmME5MZHMzT3VlYTVORWRSN05LKzZtdTVhMHJKcnprVjlXMDhqUUZOOHJH?=
 =?utf-8?B?d3dxb3J0ZzJENVp6Zzk5dTJQYmFkQzFTU0FBME1jQW02UWJNZnBDLzBudDF5?=
 =?utf-8?B?end5VmFuYzRNZUJJTXFZNG1NbENCaERFR282VXU4dGJtTzVuOTZ6MnMvNXBx?=
 =?utf-8?Q?z79qtYgvGKcNgBQtX1d6FKted?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b05f3d94-6a09-4df1-e056-08dad931b0b2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2022 15:34:26.9202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Lo1TZIiuKfr3mCLIApjCfyJX7aGYOMCEAscSVSur8aWEb7v4iynCW8KI7TAZo5fTnJF9GU5u5UOiZFpO6XiYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8231

On 08.12.2022 14:59, Andrew Cooper wrote:
> On 08/12/2022 13:26, Sergey Dyasli wrote:
>> @@ -240,20 +240,20 @@ static const struct microcode_patch *nmi_patch = ZERO_BLOCK_PTR;
>>   * patch is found and an error occurs during the parsing process. Otherwise
>>   * return NULL.
>>   */
>> -static struct microcode_patch *parse_blob(const char *buf, size_t len)
>> +static const struct microcode_patch *parse_blob(const char *buf, size_t len)
>>  {
>>      alternative_vcall(ucode_ops.collect_cpu_info);
>>  
>> -    return alternative_call(ucode_ops.cpu_request_microcode, buf, len);
>> +    return alternative_call(ucode_ops.cpu_request_microcode, buf, len, true);
>>  }
>>  
>> -static void microcode_free_patch(struct microcode_patch *patch)
>> +static void microcode_free_patch(const struct microcode_patch *patch)
>>  {
>> -    xfree(patch);
>> +    xfree((void *)patch);
> 
> This hunk demonstrates why the hook wants to return a non-const
> pointer.  Keeping it non-const will shrink this patch quite a bit.

Alternatively it demonstrates why xfree() should take const void *,
just like e.g. unmap_domain_page() or vunmap() already do. We've
talked about this before, and the argument hasn't changed: Neither
unmapping nor freeing really alters the contents of the pointed to
area from the perspective of the caller, as the contents simply
disappears altogether.

Jan

