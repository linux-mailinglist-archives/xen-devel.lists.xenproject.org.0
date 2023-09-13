Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F86C79E161
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 10:02:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601031.936926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgKpe-0000IE-57; Wed, 13 Sep 2023 08:02:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601031.936926; Wed, 13 Sep 2023 08:02:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgKpe-0000FU-23; Wed, 13 Sep 2023 08:02:42 +0000
Received: by outflank-mailman (input) for mailman id 601031;
 Wed, 13 Sep 2023 08:02:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qgKpd-0000FO-47
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 08:02:41 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20605.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8cb29a3-520b-11ee-8786-cb3800f73035;
 Wed, 13 Sep 2023 10:02:40 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8801.eurprd04.prod.outlook.com (2603:10a6:20b:42c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19; Wed, 13 Sep
 2023 08:02:37 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.019; Wed, 13 Sep 2023
 08:02:37 +0000
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
X-Inumbo-ID: e8cb29a3-520b-11ee-8786-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EHDJ5yUPtSw3xTNCcSgUv3sFH+JhLJRlTA+aLYFbFLzlJ2XHm0vt8T65Ng9ChuwtzGkgrKRxBzKm9snQFTF8fiE3pQ0IMkHsrM88R9DBYx5gaQs2TDU86Kryb66OfJndScptmbk9IteG9JwTy61xO4AzLLNF9/gNeLQnr3qr7d2dTU4sE2bNiVA1aU9ZPYRlDjtp89dOZ71WUrARUd8QolV+n20+mhL+yMx7spm952EhqxY/frE+ilA0SiAqFylffdsf6n1ZkeL9nYUNfjO648caObQKYiHqnxGEb+mhdN8Ob9o4WBAkThUJ7evv+NgY3mmgdHdaq9suTNcW0OxuoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EWB9k4jgVV/49PCdTj9xF3VItfyOrDqS0rQTg6pzZB8=;
 b=Ce7rVxLjG2uwJ+XT59Dxm7HUJJAx6Jg8/p177BLrBGbmXJFrAO0mQu2kl/Op5d/EhtKC7QL34q1DX69CqlkWUxnQZWYZCNMrXP3qiWdNOWcpg23jaaLxyDBRJQTM4Ul4wQRTrguxXoYRqfpfMBDpM/88MoLMhp53v17wTRB2K/6c+bPT400lYEDO4vV3KAWIieUrD34UJY/KBBEB4wVuozYTdBwStIhTIEkjvbuhVX+FwconrDTButCvmV5ApefOc0c9/kWfTMj7u6BMY2eYCNrPbk9SMDWPc4Yxi3J3suYXu+m3hNCh1dat7KSzR0Q5tRTwDUh64292ktnh9Q+mrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EWB9k4jgVV/49PCdTj9xF3VItfyOrDqS0rQTg6pzZB8=;
 b=jKvdEsBv6uJWGZ/rHpXWKJ+Dh7jvFdE4A7IErMd5Wklc/PA4AYKzwmMG5B8kOEXL6NrcOhlqd8l8oPP5Y+8arsK7oXOqMZeBhXUKN/WTLdLN70FB+vz6KLOna4ypbegeXw1IuPvU1aM/X/CL5FTkVHIWd6woEj6Iq5p0bqQxaQCAXhlaBly2hqkOSm2sRxs+I26r7aWgDVJ79dwTN6M7HXg9Hv2pLGosr8PhFkPvOSNBLWfhQrbdpHZEm7xi56y4+Dm64X/KEaJO28s8zcWA9S0D7QEs3xuibtKRP8ufHxtS4b+LDOgyOA/bVwfpUANUGkoPcVPwMEgELfwqV9dlBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b62205a1-885b-ea4e-3ce2-7ad58cfc938d@suse.com>
Date: Wed, 13 Sep 2023 10:02:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [XEN PATCH v2 00/10] address violations of MISRA C:2012 Directive
 4.10
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Doug Goldstein <cardoe@cardoe.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <cover.1694510856.git.simone.ballarin@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <cover.1694510856.git.simone.ballarin@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0002.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::12)
 To DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8801:EE_
