Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A3952D255
	for <lists+xen-devel@lfdr.de>; Thu, 19 May 2022 14:21:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.332882.556652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrf8l-00025E-55; Thu, 19 May 2022 12:20:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 332882.556652; Thu, 19 May 2022 12:20:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrf8l-00022G-2L; Thu, 19 May 2022 12:20:27 +0000
Received: by outflank-mailman (input) for mailman id 332882;
 Thu, 19 May 2022 12:20:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zL4X=V3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nrf8k-00022A-DS
 for xen-devel@lists.xenproject.org; Thu, 19 May 2022 12:20:26 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f75d24f-d76e-11ec-bd2c-47488cf2e6aa;
 Thu, 19 May 2022 14:20:25 +0200 (CEST)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2112.outbound.protection.outlook.com [104.47.18.112]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-25-2wCtcYBBNkSIJzCp7kW5aA-1; Thu, 19 May 2022 14:20:21 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.15; Thu, 19 May
 2022 12:20:20 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5273.016; Thu, 19 May 2022
 12:20:20 +0000
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
X-Inumbo-ID: 0f75d24f-d76e-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1652962825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ETlAfvDhBrJt5SXvFZKOMq749xzBtSdwwfx+GCo+p4Q=;
	b=ikpbJ2e8TMa3GY7dPqYVeCTi9GUsww9UrAvf+VZTwPNLddgCDF2kw6SvCHlmJ+c5WbCIVr
	k9ZThILQ+eU0xbdoQ8f2IS3VFQd5Mf6XC9tz4t8Bsnre8xsLer95tlxqnvIjx7mVeA5E1y
	talL5GD2czbLAAny1CDLe4lYUe36IKM=
X-MC-Unique: 2wCtcYBBNkSIJzCp7kW5aA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gvPAbAG65YWy4h78BJMqpXcCWDxItSkmThjUbhECxz03lm+S7pgssfLJHlKmDFLNRyQt2GrfJdHAWZXxYsrEsp2VeD6kEdIy0MV7peCyfYvmpIokNo/ulfxRCYyCxKkV5mOK9mFZT25jbaMQMRds5OuobGVVwPmJXCkd4Hp7CSzvfOBZ/fkxWoVtF6rqBUe9A4FBjzRmSutX8/FpDMobZByg79eL+irtIod2RfinqBaSF4n0VeB0DRF3v3SQR6tQc4hN7an2jffQYSD/x4fjs+NI6ZWBByOHv/Bd2bllA9YLuRYERp+AA97aIZb4MHyZJpYiJrKeB/wnJsPdPzVr9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ETlAfvDhBrJt5SXvFZKOMq749xzBtSdwwfx+GCo+p4Q=;
 b=eL791kY2ZCt9QnFwLqLv5IMVJfexm/gck9o4F6buF+fAa1NKUyI5JHLJ33CY+UVcX4z91MVLSHU9y4qR09pp8q687mna0HWcMr6clF2yF3XHHOz4V00fpOJdZsd9SKugLdArBleiAuIUQoBH60yEuET/zm0n4zfVZvOjK3f/eTtBv1izgRoBvEWP1KTUm1z36Ce7ldBoXTPE2vIXa/363XZQG5YtJUuAAxce6w7Gy+B+6a9CS2uzPD400GmcZBqPCtTbm4BZPXBBECPaXuGomn5OhWgIaJx3fYONsDfC++j9efwS5De0q/NnfvyU016RfFgtcmX0bFokaUqScWDu1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <072cf387-f61e-919e-a0a5-7c767d91d99c@suse.com>
