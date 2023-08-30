Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9814E78D3DA
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 10:07:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592765.925585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbGEA-00071I-AV; Wed, 30 Aug 2023 08:07:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592765.925585; Wed, 30 Aug 2023 08:07:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbGEA-0006z6-5a; Wed, 30 Aug 2023 08:07:02 +0000
Received: by outflank-mailman (input) for mailman id 592765;
 Wed, 30 Aug 2023 08:07:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a0OZ=EP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qbGE8-0006z0-K3
 for xen-devel@lists.xenproject.org; Wed, 30 Aug 2023 08:07:00 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061a.outbound.protection.outlook.com
 [2a01:111:f400:7d00::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31832649-470c-11ee-8783-cb3800f73035;
 Wed, 30 Aug 2023 10:06:59 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Wed, 30 Aug
 2023 08:06:57 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.035; Wed, 30 Aug 2023
 08:06:57 +0000
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
X-Inumbo-ID: 31832649-470c-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XN38bgQuFGsarHnY4+RqudSiiH2c6MhjlS+xAfn2niOPlkR20zWpcIiim0e78y4uQqXmKfcgMVu/W2yw/wFttpxgM+q7vJliqQu3OEiCrXCk/DJbL85FrFfphIGXqkFEuWSiplyTp51xM2ufvVClYv9XcCfd5UTrz/QK4ixD9p+x0LYiLngPWfdrjRE2DrIWYNL+UXokX+WrPn02A8TJGDA6t2axIh7P6chIzY124Xkg9iCpQo5wLmzKHnGgjx+WukkXjCNb51zbmRbA2OhyrADHjSju6wuHqHi9kzMew1hwRipQHl3QCAsf1BUxhpX6elnqRwgDN+t/OIOKuF4rOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/bBeL/nOndtaShgxN6T3MpyxzG/TyVd+h3uskelP9Qs=;
 b=nJv2EcDE6ih/WDB3CilceC2AYmYjwfEbfjxGBvEJ6aI040jfZgEfNBeB2NrxfRHTXlEuNGvjMHHj3S3alM9LqxUERKEmuaht6e3h+Blzs/JLOw7dGh85jqwQ6j1OIXYoxtb9zKUPw6QFlP8wTeljCbCCLaVSYzGE6fT03j5/gMi8REHTKv3ZFcvWXyzq4LNTUbex4SP9ZYT3qHNOTcvA964OcozZmdyUrv41bhO5EGrnAmQFp/8ZoQa5yGCQMANghhREAHmU3B3gpnjN3/eUG+ESlx9eA2N59U5EhdhIA57Bnb5/nH4GQYhLSxawLyE0DmQ43HEydk3pr3mvG/2V2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/bBeL/nOndtaShgxN6T3MpyxzG/TyVd+h3uskelP9Qs=;
 b=k5Z24SZNNnmFCvRQQgyzWn9YJENS4nlijPc+HzWsslKyvj+LMl4Ipmx4Uj2VdKjh5hfJ5FwI/Yt4ravrS7oWC5TFfgMAoxLNoKPXz3wzpB7PeM0Sp/z1NoRMeZ0jrnABFc5Oilhg0vnWUCOVhahQi7qEn1+XY9Wmm8m2+fVmqVYzueq6AkYuJjuuNDDRYizAkpLdqkx7bvcovrGCzQB8mDn25qHeL9Kah4U4lRatR+EgNdr6ATb+AUU7++bTLCBhBIUjDVGMm1ei15mJal5g4irNcPF6eMd6cxDag1RSOkT/1lcmAkeeBHi2214Sz4hRLOiFvF08rWPn3DpipnXSvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6001b2db-e3ee-7faa-7301-37d4ea8bb4aa@suse.com>
Date: Wed, 30 Aug 2023 10:06:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] docs/misra: add 14.3 and 14.4
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "julien@xen.org" <julien@xen.org>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "nicola.vetrini@bugseng.com" <nicola.vetrini@bugseng.com>,
 "roberto.bagnara@bugseng.com" <roberto.bagnara@bugseng.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>
References: <20230830005950.305085-1-sstabellini@kernel.org>
 <C2070A06-265A-48EC-9A67-34D820B2F94E@arm.com>
 <15551c77-95fa-7c7d-6b6b-d5c42a38caac@suse.com>
 <64ACA853-E0D3-4B56-B79B-C31BF692A936@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <64ACA853-E0D3-4B56-B79B-C31BF692A936@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0055.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8459:EE_
