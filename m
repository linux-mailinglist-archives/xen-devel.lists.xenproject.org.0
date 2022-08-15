Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB516592FB1
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 15:20:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387458.623686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNa0W-0002QF-54; Mon, 15 Aug 2022 13:19:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387458.623686; Mon, 15 Aug 2022 13:19:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNa0W-0002NQ-2G; Mon, 15 Aug 2022 13:19:52 +0000
Received: by outflank-mailman (input) for mailman id 387458;
 Mon, 15 Aug 2022 13:19:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iVAg=YT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oNa0U-0002NK-6c
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 13:19:50 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70081.outbound.protection.outlook.com [40.107.7.81])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f04768cb-1c9c-11ed-924f-1f966e50362f;
 Mon, 15 Aug 2022 15:19:49 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB5203.eurprd04.prod.outlook.com (2603:10a6:208:c1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Mon, 15 Aug
 2022 13:19:47 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Mon, 15 Aug 2022
 13:19:47 +0000
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
X-Inumbo-ID: f04768cb-1c9c-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aNqS3QnuVSHy/bgKy4B18FQPC0YkbMpnY3Kn7uGDs5O6/kITf0oEdTw2R1SES7VIGJytCY1o3Pv2YpckX0DnmyRZKMAH0SfU2RN0AXYs/XkJ6TvI6ZknlH5OCavLA9YF8huIVTIlSZ0oCzD4wosspFAYQQxOCyAcdt/XnLK4PgkZa5bp+fJUBC3zA1MePank/TUXFkJjPoXXqVhgR0pNMgTrR3aOvHBvm8QbZNgiVS4XTPQHwdRtn/srOD/HgRcDk7od38t4qe+QL2RymdrpgrmnFFX3gogJXJQRF1gkh+ZzqwP/aKOUE3A7/Azxm9XOAzFz1EXsD7k8LJz4FA0lcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1YdWoEM69LIVG2zpD8xY//bqoZQk+sXJkxS/IzvKsHw=;
 b=IyaE3N3MYY2z1q35d9mW2esCpy2LcBUTQlj3NM/t1q165bNMBdV1yAcW5y+uekJXEgDL4x1z59vH9zqUD7mRI1VSwapAauczKuYbFfll3aPni7effnjacByqrSwT6hulNMA/9Lieo3ALPjkiVUWbD2Csys/zMdxSclhPuWmBHgCL+DKxgKy3SeHyhnl/Om0lBJ54FUI5VACgl2IQ57w+FWzl9PuCZfaF2xTUMUW7tLOWQ27O4QN/UAB3j82Z1eF02Y0jffWTko5ALMcPnxMcVByP6ihPuFLTJ1zvjzcO0Aimy8GhsF/r/kc0ieOnWz4++SoA5WK6vZLEFAc7A2orJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1YdWoEM69LIVG2zpD8xY//bqoZQk+sXJkxS/IzvKsHw=;
 b=pWjs1emFsdodVT+VLQaAtGtw9suqaURiQiaD1RHATqVwKZ0aJ57igjbaWyEWZslj/3DZtjOUOiHtVUKqBqUyHgjJeoGT0Q6pE78/5pbtwdUDcBArJ2s7Zo7AZ2S8Cc3nvAjOONfSJXq0G7k+Wxa3rDQGT47JIE4fWIFkKHNBo3jxtn9M2Bc6lSqceTy++jZ9wr8Y21z+mS3udHBf6cv+bgVF1a5lEaKlYblNH+J0MdSE0nq24mjd7Xxr/NTyyN0zxFEvjeM412as/31Ya2fKM19N5F/Yx1/QAdK1IpnXS5eDM5yJiamu3nJkyCF2qA2I8m9q8bvWMfj6AsAhNDlOdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f917d922-691e-b5d1-72ae-dcb79976d67c@suse.com>
Date: Mon, 15 Aug 2022 15:19:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4 04/11] drivers/char: make serial_parse_handle take
 const argument
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.05bda81c2f5ff91948f96e397b6836bcede71ef8.1660354597.git-series.marmarek@invisiblethingslab.com>
 <c30950363e09ab1298ac2a692822252762a417d6.1660354597.git-series.marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c30950363e09ab1298ac2a692822252762a417d6.1660354597.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0100.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e91514a3-2114-4ba8-3bb5-08da7ec0d34d
