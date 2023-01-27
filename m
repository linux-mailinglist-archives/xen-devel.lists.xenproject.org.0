Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A26167DE9F
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 08:38:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485329.752473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLJJZ-0008Sz-0v; Fri, 27 Jan 2023 07:38:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485329.752473; Fri, 27 Jan 2023 07:38:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLJJY-0008QJ-Ta; Fri, 27 Jan 2023 07:38:24 +0000
Received: by outflank-mailman (input) for mailman id 485329;
 Fri, 27 Jan 2023 07:38:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N8iV=5Y=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pLJJY-0008QD-6c
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 07:38:24 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2042.outbound.protection.outlook.com [40.107.8.42])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 931a776e-9e15-11ed-b8d1-410ff93cb8f0;
 Fri, 27 Jan 2023 08:38:22 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by GV1PR04MB9151.eurprd04.prod.outlook.com (2603:10a6:150:26::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Fri, 27 Jan
 2023 07:38:19 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6043.022; Fri, 27 Jan 2023
 07:38:19 +0000
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
X-Inumbo-ID: 931a776e-9e15-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GiVZTLmQ2r5w7tItkwTeeCvNU2Rkpg6tPZ/4aWKLfBlbdXHrFClYnqpAf123s1ewXt2owOXqKeu60sv4XJlgOTvttHXi45O7TJCyu7wQMwFVRBvPxejfB7/7Dy4omLjbQ4x0ngmDxZ7Q98tlNu4QaXdTof9fua1rqE0BmIY7QAePFUFVH3I/m3nLl74efwEflp5qrOl6fsqpRu1u1GP7ypQyOWIqMnU9uamQL/2bI1frxjRTAaIQH7PYqiHGVG7lay8PPkRF5Sb0cs2sMf2bI/nKKsvgzJ6W/frzwMctsY1xBSPLnAovEhKO/0jQ+ZQwBz4QxFt7GFo/nwsi6fTQWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z8t9bFBJRxiZyuwbPCM+0ENqAXQjTS1a8sn/vV2zYRw=;
 b=iae+yINI3JCYGQewehKXA3V5aZF++55ZYq5erY9cwpR145MHsfovJIAosfnxaO9sr/ODG4MASgsqa7tvgacKei628pcOflzsnd5lV3OJ5ciZ0rUSvuq7fUcG6TVXxJsjJVlNHNQwjLVv2JDOcqEvOoTd+KeMrBbBlwdNMY21Ik+8uoZl1C9CvhE9xklniLnFsT9pRYXVxenxoL0OaUv7wb3rOsSFZJKIegadekPSg/NotUxhimpWriR8CMjNDeC52ii1g3vPcBh06cwIxgut9cyo/CAXLtqoxh9rLqUWR89NTew5trs9kkG16m4UCxZTGEYDW1YTk8fARu8YyGOlxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z8t9bFBJRxiZyuwbPCM+0ENqAXQjTS1a8sn/vV2zYRw=;
 b=mSMMc3yctLkyfavNSd7xEm/dTRyrmV42wRhi2WRpQ2ZtSLHCvsH1DvAI6izaX/EDkWeRtAJKHbBKQXYuXKqhqauKPNkUmgyULcT2YcLo6RK55lDUcrAzpQC8o3grBsle5ySC5iTI68jDsVs2joCNR3PgJyRFxRIANqvTeL73G6Vg3/l/U4wuC0uZ2lKfZ2lnQyE077fO0Hsn5OWnuCDZnksP9XdgMPmf6iG8ShUkUzwdLkQZqlK5nPKwbUVk6bu6NZBQZ3JgzfjEGVw5KMebM1dc9nJ+pvKlSgLVbWoqJ0afJZm0o0vSrJxb6i9rbaRpEDgSWeI6DHZmazYxE1vpEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <db97da84-5f23-e7ed-119b-74aed02fb573@suse.com>
Date: Fri, 27 Jan 2023 08:38:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] Add more rules to docs/misra/rules.rst
Content-Language: en-US
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, george.dunlap@citrix.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Bertrand.Marquis@arm.com,
 julien@xen.org, xen-devel@lists.xenproject.org
References: <20230125205735.2662514-1-sstabellini@kernel.org>
 <9d536cec-726d-4a39-da36-ecc19d35d420@suse.com>
 <alpine.DEB.2.22.394.2301260749150.1978264@ubuntu-linux-20-04-desktop>
 <5a3ef92e-281f-e337-1a3e-aa4c6825d964@suse.com>
 <alpine.DEB.2.22.394.2301261041440.1978264@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2301261041440.1978264@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0143.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|GV1PR04MB9151:EE_
