Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B1C669346
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 10:50:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476993.739485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGGh3-0005CI-9E; Fri, 13 Jan 2023 09:49:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476993.739485; Fri, 13 Jan 2023 09:49:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGGh3-00058s-6U; Fri, 13 Jan 2023 09:49:49 +0000
Received: by outflank-mailman (input) for mailman id 476993;
 Fri, 13 Jan 2023 09:49:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=grKZ=5K=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pGGh1-0004qT-La
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 09:49:47 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2070.outbound.protection.outlook.com [40.107.20.70])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9cdee9b5-9327-11ed-91b6-6bf2151ebd3b;
 Fri, 13 Jan 2023 10:49:46 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7434.eurprd04.prod.outlook.com (2603:10a6:102:8e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Fri, 13 Jan
 2023 09:49:45 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Fri, 13 Jan 2023
 09:49:45 +0000
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
X-Inumbo-ID: 9cdee9b5-9327-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bgxfBpqWOlP7kPPgJyxsSfXZXgMyDmwOoY4x+DXAEo9Yrcy/S8wzhxB5h+rOxyD1MFh3itQKmmWFhl0IP/XQLJk/OQhidZTrdXeTSMpvLBKGYpoP79MKLuHdplVaZvGu3kD+iZeymPPDvtk1sxKyu0CM2Ckdo6v4RjU4OMMb7Zt25UB+pwWxN/qd6ucvHmou1EJsTsMfvXDEXq0lXAQtQdi2W/Z33SeSoFKYdezqroPdmxdXk/3aM8FqA6+i+f/yamaJECVqDStgrF8in2mqz6sl50kmS9gT1wVTlBVTABUY//ysCd28tR9bZVj0RPdR3MrPp5L8UIIBF0fuoh0D/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IwfXkk+qTKlGw8HTM4dD2ubDPmrKmk+UOqeFoGLmFVA=;
 b=C//Lg72e+J5H3FG2EDqGFDj/waRKP26RP5+Qt+yvCW0kflovTA5pYHwfzIL+ta3jlf8zIiBBkI4ljlIETMFkpFjYieA5PzGp4oCIMRmqEykA1nGos8Z61PzDgOz44L8VVeApOa4KeD1exKdGFdE6H1VRECZDG6Jxf6iYUiNcKZQ1XkpfxGLsltz3HfBCKBhxFhd89n6yTaGUtEfqkLL2L1/zyXiF+SXqFcPwPKDggCrrrOAYKZMhLSLoYuUMNH25z3vOUxxQs3h4OwTYcjkHGUz5tiU4kBzNorksLSmy55C8SvFt4Gzss/PwpIyroTCFNJK8UaHoBkgRp9MDkJaxPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IwfXkk+qTKlGw8HTM4dD2ubDPmrKmk+UOqeFoGLmFVA=;
 b=ZoVk5v9/mCr7WNW31SsmZeInSOS9+rk/t5k6P+cPWFnM6pmsqBdQAiBfWag0RD1WHqMr4CsU/8JTq/+3XkCLUzIO6y5b0HJS+CzaPh3kNlJw6ycYhGKOEwmYgfByJ7GYTvW8j87cNTM52MByhyD5lgbWVTiRvwnIYF58igjvmDNQx2x2aWipgn6iAsFGG5B9vgoxcSw1khe/DVsO2LYWYxJwLvh+wCvSP0USVMOfZqVlmtkyY6/Rd4Hz163JQUjllNllCCYbFWwf/w0Z9Mn8qkqte46xKRyQtdhL2nCAoOjC94k13CxKj3nR3O0bt32mAPKiUaa23tRDzYhnijzPRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0cdb6601-c549-fd0f-18f1-6106ed3a7e2a@suse.com>
Date: Fri, 13 Jan 2023 10:49:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 32/40] xen/mpu: implement MPU version of ioremap_xxx
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
 <20230113052914.3845596-33-Penny.Zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230113052914.3845596-33-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0002.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PR3PR04MB7434:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d0d35a3-d2e8-46f5-27eb-08daf54b801b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3nkoPJUkXXf5PjA7gi4guV7U/khgvyJ13fsufRpY/OxfRPewHLC3h5WstCeK5NfbDnkyRXxj4/agdrhk1bM8zVjHolrd3mkRkVtayPf13wK7JA8vAhIG8rlucHjTHqhotcCzDi8I+s8j1QKp2ciL9nZTPkPuzYJdR18QnlTLuSmxuHOnoluydiKOxshajp19V/YQTXGpNNYQcTqDmNEl7oN48oUak7KNBYqswS6KT0LQcCNFtY+TVfJYiuLGbIWlHx4oUrFFSDRAlVcTtRWY5iKcPKD3xvsVbFix+lGyHc3oL8QT26LG9MJeK9uT56eWf6v9c6QeuXQLobX/kxf5+t2upE48Fftl1d4ehP4oMbcx6gwlpcKjalVPkdo6oZiLrxdU0qBaMo2VDOPBRqUnTcJ3goC7H2IZaoRPbojYS6VCgDc9i3QTpxt4Xd1T24mRJylU8VBEzOo//sJ3cnvI/vIIcyqoOJvBi+6HcenVXlW807DLttSEhjVgs3odsFEc/DAXYxZ/4IU9KJ6R4JCsHn5ExLwyeKs9vfRs1yCGukv9Jg1ICumVnPMSKKxlI8h/JlazB3XZAqR/fKh/8SuokE5Q+il5W/A5+61ZUmt7kKJ1mKIZec4uwyLcW+UMoteXyqzWlkKJbPvutZ5v1HlHSj4u6J5m1HjBmc8T/IpEkqVIuRg8soncYGluD/1iVtHVxUqKMsle0oFQhFt056TBZ4nXQU8E7089gk0ACTzO2UM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(366004)(136003)(396003)(346002)(376002)(451199015)(83380400001)(31696002)(38100700002)(86362001)(2906002)(4744005)(41300700001)(7416002)(5660300002)(8936002)(53546011)(478600001)(6506007)(6666004)(2616005)(186003)(26005)(6512007)(6486002)(316002)(8676002)(6916009)(4326008)(66476007)(66946007)(66556008)(54906003)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0Qzc28xTXVtV2RMb0ZGcDBnNFVaKzB0VUFWbUtDaWhBTmc0OTBkYmN4Vmo4?=
 =?utf-8?B?MHorbEJ0Y3B3QllvVFRmZnRVRjUrSEZZa0x2RjVDcDk4VVBtZ29DWjZ6T0sz?=
 =?utf-8?B?QzhsQzNNVFQ1L1Z0MjlsYWdIaEZvVnNTSFR1L0t5NGdZVFVXZUYvdWVMdytx?=
 =?utf-8?B?U3NDdG02ZHVjRzQvamM2Q0xZWWNMaVpXdllHcVEwN1VEMDdrVVF3TURvUGZr?=
 =?utf-8?B?QlRpd1VCb3RXc0xOM2IrL3Nmb1RzYVZLYmQyWWxnZTJQZDFkbXpRbGZ2ZUM5?=
 =?utf-8?B?ZjFjazR0dkVaaVdUTWpoS2ZTK09keW40RzhaZCtoUmFLYWp4eHJOa1pRWkZ1?=
 =?utf-8?B?d0ZqbUlJUThPV0pJRDc2azdUdkdJRDA5MFZaN1hlR1ZjV2dRQzUxZnBGL2Ir?=
 =?utf-8?B?bENmWThneHFhMmliMXYxYVFOblI2c29yMUFQVml4T3lDSktqWWE3S1FSZFIx?=
 =?utf-8?B?RGFITmk0djQ4L0NyK3hTZEpjMkp5cmFBUkhQWUdnRURTSXJacEY5YzRWU2Mx?=
 =?utf-8?B?dVBidGp0Vzh0UVdVQzJTZzZwWklhOFY1SHpxZDBoNEROSjE5Y2w1bGd3c3lB?=
 =?utf-8?B?VlJ1NVBnblhzajl1Q0pORmsvWjQzUkVwRzM2eWJEYlY2QTFoOWRCQXNKVzNC?=
 =?utf-8?B?UXJ6MmRiRjFWODVESDFWOE1LY2hNM2RhR0RhZ0dJbCtlK1kzRitWVUR1V3dJ?=
 =?utf-8?B?cjNJWGc4MHkveFlMRHNmSEFsS200RW5KOUtlRGRUeERmMHNHTnk0NGswRHJp?=
 =?utf-8?B?VXpMdHBNSXU1Zk1GbXQwQzhCTVhoR3hyYTlVazc2VHZKZXdwWXdqNFR4SDhk?=
 =?utf-8?B?WkJFSkFuM3JpSlpmRE40Rk5TRnBXZlFib01LQU5NeVBZM2wyUlNXMVRPalN5?=
 =?utf-8?B?U2tra0JjVjVpOUFaT3U5SkVvc3VVMS9lRC9LZDFzTTN2dmg0WEV0c0FzaCtF?=
 =?utf-8?B?UVNhbEl1QUxQWG1jUFJoL0liWFJVd2laZnM4UjdyMEpNYXlYSlVsVjRCais5?=
 =?utf-8?B?Q2hoeTMvTkFFZjFtSXBkNlg5TWdJeVlUZ3pES0pqZmNKREVDblZ6SkI3M2ZI?=
 =?utf-8?B?MXZlcXFrdGs0WmRaZzlPUlUrUzM1aVJTUFNWc3lYUlVrTUtvaVlLdXEyTlZo?=
 =?utf-8?B?aGFBSWJhQi82TWlTZTJrWW1WUnM4ekRaODFUL0xhU3BkbEg3dzJMb1lmYWJx?=
 =?utf-8?B?MXE1cW9uSFY5UWpranVNeEFnWGtSVm40SHNBYldyUXU5cXd6Z2h6Ynp6bFVm?=
 =?utf-8?B?aHdtV2hTM1E2a2J1Y21ESDEvb0wybVJXT3ZRVjN1ZEFBaHp5VFhLbEFkWUtq?=
 =?utf-8?B?aE9hczU3VmJ2UXlZalROSXBYZDV2WVQxdTF0OXMrdWdTZjJ1WWZQdmlOcG1x?=
 =?utf-8?B?SjY4NTVaRlM2WU4ySTdqV0MxMWNNYjBzTksrc2RCd1NwZjFBc0ZxRmQrbFcw?=
 =?utf-8?B?UUowTkp4SktCR2k3TTd2OU1wUlJueVIwbVorWkcvTzdYcUl0Q2VZRzA1eG5X?=
 =?utf-8?B?UWszRVZPTUpLV00xK0RaZWlVeEhXVVRPM2lIUnJremNoNHpSMFBrVW5Hc2hv?=
 =?utf-8?B?UDhZYWxiTTd6U1dvbGdkWkpBOWc4dGJqdnZHOWdwMWdBdDYyUDYvTVFKL2g1?=
 =?utf-8?B?dXptWjJCcjRsNlVXaFhFb2tkUXVoOUd1QmpvbW1MMU1FdlEyN2hYdDVFbG1R?=
 =?utf-8?B?OWJtTWJmalBXSkxGbWVUVzZ4c2RYLzVIOGJ2OER1dUhPc1dOcTlobDVPOHZS?=
 =?utf-8?B?K1FJQjJMNEs1c2lvNFp0ZXNXQzJtTXF4U084K3ZZUnlhVGdHaTRyb2QwQlV6?=
 =?utf-8?B?M24zd2svZTJPVkpqa0c1bEJCZEVSaXdkK1BTTTkrU0xicTRPWk45TzdoYUZO?=
 =?utf-8?B?cHlITGk1NEhVT0NiMmM4K1VGZUlYY0YzaU9pQnJOOHE1VmtvM3ZzK0phbmVp?=
 =?utf-8?B?dTdWWUp3c2pvOFJZN2dDb1Y4V2xMdGYzR09Fb1dORnJjbWxDc0hlUnUxQmNm?=
 =?utf-8?B?WkxnZzFIc3Z1NytGMFN5Qlp5Y3RUcmZZanNZTEd4T2YwZjdVd2tpTGlSVEpw?=
 =?utf-8?B?V1FQNnRUVnlqbWp1VlU1bmZhSVdmR2xDY050ZXNaYUMrdEw3VkprRmlkdzIy?=
 =?utf-8?Q?SUwkLQEeRunlca6aiFdRPFvQ0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d0d35a3-d2e8-46f5-27eb-08daf54b801b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 09:49:44.8993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5yHrG4A4uoawHSxEboqGwFhc+Z0R03KRDWNJTuinvsNGBkBNu/c0AIbk0hasBc8++pSueaT13hZuVPi15HJ2Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7434

On 13.01.2023 06:29, Penny Zheng wrote:
> --- a/xen/include/xen/vmap.h
> +++ b/xen/include/xen/vmap.h
> @@ -89,15 +89,27 @@ static inline void vfree(void *va)
>      ASSERT_UNREACHABLE();
>  }
>  
> +#ifdef CONFIG_HAS_MPU
> +void __iomem *ioremap(paddr_t, size_t);
> +#else
>  void __iomem *ioremap(paddr_t, size_t)
>  {
>      ASSERT_UNREACHABLE();
>      return NULL;
>  }
> +#endif

If, as per the comment on the earlier patch, a mere declaration isn't
sufficient, the earlier patch will need to make the stub static inline.
I'm actually surprised you didn't see a build failure from it not being
so. At the point here I then actually question why the stub function
isn't being dropped here again (assuming it needs putting in place at
all earlier on).

Furthermore, once you want a declaration for the function here as well,
I think it would be better to consolidate both declarations: It's
awkward to have to remember to update two instances, in case any
changes are necessary.

Jan

