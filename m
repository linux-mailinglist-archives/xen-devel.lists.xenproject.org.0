Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FCBA35FE9
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2025 15:10:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888846.1298130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiwOl-000796-V3; Fri, 14 Feb 2025 14:10:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888846.1298130; Fri, 14 Feb 2025 14:10:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiwOl-00075v-Rq; Fri, 14 Feb 2025 14:10:31 +0000
Received: by outflank-mailman (input) for mailman id 888846;
 Fri, 14 Feb 2025 14:10:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dRct=VF=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1tiwOl-00075g-20
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2025 14:10:31 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 718d75b4-eadd-11ef-9896-31a8f345e629;
 Fri, 14 Feb 2025 15:10:28 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by PA4PR03MB6880.eurprd03.prod.outlook.com (2603:10a6:102:e4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Fri, 14 Feb
 2025 14:10:26 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%7]) with mapi id 15.20.8445.016; Fri, 14 Feb 2025
 14:10:25 +0000
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
X-Inumbo-ID: 718d75b4-eadd-11ef-9896-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pkTw4qxkW2R9Hql4mgOQFbO2H37PX9EBDtrPAG7ybAEuxiGeqL9mD2fDL5wct47u2WwpPklvwqwa0qzGqofq9phvyx7uTzStQ90wrTMrb6EdI4xijzJtyX7MnpflsVk+FigYYYjhs3M9c0e3VylPWkvPaW6aLyndgOLtbHL/iHEf7HZHW9X4nexDoqa7goq+m6nX/JQSEKOJqBrZkpAozuiJDQwriYnpL1rJIQE22DNNR6MfdZ6fpu61HeaLRqfcaXqn7MPf8lGMDsKTwSy7oy4jEIcU0rjoKwc8VwM71XLF0KNAd/uRP5mPIDgUoxuT0iWL4Awp0Oz3YgA+ltlW0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v5PTxxvAFtKUQlhbnWZSuLCHMj1W4iIBtsGKkqlsfqk=;
 b=r982gG5V6AxGcLCiyBmVbbzPWYOyGFeuVu4wnV63DiuqR1hHgwkSxdWh8iV5453Y3DEfjX4GwuFtVKYH/iefcWz1KVMfojdq12uNdJdGXQ8r46gBB4GFG6RNxS7UtXD2qrq5oxmjqZjDye/gSk/HtJveE3VKDgN4bZJeLQ72I+KqRzt8GqiuM5fIJvUjEUZ/PSU2q/fVzLz2YRBhQ6S8Clvfp08n6zCc+TmZtv1iVhie0xycscz748Yuxr3hz0xojIJ7w9hPmoXNJekUuPgDzrTNMZMHLt5hNiDi+0x7uxXzCCHKTP8giYwJ6lkWFi+lKYGjunI/eVTCQEAN7avd0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v5PTxxvAFtKUQlhbnWZSuLCHMj1W4iIBtsGKkqlsfqk=;
 b=u/Nq4sJPlTbKosMxexM4SAAvT+5njMqI86cMjoXDa2sygRXA7ECMl/vw2Q9YOIc5hrvrDB6mzOuuv5/98IfvyVNzsH2PbSAks3RIiK+rF7A2R9LvxJb+fqug8o9hhnIIjkLV5AcnK60zHRK9aUXE8usW2BUVKaJmK285ElJLbR+2w3TqkqlRMatjFKLKNtoUDlG1RSjLli02k8I1GYCzVg9d3E0WbN0QmnU6upcjvqVUbMDt2FobhXl2feNhc2w9s+K2f4ybI8Zv/tl2dMX7ymR5evo5TWgS8ia/VGYpu9Ns3t18uFq6HSbL8BxWrocbSifNYjnaX4mEY1V2VyMocg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <e5c63216-d22f-429c-b6c3-082e0984a9a3@epam.com>
