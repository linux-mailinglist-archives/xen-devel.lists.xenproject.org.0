Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B482F651C3E
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 09:20:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466548.725440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7XqU-0003cB-TC; Tue, 20 Dec 2022 08:19:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466548.725440; Tue, 20 Dec 2022 08:19:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7XqU-0003ZV-PP; Tue, 20 Dec 2022 08:19:30 +0000
Received: by outflank-mailman (input) for mailman id 466548;
 Tue, 20 Dec 2022 08:19:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I7dU=4S=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p7XqS-0003ZK-Pp
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 08:19:29 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2073.outbound.protection.outlook.com [40.107.7.73])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03b1e9b8-803f-11ed-91b6-6bf2151ebd3b;
 Tue, 20 Dec 2022 09:19:27 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8222.eurprd04.prod.outlook.com (2603:10a6:102:1bd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Tue, 20 Dec
 2022 08:19:23 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.016; Tue, 20 Dec 2022
 08:19:23 +0000
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
X-Inumbo-ID: 03b1e9b8-803f-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=moCCgHycgASczPoQ2Wl9c/jMF30MYuz+ehT9ugQ4h/D+y+q9Djv436nRLMVeWeU9OtmVebomCqcNLy3nQCg+UEnH0Ns5d28hCuzWkCIO1Kc0bdVjnryKR7bg7PAdjvrgu+oN/H8Nmw8Ld6YYtkKJWaxmf6zxt4vlzi+rSYBkI69bnkIeXGqTn8Xbv9xd8RaTpBfLTBvqwq4PR1QSW7cM40c+T2KkLdW5WwaQ2IcBmXdfvVNpIATOgxewduWPIQ3afSi6sIzwux7xF7HqRAjjV6KPoN/hhwmbjMmN1k28vFbblBDe+1gurEyynBKtq2a5l+ElkQiNzIQUewz7QXlBtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t057cBvtoX9Bcp+XsA4S9V0+RYiRtMjFHvEdRjAfZDs=;
 b=iNLit5xIygPXeVVkYKkJWoQWgWWy0tuRPYYxyljs1wzeaHuC87UolnYnh6Lzn+QiiC7zQ6Qt4omHYVnIquaRguiA/kYDuysVjp106I+24YPygTjrVMJ1WcnfQWwv6JLNRRE8bNkXQFMTNb1NNz6tLk69EvMLlqYB2FiLtANa0yJtEWZSowAHONdw1qJcAsFIJD7j5JbdIzu1H7uSFXO7c9WcJ8XPmvdxsHSRsrNLU5sfTwGJE26wnVl31b/KQ9XBT8dl73Ymi0OZUoua8Kh7a1dNniQQWGT6YbwdXkvju9MsQB811IeCHug9M4pb2Pcxhttt/mQSO89yvYS/9J2YTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t057cBvtoX9Bcp+XsA4S9V0+RYiRtMjFHvEdRjAfZDs=;
 b=SqaUcr5FIdfvvqVqQ0tbW2mjeW3UmgbkqPGm/KsnbVjzFq3x4UwKGbe3Q3psBlmc/1ztafpRgSNmjhrSypZiQ2wBF2ihyNmbjNWM0slKrbpvbU87hTeSDlhSmTeGMxwyAxiBTmTjTOj7H8F9UpreGvFTiuR5Nr7ddG0cInyfEjIKVHNgr/MuOmmnH7UXrqVnsevq5UpyiOuqJ6tR7WaKKU7sba3rXHLvMpeCqauCHTDf8i2PZD2DT0xBX6Hpriw/MwL6ieI2bOatYCohtEdJ0Wyq/JrmID3bK2Ac46dJqD65kAaRbRYFtOgfc2OzGayX51+Liev+2lorwUHeC7SpAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <98839620-d058-5088-da3d-4d200d70b003@suse.com>
Date: Tue, 20 Dec 2022 09:19:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 02/10] x86/mm: Avoid hard-coding PAT in
 get_page_from_l1e()
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1671497984.git.demi@invisiblethingslab.com>
 <0026e56a0c91cb0dde9fe19200f473d720a9a950.1671497984.git.demi@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <0026e56a0c91cb0dde9fe19200f473d720a9a950.1671497984.git.demi@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0023.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8222:EE_
