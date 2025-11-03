Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AB4C2C070
	for <lists+xen-devel@lfdr.de>; Mon, 03 Nov 2025 14:17:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1155327.1484826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFuQa-0001iG-Md; Mon, 03 Nov 2025 13:16:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1155327.1484826; Mon, 03 Nov 2025 13:16:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFuQa-0001go-JJ; Mon, 03 Nov 2025 13:16:56 +0000
Received: by outflank-mailman (input) for mailman id 1155327;
 Mon, 03 Nov 2025 13:16:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9EMp=5L=epam.com=milan_djokic@srs-se1.protection.inumbo.net>)
 id 1vFuQY-0001gi-Pn
 for xen-devel@lists.xenproject.org; Mon, 03 Nov 2025 13:16:55 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5cca61bf-b8b7-11f0-9d16-b5c5bf9af7f9;
 Mon, 03 Nov 2025 14:16:52 +0100 (CET)
Received: from AS8PR03MB8322.eurprd03.prod.outlook.com (2603:10a6:20b:509::16)
 by AS4PR03MB8747.eurprd03.prod.outlook.com (2603:10a6:20b:576::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 13:16:43 +0000
Received: from AS8PR03MB8322.eurprd03.prod.outlook.com
 ([fe80::e577:995:fb9d:38fb]) by AS8PR03MB8322.eurprd03.prod.outlook.com
 ([fe80::e577:995:fb9d:38fb%5]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 13:16:43 +0000
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
X-Inumbo-ID: 5cca61bf-b8b7-11f0-9d16-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ew5AuXKK0KwEUQuf34wQjRHGzeBeWG8RBRyd7xuoFfrXGF4CVBsCemjJ/Po/Ypezdm0Gr48rqTGUYG90yT8xJrg9hTC8FkZ1bfh3qCs7afM7IYjOriTDnQ2KG5RpdYYyL2acBDt58ZH1/PgYe0YEjDoRNtjBCBiysMPUy8aQIHRtFaCC+zF8EGa+SzMFuLiopc4RvAJP0SkzXD7qSeFppVmJhZxN9kRj7y+HaX2ta3LKBi2LPR0whAe6E9PTRzOrN5C1nutnTjHpTWbJt9N1RJRjEIy0Cr6Qel/xRZPPToqtokpCH70VOUQgc0HkILTFT+vsaPye/b+WfzaRsav+3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QJKCXyeQIQ6MKe5gJqCUMlJM8NccJKGHTDkMC52FwUI=;
 b=oW0KKthmYNpqZ053ssQfZ/23kTx0vJeZIeqs7An0iYFoTpEb/TPwSVTieHsFKWK+J0sOrl7AmE5Zv2jDYFs68uvNcPaQR9f4RlPGpYVTZqpk7I73gClUnvNOThurYw2kcxy+ns/Uw+9hoTXumc3kgHQ0ngRLI4640kedbIt7Jft2/iI8Xx8uVnvbYpISY/sxW70ttE+nDfiBp5zR9ODy0rE3deNhM9CWkcPcYdBhhrEr6gzGDC8vrqWySFbg1Fg7eTfnwI/boj4iv7xpiH7TsrpIKuslDDbvGCl3xmDW8f+leAO3YB3VKZGNYHi/Nj1QgFsB/iQcHxfjKGnRiIe+cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QJKCXyeQIQ6MKe5gJqCUMlJM8NccJKGHTDkMC52FwUI=;
 b=Xq7UTT83NipuU/PJHIspOMQof7pa0mIQ//u05HXQvYvJvzf8Etlqbm27YKhuj1gNu7FDmdRytdXi7gawHc8bM5Wgn4VO3Q1sCwyGyZInE2tj0uBlTtMCOJ+nKvwkhupedGRu1KjKlpx738siz+6/fcPfgPImXqDByELW30ypOwJq0HvjdHNxxhTmhV9G+tk3t+q+BFme6xPUvVzoy6ImKLzsqLVzNLDfsnWpnM5wqwQDzV1EnnJuGlpjBZf09yHGCgFbZXeiGY51NBdl0PlX5Qkaa+M+1YwINTnq8DVjDn7lfyuN2LWOZAIfFb9j960hykMX45NOxIUWzbkRPNa+qQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <5df30dbf-17a2-446f-83f9-0e4468622917@epam.com>
Date: Mon, 3 Nov 2025 14:16:40 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/20] Add SMMUv3 Stage 1 Support for XEN guests
From: Milan Djokic <milan_djokic@epam.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien@xen.org>
Cc: Julien Grall <julien.grall.oss@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Nick Rosbrook
 <enr0n@ubuntu.com>, George Dunlap <gwd@xenproject.org>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.1754580687.git.milan_djokic@epam.com>
 <CAJ=z9a1eM6M+Gagond9TiFtF7c7EEQKOKHANcvDWDhW_3JzqOA@mail.gmail.com>
 <12ba4388-ee23-4e17-910f-9702271865ad@epam.com>
 <b1f79b84-d0c4-4807-87a7-1cf94e58ecee@xen.org>
 <a5943713-85fa-48ad-86fe-5698604ed8c9@epam.com> <87v7m93bo0.fsf@epam.com>
 <6c80a929-8139-4461-b11c-e6ac67c3d2e4@epam.com> <875xe6ytyk.fsf@epam.com>
 <65727710-0a88-4fff-bb5b-9cf34106833c@epam.com>
Content-Language: en-US
In-Reply-To: <65727710-0a88-4fff-bb5b-9cf34106833c@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIZP296CA0006.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a1::7) To AS8PR03MB8322.eurprd03.prod.outlook.com
 (2603:10a6:20b:509::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB8322:EE_|AS4PR03MB8747:EE_
X-MS-Office365-Filtering-Correlation-Id: c88eb403-e7fa-4023-a046-08de1adb3b33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|3122999009;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cTlmK1ZnUHNVU1QxWmM5b1hRdzc0czI3ZnRwbllSSmtWUzFkWkNtbVVmNG91?=
 =?utf-8?B?RWg0Q1VHVnRXTjNwOVFaSVdpaDdHODdhNFczZHU4M0NYbEVlc2NmRlArOG5t?=
 =?utf-8?B?SThBMmoxTUp5dEtuWGxST0hudmYrVnNnUGxJQWVmSWJXOTY1Z0N3a3luVWY2?=
 =?utf-8?B?NUhZY0hEbDc5RldJcXVDZjBsUVQvR3VMQzdQcmVqRE1WV1I4S3dLc3paZnA1?=
 =?utf-8?B?cEVBQkVFcmIzV3hRT1B1Mkg5K3RualRKV284RmtSMmJHY3F2VWJtZThZdG9Q?=
 =?utf-8?B?MVpHa0NqeitaY0JvT3hGdEUvTWNwQWV3Q2NMcnNRYkxacGp6QUZWUHBFVGhP?=
 =?utf-8?B?SkJzVUZWTzdLTmwxR0FvRVptNUtJUHRienhRa1lxcnFkK2JlUXMySHh6ZXBs?=
 =?utf-8?B?ckhpMENnTGZXeTJDaDdRVXZibjZwNnhjaDF0WGk5NUtjanRBTkNlWTlnK3RL?=
 =?utf-8?B?V3dDZjRyemNZSm01R2ozd1gvS2hrYythamcydm4zQmxxZHpWVFdqdEZqem0z?=
 =?utf-8?B?aGkzVDlIVEljaUQ0S3dIYVV0T2JFc01EVlhvb0ZNcWdVUWtXTWN5WEp6Tkpq?=
 =?utf-8?B?eTQvcllENFdvYmRqZWtoY1FCWFpha0JtMmxpVTdQOEYycFo0SGJuVE5vdzRL?=
 =?utf-8?B?T0VlUS9mV0dzTndVVXRNM1NZK05zRGdyWUllYlJDMFVIVUNjRGFnR0R3VFhz?=
 =?utf-8?B?MTBDTzh4UW0xOXJsY0VFYTlmUC9nY0Y2Q0JZeU82eWM1cnpUZnlpOUd5OUNl?=
 =?utf-8?B?ZUp2Y3paY1M5YkRQNmh3aTlZSktGWDdnR3htWGZ2UnNDaHkrSnBzVXlWRlBR?=
 =?utf-8?B?d3UxVUpOSGplYkZJVmlra25odmRTYWd4bWVDSytOMkUxTmxzTk5CZ3kvTlE2?=
 =?utf-8?B?UEx5d3RVYjZGR1VLd1VLQkJ3SWI4YmZ2alJ5ZmdmSURvYWhPRTJQdGNMRXFP?=
 =?utf-8?B?TUI0aUFNV2ZIZmtrM0pDdElQMXBNYVBCNE9pSWtiQVpSckFlRFpjK2dJdDBG?=
 =?utf-8?B?dU9GUlZ3YTRtZ2UxbitQdGFHL1dremNaY3ZxNVdvS1VJblhIdXg0TnhkNU5o?=
 =?utf-8?B?Q2d3WHNDNjFGaXpLT2JudktCazVIZ3dFOWFCdnI2RERJL3JNWjZRcHJ2ZnlK?=
 =?utf-8?B?ZVRrUTB0UVNlWkZlcGg2K2NqUlZxTHlXWW51MnJaV1RUR2EwRlFTdWF2QXVa?=
 =?utf-8?B?bzA4Tnc0SWJyRHQyNXNmZFpPSnlCQTVMR2R1WGZ5Um1WY01jaEM2KzFrRml5?=
 =?utf-8?B?bWtKMGo3dkorS3VZTjV2cVhPWW92djBaVnlPMnpUVmFiZ1ZFTGVzWnJwWEFC?=
 =?utf-8?B?a2Z2YkY2ejBWZ3ZidS9nMTNjUm5LQkNMRGR2Tk1YSnN2c1E3b0ZoMXlYdC8w?=
 =?utf-8?B?bld2WWlaSG9DTVptd1Nnd1JsQTVCUEdlVXRhNGJnYW16RnltVmVKQ3JiVFE0?=
 =?utf-8?B?NHhxOTVHZzZ2RFJkZkd5Y3ZlbVpna2FPdFkrcTdrdnFGbkVFdlBzMG1KK25T?=
 =?utf-8?B?RHQvMTk3TGd5bHFqWHYvMk9WZ05SNTJsaDVFckRIWnBpdE1sWC9BY2dONFp4?=
 =?utf-8?B?c3BCUnlyalZCejh1NGI0cUZZai9XVlJNT1RwazNTKy9uMTNTRjhXWWlxU1Nm?=
 =?utf-8?B?MDFxa0VvR2I0Z1d6eXVzU2VzNXZzKzc5Tit6ZFdmLzdmWnlraTFtOC84MzVq?=
 =?utf-8?B?T2dBZTcrUzhOUld3RzdVS0o5WjBUWGc1U2xob1J1aStHTThnRjVtSWUvbGpw?=
 =?utf-8?B?VFBOd3BJYmlEWDE0UStrY0Jkb2RTbmplVWxzV3V6OUIwRlFTQjBHVERoZ2hn?=
 =?utf-8?B?eWNKTU5YRDk4eldKYTJiNjZTMWdNR2k1eFJzVjBuRmxWRzBhanlHeEZyZTRT?=
 =?utf-8?B?WEtkVGdYWERJMkxwY3ZoNmhKa2Y5NDFnUGZxYkR5ZCtXVEp3V1VEQytxRFA2?=
 =?utf-8?B?eGIvcDI5ZU9TOHAxd1pOUElzZVVXankzY0lkZ2ROdng0V1NDS2c5TWk3NGxI?=
 =?utf-8?B?cVU4UGlzR2pBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB8322.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(3122999009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2hrMFV0ZHNVaHJ6Y2s0Zy9NWVF6VXdvclRkcnpIYXJLc0Q5N2U4ZTNiRGpa?=
 =?utf-8?B?SUtkN1M2R3dwa201RklDY3Vwd0FtSjdrTmRlVHRSKzY2NTFCd2krUWRNWDVt?=
 =?utf-8?B?d29zVHQ4YWZhK1ZSekYrZDJDeXV1M2hTYnNIU085WDU5cXhqczlkRGVNTTNN?=
 =?utf-8?B?SlU5NzZVc21ZS1NhNVlPOG5hUFBubjB0ZjhCNlFTMk1Gb2x0ZkRrelpRYXUx?=
 =?utf-8?B?UjZUVko2SUl6bDVCd3ZHZU5zT3podkl1NkpyMTdiYTR0S0wzNDBSYXNxdmxZ?=
 =?utf-8?B?d1F3b1dLdTdwUlo0NmR2WnRQVEo1VzFRNlFMcXB1UDFMZ0VQajFWTUhyR0Q4?=
 =?utf-8?B?RnhXSDBFbkxYMkdHMXF3U0h3SFVZM3FLY2RZZXJjQWlJVVV6UGFzcUhtTkdV?=
 =?utf-8?B?Y0NwT2dnYldrVWVoME1xZGRNRFB4aHpQSzBkSE15Nnd3amtYb0pHNm1MVmIy?=
 =?utf-8?B?TXY0ODMwb093N1VVL1BVZXNyWTJYVWpEUGNZdHAreFk1cC9iSm1SemtML01Q?=
 =?utf-8?B?YUpMYjFWbHNMbzZzUmhzaGNxV0VEOFFzUmlUK0xMUjh4ajFpcHFjWmtFY3FK?=
 =?utf-8?B?RjdHNWtVS282WERxVTc3eFM4Tm1mcDdrOUxWaldPZFpyTElxQTJ6T0hVYm1q?=
 =?utf-8?B?S2lhaDdLaStTc3FqZkVQVmlWY0RUKzI5Kytha1dkbzdXMkVUUEFaYkRFNlJn?=
 =?utf-8?B?bXBvMllWQjJaNm1jT0dBQUlnenVxWm50bHNrWFBibzd6a2VLcVFTWjJNREJO?=
 =?utf-8?B?TWlyYjUra2VDUDhaYTNwMmlKTHl5ZXFrakFVZEFRZlBKYUdDY214clJ1VW03?=
 =?utf-8?B?S3JvdnFpejhPRXZyUHEycXo5RUNFT1FxS3RycWxTbTlMbUdyVk4zeldaYUZz?=
 =?utf-8?B?VDVXQUZHVVNZSkNrdmdXMG00SDlyY0tFamJ2ZUNVRWRIY3NkVWx5VEhiRVNW?=
 =?utf-8?B?SVBhZXY0c0o4K3dpNnlLVXBDQWtuMWtqTi9SU1lOQkJkTmlSR3lYeGNmaC9p?=
 =?utf-8?B?YXYxRVVMeVUwamsvWm9VUkV2bHU5Q3V1VHhXUnlReHczbUJCSG04TXVHakUv?=
 =?utf-8?B?R243anIzNENRTXAyTDZlUi9ETDRJU1VHakc5QU1vV0QvM0t5SFgvM2JLWUxC?=
 =?utf-8?B?ZTJYaThmSzNYSXcwQ2VQdkZReTh4VnZWckUza3Viek9nQkNoUWtHdUFxbjFF?=
 =?utf-8?B?NGY2RkhhOFd1aXMyL1gyWTBoZk1QTjYrWitGY0RrWENKUS9USVFSZFNMeDZ4?=
 =?utf-8?B?RHRFTlN5YUF6RWN1dDlmNk8yU2RBU2ZFWWFpNXUySFlaNlhSQnhveXkxVmoz?=
 =?utf-8?B?ajh4SmN1MnNQNktOOU5DM0x1STBRUTJXMlZjbUNDL2R4cXBGSmdTeFZLamlw?=
 =?utf-8?B?V1lLVFBMUVE4NjVCZnphekZreW5ISG0wR3hTOVF6QnNpR2lOU05TTEVsd3ll?=
 =?utf-8?B?bllvWGZXT01iNE00V05SRFNyNmpaMU1reG81aTBvcHZhY25kWFZTNmFuZUhG?=
 =?utf-8?B?THJES29JdHJNZUc4U1RTYXNlUHovUXpldEdhRzh3ZmJKaDVmZFJtWnRFSDVa?=
 =?utf-8?B?MFdXQ1MyZFRTMmN4L0ZjR3J1ZDhmcS91QUd5Ukl5dFMwbGJNV2o3YW5QbFFu?=
 =?utf-8?B?RndqK2hqZXBHTm45b1V0cUZDSkptek8xMzZsVGxydVVJRE9MUkhELzlXTkJK?=
 =?utf-8?B?YjZCZGpXalFiSXJ1THozaEtyL0s0dkgzWjNZS01jdDd3eE56Z3BRQURHdFNh?=
 =?utf-8?B?U09WdXhOMkRlaG1VK2ZnY2FGVEN0QTV5S1ljN1FwSWcyNWNGbHkrTUUrUlA3?=
 =?utf-8?B?cHU0RU84SmJmdVNHR2p1UngvaXUzQ2VEU3pZakhoMTBydFRZNW13VXF1WGxP?=
 =?utf-8?B?RVZTN1k2eng0QjJMNnBsTDdkeldZa012VFVzZG5IT1RJcWlXMlpmLzBsZHox?=
 =?utf-8?B?YWg3bVhkb1RGaXJFY01LaXhqRGVvM2dXbEJOL3BheHVCeGdqOElrMUp3RUNF?=
 =?utf-8?B?QVk4S3VFSkdWdlVic2xxZ3BrVXEzS005Vms0VUFMTG5kejQ5cmE5cTRzMG5X?=
 =?utf-8?B?L2c5R1F4dFF6ZHNoT1VPL3U4R0FJcDZJbjBLQ2l5TzNCRDFmWjhVWnc1T3RO?=
 =?utf-8?Q?95+tZ4/+7RkQQl+WcWacYzv9O?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c88eb403-e7fa-4023-a046-08de1adb3b33
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB8322.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 13:16:43.2806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YGZPkc47v314XFl0NCh+s1FtLBYk4SSu1kd92iYO9BnfTz9tqOcAis6PC95kRFgyNRfHD6nzwsGEdWQRTdfIIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR03MB8747

On 9/1/25 13:06, Milan Djokic wrote:
> Hi Volodymyr,
> 
> On 8/29/25 18:27, Volodymyr Babchuk wrote:
>> Hi Milan,
>>
>> Thanks, "Security Considerations" sections looks really good. But I have
>> more questions.
>>
>> Milan Djokic <milan_djokic@epam.com> writes:
>>
>>> Hello Julien, Volodymyr
>>>
>>> On 8/27/25 01:28, Volodymyr Babchuk wrote:
>>>> Hi Milan,
>>>> Milan Djokic <milan_djokic@epam.com> writes:
>>>>
>>>>> Hello Julien,
>>>>>
>>>>> On 8/13/25 14:11, Julien Grall wrote:
>>>>>> On 13/08/2025 11:04, Milan Djokic wrote:
>>>>>>> Hello Julien,
>>>>>> Hi Milan,
>>>>>>
>>>>>>>
>>>>>>> We have prepared a design document and it will be part of the updated
>>>>>>> patch series (added in docs/design). I'll also extend cover letter with
>>>>>>> details on implementation structure to make review easier.
>>>>>> I would suggest to just iterate on the design document for now.
>>>>>>
>>>>>>> Following is the design document content which will be provided in
>>>>>>> updated patch series:
>>>>>>>
>>>>>>> Design Proposal: Add SMMUv3 Stage-1 Support for XEN Guests
>>>>>>> ==========================================================
>>>>>>>
>>>>>>> Author: Milan Djokic <milan_djokic@epam.com>
>>>>>>> Date:   2025-08-07
>>>>>>> Status: Draft
>>>>>>>
>>>>>>> Introduction
>>>>>>> ------------
>>>>>>>
>>>>>>> The SMMUv3 supports two stages of translation. Each stage of translation
>>>>>>> can be independently enabled. An incoming address is logically
>>>>>>> translated from VA to IPA in stage 1, then the IPA is input to stage 2
>>>>>>> which translates the IPA to the output PA. Stage 1 translation support
>>>>>>> is required to provide isolation between different devices within the OS.
>>>>>>>
>>>>>>> Xen already supports Stage 2 translation but there is no support for
>>>>>>> Stage 1 translation. This design proposal outlines the introduction of
>>>>>>> Stage-1 SMMUv3 support in Xen for ARM guests.
>>>>>>>
>>>>>>> Motivation
>>>>>>> ----------
>>>>>>>
>>>>>>> ARM systems utilizing SMMUv3 require Stage-1 address translation to
>>>>>>> ensure correct and secure DMA behavior inside guests.
>>>>>> Can you clarify what you mean by "correct"? DMA would still work
>>>>>> without
>>>>>> stage-1.
>>>>>
>>>>> Correct in terms of working with guest managed I/O space. I'll
>>>>> rephrase this statement, it seems ambiguous.
>>>>>
>>>>>>>
>>>>>>> This feature enables:
>>>>>>> - Stage-1 translation in guest domain
>>>>>>> - Safe device passthrough under secure memory translation
>>>>>>>
>>>>>>> Design Overview
>>>>>>> ---------------
>>>>>>>
>>>>>>> These changes provide emulated SMMUv3 support:
>>>>>>>
>>>>>>> - SMMUv3 Stage-1 Translation: stage-1 and nested translation support in
>>>>>>>        SMMUv3 driver
>>>>>>> - vIOMMU Abstraction: virtual IOMMU framework for guest Stage-1 handling
>>>>>> So what are you planning to expose to a guest? Is it one vIOMMU per
>>>>>> pIOMMU? Or a single one?
>>>>>
>>>>> Single vIOMMU model is used in this design.
>>>>>
>>>>>> Have you considered the pros/cons for both?
>>>>>>> - Register/Command Emulation: SMMUv3 register emulation and command
>>>>>>>        queue handling
>>>>>>
>>>>>
>>>>> That's a point for consideration.
>>>>> single vIOMMU prevails in terms of less complex implementation and a
>>>>> simple guest iommmu model - single vIOMMU node, one interrupt path,
>>>>> event queue, single set of trap handlers for emulation, etc.
>>>>> Cons for a single vIOMMU model could be less accurate hw
>>>>> representation and a potential bottleneck with one emulated queue and
>>>>> interrupt path.
>>>>> On the other hand, vIOMMU per pIOMMU provides more accurate hw
>>>>> modeling and offers better scalability in case of many IOMMUs in the
>>>>> system, but this comes with more complex emulation logic and device
>>>>> tree, also handling multiple vIOMMUs on guest side.
>>>>> IMO, single vIOMMU model seems like a better option mostly because
>>>>> it's less complex, easier to maintain and debug. Of course, this
>>>>> decision can and should be discussed.
>>>>>
>>>> Well, I am not sure that this is possible, because of StreamID
>>>> allocation. The biggest offender is of course PCI, as each Root PCI
>>>> bridge will require own SMMU instance with own StreamID space. But even
>>>> without PCI you'll need some mechanism to map vStremID to
>>>> <pSMMU, pStreamID>, because there will be overlaps in SID space.
>>>> Actually, PCI/vPCI with vSMMU is its own can of worms...
>>>>
>>>>>> For each pSMMU, we have a single command queue that will receive command
>>>>>> from all the guests. How do you plan to prevent a guest hogging the
>>>>>> command queue?
>>>>>> In addition to that, AFAIU, the size of the virtual command queue is
>>>>>> fixed by the guest rather than Xen. If a guest is filling up the queue
>>>>>> with commands before notifying Xen, how do you plan to ensure we don't
>>>>>> spend too much time in Xen (which is not preemptible)?
>>>>>>
>>>>>
>>>>> We'll have to do a detailed analysis on these scenarios, they are not
>>>>> covered by the design (as well as some others which is clear after
>>>>> your comments). I'll come back with an updated design.
>>>> I think that can be handled akin to hypercall continuation, which is
>>>> used in similar places, like P2M code
>>>> [...]
>>>>
>>>
>>> I have updated vIOMMU design document with additional security topics
>>> covered and performance impact results. Also added some additional
>>> explanations for vIOMMU components following your comments.
>>> Updated document content:
>>>
>>> ===============================================
>>> Design Proposal: Add SMMUv3 Stage-1 Support for XEN Guests
>>> ===============================================
>>>
>>> :Author:     Milan Djokic <milan_djokic@epam.com>
>>> :Date:       2025-08-07
>>> :Status:     Draft
>>>
>>> Introduction
>>> ========
>>>
>>> The SMMUv3 supports two stages of translation. Each stage of
>>> translation can be
>>> independently enabled. An incoming address is logically translated
>>> from VA to
>>> IPA in stage 1, then the IPA is input to stage 2 which translates the IPA to
>>> the output PA. Stage 1 translation support is required to provide
>>> isolation between different
>>> devices within OS. XEN already supports Stage 2 translation but there is no
>>> support for Stage 1 translation.
>>> This design proposal outlines the introduction of Stage-1 SMMUv3
>>> support in Xen for ARM guests.
>>>
>>> Motivation
>>> ==========
>>>
>>> ARM systems utilizing SMMUv3 require stage-1 address translation to
>>> ensure secure DMA and guest managed I/O memory mappings.
>>
>> It is unclear for my what you mean by "guest manged IO memory mappings",
>> could you please provide an example?
>>
> 
> Basically enabling stage-1 translation means that the guest is
> responsible for managing IOVA to IPA mappings through its own IOMMU
> driver. Guest manages its own stage-1 page tables and TLB.
> For example, when a guest driver wants to perform DMA mapping (e.g. with
> dma_map_single()), it will request mapping of its buffer physical
> address to IOVA through guest IOMMU driver. Guest IOMMU driver will
> further issue mapping commands emulated by Xen which translate it into
> stage-2 mappings.
> 
>>> This feature enables:
>>>
>>> - Stage-1 translation in guest domain
>>> - Safe device passthrough under secure memory translation
>>>
>>
>> As I see it, ARM specs use "secure" mostly when referring to Secure mode
>> (S-EL1, S-EL2, EL3) and associated secure counterparts of architectural
>> devices, like secure GIC, secure Timer, etc. So I'd probably don't use
>> this word here to reduce confusion
>>
> 
> Sure, secure in terms of isolation is the topic here. I'll rephrase this
> 
>>> Design Overview
>>> ===============
>>>
>>> These changes provide emulated SMMUv3 support:
>>>
>>> - **SMMUv3 Stage-1 Translation**: stage-1 and nested translation
>>>       support in SMMUv3 driver.
>>
>> "Nested translation" as in "nested virtualization"? Or is this something else?
>>
> 
> No, this refers to 2-stage translation IOVA->IPA->PA as a nested
> translation. Although with this feature, nested virtualization is also
> enabled since guest can emulate its own IOMMU e.g. when kvm is run in guest.
> 
> 
>>> - **vIOMMU Abstraction**: Virtual IOMMU framework for guest stage-1
>>>       handling.
>>
>> I think, this is the big topic. You see, apart from SMMU, there is
>> at least Renesas IP-MMU, which uses completely different API. And
>> probably there are other IO-MMU implementations possible. Right now
>> vIOMMU framework handles only SMMU, which is okay, but probably we
>> should design it in a such way, that other IO-MMUs will be supported as
>> well. Maybe even IO-MMUs for other architectures (RISC V maybe?).
>>
> 
> I think that it is already designed in such manner. We have a generic
> vIOMMU framework and a backend implementation for target IOMMU as
> separate components. And the backend implements supported
> commands/mechanisms which are specific for target IOMMU type. At this
> point, only SMMUv3 is supported, but it is possible to implement other
> IOMMU types support under the same generic framework. AFAIK, RISC-V
> IOMMU stage-2 is still in early development stage, but I do believe that
> it will be also compatible with vIOMMU framework.
> 
>>> - **Register/Command Emulation**: SMMUv3 register emulation and
>>>       command queue handling.
>>
>> Continuing previous paragraph: what about other IO-MMUs? For example, if
>> platform provides only Renesas IO-MMU, will vIOMMU framework still
>> emulate SMMUv3 registers and queue handling?
>>
> 
> Yes, this is not supported in current implementation. To support other
> IOMMU than SMMUv3, stage-1 emulation backend needs to be implemented for
> target IOMMU and probably Xen driver for target IOMMU has to be updated
> to handle stage-1 configuration. I will elaborate this part in the
> design, to make clear that we have a generic vIOMMU framework, but only
> SMMUv3 backend exists atm.
> 
>>> - **Device Tree Extensions**: Adds `iommus` and virtual SMMUv3 nodes
>>>       to device trees for dom0 and dom0less scenarios.
>>> - **Runtime Configuration**: Introduces a `viommu` boot parameter for
>>>       dynamic enablement.
>>>
>>> vIOMMU is exposed to guest as a single device with predefined
>>> capabilities and commands supported. Single vIOMMU model abstracts the
>>> details of an actual IOMMU hardware, simplifying usage from the guest
>>> point of view. Guest OS handles only a single IOMMU, even if multiple
>>> IOMMU units are available on the host system.
>>
>> In the previous email I asked how are you planning to handle potential
>> SID overlaps, especially in PCI use case. I want to return to this
>> topic. I am not saying that this is impossible, but I'd like to see this
>> covered in the design document.
>>
> 
> Sorry, I've missed this part in the previous mail. This is a valid point,
> SID overlapping would be an issue for a single vIOMMU model. To prevent
> it, design will have to be extended with SID namespace virtualization,
> introducing a remapping layer which will make sure that guest virtual
> SIDs are unique and maintain proper mappings of vSIDs to pSIDs.
> For PCI case, we need to have an extended remapping logic where
> iommu-map property will be also patched in the guest device tree since
> we need a range of unique vSIDs for every RC assigned to guest.
> Alternative approach would be to switch to vIOMMU per pIOMMU model.
> Since both approaches require major updates, I'll have to do a detailed
> analysis and come back with an updated design which would address this
> issue.
> 
> 
>>>
>>> Security Considerations
>>> =======================
>>>
>>> **viommu security benefits:**
>>>
>>> - Stage-1 translation ensures guest devices cannot perform unauthorized DMA.
>>> - Emulated IOMMU removes guest dependency on IOMMU hardware while
>>>     maintaining domains isolation.
>>
>> I am not sure that I got this paragraph.
>>
> 
> First one refers to guest controlled DMA access. Only IOVA->IPA mappings
> created by guest are usable by the device when stage-1 is enabled. On
> the other hand, with stage-2 only enabled, device could access to
> complete IOVA->PA mapping created by Xen for guest. Since the guest has
> no control over device IOVA accesses, a malicious guest kernel could
> potentially access memory regions it shouldn't be allowed to, e.g. if
> stage-2 mappings are stale. With stage-1 enabled, guest device driver
> has to explicitly map IOVAs and this request is propagated through
> emulated IOMMU, making sure that IOVA mappings are valid all the time.
> 
> Second claim means that with emulated IOMMU, guests don’t need direct
> access to physical IOMMU hardware. The hypervisor emulates IOMMU
> behavior for the guest, while still ensuring that memory access by
> devices remains properly isolated between guests, just like it would
> with real IOMMU hardware.
> 
>>>
>>>
>>> 1. Observation:
>>> ---------------
>>> Support for Stage-1 translation in SMMUv3 introduces new data
>>> structures (`s1_cfg` alongside `s2_cfg`) and logic to write both
>>> Stage-1 and Stage-2 entries in the Stream Table Entry (STE), including
>>> an `abort` field to handle partial configuration states.
>>>
>>> **Risk:**
>>> Without proper handling, a partially applied Stage-1 configuration
>>> might leave guest DMA mappings in an inconsistent state, potentially
>>> enabling unauthorized access or causing cross-domain interference.
>>>
>>> **Mitigation:** *(Handled by design)*
>>> This feature introduces logic that writes both `s1_cfg` and `s2_cfg`
>>> to STE and manages the `abort` field-only considering Stage-1
>>> configuration if fully attached. This ensures incomplete or invalid
>>> guest configurations are safely ignored by the hypervisor.
>>>
>>> 2. Observation:
>>> ---------------
>>> Guests can now invalidate Stage-1 caches; invalidation needs
>>> forwarding to SMMUv3 hardware to maintain coherence.
>>>
>>> **Risk:**
>>> Failing to propagate cache invalidation could allow stale mappings,
>>> enabling access to old mappings and possibly data leakage or
>>> misrouting.
>>>
>>> **Mitigation:** *(Handled by design)*
>>> This feature ensures that guest-initiated invalidations are correctly
>>> forwarded to the hardware, preserving IOMMU coherency.
>>>
>>> 3. Observation:
>>> ---------------
>>> This design introduces substantial new functionality, including the
>>> `vIOMMU` framework, virtual SMMUv3 devices (`vsmmuv3`), command
>>> queues, event queues, domain management, and Device Tree modifications
>>> (e.g., `iommus` nodes and `libxl` integration).
>>>
>>> **Risk:**
>>> Large feature expansions increase the attack surface—potential for
>>> race conditions, unchecked command inputs, or Device Tree-based
>>> misconfigurations.
>>>
>>> **Mitigation:**
>>>
>>> - Sanity checks and error-handling improvements have been introduced
>>>     in this feature.
>>> - Further audits have to be performed for this feature and its
>>>     dependencies in this area. Currently, feature is marked as *Tech
>>>     Preview* and is self-contained, reducing the risk to unrelated
>>>    components.
>>>
>>> 4. Observation:
>>> ---------------
>>> The code includes transformations to handle nested translation versus
>>> standard modes and uses guest-configured command queues (e.g.,
>>> `CMD_CFGI_STE`) and event notifications.
>>>
>>> **Risk:**
>>> Malicious or malformed queue commands from guests could bypass
>>> validation, manipulate SMMUv3 state, or cause Dom0 instability.
>>
>> Only Dom0?
>>
> 
> This is a mistake, the whole system could be affected. I'll fix this.
> 
>>>
>>> **Mitigation:** *(Handled by design)*
>>> Built-in validation of command queue entries and sanitization
>>> mechanisms ensure only permitted configurations are applied. This is
>>> supported via additions in `vsmmuv3` and `cmdqueue` handling code.
>>>
>>> 5. Observation:
>>> ---------------
>>> Device Tree modifications enable device assignment and
>>> configuration—guest DT fragments (e.g., `iommus`) are added via
>>> `libxl`.
>>>
>>> **Risk:**
>>> Erroneous or malicious Device Tree injection could result in device
>>> misbinding or guest access to unauthorized hardware.
>>>
>>> **Mitigation:**
>>>
>>> - `libxl` perform checks of guest configuration and parse only
>>>     predefined dt fragments and nodes, reducing risc.
>>> - The system integrator must ensure correct resource mapping in the
>>>     guest Device Tree (DT) fragments.
>>>
>>> 6. Observation:
>>> ---------------
>>> Introducing optional per-guest enabled features (`viommu` argument in
>>> xl guest config) means some guests may opt-out.
>>>
>>> **Risk:**
>>> Differences between guests with and without `viommu` may cause
>>> unexpected behavior or privilege drift.
>>>
>>> **Mitigation:**
>>> Verify that downgrade paths are safe and well-isolated; ensure missing
>>> support doesn't cause security issues. Additional audits on emulation
>>> paths and domains interference need to be performed in a multi-guest
>>> environment.
>>>
>>> 7. Observation:
>>> ---------------
>>> Guests have the ability to issue Stage-1 IOMMU commands like cache
>>> invalidation, stream table entries configuration, etc. An adversarial
>>> guest may issue a high volume of commands in rapid succession.
>>>
>>> **Risk**
>>> Excessive commands requests can cause high hypervisor CPU consumption
>>> and disrupt scheduling, leading to degraded system responsiveness and
>>> potential denial-of-service scenarios.
>>>
>>> **Mitigation**
>>>
>>> - Xen credit scheduler limits guest vCPU execution time, securing
>>>     basic guest rate-limiting.
>>
>> I don't thing that this feature available only in credit schedulers,
>> AFAIK, all schedulers except null scheduler will limit vCPU execution time.
>>
> 
> I was not aware of that. I'll rephrase this part.
> 
>>> - Batch multiple commands of same type to reduce overhead on the
>>>     virtual SMMUv3 hardware emulation.
>>> - Implement vIOMMU commands execution restart and continuation support
>>
>> So, something like "hypercall continuation"?
>>
> 
> Yes
> 
>>>
>>> 8. Observation:
>>> ---------------
>>> Some guest commands issued towards vIOMMU are propagated to pIOMMU
>>> command queue (e.g. TLB invalidate). For each pIOMMU, only one command
>>> queue is
>>> available for all domains.
>>>
>>> **Risk**
>>> Excessive commands requests from abusive guest can cause flooding of
>>> physical IOMMU command queue, leading to degraded pIOMMU responsivness
>>> on commands issued from other guests.
>>>
>>> **Mitigation**
>>>
>>> - Xen credit scheduler limits guest vCPU execution time, securing
>>>     basic guest rate-limiting.
>>> - Batch commands which should be propagated towards pIOMMU cmd queue
>>>     and enable support for batch execution pause/continuation
>>> - If possible, implement domain penalization by adding a per-domain
>>>     cost counter for vIOMMU/pIOMMU usage.
>>>
>>> 9. Observation:
>>> ---------------
>>> vIOMMU feature includes event queue used for forwarding IOMMU events
>>> to guest (e.g. translation faults, invalid stream IDs, permission
>>> errors). A malicious guest can misconfigure its SMMU state or
>>> intentionally trigger faults with high frequency.
>>>
>>> **Risk**
>>> Occurance of IOMMU events with high frequency can cause Xen to flood
>>> the event queue and disrupt scheduling with high hypervisor CPU load
>>> for events handling.
>>>
>>> **Mitigation**
>>>
>>> - Implement fail-safe state by disabling events forwarding when faults
>>>     are occured with high frequency and not processed by guest.
>>> - Batch multiple events of same type to reduce overhead on the virtual
>>>     SMMUv3 hardware emulation.
>>> - Consider disabling event queue for untrusted guests
>>>
>>> Performance Impact
>>> ==================
>>>
>>> With iommu stage-1 and nested translation inclusion, performance
>>> overhead is introduced comparing to existing, stage-2 only usage in
>>> Xen.
>>> Once mappings are established, translations should not introduce
>>> significant overhead.
>>> Emulated paths may introduce moderate overhead, primarily affecting
>>> device initialization and event handling.
>>> Performance impact highly depends on target CPU capabilities. Testing
>>> is performed on cortex-a53 based platform.
>>
>> Which platform exactly? While QEMU emulates SMMU to some extent, we are
>> observing somewhat different SMMU behavior on real HW platforms (mostly
>> due to cache coherence problems). Also, according to MMU-600 errata, it
>> can have lower than expected performance in some use-cases.
>>
> 
> Performance measurement are done on QEMU emulated Renesas platform. I'll
> add some details for this.
> 
>>> Performance is mostly impacted by emulated vIOMMU operations, results
>>> shown in the following table.
>>>
>>> +-------------------------------+---------------------------------+
>>> | vIOMMU Operation              | Execution time in guest         |
>>> +===============================+=================================+
>>> | Reg read                      | median: 30μs, worst-case: 250μs |
>>> +-------------------------------+---------------------------------+
>>> | Reg write                     | median: 35μs, worst-case: 280μs |
>>> +-------------------------------+---------------------------------+
>>> | Invalidate TLB                | median: 90μs, worst-case: 1ms+  |
>>> +-------------------------------+---------------------------------+
>>> | Invalidate STE                | median: 450μs worst_case: 7ms+  |
>>> +-------------------------------+---------------------------------+
>>>
>>> With vIOMMU exposed to guest, guest OS has to initialize IOMMU device
>>> and configure stage-1 mappings for devices attached to it.
>>> Following table shows initialization stages which impact stage-1
>>> enabled guest boot time and compares it with stage-1 disabled guest.
>>>
>>> "NOTE: Device probe execution time varies significantly depending on
>>> device complexity. virtio-gpu was selected as a test case due to its
>>> extensive use of dynamic DMA allocations and IOMMU mappings, making it
>>> a suitable candidate for benchmarking stage-1 vIOMMU behavior."
>>>
>>> +---------------------+-----------------------+------------------------+
>>> | Stage               | Stage-1 Enabled Guest | Stage-1 Disabled Guest |
>>> +=====================+=======================+========================+
>>> | IOMMU Init          | ~25ms                 | /                      |
>>> +---------------------+-----------------------+------------------------+
>>> | Dev Attach / Mapping| ~220ms                | ~200ms                 |
>>> +---------------------+-----------------------+------------------------+
>>>
>>> For devices configured with dynamic DMA mappings, DMA
>>> allocate/map/unmap operations performance is also impacted on stage-1
>>> enabled guests.
>>> Dynamic DMA mapping operation issues emulated IOMMU functions like
>>> mmio write/read and TLB invalidations.
>>> As a reference, following table shows performance results for runtime
>>> dma operations for virtio-gpu device.
>>>
>>> +---------------+-------------------------+----------------------------+
>>> | DMA Op        | Stage-1 Enabled Guest   | Stage-1 Disabled Guest     |
>>> +===============+=========================+============================+
>>> | dma_alloc     | median: 27μs, worst: 7ms| median: 2.5μs, worst: 360μs|
>>> +---------------+-------------------------+----------------------------+
>>> | dma_free      | median: 1ms, worst: 14ms| median: 2.2μs, worst: 85μs |
>>> +---------------+-------------------------+----------------------------+
>>> | dma_map       | median: 25μs, worst: 7ms| median: 1.5μs, worst: 336μs|
>>> +---------------+-------------------------+----------------------------+
>>> | dma_unmap     | median: 1ms, worst: 13ms| median: 1.3μs, worst: 65μs |
>>> +---------------+-------------------------+----------------------------+
>>>
>>> Testing
>>> ============
>>>
>>> - QEMU-based ARM system tests for Stage-1 translation and nested
>>>     virtualization.
>>> - Actual hardware validation on platforms such as Renesas to ensure
>>>     compatibility with real SMMUv3 implementations.
>>> - Unit/Functional tests validating correct translations (not implemented).
>>>
>>> Migration and Compatibility
>>> ===========================
>>>
>>> This optional feature defaults to disabled (`viommu=""`) for backward
>>> compatibility.
>>>
>>
> 
> BR,
> Milan
> 

Hello Volodymyr, Julien

Sorry for the delayed follow-up on this topic.
We have changed vIOMMU design from 1-N to N-N mapping between vIOMMU and 
pIOMMU. Considering single vIOMMU model limitation pointed out by 
Volodymyr (SID overlaps), vIOMMU-per-pIOMMU model turned out to be the 
only proper solution.
Following is the updated design document.
I have added additional details to the design and performance impact 
sections, and also indicated future improvements. Security 
considerations section is unchanged apart from some minor details 
according to review comments.
Let me know what do you think about updated design. Once approved, I 
will send the updated vIOMMU patch series.


==========================================================
Design Proposal: Add SMMUv3 Stage-1 Support for XEN Guests
==========================================================

:Author:     Milan Djokic <milan_djokic@epam.com>
:Date:       2025-11-03
:Status:     Draft

Introduction
============

The SMMUv3 supports two stages of translation. Each stage of translation 
can be
independently enabled. An incoming address is logically translated from 
VA to
IPA in stage 1, then the IPA is input to stage 2 which translates the IPA to
the output PA. Stage 1 translation support is required to provide 
isolation between different
devices within OS. XEN already supports Stage 2 translation but there is no
support for Stage 1 translation.
This design proposal outlines the introduction of Stage-1 SMMUv3 support 
in Xen for ARM guests.

Motivation
==========

ARM systems utilizing SMMUv3 require stage-1 address translation to 
ensure secure DMA and
guest managed I/O memory mappings.
With stage-1 enabed, guest manages IOVA to IPA mappings through its own 
IOMMU driver.

This feature enables:

- Stage-1 translation in guest domain
- Safe device passthrough with per-device address translation table

Design Overview
===============

These changes provide emulated SMMUv3 support:

- **SMMUv3 Stage-1 Translation**: stage-1 and nested translation support 
in SMMUv3 driver.
- **vIOMMU Abstraction**: Virtual IOMMU framework for guest stage-1 
handling.
- **Register/Command Emulation**: SMMUv3 register emulation and command 
queue handling.
- **Device Tree Extensions**: Adds `iommus` and virtual SMMUv3 nodes to 
device trees for dom0 and dom0less scenarios.
- **Runtime Configuration**: Introduces a `viommu` boot parameter for 
dynamic enablement.

Separate vIOMMU device is exposed to guest for every physical IOMMU in 
the system.
vIOMMU feature is designed in a way to provide a generic vIOMMU 
framework and a backend implementation
for target IOMMU as separate components.
Backend implementation contains specific IOMMU structure and commands 
handling (only SMMUv3 currently supported).
This structure allows potential reuse of stage-1 feature for other IOMMU 
types.

Security Considerations
=======================

**viommu security benefits:**

- Stage-1 translation ensures guest devices cannot perform unauthorized 
DMA (device I/O address mapping managed by guest).
- Emulated IOMMU removes guest direct dependency on IOMMU hardware, 
while maintaining domains isolation.


1. Observation:
---------------
Support for Stage-1 translation in SMMUv3 introduces new data structures 
(`s1_cfg` alongside `s2_cfg`)
and logic to write both Stage-1 and Stage-2 entries in the Stream Table 
Entry (STE), including an `abort`
field to handle partial configuration states.

**Risk:**
Without proper handling, a partially applied Stage-1 configuration might 
leave guest DMA mappings in an
inconsistent state, potentially enabling unauthorized access or causing 
cross-domain interference.

**Mitigation:** *(Handled by design)*
This feature introduces logic that writes both `s1_cfg` and `s2_cfg` to 
STE and manages the `abort` field-only
considering Stage-1 configuration if fully attached. This ensures 
incomplete or invalid guest configurations
are safely ignored by the hypervisor.

2. Observation:
---------------
Guests can now invalidate Stage-1 caches; invalidation needs forwarding 
to SMMUv3 hardware to maintain coherence.

**Risk:**
Failing to propagate cache invalidation could allow stale mappings, 
enabling access to old mappings and possibly
data leakage or misrouting.

**Mitigation:** *(Handled by design)*
This feature ensures that guest-initiated invalidations are correctly 
forwarded to the hardware,
preserving IOMMU coherency.

3. Observation:
---------------
This design introduces substantial new functionality, including the 
`vIOMMU` framework, virtual SMMUv3
devices (`vsmmuv3`), command queues, event queues, domain management, 
and Device Tree
modifications (e.g., `iommus` nodes and `libxl` integration).

**Risk:**
Large feature expansions increase the attack surface potential for race 
conditions, unchecked command inputs,
or Device Tree-based misconfigurations.

**Mitigation:**

- Sanity checks and error-handling improvements have been introduced in 
this feature.
- Further audits have to be performed for this feature and its 
dependencies in this area.

4. Observation:
---------------
The code includes transformations to handle nested translation versus 
standard modes and uses guest-configured
command queues (e.g., `CMD_CFGI_STE`) and event notifications.

**Risk:**
Malicious or malformed queue commands from guests could bypass 
validation, manipulate SMMUv3 state,
or cause system instability.

**Mitigation:** *(Handled by design)*
Built-in validation of command queue entries and sanitization mechanisms 
ensure only permitted configurations
are applied. This is supported via additions in `vsmmuv3` and `cmdqueue` 
handling code.

5. Observation:
---------------
Device Tree modifications enable device assignment and configuration 
through guest DT fragments (e.g., `iommus`)
are added via `libxl`.

**Risk:**
Erroneous or malicious Device Tree injection could result in device 
misbinding or guest access to unauthorized
hardware.

**Mitigation:**

- `libxl` perform checks of guest configuration and parse only 
predefined dt fragments and nodes, reducing risk.
- The system integrator must ensure correct resource mapping in the 
guest Device Tree (DT) fragments.

6. Observation:
---------------
Introducing optional per-guest enabled features (`viommu` argument in xl 
guest config) means some guests
may opt-out.

**Risk:**
Differences between guests with and without `viommu` may cause 
unexpected behavior or privilege drift.

**Mitigation:**
Verify that downgrade paths are safe and well-isolated; ensure missing 
support doesn't cause security issues.
Additional audits on emulation paths and domains interference need to be 
performed in a multi-guest environment.

7. Observation:
---------------
Guests have the ability to issue Stage-1 IOMMU commands like cache 
invalidation, stream table entries
configuration, etc. An adversarial guest may issue a high volume of 
commands in rapid succession.

**Risk:**
Excessive commands requests can cause high hypervisor CPU consumption 
and disrupt scheduling,
leading to degraded system responsiveness and potential 
denial-of-service scenarios.

**Mitigation:**

- Xen scheduler limits guest vCPU execution time, securing basic guest 
rate-limiting.
- Batch multiple commands of same type to reduce overhead on the virtual 
SMMUv3 hardware emulation.
- Implement vIOMMU commands execution restart and continuation support

8. Observation:
---------------
Some guest commands issued towards vIOMMU are propagated to pIOMMU 
command queue (e.g. TLB invalidate).

**Risk:**
Excessive commands requests from abusive guest can cause flooding of 
physical IOMMU command queue,
leading to degraded pIOMMU responsivness on commands issued from other 
guests.

**Mitigation:**

- Xen credit scheduler limits guest vCPU execution time, securing basic 
guest rate-limiting.
- Batch commands which should be propagated towards pIOMMU cmd queue and 
enable support for batch
   execution pause/continuation
- If possible, implement domain penalization by adding a per-domain cost 
counter for vIOMMU/pIOMMU usage.

9. Observation:
---------------
vIOMMU feature includes event queue used for forwarding IOMMU events to 
guest
(e.g. translation faults, invalid stream IDs, permission errors).
A malicious guest can misconfigure its SMMU state or intentionally 
trigger faults with high frequency.

**Risk:**
Occurance of IOMMU events with high frequency can cause Xen to flood the 
event queue and disrupt scheduling with
high hypervisor CPU load for events handling.

**Mitigation:**

- Implement fail-safe state by disabling events forwarding when faults 
are occured with high frequency and
   not processed by guest.
- Batch multiple events of same type to reduce overhead on the virtual 
SMMUv3 hardware emulation.
- Consider disabling event queue for untrusted guests

Performance Impact
==================

With iommu stage-1 and nested translation inclusion, performance 
overhead is introduced comparing to existing,
stage-2 only usage in Xen. Once mappings are established, translations 
should not introduce significant overhead.
Emulated paths may introduce moderate overhead, primarily affecting 
device initialization and event handling.
Performance impact highly depends on target CPU capabilities.
Testing is performed on QEMU virt and Renesas R-Car (QEMU emulated) 
platforms.
Performance is mostly impacted by emulated vIOMMU operations, results 
shown in the following table.

+-------------------------------+---------------------------------+
| vIOMMU Operation              | Execution time in guest         |
+===============================+=================================+
| Reg read                      | median: 30μs, worst-case: 250μs |
+-------------------------------+---------------------------------+
| Reg write                     | median: 35μs, worst-case: 280μs |
+-------------------------------+---------------------------------+
| Invalidate TLB                | median: 90μs, worst-case: 1ms+  |
+-------------------------------+---------------------------------+
| Invalidate STE                | median: 450μs worst_case: 7ms+  |
+-------------------------------+---------------------------------+

With vIOMMU exposed to guest, guest OS has to initialize IOMMU device 
and configure stage-1 mappings for devices
attached to it.
Following table shows initialization stages which impact stage-1 enabled 
guest boot time and compares it with
stage-1 disabled guest.

"NOTE: Device probe execution time varies significantly depending on 
device complexity. virtio-gpu was selected
as a test case due to its extensive use of dynamic DMA allocations and 
IOMMU mappings, making it a suitable
candidate for benchmarking stage-1 vIOMMU behavior."

+---------------------+-----------------------+------------------------+
| Stage               | Stage-1 Enabled Guest | Stage-1 Disabled Guest |
+=====================+=======================+========================+
| IOMMU Init          | ~25ms                 | /                      |
+---------------------+-----------------------+------------------------+
| Dev Attach / Mapping| ~220ms                | ~200ms                 |
+---------------------+-----------------------+------------------------+

For devices configured with dynamic DMA mappings, DMA allocate/map/unmap 
operations performance is
also impacted on stage-1 enabled guests.
Dynamic DMA mapping operation trigger emulated IOMMU functions like mmio 
write/read and TLB invalidations.
As a reference, following table shows performance results for runtime 
dma operations for virtio-gpu device.

+---------------+-------------------------+----------------------------+
| DMA Op        | Stage-1 Enabled Guest   | Stage-1 Disabled Guest     |
+===============+=========================+============================+
| dma_alloc     | median: 27μs, worst: 7ms| median: 2.5μs, worst: 360μs|
+---------------+-------------------------+----------------------------+
| dma_free      | median: 1ms, worst: 14ms| median: 2.2μs, worst: 85μs |
+---------------+-------------------------+----------------------------+
| dma_map       | median: 25μs, worst: 7ms| median: 1.5μs, worst: 336μs|
+---------------+-------------------------+----------------------------+
| dma_unmap     | median: 1ms, worst: 13ms| median: 1.3μs, worst: 65μs |
+---------------+-------------------------+----------------------------+

Testing
=======

- QEMU-based ARM system tests for Stage-1 translation.
- Actual hardware validation to ensure compatibility with real SMMUv3 
implementations.
- Unit/Functional tests validating correct translations (not implemented).

Migration and Compatibility
===========================

This optional feature defaults to disabled (`viommu=""`) for backward 
compatibility.

Future improvements
===================

- Implement the proposed mitigations to address security risks that are 
not covered by the current
   design (events batching, commands execution continuation)
- Support for other IOMMU HW (Renesas, RISC-V, etc.)
- Due to static definition of SPIs and MMIO regions for emulated 
devices, current implementation statically
   defines SPIs and MMIO regions for up to 16 vIOMMUs per guest. Future 
improvements would include configurable
   number of IOMMUs or automatic runtime resolution for target platform.

References
==========

- Original feature implemented by Rahul Singh:
  
https://patchwork.kernel.org/project/xen-devel/cover/cover.1669888522.git.rahul.singh@arm.com/ 

- SMMUv3 architecture documentation
- Existing vIOMMU code patterns


BR,
Milan



