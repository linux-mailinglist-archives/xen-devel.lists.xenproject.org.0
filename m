Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7ABE4A3F44
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 10:32:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262842.455244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nET30-0002n7-3B; Mon, 31 Jan 2022 09:32:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262842.455244; Mon, 31 Jan 2022 09:32:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nET2z-0002kv-W6; Mon, 31 Jan 2022 09:32:29 +0000
Received: by outflank-mailman (input) for mailman id 262842;
 Mon, 31 Jan 2022 09:32:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Fky=SP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nET2y-0002kp-Al
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 09:32:28 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3f891ca-8278-11ec-8f75-fffcc8bd4f1a;
 Mon, 31 Jan 2022 10:32:27 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2052.outbound.protection.outlook.com [104.47.6.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-12-9Ed8pKgdN8mfjCCsK5xFTQ-1; Mon, 31 Jan 2022 10:32:25 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DBAPR04MB7462.eurprd04.prod.outlook.com (2603:10a6:10:1a0::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.22; Mon, 31 Jan
 2022 09:32:22 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::7cc2:78a3:4d40:9d45]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::7cc2:78a3:4d40:9d45%6]) with mapi id 15.20.4930.021; Mon, 31 Jan 2022
 09:32:22 +0000
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
X-Inumbo-ID: b3f891ca-8278-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643621546;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y/QEbGFwmuZKOyG4ddqBcKsoT+c03Ca3DrZgs5+hJmA=;
	b=iQI0BTj00WcI09b7WSRX7T2L2ey75LAAJb6jKnqke5Vyv37sDOk4m7WM9+rB4VKDDO1Pf9
	LLlcwxTBW4hgXNaQK+lsJSKnjUKukUB4I0obgMMHKFUoeKc2dbdTP1irbcXZTS1UHdgs9w
	8rG5Vij8nskBGG/oQqlDt3BxhYuhxZ8=
X-MC-Unique: 9Ed8pKgdN8mfjCCsK5xFTQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M14DdHTP60huLZ8IAQyX/z1ql58Ffpg9e+tNpyi6tg/yh70lokVprJcoY/232TGAJMZx/zHtVBpVI1WEGVA48Iz2NaAyM217rBXQSatjpRlAPAgedMpg3EIhH2NpWUbSYkl1NDcWGGIjcAHFHedPR5tKUts51mEdmwqgY1TMe6dnPBYH8YKE2zBCqYr08Jz4CPiMN3BW/yddAYVcECQVvNLlBqalkBP1FtM0V0fNERLDUgi2EMIYOIF0TS1ZlujarJ8Bgjyk82nj9d+IKg03m0hfxGIQ02wG+h8tB2jqHyOtwnseSRnz2VQ/4f/2eN6EpOw8ovScp5gMI/x/ICqqgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y/QEbGFwmuZKOyG4ddqBcKsoT+c03Ca3DrZgs5+hJmA=;
 b=cPHQzNyk3MPYcWqAjsfZ+45Ixwo47SUFwUYi+lIUAZp8drr76Zq1W79L4ivCVbP9eAw72jC8d6LHH7EeyfC2NgsX96DbxL2L5xlzvc8t0ZMRut6hA0XnY4UehPs2A4INj80DqWkDKO9SsSEvXvLn5SQnwisJioN7fqGE0Unz9bXxvPG+POVnsvf5AEM+QzR/zqOpuvvPP6GCh041dMHM+FSJtRuZuJW4C3MkfD/ehvL2k+mykeThKl9PXWfYpjsZHRvpwlKmUVBkNmwtfy3X7/D95OuLh+CEmnFKOPYUKAxJbEwZEdWcCTe5zOM2620DH50ebUqov3k1CH/nByczRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ed1af815-8a03-5096-8ac1-df9062921871@suse.com>
Date: Mon, 31 Jan 2022 10:32:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 2/5] xen: make evtchn_alloc_unbound public
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: jgross@suse.com, Bertrand.Marquis@arm.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com, Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2201281330520.27308@ubuntu-linux-20-04-desktop>
 <20220128213307.2822078-2-sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220128213307.2822078-2-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR07CA0030.eurprd07.prod.outlook.com
 (2603:10a6:20b:451::9) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42058559-6406-4467-52c1-08d9e49c95ac