X-MS-Office365-Filtering-Correlation-Id: 96a5222c-5cab-4f1a-79ab-08dae262e6db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/nIi3oUEZKdO/m7qxWO9UOvydh9UaLjJhBv2nmbLFUS81rOguzkBgNofzXNlhC4envj1WywYjssEZt3SaYO8gIdOkf67EYRbQ8Ix7r4MQ3REvxG1Ci2W8XlqddciFCpuEn4SWuI1Pxb4K8nCsKym7VSPh8WkIsd91XpmAGJQk1Cg8aJ6GhVnAPRKzdO0jWkTci8eaJE2GJZaNFM4J9cjVuUwA3LAfx2TqhIxjpV9KPjoyZg2czst1pjqDq8uQHoTUSOiuTass7A/msEgLMhMCkEes8DZxq+eJpXOf6JSgT81H01RbxfYRChGX20b3Y+u7O8XfsJEV7NCleV7f/0BCqBvyWw60h0uv3j+1TZ9agsF8XvXVrudWtBLfJJOsexXJ6aldt0I8mKbQhmFjzSBmxYNu7EF5Hyn7iXF1LakrdfXgxhfCCVWl3/kXzANKPoUIxrSnPlgkHBfmU6zj/uxiv9A4IV3ZEPk9KrMEAYspefB53gCqfm6KfqaZVYrsdy2ikFH7wmqTwFNa4MTIBrbcjNrWZPW+5weoANQcEkPlKqCh57z697j6BU12V48UeexajGMwIhza3i1Ds0GdgFgLy9wV/Vzjftjovc1UhJLumzJEo/XbOOYAvLSq27qIsztj5V0AutVioWIWHeS0Gz50D7o1+cx0JLUjngh79GCPUnL9wTYClYI+NH8tHhmmZu3hTUd+j3o+7TlfzWjAydptKZs+LDCDd8zG2BgNg9pULo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(39860400002)(376002)(366004)(346002)(136003)(451199015)(8676002)(2906002)(31696002)(86362001)(4326008)(186003)(83380400001)(66476007)(6512007)(41300700001)(478600001)(66946007)(2616005)(6486002)(54906003)(316002)(38100700002)(6506007)(7416002)(5660300002)(8936002)(26005)(66556008)(6916009)(53546011)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cnVMOWlLbWpjWUthS3dMQlFFZjlSY1ZKbWd4em13OC82THJoWHBZYXBLalNs?=
 =?utf-8?B?YWpncFM2dVBJRnJiNkRhRWxvWGwzM0xSVjBucmovSDNwVVdUV0hMam9ZYWlk?=
 =?utf-8?B?TVRQd2FWcy9FRG5kaEx6T3FVWnRiaXZVWWZvU3lhL1BGbGVCUmxvMkRsRXRq?=
 =?utf-8?B?Z0FJOURZT0l6emtSc1Eyd3U1ZEVDQmJBZmlXKzd5ZndTMjJFSTVVQWRRUGx1?=
 =?utf-8?B?TjJGTVc2Q1ZmOTg2OFFqREl5RDExSmxTMmlBTnBua1FVa01RaUZVeDRMeHR5?=
 =?utf-8?B?cWxTcGZJWXlrYlVoRUpwTkgyZG9CUzNrMnErYVpmdnVmblduWnM1TXFsckIv?=
 =?utf-8?B?clJtVnZpMC9ybVhYa2NCRTB2blZXUG9WSDV2dmZsSEEzYTlJL2ZsMDRRa1lt?=
 =?utf-8?B?SUU3ODdlWGRNcERBOExWVDB5WHI4cmkvcW13SGdpSHNyT3UrQkRlQ3ZvNnBB?=
 =?utf-8?B?UVJoN0hrVmhOU1dpdHJFNFZVNGpZdy9RVEV0ZnVUZDVrdU9BU3NGZjFzdnNB?=
 =?utf-8?B?NHYyN1Q3Z3I3dnR6Uyt4b2dwSEhVbCthTDhkR2FteGNMaHBabkh4VUlXNEdB?=
 =?utf-8?B?UklVMFVsMFBKbytQS1d4MWxBb0VEUFBDT1VPM2ovdTczRkh4VWJtYUpOQ1Jk?=
 =?utf-8?B?OHhFUnV2L1dQVlVMK2pzRzhSelB2YlRYdklHWjhrdXB6VzB3WFJBSkJkTk43?=
 =?utf-8?B?M3VXc3FJTTFITGR1aWZxRUNUVG5hZHlFVXV3RGpJMnJSa3gvQmJJU0Fka0Vx?=
 =?utf-8?B?QVhEeW1xOXhPTUxLNlZQYlpuNS9vVEsxd1Awdm9yaEVLVXNUaVE3Ulc0amY4?=
 =?utf-8?B?aEZlY1IxUi8vZHFYV1RkQWF0UVkwNkswb2tFME5pdXppRTB3OU1pZ1RPbzVa?=
 =?utf-8?B?ZzNrMjkxT2VmTDlTZFdmTGdlYk1oZWFDRzFvcUp4ZG9wZklCb3dJWHIrUVE3?=
 =?utf-8?B?aGhtM2lKS0o0eUlLWG9sNU5CV05yRjF4RTlIcGNUNDdJT2VVOHVUYndrTWkw?=
 =?utf-8?B?NGM2RWpDekVyckR1NVN5aXJldmdVdEZhRmVkUk1GR1RrSjg1SDM3L3FMdkxQ?=
 =?utf-8?B?T1ZhK01DZ0QzSG41YlA3Tys2T2tZYlpZamlaRVJWN2hNR01DaTlKaEpKNHhj?=
 =?utf-8?B?bEJ0a3pqVHFTWXpMeUlIbzJZVnRNN2hIRDd1cUxnRHJYa0hpcGh3NjJtMG9q?=
 =?utf-8?B?ejBHUitLVXIwVFRLMFNRSHFMYnM4RDZnNjJydE9zWHhNQ0JTcDVISGZnVDgw?=
 =?utf-8?B?ZVRMS3ZVTytaTHZLbFN3ZDd2RXZrcTNJUDYxVWZydlRhK0x0WlppcmtGRHla?=
 =?utf-8?B?Z1RWZlh2aWdIaVZxWFBnZmpkNVIzYWpudGxya3pOVUkwN1U4N1hoanh6YzF0?=
 =?utf-8?B?NTFvNWxuZlVSTEcwTSt2SEZjekpUZUdaOUk5UUtNa0xRcEw4ZHVoYnNBL2pa?=
 =?utf-8?B?bkNSQXkvYnJINlptQ1doSWw1ZHNUVEpOcEhBWmFwRkNjby9UMnVJQlZ0ZjhE?=
 =?utf-8?B?TlhodUpRQktIamxBbVEvTVhvSW1Pbnc3NWRTejJQNWpwdTFnTkNsVisrVCsx?=
 =?utf-8?B?Vm5NL3R6TGRoSitjcTZkdFpTNEUxTVJFenljTDkzdHcwR09BYitzbmM3WlZi?=
 =?utf-8?B?NGM5Wk5jeW9EektZeVBLK2hTdmh6QTNDdlRFZnp5UkVSOERyYmkxUFk2QmtS?=
 =?utf-8?B?NEZ0RUphb2hRR1BnRlgwK2VUV1g4aThRclBGRjhnS0FzNUQyWXdDNzh4T1JI?=
 =?utf-8?B?eXB3a2w5TnMwaEJTeWs1anFJaU8veXlGWFlJQTFJN2huNzZ2dVhETGcycFdX?=
 =?utf-8?B?SDh1bGp1TXFPbkxxUG44WWVZaS9qblJIZ2NWb0U0K0o5ZXlvV3VwTjI0dC83?=
 =?utf-8?B?VEZGa1Q5L0dLL2VBVGh3MGVyTFhhL3VMZnczWW1rT0dBOHdOdGsybFBaV0pD?=
 =?utf-8?B?RUU5Nyt6KzB3eXJtWnpQc2ptVlc5YnZXVWdGc3BaZ0Q3c0JUanZkL05LcEtw?=
 =?utf-8?B?T2JWc3ZUcWQ2ejVIcldsU24wRTlxdGNxUTBGMElCRHAybTVkYXI3NUhoL3pW?=
 =?utf-8?B?TFlKR0pEWUVQU0xsWnpGdm5ielRTUCtYaDBNdUtTYmJzZ3llcm9td2R4aHFX?=
 =?utf-8?Q?0uA8qKfW7/AlgiA3nyQmXVGCS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96a5222c-5cab-4f1a-79ab-08dae262e6db
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2022 08:19:23.6193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b6OWDjxCrOKsAFSxBEwxPnkf8Pq+KR8xB0biaS170ZLQ8dgOoMrVed1pq9hwpfGh36W4YwylFReCAsPUY5he5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8222

