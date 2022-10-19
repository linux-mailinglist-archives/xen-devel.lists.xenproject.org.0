Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8596039B7
	for <lists+xen-devel@lfdr.de>; Wed, 19 Oct 2022 08:23:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425482.673323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ol2UD-0007Ci-FY; Wed, 19 Oct 2022 06:23:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425482.673323; Wed, 19 Oct 2022 06:23:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ol2UD-0007AO-CB; Wed, 19 Oct 2022 06:23:29 +0000
Received: by outflank-mailman (input) for mailman id 425482;
 Wed, 19 Oct 2022 06:23:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dXjq=2U=suse.com=MChang@srs-se1.protection.inumbo.net>)
 id 1ol2UC-0007AI-6k
 for xen-devel@lists.xenproject.org; Wed, 19 Oct 2022 06:23:28 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130079.outbound.protection.outlook.com [40.107.13.79])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89ca74b7-4f76-11ed-8fd0-01056ac49cbb;
 Wed, 19 Oct 2022 08:23:25 +0200 (CEST)
Received: from DU2PR04MB9081.eurprd04.prod.outlook.com (2603:10a6:10:2f0::13)
 by PAXPR04MB9302.eurprd04.prod.outlook.com (2603:10a6:102:2b8::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Wed, 19 Oct
 2022 06:23:23 +0000
Received: from DU2PR04MB9081.eurprd04.prod.outlook.com
 ([fe80::a241:d3e4:c22b:a236]) by DU2PR04MB9081.eurprd04.prod.outlook.com
 ([fe80::a241:d3e4:c22b:a236%7]) with mapi id 15.20.5723.033; Wed, 19 Oct 2022
 06:23:23 +0000
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
X-Inumbo-ID: 89ca74b7-4f76-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TOFn00KMklvQR3lNNosekwei4qbguD9ZJJBpMIKD2qAjSKVoMyzRovqIqZzJst9EzVQHG2nsFgRofPb+HckOPYBRUTVrMRZnsUCNcuawQNZNz8PAXh/a9EOn0qZMRdgboSPTe+qa7hZS6Vlrl31Oa2Z3lhOULzpgmdPvoYOF9gTDYX+pyQZIHlFAbJCFjM1bPzKtrlhT69bSoKbyuPlkyBW0h/HyddqFNeUYQ/5mNCfse/9AdbHfp9JfI9bJF2ANlX7PMDShUBLUirEIO4ZSDpdsXhk+HjxxRHB8FhtU1KZ2ZOODUOW+oJ2xX1zRW95B5Ae1MYvaEq0VdGFMQwLfdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5G+eFuzJxj7+/WKBbpljkfn32fF7Ge5Hm0UmQOXWsUE=;
 b=j0186qq+7dIvqshOuniSHpvJ1QgURdiKJ50DOoJQUeAVhlKXkm7LJMsBPx1Nk809EUT/2TtYa0FyLUBTjU7BY8FOrQJ/mAdn+EFWHr1bIuOD61N6XDkUZpsw+vY0JKlN7EtYDT1yZ60x18+55JSLlaYzp07ksw5qMrO3RGKLYeBlyFFoyG9Zt6MSKkg/gQQJojhbeh7c1qiDo750lBjAONVxIWQaPxinxmIBURqnXPdvz5G9NznEFLAFpbCN2n/yrrr81LPk1ZibSHKSJjwl9fvbQpo0NOlwOuKqpIX5uEI9TRjJ6XZMYd9+/AqCbgwZonJLYlwmn1ztM/1T1vbL9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5G+eFuzJxj7+/WKBbpljkfn32fF7Ge5Hm0UmQOXWsUE=;
 b=d2yUssnTkoDvuk27hUbZzDPbObctr72uy1+E0AH3Sa2Y2KVig7snzHhKzElYdgtKfXAXDmz2KhjpNUkMC39rhIfSYNp98KAYVzMMaVKawCZuPBX1Xeyr7woIzT4LR+Lv/ihnub4hu5/oMjGUOQVx5xtblL8uoWAvRxCrBP/XNjvNwlBxxuQVWwvfU30Y7BYRnLtulQWLnPMe26T4gVUYS+BGtFpp89JY1sY0tQH2awL9I75CsgbUAPqlxJ1gubNQ+wpmrBDsyAEEKGq2Bl16dXQATrCLliPNW+hTpGg2sAN9Tf85JQb+gXJnGZBoyZiQibIUHsjBmxKWRqdVJbmGiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Date: Wed, 19 Oct 2022 14:23:13 +0800
From: Michael Chang <mchang@suse.com>
To: The development of GNU GRUB <grub-devel@gnu.org>
Cc: Denton Liu <liu.denton@gmail.com>,
	Daniel Kiper <daniel.kiper@oracle.com>,
	Oskari Pirhonen <xxc3ncoredxx@gmail.com>,
	mathieu.desnoyers@efficios.com, rharwood@redhat.com,
	samuel.thibault@ens-lyon.org, debian-bsd@lists.debian.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4] templates: introduce GRUB_TOP_LEVEL_* vars
