Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7492964E7E8
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 08:46:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464168.722531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p65QY-0008H7-DJ; Fri, 16 Dec 2022 07:46:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464168.722531; Fri, 16 Dec 2022 07:46:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p65QY-0008EO-9j; Fri, 16 Dec 2022 07:46:42 +0000
Received: by outflank-mailman (input) for mailman id 464168;
 Fri, 16 Dec 2022 07:46:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=joxT=4O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p65QX-0008EE-Bq
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 07:46:41 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2042.outbound.protection.outlook.com [40.107.249.42])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c6a59180-7d15-11ed-91b6-6bf2151ebd3b;
 Fri, 16 Dec 2022 08:46:40 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9451.eurprd04.prod.outlook.com (2603:10a6:10:368::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12; Fri, 16 Dec
 2022 07:46:38 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.011; Fri, 16 Dec 2022
 07:46:38 +0000
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
X-Inumbo-ID: c6a59180-7d15-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OrGz+PS25lMN1jKa4ab6oock/cwsFagyBsFP5R6145PBcPJd6MnLEwB7XVeH2wVbPBRF9wSRnTq302U1wqnL+n6vvcUFFNNiLTVfqut7FBiau/FRpHqGwFJ6DMYK5RLaDvxw+z1QlVRAJzuI978oek/K5V2DGcvufEJMiq/8TtNmvt+3ykpxbTdICII9lW3+Cdx7Duk0UOqO+fVG1ThsxbWRXBIuzAldhVNZcpZBYFKeG824MHBeSc2lCaUodOcGpA7zyqMEVpR6+M9E4vmg9QV7hsFOjVbmuNjlwotkeYM01celOoP1emhb3V3KOYY+1ETVNHi5A2fYlB+KbjYhvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KozOlaVwm4ZSiH5TUzXqtRoo4M5Y8JY11JQYlZ3cV7o=;
 b=QlJ+CmfF8xF0RT2hhqS3mHxv8cJ/zsmnXRwUdm98jUAP+kR8lkANEK8A4Nhll5GcpRxTrkglagKgtct7QzA7WflERcin6gvzxrFZV7DmMQ4+G7M6uYEvnunKgE1+OJb8RCQka95bggrX3vxtT9+Q7A7c6SV2hqTxvKZuAtzJmXV7HHaNgXoOwm+9Zj0JrxvkAnlL6IQRLMFgxGmzWFNXJMNmvlah6h+VamKEWSCRSVFJqpH/H3c7JIWUy+foJ8DMC+gpcoKMIYdP1XxSnGk9nOHB7uLuVuGsolL97RW3KgY71GnU6Zx4oPJ983BzuM5Ik01uDxKIgZ127/xX7diZXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KozOlaVwm4ZSiH5TUzXqtRoo4M5Y8JY11JQYlZ3cV7o=;
 b=jULKC6jHUOSiYyOlwzsXWSEc6J1M7J5vMFunDqvhR/znPDm06b73ey090Iu76LtgiyVMAoUgWA+gUFBK+OnOa9qRsL/IePBPf7RLV1Mc0dXQBsRgIHwqZcqk1rteTlOnRoVZtZj3JlXfyy/gOCXbE23zu2vkpgSQS8TUYtPA+Z8H/hX0Der3w+Yc8OjltraKao5Dk0voLVyENftXXkaDtoThTIhV6CD2VCthFbBVcCGT7n+itECVn4hXpcxhDtUyvwKXnFruA7Q3l+YPxvPT6LzGXijB7+wOsW6hEkYkJ+7hDZxmdxLbRO2yNrzM0bXVjlv8XnaqS3YSHvc8iVjZaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c6cc79fe-ec84-0a8d-9b13-d1510fbf74fc@suse.com>
Date: Fri, 16 Dec 2022 08:46:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v4 02/10] x86/mm: Avoid hard-coding PAT in
 get_page_from_l1e()
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1671139149.git.demi@invisiblethingslab.com>
 <8f0a2f4352bf6241e66f2fea1776d0c82a3c566d.1671139149.git.demi@invisiblethingslab.com>
 <Y5vXBTH3x8ugZtgn@itl-email>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y5vXBTH3x8ugZtgn@itl-email>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9451:EE_
