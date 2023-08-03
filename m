Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F1576E360
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 10:42:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576092.901846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRTuA-0000rP-JI; Thu, 03 Aug 2023 08:41:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576092.901846; Thu, 03 Aug 2023 08:41:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRTuA-0000ot-G5; Thu, 03 Aug 2023 08:41:58 +0000
Received: by outflank-mailman (input) for mailman id 576092;
 Thu, 03 Aug 2023 08:41:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VY8U=DU=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qRTu9-0000ol-A8
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 08:41:57 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0628.outbound.protection.outlook.com
 [2a01:111:f400:fe02::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 997c99b8-31d9-11ee-8613-37d641c3527e;
 Thu, 03 Aug 2023 10:41:55 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB7989.eurprd04.prod.outlook.com (2603:10a6:20b:28b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 08:41:53 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 08:41:53 +0000
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
X-Inumbo-ID: 997c99b8-31d9-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e4g41+gvolXteh4lu96LCzOh+jH7vUgMYcYo72e8zT7/cPmugqNppkmE8UejuQxNZL7jF+1W6iH79TvtzV20dUWPoDAvIniACM4CGDqnVREa7b5Wo+QjXovetClJ9nkxKB6rrT13q/2+CYFMIAjQcRdAUfQ/1Qg6JESLgc0h+rHWJuy3FshRNXtp63pDfwbnhsaK69Fv/soeurSEh1DLc/eU2m2Uy9wZQyi5oOGniy5HJJQD3iuDEJSSvECT81nN1+/85F9EsRKqJe/DW8MloBDUu9/1Fzt1An0KrEoMiWepkxbM1Tw7wmMNombAx6GZqKw+wj/CXyk6bPNK4ejIeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3O1vSwflEAE9qOo/cmIsG9F6LMui8WCEtFaeweP8yEo=;
 b=R+FYtC5Sje9k7PXSAzYVx9utIcxoEMSikQaoElPSPEjpxVwQvPzhfxoQfBBrtdaRYboWmZ/izX6WdSwtDVR5jysZmQTVjVT4C/+2Z6yZqvR7l7sqQfLNTZUVLE4PI0k9x/Q5JVHFHhtyqE0loZAA+CkRVP6ewzxN4Uaw5fneQ6dgDDgWpHQ7anb0O/ceybMsPXMNxq9bErU126Dw0+kNMN/8hSGsro2PQjEvdtMY2hZbmlEyW3bIfhoHEoe/Rl0NSHj+0YusOIMIC9ELDrPuU0qgp/baK7vArQscqd2dJipyzw3F4IQT8tAObHkKIcODWNr4A7Jc7PiLbHTjZczLtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3O1vSwflEAE9qOo/cmIsG9F6LMui8WCEtFaeweP8yEo=;
 b=X+y5bOBqgOI01VAXxhaT+7zUExeipsrPFz1haFks03JKewybHMTSjfkvQXN3zdC9B41gJ4WxtBpzKnf3gYnml79W6qVVlhSoOltnGbQfG7dpOVjVVVbjy6Mx5l40n//UHOFtw8v/XTN/3iu+LdHc6AUDQJ0PPl10ZDwOou50lN0ZHgpGAltLDvm8zshS2FBUycnk41HBhkY7q0xCc7RO9FZDsabKgMNa34FLH0a3Njm+sPDGM/9anHc2YANE/fY0At66/EID82RvFhcvIsDgeLh4WSVwar1P9uCAKSNEUf8nvG8xLDyeFZ8LUnn5VGapsvqqRmJd11w1L6JQ9saliA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dcb93b2d-fef6-0730-d0eb-f7f8b7ef17ed@suse.com>
Date: Thu, 3 Aug 2023 10:41:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [XEN PATCH 2/4] x86/mtrr: address MISRA C:2012 Rule 5.3
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <cover.1690969271.git.nicola.vetrini@bugseng.com>
 <16fa23ecb465442c566a18af0a569092075eef26.1690969271.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2308021847190.2127516@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2308021847190.2127516@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB7989:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c941f1d-c4ba-464f-b1fa-08db93fd7cb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	04lM+C9c7+hcrrAhG2Y+6xbBNxAgnDF40QZutwzkUIJhWvqiC8lKxWtPi2ATTwuhZ7vU8Jgd0GmzxeB6rHba1dzuLd4+i9pvlXgUy8k50OLnRe30bIZITrUFrWu4fhttLyPododCq+Wyh0GV3x/OqJPFWdw3rh3ZMjoxWXxLgAJ2pnlGRnT8wT0yyAEPopFX7LEOSqTPTkns07gEGOuAI2hUZJyvSsEzqZj+FkrqL/AKGLe2oK1nw9NdChsmb8+QiCfC4iRLHzgW+EqD0T1GPDZKxeVrKtY484HGrzktZtdlK73wXygeYYPMzrj0vxgPDiF2qP9UcxbeqGASAsin11ZNa3MGhwuhNyFwm+bsuxf2LeVDz0hBqegnIB4T9V1RIo6SaC6B07LnCMJXH0hESAD3XuD+8ChfF0VKGNf+g6Oxw8YphCKYnZ6MCTOvc+5F6IOvJAZawNUKoETy7wF5kBY8yJCdwHaBaKI+tD8YlVt60n8R+Qjfvuyx1RHh+1gqOdBOfKRyXOG0Yx215RcCav+C+Q3BgpmfCSSbSc8WfzaMNepPBG/e2ShsTTDPXdGrR1BxIrnJoxdFXd+WIeEpxPno6pUEqe5Abzyz9HYrxJtRRRvR0pxTCLzGWsPtYnhBDJKb0bdtu3BP0YvHylx10w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(346002)(396003)(366004)(376002)(451199021)(2616005)(53546011)(6506007)(26005)(186003)(41300700001)(4744005)(2906002)(66946007)(4326008)(66476007)(66556008)(5660300002)(316002)(7416002)(8676002)(8936002)(6486002)(6512007)(478600001)(54906003)(110136005)(38100700002)(31696002)(86362001)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MDg4OEJzb0NOTEJkQ3pqZDVWdTlPTEdqU296UkpKaytNUlVFUDNUUEZmT2g2?=
 =?utf-8?B?SUNyZkZGczRUVTI1OG5vMU1GTUhMS2tMOExnT3ZQWFd4anRsQk43WnRZdXJU?=
 =?utf-8?B?M3ljZHBJSGR4TDRoV3JIeGdXSXdqV01MNUdnWmRKRklrZkVhbFA0b29rZzlX?=
 =?utf-8?B?SWlTWkY4WDkzcGc2UzAvODZ6dGVJamhZQTZycDU3dk8yWGIraU9FMWxHa1E4?=
 =?utf-8?B?dkdycFJBNUJ2bjArc1BqQTgra0RQQlFaYjh5K0pHVXYrVWEvSThJYjhETzdS?=
 =?utf-8?B?dE9SS3lVVUIrYUZRMkMwWjIwVWFUbk55RXkrS2pkdHRDaVlGd0ErcUMxUzUv?=
 =?utf-8?B?SU5jS2VudS8zZ3B5Ym45ekxRQWNxSWs1V1ZtTFJRUHRZQ3JKOFVSdmFWZUFF?=
 =?utf-8?B?RUdGMk1KckRLTEVNaEQwOTFIcWptbnZmbHpnVDFzRGlHUWNIdTFsZGhqOUho?=
 =?utf-8?B?WFdHek8vYXRWcmhaeFNENm1BemRWeGxXdnN5VDdZSFFOdTAwOHltNzErMzVy?=
 =?utf-8?B?SzVvZXlSMkVTbENzTHFDQkxKVUdtS0RGdXJ0eDR4NXg4YnNmWFFuaUp6YWVi?=
 =?utf-8?B?ejhpVzYyRTVhZjFUNHFKWm85NDQxc25oTUtmUWZuMEJzYjFsQ1I1aHlwTm1W?=
 =?utf-8?B?T0lLek81a3FMZG13ekU5clNMa01mVlp6bGpXNGErN0pWbVh4VWxqZVNZYzV1?=
 =?utf-8?B?L0U5Sm02QzRDRWNId1JNOExWZ3pMUzBGendUWitCbnRjVDNtWHAvUHRETHEr?=
 =?utf-8?B?bS9rTFVDbXAvZmozUERaU2d1azY0K0pvRmI0R1dLeWFvMy9yVnN1bkdnbmVT?=
 =?utf-8?B?TDV3dXRoWkNPRDkxMlVMbGZaNVRqN2ZNM0FyeHQ4UzBMWjFNS1Ixcy9GbDRv?=
 =?utf-8?B?RGhyN2tFUXNEWktMMWVFeCt0N2h2QjJKWFpobnI3TDE4RXdaZEsyaGRVSGls?=
 =?utf-8?B?SkYwck5iMzZuM2RDb3Fra1dmbXhhSXpuLzJIcWRqc2kzRjltUklMakN6ZmJI?=
 =?utf-8?B?dmw4MERxMkVRa3RvdEFJWk4vWTF0T2pCRnRPdVFhWFA4NjJFZEdaRVZ1Tmx5?=
 =?utf-8?B?YVI2RjBtWGZhM3RLUFhMNC9ZZlN0Mk9IM0JUZGRQZll0MUFRUlUwZ3FJci8w?=
 =?utf-8?B?YnBVSWVKOTZKRDQrcjFVcEEvRlBCaUhqRjg1cGZndy9qQzFwcUZyaUtvbWZR?=
 =?utf-8?B?cmkrTWFJUWIwVU02bFdIYU5wTHl0ZHhQRm9oU2FLREdpVGxndUVsU0hEZ3RS?=
 =?utf-8?B?UEpBZUJyOTQvU0xFMk5uVlRDakxHQ0NuaWtBbEZUWXlKSnhHMUdqQ2t0Q29S?=
 =?utf-8?B?R2N3V2hIZCtQK1pHTGxyTEJRL0wvNFhYdmJLOVhuV2tIdTlVYzd6MlBtbjZH?=
 =?utf-8?B?ZkxKRk95aGFFTFBnSmMzQ0Z6Tld2TUVxVWhJQXdBUzF6eGdEOWZFMGZWc2E1?=
 =?utf-8?B?aHg5MVlaL3N0aERLODhHTFdiNzBLTDJuZjZWNVE5eW82U0lFbmloeFNBTDdl?=
 =?utf-8?B?MExjZCt1UFdWWjFDZTVkNVBNTWdOVXdnSVZwVXdCSDFLcUkwVXQvTmJCOTdR?=
 =?utf-8?B?VFFrSG5KV2dCRVpnTGlrb0lzcGc3d0UxUEZkQ0g2aWNKK0tFZ0pFZnVpSGlo?=
 =?utf-8?B?NFZjeXRFeDYyM2Fpc2s4WVNaTTduMjRSb3diMGdGb1RTRksxbmlMbFRWMU1v?=
 =?utf-8?B?VWZsc2N6emE1OVZyeDFkRCtSNG4vZkpBRFVoWHZ2d0NFMy9jbTV4bVhFQnRQ?=
 =?utf-8?B?UmJTaWRzYzdhZHcyS21vdmY1TmVKWDdDaDd0QWlwZmNDcjlMbW5oc1RLMGJl?=
 =?utf-8?B?N1lZSENKdFlkQVlzakllRmlhelppcnpERjZjRy8yR1Vhbjk4d0kwVndLZXM5?=
 =?utf-8?B?b3ZzaWlhdVU2U2x2OHBOcW40UXBhOCtEenBsY1d4MTB5Zi9PejFodmNpVHBQ?=
 =?utf-8?B?V1lHNktKMlRzOVJiaVZLMGk4N1QzcWE2N1UyQWEwVmhlWldqdUE5dDhGbWxN?=
 =?utf-8?B?VmIxYThCQUlyNHJHMXBRZnNJM1Q3NGFKVi9CTWRwbUpTTnFxOUNxYWk4cnR4?=
 =?utf-8?B?WGw0amRUbjQ2YW1zMGxJeDQyTFJMVWkrMlJqRFFmMDhlMHNzY0xiNTQyM1Zl?=
 =?utf-8?Q?HNY0z/yN3m2ZI6ZTxngub9nd3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c941f1d-c4ba-464f-b1fa-08db93fd7cb3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 08:41:53.3059
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DyqGVNAUDgr+j4iqPBwXKf8WmlTHXqxlJusXxeumBhW2AHH5vyuQ+bGfFp7wwhxYztgIcnUWYxztEYZHR81pBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7989

On 03.08.2023 03:51, Stefano Stabellini wrote:
> On Wed, 2 Aug 2023, Nicola Vetrini wrote:
>> --- a/xen/arch/x86/hvm/mtrr.c
>> +++ b/xen/arch/x86/hvm/mtrr.c
>> @@ -687,13 +687,13 @@ int hvm_set_mem_pinned_cacheattr(struct domain *d, uint64_t gfn_start,
>>  
>>  static int cf_check hvm_save_mtrr_msr(struct vcpu *v, hvm_domain_context_t *h)
>>  {
>> -    const struct mtrr_state *mtrr_state = &v->arch.hvm.mtrr;
>> +    const struct mtrr_state *mtrr = &v->arch.hvm.mtrr;
> 
> I can see in hvm_vcpu_cacheattr_init, mtrr_get_type and other places
> that we use:
> 
>   const struct mtrr_state *m
> 
> maybe that's better? I'll let Jan comment.

When unambiguous, personally I prefer shorter names (and as you say
existing code supports me in that). Obviously the longer a function,
the more potential future ambiguities also need taking into
consideration.

Jan

