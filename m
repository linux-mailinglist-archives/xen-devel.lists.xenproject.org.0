Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA59566C884
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 17:40:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478876.742349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHSWV-0001b9-5y; Mon, 16 Jan 2023 16:39:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478876.742349; Mon, 16 Jan 2023 16:39:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHSWV-0001Yj-3I; Mon, 16 Jan 2023 16:39:51 +0000
Received: by outflank-mailman (input) for mailman id 478876;
 Mon, 16 Jan 2023 16:39:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SJiS=5N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pHSWT-0001Yd-JU
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 16:39:49 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2059.outbound.protection.outlook.com [40.107.7.59])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 641b63de-95bc-11ed-91b6-6bf2151ebd3b;
 Mon, 16 Jan 2023 17:39:48 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6838.eurprd04.prod.outlook.com (2603:10a6:20b:10a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Mon, 16 Jan
 2023 16:39:47 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Mon, 16 Jan 2023
 16:39:47 +0000
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
X-Inumbo-ID: 641b63de-95bc-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V1NYjqr0kRrSExesfeaRdvk/7CR1231SFGb1UyZZqxN81zkqP9G45yo8U7UW79k/vVXJRl4CJLubIx2mxF1gWS2uYLx8kA1cWmUA6V5VUIgU3Y2GoYlbY0CwDYHErZ6Av8GRlUResSE+2DTXQzoc38h4Dlr6HXJKXHnDVqgXZMvE5o7XplTKS+foD3otm3VCEBzRMKAjYfpPgVutYKXrZgdfiiP2kRApys/2alaRMo1lR9QdxUMYpvtoO7xe0hbkL/aWuf0cLL5Maa34677rYBm/cQAitxT7Kxp/the6P991CgdQIf7pGj5wkbi6EiTw0NSSIY7Kk2Joqgo+nTIBqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wipUpVRZR128WrxZa6clJijzB/y5fOUZjWYfTVbgmwc=;
 b=GhmO+VF3GJoqqeEGWk/lQ2kIE3yKHZlxQruD11AOh0rI1Socf7vkLt0k8cOCnzUV+9BNKwRNgkxQXzO6qJB9rw3oHj7/TAj4n1zDHwm6tuLsizAeEKvwMHoC98V6OoAmTR6HfOAo81ErwOY8fLiidSJ5YuQlSZwXLDN9hRxe3A6vr7xJyI2GC9mjauTiELo3YCG7rjZxOQIn6UBnY1MibdiQpBOtlu8JyhnAcqiHEbHiy5zDPPosWX5VCoPUabGsgt651KjUemQx4jNuK0F60BNz0yY6EfPniG92LAnPCKWfCoVt8fHHE/VgK2xbLa64iaMPaM0w2010gJAwZbCE3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wipUpVRZR128WrxZa6clJijzB/y5fOUZjWYfTVbgmwc=;
 b=Y5nrDzTLFEUTH77u+DrSy052Kb238IjXX/EgdBWnoVIGNhYLTakhwzedkp1QihtPxXga17Uu0CW+HNV+8OLLJwUVfvxEh5P+vJCxGiLKw0RP3XcXmyayTWhcFJlL4t7d2Gaox/+/LXlFGSkHJV0VYVkdhv1sVRLZpKi08knZpbc+Umr0DZbZwfc8KOO4PiriRgLjaWWRkZa9/Z+GkMDTJ+c8d0V2LSP4bmy3G1YS9rawNkvxPerHxfOqlVJU4+CeYQfwWa4LBrkUkjRQ7WyICiuRro3DHdwI/sJ0FgKWfhcVXoYRFoEJvEKqXbPuPvn2orhRfDUu10hBSup5tyw7mw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2f293899-fe37-eea2-2471-b1a212d35838@suse.com>
Date: Mon, 16 Jan 2023 17:39:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 3/8] x86/iommu: snoop control is allowed only by Intel
 VT-d
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20230116070431.905594-1-burzalodowa@gmail.com>
 <20230116070431.905594-4-burzalodowa@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230116070431.905594-4-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0116.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB6838:EE_
