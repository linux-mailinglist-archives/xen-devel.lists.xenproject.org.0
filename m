Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AF77483BE
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 14:05:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559153.873867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH1FO-0006LD-11; Wed, 05 Jul 2023 12:04:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559153.873867; Wed, 05 Jul 2023 12:04:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH1FN-0006J0-Uc; Wed, 05 Jul 2023 12:04:37 +0000
Received: by outflank-mailman (input) for mailman id 559153;
 Wed, 05 Jul 2023 12:04:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIgq=CX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qH1FM-0006Iu-B5
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 12:04:36 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20607.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b90ff65-1b2c-11ee-b237-6b7b168915f2;
 Wed, 05 Jul 2023 14:04:35 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8384.eurprd04.prod.outlook.com (2603:10a6:20b:3e8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 12:04:33 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Wed, 5 Jul 2023
 12:04:33 +0000
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
X-Inumbo-ID: 1b90ff65-1b2c-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lnIWJhw1xIMFJexrkqnk3I/9H0RFBi/QOfvV3yMNpL+8pvsA1hekZ0gHSM95uizNKKKEJTWFlovAbyLJfLq6bRUv3ciCib3Xr7wLTlfJaVYPuV+Jh5GEw2ULUUX+XE1Lx8PObJQ3dIOx+6tP5JPlBYm+0unT/qr6JR5BIOsbY3v9Fui6V3vjFd+b1b9IkaTlhClo4qKIsRsC8Xh7WfrkYJ4aG/5G0zd7PDA3Hzfn3rUZ+T7EoDcuT2mLM18WhqE0JvPHjqZWoXwSkY2vbH58hPD9jrTiGnrJmU/QR7QCCgi5yX834PHmSSydPw7nUJJ2pdTAQ6neW8VXk4ItIkdonA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tD60D6TKkD3e6czsRHd+8j0IitlMBo+ga/K4o1sXNIg=;
 b=QNqS5jP1owCZV4gGWJ/PzWJFLkXohf8u6bN3ochiBKxZ2txQA34WF69oUhmLRP+DHO/ynMQ4JthsyIGh0CBibcQagV8/I1KTwXtsXMeIILvydYiVGMhjZYsMMkjmMR8MayDUq4vo6T/QjMTLHg5CpUTWm2fiX209D2XcPrF7otDdhidozgUQrIx7MlT14APFv2hXbKF/QygC8uf5y+KW1JJVSF176aXKySewk137vm0e3F+w1HI4vPPFpp3r3LbmQfHF7WeZf/AbTWPSz9OpzfJq+QOY6Z9nQGrTnCIsAz4FMzUfW+dqziQYYKTpVcL/zTqm2ufPAfxQmmRKnKHM8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tD60D6TKkD3e6czsRHd+8j0IitlMBo+ga/K4o1sXNIg=;
 b=beHrs0DwbVxAsY6Gk+lEsUApdxg6wZi6fvp4tMRR+8J+9PG4KKb5HgOSwac4zV5EIeAPtQ1UWYlQwlhC+DYLexmRXOKHvcsHO5U3Ns6prHduhCBzciN0yXfZX00zA+IWuToCD3tEXA236IRNEycXv1lHKDmHUgQfIuvk2Px9FYq6Hp/3NvIzuDPmVymlB/hN4n4h0i3/mhI4wbAHew6CxtI+CIpr/iYB8gEu8Zv0Z6NUFqQrzhD6SeKpyYe9kSIiNIm34FS06jdjCXEIjGyurgAtZIvIW4aXMC+XRI1dgvm4fPJSF1AafHzED8ZNeZUUrfKRYAcIuT5P2PmgYbKhCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2761ae84-113d-c230-ad50-e9cfb0ae434b@suse.com>
Date: Wed, 5 Jul 2023 14:04:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] xen/arm: Kconfig: ACPI should depend on UEFI
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Luca.Fancellu@arm.com, michal.orzel@amd.com, Henry.Wang@arm.com,
 andrew.cooper3@citrix.com, Penny.Zheng@arm.com, wei.chen@arm.com,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20230705115534.26004-1-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230705115534.26004-1-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0005.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8384:EE_
