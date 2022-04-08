Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D8C4F9171
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 11:11:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301265.514102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nckdu-0001kc-2Z; Fri, 08 Apr 2022 09:10:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301265.514102; Fri, 08 Apr 2022 09:10:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nckdt-0001iA-Uv; Fri, 08 Apr 2022 09:10:57 +0000
Received: by outflank-mailman (input) for mailman id 301265;
 Fri, 08 Apr 2022 09:10:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tFry=US=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nckds-0001i4-DK
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 09:10:56 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb19dc4f-b71b-11ec-8fbc-03012f2f19d4;
 Fri, 08 Apr 2022 11:10:54 +0200 (CEST)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2055.outbound.protection.outlook.com [104.47.14.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-29-lcxIjcFvOQqp9aJM-dJsWA-1; Fri, 08 Apr 2022 11:10:53 +0200
Received: from AS8PR04MB8609.eurprd04.prod.outlook.com (2603:10a6:20b:424::9)
 by AM7PR04MB6775.eurprd04.prod.outlook.com (2603:10a6:20b:102::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Fri, 8 Apr
 2022 09:10:50 +0000
Received: from AS8PR04MB8609.eurprd04.prod.outlook.com
 ([fe80::48e:2a59:a71b:d6dd]) by AS8PR04MB8609.eurprd04.prod.outlook.com
 ([fe80::48e:2a59:a71b:d6dd%8]) with mapi id 15.20.5144.021; Fri, 8 Apr 2022
 09:10:50 +0000
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
X-Inumbo-ID: cb19dc4f-b71b-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649409054;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DYSxQSM3CYhfd5TXUvhU3jXDxT6dvZg75S5ddVjARJI=;
	b=c7aBH7S0tE1EZBmLa+yKtCw+8NK78vOnaNZeM1c3Tl5DdXmp9fxSe8JQWVkL7BP/pLmXuZ
	7uevXCwAsSYUgfAfZvIWfhuEGVj8mRmrx2uPEHvzepUnqBOA0oW5sz03FB3s7fcLFH9PUQ
	x3IEl9i4W1YPm73g3xR3MuFxtG8tjkQ=
X-MC-Unique: lcxIjcFvOQqp9aJM-dJsWA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VgmtBEN2WTkxY05PCxcHZuKYKBPbAwqbBdi0AEg4bVwHlbSMxzAMNwVic9KE5eirXmHJeasmJVZpqB5/MYY7gSvWP9z648JW6J9+KlmOl+IcdKhRwiK3MVYPSX9PnroVRev6xm8qY80HZz9XD3l+/kWwBYczP1ptp1iYA5DNapmAurxYxwT38d5YC1amffTpq5iZiaJW6RPT2awFJhhEeCz0Em2EAzE4ZTsKcOlCwNCyWJNA1alxIAs7YShnwW6NsGoBJ3yR6FCpj3kZgInG5us7ifBUMWe8wpnWhcb1GAuJvH4AvpYphmgxI36hUGEpSOPr8CsAV5dqc0nDGrsK7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W1xeU0RmUz3RtNke3MQimnA6qk3rju1aPUVKx/AKLNQ=;
 b=TElOycPDHW9M2nEqw384wUa/a+TkQfvzZUnjE0ngacNnBSYVAftp1fzlpZoKA+K1fAu04MljM5902ZUa/GC8sapz0FVdInBhpCQ5kax2wQXhuGWcy58+w0t1Vl/OLEWrBFbHcGbyQiFFJEtFr5JuVAJud0x833/8k7omgPl58JoZlmAeINruuD+2vtZwOnRDhYxFZGH4JtvsGCOWVohjJcVRAQN57RjDopDSUIGqdtaGr0xXN4trzlgMHqlFQj0wj58GbsmkeXrJlraLqLXZg43nRyQs3s6XdKC23Z31Z2G2JPvJUT2DgXsYWB6Yt0VoGHH8F1NM0JhtnxhErTCbLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d8c2e194-be59-f7d7-fcc6-9ef7a06ffd1c@suse.com>
Date: Fri, 8 Apr 2022 11:10:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v6 5/6] arm/dom0less: assign dom0less guests to cpupools
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>, Juergen Gross <jgross@suse.com>
CC: bertrand.marquis@arm.com, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220408084517.33082-1-luca.fancellu@arm.com>
 <20220408084517.33082-6-luca.fancellu@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220408084517.33082-6-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8P251CA0003.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:2f2::23) To AS8PR04MB8609.eurprd04.prod.outlook.com
 (2603:10a6:20b:424::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2be6de99-7f6b-4547-f9b7-08da193fad01
X-MS-TrafficTypeDiagnostic: AM7PR04MB6775:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM7PR04MB67750732BB8FCDB370632143B3E99@AM7PR04MB6775.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bxj3GZ3X1/AD86qLvEQk7CfOexGqZRoeZCc+0B451oHxUb172WsBCq6LqcWgasYe3g0rmHn4fUW0ULVffVk/Yf1k2Fupsa0Ia962phC0zw++6AIY1Vrv9UDCQRjYkZI24R4i8OyumHqZ5KcAscanF2KWUsXEbgTXvwus6JDOnXg1LOlt6ZAHPXeai2so4YAbQv4FI/fu1BjYwpRlY6wwiRA/Ypg+ZuAxMK24bAwNS6i80PgA9Fy37RorTnVrWqjYu1g+xB1k6XEyB4yTkg9rYIab1Z1Xhco9CLqJCsE4dFQLsSjijcttjuS+PIpBDZV2Sm8NW2wMYQkU6beAjloNJzPPTNkVRxZV8p6VrqT80EySHtxSYb9RiKo2ca7KCVqRuc56jHmdROzEqWxKd3F/XAoW4MgWfeEAxTwwNVEXMivL9f0cj5iAvphUGGLUDgmml2e4JJiqw1bmSarPKD9MMKqpqZhljNOw8xsMcDUF02xXycts7vXAtEhHcBRbcMg5rmKWL98HnwAgHarilkiY8wS8ciCqAEtAvN8QZDjaEwOV0l6vT57QJfMl8/FdMbSGuUl7SMXCAZUSQO5LW6ruVbLZFKrg3LH+kbjt6p0V32sZ0nOd3HkRnMVj6RhbN3JGWsXy438nKqiTgLhRidKrw1YsVfHteKLx9bYiw+LuHG5n+hYuA9Q0Fyw/ngVl6owjJgayjFGvSKFQ1pz0/YQIS64SzHDIrf06KszvLtbwhkxtgUCa5Vzk/dc3xIwrg00Xvh1yNuvV6CtSUmBRJGtZaA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8609.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(53546011)(2616005)(6506007)(8676002)(6512007)(86362001)(36756003)(8936002)(2906002)(5660300002)(7416002)(4744005)(31686004)(31696002)(66476007)(66556008)(6636002)(38100700002)(4326008)(66946007)(26005)(83380400001)(66574015)(186003)(316002)(110136005)(508600001)(6486002)(54906003)(32563001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?a+x29x3fk7Wl6lG9U8zHYi4CHFNqhcP0P1ZvZv9NaUfAiOIWb1pGi1mMOjsG?=
 =?us-ascii?Q?Z/8ef5vAryRgQIv9xvgTxxISl+yvokisYoLpJGIDN9HgWeAyQL3hGKHH4TRe?=
 =?us-ascii?Q?5vahsNe2fzBjcy7PKbJeGmkqzr+8GuZiY5ktWYhYQBrb3bpuWrBCJ2TOVv4G?=
 =?us-ascii?Q?t90tPG+rfdGREe4TcPNR54bcq4TacSVvBzb5fHZVr4b4iZ1F72ZlrFuabTkF?=
 =?us-ascii?Q?oARjN+ee5xgRAkiYQoIz6mhlRairnC4DZgUTXmg5LnQoq280IZVcBK8yza9/?=
 =?us-ascii?Q?KNN1in3c0+ccAY4AgY01NJ8CwQYH0dSj60WrA01ncOqBcfoTgTl9N8evVUuB?=
 =?us-ascii?Q?vQsHJBbjm9t5DqSlCzjm3LWc+GH3wPwAQgaZ3qlbNZKCpoV8cNQrFNtJnA45?=
 =?us-ascii?Q?qNc7gHCv9LNgMG+1DI6rI31+Tdz3/Be04iba/7qI/MRLgxV2BdWj2IBhQbGT?=
 =?us-ascii?Q?ZmC4GmprLB+v82A8QAV2cVatJae0s3OrhFX+26MuBMgGRZZ+TwRnOk7nMCrQ?=
 =?us-ascii?Q?TVdKgg4PeMfyx/xUiDlNEWbP2o2UHp3ityv1qjVeQ6MJoZ2oeSg0PSTa+MJa?=
 =?us-ascii?Q?phyjmfR0WkLXoAmvP9CDpGxIMX2/pRqjuciRQzz75VF9Nj6a1YBXqpxz3vF9?=
 =?us-ascii?Q?OhpRUdklhEtCvHutUL4N6CSHciFqFkex2d+tK6A0oiUELHEhbJDPLAPVYtoz?=
 =?us-ascii?Q?AG/8nSBnDbsxuJyJSgyoHRxC3xurIbj2ujOX30L7iRatWbyxQcB/osA9VtnC?=
 =?us-ascii?Q?rI0y4PrjANJ/jUAR2MsWoZa/wK34bb4LostSqI8U3JgXMJyUri8+dAu6kV2D?=
 =?us-ascii?Q?Gfks2D0EOGAqIh5lWBP/VHZ5HS6ZQ1my+CZ5jrsf4euXa41+SeohBgsO9sHi?=
 =?us-ascii?Q?eQwrYc61tAq4vnSECuMZ/gXm1fO+xktGCV3hj53pXYLw0ytFeZwnDJ+ORQ/O?=
 =?us-ascii?Q?/Jv/vx5z4BI1sHbfuFG0gKBxXTMg7t7XrUP1wZTdJPvMS39DDCdUmOiak5sJ?=
 =?us-ascii?Q?DWhkDtNZgA8T03/RRUQOBBIGcn/44VFrogj/SutyTFOHfwDHeic7Yw7n4ljC?=
 =?us-ascii?Q?0Qkt9ZnBfAjN0yqJIcBD3RWLInHc869ftyjJUdr2x+5CZFCsH5YfB8wwTrm6?=
 =?us-ascii?Q?EkbE0bvoevQXwnCrqtJCdB9Pc5qfR/Nkj21LybOiD2o4H7Vqi+yMd15m7IX+?=
 =?us-ascii?Q?N3HioYQ6LfZRb7EHG10GVCI59G8Jo7XJ32Ozv+9mT13l8pyTNwFYjd9S1Nix?=
 =?us-ascii?Q?woQKm3NVcSeD8drTwQPWiAi8WyK0B/8hVfBf+sN6HWvHZp5GXCOIelOk1UHg?=
 =?us-ascii?Q?cP8O8kSkaxoYkHGN/tzZhuhEh2CRHbXURAsL+M4PmhFz+CZbuZRiFZUArV90?=
 =?us-ascii?Q?tLTSK/aYyTJOEuSUn+2qB/VxSz4jiMbeaacLpziP0/oAlRWfaH/yZbhuHWp2?=
 =?us-ascii?Q?5IU5AsKzsGxDddLg9IgNlaQ5lFY7U9nOCa11M6Eh7hGC9gYRQyFaIs9tc2mR?=
 =?us-ascii?Q?uKVygHAyxNqZf5Fjm2AJYzQgGyvUwNH8uI8yZyZJJElfJQl5OCTXFrTJ3Ow3?=
 =?us-ascii?Q?RuKAGlmwHa+CCQtMgqHbV1u5XnC9aq3gMSfSccdTAjFJdI+uS1baRO09S6l2?=
 =?us-ascii?Q?0s52gCvhG4cgufE3ZpzMYqz8wybU8FPr33WmfEMpx5dPgD+OGgS9UEX50PvJ?=
 =?us-ascii?Q?Mghkt4ubECqbsELBfxWOQZ4k7RB8g1+w5VgUBkoD4+Vbxh1uhIJKt0Z3DQp4?=
 =?us-ascii?Q?bEROwUzmkA=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2be6de99-7f6b-4547-f9b7-08da193fad01
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8609.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 09:10:50.5067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DJyzxo52OHnSr5qkn2COfqHFtbXFJnvdyYFvTZPMvpW1zRiWipgVi6pa1Mh5MBDSqeSAepcnpbYFJ5Ukf1Pt2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6775

On 08.04.2022 10:45, Luca Fancellu wrote:
> @@ -106,6 +106,8 @@ struct xen_domctl_createdomain {
>      /* Per-vCPU buffer size in bytes.  0 to disable. */
>      uint32_t vmtrace_size;
> =20
> +    uint32_t cpupool_id;

This could do with a comment explaining default behavior. In particular
I wonder what 0 means: Looking at cpupool_destroy() I can't see that it
would be impossible to delete pool 0 (but there may of course be
reasons elsewhere, e.g. preventing pool 0 to ever go empty) - J=C3=BCrgen?
Yet if pool 0 can be removed, zero being passed in here should imo not
lead to failure of VM creation. Otoh I understand that this would
already happen ahead of your change, preventing of which would
apparently possible only via passing CPUPOOLID_NONE here.

Jan


