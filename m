Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A84FC72DF54
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 12:24:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547987.855689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q91Bg-00085G-Ho; Tue, 13 Jun 2023 10:23:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547987.855689; Tue, 13 Jun 2023 10:23:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q91Bg-00081x-F0; Tue, 13 Jun 2023 10:23:44 +0000
Received: by outflank-mailman (input) for mailman id 547987;
 Tue, 13 Jun 2023 10:23:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kK7f=CB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q91Be-00081q-RU
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 10:23:42 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20612.outbound.protection.outlook.com
 [2a01:111:f400:fe16::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e3c8eae-09d4-11ee-b232-6b7b168915f2;
 Tue, 13 Jun 2023 12:23:41 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.28; Tue, 13 Jun
 2023 10:23:39 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Tue, 13 Jun 2023
 10:23:39 +0000
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
X-Inumbo-ID: 5e3c8eae-09d4-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=azlsT+wX3oW3O2kvM0bcV5HeZeq3nfwgjDExtsM2hMAbVpEA60h9E+g4OzA6EdItzOXOnvMOd8zgS9i9VeyTp9cONV22JHJC1UEs+HSRYNfEd41NXRtd4md3G+yOszYFg4CBbO0Z886daw/Q1ftsHHa6foWEpI1F/13BWLL9BPM1htx11Qv9OYgnaZc74H5mK1ffZ5cKay1j9CCQJLzoUnizOquInuwZ02rL8xKq0wuMFSweQ7dzdhDrR6qrAn1zOBjkecbEMOtMXxHmBlmLH0C9TP1S/OpiY+Uy2yBCYMFHVredqWg2jwfkIK4m0xnP5IB8UlyNM0jCxmu9IAPhbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NxHuK9m1PXy+DzrZ6E/Pc2dbZl7g3QYj5vzJVPcFc6A=;
 b=aLYYFxAAWmEUCDPVljr1QKfHYfwwpdp88Inypr3KSTcnhnfBSdyzpSG+THBuDtTzk4Jy3p4mLCIZsoEWQK3QJu0FsCatPFnYZS5A0vhivT4tn5mVxmKHQdzHnleI812QLBzljMk9FwnrDQ7tAT8OItpXXWv03s4T+SbptE7Csn61we6aCN2aslEJLsz3jdXEXw/clvya8Urkc330bXT4186Oly/b+mj0MWORupsKx+bDi2R00OjxtBsYXLyDtPD97t+P3KgcVH4SRmQTiw6C2qPJnKN1LD7yKfoSSPA5uJt/4r8Ir25oNs77/Ejyc1yfRbTDkfjcIiV6IwoG6v/8MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NxHuK9m1PXy+DzrZ6E/Pc2dbZl7g3QYj5vzJVPcFc6A=;
 b=qhxIZKJa2HvDwOnFVZJJN8tJlNsNr2yc9Fbp28RILKwxMXDYYox2eZbu7S0XdQIoZLNYoNf9bhgFtlDwjqoK7hJcMawyfAiG11T0gaBPZZJ3GZz11U/p202azy8RDeN0VqJSEj+EqIdbkLRipMP6NBoDehsdToLGelj1UHIBz2o+Pkobpeh98WS0oeiCAD5JM3IES9rfSLApNorQcl35zkwBdxuz6PJ9ZlvGsQLGBdyBusLySdhJJpjBWRDg8aOwFUTmU9bd3BdW4Il7NUv2fQWJGqCpEiWcxo+P+WSsXe6CzJYOpKSh/cn6JogNhgLsVUoO7Y1KI2Jy8mmvm66rxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1c8bf2cc-4c91-6db6-edf7-81472ee107ba@suse.com>
Date: Tue, 13 Jun 2023 12:23:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] iommu/amd-vi: fix checking for Invalidate All support in
 amd_iommu_resume()
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20230613101313.51326-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230613101313.51326-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0045.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8897:EE_
X-MS-Office365-Filtering-Correlation-Id: ee5a1117-1ef4-4c74-eacf-08db6bf840da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0uSMZW5aBMirsvpsTV1ClKi+hysqaxxWeDF0i1Wk+jTo1Ms0qCin/nTZMvK+v7dlYut6BvWcnXwITWpRF59wfCTMOzsa46yIWElMZ8dFei/a2mG65e8HmujfSY2jijZxNFXeq56rJiC2EfjHDuTvKzEGtpQrwzfHjhe5Zr4bA5SjBqZstv/M+npAoWp8wC47KbTUBVgsjaRjX2W5NtA7NPNvx7DaeQbQH1yKMpR32WEweSmqdGNjiNWr+DBJlcp8Hm8CoPUAZXHh8ZwqwCo0vXe8FCYUeQgfh42WOyK8vjuiRxLl25NiHaZ4J3GYWrt7OJ7cI9aeyqhGHgKN74iZxMDGKi5Oh8ytCme1+Vt+yr+Hgfzyt6Ntzok6oTH5DftssMBZolNKGJ0hHz9WmOAULTbrpwlo4ESnhpklp1HLjqUaHcyYikKjMczLxF4ZTUrtjLzf1OVHeqRDAX+yzz5K/ZfJN0iGCPoGgWpmo+Qu1l5Muzv9KvQva2eJQi53uD1n7YfcGx9dgdY1tMHTalp54ZruHaCVRpEJP6CiNS1LMnOTEMSQoMCw0H6MaauInvyckcnSsOAOPR69kW00eceXf+5asP6j6RNWemvQrdd6KADrux/tPZr3salLqAumIOOHM5RnFB0TsAWEdzEqXHdU1A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(366004)(136003)(376002)(346002)(451199021)(83380400001)(2906002)(2616005)(36756003)(86362001)(31696002)(38100700002)(316002)(6486002)(41300700001)(8676002)(8936002)(5660300002)(478600001)(6916009)(66946007)(31686004)(4326008)(26005)(6506007)(6512007)(66476007)(66556008)(53546011)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MDU0YUg0V0doLy9BQXVCb2k2UEpqZFNHL0FmcjV1RnFBcVZLVzIxNy9BcTdI?=
 =?utf-8?B?K2ZSRGV5TEN1QkNydXJyL1JoYTJFQ0JwWkZ0UDNNdDdEbmp6Q0FQRFZrWm5Z?=
 =?utf-8?B?dlZnRHI0TmFPaG1SOFF6aTdvalJxMXc5dW9veW5wclAwTjgyaGdDUDh0NWVh?=
 =?utf-8?B?UUIxMERSY3c5TjRmM2dVSGpmNE1EMWdMVnl5OGtRVzlZMTFRekJvSWNXQnlS?=
 =?utf-8?B?ejBSaHMwbGljOTNTR2FhcU9JY0VZOFJhUWZWUytwcjNxVUtsQVR3c1hRVDBa?=
 =?utf-8?B?dHFwVHp5UllrbG9MZzRFM0RET3dPZ0tvZzBMakQ2KzdHWVBnQ0FwRXpGWTlL?=
 =?utf-8?B?R24zR3hUNXZDYjE3UFExeWFBZk1hVk9HeFBKc2c5WVg5Q1JYYThGVkMzTHhh?=
 =?utf-8?B?S2pnS0tubE41bXRCeHpiZmYyMW9Yb202aUw5cm5DSW42aytIdlZBZUR4UnBt?=
 =?utf-8?B?VVlRS2xqYUlQaENoblNkRUwwckJpOXZVakhZaGJ4NW55bnBTUzhXL002WmJk?=
 =?utf-8?B?KzJCNm5vKytoQWl5T2pCRDRmVm5pUGxwbk50UUFtYzM2V3ZLY1dpaFZjMjdk?=
 =?utf-8?B?UlFBeHBRUnlmMHZsaHhMcmRQR2tJK1pBaE9aV2hTMFBMblJ3bGxlTmlXcFNh?=
 =?utf-8?B?VzBYcnNWdEZDRWIvZzd2MWlIc2tTMTZPU3JkaGlFZkNJUmlsTUIyN2tXd0k4?=
 =?utf-8?B?Q2JEQnFEekRwSGgydCt0Vy8xUWNVZzkvTlk0MXVKTDRmdVNoWDRiWkh1L0FD?=
 =?utf-8?B?WTNnVmZkOGMyNVF0WVJkN3VDQy9Ea1JZamtib2VIVy9Pd0xHdmk5OFVoNkN5?=
 =?utf-8?B?TWp5Z3pWOGw4eXFQd1BhU00zYjBpek52ZE52YktuZDBqR3FRbUpGdUJiSnJa?=
 =?utf-8?B?cjU0TWFKdVRjSGk0czRpVkErYWxlWkRiY09aYkpLcCsrWi8rV055RXA1MXZa?=
 =?utf-8?B?SkV4TWRnK1I2Sy9sQVFxNTE4SEhXbCs5TVpOYmd6TWt0QWl1dWtNbFJyRHVn?=
 =?utf-8?B?cWNUMUxZSVJOOGRZb2RLRkxPdmxWcTluNk5jR2JCQmFzNk1KU1Q3eUpmcm9V?=
 =?utf-8?B?YmQxNkN6MHRqcFJIYlY0bWpnNjlzOTNsODNiVVNTYVlYU0lGYTBHK0NIRktG?=
 =?utf-8?B?bURTQ2hVQ0RWeml1TUNtcklUZnR4eHBZYktGTlhNcWR2Rlo3b24rWlV5YUlE?=
 =?utf-8?B?MDdaaGIzMStkVTFKeHJrRnlld28xczV1ejJLODNvQXlmUk4zU3ZoOUJIUnlz?=
 =?utf-8?B?d1hha3Z2bFpDKzQwNHVmQ0xoSEpKcjYzcC9oZ25MTEZuRmFYT0JFNzVWc3ZF?=
 =?utf-8?B?OWpreGxqQ2x6U0lCTWRyUjZISUJMczFDYVNHQis3YUNHQXByV0w5NU4vVkI4?=
 =?utf-8?B?U2lPVzJxUXIwWCtLQWErZGFjOGxubnA3Nk14WjZsUytTeGthdEZ2dWY4azE0?=
 =?utf-8?B?NHZIQnpxdi8wVEM2MWg2TXBDSHNUQVdWQlN0R1k4dldTZThwTy8xMmlldzY1?=
 =?utf-8?B?a1IvSFhweUpTRnhlOGx3YXJrSjNzMUxRRFJvaE5CUWFpbjVpWE5CNTRHOS9Y?=
 =?utf-8?B?dkRwaFZ1R2xkUFhRNXZBak5UMy94cVJ2R00xQzJLeWRHTWtoQ1lXS0RQc2tF?=
 =?utf-8?B?T3ErWGtwb1pMNU5jY2x6NFlySzhCOTJtbHpwd1R3dFVOQTlSNlRYaENjOHFZ?=
 =?utf-8?B?cGpqaVJyNmwvY1Q0RkJpTTFSRUtjd0trZlhwNkZoOWsxeGw2dzAzOEFubFVk?=
 =?utf-8?B?Rkhjbk94dDJDdmcraVpTRENPR3MzZzEvNTZQZzcvSlBXTUx5ME9mcFRGTFFC?=
 =?utf-8?B?ZDY5MnFpMU1kWVpnN2xNMnFTMjY1cmwveWZPT2lObHl2ZmowdVR3TGJRb20x?=
 =?utf-8?B?TGF0eG8zS1dzNGxDYXFmVGJzakg1aDVMQm1pQ0duTzQybVFhMFZFNEJjRUpE?=
 =?utf-8?B?a2pOemVSeTFWaWpSdlN2emZDTlFPOVNlYS9CQ2ZFMnZaVkJYWEttL1NFL2Va?=
 =?utf-8?B?Mm1tK2x3RlFXQ1NtK0JGQzlhZUtQVWwrR2pmcjVtaXhlb2V0ZnNsUkw0aEVr?=
 =?utf-8?B?dmhDM2FWa2pjanQxSjFFRm1hL2lzQ0F2K1UrVDRIRWdnZTBQdGd3Zmw3S1dr?=
 =?utf-8?Q?ljsnf8yWqhpOLd/Cc+/BvvBts?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee5a1117-1ef4-4c74-eacf-08db6bf840da
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 10:23:38.8558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +GlMh4eb7QrE+JWEW0Ty7bqJA8xy+Mkx9998izOBvMLBELgcJyXnZbsYW6EnpsifwLCx4sFmJI6aFzCIKQjdmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8897

