Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9B67A67D6
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 17:19:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604881.942417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qicVf-0001WC-8i; Tue, 19 Sep 2023 15:19:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604881.942417; Tue, 19 Sep 2023 15:19:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qicVf-0001U8-64; Tue, 19 Sep 2023 15:19:31 +0000
Received: by outflank-mailman (input) for mailman id 604881;
 Tue, 19 Sep 2023 15:19:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Lmoc=FD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qicVd-0001U0-MP
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 15:19:29 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on060d.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec22995a-56ff-11ee-9b0d-b553b5be7939;
 Tue, 19 Sep 2023 17:19:27 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM0PR04MB7107.eurprd04.prod.outlook.com (2603:10a6:208:1a0::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Tue, 19 Sep
 2023 15:19:25 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 15:19:25 +0000
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
X-Inumbo-ID: ec22995a-56ff-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ldYhESAKjYrdcnx1PYmRMyhCULJ4CR6uQfYrrStopVlIS1qcepBOEOakE3vBgadGfKIZIsLQgEjdXz/K9/9XV88g/xebbUc7rf3ecZNBOQ0T0Ch41mBy614tqkzUjQy70/scpg42vCMxLOBT+7IZFAK3guxz39kWx5tcmsQklKLkFP1dMX3Z/pmXQ0YxHcmnEn62ycfj2ayqlslEkyIDDyM/0aMAtBbnx3bb8EUUQusVJFkK/F09eGs8SWiffIQSzh1sjiM5KdmGWF9sltWniMt6z3iBbtAvSZYMYRukpnh1NOX5aD0r7yOz/H4mnZ+kUlLks9RYoQac/G2N7RbEWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cwQ/77f2HwI4YE4l1+opbRe7CbBa5Kl5pUJ+LjrDpJU=;
 b=idjYwJnXexaucMnWcYvpIcAzyBHL4795J5E3XAx5OMiIHk3BRy4zeyG3zwYGQV4eukEFFwXxnzkc/ImnT6PPr57DN5Podw9jqBpuFAPkMaN6onPg530kqWaI4jv/h4qFenbu/B9AgFnz9obffpN24r33U0vi3kTd1W82krqZM9FC/gE+ucsLsQ92YQHCaJ5olarGw8aqC5+NwmB1nSqpvrkeA5Zi3kcJTHsjJ1OBYq6fWx778LwS9kk8JCM2sSaYhXdDBDKlc9kBPSX7u8Uurw1VIePme25/jJGY40YjfbuQSXnDy1aga1qF0dX54E7z/vSaFLSJZ4WZ+rM1KwTGlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cwQ/77f2HwI4YE4l1+opbRe7CbBa5Kl5pUJ+LjrDpJU=;
 b=uytHEmDHxH0vXZ3jwPslMXcKlkbhnGFMR9tQyhof/g3Eet0VFKyAMxsbxZFtOsEiBf7i03sRUV9CYYCE92DUDd+tA/uP1m7VLxqXONv5+Ej/AV3LkKDqxxAq2pASKvAG6w6c9wGn5Tr9SemiRPmp+4QaPK7m7BBzb7MtWY0bSYSHkfIFXBohtzmZM/ep9617DFR7iMwTZKWFIG5oG99HGj5kpfQeSSt7xz69C22Mi/jUj1Q+FEEZ61viHW3vge+3WnHDcnA2jgz05OJBwYv1YbViRPzhB9k1h97hl1TNlamZDuCQmHG4Ohx3Fun2qwn9ofGPtEcRfsItnjN+ZoHlyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a4d85b38-5dcc-891d-27d3-24ae3dd5e533@suse.com>
Date: Tue, 19 Sep 2023 17:19:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2] x86/entry: Partially revert IST-exit checks
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230919150108.1233582-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230919150108.1233582-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0163.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM0PR04MB7107:EE_
X-MS-Office365-Filtering-Correlation-Id: a44803ab-1d50-4965-b392-08dbb923cf37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	w+k5CLPH8ry4lM6bcyVeZLqJyWrkfAALQE2r2905Vl/8B6DvdBVKm5sQopFaNvQe2duLp7f5RY1NfAO1DdZ31T0R3XLdIt7GtDiYkmD286pbDesYagkOntWIvMGh07Xr8IDW09mVK2DGPJFzIhEwkFRSMwScN1k1Qd4zPoiDdRORC/cIUN+B7VKoc1UTPkl21Mqd+afOOuLE+WGFpOrmPlPguupU1yeuIfMtnkubl24vHS2m89O4X/5mSzcC+DtiIr/7HTVwG+g1ojIqG+uLVE1ymNFdPF31hoPAn9NsZy0QrxscBwpdMYxR6VisIDBGqL2EKqfJRagJlyTzrSN+Qr4BwklUKlvkcy9Y2jIPz+Fvg6l94WlEcim7CnZ5Fk/h2R8SBcAkMcg3/kY+U6qWABSTBBZ/ohHXJQ5TfqjgpOt6BRAo/vzzXCHFbdZ0HJLK9rNfEw+0q4mGeC8At/EufrPAqdwFR3Sc4E7HCxDka9D8aJkESyGl8gAf/1y69lulDUU1qR8m0vDwFp5w8xdhwso2y/inyY1XCHVV43NtyYyGSWqJdxztKBORc2W99/7FitfM/iQJ6m4DCLE3HMsnBOh6Q3DW9WQx9XPzquKEMB4VWNwjRF1avHbK7c5l3cTem8pwo6nmnedtBR+NPJKRlA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(39860400002)(346002)(376002)(396003)(1800799009)(451199024)(186009)(5660300002)(41300700001)(8936002)(8676002)(4326008)(66946007)(54906003)(66476007)(66556008)(6916009)(31686004)(316002)(38100700002)(2906002)(31696002)(966005)(478600001)(26005)(53546011)(6486002)(6506007)(2616005)(86362001)(6512007)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGxLamtMNE84b0dDL3grbzNKbUhLTUFZRjFVSmZpR25CZTJ4c21ockdtRGRE?=
 =?utf-8?B?dkdPd2NlTVIxR0FqQ2I2MDVLbWFxTFdiL0VPV1U2VEN1Mm9VekluOTlKYUlW?=
 =?utf-8?B?QkFxMm0rTUMrMXFKVWNsM0Evek5xSkVkTWJVWFduVGRoZ3IzbmZNdzFLNms5?=
 =?utf-8?B?dk5aeFFwSi9kWlRUT2Y0K1M3SnZ4c0hyRjF3d2hPN0QxNEl2WVB1cXhwTDRo?=
 =?utf-8?B?YW91dC8zbVJvNDJ1WjZldDh5MHVNNGg3dHE2RDEzY1lJVEpJVG5HRkw4NldC?=
 =?utf-8?B?WjM4ZEd0YXRuRFgwN0ErUW5OMUtMMlF4Y1poQ3Fnb0RicjcvZWhScWR6aFRQ?=
 =?utf-8?B?R0dnZUxmUTNrSDgvUWs2V1kreC9SbUR4bHY1VCtMeGU5dkJyb0NhVlFYeVR4?=
 =?utf-8?B?WHVhMkVLZHhmYUNxWXRkZzdwa3ovVTRmTnZhamd2ek9jREdNcEw2SjBBMzlM?=
 =?utf-8?B?TG1STm5MeStnTGdGMmx0ZDQ0RG5ndkc5N0lDN3NkMzR3bUcwRW81ajFGcklO?=
 =?utf-8?B?Qm5pZ0lBOWNEaDNxMGprYXd3TmdkekJZUC90dm1hVFd6NmpEWU1lc3JkNVBT?=
 =?utf-8?B?S1UvaEhUZkZ1OXhIdWw0NEsrY0FtNXU1OEZIZVRVTmMyY2p2bldTMUE2akha?=
 =?utf-8?B?WkRxQjNBT0tUbTJEd2pTYTVPa1E0ZHJSRmVWbWlXV0hmS1UzZjlvUTFVcDdY?=
 =?utf-8?B?OWEwSTQ4dDVTTkZ3VnFGc05oRkd4Z0J0QndKaUxJL25vNEN4L0dnMW5BU1dM?=
 =?utf-8?B?a0s2M2VnUXhJVUhHSzRLL0VDTDdBWjJQV1dOeFUwVitxa3FRSjM4eFAvbEpa?=
 =?utf-8?B?ZjdSSU91c3BERmNwZE0rQUdXUnRlMDBLZHNPc1JyMTI2SEl5WjgvcS9jbkRs?=
 =?utf-8?B?NWJhbndaT0dNdExwNkFpU0g2aE5SQlg2cXBMbmRnYXBvSUprZFRRNkJtd0Ft?=
 =?utf-8?B?M2VUWDE4ZXFWaDZpczM1UDNsVTdqaTdvZExWQ1B2U3g5M1BvUU5mQU1POHRI?=
 =?utf-8?B?NlBoSkxDZVRRSVY3RkhkMUdxR2poRGpxalQ3Smw2UDV3RVBNUWdSSEdEUG1j?=
 =?utf-8?B?UWtJZ2xaVWFpNWxBb0orUTV4cGpacVlqM2VsUlRYUENXMXkxbXZEMEhOQ3R1?=
 =?utf-8?B?bVp3cnowcytqQThEOVhGUFpqb0lmUjlxOHh1Zk1zSFA2Q1l6ZFcyZVVqVnEw?=
 =?utf-8?B?N2kwaGE1OEFPUmtsTkdsY3BrZXNyNUVBRmFDVGp2YVg4cDkxaUt0RjI5SkVm?=
 =?utf-8?B?MUpCa3BpZUtkUEJZcUg0NExNY2g4NTRmMEluSnZDMU84SWVoajlNTk5tM2lo?=
 =?utf-8?B?ZjBqRkN2bFVKNExKVHZVT01BamdiU2FJVU9QdlNMcGNOTkNSM3JmRkEybm9k?=
 =?utf-8?B?YmxORWJRREUybXJhUitZL21RNmo1MW1pUEJ4SGR3U3lRYWZZZEduZU1NVHly?=
 =?utf-8?B?SkY1VkVIYnFzYXI4SDlJYUxFNFlOVFZKV2xBSkdPZytnTmNOK2lPSTJiOUJF?=
 =?utf-8?B?ZjdlUUx0VnErbjZoczR4R3loSDJhRSt0ajg0cjdqMVVnNnNiY3QwTjcrU0tt?=
 =?utf-8?B?Sk52SnMyT3lrTWRxemRvaHg4ajUzVS9ZejFpTEZxc1pSdXc2eXBqeVgxVm5j?=
 =?utf-8?B?SWxMNkZpWTBKTXpLbEc0VzN0ZGM5MlFab242bmJBWHdjS1hxRml0bTZLSHhq?=
 =?utf-8?B?WTI0U29haCtubW1wNmxoRUdXbEkzdVpzbjBwQStPSExzN2VUcldpWnZkWlpP?=
 =?utf-8?B?MEF0aFVkc0syNUtDcWJQSENOcGpFYTQ4VHFKSEtxakU4Y0xuemlMRzNXeG9O?=
 =?utf-8?B?d1FmOXBLV1Q5V1RoRmNiTDZERm54bnNUa1BLTzNwMXFnc2V3bmdOTXRvTWM0?=
 =?utf-8?B?TUtoOGJNcUppME5wUnBRanRtNkRobXZHaFd1cUpiRDJ3eWFTZE1MRW0waExp?=
 =?utf-8?B?bUhiU3laTGp2RkcrMWxibnQxVjB6Ly9kUkMvMVpMRUJTK0Q5MmpPZHk1TGQ2?=
 =?utf-8?B?aExSL3RIY0sraFNzcU9NczhBVG9vSjRPdGJzeTRQOHkzSE1JWmRueDZhQkV3?=
 =?utf-8?B?VWk3NWRLMDhLRmRxckMxMURZVnd3dEtaY2dUM2JCQm5KNkhOekRRNGFaZkhs?=
 =?utf-8?Q?W5znu1tSRzm7vYPZlZ9LRuOgJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a44803ab-1d50-4965-b392-08dbb923cf37
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 15:19:25.5591
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uK72I1rlaE59Izo9e5hN2/fHdPWcaxX6/+SzEX7FInbBB/yLE0cwz9bh+MpNZipOLzCQ91hm9W2zfrP76kR2NQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7107

On 19.09.2023 17:01, Andrew Cooper wrote:
> The patch adding check_ist_exit() neglected to consider reset_stack_and_jump()
> leaving C and entering one of the Xen exit paths.  The value in %r12 is stale,
> and depending on compiler decisions may not be 0.

And it may also not be zero that we would be looking for. I think this
wants expressing differently. The value in %r12 simply doesn't survive,
and this has at best little to do with compiler decisions.

> This shows up in Gitlab CI for the Clang build:
> 
>   https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/5112783827
> 
> and in OSSTest for GCC 8:
> 
>   http://logs.test-lab.xenproject.org/osstest/logs/183045/test-amd64-amd64-xl-qemuu-debianhvm-amd64/serial-pinot0.log
> 
> There's no straightforward way to reconstruct the IST-exit-ness on the
> exit-to-guest path after a context switch.  For now, we only need IST-exit on
> the return-to-Xen path.
> 
> Fixes: 21bdc25b05a0 ("x86/entry: Track the IST-ness of an entry for the exit paths")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Code change itself:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

