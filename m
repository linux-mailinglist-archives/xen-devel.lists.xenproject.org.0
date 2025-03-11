Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B335A5C442
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 15:54:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.908263.1315398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts0zZ-0003Cp-Sc; Tue, 11 Mar 2025 14:54:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 908263.1315398; Tue, 11 Mar 2025 14:54:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts0zZ-0003Ax-PY; Tue, 11 Mar 2025 14:54:01 +0000
Received: by outflank-mailman (input) for mailman id 908263;
 Tue, 11 Mar 2025 14:54:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0SOU=V6=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1ts0zY-0002gh-6Q
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 14:54:00 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20625.outbound.protection.outlook.com
 [2a01:111:f403:260d::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a95ece02-fe88-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 15:53:58 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by AM9PR03MB7629.eurprd03.prod.outlook.com (2603:10a6:20b:410::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 14:53:55 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 14:53:55 +0000
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
X-Inumbo-ID: a95ece02-fe88-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i2LI6gTd7v8o21XDcA3lkKxPfEaCePUobFGb+kMz3LeaS8FZNEdUt8h2cBk0EoBwNmkO2ykY3EoFdCS6SRqT+T0oMBLTQY0+Vl1KmGqz4pvh/V9cfuC2hGgiJ3Eld8DVgU842L9JFcdX0MzrEvZe0kHuMHsb1zzIJVtFRRsBVxl+LL3PUW4o1x7NnSvMwHFgFKeS1AnHWK6jOEiE1xh30iX93J6OJONJze35kC/VEAVGnRRzU7TazDsQ/c20JwR0fZ4JGlPpT38v9of+3aiO9/2w/SuJbUDo8IFKbCHSwR/WHoaSsSr9vvDGo9HKYamIiYCYPHJ4EnsLFYeq2RklMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TPiOWTADMFfF8gky0m9wHObBf5t4ppPwV4JxEm2d9nc=;
 b=tU9XsrSrJCe5B7ltiPDnSGhg9iqImek/ew7EqLF/QeQ90UbsieVma7PoVMypCnYZgYUewd7voOnBagZ0E+6vNhL6utS6Wfaj7FPjht4MOAGCXiDPv0Z9opyI6hRNx24xZZLafFSBYUMRGTnCcfoAiSD8T4hrR8YNs0KXr09SJSyhv87YgMGy8pXkb+9gyqO6QO9TLXWgvMZkCBtq9iwtn6eKw/1hQUzaKpkMu7KXc26nMsAKSUqkNvs8+h+cJS86tLRSyD+5L46vtTp9rR57ksjObnAQBmPTvNvwH1SdnJXtz4JI7GKN+DqvRtmf6uNolarGB/TeVxmHiHgm4QNwTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TPiOWTADMFfF8gky0m9wHObBf5t4ppPwV4JxEm2d9nc=;
 b=oM01Bj0/rNNviLHV07kLPHXwmSQnjRnT7nvH+uqm23vvUoe4nw3l8aOG1qLSa1f0R1og3Esm5vKhkKI6PUUhhI1B/d9oaVUonkySWCmu1SrNjaJ3ypGZkHM/8avzKr5J/Shp6D5D1dHLzTXPPN0dQQpvxq3PqjUwdFJQ0wTj7ymGf6Sm7/bLY0bhSg1ZsAS2SHsHItH4YZ6Ihtc9s4SXQXObmQnuuEIvHShYKtB7UKANJOJUm8ZCXWIphKDebDVetdUHa3Iw8fbhZXpltG3NuwVsPMZSj8OWOioDjC87ZamW8k+SGiawSAL7D05IhykLzZ2ejtwbTxk+AZ2eWCDRcg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <d7fe19f2-f8ac-497a-833e-44a04e1ca4c7@epam.com>
Date: Tue, 11 Mar 2025 16:53:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/iocap.h: add documentation
To: Jan Beulich <jbeulich@suse.com>,
 Grygorii Strashko <gragst.linux@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Roger Pau Monne <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20250224113828.151794-1-grygorii_strashko@epam.com>
 <83d5d612-2f6a-430a-8aee-4738f43204e0@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <83d5d612-2f6a-430a-8aee-4738f43204e0@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR5P281CA0005.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f2::18) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|AM9PR03MB7629:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f4b623b-388c-4b1d-fcb4-08dd60ac8bae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bTFmZ2ZLMTBuQmhNbXJhUEZNNHdEa01ocnFBME0rTEx6ZmJIaS9PQmd4enRq?=
 =?utf-8?B?SnNKeU8wWGtJQ1poK3g5QWJ0U3FPSlVFNFlrclVraVFpeFRvaXBnZDU0UlYx?=
 =?utf-8?B?Q2ZzaGhrVUZvbEEzQzRNeXpTWDlmNFJxdVFYNEhmd2g1aTJqeS9tdjRyQmdm?=
 =?utf-8?B?bThYTlo2UkFscGdoRWsxZVIxKzR6cUQyU1kvRTcyOW5Gb2c2V0UxOFhyY3dY?=
 =?utf-8?B?MG9LYktDU2JYcXJsVTNjMDF5UTd3a1Y2WjJwTVJyWmM5STB6Z3VnbGpIVlJU?=
 =?utf-8?B?UGFKbldROU9vUmxjUDlEWlNUUDE1TFFKYzFVTXRRdlBOZ3hoNjRZQVRMOVY1?=
 =?utf-8?B?anJZUzdmRUpHak9rT1hSZ3FvS2VNRlRKRDN0YWlBeGVDMEVyYjJ2SmJrb3lj?=
 =?utf-8?B?dG4vNVlZTVpKbDhSNDZNakt6ZGJXT2JUNHU5bXNuTXVyN3ZSZE1DR0ZrdTY0?=
 =?utf-8?B?cEF3enFhb2UzMmNzVDJjT05wRk1UNWhnbDgxSk9DT2xLZkY3SzA1UFRQR054?=
 =?utf-8?B?SHZxSjdBQTNOS09WbnRnb2NlUXJCN3JobHZiRmpHVTdLZUdiS0J1dTl3alFS?=
 =?utf-8?B?MDh3a0hJL2FWb1RUaVZhTzFTdlNySm5JazhhQVg5TEpUa04vUjFXNUkvODVW?=
 =?utf-8?B?ekloZWphOXQxS3lvV3F4eGV6SnRTc29UYkxEbjdESDZyTW0xbG1teXRCTElt?=
 =?utf-8?B?YnV5NEhhSnl0cGx3Zkg4dSs4bjRPbXBtTGNrT0ZWOVVsYlV0VFZLaW9LeVEy?=
 =?utf-8?B?S09jTDV0OXplY0R5TlhwRzlCam8wMU9WQ2hudEFXNEMrdW5NUjkrSnJFOG0x?=
 =?utf-8?B?V3ZHR3F2WU5SUDk4YzhtQjJXWk1VN2NDVitPQWJpL2JRWlRYQ3NLQkd2amxr?=
 =?utf-8?B?aUxsSFR3RGpzU1FoTE5PNjdOd1lWZitUMmxBSVl2Y0xCcldSbmpnY3l2S0Qy?=
 =?utf-8?B?OC9HcXhZRHFtbHZuUG83VnAxVzVuTDJTc29qQml3S2FjWWNaZ1ZWcWNzNno1?=
 =?utf-8?B?ZmgxS0d0LzdQcmUwVlFXMEdLOEw2Q05ONEhjOWJOeDc4QWRkTFNPczlXaHQ5?=
 =?utf-8?B?dng1eUROTzdBbTBYdHdhVzArRHVjaXU5NG01eHY5bGVhcEZuSDNoNysxTlA5?=
 =?utf-8?B?VWxBSnYyUExZSTJRellXRFdXZ01xb3Q2UUttOE5UMzA3SUJWWmxnbmRKRm5j?=
 =?utf-8?B?TVd4YTdXeWtpeUw3YmUwQmFmR1cvVFBLcytnbmdndnpmdTdUTlBzTnl0TXVO?=
 =?utf-8?B?aXF1V3RlUHk4TVVES2xuem1rb09PazZqSGdRZU9WM3ovdkdKdDJOWWd5UHpO?=
 =?utf-8?B?V2djV1Y3S1gwcW9JWU1UdHJEZUxpYXhWSUZYRVRTeXZHL0djSk1LOFA5UEdC?=
 =?utf-8?B?Uzh5dGhGOTd2bmJBd1hzV0Z3Q0tQUXhnUVhrSm5LaXRsRWsvNWhBQ2RYaGx4?=
 =?utf-8?B?cE1Bb2xWc1FtQWtoejBWL0xzUXg0cUxzc1BKL2JjZ3c2TmZGbEVTVTQ1azF1?=
 =?utf-8?B?R09nNG9GZERGOHQ3Y1pYdVJiUVF4M1puRHN6TUNUeEhubnNnSW1TTUtZcnIx?=
 =?utf-8?B?SjJla2w3ZnZPSk41NU81YUU5WTlWdldrSExWVnRTSnFQdTMxWU5YOEJCNUxL?=
 =?utf-8?B?cm9HMGFJNngyMFM3UGZhYng1UkozTW9aWG5BYk5jUFFCSW1VMEFhVzVqdlZk?=
 =?utf-8?B?TnNNVkV3MVdOckltY0piMjFMWVBDU0VPa0hzQmhXN2dCUVpibUdyeFFEaFhl?=
 =?utf-8?B?SVBBNmZ1MHkzK3E4allTRks0TVlUVHJKNTlDUVI5WmlxdnNEMFZsYll4TW05?=
 =?utf-8?B?eFZRY3ByM01IOXN2ZGRzRVIxZnU1MjlSSzdyZnJ1V0lGOTh5MUphTGgyZGRZ?=
 =?utf-8?Q?o3g+PpOAoaBIt?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWJDWFZ2OVBSQm14TnQvK2J5NnBvZVl5RjZ2aUEvTjZMRUhoUlBWRkxFZ2Jm?=
 =?utf-8?B?ZEpHRTVHYVYyYzBFcHVNVnd5dmJvd1VNRVlYYksrcTRHSERuazROTjk2SzF4?=
 =?utf-8?B?OG1PTnBGdkROVk96OUFZaUdzT0ltSE5wQ201ZmJaaEMrb1VxamlkT1haWTJJ?=
 =?utf-8?B?U1VDUlFoZWQ2ZThYSDlEZUhXZHhNUW5ZaHRwSGw0dVJ5T1pHU3l2SG95Zzht?=
 =?utf-8?B?M3I3dVVjWVZvYk9Cc3BrK3gzU0FzaDFHd0ZoaXFWd1hkbklvajh0ZVhlWEhQ?=
 =?utf-8?B?UkwvRUZTckFseTR0c2VySVRBb1FEK2pBa1JCR29lTTFMTFUyelJ0R2t3VmI1?=
 =?utf-8?B?cnZsbjZpelp4b2pyNHZ1LzFvSjF3VjhYVU1qYXFCQWtTemVhZUJDdUg0Qkl4?=
 =?utf-8?B?S3F5S0xaa2daZ2VRRFJLS1B6TmtWUWRSYkhuVXpGc0dWVHhiSnhzbTFSZnNq?=
 =?utf-8?B?cDBTb01teEwreStQYUNxZWhENGNKRi8wTjlTS1Z3Rk0zR2lrOEJBVFhBellI?=
 =?utf-8?B?LzVDL3dYbnhsSE1LQnE5b3VIZEFHVGNWU2xUZC9sV3BJUFVLSWxuTGZSUHNq?=
 =?utf-8?B?c0VvVlk0K29HaDlkRS9KWlBSaCsyQ1dOQUdQbjBYZk5kSVRVajJmeElTQ1Qv?=
 =?utf-8?B?ajVzVk51RFh6clp4dUVjZ0hRQS9kdVBaU1hQaEQ5NzRVS3dsUEVZRitJVG9a?=
 =?utf-8?B?V3VPempYc1llb0xERVEvYzlnUXVCbDJrWXE3N3RERFFJSjQvMHVsOWdwL1Az?=
 =?utf-8?B?cyt5OXppdFhnLzdiNW5DRks3S0xHTWFJWWxEdHk3SWVBTlZaR2VReHlub1JT?=
 =?utf-8?B?QzdWRWo4UFFvZGc2VFE4ZWJTeU5NUFlkdmFTVzBOOWh3SUhHSVdVWGFGcm9Z?=
 =?utf-8?B?VTNVWDFQdnpzMzVoS3poakZOaEhRak83b1hnR1RsWkVyZXJ1Y2o2RlFSMGtS?=
 =?utf-8?B?eGVtaVg3ajdDU0V1RXcwdFF5L0dubUl3ODk5T256bE9nUWxRcmZvZXMyWmJ0?=
 =?utf-8?B?NWpreDJkQklvNVlMdVNqTWtROERoWlV5V0JwcS84eWd6ZGtXVTVpNHBPa04y?=
 =?utf-8?B?YUhQMnU2aFBDQ05DeHhGd2w5YTlPbnExU0JBWjlqMi9ZdURmcHhIOWlhODFR?=
 =?utf-8?B?N1I5V2R4cDZ4WDBORERzSytOM1BwRWthVlZtV0RwN29USFBtMUxIMkJxTVl1?=
 =?utf-8?B?b2Y3STRCKzRhK1pwTkRZTFVKTWxuRmUwZjd5MktCOFJIVmZIRmtQVUl1Tkxy?=
 =?utf-8?B?MGlVWDN0em40TUhEcGNWanZ6MWxjYm9LeXBtMk91MjJ4ZWVIZ21mR1BLblph?=
 =?utf-8?B?UVdXcERkWDlhSUU2VkR4ekpZOXlhdkhVV0dIWVpsd0cxbENuRzVHek5iV3ls?=
 =?utf-8?B?OEFUUnZaWFBIWWdQMTJES3dDQTlUN2tSMU5VVkxCK0hVckZveG5LZU5EakdY?=
 =?utf-8?B?NGJLSnpUM3BST0tnS3A5bDNzajZKSm1NYUMxQS91aW5tazBJZkQ1dStLS25r?=
 =?utf-8?B?MGZackxpVlBBZkMzckFhOGVwMVdQMUdVZzRFdklIN1Y5Z2REamlNL0R1SENV?=
 =?utf-8?B?TVM3bHRNbC9BQnM5VjRNQTZxaFVaQ1ZCbWNxTDBkTlZldzV3VVpTY1dEaEZK?=
 =?utf-8?B?MlUwc3JjKzVmOG5xa21wdTU0MHYrbEdBdXpLMjVydEpkY1ZzVWpDMjZQK1pP?=
 =?utf-8?B?QmNpQ2NpQkZLTXhWY3FwQVZxa0ZMRmpQMFZsVVNpcVNqQ1lTYitybTVSQ3lC?=
 =?utf-8?B?N216ZXA5NTdMU0JwT2EvWXVMdk0ybTZQWGMzRXJUbDdJSzMxSi9CT3dNUjFP?=
 =?utf-8?B?Sk52NVkwNk55alh1OWd5V1pwTXpRV05IU2VmT0d1UHJBN3pIRFpDdGdQWjR1?=
 =?utf-8?B?V1hIeGhoTjZuVmdNN3YyZ3BteGI5K1JtOXNXYjFNR0tQUHBUajRUdnQrNUMz?=
 =?utf-8?B?czhHZ245dVZkSHVyUE9KUkNDSFB1c0c2eUxUOFpNSENrSGxZZ3I1STFpK2NY?=
 =?utf-8?B?YkppYStQdFNhYTN4RE5QVDJNRHVjeUFuR3F3L2F6bnVSblhtZWdjNkJtVW95?=
 =?utf-8?B?UUFiN3g2N2lnejJSTGtZOElGVnRmYldzZi9wL05DL1dlUzVETkFDN202TmVY?=
 =?utf-8?B?VlhWQldyNCtRd0pjUFMzenFFY3ljQXNWTy9adkdLanlGbW5VemJvWDV4RDBt?=
 =?utf-8?B?Mmc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f4b623b-388c-4b1d-fcb4-08dd60ac8bae
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 14:53:55.2194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pvNH22bEaF3qpX3lQ+vPMhp3PA6THldG4fJa1Xr2XSX2zfjwZQtvw4L/B4/zUftWkOn8LCmbfkeJeQPxuMV8KXphAcHZPe3u/fM/Y8va8mU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7629

Hi Jan,

On 05.03.25 12:37, Jan Beulich wrote:
> On 24.02.2025 12:38, Grygorii Strashko wrote:
>> Change rangeset parameters to "start, last" as proposed in [1],
>> and add documentation for public interface.
>>
>> No functional changes.
>>
>> [1] https://patchwork.kernel.org/comment/26251962/
>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> To be honest, this is getting too verbose for my taste. I also don't think
> title and description fit together: One says the main thing the patch does
> is add doc, the other says the main thing is the parameter renaming. When
> then there's at least one further parameter which is also renamed, despite
> not fitting the description.
> 

I can update subject and commit message and resend.

Or you want me to drop some parts?

[...]


Thank you for your review.

BR,
-grygorii

