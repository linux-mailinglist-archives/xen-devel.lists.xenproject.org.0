Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D615769F2DA
	for <lists+xen-devel@lfdr.de>; Wed, 22 Feb 2023 11:41:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499357.770459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUmYr-0004kR-PK; Wed, 22 Feb 2023 10:41:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499357.770459; Wed, 22 Feb 2023 10:41:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUmYr-0004h4-Mc; Wed, 22 Feb 2023 10:41:21 +0000
Received: by outflank-mailman (input) for mailman id 499357;
 Wed, 22 Feb 2023 10:41:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NHsq=6S=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pUmYq-0004gu-6Q
 for xen-devel@lists.xenproject.org; Wed, 22 Feb 2023 10:41:20 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062b.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f5208c9-b29d-11ed-93b6-47a8fe42b414;
 Wed, 22 Feb 2023 11:41:16 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7371.eurprd04.prod.outlook.com (2603:10a6:102:87::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Wed, 22 Feb
 2023 10:41:14 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6134.019; Wed, 22 Feb 2023
 10:41:14 +0000
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
X-Inumbo-ID: 6f5208c9-b29d-11ed-93b6-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZCJbZ+nEBeYn6cB+G5/hEc1JMAhsI82W5MqxhxRsEiLkQx0Rlo4RM4faPJ68IPwn0h3sE8dPxtAj9YI33wuTcioKqM6E7nGxirKS+r2DgW1EW4V0HjY5GROWsIuAy2lXhoezyOhosnaryPfd7o4f2KOC5zvd4tADmgheSKLzQp4l/yjqUoRbbq+iS5jerAebk5tXTqnqwgTyPX0VC6yfEous2SFEw32YLfnEHZE3bTQX2MsUI/up47exXJb619gBCwLOVmo/TeDzXq5F84t6i7Yy1gvoIbzhUNUo5RtqR7bLpulJjKMgABrYz6J/AEoyi+ic0+2YHuG+JQ9gqMxGiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S898DbvOU8X/7qbqKlcl7oA6g86K8tEknAb8fcpc0rg=;
 b=SZq+/dhDUES+nNzuHWPzKFM3mKL4Egs+O3eVnXskHUVP8fvIsePfhHHCMJK2OD765RGiBacTmuGTeeWf/ymYQAjh5H1f8E3p2NepNFejrqYAQrNh47d5zpZksAYtT1cT6TSxO3vK9xfkKGZ/+ViHXa3OHrhUnUCvVntOZnIBKpFBcRuzPUwuq8jb6X3+QNshAlpoaIUNXoE3Wn3TrC+lnwlE1zCQqSsaiQBzqtDePBffPwef+gGNWuGl84W9UGOuVdQRKP/RroaFoT7ltEwETX3NJrtNGk17oMJTK530AVNskrwt39h324xe2Ga2AGqXwljC0mxZuWV9g0NDehtg4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S898DbvOU8X/7qbqKlcl7oA6g86K8tEknAb8fcpc0rg=;
 b=O4C5f6ESE8wdO/JaSpwWYcIvonFrKcfV94hhpn96irAZJcBDKp5YAuf5GXE9mt7epP7EJloV9/d2Gsw5+uQqOXTiX5+vMXxDnR8e1tm4oqpC5qoqUGP7f+jpm956pVLjS/4xjcpQbDnGbK7QS9Qobvnk+RTKbDTczsgeh2LNCFTXAzlkEcoRcx5iyREyj3RyLAk/vpx/wLY6vERurCbxaRaiY4T0V+rD/mwQQGEb4/A2/ouFEQbd1d9+OlLcu+fl08+TjorBYZmz2diFqZczYUFNq4uaPFqfvsXaca8wAraZXFH6YMd8DA4Xj/UL4A3RgM9cZSKfvsAw8Iobj+oMrg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2ae439fe-1294-f731-82d8-4e2f15e3de15@suse.com>
Date: Wed, 22 Feb 2023 11:41:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 2/2] x86/ucode/AMD: late load the patch on every
 logical thread
Content-Language: en-US
To: Sergey Dyasli <sergey.dyasli@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Sergey Dyasli <sergey.dyasli@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230215153846.18582-1-sergey.dyasli@citrix.com>
 <20230215153846.18582-3-sergey.dyasli@citrix.com>
 <e608a174-c158-5e69-4650-51195dfee5fe@suse.com>
 <CAPRVcucou5c+Lsj+QH=H529_GP=mhLxmxsmh5jAFKB4TSc6Z9Q@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAPRVcucou5c+Lsj+QH=H529_GP=mhLxmxsmh5jAFKB4TSc6Z9Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0016.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PR3PR04MB7371:EE_
