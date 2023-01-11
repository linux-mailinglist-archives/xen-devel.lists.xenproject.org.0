Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A926B665EAC
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jan 2023 16:04:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475586.737324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFcde-0003aV-DN; Wed, 11 Jan 2023 15:03:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475586.737324; Wed, 11 Jan 2023 15:03:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFcde-0003XI-9J; Wed, 11 Jan 2023 15:03:38 +0000
Received: by outflank-mailman (input) for mailman id 475586;
 Wed, 11 Jan 2023 15:03:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1UMm=5I=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pFcdc-0003X9-Pb
 for xen-devel@lists.xenproject.org; Wed, 11 Jan 2023 15:03:36 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2073.outbound.protection.outlook.com [40.107.241.73])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e721a8e-91c1-11ed-b8d0-410ff93cb8f0;
 Wed, 11 Jan 2023 16:03:34 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9295.eurprd04.prod.outlook.com (2603:10a6:102:2a6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 15:03:33 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Wed, 11 Jan 2023
 15:03:32 +0000
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
X-Inumbo-ID: 1e721a8e-91c1-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kH9vcWJ9kkOGpKMUpOq6ex7oKL1dSmJZ1RnC+nAoXuildWt1487dzMy+sqfFyD4nny+jKv1zNhB0iMpSgUVfsq2/sx/G/9WeQMKKORUx336pZMkt38mUuJnQZ9IUV0eFeG6UjIK2/PV3AgQn24yw25RryagKppoHs6sW5EyY23l71d9TR8FbAPP8ii7ftBquSPZBxs+6gM+yPa1SZY5czD7AO+svguPuTJrkQfKbyF0zCF2Oe9rj46JrqOeo+xcbuUOjemDAyO2MQ0KBoraW6TYB3g+5Znctz0K9+tWn43sN+CxOoUSgcbua4Ad5BnWc7ZnT/B8BV+w6fjAQqlvNRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UeZYyUPop4VvJLAt7/aINgFGYQAOIKFvFeiRXTQo8g4=;
 b=mVZmY8xqziqujV6fPO7T5BbDrC6WcQ+m/P5qkM7gFvhZBsLbGSNiT+dzYkNPJRNkUpja7G2oxlXQEcYO1lY19BYdFF8KYOrAR81QaNO+Lkm3+cSHkGGWKS3GkEiYPf1NOmYvDK1QgsLtLRUNDegB33ClpDEW36E236AYcefkGJd7D0cCVjVd7IC1aLF3pMXe6JYXV37KX48IQ4LSZVa+DaxyWyoNNQ0YdWddIFWRnXpDLiBbMXfVOXvpyhLEOz9CoQRlsDllMT5lbIXsvfb/zHSefNuXbfKSS1ERMEE84bvvWhRuZS08s4d1cve+fodlcnRxz9DTIdEon7AZ0jiK7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UeZYyUPop4VvJLAt7/aINgFGYQAOIKFvFeiRXTQo8g4=;
 b=uVMM8t2IZQ5pXBlNHoLZ4sQzx1++LxLey1bee7xzRycW/xA/pOQlz+S4ocXjvo2ZT2XbVW+JadfVMiwX+xfKpUHlO8c0trWX/wGNnUE28QfLoaXSdFfPI6voYHPV2gyYXvtAhx5xz6xOwEItj1C8UHMm57bPueUeniBBkPGZZ8tGecO57DZKW4V7W8l93QI0jQBN4aoOoRKOqPf5g6u9elq+Z4OJKLwSUyLC56Wh4U/U0brvWaxLEc76VoKQ4gcrAWZq714vhdilu4BgQfLrJs+ahV13FqeBM+x+/pQUa6iuSGJcwD0QZiGl69x8pIEab3+rvavOBfttaS41M3sJ9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bbb9b0c5-886a-0fa1-d44d-9144fb86efb0@suse.com>
Date: Wed, 11 Jan 2023 16:03:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 2/8] x86/iommu: amd_iommu_perdev_intremap is AMD-Vi
 specific
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230104084502.61734-1-burzalodowa@gmail.com>
 <20230104084502.61734-3-burzalodowa@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230104084502.61734-3-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0129.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB9295:EE_
