Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5EE46108D
	for <lists+xen-devel@lfdr.de>; Mon, 29 Nov 2021 09:52:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234338.406697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrcO9-0005eJ-Tj; Mon, 29 Nov 2021 08:51:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234338.406697; Mon, 29 Nov 2021 08:51:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrcO9-0005bb-QT; Mon, 29 Nov 2021 08:51:53 +0000
Received: by outflank-mailman (input) for mailman id 234338;
 Mon, 29 Nov 2021 08:51:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LLD+=QQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mrcO8-0005bV-6P
 for xen-devel@lists.xenproject.org; Mon, 29 Nov 2021 08:51:52 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97416487-50f1-11ec-b941-1df2895da90e;
 Mon, 29 Nov 2021 09:51:50 +0100 (CET)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2050.outbound.protection.outlook.com [104.47.5.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-36-RICPesd9MN2DVG94Tk6gIQ-1; Mon, 29 Nov 2021 09:51:49 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7037.eurprd04.prod.outlook.com (2603:10a6:800:125::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Mon, 29 Nov
 2021 08:51:46 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Mon, 29 Nov 2021
 08:51:46 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P195CA0076.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.23 via Frontend Transport; Mon, 29 Nov 2021 08:51:45 +0000
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
X-Inumbo-ID: 97416487-50f1-11ec-b941-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638175910;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lyySaEq89sPMQp80bGSBPjq8INEHew6hleOR6yp3Gd0=;
	b=dp1af7etc+fdkUDjBfh1aeScZ/yBfRcLUnI7SRa8vJ5Pw13MWuQeNMqzSonlWHBVOhkvl5
	rKpJgvBCj+7ou5g30dWcnjrCFdOo3aTlA05nURIh8ViOH+PhNlNGI//jbtD6ZRZ9rNProX
	5zs4iQK5IWD6MXlStk8JkJFA1laUww8=
X-MC-Unique: RICPesd9MN2DVG94Tk6gIQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lsV5o5jsH4IDGk+ZBh9Jg66M1yQzCqK7VT8I1kwl7zNbjRV+WwLD6ryebAkuj9E6QGV2rOWH/qnVDD/oCVZXXSJL4ezfoC3CJ0E5lP5RmoHH3GtyE1CZm8TWUN0QK8m6wzR4jnIwv9dR8DgJqdrmKTstC7YmztdN6c8JBw8RHwb96ik0oBgs9B2fnwqL9Jfga11zrcCZ1/G1irX/Q9z+tZRCkbc3iLSfBAn15KC66JazKnq8cbMfpOc84mfdcCeCWmkQdSKzOpkVkxGfQB+fnIVt+c7qG7tD4JDEalJ7i4Yhh16mLowciRerIwUJMTnnL7lwGTz6sibSBJbGmJP0RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lyySaEq89sPMQp80bGSBPjq8INEHew6hleOR6yp3Gd0=;
 b=Oa4J16/WJEsRlXunenC+vdsExbGtuikt5kJhJxDb0USu+gqD4KB4O1EFf7OBYjrVVBRan0GbdxqBaPPHMYiuyj47rDfPLlFOXAjhi9Zk5wFrCms9Gd80ZIrD3jn1hS2Sl+gYfQPAEhC7l6Fm9xjQ+xjLNbvgtjaCnvb/LPU7iX2lUhoL2WDqkhZzlXfCf+8SQZBjgY5wWPO761I3YTRp3iwY+oUEUvyIvoTLG70LRcliRH3FxALbRMOJX3MsSRIdnCpJKPkdPB5W/qJdKj/YRFe6TGydG9UV1mKQbWGAKeis4bXC61YYJrWXCldz/ck37EqXub0+wS3DPZ5oWoFd0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <18eb3a6b-34da-dbcc-0460-4085cebefe37@suse.com>
Date: Mon, 29 Nov 2021 09:51:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 0/4] x86: Further harden function pointers
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211126212258.7550-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211126212258.7550-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0076.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff47d3c6-3e22-48e4-1821-08d9b3157983
X-MS-TrafficTypeDiagnostic: VI1PR04MB7037:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7037445E544F457A6CFB4563B3669@VI1PR04MB7037.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jhaZZZClcU/H6GEgJ4RinBFili4alJtml4zUNdsSJL7zPQ58Tmw/6wkzt7ETjmEzav9nLaasLP6+j4OnZOhIi16/Nr4it3AaamVphwFTLJLCPfIijnkk1nsc1E6zV5kbpYdhCEQ/8Cz7myK1dXJZIIT6u94Cl8XEeMXsTMivfkWgNxNfAv0AV7VMw/3CyYnQKZ8SBeIQP8ECelYbfo8uoQu6cu520VH1urPpiQ4M+md0YWAWaGayoJppr+BnDRiy4HRaob5+qku1vFGqpCUyqVC2zdQ5nEs/h7oK0Ouy0BwNvGIfB1IzuX1jvtsY8dWu3mocW6UnMPV+UKSa+fvUKTOHe08IadY0ohqTSzeo3qw+Wsi234tQWgNRlq5t7XZ5839DWxBMQujAE/T8Gp37gq/u2WJHBmctePLYX19SLfNNtXx+OEo3SliHLGCv8hasRYofgBhO+7/ZvCgMQ0hlhTuEdoGqznI158RAwfZWhdjQsUeJlEub6tUxylVL6XISccyPQL7BG9bSk/M9S10xJb5yc4hLAIFuqsorMMWZG8oI8DHokSjuK6Avtkq80/K1qNzcXypii9Xh57cj6kSDCkzZeC46Ff4rz9W+eKR6csjcYuSok39kQUVOR7W0Mpz8aqTri2HFR238zAyqL62ZTwBOnPmfpaqjk/gZSvzfb91D8vbLwWyfsEMgoOhn7PAQp9rd4EfMEilsjtbeyLEg68Rq0PgAOHiyEm4Y8F/1vIHUrJpuqY4tP4pd5eow4vhh
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(8676002)(4326008)(5660300002)(8936002)(53546011)(31696002)(2906002)(66476007)(83380400001)(86362001)(6486002)(66556008)(508600001)(66946007)(2616005)(956004)(54906003)(26005)(31686004)(186003)(6916009)(38100700002)(16576012)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0pGK3RyWWw3WkREUDhTUG5wUnUrZXJ0NVNma0pxbUh5RW5IVk9IQTFESWpF?=
 =?utf-8?B?S2Zld0UvU0FGOGgwRVlHV3RyVWczZ3ZyeTkweXBiZWtYNDBQRklUUG9DRzF0?=
 =?utf-8?B?dzY2dHBOYzloN0x2OCt6eUJuNktHNFM5REVDdERQcFZGK3lwUkJNdno4blM1?=
 =?utf-8?B?bG43ZFpuNmlERjJnQmMzOW5tRzlGaTVyU05SN056N1VKVVZFamI2b01yMklS?=
 =?utf-8?B?cDJxejNPOGkvOEo4K1V0Y1pBTnNvUXZjYSt4M3F0RXlhczdCT3RFVk95cFJu?=
 =?utf-8?B?NzVyUVpQL3lzMGNvby9saU1tSlp6U2c1ZmZ4bFV2cFNaRG05Mkt6TU9rcXlM?=
 =?utf-8?B?SEVlVC9MRDkwVVZSSU1zemI1R0orZFJYYnBubWc3aUVtczZJWlBzamdKaGY1?=
 =?utf-8?B?bUZscHV6RGlDRGIxMmRzVCtDMzVSQXJGa2Fxck8wVmVEeWc2NUdXd2NMOVlk?=
 =?utf-8?B?eEg4UTFmYXVMYzcwVldxQVlETFE1bG96UVk2MEdydmlBeXpHbE1rUnI0Nldr?=
 =?utf-8?B?NkkydnhyTFBMRzQwU1Q5ak4zNGI4RGR6TXdSbzByL1c4UGIrVWxLUHR1WG5N?=
 =?utf-8?B?UGFDZHplT2JKRFAwVkVGM1NTSkxmaktZZjB6OXhXeGpYMDVwQ05jbWVrQlVz?=
 =?utf-8?B?NlMwWUhWcUV3M2h6eDIrWWp3WjhKTjhQZFBSaEtqZm43WURwL1ExdXM1WnJE?=
 =?utf-8?B?N2Y0M3ZZaU9tM0ViMWVpTEkyeG5DZE5pVGUxVkRFZEFoNytacU9rYzVoRGxP?=
 =?utf-8?B?NGlPK1BhMk5SblFOVUVMOUVrdWpvOFJpNkQyeUQ1U0lObVhXalJwaTNQUlE3?=
 =?utf-8?B?VDFIQlNmQjZWc0ptNmxOTWg2QUVNRGp6d25XTWtXOTFESzNBeURUclFwamkr?=
 =?utf-8?B?VVVZeTQ1U3g5U0tMMXBHZ0E1Q0VLL1dZS2Q5VWZiRlNjNnNLUzJ2d0dEeE9G?=
 =?utf-8?B?ZG1CRERGaUNsdk12WC9uM09OVTBwQ0pEd1lBTnQ4L1pTMlpOZFhyK1F5cTNX?=
 =?utf-8?B?MVZId0FlV093RVEyUzhjaGFiODV2aTE2RWZNK013ZzU4QjI2MGdMSkc2UWh2?=
 =?utf-8?B?TGRiOGppZ1QvNytHWXBWTXQ3emNYclRVdzBNdXFIa3F2STd2dy9qYTh0cUt5?=
 =?utf-8?B?bEpBVUhGd1ZKMU93RlJtRFEyazdZd3RabGtOMkJ4clp2VnZya2gvdmxucDRz?=
 =?utf-8?B?QUQvREcxcEVPejdhTndHdGU5cUxXTU9TOUpLQ2dvbGYvVHVxMWxHVWhMa1Jh?=
 =?utf-8?B?eVlJVzIzVkhjNzNSMER4TDV1L2hOeDc5U1NzTkJnbzdTNjRqN2xtQmg0ZzQr?=
 =?utf-8?B?bXJNeWxUR0JKb29MQ1NlM2pLSG90VHNTMi9hMEx6TXE2NDFiSE9JN1hwRXBK?=
 =?utf-8?B?eHVqc3FZSHY1eDVuNmREU01NOHQ1Z3ZZL1RlWDA5WndoT0NjWGFPU0FGdDAy?=
 =?utf-8?B?cVg1bngzdWtMMDJONnRXaTBBQ1NTT2hTUVVSRVZjYnd1eXJlRVFiZFloY2tZ?=
 =?utf-8?B?Y2lqUmxOMjJrYXh3djhKQTg5U2thSkJUUVphQnl6STBPZFBSeFFiZkNnT2xF?=
 =?utf-8?B?VWxFVFhFcXp6ekttcGJLeGp0OENnNWovY0c5dHFMZGZwd0NVWWJpbGRIZjJW?=
 =?utf-8?B?MEh6MUZLSTJFSmphU3dKVmlReHErOFNXaWpCSy9kOWlLTWpoQVIwQ3pETzFM?=
 =?utf-8?B?NnMrNENQYSs0dUxLeW1hNWd0YVJUWiszcUFLNXZwZFJJTmN3dzdTT3IweXg5?=
 =?utf-8?B?bVltcVlicW5GUlpCZ0VVZy9HaXBlYnRvd25CWGhuSit4MmVBRWJONmxtWDhV?=
 =?utf-8?B?SFpVZ20rZVovWUxQYzN0N0kvbUxNdHorSTQ2UHpUN3JRL3kyNzhHNHhoWW9V?=
 =?utf-8?B?YVAzQitKaVU1eHg1bExwYk5rY3JkTWsxWHBXNXptd1hQT001d3d0OThIMWV2?=
 =?utf-8?B?ZUUxb2dWMTBEQmhuNWFyZjRXbXFRVnFUWDF5ajNxTlFVeWVTQ2pGclN3K0I1?=
 =?utf-8?B?Q3ZmY0Z4aVh3d3d6ZGlCaGpOcGVnNFFXNFFGL0tvWERWRGNlZGl3SUR2MUZl?=
 =?utf-8?B?dXUwOHdmeW1wbUhxYjdRYnB3MHRrYjdnZzYwZSt6SEpCcUZHS3JCakxkRzdj?=
 =?utf-8?B?VXlNWlNGVno2NThoaUtxalhHbE8yaGhhd3hiQzAwNGtTOVJOQTM4NzZKTHBN?=
 =?utf-8?Q?fLo1+75i0o621T+DUZLVl6A=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff47d3c6-3e22-48e4-1821-08d9b3157983
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2021 08:51:46.6044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7fI07zwQVTXUON2r5FPZ5TPOM3CgEg5LFWq1Vzb3YvQ+znmuNz09IYAg8hUp3OjrxygptcT3cO5h6uApKHtICg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7037

On 26.11.2021 22:22, Andrew Cooper wrote:
> Slightly RFC, because patch 2 has some minor structure (ab)use, but the result
> works alarmingly well.  So far, this demonstrates converting two subsystems.
> 
> hvm_funcs is the other area of especially low hanging fruit, but IOMMU, vPMU
> also look like good candidates.  Anything which is partially altcall'd already
> would benefit from being fully altcall'd.

I'll post patches for hvm_funcs and vPMU hopefully later today. I intend
to look into the remaining unconverted IOMMU instances (so far I've
spotted one, but proper auditing may turn up more). For hvm_funcs what I
have leaves a few ones still unconverted; I guess we can discuss whether
to go beyond what I have in the context of that patch.

> Should we consider introducing __ro_after_init right now (as an alias to
> __read_mostly) as this conversion is touching a lot of ares where true
> post-init immutability ought to be enforced.

Well, it's largely orthogonal, but this might indeed be a good opportunity
to at least make a first step. I'd go slightly beyond what you say and at
least also introduce a respective new section, rather than aliasing
__read_mostly.

Jan

> Andrew Cooper (4):
>   x86/altcall: Check and optimise altcall targets
>   x86/altcall: Optimise away endbr64 instruction where possible
>   xen/xsm: Use __init_data_cf_clobber for xsm_ops
>   x86/ucode: Use altcall, and __initdata_cf_clobber
> 
>  xen/arch/x86/alternative.c           | 60 ++++++++++++++++++++++++++++++++++++
>  xen/arch/x86/cpu/microcode/amd.c     |  2 +-
>  xen/arch/x86/cpu/microcode/core.c    | 38 ++++++++++++-----------
>  xen/arch/x86/cpu/microcode/intel.c   |  2 +-
>  xen/arch/x86/cpu/microcode/private.h |  2 +-
>  xen/arch/x86/xen.lds.S               |  5 +++
>  xen/include/xen/init.h               |  2 ++
>  xen/xsm/dummy.c                      |  2 +-
>  xen/xsm/flask/hooks.c                |  2 +-
>  xen/xsm/silo.c                       |  2 +-
>  10 files changed, 93 insertions(+), 24 deletions(-)
> 


