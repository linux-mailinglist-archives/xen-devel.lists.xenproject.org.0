Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFF65826B6
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jul 2022 14:34:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376156.608739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGgEf-0005Il-Pj; Wed, 27 Jul 2022 12:33:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376156.608739; Wed, 27 Jul 2022 12:33:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGgEf-0005Fn-MN; Wed, 27 Jul 2022 12:33:57 +0000
Received: by outflank-mailman (input) for mailman id 376156;
 Wed, 27 Jul 2022 12:33:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C2cV=YA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oGgEe-0005Fd-JG
 for xen-devel@lists.xenproject.org; Wed, 27 Jul 2022 12:33:56 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20068.outbound.protection.outlook.com [40.107.2.68])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60e3abc5-0da8-11ed-bd2d-47488cf2e6aa;
 Wed, 27 Jul 2022 14:33:55 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB6941.eurprd04.prod.outlook.com (2603:10a6:803:12e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.25; Wed, 27 Jul
 2022 12:33:53 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Wed, 27 Jul 2022
 12:33:52 +0000
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
X-Inumbo-ID: 60e3abc5-0da8-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AHg57wS0xtWa7LB052MMoDhA/4RM7arqWEbW0cW5TxnxdVnEk1Dwjsy60AGqBF5AU6/c3nxYJOGJ7FobWwyWeuqHzwzX8SJ12/67HPAxy9jB7v4ottYSY15XalcrTXB4cdAiyJHihVX9WV93eQ2FPub/CG9mRfg5UDC6pPRd7WmWxqU7rDsRqw3NXvnjFwFU4u1qFjBLdayj/fqH0YOoXbuRJ4O/GIqjtvpyzT/ThtCDRYOelULGh15Iq/Yd0IMmRHXH5k9e2H7cuITgfz6TqnfMWRKlLDdOZNubk+uX33l1T9HwIKGQyRXjgeLIURJwZosDhphNNHeRFuSdnM5kCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OH8u1EK+MWbdCTuijn8lnPbRejOugNUpmf0KVQdhE9k=;
 b=I2qE/nOzR9qBqj+CBP30JMcu5Rg0kE+W7VeTzBy0XOVAfOnbNs/oDjwR6McFBtAZPEB/k8mKhC4t7+Q5IrODZuhG1Ggt0EHvRoB5LoE7acMWhjCJHy55Xz1HCZim2vI6DDGFH9iu57lhUBaL9/5HB8vLPOCNHlcWH8dhXb8AWTgJMflqDtATIdPS7fkFpDCSE/r44AO1McebMB739flTZ+PZnzR4bgO6pQjqmPykmzTJjatgpBiOsokc0KAB3jxmDYKu1NxOA1VRFr9XztJ8K8oTqtRRic9aEGJqrO6FXQY7GAIAIwbjmk340sQ9GGSGC1SSsWZM+vxHJuPfF0hc7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OH8u1EK+MWbdCTuijn8lnPbRejOugNUpmf0KVQdhE9k=;
 b=Za5QaEMjqgBTDZEhcpxiE0nPTY3b5uMMLHA8tI7CpKIx4MTUZphfuT8S2zOB5uKPbfThy+ctqPGWt+Uk6rVMFvoliYaFfnTde773Lv8TCcZP8U3Rf7ZkbHAZv0tlYMie13lVCLO6JFmOxLzkJ9dXOe1PkdMl0LrBiNaXIydlg01ffsQEoNSo0KRnGAZZnFWHuNn334hOAuO8V5/kainhOPK0vgG1Tb0Bh8/EO1S7u0aTYt79EZgiB+1vLdVEtUjpza16JVYM6l5R3JPcDP/b4/MeGhVAERkiPwgOv2VUJFEBNSGbZqQFX5l46Re+pmT4KEQCC6i6Tc6y0K7RGW+pnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <266606f5-dad6-a1dc-b4f7-96a81152e08b@suse.com>
Date: Wed, 27 Jul 2022 14:33:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 13/18] x86: generalize physmap logic
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: scott.davis@starlab.io, christopher.clark@starlab.io,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
References: <20220706210454.30096-1-dpsmith@apertussolutions.com>
 <20220706210454.30096-14-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220706210454.30096-14-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0084.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::29) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c298e56-fef7-4223-52ce-08da6fcc4397