Message-ID: <20221019062313.GA19401@mazu>
References: <20221017103532.845293-1-liu.denton@gmail.com>
 <20221018131235.5e70f0bc.olaf@aepfle.de>
 <Y06w0Oda0sHTHPNW@generichostname>
 <20221018161821.149ee6fd.olaf@aepfle.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221018161821.149ee6fd.olaf@aepfle.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: TYCPR01CA0136.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::6) To DU2PR04MB9081.eurprd04.prod.outlook.com
 (2603:10a6:10:2f0::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB9081:EE_|PAXPR04MB9302:EE_
X-MS-Office365-Filtering-Correlation-Id: c1a4011f-403b-4bc2-3f0c-08dab19a6c5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ia/ToCS5WzRTJLperUIUwIIMC1+uXkL12cgzNZFW9ZA+y+Y6zLE4F8/v3quFNJNOhs6rJlkQHCjJR2Vi7SZRBPFSHiffDZJTfWhr9xT/EAwkMSEltsl3q4sBTOV/QEarue2RTsyN2jm0Tk6GohqY9tG9YPU/xdlwcJYXRmfMmuUckhYwFFPp6xcs6jj7YaYKJQmga7ptCXohpRYCSqECrOzMH7WR6ZSJLrl+mRIZv2SJ7m2practn8IQ0MhRIv1PD4LETYSqx4akPe+I7+F+Me81fNEIKhqpdmXJLq/2EiduS7dnBhBDg4THg4yWRBHyGwvK4O7EFW0IPvBFSqXDVcWvak7xFtXUEGZgyDMzlbnNXJbE9PM/LA63+FdBKzB6ppkZ0x40WNx925LlJVeWscQfO8lrOl890IyywLZo5OM5hG43jrpe3fEwlBhHlSf7pNUnlyFdqKko0g01jWsajzaZfaOTNaZCothIv1MFqfHgrn0LSI6FZL4fK6XKmkoGfayVSInTCP8959/h67JSWQdoEBYgqDwbJlrCz/TRTxDxSyldyoeH0N+WPMOL/6zCPqsj6N2sSjrBqEZDJkp/1sTEULr/ol4nIH6ilMWnMTHM3OJU27E+D3zMCSeOCuZw5Gc6kyVgsmsJbQ1sbubV9LhjMLtXzoTsAcoOzj9I5QX+i4sWmZ7gViLufLTUiyemR5BbRaVeUHSIpcoXMe8IiuO+TiEo5zxXtFUdvOwymfc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB9081.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(376002)(346002)(39860400002)(136003)(366004)(396003)(451199015)(54906003)(86362001)(6916009)(41300700001)(8676002)(6666004)(66476007)(6506007)(316002)(5660300002)(4326008)(9686003)(66556008)(6512007)(8936002)(66899015)(2906002)(33716001)(1076003)(186003)(33656002)(66946007)(38100700002)(478600001)(966005)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3xvu8GS7YV+KABooMMSqeMpJ072dL60ora0PvQ2IPQImOVbmulmQ9T0XbhqZ?=
 =?us-ascii?Q?igpc3hYrcfdd0rguzTwm17yXv+rgFNi6pbKBDJlZADYQ9RGQxO7QXom6ktHZ?=
 =?us-ascii?Q?EWy/OCJnhXc5j7ib8FVvoPMRAkn/aPPWnP4TigBpBZ3rvEomLTOpmnD8Ks+G?=
 =?us-ascii?Q?WzzhNUyMhrNXTQr+7PuWSy8q8XXwa4TPgMssa9gtAxIPfe15ZwnFzW10BhPK?=
 =?us-ascii?Q?Ck4JpWnVwsQDl2cLn0pC8HsLa2hR4sC+2Z+doaJlaV/ER/I6jYa4FGsq8ANj?=
 =?us-ascii?Q?0sQBHzEXoFaWAnV7hE3vzgNpRooYrQSnW1Us/JHwu1MLf+ZCeODRxGdWCTbN?=
 =?us-ascii?Q?JFOykvzCdcGNwFIzbcsW6FS6Qhs6jeQXzPyJmpy3eirPOBkejUlzeLDrxGLC?=
 =?us-ascii?Q?f4cjG80bXKDTnYXfNP8ca6mff1bYjzTjhFyu0WtA4gVG8yIn19LHmdTqVEYa?=
 =?us-ascii?Q?nR1W7dvrBJKDIc5K5VH9KFlYcnNy3O986EivHTrXY1XibDoEzVn0gLLxNo7F?=
 =?us-ascii?Q?ZUJboLDuqxkw6QowRkvSjUxCL4QfPLHPOlUEvec0JRGDebqRsPvgrMs+XspU?=
 =?us-ascii?Q?BF/2B0qVQ52Kn2cLnd7mYorXoBH5mFmZ9XSwfYr7imVzJ2raKRj1rFtqrkrh?=
 =?us-ascii?Q?0xmhiKNQFNSkJgudxyxtHz/abanlXZe/YmJeD/0JfFNyszCvXbVRU0wjh0de?=
 =?us-ascii?Q?TS7XE71xMS82Lz5mPBRyx9HH+oRWKGn+Vgya49Vs7v3W1nNlEPx29yqJ4HF0?=
 =?us-ascii?Q?CXVrYSYdVTe63HeKYAZMg7oxpYV9ESXCm5qF9WTOqcLGhk7NDjtYjWyv6hdv?=
 =?us-ascii?Q?t6tLWf1L9yYGNoYLna26zM9A9jPKBGsOOdqo1uZEmkt6JwMKf2b+JrPL7v/h?=
 =?us-ascii?Q?5hpAOrmQTaldoitdn1FhYRMXnjYbDBY1/PlpqVJCwkaBFY6gZKfdYS2LwvB3?=
 =?us-ascii?Q?JQJ7l/pWrZbAKeCKhky+/zZbtiYTdJMUPhTQyuzSZoty8XtDj8FYnKZHc0Cc?=
 =?us-ascii?Q?osGUHllAAO1EEDRCDZl7UdyMXak0DfTnMgpiLLLrTc8BDnrIcA4IPyHDAVpp?=
 =?us-ascii?Q?3wstNUvYKERpP57VM/6JwgohiBJ/16pXH8aJgyxalyjho0jnKjLiKUFwCyOC?=
 =?us-ascii?Q?hTtLUFpEOslXGFrXNo2nUM2Z/0wg6INju4/wjGNnLJRD9tafGrWVTHocNjNf?=
 =?us-ascii?Q?lSzTbDpSE0866kIwNqg2jXy2HfYyVJyJrWvdQYCiQeGtHTuydQixVIuILBuA?=
 =?us-ascii?Q?DHTCoALR9F/s175axlbtRTod6avsiyrKHyFxm8mlQYF22Q8A8lDSH4YINWdX?=
 =?us-ascii?Q?iq3vLgU2ySGyvU8EgKEmAfcTdsd1jVHk+GPD0uheYL3/AExL/P2iD0lN6Yda?=
 =?us-ascii?Q?e+l8NYwGUNOdxrFfPum9jJkuykb4AR+wYkzC/jMIRep0Evvkx7MKIgaaXg1e?=
 =?us-ascii?Q?+cOyGGBfP0PHcpEEhqdAZ5n9ktMgd2KmZyEqX18K7QXXgG47XyBOjyhjJCfx?=
 =?us-ascii?Q?jlD6NFXTQ0BnvEttS2j3Lr7hK8BUQtXEJLV+n96I0HBXjJQhwuaWKk1rlnmn?=
 =?us-ascii?Q?e+Zen5GdhxoK5AJLGK5JgDCZJo+jdL9AjpKR4BeNPq8ZkYj8Hl6OKYoCUq2k?=
 =?us-ascii?Q?X2zjj6tdyOA8RVu+CWVV9+5jwrd0Lbt7T3xgbNDkbDhw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1a4011f-403b-4bc2-3f0c-08dab19a6c5e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB9081.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 06:23:23.5368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iD7PjRKfbzFTJNpVyI78AR9X2oKvcOQd9MBYiaDQwac0R1Hu52lIqQ59kciQmYLd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9302

On Tue, Oct 18, 2022 at 04:18:21PM +0200, Olaf Hering wrote:
> Tue, 18 Oct 2022 06:57:36 -0700 Denton Liu <liu.denton@gmail.com>:
> 
> > If I'm understanding correctly, what you're proposing is a mechanism for
> > setting the default entry. If I'm not mistaken, this seems like an
> > orthogonal discussion to me. My patch proposes a method of setting the
> > top-level menu entry while this method only sets the default entry,
> > which may be hidden behind a submenu.
> 
> I think this can be done already today. At least YaST offers a way to select a specific item in a submenu and pass it to grub-set-default. This leads to an entry like this in grubenv:
> 
> saved_entry=Advanced options for SLE15SP4 (with Xen hypervisor)>Xen hypervisor, version 4.17.20220823T122205.399bcbf2-xen_unstable.150400.370>SLE15SP4, with Xen 4.17.20220823T122205.399bcbf2-xen_unstable.150400.370 and Linux 5.14.21-150400.24.21-default
> 
> This entry will be booted as long as both this specific Xen version and this specific kernel version is found. There is a slim chance a SUSE specific patch exists to enable this functionality.

Just to clarify. There is no specific patch, this is common function in grub.

Thanks,
Michael

> 
> Maybe the patch description lacks a specific example how the proposed change is supposed to be used in your environment.
> 
> Olaf



> _______________________________________________
> Grub-devel mailing list
> Grub-devel@gnu.org
> https://lists.gnu.org/mailman/listinfo/grub-devel


