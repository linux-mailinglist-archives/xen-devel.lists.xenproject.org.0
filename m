Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91AD177645E
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 17:49:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581227.909830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTlQO-0002eD-Hf; Wed, 09 Aug 2023 15:48:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581227.909830; Wed, 09 Aug 2023 15:48:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTlQO-0002by-F4; Wed, 09 Aug 2023 15:48:40 +0000
Received: by outflank-mailman (input) for mailman id 581227;
 Wed, 09 Aug 2023 15:48:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nhcc=D2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qTlQM-0002bs-Uh
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 15:48:38 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on060b.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 337e75f1-36cc-11ee-8613-37d641c3527e;
 Wed, 09 Aug 2023 17:48:36 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM0PR04MB6785.eurprd04.prod.outlook.com (2603:10a6:208:189::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Wed, 9 Aug
 2023 15:48:33 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Wed, 9 Aug 2023
 15:48:33 +0000
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
X-Inumbo-ID: 337e75f1-36cc-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c1nDpbAM0pF2HjZONhsNrZ/JgAZh7Vk9bv0CGWGyCQleOPbatpPPDDDPcUPipxx5qwSTKPNnI6VQLZw6LTCNaXgcsLJKSKmrgZrylfW0dEQE0YzAv1bbdzRqwBWHX64Z2y1qZsFoK0vCvuUwSzqpAdpid86ySMEYF2QKbrOwxYndU2rJCOlzo1GssNZ1N0PxVj9gjMPQ4rqNdx7HrFYnIUrBYeRDYkt5gM8Fc7iBwg9ntNCLWfeOC4Wo1KIhqpIp7dL4ITc5C7/lsL1yAj1jcT/Te9bT7ZMX/kyjmr2fm3wIgIxWeciDVkxsXQVQOZ/FKUHEw92Xv1yUg5Kd6xNTBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ymVo+NV60+65k9RHPYq16orj79qnJL1RT/G9okpDYzE=;
 b=bGhrDUT+uqZLLkRA8T+8repXx7waL9RLK+CBiUQLP7sh8hwjm8wEDIJ2NdMNtTeDjzsJCjiDxPZlEm4Suxgv3qdo8qWgjaYKKchRY2kSJvmJP2kk1aarMksSg9c+qcESCPyn6Q+oRjoa5DxuBLW7a4JGQkY6VnijERsMR2KCLyuQtfaKF4hft23BBzmEpzaZoK4dPGQq9k8JZwim16xD6ZhfLis6FNKjDVeOeeN7VmrYQ7JTJKZ/MQl8Enp4hNhRpNv+IglLZU8VtOik0A7nnJ3CXImD/RRGR09oC8bEd8JQlMKTs2FR2+B6bltP0RovSgBe0qAhuAaVK0XBcjKpJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ymVo+NV60+65k9RHPYq16orj79qnJL1RT/G9okpDYzE=;
 b=litH3ta3utPXagxim67Z7HmElxWZfZd+7GyWal4Mbezcx6wPca6gIPRcWBRplIckKQHNakqqXHCPDT3XHsGbAF+6kKEcgoQqoMm+uegGDK2CIiVsGpjF420LqYo2OEaV+rwKNiX57GmsT3RK7n+820OJ8/EGBx6PGlu/Ug066VA7XxxhZbEM6ST+XrNr6hcVl7eT1VV1+aiEyubNWitEC9xQqjY9u85gGtaN+I9eNtRF90X95hODphTsncqnQCZmNgfyolueV+PXRTU2KBHk0Svh5Tw1pAgFglCfzoLKbivEMCRq3r0RpEfoUlZL3NiXLx2nS9DvCP+3FMQr1AqtUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3c5ae070-d6c2-070c-e482-e5135e2acef1@suse.com>
Date: Wed, 9 Aug 2023 17:48:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [RFC PATCH 5/5] xen: Add clang-format configuration
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230728081144.4124309-1-luca.fancellu@arm.com>
 <20230728081144.4124309-6-luca.fancellu@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230728081144.4124309-6-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0199.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM0PR04MB6785:EE_
X-MS-Office365-Filtering-Correlation-Id: f5d4cede-3265-42db-f61a-08db98f0161a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GLyqG3kHqb6iFmpMiMMhPiAAvRgZ2d+4qi/LDx91Nj13dFWTYAv3TB7btunApez4XwP5FgObeHIAegbCyg4LdIC+KBo+8lqwO3vIeZHudfDxXgmKKQqdI0XkIWapIllteZYebFpVreVNv6H/J4YUvq2J2yG9/xEgy45sL7wLh3Eet1Bhv+KF2lxcY8/x0Dt3bOkYl7vGOTGaW90Ca94gllau/HnYnw04kttzxNjL9hxwq4fqfbGnarYkp1QfMUOHUQhLBG9V/kTsK/AzqoNBV++OWSuSDzcPE4GbD7Gfe/GJ+uk/Ucgg8YdY+nUej9dWKYOJr/wf3hKS2u4QzecCIP4W9N0K/d2eJHt5im6AuIZYTZp8nfz4jnZdXI0KHCtHq/PwHqjF0ZbNmp0Rl9Pk4cUhXFewvKF1pRgjqfoRhjRCqJg9bKjkWUFkMe4pATxoIHIeWDnN2Q0N6d+w88vdQBJDFBVoxFbv14bu/if2zuVBSnDBpaTkS2BCFjY8CvPa9SjarWPnxMeOtmPnM0GKI4t1UpGJKgqvtnHUOm+dxu6rm7gM71yWB2tgrnfYgcMoH69pX04M2r0zgSka2wR1qPwgkquq18EMdv9rKJ+i0765Y7BHBwlVUh1AGj5cr1nUcGlkGIG81RBPrViHs7f0lw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39860400002)(136003)(376002)(396003)(366004)(1800799006)(186006)(451199021)(6486002)(478600001)(83380400001)(31686004)(2616005)(966005)(6512007)(26005)(53546011)(6506007)(316002)(66556008)(8936002)(41300700001)(66476007)(8676002)(6916009)(31696002)(2906002)(66946007)(4326008)(36756003)(38100700002)(54906003)(86362001)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3VFdVQ2djdOVVlpSU1VSkVRR2srVGp2V0hPejlRcUR2Y054NHhZcVBrdjhB?=
 =?utf-8?B?Z0dsZCsrZFJEK1hwNWZmQ0ZZWHBmNEQ4M0xETmNuck8reVIwN25hU2dWaG9Z?=
 =?utf-8?B?WlFxMGJtdTgvSmhXd05Ha1JBKzJ5blludG9nN01TQjhySXB4bmVHRHBBcHMz?=
 =?utf-8?B?SkNmajlRdUx4ZThUSHplRWE0U25sZE83WldMNmF4T3VCRnJ1M2NKcmVsWVJO?=
 =?utf-8?B?dDdXWWJHOEQ1Q2pueVdVamxFK0tYcFU0ak84d2Vtb3ZVeHg1eU5Cc0hSMXhN?=
 =?utf-8?B?b0VnWG9TZHg4L3dvWUFXVk00bXVXQklJV1N4c3ArU0JQYThjY2MzOGZpK1dQ?=
 =?utf-8?B?YVRMNDY0ek1xZWVyTElTTWFCYm5vTEV6WDV4UmlUSnA3QkRHRDFseGtmMjlv?=
 =?utf-8?B?dmhlZnMwelVucU11NHY3OXgxQU5uQkpmam4zd21wY3V6WXRQOUE2dEdwQVdE?=
 =?utf-8?B?R3lZZENmVS85OVByUjhYNXM0ZndRZnB1Qm8vN3EzWnVqayt5eDZaQ3lWeUI4?=
 =?utf-8?B?b1pDNTFzOWpPQ2pwY2ZoenhJMVhmTnJWRExXN3Jia0N5d3BvbEliRzJrRElR?=
 =?utf-8?B?V2JEOWtLZ0QyeDhLTlZialU2ZjIzbUxGVGNYZmRYNndwRW5WS3JaWmxZUjBm?=
 =?utf-8?B?b29Md2k4S1ZEYXlYKytxU0padnZBZXdJaTZRV2ZFbmJnekszZ1g0UU9ITm1a?=
 =?utf-8?B?N1I2QTlBNXBQOFhDb1I2RW1OL0hwa0pqVVA1aDgyWGwrNWFWODhsRWRiRm5x?=
 =?utf-8?B?OU5HZmg0UytSRE5OeWVFWDkvQ1pUTk1td25WTDhmUkJPY1Fzc2pEallvS3dz?=
 =?utf-8?B?NFgwMEd3KytwdXpxTlQ4NUtlVEVtYTVrVFFFMm44UlNsSy9iVXh5VmVRcnJY?=
 =?utf-8?B?T296ZUw2T0hNUytKWGRZVmRWVzIxek1xM0FkejI4N2R5NTdiaFJSU05PbjRa?=
 =?utf-8?B?bnBWVElhZDlQZWIxQk1HbEd6QzRhSy9mRDYySFh6bjJvMCtsTnRhL0ZBYWhR?=
 =?utf-8?B?cjV6VWhBRXk5Z1paV2dLZE9GTjFlUmdML3puUVE0TnhBTEViZjM2aThJQmlv?=
 =?utf-8?B?cmVtZ2lKOU9BYThqdEZzUUgweHhLcTdySFJtZmk3UFhKNUV1MjdPcytneTZW?=
 =?utf-8?B?VEJ0d0hGRW5yTEp6NTAxSE9PT290N0lFVFcrOWZnL0RZOWdVcmo4eGpwTytH?=
 =?utf-8?B?VTVOcmNaaG5KV3NURjBFM2s4V0RqNElSNHdDYjdPMlZzZkg1eVc3RGRsUkFh?=
 =?utf-8?B?V09vTXlVdUg3bERaV3FwbkxNSFZUdjNTb0ZzMUdWcnJzM1llazArNERaZTdT?=
 =?utf-8?B?ci9FU3piRXRuWDBDUjF0cE9aTjlOM1p4aHlHZ20reUtuZVk1THdsK3F3SXdw?=
 =?utf-8?B?UkVBK3JnejkzVDNXdzd1WU03TXV6WHZQUXRCbkI4SWduMHM2T2FHd2tOVkNG?=
 =?utf-8?B?Z21oamV3ZFpBTTFhSkorYUhhQ1B0cyttanc0VEpJditPMWFmUUpoK1JxZytR?=
 =?utf-8?B?UHQwc3lPemY2SE1RY1U5cVFjakdlY1p3VEozQnNIQVg2aGQzL3dnZ1o4ek1H?=
 =?utf-8?B?b0s0cTRMbWNMZVFnMUhGN09oTWx4NlkzdE4rM29JMGQxY3haQmNTUUxRanRC?=
 =?utf-8?B?d3FNZFNOQVBadnJ5c3lkdE9kaE5qLy9hN21uVUJZSEpVai9qcWVBNVIxeHIz?=
 =?utf-8?B?SzN0Y05yNXZKZVltckc1NjZ4M3VwMDdPZGF2SHFRRzJYRHAwTDJmOXZndXFh?=
 =?utf-8?B?VmV3bkEzeG03TWVDb1QwRGlWazgyWDF5Z3hxSStMM3o1WCtaTVdnazBNT1JL?=
 =?utf-8?B?MGJ2TUxzYnhVS0M1a3pKbUo4bmpXNHBDMmJiRHQ0anNBT0tQWk1RT3BlbGo2?=
 =?utf-8?B?V0JlZW1MT3NkS0k4b3V1VCt1RXgyaGRhYUF2YXkxRHUza1pkc3UzdmYvMTMr?=
 =?utf-8?B?VzhhNEkreVUrbWNYV28yMEtyZU8xTlp4ZVgzRlZRWklyeDMya0Y3Z1lPYkZF?=
 =?utf-8?B?NExnblppZnN5ZDkwUGVkSDQ5dWFDa2tHeUptK1JtTks3WnZZUXZJWDcyVm9r?=
 =?utf-8?B?cDNTbmEwVHRuR2d4MTFGNFg0WncxMklCdURWNmU0NWtUaS9QT0NMTTZGWEFp?=
 =?utf-8?Q?psatw7E3O2mw2tdz5/s4FXGsC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5d4cede-3265-42db-f61a-08db98f0161a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2023 15:48:33.4871
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vYvqtUOPgcaNlyCqmIbWlcKhDwYJCdLcUIs8Cm3eLAhxTn2wS9F2zER7Y4yGdk6E4bY07VQLhjE0LwMzvqyZyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6785