X-MS-Office365-Filtering-Correlation-Id: 332e3df9-39b6-49e0-c491-08daf7e04745
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mMlxcUNuOXowpJegqPgvPdd10NKaZ4WK1Cz1iAfnXZlNox1efTGQ36W/wQazRB6xd/vmkSYfOZPDGuFl7P2GxIxGnZ/KoXv5+rFSjfeTpT5CPWG26c5On0GxGAFkiCEU3VbjNTAP5Bz+JQsHHSYzrc6/0hjKvh4UKN5rVA6S/Ii3Q4iBBTzW0OOBp08QWpK4YBCdvd4LPoEk7heXN0Scin1O25bw6+aagUNuPi8BF3bdcBHOAoWQpkxZjv7+Iprhm6Z8LOP7pggL61AUtn83UkGaoxI7gBGQDlWDJnXNBvNQI0k7WIx18i7MyVh+uZQhCQs1XuVM4/SZviMklEEmJOx8OTgYZ4BmRDiRoMMzcjMfLhhOKxnnnsjt96HtmHkhyGnjmRBKnhDMlNZ/EqMDtsHeop2UQmb2DKXc2NKAN1oLzMmmA72KqD6++qW3bYR2zc9t0KyTEmTJ0jPzVsioD3IhZBldNCc3Dk9ht6fa55xPRUYy75GitcsLieGlfvqVzxKky9JFDPFggX1zbCOFidgjKJl4GL2snOwVq96faK/L5AFzHABPFrx1JXV0z/tL1K/N/vSoFN0P4npxmM/KxBAjiCxR8YK/1XpHCyO7V3w1cGTktSeCd17CAsje4HRLYOetBkGU04ts+3ows3gORyHyhkdMldu4oopCVGR3OI4ImpQ+8Q4jxEjzRBNJpEVIks421X/EVOIEy2iRBpay/NZoCbqOEgP8ahTE1BckFIA+Ett61h+ynO7dEPN35JON4DvHGqTsAC82IKtr3tko54bTM1v1U/lKtBhxqLGVOHQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(136003)(366004)(346002)(396003)(39850400004)(451199015)(54906003)(36756003)(316002)(478600001)(86362001)(6486002)(66946007)(4326008)(66556008)(66476007)(6916009)(38100700002)(8676002)(2616005)(53546011)(6506007)(31696002)(83380400001)(26005)(186003)(6512007)(5660300002)(8936002)(41300700001)(2906002)(4744005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OVNHamR0a1plY25jNlFSUzlvUnJLVW03UmptSG5DckUzV3R1Zm9JbTRSYWR6?=
 =?utf-8?B?QW5tc1BGVXdIVXJ5dko1QWhaUUNSTUlJMWJlbkZaa1g5elJFU2NxTTNUV3Ri?=
 =?utf-8?B?NVk5Mkh4b2NFWU9nMm5Qd0xzaFVhdXNMLzVKL0IvS0VmUkNxRW02b0VQekdB?=
 =?utf-8?B?QzAzbE9xcXlzVTlwMGRlOWdlT0xydXVsMVdiVGtKWVJ5amRKbmhzQlJLZ1Ir?=
 =?utf-8?B?VytYZ3VQcVQ4cnRxNWlaaGZpK2pDcTZDeTNMd2tzYkFxZzlWTUJRUFZyMHp4?=
 =?utf-8?B?cGtpZ1hENjhlQjFmOS9QaVBvSGE2R0FHc3BDVDZqWmUzR3pyM0loR3gvMDQ4?=
 =?utf-8?B?cjc4THU3NGU5T2N1ekJaWmlEK2dhTFZMalNIeDFqNmZYUUZpVVBOOUhKZUVS?=
 =?utf-8?B?VVVhZjlydzNXQlc2ZGdpTk8vREVqWEJTMDQ3dnBrbXUrVHNPSld4Z2p2Njlj?=
 =?utf-8?B?VExmeG1KVk1FbW96cFVha2J0S013a2kvaHpjVis0TisxdHpjclVqSGpqVTJN?=
 =?utf-8?B?LzV4STFWREJWTERqSkhpSW1USWdSK0xBOUdraU51VTdYaUVzcHpNb0lnNG12?=
 =?utf-8?B?YTJCaHE0WXR5N1Q1TVRaand0TzFxSWhYS2tkNVc3MldXakZmUUhhYVBwWThO?=
 =?utf-8?B?dExZdmQvRjVRN0VBeTVEaHU1WHlXNnd3cU1TYnRnRExBcDRnc3lGY1ZnWWZJ?=
 =?utf-8?B?RHBTTTNWV2RPaHY0NlhkRnVqU3ErYWRFRnRiM3VuSVUvVlFIUUZIbVBSTjBa?=
 =?utf-8?B?ZlF1UUJXUmZTSzd5cDN0L2tUY2JKdWhqVTBrZ1RwMHNEVzZlWHRRQUM3ekx0?=
 =?utf-8?B?NGhZdEhLMVBWRVRVS3AwbURiaGJBZmFCeC9yT1JGTW0rMnA3MjBpWnYralZO?=
 =?utf-8?B?SzltS3VRY2hPMFBKenUwdHVGeGFMZXZpR1BwYTJ2Z3EvRkFDc1ZFWUFORHlK?=
 =?utf-8?B?Ymd4SklBbW5BVXdURlNmQ3BWdmgxMWNaYk5DY0tvVTg2WDBaZ2g1cldSVEtl?=
 =?utf-8?B?elVPYzlzWTUzNkloNTlRZEJtSlkzNUptVU5tVmZSL3hKSXJCQUZMajNNMW1Q?=
 =?utf-8?B?M2U4dnMzZytMYjRIbjBCNGtVbE9XZW56MjNyZmlNZWQvRU5KNHhHL3habExE?=
 =?utf-8?B?UVVrQlEyTDVDM2k3aUJMZGQzVlJUY3pXVTFob0oydXQ5SzE2enRQcGNjSTU4?=
 =?utf-8?B?RFF6VzcvRi8zaXRuN21RUFNEN2dZWlRVRGxtVXg5OXg1dUg3TmhYQlRXdjJF?=
 =?utf-8?B?VU1RR1R6LzNnTmZlZ1NNT0dxbnhIenl6WC92NzVIMFA1YW1udXZpMGxlTlNV?=
 =?utf-8?B?ZklMMXZjMEUwcFFyL0xma1c3WEwzTFE4RkRla1p0c3BkN05Bb003MzBEYVYw?=
 =?utf-8?B?N1owNUYwc3kzYXBNek1rR3V1ODAzUHo3VlIxdHp2YUZkRENpVURiekhsWjlu?=
 =?utf-8?B?d3Y4MHpHMjgwQS9IQXh2TEdnNkNmQ2hFdjcwdTRUbU96dW5RNExkSnBCc1l2?=
 =?utf-8?B?VG5OTVlPeG9OM0JyUzlyWFV4M05mdlhGZXJIdkdqYk5ZajJualNvcm53VUFw?=
 =?utf-8?B?RjNjTXlzQ2pGZUcwa24yNVJGWVNteExhNklJdVp0dWlLSU11YXpzaFdqRDhJ?=
 =?utf-8?B?Q2ZYYkg1VDdtTmZJdGJNNHFlMHFUa1N1NWw2dGc2bFlNR3NHR3BnZzlqZjRx?=
 =?utf-8?B?SDkwM0grVENXcDB2YjNQQlhDVUx1STBwL1FCS2lRQzZBLytRUlBsSUtLazJB?=
 =?utf-8?B?TGNjcndnSTNSRTQ5ZFhyNVZ4YmtuQ0ladXBGOFdaRjdnaDlVZnFFd2xaekZV?=
 =?utf-8?B?OFhQdFJBcjRIQngrV0FyZDY5MXNqaVN3aFE5c1BuNm1ENmlzRVk1WkRoektI?=
 =?utf-8?B?c04zU0lBS3JhL2hHNEk2T2RCeXVOSEJOQ25xbG1oUXExWVY4QVZjSEpPUWwr?=
 =?utf-8?B?a3N4cVNsVmF3UTkvc0pmK09BZGFlSmZtaVc0MWRUY2tCYzZrUTZZR2NMMDl4?=
 =?utf-8?B?cmJjNVpVaU1rQlpqaFBXRXc1YUgydWg3T2hIM2lkOGlaeVkxcm5nZStuWlFG?=
 =?utf-8?B?STdzNmt1TzVaSHAra2FUd08ybmtBK1lVcEhDM0ZGcnJBZVZhbG9xdldGYUE1?=
 =?utf-8?Q?Gyj40gRgJ2WjmFbjca7UY/wXw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 332e3df9-39b6-49e0-c491-08daf7e04745
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 16:39:46.9179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x9zAb0wzS0lG5Fd4UhB40nC2XI1CaF16t+x6sIBlquB/opDJeYPiwuLyQX5tCutD9x8tBpjv3T8NvYkp1HBNwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6838

On 16.01.2023 08:04, Xenia Ragiadakou wrote:
> The AMD-Vi driver forces coherent accesses by hardwiring the FC bit to 1.
> Therefore, given that iommu_snoop is used only when the iommu is enabled,
> when Xen is configured with only the AMD iommu enabled, iommu_snoop can be
> reduced to a #define to true.
> 
> No functional change intended.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



