Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E18436779FC
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 12:17:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482774.748464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJupB-0000b7-9x; Mon, 23 Jan 2023 11:17:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482774.748464; Mon, 23 Jan 2023 11:17:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJupB-0000YC-6U; Mon, 23 Jan 2023 11:17:17 +0000
Received: by outflank-mailman (input) for mailman id 482774;
 Mon, 23 Jan 2023 11:17:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K5hw=5U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pJup9-0000Y6-G7
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 11:17:15 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2079.outbound.protection.outlook.com [40.107.104.79])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ceb0f62-9b0f-11ed-91b6-6bf2151ebd3b;
 Mon, 23 Jan 2023 12:17:14 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7793.eurprd04.prod.outlook.com (2603:10a6:20b:240::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.31; Mon, 23 Jan
 2023 11:17:12 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 11:17:12 +0000
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
X-Inumbo-ID: 7ceb0f62-9b0f-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZemJkwHiQESsbiLLYgW1fuW4zO/tmTYt/VlJ6I9N5Nj7caPDHhe5xRJQf+VaM6171L59NXt6Y1zvtSAI8m+Rg/QQNswo5Z440rOiLhtVulPu2Fiy8vraiLqzitFpI0s5gbyhCxl+64U65bouo6ZaIvIvoVrvi0KLEd4GU5vJTqn0yRf4EuALSOh+6z1PgKzBHQ8LAdV8jFfYuznVrEnnM4y/Fj1NbZ9mntSUTCYEWfk9yXNnELHtoc558w4OnNMTaru3R4lBd48kGHOc7yLqnC9EiB3LhPXPXbwbUADG/BOKmOxaSFyrm24SiSmZDyUEziUABcmKf3uGgRjagbuzVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KcZyObBD1Y4xR9d5H5jjaWL1DUlT7QjalG2VbjboC9Q=;
 b=ASknvcMPDlONBYu5Jy0PK2H98/A/GnynJIjl9Di8/CdqFmpGI+lcozhhGa9SxuHH6I2NCqZyCpCMS6KHMSrgA92rQU86xuIK+87kjN9nchDx2caOTcMbjRoLtwwzNVfdwMXOSRgbnomWuwmTMP1glafOozNTM+DYFl1RLjwf+nVvIYGva1yNUSzeuYXEQIc67O6pbw+wN/k+xP0mqT6Uf17iEbwm0Q1WNzItyn5bKHiZeoBLC3fWLXy8Zj387PuiX0vYEHgLonBD/d3Ha1ZZBm+nryv3iA5ZBz6P/EHT6EGHmeanshFaVQFFp6HtU8fhir7p9Jug4uIeKztseW9X9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KcZyObBD1Y4xR9d5H5jjaWL1DUlT7QjalG2VbjboC9Q=;
 b=JA8+YjvZE2L8x5RgwiH2UvbTRRhWR8siAGLOlrzsms5MjroxVR/dN8rwcB9J/RuLLAYUg1dw5crMP1QEcmFi0mdQHTuyFS+JmXjRHUv0dHg46QDmvqgJDZVi87oMVX92LuVMBQWNY7p1y98VdX5jRt91n7cYHxdXAFC0v3E2xxHa7o+JBnvPEUim6TjwY4NQ1kBMWpWwGWX5SKR7ddQWy5JeOwxaJUcpML/0X5D43xTt6KJ+D5A1CyVanBdb3h+kkStW28juyy2O+hKchjc85ShVcu3YIAsZX2UC/kQGDBtPKeCKlN0qo3sZw5DLFkDiR/6Xfwb+7dACBr+OICCDug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e8e6bee5-ce59-b171-6134-4473b396df00@suse.com>
Date: Mon, 23 Jan 2023 12:17:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v1 07/14] xen/riscv: introduce exception handlers
 implementation
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1674226563.git.oleksii.kurochko@gmail.com>
 <7a459ea843d5823ee2c50b0e44dded5bdb554ca6.1674226563.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7a459ea843d5823ee2c50b0e44dded5bdb554ca6.1674226563.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0068.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7793:EE_
