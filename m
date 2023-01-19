Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7BB6739C5
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jan 2023 14:18:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481031.745704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIUoI-0008HK-Jc; Thu, 19 Jan 2023 13:18:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481031.745704; Thu, 19 Jan 2023 13:18:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIUoI-0008ER-GC; Thu, 19 Jan 2023 13:18:30 +0000
Received: by outflank-mailman (input) for mailman id 481031;
 Thu, 19 Jan 2023 13:18:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DP+J=5Q=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pIUoH-0008EL-0c
 for xen-devel@lists.xenproject.org; Thu, 19 Jan 2023 13:18:29 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2050.outbound.protection.outlook.com [40.107.6.50])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c27a9ca6-97fb-11ed-91b6-6bf2151ebd3b;
 Thu, 19 Jan 2023 14:18:27 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8545.eurprd04.prod.outlook.com (2603:10a6:20b:420::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Thu, 19 Jan
 2023 13:18:25 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.024; Thu, 19 Jan 2023
 13:18:25 +0000
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
X-Inumbo-ID: c27a9ca6-97fb-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ptaa1x1Kv15waDyHrM8W9vO0GX0kWNhbCmy8tzmBIhCsbGzTHF9g5A7/5SZ5HAxnC1QNlokuqwv1phS/TrrA2S9GIrpBMXZpdKSF1dN6Yb+WOICtvxvxdsbUXRoESkn0Dtb0SS1B86n22fzUElBXUNTWW7kzprYvLEQrQw8Qfp7OeItEGUdG8gR9S2LCUMsKiXbAZnaB0mKDFqqJuXWqBiQEBQ0UgMoZy6yZ8//XIJHZWKLF3uykApNtYU+X2XiH+BCh7uniz5AyYnzsE/0H/PLxyNc8Pgx+g+HeEyIBUogGRBCDrVe9zGbprY/9M0S0ztcr/FNaxNG3ayHbx5zFJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OwPjSQKQLmEYaeICtcv0PQs0zL8GSJ74KYCWt8CkU5M=;
 b=iyXo64JqDTqwTRqIiXYEJenEsJzF6uDWn4eQSkj//PWWTDBb1ZW1lnibX+tC8ZL2OEbFHadW36ccP6zz3n+jM/meEnJW8LSyajaLN3cdhJemPnqLrshYqff0TGMwLaXs9IwKUNN/pk/c+pRqDouognoxRLV6ZWux3mYdpDI6hmYM7APNyhd9suceQJAz93bUOW71w4sQhEpZ8E9b0mq/GdDMxRabscc9aXEhaZQY5D6MjjdVJVDF375jAYbYd4mWydEz08Sg4cCFsfwo8mwIHpZUG5yoKXbt+/o80FFaly+IgczgBD+D9EpS+9gQxFvL1sXNm/V6dUhrbxaZkZrrIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OwPjSQKQLmEYaeICtcv0PQs0zL8GSJ74KYCWt8CkU5M=;
 b=QbKgpBrCAAATs6s20jtDSbpE88Ae5a0YwNaJqkNUk/ria/50ReQcNfqYxGpLAM4cIqtBVyAF5It5TpLhQsqP5QtJPpVuXXYeyMgKzCI9obliUGSHtlk4Mm2QShsSt4vSo/SaKYbL6U8ao8oATu/ciIJELku+dsSIbkz2/fbMnH5vbZJCjVV7mWlOEvfYEAxZZNJhUc46VG0sf/IBiQnwPRl8Gr+oqw01aAFgX0ZCugx6IJDM1K6ARgY3DYWuHNE90G11+nrNwu8tKMsi/7gLGwKDEk5rIAX6lF8oLE5v7mPmkZN0M1W+RsFxMWVLEeP5yLtZiR4KeZzoX7cy6b81gg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9e79449a-fd12-f497-695b-79a50cc913c7@suse.com>
Date: Thu, 19 Jan 2023 14:18:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2] x86/shadow: sh_page_fault() adjustments
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0170.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8545:EE_
X-MS-Office365-Filtering-Correlation-Id: 79fe9a80-dce9-4768-315b-08dafa1fa559
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Q1uDbt0I6znILtSuk6joGOVYqU0GvKZ1V+zRwkZOHKBxrTwx1vOMivqlr6lCyYggXo3WtqYpXPaCEcJvlFf5rDJ2SwqMFKDPhiAZhmMiKJlL4BxuG+3DXdv4octnfzraUCXSZly9fIpcYg/CldCoFuOfWEn/LfJ3JvbHggpdv0dGSPxqL2SO1qVpVQq/P2c/dhebKtNPVZNU2U9XgKNzqRGEq2IEsIpMxYTSidmTJdxlWMx5DLFh61mBzqTEU/coyqBCUFmBBkN0AH0s4fWhcYaKAPdhfeZiBOqGEUDgbVDSOULN62UrhKmYRFFVhUkZt/V/GAgbx5+ZJPiXGDSGayvOcami7efkMp4fGs5iETmFbEpdt8eJZS5l93HJUoxWRUOPMIDW3pFjwDHDEqIhp0ZWkMrAR+pzVayXUwq/tjao//VxsVmab+S53r/AcTQxp7UMGGhid1pEsONUI4ZsYmi2vZ61FDFHn3ooSyU4EzgHASoJXinmDRz6qWISicAh+zIQGHxEI6To2VETtr1TqybK3pEEhA+D+tZJ2/5FSrxl/pQNXD3CgzyouLgWwM6F3+o5IZOEvJm+xw0rQxHqimkpqr0AHlddvDGlFiHbgmmdoUHddZXBTpaaJMmfkId8v1sR8BSx2aKolEGriHxDQPsxmfcTLEyqqmMsa4wZtwriXw9Cd8XjyFzFHFHPf9aeHIozmpeqss0/ZCOoefq3XFO9Yd7XLWgEt2NybtWRlMc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(346002)(136003)(376002)(396003)(366004)(451199015)(36756003)(6506007)(26005)(186003)(6512007)(38100700002)(86362001)(2616005)(31696002)(558084003)(478600001)(6486002)(66556008)(8936002)(5660300002)(31686004)(2906002)(4326008)(8676002)(6916009)(66476007)(316002)(66946007)(54906003)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?akpLY0wyakVqRGlOYzFNQ2xaK3V3ZlRlUC9Oa1VCV0EvUzQ3ZFE4endBSS9Q?=
 =?utf-8?B?SE03SVNFbk84S1RVbTk4WDQ2OWZHWlY5TDhPN1FVaHU2ZUdGcVpTYXVQWjlS?=
 =?utf-8?B?UEN0bmZIUFJSSFcwQnNYeXpQUGlQWmlYQnJ0Sk90ZUpkMmZ2bU5DL3dsaStR?=
 =?utf-8?B?ZGFZRVdLZnRwQVArc2RvZkN3Q1lYUlZqWDRKZ0VoUmprWm9LK1pMSlY5N0lJ?=
 =?utf-8?B?T0hyUkErUnRxci81eGRKMDFpWGlZQkRSQU9xNlZSa21aMnNGZzVkUGQ2YU9u?=
 =?utf-8?B?cmhvNGdoNlNWeVVSb0xqWGh3cnJZSlZsNmxkSzVYeXpxUFNuVEJxWk85d25z?=
 =?utf-8?B?SG4zYUtNNEhzNUdUeS9zTXBtVVFrVjN4bEdFS1RNelZvWU9lK1pjck5WKzBO?=
 =?utf-8?B?K0V6QzBKNGxHOGc3MUhWUTVJTTdMNjUvSlMvQUVnUTh2TGRQbGJKR3d2blVt?=
 =?utf-8?B?SzJ6TndKSTFnNzZqdDl5WWJ3SmQ4VitpaUFyR3l4SWt6Z0k5WE1VS1FlRHBG?=
 =?utf-8?B?WHdlNVlXeWtIS2dBS1c3ZmwybUs1bmEwSm5veUZQRnROb1c3TjVQWWZyZWJr?=
 =?utf-8?B?Sno2dEFyNVpBU3lBTUZTakFBMldJUG1ibTBjamxnOWlKWjV1SU1na3hYV0k0?=
 =?utf-8?B?TzZZN3ZpOVZBNkVYSGFVS1h4RzBndU9MYjdyOXQzUUx2YjNKUHRnT0EwRFhm?=
 =?utf-8?B?Si9yQkUyNG9XNXlIeHdaMVpNcFR3ZGpBUC8wbjEvZ1pNRWJvaHBGbkpqa0lv?=
 =?utf-8?B?Z1NxbUpabFU5bzhkbnZLcUN5eG1pTTRRamlCZVpTZVhuUVZRL0xKaTZWTmlO?=
 =?utf-8?B?SGRhWjZsdzhEWittZ3V1ZXRqN0ttTDZrd21GTmpuZ01kd21mWXorZ2FDQkZp?=
 =?utf-8?B?bG9Ed3RLSG1zTTNnT3h6bVhYUjFzQUFBQ2VobkRic3JRRGxvUDRtd2dPZUVB?=
 =?utf-8?B?eERqM0RYOG51WWxKVTc2T3NkV2xqTlBibzIzNG5USU9IbUY1L0owNjBmMG9T?=
 =?utf-8?B?aVdXSzJaZVFhbXc1RGxHWVlZdkdFcTIrY3IrNUcyTFpFYVVjd29zekM4YnFC?=
 =?utf-8?B?bldUSkRDVTQ4MjREdFRJZ211RUdrRjN6Uk15QW5JR2RlQk5aMkJwQXpGdUZZ?=
 =?utf-8?B?UlZkOStzQ05mTzhQL213R2tYM3loaVg5clNKK1BzL1VsdkhJaWV5QzBNRmNw?=
 =?utf-8?B?aUVwTEREQVc4UDVQRTFPTlQvVDF1YlkyUGJKYlllS1FueDJ5OWczeFFhN1NZ?=
 =?utf-8?B?ZUtTaUQvMm1LVDNMSGFaWFRzWEtkNVBZMWRydU1qWXhlbUR5MW1odURJNlJ3?=
 =?utf-8?B?Q3VGSEhVMlQzMWI1bWxFQXA0TUt2eExPVm0rcXdJc0liN2llVXRFdGJuYVg4?=
 =?utf-8?B?SEk4aEl5aEtUekpsOUtLQ2VCTTNuUDRHdlNKU242aEJzMyt6eFFIUDJpU3Nj?=
 =?utf-8?B?RDV1Uit5OGFJV3ZveDdaeUMvOTBJeHk3OS95aDJNTitiQTFXaENKQnpWRzJC?=
 =?utf-8?B?VmVEeTZKUVZXWVBEWXB3d2lRRTNjVzNSeStJOWhHUU11bWZ0S0xmOERjV2FM?=
 =?utf-8?B?VXRKUkg0OHFpS0NYWE5saVNqcW9xWm10NlRRc2ZZVUt1RlBidXN6RFY5cTRO?=
 =?utf-8?B?NjlHRVI2N3JVanJTajB6VGsvY2xYY3g3OWMvamh4OVpZZjBTZG1iaER3MFgz?=
 =?utf-8?B?bzFuWCtKNnUwbnVHQmFHdkpFcjhDSlFTNW9GaFllY3JBN1VVVno3NWU5Ylcr?=
 =?utf-8?B?VXNER2wrMGpDMldTUlJVWHdERDFlditkcmdPS3I4S0RCVm0rVjhMQXMwUm82?=
 =?utf-8?B?S2d4bVpFcUNrUWNMNlMzZXFlNDJyT25TYlVKWjlFa1VxKzE4djBEMjduRUVC?=
 =?utf-8?B?NmpwZ08vSklPNEI4aTJYVVRaUHQyUWl1LzVOTjdkWTZNNEYwQmx1U0lpRStK?=
 =?utf-8?B?Tmh5MmZkdnk1bTdqdE1kYy9MY1hNUng3eThWQ3RsMkd5TEtocE1TUTF6RGxr?=
 =?utf-8?B?NmFtdmhrL0VTRWZnYmNCMGFrTG1IL2MveUJ3cE9SZEprb013d0xMZEpKYzlj?=
 =?utf-8?B?U1BhT3FiT3J6b1VzRGk5Q0NEL3NoR2xnQUlXeXRMWHMrYVFaYW01Y0tDemZG?=
 =?utf-8?Q?COHD/NuMuAN7v6p+IoB1+P09i?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79fe9a80-dce9-4768-315b-08dafa1fa559
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 13:18:25.4643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mG3ZOkAa3rISTGH+NXQIIKO83AnC0HU9w74jJExUzOpaBiG4jppoS2oVDGP7IPvJZDq+s085DgH83sAlrTsX1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8545

1: fix PAE check for top-level table unshadowing
2: mark more of sh_page_fault() HVM-only

Jan

