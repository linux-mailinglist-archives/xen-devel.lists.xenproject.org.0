Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3956D8FBF
	for <lists+xen-devel@lfdr.de>; Thu,  6 Apr 2023 08:53:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518749.805581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkJUD-0006Qb-Kj; Thu, 06 Apr 2023 06:52:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518749.805581; Thu, 06 Apr 2023 06:52:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkJUD-0006OK-I3; Thu, 06 Apr 2023 06:52:45 +0000
Received: by outflank-mailman (input) for mailman id 518749;
 Thu, 06 Apr 2023 06:52:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LuhO=75=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pkJUC-0006OE-2Y
 for xen-devel@lists.xenproject.org; Thu, 06 Apr 2023 06:52:44 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0606.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0e65c27-d447-11ed-85db-49a42c6b2330;
 Thu, 06 Apr 2023 08:52:42 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9449.eurprd04.prod.outlook.com (2603:10a6:10:36a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.31; Thu, 6 Apr
 2023 06:52:37 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6277.030; Thu, 6 Apr 2023
 06:52:37 +0000
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
X-Inumbo-ID: a0e65c27-d447-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CQRus2hIwPyTwzZUg4hBt3SpxMA4KjJ/hphX9qfOsStxXMzYrywRJcWNCVIjSUSFGPAkD/Kep6eDAjcZR3vB8RsPX96jfRo13YnXXvEJnM//XD8t8f90naUIxcKPdPYxF4lL0afRQZqPN120+la6tJU2b/uf8PNMFs2hH43pwpp+/HGetk4lbmSXrn5Fa83WrYv0uSA5asW47LZrUsUSsJqXBW7bDLBAcNpgqNlHnhZpYLka4AzEbnxb2RulErtFtz17h/kp0i67raqHdaPriWUTpWTskJwJE1iLvs0wIIwDxItnF9tNZsdTKRN4CDiH1Z9IZfElDu+vaaxcYONgeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mp8t5y9kQGZBW8iIjdSHnxCFO8OaixoI+/AozAavHPo=;
 b=E7AqMNIop6TvoYF9NZlXhQSrGw3xLZKkZuuTpEA8UJodrKMG+d0IZrDYzG7r56rzMLwGNp83Z2Img13yEvOKEDCfWiHIv4ayjTFCN1mq8+iko7U02LAB4drz3jVvHyM0DRhEAaI7zt9EjGU5/adi1l7r8pJ8dBXgoVhz5mDmgTLswoYwVM7F/pixeFpq8Sc7cAZ/PFa/MljelFV3fZppbDz8b1nT9u3kCZZAQLzH5IllBhoZzR+/lCh0nJn67j/lI4RT1QMOJnGFjxvHuv1CDQEa8tp2DjH01sE6jpia4wog55cdg+9y9z2nFuqba9qnjxcoltUB8GG/RByuUJylew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mp8t5y9kQGZBW8iIjdSHnxCFO8OaixoI+/AozAavHPo=;
 b=YFRhgK5+WWZPpSTR/uJQFx0UFzSCgyTDrNxtgMPCYrz3gPtIbs3vXI/obaZhpaVrIYPLI2uFyewdgjHLPRPwBqtZZkH41VZI0wDytirAQ4Tydztlaa4lJn1hYngkC5hFKP++0SekrvZ9J4bazjkPTYVY5xmaH+RSPlBBpyQi+eIKoxBYf1nzB1/EZ54Kh4tfQQMjpfyE1fw7wMb0ewg19IuLSKKZ7Z04rbefOSufetPPtVgDTulg3659HfdmH3z0AtQT1UKpFKtBfItwVUJZIga6qjn7Hjzwpj1/+LADuCtrIFg/CQS7H6ZEPwnTkic87vzeauip6nfm0lQK6ZgIWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d322737f-3df2-5e81-8f1e-e6bee30627a8@suse.com>
Date: Thu, 6 Apr 2023 08:52:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v4 2/3] x86/platform: introduce XENPF_get_ucode_revision
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Sergey Dyasli <sergey.dyasli@citrix.com>
References: <20230404160655.2354-1-sergey.dyasli@citrix.com>
 <20230404160655.2354-3-sergey.dyasli@citrix.com>
 <a1c16028-3f33-36bb-36cd-b1ad2664b0f9@suse.com>
 <724da9d4-2c8f-dc45-78de-5a50e87adba1@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <724da9d4-2c8f-dc45-78de-5a50e87adba1@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0050.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9449:EE_
