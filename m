Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7F079D5CB
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 18:07:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600619.936333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg5us-0007Aq-UR; Tue, 12 Sep 2023 16:07:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600619.936333; Tue, 12 Sep 2023 16:07:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg5us-000785-Pz; Tue, 12 Sep 2023 16:07:06 +0000
Received: by outflank-mailman (input) for mailman id 600619;
 Tue, 12 Sep 2023 16:07:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z1UZ=E4=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qg5ur-00077z-SP
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 16:07:05 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062d.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6876ee70-5186-11ee-9b0d-b553b5be7939;
 Tue, 12 Sep 2023 18:07:03 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8949.eurprd04.prod.outlook.com (2603:10a6:10:2e0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Tue, 12 Sep
 2023 16:06:58 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6768.029; Tue, 12 Sep 2023
 16:06:58 +0000
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
X-Inumbo-ID: 6876ee70-5186-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ikW33EovcYN9rniHL1msJUpgdVTbO+eHDoHfytGxoQUcG2D7NELHblDhV9t24ysZCQh+K+halALKuSZOG5TEwjs9iJlO1T9Qn2Gbw/RfjUlW4UUWV4NedsSK8mmNd5pH6lz4YLigTWkT8OyFwXFvpLrbcmjGFASlmwpAQqXCS+VRVqh2QZ7exeZew6UScX82BKc7Q6TTIToRGCWbeHHbwGimz70kx+nu99uTF66rfAih+9KoIGFQme+eveMfst1jKBptoqS9HRbnttyQWY7Tf47Z5XyDkDS9WHzZ713AzJ4tkG2LHTUe729QzgLSt8OCe+hZNZzULFMDhEm4Spxz9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wzsXcFSWEdlXijQubwCYl9U1coWHfULL3RUYSmsvHs0=;
 b=NUTNsDctPn2nq5PkmM0Wi5GHeXnSrQRYpbQfY2I3R46ABuZHkID5EKWfOQpe60dh2mK6vpP5ZEbxyDQMLAx9yi3HLDxwXKDsksWXpDlpW5XvBfR+soABz8yNopG4TpfLpnoqQTn1AaE+A6MQ4Ubo/QcRn03imgD1dr+tpV/37D7aNYiE4NA6TApsmL1DFL7oYdIFWPzRCHaNraXqH80g8nuv2wkQt8ynVycs2DMxEx7Gq1Wap+kdahhPnHjLn+u287plTC9rgF5M/VmoPm6hoIa2geSx3L/zOy5yeAZOqwk4DbFUCJkDBSHrmHQfIsxQf2SThPGxNJflCyR3YcrdUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wzsXcFSWEdlXijQubwCYl9U1coWHfULL3RUYSmsvHs0=;
 b=uJlkijlhiSl/MHz262tVVODBMF+rml0rjFPtFVa3dCtBX+JESk2PI6T8EhTKQsBzdG3mZwB9M1hZA74lGDok9S4A5YVxIj9K/9jbFyWaW4od39E1LYGWkyJ4C4Of5CqoFO30Y0ZYeeHP1ERTQ2rJUoEnIConhN9pgZsC9YaSStC/UvvlBBTnCst3gbIlXG6Y+0RckzZ/4FJ+w/rfVii7yoROgzSw8QvwpzrCQk9/7FrULHJUGi8fYTOpYLu8wFHeEW3haKQzZKBwbUKxFX/ulNNXQwPtjmioQGhXhOAXeDbjEkC8ZvJ++BoXIMdk1rFFA2Zcb57LrS3h/Pec2iWCPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b450e258-7000-a6f5-ef18-11e9a198cbe5@suse.com>
Date: Tue, 12 Sep 2023 18:06:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [XEN PATCH v6 6/7] xen/mcheck: address violations of MISRA C:2012
 Rule 7.2
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Gianluca Luparini <gianluca.luparini@bugseng.com>,
 xen-devel@lists.xenproject.org
References: <cover.1694532795.git.simone.ballarin@bugseng.com>
 <3a9bd4547d64902998bceba58acd611e09779f57.1694532795.git.simone.ballarin@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <3a9bd4547d64902998bceba58acd611e09779f57.1694532795.git.simone.ballarin@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8949:EE_
X-MS-Office365-Filtering-Correlation-Id: d5995bc1-9da4-47a2-56f3-08dbb3aa4aa9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ltalsvddvkmPUa78ez1ezNy5dEVSYWjk4Bch62QMj6k0wIvppmDvE6a8sDVHCJIQQI7haKjnkmNZ7fK+I9dDiUiwDOC7PxEHGFrNvV/9A9WEGpshOEqQLDvRYRW3+jbLPoVzqS5qYkX/5hesji1NjQnzp3j/m5fQw71VyAt0DRf4lFYGxq+a9DwcrOiIdz2a+TqaWhH3nF4EA4girYbeul87H6Zsmif5qk9XPvuMj48UDEaGBoy6SnxexjufCPZTMoPZR+v1cSQIN+oAawkTp3xcw+IkFiB+o8xj3xLs7+/Ic70RZ3LOmMe4rpQYos3pX5p0gRxuc0bfxYZbd0M85rTbkmr7qXuLrxhp+cbK2ywt+3gm2J+Zcze7FIWBm8Ze2uvFSmvlMCYyWYPCCmT1NG5nWe5QBv3mvvzKsbKoKH9zMgJlmqpLzo2CMX9R6Od8d2NwqgOkZ2PMqEka1hdm7ppUc8bVif/ri3uzm8680EKd+jo7+3DBfC7Jl7bQSfsI/Q1zE/eEwpTcTWC302x/OB2OuMN/Au5FQflFZEYW8rH7v/1fp+J9bH9moslXeDwb9l/2kHD+v3KZJT2fIrk/GvMvHIqJQTvZzLJgVfacTlT14kvRKmFzs/loNpZeYJqof8QGi2CVYgif5ih/eS36gA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(396003)(376002)(346002)(366004)(186009)(451199024)(1800799009)(6916009)(41300700001)(316002)(26005)(31686004)(66556008)(2906002)(54906003)(8676002)(66476007)(4326008)(66946007)(8936002)(5660300002)(4744005)(478600001)(6666004)(6486002)(53546011)(6506007)(6512007)(36756003)(2616005)(38100700002)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TTU0eGRvVFhSS2IveGZ5QjlYdkwwbXE0YlZCV2VKUThLbG1EUmZraWJQZ25M?=
 =?utf-8?B?Y0NzWHlZbzE5WUZQUkJXc2Z1L1UyVDFaV05sU3BERXZyVkFxUWJqd3ZGTTll?=
 =?utf-8?B?Z3pvVXNqcDZjMC81SkZuNVh0c1MyQjNsN3JhNElOdE1uS2RlYVE0bmJMbnJD?=
 =?utf-8?B?WFBydHRqYStVRDg1ZU1TRWJYQkM1QURGUlhPVVV1QUxNb2d0YUR3ODFiZGVy?=
 =?utf-8?B?eWIwVlBZYjIzUGtPN1VXaUY2TGNMdGF5SFlRd1ZiNkpGOGJmODV4N3RWVjND?=
 =?utf-8?B?MjRSWFhaZElTVC9XVWgvSmFrSGJ5dFlCSTJHcTV5N3NSblgyUmQxeHF2dnh6?=
 =?utf-8?B?L1VpbEN4SmJDWCswNHJrTnhieVpDRDFwd2tLNkhCeW14azErbDhXWlBYeEVQ?=
 =?utf-8?B?SFR0OTMxSzNYN1p2OWhGUzJ6KzRPK3E3b1hJSWNZR3FXWXVlOUxIUDkxVkcr?=
 =?utf-8?B?UDFnSXBnU3lnYlF3cFl1SjZVTFFaTk4yMkxtcG5JRVhKUG9nUFUrY0p0NEZk?=
 =?utf-8?B?ajBPQTM3QjlKK3diT24xM1FzaWVRV1dsSFJIeTVwRmRIV0F2Q2dXbktGMEp5?=
 =?utf-8?B?cWQzVjlyVC9aendYSkJFR2lWMnhYSm1kMU56VzFsY0RIbVpoRTB6c3Jab2pt?=
 =?utf-8?B?REM1TmVkOTdtdXJ0UTFrWXNpK0dpMTJ4WWhFK2Z6eFlIK2JoTWdZaEFsN0h1?=
 =?utf-8?B?M0tLV1VmUXo0QndCczlLRDBmbnhzZ3U2U1VqUE0wcGhmZkZNVHg5WlVNUmRp?=
 =?utf-8?B?US9kWGpYdlpvNWg2VEl6MDdML2hGUzNVamhUa1BlK1R1OVphQWRCK2NIREpi?=
 =?utf-8?B?VTdWbmErbHM0dTYvb0N5NWR1SGZXMEsyYlFPaWliaTJRWnRvWlFpS2YyQXFP?=
 =?utf-8?B?QnlyQzhPVE03Y1R4djZrTzA2aUV3Y0VVMG5kRXk1VzNabktzbmd5dUVVT0RW?=
 =?utf-8?B?eDhFaUJpb0lvSUFLeC9maVI4WUdoVHl0M20rUGtjdHJ1bFVJeVZ6MHlzeExX?=
 =?utf-8?B?QjYvNXo5ZTYwdDNWeEluekdQU0RXZG9zVWhwTWdHS2d2WGxsRVRVK214OXlx?=
 =?utf-8?B?bS9aK3Y3S0dBaTRlNEN2WUh4b1h1cXhxWUsxdy9pcVpyZkI1SWc1Nk5RUlVx?=
 =?utf-8?B?ak9WOHNlT0hlUEg3em9OWjBJbWozZ0xQSWJyL0p0QktLUXdpT1N5NEJQSUlj?=
 =?utf-8?B?dy80UndBMGFEdlVJRlk0L1BhWGk4NUlKaXpLQUNwWnBsZS9Pbk11cFdEdG5W?=
 =?utf-8?B?ZytHUjB5T1luN0swTnlmMjA2dmNOWVlabFRIRVlXQzdWRnJ3TjgzZVUzbWE1?=
 =?utf-8?B?Zk1XMGM3OHJZRjZ0UWNNK1FPOGN2RmNvZlRRMjNVTFdDN1IxMzd2RkwxTzB1?=
 =?utf-8?B?RlFjQWxxNlo4WVIvZmwzVEV6T2VLR1F3M1UwNzRkNk9PZGZmOWZDRW1OVUda?=
 =?utf-8?B?WGRKeG10V2FHU0N5VHErV24ydWplMGlnWWwwb2lhRkFVZXUrcW5hWXd4RHI5?=
 =?utf-8?B?d3NGVS8ycUI3cGlvMG1MbXBkcGJhMDVqWFVER2h4WDg3N3NmeWJPY1h1ckgr?=
 =?utf-8?B?REpBb3ZjaWlNTmVkVmlUZ1B2YzhTK3VFQWpVVGdKaDFrR00rMFhOQVRuQ3cv?=
 =?utf-8?B?SDRyOVhaOExpL05sNDk1UGVZWW5UODZTMVF1N2JyN3p5WkR5YkRQMFF4V2NX?=
 =?utf-8?B?dlMwTllaQy94UWZiMkhmamlwckFzVTQ5QmtEWTUxT2ZxWlVGL2VlNmZOUktT?=
 =?utf-8?B?TlRsZjNtYUNKZjZ3ZWo2cUR2TTV4NXlDUWtPQzFkYi9GWjhLYTBJMTFTdmI2?=
 =?utf-8?B?SGoxRnVLTHBWMFVNSHFWWXlhQXk5YzdhTHM2YmxuUUR6WGlhcE55NTg3Y1RE?=
 =?utf-8?B?QnFRazBzdzMzbzd1UUVoQ3RCTzhqSm5LSmU1V2s2SVZvdGswU2NKRW0yNFhH?=
 =?utf-8?B?SVc0MDQrMStHL1ZWcmhrWmpNNUZ1cnVLcWcrSSszQldhQXhSWUFjcm5aajNR?=
 =?utf-8?B?c1JkSk9zRCtZNVRTbGFES0FHbjluWWNQZlRmVW5FRG1VeEVRaEJ5QThkRUtK?=
 =?utf-8?B?eTREWnFwTWt0cDk4dGdESnpLRFBIUUp2V1VTZEx6UVRqVnhGK2xETUhWMTdZ?=
 =?utf-8?Q?MolijRy4xsU2c+8ntOjuTmk4O?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5995bc1-9da4-47a2-56f3-08dbb3aa4aa9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 16:06:58.2609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jllssQsVXdDGYo3qZZYggFTALEJqGa8GBrUVpkM6QDE2fYU4vxKNqjy71LKo6geNpdMTVr1O6uob/j/MfIpgRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8949

On 12.09.2023 17:39, Simone Ballarin wrote:
> The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
> headline states:
> "A 'u' or 'U' suffix shall be applied to all integer constants
> that are represented in an unsigned type".
> 
> Add the 'U' suffix to integers literals with unsigned type.
> 
> For the sake of uniformity, the following change is made:
> - add the 'U' suffix to all first macro's arguments
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