X-MS-TrafficTypeDiagnostic: AM0PR04MB5203:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6dBPxkt5EAcOIHUhH37bWX1DjSIN+OSErL687wjPrUSrLsN2o4fm00el0muaDRN5bnU7qGhA8G+OaWPg7ui4ofgF2Nc0M+LDUKIhnHObS0OLqFKzSipOhro3zZsfhE7DrQtyBXSRWabWFoC/i1jKKHEE3tAaH6mxCcfz3sH+eyqRvFM9OrkCf71g0yiaCSue21MCi0zJw9WofTLxW6PDU8tG99W9r2e7DYSR0AqoJ6yVPWUiW8dcTyGRdLjFDCJ68K8szEHRcy0hzo0MNsF1gqxxJtukW9xEOKsCzc6a6BRi5JqaOofgHhWAZOKj/u5YsD/C/frYi5zwfoHu9AFj99HCYdiHdrEbQ1Ds0M6oQiK73Yx4RaCKMC2zmPacpuN8jhyNwe0Sk54gurWOhRpv8WZerwsWoGs4CcSQuH6S0M1nU6Hl72oO1Ua5vhUl95BP1bb1Mp1d6aPkI6Yr+Lvz5BFEkQFrJkmnntVnG5f1/8giqqkyxykc4nd1jUU4pjwZ7wCBEgj7P9lmJPnnByNIYyFrlrTEoU/FDzYcxVzmrUv1CVYmpEyrwme+tZ4ulyBRkTKCoJLkPYMlKY0wiAZXzcjPGEvombxBT77HqKhFNVFsTWe72pUtYp45CHBkA/MMi6/za13MfOI4gStEmW3ylXTRM/fMZLCtgLYNjrdZXFcOPIZ0MDtl+A0cF1wFeIO3UhrzvL0scbpPUT87fV8mMyGCxegVpvGv2V5LU8vbIz4NLXyRO9ngf1UwfNlRZS864SmU2JYzszsqkBbkrQ9fz0lg3SUQHp+yA1OHcIECwU4YZzF7N3eh203qumf6oY0ivYPKpijL5pbdCHvKSOW+cw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(39860400002)(366004)(346002)(136003)(376002)(558084003)(86362001)(31696002)(31686004)(53546011)(6506007)(2616005)(36756003)(186003)(5660300002)(66946007)(6512007)(41300700001)(478600001)(54906003)(316002)(6486002)(6916009)(26005)(2906002)(38100700002)(4326008)(8936002)(8676002)(66476007)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHUveEdwdE50UEN6d1YydjVuVnpoQVhqQkw2emUzY3UxNlhNclV4c25HK2ps?=
 =?utf-8?B?a2NvYzlLOFlHbEJ2MWh4RUtWYkRuWUdCdkpTb0FXNzBrL0t4YWVHQy9qQzZW?=
 =?utf-8?B?WFBDYVB5TVVsRzhTdlkzKzJidmlrQ3ZjWnBRSUduQTg5T3ZRVGZDU2JEajN0?=
 =?utf-8?B?cmxrSGhVcGxFUXY1QmxVaE5wRHhJNXpQNTNoYjJUSFFPS2xMMWZtSzUxSlMr?=
 =?utf-8?B?ZU9KNFpOZUcvRU4xcm9scmJlTTVyOUJicW4vN0RweGVNZHNhOHZOL2dqL0RQ?=
 =?utf-8?B?N1FxUGNtUWNuaWhkbVpxSDJzdTQ4cU5uR0JEbFZIeUhIYmJHTW9yWkh1WWpw?=
 =?utf-8?B?cDFmSzZ1R0NwOUcvbjZzZWV6MVA4YndleUd6TkZzV00zREtQanpNWUtrNnBN?=
 =?utf-8?B?d2NOcE8zN0RBaWc3QWpsQ0g4cGovaHFOUDRkWkhEK2ZwSVpSQXVwK0t5cTZU?=
 =?utf-8?B?N3d2eC90enFra25ldkZIbmU5OGwraU8wbDY5b2JVczJTdUhCNVoyalpnVTdE?=
 =?utf-8?B?NzhtS29lRXN6T2k0bS83OTczRGJUSWk1SHR1aWFDaWlSNElJQjBZVk16VEhw?=
 =?utf-8?B?UWRoWmpHaWpPVmZNR3YxWEtyejFGZmVDRHAySFdXcXJUWllZakpQMzZYZFFs?=
 =?utf-8?B?N0dMaU1yZHZ0YjNPRncxQWVGb3ZDbTAvN2o4em1qMnV0S0cza3hvM21OV2RU?=
 =?utf-8?B?T21CMHpKT2lkd01kNjJ1b1BnS1RNM3BtY1VhZ1VmQjUxVS9yNmJIZTRwU0tM?=
 =?utf-8?B?c3dIYWYydGl6Vy91cE5lVWdVM2pEVDB3ZW9vdXhlOWRvazhiWVdDeDZaZGI2?=
 =?utf-8?B?WVNRU1d5VG5OU0hqWG04UnhvUHR6WVhzckVJQjMyRVpweXQwS2ZKdzRyaXdp?=
 =?utf-8?B?RWxrUFI2TUxmZ09yUmhscjRocHp3L1hPZTVDMEJxZXpITE4wbyt5aTdnZHZG?=
 =?utf-8?B?ejJWOEEwNUJBSkdzNlIwR2RBZm53QzloY1hhbXFKOU9pTGJqdWlVTnQ1cytu?=
 =?utf-8?B?czNpRndWSkFNd04zQlFPWkxhVTBFR1hKZHMvSGtmTEhvUlM0a3Z3UCswUW1X?=
 =?utf-8?B?Qy9DcG1mTzFWVE9LTGRmcy9zWjBzRlppeCtNQ0h6ekdUd3F3dDVOekIwWElC?=
 =?utf-8?B?YmpoRFFFN0k5K2J2eVlnV0pySEdpVjRqVmxsS2Zqa1VyaHdTeWw3aHVxN0px?=
 =?utf-8?B?TktHbFFteTVFSkVBQmF2OVdlUCtPKzB2NnJldWRpb1pkbVhkQVBuakx1dHUr?=
 =?utf-8?B?R2RVdS8ybnU2SXpPWEhiY1lKS2NDc3QyOEJRRkVkQmVyVWJmOGRRRlFqakFh?=
 =?utf-8?B?N3IvTmlFYWZPOVBpM2dZYWthYSszVXowdnpSQ2ZHV0ZsMC9JNWNLVWZ0VWZP?=
 =?utf-8?B?c2I4NEpuTDlLMzBOV3VVSVJwdnVCWnBkVnVWYmdRT3ZIQXBVQzg1VlRTaEYz?=
 =?utf-8?B?dmZXVEQyMnlGTjNaMHNTTklQNEVCM01PL05YU1c1QVQ3L3pwSXBHdHZMU0lO?=
 =?utf-8?B?eFlZZUpLZHpCb1N5TDJuN1R0TjFwUFo0TEFqc2JpN1FBTFBmTFlxTG1hRlZj?=
 =?utf-8?B?cTFneDFwRmExeHVrZkdiSUV4MjBkN0hLRjhVa2hNZk10VHpjWFNvUTNBdHlh?=
 =?utf-8?B?MnVHa0pTamR4Ly9uMzRKdkZIRHB2Y1NzenRpZllYbHI3THcwUW5qTzFPS3lD?=
 =?utf-8?B?emo5WmNmbFVQdnVKYUd3Q1U2dUU1TTl4eDZhS2ZLL2JXU1JBeXR0dTZXZWRs?=
 =?utf-8?B?Zk80c2I0cXZEa2ppUnB0V09nMUFkdStJWWxVeUNpNHYyV0JPTDltY0ZyRWs0?=
 =?utf-8?B?NzY2bGJlTzRqMGg5amhXdmJMUklpM0VPS0QxK09aSk9xTnVLTGJWRHRlVFNw?=
 =?utf-8?B?eWtWQmRwV1EwS0xLWXFWcUdKakFaVURSNmZiSmZFMkNrOFIvMThaK0Rrci9y?=
 =?utf-8?B?dS9KNFpsV3o2dk4yWG9rVHUvSWpPVE4zdXBxbUk4djg2MUZKaG9iYTdsRTRu?=
 =?utf-8?B?UFFTdzNKMEhaaURsOGdVYjBtTjdLWFdyUW1PK09ycmNyWkkvNUNUS2tBZW5Y?=
 =?utf-8?B?cmI1Z01lTHBFTkROUndkQXA4T3VKYllQNEw2Nm9BVERzWFVydHNXUmxvcEFo?=
 =?utf-8?Q?dGX0WKTHR8AZmLzzGADBH0+no?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e91514a3-2114-4ba8-3bb5-08da7ec0d34d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 13:19:47.2096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Z0/+5bh7tP8M7uWIKqY42+EmROYLgde5wuKubiamUAxmDN42CLew75+ZYXkpqfXsB0hjmtsaFHpn3W8ZiTCPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5203

On 13.08.2022 03:38, Marek Marczykowski-Górecki wrote:
> It doesn't modify it, and it will be necessary in a subsequent patch.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


