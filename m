Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C78424E82
	for <lists+xen-devel@lfdr.de>; Thu,  7 Oct 2021 10:03:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.203359.358469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYONF-0004pK-MM; Thu, 07 Oct 2021 08:03:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 203359.358469; Thu, 07 Oct 2021 08:03:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYONF-0004n6-Ia; Thu, 07 Oct 2021 08:03:29 +0000
Received: by outflank-mailman (input) for mailman id 203359;
 Thu, 07 Oct 2021 08:03:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qfpx=O3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mYONE-0004mr-Mq
 for xen-devel@lists.xenproject.org; Thu, 07 Oct 2021 08:03:28 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0d4d3d73-2745-11ec-bfc1-12813bfff9fa;
 Thu, 07 Oct 2021 08:03:27 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2113.outbound.protection.outlook.com [104.47.17.113])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-25-h54VKsxxPLKuKTOelJ79Jw-1; Thu, 07 Oct 2021 10:03:24 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5743.eurprd04.prod.outlook.com (2603:10a6:803:e0::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Thu, 7 Oct
 2021 08:03:20 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.020; Thu, 7 Oct 2021
 08:03:20 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8P189CA0002.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:31f::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.15 via Frontend Transport; Thu, 7 Oct 2021 08:03:19 +0000
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
X-Inumbo-ID: 0d4d3d73-2745-11ec-bfc1-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633593806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PPvXMUt1yXPsruUB6mUTf5wWpPPb1iAQDcQabh6jiJ8=;
	b=EjViQzXCXB5Ya6165psSoaL1Vfju6tZ+z5ttrdc0fjs8LBMV1f3Yk20tU+YlPA7cHoLrdD
	u060CWA4HMoYb4ind50DCsmg6Bvvl/f1u1ExRmUj9QdQd8SQux8eZfD3aGEvjw+DOlLZoq
	TwtESwwBGDnIQM5Dk/sU3v4iz6lhCCg=
X-MC-Unique: h54VKsxxPLKuKTOelJ79Jw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OFuJVeALfFFxIW4k3Jz0KiYgglgwwZ1x3ya8lcLINj9lVUACo4zeEeTOZLnqV6N+zXu1o+RieEqYdxWC+8wtHz1DXedGUdT43RM01ZF8lJjelBc5wnUfagv7ovLO+fniS5wQVr6umsWRvl1S/y1zIY7/FWbBunfLg0Y8l4x/YulNBDSTJDY/GmetJfbCmqB1EjZmkLlG34/rftTNEEsGZsMx3IEmY/ZlvD9NPuFzYDtTxHHnQgP3HskjJAR3ilyEDqprYdMlD/gbs6wLaxWvrnQAQa4v9sOTMz8XRh1fTiRwNTks/wLxMh1maTvxTnOQLe0RmnVgxrGz5qvach5cwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PPvXMUt1yXPsruUB6mUTf5wWpPPb1iAQDcQabh6jiJ8=;
 b=oHKe6IIq1eVNWtqUELfkSlQzjLwy9GyHKCNdhZRY+bQ4GjX7s+sVCxvlRLUdhmCwQW1qE/d9xuDcxkPtv560dac/g3819CzYWLk1VUUh02/oz+xzKb80ABJ3xTtyY7QIyofFHVmSgt6x/cjTZE1gEnmmnmQGt04Zx2wfPdNas8YRb4Q/Jcl1xhBxC4AA1Z3PdiKRqq4T/5Z6eBrlIW1llTFEUIPTQSDF0bOT/jqTYB4LQzFcF0ycBBxxUkwQ4EYvbNkmHcuSDjanz2IBYa9frAnjhIs1qIanz9QxFOq6SFfhvtJH2uq9nyU0o15KMQKBbEf96CIL/WZfnGiMu5Y7xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 3/3] xen: Expose the PMU to the guests
To: Michal Orzel <michal.orzel@arm.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Nick Rosbrook <rosbrookn@ainfosec.com>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 bertrand.marquis@arm.com, xen-devel@lists.xenproject.org
References: <20211006105827.15217-1-michal.orzel@arm.com>
 <20211006105827.15217-4-michal.orzel@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <45bcc00d-95f1-fe20-a68b-de2eb793dc5e@suse.com>
