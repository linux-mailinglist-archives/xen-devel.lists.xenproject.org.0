Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DBF7CF47B
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 11:55:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619071.963642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtPkV-0003M9-GB; Thu, 19 Oct 2023 09:55:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619071.963642; Thu, 19 Oct 2023 09:55:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtPkV-0003Ik-BY; Thu, 19 Oct 2023 09:55:27 +0000
Received: by outflank-mailman (input) for mailman id 619071;
 Thu, 19 Oct 2023 09:55:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g4nO=GB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qtPkT-0003HD-RZ
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 09:55:25 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061a.outbound.protection.outlook.com
 [2a01:111:f400:7d00::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f2a69fe-6e65-11ee-9b0e-b553b5be7939;
 Thu, 19 Oct 2023 11:55:23 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB9644.eurprd04.prod.outlook.com (2603:10a6:102:242::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21; Thu, 19 Oct
 2023 09:55:21 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 09:55:20 +0000
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
X-Inumbo-ID: 9f2a69fe-6e65-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q5u0jKeNZ3FMWKKwBdMh6kcexjhw1v5gm+dKPa496wQ0dtLx1mKKgoq1SYneDRAuBYs6XAP8nN5vGl//cn4Mz0QYDP5/AJO8UwRXbVoatwfrV9PGsey+TdMKQMHbqVws2K7iZ7VzoSXQYODzkJs6zrP5xvHLS3nxaNE6w5D6C/2B87tkPBKdUlgEgafD1RhV8Vbu4pKjkZ1P8RFJiJl3i92dYT0qXpJU8K1RnA+dYnG8aeiIa/CXillrW4tS8X5mfU/DC2Dq7q97zcA9Hp6MHjlhUXfOUqpU9WBb4UFT+Zzl9BLAiFxfIUpJNBp59w4OH2xbN4sDM9f6yLX6/6tx5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3IohAPnF4SWv4d3fg3ogEwxvxRU3rFs8TFodVbaqGoE=;
 b=eJ1ws1FTucTDWMN/caT7iBD4m/QcHiPmk3sce76CGwugc2cDkQTkqkAf+1Xp6oyE6ySsMJr2ui4U9MBKxwb/aku86ukqezBlN5AjlfUoJr816Ba5LU4Aj9HW0qIwtazNOwIVspfoSj3m339kXZUnppCl2fc9u4z8HekijLkYtagHE81hHAjphHYG8PF2le4ModhMrB1DInncxoFcmvME+uQfB4C+/RdPmrsLdfkPQL0X966XxBage5qZxF4sghY7eWoRSKJDgwdxsDTNxufI3kUL9476pTOEI6RExtDlBc7Vrg27g8FvMlpz+jlZ2xJIywSzS7Q9dQBjm+ldgnuNUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3IohAPnF4SWv4d3fg3ogEwxvxRU3rFs8TFodVbaqGoE=;
 b=M+ITmyfkP7BdXQBJAG1ab5qfE0RVxMTYQ/BKDNR7H8cs7fmM9oKOKVFE29JvhA5fiZaQRYfAQTmTuW5zoF8I/R2Os+1LuqukfxadEJ4vFtexfwgQhamSFw1N23Kmi9CUG6D031HgYa2a4fDXJM3lzjlVQJoyfbrV6w/RX/SHpLO3DnEjYd2hBuaJJrl4fFI6JOVDY1qpU2+xbyUnXTW8FSIn/02zf2ttAvLDrM4GFKP8TgG3YGPy8P84FnqFtkZKebGtqZ5P93iIZSvSSfh6Pyy1AbsEKTgvrPrqFKSS0THS01f0Fuot+fLEGyALRZVAXcnqdqF/eS8hEGjLfIaygw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d4dca6d7-ac54-beac-26fc-5eaf80783a73@suse.com>
Date: Thu, 19 Oct 2023 11:55:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v1 12/29] xen/asm-generic: introduce stub header pci.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
 <597a482c70fef196e245a5d898ea6314a0c479ca.1694702259.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <597a482c70fef196e245a5d898ea6314a0c479ca.1694702259.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0156.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB9644:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a149693-36ba-48aa-9bad-08dbd089814a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	g5jNJIiIGMifXsrRR9VnMmxyEIDHM+V4sMcmM8Gm0UPo1fjUO4wJrMGiQDeNjkMVNEieIwPp2Pt7VzHl0fbxMa+mHt7wFhVelxoyG6GHNLo2UwDpPXOBP/J0u6MuyQ/WcFPIhe545ivwkWX654CQy0/vkWk8BZMp8BBwJWz0CAvJy/wp5iJyr8BbHn8R6+IsGMIw2aB6z4/fbHC0Ir41PeEFb46VxTAeAgzVxfDEjFd1rZ3XvSS+Uvkcq6BS0MWY2rnP4ku70OmeGjklOYHEHUsEMUFjvlicxkx1Jmf9cFfy9uukY+4pl8p8Wukq2WWQX9ioSYiPQsXjX91I7y6lmxOZ+ddx69unzh838nwaJOcMSVYjovkOvCo73/QzUWuAbsBMaB5LAZV5cyexgEChZr2lx+zMA/jK9sO0J3O8O+pGbSKOnZgzyXPB5qgsipw+OpEiNr/SNKu09mVIKtbkKcd1F9wPL8LHJLwd/lA1haAsPicT6EsQUzgSxmvDy/yjMXHWo3VgPlGtOvsqJzJhBcMjEXhb6OuZM4VXkSvHLhuNmZjCaI6LDx1vaSikAj8E9KfF1Dk/wQ/8v7B+g76LM9PPu2f4qpRGPj6xHfz+yCv3TsqzJ7eGtjVbX7PtzQwHHkKUuJvPF720dylaQEImV1VrFLAr5AmOjC3Lalo1LUQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(39860400002)(376002)(136003)(346002)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(31696002)(86362001)(31686004)(36756003)(316002)(54906003)(66556008)(6916009)(38100700002)(478600001)(66476007)(66946007)(53546011)(6512007)(6486002)(6506007)(26005)(2616005)(2906002)(8936002)(5660300002)(41300700001)(8676002)(4744005)(4326008)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZmsvSFFqR201Ull6blVwYnpzMlBOb2pJTi9UaFFFU2pHeTBBVm1uZHRhQ0M4?=
 =?utf-8?B?eVBsamFsZ1NwUTI0K3B5YWNLZWhwc0RpaTRVVWZtdHVtU0syM0tsbjg0bElh?=
 =?utf-8?B?NHV5aytvU0V6d3FBdTlIZVZ5bUJibXNUYXFkTE5idlhaZ014OWVHcmVFbkhE?=
 =?utf-8?B?NjRZOXQzZ1pRU3lnb3FwSWc5bHdhVmRhaDNsN3BpdzQrUVh1eFdmUVFmb2o3?=
 =?utf-8?B?c3Z5Sk1tUzdwNVFybE5nWmtPZGpGT2pEYzUrN1ZTcXNMcTBjTzVBcUhqcmZy?=
 =?utf-8?B?UkRFUTZvSW5EemY0VERvcHNhTmE1QjBaOUdidjIwNDRqVWRvOU9iNjdmblZS?=
 =?utf-8?B?V0Q3cVQyazZ4ZldYa2hRQWk2ZUF4cWhsZ0kwWkthWWRFd08ydmpqN1JpU0ZK?=
 =?utf-8?B?cm5RRDFUQ1JwbHBPTVpTZ0JDNXdCckFSakpGWGliRXBMUzM4Sk5XcTRGdExI?=
 =?utf-8?B?amZiYXJYZWFpbDdLM1J4NFpiOWxLaXoveFk4RXRqbkJ5RnBheHlWN3lodWRq?=
 =?utf-8?B?T3M0RlgrTkpmZ29uYVJCSThIMTRXVEhGME1sSk1hSm8wM096dUhlb1FWUS9B?=
 =?utf-8?B?cUQ4TmJpdGRWZEp0eE82M3IyUWZEc01yaFREUWtIbytOQTc5azZORmhaRjFm?=
 =?utf-8?B?NFYvYWVoVHVxNy82eVVkN0ZzeDRlMlJZK1FlUG5Pdks3dWlZWkkzdlh1YkFO?=
 =?utf-8?B?RFFkSVlocU53OXp1NGN1Rzl5N3ZCN1hQNGpiOGZVdm03bmFvQ0ZQVzc2MGFF?=
 =?utf-8?B?cWJBZjZBODdzQkplSUpwK1BydXR4d3VXbEhsSWthMWZQU05BNFlvRy9nbTI3?=
 =?utf-8?B?Qm1sRzZtK2w4eWozemhjMFdyV0hJWWNKSUt0TENHdCtxZzBCbHQxKzlNQWNH?=
 =?utf-8?B?NWl5ZE40ektnbGQ4eXZZSkg0V2FELzRTSXh2enNIVkozUXFPVHM2UnluNm1m?=
 =?utf-8?B?ZlE1bEwwNURiMHhmNkhHYWUzejloUHZVR2Jndml3VjdSM3I0ZlFRS1hwUis1?=
 =?utf-8?B?RVB5VmtuT3NwdXNnd3prRDFKVkR5K0hIYjV0bXdqajdIeC8ybC81cVk5REVq?=
 =?utf-8?B?elVwdVJvekdPWGl4TFptajV5eTZkQTd6SWVmZjVSb0tjNlpVTDkvZDNORVFC?=
 =?utf-8?B?SDJwRjFWVENRdzl2cTNzaDkzMnQ4VTloL2xTTWpJL1lQYytvSmY5d1VzVmpy?=
 =?utf-8?B?TnNsYWtEeEJMei9pOUE0VWV2NVQ5anZxZjJ3OHNvRExLNFJHZGpDZGdGa2VM?=
 =?utf-8?B?bXB1Y1hCdkk3NWErc0hNR3NrRDZYT3daRTExcy9PVWhmYlFIbnV5MnRiaElO?=
 =?utf-8?B?WGVHUXRQWmVPT0ZNbWh1SXFFUWU2M0VGR2x2SDBJcHdyQTVoNFQ4bGJodWRy?=
 =?utf-8?B?WWFiVCs5dkZHRERlenF4SWtLaHR4VDVCKzZ4ajFndjl3Mm5hN2NlZnFkcDJ5?=
 =?utf-8?B?ZnJVR3M4eFpwWmRkK2UvTHdRbW0vSnNyZHhpWE5Kc0xCTEZpdDlsM2FMUWFx?=
 =?utf-8?B?UTRxWk5XK3Z2MTNGcGNUZm04ejkzajF6QlU2eGhFbzE4U3JZK1p6ZnUwcC9I?=
 =?utf-8?B?dXp3WjZJcTBJMjZIYTFNNm52aUkvUEl3aXpRdzdKOXV3RVY4ZWFGV0d3cHJC?=
 =?utf-8?B?YmRxaTlSUWdocTZMaGNkdjF3dVJQUGhlQXc3S1NYMTZRN25Cc1RtMkVka2hQ?=
 =?utf-8?B?UVJPa1Z0cW91b3J3SS9ZVytoV0s3bUxQRk1OejJ5ckFOMERtR0tFbVo4RWpK?=
 =?utf-8?B?bkpDM0g0aGNMbG4xbHJRQnpvVlQ3OTlMSmVXUFZ6czJQd09PelRjK0R0MUdH?=
 =?utf-8?B?MlVKT2V0cXJiZlpEOUg5RGVIUFJpbmkxQ0x4K2hncDBSR05JUFN3N0dNekVT?=
 =?utf-8?B?WFFwV0NLOGdYVzZPK3U4ejl0UGVUdkxJajlTYWNsWGsrY09PUFprcUNkUitp?=
 =?utf-8?B?cGk2eTZZMWJxUG5KbW8rcG5IV01GWStRaTNVY2wwYW9xZnhIU2hNcm1EKzAr?=
 =?utf-8?B?cjU2K3IxZzBtdWk5RUFXWElmWFJkK2NIaTV1Z2NCdW1qNFNiNDRXaHNaOHdS?=
 =?utf-8?B?K3Z4YThiUXZxMEw4UHRBZVA4ZkdGU3R1RFBsUG9PTzRXSm4xL3JMWkFjeDJi?=
 =?utf-8?Q?/7e6NFXh6bk3sKTZ8pe6W3WB5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a149693-36ba-48aa-9bad-08dbd089814a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 09:55:20.2348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UKnRAu+7rJIKfTSCJ+RdE+AKmkt604f2tV2TFg6Au5U6Oa1CBHYbt62Lo7jJV1qkMsJqZ7dE9ouyNq19eAG6yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9644

On 14.09.2023 16:56, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/include/asm-generic/pci.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __ASM_GENERIC_PCI_H__
> +#define __ASM_GENERIC_PCI_H__
> +
> +struct arch_pci_dev {
> +};
> +
> +#endif /* __ASM_GENERIC_PCI_H__ */

While more involved, I still wonder whether xen/pci.h could also avoid
including asm/pci.h when !HAS_PCI. Of course there's more than just the
#include which then would need #ifdef-ing out.

Jan

