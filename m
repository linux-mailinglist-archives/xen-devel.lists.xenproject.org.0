Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 339825829C4
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jul 2022 17:37:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376283.608948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGj5c-0002R6-4f; Wed, 27 Jul 2022 15:36:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376283.608948; Wed, 27 Jul 2022 15:36:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGj5c-0002OK-0X; Wed, 27 Jul 2022 15:36:48 +0000
Received: by outflank-mailman (input) for mailman id 376283;
 Wed, 27 Jul 2022 15:36:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C2cV=YA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oGj5b-0002OE-0y
 for xen-devel@lists.xenproject.org; Wed, 27 Jul 2022 15:36:47 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2066.outbound.protection.outlook.com [40.107.104.66])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eba6790e-0dc1-11ed-924f-1f966e50362f;
 Wed, 27 Jul 2022 17:36:45 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB4931.eurprd04.prod.outlook.com (2603:10a6:208:c1::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.25; Wed, 27 Jul
 2022 15:36:41 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Wed, 27 Jul 2022
 15:36:41 +0000
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
X-Inumbo-ID: eba6790e-0dc1-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X5ZEl7bB451Txc70q/CLbse2XGEEf4te2SBD3SjbzJtZs7/wcK8Yt9/vpYxLAjrMHKzvDUw5sMSks4+W6mGj+qAEoqwFPTz9Cua+R/T3RdZWt3j1KHz9J/FpNwYW857+jJM8VV0fBAyUxql3QwgB/9K5FaNiB725Rjvz8hkRtz2W/8WvYnOf5RLVMOzsNnFmSrQB+QZwOP0JFwnwCgxYaSZ+QxVVPqk1jyXqzdMFD9EDf+yw3ewSdhjAUAUTu6gW0HTA4oqXRbQbCcjHJ6FgV3ZFnzdbRn3/PiW9entc1e4NeNHBDfjAiLbTC9ShWaJMUA831lcsxI4VXgRT+RX3sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cN5o6lWAgUERhcBQ3a1gWXNIEjwgU/cBpWcwDYvqMrk=;
 b=g/oaMEZwqMOM+3lmMK9FAgp4BMeIKtO8FXRh693umwFB+3FR3+au4rfc7FWlgrZgWY0etSITkZIbN0QEux1mf3KQV/GDFWkA37zFMamC5LVuJ6HvSB2TSHZK0AKTHq9ae5wzYIenixmHSiRJinmz2PWK5CrqxfVUDYDyxFgvN/2KQlyeBw+NmrFYMtYnPIluqcYw7PdBa6Q0SOfu/cLEarjDGIOpgkJ9oDLd5selHe0B6Ha6f09DGZQxAuXjVw5DbWaw5fko1MWwdKIbyZ0VWBLa2XW9XSJ+an9WlPdQ248hZLGyEDcN0JDmASYv0nzfXa1lDBPa0lpPUKfBFJEW5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cN5o6lWAgUERhcBQ3a1gWXNIEjwgU/cBpWcwDYvqMrk=;
 b=m3mqJWjHiSI/zWR/sWSHiSiqz0ltHDQsltyOERC2IwSNdahaDXReFL4sAm9VpxtDsSEeDqtO4pm/U9MH/K0M+cAwHCVCPBMxihNjZFE0TG5pPwAUL5S41jt5sjGqFsfCOOabCz/5lyc8fXCjpbEvBvTaBmOmIlQpa40Of5MKdIl/clcKaGVDtsybvPAKR4cE2eWZvecUXaP2MCsYJeLATZavF44SQ4FNIPt70AqdTYpPEiT43gxHXq75rHqaau+zOmTO66QYiXhfFh9TPpyaoLMFTya2BvPTRSN1itGkqSLZy9e0qbIgUXNmZExl5QKzHHqDDJ/R3gFcrQIppM6UYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9db28ce4-d4dd-3806-75c7-a6746d40cbb4@suse.com>
Date: Wed, 27 Jul 2022 17:36:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] xen/arm: asm/atomic.h: Fix MISRA C 2012 Rule 20.7
 violation
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20220727153254.1143503-1-burzalodowa@gmail.com>
 <20220727153254.1143503-2-burzalodowa@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220727153254.1143503-2-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0010.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 901cf67f-57f0-4bb7-089e-08da6fe5cdad
