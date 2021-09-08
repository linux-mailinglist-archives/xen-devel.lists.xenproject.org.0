Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5358E4037EB
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 12:34:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181743.329021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNut1-0005dw-SP; Wed, 08 Sep 2021 10:32:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181743.329021; Wed, 08 Sep 2021 10:32:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNut1-0005bW-PF; Wed, 08 Sep 2021 10:32:59 +0000
Received: by outflank-mailman (input) for mailman id 181743;
 Wed, 08 Sep 2021 10:32:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NNqu=N6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNut1-0005bQ-4v
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 10:32:59 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ee7236d0-6d58-4690-88e8-3a712a7c7473;
 Wed, 08 Sep 2021 10:32:57 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2059.outbound.protection.outlook.com [104.47.14.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-10-_AzjD38gOF24_PKpt7JfWg-1; Wed, 08 Sep 2021 12:32:55 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4846.eurprd04.prod.outlook.com (2603:10a6:803:5b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Wed, 8 Sep
 2021 10:32:53 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.014; Wed, 8 Sep 2021
 10:32:53 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0010.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.6 via Frontend Transport; Wed, 8 Sep 2021 10:32:52 +0000
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
X-Inumbo-ID: ee7236d0-6d58-4690-88e8-3a712a7c7473
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631097176;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1D/OwiwFXsedKdK1yUIbJBrg4OkseZXV1iXwOcwtd38=;
	b=XoOjjHZo4tDBh5rq2Oa8B3JyOTB5Dsjchc9iMEpBAmjbNqct3cgG4/GQfEK6SlnFx84sqn
	JTBGXqm8KkwwxJRmZ27zdLk6XqzF9Vs1gHclZBoqjSmAYnCMf+RGchm643iPATZB4ZentU
	zmye5IXOM/28aUGrBT0TalsTB2ltJH0=
X-MC-Unique: _AzjD38gOF24_PKpt7JfWg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f6XlWOjzltmSlPLlSdBRHV0LnqHFx+4WW4rWZWnapkqGPJ76MvoBcG3ZiNOwGNsgGxmO+hTdGO0CIbadcLZtElJ0SLfvoBBc21yBGltytrf9Jb+XZ6bIeT/oiFws70VmDTxt1wUQrGcbSDyIVpZh9lhZnWN3HmTsEs7MMquHKY+cXtUl+rDSEuz3JKwM+QLcIXkPiMVgv6J4HoPvh3c0aHsUKrYpUyT6MmOClM5Ydyu9zsxM0KZfjB4oRXbWlbJScVcDWulxpQ6eqVZHlNVHpNEe4OEqlou46JwpDrjCJLZ9hCJPX/jO2DNMu+3OowvHzv1XyIu+i+0mquIk0T7kxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=1D/OwiwFXsedKdK1yUIbJBrg4OkseZXV1iXwOcwtd38=;
 b=C+K4p6kg1fgMS6/HiZKKsqh04Lbfc9Ghcon3YYVixJORZCMxjEI8Y7thrcG8XqmaKCw/GdPdCGbrpvirS14kRqHeP2qKFIcG64so0vZFvk3yktOqfUUSToaGPWGEOw9gjyV5q782CLHuUf5XgTlj3Hv+N0VhfiIo2CmU0wnCi8A0rJNqDHOwJHPFbvY2Xca1UGTlJffj/M1eamXNzIgBkmx1o0t++nx7oDDf/mmWsGBSag+nlaQ4e3JjNEdmNnU+a468pJW5AL93BpNCR5Cwb2zKt/QaycSSryQp6MSGxRRscZJA8wZhRcEdiFCThBULR1bfJp2VjU2s1MQWEXwjQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH] domain: try to address Coverity pointing out a missing
 "break" in domain_teardown()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <20e28e4b-c794-7435-5f5c-332e9a6c0433@suse.com>
Message-ID: <518201c2-1250-26fd-2105-f44a60d40dba@suse.com>
Date: Wed, 8 Sep 2021 12:32:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20e28e4b-c794-7435-5f5c-332e9a6c0433@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0010.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 381d111f-36ef-4869-78b3-08d972b4038d
X-MS-TrafficTypeDiagnostic: VI1PR04MB4846:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB48460E1E43A0D062232351C4B3D49@VI1PR04MB4846.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JCs3H9LOjrVxSPuAi03RN8XUTN6ya1XWZmL56itQoHRVYQKAXVFHcnTCIbNyOC3pZjO2siYyl8U4gUMrC9UrSkI1PsBQ7gjS4xE+g6+bZsxJWF8cNKDSjUQTJBgzrCN+tVOYVwej+nxOvilkOPLiGWySh4OQjc2BTNSyemduRoqv6tL/AKemF62aqQnmSt7fJn4hG4dUdfsg61f/5yhSsrXPmfHOeCVZrBJOAnskjE1VhJst7wjfSf5O1kTU5pn1+4EmPohTDceC/f1dHS2YpZEkwI3xuVoXtVwEsO/TwFzLdGevxA/w/kkpahg92bCb7Q2Udw4Q/bJj2dgCmNdIDsnapgoEbtfE/VKqKFGfm9UqLmmlBxP/HogF67oLFf5w/oP78o5lPgp4ZuHYU9CqkjJdG2wxWHuYAPEuleE0Ev629n1MKQfI6YOHK9PZpdmUIAZjmqL831D7XyLuwrLufvAT2/lfUjMvZs6Y2LdrhnhZzCRpBZELO1MjvcWwJIiwmJZyIG6kXWCa9K/nvR7TibyQrbP1VYntJnKEz9H6A+GbJrwfrwU+De0om/3uSFhzDiAYsqryUBruDWMXLXE3YMQA06ufxrGF17fQKwZlnXyyeAlCnbX0Oqg6OgsgiZKMutEDdKkiNkBVam5neCTUSaianVCB5wP0fV5gYwARbGMRHhs+KSgfdtqxpRp+fPw20c7305P83+v3QHhjO7QpyhRddfmrKwYE0HhBtik4OuJuydjPMMK39TsTd5ZRmvKO
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(346002)(39860400002)(396003)(366004)(136003)(31696002)(31686004)(66946007)(53546011)(54906003)(86362001)(4326008)(16576012)(186003)(38100700002)(2906002)(6486002)(2616005)(26005)(956004)(8676002)(8936002)(66476007)(36756003)(6916009)(316002)(66556008)(83380400001)(478600001)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1FwTTFHYVR1dlhGS1FwUUl2OWtHWXVtLzNoaEFjTXM5VFl3UnhRamdtWGVV?=
 =?utf-8?B?QU1jRnloUk9Qck9kYXFjZ1kwMU9UV1lLTk9lcHB3U09Jck5HYXRaVFUvTFBj?=
 =?utf-8?B?QU02anNPWm1BU1hicDJ2RThKZFRBYm5maHdBY3JuMHhJZUJRRm5BcWlYNyt2?=
 =?utf-8?B?dmNrUzdHa2sxSjhlZDA3bm1QMElzMGtCbzZVUUhtMnMzVU12QzNPQ2tGQmpy?=
 =?utf-8?B?VVJGR1JMaEYwd0NJd0VOQ21RVXNoWnFMTUhYWDR6c1I0OS9WMGVxdmgzd0dr?=
 =?utf-8?B?c1FkVkxiWHJxKzNpQWNRSFNseXNQZng3cjRSUVRDZ0lCbHBxZGNnU3hYQjJQ?=
 =?utf-8?B?bzArY3VwM21GcC94ODdZREJCVlA0MEZNM1VNZ3JIVVE3YjYwYkQvR2RlQXVk?=
 =?utf-8?B?cE1QUGNpekxyUldUSXUyZE9vY3VhczhINGR3ek03dnV5VDl6elNPNGwxQ1Zh?=
 =?utf-8?B?RkMvdXZ5R0tJN0M0TTh5YUh3S0NhbHRzdjdaQWY2QjVSS3lvSTZHVnVUZVlk?=
 =?utf-8?B?alNkN1FZVjhTd2ROc2ExalQ2ckNCcnd6RkVxd0Uxalc4aXIrd005aE1FVXN4?=
 =?utf-8?B?dno3R0MxYlZsMkFDeW9QMEwvajZvZkRURWx3RmdSYVVJcnFGVllWcmNOVU9t?=
 =?utf-8?B?ajdqZ0dYVHlwV0xrT0xQRElmUUJyMDM5Y3lqZ0l1clBIREVPd0REQndtZVgz?=
 =?utf-8?B?RkFJZnUzQ05TNDFNdHN6Zk9ndndxUzBHUUROd240b2pUdmZQY3ZSLzhPUUJn?=
 =?utf-8?B?WSsyNFRKUldER3pLdXo2bEszM3o4R2ZOdDR2ckVyZVk1djcwZFVBVzEvektO?=
 =?utf-8?B?eUZ4OWNNVnhUZmg0OWNZdHQ3SHZyN1dZY05STTl2MTFWSk9mYUtnUmtKZnN6?=
 =?utf-8?B?RG5vUHJRbzRMRzZXQUpUa0FQTjlxNEUvSDdnZzlmWFpKaVFCZ0tDWURTcDRu?=
 =?utf-8?B?NlRocTJuT243K3ZUZ1NLVy9aN2VRREttbkxJcXdFcHI1OVF1RGQzN0oyM2JD?=
 =?utf-8?B?aGFxVTBYenhSSFlxZFN1dS9HY1ZCeGc4b0sycXU5MlBpOFRia1REUmY1OHZj?=
 =?utf-8?B?RFl0MmpCVnBPVDFucFc5R3piTjFWejhqcnNKYlpETlpmcnNYT09lT2JFRXZh?=
 =?utf-8?B?bWpETnBpQjZPSW1SbjU5K0pxYjVOejBNWlJvOTRGUThwSnVFRHB6YUxwemdW?=
 =?utf-8?B?WDJsdFpBaGt1YVVWSlgrcXd3NittTTViaUd5OStzZm1DaTdlSUZtSnh6YW5L?=
 =?utf-8?B?SjRJeWx6eTJuSTlvSzZoYmxWQTNxeXA4SEtqTkdqWmRROTA5bkwyVGxmbTc5?=
 =?utf-8?B?MWRpVU5hZVZlNlRYc0QyK0FhU0J4Q0grcEFlMnA1ZjFlMVFpanZNYTZsbXBo?=
 =?utf-8?B?OFFIQW95SGNYRTM2c0I4OVptZlRGMGV2Ujhxakt3NjZNSk45VGoyZ0tsUlVM?=
 =?utf-8?B?ZWtqQ2tBd083TVJQaDc2ZDQ4Sm5yL0Z6emFwNUo3Z2JLNjY4S3JOenJ4Vjhr?=
 =?utf-8?B?S0dUczNGdkxSRU9tcjEwL3dlZ3FuTkkraGk5ZkgxR2JOZGpBeWFkbkFjNi9W?=
 =?utf-8?B?dWZ2KzhBeFJESnJxZGhaZ0JYdUM2NWVCSlNtVEh4VEV2ZjRhOUVwZWRBVzFY?=
 =?utf-8?B?cHVxSHBOdzIrTE5jS2tEekNjOEk2WWtiMjNPZlFuYWJuYTY0Wm83SHhMWXhl?=
 =?utf-8?B?dXhCMVJ1VzV4RXROUytmYlpUTlQ4dVE2U1k2UEdZSDh6Nk42azl3UExvSFU0?=
 =?utf-8?Q?kLjFFHDdpKlPZEsEc7FvyLwtzt6dZHnm78JQ6q+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 381d111f-36ef-4869-78b3-08d972b4038d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2021 10:32:53.0317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Yr4UdhJ9rjzKm8sYfiLx9r0xIMit5dcLlNmnqjSOhovjlbK4sLCuek0l4xt4+AgmucismCqqUM7nmQ2TyLdsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4846

On 01.09.2021 10:45, Jan Beulich wrote:
> Commit 806448806264 ("xen/domain: Fix label position in
> domain_teardown()" has caused Coverity to report a _new_ supposedly
> un-annotated fall-through in a switch(). I find this (once again)
> puzzling; I'm having an increasingly hard time figuring what patterns
> the tool is actually after. I would have expected that the tool would
> either have spotted an issue also before this change, or not at all. Yet
> if it had spotted one before, the statistics report should have included
> an eliminated instance alongside the new one (because then the issue
> would simply have moved by a few lines).
> 
> Hence the only thing I could guess is that the treatment of comments in
> macro expansions might be subtly different. Therefore try whether
> switching the comments to the still relatively new "fallthrough" pseudo
> keyword actually helps.
> 
> Coverity-ID: 1490865
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> If this doesn't help, I'm afraid I'm lost as to what Coverity means us
> to do to silence the reporting.

According to the most recent report this did not help. Shall I
revert the change? Or do we consider it a step towards using the
pseudo keyword more uniformly?

Jan

> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -401,13 +401,13 @@ static int domain_teardown(struct domain
>           */
>  #define PROGRESS(x)                             \
>          d->teardown.val = PROG_ ## x;           \
> -        /* Fallthrough */                       \
> +        fallthrough;                            \
>      case PROG_ ## x
>  
>  #define PROGRESS_VCPU(x)                        \
>          d->teardown.val = PROG_vcpu_ ## x;      \
>          d->teardown.vcpu = v;                   \
> -        /* Fallthrough */                       \
> +        fallthrough;                            \
>      case PROG_vcpu_ ## x:                       \
>          v = d->teardown.vcpu
>  
> 
> 