On 13.06.2023 12:13, Roger Pau Monne wrote:
> Do not rely on iommu local variable pointing to a valid amd_iommu

"Do not rely" sounds like we might, but we choose not to. But we may
not rely on this, as the pointer simply isn't valid to deref past
the loop. Hence perhaps better "We cannot rely ..." or even "The
iommu local variable does not point to ..."?

> element after the call to for_each_amd_iommu().  Instead check whether
> any IOMMU on the system doesn't support Invalidate All in order to
> perform the per-domain and per-device flushes.
> 
> Fixes: 9c46139de889 ('amd iommu: Support INVALIDATE_IOMMU_ALL command.')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> I don't have a way to test host suspend/resume, so the patch is only
> build tested.
> ---
>  xen/drivers/passthrough/amd/iommu_init.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/drivers/passthrough/amd/iommu_init.c b/xen/drivers/passthrough/amd/iommu_init.c
> index 9773ccfcb41f..4facff93d68b 100644
> --- a/xen/drivers/passthrough/amd/iommu_init.c
> +++ b/xen/drivers/passthrough/amd/iommu_init.c
> @@ -1580,6 +1580,7 @@ void cf_check amd_iommu_crash_shutdown(void)
>  void cf_check amd_iommu_resume(void)
>  {
>      struct amd_iommu *iommu;
> +    bool invalidate_all = true;
>  
>      for_each_amd_iommu ( iommu )
>      {
> @@ -1589,10 +1590,12 @@ void cf_check amd_iommu_resume(void)
>          */
>          disable_iommu(iommu);
>          enable_iommu(iommu);
> +        if ( !iommu->features.flds.ia_sup && invalidate_all )

You don't really need the right hand part of the condition, do you?

Preferably with the adjustments (which I'd be happy to do while
committing, as long as you agree)
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

> +            invalidate_all = false;
>      }
>  
>      /* flush all cache entries after iommu re-enabled */
> -    if ( !iommu->features.flds.ia_sup )
> +    if ( !invalidate_all )
>      {
>          invalidate_all_devices();
>          invalidate_all_domain_pages();


