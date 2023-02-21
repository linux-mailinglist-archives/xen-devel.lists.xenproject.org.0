Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A7C69E185
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 14:41:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498924.769882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUSsv-0000Jt-Sw; Tue, 21 Feb 2023 13:40:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498924.769882; Tue, 21 Feb 2023 13:40:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUSsv-0000Hu-P0; Tue, 21 Feb 2023 13:40:45 +0000
Received: by outflank-mailman (input) for mailman id 498924;
 Tue, 21 Feb 2023 13:40:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+yrZ=6R=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pUSsu-0000HO-No
 for xen-devel@lists.xenproject.org; Tue, 21 Feb 2023 13:40:44 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0626.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55d0f3af-b1ed-11ed-93b6-47a8fe42b414;
 Tue, 21 Feb 2023 14:40:42 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS4PR04MB9458.eurprd04.prod.outlook.com (2603:10a6:20b:4ea::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.19; Tue, 21 Feb
 2023 13:40:41 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6111.021; Tue, 21 Feb 2023
 13:40:41 +0000
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
X-Inumbo-ID: 55d0f3af-b1ed-11ed-93b6-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hsl5nW/UExFWDDDqz9tLUtkBal9Dx2JIxR9RsSSVkQtIcRE3ob2e0YxPqPNwfsJrdt6jJKXEC/tn/3ZXdyRlkPud+B5Pd33GusprfUGTxvujw7a0u5SWEnITbkXsVbQOtzPQZ9uIxp4wUbBNIH5b5etJ4EPa6YENBF6dJJjyfFIT3+rxoGYR7jO2I9XRBtOs//DTlVHWqiyfipb4PCfapKgjh6Pj6uYAYtwDFxcL0jOByyyktJhxlg2hJf9jIUHwTQgM6wSRGZ+LBM5ZmS1sH8vWxaGhjji8qrZ4LzW9G+ACspqBnRmxSw1aB6/tTKlTUWKJJkpOEvecOtFAcFkpOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aG4+Rvk4oBN/gBEzlbqVzRZTGMIwzdsIKympAT5ijNY=;
 b=T/7guqhvLcHj/j/XeVH0lLEcNfetGoPKd0ZtT3cDkPoFhMumD0EuHU0OkB1EV8fKpkfrCQh3M46McdJnlr96w4BzRQmwtVc1N1B84dFSAiZX5VT/5sPllxLfJjFMQAigmiJyskNbLUI+BsKn8qTR6FKPojYcvCBKQYUR3b70+uy8uEt655RWAmt+lV6td6p6Wspo5VHCCDp1Fcmis6wgebdmtvKt1bCtkf0sNBxpo0DcmhT462Lj6uOdVaxj9TVocaNRcb9bK4GfzIOndA1uBLdZRnNjYT32S2Nwa2YfGjNDWH+zAjILsuFt46klN7Q5z1M5WWt5Tv3Grns16HlE8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aG4+Rvk4oBN/gBEzlbqVzRZTGMIwzdsIKympAT5ijNY=;
 b=iQDcBF69uqg/ByHeJ/6WmhuF7Uom72Owxctk0nYMZRWUXaA7TEi3upFG8JTJYpb6cnCgXUQE3L+Pe68c6MWGXdk04aE0hUIRvzxXkuAtYBg7Yo6yvi1r7QfForiEJKD9OLUV2OnOIBACKERsIhPzgVOQfqNSSFrZHiesfNWU1B1JT29pZtj4UwXae2WD9ZP94l0n1WJ1dWtw9ZOp+q8TXW9IkmsfgLUbniLvN8/hUg9X7XAWS6JUla/GytPib90V+rYFZvTS8cgzKeZjrUkWdQtkARxD9O1p03VNWoAHHy00VrJsAz1D67ZIHsnKzTmsBnlVpTTSacIW6yLkGLpRlg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b6b91164-32f0-3615-be8d-da99d9513666@suse.com>
Date: Tue, 21 Feb 2023 14:40:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] xen/ioapic: Don't use local_irq_restore() to disable
 irqs
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230220194702.2260181-1-andrew.cooper3@citrix.com>
 <20230220194702.2260181-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230220194702.2260181-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0159.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS4PR04MB9458:EE_