X-MS-Office365-Filtering-Correlation-Id: 68f44633-2dee-4140-f3aa-08dba930148f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5ltql3/F1JnynJmp2I7hgbI5+Lk03ULCKK3OoaL9rdAQrZVJPsu5LZ6Lp3KTqEmUoExpbGyw2uVOVMrsVfceMrLeosCPosU3xjpKqCS3bdt5qSCcA53g68ho9P2Y03ItV6kYP3UCJ4gWRIDXbnaeIyKI0wO9B8+rTkL9F0/ndrfg3izc30GbdGupLDFGK2Zk9rFG9NTU5qdhLKiQP4EzNLMHDb7UI9Uburqo6YpW/FXDDMkFFa1ynJ1hEIr6V/lyPJXHJQgRzsjXfFygHyORmpvfwdmEvsWLTykAac+UUhoKJergM/GIW1PUu/F0uIOV5e4gRy5WA4qerUizhpul9BcuP+7SICFTRH0LCPJnlAgsNwMpvOHNarlhzFngCI2R+BglKz4OIOB6jGIWuQ+ziU4LqGfEmAZaSNOYvEZc7WKTrmWFAmaVCw3PNThkBQNBkPFm3Ch0ZU5OuZMP+lGWdmOKW2UcDX7hoXPFYuYsbhQ4kpXBkqNDjGelFhiH4k6F/Xb2Jbj7sD8NynYeTfMfiNNgxYUKjujMWzB8n46xx78g+qHMSdbfHO0X8Lm016qIu3lhGVX93EW9LdrBpq93i2fy9loInjbrxrbUoP2oj0ZcgcoEAe2t3St7V5jKsn9sxJk+oBbqDM6VTJR8Lf4rDw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(136003)(366004)(396003)(39860400002)(451199024)(1800799009)(186009)(5660300002)(316002)(7416002)(53546011)(54906003)(41300700001)(38100700002)(66556008)(110136005)(66476007)(66946007)(6512007)(478600001)(2906002)(4744005)(8676002)(4326008)(8936002)(31686004)(86362001)(6666004)(66899024)(6506007)(6486002)(2616005)(36756003)(26005)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eG02OGRkYXlKMXBISWV1a1J4WVI2RzA4QWMzS0RvdU1sYVo2Z0t1clpqTHNR?=
 =?utf-8?B?VFpHdVpWandsSmFMeGY5aHdFVjhFU0c3bE1NM3JITDlpVXpvaXo1disyUnl6?=
 =?utf-8?B?N2VlRUsrbDNlWkFiWUZGdmdiandLekVkWFdXbUtqanlRNCtuaUlmSjIwZTAx?=
 =?utf-8?B?cHlSNUJRd211blc1RVFXYWZBM1RvOStVUTBycTNRbVNHNU93aDZWTWZLcEVX?=
 =?utf-8?B?OTBQWktUN0Y4ZGR6YjdOU3hmTVdZa0tuRDRad0RZaUUzbFFsNGFxRnFidERv?=
 =?utf-8?B?K1l6VlZRaE00Q1FoN0ZhL3MwRy9tMDJhcms0dHlmMUliREpkL2pyT0J3Mzls?=
 =?utf-8?B?U0VvQ3g5UEhUSEoyZW43WGhYUU9BOTFPRmU5OUd3enNqSjk1VzNRTXRwWE1D?=
 =?utf-8?B?eVJoUWJIOE4wWDc1NzZYanNOeGhmSVJxRkNSOFBqNnpydWNTNzZOSjNYZ2Uz?=
 =?utf-8?B?d3hGVklOV2dOdUhSRVVmRkI1TDhsajdjdEZGaEIzM2FwWnVKb3BOMzVjMUZl?=
 =?utf-8?B?NVB5YjRZYUJqS2VkTm5yanRTR3FPSThwRVpCSEN5QzJsQjNmLzl5QndaU1lK?=
 =?utf-8?B?eEVyVTdPSUliTmRnQUFpbjA3MFdleHhrSmdPNXhSdWZrallYbUFYeW9zUXlD?=
 =?utf-8?B?Z0xjRmM0bEgvaTZTNE5MU1JHZWdjWXI0dHJKZ1hXMFFUU2x6OXZqb3ZQV0pN?=
 =?utf-8?B?YVFIZUFVa1hXQVBzVGlKY2lZL2RKNkl5Vng2Y3hFME1henBoZEltUU5iSFlU?=
 =?utf-8?B?OXdEVkIwL2ZML3QycDVWUklFa2dVeDN2UTIyeEZMQVpFdUtGYW0zUldXMHdH?=
 =?utf-8?B?Vk5UNTZXQ01rOSs4Vm9HUXlFZzFkNHdndmdzcU8rRG9FOW5qNzNkOUZLVzQz?=
 =?utf-8?B?bm9hdTJZT29YUitYS2VqL1RmUmFRYVV5b1FHRXllTjlaNXRJT08zQ3A0akZh?=
 =?utf-8?B?ZFZMMXZVWUIxdmlDZVVkdGlzY0NxZTVkNGptb2tnVng0S1NWd3VEMnhyNXdG?=
 =?utf-8?B?OUhzNit2VUh4VVNKWWFVS2Q1UmYyMFAvd1RaSWJ3bFRONDVYVjFBbkNKTkJX?=
 =?utf-8?B?SldxdXhWZno0R2ltNnZzMXpOSVNxYUI2NVBac0RNcFdiTGllZzRzS0hmc3M0?=
 =?utf-8?B?bTlzOE04VnF4Wnp1S2k1UmN1aUF3Wms1NklzaDhhelY5c2VPWkhGMGdjako3?=
 =?utf-8?B?ejhZTjlEUk9LTDdQNHVra0U2KzJ2QkdPMk5MSVBsaVhTc1JCNjludG03aGJR?=
 =?utf-8?B?eGtCN1VNa1pkL2tOdWZMQmFScmo0OTd4UDVoNlZVRHQwYXZmNjJ6aHdpWnV0?=
 =?utf-8?B?dE53V3F1VXp5YXNXRmFTYXZ5UTc2WnpkVmhFUENoMytZaHM2TmhFQVk4bTA5?=
 =?utf-8?B?QW5GS0tnNlhlVnF5YVVSZCt5VURzc2tFWDAreENEcHAxbTNvY2VFUGE1VS94?=
 =?utf-8?B?VXVVMUwrNmI5b3NiZ1RCVzVJSk93UUJOQjV4MnNoVityeUg4eXEyWmhUcndq?=
 =?utf-8?B?YjhKN3NvUFIrS0hwdk5Uc3hXVXBjckgrZVg1amJxcndtSUtyNjdTYUtPYzU3?=
 =?utf-8?B?S0xrMHNSQWI1Zzg2QStIaDFFdzVKTU5QMXJyWjYzYUdaVUtXdHRoMFFUbmFp?=
 =?utf-8?B?TkthTEtPaFV3U2RtOXV6TXRNYTJNZ3NBQlZVKzNRTXpkYTUxbTVhMXJjNXZp?=
 =?utf-8?B?Qnk4cjZRSFFRNkVkNklYRzZBL3RHSm1pZE5jVkZYWG0wdkpKTjFOeCttK1g4?=
 =?utf-8?B?TUhhaERITjlGYzdwWHpISlcxMHprdkJwVHV0b2ZDTlFOYmJ2MlRmUWlLb014?=
 =?utf-8?B?K1NwMmdqNzcybnFFTng1YXFNcFNjbnkwWkFCWlBwemNxYXp5UWlSL2xUUm1l?=
 =?utf-8?B?Z1dQWjRPMG5yaGxjYzUrajVmMmNxZXNLTUlMeWIrOHphYUkzQklyN0pydkM1?=
 =?utf-8?B?ZDNGa1EwenBBZzVvcjFCTzRpeXVUTThsdEtHdjFBVHZoSDZ2cTRPUDRBSlJ1?=
 =?utf-8?B?L1hjUXR2bGJkT3JWQS9JUUpLVDZsclBtYVZvbHJBVGlhaHBtSGo5Ump5WGVh?=
 =?utf-8?B?VzA3dGZVeXcrNFR3TFhiQUZiWDUzUDFoMHIwY1BkVFJOYlQrR094U0NsY2lF?=
 =?utf-8?Q?wlBF+YM5spL5+lzr3coEdu/Mg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68f44633-2dee-4140-f3aa-08dba930148f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 08:06:57.2634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GMSBecVxu742HRa+kb9Z4tTja0c8XCOu3n4XdnW9P03dqHsWiF7j9CcgSb0LVZ7M2c3BF9whdp3LuEcQoEKBRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8459

On 30.08.2023 10:00, Bertrand Marquis wrote:
> Hi,
> 
>> On 30 Aug 2023, at 09:58, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 30.08.2023 09:54, Bertrand Marquis wrote:
>>>> On 30 Aug 2023, at 02:59, Stefano Stabellini <sstabellini@kernel.org> wrote:
>>>> +   * - `Rule 14.4 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_14_04.c>`_
>>>> +     - Required
>>>> +     - The controlling expression of an if statement and the controlling
>>>> +       expression of an iteration-statement shall have essentially
>>>> +       Boolean type
>>>> +     - Implicit conversions of integers, pointers, and chars to boolean
>>>> +       are allowed
>>>
>>> I am a bit wondering here what is remaining after this deviation.
>>
>> Hmm, good point - floating point (and alike) types, which we don't use anyway.
> 
> So we accept the rule but we deviate all cases that would apply.
> I do not think we should do that.

Right; Stefano - I withdraw my offer to ack a 14.4-only patch.

Jan

