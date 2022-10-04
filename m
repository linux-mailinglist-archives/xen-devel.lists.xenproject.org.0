Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 401B35F40B7
	for <lists+xen-devel@lfdr.de>; Tue,  4 Oct 2022 12:23:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.415362.659918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1off5G-0002sc-5i; Tue, 04 Oct 2022 10:23:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 415362.659918; Tue, 04 Oct 2022 10:23:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1off5G-0002q0-1z; Tue, 04 Oct 2022 10:23:30 +0000
Received: by outflank-mailman (input) for mailman id 415362;
 Tue, 04 Oct 2022 10:23:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P0IF=2F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1off5E-0002pu-Ii
 for xen-devel@lists.xenproject.org; Tue, 04 Oct 2022 10:23:28 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062.outbound.protection.outlook.com [40.107.21.62])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95aab835-43ce-11ed-964a-05401a9f4f97;
 Tue, 04 Oct 2022 12:23:27 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8664.eurprd04.prod.outlook.com (2603:10a6:10:2df::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.31; Tue, 4 Oct
 2022 10:23:25 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.031; Tue, 4 Oct 2022
 10:23:25 +0000
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
X-Inumbo-ID: 95aab835-43ce-11ed-964a-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iKia2ESymRHCJ2YbiONAccijoMAofr1Zg8hjH6crBcac2mL2W6a7mvR1asZ+MDekOVLXo11mhSMy5Gf9S/vPDODjSx8kd2Qv1Vsid1RdaNHrDVfUDQS4kjJGe6GhF4+eHNVE67QgKlfTfwLaueStfWd7w7D+Kv1aHVZ7krA/TVDRaZFvZaWWnMixBgeshBkKuSLY8KcA2feNKMRJMjbCNreEvAKcNeWHPTJNWwOgq3N+UUK+aZH+6sBIwM/vMfhtcFp07o3M19SIHlEeq0AbX8ARszGwsWDjHWr08OHgEnqw8VZDz2nQtUh322n7l0DNqHqisLnID5eTdXdQ+aeQ8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cAlwGqefZuBiR8QpS89lDHhkc9FFi0V4EjZysqqlx/8=;
 b=YBue28xVPwQtRjjPAHiEbfOFEywZrQVXuttWE1mn7Fg/vG+MI8GSPigH5yyGkBP9bEGpTPXBWOLanF5+agG5UgGtqhuqo8gAl13plWmy8Qc/AJfpRV3q8NabWjv3LJ9Ak+mz1TkM0Wif1UIT7Ad4nrTvDUX2FYqaFb6jpp2IH09NfGifgorcelCo3k1GFVVIeQE3Ptow9nhXiOfXQE+VV3irzlZ+bZAgbBSubTVuafPTfeIyekenlLhti7hJbGu1KMZiVcYg90Jt9goW5buag7TasIEkz98kSKJlf+xI/7CbDqM4sthxwCHzMMY2ZrL4GiB8CrJYLZw3zswiUsEfkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cAlwGqefZuBiR8QpS89lDHhkc9FFi0V4EjZysqqlx/8=;
 b=gs+CZXiBqIrcpkQUj7G4tUbMhEfk6EyOxqM+F4Y/yadY+ozYoYcjZgwZC/gq83hURqUVwZxsXMtMDMPo4D9R2RME8mISL7l+2w/HrpJVcMZ1xzoNOJvV2W4BNeJFfS2A28C0RjqgbsE63Xz8gdWdldysJU2TkUfgE8hPQrdtQfLKtpQH/DxEydyM7AOKXK+G2TfVk/aOusu1SoWle1C/3JH4pb9dQg9hUk4LeyGuB8BW87RbL/PMj0LWoQCVz0tkMimmMK+aP137AgGnizLpavIWP47NxuOFdsDkGBkw1Wc7T7HIKg0gw4WN2jtq8lz1WzvABEcSB5t42PbaZH68QA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <19befbce-ac16-19fe-25a0-73678ce440c0@suse.com>
Date: Tue, 4 Oct 2022 12:23:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH][4.17] EFI: don't convert memory marked for runtime use to
 ordinary RAM
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Henry Wang <Henry.Wang@arm.com>
References: <cc0fbcb4-5ea3-178c-e691-9acb7cc9a3a7@suse.com>
 <Yzb9BDGc45OshRZN@MacBook-Air-de-Roger.local>
 <df0dc3e1-da12-9d42-b652-e33419134d38@suse.com>
 <Yzv92zTdfG748MXO@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yzv92zTdfG748MXO@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P195CA0029.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:81::42) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8664:EE_