X-MS-TrafficTypeDiagnostic: AM0PR04MB4931:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xegoS4vPkZQYXpolLOJY5bVfaPR9Bd4H10UenjLk3+jh2DapSuybIvI5x13xd356TU4yn8lMcMBOsSp5wNsbanZAF9FXMFU8owIWCDZSX93qgfT4iJB3M32Qfo0pTpUvZQQ9C13sRDNrV0cHwSi0eQXRsF2+YEGKasjzlYa34IjTqMIHw6UQz4NyImjkI7UDyMM66Q0ryYfSnl+Q9fKM5XxDylge+UZS8vjwyWP1cvmpNGT3oMekW/LBR+JGIzyd4IPMGaxIM4U3m8dJXKFMOLYhW0ReL+2O3WWVFDiYlq4aHgegdba45NoShr/oT8XNJvTVYWlhy5wxBfwUq1e6adUw0LIR/Swyjrp7FvBcjE2DmlmaiqpY/HQtjMRLoLHfCr+CI8AwNTvR+XMlcaKR8XExCtTxrQI2L1V+uL33JRcPTzoRE+QGLC4rolH32nfe9tx3ktXarpeROKmQNbl5BQpPH0DSAxX1S4abC/NXJhBXi227NM7SPtWVnhxwm0CqBxadjgSnRln5wvtItw+g2kiXs0xGme2CdbuMmEaOma/Dhn14Y/4r1P+N+y5Igs4YOqv7PIsSqk4E2LVaeKlZWPIYIiVYtd/v6TKpfU80DCLokI0H5vn9WIddvWpv3g3oaTI/bfp4VmYwktDwhjsNsCze02qG+pRpbs26IXnOL7tnmLA1cO47zRG5PDsMrfGL0o1X1qdp4C2NBP9GCciNC1eYpeMJkxWfFblEOif5sgHwhPAbbV0sPH0YMwi6BXT/RVBDnf4LL6V9zRvmSZpaO28JdFyddTcaPBTRuVzpqrxcHWP3wNqJpCrv45+WG1Qxm0hv2UzUdGOp1T4CBifmKw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(136003)(376002)(346002)(366004)(396003)(316002)(31696002)(54906003)(2616005)(6916009)(186003)(6486002)(38100700002)(2906002)(4744005)(36756003)(8936002)(31686004)(5660300002)(66556008)(66476007)(83380400001)(53546011)(41300700001)(66946007)(478600001)(8676002)(86362001)(6512007)(4326008)(26005)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWlCZWRFZGkreDJ6TE9WbHlxenV2TVFNQkFYd0hSRkcxbE1rdE5qcW1zcXdM?=
 =?utf-8?B?VzVjYWFLbExBRCtnOHdHSUF2ZEhXYjhIdkc5NDhsREp6WVR0U2lwSmhDLytG?=
 =?utf-8?B?TThrNEpSZytsaVh4QVZQUUNVdk9BNHBnN0FaVmcySmt2MlA2Wnp5QmxxRWlx?=
 =?utf-8?B?Skh4eWE2VHBIdnhEV1lUdnBHM2Qwak5qeHRPRUZNZnBqaFJIcGlzTU9NNkhr?=
 =?utf-8?B?ODA0UHFPazU5M2FNb1JJV3RodzNRenI3bDlSVWhUUThTQW1NRkdkYVBuMnlT?=
 =?utf-8?B?LzNPNGRBdSs5NDIrbkt1OUpkdjJkYW9TNjNnZ3FPU2FreDVjMWNlbW9peGt6?=
 =?utf-8?B?M2tYWXUzVWNCTS9xUWphb1dCUGcvZ0dBdkxKbmRCQ2dkT3lFWk1BSlUzY3Bw?=
 =?utf-8?B?UkJFU0RLMVhYYXlpck14cEdNd2lUQ1ozUUptekRCdVJCdkgzRTVhdENtaDk2?=
 =?utf-8?B?UUJqektIRFlZNFh5YmRqOVBtRVFSSTNVb3Ntb2lqcnpwYVVIUmZzV3NsK21Y?=
 =?utf-8?B?WVJCYmRvQ2dvUU92NnI2bWVHbnZkYUhaanI2VHBMK2EzTEtSNlljMUJ4bmtQ?=
 =?utf-8?B?cHN4K0xKWm5uWFUrcGVkV3c0bWgwR1RodlFONW01RFB2YmZvTnRJcXFFcmZq?=
 =?utf-8?B?OTRJOG8xU0hucVpyRUxveHRxS1VGVFBVT0lxMFRDMWVTaDd3SUJjZXZHSnpQ?=
 =?utf-8?B?Zk43d0VTR09lQzA5ZHZqaWtDV0dTK3JTNEVxNkRxWEVRTGlTY0J1K3ZzVGU3?=
 =?utf-8?B?eU5GRHpjZ1NEald0aUZ6MUFNWEpwRW1YaWJjTnhDaXA5STZyR0FHQ3pxQ2Mw?=
 =?utf-8?B?UGkvMTBFOHUySmoxTW15SWlQNXRFVEU3dG85VER2OW1lR3lQenV3aEpLTFhI?=
 =?utf-8?B?TDM3eGxuaFIyZGNvZUFoN213YTJqMmtUMk4zekZuMzh2eUE0NW90TE1BclNu?=
 =?utf-8?B?eW5FaGdJWWt6TGUyN3lVNDVqalI4bEpZdFhaazBJZzRPTTBGMUk3dE9Da2JQ?=
 =?utf-8?B?T1VxRStQdFVzMjRDVlV4RUsvb0VUTXhYNW1SWVhFUGU0azYzOEFTd0ZDKytq?=
 =?utf-8?B?a2dzaldtaGVRUEFuRFNWcERYWnZMMTMyamtmZzcvRTRzUlhEUlpGNHgwckR3?=
 =?utf-8?B?UGNCT3Z5cm5JZUtsM3VnNXFEZ1dzUVJEUklBY09yWUt1ekJaaTQ4YUlud0VW?=
 =?utf-8?B?NnMxb3BxY2xOZGRKVVdRN2g0Q1VwZU0vUW1ENHF3OVphYTdGT2JmRlByM1I1?=
 =?utf-8?B?TUdhRFBYOTd4dVEwdlc5L2hOQkJETHBQdk5PNTZuSXkzNzRjMExuWkpzRTl5?=
 =?utf-8?B?ZzA2bGpiOXN1U2lsa2YrZVFoMnJEUmNYdE1XaVViWm9UMG50MXltMm55QkFX?=
 =?utf-8?B?b3lIZyswUU41TXNJMDFmbC8weVVlM3FtaDc0czNkWEJSQXlVL1lScExLT0Ur?=
 =?utf-8?B?ZTlEUm5Lc0JqYThUK244ZFlLNUVJTnVMcUZhQ0VBY3JhZTdiVllrSjFMK3pQ?=
 =?utf-8?B?Q1UwZkNGaGt3WUZEMyt5OHU0NlUyeXN2WDUwZDJaMmd0N3R6OGdXNlFXU3Jq?=
 =?utf-8?B?bXhtd29CZGpWNG53enpCNkZScmJWUStic1dDdTNpbTI4RTdJbitiMTZTV3Ju?=
 =?utf-8?B?ajJKUHRGbDJkQTFZZW9IS1FQT09ZYXBPRnF5UUcySk1uSHBydThFcU9CMU9M?=
 =?utf-8?B?Ynl1SXJ1RTZwRjA4ZDhnbURJbUV1YzZoN0doRk5YR1VaRkoveTJjalBZcTA4?=
 =?utf-8?B?cEtmK09OUXNLbTloUHMvNXA3OHdGazF2R3I1c3hVM3ZaQlZZTjVuMmNhUWpo?=
 =?utf-8?B?STJrWXdKQ2puTFdMcnJ3RmtpOWlWcGxXVlV0R2lrL2o4dWN6VkRzcXJzSVlI?=
 =?utf-8?B?cFZYT3J2TksrempLMTNuSDAzYW5tRElWdXUyS25zaWZHZThKdi9aL1E5SjdF?=
 =?utf-8?B?bHFYSVhuTnkwZDVDK0VldmFrREVLZjNkeHRFaHdXRmM0a1dQTllhVmhXcFRH?=
 =?utf-8?B?c3FtUlhoWW5QUVZvRHdUcUhUcEV2SVlYRzJIZm53MStjUFFpZHl3REN6MjZw?=
 =?utf-8?B?ZkxKYjRhTDFIVDJsTUtIVGNaU2NqUnZUWTVIYWpCWmlOVk9vSUY3Z3VBTDdh?=
 =?utf-8?Q?q/tkUi77f2HokBjXW2Q3gM5Hb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 901cf67f-57f0-4bb7-089e-08da6fe5cdad
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2022 15:36:41.6928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S7BoSLbg/s2SgfwXaEx9ufK5TiyIlFQ2x3qyzuS9/8NaT9WLC9XLBHBFpPuckjjDmFy+/EbBvrIv/gYh+j0B5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4931

On 27.07.2022 17:32, Xenia Ragiadakou wrote:
> The macro parameter 'p' is used as an expression and needs to be enclosed in
> parentheses.

Yes, but ...

> --- a/xen/arch/arm/include/asm/atomic.h
> +++ b/xen/arch/arm/include/asm/atomic.h
> @@ -123,15 +123,15 @@ static always_inline void write_atomic_size(volatile void *p,
>  }
>  
>  #define read_atomic(p) ({                                               \
> -    union { typeof(*p) val; char c[0]; } x_;                            \
> -    read_atomic_size(p, x_.c, sizeof(*p));                              \
> +    union { typeof(*(p)) val; char c[0]; } x_;                          \
> +    read_atomic_size((p), x_.c, sizeof(*(p)));                          \

... not in the first argument's case - that's not an expression.
Too few parentheses are a risk, but too many are as well, as they
negatively affect readability.

Jan