X-MS-Office365-Filtering-Correlation-Id: c762afe3-3b84-456c-489b-08dbb42fcb5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TIHnSn+riMAlP2/sTe1v9xfLROpP0maKNHoD+GX770FOvw5h+1garzXftA0cCC2SlCdacE2DXs54pt7dgdXhWZfudGFRywukwnAU7HV5t+XEbk09AIYyxYzirp3ujwYo9pPE/ABf0MrRPW+MJwCQ10MsQDA6VaCYZhg51Xq53DnVKphBsesjJIY69e1+lPxDEM9vCUtUoTjHFlPJwfKDTI3bz3/aRJ5vp/IP9S8/n7s3I5YI8BhYPJGJN3ARfScJXnpFwSPzIy5iHiMI0Ejgd4zAlZC2UEfMycT9HSKVs5U+5aHtjdFptc8yR7wJtKqPB435sYw865jIx6fDxeTfeeOYg0AQ0QeRiw6YroiYXiKj/WtdJUfCp5J3Vax6oNUfals04MrNHhjqypG72GVREhp2gTeAPK1jcfbtdQ2Odr6ArFfHm1RecuWfUIgyyM9DCzOk1pDT4nc4ChHgltEdV1a+9ZwueTAKir/Lk3DJEvW2WFV8cL5Z9ZQ6qgXMj/kI3Yi9YOQIh++8OOf8sK+dP3uKH/+dn+9JkMljGRe1GVj3putmeAbCC7IgwFkGHw6bCLqxmmSde86mLLU7BxkoHL2XQoKMFMj1xS6tMRLWJYsnCeCxzcoFUcKNnEOspoetDyz69SWsf0Il7Y5qa2U17A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(39860400002)(136003)(376002)(396003)(451199024)(1800799009)(186009)(31686004)(6506007)(53546011)(6486002)(478600001)(6666004)(38100700002)(2906002)(7416002)(83380400001)(2616005)(26005)(6512007)(36756003)(86362001)(31696002)(6916009)(54906003)(66946007)(66476007)(316002)(66556008)(41300700001)(8676002)(4326008)(8936002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGExdndVcEpGSGZPbFZqWndUUzR4ZlBYM2Ywckt0b0JsKzN4aGdVRUwwWkVO?=
 =?utf-8?B?ajdPMEFYZ0RZTFNJTzdQcW9tQ2F1QTQvQ0k3MlVpYk1acHRhVU16VEJSWnFu?=
 =?utf-8?B?VGloUmNPVDJxVWxNZDM2bXU4L2VHSXpyTWl0ZGRYblFNR1lwNktRenN3YlNu?=
 =?utf-8?B?WnNOUStTZzBCdFJ6cnlOVUdWVUpBbmpwWXhQa0dFYVFCeGFPa2g3WjJqQnFY?=
 =?utf-8?B?ejBqYUZxQW9LVFVPUzJ6cGs2aGdNa3lLcEFKS0FzTFdlanlVeGJCWER6cnJz?=
 =?utf-8?B?MlZ2M0F2aEp3cC9HOHhpWmVNRmcyT01XUkZHeWZldVVNSkF4M0JFV254RVdG?=
 =?utf-8?B?cWFtTytuUHd5aVFycDFPWDE0S004cUZtUjd2a0tSTGEwYXNiTTBqcHNQa2lJ?=
 =?utf-8?B?N011ZHBBRFV2b3B0RkppNWlpTEU4Y1dqaytET0JTSTQ1MFdibEFRaHZBL0Y4?=
 =?utf-8?B?VkJibjlTcE1RRThrN2hJa3NrYTdseFhhNFFwSTVpYmpjK3hxSFQ2ZUEzRXk0?=
 =?utf-8?B?dVVrRjAyUG1TOEgxZ2xUZ1ZOZWIyem5FWHZqVTlCOG9nbEVyd3NUN0RGeDdP?=
 =?utf-8?B?ZnpJN2tOeVVEUTBGUU1pQXhmNXJKdldNQnllMDV2cmpnUW9JL1NWeFJUY1Jh?=
 =?utf-8?B?TUR5K2ZkcUpFLytYVzJ5NXlmTFlBUGlLRWZtbHVyNzFHa0FsMnlwaUpiOUtI?=
 =?utf-8?B?TkpBK3NRNERldGh0aFpoN0g3SG9JalFUNU5FL01oRVlPNlJPSHVVZHN4V3Zw?=
 =?utf-8?B?THZDWmIwdENtR2lVN25qU0FSR3hsL0IrVG5EU3R3SW5EdEx5Tml1Vlk5Z2J4?=
 =?utf-8?B?WlVQcW1YQXYvcCtpT24xcEFXM1NMdmxYMlBvYjdneUJFTzZFOHhVNk5CZGZX?=
 =?utf-8?B?S04yWW1RVFRUcTNTV0VoaC81T3ZJNTVwWmUwaVV0M0VaUXYwN0plYzMrM0Jq?=
 =?utf-8?B?UHNBalhJQXltTUhZeXVlSTJMV040VlFmb3pxSHNkUWFIUXZDa1ZtUy9tR0VV?=
 =?utf-8?B?eDF1enV1d3dYV1h5ZVZNZ3AyaDlxbWFIZGhIcGNUbmtzRkZQS09YZDNVTDdG?=
 =?utf-8?B?ZjdaeXpjWGJkT3JkVkR1andUVTY3VmpFOWhWdHc3aVZkV1lGcjl6S3NnL285?=
 =?utf-8?B?NnoydjNPb1ZDZkNydHAxckllVmJ6ZkNTc0lvZ082T0lLOWoxVkF4R2wrMG85?=
 =?utf-8?B?QjVSNTE2RUNtdEN6Sm5jZVpBY2xKWFVVZHh3aDM1RFBaQnR5elk3UTlWODBl?=
 =?utf-8?B?R1FRaGhCbUVYYWJ3SDRyVWNsbkpPaWpVOFNDT1o1UFFtV2VMbCsxYVV2VjZr?=
 =?utf-8?B?MzAvR05CM2lhT1FySjUzWVEyaDRmMFhteTQvR1U1RFR4aXg4SFpFVExxc3U1?=
 =?utf-8?B?eGxKMUVOK0wxTDlNbkwydDVLaHZMRnRLd2ZLUkVGUlZ0Q1hqU3EwTU1GcTJF?=
 =?utf-8?B?N2d5V2hob0t0aFp0Z0U5UWlEM2RCZmJHSzVmczU2Yk4rTXYwUjZTZ3ByY1ow?=
 =?utf-8?B?VjFtVnNaZCthU2pmempPcDZPaVNoQS9aVkJNWnc2bkUveXl2dStKV2JZUXo1?=
 =?utf-8?B?dUtMcXJHNy9NU1dpTWFTNUNQOXNzU1FvM0psNkJHKzdQSkNBNjJHWkJ0UkZv?=
 =?utf-8?B?dmYwMWdpOUJYeFZKQkhjUlJYZWJhWDNQYUZmd1VjcVlINUNFaEQ2N216Wk1x?=
 =?utf-8?B?MmhGQ3F0SzhkVHQwR0hKOGhZbDJUR25hTWc2TGR4dmc1NUtxWEhPUUF5L0pl?=
 =?utf-8?B?d3MwUDBGRHhjdVJ1bkZMbFFybTlrWm9sTzZ5OVFZR2xzdHZpRVQxcDRkYzU3?=
 =?utf-8?B?TERNNlR1dGtzd09OUldmVEhERFJsQ1VyU1BnY1hGcjE1MFlkNTQyOWZyQ0ZK?=
 =?utf-8?B?ZGYvR0xQK2tVWGJobXY5RERFUkVEamN6elhvV2tGcGs0TEFQNXlRMTNmbmZF?=
 =?utf-8?B?bEFvbmNCQ3BrSSs2TE5hWFN3R2djRnlvdkpEY1hoQkxBbXpaY2tYNGhlSWp0?=
 =?utf-8?B?c3cwS3UveU8rT2dqWnR2Yy9PbmNjMjdrV2hYUDgzakZDSnpJeklBajluVjJ3?=
 =?utf-8?B?ZW1EcFVKclVtSHdRQm1URG5KdVdhK014OTZKbzU3QitjTGtsY0E1Vzd4ZDdW?=
 =?utf-8?Q?EhGzk5SYIxFggNPfbhIxD2Yhr?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c762afe3-3b84-456c-489b-08dbb42fcb5a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 08:02:37.3030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +A9mBKP6mzDmQv4YYIV9CsuGaurUSWd+nM3s3IOuSLPiNrvWvDvQAOtjiel+jEuAGNxxV2TaNJNKUvW3HG+HbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8801

On 12.09.2023 11:36, Simone Ballarin wrote:
> Add or move inclusion guards to address violations of
> MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
> to prevent the contents of a header file being included more than
> once").
> 
> Inclusion guards must appear at the beginning of the headers
> (comments are permitted anywhere) and the #if directive cannot
> be used for other checks.
> 
> Simone Ballarin (10):
>   misra: add deviation for headers that explicitly avoid guards
>   misra: modify deviations for empty and generated headers
>   misra: add deviations for direct inclusion guards
>   xen/arm: address violations of MISRA C:2012 Directive 4.10
>   xen/x86: address violations of MISRA C:2012 Directive 4.10
>   x86/EFI: address violations of MISRA C:2012 Directive 4.10
>   xen/common: address violations of MISRA C:2012 Directive 4.10
>   xen/efi: address violations of MISRA C:2012 Directive 4.10
>   xen: address violations of MISRA C:2012 Directive 4.10
>   x86/asm: address violations of MISRA C:2012 Directive 4.10

Just to mention it here again for the entire series, seeing that despite
my earlier comments to this effect a few R-b have arrived: If private
headers need to gain guards (for, imo, no real reason), we first need to
settle on a naming scheme for these guards, such that guards used in
private headers aren't at risk of colliding with ones used headers
living in one of the usual include directories. IOW imo fair parts of
this series may need redoing.

Jan

