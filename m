Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C2F773AEB
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 17:16:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580045.908318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTORO-0006Ea-6O; Tue, 08 Aug 2023 15:16:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580045.908318; Tue, 08 Aug 2023 15:16:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTORO-0006Bu-3U; Tue, 08 Aug 2023 15:16:10 +0000
Received: by outflank-mailman (input) for mailman id 580045;
 Tue, 08 Aug 2023 15:16:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GY6=DZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qTORN-0006Bk-Da
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 15:16:09 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20621.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7df3b75a-35fe-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 17:16:05 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7763.eurprd04.prod.outlook.com (2603:10a6:20b:246::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 15:16:03 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Tue, 8 Aug 2023
 15:16:02 +0000
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
X-Inumbo-ID: 7df3b75a-35fe-11ee-b280-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SQBjC7vEu6+GuCAPhOicdNPM3044slf9Xl/DN5Rw1KSRodK/NKZygtsmOC2K4Zs0maJK4iI/Uf5oSTGlOqBwci0Z3tL13Q2BvtxkbHITKZrUuPL4Ya1351LRIQ88vw0XS4R4OnX7VPycEgkJtQdgSfvnYr4W4l9FPdDvt6f76qxFwQRDKsvBgA5vo9KdCA3j0bhZb1Az0bIL9600iOlMTHbG2t/kyJ+swILEv2EBwmwKTPoE9fUYb82WHgLXIaWgo417ZLbdQD0pmxrBZykxqnT4KaTQdobmeh2RK6UlO0LdJ3BpxlP+ULOW+t0lSIENE/0BPhhFtqrQaKZcsLfJww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rPLem2qXu3qEoFuK1xBkTuhqviQq9n7waaPtSwXl7MA=;
 b=EwdcnfCH5by8vN4kWcBsIRbk8mSUQhQ++Cv5bYRnXxg/eNpHvIjBEhiWyyRSvACA3wArNp+FWIu9RnAkDZQgmJ7RLgbCiccGSQ2XpA4o6OAX4ruRZlK+ULorERyCCF2zBbGF28oEhEZ6tKcgz1XwvVsUNQTRso+OwfFn8dIIAjMTiUGeBfOm43bNU+5rXS0BLK2+LCMWJpZQr5w2aasB4agZLvoJwMefXKKDsWUYmuFHY8+2pm+Vqv9fwmvvBxpeVRseMd2x0K6P7yTeueZtT9urukoFx5/WQXNTNAfgN3WPrW7FvOTJulgS/MIMFlnqDkTg4poQbxJLJ5paL9tQOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rPLem2qXu3qEoFuK1xBkTuhqviQq9n7waaPtSwXl7MA=;
 b=bn1uCwJjaflYvKRHOgESJyXUrr2otd5CFTEbYuVHgD683eYPvp5CrSrr2otfsq+MUDbwK6dk8Etz2uvCkS4F4u0QpH9qgFJ35jw12rDiS4NKWqttkaeH3z2yieKEBy4wHuOxv2L7DjEbWUBhNzYAutlQOeM/4/2/sYdj5F+1idxmWrSawgeogySaMoWk6JrZiWYAg2VoZV7i3iUW7R271DNpAgvs5HcHn/ApNxV2LVycyrRNzFv0bcFLoewZHtSj2tRcQdUeOQmw24KXBwN2qy8kP78JmfeRgfQkoOJspCKoKYwfY45uw/3b3RwzEVnj0SK5CH7moqlz0VrmYt/YmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e178e8f0-312e-961f-6f09-84305f07d528@suse.com>
Date: Tue, 8 Aug 2023 17:15:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [RFC 2/6] roles: provide abstraction for the possible domain
 roles
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230801202006.20322-1-dpsmith@apertussolutions.com>
 <20230801202006.20322-3-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230801202006.20322-3-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7763:EE_
X-MS-Office365-Filtering-Correlation-Id: 1170767f-c3a3-4be6-b066-08db982260e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Aioq506w83RbALyXVG8D0epnx1w/NDvmq/Ih/E118LROABngKUZnlWYWp9hl8/b78szF5LgHi0Ly9CYwEIGAWSAQvnDELOrnLo9vjyi1IkEkuMDmiPLGPw4kFKEUV08CdiKT3QhveL8IUC+PVS+dXlwx4aUNwSiJ5HD1d7f71Jes153zAyq+qCbEb4jVcR6jScPeeiSWDSnGlpRBsiZstJ2T/SZzh+O35VJCih8StqsGds1iVKYIq5Gof3cPzN88cmu/9vH0UHskPHJYE+JlwwRZX1K5ohdTkBHugMwSeLnOeoXx8WHZnkZNu2pjd3k0K7s+cbIly5LcvJz5reAHgZsOYpSQCEdecV7WFR8moRJDAlBJ6QdbkWWhrdwANRkB5Yieid43ry9lTflPLM+iOt02VIl47/lKenrO2EJz5JlGsEXXMEkpndmZBk4AnGO8P+TPPqNIXsP6vVZ1dWGveUv/VSOFp1x617kW0f6pj1lk93I5Mi21Enowm6b9HhLdE/REyQ6fYOmk9UWJQDboWxRM/pX4LMExUbo9lPlFc7Y0NczJfo16eQgjgjum19LNl6VGcimCRjNEw001Jw1R0Aw4KuB2BqrDpo+jYeKv39QUu4Kr1PUAjFmSVFUZRt6ijTnEzLLZLt/JKF7N42aTgg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(346002)(136003)(396003)(39860400002)(186006)(1800799003)(451199021)(41300700001)(26005)(2906002)(5660300002)(31686004)(7416002)(4744005)(8936002)(8676002)(2616005)(478600001)(6916009)(86362001)(316002)(6506007)(31696002)(53546011)(54906003)(38100700002)(6666004)(66556008)(6486002)(66476007)(66946007)(6512007)(4326008)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N2ErODZPS3RKV3M1NXFuZy9iTnltTHQxUVU5UFBhcDU3S0Q3cmN2VEQ4OVZQ?=
 =?utf-8?B?RG9xTTA3Y25sdS9LcTdZZG5wK3dJSWErTm05MTE0b3lTNlF0YWQ3dXF4MFl1?=
 =?utf-8?B?U0xrQ1orRytnUElxeWIrSXBFUk5sME4wa0YyUnVOaGlkSWVFbFdkT0JSbk9C?=
 =?utf-8?B?U0FWb0oxSVdFOUhzY1dyaFMvM1U5clFZTFZDUnNCbVFWVVpKTDhpMWlkdVFE?=
 =?utf-8?B?Z0tKVXpLU1BWVGtyK21NNmxlaitGWVpZWU5qYnB2N1lSdlIrT3FhODVCOE04?=
 =?utf-8?B?VFlTc1BaSnVhV05henRZWWk3czhWOHU5c2Y0R09ZUU9STnRmOEZNN3UwdUZU?=
 =?utf-8?B?SGp1Wk5LVG9rUWY4ZjlUOXNXZHZwNHJ1cElvTE1yZ1EzTEtRTmw0YmtwaHla?=
 =?utf-8?B?Um9Ec0w4VitOclFiT3U4UUMwZDRTMnZxM21ocStycmx1eWxuWTYxUk1Fdits?=
 =?utf-8?B?V1FRSy9OdzFTQ2lFWXZHUDBQcUNYTk5tVFVVWkVNRmx6V3ZRWnpZWDJsVGVN?=
 =?utf-8?B?YXZjL2Zpb21rRnA1NDRRdU1ENDArdUw3MmNpUnppV043Z2k0d2Z5SzVDWjZB?=
 =?utf-8?B?MjJrV3RvM05Kbk11eXFYcEdaMGZ3SXVzUDd4VERVTjVValJnRmdWZUxqVDl4?=
 =?utf-8?B?V05oZEk4bEh1RWYybWU0WStOMDVmZkhzcFVaZENQTjZJZHM2Q0NsUTJoOEc0?=
 =?utf-8?B?VCswR1R4d1IzRnhmeU5uWkpPUmxkZFRBaHgwQnQrVDB3dWVsNWMxaTBITkFW?=
 =?utf-8?B?SldSakxZOVhMbGxMVWl2STB5ajFkSWFjVjREamE4eWpHQzZMRjAvNGFTd3Nz?=
 =?utf-8?B?anNFRmI0SnN4NTNXUDNiNGE0VHNRNmNnYTF3QzZ6ZFB1bVpPekRIZ082L2hZ?=
 =?utf-8?B?dWdTT2k2dFdkRVMwOTI5YzNpcjhOVnBxM0JzYXVrckUveXJ1S2JSdFUwVG1w?=
 =?utf-8?B?UGVjVFZwUk9ieml6M3N0bFB6THI3MElUUkVPTEZQVFFLc1Rwc1lHOXluN09k?=
 =?utf-8?B?YkhjTmlBbCtrMmZ1V1VKSWphQmFHL1FuUHNXOXZmREx2QmQvVlZvUWhSU1hz?=
 =?utf-8?B?ZUZPTkx4UTRYRVFHcmFURnVOSUlkN3hPUkhaOWNVcWx1bnlheGt0ZzdKWXJL?=
 =?utf-8?B?YXorSkdGdjZzNlVhRmEzZXRBeUV4a29qWWlxL25LbG14U2pUdGVJcnFuTExF?=
 =?utf-8?B?WTgrblRTZzNEaFhHcVJPUERnVjk2ZVI2SjhVWW1STlpBZEVWQnArM1NkUDFp?=
 =?utf-8?B?akI3MjVvU291VW5kb3AvWkFRSVdIMVBiNVNURldqZnFHTFZQRGYrZ1F3YitK?=
 =?utf-8?B?elBCUE9VeTllRlBwZ2dLT0FpYU1JYklIRGFVN1NjWHc1ZHJac3dDb0d3c0Rk?=
 =?utf-8?B?U0hNQ0VqTmRRWUpTc2dvQjVMcHI3YWlwN1E4bWtxY1oycGFSOGhGYzZjQVJ1?=
 =?utf-8?B?SEx0VWNjUXNxYXlzczF6RmFkd2xNSHluNnl3Qkd2MHVibTU2NmY2SitWM1k0?=
 =?utf-8?B?UHpZRzQ3RXFsRWZESFVSQ1Vtd1VrTUx6eDU0Vk8xUVVRRVhwZ1JObEtRb1Zk?=
 =?utf-8?B?WWppbWIvQTFTeEU4V1NrUXA1Sk5JSDdPSmtxSlRYa3V2TEloOEJGK3ExRUVB?=
 =?utf-8?B?NjBnd21mU0J2eWpRSHZLVFhZSjEvVFpJQU1JdWRWaVNueW4rV25WaEZUd2dq?=
 =?utf-8?B?eHFhQWxuTnV2RGlocG5ORlplMmI0S3VhanhrUksvOW81akM4TXBqKzZjWXlZ?=
 =?utf-8?B?K1JpOXk5TWR3djQ2dGRWYjFUbEUrV1V5N0NtTzBRRi9rVFRJZjk0UVlSUkN0?=
 =?utf-8?B?dlF4cXo0WWhnVFdTcENjVHhiaE80Z2RTL2taSS83WTlKQzZlbndmYWRYa3Yz?=
 =?utf-8?B?ZXc3S3U0UUdBakwvaCt3OHBiWXJvSW1mcE5Lb00xUnhlNjFTdzFsYWIwc2NI?=
 =?utf-8?B?bkVBYlF4Z1NVWm5aOUdJRUZKNjVDNmd1Z0J3UjROdFVEaGdCRDB4RGJ1eGJM?=
 =?utf-8?B?bGp6bTFPek1jeTFya1lPSi9uWFJzN0VaSHlTV0g0VzNFYkZMYlY5NzZFNFlT?=
 =?utf-8?B?MUZaNWNtUDhWSTUrZUVoMmVxRzdkZXdEUll3UjVzR2loNTBkTFQ2dzFZTklZ?=
 =?utf-8?Q?rlDhFV9arZHT+NIKRx87YO3dL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1170767f-c3a3-4be6-b066-08db982260e2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 15:16:02.6395
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O1VK8i//DSwFiPoBIwZPR4XJsSQwrwHv6aVPWWWOGc4QybHne7JOKs6pbxLYT93NDdk98QHiz5NhtBbwZkujJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7763

On 01.08.2023 22:20, Daniel P. Smith wrote:
> @@ -1076,7 +1076,8 @@ static always_inline bool is_hardware_domain(const struct domain *d)
>      if ( IS_ENABLED(CONFIG_PV_SHIM_EXCLUSIVE) )
>          return false;
>  
> -    return evaluate_nospec(d == hardware_domain);
> +    return evaluate_nospec(((d->role & ROLE_HARDWARE_DOMAIN) ||
> +        is_initial_domain(d)) && (d == hardware_domain));
>  }
>  
>  /* This check is for functionality specific to a control domain */
> @@ -1085,7 +1086,8 @@ static always_inline bool is_control_domain(const struct domain *d)
>      if ( IS_ENABLED(CONFIG_PV_SHIM_EXCLUSIVE) )
>          return false;
>  
> -    return evaluate_nospec(d->is_privileged);
> +    return evaluate_nospec((d->role & ROLE_CONTROL_DOMAIN) ||
> +        is_initial_domain(d));
>  }

Why these complicated conditions, and not just the check of the single
relevant role bit? (Also note that indentation used here doesn't really
match our expectations, but there are other style issues in the patch
as well, which I assume is okay for an RFC.)

Jan

