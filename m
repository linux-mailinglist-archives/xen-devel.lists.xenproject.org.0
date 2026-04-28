Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QI/TNFmJ8GloUgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 12:18:01 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2BF48273C
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 12:18:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1295532.1572198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHfUw-0001IM-PM; Tue, 28 Apr 2026 10:16:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1295532.1572198; Tue, 28 Apr 2026 10:16:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHfUw-0001GH-Lt; Tue, 28 Apr 2026 10:16:58 +0000
Received: by outflank-mailman (input) for mailman id 1295532;
 Tue, 28 Apr 2026 10:16:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1wHfUv-0001GB-H5
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 10:16:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHfUu-00H9CO-DA
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 12:16:56 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 69f08911-e002-0a2a0a5209dd-0a2a45019c94-46
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 12:16:56 +0200
Received: from [52.101.69.84]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <milan_djokic@epam.com>)
 id 69f08918-c1f2-0a2a45010019-34654554361e-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 12:16:56 +0200
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com (2603:10a6:20b:595::7)
 by PAVPR03MB9775.eurprd03.prod.outlook.com (2603:10a6:102:312::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 10:16:54 +0000
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5]) by AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5%6]) with mapi id 15.20.9846.025; Tue, 28 Apr 2026
 10:16:54 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uX1vJ/ggqv5NSilCVnxHdYcNo9R0u18MRzmxc0Tk6qceyTd7P+UC7+sZIUBWtCuR5e/7H9c4itc6DNbdAthaMtt/QO3l+eQ16cFPQtwJMx1+gxDnmmBn80eyg9r0DJxGQ9gSwmkBraDhOc4OqL5ezi7A/CO/UKiVPdPckWeqj9SGgyRTorUgET3+fLg/Q8vVM30LodncJKccViSJ6qQq4wJCEpEDoVZTkX1Emgh+gnl4hsJ7E3nmfRE9Z8xjkIFhqZZ2WkMXYjdOcIfTEEQBpBN09jLYtVDHOgljwF38lGTJT4URJWmMRacLJrkPpbEUpdWwR9nys+q9rmxeAFjhBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MR88q9lKDQ7Q9yXY52ZjehqGtLnr6o/5uutGZwt7RpI=;
 b=HDDUPOSAihBeu8aFNTIK8BVjzVteymSu59GHk4dFtDzkmlYZLiSOlV2gf7v+diqDqwsc5MNYeeaPQMG+QrczjuOWa2M9Zc7tNgIlP0RxcaMPRknq2XEi9abap9TF66cEi5uUTQmRV1ydrTT8zSwkxueKdVcliOSrKCl47UeB5LZ/d2opPhFQ6oQIwtKT3bTVFQPPJHYVcT1LIrUOWy/uibyk1ea/WC7Vs0gHmNQE0Lardn7l8sWeiIVBs8Qupbc/oHyW538mkG02nUUpJNmagFJQv0DRX6LZmmqbLPPv3qM8AdVD9zPbVFJbT6vyFJqRR2r+RB8A5fe079Qf0HDIxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MR88q9lKDQ7Q9yXY52ZjehqGtLnr6o/5uutGZwt7RpI=;
 b=cYThDGqSwE0+2ZYYNANFXZwQNPmlE1MR+sLRdN/7WzLv9ooE4VVt0jKLbao03d/gatn8PxkntU9ZWbXj+drinj0moxe68vsMznxCoNm3+KJD+6f72/o3jTlYGkhjT/QUyFEUogaEr82hJnEd+4AouuLXtj81iSKGJLpmOrjX4R1WmltOYJQEwB4bXnKEbPc9Aqst0Ym7eDBc+HFQt1SJapLlDhPWogM99+/c83WdrpNBkErwdUswLXGCV7xwthsUhkeAxc3twKj/Pog/kzfsqHFBU4yxxzSUWrXuOqDprFN4VCDYH4fQmNla1dHouKA21avR6FdLK4X3zfAqYkUoPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <4c96c478-aeb5-443c-a6ca-f23caf7d5430@epam.com>
Date: Tue, 28 Apr 2026 12:16:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/23] xen/arm: smmuv3: Add support for stage-1 and
 nested stage translation