On 20.12.2022 02:07, Demi Marie Obenour wrote:
> get_page_from_l1e() relied on Xen's choice of PAT, which is brittle in
> the face of future PAT changes.  Instead, compute the actual cacheability
> used by the CPU and switch on that, as this will work no matter what PAT
> Xen uses.
> 
> No functional change intended.  This code is itself questionable and may
> be removed in the future, but removing it would be an observable
> behavior change and so is out of scope for this patch series.
> 
> Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> ---
> Changes since v4:
> - Do not add new pte_flags_to_cacheability() helper, as this code may be
>   removed in the near future and so adding a new helper for it is a bad
>   idea.
> - Do not BUG() in the event of an unexpected cacheability.  This cannot
>   happen, but it is simpler to force such types to UC than to prove that
>   the BUG() is not reachable.
> 
> Changes since v3:
> - Compute and use the actual cacheability as seen by the processor.
> 
> Changes since v2:
> - Improve commit message.
> ---
>  xen/arch/x86/mm.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> index 78b1972e4170cacccc9c37c6e64e76e66a7da87f..dba6c77ef2f7ed7fcb7f7e526583ccadd35e62cc 100644
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -959,14 +959,16 @@ get_page_from_l1e(
>              flip = _PAGE_RW;
>          }
>  
> -        switch ( l1f & PAGE_CACHE_ATTRS )
> +        switch ( 0xFF & (XEN_MSR_PAT >> (8 * pte_flags_to_cacheattr(l1f))) )
>          {
> -        case 0: /* WB */
> -            flip |= _PAGE_PWT | _PAGE_PCD;
> +        case X86_MT_UC:
> +        case X86_MT_UCM:
> +        case X86_MT_WC:
> +            /* not cacheable */
>              break;
> -        case _PAGE_PWT: /* WT */
> -        case _PAGE_PWT | _PAGE_PAT: /* WP */
> -            flip |= _PAGE_PCD | (l1f & _PAGE_PAT);
> +        default:
> +            /* cacheable */
> +            flip |= ((l1f & PAGE_CACHE_ATTRS) ^ _PAGE_UC);
>              break;

In v4 the comment here was "cacheable, force to UC". The latter aspect is
quite relevant (and iirc also what Andrew had asked for to have as a
comment). But with this now being the default case, the comment (in either
this or the earlier form) would become stale. A forward compatible way of
wording this would e.g. be "force any other type to UC". With an adjustment
along these lines (which I think could be done while committing)
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

