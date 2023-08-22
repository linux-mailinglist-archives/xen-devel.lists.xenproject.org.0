Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 173A5783DD5
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 12:27:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588390.919906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYObV-00043Z-7p; Tue, 22 Aug 2023 10:27:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588390.919906; Tue, 22 Aug 2023 10:27:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYObV-00040x-40; Tue, 22 Aug 2023 10:27:17 +0000
Received: by outflank-mailman (input) for mailman id 588390;
 Tue, 22 Aug 2023 10:27:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MJFy=EH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qYObT-0003zz-O5
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 10:27:15 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0626.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7662a5bc-40d6-11ee-8782-cb3800f73035;
 Tue, 22 Aug 2023 12:27:15 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by PAXPR04MB8605.eurprd04.prod.outlook.com (2603:10a6:102:218::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Tue, 22 Aug
 2023 10:27:12 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d%5]) with mapi id 15.20.6678.031; Tue, 22 Aug 2023
 10:27:12 +0000
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
X-Inumbo-ID: 7662a5bc-40d6-11ee-8782-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cJMkrhUJdcjR35JIwpDp0/thvPggDAHQHjZoXgCWirgds6JDKVz89k9tLFTDNhftUyO2tjOv1XdoGfwxWmo6Q/wXbvgR4P12ipYB4+GOh5TX7fkOeoqhl3k7jFx0rNnue9wtmVAXRhrgnBWZXSOlcU2gFDt5PCuP+eFzNVUHRFwynnQeCdIc5M9CxFV0uXoG/rC+nqzUpCbHjgJdo/sN2SE1F3sKQcYa8KnkcJ1TN/41GrEx+irKrTFR3q6T51Rb+PEOSH0+ksPbHddC8IsvaNdRqiggLvUUZxot5uwE4szRgED/RFIuP5ewGx63sjs7eVDRj8rigauzvDK3pSqJqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xrxqIlHykt0KIFQ9pGDd8kFqyJME4x89aJa7B5TbtfM=;
 b=N7/zTNZCyZQpXmb5g3KToIrMqIja4luG6uyo0q+ZaIeV6J412YXS8jFk4iYzYmO5J3MYYAjlsLCdp1WehtTl6l09kV+W7eV/51899I0G4HILW083r931UCTnLsxuVfB40Hry36NqeS8hvtIfcrkpriLanWWTA1bs/II3pBnUMRk+RF2DLS3XX10W5yGh8/6oicNYz6yvWua/qO0NdnsvBw8Rvf5gPB7VaPQ9HAGUXE6KDZV2SSWXYH0t7sDu9UG7yhS7iANYLVqSHv9fOMQrqo+Bs0YfYvZFtxBwoZv6u7a7bEaczY/ah9ACQFmCUE+V7wICNW3sxOeVc2Slcl/mag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xrxqIlHykt0KIFQ9pGDd8kFqyJME4x89aJa7B5TbtfM=;
 b=KMwZiLQxwROnJ+IjmzDXa8kaideuG1lPNEOUi+NpUgSixoAcc6fHUEluo9TXHUIf/VjVIvwScf+YMqeMomjBH4XQSAi8kap75jdeJHTdmM1Fm2xffbGRWTYplfqP9i444/JhCdAEMHWit2WScw9epkc7V0irAHG+MeNsTEjodFe7XVv/AaVYtPKSRx8PNstQjVaPW5KA4ddiZATfMvigFSfvwDpl/3DQvpDmfmPDuonW0QoFgsHLXHv0CaRczC86K/Iwi/3W5RZ05mnjI4YdAxVx0syAqc01uWJanX+MUaOkfKql9Il2G25aJCHt/h6UlSwCfWcwjOG8bt5tcarrBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2256ee98-e34e-2229-66ac-baf2337d7c30@suse.com>
Date: Tue, 22 Aug 2023 12:27:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v4 5/6] libxl: use the cpuid feature names from
 cpufeatureset.h
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20230725130558.58094-1-roger.pau@citrix.com>
 <20230725130558.58094-6-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230725130558.58094-6-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0186.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::16) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|PAXPR04MB8605:EE_
