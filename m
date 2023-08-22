Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB4F783A1E
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 08:44:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588149.919620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYL7n-0005Ox-Nc; Tue, 22 Aug 2023 06:44:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588149.919620; Tue, 22 Aug 2023 06:44:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYL7n-0005Ms-KK; Tue, 22 Aug 2023 06:44:23 +0000
Received: by outflank-mailman (input) for mailman id 588149;
 Tue, 22 Aug 2023 06:44:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MJFy=EH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qYL7m-0005Mm-SK
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 06:44:22 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20615.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52bed8d1-40b7-11ee-9b0c-b553b5be7939;
 Tue, 22 Aug 2023 08:44:21 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by PA4PR04MB8015.eurprd04.prod.outlook.com (2603:10a6:102:c6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Tue, 22 Aug
 2023 06:44:19 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d%5]) with mapi id 15.20.6678.031; Tue, 22 Aug 2023
 06:44:18 +0000
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
X-Inumbo-ID: 52bed8d1-40b7-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EFSwaYAEDCLAecGsUvelPqTEyYWfo2JRHlV6yC1Q7yGYs1MPoPSyKwEAc0YCp7Yztm3CfqaPW8VvtnO2x6hooQsMdL5VeouSxUzhI800Zcst6QdgtvwWBha8Kpqq+ABoQTlR21Ili2Ms54z/F7RqTtd7n4djtpjwxlq94cWBFHFqU09CnW5B0W+easImd0N9aP3rw3YI0crExHmCVqIWlwkKClJXTBkcgPTWwVOLmCwGzynIsLjYZpIPOKo3FjtB0hVo8UsYiFHQFzmhNjlxHKVGxg9FnCMb0B0b+lz2qxDeybjnqIlwSYXofjZnhwB/xOalal0eL/TxZrTPAWi25g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Is3GJPKxYa+7R02bR7mGzTs4JFZQO8ApWsFqwnoPeZ8=;
 b=R4JJi96silhHVTja4nbMyVdAQFijqGLjccCxT+3Y1eOiDYibGC5/3+cqMC62s2jwWAy5gsi/+uQbaeAyVj3dGGVesguBoD4AvwIYNbgA+VixnRGonxBBDkrw+mZ6A8iRpAnXn70YWTGCUqChy22ZMadXAlFasoleub+7S8pfOxfRFLIyrRfevtf/Nq26wpEFmvmBizuVehlNPodg0K7hrj+ZtJzpyQvesNywyfdb13jmlXY0eOZdKuXOhnJJg1JChvuPP524CzoECYvPat4eQTlQztLiTt+iSg8+Rkx3U7gGxpQu/j1dfSHSpmkstg6OZBqhQkA1BXgIr8r79nCoYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Is3GJPKxYa+7R02bR7mGzTs4JFZQO8ApWsFqwnoPeZ8=;
 b=ugAnhWdA9/Dfp9Jrqqp92AQ1fca5o119ONhSzTbzCmJLeB3kUto0oL1PkfFb79Cev/2sacPH9TJCnfuUOHrxCzswqrp+dspepCPZKa3NtTpHLTQNjJA6yuMl0+vExSDzqx17RiTulTiYaJAwN8X9S7yCz124v1OiVU6hyqH2EVOOEyk6HvV4op+e5fhcXzDoyJPmhWe9o9kT4pxJegyZ5+C8h7ZToY2P4FPwBpet1GWmRJ5S4gMCIKtsaTt19/OUGN5pXdX30sgkN3mRsugCGO5AcSd401q+OGAy6rONfBzuoL4VWLUOImk9ofb9rTJIr/kkOUHJpfjT8oMZBX2XqA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7c0a71d3-5f7a-0539-eb77-c312508bada6@suse.com>
Date: Tue, 22 Aug 2023 08:44:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2] docs/misra: document gcc-specific behavior with
 shifting signed integers
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, julien@xen.org,
 bertrand.marquis@arm.com, nicola.vetrini@bugseng.com,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
References: <20230822010228.2517542-1-sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230822010228.2517542-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0003.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::13)
 To AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|PA4PR04MB8015:EE_
