Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 567596A7F08
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 10:56:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504818.777221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXff7-00014h-Kg; Thu, 02 Mar 2023 09:55:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504818.777221; Thu, 02 Mar 2023 09:55:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXff7-00012B-HX; Thu, 02 Mar 2023 09:55:45 +0000
Received: by outflank-mailman (input) for mailman id 504818;
 Thu, 02 Mar 2023 09:55:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qSkR=62=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pXff6-000124-1D
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 09:55:44 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2057.outbound.protection.outlook.com [40.107.7.57])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6517b2d5-b8e0-11ed-96ab-2f268f93b82a;
 Thu, 02 Mar 2023 10:55:42 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8155.eurprd04.prod.outlook.com (2603:10a6:10:24d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.19; Thu, 2 Mar
 2023 09:55:14 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6156.019; Thu, 2 Mar 2023
 09:55:14 +0000
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
X-Inumbo-ID: 6517b2d5-b8e0-11ed-96ab-2f268f93b82a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LLh7MryFP3a0eZ9zqAXg2hv6RilT/s2OMBxpBAHPWSi5ZcKOaz7a7SeDER2L0XX/fShRDOAU0XB3WzesM+NovJIMl3elN7GKHdr2OqYSvGnqiYUaINfHdgDj43+2oQIqZs1egckpTzOpE/PsBk1xjRz/gAASXraw+Vbjt9voYOzjl9+OmBSed4/Hmj55++4S+WqSrMaZR7zxafF3RyWedyTpGXHwrkm92wHnAcGMpNOPKJ7EDxQrtbZEjHaDaZPJynvlSiGCuOXLBakOHNybx+lwU/cFZ2rDXvNoddKZ7ln4gAqQ3QkXl02pg7f2AEOT11heXyjsRzwB+DFjN4JVOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vHncnjeSGvubH/r7LJf97DK9e5ZGBRSATmhDvm5zzgY=;
 b=B1gJTbInQqxCoNKnYru4/6M48bvaPpTF9ARaF6u92T9P0XoD2N+Z8ds9JPdRrMEA2thds7Pms0ohBnpBmUMx1/+hbdchGLBNozjRPy/lBpPHxVR7x4uiV1waXy1VCiiHR71NF3LSxNpXcqlYB5VvSeOw47Wh/RgKtTDwhbXqV5n2oPSltXQnAAbJOCkbv6vwhDk+EKXxVIQkwguxj3kAqbdq8CTNE/5HOOJ3zVajori3IRhFMaJslm/OYxxIPMsnW3tZ93Bl2acJCBvhwOB/kBS0IUf8RrY3Ku+78c/w2+amseXbO297dU2Nvjp1Iav6/MTaOdhLkNVK9MI+ObXQvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vHncnjeSGvubH/r7LJf97DK9e5ZGBRSATmhDvm5zzgY=;
 b=n8Y6E4fpGxZNXwxDbInGR1rFEsVC7N4FJh/vCgiC8vsBL1n2xRS70zsHTK8euCs0S6uhy93OGnKGppy9qI3zcgOPWj1o0DtBNS3W8W+dVXkPWgnnYCPANQc7ajQ2E3p2D8oVL+WMir3jsBAqAPOIcrZNbklrEisLaxwMECuT+fFi6TOfXVLxCmE+n0qhDHFinsujs8EwgEcSJDSuz6tkQxDNBiiTYc8zvm45IP29iWk27P287c2O4qS5kuS1uOtw+EYMtSXws6XRFW6xx7xh0lbxxq6qvbR4WphLS/WmVb9KarADLZrhHKZ/XA0hVJh5y6VcTG/Q9uhe/dSLyGTpRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ee8939d9-3071-b08f-e3f9-9a0611f8f10a@suse.com>
Date: Thu, 2 Mar 2023 10:55:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 3/4] xen/arm: switch ARM to use generic implementation
 of bug.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1677747527.git.oleksii.kurochko@gmail.com>
 <fd0b81101c702b8d082a78507ce081b2fc2bbb41.1677747527.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <fd0b81101c702b8d082a78507ce081b2fc2bbb41.1677747527.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0009.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8155:EE_
