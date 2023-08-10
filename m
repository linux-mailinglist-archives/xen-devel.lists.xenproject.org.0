Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEA877739D
	for <lists+xen-devel@lfdr.de>; Thu, 10 Aug 2023 11:01:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581993.911490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU1YC-0004d4-Ca; Thu, 10 Aug 2023 09:01:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581993.911490; Thu, 10 Aug 2023 09:01:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU1YC-0004bM-9d; Thu, 10 Aug 2023 09:01:48 +0000
Received: by outflank-mailman (input) for mailman id 581993;
 Thu, 10 Aug 2023 09:01:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oMcx=D3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qU1YB-00040w-PV
 for xen-devel@lists.xenproject.org; Thu, 10 Aug 2023 09:01:47 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20619.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 88ad5ce5-375c-11ee-b283-6b7b168915f2;
 Thu, 10 Aug 2023 11:01:47 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB6928.eurprd04.prod.outlook.com (2603:10a6:803:12e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Thu, 10 Aug
 2023 09:01:43 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Thu, 10 Aug 2023
 09:01:42 +0000
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
X-Inumbo-ID: 88ad5ce5-375c-11ee-b283-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PN+FCmh+B0qhqVrz5Ord3qPAk34BwmXDk5WnRvdFRCZ74wFCRVmoy+0s5rirjvldfA80u1JQaEQ9oa3Z+QhVtia5PAfz0J6qCnlIevkR6EXeoRB7o0io4nI4RX8GeUhTtTW37/35lG4he7oMgYWMWVvY0vVswJEj51SiBI01slWXpK7xsNaaKB4i4omv23LbIkAognSnMP4tfsrlR2FWdSO4rMqMwAWUPETpXrQgfglxGk5bSjaqlhYQQgUNzLj7BzGGvGJjcfCPAS8tJaj62w2xf62teomRm8SQj7RgjysDJej/OFHcc5wQmOpAHZnda3qb966yhHRug1EYsCBvbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SwTKdAq1WQYnB+J98khSAMZBivdEeCyGK++sBSMLiPQ=;
 b=WyMBjk3UmnYC+8u7ahR1p8eTbDDlbQWSH6dwiery7JCk4FI0jhh2sVXUbvUrp41LF34whSvSfpkM6XD3VHAIIENnpTXAIn0NM4zm7RFCTn9ZWwCgcChWI6viFAvgIBzF7KS30pLhdbJwSYTOfwR7UFZ7dHrMgQZKouQyKuyq+ICVgMIFmIizG73x87hcObwpuGj4JlQ2/AVriYBivY9jcoI/THwCJXmEKbE9CM3dfkU7ctYtqo9phVndAJek+nk/7i4A2zm4GfQk4mFlEcwxFj2p/OJUZ0A+5+H66syg9HpYzexKebyPGcJrr3TC4c+vUFSGA4wVPBad15PjxnjRBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SwTKdAq1WQYnB+J98khSAMZBivdEeCyGK++sBSMLiPQ=;
 b=ZeNDsipArC0DlVW2OTV8dqnn8tKYvbYmcMNC7GARjGBRv3N/COpGG2TMnXX3wZXk1IG9WdlFEmCyf3VdxYdtHoJfZ5cXtXnLPQpaCJGfDEcTyKiyH/2H3Q4VufsVC0pYl0Bwtzv2sfUy6p0ubBV8LGhHC5X5qT5r3ue+D6D+WHJn0QH9yZI626K78YXaznk0agPwggaTNcFHjYYEK7GCiWnuvY3TeSeCWL2Oe0ibyDZKFzVM4GjNNkoEfwtPQje5SzrLAhDpxkK52L6zrHRE2tlJs1UO5js6cu46HzOY3Qt9Zuq4jecXBSLxqN81cwP9adNIQbMzfSMkF8uxC26LOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ce9dab96-fc3d-dc9f-4e63-bb9e98633c4c@suse.com>
Date: Thu, 10 Aug 2023 11:01:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH v2 3/7] xen/include: make a declaration of 'get_sec'
 visible where needed
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1691655814.git.nicola.vetrini@bugseng.com>
 <37fed394315c24e7b7419e564696a534886f0d53.1691655814.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <37fed394315c24e7b7419e564696a534886f0d53.1691655814.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0113.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB6928:EE_
