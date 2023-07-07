Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4608174AB78
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jul 2023 08:59:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560204.875930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHfRL-0006fz-Ra; Fri, 07 Jul 2023 06:59:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560204.875930; Fri, 07 Jul 2023 06:59:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHfRL-0006dB-O3; Fri, 07 Jul 2023 06:59:39 +0000
Received: by outflank-mailman (input) for mailman id 560204;
 Fri, 07 Jul 2023 06:59:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ruU0=CZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qHfRK-0006cx-HE
 for xen-devel@lists.xenproject.org; Fri, 07 Jul 2023 06:59:38 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20618.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d583b3d5-1c93-11ee-8611-37d641c3527e;
 Fri, 07 Jul 2023 08:59:36 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DUZPR04MB9945.eurprd04.prod.outlook.com (2603:10a6:10:4d8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Fri, 7 Jul
 2023 06:59:35 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Fri, 7 Jul 2023
 06:59:35 +0000
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
X-Inumbo-ID: d583b3d5-1c93-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wg/rBwXiCwemsElsn7zM0B9WtWoNga+nMrPjo+tFzCFWVxpHQobm+SlGB3T+hpmcqy2FmLxEsPDaueVdMnD8sV+HCgxg8BHpHovl8l/mQZpCQmkTeq2c/qWLBDgmgoRD4wWnLEwLjmAD885RZOcHTeRJpEMECJsO7+5Ttdh3S67RNfZzhr95gY8FocctiPua0doX6x9aqd9tywGSPn66mCjC82ukVAiyxv1Dxfljl9UtOxp9Ya4JsgNRVwCXMTdajNin4N4bVsd4DGCSxSY2mAMJC1MhqFfMLJ+KjfLiYcVePAOaQcwQsJWw2ZqGq0KBQvav2RNP1RyLNL/vq+rCtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Fg3SKqBpgFnJHUM+u1c6ukisHCJk5yv3+LVL97goiE=;
 b=EYbgMcKhHIyFPxe4C54v9iMJAW1M5jKCwTGDd/s6MUf9vcvsYM05Ax8TOZBFGB9XCTtLLdcamH3GnwxzHl/EvIhBYvKqVLsSjpHtRgQpp5kuurCmqYtap8kID7XsEmYYKXKL4cmUUtBtF/Yt6f1/OBUs5LdloYYBN+dSP5k3Nxw/ZW9CijhAE8AXnY5nMgW8dJE6X9WcEaKIy8m5935DK0LQJLYwkwm+KZ/xxmq5EJzs/VFBp0Y3fnc3/bwbdiiFEA+UeZ/AyeeIMFfh9KxapKJFnojpXfHftWZpvpD2jzx4y4aw3IwcxFO2YLghJg84qW6lrvMlC4FHfDiLThXWBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Fg3SKqBpgFnJHUM+u1c6ukisHCJk5yv3+LVL97goiE=;
 b=UAQ+s0D2FJ6OMveARfzvfwmFwoxpVLZH/mFwmgkHRG38Cs3h6aRDcuEyo2XoT6AUGjp3ii3vtsTsO09q40kamYIPmvXjhfxnnNir2yaIT01l4uGbR+/Y7LX6wIPLuJ6Gd8sdkjUROWUswtsKEl5OkS9zKVA6BXK9zJTpa3U50NFkl70bWQFCzCocmEDmyht/Bnqt4Uf8FJv5I8QI3MjAXzxlE8K7w8clgm+1Y8H6y/8Kti/kQLnXE4UGWgD2eNknzPWG98Eyr3Q2H95efz4BIRMbc2sswUJuwQoNNUDyNqBUzfUzCSx2wPFsFx5xZ7Y9xLnIHGTGoQ3uKIHFXz5iOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0dcbc190-2719-6c1d-55d1-4b229dc32e05@suse.com>
Date: Fri, 7 Jul 2023 08:59:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 2/3] xen/arm: make has_vpci depend on CONFIG_HAS_VPCI
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Artem Mygaiev <artem_mygaiev@epam.com>, Rahul Singh <rahul.singh@arm.com>,
 xen-devel@lists.xenproject.org
References: <20230707014754.51333-1-stewart.hildebrand@amd.com>
 <20230707014754.51333-3-stewart.hildebrand@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230707014754.51333-3-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0002.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DUZPR04MB9945:EE_
