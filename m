Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA3C7844C9
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 16:55:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588548.920073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYSmo-0008Sj-RB; Tue, 22 Aug 2023 14:55:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588548.920073; Tue, 22 Aug 2023 14:55:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYSmo-0008QP-O9; Tue, 22 Aug 2023 14:55:14 +0000
Received: by outflank-mailman (input) for mailman id 588548;
 Tue, 22 Aug 2023 14:55:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MJFy=EH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qYSmn-0008QI-Fq
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 14:55:13 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2072.outbound.protection.outlook.com [40.107.13.72])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e5126ea5-40fb-11ee-8782-cb3800f73035;
 Tue, 22 Aug 2023 16:55:12 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by AS8PR04MB7959.eurprd04.prod.outlook.com (2603:10a6:20b:289::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 14:54:42 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d%5]) with mapi id 15.20.6678.031; Tue, 22 Aug 2023
 14:54:42 +0000
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
X-Inumbo-ID: e5126ea5-40fb-11ee-8782-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n6tVTRkgkqNvH5j4O8b8NUIKooml1abV3VSEFHalrTW/yASMn2g6qi//1li1XyZsfRYKMBnXXAcChvjnOaexjyf4K6Mc0nh3VOrXYJwTNi4dOzf/TuZW9W8xXsXCktjmPiE0Pl54xpiiY5b3h0rvlb8IhhO+Uazfy3s8szUdjkMaVzXJEhr/7VUyOMFeGh8IFqgDXK427gkgh7b9/Qk7xYsK3WRXANhCnR2wZd8nCtnPOhhglpAJZRJg/MS/tqN0HFfoXTPG7IxBNOeLH1hHFygmqit2OeD+QSr+bnkXVqtHWvZEsI+YH5+Ru06RP9P1OIqKeLlFPFwnoEdR82ul4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CIfo4HV8aFKQpwe/tio0Wh8AgzZFvgpGq+yW8M32Un4=;
 b=MBb68NNQqECIJeBFK3Lvp7MX3oTnZQhexjJj5QxVvcPuu2tMIC/GZf7eKFG+inrni9PP2yRQsP9G7WKONMlQTL7KnJXLnJr0Hys3XLp0h2kSPfS3g5evR62zjaZu9lDlOXgtu2PcJfjmVyyD1FuxB+uteJfwtTrzfWleK3GJAaiEMWGzk3Ck1Ba6mWVYF6qWe09U67aBpNmIWwKkNbEjPbc6cqbh9QPOIFJ+rcXR492FcR8IOg0BW70sAsGLGyOz7HKPgqVKcjGIvA6hSJMhtopWnnTAdzAQvnE3Cux0t+3Wn3mG9inJ9RgTPIqITPtLHcw887ZriJ+mRDry/sNtqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CIfo4HV8aFKQpwe/tio0Wh8AgzZFvgpGq+yW8M32Un4=;
 b=Vzqh0C2kVvnJWZs9kPqdMf3VZImyBLwvqivyw82JDz/+ItPvNBj4VWTnFCByyos2eMRZ2cX0i/K0rg4il5eYI68Zz56R47Q8wninppreaqFUnLj0Rvm9Ovq8NNb0aEIYj9KK6TNrPzr3Zi/R/pNVj0VT1XyOR40DJ/XJQqgHVy+VK2Wu5FGySP1wPbuP4PzRiHa2upcKb7TA/ShKpu1cQLnTTp60HHsFT4tFzodMsPlll3C1jxcpHOra/hJWru2NcPRKCTUCpesNTxPGs5kgOtSUikoSBxmuKYCkgHFj9sM6BGottYpylvXtK5DvB29qbY7sz7V291qmFYpFj2N4LQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a99eb8b6-2e3b-d216-f85b-272161e79185@suse.com>
