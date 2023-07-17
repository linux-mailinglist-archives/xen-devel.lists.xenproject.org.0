Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEC97562F8
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 14:43:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564513.881980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLNZL-0000pA-34; Mon, 17 Jul 2023 12:43:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564513.881980; Mon, 17 Jul 2023 12:43:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLNZK-0000mA-Vl; Mon, 17 Jul 2023 12:43:14 +0000
Received: by outflank-mailman (input) for mailman id 564513;
 Mon, 17 Jul 2023 12:43:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hD51=DD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qLNZJ-0000lc-EJ
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 12:43:13 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2055.outbound.protection.outlook.com [40.107.13.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7dca2683-249f-11ee-b23a-6b7b168915f2;
 Mon, 17 Jul 2023 14:43:12 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB8380.eurprd04.prod.outlook.com (2603:10a6:10:243::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Mon, 17 Jul
 2023 12:42:43 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 12:42:43 +0000
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
X-Inumbo-ID: 7dca2683-249f-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KpKPbqWv5RagIKH/xBOLGGFi1Q8k21PUukeyW63kJfW1JmTghDke0tqzbuZpC2CJQOQhUSqPOEOSbcv+VqcJJWKsW4iFlJTv7hl8xr2RqQ5236Xrdctd9ufcO8L4PloOTuN2/oB2m9GR/BQXQQ6CRxgELsNMUIlG0Is3TME6NDQfnhR2aTZAfsbt5TyMjUwuv2Pi816AH+YrTSqUgCBPwQyZ3PwSrmFFYvLHav3ZNRfeBD2ce0J5DaWrMrW6Y7a97VcBnQWkJsl3oPnhNMvLTxH18oBgn2Wv+7jrMUpaPASSWIo7ijKwWcjvoZTkpDedf4JhkBadHAvhv2k8rQvfFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MQzy9L28lTIyH174AXLHeWgoOFrApuF0WR5Lp+a/hmM=;
 b=PkEiehIJNGIRkttDLlG8Lh7gC7byn4y/fEXzuKPYGj230YARSFNJh6CEd5hnBc3O622Bs0SlDxYK3hJlMmZRxC2ms/zhUYcz418iYujR2DnhtCbdId9amQpurKAzy3/DCptJcWFXwLciqVdJkw3zyC71YcDFy2j/DEnr9OaZYlUovJuNJKQ54yWnMwiP4pjFxFRnF6mByWmYKsA7Ji6QwVre92gUoeVWqSvLugSL/EFQv2ALAD4MFVJ8kcYHSdzoWVatqHFeykMNNCp6t/0X88L0dnewc6Y9ii3CujACeTeXkGOeWRXmsyaNvMd7WjW3/zisyYz/lsqUu/qNbiDoFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQzy9L28lTIyH174AXLHeWgoOFrApuF0WR5Lp+a/hmM=;
 b=XwArCfFFRAxuyjmrigtHVYwoLJfxXbpDlkOe1SY07R4k5LUu2CDQL3CPGi2+GgTMfP7zmV2ZG8pB8XmsjSKkh8AKkENIRjxeYYZ/yVH4hL4av17a8iehtXptwUKi/DHFzx0aL2Xw5BQ2CAI1fULZFtnkxFhy9c15sqXdbMXyue0uXhcmz77S0rKmIwPXvaNrydtZuEAXzbgViGE0LG5bsBpnutImv4IeJYlX31gXETBrXtVJvvbUOAbJQ3QD1uXvzED3g1iqOniRlTAwrmylWMdq1ABvuaq+OTvtxq89zaJASsMxVFIyOEdW/9baCnVOSH5nYu/EHLRoPcOo7Ta0rA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <747d6fc3-f20e-924d-5eab-5c387ffe439e@suse.com>
Date: Mon, 17 Jul 2023 14:42:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: Violations of mandatory MISRA C:2012 Rule 19.1 in X86_64 build
Content-Language: en-US
To: Roberto Bagnara <roberto.bagnara@bugseng.com>
References: <fa2bc5da-b866-05ac-409f-c26e025428c3@bugseng.com>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <fa2bc5da-b866-05ac-409f-c26e025428c3@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0068.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB8380:EE_
X-MS-Office365-Filtering-Correlation-Id: edfb141d-73fa-4672-15e1-08db86c35086
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	acDZBdUYN4zxQSGlsfyoX1U/p2XUBQztU+tFC9XUFs0ih7yhy3eL5P1Z95D+cYY9XsXBrBlvxHFEvfqUI0yf8SYuZonktZs1jfRcS+xURT1wvekAIWkczsuvmBDbb2vKK4UsEtGxSgoWZg50mVhM/IDbjEuI1AIKqoP3uS/r85prOHmtBtscpbCyrxIl6oRRbx5cZuBchUKITzp0OR+qRkim2xwsLnndYYtzbNHwL45ewVbA7AicX3e9cYp+9XAapUfUHdjj7K4wSLM5pafSoRWHUfaa3Pg9aznWj186OHzDVe3ZVooCjFjrzyaX5oja+VLRrf1zpMWUU0HGWgJ9B5e00NCSqibvoca9lClSx60vWdI6jVRKtpiXjntwYXuSBffv08AHsOt6DBtlv0SO2atf6o/8jJyWq6u6v1cAOd+XpLVu7GN0q2knIg8hER9RvGdwleekBtcZRNWs6hXk7Yt3jFY7vV8jNGX4oJDw28hWDwYXONX8vHxQHs/zZn22LltHNwPRWMEJUnxLatawJUnp+IaJ2CnAQMdpYozFSzlOXcd67U7rGyXWFw2Q8B5JkwMi6yX76tsMBUgJp3VyE1o7OahD0Ao5T0iQ7w2sSBPsHCmdISCsx+jhn9hFit3VxJOWSD2eUuJXxtH37A9nIw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(396003)(136003)(39860400002)(346002)(451199021)(38100700002)(6486002)(478600001)(41300700001)(5660300002)(8676002)(8936002)(66946007)(66476007)(6916009)(66556008)(316002)(4326008)(2616005)(83380400001)(186003)(6512007)(966005)(53546011)(6506007)(26005)(86362001)(31696002)(36756003)(2906002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RSs5QjJRc2JNbmcrczhoUXFPZUpJb2UvcVJvWjVxcmhHR2VqanRMMWpzZDkr?=
 =?utf-8?B?TGp5QzJBbytCczlsN1l2QWJGU1QzNUR3bTdaOFM2VjUvNlRHVDNvRkJHMDVP?=
 =?utf-8?B?S0pCU3BOaWZHSC9iR3dqdW4rUVBDZ3hBRnR6U3JQMkNYTEVqV3pzZ2wrZmhu?=
 =?utf-8?B?SWZ5N3laek5EcDlhbEUrUnJHNFRJUnQwWU5PT1VzTWRJZlA1NTRIbUFhSHlY?=
 =?utf-8?B?UFhicEdhMGJXclZCMVVtZkxvNGltSTE5VDBZTDZkWUVaTzE2MkQvWUxiS3hJ?=
 =?utf-8?B?ZHJtQVlKeHlUek8vQm9ESkllOEFMbnJ2WldOV0pnSXNSWWsvY01ZV0drd3Bt?=
 =?utf-8?B?ak1lVThiRGk1NlVaTDRzSTNaNU9taGpRZThBT1Exd29IYUV5eURjTk9JemVp?=
 =?utf-8?B?WVFHUG1IU3FLblk5eUdzRmo5d1RlN2pzU1dyTldoTVJXclpuNDVnbTNuMUh3?=
 =?utf-8?B?TFVaVUdtZ0d6OXRKenh2dzlDeFVRdEt3dWxvQTdSMjZ3UzRRRlRYc2ozbEFw?=
 =?utf-8?B?Y0NtdEtocWZ5cG1kS3pkMUh4Z2x6S045Y04yaFZyT2s1VlA5c3pQY2tRTUdC?=
 =?utf-8?B?UldxN3NBLzVmaGg1cHlJSG5IZzJTbUwrZDRYVVNyRWFMZ0YzbHhHVEVQT1Iv?=
 =?utf-8?B?SFdvWFpnMEdSbkgwRmMyVll5OGw5bE5zOEFLWFJQZmJnby9iZE9FVW5kRncr?=
 =?utf-8?B?THl1Uk9yZnNDbGtPQnVOdzRPRTVRbzdQVk1lcmJhVmZEUUVaYS9FYzVlUTho?=
 =?utf-8?B?K004dXZMT2xNM1UxOVJYU1d1aFZ2bTlQckNzenlTbmIvT0NhVnJETnNBdmZB?=
 =?utf-8?B?aGVuajBqUzJGR0x2U1R2RzVzN1hkZlA3Ym1OQ1BiVWk1QnNGcVVrelBPQVpM?=
 =?utf-8?B?M3ZFYm5lYXpJWHhSSkg0THNCOFVTQlYvKzZPZXhJazd6ZnZHZXl2NWdoYzY4?=
 =?utf-8?B?cko0bWJXOTAzTERBMm9Oai9oUGFwMDJsNU1oWklWMWRJc0JzYWJJeUxSVmov?=
 =?utf-8?B?YVA3NlF5ZER2c2YrSjMxeWt3VnU3bkxFRTRMUzI4dTlWbFdsQm1Hb0RaVUFa?=
 =?utf-8?B?bDN3dmkzZUFzNkFyVFVuOC9QNWl2c3MycjhxV2dmc1kxQlNVTGFaYWtkd2F1?=
 =?utf-8?B?WEsrQnZVNlBIOUQ0SHhLZGNsRi9vdFMyUkJOYUVYS3p2b1g3Q1B3MmltRldS?=
 =?utf-8?B?RG9aZWtLQlBIcTBYZG1ZZUR3UGR3YnBDbXJyODBKa0hTMUVURzRYbkQ3b08x?=
 =?utf-8?B?bmZHTnhnalYwS05qMFdMUHhtR3ZCeHJOcG1DUld4cGJWRFpxN3pqSk8yeEgz?=
 =?utf-8?B?NjdJTEVVZXpoNWRDRmRaWTVhcU1ZT0k4cmdzV1Q4NlhsNERLK1VFdUtpakhj?=
 =?utf-8?B?NXlJYWZ5cmxsOTRuOHRDVE81MSs5SDcrd2lYNGpFZjV0TVgremVMZmpGVTBQ?=
 =?utf-8?B?alIyMGFmZWV4Zi9Xbis3c29pdzNxZ2E4c2dlRXlUd0t5WGRvSEM5bWcxNUl6?=
 =?utf-8?B?Vm5pL01xdjc2c2JEL21qZ29GRGlqc3ljcm9zWmFlaGUyNHd4NERjM0xWMTVi?=
 =?utf-8?B?MEE5Z2VuR3FTa0ljWHV3MklEbU9hdzJENUEra0FKMEhiT0N6NWpmaGJvVC9C?=
 =?utf-8?B?eXpoZFRkdUFaRTBseDU1ZGh6Z2ZaVDNWNldXSklVRjlMRkxJMzFJNzI3NWFI?=
 =?utf-8?B?VFBjbHhTMHRUeGk3K050SjlENWl5WDBZaXRNMWFab3hGeDNCcm1SOW9NUmJK?=
 =?utf-8?B?RCswbXJpUU1odGppTzRBMy93YVp1dldVOEpkaXFNUkxYcDVGUFZuTmU1b21w?=
 =?utf-8?B?VmRUdHh1RE9FSFhYS0QxWXlud0lXNTgxamtXb0ptQWZ6cFBkUVUzMGxIc0xC?=
 =?utf-8?B?TnVYTS9LUGZpYTlvdXh3VnVYZnRuQnFZSC9TdlRpcGdJaFhRQ0hKVEY5L2ta?=
 =?utf-8?B?eWh5OUM0NUJ5ZGdiZjFtb3lhRnNBWDdYeUk0UWJPYTkwdHV2WGhVaVFaS0t2?=
 =?utf-8?B?UjRNakwvajZXTGlhYXl5UisrdkVKVE00cUhGUTd5NHYvMGhaNEc5WGpyeFMw?=
 =?utf-8?B?QjNINzJEaXo0SGYvVS9senVCYXhnWHFjR3U5YStXZDQ0bmNZR3p5SERSZEJz?=
 =?utf-8?Q?kJX/ozt+sb9IhVlwAu/bF/n47?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edfb141d-73fa-4672-15e1-08db86c35086
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 12:42:43.2933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7CiB18TBD1rtaUcbEIwwwHDWSLj8LIls6bVy41U2gg8yW8bxMo/UwoDUFxB7OlMhuJsoxFG0gLDKyOH/5mzVJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8380

On 11.07.2023 18:40, Roberto Bagnara wrote:
> Mandatory Rule 19.1 (An object shall not be assigned or copied to an
> overlapping object) is directly targeted at two undefined behaviors,
> one of which is the subject of 6.5.16.1p3, namely:
> 
>    If the value being stored in an object is read from another object
>    that overlaps in any way the storage of the first object, then the
>    overlap shall be exact and the two objects shall have qualified or
>    unqualified versions of a compatible type; otherwise, the behavior
>    is undefined.
> 
> You can see a number of definite violations in the X86_64 build
> at this link:
> 
>    https://saas.eclairit.com:3787/fs/var/local/eclair/XEN.ecdf/ECLAIR_normal/origin/staging/X86_64-Set1/149/PROJECT.ecd;/by_service/MC3R1.R19.1.html

After having agreed among the x86 maintainers to switch to using casts
there, I tried to access this list again, just to find that now I'm
getting back "Cannot open database". I know you said this would go
away after a couple of weeks, but it's less than one wee that has
passed. I'll try to go from memory when making the patch, but of
course I may miss instances ...

Jan