X-MS-Office365-Filtering-Correlation-Id: 13c841d7-a245-42ce-bce3-08db7d4ffed2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YIen00zR+Go2xfDLNuKpOAkntt3prVyZb5A2VAEWNVZC8rcNnTrZm/PQj+CkjQTmMW6iqwW5g2oZyzvISVkvVNSqe+VRoxPgzPgKutUSB6ldHSuNoZqDrCiYhffc+H+JnPeTHDLyrn8bd8qH0cMRS6fNffLJ0rbowZwAXC1iPa7eCHprYxC/e4nId60s5UOSWerVYIEdiqra5/y1Rgf2uBqijGbuO2MsXq5f0DpxV2lE+97T72PKTxFAyFTvdaPKkize5FBlfUxad8kGxlU8WZHtcXJL7B10bcUo2iDvlUoWWYLxGKr/l50+qfstNYWsIhCkV3Cyn4s5l3Rm72/SZAFuMSBbisxvlxdsplBebVas5RpzgGqRM1lpFyNCeGAU/l2czS6h13pux2YhSezRhrvKBI7EH+R8ovJh0Ztz5TnqyjzO2X3dF2dzfLclron0mKlACTJ47KZ1vIpYIhzffsiueqpuM5mQTmpx1rGGX9MWvkWvZP5Fl3Xzs0i6THrZPUPr0CxPOanfBQ7yzIcrBSI13NvaPno9ddqEo5PeHsUWIaTjYBUjYI98Ns3s3DkTZdX6frp0+ruMFrGmO4pQO3whQDkwFXWVE0xdNcgw6p1+z4R1MKtIqPsok4SrohSbXEuoAd+HEGDc5utIDXBqhw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(396003)(376002)(346002)(39860400002)(451199021)(6916009)(4326008)(38100700002)(66946007)(66476007)(66556008)(2616005)(186003)(86362001)(36756003)(31696002)(6486002)(6512007)(54906003)(53546011)(478600001)(26005)(6506007)(4744005)(7416002)(31686004)(8936002)(8676002)(5660300002)(316002)(2906002)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VC84OGZJN3dpeHB2N0FJMm1WeFpBMFVLTnBtbkppT1FOOEs2cHltRE9nRFRh?=
 =?utf-8?B?TlZFTUZHVGFoZVhxV1RNWlR2VEs3NFN4by94d3o0M1Z6bjI2K0FSYlliY3JH?=
 =?utf-8?B?WldUZmZ4QkJuQyt4TGdFQmJmdERPU3JrTkFMbDJWZWQ0TGJXcDJGNysrdVZu?=
 =?utf-8?B?QnBHbmFPVkRidmVaYkdrUnlMRTJURDhWQ2h5WG5yN0tlQis0MklEeGViYUpm?=
 =?utf-8?B?RkgvUkNpQ3RmbkNKU0JXKzBDeE5pdnJCdlJ1Z2xwSU1RNEU3VmtlekQxTEJk?=
 =?utf-8?B?dnNUYjYrOFljbVRjbDlPbElHZ2hrZGpDcld6cW42VkVJZU9TU0tJa0FTSHRx?=
 =?utf-8?B?VjZRc1gwVHZLdXd0L241cmFJNzkvUjVPTnBFSnM4OUFUT3dnKzBEM0J6bXFX?=
 =?utf-8?B?Y2daMEt2UDVGOU5NTUtxSFlES1NvZmhGNFJCd2gzUDFlYXhMTDNUS0FSMzJE?=
 =?utf-8?B?WFVaTzhlUW44R2c5VGFxTHVqNmUrMTlMZFJyUjl4UFpjaHE4UmNzYVMvZjVO?=
 =?utf-8?B?TXdlVHp6MHJZZDBnVi9YdjdpaVE5YXp5MTk4MmNINDZkdk5yM2NUTGRyb3JM?=
 =?utf-8?B?NUljNTdNZlAwM2RCUFVCRVp1UXRDZWdvcEUybnQ4aktPTW9YRFJLQVFmZGt5?=
 =?utf-8?B?aXZpSVNxYzdjY3BrYzQ4WVZmaVdNM0c2c0hvbnFDajh0S0lzdDRucDBlb0hz?=
 =?utf-8?B?VVB3dTU2M0ZucTFDcTNMTEYrdU1Xb2p4dnE5QUU2TDdyNW1ja21HdHgvT1h5?=
 =?utf-8?B?aXZRcWM0NWpCVktqZ1crVldaQXJ6TlRnS3k4NWQ5NUZjVlRST1Y0TFdveCtH?=
 =?utf-8?B?SkNyc1l4ZVBWZXNqMjJzdVp4YWQvMnczOW91OUlZNXFpYkdoRkord1JzdUgy?=
 =?utf-8?B?cFAyM2s1aDZwOU9mQUV3TjlHU3JTaDR2UE15YlNIcWR3cGd2cFo2cHpRRC9C?=
 =?utf-8?B?ZXpZWEVFY0swRVhWS0FOMG1ML1JiYWFRYlJ0WlExaFhicGZYa0J6TVZlRkJj?=
 =?utf-8?B?MXpEYU5kdjdpNXJyVlBQd0t4OFhSRUltai9vLzVFcjRsK0pCZXVEZndpS0xu?=
 =?utf-8?B?bFhETHRTZWt1dEE0MmdLT2N0b3pFNlRyUWEvS3B0THhjVk9seFBtRDhOQ3hS?=
 =?utf-8?B?K2EreTgxUStCMGdDbndJNjZ6VnJpcHZxMlJ6YVkrNEFZbG1BbmVVN0hHOWd4?=
 =?utf-8?B?UkR0NE1ER29nUjM3bldnZ2QxMnJ5bmxUMnZQaW4xTkxKRi9ac2ROV2twMGRX?=
 =?utf-8?B?ZC91ZXpVcDA0c3BIYUhBSXlJMTZXZEJLRDR5YzN3OU9qTm1vTEQ4SFE4VXFO?=
 =?utf-8?B?c05ST1M5Mlk3blJXV2RMdGxiWlZsTXRzOVQ5QjQ4VkU0QVBBUTRQUW5KUGpn?=
 =?utf-8?B?YXNxQWswYVJMK25RcTRha2RyWFZrRzZHL1hxcXZmUU40OFkzN2tPelZsTjdO?=
 =?utf-8?B?UWdNRk1QOEpLcjFBdTNsUEhCYWF2YVVCRXkxWmNiNWJzdXBEaXlKRk15bU42?=
 =?utf-8?B?eVFKTFg2eGdCeURiR0J4cVVRSkY2dFAxWGFqNmlaM2w4Wmlhazk5ZVdHL0lQ?=
 =?utf-8?B?YnVibGd5QVBWeDFUUW8zTjRndTNTZFJFbzhKRjBidlJRODVlZ1FjN2t3T3FB?=
 =?utf-8?B?N3B6OXU3akxIcDc3V3A5QnA1WjVPUU5hZ2txUkt0cFZzTDVOVWVJc1RFTU1K?=
 =?utf-8?B?VXpER2RTMXlocFlQR0tYM3dPOUpsaXJ3a3ZydEZLdEQrd2VLV1Qxbko5TVJ1?=
 =?utf-8?B?YWJYM1J2dHp0dVFmd1R0OVc0RXIrNW1KYkxVYjZIWmxjWGdMU2NndHkwTktN?=
 =?utf-8?B?U0RiWFoyaUZwdUhQQWNnY3VHYm9JTklnb1pMazhUY21qMWtWMmVuWlhLbnNn?=
 =?utf-8?B?QkZOU0k2S0lBVm8vc1YxVGtrN3oxN1RRYkRORUVsSzZIS1dJZk5TbmhmSUNF?=
 =?utf-8?B?dFZvdlBsNi9HOXk4N0htNHZ6NWdhYjhMRHlYekE1ZFJhM0ZOVDhaaFMvMXZq?=
 =?utf-8?B?aFU4dnBHdWdrSkhKcVdxdGlBdkc5U3RpQmdxM0pMUWtQeGMxTzI3VmFWTkk5?=
 =?utf-8?B?ZGtwN1dBVkJUVzI5NGluS0trVlk0NElNTnhKb282V0VjYVFwd1pwOWJwY2F3?=
 =?utf-8?Q?0LZvKKEGClB7Tg1BHcBX1FGn7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13c841d7-a245-42ce-bce3-08db7d4ffed2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 12:04:33.5170
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 71OcOoIh3DQm4n9SgYTDEDdfF9iHY/yGuTDPk11i2enxofb7PFaH3grHwSi5+kBWNp3vsK+thChlKkCZq0AqxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8384

On 05.07.2023 13:55, Julien Grall wrote:
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -63,11 +63,11 @@ source "arch/Kconfig"
>  
>  config ACPI
>  	bool "ACPI (Advanced Configuration and Power Interface) Support (UNSUPPORTED)" if UNSUPPORTED
> -	depends on ARM_64
> +	depends on ARM_64 && ARM_EFI

Wouldn't it make sense to drop the ARM_64 dependency then? It's now
redundant, and it seems quite likely that if EFI was ever support
for 32-bit, ACPI could then be supported there as well.

Jan