Date: Tue, 22 Aug 2023 16:54:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 1/5] x86: Fix calculation of %dr6/7 reserved bits
Content-Language: en-US
To: Jinoh Kang <jinoh.kang.kr@gmail.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <5fa229fc-9514-abc6-5e72-2447a2c637d0@gmail.com>
 <eb2a3feb-b226-0d90-51e8-c541b5e2dfd8@gmail.com>
 <dcd6a5db-239a-9ade-0236-be91744e3b98@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <dcd6a5db-239a-9ade-0236-be91744e3b98@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0101.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::19) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|AS8PR04MB7959:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fbe0453-05bf-4d85-b3ca-08dba31fb7aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0kq7dYPL3aWgr46CNfNnpoIxczVeBeRZ3WCF5A43Zf5ZBcEmxsS3SH9e17V2hJ+D3jM2YOqBmedKN7GKbDKD0/llD1II94wKYw3drJ38TMX/OMAlu5OonTXhEKBrS/Ki8Kpj9i0HEeGqYneQe/qrf3uGmYpUCIJAkSBfQJX4pDALh7v8VZdcZ5qgn+f3n7QDiNhWRfa0RP2xUc4azy8947Qfw2Os7bBiCXKksxf5X06ZyQItNUCxyOioXzgc4W6BLc2GxKf1yPmJVZWRUh16hxH1FTB1POsthF8peET3XQbEpWwmANTGQOxLVuom4cxfYlwjkOHzTurHsJouWRAvC9jnG/cN4EPuuum0+DVFFAU3SU+l0O/29YcCHk0I1euLb50b9CyUfIQCbuN8L1+EsIX/z4mP7zwkS7NjVjYa/Y3PUwOFhZWlWz0sQkCV/N0tIK5r7BSxtuSgkLHl30deFbaRqe8gW6I20kA1ZmDngCK1einr5eSz/oqdTu2wPPriPJmxoFw1oz/hdzpPlQHNUTCpOeKaO8eetYy2OLCaP5U2jbsDfIaZe9jls8bQdoo4abHDuutFhbMSQP39iC70lfXcHg4orDb+Fy1koj+Uz3c7OPfquNkfA5RFRQEj/Oy0OZe0OMOzxdETczuZp+DaaQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(376002)(39860400002)(346002)(366004)(1800799009)(186009)(451199024)(54906003)(6916009)(66476007)(66556008)(6512007)(316002)(66946007)(8676002)(8936002)(2616005)(4326008)(36756003)(41300700001)(478600001)(38100700002)(6486002)(53546011)(6506007)(83380400001)(4744005)(2906002)(31686004)(31696002)(86362001)(5660300002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eTUyQXlEaXJhdTl4ZkhMeGxuRUFQdDV6QmZ3Z0pPbjI3Wkt2OXdaWUprS21x?=
 =?utf-8?B?MHJMcWVWQTVxUStTNy9kZGtyNEF1NXhJZ1U3YVJZa0tLUnM4Q1R4dG4yYlBN?=
 =?utf-8?B?amluRENtZWttcVJzNUUxSDJYYlE5WlQwQmdtbzJYM25YTVo0OXdPOXg5RXVO?=
 =?utf-8?B?YzRFWDZHYTZjZm9UbmpjU3lESHdMUmVCZEpQeG1WMWFrRXFWUlMxcGFyRFBE?=
 =?utf-8?B?ZGhCOCs4N1RSRmxZNVk4KzdPZHM1OVZJZnJLRWRSL1hWVEpvUTJndmd6MnR3?=
 =?utf-8?B?eFUxZnNMay9YWGpQcVpZVUlNbGUwM3NkcnJvUkNkQ1dGQ0E0N2hnYU44WkVx?=
 =?utf-8?B?MjZoMUFMbU9XUFU5SFVNM2dCTjV4NXRnb09aRlhYbUtCcExhZ0RlbG1QcHh1?=
 =?utf-8?B?d0JsR3hxTG81cUdhUFNGZUVmZFVZc21tUTVLbnZxaWJEVGlpK2NXaUprVzJs?=
 =?utf-8?B?V0Vwb3VFL0ZsTEI0d29IdXhNNG92K1doNGJxN1VqZkMzWVBlWWswV0ZvUmFX?=
 =?utf-8?B?RjByVVFRV0ZHNlZ2QzU1N1BwUGxrdU5iOVQ2bUtuSHhIdGt2QTcrMm1xL3pi?=
 =?utf-8?B?K0tYVC9MOVpYbUhHTGJTSUl0WmZYMWZMYzdodEJNQzlXZGdEVTdVeVRkc3NK?=
 =?utf-8?B?SlVTQ0hVUGF3N1RSOWgxQTgwWVFYdlU3ZmYzUllVRkI3U0tET3RoTzhwbXQ3?=
 =?utf-8?B?b0FzZFBvZERLdnZ6THZMYmh4cHFWWnVQSnM1anJhOEFRVlpmamExTjA4dzFE?=
 =?utf-8?B?MU1naThkTHhjYjU2TGs0VUdlZXRvc2hUd3dwSER6UEYwRHBZZGJ6R2k5clpr?=
 =?utf-8?B?V0FMMWV4MTMrbHgrL2YyckRSL3E1RlVFUTVwbjJ4OS8vdldNbng5bUNNK3Ux?=
 =?utf-8?B?S1VMdWx4dkRrZ3REaCtldE5TVzlqSTcvbnlGb0Y2UWwya2VQVG0xenNWeFI0?=
 =?utf-8?B?UGtUbTFPNjQzbXhLdC9MTTV1Z1dYTGRBS0UwQUs2cXhBTVpjUFAzS1RJM3pp?=
 =?utf-8?B?RSt5ajE1aUlQcDlxRWl1RjI2dEt6WGhocURZSm9WbWpJSzQ1ZUdLK1N2NUR6?=
 =?utf-8?B?OTFZSGdGOU5yQTl0M2ozemdod1pCWmdSNyt0cnVoV05JTCtZdUxyUG9ISG5h?=
 =?utf-8?B?ZWdaV2lMY2lRZ1FLTDZySE4vNllzZ0FwUHRvcU5jb3RJbEZHbVQ5QWprTk9z?=
 =?utf-8?B?a2IwWVNuWVRpTVdSb1pTM041Qm9mb3dMS0g1WDdlVU95c1lhY0V0cE1lYzlS?=
 =?utf-8?B?RXhEVXI0c3czc1lZeG9DNFNHY0daRGcvVEdqbTNWWVVOSDVNV0Vtb1hraVdy?=
 =?utf-8?B?elFJOW5nbHpQQWhTb0t5S2pCZG1TZHp6YTh1c3N4WTRwR016UDBqMTdRblY0?=
 =?utf-8?B?cVo2bXdwSXIrd0NzcWFwb2VOZ2NveEFuUXN5UzR1eTFlU3RENHJNL2prYXZ2?=
 =?utf-8?B?SkpKY0VYM1VkbThib3RrbldwMGJzc3Ird1g1bmNCdFBrWDJmYm9QZG40MzZ2?=
 =?utf-8?B?MXVDS0R3cXZjZVJlTHNEVHp1UHJOWnJPQjNmTmtxODdHMHp2aWpRbmhDWmZU?=
 =?utf-8?B?dGZpQXMvTmlNTWY5TUlOZU80M3Y2aVpQdDU5YjZtalNLZGhPSndWYTZKS1Mw?=
 =?utf-8?B?UUpnSGM2SXhHd1QvbzNUSXBYQ0lQaVJ1L0h6SXFaempWMDVUd1ljL01BWlhR?=
 =?utf-8?B?ZDlVNFpyMm01ZVViLzkwZEpTOUxlMTdhRE9JaUZOTStRN3grZDFMQXRscFdY?=
 =?utf-8?B?NW16RjRZQU0reTJaM3VxaDY5NjZwbnlVMTBFL2N0YUdYUm5wS3NOTUJKYlF6?=
 =?utf-8?B?S3JuK2swa3dGblVHRzZyS0pqcXVVaDJaWCtFZlFnUjFjMTByYyt3dThQTkpr?=
 =?utf-8?B?RlhMM05LWWdHNml4L2ltditrQ0VwQ3NQVGRtRVp5QUt5UnRNckxNcGcyMExD?=
 =?utf-8?B?amxWMm9aNkNrU0trMEpwRWlrdENrcmNlZy9nSjRra3pMbkFiVnBMVGJDMkZq?=
 =?utf-8?B?dS9pK1l4U0ZQSHIrSlJyWHpSSEZvU1luT0x4Ykc3N1FzaytnbXZ3ejRXTmkx?=
 =?utf-8?B?bzNMTjN2RWRtNWo5NHdPYmxaT3Nxa1E2V1V5Si9ZT092ZGVmdFRnZ1V5RzdH?=
 =?utf-8?Q?vuUu26UrsXg2MRNgnxLL95+2+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fbe0453-05bf-4d85-b3ca-08dba31fb7aa
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 14:54:42.4909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VnGETB4TREC2yJiutG25NR7H2rMH1FE8pAg1mvPxl/aVmzl4WGlHTJCjo4WJgAQwMDBA8xpb3JyVqOUukY5Eyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7959

On 21.08.2023 18:12, Jinoh Kang wrote:
> On 8/22/23 00:56, Jinoh Kang wrote:
>> From: Andrew Cooper <andrew.cooper3@citrix.com>
>>
>> The reserved bit calculations for %dr6 and %dr7 depend on whether the VM has
>> the Restricted Transnational Memory feature available.
> 
> s/Transnational/Transactional/.
> 
> It was in the original review, but I missed the change.  Apologies.

But that's not the only change that was requested back then. There was
one aspect Andrew didn't like, so leaving that part as is would be
fine. But for the items he didn't further respond to, I'd expect a
re-submission to take care of them. Plus, if you didn't address
anything, you would want to (a) mention that and (b) take Roger's R-b
that was provided at the time (unless of course re-basing was resulting
in massive changes).

As I expect the same to be the case for the other patches, I'm not sure
it's worth looking at them (again).

Jan

