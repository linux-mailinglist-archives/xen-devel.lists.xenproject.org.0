Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CB974CE83
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jul 2023 09:34:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561047.877324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIlOn-0001m5-Rs; Mon, 10 Jul 2023 07:33:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561047.877324; Mon, 10 Jul 2023 07:33:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIlOn-0001k7-Of; Mon, 10 Jul 2023 07:33:33 +0000
Received: by outflank-mailman (input) for mailman id 561047;
 Mon, 10 Jul 2023 07:33:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=72qR=C4=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qIlOl-0001k1-IH
 for xen-devel@lists.xenproject.org; Mon, 10 Jul 2023 07:33:31 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2062a.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10053a04-1ef4-11ee-8611-37d641c3527e;
 Mon, 10 Jul 2023 09:33:28 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by PA4PR04MB9413.eurprd04.prod.outlook.com (2603:10a6:102:2a8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 07:33:26 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Mon, 10 Jul 2023
 07:33:26 +0000
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
X-Inumbo-ID: 10053a04-1ef4-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b8nygh5oHe1ub2iTHMPf9WEhFoy2Mzb+IKCwPPcVa6q6+zWSnZGPrJwdcs+NZan7KzF50rB/8/1BfzB994ZzfVixX6HO00QL34kXgQBxZtFEYxhpdzhFEuAqSYSSEvo3bD6BsFVRmJoF4C6kbqgXXPcKyyDFDxfXxAi3rlWGfl2IZ1nHV74AfgJIFWaqoD6f6UcxrLotm5giPZSACLCYMtcs/cms4VvRfMPcdpPG0Lo0+XsUs7YgWVuWc5Y9yRKsiXC1xSADL9NeBuJ+TlpxX1JaWwkAIdgRpd45Me9/D/04JkTzlM/oEFczUSlFgIqgj2ETe84axHexzV18dE9ddg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xm+lrVZeMJ3eGT2eY8a2I4+9B9hujaEBFZgmi1nftno=;
 b=NFA5R8ScPqdzCmWLxn8DNdZHUIeR1z0rLXZOsN6DnufFZD7f8riUbne5T7JPmtYJ2SqCuqJDgJqzEJbygen6l5D7TuiO5cgDA6gXNeM3oJSQLx3Wj/4/1DAfItavXbtmOx9a/d7dmXj2JV/bfOxa50jTFpLCixFIwXHwtEH/qC2NPenffYML6w2Y5hnroc0soBF9fIQg/VGF+s+rET6eKN6+p9Rtbb4TOoYmvS0Bg4X8a95H246zbUDe1CEzO1SmskOtwCdrF7ZwPmorP0zNBYGY9ijoDtjXM1Wfox6WXb0Hp5v093eLybFWajG+k+5Z2kJ2ltElEjOQgJ74JUJsdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xm+lrVZeMJ3eGT2eY8a2I4+9B9hujaEBFZgmi1nftno=;
 b=FihqyAdhJPzrgKO7F0t1G1ImdhGkXT3KGIbKifs26Sn+/ej+WX68UvhOYam+jI8yBYlxQMe71F0U4+RnGYONitN/ijWRv1GIPONwfXX5VOAPlobnYwB/Z9W8NjBTcQYJgINHeiVujhPy3WmyAPnRJPgMNR9sY2UQkpwaojV/bD04/Y9+Rb3DGY8FoHaVlJLHAAqu8Xx0JtKplgPaFOijYghgb2hjyCyLH4F8m/Q7B7imkKApGEWZlDi0rquBqBq/zMFYzU0I1cpGyByNfGabsznph1HFRqtgF44e6TjqxRRcbQPTYX9yH9VGYC+FzsJ1auWxm6tdGiedgPKl/tO16w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e14fdd8e-692b-bb19-627a-0462cce45de5@suse.com>
Date: Mon, 10 Jul 2023 09:33:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Ping: [PATCH v2 0/2] new CONFIG_HAS_PIRQ and extra_guest_irqs
 adjustment
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <85e59fd5-9a06-48b4-ba7e-81865d44e332@suse.com>
In-Reply-To: <85e59fd5-9a06-48b4-ba7e-81865d44e332@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0090.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::6) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|PA4PR04MB9413:EE_
X-MS-Office365-Filtering-Correlation-Id: 8edc0b37-fbc1-442d-6c29-08db8117f307
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hYC7nY1hn9s/AQn+eU86AgpkPZ40A2vlduLCwIzGHBICQORidmAXCIRn8vpwZ2kgJkzvnGBZPQztxA1BVdsdqW5TWCthj4FKujQKEEPWSs28AeD9OsFEZ+BfLtPpfBWkj5l6b1d6Uw6i8ETueCxMdpG+ZNGNE6umAtK8JWM/evqGmrTxkDVT0l7SVsgL1YLVEwgWiHRlOc3qt3kjnYKurpj7F1Xt30oyVObCQRgaszGo8qa+v+/GbTgGV4AnKJtpSDUVA7TXBz+plfwQGQAU59XS55lrl3BeqmHVzcFB5nQxXjW+h8ra36KVGsU1J7KfHOtOc1ggB0tXRRmDn90Fr7InoCzAZ+xYWvHU9zrb4jzjoo4667llxXpMFuhLUGUqLPxzuwGuq319kJKop967p6sJ9bvq8TSoNOF3TtdsO5hYJVIrSOjf9OMKV9UmtXLMg/aVJJ/pl/8EmC4mztOUzwZYJXzWPbfX0xOQ1KxZYPH8lK8Eq65XvZ/ZUC7fgkUknAkroBtRqm4Rg0YJUS8etRLFseR51Tk0r0pjN5iYaTj5ye2AaCD4hwLdmU/YOSubzV9XzaACZYMVhLSwQxRFF9mCw77Zu5sE+Mr43yLDoxWbuVfF0dhFf/m4HeyDbpqpyx9U6qOyUdAJOQLOCmMPug==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(346002)(376002)(136003)(39860400002)(366004)(451199021)(6486002)(478600001)(110136005)(54906003)(6506007)(26005)(53546011)(186003)(6512007)(66946007)(4744005)(2906002)(41300700001)(66476007)(4326008)(316002)(5660300002)(66556008)(8936002)(8676002)(38100700002)(2616005)(86362001)(31696002)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z05FS3kzVHNPazRQcDZJeVZwdGZVWG5sRGdxa0QvN1hvYmlvWGV3Tk1MbDNE?=
 =?utf-8?B?aEZ3UnBNYmFjak9NVFZvZUpQNjdQMUVEZktBdW51Mi9ZN1VSNWg1QUFOeE9t?=
 =?utf-8?B?WXM1MjhQeVVZVjJFVDVsVFZScGhUMGY4bENPVVFEZ2RyZllBUllSSkpGcWQv?=
 =?utf-8?B?VEtUaVd0VncrTS9XeDBUa0plUEFRZ2pXSEVYSjBMS2UzeEJRaW9HV01pZ2Rw?=
 =?utf-8?B?TkJldldEWlQ3YnJGYjJQa2FvRnNrSXhGRHQrTWlwWTFLRUQvdHdmMU81QUpN?=
 =?utf-8?B?Y29CMHNSSWRxQS95M1FXaU5XSytWbGt1NHV6dERxYm5PUlNvNXRlc2FPUFZI?=
 =?utf-8?B?NWVpcnpmelFhenN4ZFJIbGxiSnNMdHgyeWVSV1ozdUk0YWVMODlUS2cvWEJ2?=
 =?utf-8?B?NXk4N0ZLaHBQQjB1UUJOL3daNVVLUlhzREpiWllvZmJsd29wVXNQTVVzVGp1?=
 =?utf-8?B?N2RqY2VZdmlUQm5jKy81Q2Q5YVFRYkNlcEVjSjh2S1RHRFdJRFVWQXhrZHBp?=
 =?utf-8?B?YXRPd2Z5MDdEUVRQRWxzT1RPR0d6NldUbDNZaG1XV0dmRnVPSEZDOHVOazdO?=
 =?utf-8?B?YlhxZlhsMHdveEpRaDFvSkVoYWlmT2dUcThnaE14Y3RVTVVzS0dxY3QyMlVL?=
 =?utf-8?B?TVlCZEN0OHNuMjA1MEJVYUIyVHhsdG5tYWFvd2t1OU9iMVJTckY2Nk4vTUFJ?=
 =?utf-8?B?dVVwc0RNbGppbEVXK0c0U2prKzJDTFQxMFQzNFI5bXllMWM1VFliQlA2aDZj?=
 =?utf-8?B?Z2E5VmVKSDA0UVltQWg0eGVHaWZMZmc0NjZHVmJDODlZU2FYRzIvbVN2MVFq?=
 =?utf-8?B?c1pGaEk2UE0yQkhKWndWeDR0T0pNdmZjMzBaSXNNNjJCUzlBaEQ4cGkrRjJB?=
 =?utf-8?B?MDV0OFhpV2lmelM3QjJIaEdQUHNnQW1MbHg4UUhaZ092R3dqRUJwVDgwaDJq?=
 =?utf-8?B?eG1DRFRGaGFya0s0UFhtOWlZc01wZ0ZkTHRZMEF2QlB0cDM3cERoUnpEbnBs?=
 =?utf-8?B?M2ZtWjBXT3lpblpSOW5aZlFyb0pFbW9mTUFnQllSWWpER0VRRnlvWUJZdHFW?=
 =?utf-8?B?dzk2cWNPdFRSd1ZLOWYvUE01ZUIzVXZ0RnBJTlJRODhHMW9MWk5TMkk0SkdF?=
 =?utf-8?B?bWNBZm5qendTQ21wWElRSUlkRWw5djlid04vNzZqd0NseHlGVEtpV01lckxK?=
 =?utf-8?B?U0FUNnd4cW5aZ3c0RnVtbENraXgwL0hvTUp1YzRUcm1Za3FRYWRQZ0dwMTB0?=
 =?utf-8?B?NVZwcE5BdDdjNTEvOTN0RXdvRGxFV2xzMDRMMFNpVU4rQmFUYzhsZ0VRVURk?=
 =?utf-8?B?R2hBUlRtNXJIM3hBMUM1dWtEM3AxL3R5RDEwUVJWNHBiQ0VzdGZ5bzZEUVVC?=
 =?utf-8?B?RTdiR1JVTGpRdTRHRmJsQ3AvRkpPV0xJWU82VDMzU0M0aE02Z0dWbHZQZE9B?=
 =?utf-8?B?eHdsTGs2eVV0M1ppTDJHWmVjQmRYSXFVRzNPdlVOMzRDUGp3WFZ6M3JvMXMx?=
 =?utf-8?B?c2lwQ0YyQ1A4dXJ2c1BtaWJ4TmtJbWZHWlZkNkUvWU5sdlNtaHpETHIvYWl4?=
 =?utf-8?B?am5oSGpoLzhCZGt5Y1BXSHRhajRIZ3BCQy9pM2Q0WDVmWnNpa3NBb3FyUFQz?=
 =?utf-8?B?RWhiRFJXQXlRTWMwRlNMa0tVUytzc2F2eUdyLzh0dzJoSEVFZHowYjZ5bjY4?=
 =?utf-8?B?SGIzeVlQM1BvQ2UzaHJZNGVtdFJzS2s5TjI0TEQrUWdPZ21NUUpxanpvNkNz?=
 =?utf-8?B?VEJkeWxMNjd1ckNMVWx5UjdBd0tDUUpkaDU0ODA4NExqWWgzWWo1YWtpdTdt?=
 =?utf-8?B?Z29RZVFscHE1VGE3ZktHbG1ranRRS05pNHhqS2ZXS1puMEtlbWhkVnJla0Vh?=
 =?utf-8?B?c0VJSGpsb2dMcmhVVUUvTzhEalJaT2daSmFwZjA5SjJOMGwyMm9mTC84eWdu?=
 =?utf-8?B?dkRjYXdYMDdTQUliVVhLNUtyc0ptY3E2OWxNbVVrVy9xMWdsa1BBYkNyZ2or?=
 =?utf-8?B?emZINVRycGtKTjJvdU4wUndzbnBUT0g1WW5YZUsxc1AwQXhid0JSeUVYSUZL?=
 =?utf-8?B?M2trRUxWQlFuamZkcmZBWGlHWnJpRWVoMDRUeWQ1cjF5SmdUTkNmWFVvblpS?=
 =?utf-8?Q?3f8xvjrsuStNAWl+GFAXIanWC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8edc0b37-fbc1-442d-6c29-08db8117f307
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 07:33:26.5978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XE7strx9H9nfmk1i/XeZ8AxxBA2BD0TdDGmeHTmVHvdkI1YnjTNoHQbdzzQVNvjmRGYVOARMVsEnNty4UGmEnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9413

On 03.05.2023 17:31, Jan Beulich wrote:
> The 1st patch (new in v2) has the effect of the 2nd one no longer
> affecting Arm.
> 
> 1: restrict concept of pIRQ to x86
> 2: cmdline: document and enforce "extra_guest_irqs" upper bounds

REST- and Arm-maintainers,

may I please ask for some feedback here? Roger did supply some, resulting
in me considering to revert back to the earlier version (i.e. patch 1
dropped again and patch 2 minimally adjusted to address feedback there),
but which route to go wants input from other maintainers. What I think is
unacceptable is that we continue to not document and enforce the upper
bound, leading to people needlessly running into issues on big enough
systems.

Just to clarify, "the earlier version" was mistakenly not tagged v2, so
what is meant is the 2nd submission ('cmdline: document and enforce
"extra_guest_irqs" upper bounds'), not the 1st one ('cmdline: document
"extra_guest_irqs" upper bound').

Jan