X-MS-Office365-Filtering-Correlation-Id: cb1f2521-8474-44e2-6c54-08db7eb7b8e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qd3N1DGuBaJfX0FPKI8nK/fVZDaw6Qs25H1XMCvAFQmeVY1zQqN6gbzNN9PrbEFbLbKEtj8C023CgeqzBiRX/6HmmpS72cw2Q4x7XcZU0KYq/6Krw586ZHvFjUz6C3f6qdxrXZHpbSIxBsCUgwsQ+HWYSumZL3zextl4oDQ1pXrx1j+If5kssJvqau8X+vixUjTzm/lNtLOq+PZdOAk3q2ZcvxarTo8uV8X516C7fmQW5QLT+b3WtOv41UyRZXGPfg/lla7aDV/cHDfLdIrlf+j76E6vhA6n8MY3JfhLK0dMZ870jgpe2yKiAdpznRvVxi1z4aNJ5nRmSRX1fAyvmaEW/XDtlMa40lLmN/HRR6HT/EQaE6rQWc4sMlLM94s/n5OOIZupwMkUFAt+ugOu8pnjlmkzrXZsEk0sd5/ptdoyS0Nxqi5LfbXL1J+5BDzq8BqhufmWnhsblEBAE/INH3mi8z9oZZVqENB93hO2rDPL7bOuNDhSS+4ZkQEZ/wX+wqim5DuWx/ybahdDLfiyqc/d2MQ4vSzzguBaZRMa08T8bnDvvRwIQviVJCrnrJ2AMe7aAswIn5jR+KSUr5f7nwUajVZnmakptkDwyfpAXX4y3NYF+uws7T/j1GbQiYhkM4e3I2cgaKadYW/N1UZPcA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(346002)(136003)(366004)(39860400002)(376002)(451199021)(66476007)(41300700001)(4744005)(6512007)(478600001)(54906003)(86362001)(31696002)(38100700002)(6486002)(316002)(6666004)(66946007)(66556008)(4326008)(6916009)(83380400001)(36756003)(8676002)(2906002)(8936002)(2616005)(5660300002)(31686004)(7416002)(53546011)(186003)(6506007)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUEwOFkvNHFnRWxGQ2FZN05wZXU3VkhJUzZESmF4L29rcUVINFpmbEVwQVNs?=
 =?utf-8?B?dnhZcGs4Z2tweG9VSW5JaDFvMmE0K2VYU1RrOFlNdU1FSHdGRkhkVU11VVly?=
 =?utf-8?B?QmtYdHp0YjhvbDhDVFR4ekoweDFqYVUxMTk2ejB0QjNvOXRBSU5VUzdjcUlZ?=
 =?utf-8?B?ZDFlK0ZoblYweHQyUWloRkJPRGhIUlcxK1NqK2cvWWpYTGFsS2VhQjhWbWdX?=
 =?utf-8?B?bUZ1YThqc0JKcVpNcmtTUWtRcVgrd2tEc2g3NmJrMktBZWZkWUVzR1Y4cHBC?=
 =?utf-8?B?eWUzbWRzZHkzQ2pwaTRNNDk5ZENicCtaMjYxRkhUUEw0NWpFdTd0TVVzTGhh?=
 =?utf-8?B?aTlzb3g5ZDZBeDBGVWZtUDhESjRRdC82WGtJUjZLQTNkOHNPQXFqRFZnRERo?=
 =?utf-8?B?U3BUOTJscWRhT2gvZGpPT2lhUExGY2pDczJGcGMwTlprL3JtdWJQdkZvT2Rz?=
 =?utf-8?B?NlpIU2plLzdubFowcDVaVEJHWmR3RGxjdEVOd2hrZStnN2Ntdnh0V3R3Ynh0?=
 =?utf-8?B?d25NNXNFUlhoTDVnQWg3QWlVcnQrM29SRW9kKzkvYjlHb1d6YXRIZnVvcEFr?=
 =?utf-8?B?am9PMUdjK2ZnVkNBV0ZlSW5JVHl5by9sTzhsdi8vdDcwOEEwMXZwajZBcHl1?=
 =?utf-8?B?S1dyem1nTGxUMkdkTHRmSStKZ2djWWI3YjRJSmV2RWtOcW1wTkFKR21kR3pJ?=
 =?utf-8?B?dkJROE5GM2w5N3UrcUtoT1BOR3pzcEdhZWxkYXdNVzBRS0d5clNyRndyZktK?=
 =?utf-8?B?bGhtbGFzYWFtRnlibTI3YkNDZ3pHYTFIK0JzTFR0RmhzQm1RVFV6VTkxS0pH?=
 =?utf-8?B?OTFwM3VCZkJMWEppaUdWOWNxQjJITE10c1FHamZHREtnOXNQc0RZR21wU29B?=
 =?utf-8?B?ZWJFMDBkV0srbmNFaDU2UFhGWGlObmRRbTRxYTVCUHMwKzRTdVpkQUI4YTZp?=
 =?utf-8?B?WG1PNnczbStlU2dvRVUvRmpwUGpaYkpMM1ZEbW1zTjdHa1RIdThNTmFEMkxX?=
 =?utf-8?B?OUNlS2lYcjRBMTZ3L0RXcjhxc0JxbFpFMlVIcnJYd09MQnhNSzZ0VE1BY1dK?=
 =?utf-8?B?UzlVeDFXazkyVk5NU2tXRXI5SVd3WWlkeUZXTzlReXJiR0U0QlREQ1I1NmQ2?=
 =?utf-8?B?NHlSeGJWRkxHaGNuWEZBWVQ1bkxBNW1UOWpFb0xHZGhaTENad3IxSW1kSXd2?=
 =?utf-8?B?WHJZWGhGd2ZGWnU0d2MweFhaNXBSRWdteUt0WFBoQWFLaHl6ei9xTXh5YzEv?=
 =?utf-8?B?Q1Uxb0xaVUNaamx0cUkzNmRVVUt0UXFhVUlCb0JNb3dQS2JLcCt1ZndKMWtr?=
 =?utf-8?B?M0RqdFArK3FKbDVkQXczaytwcTRQS094SlgrVGVKcE05bmlicTBKMG42d1U4?=
 =?utf-8?B?ODhqOHp0c0h6NGFENEJjY3lCNnlvUUVEYTVJcFNhUVJGS0VqMEhuVkU2M3pU?=
 =?utf-8?B?TFh6YVBjdExsUEszSndoVmFsR1RwYXRmbk54ZjRhb2N2ZERyMzR5elRwcDk5?=
 =?utf-8?B?OHZ5UFU3dnQyc21ONGdDZzU0ekNzMjB5YVlud3Y0Q1ZzejU5dS9nOU5QOXBi?=
 =?utf-8?B?SFNjQ1p3YzJVRVlzWUhsQnhUSmRzZXpUUHhrYk12M2lpZjB6UUJlK0J0NGF5?=
 =?utf-8?B?RERyalZTWi9CRU5rTzJGRWFrUDI1SzAzd1lsQmR1NlZNSDlaRElHWk1sNUxE?=
 =?utf-8?B?T0V5YVJxd3Rqa0Z3cWpBSEVyc1FXdkF3M2tlcUJFRFNMcGdwUU1YNCtoM0ZL?=
 =?utf-8?B?TlU2NnhXSWljK3pMZDRmY0crOEZBa1ZXN0c5Y25FamlNTGdDV2dObzFqQkxL?=
 =?utf-8?B?Z004MzRVcStvWkI4REVuM1pjcER2NlYxeEZNbHoyT1kzQjRNQzJFc0NEUVU1?=
 =?utf-8?B?TU1PemJGZG5tUzhTQnp6VDc4UnZjK2pVWTArL2UzN3duMkV4T0srNWE4Rzhk?=
 =?utf-8?B?ZWd3YVVVRGxXQU1KT1I2RjJLR3k0a1RmbEU4VmFMRU9QQU9nUmZmdFpDM2NE?=
 =?utf-8?B?RHF1RVhlRDZaZGh2Y2FFOXVRUFB1OTNFRU9NWXlMNmUyaFRSUnRwZjdISTd0?=
 =?utf-8?B?dDdIYVhXVW1MS1BwL2ZkTTA0bk5jNWlsb0VscUZXTFBqK05BZWRGMnJzMGwv?=
 =?utf-8?Q?P9+qW08Mb00xjvonyi/J2bwTI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb1f2521-8474-44e2-6c54-08db7eb7b8e2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 06:59:34.9955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bs8MuUUvUm1b5BkX9CKaFp9p+CN3nJ9rb4fjBYG7fuUzGdTuN9sX//VS3iirDke6V3AqQ/pjEnlTm98t07YG/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9945

On 07.07.2023 03:47, Stewart Hildebrand wrote:
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -298,8 +298,7 @@ static inline void arch_vcpu_block(struct vcpu *v) {}
>  
>  #define arch_vm_assist_valid_mask(d) (1UL << VMASST_TYPE_runstate_update_flag)
>  
> -/* vPCI is not available on Arm */
> -#define has_vpci(d)    ({ (void)(d); false; })
> +#define has_vpci(d) ({ IS_ENABLED(CONFIG_HAS_VPCI) && is_hardware_domain(d); })

While likely not much of a problem here, I think we should strive to
write macros such that their arguments are evaluated exactly once in
all cases (for side effects to occur exactly once). When that's not
easily possible, so be it, but here it doesn't look problematic to
swap both sides of the &&.

Jan