Date: Fri, 14 Feb 2025 16:10:23 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: fix iomem_ranges cfg in map_range_to_domain()
To: Julien Grall <julien@xen.org>, Grygorii Strashko
 <gragst.linux@gmail.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250214125505.2862809-1-grygorii_strashko@epam.com>
 <deb84d7f-d335-4976-9f5f-6a5fa74b386e@xen.org>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <deb84d7f-d335-4976-9f5f-6a5fa74b386e@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0267.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::13) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|PA4PR03MB6880:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b776960-2988-4c89-89de-08dd4d0153b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RW54NGNvQUlPWlRnYk05MUZVZjU4UUV4U0FJOU4rcDJNbll4NVpYcHd6aHZz?=
 =?utf-8?B?MHhBRzNDUUdxUVQyVEs1eVdQdzBSUWlJWlUwbW9wbmV4K2hOTEJjM0dMdWFj?=
 =?utf-8?B?cTh2Nlc5dktSajJKdFlYcjhIdHJ2eEhIeVdQcGZzTklCaFJSaGMwVlpMOUFp?=
 =?utf-8?B?eEVLcy9FY2c0alVTRW5Hbmk4UUU4RzRDbVJwZ3hZOHJEbDRhZE9YL05wMjRy?=
 =?utf-8?B?RFQydTFxMld0TFJPQ2h3OEp6SFZMSWRuSWY4eUpwaFdlR1BNbU5yQXc4TDJs?=
 =?utf-8?B?QkIyQi9waVBBZGFVMlhSa3k4YWNrUHY3NjdkSDF4RUFZQ1ZLNGdLaXAzUXF6?=
 =?utf-8?B?NnBwNU05ZFlhM0RKT1Vncm03WnVnZHFzaU1lTE8xVU9zaDhlQzBmaDlSbUR3?=
 =?utf-8?B?TU5DOGhJbzA0bXE4V0JFcnl6VWlTR20yckswR0xNdkljdGprRFdHanJtK3JR?=
 =?utf-8?B?bGhWOHhQSnhnVFk3SzVZYVVQK0hLZllCd2VpZ1JaaHVYWDhCUm9COXIvcGR6?=
 =?utf-8?B?NUJ5TFdwMnhweEdLb296RnpEaU1FdXpWT1lPM2hrV3AvaHlYRUlzYlZKeW1B?=
 =?utf-8?B?M3lwcjdhby9nYzJORHh4L2F0b3I1bldjQ05vRFlBQ2dCWElYclBSckVyYWxP?=
 =?utf-8?B?TTVWRnFZVzlsdlZuSlZsdE5LYTJqMzJkbnlNZHVKbFhjbDVGbkh1TksxcVYx?=
 =?utf-8?B?dXBZRHFGOUdoV3Q1YmdzMUJwVXJYL2FRNlF4Ni9TSXM3b1dFb3BzY3gvRGpr?=
 =?utf-8?B?SXoyWlVackJPTy91ekc0TDBkTC9GZzVRZnRyamF6U3pDQnlmNUExcmdwbHhh?=
 =?utf-8?B?cEIwY0xaQ0R0Wk12ZlF6eWYzUzNVUUJYRXRRamFrYnExOExKZzErek9sK0RH?=
 =?utf-8?B?TDhnREF5NjNkNW9kb2FHdzR1VUdUSFFNaEw1T29xRjNHbHdvUUppRmUvYjhT?=
 =?utf-8?B?V1ZhRVNtU2dRVUFMWGJCR2dKOGZNN3BoNnF4aWFSMjNoc1F5d24vdEhqbFhj?=
 =?utf-8?B?TERyK2NWWmZOdU95eVl3TDFDRDNkakhSUnFBUDd3VnJEQytRTkVubFZ0Z2lv?=
 =?utf-8?B?bXlPTlBpZG9ENU9US2Q5RzRLR2docUhpdmJHTUFJWWNMd2RUZjJaOGlRNTRj?=
 =?utf-8?B?aGpzRWxJTHFyZkJDeno0djlFYkF5YkkxWnUyV052QlFlYk1YazBOZ0xsOEtx?=
 =?utf-8?B?TTVDWVN1b2hOaXptNVV1clhna3psdmN6S29zTm1mdXFrM0lsMkRGbVZqczlh?=
 =?utf-8?B?c25wdmY0T3JMN0hObWdGT1pQdm5hR0c0Um1ibFlzQ1A4QWU4MS9EcXY4bDNl?=
 =?utf-8?B?eUJGSEZHT2lHd2N5QnJ4M05SYWdUaWJ4akx3ejZHY0lWSU5taGdGVkhNakUv?=
 =?utf-8?B?UHVPZWs1cnlBNVV1aEJqUWVnNzgxcjR0RGdpaWhCaHdNZVJnSnRaNzJMMThx?=
 =?utf-8?B?d29pQXhsVmtwQUx1d1JtbWhXcDFYSnUwZHJ0TUVrZnBadi9IdUswNW5Rd1R5?=
 =?utf-8?B?NHVDQXc3cXIxWCtoRUEvdWNrS2Frc2x4ZlJ3QUpIM2s3R3FrRitKL3pPQVFp?=
 =?utf-8?B?NGhvMThqd1BDWWdQOUw0OEt0VDJWQ1lma3c1RWN0Q3N5UG5ickpxUkQydGpx?=
 =?utf-8?B?MjdrL1ZPeS9xZTNNUUNzSFp0dmVsdDduaHMra0VyOHI5OE5iMnZoYmlKNmhX?=
 =?utf-8?B?bnYydERWUGxac296ZTdEMlBpSUNJcGZvWW1zTFMwMWtuTU8rcVJRbExvQ001?=
 =?utf-8?B?Y1ZlNStmWDZDdnJ5RFppaE5wWGZlQ0tNc1FYYjBmaUdoU1NRaTZIVzV2SkpN?=
 =?utf-8?B?dC9IWG9heitVV2NQMFQ1VENuT2FiblZDMkUwUURiaHdMcThxMkFFekNNdStK?=
 =?utf-8?Q?p7T6jAT5/vxc7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0dOdE1vV0E2Sjk2LzRRODdWdGVtMjZGN3RSNnI4K1RIVktRK1I5SGdIMFNY?=
 =?utf-8?B?eHdUd1JtWFFSTVN2WFk0OHo5Yk5aNzd6UGlaemcvQW5UTHBFYS94ejY4VStu?=
 =?utf-8?B?bFAvU0VuUkUrRjU2WHhOaGVLYWZSWnBrc05kTWFOWlBYTVA5K3R4Q2Q0M2ps?=
 =?utf-8?B?alIxQzBmbThMNEFXTVdxa0NYV2huWXp2T2w4NzBoTDgvM2FXNWcvSk1KWW1G?=
 =?utf-8?B?eUl4NnpzOUhwdGN0Ukt6R3lKWjNDc2kyazVsQUVOQXdLc1BSTnVYakFsVnRQ?=
 =?utf-8?B?aWJtN3VZcW9UU2cvcU1zNEJ3Y2FiaDYrcDlESTlQZjk0QktaU3N2eTY3citQ?=
 =?utf-8?B?QTFBbGZLRVRscXlFMG1VRUk2anI4bmptZlpnSTVnSFZCRUgvMHIvQS9ISGE4?=
 =?utf-8?B?R2lERysvTmhvY2NkNEtxVTh0d2FuU1R4ZUJNRWZGbEpleEdNNnY3U2dmamEy?=
 =?utf-8?B?Z21DMTlkd2h1Y0Jhd2VlK3NKakUrOS9nNFNTR0IzYXJMeHFCUWs2ckI1dVha?=
 =?utf-8?B?S2NQMndFS2thaWJIQWM5SU1vckZackFoRkFKcVJ1VzZsaEpwRzF2NTU0Wkhp?=
 =?utf-8?B?M1M3b2djb1Nxamg4NitmT0RMZmJwcmtmZ05NTWk4bkM4eFk0dEVWU29sWnVO?=
 =?utf-8?B?ekVaUTYweHVScGVlOEtDWWIxS1l4ZzBoS25kMXBuOWc0OHdWelc3eDJOVzJX?=
 =?utf-8?B?NE1rc2tqRGZHVHF3dG5HcENGVmxlZHIyVXNSOXJYZURRT05uK2JpTk1Xekpi?=
 =?utf-8?B?bW5MQ1FoRWZKWkdOUGMrallNWTRZMUNYaDl4TTd6R2JRNEhOVEVrZ3BYYzZH?=
 =?utf-8?B?YWRRM3NQSGZ1MHllbzFLV1V2RjFOUWI1K0J6T01ZS1ZpZXc1ZHhURjFPNU4z?=
 =?utf-8?B?dk90bkN3aURxaUpxRTI0Z0RNZ3UrdnVkVlY4U1ZEdG9MRy9rWmw1N1FsOFZr?=
 =?utf-8?B?OWgyaGlkMEl3QUZ5bzNxMW5Oa0tyNTJZblNFV0VUUUtpRncvN3ZUQnkxaHlt?=
 =?utf-8?B?bDdnKzZYNkJVZUd0TkZCWkNLWE05MVlYVUs2N2NQYlJGRUd6enE5OUJVV2ZL?=
 =?utf-8?B?aDJDZWFsZGFkeHdNSUsrQ0VtOFZsbFpUU1JWTENudnNIRnpTSEdRNkl4bGtR?=
 =?utf-8?B?UkZOWkdaWDh2NUE2MWoxbVIxdE5ubFZMQmZQTHJieGgrOHcyK256NWJhWU01?=
 =?utf-8?B?SW9GS0RkYkR0Tm9KZ2dSZDQ1enk1VFlOSmVDWHVkZWxjNXN0MHVpcUdjZ05G?=
 =?utf-8?B?a3lkWC90TTVQeVpzWmFFQTNJQ0dCR2ZNSm4yQzB2SzRDM202bjF3TzJ0K08w?=
 =?utf-8?B?S08zeWh6UTM5U1N4eHBTaDF4a1dKMVJxVnNRYWFWYjJYNEZjTjIycm1lMzBa?=
 =?utf-8?B?elBlU01sS1B5SmgzTG9oMk5jMGJqN2ZJdUNsV0lGaURRMVhmTjhUNEN4L2M0?=
 =?utf-8?B?emZNREowU29zcEphbEpjVHJkejkzcVVwNER6b0hrTjRlbUZCSmI1V2tSbk5y?=
 =?utf-8?B?R0xTZEVORkdpVmoySllUSk5PSEVKZWhjRWh4VVFTcXRseHFTMHFWZXJYWUR2?=
 =?utf-8?B?QmdDa3NPMVNGMk42YjZCRDlGOHJHclYwMkJIVHBkenBYeFVHc0FIU1Q1ODNy?=
 =?utf-8?B?VkVXNHFlTytwYnRsaU9VS3NNZFpMSStmRjROTE43ZVZZbTJERVkwQTkzMHFa?=
 =?utf-8?B?QnY3TmM0L0RoQnZoM2lMWHc0ZWhTT1VhOURkOGNEZis3Z3l6SU5Qb3NlMzFF?=
 =?utf-8?B?dFRQUTR5N2JBWDZRQ0grUnAyVmZxeHZqRzRYL1cyQnB4bDNYTjVXMXlUcTV4?=
 =?utf-8?B?NHlVbE40YlJXUHNwUWJiQWd6eGh2Z2p5LzYwVEVMdUNKYldWZ1NTY3BsMURX?=
 =?utf-8?B?NUNsQzN2K2pOQk9ENTljVXZqMklCYmpYTW5xOUhzd1pTQkV5ZXlMVGFOVDNW?=
 =?utf-8?B?Y29JdWVuQzd4dXA0dU5HQ2JPbENZU05ZczlMRVJZNG5mQXJlQS8xQVlZRWFr?=
 =?utf-8?B?aTNvbFBCbDUrUVpLSkxMekMzcXpUWUNyL25UcjREWGk0dkVkQkRXT1pHT0FY?=
 =?utf-8?B?Vll3VDVpQkhpd2xUL1E4WmhUOEJmMFhBTUZNUDVZbVB4TDBFV21OMDFZRG1V?=
 =?utf-8?B?Rk4wNTZqem56cHNzMkRkZjBobXFkd0F6OG9xTXNLeWJUNHFCOVFPTStsSkQv?=
 =?utf-8?B?Wnc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b776960-2988-4c89-89de-08dd4d0153b7
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 14:10:25.2612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4M2EfLtucXp8j0DLeb/AB4tTERklAlXuOiW2O4h9IOLzPgmKxCM/Rxug6X+7oehH2A3/TIfy1F3XVvsrmNC7Nk18GeIUSxOww+tLHDjCbps=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB6880



