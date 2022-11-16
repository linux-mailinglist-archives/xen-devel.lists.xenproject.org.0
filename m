Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E69CB62B462
	for <lists+xen-devel@lfdr.de>; Wed, 16 Nov 2022 08:58:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444190.699117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovDIs-0004CU-04; Wed, 16 Nov 2022 07:57:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444190.699117; Wed, 16 Nov 2022 07:57:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovDIr-000496-Sm; Wed, 16 Nov 2022 07:57:49 +0000
Received: by outflank-mailman (input) for mailman id 444190;
 Wed, 16 Nov 2022 07:57:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1l6N=3Q=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ovDIr-00048x-9c
 for xen-devel@lists.xenproject.org; Wed, 16 Nov 2022 07:57:49 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130072.outbound.protection.outlook.com [40.107.13.72])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5be08e2d-6584-11ed-8fd2-01056ac49cbb;
 Wed, 16 Nov 2022 08:57:47 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7565.eurprd04.prod.outlook.com (2603:10a6:102:e7::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Wed, 16 Nov
 2022 07:57:18 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5813.018; Wed, 16 Nov 2022
 07:57:18 +0000
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
X-Inumbo-ID: 5be08e2d-6584-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f9D8Kl3/8Jpq0B+1UsIK5C+/sTbJB7bsUKhvLYlk7FaQ9OmaGqx+dde7m6hwZ5bX/rG2nJ37QpjI7ykp78fUMmvtw9pGHoZ7SRHDAYorjx/150sA+bFBThTWQYhYBvlTlia1n2/neysnLn7vi9PG1erx3N/Z+j7I4oh1cHtwr1/qDNhQKeUSNqzmQBFDT48PbeYaxFsMQ38uwwawcSAPVdxi3tu8fdIcNHxpuHNmA2FKFDht8dRfLL3w1p+u+3f3LdhPk3vQa7sa8Sx5Jv+0+qX9Fb51sT1NI2fecTxbp9o/7Fz13WhiBEwshCXBfvtyFPZud49sTfGiTWwImg9waA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XVkwyC+eRQLDywllsp3E9HaxtsG+K13gAnQMERM73Fo=;
 b=dvB2WmmOONKx5R7mUFj0FLxD+7iuyhnWkq14V8I+vTpvixi6M8q/KUlaps0vVegESxpUrJXmQ1vhVGBKIBIHcuSLC25Ixrcic/sn0lq2pgfzrMFsbw+7sO9O3GbzPEFMqUnheYToFpurwtmijXz6Z916wCYont3UfuJWFeBc+re6rztVjCS02V5/77lAAyIekRa+lmDzqfKF46gDhmXqJVHekBANK/IN37QFQBjsoFGEkzg7bwLngMCvc5L9MR4f531EfdQchhuo8I1DCh0f8SY1pMv0GCi6J53k8krESPHvn2fPaaXPESfonulsNxYK1diFvYb9s2Ef6jHfO3nn/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XVkwyC+eRQLDywllsp3E9HaxtsG+K13gAnQMERM73Fo=;
 b=nNoETIBVXT2kzH3a/LeRkMrgz69xo+nSXybY3XsFWhUwxVf904evIslCGBkeoAaMZ++bkSBgxA9bpJWOcWMmaTjCaVuZMwQHz8bVCRy8hRwFzAk5w0DB8bmr3C6v0TmwVT3KnplFNu09we5hm4OenCz6SSj3/S/ePhbQ4AvMY2aIiNOfJjzIhgHaHOCIGT8EQJekuZD5UEksYTcB4GNYRMrK3c3oYbwlKRaY4wFoEEBF9FWPJV9DyHAf0xVyXpKmZfA6W5s5zMhIYR+vKk5VaenhTf7Dw523pPKk0St3t4y5MAf5VCvSxZh8aPZLHMal5nT5yk8FJYouwgKtlY6ttA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7e3b7b5c-26d5-26b7-31b2-91813464b4dc@suse.com>
Date: Wed, 16 Nov 2022 08:57:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] x86/irq: do not release irq until all cleanup is done
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20221115123500.97114-1-roger.pau@citrix.com>
 <6ba69073-3c58-2791-9572-c5c2e433db07@suse.com>
 <Y3PGnLiPZYiK1J4k@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y3PGnLiPZYiK1J4k@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0107.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7565:EE_