X-MS-Office365-Filtering-Correlation-Id: fa3d3019-7b6b-4a72-5483-08daa5f278aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6i30KGPNeVNvwznfoWLKEKNCbYJCv+q1qScH6YAukRyAIo2YhOkAcOCiGXpF2UKIsLi4+joSF7aElVd3BUwrGF6LHD3z2qtMrBV/DnXQq53ww0yAcmR3Akw0KfpK/9oTA77Caa7tWgtOsuHgYr1A8b7vJpHtOxvaB97PrrMZpqdbRyn53+ZTTEh+bkGM2oanIfYf0QcOQ9E7Xe3RnoTNPBVRWMEC7bKzmW8an8sgacKD/5f+MbWgGwBrPuWopXQSj11uUSs2jJUriXeWuO4XFrhxVcHoTm+yT20Srwk5LwIHcxx9N9jEeDr3RjNB9ppLcuWv3DZhPHI31M5cOG6GakwXY+wh736NziFHwIBMNdhpGcWKSqZTGy4jaNKOq1Zmc4bKdZqGCUydYWS2PRQptOJ9FYuQ6J5ZBgSPi/y9nfrVgVM5KQFRasJXTQ4S0t3pSGaLXK8u7ApXhw4bLyQEGkuIaHXuj8eSZJbgizsfgp7vaZyRQbYe1p62JWjMw2OE7BciS0giOo+Tn+SSPQrmCXOXazlieFPMRee5ylWCXd5hTOtwNdv+IhRSvmt9YMlPXmXvhXptb7k389JeV1paXEuvplVfDdnnv8y2Rq2oL6XOMYnvJBefTpLgj8kEfZdEj8p06PZPOxY65+hPEp2Nsr6Y0haM2qwVeIhxM5z5HaX9pp2XmKTAra/BQeovh60yJA4umZwHZe4utGIy9A2dZRz4GYKnVULuXeWbntxb+xN0yruUaAAjmJ4Kwq7L8fbFnGliB9UOIDu/gNE4AipMlfz/P4Yp6oZoBybVpXRgYHA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(376002)(366004)(396003)(39860400002)(136003)(451199015)(5660300002)(31696002)(2906002)(4326008)(8676002)(66946007)(6916009)(54906003)(316002)(8936002)(41300700001)(86362001)(66476007)(66556008)(36756003)(38100700002)(31686004)(186003)(83380400001)(6486002)(478600001)(53546011)(6506007)(26005)(6512007)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UG5yTnd3cVB5VG1qMDBrOGxNMnkwQU9ab0ZzQTY4THBIb2RwaW1GUGh2bFB4?=
 =?utf-8?B?N1NWZFgvWG9tTWc1YkQrRXl3US9XRWNxdndxdU1mbWc4Wkp0ZkNLRXNXUllq?=
 =?utf-8?B?OGg2Rk1pMDRNa1Bvelk4VXMwYVB5Q2Z4NlBNdjl2VTZ3ZjJIRHk0UUlOZWc3?=
 =?utf-8?B?NmtlVmViaCt0WDRLM3MwSEFsQkRoMmJsMGNaRit3VWUrR2lqYnZ0eGM4WW1y?=
 =?utf-8?B?d2crYlducVpCenJseXNsQ3RDVklzOHU3aFAwTmxnd3k0VTFWNy9nVHJLS014?=
 =?utf-8?B?ajR6UlRxZkExLzBhS045elEweTVxcS82bWJxdVkwd0FhRm1yYWRNS0tBMDNy?=
 =?utf-8?B?OXRoZkVlNjgrV04zVG0zS3QyRnl4S0U2NkN6c0JXOUJndWNtaVRnSDRyREg2?=
 =?utf-8?B?UnowcTFqRVlIY0IvZGNOVHFNS3FETzJqWFVncFgxTmgrMlpzaUxVeWZDNTd0?=
 =?utf-8?B?MFpGV3d0eUJaV3dwN2V0YjZBekgzTFFKV0h3YWhFdDBVeDJNbGhzWDdGcThN?=
 =?utf-8?B?UkVyZVdYNVhnWFpYbU9BNjR4bVRCY2ZBNkREM0wxYUw4U0JVU0xwazkvRzhn?=
 =?utf-8?B?LzFaVUt4RThDWGNQdjJLN1FPd1VpK1V1VHhSL2lPR1dPbm1CRXlxa1dQb2JK?=
 =?utf-8?B?VmZmaC9yMkNxUjAvNEpJczY3YzBLaW15eFlDY2lVZlkvbVZXZEVkQWlEcGtj?=
 =?utf-8?B?Vlh2UFRZWkd6czQ3WEorZkZXTVBXZGI1dms0OTB2TStZc242cWhmajNyLy90?=
 =?utf-8?B?aFlQREpHUjRUV0t6UXVOZHNXZDNMRHFjUklGZisxYVN6RTZqdkZiTUl1U0po?=
 =?utf-8?B?c1o2OE8reUwwYlJJYU1XaUhMQjFteDdlZUt3NzVGdDNRNGx2bkExMEoxWmQ4?=
 =?utf-8?B?a2UrOFZBUFVRMlcyQ05kenY5REgrYUg5ckN1QW5ieGtjYU5BQndNWkpRSzNX?=
 =?utf-8?B?eDAvUS9wUGRmS0ptQzEyT2dUVjI5VmI0OTlHdzNNckErMDFMMUNiRGQyb3M3?=
 =?utf-8?B?YVhIdStpZGQ3Rk4xaytFZ0ovY0UwSXZhajdib2dyZFpSTnNYWHd5UVFYR2pv?=
 =?utf-8?B?eFNCOGMyVjdIdmVPSmpzTHVZS1hQTkR3dzBTMFJyeGJaMzFYanBQd0QvcDFj?=
 =?utf-8?B?aFhlemxxWENIZzl0amxWUXBVNVRnNkpaTzhmaDI4cURZVXhyYmovQ3BFNVc3?=
 =?utf-8?B?MGg4R1lBZ3NSdDZFQjh2Ky9ZNUZiV3ZRTXZGYk0rLzhIemREN3l1WEduVzE3?=
 =?utf-8?B?THlMbU1CcituY1ZvaEpNZ21DTzl6QktXK3I3amdOOFN6cloxRlk2VGo2WU43?=
 =?utf-8?B?anl5QXo3L28vdHB3WVYwODZITTNmcnREUXU1aU5qQUl3ZmN3UmpoNHk2a2Jx?=
 =?utf-8?B?ZmErK2hWaWNHWFZxU0RHNjZobzdyNjVjeFExOGJoOC9iaHBxNE5yWkJuOTY4?=
 =?utf-8?B?NU9WZVNOZWg2anRvUWlUQm9TUWhlR1JQZ3RnbW1RYm1MMEpJdi8weGxOeHFP?=
 =?utf-8?B?eHQ4em1xQVlic0hVaXo0MHVhRXB3aWV0K3M4aW1yMll5ZGtQc1VQNXhhdEJY?=
 =?utf-8?B?VndRdUtiR1Q3amxtaEZaazRPZ1lpWlFsMHlBV00reEdSeTJESndoejRKdFRK?=
 =?utf-8?B?OU4zQ2RHcDNidkJIS3VLNnNJcDlvL2tTU250QVRob2hQbXJyU0VhSS8yT3FE?=
 =?utf-8?B?VXJoN3orVlNDWW84bGMxZk1PcTh2QWhGQk8wWmdwM05rN3ZHY1JMcWllQ09x?=
 =?utf-8?B?TndkYjkrRVVXdVRLanV0ejVXVEpCNnUzVDFtcklyZEw2S3dGcVJlTGt3V1Y3?=
 =?utf-8?B?TFR1TXlOYnNtS2NqQmdnTGVNbEhZWktDK3A1c2RyR1dQNW9zZTZUNStvalB1?=
 =?utf-8?B?TFl0Z1Z1TjNJUWtpWDV5eDFEdi9MbTU5NDlNdXREYkU3V2ZqUDdjTC9aeFpO?=
 =?utf-8?B?eUNvNnhUTVAyYlhVcXJqMUFZNkNlcGk3RVk3OTBSWVNmSnVTZzRlclFqdHI4?=
 =?utf-8?B?MDJSY0hPcm1aL0I3cThoTXNDRlhnc2JvbytTdlBmcllPVE83VldxSDgyR3V4?=
 =?utf-8?B?NTZUdEdBTTFHQ3ZwalI2MHQ1U0Nrc0FFVzRkTUcwd0ZHUjVSVzN3cTFZUHlX?=
 =?utf-8?Q?UhrS8+iT7kLrU+Xr4u3E4hp25?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa3d3019-7b6b-4a72-5483-08daa5f278aa
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2022 10:23:25.2850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V/WBiAnfJIN630svkPdEJAG5+S0Wrmv2cdWnV2EzRh9mcoCFMnLSls5Ao4iMQh0+2mNZFbawGLzw9Y5BUNTjnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8664