Date: Thu, 7 Oct 2021 10:03:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211006105827.15217-4-michal.orzel@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P189CA0002.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:31f::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1005edb6-6ec0-4dfd-f718-08d98968ed92
X-MS-TrafficTypeDiagnostic: VI1PR04MB5743:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB57432A681EA9DA47130DD2C0B3B19@VI1PR04MB5743.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MaCt7T7xB1m+Ob2Q/xKbgqzQZenHFilp0fIC+auPsEnFm8pBJsuN3j6y/+A+V/Oc2aM26c1XO3oTmS0f6M8HeOEZlp8f2cpO0lqziXBNBb+vQmU4xGmXSY6cPcYp4Tx9YC7S58eU9uITBjNCPyMUscdvYXQC+Sl7+abl3yctysQtbQkdPvuY0PfKh0fAawUz9so/sXnWNh9WmeWnOQZVZXLjidMZEeu66SD4OHLrytXHMfZVjlY4b5+PmmR5jNGNlf8PWDozcwoyWU9FSNc4I3arGseNSDyHN+kELQiWK3QJXXsk8YZYuWbacpBhNOnVcvbZ8K7jCzZkCnjRxM59n3YAl1frqAuBus8XsduqkHBVQN+x+Oj6teAr5d5dfI6uOyhZ0ADpWqI/lq28QTbMferZETSYxJJ/CxbiylNXZElrYVHFwzYW+CmehLpXVtrBd1XnZdijERA5Hzhg1/xYOPgFkwlPVI+RlwAsASh/dOyrIpmEEmO2VEjbdMHk2+I6wb6G73M0pOczdAzwXdaaeec/kaLM6lOlxgSBXkGkKeYEsnPUcx/sTo2bN79c79KNnrp/bURfhc+/zC4YbTxeBe4Fj8HICZ091VkSerpc4cEqD2a2aAaGOya+D8vddpnRKW+c1Td96lppzs5EJx1SVFzWkLm9RldGn5pM2/WC08On5iVyq+rEwMX2726kmYZIp8loTv67gBdPGdGgKhVjoVP+0S5jWHw+cYwUZD8apUA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(36756003)(2906002)(4326008)(6666004)(8676002)(26005)(5660300002)(86362001)(316002)(66946007)(83380400001)(2616005)(508600001)(54906003)(956004)(31686004)(186003)(16576012)(6486002)(53546011)(6916009)(66556008)(38100700002)(7416002)(66476007)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2lad2g5TUR0dmFDdFJ2bjZBZEtDYkJKWUNTanVOeEw4a3h4aUYwSmxBMVd5?=
 =?utf-8?B?TW9tZEZEcXdjVStjSjAvd0UvSk1GL2U0NDVUOVFUYUsxQTc1RmE3dmMxdEVu?=
 =?utf-8?B?TGdLWEVFcDc2L3Q3K3VjYllPb2ZnbWhocDVwVnpmSGViT2lYbTZxdGZOMWVq?=
 =?utf-8?B?UXo5WnRtTnFFRml6RDNTVE8vVFRNTmdxa1ljTzlVTHB5bk16dWtRbUFSb2Qx?=
 =?utf-8?B?aWdIRXZwclZSTmZTbDJFQjkybVNjaUU5ejNORmIyOUU3Rmg2eUhzVU5RMFpU?=
 =?utf-8?B?VzhyeW1RM1lHS2x5UVVucmIzSHVOME1icUdDRVEvRzN4dzJDcUlUemxRZi9Z?=
 =?utf-8?B?VTVJdUFRcHlpTklRa0JudEpvMGY2RkZONExDQWdXcmt1dkxPVExXZXU3Rlpl?=
 =?utf-8?B?Z3lnSEpOTDhaTDhiUFhTbnpGelRIemRyOHFwbzJRc2hucjN2bW9USW5PWkd6?=
 =?utf-8?B?Z2lPU2VPZGRvNVpyR2hnMkQyN2tka3BNU3QxazBhTjN6RmxMMkJPamJnUnJC?=
 =?utf-8?B?QTdldlFMMS9GNmNrNXh2TFc0eHNVNVNIZ2xkOTR2RTFUM2kva21ZeUpObDlU?=
 =?utf-8?B?cHM5TytXTzZFQnJQT3pqTElwRm9YOFpSckpuOWpWRW4veW5uM091SWlGV3px?=
 =?utf-8?B?UjFBQ1N3K3IzMGVmMjNiOFZZYWozM3ZCcUUvS2RLczJFRStSazdBU3N3SmpD?=
 =?utf-8?B?TUh4Ynp3VkdBSlZKeEVmQ3cvVUpVRm10VXBkWTl5QUw3YzBNQktHZWI5OGtT?=
 =?utf-8?B?VFVwdzlQY2hOM1NXaVdQMU1kOHNEaFpVVjVJYVdPYkRyNVppTWRVOXNwbXFL?=
 =?utf-8?B?NnlvTmlkREJITW11NkdRTnplMlRrRjJkS0NPRnFSK0pSS2E3NTBJSjVSOFVn?=
 =?utf-8?B?eHRSNHpVN0NCVzBVNEcvRkpxYXlsZXArMHROU3EvdTFpWkx1eDNCd08wRHZ3?=
 =?utf-8?B?MW1LUGVHRFlYMHpXbHZzMS8yOGs2dEJsejN3MXhIcEVZaUEvUTlaejA3U2hi?=
 =?utf-8?B?N2xCbmZIVjlnRnFScXZMTGNnTGo5TE1UWmNoSFZwRzJsWVY2aTlRUWZmdUpH?=
 =?utf-8?B?dWt4dGRjclBiMTM5eVBRTFk2a3BKRXBSMmFFWlVld0s3alNQekphSkFidnRG?=
 =?utf-8?B?MmtaS1FnWnlPakpJM3U3Qm1ZMTg4OXp2TzJZRUY3MnF3TXZRWHI0WU5XQ3pP?=
 =?utf-8?B?MGRBMk00OWpsamFxZll6Q2VPbk5IMFNHM1FDQ0FmTWZTaVhCS25lSi95ekd6?=
 =?utf-8?B?REJORk9LY1I3clAvZHBrYy95eGhpNzNnRnZZN2cwMHVqeFFxRDFVak5NcTg1?=
 =?utf-8?B?V3U4VGEwRzZpOXJQYWpyZUQ0YU11czQ1Q1lOWWkrYStXZ1VOKzN4VmQvemc4?=
 =?utf-8?B?Lys2ZHVtVDRKbk8waENWMGpmbUp3Z0NXTGxJalFDQ2pZVWVOVDdGSFBnNWoy?=
 =?utf-8?B?cjgrYkJnM2tORnYrQUt3QjdPdlN2cE1KWWtFNXZydmpTT1pxQ0NRd3RRdTNV?=
 =?utf-8?B?OUZGNVdCVlBiZDRoWFRTNmdVU2NFYnJ6MkkycUxkQlNROXlwVDBvbzc0Sm5D?=
 =?utf-8?B?RENsV1F2MFZiRUlUei9TR2VaZW5Jc2ZZS2YrOVp2V0xOano1UmNrQlpnckpo?=
 =?utf-8?B?MFRRbkVXMWRmNjQwVVRKU1RHNi9xZXZURDlmTWhnMWVsd0h1QkpyZ2VuaVlp?=
 =?utf-8?B?Wm9lM3diUXdLd1Y2WDhVY2NzSWFwOXRQTzJ5RWRzZ3M0WXNheUZnVllQeEhi?=
 =?utf-8?Q?A8Ppf/m/UUe9oPLPHNlthbC+6boKbBbBi/5NJYV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1005edb6-6ec0-4dfd-f718-08d98968ed92
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 08:03:20.6350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dGxHjWiVvoazI2YnXAvE4iNPrx/cjimFUO5OaQFAxvSXvzwI7kAEt3+YpZBCF+5jbsWqvXQe8tRk4najuBaEQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5743