X-MS-TrafficTypeDiagnostic: DBAPR04MB7462:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<DBAPR04MB7462CDC495AA98A29B4FF8B2B3259@DBAPR04MB7462.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CmvlngUPaPcnkjqL+3vgfJ7gVk2BbCN7n3RvBDHl+72FGhZK+DPKSyD+4qH7pGk57lN42BbpC5O9Zm2E5P2JQtvZ8glJtQkK4NwZRKw66pnIuwwHXQ2ex6bsgOQtPFyysVyIJ9Co+GZaKWfS9Esue0TjjyfZ2lJRzlEtgEbBAGjf5W09o2eHW1rKwMWgcUjGRzfxIxFq9FoJTnFoBDfLtSzlbB79jv69AVKxUt+42z1yIlT1ocqb9p2/pbUpO+RREm0jR36q4Wh9qKuPI/btJMAAZ89lR/CaH0BA9ktiffrou9PB/RTSCHQxT0lk3/1m35rLdrUwRg0T2chUcx1tmu/9fcWpPVHn4yi1cCb6YukOXWeGKiV8vnF5TPPBlYn803SEgc08BeFSAMX9Mo1EKuR9qIFmmDMk4NC9ZD+7knMm14j4fnYlyMTgTgS3VUrj/zN23HFwevfoZGAUGK8bgwPNQ8zgsRGJVIzhZUEIXoDYIH5BamiiXGJENlxMB+YQ1osNYEVkgM3Mwqrj+Q54UINwQCmdn9Au+QlaKkakf/RvNMVnyu1FtEoQHhQNUYMeBiHmND1k1R/oYMnkuX/UJVhZ0D85XOm+NvVE6QH6lKyapMVR2FS2VAq80EpEu6VKV+DR+qoToUo3f6SlDyPraYo7Xq7prVlpEknav3uGDpku8/PCoIRZozYjpXFGgkPN2lmpfmurlla5tOzMcCCVC9x0Of1GGPMvLBYGnYJzck99KWFgOE74+4hvREiFTRm0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(53546011)(5660300002)(6512007)(8936002)(8676002)(66476007)(7416002)(66946007)(66556008)(6506007)(38100700002)(4326008)(86362001)(31696002)(2616005)(83380400001)(2906002)(4744005)(26005)(186003)(36756003)(31686004)(6916009)(316002)(54906003)(6486002)(508600001)(45980500001)(43740500002)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?clpya1RzTngzbzFqSzMyVnE1SDhhZFRBMEpPL0FTaXQvUWFwUTRzVmJScURW?=
 =?utf-8?B?K1RIOFR0aGlIMU00OGpQcnNPc1cySUZpSzRiMEtzZXFVdTExeXlackMzaVdZ?=
 =?utf-8?B?cFh3bklVN3pGWURXWElybHRhT0dkT29IU20veFhEQ3RaaWlCY3VNVWk0QnhE?=
 =?utf-8?B?NFpIcnNwZm9sTFVBcndDalQvSnhHTCtnK0hpdUJpWWxEajByVzY5RXduOVlV?=
 =?utf-8?B?UmFxM042QVYzSFQyNkwzQTNGRUZDSHJBTXJNSEtVYVJwTEM4aEV2em1zYzVu?=
 =?utf-8?B?M3lmQk9pSklXcVFaU3pjUnpaUUY5UWY4STYyUm5IcldxbEhDbXErM1FLandH?=
 =?utf-8?B?UkJlOVNLVWpuRlJrMDRMQ3RLUUUwMVcyRmw2RFY1bjJERnpmTnp6aEd0dThQ?=
 =?utf-8?B?K1J6ZFZsS2g1SVNYbS9wTGZ3Y0VaeUVuc2ljNHlpSXowMGJrbEtkSkpxRWFJ?=
 =?utf-8?B?N2U3aElwQmxDYWQ5VnpMZExLa3VFZ2JSLzRpSml1c2kvaWwrb296UFgybjNU?=
 =?utf-8?B?TFBIS3d3VUJBRS9MaGtSd1RYcWgveXA3VDB4dndwc0RhOS9RV1hxM1AzNlFZ?=
 =?utf-8?B?MjNpczlmMVluMUNERFFCWFUrNlJjUWRMOVIvMVBaUm5xNkxIM3ZvMW93QkxW?=
 =?utf-8?B?aytzWDJiWTZCU2FGaXhlNVdDOHFFek1oeEl3SElEemFwN3RrY1BvWWFsOEUr?=
 =?utf-8?B?R2VsT0NMR3p6cVFPQkNMRVEwT2N5blZad0lTSGFzdmpZQlFGLzZ2UWdYNlFh?=
 =?utf-8?B?K3o4VTJRR29Eb1ErL3owcXc2WXdwNEY3NkJQTDJqQWIzTUJnQ1pMUlNwazQy?=
 =?utf-8?B?N3pQWitkSU1sbDRTU1Q0ZWM2aDZGRklvdlRBamlCOExsNThnTUN2S2dwWk5L?=
 =?utf-8?B?YVJZdjVaRWdMOVRwVmpDdkU3dXFRT3pnUkx3bHc2Ym13VWJISHp2bHJoTE9L?=
 =?utf-8?B?MXlRT2ZsYW8xalk1SmpuaFdHM0RiVG9HWTZZU1BCVzh4ODRIYWtTTW0xNWRO?=
 =?utf-8?B?V2NFeWRoaXJSeW4yNEJWTUd4YW00WjBQN2U2TWkwY21VQ0gzZnpBNDNrRXlM?=
 =?utf-8?B?dnVCdEdQTEZwc1ZUWkdzSVdQaTgzUUpWZUFYeG80STFuNk9WWTRlSmpibHo5?=
 =?utf-8?B?eGV5UHQrNFJJNjJIQkdLRXRCUk04S1g5cFVQNDhTc3NsbE9RU3dhVzBKT09a?=
 =?utf-8?B?NWVlYjVwTXROdHRmTU84cUFybzA1emNsME9zcGdOZkloR0NGMlJvOGVpVlVp?=
 =?utf-8?B?cmFYd2RUei9qbHhrNW1PSi9QTnVYUFFmYncxazJaN0J3UE5rVU9lN2ltbXRz?=
 =?utf-8?B?elo5R1h0SEdMUG53d2hsOGJJUDZUTWxWT1ZSYkIyVUNTaDBpR2tEY1dIMWFz?=
 =?utf-8?B?SFZYanhKT1g3NFFvMUhidi9IYzg3Ums4YkdURW9iNmVOalRnanp3dDdHOGZD?=
 =?utf-8?B?MGdxaTY2d3J2eFlsU2tSbmRYdmVMSnNFZ2JPc1BOSDBuK0dlUnBtYno1aVBq?=
 =?utf-8?B?N0J3SktaVnJkQjBMZVF4SDNaanJqeHcySEs4VnFDSjFUY0VNa1pUZjJYYVNn?=
 =?utf-8?B?MG5sQkV4MUdVWHRPWUlJNlJlbEc3NmdhQXBjRXBaVTgxZ3BWNFBieE1EYTQ1?=
 =?utf-8?B?Tk9QaDFENXZIUGZydXcxdzlsYWhFTkhML1JGWkt3ek1ZeXZON2dHTy9VVU11?=
 =?utf-8?B?S3prWlNaUXU4YzU0REpaRHQrdFYvcERPaWYzeE5XTFVqSTdPbU9xR1JlcnNN?=
 =?utf-8?B?YTNNcS9oUkErUnRLZ2xRMFh2VHhSdDd4RXI3N0tTVEh0SkliODIwallPdlRk?=
 =?utf-8?B?bC9uemU1TVhtZnArMzRYOHM5aGozdGdlWTlGbW4wUWh6RVIyb1lOU2YzREcv?=
 =?utf-8?B?N2RSMkcvdnpyblJ2NkF2aUFqQzNDaXNVdTF1ak9zV1NVWi9scUNrOXNFRmFY?=
 =?utf-8?B?VWk0bVUveWR5TERKMXVyanhMQ1hiL0VyYVRmMGlMenFKeTZVMGYrQXhtOVZn?=
 =?utf-8?B?RmhBR01LdGpYaS91bWRFSE1VRHBiSUJvZnVvTjR1aHpjb25PQ0lQUVRtc0tO?=
 =?utf-8?B?dTJQMHpHLzdpZFdMZ3A5SXBCNW5kdDRCQmlGVGhsNUN6cDB0b29HMTJtakwr?=
 =?utf-8?B?dkozVFdCSkVhaHJOSUVGVWgwa2pZd2pySmtiN3E0T0E5NW5YV2JnRWEzcXow?=
 =?utf-8?Q?/YxvxJoe5ZJzqpEglKgiMC0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42058559-6406-4467-52c1-08d9e49c95ac
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2022 09:32:22.8015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8L3XkXOTWzKsNrLBYWTGb/OVn5hitC1nwfUtUkgBUSX3lHf2j+cGwTqRkJizfObEwonRYFBxVWm60dWxMskRIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7462

On 28.01.2022 22:33, Stefano Stabellini wrote:
> From: Luca Miccio <lucmiccio@gmail.com>
> 
> The xenstore event channel will be allocated for dom0less domains. It is
> necessary to have access to the evtchn_alloc_unbound function to do
> that, so make evtchn_alloc_unbound public.
> 
> Add a skip_xsm parameter to allow disabling the XSM check in
> evtchn_alloc_unbound (xsm_evtchn_unbound wouldn't work for a call
> originated from Xen before running any domains.)

What I continue to be missing here are some words on why it is okay to
skip XSM checking in this case. After all an alternative would be to
put in place a suitable domain as "current" one for the check to actually
work.

Jan