X-MS-Office365-Filtering-Correlation-Id: d63cd6a4-a62d-4ebf-4854-08db14c151f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	a3S48iyRnjigJL0HL7AXmwYjCLoSHEmru0Vj+YzbR0JvuCUMXoNxyNTKo/ePC4akp2rtMJWEvqrSttbKVe1nMWiXTaamsyJUXqneKaSoUw9azdXEKnMgEcr5Lhp5Qm+CMIypVIhiDTWzmyJyzXiIlN5ZK6iE3iXsBFJZTw3n0iAa4j9huc+D2yfKhxfWGZadQ3t7kWOi5lFp9C3tQ0EIpWgFJCwf8RgDjP0b4Eio/D1MxgRI9r/og4gODL+sjfshH1FNcxY4zYf+bBhdxongPDQeuuQukqzdW4S3J0GlBNTlK86jjWVJyZ0r31AbMHksXMA1scRMXyX7oweKfFWPd5FlIjJpkevPYtHnmyCoqc2MzZjCSYbh4s/RTWNMexaX9Y5DIb8iWSZ5OPziids2zfs/E3VgegSUKS09+bqkWKSylbbfN1Swq7Z1dZfeclHhug77zviWLH/b8j+qlciOXIhJZ0AwP+v2KqXjrKdwd19aaT11GY6DnDwC1utShjvAk+ZLXN+bnV4MmYJ/4g4Jy7PqPCNJe11ZyhnWNcyfRHAx1/51S8LWc174fZws2EPzIvtyexWTKGThVEVSF3/FVpMC5v3XnhTX4YTxDefIPZg04qnCzjEW3hUQYR0VZHLvxL/Um+YWl+J4DqQ9ruavmc4XWsI0mFXqLSaOt90yGSF9wff46eZT+/kdhDmzlxD8h8/wqAU8VBgTPl2KzK04yoVRgALxsDArjbHhPxBY+10=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(136003)(396003)(346002)(366004)(376002)(451199018)(478600001)(316002)(31696002)(38100700002)(86362001)(2906002)(54906003)(41300700001)(36756003)(5660300002)(8936002)(4326008)(8676002)(66946007)(66556008)(66476007)(6916009)(31686004)(66899018)(26005)(186003)(6486002)(53546011)(6512007)(6506007)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWxJSkhGc2dmTkFEZVJkVUg0SkZwQzVGWTN4a1JBL0pRV2xEU2VER01BSWVv?=
 =?utf-8?B?T3grVktQZG16OFREd2JqZ0JYYW9vWXNISmx5UXVZWStLNVlJbEh2RHdZbmV1?=
 =?utf-8?B?Q1AxSFd2cjdjeTlnSzhGMVNwU1JweVd2d0V0VEgzbzVWR2pkL3pGeS9yeU5L?=
 =?utf-8?B?QjI4eTJocDdBeHBCb29iVHRxWm1VN0hjQk5pOUxRWXZTUURZU29mQUlPYTVs?=
 =?utf-8?B?NnRHOXk4UEZwekpEQW40Q2FFT1EvanZRSW1ydktqd0wyd0VZMmZrUXZGNGdZ?=
 =?utf-8?B?SWVCOStFbzMyeWpxODFZWnVPaS9DbmtWcS8wQS9aazF4Si9GcmNRYjhHT1dJ?=
 =?utf-8?B?Z012aUdENFdjMDRoTHhhUkc1MitrTjUrUXpJNlp3Tk5IcEhzZUk0cEs2aUhj?=
 =?utf-8?B?T1FPVGIvcHdHVjdqOWUxUzVDS1R4RmszVW1vNFZob0tjQnNQTms4Skx6YUov?=
 =?utf-8?B?WEhoOG5ybVZoaGgxS3BxbjBSK0E3WHN4NDdvK0VBczBLcjZ2K3BxT2FGZVVV?=
 =?utf-8?B?V1c5M1JJajdpQlMzZjQ1L2JNc0VaWVVaZTFHMFkxVFBPOGJOeDZtN1BGUE5V?=
 =?utf-8?B?UUt6QXUzdmdDcHlkTHlBendac095ZzE2a0puVzNqUUtFK3ZjYkNzVWpzbEpL?=
 =?utf-8?B?VkdENjh5RWhsdDhLU2pLWFlkZUdTbG9sRHJOeHF3S0NKdGpzdGUvN1ZVQXdq?=
 =?utf-8?B?emgwZEJEY0ZHN2NyWjNRR1FSSTR5V0JlT3kwZGl3bDlkU1ZocTJMMExIazVr?=
 =?utf-8?B?d25pVVFURzhycnlhVUl3NS9LN2JpNVpLZFRlM3VPQis5L3hEVzVvN2lYUlFK?=
 =?utf-8?B?WWZiRURBTlE2cTJXc25uT2N3QkpYczcxL2dmOGxXZm8zcGtIK1hpS1c0SnR4?=
 =?utf-8?B?RWFaTjNDLzhPbHZWWmJ3NFRvdDJwemlaVTlPUkFJSDNFQmNSTEVzUVkxendJ?=
 =?utf-8?B?OUtVaHc0RmVQRUVHY3lQQlJrVktYclJ1dEF4YmhLZTYvSmptTGhkbjRCcVBp?=
 =?utf-8?B?em1GZUc1bU4wNDhSSGdyTndDaXA3TEtJVG5LS21XMVd2MndZMjFYdlo1b2cv?=
 =?utf-8?B?N2h6SEJvRXJzRm0zMUlQZFRUR3RWM2NxME04ODc0Nm96eWgvWXMyZWVkbXZi?=
 =?utf-8?B?YVU2bHdSZWtndTFtM1NwVUxZUFR6ZVFlSThiZ2tzMFpjNlJ3SlBPOHQ3cHpQ?=
 =?utf-8?B?Ky9IZEpUc1ZRKyt4bnBSeDVSNDlhMmtYTm1Sc3Ard3R3S2dlU3pnNmgvNDE1?=
 =?utf-8?B?UE92eGxiRExLczQ2ckpMY3FpVFljeFlib2FVYmFHK01kUzNyZEtLb2tDSUl6?=
 =?utf-8?B?Zjh1R05scWhwc2tBK0poSHJRSnUyNzdDMFRrcytyOEtWSnVDUENCeHBNV3Q3?=
 =?utf-8?B?Rit5TjJlalJoQnVYY2xSbkR5WndHaUFLUGxMUXJMQjhrMkp5ZDRtY0JVZUxl?=
 =?utf-8?B?TkJETFFERWZMcldIekEvMUZ5clVjdnpaMVVjTjdtSEhVaVNqdXdoelZ3Mi9n?=
 =?utf-8?B?aHAyTTVDVkRrdFNvdml4S1BUSGY5eW5Xa0JqSVlVS3BrTmh1R3F0NkFvbGdN?=
 =?utf-8?B?WnN3UXg0RW9XSkxqcXltQ3hYemVuUzRoRCtrSnduL1pvejlmUnoxaU5CVUZl?=
 =?utf-8?B?ck1Zb0lXdnMxWmV5VmJiSVRCMkV2NmhEOXJPK0lrWCthM3JFSUR3UkFKWFk5?=
 =?utf-8?B?N1V5OGh4WVdOVzd0S3JzaVEyb2JRZy9DaE5PMms3cHNscDBBb2poK2hjd3F6?=
 =?utf-8?B?ZmVpck5Sb0w3M3pCZFloUFR5MnJqZDd4aWVxUjIySWM5bGhwMVZRY2RwK0tZ?=
 =?utf-8?B?dTlMOVN4RWRwN2padldOYzNjV2JyaThpZFdLVVE5eDZwQjlmSGNNNG12OUlO?=
 =?utf-8?B?L2U3eFBhTFRNSXJyWXJ2cDVGYzNFd1diN0V3UDdNY0N3YUxTUTRhZWFZY1gx?=
 =?utf-8?B?TlZkZEVIdGtZSjlsVjNTeGp0blRITUpxOWVQdmMvRG4vWmtDbkphOGhMOS9q?=
 =?utf-8?B?eERkcVpjTUN5SmFLampTMHh5eEd4b29OMzczakZsRFBPUjd0SUtnM1hRNXRl?=
 =?utf-8?B?ZUdPd0pvd3pST3JiWitUQ256WjFLYlV3SzB4eFZnT1Bpc011akRweUt6ODRm?=
 =?utf-8?Q?OZY7o1lvbp6heMLRcgcEjlM7N?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d63cd6a4-a62d-4ebf-4854-08db14c151f6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 10:41:14.0958
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rNFbUyVVWOWn2vuUyUr1gWf9Hkx1jHkSZKXso4e6v2NERUhULbatGveBBkt8JM5W5qivwtz8J1ExSo1pvfpKIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7371