Date: Thu, 19 May 2022 14:20:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Ping: [PATCH] VT-d: fix !HVM build
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Kevin Tian <kevin.tian@intel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <431d4212-07b8-63d5-1a4d-7e8c7a9108ea@suse.com>
In-Reply-To: <431d4212-07b8-63d5-1a4d-7e8c7a9108ea@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0567.eurprd06.prod.outlook.com
 (2603:10a6:20b:485::35) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ef0e640-e63a-40d6-1a7c-08da3991f0f1
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB8788DA525E267EA71D1C462FB3D09@AS8PR04MB8788.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LXsAHfzTKyXOcO56zcrB2pWEoNd3gKyIWoEEGpCA5r8LupYC33UJwzwfmDuP3vjdniy3wEclGN6f9oG6TRxsDpWF6g5mqviQ96x0jPhxBwMm51cP5oza2MGh9WpJh3/zw7F1xKFdVMrhNy0oAGU2KGqZFQ0Ra2/FPjVeMlH/5vaVCcvNWVDHD9mJjh9TCKV8mCi7rq8T9j5NeR1vdm/bYXe3upEXs8oEqD/0bxCQSMSi1AS/cWmMSOm3AUQ8qyzkl/xBmo1O+15HmAJGnk6yrcDMzS9a+hBwUmMt8+ahLtimTwPYuUJ9+fLWnm/zjIh42GdclmQL2sheuDV+YOgikM+vooNoEaNNV9/vzDwdKnvGeqs1MpjT/RSp52ljo0b3lYkSamQ1h3dcRbNKfCIRpYAyFFq21bOaVUA0EuzO+HrlCDYLs9w5dZExeqkMxdzU5LxkNxj5Il6MVXBlwULpffcsaLi4kPUIC5/umi4NGJtyVVUfSS9sOqyOq/9pceiNZbxEzDLITvCyuUFg0J4kjlhFvfbP9OAH8/knPrbzWY2IqZL41/E5Hdflid3QHi5H79FNMhRN6sYuC1sg8NidkQXf+ZNzKgzGXLlA3LLDzuvx1Ikwd7/ygKG854qqYyNOF7MBxmb1jzIDG1bGJR8qbae6XtTtKkoNUgrQA8HAXepdi7QY4qBM8k0TGxTFCkyvaUOqEQq4FFfrxocrSx2BlURwNQtEuQg4qCAIh3GVyG0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(83380400001)(6666004)(31696002)(38100700002)(186003)(86362001)(6486002)(66476007)(26005)(6506007)(6512007)(54906003)(8676002)(66556008)(6916009)(316002)(2906002)(4326008)(36756003)(66946007)(508600001)(53546011)(31686004)(8936002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cjIzMFZhVC8rOFBWNld6Z01HWHRsN0Q1MWRkT1FxS1grb3VCY04xT1RVd0JF?=
 =?utf-8?B?OThOZ0VsSDhCMDhvbmFuR3YxNXl3Z2tyclJ2aVppQyswV085NkkzMVJENlFo?=
 =?utf-8?B?RmtmT0thZUxMUEs4TW5Fa0ZkUlBsOFFLZDZUanVrV0F0ZmM4ejViSUZERUNt?=
 =?utf-8?B?elY0K1NMVGVIQ2c3QlFadXMwWGhaM2c2SkU5TGIweG5KcDMwenhNUEVOTUdH?=
 =?utf-8?B?QmkyTGZTRFZKK2ZHcUltMFl0OEFVaWxEelRRWi95dDdVMktFRUV1S21GWWJi?=
 =?utf-8?B?S0toR09Edk83aG5rSmIrMWdSRktpVTRGS0J4TW4wOUFDMktkMzluWVV5ZWJH?=
 =?utf-8?B?V2twWWpQb2RrMGtNZGdpL1duZVI1QTRCd2FzaGRIUTNYdXp5aVk4UGIyZEZR?=
 =?utf-8?B?bUdpYmQvdncwZi8zQWVsTjg5QUx1c2k4SEhISkFaRGZZNkZvM2c2dU5KQzBZ?=
 =?utf-8?B?bGgvY2g2RkZEVUhsZ0ZnbVFUWU1ob1FUOGEvWE1JdmVvbzJQOTE2cVVvU3o5?=
 =?utf-8?B?aXBMeXM2YTNZWGhkM3kxWEVCckMvaFNpcUhhNFVCeTRkejdoMTBOZEJDeExF?=
 =?utf-8?B?aENpUE52alpVL1JpRTRkNk1NZTRRTkx4QmhibGlST1hDeHArYXhzTGpOS2xh?=
 =?utf-8?B?MTd0eUVBUzRMZUlIdGxaV3JVNFdjMTl1Mmg5UFJ1ZTJDMCtudGdkWmFSemVG?=
 =?utf-8?B?RGV4M1RDQVR3ZXlQUVpoTjN3Qkl0b1NDcDlzZ0Zpb2FDTGxaazByeTRkVjBt?=
 =?utf-8?B?TGl6ODlIbWhyQ25sOHFmRzlZemhjR3lreWRpMGNNMWFBWnREUW13eHdtNnBi?=
 =?utf-8?B?OEV6STRVZVhLY1htYkFzZHI5c1huVTlKc0xoemxoZGZHazZWcUlPQ2NTYVpq?=
 =?utf-8?B?aiswc1pjREp4eUNkQldsMzN1eTl6WjgvbVRGOGlMdnBBUEVnUVdrUC9ZRkVp?=
 =?utf-8?B?R0NTejRXRHN4cis1YkFWM1dMbVBHQXA0eG9xSk54bUQ2ZUhZTE9JNktKYlgr?=
 =?utf-8?B?dnQzWGl5Qm1yVG1hN3RTejFjdnR5YWlRblZ2czZXQmJoeVBCRGs3Tm9Zekhs?=
 =?utf-8?B?QzR5cXVvMXgwZXpHVTY4RjdtYUJQRWNvajhkaWhldklIb0UwK2tGVDlSNWlv?=
 =?utf-8?B?KzYvK2VKYkRjbnRudEVta0wwY3FFdXZRVWZzeHJEU2NBdXJOeklSWEllOVZN?=
 =?utf-8?B?VEdPNEx4OFI3Q1l3VVpOcmpZVUYyZkhZemdGbFhIRmZBTkcxTTlTM1VDazAw?=
 =?utf-8?B?L3R4STduYkdydElNckFOZkRTTUhFRnJZZkt4bnpwWHA5WWpuNnpCcXc3RDB6?=
 =?utf-8?B?WkF4cHhLbXZ0bFBCbkZ1U0IwWDNqYm9uaE83SG1tMjZraXFNek5ZRHQ0V1Jw?=
 =?utf-8?B?NVVhZk4vaEttemZpeU5HcE1rR1EyWEZiNjFsQmU5R3daOGxGaE51UDBYNlI3?=
 =?utf-8?B?aGIxbEdFbWI1a3lhdnFQcjljakcwelBSUDd1VStOUkNOT1g5UnNNeVVOdG9r?=
 =?utf-8?B?RlQ2OXNMa2Z2U3ZYdzhOczV2OE1oWkJVQnJCUUlIM2VQMUVKUS9sZGQxV3Jq?=
 =?utf-8?B?L205b09kUmJqc2xrcW5XRTJmZzFYd24wZlFvSG5NYncvYktmc2YzVkx1clZ6?=
 =?utf-8?B?V09oOWxOWGJ5cklhYy9IOUFocUdGRlpaMGUzdzNCNHVZcHlNeU8rYVZaWEgz?=
 =?utf-8?B?SWdaRmFOSHVRWTF3NVBGOUlhYW1XbjluN1gvVnkrUTg4Rk5DWkt4M0VmV25Y?=
 =?utf-8?B?VjZOZ3RTNHpzWmxZd0oxUVpsb2NoOTh1Z2R3TGRFUVNZWU9VS0VwSkx0TUFx?=
 =?utf-8?B?Q1ZWbDZLWmQ3bUJkQUtEdTkzUm1kU2JoL0lYQlJsUkxtYUxndlhGNGptS2I4?=
 =?utf-8?B?REJTZ3pVS25HektVdzlVeCtpRzcrc3REZXNCZkZzTGxuUWtWZ04vUTRaTjJN?=
 =?utf-8?B?cTBoOEc3RmZBT2piYXI4TlNyQ2JldTk4Y1A1d2Qxdy83NjFrL1RZSmRDMmJu?=
 =?utf-8?B?K0h5b29rZUYrNmFzUFAxd0pTRzRPYitDTCszZkRNbGZjcEI5Q1h0NEtYREIx?=
 =?utf-8?B?WVdwUG9UZWFtcVdCNVNtZWNDTnN1SWxiTXhnYnU3dk94Ukh6VnkxaXB1OVRY?=
 =?utf-8?B?M2xYRXM0MVFCeEtveVhrNjVNcHRnSHpzRFRJZ28rT1BhdytSS1p5RXp3QSt4?=
 =?utf-8?B?QVVWUjZ4ZkhFeEN2K0FPSDdPVGZlb2UzclViVHVYQW8wYmVVdHZTYVd2RHFZ?=
 =?utf-8?B?UThDM3Ixdjh3MVR6QTNNZFh5V3dqbUZmVTJwTnhuN2d2NUE2d3BFeWphOXFH?=
 =?utf-8?B?c3o0VXh2dXU0dFVNS0c2YnVET1ltS1Jnak9DRGQ5Z2lVdmt6bzVOQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ef0e640-e63a-40d6-1a7c-08da3991f0f1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2022 12:20:20.4220
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Iu8+Fdy0ZvINSKtXV96SBQKWNWSN/BYxMYcSMCAgKsx5q0YknuE1cFg3TLKkJv4JRcGUjNA/q9EJScfRhCcEmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8788

On 22.04.2022 11:58, Jan Beulich wrote:
> EPT is of no interest when !HVM. While I'm observing gcc11 to fully
> eliminate the function, older gcc's DCE looks to not be as good. Aid the
> compiler in eliminating the accesses of opt_hap_{2mb,1gb}, which
> otherwise cause undefined symbol errors when linking.
> 
> While there adjust types.
> 
> Fixes: c479415610f0 ("x86/P2M: p2m.c is HVM-only")
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I guess I'll put this in (as being simple enough) if I don't hear
anything back by the end of the week.

Jan

> --- a/xen/drivers/passthrough/vtd/iommu.c
> +++ b/xen/drivers/passthrough/vtd/iommu.c
> @@ -2155,14 +2155,17 @@ static int cf_check intel_iommu_lookup_p
>      return 0;
>  }
>  
> -static int __init vtd_ept_page_compatible(struct vtd_iommu *iommu)
> +static bool __init vtd_ept_page_compatible(const struct vtd_iommu *iommu)
>  {
> -    u64 ept_cap, vtd_cap = iommu->cap;
> +    uint64_t ept_cap, vtd_cap = iommu->cap;
> +
> +    if ( !IS_ENABLED(CONFIG_HVM) )
> +        return false;
>  
>      /* EPT is not initialised yet, so we must check the capability in
>       * the MSR explicitly rather than use cpu_has_vmx_ept_*() */
>      if ( rdmsr_safe(MSR_IA32_VMX_EPT_VPID_CAP, ept_cap) != 0 ) 
> -        return 0;
> +        return false;
>  
>      return (ept_has_2mb(ept_cap) && opt_hap_2mb) <= cap_sps_2mb(vtd_cap) &&
>             (ept_has_1gb(ept_cap) && opt_hap_1gb) <= cap_sps_1gb(vtd_cap);
> 
> 