X-MS-TrafficTypeDiagnostic: VI1PR04MB6941:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zljnZjvhQvwPP1di/UNLq5jqkL7F+rpjgLtJffTZn+9B2QM/OrfWeGkqipH9NMWMGo2h7td6pNOaKaYKxvX7QTpk9a8y8fXtddOkxjldbkKX+1MZwEOovP4ev8VcLz4Z4MsIBhXS0b+eDPOdYbD8f62IRjV/kYoDQnl2Xbxr+uOFJsQj2Ni5gFCx6VSkfHGz49cIgGTuIe/oTBacnacZGWoNZOVytTlKeeMaHWCXWpkfb7JVpJtMmFSkakXU/twBAa986RuNNx0W3K6S6rHhezUuygA+xnn5XII6j/35zzCmdfu4YpF9A995qQ9gw1dY9fuD6lY2H+ASQa71mozsL8Lg91lPIpIrfLa6WC2n4GaOSxfRoAs1aeuSk3xde4cx7CwixJWHGPvjQIq/xsfzgiBHRIjhkBMNDCQdFbAwapC0Eh36RCx/hATjuZjQDnP/W4FOeNJOdlJVDWgnptsCsUH8KE/X0/vhtCrZHfFNLFlB/tesRuKrEeYU61H6vGJf74nqBsIzSikAzHQzMGla+GMrzs/+mDrdg8wwqwX//sqnNPdo0CBYeoD7WwjMawnXtMcFI3bTNcQmrRqiAkU4dlKqNcW5B8xyCGP940J/ZIFnZEZn2rblQCnv4wovfV73GqDtK7noIw5QfbgG4GptB9IFJNaoHcUdvz3e48tkZypiqCFSUDCXmag1K5q4gFvh9DQus/Xv5C6/bvM6pwvBsXnj90MFZ+TCXq32jsG32Yc9PhEmaPXvlrarYyGhBdvy5OwsnepGlieJnlQN49k+vDu2Idfhdqk6AOYLSmHN4wNi6bSCc28fjtK57zL0A72ot50IlltwWj9ZkI2M+JkR6g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(39860400002)(366004)(396003)(346002)(136003)(478600001)(6512007)(31696002)(86362001)(6486002)(41300700001)(38100700002)(6506007)(26005)(53546011)(83380400001)(2616005)(186003)(8936002)(31686004)(54906003)(36756003)(66476007)(5660300002)(2906002)(4326008)(8676002)(66946007)(66556008)(316002)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZlcrNE8xYVpsWCtxSm9XTWxHMUIwL05td2dIbUVIWUZ0ZXhhRVgvREdPS1Yx?=
 =?utf-8?B?Zlg0N1k2bzFQWTVCenJJcFovOXl3cnJpMUVlU00zUjlkaHhVVjZjeW5IdWJO?=
 =?utf-8?B?aTRNejZYbmFYMUQ1T2dzOC9pNVpGdUZ1SFFUanBPbDc0VWhDZ2p5YUxyZU9x?=
 =?utf-8?B?aDYzVzdKRC9zTkxvVnR2Qkh5aU5xUFFtSU9JanZKaHFER3NpcWpzN3h5RXBH?=
 =?utf-8?B?UHJncDd1dXNVQm5xMzQ5UXFUN3RqMWZ2bUYyT2RpMnQyNFpYV284VWNmMDFx?=
 =?utf-8?B?Slg5WmdWejB6MDB6N3lJVk1qeVY4NGt5akptdnJhVHhXQmNNVXl1aGlJb2Iv?=
 =?utf-8?B?ZGZmREk4MHlwMW1WZ3FKRGhOYXZ5RHJGMXIwRzJlVXlRZ1FnNm11SUxqRkZU?=
 =?utf-8?B?U0V6WmZ0RmpZOFBqamw5V09VK21iQk1hc3lWaDQrTUtQVU9ZaTRMckVHYWY5?=
 =?utf-8?B?alNYZytsRVJNdTkxVnk5MWo0NEw0cVd2ZFlESExKbUYwR21NUzFldExCcU1z?=
 =?utf-8?B?dmNycHZSUHhUbG5xVjRyak92YkRzQUszNkZ1N1FmUDVNeDJPTCtjbWpnN01H?=
 =?utf-8?B?aTIyZkdWQzFpOHRCM1k2S1pDck8xVGVsV0NzTnhrUml0YTFtZ0ZHcmlERFlM?=
 =?utf-8?B?MVZVZHRkUDlPOW9CT1M4cElsdlBRQ3B5S1pmblNQRGIyNlhlR214Q2doek1B?=
 =?utf-8?B?amVQUjI0TVU5N0tsQ2JIQlB0SDUvcE80UzJsSEZxM2pId1U4MFdwbXd6MjdN?=
 =?utf-8?B?VzR5ZWtoa3hrbDVFd0lheWJzdzJkdHRDbDRRTFJZZ0pZRGpveGVrMndIVmdQ?=
 =?utf-8?B?Vk9oMHMxckJKWWN6RlhRSHc4dVlaUnZmbVhYNWhoVFZUQUJoWExYMHkzSmRB?=
 =?utf-8?B?em4vdGE5cnBmRGhLOHBramJobVkvQzhnZDJKZEdsOWJnMWxXcTkzNGJwV2ln?=
 =?utf-8?B?VmZuT2FRQ2JBaFI0U0c0VGVkUmllN1BaYWdUS293WVE4dFlma0FyVU0wajdJ?=
 =?utf-8?B?LzZwMXREVmdmQ1RZcWpKdDk0dGRHVnBNV3gvb0VCQVBPNjhXMk9nZUVLTWt5?=
 =?utf-8?B?cEtsL1NJRExMY0hzMitwRWVTdjBHS0swUHZzdVZSQ3RyWmtZNS9qaDZNSEMr?=
 =?utf-8?B?VWlBdFNLcEoxd1dMd2pwWHVGRUQ1MFZ3VXlRVkUvOHU4TW9INnYvMEFTc0pm?=
 =?utf-8?B?aUdVUXRlV1FDNkhHZzUySVlyMFlhWXovRW9KYlE4TDErV0tmL2RJUlphZ3ov?=
 =?utf-8?B?VEI2RTlrM2lSaEpaakdkeGZVNGJkbGdsNTZzN2FYWi9OZkg5cWxBSWVSOXBs?=
 =?utf-8?B?QUhtUFg1UXkrWCtyYWFjMUVrQVI1a3NncDcwQlY3UHJYM0Y4bWRiNEtWY3hB?=
 =?utf-8?B?aTVUUlRwcERIamZ6NEV5bzRuVThhY1kyRmswS0M1eWxsUk9OT2Zhc3hOUFNs?=
 =?utf-8?B?MExPek1tUndid1hlZ3hyK05uMVYzaVhsYW9taDFnb2YzekhuUWhDcVJnYklt?=
 =?utf-8?B?bFgyajBCaDJIeXN1bUN2TnZVU0lFRFFzVmVaVWtoY0VTT1J4clBJT3dpd1Z4?=
 =?utf-8?B?czVUMUZQN3ZZOEpNb256V1BaRGd5OGFWeE8xdnl3WmZWMDQwM3pYeDFQTnNI?=
 =?utf-8?B?Mmk1WlBFRHNvcURUOEJhSDRrTmk4L1l2Nlg5WHJhVzZYejBObXM3VXNCWnV6?=
 =?utf-8?B?NWJ0NEdLN2RoZGhrYThVMEdXb09YdkE1K3JkRUUvMEo0RnpINzV2cXBmSWZn?=
 =?utf-8?B?K3BtbytGOFpNR2QreXVBcW4xYkRpdjlXUmcyYVpPUlJ3bEJqQitJL3JxTFRF?=
 =?utf-8?B?Z01NVVROOVhMaitkR01UbWxVNTRxVjhJeE50bzlNUHZMcGkrdlRoaHVXM1lF?=
 =?utf-8?B?d1UyKzhNMXg5Q0gydFNYYUJFNWljSFZ5VUErNTI4dzJOc0dnbmNlZkdQMWlz?=
 =?utf-8?B?ak05VHR2NzhtTVFpZ1B6TC9CSlJnY1M2VFlTejA4MG8yYlF1RnFvckFXMS9E?=
 =?utf-8?B?elRGeGNwelN1QzQvVE1pM3lYMEJnY2Y3c2dvWWlSRWJHekMzd0d5bXNJK3pQ?=
 =?utf-8?B?UnU4Nzlvb1VvN2JlNEIvTHlhalFsTm8yV3o0NDhPVmRIbFdLSmVEZjBzNVA2?=
 =?utf-8?Q?o/b+co/Sa5wnoRXG8BihKfvqB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c298e56-fef7-4223-52ce-08da6fcc4397
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2022 12:33:52.5754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lqd78RV5qhmgKj0kXCVhiiKXxVWKQUm7Jtt2rZHBMbA5639Njq4HcwBaHalJTjpma9A+gLMLb3PJmrAhnLMPSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6941

