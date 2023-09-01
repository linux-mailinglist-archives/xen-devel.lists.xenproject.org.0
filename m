Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE31B78F8A6
	for <lists+xen-devel@lfdr.de>; Fri,  1 Sep 2023 08:42:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594415.927728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbxqq-0003gd-KC; Fri, 01 Sep 2023 06:41:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594415.927728; Fri, 01 Sep 2023 06:41:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbxqq-0003e8-H9; Fri, 01 Sep 2023 06:41:52 +0000
Received: by outflank-mailman (input) for mailman id 594415;
 Fri, 01 Sep 2023 06:41:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cwX6=ER=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qbxqp-0003e2-5u
 for xen-devel@lists.xenproject.org; Fri, 01 Sep 2023 06:41:51 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20601.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9fcaf980-4892-11ee-9b0d-b553b5be7939;
 Fri, 01 Sep 2023 08:41:48 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBAPR04MB7271.eurprd04.prod.outlook.com (2603:10a6:10:1a6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.22; Fri, 1 Sep
 2023 06:41:46 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.021; Fri, 1 Sep 2023
 06:41:46 +0000
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
X-Inumbo-ID: 9fcaf980-4892-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aPAqlZoygv9sLeuRCFof5iwScnzraOzfGelq663H2A8M2awRJ4I2YKE6EZ3sfSScUTG03eMNmpoHoUT2ecney+kkO6jc+8nTBdr8CfKPZwP6gCAX1/YZO7GNKmw1sDfCisqT4OlEv+T0LGOk6zSkB8l+vHkv9Z20pO2sL6zgkav05ehJWdgk4jt1ewU+z8PcrqS+s/7v0j1t02W4mshpJZH8Kkyi2ZxfIwRpgfAAHT3hNuGReKCrxBF5mxuVnKPi5fhLbPK1svnkofyLyKxfj4PINpXtc3zOllMZIYKWmf4xgdjCFMbJDW2HfC3dh7HBU4qGWa91pVDFnf4xpx/gBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9l312x2LMU0e88AsqYXEC7ucHbsAli9ncOp8TEE6QTc=;
 b=kxx1CXbXWxEODNk4/7zaM76eKoeujskmu9o65cA0R+CjLN9dAMiWCoMdw4wtFvJFG8JSZw3yYA5goIp9x1GAmTrwc+33n/JnJ4VaJCMuUTtOE8HOhoDF8+Pv+pVpqDtea0VQcvtE/XYYv2X+PezCLYiH5p3DwXlbmqQ7LgTe/7I/C7g9bWnU8T/cjlVw3RVg7J/zXwOovA6ZYs4h9tKC0c7CXAQDBA3eO/mxOGpjUZufXO2tAkRR12jZEgo9pZpbPOZcRz/4eJsz6qRsaW7J0OZIDS5hEM+ziTvkWd+xefzfu5K8jdNCuLnf9sXGEYKld9+grmThVXOmg/OJpTl1iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9l312x2LMU0e88AsqYXEC7ucHbsAli9ncOp8TEE6QTc=;
 b=XtIlbQf6kZ5pMpIMJ+VlNCKUlhXZbKIk7SZl0nIr5eghhJBdhgV06GZkVMbJMP7bmqvxSEMWtPW8DOrFEsQ229d4qe+pHTzS3bSNII6+cfoYWvgEgqDEJOU2Th7qtaKFLVEhycAxZP+yDWt5cCgQc/zvwqkfUDFwFeIZ5KePMRy4Zpyql8Oc6jqm5ohZ90/2ePBAM5EF9rGaowDKFLU51tCAWfW3M+9o7JGAEw2uikJ4SryBZoVvLpXQ9HCDzcR6p7W01tpmkWk34ZILscmN+Ft78YqnY4wzyVkBwCaV7P78ciJAt7r1XrTvczHYGT0XX/ZgvBLQF7cBUsJYrnjChQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <56cbf28d-7d7e-6dae-25a3-c41783d590ef@suse.com>
Date: Fri, 1 Sep 2023 08:41:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 5/8] xen/ppc: Define minimal stub headers required for
 full build
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1692816595.git.sanastasio@raptorengineering.com>
 <a92f99e8f697da99d77bfde562a549dbef3760ce.1692816595.git.sanastasio@raptorengineering.com>
 <47e40325-0521-c2ee-e0da-99bfb4449097@suse.com>
 <e07d7f3c-0747-b979-3709-0900ae8798b5@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e07d7f3c-0747-b979-3709-0900ae8798b5@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0183.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBAPR04MB7271:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f549625-b534-460c-cef9-08dbaab68303
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	thiFawp3W1ZSvSApBbeyETELIWkC0c7mhzAdWn8pqzzcv1tv9ZgsxIUokISJ9YTQmmfBM0JxccgskKtH95DKbRWMMAb6qrJJc0WmbU/hN4yyR8VPih9HMilYAFGek3f/d4NtV67NmqFrVRoVAJEDQRH1Zk7HTmqD3rnPdRJhst4nqdesFB3yIfmmosQLFqnNgKMLDkXq5tHWiAHyGfYljm/6oZI0JMx+1QIJRa4MGMOvHn6derZ2PPqMIh+B+55pXWW6Rzr5ew34JU5SNGs+xrEXsGNqXBQH9bz3hk5Zr/+9Z/wrqXdoP423qkAfCBGWQPyXeDkq0ZdSjZBDvW8tQujg2lGOQzFbZIgu4okzPAj/Q7tCuwFvcOPBhEq/oyW5YE9MkAdpP7r9Wh5R4C6clZCNUoxHC98oZc5TXqYqpB+et7PSCG83Nb/EW7BXT7+Won5U42HQrVv3l+s8Tv4t+b3Kw+QlRcSMlNI4tZZZyCHmrEHQIif+F3q+fHFFTc7zZ/ckqCBCYuS507j+ghT9fJYJhNQ/2pMazpyhpgDo4x70FaT/34Ss6YiaYaXSFsnCDC8DlwkyFt2WcAg53WStbM1ri+8liovVuF0G2a4yJeQo2dCEzipJbrjpGw3jh/oQRZQWUVAtZEMrWrvDiXHvWg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(396003)(366004)(346002)(376002)(136003)(451199024)(186009)(1800799009)(31686004)(66899024)(6512007)(6506007)(6666004)(6486002)(36756003)(38100700002)(86362001)(31696002)(2616005)(2906002)(26005)(53546011)(83380400001)(478600001)(66946007)(4326008)(8676002)(8936002)(5660300002)(66556008)(6916009)(41300700001)(316002)(66476007)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2Y0ZHJZdERRL0s1YnNSazFxcW03bGxpSXU3MFhuQWNvRTZWNDJGd3c5R2hI?=
 =?utf-8?B?THJxZUZ4bGQ2RG5GRG0wUlR5NjFuNVZrZ3hYRTZXYW8rU1hDTUdDc0h5Ti9v?=
 =?utf-8?B?azc4Nml1KytUbngwM2xsaDNlcU50Ty9wODcyUkd5bkhyZUVrbGJjMmZsbE5G?=
 =?utf-8?B?Wkowbk4xd2RtY09ya2IyQjBJcFF5cHo5VER6MDJjZGkrckNjUUdBOW1peXc5?=
 =?utf-8?B?ZXZkS0VkVlZkWHFPZElJQk5ncFo3U3lGTjVuSHdoRWd4VVlQNUNYdkRGdDZz?=
 =?utf-8?B?bE9DNTU4bVRISjFYa3pIaFdlYjhjSDlkZDhSODdCazdwOGphNzVFYjFOaUI3?=
 =?utf-8?B?OXp4L0xZbDlQS0xZZ1o5Q01IVThzREJPVUdmeVFKSVdUTUdBUEdIaVd6Y0lW?=
 =?utf-8?B?ZTZUYk9idkQ1UWNhcjYydkdqdmFGcVc0Sms3NHdIcTZEOXp3ZGhiNC9IV3VV?=
 =?utf-8?B?dlNqcXBZZVFJbHFiUUgvaXJMOUE3USsvK1BZSlNNUGwyK2VxYWVKZXdnUk5u?=
 =?utf-8?B?RzVFK1Ria3VhQXhEd2E1d2t6cVB4bmxUcVJGUEExU2NpQ2YzNVBHYlp5TlFx?=
 =?utf-8?B?NXRiUzVSS2NJdFFwb0ltcGV2cytnN2VKcEZydTFadSt6eHgzN3A1TTBkYXgv?=
 =?utf-8?B?emd5a1hLOGtoN0ZkR3BVRjBYblh0TndpMkJCWDJiOHdtVTFRMjRteUd0U2hM?=
 =?utf-8?B?aE1ldFZjMWdmcE9hZXJURVk3QmxJZ1hremVlQmQySC95eFlzSUVJSlVVTDZz?=
 =?utf-8?B?OTh0K05ybzk0cnhBNHprOENNV0pJZTYvaG9zWE9DNnl3bzdFT2x1NldUT0xH?=
 =?utf-8?B?dmFSWkpSVkl3b2pXK0ljc1BRZmJBcGc5L1k4bjV1Vm9aR3ZYMStCdndNVVg0?=
 =?utf-8?B?U0x5dGg4L1FLMFluMWduaGdCSXlsMVBMSkFOV2I4VTlYaSsrMFdCdlJ2TllB?=
 =?utf-8?B?MURjQ2doZzltc1Y4MXdIR3MrTTlwSzhYN0ZFTm5YWjlGYUpPSzRqY3diMmFl?=
 =?utf-8?B?RUhXM2M1TkFVM2lTdXJNNGg0VHFQT2x4R1lRTDlEdSs4M2pYT0JKakpiQlRi?=
 =?utf-8?B?ellIRjYyUDdnY3RNeWtHemlvVWY2VUo4MGdJNW03a0MzN2VRQzUyOCs2dGV1?=
 =?utf-8?B?amJ4VGp2a0JYb2xQQUU3Qi9kQVBvOW9sb1M3TkJRaU1vdUFwanVHaHJzYUdx?=
 =?utf-8?B?bzJxZThkQUhJTnk3ckdCaVhIR2p3a0N5RFNNdGhmbk00UTUwaUxLcWMxT1A5?=
 =?utf-8?B?RmtLME1VYXJseGZMQitNZ0gvSnppSmtmcjMrU3I4cnNxY2M0Rmc3MFg0aGRn?=
 =?utf-8?B?M2dUVXpBb09FL3dZWkdDT1dyWUIrdXJHTWtTWDNXdGFoZjY3bzU4c090aDVL?=
 =?utf-8?B?cFBUQmEwWDM3TUFoaXFVVnBlUi9KSzNYdmxMZU1pVFJEOEdaNVdzRWV2TkZ1?=
 =?utf-8?B?eWpra3FDWVFLVnM2dDllQXJvZXR0bVE2VStUYkNvVWlncEJ6K0ZyNHExN01I?=
 =?utf-8?B?b3RobkJjTng5V1VTRVRFUDhqZDVrTWplWTJKZ2Z1NG0wR3JwOGE5aExZMHcv?=
 =?utf-8?B?cWlVa3drLzA3RzhyMFlDVGJ0empRV0Zycmx4QzNEdzJ6M1libG9ITnVueVQx?=
 =?utf-8?B?NWVhaHk0SW55Tmc0dHp0Nnptd3Mrd3UvZ0tqb2pUc2MxOUVzNUR1UWoxbWVX?=
 =?utf-8?B?V0JPdlIrdENaZG9ZNmtQK1VUak1OQTFzWDlSL0g2TFNMZUlILzdCQWV5Z241?=
 =?utf-8?B?NVNxUytVYWY4bUNEd3BHVllsK0hzcW1WQ2FBQVdreDdVTTBsU3hJcmFTQUky?=
 =?utf-8?B?NC9oRTFMQlBXNDVYTkVudmo1Uzd0L3ZpSTF5MGMwZlRnaTAxV0VDQU9kdUl6?=
 =?utf-8?B?MUFjWStzd2ZsOG9mU1RjU1IzVDkzYzBXLzZPTGFUYmJwYjFQTUtVdW1TOU5t?=
 =?utf-8?B?ek9aQ2JLTzN3bDM4Qy9pNXZ3WFE5TDNMbFk3TFp0TnZKQnBpUmE0V014NmZr?=
 =?utf-8?B?cGFncGpvVlI5RytFRUtLZzFqTWtnRk1lMFJ4cW5rTzdTTWZwUy9oRmI1Q1d3?=
 =?utf-8?B?VWdkOS9may9BRDZmc1lwOGh2bnlGbjFabyt5UFR3Z1hmdTlGRjlFemFqaGtM?=
 =?utf-8?Q?ACFgW8q0t1lrO834b9SL9SjFX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f549625-b534-460c-cef9-08dbaab68303
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2023 06:41:46.3205
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VFqQQ/Nz9TWFJGw01P8skq9qYontjU/pqeEidI759wuHrlFbeTBDBGCoLvky7qkKFRebdC10OSgI88VZxTAU7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7271