X-MS-Office365-Filtering-Correlation-Id: ac59e913-08e7-43a6-a2bc-08dadf39a9f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5DQWFOgQwjHpxcSqmFJ9NZq77qkrQ+EPlvAJ9Vlq0BXpGjj1hjBjZ7iSpDnTgXerCr5xjPHyPDPjUo8m0N78Se5d4L0U3uP2MPNyhlKI0ObnbjjvbEEaDpyV9AvuRwMVuwqkfVzr5nL/SEVCM3y2UmerJ5KxQ4Lk69Krz8A/Bhr1en5CEmj3HuTICiqh9qjBQSoeC6kmPq+WPYW1IuZNNBpyQAmpfSwdmBrpXqb+P+S2wAaRMLT8eoNDg3qDSHV4ssDaNhpWzjZiAmDf1LLh0vOkof1rmnDrlV6c4m+MdlHs1ePONDyamdaBlsaINv/pnBcnvx2WCuXx6uwpcUwQjOWBlHUoTXF/yNcS+8vUDkCpdhC5YlzPuzgOwFYeAmcPScvk43bPVbaVC+BYRkxYgdkcZa0pg1n+ocdrXefkgO6+MtDWZ+XbRMjlLKbuSkjFdIMjlI+snHLorRk6UvBqrEKGo3g+xTb8KjF7FoYD0gL1vn3nVni5eAFmY/h8AxTLeQHORB8fuAZO0qhIhI5oQdELtPHP3una+J7RyTsbl89N8py6oVvh6xgQnW/pwzISEsVznidoBmfmtVcF1WaFVROzK1NPkh2LvE+b3u1lHbng3MGanmRvkvLYiXuOa6emT59NEh7B75Wwdfoxz5VfhbZUO1g7qX5IWnpTUmUy0uCKeTlfjzny1M6T/lwDLMOw8fvpc9lhpNKcuIbukH6T17Yk8ZDlV9xgqbHwXYCu5Dc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(346002)(376002)(366004)(39860400002)(396003)(451199015)(83380400001)(316002)(6916009)(4744005)(38100700002)(8936002)(36756003)(41300700001)(5660300002)(7416002)(66556008)(66946007)(66476007)(2616005)(4326008)(8676002)(478600001)(6486002)(6512007)(31696002)(26005)(86362001)(31686004)(54906003)(186003)(6506007)(53546011)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tm94cUp2MHh2cWlUcllwdWg5TnNSTzh0cnQ1L1FGRko3VDlZNnN0MjdybDJ3?=
 =?utf-8?B?UTRBZHpyK3Z3S3VGVnhiSXBZSENHWU4rWmMyKzQ3emw4Mmk4enZXZ2I4MEll?=
 =?utf-8?B?VlhoOURVYTV5S2RmVEttT2NwYmYxM2RSaFRpVzRWSzIyMzZySEhVZjRKcEhx?=
 =?utf-8?B?NEJsMHFTTG00ZU9qTUxQMENXNFBpSWZwVkMvcFVsSkJIWk10RnpkWWpsbzU0?=
 =?utf-8?B?UHBzbElaOFNNSG9pc1BMUnMvMmpKbFpiMTVhc2lTQ1p6MVVRcWxHRHNIMno0?=
 =?utf-8?B?NDRBWUJOeGhISnJtazRZS0xqYUYxQ0VxUTB3WDZndjU1dTJ0Z3ZFQjk2QXYy?=
 =?utf-8?B?b0xpbmFzSWMrTjEzUW9WOGdPVHgvamN1TytHQXA5S3VEZm1kUm9uZ2hJRHVN?=
 =?utf-8?B?dTU0RC9lcTNSRElpeG5HWUZNQ1BYUEZkdGtZS0ZNR01HV3ZOb2lIWmVXSUcr?=
 =?utf-8?B?c1ZNT2orZ3NQRS9OSHB0L01FWlhPd2xOa0FBV1BjQVhWcWIra0VRS0k0cVdP?=
 =?utf-8?B?ZXVmUjNPNXpaUS9qcER0bHdWTDA5N0dFMTJRRUJIMFFBN3czT1lsakpSc0hs?=
 =?utf-8?B?a3ZkR0NhckVwajZncDZVT0pRWE9jMEc5cUdOT0NuK05VSjF6R0VKZXhGelBx?=
 =?utf-8?B?RGlycTZLMU1Bd1BNSUdYb0FHWlpueHVBTVFuaEQ2eFRiTS9Zd2pFUXN3RnNY?=
 =?utf-8?B?NnVocHR5R3Y4aTZlTGxVcFBTSnpKTzNNN2FSNUFCY2FEckJqMnNlLzZzQ1Bs?=
 =?utf-8?B?c2xJajR5Q2N4bDJGdGkzY282cFF4ZFlCZktPMWhvWVlYWkRhdS9iOW4zRk5S?=
 =?utf-8?B?OERHdHIxSlVSSitNOHo3NkYvVlFtMHI1TUpuYThtVXlUQlYwRERzKytKRThO?=
 =?utf-8?B?RkVnVzJ1aUNhbmJrV0xTM09BVy9TOEFJbmFFV01BMktWU01rd0RSckIrOHZu?=
 =?utf-8?B?cWxieStJcDcyd3gyckYxOUtlVG5ERGx6cnJHZWFpdHdBbFliV1o3d2ZYOWZR?=
 =?utf-8?B?Yml3WnJmVngrRnVWc1ZjU2pXM0ZtRUpwM3RwOHViZ2dFREZiajJkS2hlUHY3?=
 =?utf-8?B?eS9OTU9QaUR5ZU02dENDcmZWNFN0UUw3aGlvT1VGUHMvYmpYeG9kbWcxMEZm?=
 =?utf-8?B?TzlWaTdvTUpYVGRTdG0yZWNMMG03OXRRTzRvTHdpWTI2MFZGQzdLZzRrek9z?=
 =?utf-8?B?RW5hQnp2WHdabmMxNVRCTC9FRWcySFhaL3FvLzk3M3QrV1djNmoxTUcxVHBF?=
 =?utf-8?B?V2xJNjFPK3VNSE1GL05jZk1QckZPQmNpQ1VWYVRqQ25jcm1BaDEwMHIyQzhs?=
 =?utf-8?B?T3JDazJSbW50UGFqVTNXU3llRGZMTVkyREl5dGJsdjdtTlNGLzhvamE3aEw2?=
 =?utf-8?B?QlhaYjdNYVZRTjRzLzZ3YW1FUmpDRjl0REZIbnp5dEJTUW5xbjB0dnJwdWtL?=
 =?utf-8?B?NDhuemlFSGZTWWtlR2dZcEh5R2kxU2psT1E0QXpEd2ozVklPOWtsS2VDM3g0?=
 =?utf-8?B?aHc1bmorQ1cvdmFkRW9vVnpOTEhNdC9TV2dhVG1IRkZyQXZxNmtvQ3RndU1W?=
 =?utf-8?B?Nlo5cFhXNUNkQ0lGZUV1LzhIM1Nic1ZVMCtVNm5PbWZwb0hJZW11a2hNM3RR?=
 =?utf-8?B?TVQrTEFLMFcyL2FTalE0VHg4a0lnWFl1TWNnL3FCRXlLcTE3S2kxWE40RW9x?=
 =?utf-8?B?VmloUnViRzVUQmhWYURna2Izd0xiTFhscDVYaGZUS0I3ZlllQWJoYlVZUnky?=
 =?utf-8?B?QlBHT3VQRTlhMFY4RE90ZjdVUTAxRWQ0YVdrT3BvcFpGV091VWhxWXJHUE5t?=
 =?utf-8?B?ZmRRR1BJTWlUMzk1ekxkMFU1TVAzYlNSQXdWd0JEbUR4SnZwM21HVVlUdTlk?=
 =?utf-8?B?Wmh3WGhCMHloV0czN0VvWWIyQWJoNi8vMTd5NXpwWTZDM1F1UmdKR09vclpB?=
 =?utf-8?B?dHJPdlNBSVdKcnBVNHgreUFvL0xWR0VabjJhaVBnN0h2ZitmNDFJRDJ2azd3?=
 =?utf-8?B?K0RFSGhzNUdDSm5tWXlvUVdaaGh4WnNES2dNaXNGMm1VY3dHUjhHQkFrZGVD?=
 =?utf-8?B?UXc3UXM1SUE1T0l3M3lnWkk1UGI2Um8yU2VFUFYyNXRON21vS3MyNWdjTytt?=
 =?utf-8?Q?gbBMQWFEexIH9bcUoyLBaBJr9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac59e913-08e7-43a6-a2bc-08dadf39a9f6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2022 07:46:38.5551
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kM7nRHmwWK9HOX+SfY83yoQ+0WbBTFOCZ16zJ8TLLXe7noTyo+Vv6N/j/P5OiXJvZhIdBfIk0vFqTn5A00ojvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9451

On 16.12.2022 03:25, Demi Marie Obenour wrote:
>> --- a/xen/arch/x86/include/asm/processor.h
>> +++ b/xen/arch/x86/include/asm/processor.h
>> @@ -100,6 +100,14 @@
>>  
>>  #ifndef __ASSEMBLY__
>>  
>> +/* Convert from PAT/PCD/PWT embedded in PTE flags to actual cacheability value */
>> +static inline unsigned int pte_flags_to_cacheability(unsigned int flags)
>> +{
>> +    unsigned int pat_shift = ((flags & _PAGE_PAT) >> 2) |
>> +                             (flags & (_PAGE_PCD|_PAGE_PWT));
> 
> This could also be written as
> 
>     unsigned int pat_shift = pte_flags_to_cacheattr(flags) << 3;
> 
> which might be easiser to read.

Indeed. And then also be placed next to the other function (provided
we want this to be a globally visible helper in the first place).
But first of all Andrew's comment wants addressing - if the code
using this new helper is to be deleted, then the new helper doesn't
need getting into proper shape and place.

Jan

