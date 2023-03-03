Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9D06A9646
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 12:30:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505899.778893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY3bk-0002p8-5m; Fri, 03 Mar 2023 11:29:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505899.778893; Fri, 03 Mar 2023 11:29:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY3bk-0002nL-2e; Fri, 03 Mar 2023 11:29:52 +0000
Received: by outflank-mailman (input) for mailman id 505899;
 Fri, 03 Mar 2023 11:29:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dqM3=63=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pY3bh-0002nF-Mr
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 11:29:49 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20604.outbound.protection.outlook.com
 [2a01:111:f400:fe13::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b49e2432-b9b6-11ed-96af-2f268f93b82a;
 Fri, 03 Mar 2023 12:29:48 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU0PR04MB9419.eurprd04.prod.outlook.com (2603:10a6:10:35a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.22; Fri, 3 Mar
 2023 11:29:45 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6156.019; Fri, 3 Mar 2023
 11:29:45 +0000
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
X-Inumbo-ID: b49e2432-b9b6-11ed-96af-2f268f93b82a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D30VfHhLH4VUXsgmVJwIdlYvvZsYYfeVr206s3tyE3yKd0rTi0xoKTTjw1RY9u+2TJh55fM4xWyulzarGkzamqsQ9FfHNVrQxx6/AXQpDRCxtTTGu/XQiVfzyERdko1LNZ/nbKYZhWZvgtuP7mBf8coYg0uoLZ6mC8fv8SffRPKiiyDLBtWUyPNnolaEfqnEGyKxoXbLE923n6g6kzFEx4O0z/XMZ5JGNNAS0YK85PTvKcw5BU6QwM9i9YjO03pllrJcL26K/4dJbXFAWURSnJuWeIkOGjkbSlujLs06E3sprFIbWj3LPsTmBnj3IFlgFXWW4eUsmbQIPfx7vkt60w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X9WVnjJmEBoWDhj4y1rbR/ePeL2Gc/0FK+hN49gA3tU=;
 b=CryjmEPR6V99isqnLQ50d3bNNeM/Mdwb+c/1gPY+itYNNygrRWDgQ1mUj9IU8GyX+qv6qeSuDyh/DffYXN7kuNPAxKxu3yIUJ0imJkrT5kXRvsAFQix5QChwMDczpUj95C/m/GTUR7mQMg4EFztPNQbAhKPw8bhk+E+7NkpC25V4R2zjjHi+3ZBb8ErrXxK2YVozpsibvM9mSWRKyZq3etYgbIRpjxoQu0/nYbFJC4pVzO1dtsodJTayibXQ//1z8dNSwFeILUnRKFfSA0K8dVR/LDywlVh0ZhogX6WK0oZOMY3pzsbqyYeZ6Bj0a+kmWrc2YPfm+bN3HREPIaY1Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X9WVnjJmEBoWDhj4y1rbR/ePeL2Gc/0FK+hN49gA3tU=;
 b=XqH7uISzVL+hVNOuAgfsRYDOuzjb+Z41tEPrPsneeeks8g1fyufJlCT/pXsMrufpxgz4Qp7DNoO5zLP658gkuHmyiYbGLEYEsoJ2eUV8Nu6giZE+ptvkwiFCIeD+e3ElvDwXgMAdbsPZrU8yPue4wTbSPozCdXJP/DTGLFxLN69Edlhcy7SPoLeu+ZFFDoV+sIiXmakRssrawwuhGk4aD6jVR4W9Vm2G1qX4Jp64Qp62P6Ub8kdnijbsvTjt3UcBFU3Mn4dPMJnZKE8/IoeEC7kZgOh51CzORu7L++tR6lq9nn+kLKjGpH5CqI2vXQZ/SaVU49KjtmnSDMNcxY2/0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b4adc3c2-6356-c552-93a3-c2a66ec53a04@suse.com>
Date: Fri, 3 Mar 2023 12:29:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 3/4] xen/arm: switch ARM to use generic implementation
 of bug.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <cover.1677839409.git.oleksii.kurochko@gmail.com>
 <9de74cc424d5f198ac76ff46394aa5b99502d24e.1677839409.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9de74cc424d5f198ac76ff46394aa5b99502d24e.1677839409.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0106.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU0PR04MB9419:EE_
X-MS-Office365-Filtering-Correlation-Id: 48c1ea90-dd8a-4fea-4563-08db1bda96aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NYilqAtLtOGLOZ27vtFEjY+W6v/+38q7FTfiLsi0vhMAh+y7r0911XEjUdIcSBGRP07PfuLLqfdKcpPKRU68ASoT1DONxiiQav8ACrijiBazyAwMnqenkCBEFNPodx5vpD9FE1DAR8qjl2mdjQmYlkyYp97LNPquJ3icETX0u6C3qvo2DynEfjUZXbltla+t2ZGN0+Qh8S4wxFmds8YU2jCliKxviLyHJm0XthEU3Kem0gDSuvlQV789ncLwhryfOxmKtm5FYWEpex2/pXBlyAZnY3Vb0uggemk2Dq9S5JSZVw2rbjYr4DITaQaOyssK9SpXkT6XBFzr1e04MlmvYlodmwe7nrJKhGXiDyWRKk+J9E44n8f9bQ7l3tHiOeAczXyNWaNjnzvwHBJK2WQeYRAnmtrFGaOLckkbABoHd+pYNwBGwZveseXQhk8TLhpEukMy5Cx9Vs4goUD/JXvm9jwjOS0IZeytwic/KHxlGLCPlwKW+GTr6YfbVzVMY2WD45NtmLlmxXEamisZTYjGc0U8Gmn1RpKxhn69RiXy8QAHiFOCPPuPuPlJe0ixR/g7t2Ofd8XbukMVJfpt4v1Vn0gJZigd6hsMBQQCQJIcNc2P6/cazmnEwU2TQ8ING+s7jmwHpxciYUH0efyPKhyu6wgzJhUBjPb2Z+DmN6eCVsBMdQJ8Bc3hw1KXY4/TitqVvARvSY4bXfIGbtFydrg9w/YpLf+bvEm6INGnSAhZNBZszW0NfHG2C/mbynqKO/Vw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(376002)(346002)(39860400002)(136003)(366004)(451199018)(6666004)(2616005)(41300700001)(5660300002)(4744005)(2906002)(38100700002)(8936002)(6486002)(36756003)(31696002)(86362001)(66946007)(66556008)(66476007)(8676002)(6916009)(4326008)(478600001)(54906003)(316002)(83380400001)(53546011)(186003)(26005)(6506007)(31686004)(6512007)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NjFIMlJpai9PN1ZvOVhMdHRyUmJCTGJ0OHp3Z216aVBQUThXRHI3NlphRmJi?=
 =?utf-8?B?cHg4N3VoV3dXZlNyQVViTzZ0a3BZRHFGUlFUZ005ZVF2YVRSc2IzOWRGQS8r?=
 =?utf-8?B?NEtaVjdzT0M5S1ZSNGVaRml4MG9yMWJ2TTd4SzR0TGJHVWJHTUFpUTY2Ky9Z?=
 =?utf-8?B?RUE4amcwNytTS3puYmlyeit5TjluZnZySFJVeVpBU0QvdnRzcnpySXpNc3h3?=
 =?utf-8?B?b3pjSjZCYTNsbkNMUVB0ODlaYjFWTkZIRFBtRGdpUk5YcG53cE10Yy90eFl2?=
 =?utf-8?B?b042aXJZc09PbXJWR3BTTEVIZVQ0WWFWVG1kN3hUWWNSNEV0b3d6ZHZ5R3kz?=
 =?utf-8?B?RGMvRkZuYlpoUUtPWFVQQXZQVUs3cTk1Vkh4TDZkNzhWTzBTR3BWYTM2QURy?=
 =?utf-8?B?dG5HR0NNU0V4T2RDc2h2R1o0VzlIRitvMUlIUmUzMjRwOUNHVGZ1aW9MMkxv?=
 =?utf-8?B?S2NYSll4VlBzUGo1eVRyMzlXMzhvN3FhZlhySEhxWTFDNkl4aXBqZUpMcU1X?=
 =?utf-8?B?Wi85SWJTYlQ3WjJLYlYzQVBGV0NobUgzcENMV3NVbVFqSU1qSWFDYjV0ZnNZ?=
 =?utf-8?B?ZG5SZGV5eVBXZE1BUUtoMmRpWHBaeWNhQXY2UUdDeVpZdHErMkxKSmhKUFhZ?=
 =?utf-8?B?UlA4ZGFlbVFIeWZQYlB2OVZNS09jMy9Zb3VDRGNJN05mOTFYMUVZUVNwNmt3?=
 =?utf-8?B?UFBpY0NSZ1kvUDcxOFJHdGY0ZUR1OWVHRzhuT1ZodlJQMmRiaTZzUWZZMzF1?=
 =?utf-8?B?QkYram4xNzB1VWZRQVo2QklhSEFHRTBRR081cGFuNS9jbkhvNDZRbkJ1RFEy?=
 =?utf-8?B?ZDgrUzFaVjBjaG5uZEJEQmdLa1lMZEtqYm8vR2grU21BZHkxdmNYdWZMa2hj?=
 =?utf-8?B?SG5OSlk1WS9XRmFEeGJTcVYwSlY3NmlnNmlLS1lLeUhlTGZQRTRXTDBiNWpp?=
 =?utf-8?B?STNjVGpQQmR6UVR0NTZja040RkhvK1kvVjE2NDJkK3g0MHdVVUVETXl2RUhq?=
 =?utf-8?B?c2ZhYmN0aTdpK1RhanlRVjVRTVN0V0k2cmpnbGVDVTY5elJoYTY5V2praE9X?=
 =?utf-8?B?TVhKcE85Z2lkQ0tKNHJJTjlseE5KVUFBWnppWVZRRkFpT0Zub01XSE5jQU5t?=
 =?utf-8?B?YW9rb000QmRsYllyQmNQYklmbFJSRThrNGlVc3NOaUxBcEJvdDVvdGw4M1Nu?=
 =?utf-8?B?WVQvcHlJZnZtRFpBbzdEek5NWWhmKzBPZXlndTBLUWlBcXppRC9zSnR3Rmdv?=
 =?utf-8?B?dUxFenRWbGhWeFgwYU5DVldTaVQrN3FIc1B6Y3I2SUVmV1hBQmcxaE1PWTQv?=
 =?utf-8?B?T1ZudXVhUUp4TWI5N05xSzBwVjk2VTRMVnl5UzgyS3V4TXVqN3RkVGJVeFZN?=
 =?utf-8?B?T0J2N0NTa0haWEVDY3ExK0Vxa0F1MkhBT3Y0WjQyb29FcFpSaVNpU3Zia1VC?=
 =?utf-8?B?a1ptc1V1ZnVtWUduMkNLeWUyUjUzV1daRE51TUVIT0gzK05zb1Bza0FTVkty?=
 =?utf-8?B?TUFFUGdDQWlIZjVGSWNwQkh1UDVZREdDVmdqSDhJVzNvZUtjZk5tY1hBdHVr?=
 =?utf-8?B?bThYaFJHSFFvWmVNeUdmbHl2SXplYnBxamhGenpTSEJ6VGxMR3I5eVpueXZ3?=
 =?utf-8?B?WFZkbWxmeVEzMjBxNGFFS04zOG9vTGhmYUNiTnl1SzVOclo2OXQ4VjEzS2xp?=
 =?utf-8?B?YjV3UmhxUHV3R1U3VTFCQjliZUdlOW1Tamx3VWV1OS8vUWVIbmIxQWNNR3Rk?=
 =?utf-8?B?YWJlT3doSmZacVloenZuMmxuVy94SDdINk9mTDlVMjlBK3ZwY3I2SjNocFJ3?=
 =?utf-8?B?UzRGSmR4UXJXYk9wSGk5U1NKc3htNHBma1VpRDZza0hCZko2OWZLdk11dmNN?=
 =?utf-8?B?SEFNUmt2T0hYOVJGV1FUNTFaQnZ3RE11UlNxRXZndkJGYXJRQlZWWkp1dlBu?=
 =?utf-8?B?QzA5alB1RUN2NUFRSStqeGQySnpZWHU5elEzb0RqU1dnR2FTTkxFRGZoOVhp?=
 =?utf-8?B?dHkrV0dyQm40QUR5eUtGTEpsTzNlYTFaWEhlV2xDZGpsVWxzMUhFMklaTjFa?=
 =?utf-8?B?THdPZGh5WG8vUHhMME5wSkF1a3ZuMTBJelpGR0pOTHpyQlVSU2IwL0Q4YnZE?=
 =?utf-8?Q?w07KyS1wJfLmIG7/6CFyTjwWJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48c1ea90-dd8a-4fea-4563-08db1bda96aa
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 11:29:45.2462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xO37xh5d1XCfllCvMWuBOeca45woZh/nAucuITIcnZaKRLIn3o4N9QcEsxl0mKJdW/9xjG7qgWQrHNzjdNI2Vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9419

On 03.03.2023 11:38, Oleksii Kurochko wrote:
> The following changes were made:
> * make GENERIC_BUG_FRAME mandatory for ARM
> * As do_bug_frame() returns -EINVAL in case something goes wrong
>   otherwise id of bug frame. Thereby 'if' cases where do_bug_frame() was
>   updated to check if the returned value is less than 0
> * Switch ARM's implementation of bug.h macros to generic one
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V5:
>  * Nothing changed

I'm glad this isn't true, and the change to common/bug.c ...

> ---
>  xen/arch/arm/Kconfig                 |  1 +
>  xen/arch/arm/arm32/traps.c           |  2 +-
>  xen/arch/arm/include/asm/arm32/bug.h |  2 -
>  xen/arch/arm/include/asm/arm64/bug.h |  2 -
>  xen/arch/arm/include/asm/bug.h       | 75 +-------------------------
>  xen/arch/arm/include/asm/traps.h     |  2 -
>  xen/arch/arm/traps.c                 | 81 +---------------------------
>  7 files changed, 4 insertions(+), 161 deletions(-)

... is gone.

Jan

