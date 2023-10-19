Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C5A7CF3E2
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 11:19:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619033.963531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtPB2-0003eK-83; Thu, 19 Oct 2023 09:18:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619033.963531; Thu, 19 Oct 2023 09:18:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtPB2-0003bn-4g; Thu, 19 Oct 2023 09:18:48 +0000
Received: by outflank-mailman (input) for mailman id 619033;
 Thu, 19 Oct 2023 09:18:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g4nO=GB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qtPB0-0003TN-PF
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 09:18:46 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20621.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8094c8a3-6e60-11ee-9b0e-b553b5be7939;
 Thu, 19 Oct 2023 11:18:45 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB9892.eurprd04.prod.outlook.com (2603:10a6:10:4ec::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21; Thu, 19 Oct
 2023 09:18:42 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 09:18:42 +0000
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
X-Inumbo-ID: 8094c8a3-6e60-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bfiUf38bDXcU0l7seHt+eT8zrTs0/m7qgZmMA1mzEIaE+RrS7ytVFpFUFVdlCXRqlvzbrcR1IeWYrVEUVRrpmYhE6hTSqfP6zGcSdzxDGvlMvm9IpaDfTgL+uoB1whzCy4Ujw7A1BCAaTjnqYJhhcxg/S2A7sglmsDLZWFipB6Qiih3lHIjlQYKwpadS2+mc17lKtlcmpPHiug9RpZRU0qU+s9USITKJAdG4Mz05jlSyA/56R2noHcBn49J2u2GpdaTqCGtXu1qkcm50/zhYoeRduAOA5HL4yvp8tbve7EuBSltvD8DdVMbkJ5e0y2wJ0auF0PZjgr1Lj8Ucx8XZDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CKHoipP/APf5T057x2ogsLBsB+fPgqZ5QMhPdRoaEes=;
 b=JJBiukhWFZtNgkyfNi19V07AuZIMIPoAQjtoQ+kC5IX+tT1HFTOTXLlywxFe/EMMgvHI751DGylsXc/ZeHPDba2+gXWjPtm5JH7XDABRcLOWFdv9P+9Tbr3bcxpQCy/7AGSegGlK7O7bxKR7S0oUaRYpl+YM4/S1E6ePP5ZEd8wpr3OFQzrz8B8xZUvxbdE19oNa3ErrBjXg24ikHd3VtlKgyJaV4b+vPgCrGj5NtOgBpPmyVCwlGrgRZPUSIN7ESeHZDbUAVv3IMcb0e4max+TuGebRYJT+C257g7LWAf5gGDHPHc54WTWeUVnUa/ZmapXm8cXlLif2K8fOctrbTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CKHoipP/APf5T057x2ogsLBsB+fPgqZ5QMhPdRoaEes=;
 b=Z01c/h0zqqELQIM5j4YijIRE/jFdnA3aRq4RlhmpZW1e2DQooToEowAL7VjybgsSmH0RYJ/NlcrJwjieZRizQxtpv/TjYqLpxPWV8pO3ZWUQDLDSBmaDJmYgk08uqyZI4zp3HJ5BZY5p1Isej8s5nvrZBuRF3k0zDP7YbEZyKLij6Ay7r071COXBEO714ber7cyIyjLgEzpfCLCzweZrJN0AnJO4bEx0NBmh13u3lQZpbz2Me4DbphixH+l21TIlGSC8ptOV8fKXxe9xNQNdBSk9PgBCxbkhY+Mf+c8Fruin0YwsMzMBGZ8HkxqqZ2WOUYU0XAEXVxnO4toRHXRv3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a71eb141-6ef7-f1bf-d4fc-832d710f63e4@suse.com>
Date: Thu, 19 Oct 2023 11:18:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v1 05/29] xen/asm-generic: introduce stub header event.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
 <69563e3f41cb6971f93630d9df59395f159bd3c4.1694702259.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <69563e3f41cb6971f93630d9df59395f159bd3c4.1694702259.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0212.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB9892:EE_