X-MS-Office365-Filtering-Correlation-Id: f4e96366-a32e-4aac-daad-08db1b043830
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WVxL50+8PxFhBvNYY93/J2Sqb2Nh2kOticlIvL09kUECjAjTYUk12OPGwe9qAmEtKOFgBWrn6Uf24+3xoMyjgNLVqfold2Wl2adFUBpxyiBK/Ki4Ee5pQs+646saazS7uG3HpTiSlbdLyAu/dMBhbF5lAA5Pej4jicHFn13xOveZjyV5zR1NF44BHpqXxaFL7pwIjCP/6rasVrYcjuLCG/OzeKGW/fXzt/Ol95E6hl/0yhiIdIiUjqukYcoNM2Zq+wpsKar+JwRvan4RsVAjSQKR0UGXyZdYVarxtlB8gt34jzhxqX2QXvdq02nurAbeAIVNlL3GOKqh6yGq8W3lyMWsGUmbyRScmkUYh3BhdAUKkYxEN5D7/+924zLLiMvzm+ZSYyN3IoFr5/0KPSBJ20zNqpwp9ex7MOelTAhl699NU2k83n5l1ti9wVThc40QPxPZzCtZ34PPs+/zS9Rkyto5ee5OFMQeWH7rrtQo2TYkNEa8iqyIW9SVs4FrYaABvKJUMi6ElmW0Rn7IoLcO3wPamXQpyYKBdCe+EpZpG35oN7Iaxhh5OKwRQB7+nu+rQTUIGismtuH2lVDNYrU4Z6ovSAsxQCPFvzlGJIWQgqKSeuueQc08Duvo1wgUfz/0uiG+Oaq1D+iqpTQIxqd/iJNPaGedXLBFjR5J/+iTPK5oI+S9CD4xeRzEjiQX7l5bX3SS1uQeX2nrE4JkNuT7Sp7UvhhUAZhpVS05xe3reRX2EBt4U6z2ojotK1602pZ8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(39860400002)(366004)(346002)(136003)(376002)(451199018)(86362001)(31696002)(36756003)(53546011)(186003)(4326008)(66476007)(66556008)(66946007)(6916009)(8676002)(41300700001)(8936002)(2616005)(6512007)(54906003)(6486002)(478600001)(6506007)(26005)(5660300002)(316002)(38100700002)(83380400001)(2906002)(31686004)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S05iUDQ3bDVXZ3V6QVp5MXZrQ2J2OEowZ3YyaXJzc0dtcUN0U2lWTFEzc2Vl?=
 =?utf-8?B?QTE3a1pSb0dkeVo3MG5kQkIvVUI3N0JraEFsZE1kUThvZHV6aHIvamp6R0F5?=
 =?utf-8?B?L3FRZ2xBVGxjYTZrZGVqMFgyT3FnYkN0ZVNsdUZHRU5LUmcyM3Jacm9MeTVZ?=
 =?utf-8?B?V2prcDZ3aVdwcnREWnVOWm1ySjdWLzhodkpOS2t4T1FEYzJyUzRlcjloOXlJ?=
 =?utf-8?B?ZHlSekFVbGQzd3BHa2lCSi8yZnliZGFXMlZtU3NNU3I4VU5zTWFCWjVuM1A2?=
 =?utf-8?B?ZjZuZWVqakx2eE5BSnQyMU41NjFlSWk3RXNORDJwTHlyVm5ESGw2Yno2V3RE?=
 =?utf-8?B?NlpSSVJaVFNmZjJPTkRmbGFxMDh1RjNJU1RjSzFJZG9KVGR6c2FCNzFUaHBx?=
 =?utf-8?B?TGJqb0FtSm41WlNhRW4xVVZjQy9ta0dwYndLOHErMFFzMHNGUWMycy9Cdm5W?=
 =?utf-8?B?NUU3eGpSMDVTTEc1WkJUNVVQN0FiTGFqcVQyTXBrODZibTRobzZhU0NOOWM2?=
 =?utf-8?B?ZnhMckt6dmhIcXNBbVF6WVpwb3BoeXJRL0RDTnBNSEhoN0ZhWDhIR1BVM0ZL?=
 =?utf-8?B?UEtVc05uU1Rpd0F4a0lKTEY3N1kvbFNTa3VVckVadUlCUUlCdDM4SU5LVGFo?=
 =?utf-8?B?cW10eWdHV1pZOFRDWjRQRG9pVlpIVm8vcVloYWtnZnlDSFM2VXB0N3pnaFhQ?=
 =?utf-8?B?eW1VNG1aeDhnZ2tvSzhxZGJIVy9CUXFTNUMxVGUxdW5scDFRSTRsd1RQbWV0?=
 =?utf-8?B?M3dHT0ZDaXFnZFpCU3g5YXZZZEtKVW9vZHkvQlZ2UWN0QU5Kb0dtWHdpQW9q?=
 =?utf-8?B?cGdVWEFQa1hqbytRSHVBaHJnQlB6dHZJcjJ5eFZ6NGd2aXErNG1QclNLTmoz?=
 =?utf-8?B?V3d6VDdabGdoc2RsU05tUmxqbkFldWFDNm9zQkFUMllPMHpjU1JHUDc5WW04?=
 =?utf-8?B?bGFmbFB0empqOWZrSFdBaFV0TkpPSDMxZFRhdWk2TE5GRS9tY21vbitOdW1l?=
 =?utf-8?B?dkdzYmNVYjh4Y2tiTllscFI4TVY3MENQU3hsNXh5TmdXOWVnYU9ROGU5bkFV?=
 =?utf-8?B?RWt4dmFsSm96UWVKaHZPRmhseWw5WlpTUEZpb21Hb0JIeFlvWS9FYzZ3TmJv?=
 =?utf-8?B?TUtJSzJHWTVXdjE1MFRzWWdKV3NnK0xQdTRCQWNaWnhIUk1CbHBPVkltVHFM?=
 =?utf-8?B?dEs1S04ydjY0eXVHZEV3S25mZ3pQdjBhRHRGYmhCemlqcHZZZFQ0dzRFWTFp?=
 =?utf-8?B?TE1rSDZhTTAycmpIN3owVlVUUUl5NXoycVhGbzBMb2E5bGFPZTY3Z3JQQmhN?=
 =?utf-8?B?cTlLK3NuL3luS2tUZGhGa3NpaVpjMGFNMFRNT0dJUHZDWU4vTUZINVJzcDhl?=
 =?utf-8?B?VEtYRUozcCt0TTgrQnF6amFsMzA2MWl1MDFsMHlZQk5CSGJ6djhoYkxhcWk2?=
 =?utf-8?B?QkJFZjVZbEt5QzVBZEg0RVUrNmM1amQxanRuVUloSlB4eXhnVzZGY3pOTVB2?=
 =?utf-8?B?eGRxN3QrQW5uUjVKdm53U3k5MkxyK2I5RjJXVE9FNFV1NEdDUHNyck1VMWMx?=
 =?utf-8?B?alhINGdneVVTNlllVlFCb3BWNXBmSUxqOG5wK0tZbml2dk9oRVFpcE8yMmN0?=
 =?utf-8?B?dUptdUV2bTFBaGwwOVdCaTM0bmJvM0hFUkJEdVppN1RyWmIvVUxMTTN4N1h2?=
 =?utf-8?B?anh5SlExemViVEVzRFBIQVEyam5xbVhJZHNiQUFqZVNMMFhFSHc4K1QyMnlo?=
 =?utf-8?B?ZU5MS3RLOGIxZkp3Z09RVXZuVmVWdFBPREQ2cUdWTStLUllLL2plZE9IRnQ4?=
 =?utf-8?B?UjJhdDZHZHZudFhlUWNuaHBDc3RlOFZYYmYycGg0d2p0MGxNa2Z1ekdIcXFI?=
 =?utf-8?B?Ti9LakNWaG9zNkdrTFdiZXFIUXlTS2hPckNkem9lUzBmWkhzYjAwZUZ6M0pk?=
 =?utf-8?B?ZXJXUFBLWVg5K3lLZjZ6dUdpRXJVdTJmUkp5NHVqYnNSVEJFNy8ybUluUGJC?=
 =?utf-8?B?ZXFpTWRjMUdhVHdaamdrZnVDUUtDU2xFTEIxNHUwSnd5WG9VclhmUzBNekRp?=
 =?utf-8?B?YmxJelYrZ21jbkh3RG9JWnhBdG5NcW9Yb0JzYzMxanVBejJMQk16RVprSXhk?=
 =?utf-8?Q?DRdfp+ebBcbOCBiPtRBG6m8Il?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4e96366-a32e-4aac-daad-08db1b043830
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2023 09:55:14.1164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /F93Z7D1PrizYynpboex9sBdxJ41YsYyjrTSf0VIFztkbTG+L5Gb4C5Wp1za6KF7IXvj3AqlAKt3pJaxtYUyjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8155

On 02.03.2023 10:20, Oleksii Kurochko wrote:
> The following changes were made:
> * make GENERIC_BUG_FRAME mandatory for ARM
> * As do_bug_frame() returns -EINVAL in case something goes wrong
>   otherwise id of bug frame. Thereby 'if' cases where do_bug_frame() was
>   updated to check if the returned value is less than 0
> * Switch ARM's implementation of bug.h macros to generic one
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V4:
>  * Switch ARM implementation to generic one
>  * Remove BUG_FN_REG from arm{16,32}/bug.h as it isn't needed after switch to generic implementation

In which case why ...

> --- a/xen/common/bug.c
> +++ b/xen/common/bug.c
> @@ -46,11 +46,7 @@ int do_bug_frame(struct cpu_user_regs *regs, unsigned long pc)
>  
>      if ( id == BUGFRAME_run_fn )
>      {
> -#ifdef BUG_FN_REG
> -        void (*fn)(const struct cpu_user_regs *) = (void *)regs->BUG_FN_REG;
> -#else
>          void (*fn)(const struct cpu_user_regs *) = bug_ptr(bug);
> -#endif
>  
>          fn(regs);

... is what is being removed here again introduced in the first place
(in an earlier patch)?

Jan

