Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E284702631
	for <lists+xen-devel@lfdr.de>; Mon, 15 May 2023 09:40:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534580.831718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pySoB-000231-8j; Mon, 15 May 2023 07:39:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534580.831718; Mon, 15 May 2023 07:39:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pySoB-00020P-5x; Mon, 15 May 2023 07:39:51 +0000
Received: by outflank-mailman (input) for mailman id 534580;
 Mon, 15 May 2023 07:39:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xh4z=BE=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pySo9-00020J-Bi
 for xen-devel@lists.xenproject.org; Mon, 15 May 2023 07:39:49 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20606.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aadee101-f2f3-11ed-b229-6b7b168915f2;
 Mon, 15 May 2023 09:39:47 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7530.eurprd04.prod.outlook.com (2603:10a6:10:1f5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 07:39:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%4]) with mapi id 15.20.6387.029; Mon, 15 May 2023
 07:39:46 +0000
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
X-Inumbo-ID: aadee101-f2f3-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mo/5m6QMUwvQnzs70+a9zDe6V7YmTq/LJoy2MgxXVvp5xm/4KXNiRDVyB0/uKJdlThu08f600HdjNNfQbYLdZdpC1COZ5KORkg8GXo3eZ42CtKSVLwo6MaefEQw20KEwxGk931Frd1jtc8dKucu1j3hQiGtSoA201+SMFhquM2bIDnds21rH9GK4TlLzPJjlxAu1ZAxXI6z2DOF4PfO+7bZX8OQ6YFlmhG1iLtEfKOy85rNuWfsbxn2VblwcbnSb/dRnvPqrVoXC8EfcBBy8spCT8Eqw3njxNcKRG/qJBrEF2PrpY5Gs7rq8o6eKXvVJpCoyOfiK+1EwQFB+zs39UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FFpaxNqzsXx7Y8p/iSavuFVh18KQFKOrSR/YTLdVKDE=;
 b=BCTtQfwwTfZECZIDidvH3F/+xfhfBupxSZwqUsZnGGK2L019lre1Nb19g71UaBB6uS9UxoECjTrn2S1enMqrCRRyUGz7gKBG1/nJJFDTxAb68E6BH+mIml6YhK2DA0EnrzoyuZ41YKxM1l87vIrAU6v0r6vPvEKZXR1XXjCrrgMcH0VF7ruDZWsXQdPta4QGrmTzs2unXiV5p1lMts/YCVz4w0+4scAhmU4rWQvlpDJr1joArgQJPeW6fJOV2zbQnXQoXQG8SNl7BaEpHEs7y7V4y75fBvXGls5e4XFVc2zOQu6TkITMNNLiQPskM8RFPjNRfNPlqTAZ0Jd1B7edtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FFpaxNqzsXx7Y8p/iSavuFVh18KQFKOrSR/YTLdVKDE=;
 b=mP/zo7oPQrHx91bzAgz8d+lGgPWdvO9MPyP5//e18ElMS60X9zR44WIq8UMn6TvrCtDZTuB/VHlpDhaBD5hKQH4sQJJs0bxfypyzuUPYiSt3Q/FFcB98LJrRFs7LBQqCnvtw5cvlciBiOo3vFDKpRv14IJamGh553a6BOXwmPd+WgC5IMLw3droaQCbB32YZvXN9Bc+9kZoUtO12kr19tSUYxWRNffLyIObWgSvjCv9H9Qc3dtEzjc3m5cZle9la0YrZbEVyMRbeiI21vVAwp9Hbn+du3uu0m5xab3Lhff/wBV47UHya6C0owvotAxYVcZbnTLuqaG9l1DZ4RfXIBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b45f7a41-5173-6515-6368-b2374b060596@suse.com>
