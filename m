Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 473EE6E94C3
	for <lists+xen-devel@lfdr.de>; Thu, 20 Apr 2023 14:41:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524257.815050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppTbM-0007Q6-2w; Thu, 20 Apr 2023 12:41:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524257.815050; Thu, 20 Apr 2023 12:41:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppTbL-0007OP-WB; Thu, 20 Apr 2023 12:41:27 +0000
Received: by outflank-mailman (input) for mailman id 524257;
 Thu, 20 Apr 2023 12:41:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fY2H=AL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ppTbK-0007O7-7i
 for xen-devel@lists.xenproject.org; Thu, 20 Apr 2023 12:41:26 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20628.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a9973f91-df78-11ed-b21f-6b7b168915f2;
 Thu, 20 Apr 2023 14:41:25 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9123.eurprd04.prod.outlook.com (2603:10a6:102:22e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.21; Thu, 20 Apr
 2023 12:41:24 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 12:41:24 +0000
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
X-Inumbo-ID: a9973f91-df78-11ed-b21f-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VYzuSukPP4wtDlovFc4yWowamFVYpgonPomntO9A4N15vUuKtvTI395qeRVZ5HOY4MIiTeDdr/XOiE2bOpbFpyo4Op73dRt13yrud1QQQGwW145xioKmoyNujfNeLRCmSYJA0H8qh714P68TAHjwDAa8+ECL9MLfhM48xDVVm7q8JvI4EmJKa6nWMayEMgmg8tnsKvKtkterDiPT99l7Ybc6NENMbwj5TCNOSVMOd2UicT1luytS784eQnstfGL4nbb49xO1avLVS7+sZrFPPe6u/bye4ZSwL+7LNdsn3UvsPxB9lIm0ywJS05i03LDgDmyHeQEgSyB78FyWS+N4YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oa7hjJ+1iyAibRi5KjUaA36TQGdTBA5D+gtL6is65VE=;
 b=GzktQZvLiOX9Uv08DOZmA0r+aBBYzv1IP2F8q4cSRbwDyiNSaj829Vnc6WutMKLjL7m2C7uVcJSFuEQE/MZ2GD+UOjVBZIofRwotGz4pZRhwOOYJpo5hJt+RLO8HHjzyBoiWFP7LEn2c5TnvyNOfSeW1BlRDcTQp5CVZtuvudXGy7E3acIKDZ1QWxCtViTF4rspPyQiucQOkN8wt9QhsDDcd0cGA3G/m9MyYV4GyVrl2Xe3KZb1m9lI+SsOQ1eUkz17o3/FLVLTl2YXwul1334yAL0VzgBVmk8xdnZ1I8u+xqMvZ+kXD4D36t0HmvrKYj31LKJlWxKzFMY4sTpSObA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oa7hjJ+1iyAibRi5KjUaA36TQGdTBA5D+gtL6is65VE=;
 b=wE2dI1/Zp9gQ/9PnJaaEt4EmnAgkOivqPvJJempiFg1mi1+Bi5tasHkr83g82msenemmxIVQhz1eC/882q6XABQm8+KZ9XoD1MRUlTY1qR4Lh44d4zswkoaNnu1gJmoq5wbp5x4Uh53WFJZvJOuWShi3eZKc+pxQTPeXuNIx9N4p5LkWM56bO8+VC50qQdCtykG5ynHXN1o4fZexYqB8Jhq/YVkYZrO/M7wjdA9lZWPw78HYhOjoUyvFHD7XKqYgqT7ST+zPnb9tQ12jIBW7VDE4ZEBL6WoToiaooYjmsOrZKoIoAA+LXAddcoMJ12JMwF2wW2V1ib8RSidJQ8QlsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <97a3bcbe-8f04-e4d6-a4ae-adc45543bc6b@suse.com>
Date: Thu, 20 Apr 2023 14:41:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 02/17] xen/arm: implement helpers to get and update
 NUMA status
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
Cc: Wei Chen <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20230420112521.3272732-1-Henry.Wang@arm.com>
 <20230420112521.3272732-3-Henry.Wang@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230420112521.3272732-3-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9123:EE_