On 01.09.2023 00:22, Shawn Anastasio wrote:
> On 8/30/23 5:49 AM, Jan Beulich wrote:
>> On 23.08.2023 22:07, Shawn Anastasio wrote:
>>> --- /dev/null
>>> +++ b/xen/arch/ppc/include/asm/div64.h
>>> @@ -0,0 +1,14 @@
>>> +#ifndef __ASM_PPC_DIV64_H__
>>> +#define __ASM_PPC_DIV64_H__
>>> +
>>> +#include <xen/types.h>
>>> +
>>> +#define do_div(n,base) ({                       \
>>> +    uint32_t __base = (base);                   \
>>> +    uint32_t __rem;                             \
>>> +    __rem = ((uint64_t)(n)) % __base;           \
>>> +    (n) = ((uint64_t)(n)) / __base;             \
>>> +    __rem;                                      \
>>> +})
>>
>> I understand you're merely copying this from elsewhere, but it would be
>> really nice if style could be corrected for such new instances (no
>> leading underscores, blank after comma, and ideally also no excess
>> parentheses).
>>
> 
> I'll fix the leading underscores and missing blank. As for unnecessary
> parenthesis, I'm assuming you mean (base) in the first statement and (n)
> in the second-to-last one, but I'd personally rather leave them.

Quite the other way around, actually:

#define do_div(n, base) ({                       \
    uint32_t base_ = (base);                     \
    uint32_t rem_ = (uint64_t)(n) % base_;       \
    (n) = (uint64_t)(n) / base_;                 \
    rem_;                                        \
})

(with other tidying included right away).

>> I also notice that most new files don't have an SPDX header. Would be
>> nice to fulfill this formal aspect right from the start.
> 
> Since you've commented on some copyright headers in trivial stub files
> before, could you clarify whether you'd want an SPDX header in every
> introduced header, including empty/trivially stubbed ones?

SPDX headers are about license, not copyright. Aiui ideally every source
file would have one.

Jan