X-MS-Office365-Filtering-Correlation-Id: 68e61b22-19ec-4097-7bdb-08dafd335ff0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LTbUKeRcbG9VROsw3GhZ1eUOuUFOkj66D7EJiDS4HSHPAzpInacJpte1MRC9qvvs+l5tMNkfjC/wrEan+t63oQ3B/VbPWZRtZSBjl/uR45bq8d5aEcvI9dQxxRF4KK8bemqI+19El0hJuBk21KNWbro7HVGxy3P4CfZ8cvOCVGGfAOdbXdAqKqVpAipwZENvfNsd2Fs8wWBH614fRXWLRiUS5z2v3ANSuoyGFAq3VAOyuIzp92v4tgcPQBkwn1cuGygGydyN6OADODaFdywaGsKLltEfogW9Uu4Jq5Kfi4PQP6qSB9SwwHY+pkZimiEnJBNp0aMFAyMpe+O7iaNPu+/LUg2gO/tkaXNU0B1Z+gsqp369k4qVpDLqBpk1MiAgc72Jz8uQ87YE14TAL6gCKR+q2bgurT6C0XR18sazxd5Z6pUuuyxQWNJ7NoFd+Ykl2PKENxKcp4yf/9tEPwUAvRMCfqaF6Aggrv9wAvMqgWIetnJlyDdBfYOkaGYVn0w6pycu+77u/+iyxeQ/I7ORrvtvMwVLIayye7iBL95ZxY4H82O8DxxOEcyzA8fM/uw8CMDPSrkIX94XRvf/yVYpiEcLOJxNEivn2eXvWDu4KP4lSMMObmDgcVleOKKRheb10hC/x8vws1J1hkKBa9W4cejtq1z9D67+PmxJarK071mebTfIJg+8kRBf9Vp37q/++YPdwiGEk9RETy/lAVXuMSmHR0AiyYKvCC6NfJHc3BE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(376002)(366004)(136003)(346002)(39860400002)(451199015)(31686004)(36756003)(31696002)(54906003)(316002)(86362001)(38100700002)(6512007)(26005)(186003)(2616005)(6506007)(6666004)(53546011)(4744005)(5660300002)(8676002)(66946007)(4326008)(66476007)(6916009)(478600001)(6486002)(8936002)(66556008)(41300700001)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3VVd2QyMzEwWUxTUm1QeHZiajdPWkNPNHVLbVVCZlFheXhxRjR1SW12Z3E5?=
 =?utf-8?B?Z3pFYWR0WmkzN0tyVm03NlowTE0wdHJIbnBpelFsS3RScCt2VHF5a2lyUXpM?=
 =?utf-8?B?cHZqWG4zMmNsVEZBeno5VkhEMHRMbWV3STJneWZ3WnJLZlNjRE02TnY3WCsy?=
 =?utf-8?B?MlFKTmRJVVRkSTRjRTRQb0pIUEFFUmZtVzhxWXZxdjZDREUwS1ZoWENlRDVC?=
 =?utf-8?B?UlRUeTFVeVVnUDJINlZqZzhDdW1RbyswRzVtYTZsSng2cEN0b3lGN2tGOW9W?=
 =?utf-8?B?dGFxNUg0YkFwMUJIU1J2OXovVHlPeFlaNTVWYUNkWmoraXVQNUhmUGFqdFNK?=
 =?utf-8?B?bW5KZUdyMmVPSTRJcDMzWnZ6SGJtUnIxWEZLZGhUeXhVaHZ6K25FbnM1S3hV?=
 =?utf-8?B?TG14ajNqNDZFbXd0T3ZnVVdrSWVJUnBVZ01wZG9HaWpzcmg4bFk1NEYycGE5?=
 =?utf-8?B?NWVXVnJHbXBmWXFBUHRFWXMyT1ZzVHgwaHpUbklQbVNLT0pJd0w4WThZVjVO?=
 =?utf-8?B?dm1sTUFCN01rUStUaFEzb2F3Nm16bXN2OWZ6RXdaY1pTdE5UMklrQXR3N0Jm?=
 =?utf-8?B?VVdYWUtUeWFVd2VRVUkwY0tGSEhVVHhjaThSdWJTZXRMa3JDRlIybm5kVG1o?=
 =?utf-8?B?RERxU20yRi9Pc3BjdVZ0NTU4OXVvY0RBSVpXazBTamtTSlViaVBjMk5rU2ly?=
 =?utf-8?B?QWtlMXBWZEtVbzl2QjlMSHp3TGdPYndubzNIa3pLZVZFd1pwUFZYWFUycG1n?=
 =?utf-8?B?bCsxb3VzZnJ4eEZDV1MyODVtVzdNUHYxLy9WdlJYOGNPTHlwU29sQ2dyL0NR?=
 =?utf-8?B?K3hxTkdzN2JxQy9lWS9rbmlHMjNDYUNYTFBGZkJQVlZLeHBTMWJGSnJMVTRh?=
 =?utf-8?B?OU56L3A0MVRrdkVIOTFRMHRWTjdjUnhCbEdadlBBd2o5dmR6V3Vxa0pPZnR0?=
 =?utf-8?B?L1BzNVpKQXlBS00yRmNnbzJmSVl0VTNQWDZrb3QreFdvR3J3eEJKdXB0TDgz?=
 =?utf-8?B?UGF5VkVjY3RFbVBTczJqQlZLUDBOOTYvS1J0VUVTREVWSFhkY2JaTDFTazlq?=
 =?utf-8?B?dnVSZlkxMnArOVBZYVU2eWl0L1ZtblIrdlhWQitTL2oyZktoNGl4THg4TXRo?=
 =?utf-8?B?UlRldEhUN2hSZnhrREtDOC9PaUN0cGVOOEt2WDA2VmttRFZtZk5oUnlwd2I1?=
 =?utf-8?B?RkdETzIyMmdnbTlIVFNUK0JWZSt6NmQwYmhmS1pyTWRzTXhDMGJZVUVUNHNO?=
 =?utf-8?B?UW5CMm51YVgxOGRUNm5iNTg4ZGFRcDdZTmczUjJaWThMekcvMjZIQ1pEaGVz?=
 =?utf-8?B?Tnp1UVBZWkRLYVhXTndKVVd4NmZDR0E2MjJCRklDZ1J0bWdpVGI0QUhIVWJC?=
 =?utf-8?B?WVJoTXpNWnhrWlRJQ0VLZFZObjFYWk9teUlCM0pUUzhhZTkrY3ozYmxnTVBr?=
 =?utf-8?B?eXFCTWRxNGVQMU8yMGt6d0srUzY2Ky9ndzdhVXR4NVBjSXJGR2NPWUdvenZ6?=
 =?utf-8?B?YTBKbHRHL3JtNUVkenBUb3hOdEdTeHR4YUFnUGo3eDdGRWVZSE1DZUU2V2gv?=
 =?utf-8?B?NmNOLzd1MnpjSTBMaHZkZ0ZuVXlHQTBjbU5OSnM5cmpzUzc4T1JXY0M2bzV2?=
 =?utf-8?B?VkhUNWlkdElCYW5HQ1hjMmd3OU94VWVtRlNWbU0xT1pjTm84d2VpMUFHRHA3?=
 =?utf-8?B?TmhpeWtLbWNpdnVRUUVXMGM4MGV4Uk9OY0NiaHk2aDBFQU9zekZCQWZWa1Vs?=
 =?utf-8?B?NWt3MllHU0RtRWhRNWlIRE1uTkI5b09uZ0taMUJ1SERmMGhodXUrSTJDVWlJ?=
 =?utf-8?B?K054WEFIZ1Mza1ZCMlFrR2RBVFYvQitFVDB6cWF3clZkQXBLS1hrNTJmbXFR?=
 =?utf-8?B?YWpERmRVYW5KRFl6NGdUZ00vWmo5djVzMXg3YjdheGR4bit5amoyaVhZQzFX?=
 =?utf-8?B?M2VtR1U0NG5VS0NHL2l2T0FiaGN1UlJyRC8zeUtKVkZ4UDFac0F2cVlOWGZC?=
 =?utf-8?B?TG5aMERDaXRhejRydWNKa05vR3dBN3k4dHFJWjRnbFZVTEwzTXFmeXRsK2NC?=
 =?utf-8?B?NHQ1NVBYOEhIV1plZStKNjdna1FmaUlTUDgrenNtVzZFMmlvMTFmb0U3YjBp?=
 =?utf-8?Q?tgd/Iit93RzKm4b4JMHvWnUZM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68e61b22-19ec-4097-7bdb-08dafd335ff0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 11:17:12.7507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BWOHzS0BtZsRGoOzRtae865kUZbc6Kl7C4CED8cv0xObLzAru7AYiEEut6xRrIFeFyzn3X09dj4O57ckLXYHLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7793

On 20.01.2023 15:59, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/arch/riscv/entry.S
> @@ -0,0 +1,97 @@
> +#include <asm/asm.h>
> +#include <asm/processor.h>
> +#include <asm/riscv_encoding.h>
> +#include <asm/traps.h>
> +
> +        .global handle_exception
> +        .align 4
> +
> +handle_exception:
> +
> +    /* Exceptions from xen */
> +save_to_stack:
> +        /* Save context to stack */
> +        REG_S   sp, (RISCV_CPU_USER_REGS_OFFSET(sp) - RISCV_CPU_USER_REGS_SIZE) (sp)
> +        addi    sp, sp, -RISCV_CPU_USER_REGS_SIZE
> +        REG_S   t0, RISCV_CPU_USER_REGS_OFFSET(t0)(sp)
> +        j       save_context
> +
> +save_context:

Just curious: Why not simply fall through here, i.e. why the J which really
is a NOP in this case?

Jan

