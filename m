Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7622F7F3270
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 16:37:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637908.993984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5Snh-0006QL-A1; Tue, 21 Nov 2023 15:36:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637908.993984; Tue, 21 Nov 2023 15:36:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5Snh-0006Ob-6U; Tue, 21 Nov 2023 15:36:33 +0000
Received: by outflank-mailman (input) for mailman id 637908;
 Tue, 21 Nov 2023 15:36:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GR51=HC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r5Snf-0006OV-Nw
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 15:36:31 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0613.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bcc050d9-8883-11ee-9b0e-b553b5be7939;
 Tue, 21 Nov 2023 16:36:28 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB8PR04MB6971.eurprd04.prod.outlook.com (2603:10a6:10:113::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.13; Tue, 21 Nov
 2023 15:36:25 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.017; Tue, 21 Nov 2023
 15:36:25 +0000
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
X-Inumbo-ID: bcc050d9-8883-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BbQDIY1VZd9aWA+P397qmlPkBKiWTKjIfAEeV384c+wuTBOu1p5vEEW/gKRrY5MUeKLdqq80cPel4Yj+T9/f5AElOpY7UUFEwzpLZn09wryNtdmvFJBYB3wh5wutJGiuEnzElTtj6Yze/8G2v63y3M8w2F5b777gDQqJmNfBKkTO/FEe5ymJ1nRx4svgPX8yGwOZ2p4ASuSpQA5lWKLEkHqmY/CUGZIbanZAVmFmOxhFV6opjRYfy7cp4/lsytIwYJoNY4uxwK/nyOZsmGEjCP5llnNcpZxUO2o4GK0Dtn7y6ti9yGm6TvGTfraXAatGfS+g8ZfEwZWS0PYdHA1zVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mL+QmS734wylK+keqCeXWiz2n93rpRMnOk/+cHnj4/c=;
 b=aqiOgiH5ZROp+KQAY46VNaRirvTLUJfsukfMrhQub6HpASVyh0Fp3W+moNiHBQ2TBTbUH7e6ac5YGY7aQBmHt6pk7sIamYbf3GCGj/wFTO/ZwrmHY+lWSq77qGOj0GyO/iCGSLzBBo/JxFmk/nKcITjECRmClW/gnLFoUOuxC4BCw2OtF0Kt8Ki3+UMQSa3pLM2U/TkAbgV1RsZagzxepScCGPAn8OYlS/t0lWL5nrDqSmLsfCh80IID7h1cXtbmxbX0D3C1gDayrQ/z8qXa+GrZplp2NMc5XL6zhLPuJoYum+QMzMKk0e+PwD19x2VmAOJCeQ/hhOdjnhpoE9PDUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mL+QmS734wylK+keqCeXWiz2n93rpRMnOk/+cHnj4/c=;
 b=Wg5exixIkljfZx/CUArIPBUlhqynD5nt01EoEppIA5275gA1DcT/hmjOi9I4s2kdRbNaZn5Gz0HP7r4Hmu0R3GxzCH6eH6OwmVhhLUVDj922SrNZDT7zh9DGsS8x4vu9lEHpIPj+oHW5EwTUsMblEM6Lgmhl6Aa7kMHw9T5txhYVecBCfWPSzXMUGKopt85fwAshEPGG6+OfubG5S1fSHyh0lT5AjOiy+dCfiJVm1tohDcX2MCemOF2vTMUxpF83SmiUY6ESerq6NEpZ7RV5ufFRqKm2DzMGE2m26oDoRlHdqd1o/5tndp2X7HGa6ccl7tbX8QZ12Y93ZcMvmcdtkw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e40579ba-acae-4c11-bea1-a5b83208db10@suse.com>
Date: Tue, 21 Nov 2023 16:36:22 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] x86/vlapic: address a violation of MISRA C:2012 Rule
 16.2
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 xen-devel@lists.xenproject.org
References: <99114c15a4256e6a0f39bd6de232ee4b8ad9b587.1698239734.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <99114c15a4256e6a0f39bd6de232ee4b8ad9b587.1698239734.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0105.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB8PR04MB6971:EE_
X-MS-Office365-Filtering-Correlation-Id: 75783703-e340-4f26-ef0d-08dbeaa79ed4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RubctDYBIAKrAcE9UU9m+nKZRs2nW0L5qJvQFnY4rX/ecTkBmJA1FBjsz9uKXh4cq9P/FfKjoZ43NN4wQaNKEbV4KvwVigsDwCuiVIJdKYlW42Decn5PVYbicbUpbUoptAT3w+qd9urDP5RyW45cRuMiOSu6I7unnsssjIu1ucvj6mqnV5r0zTp3EbomPJXLHuL72JhhDMz4Im5uouvDkgpXkPhAwckq234KSNuMbs9YUrJ2JHBx7ZaBIbYMDiynTuFWa3gMHuToNFaESqDqq2VP0WaWkicHnMZs4s+dSpeHUv3GoiisQruTByYN4NrR1PHNfTktHQ3j4y3wwc0Bm/uVcJ896mLC1HsKrUcLdJUlVGSBIgRrvpESYAtlxgNgi1xgH6l91CzVvbsp+Y2q65QdnBQreVKkahZwW437idvFrK1Tt2meb3E32a0xiKH829r4pIIifEgIb9n3cH8wDUwNP6Axi5ZxUDqlaH1ve2wM3h+oMSziRD2/8gMde7YB52ZTK9PBAdKeRxUYCmGTU81yM6k7T+400lbRCMh1XjD/GouOiTrn60PKRVGvDYgWbO3vwvyQnbRt81QaxJpysJAJjlOtkvxezxVu+CXiBOTYXrGidPtnuwXr+0Z6T1wJEummWWEjWSy+e6lsmjBPCQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(396003)(136003)(366004)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(7416002)(5660300002)(4326008)(2906002)(26005)(2616005)(8936002)(8676002)(31696002)(86362001)(41300700001)(83380400001)(36756003)(66946007)(66556008)(316002)(53546011)(54906003)(66476007)(6916009)(6506007)(478600001)(6486002)(6512007)(38100700002)(31686004)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dkNPZEp5d0xzaWpqYVdYNEprMVUzRDk1bElaWTNsdUFhOG5PaHNWZVBFTWdv?=
 =?utf-8?B?ckI1MUtxcmZNWC91NEhJbmNVV1VndkQvZmpNSFJsWTlvN2hLL05CT0tFTmpY?=
 =?utf-8?B?TnlxTmc0cWpXYzFGSWhqMWttcUwrWXhWQVpRWFpmaUxiQVkrclNoM1Vkc0to?=
 =?utf-8?B?dGJYNWtUTTdvcjYwU0gyeHdHSDErZ3lqN3NCTWZ5dVNJb01ubStzTU04RVkv?=
 =?utf-8?B?UFhROEhFSEhLMTcxR0MrQlRnbWp0ZHVJN243Y0huZkpKMTY1RHovTmMzNGFG?=
 =?utf-8?B?MjZiKzJ4MGRKdDlYcmpZWGVrcUhMTTB0MDJ1MHYzNkNReW5zSlI3SnNNMjZs?=
 =?utf-8?B?ZjFGTk04MVJNRENwVXFMLzZUcVoxS0RTNHFxcmtyTzhHbUt0L1hoTFljOXI5?=
 =?utf-8?B?WXNXT2Vzd2VOTnNweHhXTWZkTE9acGNPTlZEaERrOVJKSnpzcEc3S2RjcktF?=
 =?utf-8?B?YWg1dklNWS9mZTJST0lvZ3dhbmJvUk9ONmNYQVRyb1VpaWRJcjJZazF0b3Jq?=
 =?utf-8?B?Z1VCU3Fuem1YcXp6SFNUQzRwVWRodjlwRHBBaEZGb05XUyttUmZHc0sxbTF0?=
 =?utf-8?B?T0Nkdy83Ulh4S282bjhXckQ4a3pPOFhFYWh3UEtmOGhBNDBxSWp0MVYxVjZz?=
 =?utf-8?B?aElJWGM3NlBhK1B4M3R2Tkl3RzNLbkNsSzg1R2hnTDRBR3dnQmVEWUJsWDhw?=
 =?utf-8?B?azNjc1MrOFc1VXlDdmpic1d0ejVVYVE4N2dUTWFUVG9ISTQ1VEtSbnZBOEFy?=
 =?utf-8?B?S251U1V5OGdKQU1URFF0TEl4WlFXeFRLSFpEaTU2SXdaVTB2bzVhQXdNaEJq?=
 =?utf-8?B?dEF2aW02OXU0bmF6NHk2eDJTbzJkUDZaSFB6RkJuQ29JYTNLQWpheWdtbW1x?=
 =?utf-8?B?UmpydFUyQkRjdlhNN1lhcCtoOGhPNWRBV21VbTJWOXIvZVlNMWlUTHI5azZV?=
 =?utf-8?B?Wldxb2VwbGVwS3VhUGNZRUlYNW83V0ZleWlubzU0Z1piUjRBRXpIcmZ4L1hD?=
 =?utf-8?B?eWFSdU5LbkxZRncrSnFHcW9hNk9JSnVPRVJ4QzlFRkJPQ2FFOWtZRGR2YzRp?=
 =?utf-8?B?MzNhQnhscVZQclk2Q0Ezb2hBUFBBdmxGYlM1cTAwTmRRVlBtZjU1NThCMGVs?=
 =?utf-8?B?VHl5NWV4bkNBMFVIUjdZeitKT1RxT0xRb2FMYlFDY2VOVmM5amkvSFlDS0hX?=
 =?utf-8?B?Tkw5V0dQZVo0VFpNYzFrUlZFcnkrV2NoZVhEVXlXdGUvVmlkcjRwamVOS21L?=
 =?utf-8?B?RXllSXpFa1Z4aHp1V2R2OGtaNWpBV2ZQMWNHMmpKM3dCdVYwdlVJSUZvd0lo?=
 =?utf-8?B?V04zOGxOK3ZKaERQZWtSMERDdk52N1o1UmpnMm5keWNkcElrTU1ZQnJIUmVX?=
 =?utf-8?B?UG5oMW9rUlhER1ZJNWZJV3YzR0wvbTFzRjY0TEhTaUpFVWZtU21vVEhEVndo?=
 =?utf-8?B?eHdHV0ptRloycE8xZjYwN290ZkpIWTBGU2FEVnp1dU5JS0ovTU93aG1oVkpH?=
 =?utf-8?B?UE9YcDdBWWI1blhzSHdnZlJ1WXcxUjNleERYSVZEZldaUUtkR00vMmk5TXNy?=
 =?utf-8?B?NW9NbE1JYjlndmZXWkJCdTMvekZyaE1jWk96bG9ZZXR0VThFSlAvUUVPa0hx?=
 =?utf-8?B?dE8zWTBOWTRhWVBSQ0k2VEtlN1h2NTFrUG9aWVREZlY5bzYvN2JKdHVNREx4?=
 =?utf-8?B?REVXUGZTUGs3bFRUUDFoL3JZbTk5d1cxZFhlTFNjZFdEVzVYM25KT1VZSEVS?=
 =?utf-8?B?ZlFQRXhxaDAvQU9QUDU3dDV2cHpDa3BEcVNUTW15bkJQMGtRM3dlVkVTSHdy?=
 =?utf-8?B?bVVKNFdoYm9idXRoaDhTaEQzSXE2SldvUDh6OWpCVTJpTVJxbk8xWXdrOEww?=
 =?utf-8?B?OXoyQkc3R0ZlaDFYMTdHcGgrTDFDaUhoR1NRUnFnL2s4aVh2NUs4SGFCQTRa?=
 =?utf-8?B?NEs1elk5OU5oTlgzQURCcnNvQitIbVk0TXZIVzFFMTZFRGhvb04vRHhFMkhw?=
 =?utf-8?B?TE9lZFNBZEI2MnduWTNUdks3Y2t0Q0xEeVFUemVDdmEyZ1dCWm41VUlxWVJ5?=
 =?utf-8?B?YzNMVmpUdWNoU3BxOWZCeE0zOU1wNmQ1SmphSXRvUkZaK0t4TDFMcllFdTBX?=
 =?utf-8?Q?vdUL0yT1FwUr2PUKUW85sXE3m?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75783703-e340-4f26-ef0d-08dbeaa79ed4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 15:36:25.0195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 95CQzP3YiALnkJoXI/w7tq1cvi5qk/QQX+OgcbN2u/doO2tsc73SCw5bBCTDaKfLEKIdG1pFIjBJaY0ehlJ+Ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6971

On 25.10.2023 15:22, Nicola Vetrini wrote:
> --- a/xen/arch/x86/hvm/vlapic.c
> +++ b/xen/arch/x86/hvm/vlapic.c
> @@ -1034,10 +1034,10 @@ int guest_wrmsr_x2apic(struct vcpu *v, uint32_t msr, uint64_t val)
>      case APIC_EOI:
>      case APIC_ESR:
>          if ( val )
> -        {
> -    default:
>              return X86EMUL_EXCEPTION;
> -        }
> +        break;
> +    default:
> +        return X86EMUL_EXCEPTION;
>      }
>  
>      vlapic_reg_write(v, array_index_nospec(offset, PAGE_SIZE), val);

Considering the plan to confine applicability of the rule, one style aspect
which would need to be taken into account is that the entire rest of this
switch() has blank lines between case blocks.

The other is that imo the overall result would be closer to what we have
right now if the new code was

    case APIC_EOI:
    case APIC_ESR:
        if ( !val )
            break;
        fallthrough;
    default:
        return X86EMUL_EXCEPTION;
     }

at which point the need for the blank line would also disappear.

As to the description - isn't this change (whichever way done) also
addressing another violation, requiring "break" (or alike according to
our interpretation) at the end of each case block?

Jan

