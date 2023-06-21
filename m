Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38708737D31
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 10:17:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552530.862660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBt1z-0007G1-JN; Wed, 21 Jun 2023 08:17:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552530.862660; Wed, 21 Jun 2023 08:17:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBt1z-0007Cg-GN; Wed, 21 Jun 2023 08:17:35 +0000
Received: by outflank-mailman (input) for mailman id 552530;
 Wed, 21 Jun 2023 08:17:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RZUy=CJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qBt1x-0007Ca-IL
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 08:17:33 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2081.outbound.protection.outlook.com [40.107.7.81])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1134b8c5-100c-11ee-8611-37d641c3527e;
 Wed, 21 Jun 2023 10:17:31 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB6777.eurprd04.prod.outlook.com (2603:10a6:10:11f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Wed, 21 Jun
 2023 08:17:01 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6500.036; Wed, 21 Jun 2023
 08:17:01 +0000
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
X-Inumbo-ID: 1134b8c5-100c-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ciy/qG3g2HBLdfu3J2tZqhN7b/+V4Ju6+C+DULrJ+ZOPLwxpFHYTNQ67HFmiKyNyRU7GEK9MxQx1GHoc3sw2lmfzfY50RLs+DH1ObXkATqDoSNfQ5dPUcI01TRAkwUbvm46Sn4kHShyUWWSpA81ocrfoiPbKtwL4timnJwWF1I9P69YZXpNWVBg5ReSX3eGAIPqMUH4XKxEoKCm09iEh/C8DI+RFMHRWcpU6l4JqxHFNTiBikPOXlJe+LIJEqjJHKuBq35csneF+2MgTMTpEpCKYy+SHepVW8+4PsH53Dk0CZFBONpbzO2LWJAGSStwc5GsLLqzSMIZsWNrbc++giQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UIzyyTURzen0PkVEXGjSLwPKXMg3Z2ai+0daJky0H2k=;
 b=Y7QBY7FDo626nKCwSh3AexM1WfEqwyOAXRLNxG5mn9RmrIN1d3EstRSIPKyHmnXBIulr2HHEl4HkTsFpGYTAH79Uis9BTs5xNnhoLKTRv5ezicAlCY72ZkMcgBJfbr7R20wGGGe3tdzjj2wpPeyiw9zfjwM98weEn4FrkBPAPw+3LPygtEZioguRuwOQKFauTkCVDpv+JILqjpzVQZ6OJGTVSovLYtGLm5rBPtKwaukL1hlNWsQ+DYV6grEjSqZ5rWk1P1xXQgoJxXL4tdz5zKBc628lxxtzbJXP+d7Q02OzzSE6uSR9oczS8EsMnnPVY6gOrOdU1pPdinbVm5cOtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UIzyyTURzen0PkVEXGjSLwPKXMg3Z2ai+0daJky0H2k=;
 b=JyWppJHhpprvTkP8DOC2Mc4eQmBzVbo3KU7pEFrZcUw8S0gTN8T+SBwOJdvyboAxWVzJl+uk0sbMi9drxur6iXvjyKjLXSSHkoaLNEdW0NGQcdSWaNkKk4CyoVtuLmaCLTHOnFb/qAIDT0XjFM5/PiPpu7gBbeMIVsW6cLrsXVadY9QKZJVcB68HHe8pofs+7/ZObMsim5mpgAZOcbHhk8WeHc6AAG2mnVprte8KJnFA8vN02vt5mR37DRZ6sEHTJ0AbGlnqdSlUPTgQRg1ftF1LuZyCPNyt6/7OC43NwTHjcTSzEsPg8YKhoH64o2qnEkfV7MInGvh0yMPsuu8WwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8c76c3c3-f839-ef03-4011-e223ff6fc938@suse.com>
Date: Wed, 21 Jun 2023 10:16:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] x86/vpmu: Simplify is_pmc_quirk
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230620174556.3898824-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230620174556.3898824-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0109.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB6777:EE_
X-MS-Office365-Filtering-Correlation-Id: d33cc900-4711-4b67-f52c-08db722fe3d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SGgJoFr95gwTvx8xI0SA+914iVJKvpO1Uj/U6y8fBn2MsBtFBBE+6Ij/EO61KHhER4/syu2ezKCV+HUvP9CS1K022T1qo7PCj8DtffikLOcttgVpjp9t48Kgz79ra6Juj0U5YkTNUhWsQBc4OmbeKrmN0pzOojjWql7JZtg3INyu1xnbtOIwJx3OoraFd40IjVzSd5s1GDgw+fhdiwxvrKxOWZByUTr35mVgGDs8xcIGVSDvDpvtCm7OC6waworPMbTH3L3R8irG9qXDmwnqRG1YLzFCTiBlhxRohDjC44Uc4GGaAdAUaRYZwwE+PGVSuf+lnDRsNDZ44c0Rupm5BneSgdcOLX/MEDlvktmMZy/LS2BVmMXqVswjMBZJ65UPayrIXyj3RyXu6raT+1+Ose6+8AyaBWoB3fV9YRG2qb3ArRM5Czqt5zx65c3uwOfXi3+oOnKfEQPSvrZbeqnIIrTu6Ei/imHMwIXDmX19HE00ydM9NB3M/ur2Pmu9TGzDcPjTRIjVM95wlCx4XhbqupMdTQq202PbZ3PnyGB39PJElxWoWXTWRahU/FHiO8VBf1AjJM3X88f2Z0J4O/adc3qFNyY0JA9isvVAoHm2I4kFXEfkdR+0soEFSaFJMz3qDc1qjZzwIW2WZg2XVckNbg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39860400002)(396003)(346002)(376002)(136003)(451199021)(66946007)(66476007)(66556008)(4326008)(6916009)(2616005)(186003)(38100700002)(86362001)(31696002)(53546011)(6512007)(26005)(6506007)(6486002)(83380400001)(36756003)(478600001)(54906003)(31686004)(5660300002)(41300700001)(8936002)(8676002)(2906002)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dGU0cXZaelE4aDcxV2l4TmVpYTVGTHB2R3dyT2hJKzFCM0F3dUkxa2JGNzBD?=
 =?utf-8?B?dUgrY0V0R2tLejVaWUtwUjhpN09XbkxoSmUvWTBOQlFHRDdqa0FQVVJLbWtn?=
 =?utf-8?B?WmV2OHE0a2pzZ1AzU25LK1VZbzBPazZoZXd1aW8xRUlCSWhrckQrcXVBL1NT?=
 =?utf-8?B?cGF2SHQzbUdYOVN2Q2JXdnBwR3dtWTRkeVpzeFcwSXpkRmZLdDlxOWNNVUlw?=
 =?utf-8?B?eER0Uk1RWGcrLzAveXNOc1FUZFZPLy9zN1VPUG8xWFVQRzQwVnpmendWNHJ5?=
 =?utf-8?B?WlhtNEJDZHFUOWh3cFJrNk1CbU9IQkY1aTBVejBDY1lnYjczdmJ2eWlYV1JI?=
 =?utf-8?B?dUY1b1o5NEFKbTluVjV5MzlQN1FkdGcwMmdERXZvTTFBc1R5bXZpcUk3eUlU?=
 =?utf-8?B?OG9tOGV5K0tuazNvcHJ0aGFqV2VtNml5b1ZXQkkrYU1DM21JN0hadEplTnJG?=
 =?utf-8?B?TmRDUGs4ZnE5MSsvR2dKZC9wbzk4OHlJWXVMekk3ZDJZcW04eUZaUW1rRUZ5?=
 =?utf-8?B?TkhZaDk5bVZoV1IyeDFESkcwcWVjcVR1QjZ2SGo1ZG5haG1IS3BraXIraUxN?=
 =?utf-8?B?dU1uVXpmQlhnVmxXUWFOZXlEZkFUOVNiRjRMa0FBbzJ5aS9HM1FydW5OclVO?=
 =?utf-8?B?MVJtMFhuWCtod2xXUlZocFNaY1A4aURCZ1h1SmprWWlrZ3RQSURhd2YyczZh?=
 =?utf-8?B?RVNnZVJRMDM4Y2p2enppMlZqNVQ3UzM1SGhBSFdlWTZHVjZqa2dDKzZnMVVl?=
 =?utf-8?B?OExiSisyNzFqSmhPeGcwbS9SdVQwMHZSU1diRlpHd2ZLYklWTWF4S3V2bzFH?=
 =?utf-8?B?TnhWamdpc0dlUFM0UnhJR1dQWWpnNjY0SHVJTGlmRWlpdVVNSDZQV3BqbDdD?=
 =?utf-8?B?MEl6L3pVTCszdno1cEZWQ0ZiRHJSZzlEZk5vczR0cGUwN0xpSnB4SXRuTW5H?=
 =?utf-8?B?TmpBRVBpYThQZ203bGNnNnRYT1Jpa0EvckJuQ1ZkZ3c3L3VxZW9hM0xMUDJS?=
 =?utf-8?B?aWN6VjE4cVlzQ2NHZURTTGxBWVloc254cVphaU40NitOUUJhTUhLYXlmWWI3?=
 =?utf-8?B?UDBOdmZ2TStXNjBzYm5GRENYUGtIcVIxRXRJODZhclBOb1NpbnNBaGNYR3BW?=
 =?utf-8?B?YmlPTlo2dklkNDBUZmphRzB6QkR1dDNxSEdYOEJrMXVkMDZkUS9DWXhxSjV4?=
 =?utf-8?B?MlNJSGs4ckZENGRIQzF0Y1BRZ2x6S3lIajJUSUQ5cVFPR0RROHdQL1BuUHIx?=
 =?utf-8?B?Y0NGTjRLNXBySlNWMXlmeTBKbkh6Rk5OWmUwY0NkRlBMcndHNzExTkE2c251?=
 =?utf-8?B?OFQ0OVNzdkZCSG81TXFNMkFDT2d6eWZTbUx0MytCTEFtSitnOWxBbHdiOFpt?=
 =?utf-8?B?Yzd0R1RIb1gwN1RnUzVocjcxRi93K3hBY1BDaVdzNmRBeTJKZ0hFSUE0ei9n?=
 =?utf-8?B?dThSTjVqbDZVRzF6S3pzRXVWVXFKYXpXSmtHaGp3N28ycnBHYTlyYkhrTGh2?=
 =?utf-8?B?VlNYekJrN3hVUUgzbzJHaEkyVnFhbWR1cVRJMkVmQkd3Z0ZSa0NSQm56QzBW?=
 =?utf-8?B?REdhNjJnd2FLc3d4RktuLzRZZ1dhWXM5bUNhMlFES0x4K0xOUU1EOWp0VGVa?=
 =?utf-8?B?M0J5ejViRTEwZG4zMzEyWjR0bmhHQmlFRTY1ekdHbUgybHNnQmtJZFdVVnlm?=
 =?utf-8?B?ZzRiMU01VEhhNG5JdG5VVmY0ZUxqMXRSK3RzNjRTdThKaTVYSlRFOTFRZDBn?=
 =?utf-8?B?S3dVNjlRd3JTWTM2MXBhQzRCWTQ1Y0xWd1h2SWZPK2p0cEZ3anhPNlRNWm9z?=
 =?utf-8?B?QkF0WHVOaXcrd1R5WnBENFZhNnA1bFJ1Qk13cWdSZFEzcDRMb1pzVDZpL2I5?=
 =?utf-8?B?dG54ZFEraHRIeVhEbkJ0MnBoNFZGY05KcnhVY0xEUitDM3pzTVZza3NYYXdh?=
 =?utf-8?B?OFJDMnlZbCtyUGp1V2labVVEbTh5T3lsMFdKYWQ4K2dzcWlVWk9MbGRoNVgw?=
 =?utf-8?B?citlSzNSejFxaFBabTJRc3BJZHJrUjBYaXIrWStlMXJuYkpjNkhpalI1WmNp?=
 =?utf-8?B?bzV5UjE5dTZiWWVOMzZCUHVBejlVWDgvRGZkMFlxSXJuc2dkdW1JejI1dEM5?=
 =?utf-8?Q?c3ERoQDOu1gud8TBWnRWkDixK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d33cc900-4711-4b67-f52c-08db722fe3d6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 08:17:01.6140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y03gauWt3PNNOMksp2MYFSt9B23A6gaVugJt1V/7gr496K5a1+NE9ntI/XoHo+4jnoJOsZTW/46lobajEllhjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6777

On 20.06.2023 19:45, Andrew Cooper wrote:
> This should be static, and there's no need for a separate (non-init, even)
> function to perform a simple equality test.  Drop the is_ prefix which is
> gramatically questionable, and make it __ro_after_init.
> 
> Leave a TODO, because the behaviour is definitely wrong to be applied to ~all
> modern Intel CPUs, and has been raised on xen-devel previously without
> conclusion.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one request:

> @@ -967,7 +960,8 @@ const struct arch_vpmu_ops *__init core2_vpmu_init(void)
>                sizeof(uint64_t) * fixed_pmc_cnt +
>                sizeof(struct xen_pmu_cntr_pair) * arch_pmc_cnt;
>  
> -    check_pmc_quirk();
> +    /* TODO: This is surely wrong. */
> +    pmc_quirk = current_cpu_data.x86 == 6;

In the description you say "~all modern Intel CPUs", which suggests it might
be correct for old enough ones. Would you mind weakening the comment to
"This surely isn't universally correct" or some such?

Jan