X-MS-Office365-Filtering-Correlation-Id: f8d0fa6e-6c26-42dc-0a2f-08db99806aad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/aVSmOuoKzrF9/xaOsQT3y7OEnc9EPkOGj6wUUCsoQ4ZZ8YXdEnkKFZY+eCcdRhMD+XpcaxsBovFXjAlnHf4vWU5w8MtRDD+UpJaRea5nue5Eg8DI1gXmu18M4A6RhpFmlmNYaXLCZKwn12fQ+o7HR/wigzSg+bMPBdvHhAUKEEURy623e7zRuCzRSf4gNjauJTyBNotLP2G9cDN7KI1aMCYEzqeAet2ydJ/QwzioipA/Lsgp68WEiJgWQWztBMPpKZJEpkVlzRH0z7vlnlrIyO1ELHROQrxlr2MLHDSvrbiwolFf5sSmFZaBI+pqFr/B3eK+OdrNJCWVowR6AKvNHeicdnBCDVC5WUTX1Sitd+261fwiJfRpBxvYDbLFDChC7T1Jfnnq31m/+PUWl4P38QtlNFpQuC7ie46uCvT6QwDgTr5Mwj0m3x4RoCth5Kj4tBHGoQwSoS0LvX+MMb4QYfuhm9It4TgZr5A74WS8QwQdlKRomQU4sxLiDSGZEwaByddZ7peGubRJ8Ulj0BLqlDwZuM4WT5C/ZJRJNMHMHlmN4Ua7dPpmxE7ZiwUOzob5oCdoqDdEYYfui96Kcds66NslaIdK7n6KEN/YgHw9KTcsK62Y9RGa3N+CFYNTac5ov0v47lqTlJ83eU5a1ockw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(376002)(396003)(136003)(366004)(346002)(451199021)(1800799006)(186006)(41300700001)(6486002)(6512007)(26005)(38100700002)(6506007)(2616005)(53546011)(4744005)(316002)(54906003)(86362001)(31696002)(2906002)(66946007)(66556008)(66476007)(6916009)(4326008)(36756003)(7416002)(8676002)(31686004)(5660300002)(478600001)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dEZZZ1B1S042aFhUc2lnQ3VQSkU2QVRqYS9NemFENUd1MHllQ2dvUi9aRlZW?=
 =?utf-8?B?bWR2Tk9CSFNBdUNVTUxmN244NEpCSzRlcVFXVkNXNTRrZXJlL3hHcDRZSGds?=
 =?utf-8?B?cmM1TnZXd2tXZFFWaXp4aVJxK3IzMXJZOE15eTRWMFg0Q3JUdVlDV0ZnbG04?=
 =?utf-8?B?YXhGS1Z1SU1DL1E5Zlo0eTRHZmNPa2FHdEh5Rlh0RjJ0YytuNWx1YVFCNFNJ?=
 =?utf-8?B?RERlQ00yS3ZiTGxVL3drR2JyL2JZSnBQbGppZi91TWZ4Um0zN3hjVGlJa2tk?=
 =?utf-8?B?TWFZaVQ4WDlMYm5MTkgvbkVsd1kxMXJNa3kyelo0VmYzc1ZNWFZkQkRmaWhP?=
 =?utf-8?B?ckFRWGVBSWxFVVh0RHJoeHBpNU51dysxeHZ6MCtNanV1bGRsSmxHcURYbXJU?=
 =?utf-8?B?cVVUcGMwdXpaTGV0R29KTmc4OHVyWnExMS9wY1BoaUJLSmZIMGNQbTM1RmRR?=
 =?utf-8?B?aGgycis3RllnTnhoNnBNMHozOTYzY29DL1Q4OHNvcEdsOVgwb1VOY2Jpem9V?=
 =?utf-8?B?VkhPUGpKbjJhSE9JaUs2VmwyMTJlQ25aR0FCUExqKzVPdzk0SElkdnlBei9H?=
 =?utf-8?B?STBObnE2RDhwRG1VOHlyQUQwTjh4Y1dDalpjeUJDVGNCUGt2U0o3NHJ3ZUl3?=
 =?utf-8?B?SlliT0s0TEJIV3pmRHJ2U2YvZFJlUnNIT2ljLzluSUplWGdrYXMyZTBHMWp1?=
 =?utf-8?B?TFpDMDVzZHFhMGQ5RjFHMWNTMkxyUG0rekxJSUh0dWlJeU5pM0pUQ2hvRXBj?=
 =?utf-8?B?aWVYaEVDTUwrSHVnOWRUTUVCdWpXNlVDMFRzbElxQ1h1c1dBY0cyakRMRmpm?=
 =?utf-8?B?Zy9zcWNJb1RkSm5RTXRFM1hveHFqUFhIZkJwK3M5NFlvcGlPY2pLSStXUGNW?=
 =?utf-8?B?MlIrZTFuUDdwVnZJM1VCVmQ1K1lEQ2ZXelYxVDdsYmNTbUdMVU1oQXlMVllh?=
 =?utf-8?B?MHp3R2hkbHA3K1kvYnF5NElzM21xemxIMXN3YzQ1RnA1Z1FwekUxRGtEeU5M?=
 =?utf-8?B?Mk9kazZYYysvRElwSW5aUDdwYmQ2dDUrUnVVTnFvT0hOdUM0Z3dYdVk5YldS?=
 =?utf-8?B?c2FyQ1JHTGVGMDNERUpSMXEwUzljT2pBUGg1K0ZzYnZwVjd5UVlHVjZJTE1L?=
 =?utf-8?B?MUp0eDhxbHQxNFVyVU8zL1JpN3FDOUNtdmhaKzJhbDVFNFZaOHZGYkN1YUkr?=
 =?utf-8?B?U1Y5aUkvcGlTOHkwMnpIYlI3WGtRRkd0RVdRY3d0WEM2V2V6YzZMTmlwVWl5?=
 =?utf-8?B?TG00bDN0V25DamhMS0hTSElGL3IyQUVMKzBxZG9mZ0EyekNVTkx4WGMvWjFm?=
 =?utf-8?B?NzF5RnEzdWx2enphNHAwU3ZibDhoM21XUEJmR0pvZHN0bjl2WEhua21rZzc0?=
 =?utf-8?B?ejdhM3Rxa0l2WHFSU3NmaWFhalBIUmZaVEdFVlpjVHRDWGxDaEx5d3JOelpY?=
 =?utf-8?B?YXZ5Zk9DNTg1a0pJdTdBVnc0VTNmUFZVbWJkU3ZsTUMzOXBTZXdSWTNsUWxk?=
 =?utf-8?B?ZDdjUzFlRDFIemxWTUxFTUVic3VsRHkwTWEzU0xEcE9BTGdtM2xSVmlpbjFO?=
 =?utf-8?B?TXpHOFEzNHNEMDNva0ppSHpsYUcrbExwMlRMbEZSeEltWUdVTyt4ZXEraStX?=
 =?utf-8?B?UEhEZ0FvTzBUeE1UOXY0TFFZTERFblR4c2tlbmJ4cDdXSy90N0I1M21TRGNI?=
 =?utf-8?B?WDBNdHhtaTM4S1JVaW5YUlZGbmNtZ0Y0Vmp3K1dNZGFEMTZuTzFSL1RmNUJ4?=
 =?utf-8?B?S0dSb0EyUjNxZVk3UGJ2dzFCeDNZc1RORUMyVzczZTFtUUIvUmZ6SG1rZ0VT?=
 =?utf-8?B?TEI1dUVyVmREK0NCVkREY3VIdkdoNW1sQWFCOG9Tb0VES1lqYmlHZHN6MnJU?=
 =?utf-8?B?WEFYbm5JRUlic0FQd1drbFBoZU9GOFVnUEpHcDFBN3hQREpYZWVWazRKVmdi?=
 =?utf-8?B?ZWd0a0F2MlU3QnR1ZlBZZ3o1YjRKeExUSitYYnFaMXd1UzhkTkFkMVh4TnA2?=
 =?utf-8?B?OVo2bFlTNjlzYmhMYXVPTG9jVmd5TGlHNm1VUHZqY3dQWGNVWGJ0RG1zNmVh?=
 =?utf-8?B?MU1OblZVZUFhNDkrUDNpUUJvK25WTEswaHRTcTlPcC9HRFo3Zi95MTVaK2Rq?=
 =?utf-8?Q?Fl1v0byDhbJH7muWMc/q2aISy?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8d0fa6e-6c26-42dc-0a2f-08db99806aad
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2023 09:01:42.8978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DiQF8GKmiz5nFWGQ3PDFtJPFCzjguKaSJDsP/qTLDTp0BrGdgbzvqsq/HHgX0DV2IAyrXBxBdpT1ZLHMKL7HRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6928

On 10.08.2023 10:39, Nicola Vetrini wrote:
> A declaration for 'get_sec' is added in 'xen/include/xen/time.h' to
> be available for every call site (in particular 'cper.h').
> This also resolves a violation of MISRA C:2012 Rule 8.4.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Fixes: c8cb30cfc87a ("mce: Provide ERST interface")

Reviewed-by: Jan Beulich <jbeulich@suse.com>