X-MS-Office365-Filtering-Correlation-Id: fb6caf6b-2196-4c69-d55a-08dba2db35d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HbFPTk7+qY2F9hYOpYTZn6M1WddRi2AWH9mWYowq8Lj6nCItzGyvAP/K5A51IfFnXZw9Ir+a3JVwhWaYWgbY9SkUcWxp7vkBcFWj9fOfXOUtb/24E58e5Pdf/lQHCrzdqTqr0FK3GZKhFQQ8gS52Tz9uq4bzziYnUiByPvkVqqzHtjxLtkAtL0/G9FOTlovKEK1x3OVm0xhvh62PLMVEJ9ZHjDH8VCxg+JIwsebIqh2ePQLm6kNiVM5qyVxRn1t9KD4EEKNJBRX8/ijux3PGCfue6nUY/l+zwGk/GzzlFiws+YkXs2vVmDLmjKbGqfW8XNg26Rs0yAQE+FJv+QlYjBHR5PCwJwTArPRVcLY01OmACD30TD43Nlscd6ocgtdFIn5bcJ6QtBTUe6ahISHmXGo/0Iw9S0M+b5aqXHLDrlE+Tca+gykdt603yg8V/ryUZHsLKJSHsObgskReDHQ3zFqgyuBlm+n/NVtRDwCH1zVwOxaMKfW/dij8UMgpxPMJGDQuczKLjVgnPGocQxX3aFY4H7OB60ZGiIlkQ18DfkHVm6LR5GwCcXbG06zcUdqfRn+HfxOpdEmPoXAWcDOV+XZp8HtBBZbCMYdBNrAGAvTpgmosj7fwpuPJOw5teAe39FBg8Sk/Bl7zsdNT7y7dJw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(396003)(39860400002)(366004)(376002)(1800799009)(186009)(451199024)(6486002)(53546011)(6506007)(38100700002)(6512007)(31696002)(558084003)(36756003)(26005)(41300700001)(2616005)(66556008)(2906002)(6916009)(316002)(66946007)(66476007)(86362001)(5660300002)(478600001)(8676002)(8936002)(4326008)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGkvTE9rS2NNYlo2VjR1Umw0MnoxM3FBS3JjUGpSc0txVnp4bFliQlEzR2Js?=
 =?utf-8?B?d09va3BYTS83eUUyOFRJZVJRWGh6Qzg2dFdwb3pxR1pwMllMUTRnekRHRG1s?=
 =?utf-8?B?UzY1cnJBNVF0elBtc1RBQjlVQ1drWSszSVBaUWlXb2tBb0RJMFIzTU01akNN?=
 =?utf-8?B?eSsrVzd6TkJQWmVYY2VoMXhBMTR0NldpN05aUmtmdlJQQXdVcERVRlpFK3lz?=
 =?utf-8?B?eTdCeWhTYVljaHlIQ3FIOWxibUpJMDJCLzZqMlQ2TkZlblUwRm1WTTF5dDIy?=
 =?utf-8?B?UUNsZ1N6VUIxcUNaekg1UjZhemI3VlBud0ZCRWwwQzVDaFZpckV5dmJ2Q0tj?=
 =?utf-8?B?WGMxbUVrNklncVNxZ3BRbFhCZG9pQy9GNUc5RlMzRVlGdW5MeDRLR1NoYURT?=
 =?utf-8?B?bzJGbFRIcXNYc3Q5MkdjVkJnaHptZ1RBU2NBQ0grOGcwRW5pTHFzdXRqTHg3?=
 =?utf-8?B?UHV2T09NWmIrdWlEazRSSEJxb2JIOFZ5K3hobitQQThHT0d2b2NqRTE4TnVu?=
 =?utf-8?B?dnUxMTNpcUdxdXYyaVladzc2ZWpLcnZSanc5MTd1YmpDYVVWYVJFcTN4eTZr?=
 =?utf-8?B?aVZWdktrdWE3KzJJMm50SFl3ZXhta3dQU2RRNFlsVUIxd2J6SXJiei8vcFdL?=
 =?utf-8?B?ZmVWY1Y0NTV0QlNLUGd3RmtXcmdtR1dkUTN4VFRoRS95bnlQVlZIN0ZFMkxZ?=
 =?utf-8?B?cDJKZisvRThmWjh6cmhVc1AvRTIzRlVzSEh5WWRBQ0UvdEQvK2RlNm9GYTEz?=
 =?utf-8?B?MktDRFpzd3VoMC9zS0pDOHBZaTZZajlwZDJ0alF4OGZwUE1OY3VrSUwrRFd4?=
 =?utf-8?B?c2JkK3RHRTRuVmtBN2UxV3RRSElvZklYRnY4dFZhL1BEYThVZG1RMjQ0cVFj?=
 =?utf-8?B?dUJET040MjBvdnFsNy9zd1E5ZjhGY21lNmxUWW9VQVNvU3dBMGNMa3dBL3FE?=
 =?utf-8?B?NXZ5Qk4vSTdRMWtYb3VEbWJ0TUFIcnU2UC9VdnBiV1JkRXk0Z2dUZjB0cnI0?=
 =?utf-8?B?Ym5GV0R3WGtxRG13dzU5a2FmelEyaCtqeE9XR2tuMHFNKzRtUHZTeFA5ditn?=
 =?utf-8?B?aWMrQnZDbGxiRW9jQzZXOVRGVFpIbzJFY3MxR0FNTVRTSXBhYW1HZ011azkx?=
 =?utf-8?B?MW1ZWjZtdVR2MzhYWHdVT2hPOUUyMEg1WFVLL1A2N1dIQURVT0dBaHVveXd0?=
 =?utf-8?B?QVlBT1ltSHBZU21RRXFNYkJ6YWg4TjQrbVcwSEhmN0lrREREL3ZKWUpWTUxu?=
 =?utf-8?B?MStFZVE5VkluL0JKQnFBczB2ZUQvbFVGbXkrdHVGckpWWW1PV0tUbVM1MmVD?=
 =?utf-8?B?RHpSUk1vQkl2YkNLbGZYUFBzTmcrS0w5U1pQeERCSENKbk9jMWVRSWwxMWZy?=
 =?utf-8?B?YmZBeUluM2RCQ0VLMlBWRlNPY1ZEdHNzS1p6UHJKb05lN1BtNXkvRlJCQ0Rn?=
 =?utf-8?B?bzdrcEZBV0QxUldjV3NGR2VqYlJpazZDM2V1bzM3V1preWkvWWxuUndGdHNx?=
 =?utf-8?B?UjBVVEtBTnlGN3d0UUMvQkJsYjlobmY0NDByU3dNU3g2ZzdGRVBTa09DM1B5?=
 =?utf-8?B?QkZ1akRkVkg0dEY3czVnZ1RlTWZzWVA5Q3pUbHFScUVGMThFclNVMUg0M0Fs?=
 =?utf-8?B?UnRXQURQN3ppRXg1bDUrRVkzL1d0U2pqSGdIbURGdDZRc1VMbi92dHhUSE1k?=
 =?utf-8?B?RTg5Q28zbnh5bXdXTHducmRuM1lNaGh5M1dsUm1CcTQzbE0zZE5kdms4MWFF?=
 =?utf-8?B?M1hoT0NadlZoRnlSUE1RN1J1cE1LbGwwS01XV0VvYjhEdlk0SC9udktnVkdB?=
 =?utf-8?B?NllEVGIrNEtlMnl6ajFTTkY3ZCtJeFFQN0VaSmtoUXhRbWJZSjNteTV0NmZa?=
 =?utf-8?B?SzRXVmZXWnpIaUpVOFcvZmVwL2NBc3g5MnpOWHRLSXIvWEhJNFVQZE80TkJa?=
 =?utf-8?B?cUhNdDZXNG0xY2l5MHcvdFFTYXlyaFhSWHVMakdOK041TjlCemJoQ01uNHI4?=
 =?utf-8?B?b3ZVOUxNYWY0T1d1TGNTYW9aaVQ3aTRYTGFQV21aRFNoT2dSOGZ2Q1kvUmlj?=
 =?utf-8?B?UzE0NGZnZ3BjQU82dlg4MFU3NGtxUmtYRzlvQUlzOGo0d0x2R0xVZXJxaXVN?=
 =?utf-8?Q?/TuLNd9jF97myo/B7pskwa2Jl?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb6caf6b-2196-4c69-d55a-08dba2db35d5
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 06:44:18.8875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vEAwVQlW9LYLxJ3oeKO9qbJAjTYJowUqEqf9PDGl5n8Pc2SHP+i1PXxLdIICKtIMPwO6xYOAYtVUVI2QLFSdBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8015

On 22.08.2023 03:02, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



