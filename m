Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D22AA72C99B
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 17:17:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547305.854617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8jHp-0007yH-Mb; Mon, 12 Jun 2023 15:16:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547305.854617; Mon, 12 Jun 2023 15:16:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8jHp-0007vd-JH; Mon, 12 Jun 2023 15:16:53 +0000
Received: by outflank-mailman (input) for mailman id 547305;
 Mon, 12 Jun 2023 15:16:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Cme/=CA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q8jHn-0007vT-Oy
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 15:16:51 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0611.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26dc14e7-0934-11ee-8611-37d641c3527e;
 Mon, 12 Jun 2023 17:16:49 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7969.eurprd04.prod.outlook.com (2603:10a6:20b:24c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.44; Mon, 12 Jun
 2023 15:16:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Mon, 12 Jun 2023
 15:16:46 +0000
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
X-Inumbo-ID: 26dc14e7-0934-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CBDuCMH9CmYDvpaNlW4Mw190SH5vpb4ax0yFqCtPQ0b6pYRtoGWHg7PQqAj1tcYZsPOQ/WR1qKZX2SZI456Vv0RnTb1iALmFY5GvKN+L3d5kM2x8Zrrjx9FAikPcdoNrHTyZLlrTqlYAcwHunQAC1MqEfdXLq3hhbnBY6+tKOx3B97lb4xbTMVQDMGhNbHGY6vlx/eDzSFGaIvvfUwHCzFq6cuu3VdWr00V1qBAMbvU5GAL/Yl0Yhawx7UA1jfcsg9RP7P6fVuWm7rNxPjEPwTiH6mINfMLmJo/Bo7wI1gdWyfFgx/Fg8jFaIMGv0jmJoGkUapORtje4EWSGB0kJKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bv7ZpBsk1pTEgEsGgHquvGXDbPOkVmPK+PFe59RXfDo=;
 b=cmHksrhuXQrhz6gO6YfuSC496S7Lksd09/SADkHYeJLmJfmsA8k7UHE5LnePgACqBuJKueOnbfZ60BEpDje2nQuveGqBl4Cky+fdblfS4dz1FDu1pT5WnA/oz0edwKAlGhxlcjbHSKKvWyY8Ip2/fJaQIshxlJVUDeHnjLTKtMtDTfDM6jYr2iWWmk6Sj4te8soPp1dhZvNSetA2ddsvtmpLQccJcuFfPdOJiCORM5vR58/o/oWGaTm/pJp5qEyS+345O9XuD3hFz121wO78+xYIl/X5p8b6tssqdJTurwtossqBbLaLDPjGzOO1mpR9e7syZm9cmn0Orn1MZjZ1Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bv7ZpBsk1pTEgEsGgHquvGXDbPOkVmPK+PFe59RXfDo=;
 b=yiTU80LHVLHBV51OyGs3GaC2cskog6sZxvnAwqEr86fQiFwHhl44FXaut6fqiNQvR2MAT+uQOZjelHL7q9wvgaewxonECdiSe+77CGdM0JMlgxMR/VhEAeDm+LmlfxVUmE8Wh2HZNIqm+j5o0ctNIEH2kt8wbc6TTbXQz2c0flYKrFTLMuCnHhtgUJQ2O7LuOTbzjQQtRLQkaaXOWZWQ5pm4IStJnQsbXcl1aoQW6zjR/bXNTdThpeYZR/S+TpDBOELldIBx6D91V7yB2Hf+501eZDmxu3ioEQmlbDMBFWRTPoEpHcYN2CxpdK/IS400jpHTOQdUpBm24Dc48EZPHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <711f2a44-7e2f-3e79-dd04-34a049210915@suse.com>
Date: Mon, 12 Jun 2023 17:16:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 1/4] x86/microcode: Remove Intel's family check on
 early_microcode_init()
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230605170817.9913-1-alejandro.vallejo@cloud.com>
 <20230605170817.9913-2-alejandro.vallejo@cloud.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230605170817.9913-2-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0143.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7969:EE_