On 06.10.2021 12:58, Michal Orzel wrote:
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -692,6 +692,12 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>          return -EINVAL;
>      }
>  
> +    if ( config->flags & XEN_DOMCTL_CDF_vpmu )
> +    {
> +        dprintk(XENLOG_INFO, "vpmu support not ready yet\n");
> +        return -EINVAL;
> +    }

I consider this message potentially misleading (as x86 does have vPMU
support, it merely doesn't get enabled this way). But isn't this redundant
with ...

> @@ -534,6 +535,12 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
>          return -EINVAL;
>      }
>  
> +    if ( vpmu && !vpmu_is_available )
> +    {
> +        dprintk(XENLOG_INFO, "vpmu requested but not available\n");
> +        return -EINVAL;
> +    }

... this? (This message is again potentially misleading.)

> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -70,9 +70,12 @@ struct xen_domctl_createdomain {
>  #define XEN_DOMCTL_CDF_iommu          (1U<<_XEN_DOMCTL_CDF_iommu)
>  #define _XEN_DOMCTL_CDF_nested_virt   6
>  #define XEN_DOMCTL_CDF_nested_virt    (1U << _XEN_DOMCTL_CDF_nested_virt)
> +/* Should we expose the vPMU to the guest? */
> +#define _XEN_DOMCTL_CDF_vpmu           7
> +#define XEN_DOMCTL_CDF_vpmu            (1U << _XEN_DOMCTL_CDF_vpmu)

Like for the earlier patch, I think we should stop with the bad habit of
defining both the bit position and the mask separately.

Jan


