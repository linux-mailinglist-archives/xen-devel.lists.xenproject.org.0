Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98852700166
	for <lists+xen-devel@lfdr.de>; Fri, 12 May 2023 09:25:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533713.830591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxN9Y-0007bS-V3; Fri, 12 May 2023 07:25:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533713.830591; Fri, 12 May 2023 07:25:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxN9Y-0007Z5-Qx; Fri, 12 May 2023 07:25:24 +0000
Received: by outflank-mailman (input) for mailman id 533713;
 Fri, 12 May 2023 07:25:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mY6V=BB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pxN9X-0007Yz-HZ
 for xen-devel@lists.xenproject.org; Fri, 12 May 2023 07:25:23 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060d.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 27a34578-f096-11ed-b229-6b7b168915f2;
 Fri, 12 May 2023 09:25:22 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7484.eurprd04.prod.outlook.com (2603:10a6:102:8d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.23; Fri, 12 May
 2023 07:25:19 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.033; Fri, 12 May 2023
 07:25:19 +0000
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
X-Inumbo-ID: 27a34578-f096-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cg7eN8w7BskBghb2WZscrW9r+CFjgpW3a0lP+ciqH+hv6+zujCQxwy+dOvnvwiOkd+Vaw/+eevi29VLOHt0WVRkIq+M87kblygXJ5efIfPAxSoaWVVH66Nr0XaEw17BObYyi7Y6x/6SLCjlykbc43gTdfRCCOhnJ5OL4oBMqR2mG4L2t2zVJ3/A7h1sgXxMTuFDyVmptVFtIWzP6wYxvpHDSGBR/4NQe9PHkD+7wdP1WexUf0Vblhd+4iNPRErYfGnl2n+Ab/Zv+qy6SE/CxaHbeL9nIV20dKw9/CpaVlSu/kNWJ56gAoWbEX1iAFnl/JcKO46MQa3boj+F7SovNCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VZ4UmRUFjPwOsf2YSnf6kGVLXFR7d2FX2Vj5IUKzqfk=;
 b=XmTXPx++3nw6FL5GZgiVIhKyqjuQ+2pq8VoFsVxR0M5LShY/FNOJvn7t2Xdkyc2b1SVubgIGA2VbKa+OAoWvZmPc9T358+r/9INTXkWW9X+RoMfNXuaD8Cm3QhqWcvciu4/srOzSQney9cjrRRr2sz8Y59488dw0+Ax3jvELk/zoPwV1cszDtN4lm6hvro1m5zprxLtV/obwNhSN8EOOe0Vu/i/Tc/tmJaHUYXqF8FisZanL38OFsl6JQhVVuJbvmj5GW24xN/PrW0bL02mmUCnPdwrEAtpBfqABEfxPu1my6wQLcP/5VrjkJcKrIHzcogLOJbfqB50lretN8lyYWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VZ4UmRUFjPwOsf2YSnf6kGVLXFR7d2FX2Vj5IUKzqfk=;
 b=4tTzZET/Fw3dNGMTc0e0RHoH8s0sgyrWSB2Lk65NyQI2GutdDeAYPMt/cvcwMb5zdhVWEj6DX/Sp52LGAYL9mlbxI/6O19wwaU0ro+Wlm8qUSNlH3GOM9rNNq3HnGgfhkNFF1JcNaTQfYZWeCeizUDetNbJheNGsN3uOoky5jcv5ix+WSU+WgG/z4dJ89rgax7RN/nVapbmMi5jJZqXVWH0Fgpq9vWvWEsu6efmLkX6oDrqSk0mAfY4+eI2R1yIgGP88N6v1vtyehoFwYuqZfEvHfKyf/GThwHyDkSDZ5TDADD45BZkuH7MLDPeItQahO5MxCSF1VSsfD7VJb9wFYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <61ae93e8-ac8f-b373-4fa7-0a8aeb61ef4f@suse.com>
Date: Fri, 12 May 2023 09:25:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 5/8] pci/arm: Use iommu_add_dt_pci_device()
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Julien Grall <julien@xen.org>,
 Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20230511191654.400720-1-stewart.hildebrand@amd.com>
 <20230511191654.400720-6-stewart.hildebrand@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230511191654.400720-6-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0159.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PR3PR04MB7484:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cc5424b-23e0-49a0-581d-08db52ba0a40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SVF5sLK6hI6ZMo9mQInwPPvqfGbO3f4rfT8jjBQH5uUFn21lKHOQJWEGfzvft/dyVz6cGVZYzZ8WkNY6TKAtt5vYtaocdupeIHyxYg45jTv92IdZmGeOD2ZETQXQxASNgl+e07Um/ERdvLkENsfKftgsXqhpMTPTMqSN1YrB+6DFXzs4n3WfrKwjjyV39moembah5Hl2VMKOb8WetOYtvu3ZVNTAavfDWNF+d3QLrX7Q7R1V+Yr5LJoTXxiEZIWiskSfgOLYvDTmTCzyKd6z/qdwl9MZkSDgzxjINzev3Lc4/7ut/BgynJGHDbQJ5plhPdBgtmvR6xu6p9Z6ipNPDBoXM6gZeiLLFm1N0rYASVrUM2IKzQn01BMyaPaYgiM0uK1UWdSaNHTJjPHsb/mpfaM+MJ81jU7gS6y606oo4jH13mfy0deLwcExpbrhuYDQ+HlB3KcIyMqZmOdzU8CrRkO51u+5Op4yUL0CYRCk9KS42sd8FV/M0Db3LKGYdmGzvZ4aXG0SiVGfrDm9WHJgTE37BKGjR3/wy5X0TVnnIqAdEHQzLAISfT4bB2XR8eSWbmpRXgBquu/x1qzXQTT59FdbxVXpjF56ueJ0PukC7wqQFyduei3VIgcqUdLV/W8KIi7zVlsNSbs6/93YJU9tEw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39860400002)(396003)(366004)(136003)(376002)(451199021)(31696002)(86362001)(36756003)(54906003)(316002)(66476007)(6916009)(66946007)(66556008)(4326008)(478600001)(6486002)(41300700001)(6666004)(8936002)(8676002)(5660300002)(2906002)(7416002)(38100700002)(2616005)(186003)(26005)(6512007)(6506007)(53546011)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NXVNOG1Sc3dldU9MS3BnSCtlNm1WNXBZWXFyQ2FsWVBlTDdWcW1OL1pQSlBB?=
 =?utf-8?B?bC9Pa1N3M05HMHVDUTU3VjRjZWY3OGVJUEdXRW1UQ1NCM2RxbHVVdHBXWnJB?=
 =?utf-8?B?YVJSNTZKNVVIZ3ZZSTVmdEN2dWtKMWIvRWVRWEhHR2hraks5U0xqYXAvcTA3?=
 =?utf-8?B?UEVjMUtuazJlcjZDN3M0ZXRkc0EyUVFSQlVudXdNaVRTVHc5R1lQSFhUSExh?=
 =?utf-8?B?QVNOWE1lb2F3VkxJTUNxV3ZwQmVxNE0yRitSQ0hOVmxzNElXaXVxSHRhNjk1?=
 =?utf-8?B?eXYwTFcxVG5HU0xYdWZ2ZnNzV1U3WjVDRlN6ZTBTM00xdTAzb05MaERPVDNy?=
 =?utf-8?B?dHJIZ3NlT3owa0xvZjhMdklPelBTZTJUMUhGdjdPUmJ5dS9hLzdWLy9WWXNH?=
 =?utf-8?B?VTBraGJZUjA3UWhhVXFHc2VOY28rVnZjbUJGdUhaa3RXRGlxRVhtTHd3Q3Vs?=
 =?utf-8?B?ZUVPR2UrdlRoYjFXZlM4b0U3QllMc3hPUnJhZlZWdm51V1dsSGVFOUFuUWZP?=
 =?utf-8?B?UzZyVHZtQVRKallyM21jZlVXU3ZQOVdVa0lYTElqanBNeXk3eThEWTFJc2Qz?=
 =?utf-8?B?MnkwY2NLKy9xSUtCY2pBbEUvdnZQd01IS2liYjlOcG9SOVVseXg4OHhKMGwr?=
 =?utf-8?B?cktBZ3R6NFBzQnl2MkZjeDY2c0I4UFhCaVBZNGNvb1RlbkFvNmt4SDV3aGVh?=
 =?utf-8?B?VUI3TnRWTisxYzViMDFmNVNsT2tKeHRPK3RFWkxHcVB1VXdlcHZXdmFYbHBr?=
 =?utf-8?B?UXJacE03QmhUaHBEY3FhVDdDU3JCcEo5RFl2YVZKM1dObWpRNXpEVEhvNzZ6?=
 =?utf-8?B?SjVEUXgrYWQxUVRORWtMYWJlOXI5T21sMGVLSVZUYnhxWE5YNEpqcVZXYkZv?=
 =?utf-8?B?ZFErTkMxdDFpNDJ0Q1VYTXVsSUFKdVVTV0FyUDZ0UGluYzdScEVWQjdwUEdE?=
 =?utf-8?B?LzNNMlp6UFFLVXU4TkpkeUxleldsNWhndStYaXVXd2Q1aXBWUXc3ck1Tbnow?=
 =?utf-8?B?NTFEQzRjVDBzOFlicDJXQXllR0xlNFBFeGs4VUR0NkZsTlltOEhQQkZDeCsx?=
 =?utf-8?B?bVUvWjE1NEN6T2N1N1N1Z1NrV1hXK3M1NjRQdzUzZUdtK0FwVmhhR3c5elJN?=
 =?utf-8?B?bGlwRjBTYWZ4S2pQSEVpZWRqZW4wZDBXTlhEYTZaSklOMzZtQlE4clFFdkRR?=
 =?utf-8?B?bUlHQjlGTVY1RTB3V0lNTFlXMWE5NlhpbUJFa21tei9lME1Rb1dOSnpVM3FD?=
 =?utf-8?B?bng0WG9qbExpbER4SytnaGo2Z2tCaVhzRzE4dHArMkMwVjVWOFpLUVJ1TWdn?=
 =?utf-8?B?T0FUM21kU2NkeXdDU1I3Q25MZHZCaDNNRk51KzlGU0ZDeTR0VXI5MDdCSHhI?=
 =?utf-8?B?WjZRbnJTaXNFemZGTWoyS3JobnNDc2NKNFVGTHJIU0NUazlqSE1qb3VkT0VO?=
 =?utf-8?B?emNocjBPNDBtUERtSWRGb1VHWGU3QkQ0NHpDbkVMT3pyS1NSTW91Nk41TnJk?=
 =?utf-8?B?UmIxTkFwd3NldyszZGRLWUZSRkNUUnZRTVROd1kvcDA4WjlOcjc3clhrSzdl?=
 =?utf-8?B?RWtTaDlVdW9vZWxja1MwTk15dk11K3RnbjBxUmxTWDlJMjdVaU10ZDBFS25J?=
 =?utf-8?B?M1BWMGJYVFh1anNZendiOFVqQXdJS2lDMkVBL2NTR3hvclIvK3FzTkhEb0Nk?=
 =?utf-8?B?WXh0eG9MSU1XNGVCSk5rbzBMNGxiWUpjK3JYc1BLWWMvV3Zvd1BMZDJqSVFG?=
 =?utf-8?B?cmpWWGRUVUFUKy9YdDBkWGg2U1NTdXE3RFBGdGR6Zm1HRDY3Q3hxd0NIWHQy?=
 =?utf-8?B?VzFwOFhXL28yUktGQ3d1c1pLaDNVZE9jN242WTBiR0loR2tZUThUNGl3a3JH?=
 =?utf-8?B?VE00cktRNUhkQ3JFQ2lLY20xZS9OdG5XOFlOZUI1Z05tRmpsTnNKSHJoSnl1?=
 =?utf-8?B?MlhLemFQYytnTmZyYUV2WktnbFJ4clU0VVJpT0R6SUE1dkhRdHN5Vk9OZ21l?=
 =?utf-8?B?MWtWbWFublp5bUx5eWk3NFBzNUYrL3FseFo4eVd1TFZBeWZrcGhkMmtvKzdo?=
 =?utf-8?B?cWdjRndVSEhiUVhRR1hZM3dhaUgyMUhZOTdqV25jb0JJTkY4Z3NYSXlIV2tZ?=
 =?utf-8?Q?9Vlzuvky+MVfEUx6Uy6GzS38x?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cc5424b-23e0-49a0-581d-08db52ba0a40
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2023 07:25:19.3805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K8PdTXipjC83reegbNOimZvJ0FjL3m8xXkk8Tzq/V7yRvykGGLfpjKjNOedAgFzi2PFX1jkwXiMn1I3WEQrkzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7484