X-MS-Office365-Filtering-Correlation-Id: 56dab772-10eb-4b94-8662-08dbd0846360
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	180+1a60s/JOXEKEjiSGWs5SPhL56z0vxT7GFkPahkKmPsjIg7XzTpCYfUdrYy5Qp77Sw0ZUgNq3DuoPA4T0Zw4VoMttPAw+51XskT0zA50ed3w4TrX3ARas193MjFEfQ1wCiuWS74eN2386BL1gnwmrcaNK8HgVB9QwhmbS2R0BpqKK7vNMMkyA5myVIN4raOjJNVVI6SqC/heqv9Zm+qGUm7utwdTsfPEyVfaU4XsAPZ9Gt/4kLenCgNTYg3qfU4GxsYaS2jEmIfYlnM17QDGQ9z7SIg6lT9sByNXZBKgpglTGB7zGsuBVvN3qm7sWL5bzEI/JmUy7sTMPpb+YTpt5gpC2wg0fYT2Pr43LghfNWoo/mx24kxt0M5f0Gbb8UmKzwE9XEUMW2pmVdq5WDMoDyCbDrOcTsPQvqglDtg4gcKHnsOOPy+mwlaiLOxCvPOkhzynQIoOWRfo4pwfiEHJxQP2sEYWJPtq0GpQY9ujz8Uc5po+OqRwicbpJgY4u5vyMkZshBWW0IPvetgEN/CiXLQKewD6/JF3PW4hgIlCfBpbFtGNfZSGNM3Sjhf0RZEpDq6J2MrTq8cUeoXg104IEBVc/HTGlWhZYWNlUcWus86qhB6j01PxGXVtRzA2SmZWtsFV1JzE+vhqdOw1rUracqGN7E+f5aaHc3zFL7Lc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(136003)(376002)(39860400002)(396003)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(53546011)(41300700001)(31696002)(54906003)(66556008)(478600001)(6486002)(66946007)(316002)(66476007)(6506007)(6916009)(86362001)(6512007)(36756003)(8676002)(8936002)(4326008)(5660300002)(4744005)(2906002)(38100700002)(2616005)(26005)(31686004)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OFIxZ0ROUlFxQkY4bmY2WjYyMnpuWGVwWjVoZnlVWWVRV09OVzhFemlCTmRX?=
 =?utf-8?B?Z3V6b011Z25ZbWRFdjZwUGhjcXR1VVpLQk0yZmp1dlFIektScG1qVWFqU2FG?=
 =?utf-8?B?Q01mM2hmZStMYjJyN0hDNEZqTWl6ckNlRzQ1T29BQ1k4NXpqWlhRM2NTZHBC?=
 =?utf-8?B?Q1k0M0ZZMll0OHZVTnNtRVlLVSt1WDZrck45dGxLUUJqbDJHcnRkR29hZldF?=
 =?utf-8?B?Mk5uQks2RElSdUlhcEw1eTF5R0ZRT2VEYXRzSUNIMkd0YVg0WnlOZjI5SytW?=
 =?utf-8?B?ZmQ5dG1SMVRqbDFURVNURjVwdU9wM0JnWWcvVm1BY1pDZXVxVG5Na1M2YUdS?=
 =?utf-8?B?Sm9IRkVmU2JoT2lzRTF3dENXQTkyaXdHMExDTW04ZDc1QWduU3BzS3Q5NjMy?=
 =?utf-8?B?WlJBS0hKTitRS1U0VUdlT2ljcnE4aS9ZZTZUV0xIMHlKYnpjL2MwTWkwNGl5?=
 =?utf-8?B?c1N2UG5JTk50d0NoOHNpQ1liNnIxdVRsSTV4ckpnbkRtRHJ2OUpoT2JaRVVQ?=
 =?utf-8?B?bmN2RVZlNkt3UGFWc05DZnRiRHZadWtzTy9xVnpUNm1lOVZpME1taXZWVXpn?=
 =?utf-8?B?R3lIbzRIUUlob3haMmxVcUFvTndJa3JtQ1VhaFhBWWlxWDZXcVp2ZEFheE0x?=
 =?utf-8?B?cGo4UTg5eGZlWHN2QVJuMlhEQmlKNGR1bVIwY204OTZOZnh3ZHp3c1BjRlNH?=
 =?utf-8?B?STNCRm9SamFmeWRvUHFpYk5aUW5ucEhwWFY4ZmoyYjRvbVh5UjdOZ2toWmkr?=
 =?utf-8?B?bE9SZW5TRzhyYVdKQ21VMWR2VENvUEo2OXRDQlhEQjc3aVpoYlZET1M3RmVj?=
 =?utf-8?B?ZUlIREx4WFlRM0FWc2VXWXJTMWlkejFHcHQrLzA2ZVJieUJlZHJNQVpWcURx?=
 =?utf-8?B?U2NDcGhOUVlDaW1KT0RCL2FSVngvZ2dtL2xOM3JLZmJjUCtZR1JzK2QrNDMx?=
 =?utf-8?B?TmlHMiszTWFTVEdFc0o0VW5kMHpnQlFvdFpSbXpnMzN1bHAxcnV6MlUvYno5?=
 =?utf-8?B?THo2aUJpdUJSQnZWaTZqRG4rWFRiekUvbXRQcy8ySVp5dDM0S29YcDdQdTdX?=
 =?utf-8?B?ZE1zM0pieG42eWt3MytVMWZYQkdLamwva2tMMmZxeEJZS0F4N1lpem1ieWtV?=
 =?utf-8?B?My9jTzhOQ0pOSnRVSUs0U2R4aDdtWjh5ZzY3UWNXNUtxSWZMR2tUMzlqYkxs?=
 =?utf-8?B?VCtmVHhCaThPdlZaOVg2UmlPY2xLc1FRaHBnRmdNWUVQZ0ZRSnRqd0lubklC?=
 =?utf-8?B?VHBuRkZpdldycGt5K3RabUJodVB4SFV5VUlucW9oRm0xT1dCU3lGMzhFZWNa?=
 =?utf-8?B?bWtobGpNVC9IbjloNnZ5MUlXT2hucmIwY0xpN3llNFRydDJDS1hhNGlsSzhI?=
 =?utf-8?B?b3FmTVpobGhsOWJLRFVoTHpwd0hsQmRKV0dpVXFvbkVoZTZYczJWSWZGSXh0?=
 =?utf-8?B?TFhRK00rV3B3U2VUN24rRVVtY3VFc0tvU2cxWlhsZWN3QVBxWDUranBoTTJp?=
 =?utf-8?B?bkNXSnRrRk1mQi9DSG9KbHhkRGJNdHRJVDh5eXV6aGd3WWVGU0I0YjRTQ0ti?=
 =?utf-8?B?Zkw0T3dhYTM5SFV6UlhIV3V5MWlOd29hRm9ITmIvMWFrQmZ6cngzTnp4VXp3?=
 =?utf-8?B?eWd5YWNZSXE4eklvMkFYWW51T0FvQnVydEtqSEF5TGZFVEJ1T3JQSG13Ni9j?=
 =?utf-8?B?VkxoQlNCT1ZYdmNiazVJUk1pUXZnY0VKZDdOeGx1M21ZYjFOTjlocXV0VEtq?=
 =?utf-8?B?WDZlWFJKUDFJSEltTDJmRGV2UTlyVFNTTGttYWRwd3J4dFRKUnMxamlGdEx0?=
 =?utf-8?B?eDJBUWt1NGtUQnlpVWszYXVUdW5VbEFNTjZpdnlZS21sR0k5OUtsbHZ6dm4z?=
 =?utf-8?B?UElLZ053RTBGU2tzMDZMeHEybkhacW44TTgwL3V6bU82dC94NU40VEUzeUhD?=
 =?utf-8?B?d3ZoSWV2Y3M2UGg5TlI0R0ZXVWFlZnBQZGllak5ybGgrQmxrUzRxUTBDTjlv?=
 =?utf-8?B?TndvdUs1dnlzUU5KRDdSVldVejhjT0xvTzRVRlNpOTFNVUNZeDBER1ZKemY2?=
 =?utf-8?B?c0duNDhTd0NJQUd2SG1Qa2hwOXBLd2hIYnptbmVNTUQycGhiQk1sT280eW5B?=
 =?utf-8?Q?x6JIjGOeDIBGLLscQezfTZ2dK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56dab772-10eb-4b94-8662-08dbd0846360
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 09:18:42.5526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BnWrgUEX/KsrbI2gWxDDGN60T067u0Y1cFBmsXp2Y5FT4KOwt6gUnwhAPArXbkWj1dQlQ4LxB5XAlhEwMp067g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9892

On 14.09.2023 16:56, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/include/asm-generic/event.h
> @@ -0,0 +1,39 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __ASM_GENERIC_EVENT_H__
> +#define __ASM_GENERIC_EVENT_H__
> +
> +#include <xen/sched.h>
> +
> +static inline void vcpu_mark_events_pending(struct vcpu *v)
> +{
> +}

While this will satisfy callers from a build perspective, no port
will be functional with an implementation like this. Yet the
generic headers need to provide the required functionality, not
just build stubs.

Going further in the series, I won't repeat this kind of comment.
Unless others disagree, my view is that headers put here should
be of use beyond initial bring-up of a new port.

Jan