On 06.07.2022 23:04, Daniel P. Smith wrote:
> The existing physmap code is specific to dom0.

I think this needs better wording. Either you name the function or you
explain what piece of code you're talking about. "physmap" alone is
just not meaningful enough. (Also applies to the title.)

> --- a/xen/arch/x86/include/asm/dom0_build.h
> +++ b/xen/arch/x86/include/asm/dom0_build.h
> @@ -21,7 +21,7 @@ int dom0_construct_pvh(struct boot_domain *bd);
>  unsigned long dom0_paging_pages(const struct domain *d,
>                                  unsigned long nr_pages);
>  
> -void dom0_update_physmap(bool compat, unsigned long pfn,
> +void dom_update_physmap(bool compat, unsigned long pfn,
>                           unsigned long mfn, unsigned long vphysmap_s);

So my initial inclination was to suggest domain_ as a name prefix,
matching what we have elsewhere. But when we're already giving the
thing a new name, its PV-only nature also wants expressing. Hence
I'd like to suggest pv_update_physmap(). And then please fix
indentation of the continuation lines here and below.

> --- a/xen/arch/x86/pv/dom0_build.c
> +++ b/xen/arch/x86/pv/dom0_build.c
> @@ -34,8 +34,8 @@
>  #define L3_PROT (BASE_PROT|_PAGE_DIRTY)
>  #define L4_PROT (BASE_PROT|_PAGE_DIRTY)
>  
> -void __init dom0_update_physmap(bool compat, unsigned long pfn,
> -                                unsigned long mfn, unsigned long vphysmap_s)
> +void __init dom_update_physmap(
> +    bool compat, unsigned long pfn, unsigned long mfn, unsigned long vphysmap_s)
>  {

Personally I dislike this further change to re-flow the parameter
list, as I see no particular reason for doing so.

Jan