Date: Mon, 15 May 2023 09:39:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: PVH feature omission
Content-Language: en-US
To: Elliott Mitchell <ehem+xen@m5p.com>
References: <ZF7fSeYH/NK105EQ@mattapan.m5p.com>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZF7fSeYH/NK105EQ@mattapan.m5p.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0201.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7530:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c9684d1-1811-4ce7-98cc-08db55178e06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gCSugdKn5vvaeaj70eYcNr1jgNbwfyJ/CkW1k7xfwVEN2OIZZOLcf3R6H2SW1pN7zsRGFJy3Tw48pKAxkgv1SZoGr54bklu4F3ZGdMQJwYgDSxbzx+ftdUsBBqoZSqB5JJZ2HrEvKmBWEQV8wYUekDKILU1s7YqfJr/g12cfYJo/ea6SXLiAY+Ox2XkV8DzE23RgWl5hTJA2eYwWNNMXbVHp9RKwC9ATLDOBKhkoNFyALHcmagYgJ+pS6FE60GtASG/hjurJHvhVMCNgYmznkrsc+qqLQCpFNP7qxZsav+aAnccEw/Dghx4jrC1R31JETjqgehsV0Yovtdg0jvSiS0iJ1wCthU2BIMD+TdnjYpnRM3wIAI3q9MOK5JcRjA4uf0Hf03A/NL5smzQKGAjwcGYbrdcWiWey7MMA5WrYCAGwFZ9TuHCQdmh1SgdcPgjEwez74/UMOxER0aiKE/mU1MpUB2JhWTBS1DdHrTw39vQRF8Q4vXhT4i6v+H0CmU71+SV1beZMiQpNriwlGAvqxzVA4pwktS4hogwNJN2Wh+HjQEswgFQqeipcfL2DEv4UUk082rkO8riZOjp8YO13ohZI+/pf1adezcN7+E0biEHGfy4WAUzDkwWf+9ZhlGGUBarrb3UN2jgJTy2UYS55nw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(39860400002)(346002)(396003)(136003)(366004)(451199021)(38100700002)(2616005)(186003)(3480700007)(26005)(53546011)(83380400001)(2906002)(4744005)(6506007)(6512007)(5660300002)(41300700001)(8676002)(8936002)(7116003)(36756003)(31696002)(478600001)(6486002)(66476007)(66556008)(66946007)(316002)(4326008)(86362001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VU5QcWo4QnY4OTdtQWRIOXZvTzVPZjZOSTUraDdBUTJjL1MxdHlwbmE2LzRi?=
 =?utf-8?B?ZXpqd2hHTXc1MU1tY005N1hpRC9zbXRTUzZnS09FUTBYTlJEK2FISlBDbkgr?=
 =?utf-8?B?WFV4aFpIZlRxckNERUhTOWhZLzNlNm1saDB4a01pVUZUSS9CdXJ3WmwxWlhi?=
 =?utf-8?B?bjg3bHpFTVlTbERkNDMwa3RYZjhLcVRqYUNtcktwRHU5Ykd5YytDMkl6WWNq?=
 =?utf-8?B?SkU1ZDQ5c0w2TFYxZ1RseWRkdWJjWDExek9jUlZoc3FxTmJISDdtbHhnRURD?=
 =?utf-8?B?UzZnU0FRZEhpT1pNYitvYklTNHZxU29VUTJtSVpXY1E2T1V5SGxia0I5eVBt?=
 =?utf-8?B?NWlLTVY2MkRseC9aTVdhQnFZM3lxMFZzSnB3RFI4UmVzM2NWWXZxNTBKSTBH?=
 =?utf-8?B?QmhkTUxtM1dwQ2s3QmNZZXZVOXZ6YXhCcTBoZ25EUHcxSE9NY1BVMnZqYkc2?=
 =?utf-8?B?c0sxbXVDdlVzK3h6OHRrKzlxVWhBMUNCRW1lRmNjTGtWM1o3NlE3MHdwcElI?=
 =?utf-8?B?QnNqUUZpMCswU0JMWUlGT2dBYlVtV0g1MmxudVZmR3VPcDlUS0QyUGo3MStY?=
 =?utf-8?B?ZWpNRndzV3c3VnQ3N1NvZXpsUktrdnRhb3U4ZWlwdGs4WUswRTh3MG93b1lN?=
 =?utf-8?B?UHNQUk1rcmQ4dmFzVEtqc1lFVEszRS9TY2dOWExwL2M5cnVHajd1ZWRrNW5x?=
 =?utf-8?B?Rk1DUU54VVJ3N25XOGZKMy9Lc0MxaXBGWU1UVTdvU1RqK2ZESlp3ZllRbFFE?=
 =?utf-8?B?K2RpNCtTUnJuQUljYlJnSFNIcytVM1FkbmVNbXZSVDBZcUZHTGNHYnlqbms5?=
 =?utf-8?B?bGt3ZjAyL3BaT2FZdTRYeGNRT3YwdkVnaHd6YVdGaHpucGVXSjgrU0l0d0lD?=
 =?utf-8?B?bk1HRUVTbjAxVjhBbzZOV3hnOERDbEJ2Yi9PMnVtNFFqVC9UZTIyRGMwVWpI?=
 =?utf-8?B?UnB5TUNhUXdReHJ0bmpwSnNvSEM5SFJEbU9xNlpjQkJzUitJc0NZV1FMcFZO?=
 =?utf-8?B?Qzl0U09qZEVWQk1YbkJsS0RhWldaQVN6d2hnd2pNUzRHU1NBTzViT2p6VFYz?=
 =?utf-8?B?STM0S2dnMGwvOWVQRHJ2OEJLblFhNVBYREpFZ1kzOUsxNGNxdmh3SHVrVnUv?=
 =?utf-8?B?dURjRzN3UHR2WHNqODdUNEFyN0FjYUY5UTUwM2w2blB0am56SGF1WW05WUFa?=
 =?utf-8?B?enhjVmUwRTVubnlFR29hYmhRa2lOMDIzU085MmpMOXFyWXNiMnFkZGlROHJa?=
 =?utf-8?B?eEpreVBxOCsxeGdFMStEd09jR1JJeDdzZzFtMUtqL0E2OUROV2lzYThkeXZV?=
 =?utf-8?B?MjNmc0ROdlRJRXlCUUF6VnlmK1lETGNzUU8vbmp6ckhQZ3l4d2c2QUFMTWRJ?=
 =?utf-8?B?K3RORVc4ODZYaGt0MzlpZnBDbFgzNWZYeGdHZFpseUF6SjNtMFpUc01MWk91?=
 =?utf-8?B?VE8xQ1VnalkvczNTVHUwenZTVHRSaXRxQWZSb2NSelI1SGZTclhZTHF1YUtv?=
 =?utf-8?B?Q2xUSEI0bWwrVHplTUs2SFFieThiU0ZzT1hWVUZiTGtQeWNsSHpUZjd4VWRo?=
 =?utf-8?B?Rm1BUXB0VWNFMDdRS2FodkkwYVhRT05OVFdBQ1dOTFdsWVkrd09xb2xvZEU1?=
 =?utf-8?B?VG54SE01UER0eFBwTmRjL2RtR1JwWDlWam9pdXRIVkpJSHBKZldzcUdjMWVN?=
 =?utf-8?B?Q05sQy96Kzk1WVFvbGRvRkxpWUxVVSs1cWFOUHR0V1BWUjdEdng4c0xPVzVB?=
 =?utf-8?B?MDRTdWZUT2F0T0ZlSmZ0WVNaVzZPb2I2ZVFuTzZBUzRkRDlXMXQyZ2JWWlYv?=
 =?utf-8?B?aE4wcFBCNHZ1ZWw2TndzditSYnE1WVlpWEJCN0c4NWlmaWFvVkk2cWxldi8w?=
 =?utf-8?B?NWE4aFRKK1BuZzJvaXF2ZXZsSTlMNTI3SDExRXV5TEdyQzJZWHhyL2dsMjRO?=
 =?utf-8?B?aHNxOGJnM3hZbXYrZkJ6ZnU3R2dYK0UreDErZTg1YmM4SWFhQW82TVpuLzZ1?=
 =?utf-8?B?d043SFVkcG9IQ3Q2cm81c1hmU0UyaU1WL3lQTVVUVkR1b3VLeGRpTmFmS3lz?=
 =?utf-8?B?bnpBVTZUM2IybVNNY1R1UDh5VzIxUElvdlUwRUpkL0NzRU1XYVZCMHpud1la?=
 =?utf-8?Q?rteFPlmSeAe+bKjOkCKh70ySi?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c9684d1-1811-4ce7-98cc-08db55178e06
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2023 07:39:45.9853
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9X19f1vFXTkG0Xya+Ccf5MxR/M/EZB/z2dgnqewvcb0Zao+f40uFs2foplIVzTHDQEeck3YW2GSpU5zNOfZHpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7530

On 13.05.2023 02:52, Elliott Mitchell wrote:
> From tools/libs/light/libxl_x86.c: libxl__arch_passthrough_mode_setdefault()
> 
> "passthrough not yet supported for x86 PVH guests\n"
> 
> So PVH is recommended for most situations, but it is /still/ impossible
> to pass hardware devices to PVH domains?  Seems odd this has never been
> addressed with how long PVH has been around.

So if this is of importance to you, why don't you contribute patches? I'm
sure you're aware there are only so many people working on Xen, and that
any gap is very likely a result of a shortage of engineering resources?
Including (assuming there were patches) limited reviewing bandwidth?

Jan

> The other tools omission I noticed is it appears `xl` has no support for
> pvSCSI?  Might be infrequently used, but seems similarly valuable for
> domains focused on handling storage.
> 
> 