On 14.02.25 15:15, Julien Grall wrote:
> Hi,
> 
> On 14/02/2025 12:55, Grygorii Strashko wrote:
>> Now the following code in map_range_to_domain()
>>
>> res = iomem_permit_access(d, paddr_to_pfn(addr),
>>                  paddr_to_pfn(PAGE_ALIGN(addr + len - 1)));
>>
>> and
>>
>> res = rangeset_add_range(mr_data->iomem_ranges,
>>                           paddr_to_pfn(addr),
>>                           paddr_to_pfn_aligned(addr + len - 1));
>  > > will incorrectly calculate end address of the iomem_range by rounding it up
>> to the next Xen page, which in turn will give Control domain access to
>> manage incorrect MMIO range.
> 
> I think the key point that needs to be spelled out is that both functions are expecting "end" to be inclusive.
  Whereas the code is thinking that the end should be exclusive.
This is a very common error in Xen and why I have been advocating several times to switch to use
> "start, nr" rather than "start, end".

"
Now the following code in map_range_to_domain()
...

calculates iomem_range end address by rounding it up to the next Xen page
with incorrect assumption that iomem_range end address passed to iomem_permit_access()/rangeset_add_range()
is exclusive, while it is expected to be inclusive.
It gives Control domain (Dom0) access to manage incorrect MMIO range with one additional page.
"

