Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 423827DEF03
	for <lists+xen-devel@lfdr.de>; Thu,  2 Nov 2023 10:36:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626808.977399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyU6w-0002rl-2M; Thu, 02 Nov 2023 09:35:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626808.977399; Thu, 02 Nov 2023 09:35:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyU6v-0002pR-UU; Thu, 02 Nov 2023 09:35:33 +0000
Received: by outflank-mailman (input) for mailman id 626808;
 Thu, 02 Nov 2023 09:35:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5SK+=GP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qyU6u-0002nq-KZ
 for xen-devel@lists.xenproject.org; Thu, 02 Nov 2023 09:35:32 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20604.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 297bdcab-7963-11ee-9b0e-b553b5be7939;
 Thu, 02 Nov 2023 10:35:30 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8157.eurprd04.prod.outlook.com (2603:10a6:102:1cf::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.10; Thu, 2 Nov
 2023 09:35:27 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.019; Thu, 2 Nov 2023
 09:35:26 +0000
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
X-Inumbo-ID: 297bdcab-7963-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UJjMfpaNz5E2+B5Y4cZGh8o3SRFCgoQDtj37eE+mhhfrzLVHWVyv6G/WWpvEnpj6UbRx5zIk+fqpzOwMIqguqxqOPb+1LvN61WBgz4z/z/PuIgIm42+BgRZR84G28aL13HZxk+1lhN0cWeHXqD2pUpTHUnkmwI81uPAkcG9mbfEvEwjlgfTQfh2qr/MVSyPc06ixRtg2/wWcs46DwcQy/CLm5tkvEO6B0d0QcJL7VP9Af47vo7Ftt5ZZR7+82COBu5G4dPo9Bjm0/n1VuqOUpGACQsE3PbsTUL+A1QerDgZqh5z8Q1c6cFBxLT7I3jFjhq1XlaQkQL6gw+1dzMIsLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HBgpidQs6Xmle+WD9y+chSEbk6VrmFKVRcQt47E3nJg=;
 b=UuNPozsxV8aEM9jAOr4qqctDHys5IsAVXnFZnsru9UGfaFyu0aavK+6y+g7GCe9Ylxuq5Pg9LNmfjkeGlVx9TpWPpM+cFeJloqsZWVWUkbtWbCXdJ0b5Tfdfxz7jXxKCFEvmdP5L/vjpCVHOv+QDNO0kAAylfMROqJZSN4vcTEL0c1CSHVM39mlgDB9rBGHRlh356Bx8UT3KmhWgSdVinjM1Rp3POsdffwWOfjcW1Psl4I9Yb/hv0xcGkEsDs0uLFcGpOxBWMeahJcEiqfIydXGtx0je8g6H4lQu+/hFq0BZduwOAEGm4h1Ot4ftZJescBO9RrcyuVjVZOpVAPOkYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HBgpidQs6Xmle+WD9y+chSEbk6VrmFKVRcQt47E3nJg=;
 b=PvdlQqaTs8WWBJRErm7bCKU+NFSRv+8UQYVtwmU45eQUOBaj/htyrXbxhK/mI8I2Tl+JJLgduZY2J+c28Fuxb2MvXqsNmqYF9sjyaGo3vIY3Du9Ze801vGjg+rUEGJD1w4It93pPJvWwiI0mzjLgR8GjLkHKCS8jR1vdKIlb7hM4k09wNo3usBUFyhkXptxgM5i/ELUXw39nXC2hiv1ggYciGfzUmTjoffytw1cpXmXJ0ZINix/t0s2JdFf2FujBgCck6QtIp3K0+7wrUlGNZDojiAnthnk9NVN70QwT3ZNIbjKUeMTllGwakFq5mu663J29xFbksPwxlJxnl7kp7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ef862458-3df9-7272-b1ae-b38a9fbfacad@suse.com>
Date: Thu, 2 Nov 2023 10:35:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] xen: avoid generation of stub <asm/pci.h> header
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <f3fff005a4f9af419144d768afcf2fd4de3f21a4.1698833709.git.oleksii.kurochko@gmail.com>
 <7642b4d4-c710-d254-b182-4f4540b6c63d@suse.com>
 <a5ec74d67cfe7413030bc7bd8202fafc49870013.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a5ec74d67cfe7413030bc7bd8202fafc49870013.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0095.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8157:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e474ac8-e006-4fd6-fc5a-08dbdb870bc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zn8Yx/TYBegZZnGmpH/o/H/toKDyWy9DYbpCrKDuZYO8Yg3ZY++/0z8O3OIbBVat1dOIOO0DKX+DK+nMput/6AtOs4qbyBpStb/eMLd3RECtSh5fxk1rXN46JtKLPtlTBV2xI+lM7cF9rKz005Z1LU6LjCSxoGkQhjXCemaADhxdrGFnZjkqsrzWDlSJQeT872D7vIe7bqoP+DLTZY1GwZAjWF2U2lMArKjdtSY7quvruioSiIxyUNkjQ//f/HFU62E5I8ggdSeyrXwTQ/ejsLqP0a0o/CNzJbSdgZ1aAb/ZfdGVCGu8KKG39hn0hejxwLepfcHDiGXNcyQ3+LfQQWCfLRvFJfVSbfdeV7OEg3TA+SQq9xU1TGmDTi4T0yCGKqbp80W6GBhS1gCRKmosMPFNSJBFPdxxghcie7I0yT5iWJ7BQUMWbxKFlGH33FKhL0V5/l9SNP4EOVETKb7W9WJbEu3KgJqlv2Ai37kM1sRq3kDfxm7S3RsghXVItAg06j1LvM3E+6VPJFP92j/JN+NZ6BSGByHcCdlnZI3z9Qrdmb3PCqCLUpQbXSUJ+9QRflWeIFlODq/WkZhE8btlhhNqi56rg6Hi92yPXJ47krah/vD/Jrmxaed55OskQQdk7jOh3/yhS8zwwXTfyyH8uQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(346002)(396003)(376002)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(4326008)(8676002)(8936002)(41300700001)(7416002)(5660300002)(36756003)(2906002)(4744005)(26005)(2616005)(53546011)(6506007)(6512007)(31686004)(38100700002)(31696002)(86362001)(6486002)(54906003)(66946007)(66476007)(66556008)(478600001)(6916009)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qm1QRUR0WFVjb0pCYkRuZ21OQkkyb2x4OEhPa1d5UmFkbHhNV2xmVE9BZUpI?=
 =?utf-8?B?Zy8zb25FOHN4MG05OG53MlNqOWhrQ2x3S2RJbm5Gb0lRbWJOeDBWSTFheTlm?=
 =?utf-8?B?bTMxRkNzMEVZdENnVXFUV3ZMbndBNWdhL2Y2N0x5TUpjUFg3b0pPZVg3MVZK?=
 =?utf-8?B?bU1FcW1jeHRDOEpkS01vY0JnVjkzOEdLZmNzUlp1R0gxMHVIejJEakJZMnBI?=
 =?utf-8?B?MVBQckFpL2J3RWpaWUZQZWk1MjBQbjNOblo4NDF4NzZIOHJORjBHUHNvUmx1?=
 =?utf-8?B?UEJxNHpWZHU2Wi9HS2U1bDEyUnNEYStSR3NVMHZ2aDRDaFZ5cXJCYVZQdzZV?=
 =?utf-8?B?YTBVWVV3ZFZ3NnlPL3d4d2JpUy9IR1VDM01Pck5VY1ZwTU9BeHV3Y0JRYjFj?=
 =?utf-8?B?Zk5LZHllWkloVFBrZ1ZBMnhicHRaQmQwN0FMUlU4QTQ5OFFjTXZjc2FJbGtW?=
 =?utf-8?B?V1lzT0pOT0hHZ1BxdXhMNGQ2ZjhwWkNMUDJPUlI4OGI4Y1J5SithWkJrbXZl?=
 =?utf-8?B?VzhiNnJJMStWaEJNTllrRmR0aWE3a3AzYy8wVkViSyswcmFCTWJhL1JBTWNZ?=
 =?utf-8?B?VDZiZnc5Y1lhZDBCK25leWh4MFdIK29zMVlsQUhPYStpb01kU2o5Z0dtQUZJ?=
 =?utf-8?B?RTFGcThvYk14bEluemptOGNCTCtUTWFhWHQ3UTBVSUkwb3JsZkZ2YW1WcmtG?=
 =?utf-8?B?ZkljendtdEg1WGtPL1VZSjVkRlRIVFA5OUNTY2xwNnU5WjQ5S0FwSFFJZlRq?=
 =?utf-8?B?NTRrOXNsR0pILzRSblhNMFIzNG5mVXNleWZyc05DRW5pOFMyd2t4WVNGb3lY?=
 =?utf-8?B?cGVOVndSaEg0UGE0WnJhQTdWTXd6bWR3VllqV0JBUWpIUXRsZ1phaWw5U2du?=
 =?utf-8?B?eXUzS2tsbUhFSmsvZ3ZTODRmVkdtWmNZZ0FCRW16VW0xZTJlOGFwVGYvK1h6?=
 =?utf-8?B?OWt2S0VYc3VJTnVpeUxqaSt6UCsxS21qK1UrNm5HVTBVY2lFemtyZHk5Z2NN?=
 =?utf-8?B?V1BBRytqZVNvVmNaRGlHQTcyeVg3OXY3amRlbldUbk96ZHgzWkJQSFQ1OUlO?=
 =?utf-8?B?WnRSRE15Z3VUaHlqSENraEVSd1NEQk85bE5ObmJSc0xEbHdCVkwzZDNRQjRh?=
 =?utf-8?B?R0VrYlBrOVdrMDZLb0ROLzAxYm5SQUYwUjlTOXQ2Z1ZEazNRY0czRFRRSE5h?=
 =?utf-8?B?WFl0QmQ1MmJtMWRUSDBKWTVkTFdyRWVlbVBXK2JpMWs1TWRTcWVDN3pMZURj?=
 =?utf-8?B?VVVXMDF2UytrTXIwZDRSL0xodDZDOXIrdW8vbjZ2NFp6bkQyUDJabnNrd3Zw?=
 =?utf-8?B?S0E1RU9ZK0Y5OGtWb3d1VVRwMXBqNVFieVRnU2txNkdMRFk4elo1ODRHaktv?=
 =?utf-8?B?MDFjOGMrTTNjbm5yUWpvM1RZcHdBZ3FYdldxdFNsUUpqbW5vSTZqRVpaTGcw?=
 =?utf-8?B?MFhMdHZWbG5pU2tRTFdMcWpBcU1LQ1Jid0Y0SVR5ZTVWV290ZnhHSXNyY1I4?=
 =?utf-8?B?bEtRbU9EbDJHTzM3S2JzR1hpY2RIQmQ4ZzRYVGZPeEg5OHpNUXZCbWM4cWdT?=
 =?utf-8?B?Q1JDQkRvRmQybEtDZmpkVk5payt2Q011cDlQVnlpRDNiSmtOWEUyN0txclNl?=
 =?utf-8?B?dVdwbmZEeVdPYWJiYlNTeHV2UVNaNmR1Q0lVOGYycysyZTROWlJVRlRBMW5m?=
 =?utf-8?B?Mkt3emxqZ3lRZGFtQWJnNEIyQnJUZWxTSk5SUUFmMGhoa1B2bmw2UmVzNG94?=
 =?utf-8?B?UDg2Sk1JM0RoZWxnbXliM1dIdnFSSGZiU0xwNzlic2F6aENmYVpTR1ZBb3hU?=
 =?utf-8?B?eU5QOEZmc3pRZFhXWk85Nmg2dmNCenlQMHdYMVBjZGlhN2dabXpmWEQrY3FR?=
 =?utf-8?B?eG9hOTh0UFU2NDFpbkRWODRiNnB6OWhHQTNGWHNmRFArZHp5VEpnN1I3T3hj?=
 =?utf-8?B?Q0JSOEJZTGl5bDNFREc5YUFBcEZFZDVKM2p3dGNpaVJJRnk3R1k0U3JQRjF1?=
 =?utf-8?B?RkRjUVBJYjZySkdOaHpyN2FJQVF2Z1BWdzBNT0N6ZjNDRWVHcVltcDlVMjgz?=
 =?utf-8?B?VjJhU050cEFHaFJvak1JeHNDT3RXaXpvYitsSFpKQWI0SG80ZXVHVmRsUkkr?=
 =?utf-8?Q?ASksBHdMdEa5MEYyGtcLXeRRB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e474ac8-e006-4fd6-fc5a-08dbdb870bc4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 09:35:26.9453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5mGHrK97qoyKeESHPhVSJN2RZDlRFyR+tL5cvsBledL3uHfQ30EZphGQH2nycvqjqcWpp0e+gnc1MUaIRVxMJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8157

On 02.11.2023 10:24, Oleksii wrote:
> On Thu, 2023-11-02 at 09:39 +0100, Jan Beulich wrote:
>> On 01.11.2023 11:15, Oleksii Kurochko wrote:
>>> --- a/xen/include/xen/pci.h
>>> +++ b/xen/include/xen/pci.h
>>> @@ -68,7 +68,18 @@ typedef union {
>>>      };
>>>  } pci_sbdf_t;
>>>  
>>> +#ifdef CONFIG_HAS_PCI
>>>  #include <asm/pci.h>
>>> +#else
>>
>> This minimal scope of the #ifdef will do for now, but will likely
>> want
>> extending down the road. Even what's visible in context is already an
>> entity which should be entirely unused in the code base when
>> !HAS_PCI.
>>
>>> +struct arch_pci_dev { };
>>> +
>>> +static always_inline bool is_pci_passthrough_enabled(void)
>>
>> Perhaps s/always_inline/inline/ as this is moved here. We really
>> shouldn't
>> use always_inline unless actually have a clear purpose.
> Could it be fixed during the commit ( in case there won't be any other
> critical comments about this patch )?

Oh, yes, sure. I should have said so.

Jan

