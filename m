Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEC0758DAC
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 08:21:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565587.883848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM0YQ-0006Vm-Hx; Wed, 19 Jul 2023 06:20:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565587.883848; Wed, 19 Jul 2023 06:20:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM0YQ-0006T1-F6; Wed, 19 Jul 2023 06:20:54 +0000
Received: by outflank-mailman (input) for mailman id 565587;
 Wed, 19 Jul 2023 06:20:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qM0YO-0006Sv-VF
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 06:20:52 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on20619.outbound.protection.outlook.com
 [2a01:111:f400:fe1b::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 684f8266-25fc-11ee-b23a-6b7b168915f2;
 Wed, 19 Jul 2023 08:20:51 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB9571.eurprd04.prod.outlook.com (2603:10a6:102:24e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Wed, 19 Jul
 2023 06:20:49 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 06:20:49 +0000
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
X-Inumbo-ID: 684f8266-25fc-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LODy5CiWCDQFvStmfkiED9t7ohMKgyzafUqTF5oMaON2w4536gUTE2OB9Jr9zbZXwYNSg9++7HUWg+0MHKL4URV68lbIQ1TsPjOZeJxQ6UzRHY6LOahAcDosWG5kSFhlgRPAyoHdAgZqzvYaER8qxKoWELwy8UG3iT3EZEtahFGtk6OmPUACazEKXso6OTFIw/cp4Ue+e2erXvtZhwGr9oKyDmDoVGBUN5bZpncixRqZPcVXCCwFU6k4YlHYPdvmraqAKjT6wLRHJ9KV8HfWQgFRf0fPZRCV6T1jxwVfkocASPP3cAcalAHHXsaFhXWLuBZQvdXpe+qfQ0/ydmeEug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YUSCWpDXcVPScQSMRPKosNRXK8r1O3dIvtD0aGktKWI=;
 b=NifN0BL6CmX2SWrurHxu8raX6tfa9MoqzC2zHtoRjf49UlReKxIajPrhkwp3jHlsqU8HUN0/gPhI6zKIt5BHnKKu3193T6geNpQjRy4KF3yNJc1LAKuPEERLsuVWIyHK17Ego9LgRzRKina/c0fs4K1a7RgEBHXl5+6Ew5h7gnZTRX5yG0wZMVn40St8U4jF/K5D9N64FRz+CcFDZeEMYLzGPXb+rD7xhzE/B77J5v4tdob89jGCqd0TInRhAfk69IxW/y8NElhb54RvagybUzOvUXpKSn8mDBvLkl1vsIotssdAEVYPJ1f2l0ykeeioLrDU70czHKZqM+y9TtI5cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YUSCWpDXcVPScQSMRPKosNRXK8r1O3dIvtD0aGktKWI=;
 b=GkQDjfURDzTEO6fa5wP3h+vKPyTuY1Ir2EdUMfvpAbb/XwLtWNBFVi8E/V1DV0hH4pfF2f1F4wdiFiwy2BhcE36CuJH2tbI+UBPmnl6idrz+G3udZDUDwB2VFHrD8ZNpRfx12QJ3mDvxMoMexcYjrXbeeDKtEqPnbAPb4bOH4no+tv5ppT/UrOexp29RPe+k7YV3WY34gNMCqzKVRzHBqYbjrDbwOwrRiCnLyTRsSdQTTe/IePEHGRyWQDch6GhYr0V9qZN31BuF1uotJ2WQYJallUGdoHhmUg1iaLiFVZDivZQtHzkZbnGZ2SZpumbplvWVg2L7yk1hpuj2XR3f0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <15a30769-4a61-ca22-7b5a-6249186cd8a2@suse.com>
Date: Wed, 19 Jul 2023 08:20:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH] x86/msr: Allow hardware domain to read package
 C-state residency counters
Content-Language: en-US
To: Simon Gaiser <simon@invisiblethingslab.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <946e5494801866c93332cc5d9ec0fa03a4df00d7.1689686046.git.simon@invisiblethingslab.com>
 <bfbffbaf-01e9-3b6d-a57b-d1702ee6cf7b@citrix.com>
 <60befe01-ab21-4e22-b601-c22a1e8b4ca9@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <60befe01-ab21-4e22-b601-c22a1e8b4ca9@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0023.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB9571:EE_
X-MS-Office365-Filtering-Correlation-Id: 34bc5013-5113-400f-f13a-08db88204b92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bxMkUEGjud+qVJE34VVsQPtPk0c1be1lKW4MVNVA5FMVyqKxDCqzxY+G9I01mJyto8stLsRZW9fURzsYJ4dWgIiQUrmAz9W4MvAyQuUFJtuQnSvntTltQ1Um/jLpRTC5G9dKqoVwxcdx0s0z0aJheggi+d3zdsvLRL2BtKoeER4JECunj7A/4Mvcoz6TZcUpkXM6GkYje62QhuPziKvshrTk/kae/yGnaU/XXV8gb27YlqApSTq5aGnZFkhebDMsRe3aPIYDpM1VJuuJKkwEo3in+Mz4PznX6DCSBZuq0wxiiPpanJwQTbtIjv8pJILwu+XTnXP/RBtbuy08OV/KjTz4C+dSZuGcBnYyHPN9c2qdIRjtCCSQL3iN5I1kDkFnfYyC5/Em8ojp0sk89fAbk9xVBY3k2jwJu0h9Q8UhK7UZZHw5dMT0w1o0tfDeocbBepnRIuQZu34+RIwPIQYlkjJuJnnCL6ukVJDFRk/PSnPkRnLaNLtLDZbpXJnJ57/mf73a4sKFLvecy7QAI9hiUx45+RXpkszIRoj/5R475L+TM5YRHqBMuPRYYOizZDOZwz8TJ2OAnRceAKBGsX7LEJ9d3EsCbc6S3h1h5fqZN75DhBQCvwl+j9X0fxepV7pgeZ5aWAO00zVM+Kq3ZYwdng==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(346002)(366004)(136003)(39860400002)(376002)(451199021)(54906003)(6486002)(38100700002)(6666004)(41300700001)(8676002)(8936002)(66556008)(478600001)(316002)(5660300002)(66946007)(66476007)(6916009)(4326008)(6512007)(186003)(83380400001)(2616005)(26005)(6506007)(53546011)(86362001)(31696002)(2906002)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zjh6ejhCcDg2VmNlSVBJekgxOTlBTjRsYVhTT0hFQlNqUEQxNDQrUk5veHM3?=
 =?utf-8?B?elIvSEJRZ2NCZkJVYTlQTGNUU1JpYXNVUDNlS0RLZSsrZEhRN1puNEVVUmx3?=
 =?utf-8?B?VTNpUGFjOFhSeXM5L3R3a2FPckdRNk1oUGNCaDZteGF5NVdBY0xmZ0Zsaytx?=
 =?utf-8?B?R0NiQ0FXYXBRK1dPUU0rbis1bXFYY2oyYUZPRVo2c1RzL1o0SFIyTzNzN1VD?=
 =?utf-8?B?cWFickRLQkppRWt4aFgyYm9nb3RiR0grOGszaVV0ZGlmVzVCMlJJeFVuWDJK?=
 =?utf-8?B?UmJTalVqWDRmOVpoazIwKzBEUUFzeTU2c29ub1RpTm1mOWR2eTA1T01jL2Ex?=
 =?utf-8?B?dzRTY1liWk12VUJwNnhNaDBkSGlnRUwvRUVrNTRWcFczYWozNy9oOTVwTDVH?=
 =?utf-8?B?WVgzOWVMVFNITnlEY2Z2NWx4TU9ZK25TK2trWFlTZGpYVTZSYmVzUDdsS1FW?=
 =?utf-8?B?eWdjUWRjY1ZyU0FtemNiVit2aVRRZEoyRSttelFvVlErTDYwcmtRRDNNWCt0?=
 =?utf-8?B?UG1qS29HWlZWaVdGeCsxQXJtTVU2VmpTdkN0aldiK29aQ21KbjhSTUJhVS94?=
 =?utf-8?B?bExoVlpaNzlYZCtIT0Y5TkRqaVE3Uk52YVB5d0NZMDltQmx6dHJVaUFXbHIv?=
 =?utf-8?B?Si9ZVU9wKzR6UHUxUUM3Nm9hUmkyOFk2eC9LMTZaRmd5QWpBTGR1TUlFMW5Q?=
 =?utf-8?B?UWNqeE9vMlFVWGYza2ZlL3ZLMnVUK0lBT3NNYUV5dzhEbnE2S0RuQ2Z4ejM4?=
 =?utf-8?B?bUE1dVIyT29VdWpZY2ltZXoyamd5eFcyMnlaNHdwUUpMNHNzL0dVd08rWGho?=
 =?utf-8?B?bVlnTXRUaXIxakhMQnFyc3hDQTJQUEtTblQ2TDZPRU0wb2JrYkpvYnBHNndG?=
 =?utf-8?B?NWpDTENNcHNTTXhHUWFIakQ3NXRkanZkeDFtakEzZFR4bDUyNzYyNnBJTzEv?=
 =?utf-8?B?ZFgxNDFTZmhva1FSalVRZ2ViYWJ4NnlxOXlTYjF2N054U29DUDVRc0VaQWhQ?=
 =?utf-8?B?RXVSMUlZS2pwK1FtMHFuVUhLRHpBUnZVdTdpT2V3Z3BhMVJOdGRNalFOYndI?=
 =?utf-8?B?NDM2azlLek5zTERoNm5Hd3p3VU1Kc1YvUzZJenBRbkd6M3FMeThlUVI1QVJm?=
 =?utf-8?B?aFhGUGhTczRTeXB5UkdyL1VJenJIMSt3TzdxbW14UWFNOXBFN3FBcytUV2VX?=
 =?utf-8?B?Z3RXVDhhdjFXSWkzWTFLdkIyYUdpUkoyblVmUlQzN1N1TnQ3aWZaTUYzMEpC?=
 =?utf-8?B?ZHpNYzBhalBRTFltN2RNeTZmcHF3VjZwLzdQK1NEZDI3MVZYNnRwT0xHTnhx?=
 =?utf-8?B?OU5LakhuV3h2QVZGSE1yaHdIbnRjWklyMkk4NHpub2xPQ2VuOXRwSFNFejZP?=
 =?utf-8?B?eDI1d0xFMDdPZVMvNmxtQWZXdlY1T01kdWJUOHJMZUVJTlE1azRRaFFEL3pt?=
 =?utf-8?B?U1FYMkpQZVc4TnVpK0pwczNDS2kvWFZkajkxYVhJRjJBdEN6eThIMVdyZVFi?=
 =?utf-8?B?S1pmeWVnT1JmQnV3NnBwQmRBVFN5MU5JUkpWSXk4UXZiVHgvSVFmWHQwenhu?=
 =?utf-8?B?MmZKaStqNTV6K0ZBbnMzR1F0OHVoRnZ4aG4xTlhaaUxsck1MRGtoR1hFb1Q3?=
 =?utf-8?B?cFp3cFdOdFBKUEJCN2ZXTlBiYjFyR2NFTDV3WDRYQXY3bkY3dHdRS0FNUVhi?=
 =?utf-8?B?MTV5Z3FBK1k3ZVV0QUVrSVhqaXpMOW1XSGlhdnl5ZzFtUkpGQzZFd3QzbXpu?=
 =?utf-8?B?aDFvOEhUdEREMkJZem1qSEZLQVl6LzZEak93dmgzNC9oZkU0R0w3cE13ZmJC?=
 =?utf-8?B?cVVkcXIvOFBvcDZKUFBiL2RDdnhWbTZOUjkybjEvSDAvVngybThOdWlsdmUz?=
 =?utf-8?B?S2hMSGExSm5TaXdONlEwbzFZNjZPZ1NtZHBSZUdWQjV6dTFVNDlHeDVLbkU0?=
 =?utf-8?B?RlFMbHU4VjZKQy9OYTdLWEQ0UGlENUQ1MVZ4VitZWW9sVHlhQyt2dWZWN2VS?=
 =?utf-8?B?YzlhT2g5eTZScTNCL1Z3WlhvU3FUdXlOem91eVp0amJ1T3JZNnZUTU1DT2FP?=
 =?utf-8?B?di8yWSsrenMvVTYvWTFySTVkYnN0M1hsYjRla2d4dzAxRG1wN2dlcmloODBV?=
 =?utf-8?Q?Vr+l+8+046MswuCrdCB82VZMO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34bc5013-5113-400f-f13a-08db88204b92
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 06:20:49.2315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s6dp+ck/rS6xNXfFFo9LZ8IGeMtBOYa3JWfolrjlpSRxYEPTzDylWkNBmoSzI2ywfMK94KjzZtt3MG3zyFRa/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9571

On 19.07.2023 01:27, Simon Gaiser wrote:
> Andrew Cooper:
>> On 18/07/2023 2:17 pm, Simon Gaiser wrote:
>>> Since it's limited to the hardware domain it should be safe and it's
>>> very useful to have access to this directly in dom0 when debugging power
>>> related things for example S0ix.
>>
>> You need a SoB.
> 
> Yeah, sorry.
> 
>> But, this is an area there things are subtly broken.  For package-scope
>> MSRs on single socket systems (which does include client systems), then
>> this happens to function.
>>
>> It does not function for core-scoped MSRs, or at all in a multi-socket
>> system.  In such scenarios, dom0 can be rescheduled to a CPU in a
>> different scope while it thinks it is sampling a single scope.
>>
>> This is one of the areas where dom0 and Xen end up fighting over the system.
>>
>> I agree that we want some way for dom0 to get this information, but I'm
>> afraid it's not as simple as just permitting access to the MSRs like this.
> 
> I see. So a generic solution is not so easy. Also even if there would be
> an interface for dom0, my main motivation was to be able to just use
> existing code like /sys/kernel/debug/pmc_core/package_cstate_show and
> turbostat. You can already read those PC-states via Xen's debug
> interface, but that's less convenient.
> 
> For those package-scoped MSRs, how about limiting them to single-socket
> systems?

No, that's all hackery that in the extreme case may be okay to have in
debug builds, but never in release ones. Even having such in debug
builds is problematic, because then we won't routinely test code paths
as used by release builds. When virtualized and trying to access real
MSRs (rather than properly virtualized ones), you need some sort of PV
solution. If you want stuff like that to show up in "standard
interfaces", you'll have to teach the code providing those to use
whatever the (perhaps to be added) PV interface is.

Jan