X-MS-Office365-Filtering-Correlation-Id: 96e353b9-3341-47cd-6367-08db6b580995
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JytrTBzt38pF9ztKgn14W5fXraZyFjy9tecZoA/q3RGeVT9cKfBiXoUy5eIIGeGrdumndYwPg76ErViykmXFMc0+IaDOTwcT3rbHt/tx/fxsFLNxRjRSBTb502HkGgPSmYbIttXez4yb/2r3LberExZf8RoosMD4nxgFUZHwjGCvws5ZmInfWE/ho8/FBIWOdb2H0XSIoTUTgnNnKoDrb0Z6E3cvgyYlorVErEZc2NiQUzAZY/UAn6EynIMdFCVOFGt6fvxEnPd4MhSUhknUFipXwvmwYl3oWw3/C+pONwK5Ol1oC3yj3ZSRnh29bXjiT5n9eFwqu9hGo2//wvuiA7uB5shhzVEM4SG3VMrjugikjSHAAPcGxa+9zahZkNbAbuR8sqUoHzrvJdPjzBGQuM1LtwCWX9CxQu+pS0B846IbgB00YnOu+xUHRtkYIy8Ifhvetw2dni3IFIOvIdSC/kh1x12zzHLhOQESNG8kyIjmzd2kzhccmdSS9xfZR5lDEM65BDHXHISll/rhMH1YgBXdsLPJcdv9dXzrStLvRcaf2cgvrUaTnyidY6YoNZT8FEw5ZwGZ9PYeWUzSkCI6+xHyqGLEYY8YWXOk0JFaVg3DfyGWEJElqgQmULk1pFSANvsJvVJkb5+8HSG/IJ34EQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(376002)(396003)(366004)(346002)(39860400002)(451199021)(6486002)(478600001)(6512007)(26005)(53546011)(6506007)(186003)(36756003)(2616005)(38100700002)(86362001)(31696002)(6916009)(4326008)(66476007)(66556008)(66946007)(316002)(8936002)(8676002)(31686004)(5660300002)(41300700001)(4744005)(2906002)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QlA0VnQ3Nk5NeGtPdGpGSURqbCtxRXFtSzJzeFZGL2F5U1FrTnZWVFpwY1NJ?=
 =?utf-8?B?WWRwTEh1cmQ0eEc0dVJtOS85YTVNS2YzaXIyMC90VjVmUmVKNFlvY2hOeXpT?=
 =?utf-8?B?dGM5Ky92UFAwajZNTFkwM2MyeHBTZDVyeGtGbmo4VzBnZ2VRaDlydVdjYWNW?=
 =?utf-8?B?SXVmYllTY0lxaHBhUVRKNGJEMGF6bnFTOUNwU2JaS3c4QUpqcUR2b2hGSEN3?=
 =?utf-8?B?TXdXUlJvSlpVMzhYY3FiU2ZxWlFpamVoUDBoQnNRL29yc3FTRFVnZWxoYkx0?=
 =?utf-8?B?NEg0cm95QUtYQnRwSHc2aVNhZDJSVFh3ZmpiQTB0WmkzcEh4TnNFSW10cHlk?=
 =?utf-8?B?M245end6U25ZZ3hmODI4bHRnTUMwK1pPeVlTYmJwaDJaZm1yQzYwb3AwSlpQ?=
 =?utf-8?B?Z1QyMkZ3bTBOQVpJMWh5UUVuU2c0NVNUZXBuRjN4L1RrS1pVTjhpY0thTmQ0?=
 =?utf-8?B?bHFXejBjaHd3bWRhdU5VOVp0SWlvQ25KTVo1UnZDRURQSFF4NjVWYzBNMXpI?=
 =?utf-8?B?cmVDSzdzdTZvbU5jNlN2RFVFS09BUmFCSEVHSVEzQWNFMUlkeVQzZkVtL0JZ?=
 =?utf-8?B?NFhIR0hpV0hKQ2tOWGFNUkQ2bjVIa0k1M1hralJvbFlrSDgwTTcwUDUvR2M2?=
 =?utf-8?B?Y1RNSVZKK0VRTmJvQVFBVUNFMEpweEJYcGhCdTB3eG11MkMwYlpaWlQ5dmVx?=
 =?utf-8?B?Q0VWMnFSRzFQczd5aVBqaDVqeTdSWnhkRjhadWJLbWVSc2pNVGlqSlJFM3R6?=
 =?utf-8?B?VnNHT01UbkgwcmhqOVN1bjgxYkZDMmtwa0V0ZnhqK29MV202blNTT2trV1Jk?=
 =?utf-8?B?VndDVkVaN3BPanZId0NEYkVQSnY3VjNnWllLSXFmTkprOWh6SGE3eDFKRlJL?=
 =?utf-8?B?MjIyOGdSK2RwU20wMVdUQ0dFUDRaVm9IMVBMWDNhRTlZeWR5bGZnejY2QXFO?=
 =?utf-8?B?YVlTdGRJUzRvU1MxbkZob3JabnZrWTdERU5mMXZWNHNlT2NHU3U5S1EzVmcr?=
 =?utf-8?B?MnZYT3kwaEFCSnMrUWVNT3pTemR1NWlFajZpOFl1bXRjRmpaUStUQ3g1U2lX?=
 =?utf-8?B?QThzT2h3d0RzSnU1SFROR2E0KzBqbXhUM2hGamsvMkFGekErK0tVU2lyTUZs?=
 =?utf-8?B?bU9XK1pKOTEwcnFTaTlkRGY2N01ycnVVeHE0NVU3NFU2VkFQUzFQTHJmL2pq?=
 =?utf-8?B?UXB6cmUyZ3dScUd4VVNHV0tPZHlwc29YbTUvYnNscjBkRitsZXBlVlY3U1Rz?=
 =?utf-8?B?YkV3bFNGNGNJdXIwaHp6LzdaaU9yNEl6WHRKM0I3VkV1cUdRamhWMjhHVmwy?=
 =?utf-8?B?VmVPUHU5Zk1oWFBheW0rQnNSUzJpMGF6QmtEdDM2UWJjMHNJR1BweWVzc09O?=
 =?utf-8?B?SnVnUlJ0MlI4YUpnZDkxcVFBajdSYmMwKzRTTktSMHZjdTRSeFhqUk9OQzFM?=
 =?utf-8?B?dExuV1FSWWQ5emdJV3loQUlFYlN5b25KQ3VwVlNXWHNrRXhHcWJ3bGtKb0Jq?=
 =?utf-8?B?RG01ekYzV3lxT2wzUEVLWDlYanlxTjdYZjBTdk54WjVNNm4ydzdNSlNPbk01?=
 =?utf-8?B?YU9icWtUc2Rrc2tWSFNyZ25xNUYzWm8rWmJQeGdnRTUySlVkYTFXVGE1VTRU?=
 =?utf-8?B?M2w1OU5kYmQxOHFWVDJHQzFOOEZXWFR4dXUrenA3eG9TQ2hybUx4NXdySzJr?=
 =?utf-8?B?dG15SFFLcEV4eVl4eS9LelFHMGx3RElXOTd6dTAybjlBWXRNTFUwT0V4QkNF?=
 =?utf-8?B?STZDNVBuOGV0RlFaZDl1SGo3UjlnUVRHU3ZjMlg3RFhzT0Y1V01jY2lmZi83?=
 =?utf-8?B?RkE5Q2dNRTNlZW1EeFp0dkRaaDVyTjEzL1BOSnhKSlloVUxucEpqcGlwWXRq?=
 =?utf-8?B?eGhTakprd1JQNXFoYTRSWm8vVFlWNHc4b1hDVHV4bWJwNXR4Yzc2UHZFTCtE?=
 =?utf-8?B?YlJNMTlmMlVXY3dhdERERTROWjVSVXMxdXg4b2taR01PMk9DV0VmTXB1NTNp?=
 =?utf-8?B?RzNRUE1QRE9RcEF3cDZ3akw3bmNnTlBQU2lQMnBTL2lueU90WGxKWFk3Vklx?=
 =?utf-8?B?L0RsbThPQ1BmM2ZFQ2l2bUFWNVl0cEgzN0NSMG5pK3g3bjA3Uk4xR29BZGR4?=
 =?utf-8?Q?WP3igTKu3PKRAqzOL+qkr/pGi?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96e353b9-3341-47cd-6367-08db6b580995
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 15:16:46.6163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: shXlHIx1PbY1DUWhBKGx6349xXf/YkSXpxiKhi3gjI6P1I6zHj+Uy2n6LZ+GPkKb4nzX7PZn+piLmBXGszW8IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7969

On 05.06.2023 19:08, Alejandro Vallejo wrote:

> --- a/xen/arch/x86/cpu/microcode/core.c
> +++ b/xen/arch/x86/cpu/microcode/core.c
> @@ -854,8 +854,14 @@ int __init early_microcode_init(unsigned long *module_map,
>          break;
>  
>      case X86_VENDOR_INTEL:
> -        if ( c->x86 >= 6 )
> -            ucode_ops = intel_ucode_ops;
> +        /*
> +         * Intel introduced microcode loading with family 6. Because we
> +         * don't support compiling Xen for 32bit machines we're guaranteed
> +         * that at this point we're either in family 15 (Pentium 4) or 6
> +         * (everything since then), so microcode facilities are always
> +         * present.
> +         */
> +        ucode_ops = intel_ucode_ops;
>          break;
>      }

There are many places where we make such connections / assumptions without
long comments. I'd be okay with a brief one, but I'm not convinced we need
one at all.

Jan

