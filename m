Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4917E7664A4
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 08:59:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571341.894945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPHRA-0007Sq-L0; Fri, 28 Jul 2023 06:58:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571341.894945; Fri, 28 Jul 2023 06:58:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPHRA-0007Ph-HD; Fri, 28 Jul 2023 06:58:56 +0000
Received: by outflank-mailman (input) for mailman id 571341;
 Fri, 28 Jul 2023 06:58:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wghk=DO=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qPHR9-0007Pb-2m
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 06:58:55 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20617.outbound.protection.outlook.com
 [2a01:111:f400:7d00::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3691ff47-2d14-11ee-b24c-6b7b168915f2;
 Fri, 28 Jul 2023 08:58:53 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DUZPR04MB9845.eurprd04.prod.outlook.com (2603:10a6:10:4d8::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Fri, 28 Jul
 2023 06:58:51 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 06:58:51 +0000
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
X-Inumbo-ID: 3691ff47-2d14-11ee-b24c-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aSJio6c1+Q2dd7OqaQ5ish0K+juZgzGX0TLd4Ww9qFk5Fie1VmF0OTVoBWwW4PRoQQCysgu+hs5SXVfHlbaucjDwtbQrkTmUzn5zM4NxWKzGAh6oBl+rLeMGNCog0IuCmheVqkguZcnZgpFb6LkTIHlY21a4Tyebgdhd5qjoKsk7cFM3gMQ8NW8WjTQq4mvDsXa6Y99EpCwOA1vLHogOE+e6tlIz4LByom/hCFeobQaXazDkk4mPplpF4oAQTTd+F3dy4UdD2ywfozdGgTk45I88PC2KLtn7X/drKUSFRvLQPCrfwnTrI0KRSoPDfuFNQyIaRamRmeYGzl3ZfMo2dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N/wqsKL8vQV04Nox++dTtO1K4PL9AMVhbr1bFZyfuhg=;
 b=FyAlWm0fYCm7WEgJGwyEjw955fH137ZZFQTeubzrPVBQMbjP/fXtt91RA/aCbqKGC2eb2+DVIPNqdjM5Jb2REUYLPEQdXSeTOwFgTb8WFPw8IRs1WP8PoMf2jQ64uqoQkFZuGHsW/isBHwv/ILIzdLTL9xvd0ynN6mANJTUfgxxoLVVkeTGB3A3Toty1JieeGkjnrC/u88AY5ryuJ7Gh+XpCR0G9EXoROStEuwVN6oTAje5wGvOYD6qAgnqzg2SGbXbZUXKlFoZKmzNjX5ncszjHFYj6entAbatgxqqTFxbzIUTu226w6PbJgtk2XEQhjBKJIp7AfHTwTaJHQ23bQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/wqsKL8vQV04Nox++dTtO1K4PL9AMVhbr1bFZyfuhg=;
 b=zlXos0ln4BjXf3Peni7sRwJrD/4cDwM9SenfgCxFtw/Tr9dCnYXVXABAgH4h6DQxDL9mxFYoVM3NsU5Zirvp0R5aGJbDxcZ/q1eTLgj7btGC3dXMgTSJhJ4iYm3tVnbGBzAj5Tx3MPyMMA5LVzmIb/RQyf44f/zW9QuIp5Ltl4qCtX3tt+4dw1nEkwvSgSNF/ygMyhZwOw7qvFykVnhtE20VXPhS0lzXD+Mr9A6gttby/5FUDmNqwsxONL7nxDsF1lM/H4AZWqdbwjuHGj3d6MMY+/hkZgicD5PMYGFZGwb/gZQsnepvVsXBLK5nwwqPS3OdrccOfhQfeqiZ/QL08A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4634a079-5118-4b82-4b7f-7e90cc7f7619@suse.com>
Date: Fri, 28 Jul 2023 08:58:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 1/2] tools/console: Add escape argument to configure
 escape character
Content-Language: en-US
To: Peter Hoyes <peter.hoyes@arm.com>
Cc: bertrand.marquis@arm.com, wei.chen@arm.com, luca.fancellu@arm.com,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Hongda Deng <hongda.deng@arm.com>, xen-devel@lists.xenproject.org
References: <20230727164450.77640-1-peter.hoyes@arm.com>
 <20230727164450.77640-2-peter.hoyes@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230727164450.77640-2-peter.hoyes@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0064.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DUZPR04MB9845:EE_
X-MS-Office365-Filtering-Correlation-Id: 69b14e1e-c3ab-4881-59a3-08db8f38194e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6nK2WjtqM2T4P3qcWQq1zoJPVp+I+GP4leOC8rnBZcxQDnO9bGirvzMi7VOd3bST1Pg1OnCnXK+MqZH4QUzS8syKJxXJeuE8miv2ImQFhdPuBtTS450oWp+HycDi7aE/V3ll5y7zXuNIPw4qQVQgM7QMuyF8V5kaUHi+141obf9pTjXdC45eN2clwIbYbHlbvAV1Myh8dwOrmGC5mCpuXMocPMCS9ZT5Gv7ySUug7ExQw0i7jX1E0iN5hQ4M5M6tB0E2FW8Ca+bWr/3l1z6lUsGXlkVLlCpeOefWvhY+M7YwHUgi/hZFaZnZLZOtAD+Yvm0fIrthzjGw6HffBpvl4ufEfjTlr5Pn29RywutdK66e7/7ywFHWlQ0+oUBn9MabtH5YWspa69EjljIfZg5B0Fr4GFcztebqRTYF2j0gQM01zvxyPqCswwsZa7L4hmR94XiKLmUS7AopvVLLrB0RuHdYD+e6oIPMvXlUE75fOnKYymAwIIau4n7LWBsQG4MApYNGFPzjBTwq9UiJspNf4Ff80eaqKxOG4GjbGHwt0zmsj2vmt3311vTvyKAsO1Urb6DNj17wvRi7ti6n01s8w23NvEPlCaQGfd/QnDJ6XRp+Uhr8C/vx7aG4M4PAc5yqI/awO+a0VFJieUqHuegwpQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(346002)(39860400002)(396003)(376002)(451199021)(53546011)(6512007)(26005)(6506007)(478600001)(186003)(6486002)(41300700001)(6666004)(316002)(83380400001)(8936002)(8676002)(6916009)(38100700002)(5660300002)(66946007)(66556008)(66476007)(86362001)(31696002)(4744005)(31686004)(2906002)(4326008)(36756003)(54906003)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b1dQUHNIVmpRZGFwS2tGR0xnMVVWbXEyVUtNM21wWkpBNU4yRU1WcUtrTCtk?=
 =?utf-8?B?c25Xb0Nobk1nRFB1YUYwZWZXR1k1ZjdEaWlQR1FySUhsOGdMVW1JY3pDYlRh?=
 =?utf-8?B?TG02TDdoWktlcEdSaHNmdjhWdDBDdVdzMWk5aml4djJTSDJZbVVEVTQ1Ryt0?=
 =?utf-8?B?bE1xT3NiVEU0eEtIZzk0bmg5cW5aa0pISWdWWDB0RHZ0M2VMNjhuczBzV2lU?=
 =?utf-8?B?a252cEdHY01tMUd0b3J6YXpQbFhmZmFxSlNBdytaUWN3cjJ2aUFOQ2g2RmlJ?=
 =?utf-8?B?NkJHMSs4UE5YbHk1bXJGZGV2ODR3VUUvTkhoeEt3dnpxRFp6YkMrSmtWdi9Y?=
 =?utf-8?B?bTlSWExVRVMxN2tQbEIrakdpaEhMVlBSWldxTHl0SW1WekJvNGVOWHZNbFlE?=
 =?utf-8?B?a1RlODB6UnAyRkVROGZRS2ptS3MvekdmVERlcGx4RUJiRGtuWmw5UmJvM25P?=
 =?utf-8?B?NVZTZXRZUlRiSGxMYlZkTUd3VlorWExERkNteC9LSGRQaE16bGtvSHliQ3lr?=
 =?utf-8?B?RWFXcWZYRHR2aUpiNXFQYnE0blNEaEpiVzA2TW9scnFEVFNsMFhVZllrQjAx?=
 =?utf-8?B?cjNtdXZGRjhVcWNENWowU3U2UGpBUjVBZFMwZVd1b0ltTnU5YVgwNmZ1RGhN?=
 =?utf-8?B?ZEtrZ2pUSVExSzRuVytreXZCcHI3bWdINjFOL1I5Z3YzaWlSK1BubWQxRU93?=
 =?utf-8?B?eGM3SlNYSzFSTGdROGdMUXdReFY2ckxYVTY4WWxrTFZQY0tPRzVVUEpLT3h6?=
 =?utf-8?B?d2ZvVGY2Mi9xcnJSd1lRM2dMcXBmVXgrQVUvQ1E3RHBSSGYzeTE1U3laUkRC?=
 =?utf-8?B?ait2MkIvREJQdmFlRVdzdWpBd3psNVdEQnZRRlV1a1RuTEJHb053QlpzZXF1?=
 =?utf-8?B?QWYvbzlyVUxpQ3BvS2ExTXplNVMxUGpHNkd1bkJSRmJJN0tEeDdzcU5KYmFi?=
 =?utf-8?B?OTQ0cEFZODZnTDJDSWJMSmd0dUlVUGNrcnlERG9PNVUrMzA0THpxSXpSTFVX?=
 =?utf-8?B?dHBWTzlBS1JHMEFvUzJiUURDU3FiTkxSNkdmZHcrVjNOSENaQnlxL3ZDRkor?=
 =?utf-8?B?YlJZVkkvUkoyTFpRYWZxbEZKNkYzV3NSSkdmNGNLdVNoRlFISHFhTjBYdXR1?=
 =?utf-8?B?SUYxVzc0VWdyWTE3c3EyTlJ5UGFvQ2c2VDI2UVhSc0c1cGYwd2FUS3YwWlJZ?=
 =?utf-8?B?N09XQW5CdnJtcWt1U1JGTE1iSTRlR2JmQVdXVmpRL3dEcFZYQzZQY1Z3d0Zz?=
 =?utf-8?B?WFNXK0xqUm1PeEJwOU15aFNrMWpJeVE2L05LNnBhc2E1WEtzbEZ2ci9ROE5q?=
 =?utf-8?B?ZmV0RDhWNFJVU25QMFlpRVh1RzVBajJveXc1QjJ5MXlwZmQ1RFpyUXJJd2ts?=
 =?utf-8?B?RVhzZS9jaThpbHVRYXE4eG1lbGxwU0NabUROZkVKSGlOSUEyaUl2Qk9wWWxl?=
 =?utf-8?B?N21RYllKY0RRdGJIRmlhajBYVm5EK25iWks3MndPUzZNRjJqNm4rQzdobjFm?=
 =?utf-8?B?MkJqdm1EaytGd1ExSmZhdXA0WkJSOHR5YU5QR1ZtaEpnTkhlaUZGcWlNdzJI?=
 =?utf-8?B?bmNmcjViU04rUXZLa21VR3BlTkk0eHRWdFNrbFhLZ2ZzdDd5dHJNa1Fpb043?=
 =?utf-8?B?YWxqcDlTUUlnc2dFOFVqWTV5dHVkOXR6azR0cmVKQy94L0gyZmRpQ3k3ZWJu?=
 =?utf-8?B?NkZGQjlwcUx5YWF3UGpmRVZMVXdGOXpPdUVUelRpMU9jRjRkWmJ4OXpVdjlH?=
 =?utf-8?B?eG5udGIrRlRBU3VzaGhiRzB1V0MyaGcyTFFweWJXRi9UeHlOTkRQVXU4Y0Ni?=
 =?utf-8?B?YWd0WTFBVG1kRjZnZnBPSmNSTG0vVUpWWmRLZE43QVVHdzJqano5eEVpUkZ0?=
 =?utf-8?B?eGRQaHNIWDZKNXFRRkNqcWg1UHpHdnhTU3VteFRqaDNzNFN1bzBqc21QMVhW?=
 =?utf-8?B?ZzBMRFhJc2VtZkhFZEIxSzRVcGtjN2RLVUFmMm8wdC9OVUpCeXdaWGQvTk1v?=
 =?utf-8?B?L0lZTE0vdVA0L1lxamMwRkZXVU9iSW90OEJ4bTZLWE9kZnhYVGpneUxsSS9a?=
 =?utf-8?B?dzZ1L3paSk1JNVVNMFkvS1EzVHRYeGZDSVg1cVdwZzFrRXV3eDNGbDEyc3ht?=
 =?utf-8?Q?5ACCLYFTZINOrxAxGjccCiwGg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69b14e1e-c3ab-4881-59a3-08db8f38194e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2023 06:58:51.0105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W/SElUfsi7tE7S8N1lRHB37Cq3zEJufHFk3jauPG5/Rrq2TUCvVfL+Aj/h75U37CczvcsNLxFIysMvG2XZ9/cQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9845

On 27.07.2023 18:44, Peter Hoyes wrote:
> From: Peter Hoyes <Peter.Hoyes@arm.com>
> 
> Dom0 may be accessed via telnet, meaning the default escape character
> (which is the same as telnet's) cannot be directly used to exit the
> console. It would be helpful to make the escape character customizable
> in such use cases.
> 
> Add --escape argument to console tool for this purpose.
> 
> Add argument to getopt options, parse and validate the escape character
> and pass value to console_loop.
> 
> If --escape is not specified, it falls back to the existing behavior
> using DEFAULT_ESCAPE_SEQUENCE.
> 
> Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
> Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
> Reviewed-by: Hongda Deng <hongda.deng@arm.com>
> ---
> Changes in v5:
> - Add this changelog

Why the v6 re-post, when the v5 patch went in already?

Jan