X-MS-Office365-Filtering-Correlation-Id: d240eac0-f57c-4b59-6be0-08db366b81ee
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KKcth/ur1s3WuiUanGPzFocdWfxoN/+2Zy+ro2zGSCl0PphPqsGiVZAKVzYxXuSQop6VDIT1Tg51DUWD6u5x9F176D6skktfmdlEiTIR+IwhsBEGmHMKH7t9dzf9gf5L5LMbiV4GhfeHdu8OFEKsCnnisx+HK6nVrHBKvmUnTh8IBxCVw3FKD285okEptZZHhHugQ8u0OJf06fwuYTA4u7dRfpxhbFhWL8PPL7wmE/SDpXPm3j4NxW3CutaB6f4X01wQsQcO16UOZ/Vw8CsD3H2hFpSVPT9aUg7yiCEuJA0BMQ4RWfvnukAI9KMGOa5KIULlDChqiegcNyoudL+7knzkDDpHH/VEMLSWTUBjQfXyPO8VDQrVWbpyUFLPtk+9qfnvEomG4zactuCLUtejmQNiuyY+0sJGGLcwwJBK01Ebct0/yboFirZngc1Nr9KEZ1bi5QcyGBvqlhIWvIzlGHZttusWjwmjgIA7SdBpQh74j+EsRQSVFlFDHPikB5R3m1SkV9+Xmv7j6OSwLAZCE0bjhu76+FWcfSC/xjYA7hF1+8r16b+z9ygDOnD2EDUqU53BFdeC3tB4xxI/S4Ons0lDraez1jcvLV1fIxd4E9ATtt4NH5k60GD3aj9/VEM8fHZBiXRXnhzBEP/cbf8www==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(346002)(39860400002)(376002)(366004)(451199021)(186003)(6512007)(2906002)(6506007)(26005)(53546011)(38100700002)(31696002)(86362001)(36756003)(2616005)(83380400001)(8936002)(41300700001)(5660300002)(316002)(6486002)(478600001)(54906003)(31686004)(66556008)(66476007)(8676002)(6916009)(4326008)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z1psTzFpdkZINlJyWWRzRTI2bHArRU1uSEk0OTMzTC9ydzFTdlJFa2tnNmtW?=
 =?utf-8?B?eCtZZ1FQMHRRYllYdjE4NlJGKzB6KzJtQlNlQ3kwN1N4Rm1LbkZjYjU1ZEpV?=
 =?utf-8?B?cWl5Vy9ZRjBCZUVRaXd6czdpKys0WFN5ckNSVWgzZHQ1Y3pvdnVUODJyZ21h?=
 =?utf-8?B?ZFFzNXRsOVRlZDRHaDBpZ0syem5XSmxCb0N4ckE0NFNBSHBwclRVRjJPM2Z0?=
 =?utf-8?B?TVpLaU51QXh0K1hjSHVGaUpmVlRmTVlFZkZjNlBEU3BLdjg1YW50Q2NrRU5E?=
 =?utf-8?B?RStXeTBvYnlyRHBaL2tVamRrWUJXR285S3ZzYmZTYmN5aG5IVzcyTndwL1RN?=
 =?utf-8?B?Q2NNUUpRNXk5bWNwRDJXMTJlaW9qMEN6MWFKS2U0R0xzOVgvM0h3MklMbnE5?=
 =?utf-8?B?ZEkrLzF6aGZHMGtsZGlFU3k5cVZ2UndZcnFraHIzK2RtQUJBWk5VU1oyUkM4?=
 =?utf-8?B?NlFOOU5VRVpuc2o2Y0t0VWZLRk1Xa2RoMUh4ejVwQ3JPekY3dGRBdGdteDNv?=
 =?utf-8?B?NzFQMW50a2NuRzNueUlOSEZQdkYvTitjWUZuOFFjK2J5YkR0aDdXbmNuZjJ1?=
 =?utf-8?B?VnZGMnRVL3g2SmQ5YUFTdUhNVTZ5Z1pYU0V5K25sa0FNcksrVHYzUW9HRVJu?=
 =?utf-8?B?Z1lLcVU4NHdkZEhJdjVSYk9MNFhuZWU3RjQveDMyQ2I1ZUF2SkRDT0daZWUv?=
 =?utf-8?B?Qm03Z2lIbXZMS1lPMWZNYktWYlRmOE1icWUzZVVUNjhtbzg3cTVLMEpzZlRN?=
 =?utf-8?B?WVhUbmRPa0tXamJpUnV2NmFDTDRWSDlhbHRkdEI3cG0raTBraG16eFJyVm1I?=
 =?utf-8?B?Z3BXbjV6b2xNUkhodFJldDlVemlGS1E5Rk4zcWFQVjFOblVES09oUVNtblpH?=
 =?utf-8?B?Yld5Zmp0SEtFNTVZR0lWZk5IK0Y3VEEvRlFjRTMrQ3RDaFVJb1d6MGhsU1ZQ?=
 =?utf-8?B?dzJHNTg1SEVnL1VLb2JiRG4yRjQwTmQ4MEt3ZGJaL05remxrbFd6TVBna2N0?=
 =?utf-8?B?azBCaHZWMjdGNE9OM09NbzRLSHVQRmhsckdSSG9TUWZTM1JWQkU3Z0YrVWlN?=
 =?utf-8?B?UG9LOWNPd1hMeHRwZzlpMFdscXZ1aTNGdnlYSnZmVTBlYmhIaFNJbDZMaHoy?=
 =?utf-8?B?c2ZreFcza3h4Y0phRW5QMDZhSGllZlZ2UTJLZmRrOXYzYmNzVldzVVI2bnZS?=
 =?utf-8?B?YUtHOVM1WW5IQTdCMGxFalpWWXc5SlVubkFoVll1YVFMcDBlcTJhRzVTMUMw?=
 =?utf-8?B?dUZsWGQvMjhldkd2ZkdKV1JOVDJxY3ExS3lqZGMveFRwek95T3JpbTNOV29j?=
 =?utf-8?B?NHN4azdWNS9kUm9yQXQrU3N6Q3daMVFhWXp4cjdRNS9pSjJ1eFJGMHRDZXQ5?=
 =?utf-8?B?Z3k0cFhXY3hHSVUwZ1BhRTVaeUxRMFhRTWxxc0VxMWNMTGVFVi9yZk5QMFJz?=
 =?utf-8?B?L05Ka0dFKzBmUHB6MklXTGJaM3UzRWZqOGFZNkkxU2NacWxlbEtreTBpemxI?=
 =?utf-8?B?QW83NEhLWEhjejJNODgvZ2Y4ZTF2cEdRVWJrckEydlNrdkY1RTd1SDZycGZ6?=
 =?utf-8?B?MUpzbENpQjBTVURqZUNoS2V1MWxnVjhXOFpoZkxoWDJBc0l2eDJDcW1BZ0ZZ?=
 =?utf-8?B?UDJ5a2lHVFF4czh5S0pMeWUwSzg4L0JHTmpPQktheCtSbWZZRENpdnUyb1pZ?=
 =?utf-8?B?WUZyZmMyZ0N6SVFSUkNRSVBXVHFkNDhVQVdzY3hoUkh3SlhLQ0FBWWpNOGpo?=
 =?utf-8?B?QVRhUzRkQkpRMFdsZ1RCU3RyUlFmQlBCMmxjclB5aVJXWFBrN3MwOFhocU8w?=
 =?utf-8?B?alNnMnUyOXhVZmZCY0FQU0JXcFZ3aU9uNFE2YW91UnpkbVBjNmNWUEdtTVJ1?=
 =?utf-8?B?WEZCZS9mY0pJOVFFeXBmRjc1VThhQnBldHlpcHA4Q1cySXNjOVh3S0dKbmFo?=
 =?utf-8?B?MnlyYURNbk40c21ZT3pDOEtVa1YyUGpMWWRZcmhwNlM3K256UE1NZSthbjRm?=
 =?utf-8?B?bVlpb0xOTzMxNEk2L1JUUEQ2cGFtMUdNSURkMVE3MUc2eWJ3Rk5tWTRQRVRY?=
 =?utf-8?B?ek4zc0JRWDdCODF2WmxIemFlRlM4UjRtSVAxZ1pVSEhxbzVtL0hhaDdqMTBi?=
 =?utf-8?Q?gRpY7LE6QWnLJ1Olioj/PEX1P?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d240eac0-f57c-4b59-6be0-08db366b81ee
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 06:52:37.4617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1ak74kSNQaFeh8LndSKiIzvmlblVsIKnDRxxitt02wQ1NB5HBEgrZz9JuOjxK6CXA1QWy4uHdCuDvqQ5JBVFZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9449

