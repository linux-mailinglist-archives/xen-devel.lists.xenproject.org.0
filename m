Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8774451B8D4
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 09:26:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.321515.542508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmVsP-0002lG-W6; Thu, 05 May 2022 07:26:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 321515.542508; Thu, 05 May 2022 07:26:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmVsP-0002iB-Sx; Thu, 05 May 2022 07:26:17 +0000
Received: by outflank-mailman (input) for mailman id 321515;
 Thu, 05 May 2022 07:26:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LiPz=VN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nmVsO-0002i1-Ah
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 07:26:16 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a58ae20d-cc44-11ec-a406-831a346695d4;
 Thu, 05 May 2022 09:26:15 +0200 (CEST)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2057.outbound.protection.outlook.com [104.47.9.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-20-To9vQ7ZVMmKzJcZ_J2FH-g-1; Thu, 05 May 2022 09:26:12 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM6PR04MB5192.eurprd04.prod.outlook.com (2603:10a6:20b:e::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.25; Thu, 5 May
 2022 07:26:07 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Thu, 5 May 2022
 07:26:07 +0000
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
X-Inumbo-ID: a58ae20d-cc44-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651735574;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TB0faeh4zp13fDu5tnUkmcmjBzWc6IWHLvzQtK/pD7k=;
	b=hRuHD/NNoFlTjaxrabzlbWGCQNQ1S5IpsnxqeDMvRSEVwqw1qNxF+sRUQX4XM1Gn5DjT7W
	+cbqWReFfKzNCkvcSBByjJGTq7OtFnI60MZReAMVTfMI0TbA2YecHRlXZiw9x0kUpIKEij
	7TL8u/CvryohzH4HDgNZONXDLdSQw6E=
X-MC-Unique: To9vQ7ZVMmKzJcZ_J2FH-g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=meLBR5R75Ho3qlQCIoj2lEKJcGxd9IouCmVK65XQYjJcFK73tday7FGUPIhL4e3L+X6Snb2N0CMgEBl9wD1xnJk3YdBsHTqs05MW2GrtNjn07tGQfPznLrHwekD7xxl2FXwcm25bev80Cu18+Q2xWh8ezsp1AS94nVLKrCueOYqv+gkNeO7jagXysk3H0jq1pml29bJbkEqbXqgfFk1OtXTBPiHMZnRv2XTup5yrudgwSmV5X/CZNI+nKntwsGot/zTOyHRgArVXI96QgEywDoG5FdNKGmTanoVrOjFuUBwXXdjHK0Ifm4Y1x0mCxvJvn1MqEH1QxGT2prqUaaNXOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TB0faeh4zp13fDu5tnUkmcmjBzWc6IWHLvzQtK/pD7k=;
 b=iwlcOp9MbAPocpXK/w9z92+ty1PKV5IM1KHFQs7gE/32caMXhyIowcoBVOxWYSeGiBIllC5Kc/wRaPuSryskj1AosXh7yP59i0c438Br0bs8idesL4Swh6hJrP4qrXdq4i2+/5uTsCJ7E3CaU7HmcNLwe7c0fWuZ1f0W/vcyWeyOPGyKC7WobhfPcPwkzxUKsXq2W7yckraQtqw8NTZvQO5/UlUlyl2dwj7Jxtu01EihhCyqCE6RQ+f88HqzWmldS0jT+ogY17YJVLabggnqdQQO+b6Rinea7qRZOoT+0R9STGag9Qj2IQoo6MJIaZJjqvs3exl3Wv9QR17gzYaRNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6e3aa32b-5b6e-7432-a6db-f2e8f9937c2a@suse.com>
Date: Thu, 5 May 2022 09:26:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v6 4/7] xen/arm: configure dom0less domain for enabling
 xenstore after boot
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: jgross@suse.com, Bertrand.Marquis@arm.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com, Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2205041715320.43560@ubuntu-linux-20-04-desktop>
 <20220505001656.395419-4-sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220505001656.395419-4-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P193CA0100.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:88::41) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1df2e99d-5be0-4d39-ea4e-08da2e688548
