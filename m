Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5393ED836
	for <lists+xen-devel@lfdr.de>; Mon, 16 Aug 2021 15:59:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167354.305473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFd8b-0007x9-CO; Mon, 16 Aug 2021 13:58:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167354.305473; Mon, 16 Aug 2021 13:58:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFd8b-0007v4-9B; Mon, 16 Aug 2021 13:58:49 +0000
Received: by outflank-mailman (input) for mailman id 167354;
 Mon, 16 Aug 2021 13:58:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3tuO=NH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mFd8Z-0007uw-7h
 for xen-devel@lists.xenproject.org; Mon, 16 Aug 2021 13:58:47 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1177a9bb-fe9a-11eb-a45e-12813bfff9fa;
 Mon, 16 Aug 2021 13:58:45 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2107.outbound.protection.outlook.com [104.47.17.107])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-21-kMUgs-rDMk6WNzwZocpKhg-1; Mon, 16 Aug 2021 15:58:43 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2447.eurprd04.prod.outlook.com (2603:10a6:800:53::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13; Mon, 16 Aug
 2021 13:58:41 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 13:58:40 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR02CA0036.eurprd02.prod.outlook.com (2603:10a6:208:3e::49) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.16 via Frontend Transport; Mon, 16 Aug 2021 13:58:40 +0000
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
X-Inumbo-ID: 1177a9bb-fe9a-11eb-a45e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629122324;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cawSzcYJfROd2jb4EE2GMwzerhen/U4FzMbtEMqPZnY=;
	b=FVx+NgHLFWxW89MZ9sqYRnJZwP2JATHjQMbgrfUBpnG8QSjadHxnDnMfofJDbJVIxAgjZP
	KaNfiT5l1pBvXKB9OV1e1fyEOmK/upgNyQORbWybU0y2A4JxZchnk0pH0/bXyeHkPLUL5b
	7EkuF2W40GbB89awj1BOAIYnx72Imc8=
X-MC-Unique: kMUgs-rDMk6WNzwZocpKhg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C7KKW8IcaQKxA5sRcRg2LBFzGy3M1ExlZHF0X9i5QP4Z9R7KyEOpBrWfar8ywTzd/3xNUE4c/P5QSzJfzY2KpvnSgg1zlNXVsF5uVmI1SEe2ZxqwaPEEhvhbgrMDCRidbeOBHJXsvPZm1DacVSyFgC0u6OFO+qv90DEkYpMFmHz3aFGLvgTGf7at2UcxmgRKFv3q0Jp03Q/VNLOAy68KAQLsbVY/bCvLmSEkPAEViwXjuKe+w7QWt2SS96JRCRK3JNa8Us+3B6N3fGWT+3lNARB0rPCB04YCe1hqdx+GWCvU+avY7A87ZvjmYFupOc+MkUWMheTrWVmaANgDNEJ5KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cawSzcYJfROd2jb4EE2GMwzerhen/U4FzMbtEMqPZnY=;
 b=BBj39jka9Rzh0Jjflj/oNhUPa7jhl3brJE76NA+IrAg+cw/Xb2UCtFFbDnfL2W39aeLMP5ga3Wc6vpuQ2tM5yHgFTinEhJ2eXfSstBsj/DYC3s+XigfKKDX05rlNgv8IfEIFbm1bvBR2emnrtDqI6gKHrQ3vBaF7l/qgjeJRtJdkL9CGG6/FGm5glZpBezeGKG+9M/LYbkdZRHZ5E9JdoJP9jDYLd4aI6O79ohTZM0VGQ1fEl4f73EiGtQ9lBD5hP5Fnwp8T4slbwWSNOs5kUSdGChmgX4W1k2O8GDtWuQB0OzT2S1aFYMTGQgGgTfio13Hg4jdZAf7AN1DEy/4vIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] x86/ACPI: Insert missing newlines into FACS error
 messages
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210816133505.32484-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <72a41c5c-5d4e-ed4f-dd3a-e41d13447000@suse.com>
Date: Mon, 16 Aug 2021 15:58:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210816133505.32484-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR02CA0036.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::49) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f9434f01-2663-435c-1d1f-08d960bdf3f2
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2447:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB24479A72EC0CC518D369D0DAB3FD9@VI1PR0401MB2447.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8w2j4ZukClVEL1HmRNkTL8Nb4mwNFJXRrJgY0mU8ADBWk8XCuZsHbWDYQ6YkGrZ2GdV+ZhduScjV+VWhBAyI64Qr2vDqhHhR1HN/B5wxkHU3HauCpKd0qeodu7CfLYQU/94YHgSirNXjH2Mun3f2wJJK1/FpPP7V8bt8O9uoNirXCxYKXCkn+Do88bYzbrCEDaIe/3yNDSQbVJmU4PMnbUbt0MPUyjT9t//sVV/myiQqkE32twndnqh/o8/mr9ZIuUb0HOTvAzulJnLXjGgALw6/K8Ffx6MO3LqCXZkDJ5YYV6S3w519UF/o+eDB9Su3mI+9/0JeWuF1tLTHPi0ijU0JXGpuB4CBf7jbb+gAH3XmZ9shRSU/6as7t9nfUu9o3zUOq0G9HUvTaJ8wPRXA3dpryQ/eq9pmN7x37cS6QtBLuhtiVtI7t3P6lJbVPO7a8Kvm+BDTp7MZpGLRndCEa8tEDot6L+HUkdimZXfPawn8H3pOE3kMNzwGxbTpV3+lG6WVwc+Xo7RpWhAXFQC6bCbj3KEb/RaPfK7/XWRsZuc4ghlqa7x5Me537QlgfRRmn7HntQWuJvtYquzvJb6zw4TdmW7V/LJ1C0KiknXtCdIrxtQCclYpG7iivZDE4X88DslxhDEJRrVeobUwJfOvUqSzikm2hOBq6FVIssNDECs3c1BpUu5KrVS9wTpqWGZwc7xtoxhwjGcR6Fr3nncjzt84lwdTCjHOxyWovSGyfq4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(186003)(54906003)(6916009)(15650500001)(16576012)(26005)(4744005)(2616005)(2906002)(5660300002)(83380400001)(4326008)(956004)(31696002)(66946007)(38100700002)(36756003)(8676002)(6486002)(66556008)(66476007)(53546011)(8936002)(86362001)(498600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWJ2b2FKVWZkZC9aOUwxY3BqSUgzd0tqOVRReUVWMVpiZHk2bkhKTXdXYUNl?=
 =?utf-8?B?ZkN1SDc4YW1Fand6MDgybkd1bDl5S05rU0JBd3gwVVEyVFhYWHcvcEdrdmVG?=
 =?utf-8?B?YS9PNG1VZTIxYUdYd0JydFQ2T1ptSTVka0k2VU5HV0RMZFZrUHIxVlpJUXB1?=
 =?utf-8?B?U01seFRndWtHbUF5QUllOGxxNTcwRXh0dkg0d0RBUXU1ZTdXUTJILzFQa3Zr?=
 =?utf-8?B?Y3dneVBzSjQvUHJOaklnbUJmY0RFWGtCTG8yQlFSaThnTGg4VGRyMGJjRms1?=
 =?utf-8?B?cUZjR0ZSL2RGVWZQOTdaeEE4MkdYVXc2clBqd0pPeGYvdFM4b0thVWVxQzJk?=
 =?utf-8?B?aTN1Q1Baem83cUFFWW12NU1Gb3RDWmE2MzdXK0Uwci9UejlTYzlabG1DUkxC?=
 =?utf-8?B?c1lsdmJLRE9jaTM5UTRiYWszZDhEbGNYeElsZjJsUkdUaEc5S2Q0NllYejRI?=
 =?utf-8?B?Ly9lTDBaVEZ2bXlzV2NOZGQ5VVN1VUFTaW8zeWJTTEJnZ0RYUUF6N3pqZWpO?=
 =?utf-8?B?ZmE4aE0zUU45YXRQeE9MeXN0ZVlncStvUFdmTkdUOW9jOWdzemFaT2pYOFNB?=
 =?utf-8?B?TTBZT0FGNzIwa0VkQzJKejZMaEpJVXBqNi9hWlBkNHg1UXo1L0ZxdFU2Vm9y?=
 =?utf-8?B?OUtlYkpCdHlBN09sSGRlTU55RGNuUCtHY2k2R2F1dThFUzJPRnhLbE4vNDFM?=
 =?utf-8?B?UVJ1K3hrbVVBazhPYWhjS09GRVR6WngwUDIvU0dLYjNKdWlIMjdoOFczWGxD?=
 =?utf-8?B?VWRGS3dlNUQydjZycm1pdC9hbGt6cExVNEFzODlvUHpzSmtYRVZjYTA4TVpD?=
 =?utf-8?B?SmJFbGJ3eXBCM0pXYlVZYmU1SWF5WlAyNEpGOXZyZ2ZaYjFMRFg1WC82d00w?=
 =?utf-8?B?NzVVVjgvV1BJK0U2bWwrcUJkWXpSS0l4MzcwbE9yY2cybmFxc0FvcFdORnZz?=
 =?utf-8?B?U0ZYTnZHSCtOeUV6SFYwUG9HajBtMHBKd0k0TWhoZDlsRVNXVjhYaUQwaVg2?=
 =?utf-8?B?b3pnRHpPLzcxUFR1VU82b3czNkt2aktpRUNOdmVWZzFVSWFXMXorSHVSRmlO?=
 =?utf-8?B?VUlBdWh4TEVNQmRsRkNXMDZoYm5PTHAxOE5ML0ExZUdYRDdrVzN0dzJPVG1j?=
 =?utf-8?B?NzkxckR2QVQyTzlWUjd1S0N5MlU5dFNzUnFtRGRVb3pDdHRYejAvTGM5OXZZ?=
 =?utf-8?B?YzllT29KVDZiM3NzTFFXd21renhVSkpGcVl3U0djeVFlQmpNZGR4K24xRmtn?=
 =?utf-8?B?MFZQK3phVG55bFovMDUrdzR1OTZFUHZGaUszbU4rYzA1S0hlbGI1YlJiU1h2?=
 =?utf-8?B?N1paRkZmRVYxSU0yMkVDb3hzdXpSRTZKME9TcFRQQjBSQkU2ZDNSSTN0cHJ1?=
 =?utf-8?B?VE1Dbm5UN0JhOGM2Q3Rmc2Z5RGFrSGxYbTlYS3h1S0JJZkppcTJ6MWlCdm1u?=
 =?utf-8?B?VkhjZml3bXJ4SVhjdFpWa2dDTXMzeFN4RXhtZnVHZzlqQUpSSFFoN0MwNGZt?=
 =?utf-8?B?eGlHZjFIZHBxYVA2WmhIQ1c0ak8yZlpEdklpTlQwMVBwdk1EaWY3blBXb3pz?=
 =?utf-8?B?bnI0VEJCK2tHZTR6eGoxWm5uRXdaTmpGOUN6eDBHK1VDRG5jQWtTVGhMYnUr?=
 =?utf-8?B?Z3dxaVVkVjEwaFRwTnZJRTVTUVV1WFN0Mnp0Zm1qMnNIY0FMOWM0S0ZhRjNR?=
 =?utf-8?B?QTJvZjZhV2FrcURoaVpNOXdZbFJBditYZW0wREVZazZqcWJwZGRPcGdyTENa?=
 =?utf-8?Q?+VwBVRNtr0VY9ZoN/GkO5OQ3TV2j3XnVEPNWP/n?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9434f01-2663-435c-1d1f-08d960bdf3f2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 13:58:40.8631
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tQH3oC2N/sz0+eCRq6gvZGLP5TDfHj0W8Nm5EM+fanQNns+sAJvH61I9k32/DejwCnVi50cUY7WO6g7JcFE78g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2447

On 16.08.2021 15:35, Andrew Cooper wrote:
> Booting Xen as a PVH guest currently yields:
> 
>   (XEN) ACPI: SLEEP INFO: pm1x_cnt[1:b004,1:0], pm1x_evt[1:b000,1:0]
>   (XEN) ACPI: FACS is not 64-byte aligned: 0xfc001010<2>ACPI: wakeup_vec[fc00101c], vec_size[20]
>   (XEN) ACPI: Local APIC address 0xfee00000
> 
> Insert newlines as appropriate.
> 
> Fixes: d3faf9badf52 ("[host s3] Retrieve necessary sleep information from plain-text ACPI tables (FADT/FACS), and keep one hypercall remained for sleep notification.")
> Fixes: 0f089bbf43ec ("x86/ACPI: fix S3 wakeup vector mapping")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

I'm curious though how you came to notice: I hope there isn't any
hardware/firmware actually triggering emission of these log messages?

Jan