On 04.10.2022 11:33, Roger Pau Monné wrote:
> On Tue, Oct 04, 2022 at 10:06:36AM +0200, Jan Beulich wrote:
>> On 30.09.2022 16:28, Roger Pau Monné wrote:
>>> On Fri, Sep 30, 2022 at 09:50:40AM +0200, Jan Beulich wrote:
>>>> efi_init_memory() in both relevant places is treating EFI_MEMORY_RUNTIME
>>>> higher priority than the type of the range. To avoid accessing memory at
>>>> runtime which was re-used for other purposes, make
>>>> efi_arch_process_memory_map() follow suit. While on x86 in theory the
>>>> same would apply to EfiACPIReclaimMemory, we don't actually "reclaim"
>>>> E820_ACPI memory there and hence that type's handling can be left alone.
>>>
>>> What about dom0?  Should it be translated to E820_RESERVED so that
>>> dom0 doesn't try to use it either?
>>
>> I'm afraid I don't understand the questions. Not the least because I
>> think "it" can't really mean "dom0" from the earlier sentence.
> 
> Sorry, let me try again:
> 
> The memory map provided to dom0 will contain E820_ACPI entries for
> memory ranges with the EFI_MEMORY_RUNTIME attributes in the EFI memory
> map.  Is there a risk from dom0 reclaiming such E820_ACPI ranges,
> overwriting the data needed for runtime services?

How would Dom0 go about doing so? It has no control over what we hand
to the page allocator - it can only free pages which were actually
allocated to it. E820_ACPI and E820_RESERVED pages are assigned to
DomIO - Dom0 can map and access them, but it cannot free them.

Jan

