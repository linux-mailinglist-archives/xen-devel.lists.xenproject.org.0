Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6197E44E41C
	for <lists+xen-devel@lfdr.de>; Fri, 12 Nov 2021 10:47:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225024.388617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlT97-0003MR-8F; Fri, 12 Nov 2021 09:46:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225024.388617; Fri, 12 Nov 2021 09:46:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlT97-0003Jx-3q; Fri, 12 Nov 2021 09:46:57 +0000
Received: by outflank-mailman (input) for mailman id 225024;
 Fri, 12 Nov 2021 09:46:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gYwu=P7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mlT95-0003Jr-Ay
 for xen-devel@lists.xenproject.org; Fri, 12 Nov 2021 09:46:55 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 779a89a0-439d-11ec-9787-a32c541c8605;
 Fri, 12 Nov 2021 10:46:54 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2050.outbound.protection.outlook.com [104.47.9.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-20-sKdw9WNyNv2SroG1elaQMA-1; Fri, 12 Nov 2021 10:46:52 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3120.eurprd04.prod.outlook.com (2603:10a6:802:e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Fri, 12 Nov
 2021 09:46:50 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4669.016; Fri, 12 Nov 2021
 09:46:50 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0213.eurprd06.prod.outlook.com (2603:10a6:20b:45e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.25 via Frontend
 Transport; Fri, 12 Nov 2021 09:46:50 +0000
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
X-Inumbo-ID: 779a89a0-439d-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636710413;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=48yH4/SCz7rWlwlLK+WG4TE6XqWSTpORADhxBbOV7aY=;
	b=fkxSIePBM6uuegFLniVkmvrOe/Gm9dok2wNiJJgcNc11InMSOqy06wuI+uaAXIAxY5iWCI
	VOS9+p/E9P3ZnXHaD/q8HC3DCJgQVEOjM/fnvWNnFaksmigmliti31fvPteqCy/2sUIVof
	vxyCQfbegoPt3GQmk60qvy2RAUPokic=
X-MC-Unique: sKdw9WNyNv2SroG1elaQMA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fmi2Ks0grad4GAqNbIKNcnyqAhf0hPuzz5N2aJ0pMM5xd1LVvhiUyVRdvHBlL8XWoiGheedbVHM+8T1KdNIA+aw9paMHnNXIIfU28m+8KNX+iIt4gmKkpb5FW2dXAHySb9NZsq+W4mrN86rP6tjSEIDnu3wk8mPJ/IC3FF/C4UiTq0JQlN1F14KFZOas5hLaBNcZBU2NWsURq66a1IVMHWFfuy8HIGBeVlJ9ngNAdAb6uemjV2aqosRi+/65VmjvGbNCElBp1J+viuxpmxsiZHKZnLLaS70VaJryJjnwMFYPI5Ti2+o7vl6ENNWccL9Z/kicvJXaAib44dTdm5C5ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=48yH4/SCz7rWlwlLK+WG4TE6XqWSTpORADhxBbOV7aY=;
 b=JTlpK4ZYjhhe3Pdur1IHebWzyYQdGfrC8fJ5vc/z5/rlI2/CoFdM7Y7LsbWaqBt6iUvufsgs9duErVU9Cv+5QG9UwnUDp/jW2GY6O4e4lhTKF9LpJdofbXKmIo4s3/fksqK9Sglp+EfWyM21KKguDsKAyvq2kEv4GHdhV4IgM/CKLYc+zSOo7qNlX9P1eppU5I3RgAuvXwCfq1WsHcnG/CLW/NcsAFZQJWhOOM2RC5wDxHXfG5UaQ2+t8Wm13lQcjtS26hDfH4AtZm8IrKgRl+EROcePuI73muQ7G2UTZcFERW9STL4wtvgb+CYv/rH4sKYFoznxa9HvX0q/0UZ5ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a97adc3d-2808-1c87-8fd6-d6b24b83bd2b@suse.com>
Date: Fri, 12 Nov 2021 10:46:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/6] VT-d: domain ID mapping improvements
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0213.eurprd06.prod.outlook.com
 (2603:10a6:20b:45e::12) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8754ca6b-ee89-44a9-4ae4-08d9a5c159c9
X-MS-TrafficTypeDiagnostic: VI1PR04MB3120:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB312038FDBFC8F55A61867516B3959@VI1PR04MB3120.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	N7fbkD2OOWkNlIFgwBU+Qf8UeAOazuNL8iDAPa6Bvqwu+EtxQ/+V85Tfw5Z4MpGW3BKNAwCL0Ytz3h74xvbh8YL4Dfxol2BAmVY03h/QqafcJg/rjb2odiRaZaM4xpvRxL+K7jmnkK8RanWCMpYsZr7YABa2a3/f3RtL90nb4K7l/jA9++QNN4A0VwPYYWILEN1/eljKJo8G22Cbg3n9hRPI9WJ/nH85d0hNQbic48QctfN4YSovnzerep5cF4rC+yIsxooCzYHMiTjDcdeFUm4lAEV4bVx4h9jZPHBeXXvYLKT04qazBaQ1CU2AmWuEiBb6oodav4rHOJsCQOkIT3SgHK+bn5nq7rH/uxx+m/epfV7d6xZ0v8dVVWlWdaGD1e5H4gIsZRjQg4sTWEELZAQEnKGNC/C5+La+tkimo6zeVDJdSvwtcgunltT9XkN/G/J0uSApz6Tx3p4ZmnXk8XYkrv+bc7gxhsYWKd1jKXWWth7mrGBh+op/vUgNLdBlkeaMYPmFjrRAM2DYY8oa005ZL9ohN7IefRc2yjIbk7OoH2EKsyCai/TGIASo4fg8Q749aVL2T5JR/DzDlH0KSyAzMA+9HWgOAPRvm3rmaorwMeqgB1m9HctDqeNcjlSnXTNmNL3SKo2qN2XxqCm8DM86lfemfKJE1U/UXPtoNBj5FI99dTbIiUWBArPaLWY9rVJx/p1kAem0w/iUgqCJ9OpY7e8NHikhVK825UnHS9A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(31696002)(38100700002)(508600001)(186003)(4326008)(8676002)(5660300002)(66556008)(2906002)(16576012)(8936002)(956004)(2616005)(316002)(86362001)(66476007)(36756003)(66946007)(4744005)(6916009)(31686004)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eXIvYXh3NjArL3RTYzd2VVBZV25pVEFZOXpsVkVNNTJIdzB6NFEwTVN0M1Q2?=
 =?utf-8?B?bC9nV29FVEJadWpBcUhuQmRJS0JtS0VjdGxYZUk4TThRUWEzUW0yUHFmOWlz?=
 =?utf-8?B?NjVMUnVLanhYbWFnVWFLRUIxbzRndHVzRzJtU0lTbndjOVZaT0tEUTd4U0lG?=
 =?utf-8?B?UDBvUERHS3pHRmhnZG91MTZRdnIzWDZkSWhXY1ZVeGVlNDl6WTJCdzlkMlVL?=
 =?utf-8?B?b2l1QkhZWDBuZnRhSmljeVJ3TWdWOHYzUjNaSSs5K1ZtSTQ5d3pyVTlmVmkw?=
 =?utf-8?B?d24rV1FaWHNWa0FzcXNnRnhzc0hvV3NuQVFESGRQUG8yR3NFcjBVVE9CR2c0?=
 =?utf-8?B?NnBuU0VYWWtLQU8zalk1UzN5Z01hYTdWbEZvSUxVWWludVRRZmRremNuWXV5?=
 =?utf-8?B?SzRZNGUxckNxb1Yzdm1pa1lnK3BHOGhBVnZpQ2tLQ0JsN0RKNlNZNGpkR05S?=
 =?utf-8?B?WFh1OUxhM1psWnpGb0J4WHNuNk41bzlCOEZEZkQ3dDVTRWtKcW5CUUttd0VD?=
 =?utf-8?B?ekFUWGdkNHJDRzA0VXp0OEYzK0h3MUpPa1lpbUFycDViOVFNZzNiSDVHWXky?=
 =?utf-8?B?R0c2bHp6Vkd3ZWxaVmFMc3kwTG5LdlY1N21pVTR1MDl5eUtPL3FXZUV6SlFj?=
 =?utf-8?B?Q0xEOXhENnZ3dFFCZVJDc3B6NkFuMzY0UmNGSWdkZk5BR2UwbHRveCt6aFJF?=
 =?utf-8?B?cHJTdzdtbFVldmdKU0sreVFFME1VWHpvSm5vM1ZaOEEvK1NDMHhKYXVPQ2Uz?=
 =?utf-8?B?MGpzRlI0ZjhKaDZDR1gwbEI4NklEeEZieUg4U2JsNkdDcjlnNUlXaG1iSmVT?=
 =?utf-8?B?SVFBTjhLUjBwclk0eFo2U2IzTVJONGg4bm5wS1hiZzU5aURMMkFybVh6RmtD?=
 =?utf-8?B?RGlmUnduZTJ1RlVoRVg5bmw3WGpDOWRjeGpDOEJTaUdyNFFnSU1IaC9CVmNH?=
 =?utf-8?B?OW0zdHFEa0pUN1Q0NjFLbVdmcHkrUEpMZ1NlVTI0NWNtSDRzRmQ4dnZHQXlv?=
 =?utf-8?B?cGNidUQvMXZYOFJGLy9KZTducEZYZFk0TFFPN0RQTFM3MHpZY3Z1Q0VaTEFX?=
 =?utf-8?B?SGppYTBUU203SFpKSVE4NHRYTUJPSmhFOWFrdEo1Z2JDTEJIS05hVFFOZW12?=
 =?utf-8?B?OTRRM2NmQUM3dGpBR3c5Z2Z6U1h3T3c1cVJaU2NBcUsxSmlFRGRmU1M4WkVm?=
 =?utf-8?B?aTRzdGJla0tSVEVVSHNYUkNMQ0tad3A0cTlUa2F3RW4wZExKbnBocWFJVExJ?=
 =?utf-8?B?YUtGMlFmTTU1aDdzY0JzSHo2a1cxdzlKcmxYNGJaU2pCbkFzSFFWN2pzWWxD?=
 =?utf-8?B?QVdZc3d2Sjh3K3lrc3dGY004UExMdysrUXVwUUNJN0FuWjFTQUhSMkN2NkpO?=
 =?utf-8?B?WGpDbXdLM0xzekQwZ2hldzFsTWkxSUIwY0RYK1l0NXo2Q0tkMzdWd09Bb3By?=
 =?utf-8?B?a1hnYVZ4VXVsVTEyUm9sR1pQVWJldVJla0c2VnE4UDZIWU5aeDlnaWh3Rnc5?=
 =?utf-8?B?Q1ROdUdBNEl4Y2gySnpYMDBzUVNBOTBEVGR5cjRETWpXaWJ1S1ExQTZhRFhw?=
 =?utf-8?B?L0hLTzQ2Kzk0VDVPUzlCaGhDWkF3bGZ6ZHJkUjZCNlNsNTdFdFFkaGxFS1JZ?=
 =?utf-8?B?RmdaSEFSdnZzV2FrNE1iMnNaRHR3aVo3N2tSZk1jL0srNk1oK2N5SCtUMEVr?=
 =?utf-8?B?RnNpNlNNeWxHYlI5ejVOb0NXWTMwazRTU3labDNzcmw3cjh0TTVSRFFGTW1o?=
 =?utf-8?B?cENsVGV6aldlZ0tGV09ERVVsUysvQjV4bXlSOXFVQ2xQWTNjUDNiSlJ6bUpw?=
 =?utf-8?B?ekliU1dXdmpZUG5BNUFQQlRrVnhqcWtCVm1OMkVBSEhPMDFlOVdvaVpsUEpL?=
 =?utf-8?B?TFZlb3lRQnB0VC9Ed1Q0d0NOZ0t0NVJnTFZRR2o5TG5HTVV1UFN6TFdQbXp5?=
 =?utf-8?B?V0N6WFJRd3lwRzlCMW1jd2pkZERjUzJmQ3NUTXI4cGpSd3lzL0ZiZFhYaUJH?=
 =?utf-8?B?K0w2RXdDS3NvTDE2ZzR2bTNwRStyYWQzd2w0RmsyRTUyQWpvOGhreDNUc2ZG?=
 =?utf-8?B?aEpIaWZ2TDFsT2JkVTFteVNDNFdsSWd3ME14c0hNL3h4M0ozMHIzRGlock1I?=
 =?utf-8?B?NjdLZFgrNXBkM01FTUFhUWIzWFVTam54SVB5VVBvbXRpTGVBenJ4TmF4dnR0?=
 =?utf-8?Q?Zk67BCvPqxYohMUSoC9TyUQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8754ca6b-ee89-44a9-4ae4-08d9a5c159c9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2021 09:46:50.4990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kJyWEXyabamzS/o4U4+GXUiTBUllxcrFwFxWTs/9I0C3A+PCYW51a2cFReYgBangPeW6M7WsYS3tgq/WJcmmMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3120

Two bug fixes, some cleanup, and a simplification for modern hardware.

1: properly reserve DID 0 for caching mode IOMMUs
2: split domid map cleanup check into a function
3: don't leak domid mapping on error path
4: tidy domid map handling
5: introduce helper to convert DID to domid_t
6: avoid allocating domid_{bit,}map[] when possible

This depends on the previously submitted (and already approved, except
for a possible release ack) "VT-d: per-domain IOMMU bitmap needs to
have dynamic size".

Jan