On 06.04.2023 01:02, Andrew Cooper wrote:
> On 05/04/2023 9:56 am, Jan Beulich wrote:
>> On 04.04.2023 18:06, Sergey Dyasli wrote:
>>> --- a/tools/libs/ctrl/xc_misc.c
>>> +++ b/tools/libs/ctrl/xc_misc.c
>>> @@ -243,6 +243,24 @@ int xc_get_cpu_version(xc_interface *xch, struct xenpf_pcpu_version *cpu_ver)
>>>      return 0;
>>>  }
>>>  
>>> +int xc_get_ucode_revision(xc_interface *xch,
>>> +                          struct xenpf_ucode_revision *ucode_rev)
>>> +{
>>> +    int ret;
>>> +    struct xen_platform_op op = {
>>> +        .cmd = XENPF_get_ucode_revision,
>>> +        .u.ucode_revision.cpu = ucode_rev->cpu,
>>> +    };
>>> +
>>> +    ret = do_platform_op(xch, &op);
>>> +    if ( ret != 0 )
>>> +        return ret;
>> Is there anything wrong with omitting this if() and ...
>>
>>> +    *ucode_rev = op.u.ucode_revision;
>>> +
>>> +    return 0;
>> ... using "return ret" here?
> 
> Conceptually, yes.  *ucode_rev oughtn't to be written to on failure.
> 
> More importantly though, what Sergey wrote is consistent with the vast
> majority of libxc, and consistency is far more important than a marginal
> perf improvement which you won't be able to measure.

My remark was entirely unrelated to performance, and instead solely to
(source) code size.

Jan