I can change it as above. Is it ok?

> 
>>
>> For example, requested range:
>>    00e6140000 - 00e6141004 should set e6140:e6141 nr=2, but will configure
>> e6140 e6142 nr=3 instead.
> 
> I am not sure what 'nr' is referring to here.

Sorry, will change to "num_pages"?

> 
> Also, with the range you provide above, it means that you will still give access to more than necessary. 
That's because you give access to the full page but only the first four bytes are valid. Is this intended?

It's known and expected for Dom0 as MMIO addresses are taken from Host DT and not all HW is virtualization friendly
(have HW modules at least 4K page aligned). What is not expected - is to get access to one additional page.


> 
>>
>> Note. paddr_to_pfn_aligned() has PAGE_ALIGN() inside.
>>
>> Fix it, by using paddr_to_pfn(addr + len - 1) in both places to get correct
>> end address of the iomem_range.
>  > > Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> I think this wants to have a fixes tag and possibly split in two because I suspect we may need to backport the changes to different versions.

Ok.

For the second chunk it seems obvious:
Fixes: 57d4d7d4e8f3b (arm/asm/setup.h: Update struct map_range_data to add rangeset.")

For the first one - not sure, seems:
Fixes: 33233c2758345 ("arch/arm: domain build: let dom0 access I/O memory of mapped devices")

> 
>> ---
>>
>> Hi All,
>>
>> I have a question - the paddr_to_pfn_aligned() is not used any more,
>> should I remove it as part of this patch?
> 
> I would keep it. It might be used in the future.
> 

[...]

Thank you for review.
BR,
-grygorii

