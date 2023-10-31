Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9460F7DCB07
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 11:41:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625614.975071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxmBn-0002tJ-UP; Tue, 31 Oct 2023 10:41:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625614.975071; Tue, 31 Oct 2023 10:41:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxmBn-0002r9-Rk; Tue, 31 Oct 2023 10:41:39 +0000
Received: by outflank-mailman (input) for mailman id 625614;
 Tue, 31 Oct 2023 10:41:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yzb5=GN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qxmBm-0002r2-Ll
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 10:41:38 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2081.outbound.protection.outlook.com [40.107.7.81])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10a0956d-77da-11ee-9b0e-b553b5be7939;
 Tue, 31 Oct 2023 11:41:36 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB7973.eurprd04.prod.outlook.com (2603:10a6:20b:28b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.14; Tue, 31 Oct
 2023 10:41:07 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.016; Tue, 31 Oct 2023
 10:41:07 +0000
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
X-Inumbo-ID: 10a0956d-77da-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f2B8X3UNZ94GJrywAEVgJVsQ5v+K4pmHlYN1Jqp2gJCEI/blS6fAGbbO91cWjLuSda7QVHiAOHOLY8Wa58WzRoFoP9AeU4GXHJc73J0EZ1CK53ovesbfenR1Wayl0CdYlqlbknPoMdToLadq31WGbWnZSsUVGPTogQ370YnnRL6R5yupUJoM+89yIMxsiEKSVz6Kb55t7GnXng/DlXDJWT/CwM04C4feDP3NflXVgtON6NiAf+Y9s2NJJbRPKVSwHuAhzoXID3e+yh/m+gl3JBo+pPiEMEB4AIAkO/wvjSk5sr/mgeHCUI8C5ha5kx4FK3v02T5pHVwrenBM5h1PeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Ne5CTvhi38xoXQGZMljvDY2wcpzCCeKvFhkurlLsBI=;
 b=iGxqT5y/9Lc1hn12++tgYMZKbcHrZ5rJjvNR6wFC46KcSbDXdhyQT5yf+vYFbQX5roRkW10R0uqpmwBt90VhP/djlfeYyur2ORBx2lIW2klGmSCIAjfqOTYX7YR5TjKKX0lO0mRQoxReewwBjqcJtB/WxJY45VxlKNnIq5MJ9Gh0IQvbQi2Wirrie05dYHPTUt5zExTXlCAe9UioFY2J09UCMAqtc9ZCW4qyGbhMMCFlXFVgBIZtT49QmvKS+vU0OQZ3nwMT/j9sD1mxG2O8Vlv2O+uClcl6McHIRgVl2rDLC4H4IEIPfqBjxgx5MUZlPaKNbjuHe2IcgmkdtTlCWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Ne5CTvhi38xoXQGZMljvDY2wcpzCCeKvFhkurlLsBI=;
 b=piWEnKtvd1ChKJfq0+CFPYmkXtOkG9Bp/UVY1XwIsJKifasUbKR5RM2TW58F16zmeaSOYhQ+F8HJSqiLypcbCVpreJRavKM5JFYR4YGoQjJF8SxN66uRIrXLgHL1Uo07KBzVkL923OvoLc+NYGRWJjbbozpTedoSz+sowPFokDMnrcqWgsmmU4p7GVybRIpQcTRi8WBfL/TdoJ9rm+ZHG7oyxmsj1CnokYil4k4xZzMeI8OPF2cB0dE0Wz6ieLeAc58AqJQrPk+4BFIG4Oj8nfCMMc9g++fcnV9AJLWygJb8LkNsUrRat7mdVCbKHfG9VGtO/TWZRmJ+Ftbn6TKWCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4698c943-ab16-97d0-164d-b824a0634a68@suse.com>
Date: Tue, 31 Oct 2023 11:41:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] xen: remove <asm/delay.h>
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <a9eb7c50e99db286d011169030c6ef1d92f3da23.1698747162.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a9eb7c50e99db286d011169030c6ef1d92f3da23.1698747162.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0100.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB7973:EE_
X-MS-Office365-Filtering-Correlation-Id: 641a2861-638b-422f-c85f-08dbd9fde3c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0IzyUNFEHE1+B7+ZLBI+AFltwZdj5EMMbU3TtleEhbrdNtDSg+fWdheyY7kEZtbx+mgFVANPaOAcacKzfW6T6tuI15MOa622UEcsXcjHIR9byxgegIEd49uVgpzk7BhGk7H7eP3BrzsPgJTdQU5YvsVXKKpxTx5fVmR8+aZ083DIhU5EQxpjiyZdypQXYSss+gJ5B2ABE1kWhmCMys3WCd9AMj3/MlQQiWwUc6ddgXb6IvJzw+mnZ4iH88YpTadJLiMX6tHI7rubwUzOpx6udWGkpkB+cWDXuZIV8gSaUshRUb+Hx9VJpaAZo623FtsHIxFLYDzuqTzVfCGqKOIdjYmnFyM6QM8nb/9ZqZpxQgXeASes0lvmHAoK6Qj75Lc6o/KHOoDSNhFC4YcrINzrXjJNVTkAqEngI/U5X7m3ERoN//EfK8jDHTsYqee+ANW2W2482RQT2T1gx3hG8bEP3iW4rIQsjVmc1N32X/JUlpx0rpj4RMUVn7Pfq3svKaZ2re5dUTYS9DfpMkO68xvMl3l0Se/an80tW8TwOhB9It84iXCs0PpowhjtcoMln+AsJfJV25j9i9rzxGVe89dNd3ySLNoOKV0Al0pIjsDw4D12InW83O77lz+f5IKLSLhMBJreFzwqFw5KI0NE2GTU1g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(376002)(396003)(39860400002)(136003)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(41300700001)(7416002)(31696002)(2906002)(8936002)(86362001)(8676002)(31686004)(66946007)(4326008)(66476007)(66556008)(5660300002)(54906003)(478600001)(6916009)(316002)(6486002)(36756003)(83380400001)(4744005)(2616005)(26005)(6506007)(6666004)(38100700002)(53546011)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGlqTkVSUWM5dGdBVVdRc3doZDVURHN0QVdoYlRQWWwwMVNXdjFmZWxTem1D?=
 =?utf-8?B?RjJDZWRJTVg2cHltRjNXS3Mya2JLSE9TenVydkNwRjFORzU3c3JOQWtQRnRZ?=
 =?utf-8?B?OW5rNWVIS3M2Sm5lN0FFdm45U1lQTkhTMFdlTUZCZ0JSSUZLY08vODRyYllk?=
 =?utf-8?B?bHBoVTdhbDNSSmFrOC9idHBhanpsemZMWE1zcnorTGVTTS9yZTM2Q0M5NEh1?=
 =?utf-8?B?UWkydHZrK0VSK3hRVVJjY1pFdEN5WkU5RTZIcmtyZnM3OGxJclBRdzBoeC94?=
 =?utf-8?B?RGpSN1VOUFlKcHhPTWFEdGdUVUhaY2pvT3pvWEwyV0FkcURXa2pFTUo1TFBv?=
 =?utf-8?B?a1NHTVJxdGxQSms2YWd1Tld6Rkl5SllVUmVZcXpZeVlhaC90NUhMYnZRbGx2?=
 =?utf-8?B?N0UxdUpLYlhzcG1RTXF0TTd1RWxFazh0cTQ1WmdVRWUyUFRFeE5QalNPY25z?=
 =?utf-8?B?VnhlZWUrak1LN2FIUm1IQ200bS9LeEVQSGFZaUJWRnpjL0RRWDhHbmp0TDd3?=
 =?utf-8?B?TzRwZEhJZldybU1RbEh2Um1OOUt3dHNuN2NsRk5IVUhoZnRsWVhnYkNPMWVG?=
 =?utf-8?B?alJyK2trN1FoNEYzTUMrcFdvWFBkc1NUNGlPbWh2c09jQ0tJaDJyOFF5Rk1n?=
 =?utf-8?B?Qy9VaWNqaVk1YzB4bkFadnNYYTVLT2hTcWZRTCtRZXU3Q0NNY281U3ppVVBK?=
 =?utf-8?B?Y0UvNGk5SGwrdEswMVhCdTdnUzRiUnYxc0dONnVBeFNuanJnckpQcWx4VXFP?=
 =?utf-8?B?Rkc3TkRXUTF0OFRJWkRYZDF1OU1YVmg4NmpidmR4YjlhNGpHaDFJekFPU2ZT?=
 =?utf-8?B?b3BZWXRFZFpPb1ArWlVUWUFPenlta0wwbmd6RzNsaWNkTjI0cjJoTHlJWWlp?=
 =?utf-8?B?MjR5Z0JIWU9rQW53TWdsUnloSDNHS0N2UUZkUWVYeUpBbE52Zkh0QjZlQjJn?=
 =?utf-8?B?Mk9mNWtoSng4ZDZkbENXeFVteWtQUTFXMVo5d3FmY28yWFhEdm83RnJZVFFj?=
 =?utf-8?B?QnFFRmo4Y1JEVml6bVM1WW1LRmVBeDAvU2pIeXp0M24rR3JDZEdXaUJPdjBi?=
 =?utf-8?B?TjJvL2dmdmVqWFR4RXcyTlczT3RMRm5hMjNZd2ZUOU1oZExkajhHWTVZY04z?=
 =?utf-8?B?QlNoYlNYNkh1b1VaSGt2M2dlZ2NOV1ZvZFpaVCtKV25IdVhvWWNmaXZSN1pD?=
 =?utf-8?B?bCs4WkVKeS9BK0kzM3gzTkdYZ055R04vUHZpNXJON2hSYXI1OCtVUVQ0dFVZ?=
 =?utf-8?B?bUpkWjl2MGcrZ3BTcHFtNFJIQVJyN0NqMVp3QmZkUEVZRHh4Z01MOENjbUtT?=
 =?utf-8?B?Um9ZOEYrVWErY3JiTUMwQ1ZscDJtSnNpaWl0dmhUbU01dWp1TzVQbkp3SXhQ?=
 =?utf-8?B?VE5kVVFVd3BNQkJGR3NwK25aSFRDZzRNdGZ5MmdMM2dnamY4a2d1Y2p4eGox?=
 =?utf-8?B?NlBTUEdJWkcyczZOeE9kYzB1eXd3ZDdxVXRQbktWelFJbldGSGgzbFRqOXdZ?=
 =?utf-8?B?dEJEK0R4N2ZMRm82VmVzckU4QndTM3JBZzNMLzRrSy91TXp1aG5pUUhxbm5L?=
 =?utf-8?B?bEp5ZFVQZGFNTEVmSXlkZEJ3VnFweFdLa0RFM1lRUkpvYnp1TG1BWlU2TGE4?=
 =?utf-8?B?Y0twSVk0RXVGMWFlZUM3YTJwUGZqcUUzNE12WUo0RmZrNllaUGJITU9RT3Vq?=
 =?utf-8?B?M1BHZVh5eUVobVB4SlYyWWtiSFJXUkovWk1mbysrU1JYVGZVbVV5NVdDb2pN?=
 =?utf-8?B?ZWdGUkVIUUtHWUw5K0luWFA0aGxNZEhCK3JiR2tvS1ZtWFh2am55bUpWdk9D?=
 =?utf-8?B?OW5oTzlTVEc5bWxaTkJIZjd2WGljV0k0Y29paE1uVGhFV0dra2pWVDF0VHBU?=
 =?utf-8?B?WHdrblhRMVZiV2s3ZUV3c0pPZFk5bXBvZHdFd2hkZHhGbFRDVk1oV2p6UDg0?=
 =?utf-8?B?eGlISWlaUk1kb1pQbHN5Yk43R1FGdVZlWkxhcDVyZlBIZFhOY0twUE5RVDI0?=
 =?utf-8?B?M0R5YmFTZlRKZ2ZNVzFYeDNzMllLZE5BVFdPQ2dtME5GbThRTEs1OVNJdENU?=
 =?utf-8?B?bmt1aWhmVy8weVdocTFXazFwT3ZBMjUxSjNwRjF1cFQraGpaYk5rQXNvU3l1?=
 =?utf-8?Q?kn/4cP2WKRILppVr2ZdYfR97v?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 641a2861-638b-422f-c85f-08dbd9fde3c2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 10:41:07.5520
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: REtvuR5X1Uu159DKv9+jotO3JI6s/Cj/gLztumXF03Sk0kIj4nLZ6oMMXqjmt/PvzUBK/0H8VnZ+tIt4ospY4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7973

On 31.10.2023 11:12, Oleksii Kurochko wrote:
> <asm/delay.h> only declares udelay() function so udelay()  
> declaration was moved to xen/delay.h.
> 
> For x86, __udelay() was renamed to udelay() and removed
> inclusion of <asm/delay.h> in x86 code.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  xen/arch/arm/include/asm/delay.h   | 14 --------------
>  xen/arch/riscv/include/asm/delay.h | 13 -------------
>  xen/arch/x86/cpu/microcode/core.c  |  2 +-
>  xen/arch/x86/delay.c               |  2 +-
>  xen/arch/x86/include/asm/delay.h   | 13 -------------
>  xen/include/xen/delay.h            |  3 ++-
>  6 files changed, 4 insertions(+), 43 deletions(-)
>  delete mode 100644 xen/arch/arm/include/asm/delay.h
>  delete mode 100644 xen/arch/riscv/include/asm/delay.h
>  delete mode 100644 xen/arch/x86/include/asm/delay.h

What about xen/arch/ppc/include/asm/delay.h? With that also removed
Reviewed-by: Jan Beulich <jbeulich@suse.com>
(and maybe also Suggested-by:?)

Jan

