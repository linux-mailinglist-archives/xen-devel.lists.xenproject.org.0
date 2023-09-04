Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7200B7911BB
	for <lists+xen-devel@lfdr.de>; Mon,  4 Sep 2023 09:02:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594988.928450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qd3bN-0004pr-IM; Mon, 04 Sep 2023 07:02:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594988.928450; Mon, 04 Sep 2023 07:02:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qd3bN-0004mX-Fj; Mon, 04 Sep 2023 07:02:25 +0000
Received: by outflank-mailman (input) for mailman id 594988;
 Mon, 04 Sep 2023 07:02:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vltW=EU=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qd3bM-0004mR-0N
 for xen-devel@lists.xenproject.org; Mon, 04 Sep 2023 07:02:24 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20626.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe312f78-4af0-11ee-8783-cb3800f73035;
 Mon, 04 Sep 2023 09:02:23 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DUZPR04MB9982.eurprd04.prod.outlook.com (2603:10a6:10:4db::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.30; Mon, 4 Sep
 2023 07:02:18 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.030; Mon, 4 Sep 2023
 07:02:18 +0000
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
X-Inumbo-ID: fe312f78-4af0-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P4lhyL8vCK4vYf4xzx449y2SelLz92tXd3X0N7xYQO9oscSvWm1xtlJ2ncMnE69H9TPgE4DsjWXazmY6XgYNa7x1CXEVaKTI4i2esYu7h00CziMuFS77qL3ACeENnR9B81dVs02Nq7RwWp7T6wLqL1L3kHiKuuTU9XNUWp5SzMySJ1tAl5vo2yaiMeM8z080tVBMHPjQWhO7JlmeCDMWQJM6LrRx4cit/QkdtHMIxmGK+99FPzkFLW3XGCVmPDSkgn13f7FVZR5nfK1MgjhJGpqVUJqioY7/3s2RqMQEBdvfB/EDqttD02Gaxj/oXd5VgoxISXR0VKdJbc4bJ5gpeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XvhV8bJIXP3amXrNNZ88zPluy4GadBNN/caC65Jk+7Q=;
 b=XQ4+93zT643lmG6bjVyI0xWlNhWzmbIngoJeWDoaB9EhRPTeoID42PE0rxwuL00V03AUbnDCU6ep9PG7bYT93ml/yciV2pCgDoX6pN2/m2Rf4sxYJXmpSnmSgGAidVM3gPAwPu129KnD3TtPfTKI2pFdDLYQ9yUCz9i6viiRjVxFBIL7IxIyj+zB0xKrnWBCd7W/U+Ufd+NxkiUBOWUkyJJD8Ks/Tw5WuXCEEK2+MsCjnsqzGuOPTUypRO9geiHgQmR3Sy0wTN1CArRtkslkqb3KuKr9AZnrDtV1swDHxLtv4qEk7D5XrqRSXcpXvRcz4DSd2Z38qZNik08nfZprtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XvhV8bJIXP3amXrNNZ88zPluy4GadBNN/caC65Jk+7Q=;
 b=XR+3ijuBlnpnaer+GBVJJLcCLY8NE5qIv/Mfru4BlL7K94ihEz9y/Kd7qZH5iwd1/p4HqvZ2XjVTkGO+E8WPqIRUCgo5LOPponfv2dN96bkFqU866sdEVdsvy7ukwCETGOuXtBoYJJMb5g4k8HCgD+rfvv4jl+/Tw04VDaQTjSKdPo6egEy/VSdQssk55Tl3t35hM8GSVv+o8uKpn5JRFGR90uWC/bLqMdwquyJnlmskPZE4YOufntq7Si3Mm/TBLRfEb39IOWaZHJoyBYG9XGJgu5JUey03QCEQZQObb53FViEf3aVSBu2gguVc9aw51l6mWxdNdCrOlw8wxJSAlg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <efb3dfa7-0fd0-83a5-67dc-eafad0a2bb57@suse.com>
Date: Mon, 4 Sep 2023 09:02:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [XEN PATCH 1/2] xen: apply deviation for Rule 8.4 (asm-only
 definitions)
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1693585223.git.nicola.vetrini@bugseng.com>
 <a260399a471b84f3c37c15ac735dc7aec6bd33ea.1693585223.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a260399a471b84f3c37c15ac735dc7aec6bd33ea.1693585223.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0184.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DUZPR04MB9982:EE_
X-MS-Office365-Filtering-Correlation-Id: e5118e7a-92bc-40d6-7ffe-08dbad14e0a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	97Jdw9joFBGmmn6alKuVsDjkmU21neMGiDAYXl90/AKpXAsrQZMuXohw5NPd+7xmGmK+B514y6oIlOtf48K2UlxJBTTU1Tstfyyymuh0j92Pw4W2wh0L2JG355f5ysKiVxIRkc2xsRqeRt2fAP+71elo3TEZL+dRE+9Mqx1Wx6sdworvACchkOhv5/xPaJtuL9AgZ8oOn7a2hgptv2oKwqYo4oVcMSbv4Yr7+/W2+ac8aFdIbjCL+XLYVyqp197ygmXE7NcXwuQlOZTYqIBBb2U5zM8ui/MFcIs0w4K39XzoE3Bm9+h1xxx0yz5QWV5aW8jPAMOXoosla3YiSWznvPtBczHZce8NRCpF86YRDjN6us6/ZJYc+ZCB2O8l6WjuJ7Ry/z20V3uEZ4fNgIQW39Am3O4/UsGcSdFdq1h16dMs4tTpWwMhqpwxCDcAVs8CZr4SYISUt9K5Nw4nAxwu20LSmWNUag3OzhDjP3FPLPqfFLN+m+j3594DY4ipoLhi25yipNQLkNTjoQLA1ozZmSV+xKNag7zl3Qb9QG2u8HLr8y4DXrtTnSQqZvAwQ0y38PVnfR2yoge6IjM0WQqswFc9tUWqy5FZ0wj9qm4aeMH3K+orEH2RRWSK0SCJSo4PE6T0cP0sP0Sh9mLRANaQhw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(376002)(39860400002)(366004)(136003)(451199024)(186009)(1800799009)(31686004)(36756003)(38100700002)(41300700001)(7416002)(5660300002)(86362001)(31696002)(54906003)(66556008)(66946007)(66476007)(2616005)(26005)(478600001)(2906002)(8936002)(53546011)(6916009)(8676002)(4326008)(6512007)(6486002)(6506007)(4744005)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?elFxdVorTE5TMzVUNm0rYXVmZ0xiUHhkVHNQTWZ1bkZUeVltMythblZyK3lB?=
 =?utf-8?B?YjR1MmZFY2R1ZjllN0plQVdQck5VL0dKc0FUS3FjOHljY3BVc2VNaUNhRnVN?=
 =?utf-8?B?T1dtSENYdFdKM3JvRTVjZ2dZeGpEK2ovby9GSm5UOCtIcXpURUhNaUphajhY?=
 =?utf-8?B?dnA2bUxCc202NXh3OUN1NzRubXdQcjF0aDdLT0ZZU2VXU0llS2VCYUl3aHBC?=
 =?utf-8?B?eXpjL1BHQ2w1MUZ1SHUzQS8zNCsvOHJQVEhCY05WdG1RcU5BajVaWS9sT3Yv?=
 =?utf-8?B?V3FDcCtsekVsMXptcWJ2RDlSRithWUQwcUVKUUhyZCtXeFpsZEh4aVpQQTlQ?=
 =?utf-8?B?eEpJWFRFSFlVQm00UEVxSytVbWhWS2t5TDUyZnpzaUpVNHNrQ2ltVk0rSGRN?=
 =?utf-8?B?MXhGVkhrMlExWC9CTWg5NWt5MVdQMWRHUWhHN0c5YUFjK3JMTnMxTS9YWklQ?=
 =?utf-8?B?R29yMURyYlVsQS9TaEhYZzFRRGFQL29WM0lhd3A5YmRjeld4Zm5YODA0U1Ju?=
 =?utf-8?B?eUt1RXVYbzBaTmpnWkhQUVk2SG44OUVrVTB4ak1uTHAwc3dYUnVrYzlSTTRM?=
 =?utf-8?B?NzQxZnUrRS9hcmpLTTVERExqQmZlemUzUnJzYkwxZ0t2NkZ5bUlZUE9Vd0NM?=
 =?utf-8?B?UHhRelUvd05jYW96cWZRTXYxdFBqdVpQUUZ0QUxqQWRMOVZjUEtKNnpicWRt?=
 =?utf-8?B?ZElTMFhDM1VFOTVOdmNNVDdXNm1lVUo1cDhvdGptTy9mcnJ3eTlQZ0ZldlFG?=
 =?utf-8?B?SVJ4THVWQ2R0RFo4SWcvcGk2TTVLRGhDZ3NBMmNuWTBXMUJWYnR4UWJpRElQ?=
 =?utf-8?B?VGMrM3crZVBKKzRqdmIydWNMUVJUbmlYRXY0aXU1UjV3QjVWK1BWZDFvdkx5?=
 =?utf-8?B?YURZVExzTzF5UTdOODVTM1VsQ2dBSnJmb21tL3k0Z1JmNFhSS215bzJkQ2Zn?=
 =?utf-8?B?WHYrcFc3dGhQMEY1RXEydS9qSVQ1M0NGMXRlckZqTTRJeGtlY2dCN1QyRytL?=
 =?utf-8?B?U21kR1hNWkJLelVXNnJGVEQvZ2N1V1FKT0wwTVV4KzlDQ2lpbnVPY0d1UUtL?=
 =?utf-8?B?Q1NlVTdTRjFFWkNBai93QlRnOTE2dkFxeG8rdUdoMXFjaGV2aHJHeW5Hdk9Y?=
 =?utf-8?B?SjlOYkRXVnlSckYwSGhvUG0wUC9kK3g0Z3E4OHAreDBFbGtxMjVZSmIrdGV4?=
 =?utf-8?B?UktyZEN5TTlBZk04R1BPZ243SXJ0TGx6MzNXakVjdUxIRHoyQWcvbDRTWFJj?=
 =?utf-8?B?UlY5Z2dabDNtdTRtRTVzRU1GTFdZVkZFZXJwY2doQjAyZG81RndhNkxQWTlP?=
 =?utf-8?B?M2NBTEE3cUtOQnErVkYxVytpY0VCZC9CNHdoMVI3R0FsdUdIY0Z0TG1iK05r?=
 =?utf-8?B?SXdabjZnTzYxemVBUndsNmxvL2RUMjNCbTMrRElrSHBlWi9xWklUQWFIMkNu?=
 =?utf-8?B?VFF5dXFiYVlCOXZhZTJMRjJtY0dSQmc1TTRKamdCemYxYzhnS09xU01YdWZC?=
 =?utf-8?B?MU9lYnYyQXR4Sk9tNWRjbHl2R2VrcjlnWGgwTTRxNkp1Rk0yM3FqaUN5bzJ4?=
 =?utf-8?B?QjV2NFNjOWU1cnNubEpqRStLVzd5c0EzbUFzdThWVyt5c1E4aUlnQmt4bmlF?=
 =?utf-8?B?cjIwTElwbEcyZTJ4WjlUV3hsSVFodXpHZm8vRlp1dHJ3TVlrZWRiK1pkd3ps?=
 =?utf-8?B?K0N4MzZiT3lHUGhlZXJkL2VXVEFkL3VKWWNhT0c1NkdZeFAxSDdoc3pWSXNs?=
 =?utf-8?B?OFVtMFFQd3BIKytTK01QUlNCN1QrUTZ2RnprRTBOTEgxRFlKOXJXcnVQSDdI?=
 =?utf-8?B?V2wydkczbjdmS1NIK3QzVEFkU1NKVmMvY3VkVXlvV1VmdkdmYmp3Y2xCN1F0?=
 =?utf-8?B?Um1KcG1qTHBRUjNCbmRvWi9WdDR1SlhyWUV0SWl2WlhwWWpKOFRJazIzcnh5?=
 =?utf-8?B?T2ticXgzOEhzQURnNXRuWG5vUFhkRDBEZ3pkdUxXUzdrcTEzdzlSSkRRVm5y?=
 =?utf-8?B?RFlkVE5PY3ZKZFpmZUgzQjY0d3lKSmpOaXlmR0l3ZCtjYlo5NkU1dTlJNzBk?=
 =?utf-8?B?dVAweE4wOGNmaVZqS2RveFFWVmxLYk43TGVFbGU3WC9rOE42Yjc1aDJXOEdi?=
 =?utf-8?Q?Q76B31XbX/YAuTvY7nAsTf3wy?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5118e7a-92bc-40d6-7ffe-08dbad14e0a4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2023 07:02:18.4275
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DQ1BYjfUzqy26E0HIFLBMohq6N0szJkXgNvoJGT5dqXuCX5XiXyE5pSaXGE7CjbnqelIzvXc2+ROWsBnHSncVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9982

On 01.09.2023 18:34, Nicola Vetrini wrote:
> As stated in 'docs/misra/rules.rst' the functions that are used only by
> asm modules do not need to conform to MISRA C:2012 Rule 8.4.
> The deviations are carried out with a SAF comment.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> Where the identifier for a function definition is on the next line w.r.t. the
> return type, they have been put on the same line (e.g. efi_start) to avoid
> stylistically questionable constructs, such as
> 
> int
> /* SAF-1-safe */
> func(void) {
> 	...
> }

And

/* SAF-1-safe */
int
func(void) {

is not an option?

Further in the cover letter you say "Deviating variables needs more care, and
is therefore postponed to another patch", yet then here you annotate a couple
of variables as well. Could you clarify what the criteria are for "needs more
care"?

Jan