On 28.07.2023 10:11, Luca Fancellu wrote:
> --- /dev/null
> +++ b/xen/.clang-format
> @@ -0,0 +1,693 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# clang-format configuration file. Intended for clang-format >= 15.
> +#
> +# For more information, see:
> +#
> +#   Documentation/process/clang-format.rst
> +#   https://clang.llvm.org/docs/ClangFormat.html
> +#   https://clang.llvm.org/docs/ClangFormatStyleOptions.html
> +#
> +---
> +
> +# [not specified]
> +# Align function parameter that goes into a new line, under the open bracket
> +# (supported in clang-format 3.8)
> +AlignAfterOpenBracket: Align

I'm not convinced this rule (assuming I'm getting it right) is
suitable in all cases, especially for functions with long names or
very many parameters.

> +# [not specified]
> +# Align array of struct's elements by column and justify
> +# struct test demo[] =
> +# {
> +#     {56, 23,    "hello"},
> +#     {-1, 93463, "world"},
> +#     {7,  5,     "!!"   }
> +# };

I'm pretty sure we want to have blanks immediately inside the braces.

> +# (supported in clang-format 13)
> +AlignArrayOfStructures: Left
> +
> +# [not specified]
> +# Align consecutive assignments (supported in clang-format 3.8)
> +AlignConsecutiveAssignments:
> +  Enabled: true
> +  AcrossEmptyLines: true
> +  AcrossComments: false

This is something we want to permit, but not demand, I think. I'm also
unconvinced we want it across empty lines.

> +# [not specified]
> +# Do not align consecutive bit fields (supported in clang-format 11)
> +AlignConsecutiveBitFields: None
> +
> +# [not specified]
> +# Do not align values of consecutive declarations
> +# (supported in clang-format 3.8)
> +AlignConsecutiveDeclarations: None
> +
> +# [not specified]
> +# Align values of consecutive macros (supported in clang-format 9)
> +AlignConsecutiveMacros:
> +  Enabled: true
> +  AcrossEmptyLines: true
> +  AcrossComments: true

This also looks to aggressive to me.

And I guess I'll stop here. What is the plan wrt discussing which
aspects we want to require and which we want to permit but not
require? Or is there alternatively a way to leave unconfigured
(and hence unaltered) anything that's not already spelled out in
./CODING_STYLE?

Jan

