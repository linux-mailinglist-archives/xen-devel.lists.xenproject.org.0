Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A231D67CA8C
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jan 2023 13:06:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485001.751910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pL10w-0000QT-Py; Thu, 26 Jan 2023 12:05:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485001.751910; Thu, 26 Jan 2023 12:05:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pL10w-0000Ns-MR; Thu, 26 Jan 2023 12:05:58 +0000
Received: by outflank-mailman (input) for mailman id 485001;
 Thu, 26 Jan 2023 12:05:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=71dA=5X=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pL10v-0000Kk-N1
 for xen-devel@lists.xenproject.org; Thu, 26 Jan 2023 12:05:57 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2042.outbound.protection.outlook.com [40.107.249.42])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5854333-9d71-11ed-b8d1-410ff93cb8f0;
 Thu, 26 Jan 2023 13:05:49 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7892.eurprd04.prod.outlook.com (2603:10a6:20b:235::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Thu, 26 Jan
 2023 12:05:53 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6043.022; Thu, 26 Jan 2023
 12:05:53 +0000
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
X-Inumbo-ID: c5854333-9d71-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U59pi/IFyxkp89gNnR45EgeJgf6br5cm0nD0wXFYIdmvy5oRxYb0OTITB93C7B7Mun4gEJ9IJhowBKWpYHzwP2UpAsi0ZFCvJk1NmUtLoCRqDv24rL987yJsjLr43ujMPrjFtKeyU34L0G4PJoGazUynqvrH0JKXC5ZddxzBpyKiNUx8qx+GQul8Ike/HapQMt9VP/6txHavEizNdnapY3Xp3CKreAA8FqlshQqMMDFDhGf0hpgYnc2Spz+AeooyMQCSoLuLarcqyUXDMSR8+7LK0N+t9gJ+PvD+OcgJ/PDz/D7UBr/ltVH+RkT8qiuTpXhUc30iLZrH9ZZY7t3wPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lgkh4n+3WNdn4C0TtYi6Ty1jSE4VWSqbFzvEfXccjvQ=;
 b=RL+YalR5zrICOwUR19w4QcWGcdHang2zsaCYs+kVcCIBHInYDgocxvAE+1uO2C4mcQ1kvLYPmnYh2Bf0ADKH2ZnUOHMntLS1AX9x+bqT3GuCu1JyK0j2xlxAbDsMNyRTePEt7DJ9zqt/+JJkhNx7w+KB864VHbJo27+54MODpFbk6hvxmVaEsM9J8ZSWS6x9aAn7ZNfyMgks8lVKhVn5WR3G4bDEsIm5t0CkhWEBuMkNEdFHu12uyFXn3UvgwG86C6tl/Kwkxj94FrDxZx5Gpwsu3P14arhLm1OLHwb1g4ZY2su0gSXv7NoiJGfYKbggSvd10eu1N5kLPgTvQF5RZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lgkh4n+3WNdn4C0TtYi6Ty1jSE4VWSqbFzvEfXccjvQ=;
 b=di1Jn64daczxPLS/QW00PoMgkBwGqHv5ujjvxw+JakMK4apknjAwOhZNBuuAIKATIlmI5rQVQhqKi8emTSUybwtteFJvtT6C+qNUphfxlQz3GK+Qe2AzwaQ108W50HGOnMKQvAkJYPNbCy2tJMlUfdFXCwXB4ku14l5KNV1//aslAqo7pZA3TE2hxh6dInh+u4v05hzpUN0sNHjiiHmPImUTlwAatPqs8xGeKCdJhF17/i8PxialkhBlHJmq6AfKuyZVPtGHevesPosoIsf1Gahtj7v+ihXGvLQTuxPC8kKHXnIQX54EJqrmvc7RkxYXK+2SIAqmfHOmB2H1iC30sw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <347328d3-dd01-4d50-b592-87544534f5df@suse.com>
Date: Thu, 26 Jan 2023 13:05:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 02/12] xen/arm: add cache coloring initialization for
 domains
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com,
 stefano.stabellini@amd.com, wl@xen.org, marco.solieri@unimore.it,
 andrea.bastoni@minervasys.tech, lucmiccio@gmail.com,
 Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
