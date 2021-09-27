Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7BD41903C
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 09:51:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.196455.349310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUlQN-0007o7-At; Mon, 27 Sep 2021 07:51:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196455.349310; Mon, 27 Sep 2021 07:51:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUlQN-0007lm-7r; Mon, 27 Sep 2021 07:51:43 +0000
Received: by outflank-mailman (input) for mailman id 196455;
 Mon, 27 Sep 2021 07:51:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xtCR=OR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mUlQL-0007lg-6I
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 07:51:41 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bf72dd6d-1f67-11ec-bc42-12813bfff9fa;
 Mon, 27 Sep 2021 07:51:40 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2053.outbound.protection.outlook.com [104.47.13.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-5-HpRfhkOrOLOtamoL_RvgyA-1;
 Mon, 27 Sep 2021 09:51:38 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB7375.eurprd04.prod.outlook.com (2603:10a6:800:1a8::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Mon, 27 Sep
 2021 07:51:36 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 07:51:36 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P193CA0044.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:51::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Mon, 27 Sep 2021 07:51:35 +0000
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
X-Inumbo-ID: bf72dd6d-1f67-11ec-bc42-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632729099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nT+T/72EmkOC555fFuA3/9XemJ5uoHyGK7Ods3SDSqE=;
	b=YLvNkv+FgbO9QA293k3Qj7ZnGX5spuvoVdBejjCsOdgksVJGJTtM66nVIr/tHdMc+pComu
	4Sm8HQ+RK51Ral/xTY80hAWZFiDCxTLmVUuQu1XeoQ/bOhOCiKHQXNzPLWgNM0Ot+vRjme
	h6mXj/dzlV8lZZVTHyEsmvC2DuZkI8k=
X-MC-Unique: HpRfhkOrOLOtamoL_RvgyA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=itJbM019zuBCp+3ZVwvzsIduLdMxS4DQIC3NpSj1mSuf6Zwk+2h9z4KVkwYS8SCXxsQHDboV8cCFNf9CIegIKdmVEMeARnRxmisn15/pryUSofG+mzYjyQnMF8Oa2FYkpyGqqhNrIjG6wcI7UsTNQ9Qf4jDJsbcWZdLdxPR/VLyfOU+VuJrRlmBEwxQUJf1DIFXbAZvFfYbfANaOpGX6L5Am66GfKVNgnL8oaRy01wxeTgZ7ZBTw4nl4aIU7mlGz3atB7nLM8O6G/JEhAeBrh/wopnaZWdXl0dY2GQk5imwi5hBebfrvYZOVncVM1ZPGPz8gfEziezZEF8JSGMpNJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=dPxg+uspY3zJhaK/lOcD+C16I8PeoXPTSu3CuLLjkB0=;
 b=Al6XWkUpBR3KpXit5SMVm2oivQUbuQweF8XYoEnsnyR/KUu4gay/T3IK//tyXUkdA0jnZpDOgQ5I14zk/wMu7fMKQBZWDVpX+/KqLT/09HbZG+B5/6LBd6iueZDjPiRHENZkzEVZgkGSULQGG1zCQvWO3yckw1bVq3d8ORyDPp/829M4V6QBQl04D7veIRsN2YJN/fUywW9goeE41Ra2eFcMUM9CK/6P/Lba7WUCdJltcxMu61MYXXOMctGEqcctpNyNrX8pf72UPifwFUD0aisz4TASOujYjuxIzA91ejODG4C68prgza012wL+dubVUmIUl1dRIqSR07XV4dqKEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 01/12] xen/trace: Don't over-read trace objects
To: Dario Faggioli <dfaggioli@suse.com>
CC: "julien@xen.org" <julien@xen.org>,
 "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "iwj@xenproject.org" <iwj@xenproject.org>, "wl@xen.org" <wl@xen.org>,
 "mengxu@cis.upenn.edu" <mengxu@cis.upenn.edu>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20210920172529.24932-1-andrew.cooper3@citrix.com>
 <20210920172529.24932-2-andrew.cooper3@citrix.com>
 <da06dfe42adad13650755650518a232dd41ac46e.camel@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8e3f7318-2fb4-0011-f582-268816ebb59c@suse.com>
Date: Mon, 27 Sep 2021 09:51:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <da06dfe42adad13650755650518a232dd41ac46e.camel@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR3P193CA0044.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:51::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96075057-4af9-4be0-0e82-08d9818ba184
X-MS-TrafficTypeDiagnostic: VE1PR04MB7375:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB7375784413721509A21C380CB3A79@VE1PR04MB7375.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	99DWcdhj2hgZSmQDh3r9xzetiZjoJ72X/ih6Lx7igrhR1EQZUWBu73B2XAB8QJjqhStBL+sW5JyQwQ5qlea6Ac9Io/10erISuonmRpl0vtYJhC+teOYQFKuun3Z6f8K5aWNCJVtLlF6dC1/TLukiJIGO459PTNYSR4Z51LOcbA2dXNWHDciJYnw0bsEN7PWScSiAiWMFpCHP3HCS44gWr0NAIuMbtIRabtvIAnaB7X4sjyeHPyP0ImO+K7+fC2MvgqUHOpK9OY4FG0x4VxiLCCBuJm5RXgRP53Hoct9X4KU00tul/X8nIROb6QWmurGqLKjm7NLkctPe04oclIX5nn/sM6bjETiyWMvlkqTfLXWGd47fyOqr7FnQCZPyk+S8IZ8HCXF8olQOba0+7gEX2B2Z8vQ5dV2Wbr6vtK9P01F4MMQZAiP3Ai7KUX3YPGQlqevzQyj1UlU+4PFdeRRlcYhyxxLFf89kfH5uQxX1zT3t7ilXdL7CkNdKbZr2bs3GpX6Uhbnm5XZqmTWq7lR/Jvb2bR1vzHwPlqg1HzxkGSVnE/PCrCzLxLf/wJ2mpuXhkoABA1hH2U2lE3f4J8Ga6hmAEhj1d1MrXgXvt8OMUQAJSU4cg6N6BowBVG00DZdqkpZ05X5QfJR4VkWrjjIMaCYPh1hAWSjZala1qdgectxs8g/FKHpoF+IvKTpsxbgFm94BV68RLXe34XEgBNmbl/R4Na+wLkBT+eWiXmf+hTo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(6862004)(53546011)(31696002)(26005)(8936002)(4326008)(66556008)(66946007)(36756003)(4744005)(54906003)(31686004)(508600001)(38100700002)(86362001)(5660300002)(2906002)(16576012)(8676002)(37006003)(186003)(316002)(6636002)(83380400001)(2616005)(66476007)(956004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nwpb/FcAnqWG9noH/eOR47b3+fZFkS6u4BWBbSn2e2RVFTPJiwik/LnH9Sxv?=
 =?us-ascii?Q?GtazpW0QDK7WhHWkbXPK+kfUWjK0fL48MsVVjNtWP/QSSNghT/qntguzWtZv?=
 =?us-ascii?Q?2XXtigg7w3gV/RdRHG7Fv3/EmGVZf+CcZotPGoQGhTUq4XMELclnRP9K1B3a?=
 =?us-ascii?Q?8M62MKz76Oz5J9zp1Tm/n3U0OjPFYz3eLi0vEJpnz+FGTqAhvB1QJ3Uwby6e?=
 =?us-ascii?Q?YuBHvCpR7vKsa4l9cM2erm/5nCCHsvSm/IUHHMWOdcAWSE9nWFC9LWmmXnXN?=
 =?us-ascii?Q?kZIgvH90zPSSGAAbwEMOynNs0+Sd7eFi9wjPSz5DiXj764WPvi1LjO6qsguI?=
 =?us-ascii?Q?+sVFL6pH+PuRdIfz/BAq2XmeZcm9wPetxBUY4JMQ120X+EdbIEWTgnCddYo2?=
 =?us-ascii?Q?h98plHz7yEr72XvGRe5xJ44UMX+DfU2tjbNDo2Jh9ohfUatkqgKzjQ0ODmya?=
 =?us-ascii?Q?Oj60Bfx0BFCOz4VhNp6r9CT++YdultEjdhzkvTmco8OIOHM08yGhLwG9bl8O?=
 =?us-ascii?Q?iahOrvsB/SUz8rh7QpUl5pBQudCkCmAD9UQA57uGQNE5qVugErfPrWgybuYL?=
 =?us-ascii?Q?mi9YpiV5gVBQFtXbyO/pec/BDQ/ez6gUMnmzaWDMBz9jjb+MHbhU55aYL03h?=
 =?us-ascii?Q?3wItkQJR8K1kMhxS71t/GWUTs47pxVFptxnWu2/3DY0ukZJzutOjZxuC6xpP?=
 =?us-ascii?Q?tfr2vIiPP5thAIH+DJ+JXw7Vnf9L0O5ODfck4KJTAx9TzDp6lx+JKFsxWi3f?=
 =?us-ascii?Q?Nq1kBaye5hZ7nOjuaum90jM+K2BnskNBIh5F2KhyxWoUdz7dsHjywMGwtzu7?=
 =?us-ascii?Q?0p1iyjWrWcIKaNOkg7rEjiQd4waMNEHl7YMOOlfs2QgW3C9R1+ibVJM7pS9t?=
 =?us-ascii?Q?J6Wt0+raYDDw6b7qMgUWwLVJ+ho4Aa8JU50hi6fjE4eMHA+J/4h4RpaTU58n?=
 =?us-ascii?Q?imwtwRWH6i4vsZubJsR0k0/u4os3kxkspOmr6ce+6gly3w37HGU6sjJ9AE5R?=
 =?us-ascii?Q?DSJqSxWoM88Cs88WQTojDPqCgsUM/6R5SgzZ9Jw2fmfRj48qx7inMNT+rU07?=
 =?us-ascii?Q?gAego9spsDjcdY5qaZTnot8Y9i+r/AuukG1tZaJ24kDnrDvU3TFA3F2n4zVe?=
 =?us-ascii?Q?8eVGFQmWlkvxTh9ntlxND5F3R5E6V1YLICmXT/LGH8j4Bf546o6RTBpt9fLF?=
 =?us-ascii?Q?uJGnOL1R1ebiNzs6ja7UtqFkkxyQjmxISbeXLGmkhgwhmvnxlzUGye7R92gd?=
 =?us-ascii?Q?fsNn+B2HmxxNHAprbQ7Unzn43C56OL0mYIvb2MTckZs3e5XnCxU4Vlr6P1sG?=
 =?us-ascii?Q?QGIQi2313ZOjQOB0H35AlAbn?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96075057-4af9-4be0-0e82-08d9818ba184
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 07:51:36.1078
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KiKZ90r+xP8Z9J9DwuXbwsj90vB0D0anqAjevqu5IbdQWUeH9eTYLC3R4iVvvqNGhS/ubnQ4LNKcn6nA2ozEUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7375

On 24.09.2021 16:51, Dario Faggioli wrote:
> On Mon, 2021-09-20 at 18:25 +0100, Andrew Cooper wrote:
>=20
>> There is one buggy race record, TRC_RTDS_BUDGET_BURN.=C2=A0 As it must
>> remain
>> __packed (as cur_budget is misaligned), change bool has_extratime to
>> uint32_t
>> to compensate.
>>
> Mmm... maybe my understanding of data alignment inside structs is a bit
> lacking, but what the actual issue here, and what would we need to do
> to fix it (where, by fix, I mean us being able to get rid of the
> `__packed`)?
>=20
> If rearranging fields is not enough, we can think about making
> priority_level and has_extratime smaller, or even combining them in
> just one field and decode the information in xentrace.

I guess Andrew has tried to avoid re-arranging field order so that
the consumer side doesn't need to also change.

Jan