On 11.05.2023 21:16, Stewart Hildebrand wrote:
> @@ -762,9 +767,20 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>              pdev->domain = NULL;
>              goto out;
>          }
> +#ifdef CONFIG_HAS_DEVICE_TREE
> +        ret = iommu_add_dt_pci_device(pdev);
> +        if ( ret < 0 )
> +        {
> +            printk(XENLOG_ERR "pci-iommu translation failed: %d\n", ret);
> +            goto out;
> +        }
> +#endif
>          ret = iommu_add_device(pdev);

Hmm, am I misremembering that in the earlier patch you had #else to
invoke the alternative behavior? Now you end up calling both functions;
if that's indeed intended, this may still want doing differently.
Looking at the earlier patch introducing the function, I can't infer
though whether that's intended: iommu_add_dt_pci_device() checks that
the add_device hook is present, but then I didn't find any use of this
hook. The revlog there suggests the check might be stale.

If indeed the function does only preparatory work, I don't see why it
would need naming "iommu_..."; I'd rather consider pci_add_dt_device()
then. Plus in such a case #ifdef-ary here probably wants avoiding by
introducing a suitable no-op stub for the !HAS_DEVICE_TREE case. Then
...

>          if ( ret )
>          {
> +#ifdef CONFIG_HAS_DEVICE_TREE
> +            iommu_fwspec_free(pci_to_dev(pdev));
> +#endif

... this (which I understand is doing the corresponding cleanup) then
also wants wrapping in a suitably named tiny helper function.

But yet further I'm then no longer convinced this is the right place
for the addition. pci_add_device() is backing physdev hypercalls. It
would seem to me that the function may want invoking yet one layer
further up, or it may even want invoking from a brand new DT-specific
physdev-op. This would then leave at least the x86-only paths (invoking
pci_add_device() from outside of pci_physdev_op()) entirely alone.

Jan

