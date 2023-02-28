Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F19F6A5A02
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 14:31:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503368.775620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX04C-0006uj-Du; Tue, 28 Feb 2023 13:30:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503368.775620; Tue, 28 Feb 2023 13:30:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX04C-0006t1-BH; Tue, 28 Feb 2023 13:30:52 +0000
Received: by outflank-mailman (input) for mailman id 503368;
 Tue, 28 Feb 2023 13:30:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rjMb=6Y=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pX04A-0006sv-Oj
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 13:30:50 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2047.outbound.protection.outlook.com [40.107.7.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d1547cc-b76c-11ed-9694-2f268f93b82a;
 Tue, 28 Feb 2023 14:30:49 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7947.eurprd04.prod.outlook.com (2603:10a6:10:1f1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Tue, 28 Feb
 2023 13:30:19 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.030; Tue, 28 Feb 2023
 13:30:19 +0000
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
X-Inumbo-ID: 1d1547cc-b76c-11ed-9694-2f268f93b82a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bQN+DZuZ+MSAClP4sUpFG6AoRHrKKaVkqTaKQrtQWwQI/9uvkPq9Z8vOy5aIspBD/k7m+JAfGNnldwEKCGR8HqjX9GVVpRn+YcL4LjXI0q419PlWIFvFysu4ctehYUtx7bV12/OpDxUzv7veYd2hyCAu6b/Aj9PLHvwQw1wDCUJX+9Ij0d0C8y+9KcSz/ImNI6bYwzqvTSjjIrY9Q3yni3vz4JJ5N9iKznoX4hDoDFT12fXiVzU7VNsnJ+FMAqkMDtY7x0mAGlKBQ5FM/TP5pyv2tJZ375yG96tUfa4EZrfYrpiJKx82PIxAsSmxMCX9mWuZ2KIesYvN0jILfCrXnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=akQIpc+pcGoR44L4zVN4vbvumJooUlhCV2CPJgRI9B4=;
 b=AzdkrvUt92uSctgQfpoB5nurH9WwMS2dRTcZVT+K7OkSSwiao6z/YilDTuHJPgvBYdmpTNgWXiHUaxm3tlEeRVfCsQREBnZvCoHNWfrXoFGq70j3JzZ4i8B+IOmT3dZbsaoMD4BmehZWTsnFjn4WpYrC2yfwebBafPLW8KWJKlIYEu2j4+T2D98rAtvhFeCYod/fc/SmGCHdpQOmmM9JkanryJMjXykh3xLob3yAI9rIAagrp2NtkSXQd1yMBRHcMUEAcM412Y+qk9rbFp3Kp1Eu35Y3przUJ+61tpa1llEkyqOoZasc14ii5MKVfzKV4/u+WxEobh0FN0STW6Q3qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=akQIpc+pcGoR44L4zVN4vbvumJooUlhCV2CPJgRI9B4=;
 b=ytWVk8E/UaXLFVazlnayDyPKadVUFVE+LU+AEwNisY9y+BZtDssB8YcTjuez+DmWFlRP7I3dch/aEdjnHQbwxmBxGDWzkOABx7VRmoU/047oe9NW/tmPgi0TBk8Skpn8OeqnktN7Vzl74fIkUgSPHNvgoR7S1bI/8lSMLuLN4zhL9lX3KrXaZgUlDW2wR7a3ZTEeYD5oZERK0syBS8JuM+LYJRo9wCCJdsRIQ3jqTvkXO2TxnA4VGb9gMK3jG1PE6eCzXMqxa4j9NObXgIHeDr7hYv9JTni5YKv35hMGInp1pYf7IHv+sDY/tcxoaRFP/v/EEFgOV6ibqQCiy2Pm2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <58615dc6-0d89-bbcf-acce-73a5cd943cc4@suse.com>
Date: Tue, 28 Feb 2023 14:30:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 2/4] xen: change <asm/bug.h> to <xen/bug.h>
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1677233393.git.oleksii.kurochko@gmail.com>
 <19404db4a577e17dffef85a101449a507965be19.1677233393.git.oleksii.kurochko@gmail.com>
 <468d6130-739e-4b0e-44e7-5aab520a0cac@xen.org>
 <e22d11d172226cab566a5e0f79d6cf51f402d3ad.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e22d11d172226cab566a5e0f79d6cf51f402d3ad.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0010.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7947:EE_
X-MS-Office365-Filtering-Correlation-Id: 542765d7-2142-4c88-7433-08db198fef54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kIm8vjlF/rKQe/gMQZtBxbfGQNXLdE9NLLHieK74/fJeGD3LjdB/u4s2bvbR4+5tJXJlORnsoOsyQzxYKd34yMLZpOqEOfvT7mCI3GOHD0wS4rWfyU6wVj7hFHbmMb/ebTE5NxXuxoY8yTgKiqKDaqOZK0LAqwwyKr//74tvPqBgrZXs+4vxe0hCnwo3T+MLoy4v57aIt4eR6FYvPgvLYAL9Ty+HvU6I5xm9ESIR1lWbFNxa0QgV5Bqm6ZfCn2Kf/3tzkG1Z9l2vSvWu8G/5V1wev+nptXZyiZaOi/92S8ZJu/DdmfRIAV6GVbl1rJTB++/cyyhDaaT5mXW0J5ZGcnLPahOuP+DXKrTUKKaxKhs/DBtbx9N96hg72yOAI6iVBXn1umpGc3SNz11fFqbMhb91QcFlWOF5TRLm2k3F6cyPtLU2HeDMk3FWQWnf2cxW8UVy6pgvnl5F6aRbidl/zSQ6mN7WuetkPKYyPEpQEkCB1QZIZAN6XBma9aiaEe8sD/LNzmw7UJQFkhV2nGv9fN0RgCmSSozObOSY197q35C/OlPz+HwIxwzDVSqsEupeFCA42XU3JAmAKlb8IwTw8EVTh4cadWwZ8GfRmSMUqYzqQUpKQAJq4Au2Xh5ZxKtbgC7NoJXEfj89u8UuRd74j/1S+qqnEVYJFmsSdYmlbMrKD7LHqF12eoNq5IyMNprz7taddZDDspYhteVDGmoP6ySlI/7KqMXc1BUc6+tippQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(376002)(136003)(39860400002)(346002)(396003)(451199018)(31686004)(316002)(54906003)(36756003)(4326008)(6916009)(38100700002)(8676002)(6512007)(2616005)(478600001)(6506007)(6486002)(186003)(31696002)(66556008)(7416002)(66946007)(66476007)(4744005)(5660300002)(53546011)(86362001)(2906002)(26005)(8936002)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QzZRc0dIMlZYVTFRTGUvajNDeVpYd1g1b1hQUFBpelF3L1o2cktCZVJlVHlh?=
 =?utf-8?B?ZlR0dDRjYkxROG15TEtIWW84REVzOVRydUN2MzFRQ2prb1NJbWk5T0huVTZ5?=
 =?utf-8?B?elg4UFFOdGprYU16RS9ESVZMNjRQSG1qVkRyMEdqdGV6YllweW5PVkZnK1FB?=
 =?utf-8?B?NjNpbTczemtleU1iSGRYaklXeHYxbU1tQm5Cc3lPWkIrMVplMWR2eWw2UWs4?=
 =?utf-8?B?YytVL2Q5RkUvWWNWUCtJUER4REgrbEhOZkhEUFN2eHpuY1BTVUFlSFFBSmFK?=
 =?utf-8?B?eHFFa3ZEZDJPL2lCWUsxdVBOdGs3VUtVT3B3STlGYW40aHIwQXBPWXlyTmt6?=
 =?utf-8?B?NEJ1Q0FtTHBQNE13MGlXTmFpdFh6RzIySVFHTGV1S2xMQUN0bWRpcUoyL0pP?=
 =?utf-8?B?VzJ4djJhdTYxR0VBUDVSeDJZZGpEQkxzWlVuOThiZTVxZ2tlVjB4QWlXYTRZ?=
 =?utf-8?B?RXRZRUZvRnFFWlBCUVp3L2RLbE9OQWw0RDk4czlBVk1mUStWazdyQS9FWmpk?=
 =?utf-8?B?dzNqOVBYSnlwMEo0MGF0ZnV4MEZWSVhpMWlzZStBK1plZThpZlR3WXgzOEM5?=
 =?utf-8?B?SEVVUDg5UVNXaC9PZUJ4enV4ME9BaExpZTEwbUNGbWRSQVpod2tvS3Mrb1Rt?=
 =?utf-8?B?NW1Bbm01N3J6MExwVisrZXhkS2NxSUJpd3dEV1FPaDE4eFNvL20zTGNJMVJY?=
 =?utf-8?B?Y1NvRzNiR1Bkb0dNVjFybFErSDh6R1lJaDJJTjVuS29wWG1GamhBSHRScFJh?=
 =?utf-8?B?dk5HRkNTQ1JJQTdPdnczNHVtdHFGUC93b0RHbVpVZGRTSWRJdlgwbnNLdStP?=
 =?utf-8?B?OUE5OE5wbVQ0aElmaG53R2Y0TGtabU10c0Z0UFVuMjh4b3k3a1dwOENadm1x?=
 =?utf-8?B?dXUrMis3VDZjZ1RWYkpabXFmVWMwOXN6ZVI5c295TDJ6dU02ODZYaUpGSVVl?=
 =?utf-8?B?b3gxSXZINjJTRWEybW1zcUhaUmsvZTlWSXJnaXdlRDdPNnhGaFFKS000NDhX?=
 =?utf-8?B?U0VjU3R0c05wQWpUbUVOci9ERG5PcjJtTFFyRFpTV3doaEczNlArTXFCcDQ4?=
 =?utf-8?B?cmNKR2FDNDk0OUt4Vlp5cmRrdE5NUnRzdFR0a3RNNnhUU1FZempGbnRuVXNZ?=
 =?utf-8?B?aHlUcE11VkJnM2g2WmExamVDdnVCazNwWStQNEdmUjlHRU5hRGxoSVNUZ2Za?=
 =?utf-8?B?WGVDLzdiNHY0bld2ZHdMQVBRRTFLNGRNandsSXJ3MmExYVJLK2ZRdUVOODF4?=
 =?utf-8?B?SFpMTTU1NnFKbU1vOXZlR0FzY3IzczZUTyt6RDAvYnlONGREeTlNU2xjTzJQ?=
 =?utf-8?B?WkRPeXdUSUlYdE1XZzNoUUl2S0U0SGdGTWdGS1lkLzNIdXlTdUNCYUIwSXpF?=
 =?utf-8?B?bGNxWFUvN25yekU5bDdsQzl0YUFzM3RYSnlqRE9uN2hnZStaelcrYkc5Tyt2?=
 =?utf-8?B?OVNHL0UrT0IzeG0vby81Mk5sVXc3VDZQZDN5M1ZDZXdXR3Fja3JWeklUVWpH?=
 =?utf-8?B?eU1DV0xRdnJRM045aUYzRStqRFAyTkQyRGwzYVJHMnZlKzJMOXZ3UHNydlVx?=
 =?utf-8?B?YmhYeHpKSWs5OWVBZW9YZWZ1RWFkRXZGaUpNb2l1dGpHQlhKMnNzZy9ta1pG?=
 =?utf-8?B?c3hhUW9DanR2Sk55RmoyNFBScm1QN0orbU15U1lZUUk5Y28zbnV1WHlRQnBJ?=
 =?utf-8?B?Y3I2akZBN2dLcE9va3NDdU5EZzdrWFcrU09LWWZCeXNWUDZZZ09PRDB6dDF0?=
 =?utf-8?B?VkJhNkFtaDBSaVJPNjl1RnR0ZlFJZVd3N0xKR1JreXNOdUhVNCttdkJPWXNl?=
 =?utf-8?B?NVBVaXUrMUg3cjFCNmN6TzlkOXNvYStPYWxXVEkvam41REw3ZVJBcmZZSmpw?=
 =?utf-8?B?TFJNTFRsQk1CcHpjbFBLVWY1RjJPZEZsWlcxSzJISUF5UHJmdjVodExUU2ha?=
 =?utf-8?B?QWZ5Uldra0NoRkNFazZBY1BaNU9uRFJJeDRyeTV2Z2pKZk9ieDZVOTE5UE1U?=
 =?utf-8?B?MXMrKzMrYlNtZ3dEaVhTbzh1UDAxOGwwNXNkem00UTE3YStvSElxaFpTbW9z?=
 =?utf-8?B?aWVSNjlBTmhXZkRjY2ZXdGxIVHRTM2FSZkg2eFhWUnJIekI0eHhEK2V6UldV?=
 =?utf-8?Q?7uyCOr0jGpbbIoGOQ1EUJi+vQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 542765d7-2142-4c88-7433-08db198fef54
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2023 13:30:19.0926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8k2zo14fJlxfXUgEF98GaMFasmABoLhOmirmMlbVKGR8dBuE5C5AB0AOQwhl76PObjlDe0B5Wk5h2Q+Jxi6RCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7947

On 28.02.2023 14:07, Oleksii wrote:
> On Sat, 2023-02-25 at 16:47 +0000, Julien Grall wrote:
>> On 24/02/2023 11:31, Oleksii Kurochko wrote:
>>> --- a/xen/arch/arm/include/asm/bug.h
>>> +++ b/xen/arch/arm/include/asm/bug.h
>>> @@ -1,6 +1,8 @@
>>>   #ifndef __ARM_BUG_H__
>>>   #define __ARM_BUG_H__
>>>   
>>> +#include <xen/types.h>
>>
>> You are not adding new code in bug.h, so can you explain why this is
>> now 
>> necessary?
> I am not adding new code but inside 'struct bug_frame' there are
> uint16_t and uint32_t which are defined in <xen/types.h>.
> 
> And after <asm/bug.h> was changed to <xen/bug.h> it started to complain
> on these types.

Wouldn't xen/bug.h want to include xen/types.h anyway, and then clearly
before including asm/bug.h?

Jan

