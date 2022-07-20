Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DF857B2D3
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jul 2022 10:24:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.371467.603400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oE50N-0001e2-L1; Wed, 20 Jul 2022 08:24:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 371467.603400; Wed, 20 Jul 2022 08:24:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oE50N-0001bf-HE; Wed, 20 Jul 2022 08:24:27 +0000
Received: by outflank-mailman (input) for mailman id 371467;
 Wed, 20 Jul 2022 08:24:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H1QO=XZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oE50L-0001bZ-Hm
 for xen-devel@lists.xenproject.org; Wed, 20 Jul 2022 08:24:25 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2052.outbound.protection.outlook.com [40.107.21.52])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5cb57feb-0805-11ed-bd2d-47488cf2e6aa;
 Wed, 20 Jul 2022 10:24:24 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by HE1PR0401MB2571.eurprd04.prod.outlook.com (2603:10a6:3:84::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Wed, 20 Jul
 2022 08:24:22 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5438.023; Wed, 20 Jul 2022
 08:24:22 +0000
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
X-Inumbo-ID: 5cb57feb-0805-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jl7SWrSZSLCOUoM1ApnEPVcrLS2B4Ezim5LhvDhRPtIKg2jU864P+SqL7J1EEBv2M/RwWq55SXh0XoO09YhzY1smzhf4YcpscSvgFglaP4iLsLe0PIMyP28DAw4Tnr6TuhPtffG6PLzQJkgkaW9yt+pI9qwOdCOu7fL/YTOxT2Y+OHqT+dag26XCPXVl6+W5PEblSRffCuUIbb4FlYm4MDxDDRHfxSeMojhmr/tmVbRQ0ghnSES72xfpj+VCYTBzE9upSoEpKwZldMblp5w1x/JnCa0Yia+8fhVq9hJRLFMKUWqZa4EDJNkQJb7ZsGMeuqClAm/vRL9KyrHwQtmpEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xzmXbFtmrfDRl7nxXTjKH0Kaa4+gTp7pyd6cPEpRONA=;
 b=a6VvRpmdkG6jgaKpp5WtoLVTjKMbNVbaO7q0TvmDmVlDB+nIteYnYUhRf+Z73JJJmAv7VLOI10OiF3WLk50wA0tyUGYYnFgVZ5bLh+DU0GDkJDIq+Z2NPGHJHxdmXKupRKdMl9SWQU2L4MzAvGqfafLownAQn+CcoSY1Q9arZydD35PGg4K+2vTk7kFbPh95T31uORPtK792YqdENkpTSS9I0FTuZaT3FqnxnZvyK37SCfCOZWB+Lb5nvbUFsxIkfkNCU0EBjrgFI0HVdIPDJCPzB4rm2/6FxInMErPYzJql7XxShWDeYqqHzVGEqB6ueiB2WrUILyG05e0yxMENNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xzmXbFtmrfDRl7nxXTjKH0Kaa4+gTp7pyd6cPEpRONA=;
 b=XQFkB89Z7rArujs5mhSFYzsQUc1u+TqYRQ4ql24Irdc1NeRnyIgiM8FSuW7p9T66T7m/2F37oVYY1mtTBMVY9VeqCOWQRUDYGAH27ITvU8ZmxFAIh4iJh3J8oKmonAhKW7mCkeR+xvprqeN6IFrfWpyavdHgpo3n5OUpJM76K59yHNri7P6uuZdbZV85bH6RPzUkuoObPhudwMCsUvX2A8jQwsRfr3KmqCjFv4Vtz34VKh6oFYCnS4pZ69xsnp3tYnX1pvhm/DuZFgW8Q8/+C/yS0nOehVYmL8TCMQhTxfkRnSqzZSt1C17r4bNEfss6vilehLx5HBlosSuhrrR37w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <da21eb01-5262-5a23-2857-88f72ed9d72b@suse.com>
Date: Wed, 20 Jul 2022 10:24:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] xen/mem_sharing: support forks with active vPMU state
Content-Language: en-US
To: Tamas K Lengyel <tamas.lengyel@intel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <4f3ff38d8226d10dab3440f020c9ba7f07cab1fd.1658250756.git.tamas.lengyel@intel.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4f3ff38d8226d10dab3440f020c9ba7f07cab1fd.1658250756.git.tamas.lengyel@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0083.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: efde0002-63d9-4cc0-d352-08da6a293fc1
X-MS-TrafficTypeDiagnostic: HE1PR0401MB2571:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	u5eXLbaUXLm1T4r0NZvytqJO03KJSmNYY0IHzrj4haDjqnObeghRummlOw8Sea3lf2B78SRdtRLxxV5InpFJn5KuH8C6PhBX0IZjNo37Vp9IQA5i6FQMQDKNdekMz8KmEZKnK/HBb5bFb8C1zJnzlA8IrP4YXqPB7C+Bjw2WMjVr+JZOGafhYJ2B4qkWLWg3FBk+H+gcz46btGafoq7N29UXP7O2QiM/TUATbBAmgqM+UKYc8vv9YN/kIMAD0u5/POMT76ACOlvOQAKIbXVrBUw4mMDL40H4KbwHSwXefLvNHrF7WcdBx8+AL/M2kr8z0oPM5F3CnmL1bs2olFMchNNQvOj2381K1opF7B+WT0EC3EFBuBc3YFApOHAcld4gVNtpxWUOEkooGufmyvGCDYTqUPWOgFpvTQTQHFhfj1egJlJO8cRaYUQxi3XOC6NMoGKznP7f51caIreST5h7DSeztTpFsx+JEJn9jYJ22KB8yu1dauNUg5HTxjaZZW+w+JfBM6w032N1r0x6hX65uLwOrV/i9YV7Hiy7O0CApAP4UDbKnV5NLt6+TQrIt2bIbDaW8Mxixk/1TGzBV1JsPVdN7BWReqyPNsnLSCW7/wWyhUmOpBlCwiVY6mmLz+G4bBPCyDg3Khb5wBvB9R0j3Ajc4fsK4jT2/tFlCmxtu+lnVH4b+2CH8wcSA2jPuXGzPDueV2DqVQleZvDr6pPcdeiNguC1ektsnltNjR2D39i30djMTndad1rLQ7FyK/mG4JCa9x7pEbS6a4Knymy9PycuP4S20TwVk51BHxTltewLOROSr0RF+l4XwaKAaxbRf8N93dTe8lT9xzcDdX1vcQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(39860400002)(346002)(376002)(136003)(6506007)(4744005)(31686004)(53546011)(41300700001)(26005)(5660300002)(186003)(6512007)(2616005)(6486002)(478600001)(316002)(8936002)(8676002)(54906003)(4326008)(66556008)(6916009)(66946007)(66476007)(38100700002)(2906002)(31696002)(86362001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0xZclJCLzFxN0JISWNBdjVDM3RBZHJrUVlHRlhTdEZZdjhJeVpjdVR0MlB2?=
 =?utf-8?B?MkNFRVVLaVBLc3JMbXo4VEQ0TDkvblZFSWV0MlBGemd4UWo0TE9wVFE4K1lN?=
 =?utf-8?B?dTZvcDJTTjVZMC8zS21BUFp1Zm5tejVZMS9odFA3TGkwdndJaFdkRU11a1dD?=
 =?utf-8?B?YzBUTjFXY3huSnVwQ0pJSEtsaytaRGV4RVlBNDVpOTJXbWlseGY3U2ZjcTVR?=
 =?utf-8?B?TVB0ZVlJVlNONERoRkFMcUsxVytVYUlNckhCeXRvSVorUnNKSzdGb0dtMWpC?=
 =?utf-8?B?Sk55dzdTbGZOQnZ6aXBWdnF6Q1hiZTFQcldEaWZpSE0raVZqcnN0OFgrbFdG?=
 =?utf-8?B?aGVYM3NIOGN6TmJiQzJrNVNFUDF3azdWa1ZUaytGdlRNVUUxTHdFa0E3WUZn?=
 =?utf-8?B?NXFHbkNHWDczSlQ3dkhkbVZ0empMYmRPelM5R3FuNWQwWGt2Y2ZoUHNsZ0tt?=
 =?utf-8?B?VTNqU0ZFR2dKL01jaWhoUDJUWm5BMnlCR2hRZE8wS2Y3MFV3QUNBYUswM1JV?=
 =?utf-8?B?cVBVVHVTWmd2NlhVNFFnSzh1WndlOGh1RjNwMk9vekVFY1I5OHk4ZEJLQXlX?=
 =?utf-8?B?K3lVYUMwbWxtb1YxbDB1L1o5V1p4WmY2NTNiRURyc1ZoUFRaNjB3WEozK3pl?=
 =?utf-8?B?YUJ4VE5WV0pEY1dsRHNZcU9kd0wvZ2JoL3JwM3dWSGNZOWJ4UHZ6bit3WE9n?=
 =?utf-8?B?VFVGc0l0ZXM1aXdLR1p5cUtkazBRaDE4MFc5VExtOEMvejVhUGhUT21XR3lM?=
 =?utf-8?B?ZTc0S1p5eldwVkloL1Z1d1YzYjk0TVRQSU5VUFM0YmRDV1p2eGUyMGhvR203?=
 =?utf-8?B?c0xUb3hKd2FqU25pOFdyZUY2QTd0MXhmSnZZWDdXQVRGVUhzaXcwTlJRY09w?=
 =?utf-8?B?UkZTMEZ1cW9pemdMeEc2all3bWZNNGpNVkgzNy9WSXNHcDVBY2ROZG1aR3F5?=
 =?utf-8?B?RXp2OTJXbkY5clFHYll1WkxBS3VMbFoxMHhvV2I1UXNNejdNS0lQbmZsUkw1?=
 =?utf-8?B?anNadE84THQ4S2QzUTZCL0JFTWJiNjUwS29zZzIxOEJkeGN5dEhqTFZlcS9o?=
 =?utf-8?B?UkRRNmZkSFo3TGR5U3psN0txM3BhUU1lS2NKUWpUVFZVSFVVdG01RTV4WFJH?=
 =?utf-8?B?dDRsWWpIWlhZeWFIYjc1dUZoWDgyS0krV002V0VMbEpPTVZXR2cxNDFDVEds?=
 =?utf-8?B?ZG1BL1M3bXR0dGM5TmYyV3ZyaEtFcDhqMXVUMFRHendxSnFldHBiQnNMcUNv?=
 =?utf-8?B?Vm1TSTh6MDBVdERvd2ZUVjBkYjIzVFAvYVNiZFhFYjhXYWQ2UThzaU1yZ0Mr?=
 =?utf-8?B?eHNmQktsVlNGb2FITytKRGdmeitqTFliaVFndWJzYUNZejdpN1c1bVZsK0k2?=
 =?utf-8?B?dE9HZXo5Z1c5RXJIQUh6TWJobVhwM1ViSURVUzRIUkd4TjFDeTJCSUsxNjNv?=
 =?utf-8?B?WGtKa3pzNnFaY2NqbCsvZTJLaFk1Y0IzWVBXYXArcFdFb0tmdFZhNC95akFH?=
 =?utf-8?B?VUF4ZFM4aGhoeXBSVWZseEM4TFhhc1NSM0xORVhZQ210KzVzOThrMTFTQWk2?=
 =?utf-8?B?SWxweXkxWU5ySzkwK2ZRUWd2aVI0RVM5dkd2NklUTjdXQTFtU2tpTDMxSjRu?=
 =?utf-8?B?RGxHdUxvSzY0UDcxWFBzSWRWR1pWUnloekVac1dGMWNTdmFPajMvZmxITk54?=
 =?utf-8?B?cHJXaTVvZnpsck50YnliQVVWY2kvMk5hV3Q3WW9DNUwwUUFKd0I4QmNHbFEr?=
 =?utf-8?B?QkY0WEgvUFdxeXJVQWVXMG9SeEs2K2NsODVmMXRYMjl6NHRPY2RtVnBPVGZO?=
 =?utf-8?B?ZWlpczJ6Ykh4YkoxMEJoaEZ3UnNPa1R2MXh3ck5YbGI3RmRPYmtvZ09udnNF?=
 =?utf-8?B?aTkwUTJ6RnVoUUtSYmd4Q3BINzJaRjh5OW1tdDlVbTRXeWlrSkZzTDdZTTVP?=
 =?utf-8?B?VFMvaW5NQU1iUDFSd0NRQmdsSEx5c093K3NmU01nZGVKem1pNEI5WUZ6OTRY?=
 =?utf-8?B?ZlBVcmo1SjRIQWJxaHVYL25SbnpmTnh2TWgyeTRVUDczTnFENitzanRvNXdz?=
 =?utf-8?B?NDJHVmdKSWw5dytCTUFTLzY3YlRHU2JLTTZRMnp4dVZ0ZzRVVVM4N0tvSkp2?=
 =?utf-8?Q?mVs4Rcvobcm6S3e+fLtR94kJz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efde0002-63d9-4cc0-d352-08da6a293fc1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2022 08:24:22.2998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dhu489rwRDk+a7YIdBanPy33OUpW46JHHhZemlELztQrIvghJuzp4MzkuEa3dT5vu0CYq24WGsQqfIWpxdH7og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2571

On 19.07.2022 19:18, Tamas K Lengyel wrote:
> --- a/xen/arch/x86/include/asm/vpmu.h
> +++ b/xen/arch/x86/include/asm/vpmu.h
> @@ -40,6 +40,7 @@
>  /* Arch specific operations shared by all vpmus */
>  struct arch_vpmu_ops {
>      int (*initialise)(struct vcpu *v);
> +    int (*allocate_context)(struct vcpu *v);

I think this hook would best be compiled out when !MEM_SHARING, even
more so when it can be left with NULL in it.

Jan