X-MS-Office365-Filtering-Correlation-Id: 46769caa-18a5-4e29-a7fe-08dba2fa58e6
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rBNPeBWZFHmnBlGQmxuZfGH1GIVnh+UC4KV6HZzexTrAvxObt4oGoKcvqIFZy2MEyQT2lEAse4SVnZwdV+LGumSXq+KzhywMz8JAE4os6BMLVkmBGN4jWs4S4JkUu36g04qtBSQgDkPD+s7yPgd+lAsz1nXpII/etbIwKAJSb+i4xrv+qTlzgxEjAG9RxOVYRT0zjR1pxeJ50Z/0OJnMfOvw9FdcamFGyHORRGJcaqNRqZB5Uc5wIaka3rw+UHb2+nnWWDfr1+Rs7v962/p/u+xceVOjLvul3nzVzzEpOGO9UkoUpl98qeKNQMYBMWyx9L5iwSyaj4eOww9UGCdjNAARBEj3qNhUoi497bgIPWs40RCsZHfRFIod5sCfvgL4msa7ytusSvQA0DPAp+dMTkTR3gIZhi+L+rpifs9qTYAY4Fb+WnBxB/2NUpi8tmbiS5Uhz3z0URqsAZfCtLQoUiahqn3wwoui9uLJ50d7fHyj24rY7+EKBbxWcsnzKAHxOPy1Ihl1pXvNQ88wkAtUVQBWcdx0b1znZdsw2cbOxyvzp0B9qnyQRTkOjvz+oeA85C0N3a1c5C3+bFQg9k1pwvQ+J3v0fgaCO1QueHDVDJ0AQ/I7ZNXNsZ3iPQJhhQnm1mfbRv4JEcYGvP50a2R0yA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(376002)(366004)(396003)(39860400002)(1800799009)(186009)(451199024)(8676002)(8936002)(4326008)(5660300002)(53546011)(86362001)(38100700002)(2616005)(31696002)(6506007)(6512007)(6486002)(26005)(66574015)(478600001)(41300700001)(66556008)(66476007)(66946007)(36756003)(54906003)(316002)(6916009)(2906002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZC9oV25YMm5DVGp6aTViQ3MyVUpoOTJwcmsvNWlvTWtiWkxQSWhma0xsMWV1?=
 =?utf-8?B?MDR6MDl1dEdaSStGNU1UTlNYclB0QnNJLzhOWmh3Q1RKTllvRDMvY3dkOEQ0?=
 =?utf-8?B?QUhOaVJTbThnWmZUNWVOS0RlRmY3QmZKSVoySzMwb084VEpwZ2JObVAwNWJX?=
 =?utf-8?B?WmFaRmNEREFJMTJlREJZN0U3NHhQamVnVm1FaTd0TXZoRjc3OWxGeEwzeUUr?=
 =?utf-8?B?VmM4STdTNTR0eVFwNmU2UTFZancrREFqdWpwSVlSR0FrSXZ2bnZnSUlkT3FW?=
 =?utf-8?B?N1lHS0k1RmpoNnBwTGpDQlJ0cE5aREZqR3lvVFRLSXBJUWNkRStaRFdpQlFT?=
 =?utf-8?B?QnFyUGx3V3RxSjY1aEpwcUJiWFdoNS92R1IzTFJaaUF4bXRtTk1GUlRHWFIv?=
 =?utf-8?B?dUlqSmJ3Wk5HaHBqbVFqNXA0K1VrNmNYVUhzd2o1ekl2a2pmSVVBWGFvS0pv?=
 =?utf-8?B?R09VNlo4UlY3SUxmSFFHRlRjTzBEaE5FS3VXcTRLNXQ4aWpiazEzQy91TFpn?=
 =?utf-8?B?L29mbE13cGxySmcrc1VkMWpJTHVVSTdMdnVQS3BBMUlHTDNYVHlIVDY2OHpW?=
 =?utf-8?B?eThqQXNadE5sNm5oS2t0OCs0ZGUyaEZJZlkrbHdqV3dEcnRxU2RaQzcrbUFN?=
 =?utf-8?B?Rnhqayt3d0ljbFY0M1BUbXVoS3UxRC9kcXpsN3llVzdGZjhrdHY2M3Y3M0FP?=
 =?utf-8?B?a2lQcU5HTmtJa0VqbVEyQW82enBFM3BOdEM3ODdwUVpPekpGaEdFbTJtZWJz?=
 =?utf-8?B?d21kc0ZMZmdxWGZ2U3hOU3IwMTVZOVgwKzU0NElxMWdBK3dXR3ViczR3ZExq?=
 =?utf-8?B?THFERHhOa3VvUHQwWWJwbEZ1a3BSdlIxaWc0bUZub2tDVUV3eTNzTmxrMmpQ?=
 =?utf-8?B?Qmc2YnVLc0ZzTzVUbm9nbnVKaHJiMXo3M3l0eDNFQVA2T3NBOXJlaFdkYm15?=
 =?utf-8?B?bmFjbGJMWGZoNmFULzczTlpRVytRZFN5K0FHVTJTd28zQ2dBZzQ1TGtVdmtV?=
 =?utf-8?B?TGFiYVUrLzFGMlRDRXZGREEyUTdIamxPalJMWURMVTloNGx3UHlUSkZmV0cz?=
 =?utf-8?B?VzdSOTVGZDlnT255S0tiRXNvWHl1eGlpVVkxL0VYS1YvTDlNN252NzM3SExl?=
 =?utf-8?B?U1oxOUlaY3ErNG1iWnloNFo3R2hWVVJLUVRZNUgxS2RpL1V6dXFueXpDS2lP?=
 =?utf-8?B?SitBNisxYTFWUU1iZVR3ckozZS9ZWXR5dVBjWGNscWp6YkYwNHpUd3FpbkFy?=
 =?utf-8?B?NzluQUJxRG5VYU80QmlpU3NCQXh5SnpPTzJBSmhkbTEwK0lHQ1FWNW94aUdy?=
 =?utf-8?B?djh3RlZ4Q2ZBaTVjWXAvemkvS3QveHI0ajdtRjBxcXFUV1hJd01ISDRVcVhy?=
 =?utf-8?B?aFV1ZFhQMEkzU2IxWVZTMkpIa2RyYnIwaGpVcGNLUWgvL3VXcEpFVkRaMVRq?=
 =?utf-8?B?N2V5aFRJYitKRVBSUUtKWU8xTDM0bS9FcnVDU0VNcllzY05lN2JyUWgxUkNO?=
 =?utf-8?B?b0dBcXRLUmgvMzB1UXk0K1BjR21rSmJEZzZEa2M4VVFJTjZiYnpRd29pN1J1?=
 =?utf-8?B?c0JqUXZnU0NnUjEyT2hjYWNTWmcxUG5Zc2VjNGlUcGZKU24vMWRVUU51Q1ZV?=
 =?utf-8?B?eEdVTytQRFVoelRpVmZMczNxK1pPcC95VWFYUkxTcjEwTzRhODg2OW80VUpN?=
 =?utf-8?B?WWt5RFA4cklLWmllbHA0KzdmNXh0empaZDU5OGl3aTJ6Ym1BS0ZpbDY0blYw?=
 =?utf-8?B?VU9xa3R0NExMVXVCUGN1em1FeXJ6SG5lZjdxc3VlUFlYNmVJS3Jxd052MkNp?=
 =?utf-8?B?SWlKVHlpRmxjelZJbGNybkR4TFUwaEVodzlpQUUzSFRFYWROMmlONUxNQUpS?=
 =?utf-8?B?SnVWSnV4dHI5R2MxaUJKSGFxYU51NGh4NGRiVUtteW5wMVZKbkR6dE10UGV0?=
 =?utf-8?B?RGZYNlBmS0tqRXpmaDV6bHNlUUV6c241K0lPSUlWdFBIWjNBN3h6a0ZhRk5p?=
 =?utf-8?B?bDIyYThrZ2YyczhPbWl5b0VUUzRqUzQwYzRmRC9RY0grMlk4Rmp5akZuL202?=
 =?utf-8?B?T3dxQTcvZXQ2Lzc2SUZQZGJzbzVXemxSV2Jja0htL2dLQ0l5UXJ4L2Z4S0tz?=
 =?utf-8?Q?xFnlANxKtHpeyUkgMjPaX+tzg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46769caa-18a5-4e29-a7fe-08dba2fa58e6
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 10:27:12.1577
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3DHYn9SllacW3BlQVi1YGvseS6zpW8D4vt2lHcoKvb1YWjaU3ekoIr5yIRKMCVNqHA3xnDypHV2aG0JIvnHt9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8605

On 25.07.2023 15:05, Roger Pau Monne wrote:
>          {"invtsc",       0x80000007, NA, CPUID_REG_EDX,  8,  1},
>  
> -        {"clzero",       0x80000008, NA, CPUID_REG_EBX,  0,  1},
> -        {"rstr-fp-err-ptrs", 0x80000008, NA, CPUID_REG_EBX, 2, 1},
> -        {"wbnoinvd",     0x80000008, NA, CPUID_REG_EBX,  9,  1},
> -        {"ibpb",         0x80000008, NA, CPUID_REG_EBX, 12,  1},
> -        {"ibrs",         0x80000008, NA, CPUID_REG_EBX, 14,  1},
> -        {"amd-stibp",    0x80000008, NA, CPUID_REG_EBX, 15,  1},
> -        {"ibrs-always",  0x80000008, NA, CPUID_REG_EBX, 16,  1},
> -        {"stibp-always", 0x80000008, NA, CPUID_REG_EBX, 17,  1},
> -        {"ibrs-fast",    0x80000008, NA, CPUID_REG_EBX, 18,  1},
> -        {"ibrs-same-mode", 0x80000008, NA, CPUID_REG_EBX, 19,  1},
> -        {"no-lmsl",      0x80000008, NA, CPUID_REG_EBX, 20,  1},
>          {"ppin",         0x80000008, NA, CPUID_REG_EBX, 23,  1},
> -        {"amd-ssbd",     0x80000008, NA, CPUID_REG_EBX, 24,  1},
> -        {"virt-ssbd",    0x80000008, NA, CPUID_REG_EBX, 25,  1},
> -        {"ssb-no",       0x80000008, NA, CPUID_REG_EBX, 26,  1},
> -        {"psfd",         0x80000008, NA, CPUID_REG_EBX, 28,  1},
>          {"btc-no",       0x80000008, NA, CPUID_REG_EBX, 29,  1},
> -        {"ibpb-ret",     0x80000008, NA, CPUID_REG_EBX, 30,  1},

Noticing only now, while doing further backports: Why was btc-no kept
here?

Jan