X-MS-Office365-Filtering-Correlation-Id: 06fbd940-2f1d-4ef3-2d4e-08dac7a82eaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xxNPOV3rCS8/rYPsm4L9raXcg/GurBdfBjUxBDJwyZuXT5+xtKNs8qcwfcTnbGogtwpFIjVGV6BiQ3Txi7pH6J2VzLxo3CovrGGPdQ3rHU1a73rCOiDW7BwWAnQ2kTNN4qBnmBera1kFII1gfcmOFb5fxP9R407DMK0vviT9+zY4ye6f1D0EDGdcaP3er69Q8iLmnInSTW3DlqMmBJ/Yp9fOw7QLDYL8jaGNrxVe1kqfZUjCKVQk40FaqwmLrGo86zjX9IpH+uI5fCS73nnb+/Y5dbrBJak3PIwie+QqIynJ7FEK184Qt+1RQa/YxbkHZsQaCViTNkj8s+yHJcf2oyYG9nkl5TpsIyvJzlbUH6oMupBZOUq0W/fpiRPBL5IqpTFMq8QWTNtxJrvLsO7lGQjA+i1nUiIYjNRR6Cb9LuaWAx738NZ99K3WhslwwQazhHqt/p0HdaXiVHsESiERJ/PPo9h0haZZSSuqAHsZCT7tQ4aNEytA7Io60WGCGCk66HQW0PnSAM3ytdixv55qIVQ6ts5H4bS+jtZnsuoIRGQtuc6ayngn6NW0QvlepIPBIWKJPBTmJBKHttQDGwyhONxS35RmhcSZZNwI2XZfIzytNZ0z45PSnPkaeafHNfarf/jJaXP4K0vtFZrizxTRdfHxzCDNAu58iAVJyhLHgJjqQ0CkB1iqH/8+xv13sm+La+cLRk/6SpGuRtbLaaUed/b/+H2+Jg4c43yhn+5A/isVKaHnBEXYZhDkLwqE8Zj6V1ehIpBknfWnO5knoVAr5nt0AvSLHwTt9BISfoDSKs8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(376002)(396003)(136003)(346002)(366004)(451199015)(36756003)(31696002)(86362001)(558084003)(38100700002)(6486002)(31686004)(66556008)(6512007)(66946007)(26005)(66476007)(53546011)(316002)(6916009)(2906002)(6506007)(83380400001)(41300700001)(54906003)(8676002)(4326008)(186003)(478600001)(5660300002)(2616005)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NFdpcThxSUU3RVZ3R0JEU09ncmk0czZsc1JDam8yaFI4eTNFTzVTcFpqOVRY?=
 =?utf-8?B?VGoxanBKN1FxZU5xZHQrclFvRDdob21udFhSa2hBbk91ajEwTHV4SDBJNS9Z?=
 =?utf-8?B?R0doeUpwWk12R2pCVDFtSXBKcWdxVTYySlluanM4VEhLT0JTb21VazBUTDZQ?=
 =?utf-8?B?NjByUm4vS21hYU1kZEdIRDRJRHFULysxQlV4RWNkdjRpWkY0QlJVNDQzZDY4?=
 =?utf-8?B?Q3RiVHZrTlBzQ2JZc2RySGNnYjJsTlhldFFaaW1TaDZ4ckwyVXBOM2dhSGJs?=
 =?utf-8?B?QktpaU5XM3RVRGxmS3dtdU5yOHZTUGtiRE1hZm1wV0xSVXdOTEZBUHY1RGlr?=
 =?utf-8?B?SFYxNlkvaC9Cd2MwaFRzdDlKbUFqcWhLTHFLMTBCaks5Z1l2U1JPczlrZ04r?=
 =?utf-8?B?ajE0cVo3NnNQV0tvalEwc2hRNmVob2h0N1dmbE10Qi9XUjJpQm9IdDVRb1ZU?=
 =?utf-8?B?N0d3MU9NSWR2STZIeTZ5T3FpU2IrRGUxM04zM3N0Ym1CazZxUjNWMGxPb0h5?=
 =?utf-8?B?ME1VYXB1bTBhMzVYdUJrSk85aWxhdWFuK3ZCWXZPc0tWTXR4cXh3MSsvWjlC?=
 =?utf-8?B?OTZxaklJZjVyQ210VzhveHlhTFpZaW1rOWIvZmhxc29mQ1QzY3dSZkdFSy9s?=
 =?utf-8?B?N3p5d2d6L1drcTJlcWtIQkh6Y3IwWWYvTm1XYURqTnB1d1R3K2JxVFYxTWhY?=
 =?utf-8?B?b1lMSFA5ZnBvNHBiczFTTmliNy9NVVJJUzhocG94MlJmaEVXMGltdG9jRGVZ?=
 =?utf-8?B?U2tScHQzc2xqS09PNmNlMUM5TW1aRitlR2doWnhvdHM2bmlCMG1ELzdBcnh6?=
 =?utf-8?B?YVplakEvZnNqNGRUVFEwbWkrOTVjR3JlbHo0bGJwYWlKUks1K3k3ai91dUh0?=
 =?utf-8?B?SWRvYjNhbER0aWk2cGg4YjBlQ2Zrb2F1Z01PYmJsTy8wMXZMNDFGNDdLYjlG?=
 =?utf-8?B?ZnN3Ym9OY2E0R2wybXVaUE4rRU84U1FHck1xRmlVS3ZtY0hPQU5VeEZlY1Ru?=
 =?utf-8?B?VE9lTHVJaXJ1UERONUlYa3ZwU2dhZndKa3lMWnJja091L0dIanFHczBXWmE3?=
 =?utf-8?B?c2YzUnRFK2oranlMdEtIVm1XU3IzUmo5ZS9yMTlteWgxZ0dmZFJ3ZFMzcmgx?=
 =?utf-8?B?WFQwUERmODBNcU5VRTg4SEpmM2pHdE05NzJEVE0zZWQ5TmFtak5jNW40THh1?=
 =?utf-8?B?ckt5UkZoMkMvSG9NT2hLLzBUbzdjeXlIU0c3SUY1NWdIa0RGZjQ2c21CTE4w?=
 =?utf-8?B?SDJCVEN5R2FUNGdoU29rV3lWdlNhSEx5ckhQTFoxdVgzN29KWk1lVDNTL1BK?=
 =?utf-8?B?TVB3WTIxYVp1bHpQdDVXZm9MREYzT2VudXdodUxwZGdHTTlEZlRoRXQ1aFJB?=
 =?utf-8?B?RWJsUlJ4VUdJRjZaYmdpTHNFUWJ2S2s3TmIwOXYwQ2E2a0pSSGpDVVBqcEtz?=
 =?utf-8?B?R1R3QXY2RSs4bjdpYzBvbzlQQk9hSUZTZTJOdENENzUvWnVNekUwZHdaTkRM?=
 =?utf-8?B?c2gxQkNpaUw2T0hvWnQzVUxHN3lEUDYrNUluZlRQTVltZEtGdGxjMU02U1gv?=
 =?utf-8?B?Qkg5eVhHQmM0VEdKUi9kOHJBTm55a2J3czJvYXdlckYyUVVIOUp0c1BhMmVa?=
 =?utf-8?B?Ulo4Ykg0K0NGZ0pWYUZHc1M2ekM4dk14MnFtU3IvK2xHNGVPTHBLKzVCaThJ?=
 =?utf-8?B?aW5zaWZWcC94ZStsblV1NHRJbmIwdzBZeXpUR1dDVHhLOWhxN2EzckV3cnY1?=
 =?utf-8?B?b3ppQk9USGEvd2Nmc0huNithbWJINDRjQS9rZW4rTmhRV0I0NXRyMll1eUxr?=
 =?utf-8?B?bGNLL2MvdHNEN0ExREM2a1ZFSXlpVitJb3JUdk5DeXZEQm9NNzVuN3plS0Nv?=
 =?utf-8?B?RnVwellCNWV4UnpHUHFYMG5PZk9pSVdCTnMyajBwd1ljMUlsdVlJRXN4VUpp?=
 =?utf-8?B?dVpxbENZTmxTMy9peVc4TG5Yc25FNVdLOVNzNm8zZXJqRDl2dEhkZ2JzdE13?=
 =?utf-8?B?Q0tlZUl4NmM4VTdtZEdiQyswWkVmU2w5eXFDL3k4NXp6V3BGTHQzZ1U3N3dv?=
 =?utf-8?B?aXJDaTZWOE9aNXE2aGdGd3RnVHA0d0YzRDFwWlNnR3NNWEd1WkxaTlNLY0lj?=
 =?utf-8?Q?J2hzR9I2DOK1Yp3Pn4Zgi/e6l?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06fbd940-2f1d-4ef3-2d4e-08dac7a82eaf
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2022 07:57:17.9730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LWQZHxTX0Ob4TOBHNwdevLg3y2aWZUhCLzaKOP7+Eaz+rIwr/+FQAmgAs9v34iezb1tb6QPoAGYAjcJSHEZ2rQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7565

On 15.11.2022 18:04, Roger Pau Monné wrote:
> I would like to request a backport for this, but I think it's now too
> late for the patch to be accepted to 4.17.

Yes, I certainly was intending to queue this up once it went in. I agree
it's not critical enough to still slip into 4.17.0, though.

Jan