X-MS-Office365-Filtering-Correlation-Id: 63816a10-d74c-4722-d47a-08db14113920
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XCywHu5y4JE9cXXOZnE+NjvnbrXIWLEfUDHjNCSD2btYtxC51jb8NqmSelWS3JzAq5qzvBjiwWkD2X7QrtSQHLphc7ZJbKyE8U98YyTpoPnmkWECSPkqL6eEmdQYCtmv3pD1AzNG+PaDcNc5MBkOSaoCXLKMmF/1zMpbqM+MB4vIE0274Mm4qjaGLNIB67QqFmLw7Yx8fbVlf89GNZimjpLvm9bX15nSuV9I18ehG1N42M44yxOt6U0klkGiJO8H5vMg78XafQw6DgG9vg5ZcKyc+EjpEudxQlIdyyiX7kffbDUxrNfJ5AOvyPReeP1gorB7+qjWFHd0glWrLRy6hGve4A18YZMxHPPlA12h386TX6d9o3JTKEI+nSQoykChrwe5Mz4A4JiaVqSv2UdLGJbeyhCkKYjyRbUjbKx2Bfo5xioPmTlUD2T8p0+2JPHM7/DyV1dIDt0tl8M4epNVKhAY2fXtraafPsjtWi4o+ZbCssVzKAI04IxUgXNocN2ch/EhrO6R7HmBtKPgrkLgWFkAaIEairJtOW+o+uaHiwgU5cc4/jnk/X3gcdCvxl6Fvhwny31gRNQ6sIlMDFl+9fGhu0HFI3epAiPOZuoPxuyPG81zEvb1X+19ZgEK47kkYM21R4ea0Vs3Y0YvGdkYFryU7JK7QdqKV1aDQerEwk05Ow3kBH/lADDJ+wu4TRKiEzqxHkT9tPaBnMzMtxg+7SGbJnFJaZgLbF2X1qULjzE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(346002)(376002)(39860400002)(366004)(136003)(451199018)(6486002)(478600001)(2616005)(4744005)(38100700002)(66476007)(66946007)(66556008)(6916009)(53546011)(2906002)(83380400001)(6506007)(6512007)(8676002)(54906003)(316002)(36756003)(8936002)(86362001)(31696002)(5660300002)(186003)(4326008)(26005)(31686004)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2VadUVvZmdpODdnZFZFYVN0bk4zdmp1dFBCRElsNkViWkZZWEd0ellPTlhT?=
 =?utf-8?B?dmVIYzFIdE95K2ZJbXk2YWtMZHlRRmxLWW1pbVAwUHl1c0pzd0tTaGlRenRF?=
 =?utf-8?B?NnhjUzVVeUdHM3RyVUNWRUFFOE1sNVBSVVM1RC8xZ3BlUWJ1cnRMeU5tWG5q?=
 =?utf-8?B?UVB1cUNmWHJPS0FWM3N0QU1rK1dmOUl0V2xNeTB2MEVYT3Ura3JWQStRT21D?=
 =?utf-8?B?WWJIUE56N28vV1BuU3FGRGtqb2tLYnBsamtCS3UxK2NrNEdsa0VVa3BCK0pZ?=
 =?utf-8?B?UDYrNnBSK3AyYTJGdWNGbS9kSHhXMlo4QzhBTUI0NjQzZmltalZXOS9YZ2J3?=
 =?utf-8?B?TkdHMUk1TGdyUDY5ZjU3UGFqRnZjbDVrRUt4ckZnS0Z4NWlMZzZhbThucWEr?=
 =?utf-8?B?YklzdDdnanhHZTJKbUE1bno1VTMrUnVQUjl4eXh1SXBoUklKS281bG1BaUFr?=
 =?utf-8?B?Y0lEelBkYjhoMlUxcHc5RlNNUk9uV3B2cnE4SjFWOE5qK0w1UjZtbmJEZHdz?=
 =?utf-8?B?clpkZDdmNFRKcy9VNHVkMzcxZEswcDBZY1k2Q2J4WTNOTXAwN2ZVdGRBUUFi?=
 =?utf-8?B?ay8xbkRjdndpdTdWSlo5UVlkZHExNDh3Y0JUbFBvb0syd1ZocGY2NTFnQTlh?=
 =?utf-8?B?bFJGU0RsK1kybks3TFhVNGo2cEdRZ1VQMUhQQmlianRGc0FFV1JmckZTaDZo?=
 =?utf-8?B?ZXVrMWRtbW1DMWxzRjB2TElIaUk5aC9Cb0srN1hjOGlkandOTy9hK1N3STFr?=
 =?utf-8?B?V2dSY1VUY0UydEJTWXVkQTk3MnNOWkNkVUdHVndiYkw5aVpRMytOM0o4d1kv?=
 =?utf-8?B?MG9CTXc2c2llVHF1RkREUWIydXZ0eEFzaWlwdWtmSDdNeWg0U1BUdHQ0cGdm?=
 =?utf-8?B?S1FBYW1GMDZZR3E3dVhMOFJKL1JHdjNHMXYvc2liNDYwVFh6a1FvV3BvNit3?=
 =?utf-8?B?OUdob0Z2N1cwTHgrMGlhTWZXVVI2NFoyeCtjd1U4TmRiS0VsSWI0c2J5UlVG?=
 =?utf-8?B?TFVyeFQzM3doRmlhclJ4NldJTXJieXI4a1YyVFJpSzg3dnM5Ym9BUnprZlpN?=
 =?utf-8?B?NTkweGI4YkFpM0xyaEZoYUIvcm9CVDE0TFhma1cydjVpNmhZbUxsNTk4L2hI?=
 =?utf-8?B?YnhXbjdCYTBwM0RQK2dudFo2R0o5ci9KSml2VUpYWUswdGRlS01kOEhnNXBz?=
 =?utf-8?B?aXpDS3AwbExlRHdmOCtTZmZUQk15M1BTcDlZbjE1MlpLYmc1K2FDZ09lV1RP?=
 =?utf-8?B?aXExS2drbXp5SFlBdmtYZHhHY2huQU43VG94aEJaRG1jNGc5N3l1TDIybzNp?=
 =?utf-8?B?aGJTV1ozdENyTGtZUTJveEJBL25IWWpUdkc0SGVxQnd3Q0dQaFNvVkhtMUwv?=
 =?utf-8?B?Slc5NHRubVZEVFRvdHN0UUZzd2YwVnBBUTZQMUpQU1EvNDJ1M1BwNUlOclRT?=
 =?utf-8?B?ZDJiSE1oMGNRVDhjbUwyZGRTbkxZb3Y5ZXg5UkxDQlRjT1FJWkdHTTBBYkIr?=
 =?utf-8?B?d1l6bTBocytMRFd6VXo5RjZGMHBGaVkrajlvb1ZxM0xweW1BQ2ZCb3R5RmIv?=
 =?utf-8?B?NjlLaVA4aVlOK3ljM2g0aVBvOHRtOTJicWdMeVNMd1dOODB6RG44VXpicU1v?=
 =?utf-8?B?cXZzdG9xL2hua3QrWXYydHQzVSs2VjRDdTlvbFJKbjVGSy81S1JJYnpXMTNH?=
 =?utf-8?B?bUFUdG1weW5jTXNqZU5mZjVDbTBzcURnZ3VyN2tmOGxZbUJCS2dCaXZmZTJv?=
 =?utf-8?B?Z0VkYTI5TGMwMTdxRG5VY2YrMjd2VDdRZHhvMEZZUEpvSXJEWVhraUNUY3Q4?=
 =?utf-8?B?aE5LUElyNDQ0aGhkbDRqMm1WRjdRVXM0VmxuMVVqU2Y3SXZPWWtKbFh2K0Vn?=
 =?utf-8?B?QnU5cXJzaW5WSkQ5T0E4WlZYMkdoblRmbko5dWhLbmJLZ2JDRU1kSnVYMWZ1?=
 =?utf-8?B?YTFyamRLcDk5dCszVWxtM2krTm1kVFFya2ZicG1CN0Vzc1RESGk1WnhVL2No?=
 =?utf-8?B?eG5zRkUrUFJhV1lQR2MwRm1PSER6UnN2MnpMbms1UVdqc1liNXVDcm1HTWFL?=
 =?utf-8?B?VEJ4cXpBT2xvUTgwVjM0ZVlxZ0FMdzNYek82WHJ6VFplQ09Ob1grckVDcmth?=
 =?utf-8?Q?zrOl9tdYYDj9uacm35F9NTIi7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63816a10-d74c-4722-d47a-08db14113920
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 13:40:41.0228
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qOe9UVZLhguOr0dhY+Hr2RbRMREuRm7L7HAcBw2AV4GK2Auiuupptov1EppxfhLnZaEoI6MrUixA2CZlA4gyIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9458

On 20.02.2023 20:47, Andrew Cooper wrote:
> Despite its name, the irq{save,restore}() APIs are only intended to
> conditionally disable and re-enable interrupts.

Are they? Maybe nowadays they indeed are, but I couldn't spot any wording
to this effect in Linux'es Documentation/ (and I don't think we have
anywhere such could be put). Yet I'd expect such a statement to be backed
by something.

> IO-APIC's timer_irq_works() violates this intention.  As it is init code,
> switch to simple irq enable/disable().

If all callers of the function obviously did have interrupts off, I might
agree. But the last of them sits _after_ local_irq_restore(), and all of
this is called from underneath smp_prepare_cpus(), i.e. after IRQs were
already enabled. I'm willing to believe that the local_irq_restore()
there really comes too early, but then, ...

> No functional change.

... in order for this to be true, that'll need fixing at the same time (or
in a prereq patch).

Jan