On 21.02.2023 22:26, Sergey Dyasli wrote:
> On Tue, Feb 21, 2023 at 2:03 PM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 15.02.2023 16:38, Sergey Dyasli wrote:
>>> --- a/xen/arch/x86/cpu/microcode/core.c
>>> +++ b/xen/arch/x86/cpu/microcode/core.c
>>> @@ -398,10 +398,16 @@ static int cf_check microcode_nmi_callback(
>>>           (!ucode_in_nmi && cpu == primary) )
>>>          return 0;
>>>
>>> -    if ( cpu == primary )
>>> +    if ( boot_cpu_data.x86_vendor == X86_VENDOR_AMD )
>>
>> Given their origin, I'm pretty certain Hygon wants treating the same here
>> and below.
> 
> Hygon? ucode_ops is currently initialised only for Amd and Intel.

Hmm, you're right, we still haven't sorted that aspect. I'm inclined
to say though that adding Hygon in your changes right away reduces the
burden later on. And it'll do no harm as long as early_microcode_init()
isn't properly dealing with Hygon.

> Speaking of which, I'm thinking about adding a new function
> is_cpu_primary() there. This would make the core code much cleaner.
> I'll see if I can make it work.

Thanks - I was actually meaning to suggest something like that,
realizing the potential improvement only after sending the earlier
reply. Even just a static helper (without new hook) may already
improve things.

Jan