X-MS-Office365-Filtering-Correlation-Id: ed9ca9cf-77bc-4793-e58d-08daf3e501a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ur4+6uijsqCtYZikcIsczVycL0g9jZyhA4AIYOKlxFbNWQNPIYHTQnYUMFY3sTcQWPkYNJsSUnH62hd5GGvWAJFcDwbzoRyWoSya4MINhmLIt9FBIWLB7UCKyTQQ80aiC7bWaGmukyIT4puBpw0jPEspt7ke4sV/TZKgcsZTwveb6vh6tSLGkzvOCjaNg5Gbdzu/UkbGYc1HpqsNEU80f/Dw36kYPOGVwtBHtxhIqUhBP410N0Yu6lkzrZH2AdvsH7FtD7dxFUBZSPB4jbrCJhMivV8hoc5BIaE5M48iZXwBWVvXsPQScJJEhpomu/Q3Ti9LwvbfRsNO/TUW0MfsX/QUidoc1LDCZWPRQ+JC+T1tkLdu5e5gudqIwq7iaRTXLwAnAt0YVBM7eyfiyA8JJZ674W11fxu59d+bit4/8l5FtB/OlNiN4xwMXJkGROJw8wqIhYgW68jMZyY3IVbHo3eWob4GLUz4+yY661oxhKDPbcIGYg9CubMYQxb2vUbRxw5Bjx/BEurUdQXaIoai7BpzwOgcK/IY40y5jFh+Da/IEe67bI2S9PmJ487F7Uzkz7mBXE+n4WyDplnYa23DOr1SZczHlOevVV0myXcWCRoQj/dKaEU8NpoT3f+x5S4mqjHnr08Sqo2RrJBV9ELUpCAg90U8ks37MqizhSHYLX1CcLDj82/L+Dw6MrV8HPY2Bic3Htaam1yDOF3MDzRacbAFHEqjjZV2MfX/MIyuClU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(346002)(39860400002)(396003)(366004)(136003)(451199015)(36756003)(31686004)(86362001)(4326008)(66556008)(41300700001)(31696002)(54906003)(8676002)(66946007)(66476007)(38100700002)(6916009)(53546011)(6486002)(186003)(26005)(6506007)(2906002)(8936002)(5660300002)(4744005)(316002)(478600001)(2616005)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WWJZdmhQQnZIeHNhMXJIMWtBMFZvOTZjM254SmdEb0dUenhRUHJoSGxpRTZj?=
 =?utf-8?B?R3VDeWF0N2RRNDdWN1pOWkJ3VFUxYmMzbDBseWdtMnAwSVRValVkcDNRZjRS?=
 =?utf-8?B?SVpmU1c5T1NCbUZjWjUvRjlDSDFhbCtzMGsvb1JPeU8zMXpTYjVFaW44cC9y?=
 =?utf-8?B?VHRFa1pjdkE5NkM3RTJNbEp5bXdIblJTRWV2ckdvb2w5a091eFpNd2JJUGRx?=
 =?utf-8?B?bThMU0dQL09WNHZqbktUbzJJVDd2eWdRVmc0Tk1yT0VDS2U1ZE5scnNpcVR5?=
 =?utf-8?B?Tk9MdUpMbUc4SytOdHRvUDdVVXR2eTljcWc4YlpLU2I5RnhXWDh1eFpyRUZx?=
 =?utf-8?B?alN2UXk1Wmc4bjZkTEthY0o1NXY4THdiTUo1ZW5tWjlxK3B0alJ2bnEwMXdT?=
 =?utf-8?B?SUxjSlFGRFhhejlkbXhubWIrWk0remwxREFabVhRdTEyTCtmamhMaW5aZlNZ?=
 =?utf-8?B?UUs0a2pVck9MV0xQWCtLaE0yT1ZJK3pkTkF5Z3Uxa0Rzczh3MWtQbFdKVWdp?=
 =?utf-8?B?QWZWOGFhY1B2T1IvRW1tV1JMQmRpZWFoNGU0Q0d4SW5KdXFtelhsSnpXU2lu?=
 =?utf-8?B?Y3pjMWQ4WFZVZmMxVUpUTzNVdUdST2ROc2pjQTlkaVpNaFI5cEdXR2lObWRO?=
 =?utf-8?B?VkFOczF3NWxRb3RPZ1R5Y2N4TXdiRFVmNUc2TERWYW9wUHM3TjVuQ2toRjVQ?=
 =?utf-8?B?K0EzSnpxTUhJMUhLR2RwSE5XMnIzdHU0OHV3dFNwa2Z2SUttUVlUd2NUb2Qy?=
 =?utf-8?B?bVFVa3B1amw3ZVE0SlhMdC9idExSdGIweXJRbFN0YW5aeHBVQmRjckNpSGxK?=
 =?utf-8?B?cWo3c0gvcHlTT01BTTIxWDQ3WXJYYU5USjlZVjZGSjYzN3NMUFc3aEJFNFNh?=
 =?utf-8?B?TnZSOTBiaW94eWgzOW5LSFJRU3k0T3hXN25ka0JtYkNpaVdhL3lIamtJZUFZ?=
 =?utf-8?B?MC9PeHVCK1ZjcjNUQWtnNHlRTnhqM1puZ3l6c09EbzhrTjBSTXBqa3pQUWNr?=
 =?utf-8?B?bFpIL3BBZmxvanJpaS9Qcm16c0xieHZRRUpITE5PdFNwc3dIcTZyS3ZGaDJN?=
 =?utf-8?B?SXY2OTRWVDcrTTlyUkg3WmtGc0R4OGorMWNvZWhtL3Y1cWQ2VEhVQVF2bHN1?=
 =?utf-8?B?RTVScSs0VjRMZ2ZCODZ5OExYK0dXZDJjZlRuTXp4YVRyRm5JNDc3c3FYcGw1?=
 =?utf-8?B?QUUzYS9hSUtxSnNpK051YmxHVE84TG5IREZBRm5Mc2hBZEN3ZXRFa1hKdVJJ?=
 =?utf-8?B?dysxSktNOEFvNEJQVWR5bkM3alFFOXVwVjJZT0ROTGpUMWNuQUFHZGZjS3dH?=
 =?utf-8?B?bGFLZFZiWkJCNHZqdlVCL1dJSkY5ci80L3RTZ3dwZEYrZS9XUkQ0OFR3Yzlv?=
 =?utf-8?B?RHorOFZUbUFKOTBnTElsNFdVYVpab2k2UklOQVZKbVdkN3E2VGM5OFgvb21m?=
 =?utf-8?B?dHMza3JMOHE0dTdkbUQ4ajNFWm1ZZzFRWmJoUUtieW8rME4vMjJIeDEraEha?=
 =?utf-8?B?RGk0UkhnNXhEbSt6N3pnZ3hPdWJDS0lONTFkZ1NTRmk2d3BFc1JGeVhpYUF3?=
 =?utf-8?B?aGlMbFhic2Q5WjBvZkxWWUIrY3JqNXh1MjN1RExIM3RJVEpqdGNackhIYWdr?=
 =?utf-8?B?OEJERnZ1aGVZelVoK2k4SUlPYnNUUGg5TEVtbGdHbDRMRkY0bCt6ZzE5ajkz?=
 =?utf-8?B?QnJGTEowRFVHejE4clpsTWFERk9LWEQzangvcjNHcDVqN3dyM1JaNkRGYktM?=
 =?utf-8?B?WUNtajVBQU1tMHU3QVdyN2Q0K3B0eS9WVVFFck5xUE5qVGdsdkk5aHdOa0o3?=
 =?utf-8?B?WnBXNmZ2czZEVTRkUmZJS0drcGU1d0ZFWHBRTDlUTnZoOStzanN6TVc5Vm1s?=
 =?utf-8?B?ME00ZU1TWVhDOFpjdjNObTg5cHV2TUZWampvdjVuYTF3eGw0NEltQjBtYlVi?=
 =?utf-8?B?Q05xTXZTdWdweC8rY0VQSStFNWVaUEw4a2hWSzBMdVBlbjR6OEQybWxNNW5H?=
 =?utf-8?B?NmJTZVpIYWM2TEQyanMwTi8yem92RGx1dW92VDdxL0c4cHBrdXhUbWJTVTUr?=
 =?utf-8?B?TlhrZXBNbERlcFdsZjg5VDFpMVk0dXY1ekZkeXI3aHBLK3h2MDFuajFBaFFl?=
 =?utf-8?Q?O+FcR0bAB2EPJRZjlr+K/sMyr?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed9ca9cf-77bc-4793-e58d-08daf3e501a2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 15:03:32.9515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P5S87Vr6Lt4YjW2nUeTV8KtVvAi+Iu6HdeKUQgWunvxM9Znjt8XBDODKXXEnDNFSraaVD7kFFBUXBy5TmhA+GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9295

On 04.01.2023 09:44, Xenia Ragiadakou wrote:
> @@ -116,7 +115,11 @@ static int __init cf_check parse_iommu_param(const char *s)
>                  iommu_verbose = 1;
>          }
>          else if ( (val = parse_boolean("amd-iommu-perdev-intremap", s, ss)) >= 0 )
> +#ifdef CONFIG_AMD_IOMMU
>              amd_iommu_perdev_intremap = val;
> +#else
> +            no_config_param("AMD_IOMMU", "amd-iommu-perdev-intremap", s, ss);

The string literal wants to be "iommu", I think. Please see other uses of
no_config_param().

Jan

