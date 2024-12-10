Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE0C9EAFE5
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 12:29:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.852172.1266058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKyPw-0005gZ-39; Tue, 10 Dec 2024 11:28:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 852172.1266058; Tue, 10 Dec 2024 11:28:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKyPw-0005ep-0S; Tue, 10 Dec 2024 11:28:40 +0000
Received: by outflank-mailman (input) for mailman id 852172;
 Tue, 10 Dec 2024 11:28:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v99H=TD=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1tKyPu-0005ej-V1
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 11:28:39 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20612.outbound.protection.outlook.com
 [2a01:111:f403:2613::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5576fa2-b6e9-11ef-99a3-01e77a169b0f;
 Tue, 10 Dec 2024 12:28:36 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by AS8PR03MB7336.eurprd03.prod.outlook.com (2603:10a6:20b:2ec::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.14; Tue, 10 Dec
 2024 11:28:34 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8230.016; Tue, 10 Dec 2024
 11:28:33 +0000
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
X-Inumbo-ID: e5576fa2-b6e9-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hUdp3m8KB1lo/JhqEaYn7Iudj/I7oKGU6mxwRqdhyMfnqjtPNz5xL2+ajBvwxs0cmycfQDd7NT9gyBpsJjX3F3T0VZpwjvnPcrvMOHy1KaPPaCF8oDg1HXFoXG3dc1+s4ePhoJHtl26cTv6AVJQpe75OuVxWcMl/aQNnKqhyboW9EG2mwl8/KsAHVZRQG+FTxsUy644nGUksLVrisMTi60wn3Wjp8VBfPuJklyNVaJD/Q2bogug6eQMG2iKxsiqWYCp1jlfHdNnScEYy+IDKfXZwXJSM6jfW9yFGqfDqDagKEwWPwRyQEt7bpBnD6EddZl84om2QU4UsO/huPvso0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uWlJa9smDsPR1K3hbPl/gjgw2AoH+Vl0K27G8ISMxpg=;
 b=aZvvxn0GHUz8j4HJM8yYXsD12u1hp6Yd19HWPV3GDF2X6dmEQZnSIptqdr5nD+yib7Vbj8sDVmB5tuGRqvNLRDOD+cdZBD039Lhsp1Sc8Ti8NwejXVhP/HV6jhvlAQiTYZFRmYzhQWSSjdGnXLf8Fye9d+5rh7qKWVNkNmuGPGGElYJIPW8iskCeA0YSDuByBpjSQbHYvyYbXGu/zA+o5dyHQG1k75rBIIEyQGn7OL6KDQgBGJ3uDq7U/5FTcFV/eFVch83s7yESM4BvfZb759NVV0nyNxIc86rNezRFbl2jH1hcsvXXQd13i7Xys4JDRBlj5tKitRLXZ0b6slXvng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uWlJa9smDsPR1K3hbPl/gjgw2AoH+Vl0K27G8ISMxpg=;
 b=SAhI13iFXwABZccH4jLF+X30miTu+LgVB6XSbjJAUZPdLb+5b0oGimYcO5Zr6oLRdLvkVe074W5cQsXUizXua+nJJ7RLeENbL2aXj7tf6TomSHf4at/e4Rmf4CjwPzI12+MMenEKJF74ngiIIOje9r2eYPzZAolD6f0tdLVC19OsDUy8SdEA7dTNt5WD9KbuYrK1Ez7k2ZRGZshkZiJN5DOIvQsUFGllW6ye9qB2KgIeZ3uFQVl8qyyKI9GvnS5VQFgE0dM1GKVdP/bjvcDOse2Kr/tUcTS50vXk1dtbtf+XAukTBkWnO494xXyV6VKFa0YkPyM2UyC6HhpyR5e2Tw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <364982fa-53b7-4e41-80a0-4511babdabe0@epam.com>
Date: Tue, 10 Dec 2024 13:28:31 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] xen/arm: Add SCMI over SMC calls handling layer
To: Andrei Cherechesu <andrei.cherechesu@oss.nxp.com>,
 Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: S32@nxp.com, Andrei Cherechesu <andrei.cherechesu@nxp.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240930114715.642978-1-andrei.cherechesu@oss.nxp.com>
 <20240930114715.642978-4-andrei.cherechesu@oss.nxp.com>
 <59b54859-d893-4bf4-8118-7e4a00e7d87e@epam.com>
 <3d731902-d5eb-4f63-8501-5ddecf748cb9@xen.org>
 <a2470791-dd21-457c-a314-ca7484d51daf@oss.nxp.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <a2470791-dd21-457c-a314-ca7484d51daf@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0072.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::9) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|AS8PR03MB7336:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f02654e-76a3-4465-5080-08dd190dc7f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MXZaOGo4eC9ZMXhRY2FiWHk3S1p2ZzN4aklIaHdWeENjbURxcEppOUd1TjdC?=
 =?utf-8?B?MEI0eElKL0l3bkpTS1grSDg5enVrSHdEUXUvZWNWYnUrRmwwdVR0bi9XWm5r?=
 =?utf-8?B?SlhzbEd3Yk01Wml5Vk1OdTVwOXRiLzQyeWVrQWR5VndscDM3Y0ovVVdXQlVw?=
 =?utf-8?B?ODFPVzUrTVJabFM3NDFicFp1ZTFRSmhaVXNYUnFaRFpma2wrcVM3Q0hNd3du?=
 =?utf-8?B?VFZ1UWpVOGRTbnJkSFdnSVZVTGFHMDhyTWJ3RVVKWlpWOFU5NHNyeCt6SHRJ?=
 =?utf-8?B?SmNZWUNJSS9uN2JUT3ptRUN3M3huanZNQkR3SThtUzE0dWQ0dERZMkcvRTRT?=
 =?utf-8?B?clRxUGRXV0VwTEF0UnNhSGZRS3FVNHRZcTllL1NwcE1Hcms5cHZuWjFtL0lU?=
 =?utf-8?B?eGh1TEphWERxT1djaHlraG04WmNOaTFqSXZLNnRoZExRRXIvanlGaCtuSnBw?=
 =?utf-8?B?Skh1ZUhubUp0aWJvdTAwNnltVFU5b2VGcXNHWFFIeldFQTJ3ZHlnaFBJWXlx?=
 =?utf-8?B?TmpOQ3d6NHlkS1JGOFBxS1VTTXdyeFNXb013VDRzT0hXZmVpa0NFMnUwTHdi?=
 =?utf-8?B?NVN5cHBjUkdOaE5aUXZRYzhxQzVDY2NZWGNaS0U3VjJLMnlsT0Z6WFg3b2J2?=
 =?utf-8?B?NUVscUVxR1ZzRW9haHkrRVBhTHUzc2cvTkFhRU5kVjJzL2lzTFJlaFIzWTNW?=
 =?utf-8?B?Rld3dWZzMTJpN2ZZRkdvY2hHVHhmMGM1OFZzMnVrRVNmVnBDbGRHQ00wM2R2?=
 =?utf-8?B?blNZd3pUTFNzNUdPN3U0RXBJWVBrRmhCL0swYm40anhORzFRZldkUUpVeW96?=
 =?utf-8?B?aXJqbkFUK1dwekI3Q2N2U29XMXloQU9OWm5kb2pHTHJ3UUo3dVRkQ3grbWtK?=
 =?utf-8?B?UHFkWC9JelVEYXJDMG5CTlArcko2aXZpS2I0Rjlva1JCSFFkY3pNdFMxWmV5?=
 =?utf-8?B?UkpkSlpOODg1b2V6bm9UaHFLendWUmFKa2h3MGxHYXA2SzdVZFVIbFhrQ3Bl?=
 =?utf-8?B?UW15bmZueThhZ3EwZnk4dVdVc2ZTTEpScTBzSGtGc2RVMTc2bkEwanp6V01Y?=
 =?utf-8?B?dUhXaUJ1dnZQUDdudnVXV1hzZ1o5cnpXTkZsektUYndLV2QvOWQvb3Bpejgx?=
 =?utf-8?B?Tk9tUzlmbzdqRmJHdENuV3laVUtxdG1Bb3ZXSWpkQ1loWDZrckt4dXNaM1hJ?=
 =?utf-8?B?am1JRWFxYStRMFhpUytoUzVnTk1CYVBQNEdpbldIbXRqK0R5YWhHOVFDTjNE?=
 =?utf-8?B?ZE93a1kwWU8rUVlnNUxuNmZsWlhLRTAyL3VCaW1qNnc0NmhXYXZReUtZYUJj?=
 =?utf-8?B?aUE3a3JoNkFSazM1ckErc2JDbFBTNVhYVVpZV2dGR0tlTmVLZVhIYmM2akNZ?=
 =?utf-8?B?Z3RzcUNHUlBIQ2ROd2FvZk9VcGVhYi9uZVZxYjRRaUwwMGFidVltd3IybTdB?=
 =?utf-8?B?dWFoZzZlSUhKUzVIeTZ3N1ljNHpRKzBWa0VDQlkzcU9lcUpSSjlZZWc1UW0v?=
 =?utf-8?B?Mkd2aWZtb2tGRzgvS2txb2lINHZ5aU9tM2o4eDJVUjZ4S2R6d3QzRURrNGFR?=
 =?utf-8?B?WEVjT0JXMFhHcjdUTnRHbWxKSEV2cW1ONWsySzlwTGJ3UUdGQnpraGVIMVo0?=
 =?utf-8?B?aG1BdmRrTEcvUnpiK294bEFZeG4wM05CdGNZOC9jMXdWVDBvRnZkYktsZWhy?=
 =?utf-8?B?K0VhUEgzY2g2djJxeW5rVkxndFg2SnFzWEtCYksySGM1V0d0MDZyTG9jVm8v?=
 =?utf-8?B?YmlxZnJ1MHZGTjFGZFRpZzFXTkgvQkJDNExnOG1KRkJ1cnBoaVQ1OGpQQlps?=
 =?utf-8?B?S3h0L2lCZVU3czU5NGZmZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NnU5czgwMXc5OEpERzlOTnBYWUV0NGZJYjFCMkRJSU90NXd3L1dZZ2Zrc2Nr?=
 =?utf-8?B?cXdkRTBVcFFBcjFEREg1aXN5U0tPS0tZb0V6cjE4SlJndEFSS2pUSkg0R093?=
 =?utf-8?B?RWNTMzBtaHRsWW1mOXFNKzVoZE1teWQ2OE9zVnBNc3pBZmV3R1NoYUN5QXBv?=
 =?utf-8?B?dEhkaG5TUS9iR2k3L1dUZ1RrSDl5SUdOSjBlTFhodWVjSERXamx3N2FDNEhZ?=
 =?utf-8?B?YThFdzNUZzA3UHhnNUZJL2thWUVkeER3ZHJpRmQvRDc0UWtBM2VVay8zQzE5?=
 =?utf-8?B?Ny94cEhnNjBkUk5ob0VzdUJQUGdQdnQzVTVPcWJlREJqMk9WbnpWdUpVVk81?=
 =?utf-8?B?ZlRxODhWSFBNOU5Cd2F5WUtZUGp5Y25sdGtJa25WQWNFNC9jakowb2F0TXc2?=
 =?utf-8?B?OWdjWVJzOVJqSHZ1ZDhNY29hWFNOdHc4T0FDWnd2aXZZTkF6cUc5ZlA0elFW?=
 =?utf-8?B?cjhmZ1V4MTUvZTJnMjlhdExFeGJVZWhmRlRKMXdKTUREblZHVTAycThvL3pG?=
 =?utf-8?B?UVlxM2taS2dESGxkclZReUtCcjBWNzdUVVMzM1lHZ3BmY0hJdWJhWHBmMkdj?=
 =?utf-8?B?S2UrNlYwdjk3djNEaVlnb1djOTM0V0NvK0ZWRy85S2dwbnZBQ1NORHZmOHZF?=
 =?utf-8?B?S3AwMzV1WnRXWU9CbGRIamFqd3pGZ3k0aWxRa2FzcFo2ZGtJUUNlemZYWE9z?=
 =?utf-8?B?TDU2eDl1Vlowc1d5c1ZkVWVqeVhLTXFFT2t4c3JKT0x4ZC9Xa1BRTElCZmVr?=
 =?utf-8?B?SHYya05OV3V4c0JmMDZOUjBja3RmckJWcHJ0dGdzcTdYRnpMbVVWUDBCaGVr?=
 =?utf-8?B?MStRNEc3Qm5BRXhxYlpwanVxNnpQZENwZnkrdnczeVErUk9ZTVRjQS9BVXJQ?=
 =?utf-8?B?SnhIQ0NBaTlzUGNmSk5WT2Q3MTBXZDVzcjZSZnFLYWVTUWZJM2I1VkEyVmdL?=
 =?utf-8?B?S3I5bjVuWGlpRnphTU9KNnJVdUxHZmlOU2hIam1MaGl3aERHUFQ0TUdTZDhP?=
 =?utf-8?B?YWs1eXZxK3B0KzNRZm9DamJ0SHNEdkswaEVRMHl1SUQ4Q3RqN2hiWnUvSkpl?=
 =?utf-8?B?bmdIbzQvUTMrVHRnRlMzUjFUUFp4dGRZMTNGSzNmaUszNFZWRld3em1kL2Zo?=
 =?utf-8?B?cmV3QjdLa3FLQUdycVZJZHg5U2pPNkh0bFE4LzZ5d2YxbVQ5aVg4VUNZTTRi?=
 =?utf-8?B?cDcxVGlTaDV3ZzBFdEd4bXhVUHdWUWRjcHpKM2VXOHdUMGt3TU9uMGlQRk1S?=
 =?utf-8?B?dk0wZW5xalRvenlLNTlWLzVWT1djYWEzam1Fd2xRRSt0akx5T3lNNVM1dW84?=
 =?utf-8?B?QjFmWFBMVU9Tdk02bmRhVG9tZFpWbVRwR1B6Q1Nmb2tLK1pEYjhaMHhadG03?=
 =?utf-8?B?bmhwd2psN1ZBS21JT0FYVkxDdE4vdGhyNkFKNDVZb0x2ME44M01IazUydkFw?=
 =?utf-8?B?SkJaSDMxZWtXcm01WmxnazZRRFhLR3JlZnUxT1JER0t6aFVSKy91T2Jsb2RT?=
 =?utf-8?B?aHVTMnVIYXltbFVyN0owVEIwSFJBMkJPRi9vVWVCTmJMT25PZUFiZzczNDFV?=
 =?utf-8?B?Y2xRbkE2VktwSG8yRE9nZW1TeXFndWUwTC94bUZnN2FSN0dhSDMyWUxmRWhD?=
 =?utf-8?B?VzNZQXFFQ3FVMHpCa0tzSXIySHpvL3hWUXd5UkdiRFpXUU56dERWK1J4b0Rv?=
 =?utf-8?B?OEVxS0xkUkN2VDZTT1k2T3Iyd2V4VUlXMVhaMDhwOFFNbm1IQ0dKdmxNcFkw?=
 =?utf-8?B?RHZNV2FQbmxCeFQ5MzlUeC9jWEk5dVBjZ2tncjZmY25uOHpXZjNxVXJXc1lw?=
 =?utf-8?B?MGxzVzlMRGhtaS9BakVhaFQ3ZFlVbDBOR3ZiVS80OUZNM3lFMi82aDFjYVJZ?=
 =?utf-8?B?ZHJxejRkcE1FYzFxSGFzbFNjTkNpWVpFS2JWL2xkdDBBbzhOU00zZFVZTVlB?=
 =?utf-8?B?cmRla2haUVF3K0JabFZUUVJRUmxka3dGUmIzM2JKQWlMUkNPWWpGdzlQRVd0?=
 =?utf-8?B?bjd3aG9OSHV5aGFPdXBzVVhpc1ZtUVNGM2NGQU9LZi85bUx0dHRNaE5qbXdr?=
 =?utf-8?B?ZlhLRUFaVWM4ZTh2WGUrcC9DUGRVZjNVNmlhNXdTZ0p6QnlIM0p4YTNmMUFk?=
 =?utf-8?B?RTEwSGhOTjdNNlZuQldvM3pDM0ltUnJDeWJWZWNFajhOR1ppd3lyN2R5V0VL?=
 =?utf-8?B?eUE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f02654e-76a3-4465-5080-08dd190dc7f3
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 11:28:33.8365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C+exEZLIp7mwsXGHQvwkXQpV0mzneoTv9B+zUEY3PBRCDcS5WguzJA+L8+FEMRoZcjiBw7eQgPOZmE6WcAi/VA0ZKmn4e/VKeWfjbQrqmJw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7336