To: Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Rahul Singh <rahul.singh@arm.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1774305918.git.milan_djokic@epam.com>
 <cb8a2cb5df50128f4c49d34a7ab8faa4e73f83c6.1774305918.git.milan_djokic@epam.com>
 <56a7c116-4ecb-4dfc-a7dd-774d53041fe9@xen.org>
 <87a04781-5765-43b6-8b21-cb993609bd91@epam.com>
 <cd2c76a2-7a13-4bbf-9c29-5dcf3ae06fc0@xen.org>
Content-Language: en-US
From: Milan Djokic <milan_djokic@epam.com>
In-Reply-To: <cd2c76a2-7a13-4bbf-9c29-5dcf3ae06fc0@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI6PEPF00000234.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::8f0) To AS2PR03MB9587.eurprd03.prod.outlook.com
 (2603:10a6:20b:595::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB9587:EE_|PAVPR03MB9775:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e1208b6-0265-4fb9-3226-08dea50f456a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	/bKQ3CdZRMJi6zxUJDFW7VtaRWWD29+BsJUSNyBXT0S4poJiQrtCrgUc3HtSaViaZZeW2ZCYbJ0tarmgh0NA8h8EUkn3QPz8DJ4JCUKwP8sWZ99Z87B4bwWzHdXNB/k5TxXeM7CBe/JCA3JNI2C5sFy6JVBCY3MeY1eEPS8c/LnY0vuu1pWorpaw0Tl9pq+5vPjn+f2QBHFkPwoLbUH3h9nThp73bGD5lXYdXXhEXpzLfnIDWkrj4+C908nivsjR4CoOF+VAviMVEnVPgAEGtj2aA76GpMJ1rfmaJ1NSkunnn3xwJKpWUSrCBJ8e5GUx//YZMiNEnKtoYwwW1lyghj9ER7vq0KP3knzhUKQmh5v7tv+7s5cwGbvNACbFdgNfzP1WuHpqih9b9pBXgkntOUcI01mGcM8gavu4irsqWlKGXff3VdDYA16im9zckQbDFJ/15S+GRp23AijvrkpYRWMJqa2DAqmnVK9zta/O68YnpoAJCPHdwXc/1wjkVZXbsU2ZhYhFswxfSGJH0/3BMOJ0OwdEwSzAWZAWCXelTFd74C9QllKwNfQgej56l6gNKkkgw2TViYywwaMfManXXEj6HSd83eheKpRBZtlo8akYdtvwP7Xpv6yTxE9aePmkv7ZDKdnhdGTvhSYBeZQ/ciAvHB6evmXhri+WiFnMLZOf6gBCjvHQvK+yFIbIEtIIhmRDZRUsOOVSIOsdyXQSLmBywezCDJxhO5KKelNdr5E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9587.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SVJXcGdRZTlxU2Y3NTNzVEhhYTE1dnM3dGxheEhTVG1LMTVLNTB4VzdKMVBN?=
 =?utf-8?B?TGVxOEpFYll5dk1LTU4vTlpQYk1jQi9wVnpTWDl6MmJCYmhXTytuZ0xNU0dq?=
 =?utf-8?B?cGVOT0lPT2RWMjJpVlY4c0lacUJGTkZiaU9ZeXZ6U2NsYkM3bnNsUzRCVmFE?=
 =?utf-8?B?WEh0Qlp6ZEVJcjc1RjBzQjFUZ3hRSUhsTVhiSkRmaWN2VFJNUG1DTnQwclNY?=
 =?utf-8?B?U2tHc0RmWlZxMUpKZ0FFa2M1UnFaekFoR05hY21TL2ErQXZ5UXFjeTNNSXZE?=
 =?utf-8?B?S2VuQmZVRXlpQmkvaWdEd0tZZHJXMHpjbnZ3M1ZmT1AyVmQzTGdnV2FrS0g2?=
 =?utf-8?B?dkhBbEhRTENGYStJNVN2cWNUcGUzWEhXNWZna1pBNzZrZWlWQkM1SFZUaXdx?=
 =?utf-8?B?MU5MSmhxeW9jTFdjVVZncFZmVFdDVVo0S013WlZ0WXdwT1Q0K3QzQnlOSUM5?=
 =?utf-8?B?Q3NsUmszUzhsbDN1Nm1QNDJFWERycSsrQ1p3QmNzeFNObDBRTVRocTNjNk9u?=
 =?utf-8?B?YTltNDNZWU9JRTNJMjMxbFRnTFBVZUs0ZjJtZjJHTGR4V2V2WWp5S1p5VGx0?=
 =?utf-8?B?VzYxeENBQXpFeVRjd0p2Y3J0UU1xQVZPRHBGYnAvaFlmUkdjVzVZOU03UmZM?=
 =?utf-8?B?bnJiWlY1SjlkUVZJT1BJVFhYVGdWT0NxUlNxcUUrMnE2OUk1QUtiaGQwSFlC?=
 =?utf-8?B?Z2hKamtvb0hmeWpJd3JZbndFcHFKWmxBV25EN24yNVByUU5vRW9SK1VZd1Zh?=
 =?utf-8?B?UUEwc2pObTM4bFNmTE94YTlWTThocmUyQ3FPWTdsU0E4ZloyWnF6VXN3TnpD?=
 =?utf-8?B?YjFjSGxaaHFhd2V3Q1hSM2U0Y1JiWisvL1pMdWZkTVh4ZjRIZ0ppYjcreENP?=
 =?utf-8?B?YzBSNU9FWjR3SWhTUmRRMkJ0d0N0d3VNek1jSnRuNG10elQ4VzdLc2VmdHda?=
 =?utf-8?B?a05acTI4a3doNUY5SEJjSGI1ZXgxc0hRSEwwNmh4OU90QWJ5TUJqK3FkV3ZO?=
 =?utf-8?B?amxyMG5WZTRRNEVtVWh0ZUVzMnVmeHRnMGdzcm55R0g5VVo1eEp4biswNjZW?=
 =?utf-8?B?NVBaVnByeEVyY3dGUzU3TXEvUS9yaFRaN3NtbnI0SVhIR1VGbnhrNm9jRy9t?=
 =?utf-8?B?NzJTaXpzUDMyZlBrS284TmU4SmZjcFJYVGt4N2MyNWRPRjYzekMveU42Tklj?=
 =?utf-8?B?QWRuZ09GWFhQeFhxUWVSMU1JYVRkK1UyNSt4UFRpWUFIQ2hnOCtxN2lCUlp0?=
 =?utf-8?B?QzFNay83Um8vY0lPbWszUXJHa2E2SnhjSWJneHRrZ2Q0dmZPeXJTWEtncWFG?=
 =?utf-8?B?MVJQK1pCTnpvMGd1Z3RKakJFYktDaHl1b3pmb3hZMkQ5Q2tTZU82OU5iY3c2?=
 =?utf-8?B?bndkNkZad2pUK1hJc0tScENoY29DZTVMT2hrUk5IaE00dThjZ0dMMnJHUVFW?=
 =?utf-8?B?Z2hBZWNxOUcrZkFCc0EzNi9iZVhwc2w0MmNOaXo0K00vU1N2aDhvUUFkcGRH?=
 =?utf-8?B?a0VlOXRGczljNVgzTkdua28xc2llbVNXYkZhYTBoTStOc1BOa2lHZTVFM0cx?=
 =?utf-8?B?RlA2aSthTU1yS3lIQ2xCVndkbFVKZk9SaG4zZEQ4a2tzQzViQTg5RkJBWVNV?=
 =?utf-8?B?U0ZoTWQ1eGw3NC9HT3oxeFFNS0pBTUwxRW55YVVBZkF0REhzODVKMmo2OTNh?=
 =?utf-8?B?M2tLclVWYjF3c3lDMk85bFc2TVBEOFpTL0xiNG1RMjdLRVpJdDljY01TTC9y?=
 =?utf-8?B?VE1sTDZMc3hlUXl2M3FUcmxmSXRrUHgwT0ZDYjg4NlpReXpTZ2QxTzdiRllL?=
 =?utf-8?B?amIrZjI0dmx2Mm9ETTA4T0JuV0RCZ0gzdlBRZENJMGZDUUhTVUZTWFl4eFpH?=
 =?utf-8?B?Vi9yTU15cmdDaEllRmJPNU9mRDNQTnQyVlgwWERQd0RUVS9jakpRSHNCOUZM?=
 =?utf-8?B?TnhUQTl2STh1T3lBSVBCSmJNTVY5VVZpUWU5NzRoL3pGV2t4UHFvVnRHK3Q3?=
 =?utf-8?B?cUdwWjZjYmRPWjVVNDBBSUZCR2ZuNWU5cUlvY1BZZW9xc094YUJjenQ1bkpi?=
 =?utf-8?B?T0tBLzU3eTdSQ3pyRFdhd0xrNU9oZ3FJTUhPbG1zdjR1QjMya2dEMno5MVV5?=
 =?utf-8?B?YkxUMXFQbHVSWVcwR3F5QVQ1WUNmc1VDYU1OT3p4ZlVJSFlFVDhJb09tNllN?=
 =?utf-8?B?YkVQZ2hpeC9VVkVOelJVbXE5bFJmWHhUVlNvRjNGQWVSSnlhUWFJVzhjZElG?=
 =?utf-8?B?ODNlT3VFbGFVUlh3ZTVNZFpvUzVlc25CUGg1cmlvb0N0Y01rcVN6b1A5Szhu?=
 =?utf-8?B?T1FTanlGZE0ra0lhTjZhMFVvN29pblUwOUc1bDV3cXBTTjdZWDQ3QT09?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e1208b6-0265-4fb9-3226-08dea50f456a
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9587.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 10:16:54.3294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jETIJDAkWkETJQrmjnsPlnJkrtUDLm0OKm6OJGH4hBnv8AiFfXOo8TuL5RoBCRWJXq2nIFbp2Cz2ol+MmTSGDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9775
X-purgate-ID: tlsNG-d62444/1777371416-BC410FF4-3327D90A/0/0
X-purgate-type: clean
X-purgate-size: 6526
X-Rspamd-Queue-Id: 1C2BF48273C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julien@xen.org,m:xen-devel@lists.xenproject.org,m:rahul.singh@arm.com,m:bertrand.marquis@arm.com,m:sstabellini@kernel.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,epam.com:email,epam.com:dkim,epam.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

Hi Julien,

On 4/21/26 10:43, Julien Grall wrote:
> Hi Milan,
> 
> On 19/04/2026 18:34, Milan Djokic wrote:
>> Hi Julien,
>>
>> On 4/14/26 04:17, Julien Grall wrote:
>>> Hi Milan,
>>>
>>> On 24/03/2026 07:51, Milan Djokic wrote:
>>>> From: Rahul Singh <rahul.singh@arm.com>
>>>>
>>>> Xen SMMUv3 driver only supports stage-2 translation. Add support for
>>>> Stage-1 translation that is required to support nested stage
>>>> translation.
>>>>
>>>> In true nested mode, both s1_cfg and s2_cfg will coexist.
>>>> Let's remove the union. When nested stage translation is setup, both
>>>> s1_cfg and s2_cfg are valid.
>>>>
>>>> We introduce a new smmu_domain abort field that will be set
>>>> upon guest stage-1 configuration passing. If no guest stage-1
>>>> config has been attached, it is ignored when writing the STE.
>>>>
>>>> arm_smmu_write_strtab_ent() is modified to write both stage
>>>> fields in the STE and deal with the abort field.
>>>>
>>>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>>>> Signed-off-by: Milan Djokic <milan_djokic@epam.com>
>>>> ---
>>>>     xen/drivers/passthrough/arm/smmu-v3.c | 93 ++++++++++++++++++++++
>>>> +----
>>>>     xen/drivers/passthrough/arm/smmu-v3.h |  9 +++
>>>>     2 files changed, 91 insertions(+), 11 deletions(-)
>>>>
>>>> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/
>>>> passthrough/arm/smmu-v3.c
>>>> index 73cc4ef08f..f9c6837919 100644
>>>> --- a/xen/drivers/passthrough/arm/smmu-v3.c
>>>> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
>>>> @@ -683,8 +683,10 @@ static void arm_smmu_write_strtab_ent(struct
>>>> arm_smmu_master *master, u32 sid,
>>>>          * 3. Update Config, sync
>>>>          */
>>>>         u64 val = le64_to_cpu(dst[0]);
>>>> -    bool ste_live = false;
>>>> +    bool s1_live = false, s2_live = false, ste_live = false;
>>>> +    bool abort, translate = false;
>>>>         struct arm_smmu_device *smmu = NULL;
>>>> +    struct arm_smmu_s1_cfg *s1_cfg = NULL;
>>>>         struct arm_smmu_s2_cfg *s2_cfg = NULL;
>>>>         struct arm_smmu_domain *smmu_domain = NULL;
>>>>         struct arm_smmu_cmdq_ent prefetch_cmd = {
>>>> @@ -699,30 +701,54 @@ static void arm_smmu_write_strtab_ent(struct
>>>> arm_smmu_master *master, u32 sid,
>>>>             smmu = master->smmu;
>>>>         }
>>>> -    if (smmu_domain)
>>>> -        s2_cfg = &smmu_domain->s2_cfg;
>>>> +    if (smmu_domain) {
>>>> +        switch (smmu_domain->stage) {
>>>> +        case ARM_SMMU_DOMAIN_NESTED:
>>>> +            s1_cfg = &smmu_domain->s1_cfg;
>>>> +            fallthrough;
>>>> +        case ARM_SMMU_DOMAIN_S2:
>>>> +            s2_cfg = &smmu_domain->s2_cfg;
>>>> +            break;
>>>> +        default:
>>>> +            break;
>>>> +        }
>>>> +        translate = !!s1_cfg || !!s2_cfg;
>>>
>>> NIT: translate is a bool. So do you actually need the !!?
>>>
>>
>> No, !! is not necessary here, will fix this.
>>
>>>> +    }
>>>>         if (val & STRTAB_STE_0_V) {
>>>>             switch (FIELD_GET(STRTAB_STE_0_CFG, val)) {
>>>>             case STRTAB_STE_0_CFG_BYPASS:
>>>>                 break;
>>>> +        case STRTAB_STE_0_CFG_S1_TRANS:
>>>> +            s1_live = true;
>>>> +            break;
>>>>             case STRTAB_STE_0_CFG_S2_TRANS:
>>>> -            ste_live = true;
>>>> +            s2_live = true;
>>>> +            break;
>>>> +        case STRTAB_STE_0_CFG_NESTED:
>>>> +            s1_live = true;
>>>> +            s2_live = true;
>>>>                 break;
>>>>             case STRTAB_STE_0_CFG_ABORT:
>>>> -            BUG_ON(!disable_bypass);
>>>
>>> I am not sure I understand why this was removed. Can you clarify?
>>>
>>
>> Yes. With the stage-1 support, abort is controlled per guest smmu
>> configuration, so abort state is valid and not controlled by the global
>> disable_bypass, but with per-config smmu_domain->abort field instead.
> 
> Are we ok to allow the guest to control the bit? For instance, what does
> it mean if the guest decide to that no abort is necessary but the region
> is not mapped in stage-2?
> 

If the guest disables abort and translation is enabled, accesses to 
regions not mapped in stage-2 will still generate stage-2 translation 
faults. This won’t result in bypass.
In nested mode, both stage-1 and stage-2 are programmed, so stage-2 is 
always active. However, missing or invalid stage-2 mappings can still 
occur, and in such cases generating a stage-2 fault is the expected 
behavior, and would typically indicate either an invalid access from the 
guest or a missing stage-2 mapping.


> [...]
> 
>>
>> The original idea was to also allow stage-1-only support. But I'm not
>> sure if stage-1-only usecase is useful or even valid for Xen.. I will
>> update the patch series with the missing parts for stage-1-only support,
>> pointed out by Luca, but the question remains if this is needed at all.
>> If not, I can revert to original state where stage-2 was always required.
> 
> By "stage-1 only" support, do you mean Xen would use the stage-1 in
> replacement of the stage-2? Or do you mean the guest will use the
> stage-1 page-table and there will be no isolation from Xen?
> 
> If the former, then I believe the page tables don't have the exact same
> format. Today, the page-tables are shared between the CPU and IOMMU, so
> this would need to be duplicated. For now, I am not sure this is worth
> to do.
> 
> If the latter, this would require the guest to be directly mapped (i.e.
> IPA == PA) but it would also open a big hole. So I would want to
> understand the exact use case first.
> 

The latter. In this case, the guest would configure stage-1 while 
stage-2 translation is not used, so there is no additional isolation 
enforced by Xen. This would only be intended for specific usecases with 
trusted domains. But yes, this opens a significant hole if used with 
untrusted guests. If there is no strong usecase, we could restrict the 
implementation to always require stage-2.

> Cheers,
> 

Best regards,
Milan