References: <20220826125111.152261-1-carlo.nonato@minervasys.tech>
 <20220826125111.152261-3-carlo.nonato@minervasys.tech>
 <308a7afa-a3c9-b500-06c1-3d4cbe8bbf65@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <308a7afa-a3c9-b500-06c1-3d4cbe8bbf65@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0120.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7892:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b8d39ad-196a-4c9c-5f8d-08daff95ac46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AwT9LERUYxnGXvJzC2aX71RuhuggoWXdfPOMrrq6QID9iZXTJLSgiusRU6dprpGIOmOvzgNqitH9f3mlTSO4ZAJPGRvF1vBNlu1PdJUrvX533eko1VIOJuUFuK7YHM5AIoOCshM61ut+9KvfwZDKPnKYo/BsaeMD2W6K1OtPQh+fDYhjNXdlYtvxU2Nx+JwJ3gYOk4wwoFeo1FqPYECyc5iWzYs4UevKnzRv1alVHJI3BlgFCTqUyjLH9tbcegJfAqmOX4xg6YgaZNzZZ2U6exxI1tNnhDsrrv1a7R7+u69A13hJKyH686pX0G57sIEnw/XHDwVRt3DjUWCwgJ3Y08HuueViJI5qKaJkn0j/vObAc4czDtWhMdAwHXB/i9pGKcrFGhGzNp0JDFzODjn9t1UPPsGiNXhpVkgffgECOMSpXeQwABJytcECAvQy9hlW9XYstyw8LT8oaq5qnCzKdcGES3GqttdfrBUkXFKE61zVyo9VVPdWP9gUmu0t6OhzJHMUMfhDroZ+4l7ls8YMaUHbxhq33QPwF5zGdICetJK91VWx6wtfxUTMhhQjf/0qT1v1apqFGHM5+3DoRz65/LOai7jnkT8L1FNVt03AKwyTmz92/RlBE8fnCk23d4nTLTi11tZ2+S+210EsoeGxdIQPcsZ0ZVtUCjsmBWO4HMRNapEr1YTtZV/ZcJf8rO/w60Yl0k80VkbfnhMWTS5kXrKwBuE0PCwFAk+Y2dZz7kg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(136003)(39860400002)(346002)(396003)(376002)(451199018)(66556008)(66476007)(66946007)(41300700001)(4326008)(8676002)(83380400001)(316002)(31696002)(86362001)(38100700002)(6486002)(110136005)(2616005)(6512007)(36756003)(26005)(53546011)(186003)(6506007)(478600001)(2906002)(31686004)(5660300002)(8936002)(7416002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qm0zOUcrTGc5dStBUTBwQmVjcCt3UlZoQWZXZmFid1laY1ZUOEd1b2ZBS2dl?=
 =?utf-8?B?anF1RFBWcUdPcjM1anA5K2tsSUN2aUtsTUFQaklVM3NWRkVHYmQ0enRNc3ZX?=
 =?utf-8?B?SkdscTBFRWFCTWMzaEMzOWtvVmVBdDQ0RU5aVmU0VkxiTE9jVmFsR2N0V1B2?=
 =?utf-8?B?OHpheHZtaFhUd2RnbEt2L3preW9DT282dVNNTzlzVW84cGlsYWZncjNILzNy?=
 =?utf-8?B?b1FmM1RySVNSWXpnUUwva1R6Sjl2NU15TEhGYkZoLzMzemJYVWhQdjlwc3hB?=
 =?utf-8?B?eEJRTUxQbVl1UmJmeXFrall2Y244d2ZzZlpUQVFUVjhHZWliVVpoRHNkUmpE?=
 =?utf-8?B?UEtEOGNBZUZmaU9rYVFLamZnMXZoVG5CZDhmaWtWaXNIc2VMTXFGaVZJRG5x?=
 =?utf-8?B?NjU3U04xeFdTRDlKRFJzcW54d2ErVGp2czB4Q1JNUXZWeU5zUVpUWDBkQ1BF?=
 =?utf-8?B?TU1Sb1JhYm84UWx4RllyMGRlcmRvREpaY3RSS1RBRTJQd0JoK25XSWcwSE9S?=
 =?utf-8?B?bnNyS0RpODVlOTY4NXZpSUwvYkxab3ljWEx0N2IyaTd4bCtxazhRUFN4SVdp?=
 =?utf-8?B?WTM3THFub09sMmZwUHVsYlJ1d2x2bDFCejk5dVdzUGpKcjBIajJORW8zNUlt?=
 =?utf-8?B?VktFZml3TTZYYmtqcStYZnZvRnhOT3VnanU2dVR6eVpKcldmOFNvZDlMdGo2?=
 =?utf-8?B?Qm5TdlZ5L0lCcklUaW5MOU56bVNqeVppMkRjMzJzYk5OY1RJMU5tMFd1QjNH?=
 =?utf-8?B?bmxZNkZBQWdBRWJkOWxYUkhYN3VMV3lMVEd3UXJIVTl4dlBzK1dQVkt3SWlX?=
 =?utf-8?B?c3AyQTFTTWtMdTJRT3pDT2xyUnVKeWhoOERCeXkxOGpNNzF5dG9HN1VUWHZz?=
 =?utf-8?B?WWt5bFpHcmd3OG51MDU2YU9OQXdPbUNxSTRZYmFsRlJtcm5PVGYxem1meHZw?=
 =?utf-8?B?dzFnL25EbHNyRGM0OVl2RDd1RXBVQkRJem5wMTRSMThOVHdNRzNlV1I5aW56?=
 =?utf-8?B?eXpMT2lUeVlzWFJmODN6eHAxNkhuOHdXQ3p1bXVHakJoRXdsUmFVR1lESFRq?=
 =?utf-8?B?LzQyMlNBNG5RWnVTVHFqck9zVGZtS2ZhQzR1bGY3cVRFcDJ1ZlFtZ0VuYktU?=
 =?utf-8?B?N2hZbnV4ODRWN2JtSGw0TmNuUTVzZXgxUU1GSk9QNnI0OEQzQnovYlJRMHpK?=
 =?utf-8?B?dERQMStzd1FMT28yUmRtYlJkZkNZc09HdTNKQWVmRDh5UGNsNldwdXJXY2tT?=
 =?utf-8?B?M1ZGTWhXUXQzUy8wb0wyNlIzRC8zV0pWQy93TVVvRElYN21yd3lYV29RT2U1?=
 =?utf-8?B?MEJvdE5uVWVJanp4VDJwYTJSbzNyWTlIdEJ6VnZnSFNXbjByU0hIaVE0c3pz?=
 =?utf-8?B?QTlIa1NPWlFTRUhxTEJjTlkvbjhzWWdOc2sydTlvM1BDYzg2QnVIT1NZUjZU?=
 =?utf-8?B?MVN2Qng4eXdFeDUwbnVPZ0QvTHJRdUlkUnVKZ0FrbUNVd0dqbE1XR0ZCSzhk?=
 =?utf-8?B?dlRFVFhvSUh1YlpIaml0YzNkVWV1Wk1EYWxNNjluUkNMTTJBbWdONWZHcHF2?=
 =?utf-8?B?dnkxL09GQVZ2enMxVnVTR2lIR3FVUUEwb2V0Y1lWanl2VEtoaGNMUmRTUjZY?=
 =?utf-8?B?UGN6VElnR2FvT29uL2lZbTdZd2JhVENKazVBbXVBWGZzU1JtTi84dkRRREEx?=
 =?utf-8?B?NXg4RFlkMUd5SVZxNWVwWk5IN1BlRGE1bUhxUG1pT3AvblJtZGtwUFJOMVpJ?=
 =?utf-8?B?K1RlVzFaMTZDOURLaHlmMC93ZkRhTjhkRTRqUWMyWC9JRDRSNHdYL0hSQWpp?=
 =?utf-8?B?WS9ZRHpFOHFHWVFrMDgwY21DNGN1YnpiaXlZQkpBVHp6N3creVhyU3AvVnVq?=
 =?utf-8?B?cFlBa3F1YXFxRmNEeXJZN252dHpHalhmQWorckRPazNYYnpmR1dVcFpUNjFX?=
 =?utf-8?B?Y2tZWUpmekNvYmFOL1ZnNDY1MUplSHV1K2ZDMjF3Y00zdTRHTnIzSldXdDkx?=
 =?utf-8?B?RlZMR2JRTkJydFVWMmZJNjhiQm1LREQyTlBtODNsTUkyL1d0N2dWOTdNcUFh?=
 =?utf-8?B?OGt0QkVtc3UyRlUzTkRZOGlHNUp4NnEycm1JUWlYRzZDc2R4QnJ4MjcrUGFs?=
 =?utf-8?Q?XeA/Qt32ScTnNFMJoB+ypq/+L?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b8d39ad-196a-4c9c-5f8d-08daff95ac46
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 12:05:53.3411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bwiBN+W9fn6eTv78XbtGxqgx41ONvKAkfMtlcKNgkKVO5abuVg7Y9vFtVhYzrnUhAkvvY6DEwv/lF1UGh3waTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7892

On 21.10.2022 20:02, Julien Grall wrote:
> On 26/08/2022 13:51, Carlo Nonato wrote:
>> This commit adds array pointers to domains as well as to the hypercall
>> and configuration structure employed in domain creation. The latter is used
>> both by the toolstack and by Xen itself to pass configuration data to the
>> domain creation function, so the XEN_GUEST_HANDLE macro must be adopted to be
>> able to access guest memory in the first case. This implies special care for
>> the copy of the configuration data into the domain data, meaning that a
>> discrimination variable for the two possible code paths (coming from Xen or
>> from the toolstack) is needed.
> 
> So this means that a toolstack could set from_guest. I know the 
> toolstack is trusted... However, we should try to limit when the trust 
> when this is possible.
> 
> In this case, I would consider to modify the prototype of 
> domain_create() to pass internal information.

Since I was pointed at this in the context of reviewing v4: The way a
clone of domain_create() was introduced there is, as pointed out there,
not scalable. Imo the prototype shouldn't change unless really needed
(i.e. benefiting at least a fair share of callers), and clones like
this one also shouldn't be introduced.

Hopefully this is all moot now anyway, with - as it looks - there being
agreement that this won't need to be part of domain_create() anymore.

Jan