X-MS-TrafficTypeDiagnostic: AM6PR04MB5192:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB5192E24A0418F2D60D887EB5B3C29@AM6PR04MB5192.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kWGnrrkbaJzX7/yOZSO6y9tewEmh7N9WxEPKF3TVTeFzOYwqGXfWoh8rjUmLidYXaWgr2l4INZbH/P+vme3F2hO2yoipyl5JxrMo/2VugySe4/3AETysT+bc2ZIZgexow/mkPON53vVzlkA9kcgC+m1mUNmSncCyNwm8OA6Bl08KhvgL2WolzhyQKbW04yIaBNWtAWqnpflPZIdh68fqfAKWCGquwd8wQhmaROwjDg8KxjgPX0GTDXLk9aNVS5aOL1bNvj82J3VGAvZijcHEk9at6wP6nRM9XSWTGQTNOpFj18ZXKGk6dtWRfV3qLwkUTai0C/9k8j+TD0O3zGEEw5ZHx3eoRIj0kJa6FL8ZUMhGs1fQ3HE5/Tf5remNEwp+bXgHtFcpM9C4ARpB2gdKsesJ0GMAJ7U2oQUhYdRQMuadGhCc+yRVJqdZhaepn8NlCSLQL3n55BT3WkEQ4lj4Mh25OmRJJLfw3YE8IRcsg2p4BFetkjwKhOKwqXef0y7ntSVpv2G4edXYz+679nclzu0tmY0G+leDrXYsSUUduxIi98X6Hbxmp6xyE+dVPOy7a8MRZ7v1U/a8rKcKMGDeg8Vo9MAtkkuvPxN6xOycOmv1CHxSCclBzOYHINEoM9ChkVRMdXQDdok3TQjoBtr8lDy7zSqj/FAjBG1tBaVbRj+TOZilxdNllm4TNqE0SM+FcvktHOImLAx24u2CZw8ms3atcmGZkmZrL5QwDt2Hjtrex9hQpsZeuG1E+ZUcEZWODp2uc8dDIF+BWGXsJOoHCQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6916009)(316002)(6506007)(2906002)(54906003)(8936002)(36756003)(53546011)(186003)(31696002)(31686004)(86362001)(66946007)(66556008)(66476007)(8676002)(6486002)(508600001)(5660300002)(38100700002)(2616005)(4326008)(83380400001)(6512007)(26005)(32563001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2x5RkRJbWRUUmtReHhrUTdqZmE5UnltL3AzU3lWQ3QrM1VtbXhzZk9tM2VI?=
 =?utf-8?B?a3NPc2pJY0lrdjE0NTFwaTdKb094RU5FWFRMWGp5SzNiUmV1Mno4ME9pU2xj?=
 =?utf-8?B?ZWtQUHVxYzhEcnRhbDgyYXd3SFRuSldZZFBkQzRpQmhIYkRxMVBKNU96SkMv?=
 =?utf-8?B?VWRFMmw2NjQrSTZxeFhWL3ArQnFvV1ZaeC8wS1ltRU9JazRwdTlBVVlzNUtk?=
 =?utf-8?B?aXZ0dVNtQTVML2NCeEFZczFuZEZqaGNxOExOVVQzb1llTnRzdGJlem1DWTBP?=
 =?utf-8?B?b2h2RHJKKzJFVnhueEM1Y05RS09DaXJ6V1YrSVEwMTJlTTBkZkJ3UklJbWtV?=
 =?utf-8?B?eUpSZUhoVG1zNk9CSFNWMmhGN1lFaFQ1dWN2TGZYNWdPaFZhSmVJZFRFWFk1?=
 =?utf-8?B?THdHWXE1RGdYUGxoR29oWjVpYWxaZWEwNnJUVm1EYWxzaGNPa2RFMDlaSW9l?=
 =?utf-8?B?S1J5ZElXUTJGQWRvaVBUU1dkbDkvckEvRUUwMmdya0MrdERoR0RXQ1QybzdY?=
 =?utf-8?B?YkgzSWUzd0U3ZFBnS3M4RHlEcU9kdDlGK1RwMFAwT09UQ2N4TzlpeFlMZUV3?=
 =?utf-8?B?b3BISGZ1aWtTdFVmUzdtVHkvS2gvd2Q3K0dHWkc0SU1wSzc0Zks4TjNlek9S?=
 =?utf-8?B?bXl0ZlhzOVVCOWExWm5YdFg0TkFrL25TOEVuTjM5dTFvYmRIRDFqcVlaeHd2?=
 =?utf-8?B?dk5aK3BKcER1RWhsQzJFOUREcFJ3cCtBbDdGN2h4VzVKYThNaDhQOGVMZkFo?=
 =?utf-8?B?NWJIN0wvT2cvRkdaQ2pyM05xTmVmaVczYjcwa0JTWUZScUtpLzZWS0lFbmhT?=
 =?utf-8?B?d09Lb0N6L0hsUUEzcHhyTmRpT000dWJUTE5rS0ducTJaLzFWNjJrWDM2N2xQ?=
 =?utf-8?B?SUhFWkFoY3VPZktWQWFYRGQ4QUNvSHFYTDN1dGNFa2wzRFhGKzJPWTVTdW9j?=
 =?utf-8?B?S0tGY1NQbmt4aEYyRGJJb2VSWG1WWXdYL0FhSmo3Mk1wZVphaFY3bG10OTRx?=
 =?utf-8?B?R0xRdEFGVHZvWGQ2WW94RmFvekZVT29DTEpBQXQvTHN2MXF6VzA5MGptY2JX?=
 =?utf-8?B?dC9weExiSWE0MG1VcVQrL3NyQm53SE52RDcrTmlMVkI4MlZ5R095Q1N5V2Fv?=
 =?utf-8?B?dE1FR0Q3QVJMYjJINWNhRnZkTXBUb2dCUGl3NGpvZUZHS3FhNUU2UzUxUUc5?=
 =?utf-8?B?aS9CT1liY0xYM2ZETlhCckdYcnNJOXZ4ejVXd0w1RmN3eXVGK0lFQmUzOE1s?=
 =?utf-8?B?RFZCTklucjZ5UnRMM3dPeVNpWU1wck0vUmk3NFFlak1yVUl2MzRkZEl2V2xR?=
 =?utf-8?B?akZidmJsUTFvZnBiem5hLzNmWTdOM0JVSlJqSjNXVXJNRHd3WnM3OWRySHh1?=
 =?utf-8?B?S28rOWZWckhuQVVteDR5YTVQbmFwSXNPeGNKWkp6ZjJPWmFsTGphais0ZVR2?=
 =?utf-8?B?UklyMEhNWFN6elBBbC9oaUZpMlMyMklNdzM0cjUyRU5mWWlzTTdHNXgrTVBy?=
 =?utf-8?B?ZlNnRkoreitEQ0hQZlZRbnhldWRiM3VsM2Y2THVkLzBTQTJISzMyTzRoQU9F?=
 =?utf-8?B?TUdVOFJ2TjI0VHJoQTZVczQ5WG00OStrRStyTlVwWVMxbFo5MSt1Mkpiamdu?=
 =?utf-8?B?OFVnS3VwM3ZRMXMrNWxqSkFBT05mbmkwNXhKL2FCdCs2TTVTNkxwQWVqTUlI?=
 =?utf-8?B?Rk1uK1VNNzFHZHVZSzY3bDNzL0JmYUYvZ05iblBnblFnN3FHYis4K3Z5dzNs?=
 =?utf-8?B?N2FVN1pUVW9VY01sQUYvM0FLVHhoWmdTdDBEMDd4MmtNUjlqUW9NM2hPV3lN?=
 =?utf-8?B?N25Mc2FhMWdLcFpxd1luVmYvVlE4OGU0WGZlV3N5YndiOWJKYUlPSndwZ1dI?=
 =?utf-8?B?ODM4K25DYUJEZ3pZYmFTNHVEWGFkL0dwU1R2WXRhQ0JYb0JjL2x5ZUxNaUtB?=
 =?utf-8?B?YlNLSkR2aXU2eVQrTG1wVlRURUNDV0IrT2ozOTJ0ZGtKVUFxb2J3WkU5YWZI?=
 =?utf-8?B?UlZVeVZrNUppTzVWbTZCYSszcGNVSDYwcnlBN2hEM24rU3BmNE1JYW96VUVI?=
 =?utf-8?B?dnlzSUZmd3FGV3JUdFRwcWd6dEhSdHYyWHpRRk9ubWtHVytzOWJrSEhiOGF0?=
 =?utf-8?B?Q0hjdGRIenY2YjVKa0lPeDh5K0hteEpwRmRialhzQ01vanFrUlNzSWtMbzN3?=
 =?utf-8?B?cnlNNldLOGxWWFI0VWZIL1J4VkdsL2ZaNnBaM1RTV0VqemNuTmF4U1c4d0hN?=
 =?utf-8?B?bmlzV0hFMFN2cDRwa1FUMGdwOWV6SjMxRDRwL09YemVzdnFzOExTakMxZzVB?=
 =?utf-8?B?clpZNHkxN0xiNUFUMEtCU0RqNUl0dUw4NytmWVpkcU1YVVMrRUVJUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1df2e99d-5be0-4d39-ea4e-08da2e688548
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 07:26:07.5377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kfBQvWJHGTfK0Tr+sZdt3iuJntoulIOPJqvIx31b6NaXNpVq9W6CawE7EmqCeUzUEDTRjMO8WBM1rYjmPNZcgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5192

On 05.05.2022 02:16, Stefano Stabellini wrote:
> From: Luca Miccio <lucmiccio@gmail.com>
> 
> Export evtchn_alloc_unbound and make it __must_check.
> 
> If "xen,enhanced" is enabled, then add to dom0less domains:
> 
> - the hypervisor node in device tree
> - the xenstore event channel
> 
> The xenstore event channel is also used for the first notification to
> let the guest know that xenstore has become available.
> 
> Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: jbeulich@suse.com

Somehow my ack given for v5 was lost?

> ---
> Changes in v5:
> - merge with "xen: export evtchn_alloc_unbound"
> - __must_check
> 
> Changes in v3:
> - use evtchn_alloc_unbound
> 
> Changes in v2:
> - set HVM_PARAM_STORE_PFN to ~0ULL at domain creation
> - in alloc_xenstore_evtchn do not call _evtchn_alloc_unbound
> 
> xen: export evtchn_alloc_unbound
> 
> It will be used during dom0less domains construction.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

This is somewhat confusing to find in a post-commit-message remark.

Jan


