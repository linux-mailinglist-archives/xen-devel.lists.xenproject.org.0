Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31548765817
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 17:56:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571212.894534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP3LF-00042C-0a; Thu, 27 Jul 2023 15:55:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571212.894534; Thu, 27 Jul 2023 15:55:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP3LE-00040I-U2; Thu, 27 Jul 2023 15:55:52 +0000
Received: by outflank-mailman (input) for mailman id 571212;
 Thu, 27 Jul 2023 15:55:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m5Ij=DN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qP3LD-00040C-Pq
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 15:55:51 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2072.outbound.protection.outlook.com [40.107.13.72])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ee6244b-2c96-11ee-b248-6b7b168915f2;
 Thu, 27 Jul 2023 17:55:50 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAWPR04MB9960.eurprd04.prod.outlook.com (2603:10a6:102:38b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.23; Thu, 27 Jul
 2023 15:55:20 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 15:55:20 +0000
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
X-Inumbo-ID: 0ee6244b-2c96-11ee-b248-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kk3LtYA9rysrsVAVBBPAv4IJMqAYgeZoz542/8yCl6+C6BFj9steHcsOUKvRp1si9Jr423f4jCvTveeIancgx+B6HiU0EAe7LKHGw09/BMuUbWtj7+8KuK3CBH4/Y2OTOGl479rDhDvwzb6H9X9hT+wvLavW1tKAu8qSaf68cJreTXEw8yPDNU1XGsH0a20M+jsAZosLPESWBGxYtIX+VTqL1q8f9tWwjUJ4KWmOl1/1C22yvkPkHo50w5Hp6zZpmX+3YtxNm40Rz2SHjEirzEvtjrozWlefhsJNd8xsKEwzlvAuNa9jiJAu5tN0AGYEJ32g9AgXZywAh0clNhhNMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R/7MrVgGIbRAEhSmu3jEXm62MgMPP2+To0KrpjoMiug=;
 b=Bo6KFkNN380ZlwBivvW1t1gjaBVW/tGYGIR2X4FFjT1LW6sjSdLFfxc6Qpg0U0Nk6DsuCX5fFwIp7mnzGrJLoE67mspjAkVIfrlodX/Sqr0/7H5wFS0vlztuMjstmV5pEB1ZhhzM1hpnS0stVD++Ntp59eogIBb1HIuF/5rolI8X05m5/HTl9TrKFCL8ZBEODzoial5PlZEBOtO85ADJFIy7kmZsaT0BNgVOUSvyKGOWl3xQjxLED+Rk+SZm8lKzynTwvsG7ed5GCgkh1Md9uqePv1DeAFJ2JWH54KEBoRb10tfy1VB7LFpA0OHcfvw4qiVhnuIgeijaROu5FwpwiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R/7MrVgGIbRAEhSmu3jEXm62MgMPP2+To0KrpjoMiug=;
 b=ldRjQ1xauudkmxRELjEyWb7CrQM7eSuahjGJFgIP05pMSmMDcfibIGbrBEaadnYSlm71k6PqF2mWxLOE0tkYOWpx+YhIYfFkiwjVN486o19Buu+Nr/KE18WByltCyHNgCUWMMqTKtFMmctCTQeKmxZS32vwXzRzd++dA45/xOYefcYYjnJ4Izp7Qe4yFtVVFKVur1qEdRtfP5l9X0GLAVaZZweJoxCY75dDBZztoxim0Lymetw6ruOQUKJUfe9imRNKZ6wdeNYPDYmJVE37ivwwKokcdxoKRL0DZo7iVsmPLV79jXfeDRTThE4j5Jxwuni0E/ytN/M+llmiNaeihxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d81326cb-5bb5-0a27-7669-45ac7b4ad0c7@suse.com>
Date: Thu, 27 Jul 2023 17:55:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH] xen: change names and type qualifiers in
 copy_domain_page() declaration
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <49ce75f6f79f6de3a447f9bfb44e288e689dd8f3.1690470179.git.federico.serafini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <49ce75f6f79f6de3a447f9bfb44e288e689dd8f3.1690470179.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0012.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAWPR04MB9960:EE_
X-MS-Office365-Filtering-Correlation-Id: d79a02c6-17ff-4539-a3c0-08db8eb9e188
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tyS8oA5N8TvBivJtgAtasCDxudgf09Xg9W55MNy0nQeHMAfI95Xz/Yt9mC7YDwBATkBAoXcmsUTG8JCGaD1xG22OnQ+DKJ4jeXWQHGML0iIFy6p9MTdySh3dN0qh/1k8DOEuKKUwV+xlEdct6kX5CzmFv7cDHFA1aeo5EI9Iu4D8fzbQ4AfG8YKRfvQShZ1q2wHU1gxVp1sgZF1gznJWVKkJj1jqCL4HHWTA/H9PxqKuTu68TDOTlz9DFa7VZwO6gMo/Ei2aT/FyHZmBCsT5DnJgCsI80HTOfiVttke4G1beNECQ1nd7oFdzwf4Ju6YgQTvI9iKc33+NsJKQlsGKz6YRLcMQCYPiZst+5sSKGBBIHWcVI8XE0M1CxnfnnGExWhi2vKE/klxI3oQZD4v5ElJ3vQBK2Ih3eTfpqoOyVHqrvhuccllKFsL6Eci+po0/cPCgjj1g46JmHx+pEq/VsNkPHnCe3v74qi9Qef29qoH3OGZW4BNeqZhGvz5qUunbpCONZkPnQrnGipmQEYXCqXd9zUPCUmde6ss/kksgxvuopnU709hkE5lWxcEjSOzJKXZ+aJF03VaviWAWAMFKf63sHmPOWpyvNuoWqwOS0k5z2EOxjNQ2WU/nH1WeEBpdl9vo2vCbjvOEzltKXTR/Jw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(366004)(376002)(136003)(396003)(346002)(451199021)(2616005)(478600001)(186003)(31686004)(6506007)(6512007)(8936002)(41300700001)(26005)(6486002)(8676002)(6916009)(66476007)(4744005)(2906002)(4326008)(53546011)(66556008)(86362001)(316002)(54906003)(38100700002)(36756003)(66946007)(5660300002)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NmdqQkk4ZGlmT0oxVnZxazA0T21Gcmd4M2huZVNuQUo4Zm9NMG56ZEtNdEVD?=
 =?utf-8?B?RW9jR2NCUGx2TlZxYUMrd0lKdDZET3BRbkpGWFRralpPMXpuTm4rQ2g0b1Ns?=
 =?utf-8?B?TVV0T1M0Q3Nxakw1RGdOazdtMUNPM3o4c2w5aTNDSEoyT1o1ckRjL3RYQ3Rs?=
 =?utf-8?B?NFRJVDFoVGg2T3I2M016cHdPZ2hUSCtNOG1aWlF0cHZUTkVsZFc1ZFVPblJp?=
 =?utf-8?B?Ykt4SVdkSU5veTdoS0Z0UllBYkI3UVc0ekVPWFNWR25EK1ljb2IyMzZXMU5u?=
 =?utf-8?B?S0x5TUhHQUt0M3FyUmV0Nk5zR2lHU3VqaHdGM0ZNYk9IMGNUVkltdzYwbFpO?=
 =?utf-8?B?cmVncnRNd3hBU0hFaTJTUVcvc1hiZUMraWxYNVJVbUZDWVgvaWVxRFVFWW11?=
 =?utf-8?B?SGc0QnZITk5RNHNUamRiaGFxNEJ1UmErdnlQWGltckFMUG8vMzh3NldFK1hU?=
 =?utf-8?B?RG1iM1I2MXBIVVN4S3N2NWVqTktibDcvajBadjM0bFVXQmVweVJtM2RFT1Rw?=
 =?utf-8?B?Y1F0bWkvY1NuY2JwU1JRNk1XQjF0bDU1U0ZUdHlOUEJJTFRnUm5KbHJGa09V?=
 =?utf-8?B?QjNGcnZiVFZBUzZUMFB6cE0rY0lsNU5uc1JZMjloejRCSUpWcTVVcHNTbTZX?=
 =?utf-8?B?TlJ6bzltaVRzYnNVUHZyakJyVS9xRTV4eUVxaTBhL2FFYm5QL3htVmJCRFJN?=
 =?utf-8?B?TkxlT0pSbDlNMldSdEFIbjQzai9WRVp3WjAvTUd3MDc5SHZRMFV3UlFuTzIv?=
 =?utf-8?B?ZFpid0RvRjdLYU4xS240UUlRK1NDU1BLamJXNzlvbzNuV20zbFNIRFEvcXg0?=
 =?utf-8?B?UjBHYk1VajVnVUVoUGdXWW1sUU5iVVNtUUhsa1FON3RCb0h0UHJhN1lMVjAv?=
 =?utf-8?B?NlpMalA5eDdrK25pT2NnK00zb2ptMHBxMnF2aW5ldzBQc2RBc2hHT3h1cHl4?=
 =?utf-8?B?R3N2Vmc0QUkzeXlUeFBoNWxmUTBvbnNtVHg0cEdpaUxFbHNOMFZYTUpvQzhx?=
 =?utf-8?B?UFNoSVAyUFIwRHJKbW5OL0JiSEFvaDNSckJrLzh5Ylcwd3pqSHpjRjVTVVVj?=
 =?utf-8?B?c3ZGMVdBWUhHa2tkUVZERkxpQXNJQzE4U1pzVzQzdW1GV3pjRWxGaGFWejk4?=
 =?utf-8?B?UEczY1EyQkptRU5lbnd6eWNqT2pNMFFlSXlFS3cxUG9YQktMNmVlT0lIZmV5?=
 =?utf-8?B?dFY3eXlkUTRXQ29IVVpqVWNzZjIyemJYTG5BOGV5aWpYUkNjSmVzRTVuclFr?=
 =?utf-8?B?dDZDa0lrWGVBZ1pwVE1jYjRmQ3NTUWhqSVIxNmxzLzZ2RkZ1V1N4YXNJWFR3?=
 =?utf-8?B?TE9JWm9uaXhWT2VpRWlaNllsS0QyTFF2WlJydkZPR25QY2VhVk8zVUw4alRQ?=
 =?utf-8?B?Q2xnWUVwMkJxbFpMTEFxdkJaeHFzWW9mNmRoaFVNZjBYUEhqQmt0UDVsZ3Rn?=
 =?utf-8?B?MzRjSm5oTE50NVJudlZQcFlOdmw5bUt0cnNUUlR2c3cxU3phQ1VaSUlXcFVi?=
 =?utf-8?B?dGljaTdwQjBjT0thVG9RUFdURmh4NW1YTmkrWEhPTEtQRVdQUkFkVm1yVWl0?=
 =?utf-8?B?TW4yVzRGV0thNFFmQW5ha3QxWjVvdjAzWGVId2p1cGtXYm9qaTgwbVhLOTNk?=
 =?utf-8?B?UEU4ZDdLUEg5WTZXaGJucGhPS1prNVlmQTc0bzhJZ2dnNXpaaFBxSThzNjBv?=
 =?utf-8?B?cUdoV1l4OUhTbVRNZVZrUTJMTldEZXk4WlE4Vm01ZzdnQnBRQUpZbWpqaXcw?=
 =?utf-8?B?WHYxRUNQZmNWM1Yxa25XWUJxVGZRUG5vaHVyYlZFcllYTDJSNmNYY3piVENW?=
 =?utf-8?B?b3BIVWw1U2lWSm81blFyNU9aSUdsZ2tNMnA1Wk5COFl6dUFYRm4rTDFDUU1M?=
 =?utf-8?B?T0NLVEJ1MytURDEwTHE2UVA1U25Bd0lBU3ZqQnAxR3VHeHkzNWhQYnNiaVNE?=
 =?utf-8?B?Y0JmOHhGb3NVQVNjQ21rTmVxNHRLY1hDaHB0SXlxN2VlQlVJYjhFYTJOakJq?=
 =?utf-8?B?RFAvZHZhbVZOQ2d0VkdPTE0wbHE0aVM0UzdrN3NtQ1N3UHdTOTlXRlUvTkc3?=
 =?utf-8?B?WWZyY2hJQklJY2NRaUNxOXRTeWxTazZUY3B4anF5MHhhZGhrYUlvNkdKQWpI?=
 =?utf-8?Q?YEQGkX/q6RXb6t0bFukOnJeZ0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d79a02c6-17ff-4539-a3c0-08db8eb9e188
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 15:55:20.8174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /7Ed/g+LOtbWKB/PQtteCCWjxm7hZDNDFFHt/WsQzRVLTdxUqZtjYedNPaE9Z59jwMZbSdRBvHhzyc2rTwG29g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9960

On 27.07.2023 17:04, Federico Serafini wrote:
> Change names and type qualifiers of parameters in copy_domain_page()
> declaration to keep consistency with the corresponding definition.
> This addresses violations of MISRA C:2012 Rule 8.3: "All declarations
> of an object or function shall use the same names and type qualifiers".
> 
> No functional changes.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