X-MS-Office365-Filtering-Correlation-Id: db012417-e18a-4773-b2e6-08db419c8d33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ix9kM3/TPnkZ+pzSWrVajKsdIeUAJJaXZiqsQRSDj79qDvo9N1Lqs3c/sgCfFA6tOso6LNSMN3POb+TQUvlA9MhcfWAlMjj5jJm9xoWsETo4G/XkBRVY1/wSK0ZCmwKiIUxDr7Ruh0XiNlD6rXR1OhQrtnU0m+ouPsTkwR2XqPQUxPMSSGH7u0i6W1mb6itGZuH310MfdT+iJKxyJzTGCGzasLr9TlUJxvrPKf0M4EzecGASfcaKpQdbq0Qb2EU1IVvN9vTPlKA1bKpvaKiW3l6VpQ+VX0jxr5Rc6NWnjVHAMFk1eJr3g5hwTY3DlrleGcFY2c/Mn+x4LH+fSHfxiwSn1Xg3hMW4Mer4s5k1KOYbvVsITfjWl3ZzpjIsz0G+3x08OD6bcaHwNC+drrwEx9QSJOFanuDEsxm8b+ztVfn1w/qkyOkWpehFioH7fbedct7PVU5ngbXmKNe0QQO9eBKrV1IKrA6KJ2Dg09z6JpV6P1ZHNuNxje5Bzl8jAcZE4dUMEdeg8+KFvEvFYfdtAhcUzIKd2W3ATdu4lpHuHqYuDiohLv+pHfQWprNoBT7APQ5z1Vr1wTO6EXbj8MCgpzy0RgXjXWDEm359P5v+X84ZHmj5Fu34Ljn5Q1IfiU0na+T9MwZt8WIxZhfj1QI4uQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(396003)(376002)(366004)(346002)(451199021)(53546011)(2906002)(54906003)(86362001)(2616005)(66556008)(66476007)(66946007)(6916009)(4326008)(38100700002)(36756003)(316002)(31686004)(6486002)(8936002)(8676002)(26005)(186003)(6512007)(478600001)(6506007)(15650500001)(5660300002)(41300700001)(83380400001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d3hzNUFZVWNUczZPWVBLTXVxT0dnbVhaOVNlVmh0MHJaMVJiS0hDWU5WM3ph?=
 =?utf-8?B?V1U1Z3pCcW9SRnBZLzNsa2k1V0NtWWZUNTZpZEJRa1Y1akRvNVdXY1J6ZjBI?=
 =?utf-8?B?TGE0aktXc0dKSGR5ZktVUm5sQU5pY2ZiTFhHOE1EZWxnVmFXTWUrcWNoY0tH?=
 =?utf-8?B?S1JZUDlIRlZZVitnaTgwcVVHLzhrUG1aSEUzY2duT25EbGs5NGNlSzVLZ0lU?=
 =?utf-8?B?Qm5zNnhSV1NZYnJRZVdBdnZtejVkdzcvMkVXSU1hMm14T004anpCMjE0b0tl?=
 =?utf-8?B?ZHc2NDFqRk1NYmtyMHAyRUtmcXZsL1QxcFlYVGZua1ExeEZIR3NqbzU4Mjdv?=
 =?utf-8?B?YWlXWldtdHVrL1pGeHNlSE9BckhnSDMvRlFHcllaU0JISVpBTGNkNnI5MjdU?=
 =?utf-8?B?VFI1UkRyTStKWnRpVjZCcXl3ZTRFUit6VEYzRGJQd1ptanR4RW5NQ21LakQ3?=
 =?utf-8?B?RmlXOE5NWDJrTnVwVndhbWNod1VsYlVUd3l5NzhLcWQrakRjMEN4aEl6SnRF?=
 =?utf-8?B?TXdxWWFOYmJnRFlaOUJ0SkVGb3FEc1hSMW1LY1JTd25aWUY0Vy9yQ3ZiMStz?=
 =?utf-8?B?dDRCYTF5WjNySFdubzNiUVFUR2drV2ZQOVNkdG5tS1hVTnlKOGdGN2l3SGha?=
 =?utf-8?B?TEkrSlMxbVMyV0VXeU9ldDh3YjdhTmx6N2FMM21WdGtUazBOUGxnR1dQQW9t?=
 =?utf-8?B?UUhwdG5KR0ZZc29zZS9lZk1sTmZkZEZrZ1l3QStzTERORngwQmFNQ1QvYm5V?=
 =?utf-8?B?VG1JZGNBcHNMaHFlZHNiem9xYm9KQWFZeUtNc3NZc2dlUnR1aVBhTGdJaTdn?=
 =?utf-8?B?OW5laGZ3bzlhSmNLUWU2VDdOVnR5cndmejh5enNWZUhwZnNPbnMxTWF1VlR0?=
 =?utf-8?B?bXVKUHArU0luN0QvY2lHTTROcXFBMDF6bjZ3WGFna1ZRQjFJMnljSzhtSkg3?=
 =?utf-8?B?STYzSFNrTWEwU3BYYlk3ZFozbFBseXNnbDR0TUkxeWFTNVZyMEhvaVVyTFRJ?=
 =?utf-8?B?NkIrWjFwQm9pQU5DSjQ2UHU2WmhIc25GU2xBUHk5MlhzVW0yMDVhdWFhTU03?=
 =?utf-8?B?ZmVuSEhobUNGM0dEakhJQzhLck1lTXRuREVxWGJaSGlIQWFNT0JKTUlNSmdu?=
 =?utf-8?B?NXJxemcyRW1waTVkbjFyMXB6L2VCNXU2ZjEwbkpCU29saDVhaXBZS1ZaNlAw?=
 =?utf-8?B?djNvcUFxbnFmT09tamYwYjBBcWp6WXYrazJFQ2l3SWlBcm4xcURHMEU2a01H?=
 =?utf-8?B?WE5EVnJzMS9EMlZ6dkhnTDM4NFdIUnhzSEkvRFB0b2UySHdBTlg0WXphanVZ?=
 =?utf-8?B?azh6cVYvVjhQN0NRSW1ncjFSWlFRRTgwamEvTW1PMWF4OGJBbFFYaW1BUWtT?=
 =?utf-8?B?VDY5bzJveE55WHZuV0xPRktiQXVsS2o1a0FXUVV2bWNqUWxsVzJtaHBuNUt2?=
 =?utf-8?B?UzBQL2Q4SG1tVXVCQWJyS29mdWNyUmJuVG5tbjdCS3dZTFViU0VRM25oTjRk?=
 =?utf-8?B?TWlBZTlqZnBYRm9XZDdjWjVzSGJ2djl4UGhJTUdkMGtIdWcrRzU0akQ0UW9w?=
 =?utf-8?B?M2FWZUgzTWltZ3paM1JsZU82SFFueG5ZRlRmT3hGYUZDZWtVYVE1ZnNpVXRK?=
 =?utf-8?B?N3AxbXFOZWQyU21YV1NaaVRmSUxCQmQyQ00zQVZENTQvMFBia09rSU1RWTM5?=
 =?utf-8?B?UzI4SW1PZzAvUWJabWg0SDZ3UUNyNmFMZE1EcVdUaGU3NWZpUUpFcHJkMVVX?=
 =?utf-8?B?SUp5TUUwYzVjVUxKcDhuUVIxby9icWJRQlhGcFRnTkNJNDZhRWtjZWlGb0xK?=
 =?utf-8?B?OEdiY1d0SFJESjlhYnhwL05IcTd3RkFKVVBMUWtReXgwaGNZSjRTMnhZVm1u?=
 =?utf-8?B?cW5xODNGanJ1OHVkTmZFU2ZHZGtkbFVwdFI1dTBPajgvenI2dENsODBSTk9Q?=
 =?utf-8?B?R0daek1MRGpUMmtDWkdZMFd4Wm1NTzY0OGU1OGVoNk0zR1dCY1RjbTVQRnJJ?=
 =?utf-8?B?MFRUY3V4elhCcGRxSzdjUFdBRG51MDNhYU5IdU9XaHliODhzSEsvdHV6T0g5?=
 =?utf-8?B?VlFCVXVnN0YvRmVNeDAvRmZUcXFwZWl4b1ZCRDdwU1d4QWVCbTdkVzBJOFBI?=
 =?utf-8?Q?sL88cARZ2Spcn2l38dtW86oOe?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db012417-e18a-4773-b2e6-08db419c8d33
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2023 12:41:24.4133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EimQkhGv/0VanbFzU0HwN5WOX+iPkNiOVWM0UTcN09yGxyt7Rvt7DiUN9i8nyj2iBEHXtlnFvUf/HqXlKoRc1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9123

On 20.04.2023 13:25, Henry Wang wrote:
> From: Wei Chen <wei.chen@arm.com>
> 
> NUMA has one global and one implementation specific switches. For
> ACPI NUMA implementation, Xen has acpi_numa, so we introduce
> device_tree_numa for device tree NUMA implementation. And use
> enumerations to indicate init, off and on status.
> 
> arch_numa_disabled will get device_tree_numa status, but for
> arch_numa_setup we have not provided boot arguments to setup
> device_tree_numa. So we just return -EINVAL in this patch.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> ---
> v2 -> v3:
> 1. Rename the first entry of enum dt_numa_status as DT_NUMA_DEFAULT.
> 2. Make enum dt_numa_status device_tree_numa as __ro_after_init and
>    assign it explicitly to DT_NUMA_DEFAULT.
> 3. Update the year in copyright to 2023.
> 4. Don't move the x86 numa_disabled() and make Arm's numa_disabled()
>    a static inline function for !CONFIG_NUMA.
> v1 -> v2:
> 1. Use arch_numa_disabled to replace numa_enable_with_firmware.
> 2. Introduce enumerations for device tree numa status.
> 3. Use common numa_disabled, drop Arm version numa_disabled.
> 4. Introduce arch_numa_setup for Arm.
> 5. Rename bad_srat to numa_bad.
> 6. Add numa_enable_with_firmware helper.
> 7. Add numa_disabled helper.
> 8. Refine commit message.
> ---
>  xen/arch/arm/include/asm/numa.h | 17 +++++++++++
>  xen/arch/arm/numa.c             | 50 +++++++++++++++++++++++++++++++++
>  2 files changed, 67 insertions(+)
>  create mode 100644 xen/arch/arm/numa.c

While I was Cc-ed on this one, neither the diffstat nor any possible remarks
make clear whether anything is expected of me here.

Jan