On 09.12.24 19:37, Andrei Cherechesu wrote:
> Hi Julien, Grygorii,
> 
> On 11/11/2024 12:33, Julien Grall wrote:
>> Hi,
>>
>> On 01/11/2024 15:22, Grygorii Strashko wrote:
>>> Hi
>>>
>>> I'd be apprcieated if could consider my comments below.
>>>
>>> On 30.09.24 14:47, Andrei Cherechesu (OSS) wrote:
>>>> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>>>>
>>>> Introduce the SCMI layer to have some basic degree of awareness
>>>> about SMC calls that are based on the ARM System Control and
>>>> Management Interface (SCMI) specification (DEN0056E).
>>>>
>>>> The SCMI specification includes various protocols for managing
>>>> system-level resources, such as: clocks, pins, reset, system power,
>>>> power domains, performance domains, etc. The clients are named
>>>> "SCMI agents" and the server is named "SCMI platform".
>>>>
>>>> Only support the shared-memory based transport with SMCs as
>>>> the doorbell mechanism for notifying the platform. Also, this
>>>> implementation only handles the "arm,scmi-smc" compatible,
>>>> requiring the following properties:
>>>>      - "arm,smc-id" (unique SMC ID)
>>>>      - "shmem" (one or more phandles pointing to shmem zones
>>>>      for each channel)
>>>>
>>>> The initialization is done as 'presmp_initcall', since we need
>>>> SMCs and PSCI should already probe EL3 FW for supporting SMCCC.
>>>> If no "arm,scmi-smc" compatible node is found in Dom0's
>>>> DT, the initialization fails silently, as it's not mandatory.
>>>> Otherwise, we get the 'arm,smc-id' DT property from the node,
>>>> to know the SCMI SMC ID we handle. The 'shmem' memory ranges
>>>> are not validated, as the SMC calls are only passed through
>>>> to EL3 FW if coming from Dom0 and as if Dom0 would be natively
>>>> running.
>>>>
>>>> Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>>>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>>>> ---
>>>>    xen/arch/arm/Kconfig                |  10 ++
>>>>    xen/arch/arm/Makefile               |   1 +
>>>>    xen/arch/arm/include/asm/scmi-smc.h |  52 +++++++++
>>>>    xen/arch/arm/scmi-smc.c             | 163 ++++++++++++++++++++++++++++
>>>
>>> Could it be moved in separate folder - for example "sci" or "firmware"?
>>> There are definitely more SCMI specific code will be added in the future
>>> as this solution is little bit too simplified.
>>>
>>>>    4 files changed, 226 insertions(+)
>>>>    create mode 100644 xen/arch/arm/include/asm/scmi-smc.h
>>>>    create mode 100644 xen/arch/arm/scmi-smc.c
>>>>
>>>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>>>> index 323c967361..adf53e2de1 100644
>>>> --- a/xen/arch/arm/Kconfig
>>>> +++ b/xen/arch/arm/Kconfig
>>>> @@ -245,6 +245,16 @@ config PARTIAL_EMULATION
>>>>          not been emulated to their complete functionality. Enabling this might
>>>>          result in unwanted/non-spec compliant behavior.
>>>> +config SCMI_SMC
>>>
>>> Could you please rename it to clearly specify that it is only dom0/hwdom
>>> specific? Like SCMI_SMC_DOM0 or SCMI_SMC_HW_DOM.
>>
>> I expect this series to be just a stop gap until we support SCMI for the VMs. Once this is merge, I don't expect we would want to keep a Kconfig to allow SCMI just for dom0. Therefore, I am not entirely convinced the proposed new name is a good idea.
> 
> AFAIU, Julien, you don't agree with renaming the config, nor with moving the
> support to a separate folder since it's something temporary? That's my view
> as well.
> 
> These changes do not introduce support for a layer of mediators for
> interacting with system firmware, but only for one simplified implementation.
> So I suppose the patch set that adds that support also creates the folder
> (named 'sci' - per Gregorii's proposal - or 'firmware' to align with Linux),
> and the required config.
> 
> But I'm up for doing whatever you consider more suitable.
> 
>>
>>
>>>
>>>> +    bool "Enable forwarding SCMI over SMC calls from Dom0 to EL3 firmware"
>>>> +    default y
>>>> +    help
>>>> +      This option enables basic awareness for SCMI calls using SMC as
>>>> +      doorbell mechanism and Shared Memory for transport ("arm,scmi-smc"
>>>> +      compatible only). The value of "arm,smc-id" DT property from SCMI
>>>> +      firmware node is used to trap and forward corresponding SCMI SMCs
>>>> +      to firmware running at EL3, if the call comes from Dom0.
>>>> +
>>>>    endmenu
>>>>    menu "ARM errata workaround via the alternative framework"
>>>> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
>>>> index 7792bff597..b85ad9c13f 100644
>>>> --- a/xen/arch/arm/Makefile
>>>> +++ b/xen/arch/arm/Makefile
>>>> @@ -45,6 +45,7 @@ obj-y += platform_hypercall.o
>>>>    obj-y += physdev.o
>>>>    obj-y += processor.o
>>>>    obj-y += psci.o
>>>> +obj-$(CONFIG_SCMI_SMC) += scmi-smc.o
>>>>    obj-y += setup.o
>>>>    obj-y += shutdown.o
>>>>    obj-y += smp.o
>>>> diff --git a/xen/arch/arm/include/asm/scmi-smc.h b/xen/arch/arm/ include/asm/scmi-smc.h
>>>> new file mode 100644
>>>> index 0000000000..c6c0079e86
>>>> --- /dev/null
>>>> +++ b/xen/arch/arm/include/asm/scmi-smc.h
>>>> @@ -0,0 +1,52 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>>>> +/*
>>>> + * xen/arch/arm/include/asm/scmi-smc.h
>>>> + *
>>>> + * ARM System Control and Management Interface (SCMI) over SMC
>>>> + * Generic handling layer
>>>> + *
>>>> + * Andrei Cherechesu <andrei.cherechesu@nxp.com>
>>>> + * Copyright 2024 NXP
>>>> + */
>>>> +
>>>> +#ifndef __ASM_SCMI_SMC_H__
>>>> +#define __ASM_SCMI_SMC_H__
>>>> +
>>>> +#include <xen/types.h>
>>>> +#include <asm/regs.h>
>>>> +
>>>> +#ifdef CONFIG_SCMI_SMC
>>>> +
>>>> +bool scmi_is_enabled(void);
>>>> +bool scmi_is_valid_smc_id(uint32_t fid);
>>>> +bool scmi_handle_smc(struct cpu_user_regs *regs);
>>>> +
>>>> +#else
>>>> +
>>>> +static inline bool scmi_is_enabled(void)
>>>> +{
>>>> +    return false;
>>>> +}
>>>> +
>>>> +static inline bool scmi_is_valid_smc_id(uint32_t fid)
>>>> +{
>>>> +    return false;
>>>> +}
>>>> +
>>>> +static inline bool scmi_handle_smc(struct cpu_user_regs *regs)
>>>
>>> I propose to add "struct domain *d" as the first parameter to make it
>>> more abstract from Xen internals.
>>
>> I am not sure to understand why we would want the call to be more abstract. This function should *only* act on the vCPU currently loaded. So it makes sense to use "current->domain".
> 
> So this should stay the same, right?
> 
> @Grygorii,
> 
> Regarding `scmi_is_valid_smc_id()`, I will make it private to the
> SCMI-SMC driver.
> 
> And regarding squashing [v2,4/8] to [v2,3/8], IMO it is clearer
> this way: to have the implementation of the driver in a different
> commit than the usage/refactorings needed to accomodate it. And
> this makes it easier to revert the behaviour too, eventually. But
> I don't have a strong preference on this and I'm open to squash
> the commits if you believe it is better that way.

I'm ok with other comments - means it's up to you and maintainers.

But in my opinion it'll be better to consolidate the scmi code in standalone folder from
the beginning to avoid possible future files moving/renaming. It's optional, new features
and it looks not right to mix it with generic Arm code.

Best regards,
Grygorii