X-MS-Office365-Filtering-Correlation-Id: 3de67a69-24f1-47a1-083b-08db003975c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qSKeY0BHhRQWp7CeXEte3EhBqKhvtnGEyWeNzk9i0UXzn4h0CtaIFvtUNwrgI6MXz1jL6b0I99iidN+Ngwwl5R2zqOEbCuDuRxdlf5YnlWMz2oP1Th9tHJZtp3XD74ahduRrTRYgULvb4z0CFJMJtynUHYuNmqnDd1t5thuVA7QhFztFepG5z5MKtKvZgN2JS0nBbS+qi3HVuSedzKN4R1orOY3aOQUjR+oqgnwux1/fd2s6Yo2gMuR+rYrCcpMSfZEI20PeUnzWTjiTlUUQ+P2iADLp8+zFX8Du+qPx2bCSFxMZq9ENnO9In08iZnTkK4POe3PQW8KZYjVJQV5lpbJVD8m8bA0HaLkHfE33Y5Ze6YZ2WE/x9No/m8VFMBcINetJqw0hWd/y9YI89BLIuRKmG00tX59vy7biJm3Yzh9xuQWdRQPrb42CXCS8JWGgVNfjf2y8Dx9eH/cVZE0i32WMdSnz/jCOhLaus0VrOpQ577wJk5XYAzhfalHkg2k+5PG/Ik2k17K/P+dL9PbLiCC0PeId1td1p9ftlGPIWRys3AvjVxzAbe49OhL+nXeTx6Uk/xj98t4pBMHMU0iVq/upWaRCiVv/1TaX1as7MJA2y8C7zPTKSDJuIfzsYT+irXYUrRWD8HGtncAlvy54WtiRtjhg4xJp4crS6INcgVuJyX6vhOqy1pf/kv9D7OaKxFWMdSh/ftWWBEAoG4yas0KtGvUBBNXJ115bV48Jb40=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(366004)(39860400002)(396003)(136003)(346002)(451199018)(478600001)(186003)(6506007)(53546011)(6512007)(36756003)(26005)(31686004)(6916009)(2616005)(38100700002)(86362001)(31696002)(8936002)(8676002)(83380400001)(5660300002)(2906002)(6486002)(4326008)(316002)(41300700001)(66556008)(66946007)(66476007)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVF6VXQxSllUNkRZN1phMXI2T3A3eUJFMnlFMVkyc0NLYmVEOUNKKzdaNHhz?=
 =?utf-8?B?bXFvMVpwWU9Db2djMmkvQWwwNDJGRi9va2NUNDhjdG5CWEw3SFByL2psUGxE?=
 =?utf-8?B?OEtTenNManZKMkIrOXlMQzFVOWJrZG0vVHFDR1VUV25YMkk3MjBXSTAwRzAr?=
 =?utf-8?B?bFBLVEN0UENJYWh3UFRIak52S0UxVzVQZlJoZkVsTSt1cnptbGMvL0hhcDZG?=
 =?utf-8?B?VE1iK0dLYUh2UkdCa3BnaWJLSVM1SnUrQzExTTB6enpkMEFCR0dKTlhFV0or?=
 =?utf-8?B?cDZRQjllbHJBRVpNY2dWOVdYM1dJTkFySUxidXc0Ri9uakxsSnpIZkRyUGJ1?=
 =?utf-8?B?SlNWaUQvbitXSHpTaXVsOGhMZzBjZjdUK0F4MFBXdU5LTnFucjlFdGc2THM1?=
 =?utf-8?B?eWRuQlcyenZCaitFSjZpMFg3cVN5b0xwVCtsUm5MWjZjUnlqTnVnWnVZZCsw?=
 =?utf-8?B?WStBRHdTUml6ajFxenhsa2NmRE5YbCtGVTEycmI0NC9rMGdqajhXd1JrNGVL?=
 =?utf-8?B?dVlNMjJla3RZYXVFWXlqZURFRTdadFhsN1NJM1NML0VQbGNzU0pqT3ViYzRk?=
 =?utf-8?B?YVRKaWtybzA1QjB2YXNHQ3lDU0RmNEkxM1VFNUlJdHNFYi9vMytIck1MZnp4?=
 =?utf-8?B?enhTWmlOSFM1azZVREswR0FOOWFIUkRwekJVNkgxYWk1S3FpOGQ5bUNHbHV5?=
 =?utf-8?B?NWcwWjRoVWswMUJTU2RQU01IZEl4dm95cmJxSm9ZZ3dlL0sxbUJIc0I5dTVq?=
 =?utf-8?B?N3ErVXBpd01Xekx5Wkg5ZXNGeWRwUGhqS1ZnRllOcnk4MVA5RG11ajNWdXlX?=
 =?utf-8?B?aEV0SGt1cy9ITGRrdGNNSGxPckNjUnZqMWpVV01ZRGhraUFmQUhTRUVsKzNW?=
 =?utf-8?B?V2c5VjZHUytGUjhtK0h1dERBamZPWlc2bFBRNExIMmkrbmwwN1cvSmI5cVYw?=
 =?utf-8?B?eGpEQXlCNE1TUCtBME9CY3kyRW84TkxabUYwb3YweCsrZll4YXRPQjAzV3hS?=
 =?utf-8?B?dTJ1L0xaeE1JeHh1QjZHbXI4d3MveHc0OXV1YmUzU1pzeWYvb2hpZlJ2WFVJ?=
 =?utf-8?B?SzZJZEROMEc2Y0F4WFhTMjE1SU90VXU4RHZNNmlySE1tNkI0WUhON3lMRnJS?=
 =?utf-8?B?MFNkcEpHRlZkWGVrMDczdDdEa25sOXJxUEZqYTVjSEp0U243UGdLeEZDalk2?=
 =?utf-8?B?dU1uUDV6bzNxQ3FOYXFzNFdnYis4UFBpam5qTHRwNFZMRHpONmhOWGJMVzM3?=
 =?utf-8?B?blVZYkZYT3pNaDVhT2s1cFZHdTRkODNvbE1UbVlJM0kweWNlUjgvZHI5QVcz?=
 =?utf-8?B?QW4wMjBWbE9IWDNpa3FFOXBNdGxrNElqUjQ0Smx3SzYvcGJxQWI1WTA1b3VP?=
 =?utf-8?B?MUxUUjROUi9iSGF5UjBUdXlNUUVWeHlTMmk0ZkV6UmF0aHhHZ2FhaTNjblVU?=
 =?utf-8?B?YWFETkVnZ1JJdHRPc2JkK1JzS21GWWpSNTFNQU0vbVB3clBBalFVOTNYR2xp?=
 =?utf-8?B?UWJyME9uSGc4YXdScGplQXdGYjA0Q1h2Vys4NkI5YTMxS25tNVN1MWNJMTUz?=
 =?utf-8?B?L3JZVWYzRTZ2Uk1TVTlmcm5SaExpLzJFM1RYUXV0ZElHMUhPdHRGVHI2RjRu?=
 =?utf-8?B?aWFYWGVuRDc3dXpxSTFoL1pJaVpXNFFkSnBqUnNURnUvZE14RzBOQ1hsV2l2?=
 =?utf-8?B?eWZqQjg5SjlOcWVYWTBiQ1g0L1k4YisrQUg2SzVUUVEvL05YQU02S1JWeExi?=
 =?utf-8?B?eUtRckU5d3lvKzNGajVLV3ZxY0ZnSzA4c1BRS2JxbDBGdmdMT0ZJZ0tQNjBu?=
 =?utf-8?B?VTJKczNCYU1FVVg3NmRBWE5Qemg3azh2SmhnaSs3b0pqMVlsNjBHOE1Ra1Nl?=
 =?utf-8?B?eWpUZ2hYRlBPTSs2TVpGeFJnY0pYZDlvTXhTeFJXRHpuSjIvYndoL24yTlYr?=
 =?utf-8?B?eVp0bzJTYWl3T0tneExWc1FrQkx4QmtzV0dQU2pLM2hsbmZUSVMybldWLytO?=
 =?utf-8?B?N3g2ZVZ1WHFRRHRCVUtPdmZ5a0xYS3h0WVBTeWRBR1lTNnZ1SDQvaHdHWlhU?=
 =?utf-8?B?b2lsNVBmRVFxODlyUUc5WkY2a0hHOWFsWVJMNEJYbEFqS0Z3WnBSZXpzVlY5?=
 =?utf-8?Q?uwl4LrbaBNxz01KxmnCoRADYY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3de67a69-24f1-47a1-083b-08db003975c2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 07:38:19.3562
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i19NGQ6oSGTeKNsiDct0srBsm/n0jU8Mpiee4y6HjIfD6Fg7DJym7QQ686W9vl+FHDZCqOxEsA8pMK95bOYr4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9151

On 26.01.2023 19:54, Stefano Stabellini wrote:
> Coming back to 18.2: it makes sense for Xen and the scanners today work
> well with this rule, so I think we are fine.

I disagree. Looking back at the sheet, it says "rule already followed by
the community in most cases" which I assume was based on there being
only very few violations that are presently reported. Now we've found
the frame_table[] issue, I'm inclined to say that the statement was put
there by mistake (due to that oversight).

Furthermore I notice that I had put a reference to 18.1 there. And indeed
I (continue to) think that the two can only sensibly be accepted together.
One might consider 18.3 in the same group actually (I have a similar note
there referring to 18.1), but luckily we look to not have a lot of issues
there, so accepting that ahead of time was hopefully okay.

Jan

