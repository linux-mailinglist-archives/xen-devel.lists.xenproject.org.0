Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4475566F1A
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 15:22:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361262.590680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8iVB-000130-Mi; Tue, 05 Jul 2022 13:22:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361262.590680; Tue, 05 Jul 2022 13:22:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8iVB-00010g-Ix; Tue, 05 Jul 2022 13:22:05 +0000
Received: by outflank-mailman (input) for mailman id 361262;
 Tue, 05 Jul 2022 13:22:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IaUl=XK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o8iVA-0000o0-0w
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 13:22:04 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00076.outbound.protection.outlook.com [40.107.0.76])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74d006f8-fc65-11ec-924f-1f966e50362f;
 Tue, 05 Jul 2022 15:22:03 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB5377.eurprd04.prod.outlook.com (2603:10a6:208:114::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21; Tue, 5 Jul
 2022 13:22:01 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 13:22:01 +0000
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
X-Inumbo-ID: 74d006f8-fc65-11ec-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hyy7gT20vY9OJUTybsJttzq3OxlVK32oi/UxUkQ65gmKt4fGobKdtxcc+O6t7p10l8eRGsT4wvXyb5KuaUEqAJwSfr+TQ0frG0S4rx2l8PkrxnFjVqLXWOHD+2lb6dYvYPlfBxmO0YANxqHAh1jm/it048i6fo1MZz7V0DkrvAgIYSqF9gngE/hoiMXszdnv3lbHFoAoq1fpDZwHVFVnPaRyz0yqVRLfRNsbqK6npAOHd5ow7+JhjjQoxk8IP1YlFRgrIyBANiuY2ix7+NkUDsxmq7jzJ97FKgXZ2oxvOsrXFQMFsioii8FZCkgJZVtiSbyChDBa+YSwMwOssxWk8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7NhW39gnfSd8D71BhfXGfLQQdqskP+09cdOVkmEgebk=;
 b=YHBO+D0aeOpjcGBzZhRhPMm7OVmpxBsUzgWWfgwtKhCz9/knKj21jGUVlbEOHEiA0TXriH+u0tBa0wrpspJ1/A936vIiJ4zcdgGdtNvqwqEgz2mUvHsc0hJcmdN1sMI4roMw0OfnYS0AOBj6BckifDsa7UFn/FUH8P2ajJNRikbxww0x+077+4wSPC88DaQsf+v4Q03JYUh+c8fq1Y9QIfLrnhVCCOqpZKz7HPRzwOzgOb9AXx0KZxzDwHw+A9aXVcb2cWPSi3u5Rf8OE4CqXQ6w7vPHYvOysV9/iBO+rs6rJKo/J0cD9sHZTD8bt6fsOPudKN4Ko0qD6i+hC9qoVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7NhW39gnfSd8D71BhfXGfLQQdqskP+09cdOVkmEgebk=;
 b=V510idh5R3nsPkN3g+BnVRKnmXGqJFVSfG/iR06hLW0iRIVf6lAPjML1jzSbkBpz6yLJvE1mD6JPxIFkdhCjrdnR5BTWUYCWy7dBy/USS/sZSNk1ckIXvVr75Z+lGlAPT3A+nBwIH4QmekrdhUQQCJfAEyuGNYzv5GS9VQQjCsC3hCJ0bf/7n1rQ6fsRpqTePrtiayf8tcf/EW0bXfz1G8pmfdVAao4xgUeek+WU4P5ec7d6bQ1E8i6jz8OHb7sEioDMN04ep3memmD50MOE8UrlN8/3nZCWXHMqlO1LXi8ZjWre6Cvd0J5aPpb4gsqD52kNMGUg/JVjpOPD0eqxkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f2bfde13-9821-cd24-b1b3-4ae5bcbcac7e@suse.com>
Date: Tue, 5 Jul 2022 15:21:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/6] x86/Kconfig: add option for default x2APIC
 destination mode
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220630085439.83193-1-roger.pau@citrix.com>
 <20220630085439.83193-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220630085439.83193-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR04CA0071.eurprd04.prod.outlook.com
 (2603:10a6:20b:48b::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a771ccd0-b8b1-428a-7b46-08da5e89582c
X-MS-TrafficTypeDiagnostic: AM0PR04MB5377:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DQfhoT/UtmWJrp+8H2GcDdivcQEZ52HTr9+6BEa/TLePFO8WJo5Bh0rEQOn28wflPlggml/z3lhT03weEUGQ85RlsEkfs0MZcUnIkApupn3ek8M2Hh+lAhe+4zxnsHe1cHZo+p46IO1596v/D20e6zDJh0UF0xMIHMwzlbOEqAPdlLyETC7iwdWp8oXlsZHKbgti12qNiIrafF8pAu1SYmWoK+4vsLHsH8ubksLCH9J9g01qmf82KNUcfZsCT1IYHmKTbkG/fSQY8QsPGHEo5bG3qCC0EbI72yGbmqJGt8H6Mm3aRaP7IDRrkUaxZvTZoVbu8/FLnJaptgHbtTVEUR0jjB6xJPz2C829+fjED1SIKsMXPusY5Raa9/L+kNQrICV0W3jZ/NWe7TcW1rPupLwwqZVGyHa6X/rN1qgSZbfqh94LSaBqG5scOs/2AAKCUDxN972AnEMY0XKiPd7sa+9EElJHm5zwi+r/F4XOaisXxMFnx7mOoCxRw9yIwEia1iOCsO7MnUoYHsMYdMa35u1A6N7iGwJZcCbsIpi3EmdPHfKeb0+PK9OyHfXHV2W+8dvyZx/2ADf3UV60muTQQluof9DpYs18OOo/AYDXLmHeza7g8rzlR7xciD979kt7O0Yswzu8pPCaFTRpubXSKHyz6RS+V9skR7KcswG27eWSafk3aoear5xLusogL6Ra62fR+ieriHa3r+9KvnbTB60u3pl578ttUi3uzZ08l6qYk3XEMYfUXFk+ymeNkMtLvmXm+Og4erdH2bTsVjMFrOxIyV+X6Vud+BdFThLOHYDCqnMnW5Bmp1TaGhYCcJM+nBMPDPXMTzDYao9pKcQ7yamS4TlaUhwyBCnBPG2HwF4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(39860400002)(346002)(366004)(396003)(136003)(478600001)(558084003)(6486002)(54906003)(41300700001)(26005)(6512007)(316002)(8936002)(6916009)(5660300002)(31696002)(53546011)(86362001)(31686004)(186003)(4326008)(8676002)(66556008)(66476007)(2616005)(66946007)(36756003)(38100700002)(6506007)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZUp1VmVyVTZTdTgzcjREWTFoZHZSSThud05TU05DcnpuYzlDWlF3Z3FLVzlr?=
 =?utf-8?B?NisxUCtoS1NRaWcvQklySUpFQm1maks3TmtJcTRJOUNSSWora2FlNXVtWnVC?=
 =?utf-8?B?YTFZV25oRlFpdWQ2NTNsTkdhVjFxcVZ6T0M4eDBnV2YzR0J2d3ppa3lmQ3Rm?=
 =?utf-8?B?N1pEUlBmWFl1TFkxVm9UQXBENHZMb0trU2R2YUM2SXduaHRjZUpMdGE3c29L?=
 =?utf-8?B?bHVSNjVYTFEwVmJyYnFIdDMxZGhyUUwwSXdqTXFHYVhOK1V3aHFwMTlYQ3JX?=
 =?utf-8?B?Qzl1aVpHc0JGRE5KUjBuc3ZHU1p1YzhNU0tQQWhKSmRwcmx3S3pTdTRpMGRY?=
 =?utf-8?B?YzI3MjNodUpkbS9HYVZZZllLckFhMUNRQUxWQTlJajFEcDhiL2ltN1pMeGhD?=
 =?utf-8?B?cXp5dmt0UTVVM0hBRGdRSGc5QlNpVWo5TFRZOEFMVVBGVVFjSXJiOVA1YVhp?=
 =?utf-8?B?dzZ3d2ZhWXFxTXdybEJEQUdNT0lwaUlWTEVGbmRxdFphUFZYSC9DK0pLMG5Q?=
 =?utf-8?B?UGt2Q3NtRDQxOER2bVJHb21EbWpBM2M1WDdKRm5zTm1YcEVQSjZpOCtZM0dF?=
 =?utf-8?B?WHlkWnF6WVpVYjJhMVFQUVR5UXRiM2Z3UEF6RWdQdlAxdjFPUG1kYWY1aXQ5?=
 =?utf-8?B?VVJrWVZDZzdWV3BBalk1bGcvbGU1UWROOWNtR1lIK1dacjNQcTdIcENDRGh3?=
 =?utf-8?B?dlpCSGE0bDA3V2M1NnBWUjJ2TXVtYlVPWnVPVzdsQnBOY2FXT2VBSElDOFdh?=
 =?utf-8?B?QWltRytWbDkxekFqenM0MnBSNC9ZNHFEMFJEMlFFdEJLamFrbDVJOUUxMUtF?=
 =?utf-8?B?Ung5ZGZ3aFhWQW5yMzl4ak1HSVIvd2t6ZUJTVmdPNUZaTThKTDYvK1U3VFlH?=
 =?utf-8?B?RmxMNElVc2o3Q005dnd4aHpKanppYXVBRmRnTHFkUmFCR3phb0J0UGVMNGtS?=
 =?utf-8?B?YTlvVnByK2E3Z3NxUkhEMHBDcFlGK2ZvNWE3a0dlL1lZaFhtWWNNYjJRTjJM?=
 =?utf-8?B?ck9LWFVjQTZxUFVtcDBnNjNSWlRkZ2JxbFV3QlN3Wis5cm9ZRDhqUDEzTURi?=
 =?utf-8?B?b3p5blE3dGNsQlR1WE9uRHRNeEdSV0d0cDBhdFRHQXJsVERNWnRiUTh2eVM2?=
 =?utf-8?B?emZyRXQveHM4MS9JZzducDFQOFJYTnVrd0hzd3g0dThkOXdDRklXWEd3bVhD?=
 =?utf-8?B?NlJBd1AzTVp4NVRTUFQvd3ZENUJyYkFDdURsaTRjQlVQaElyLzlIb0NoR1dJ?=
 =?utf-8?B?OVV0RXZMQm0wVklRTkd3MlpKTWlYZ1FPV2RHcUdNWFRCNEsxNnQwTkRDL25Q?=
 =?utf-8?B?TkQ5WWVKKzVjWngvTHo3NlZiaDJmc0dxRVVIb05MdDZSL0FuV3NQb3Jxd1pn?=
 =?utf-8?B?T283S1RCRTg1N0ptWk1lNTBMeG5YTUFwSnl3eVFSN0diSytaY3hSNkNZOGY3?=
 =?utf-8?B?UkM1MndyaGNWMUROU3J0SExET0lsbmNBaTlXeVZ4M3FUL29JNTZOZkpsc1Rm?=
 =?utf-8?B?elZuSHcyZ0xIelgvL0FHN25JWmszYjNQaDRuUk5SWm10NlhiOFd6ZjNhSDdW?=
 =?utf-8?B?Qnh1Q3ovRTI1TUVLWFo4MmIwNHZMam96a21WMHRHN0VQbU9TaWVnUHZvdGxt?=
 =?utf-8?B?Y1k0dXJ4Z1FHTXc3b2l5K1grYkFjSzkxTGoxQlQxY1o2RmR6WWFpZWJRK1JZ?=
 =?utf-8?B?Wjd5YTJsUHZUQkU3dVYxbWNpaHNkbjR1NjA2UnkwcnBwcVFqR3NrRWVISjFR?=
 =?utf-8?B?emxON0Myc2pxRlRlZHZSOGxVVDV0MjJhdHFxeUVQZ2pmSXg5d0s1bFB5b3hX?=
 =?utf-8?B?bmNXZ2F3dHp3enJzY0x0cDMwSVp4VjhJYkhuc3F4U1ltUDE2OEl2Wk5mS3dD?=
 =?utf-8?B?TlRReDJvUk9SMXZTYVp5RHVxRkJ1MmVWdXNsN01vbjVFWnZKR2VGM2tBQVA5?=
 =?utf-8?B?c1RMWDJMY1ZXZUFJd3ZYWDBGMGFERVExWjNMM3RhU1daeDVleGpGOHI3RGNs?=
 =?utf-8?B?Vm5EcUtDd25HRXNOY2tvajhJMVFqKzlWZXJ4QndvUlQrNHZISUpQSklJaTJJ?=
 =?utf-8?B?N3VxZ3FESTk1alBYcXdhdzk5dHpnVE9lcjhjZCtpSm9Oem9tbWt2WlVVNnEy?=
 =?utf-8?Q?FSt9VXYoc7Doh/n3v1EO7btjj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a771ccd0-b8b1-428a-7b46-08da5e89582c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 13:22:01.0593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /SajpQes/3bBvrtNL5DS6lwrjmMDJGQTy0yUx8dqLA/rDzjbbSOjOhGcSdWHdgL31m6oktEDhP+Cv8d58RWiOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5377

On 30.06.2022 10:54, Roger Pau Monne wrote:
> Allow setting the default x2APIC destination mode from Kconfig to
> Physical.
> 
> Note the default destination mode is still Logical (Cluster) mode.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


